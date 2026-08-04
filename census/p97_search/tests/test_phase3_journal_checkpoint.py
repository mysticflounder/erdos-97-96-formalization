from __future__ import annotations

import json
from pathlib import Path

import pytest

from census.p97_search import phase3_journal_checkpoint as checkpoint


def _records(count: int) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []
    previous: str | None = None
    for index in range(count):
        unsigned: dict[str, object] = {
            "index": index,
            "origin": "test",
            "stage": "test",
            "clause": [index + 1, -(index + 2)],
            "previous_record_sha256": previous,
        }
        record = {
            **unsigned,
            "record_sha256": checkpoint._sha256_value(unsigned),
        }
        records.append(record)
        previous = str(record["record_sha256"])
    return records


def _write_journal(path: Path, count: int = 5) -> bytes:
    raw = b"".join(
        checkpoint._canonical_bytes(record) + b"\n"
        for record in _records(count)
    )
    path.write_bytes(raw)
    return raw


def _identity(scan: checkpoint.SuffixScan) -> dict[str, object]:
    return {
        "total_record_count": scan.total_record_count,
        "total_byte_count": scan.total_byte_count,
        "terminal_record_sha256": scan.terminal_record_sha256,
        "file_sha256": scan.file_sha256,
        "clause_count": scan.clause_count,
        "clause_sha256": scan.clause_sha256,
    }


def test_suffix_scan_matches_full_authenticated_identity(tmp_path: Path) -> None:
    source = tmp_path / "learned.jsonl"
    checkpoint_path = tmp_path / "checkpoint.json"
    _write_journal(source)
    configuration = {"schema": "test", "encoding": {"n": 5}}

    prefix = checkpoint.build_checkpoint(
        source,
        checkpoint_path,
        record_count=2,
        configuration=configuration,
    )
    full = checkpoint.full_scan(source, configuration=configuration)
    suffix = checkpoint.scan_suffix(
        source,
        checkpoint_path,
        configuration=configuration,
    )

    assert checkpoint.load_checkpoint(
        checkpoint_path, configuration=configuration
    ) == prefix
    assert _identity(suffix) == _identity(full)
    assert suffix.prefix == prefix
    assert suffix.suffix_record_count == 3
    assert suffix.suffix_byte_count == full.total_byte_count - prefix.byte_count


def test_suffix_scan_rejects_prefix_mutation(tmp_path: Path) -> None:
    source = tmp_path / "learned.jsonl"
    checkpoint_path = tmp_path / "checkpoint.json"
    _write_journal(source)
    checkpoint.build_checkpoint(source, checkpoint_path, record_count=2)

    source.write_bytes(
        source.read_bytes().replace(b'"origin":"test"', b'"origin":"best"', 1)
    )
    with pytest.raises(checkpoint.CheckpointError, match="prefix mismatch"):
        checkpoint.scan_suffix(source, checkpoint_path)


def test_suffix_scan_rejects_suffix_record_tampering(tmp_path: Path) -> None:
    source = tmp_path / "learned.jsonl"
    checkpoint_path = tmp_path / "checkpoint.json"
    raw = _write_journal(source)
    checkpoint.build_checkpoint(source, checkpoint_path, record_count=2)
    lines = raw.splitlines(keepends=True)
    lines[3] = lines[3].replace(b'"stage":"test"', b'"stage":"rest"', 1)
    source.write_bytes(b"".join(lines))

    with pytest.raises(checkpoint.CheckpointError, match="record hash"):
        checkpoint.scan_suffix(source, checkpoint_path)


def test_checkpoint_rejects_configuration_tampering_and_torn_tail(
    tmp_path: Path,
) -> None:
    source = tmp_path / "learned.jsonl"
    checkpoint_path = tmp_path / "checkpoint.json"
    _write_journal(source)
    configuration = {"schema": "test"}
    checkpoint.build_checkpoint(
        source, checkpoint_path, record_count=2, configuration=configuration
    )

    with pytest.raises(checkpoint.CheckpointError, match="configuration"):
        checkpoint.scan_suffix(
            source, checkpoint_path, configuration={"schema": "changed"}
        )

    source.write_bytes(source.read_bytes() + b'{"index":5')
    with pytest.raises(checkpoint.CheckpointError, match="truncated"):
        checkpoint.scan_suffix(source, checkpoint_path, configuration=configuration)
    with pytest.raises(checkpoint.CheckpointError, match="truncated"):
        checkpoint.full_scan(source, configuration=configuration)


def test_checkpoint_envelope_tampering_is_rejected(tmp_path: Path) -> None:
    source = tmp_path / "learned.jsonl"
    checkpoint_path = tmp_path / "checkpoint.json"
    _write_journal(source)
    checkpoint.build_checkpoint(source, checkpoint_path, record_count=2)
    envelope = json.loads(checkpoint_path.read_bytes())
    envelope["payload"]["prefix"]["record_count"] = 3
    checkpoint_path.write_bytes(checkpoint._canonical_bytes(envelope) + b"\n")

    with pytest.raises(checkpoint.CheckpointError, match="hash mismatch"):
        checkpoint.load_checkpoint(checkpoint_path)
