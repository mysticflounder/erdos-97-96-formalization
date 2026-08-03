from __future__ import annotations

import json
from pathlib import Path

import pytest

from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)
from census.p97_search import phase3_cegar_runtime as runtime
from census.p97_search import phase3_loader_cache as cache


def _row(center: int, support: tuple[int, ...], exact: bool = False) -> tuple:
    return (center, support, exact)


def _record(index: int, clause: list[int], previous: str | None) -> dict:
    unsigned = {
        "index": index,
        "origin": "test",
        "stage": "test-stage",
        "clause": clause,
        "previous_record_sha256": previous,
    }
    unsigned["record_sha256"] = cache._sha256_value(unsigned)
    return unsigned


def _active_entries(bank: cache.IndexedNogoodBank) -> list[dict]:
    return [
        {
            "key": [
                [center, list(support), exact]
                for center, support, exact in key
            ],
            "certificate": dict(certificate),
        }
        for key, certificate in bank.active.items()
    ]


def test_indexed_bank_matches_legacy_antichain_contract() -> None:
    legacy = certificates._NogoodBank()
    indexed = cache.IndexedNogoodBank()
    row0 = _row(0, (1, 2))
    row1 = _row(1, (0, 2))
    row2 = _row(2, (0, 1))
    operations = (
        ((row0, row1), {"stage": "two"}),
        ((row0, row1, row2), {"stage": "three"}),
        ((row0,), {"stage": "one"}),
        ((row1, row2), {"stage": "two-b"}),
    )
    for key, certificate in operations:
        assert indexed.add(key, certificate) == legacy.add(key, certificate)
        assert indexed.active == legacy.active
        assert indexed.empty == legacy.empty
    for prefix in ((row0,), (row0, row1), (row1, row2), (row2,)):
        assert indexed.match(prefix) == legacy.match(prefix)


def test_cache_round_trip_and_index_replay(tmp_path: Path) -> None:
    source = tmp_path / "learned.jsonl"
    first = _record(0, [-1, 2], None)
    second = _record(1, [3, -4], first["record_sha256"])
    source.write_bytes(
        (json.dumps(first, sort_keys=True, separators=(",", ":")) + "\n").encode()
        + (json.dumps(second, sort_keys=True, separators=(",", ":")) + "\n").encode()
    )
    bank = cache.IndexedNogoodBank()
    key = ((_row(0, (1, 2))),)
    bank.add(key, {"stage": "test-stage"})
    cache_path = tmp_path / "compiled-loader-cache.json"
    configuration = {"schema": "test-config", "encoding": {"n": 10}}
    source_identity = cache.source_identity(source)
    cache.write_cache(
        cache_path,
        source=source_identity,
        configuration=configuration,
        loader_source_sha256="a" * 64,
        records=[first, second],
        clauses=[(-1, 2), (3, -4)],
        active_entries=_active_entries(bank),
        index=bank.index_snapshot(),
    )
    result = cache.try_load(
        cache_path,
        source_path=source,
        configuration=configuration,
        loader_source_sha256="a" * 64,
    )
    assert result.hit is True
    assert result.reason == "hit"
    assert result.payload is not None
    assert result.payload["clauses"] == [(-1, 2), (3, -4)]
    restored = cache.cached_bank(result.payload)
    assert restored.active == bank.active
    scan = runtime.JournalScan()
    assert result.source is not None
    cache.prime_journal_scan(scan, result.source, source)
    assert scan.byte_count == source.stat().st_size
    assert scan.sha256 == result.source.file_sha256


def test_cache_rejects_source_config_and_payload_changes(tmp_path: Path) -> None:
    source = tmp_path / "learned.jsonl"
    record = _record(0, [1], None)
    source.write_bytes(
        (json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n").encode()
    )
    bank = cache.IndexedNogoodBank()
    cache_path = tmp_path / "compiled-loader-cache.json"
    configuration = {"schema": "test-config"}
    cache.write_cache(
        cache_path,
        source=cache.source_identity(source),
        configuration=configuration,
        loader_source_sha256="b" * 64,
        records=[record],
        clauses=[(1,)],
        active_entries=[],
        index=bank.index_snapshot(),
    )
    assert cache.try_load(
        cache_path,
        source_path=source,
        configuration=configuration,
        loader_source_sha256="b" * 64,
    ).hit
    assert cache.try_load(
        cache_path,
        source_path=source,
        configuration={"schema": "changed"},
        loader_source_sha256="b" * 64,
    ).hit is False
    assert cache.try_load(
        cache_path,
        source_path=source,
        configuration=configuration,
        loader_source_sha256="c" * 64,
    ).hit is False
    mutated = dict(record)
    mutated["clause"] = [2]
    unsigned = dict(mutated)
    unsigned.pop("record_sha256")
    mutated["record_sha256"] = cache._sha256_value(unsigned)
    source.write_bytes(
        (json.dumps(mutated, sort_keys=True, separators=(",", ":")) + "\n").encode()
    )
    assert cache.try_load(
        cache_path,
        source_path=source,
        configuration=configuration,
        loader_source_sha256="b" * 64,
    ).hit is False

    raw = cache_path.read_bytes()
    cache_path.write_bytes(raw[:-2] + b"x\n")
    assert cache.try_load(
        cache_path,
        source_path=source,
        configuration=configuration,
        loader_source_sha256="b" * 64,
    ).hit is False


def test_source_scan_fails_closed_on_torn_tail(tmp_path: Path) -> None:
    source = tmp_path / "learned.jsonl"
    source.write_bytes(b'{"record_sha256":"x"}')
    with pytest.raises(cache.CacheError, match="truncated"):
        cache.source_identity(source)
