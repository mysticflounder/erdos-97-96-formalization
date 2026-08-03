from __future__ import annotations

import importlib
import json
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

rhombus = importlib.import_module("census.p97_search.phase3_three_rhombus")
bank = importlib.import_module("census.p97_search.phase3_three_rhombus_prefix_bank")


POSITIVES = frozenset(
    {
        (0, 2),
        (0, 5),
        (0, 7),
        (0, 8),
        (4, 2),
        (4, 6),
        (4, 7),
        (6, 4),
        (6, 5),
        (6, 8),
        (7, 0),
        (7, 4),
        (7, 5),
    }
)
EXTRA_POSITIVE = (1, 3)
SHIFTED_POSITIVES = frozenset(
    ((center + 1) % rhombus.N, (point + 1) % rhombus.N) for center, point in POSITIVES
)


@dataclass(frozen=True)
class SyntheticPrefix:
    journal: Path
    prefix_bytes: int
    prefix_records: int
    prefix_sha256: str
    records: tuple[dict[str, Any], ...]


@dataclass(frozen=True)
class BuiltBank:
    source: SyntheticPrefix
    output: Path
    manifest: dict[str, Any]


def _projected_semantic(
    positives: frozenset[tuple[int, int]],
) -> dict[str, bool]:
    semantic = {
        f"s[{center},{point}]": (center, point) in positives
        for center in range(rhombus.N)
        for point in range(rhombus.N)
        if center != point
    }
    semantic.update(
        {
            f"f[{point},{cap}]": False
            for point in range(3, rhombus.N)
            for cap in range(3)
        }
    )
    return semantic


def _learned_record(
    index: int,
    positives: frozenset[tuple[int, int]],
    previous: str | None,
) -> dict[str, Any]:
    semantic = _projected_semantic(positives)
    clause = [-1]
    return bank._record(
        {
            "schema": bank.LEARNED_SCHEMA,
            "index": index,
            "origin": "solver",
            "raw_sat_index": index,
            "assignment_sha256": bank.sha256_value(semantic),
            "stage": "synthetic-miss" if not positives else "synthetic-hit",
            "semantic_assignment": semantic,
            "certificate": {},
            "clause": clause,
            "clause_sha256": bank.sha256_value(clause),
            "superseded_nogood_sha256": [],
        },
        previous,
    )


def _write_synthetic_journal(
    tmp_path: Path,
    *,
    pinned_sources: tuple[frozenset[tuple[int, int]], ...] | None = None,
) -> SyntheticPrefix:
    tmp_path.mkdir(parents=True, exist_ok=True)
    pinned_sources = pinned_sources or (
        frozenset(),
        POSITIVES,
        POSITIVES | {EXTRA_POSITIVE},
    )
    sources = (*pinned_sources, frozenset())
    records: list[dict[str, Any]] = []
    previous: str | None = None
    for index, positives in enumerate(sources):
        record = _learned_record(index, positives, previous)
        records.append(record)
        previous = record["record_sha256"]

    pinned = records[: len(pinned_sources)]
    prefix_raw = b"".join(bank.canonical_bytes(record) + b"\n" for record in pinned)
    journal_raw = b"".join(bank.canonical_bytes(record) + b"\n" for record in records)
    journal = tmp_path / "learned.jsonl"
    journal.write_bytes(journal_raw)
    return SyntheticPrefix(
        journal=journal,
        prefix_bytes=len(prefix_raw),
        prefix_records=len(pinned),
        prefix_sha256=bank.sha256_bytes(prefix_raw),
        records=tuple(pinned),
    )


def _build(
    tmp_path: Path,
    *,
    minimize: bool = True,
    pinned_sources: tuple[frozenset[tuple[int, int]], ...] | None = None,
) -> BuiltBank:
    source = _write_synthetic_journal(tmp_path, pinned_sources=pinned_sources)
    output = tmp_path / "bank"
    manifest = bank.build_bank(
        source.journal,
        output,
        prefix_bytes=source.prefix_bytes,
        prefix_records=source.prefix_records,
        prefix_sha256=source.prefix_sha256,
        minimize=minimize,
    )
    return BuiltBank(source=source, output=output, manifest=manifest)


def _rewrite_manifest(output: Path, manifest: dict[str, Any]) -> None:
    bank._write_json(output / "manifest.json", manifest)
    sums = {name: bank.sha256_file(output / name) for name in bank.SUMMED_NAMES}
    (output / "SHA256SUMS").write_text(
        "".join(f"{digest}  {name}\n" for name, digest in sorted(sums.items()))
    )


def _refresh_artifact_hash(output: Path, name: str) -> None:
    manifest = bank.strict_json(output / "manifest.json")
    manifest["artifacts"][name] = bank.sha256_file(output / name)
    _rewrite_manifest(output, manifest)


def _rehash_chain(records: list[dict[str, Any]]) -> None:
    previous: str | None = None
    for index, record in enumerate(records):
        unsigned = {
            key: value
            for key, value in record.items()
            if key not in {"previous_record_sha256", "record_sha256"}
        }
        unsigned["index"] = index
        replacement = bank._record(unsigned, previous)
        record.clear()
        record.update(replacement)
        previous = replacement["record_sha256"]


def _rewrite_chained_artifact(
    output: Path,
    name: str,
    records: list[dict[str, Any]],
) -> None:
    _rehash_chain(records)
    bank._write_jsonl(output / name, records)
    _refresh_artifact_hash(output, name)


def _replay(
    output: Path,
    *,
    full_source_scan: bool,
    expected_root_sha256: str | None = None,
    expected_source_prefix_sha256: str | None = None,
) -> dict[str, Any]:
    manifest = bank.strict_json(output / "manifest.json")
    return bank.replay_bank(
        output,
        full_source_scan=full_source_scan,
        expected_root_sha256=(
            expected_root_sha256
            if expected_root_sha256 is not None
            else bank.sha256_file(output / "SHA256SUMS")
        ),
        expected_source_prefix_sha256=(
            expected_source_prefix_sha256
            if expected_source_prefix_sha256 is not None
            else manifest["source"]["prefix_sha256"]
        ),
    )


def test_pinned_prefix_bytes_count_and_sha_ignore_valid_suffix(
    tmp_path: Path,
) -> None:
    source = _write_synthetic_journal(tmp_path)

    records = bank.pinned_prefix_records(
        source.journal,
        prefix_bytes=source.prefix_bytes,
        prefix_records=source.prefix_records,
        prefix_sha256=source.prefix_sha256,
    )

    assert records == list(source.records)
    assert source.journal.stat().st_size > source.prefix_bytes
    bad_pins = (
        (
            {"prefix_bytes": source.prefix_bytes - 1},
            "byte boundary is not a complete JSONL record",
        ),
        ({"prefix_records": source.prefix_records - 1}, "record count mismatch"),
        ({"prefix_sha256": "0" * 64}, "source SHA-256 mismatch"),
    )
    for changes, message in bad_pins:
        arguments = {
            "prefix_bytes": source.prefix_bytes,
            "prefix_records": source.prefix_records,
            "prefix_sha256": source.prefix_sha256,
            **changes,
        }
        with pytest.raises(bank.PrefixBankError, match=message):
            bank.pinned_prefix_records(source.journal, **arguments)


@pytest.mark.parametrize(
    ("mutation", "message"),
    [
        ("missing-semantic", "fields mismatch"),
        ("null-dynamic-semantic", "dynamic semantic assignment must be an object"),
        ("coerced-stage", "stage must be a nonempty string"),
    ],
)
def test_pinned_prefix_rejects_malformed_frozen_v2_records(
    tmp_path: Path,
    mutation: str,
    message: str,
) -> None:
    record = _learned_record(0, POSITIVES, None)
    unsigned = {
        key: value
        for key, value in record.items()
        if key not in {"previous_record_sha256", "record_sha256"}
    }
    if mutation == "missing-semantic":
        del unsigned["semantic_assignment"]
    elif mutation == "null-dynamic-semantic":
        unsigned["semantic_assignment"] = None
    else:
        unsigned["stage"] = 7
    malformed = bank._record(unsigned, None)
    raw = bank.canonical_bytes(malformed) + b"\n"
    journal = tmp_path / "malformed.jsonl"
    journal.write_bytes(raw)

    with pytest.raises(bank.PrefixBankError, match=message):
        bank.pinned_prefix_records(
            journal,
            prefix_bytes=len(raw),
            prefix_records=1,
            prefix_sha256=bank.sha256_bytes(raw),
        )


def test_pinned_prefix_accepts_bootstrap_null_assignment_contract(
    tmp_path: Path,
) -> None:
    clause = [-1]
    record = bank._record(
        {
            "schema": bank.LEARNED_SCHEMA,
            "index": 0,
            "origin": "bootstrap-structural-path-memberships",
            "raw_sat_index": None,
            "assignment_sha256": None,
            "semantic_assignment": None,
            "stage": "equality-duplicate-center",
            "certificate": {},
            "clause": clause,
            "clause_sha256": bank.sha256_value(clause),
            "superseded_nogood_sha256": [],
        },
        None,
    )
    raw = bank.canonical_bytes(record) + b"\n"
    journal = tmp_path / "bootstrap.jsonl"
    journal.write_bytes(raw)

    assert bank.pinned_prefix_records(
        journal,
        prefix_bytes=len(raw),
        prefix_records=1,
        prefix_sha256=bank.sha256_bytes(raw),
    ) == [record]


def test_build_and_full_replay_minimize_and_collapse_duplicate_hits(
    tmp_path: Path,
) -> None:
    built = _build(tmp_path)

    assert built.manifest["source"] == {
        "journal": str(built.source.journal.resolve()),
        "prefix_bytes": built.source.prefix_bytes,
        "prefix_records": built.source.prefix_records,
        "prefix_sha256": built.source.prefix_sha256,
        "head_record_sha256": built.source.records[-1]["record_sha256"],
    }
    assert built.manifest["counts"] == {
        "source_records": 3,
        "semantic_assignments": 3,
        "hit_assignments": 2,
        "miss_assignments": 1,
        "unique_generated_clauses": 1,
        "kept_antichain_clauses": 1,
    }
    assert built.manifest["hit_stage_counts"] == {"synthetic-hit": 2}

    entries = bank.strict_json_lines(built.output / "certificates.jsonl")
    coverage = bank.strict_json_lines(built.output / "coverage.jsonl")
    assert len(entries) == 1
    assert entries[0]["positive_memberships"] == [
        list(pair) for pair in sorted(POSITIVES)
    ]
    assert entries[0]["covered_unique_clause_count"] == 1
    assert entries[0]["covered_source_record_count"] == 2
    assert [item["source_record_index"] for item in coverage] == [1, 2]
    assert len({item["kept_clause_sha256"] for item in coverage}) == 1

    assert _replay(built.output, full_source_scan=True) == {
        "ok": True,
        "bank_root_sha256": built.manifest["bank_root_sha256"],
        "full_source_scan": True,
        "coverage_claims_verified": True,
        "coverage_complete_verified": True,
        "source_records": 3,
        "hit_assignments": 2,
        "kept_antichain_clauses": 1,
        "terminal_claim": False,
    }


@pytest.mark.parametrize("minimize", [True, False])
def test_full_replay_accepts_canonical_empty_bank(
    tmp_path: Path,
    minimize: bool,
) -> None:
    built = _build(
        tmp_path,
        minimize=minimize,
        pinned_sources=(frozenset(),),
    )

    assert bank.strict_json_lines(built.output / "certificates.jsonl") == []
    assert bank.strict_json_lines(built.output / "coverage.jsonl") == []
    assert built.manifest["counts"] == {
        "source_records": 1,
        "semantic_assignments": 1,
        "hit_assignments": 0,
        "miss_assignments": 1,
        "unique_generated_clauses": 0,
        "kept_antichain_clauses": 0,
    }
    assert (
        _replay(built.output, full_source_scan=True)["coverage_complete_verified"]
        is True
    )


def test_minimization_and_antichain_are_deterministic() -> None:
    extended = POSITIVES | {EXTRA_POSITIVE}
    first = bank.minimize_positive_source(extended, minimize=True)
    second = bank.minimize_positive_source(
        sorted(extended, reverse=True), minimize=True
    )

    assert first is not None
    assert second is not None
    assert first[0] == second[0] == POSITIVES
    assert bank.canonical_bytes(first[1]) == bank.canonical_bytes(second[1])
    assert first[2] == second[2]
    assert all(
        rhombus.detect_three_rhombus(POSITIVES - {membership}) is None
        for membership in POSITIVES
    )

    clauses = [(-1, -2, -3), (-4,), (-1, -2), (-1, -2)]
    kept, cover = bank.clause_antichain(clauses)
    reverse_kept, reverse_cover = bank.clause_antichain(reversed(clauses))
    assert kept == reverse_kept == ((-4,), (-1, -2))
    assert cover == reverse_cover
    assert cover[(-1, -2, -3)] == (-1, -2)


def test_replay_rejects_artifact_content_and_manifest_hash_tampering(
    tmp_path: Path,
) -> None:
    built = _build(tmp_path)
    certificates = built.output / "certificates.jsonl"
    certificates.write_bytes(certificates.read_bytes() + b" ")

    with pytest.raises(bank.PrefixBankError, match="SHA256SUMS mismatch"):
        _replay(built.output, full_source_scan=False)

    built = _build(tmp_path / "hash")
    manifest = bank.strict_json(built.output / "manifest.json")
    manifest["artifacts"]["coverage.jsonl"] = "0" * 64
    _rewrite_manifest(built.output, manifest)

    with pytest.raises(bank.PrefixBankError, match="artifact SHA-256 mismatch"):
        _replay(built.output, full_source_scan=False)


def test_replay_rejects_rehashed_artifact_with_broken_chain(tmp_path: Path) -> None:
    built = _build(tmp_path)
    coverage_path = built.output / "coverage.jsonl"
    coverage = bank.strict_json_lines(coverage_path)
    coverage[0]["previous_record_sha256"] = "0" * 64
    bank._write_jsonl(coverage_path, coverage)
    _refresh_artifact_hash(built.output, "coverage.jsonl")

    with pytest.raises(bank.PrefixBankError, match="identity/hash replay"):
        _replay(built.output, full_source_scan=False)


def test_replay_rejects_source_prefix_tampering(tmp_path: Path) -> None:
    built = _build(tmp_path)
    raw = bytearray(built.source.journal.read_bytes())
    raw[0] = ord("[")
    built.source.journal.write_bytes(raw)

    with pytest.raises(bank.PrefixBankError, match="source SHA-256 mismatch"):
        _replay(built.output, full_source_scan=True)


def test_replay_rejects_coverage_source_index_outside_prefix(
    tmp_path: Path,
) -> None:
    built = _build(tmp_path)
    coverage_path = built.output / "coverage.jsonl"
    coverage = bank.strict_json_lines(coverage_path)
    coverage[0]["source_record_index"] = built.source.prefix_records
    _rehash_chain(coverage)
    bank._write_jsonl(coverage_path, coverage)
    _refresh_artifact_hash(built.output, "coverage.jsonl")

    with pytest.raises(bank.PrefixBankError, match="outside pinned prefix"):
        _replay(built.output, full_source_scan=False)


def test_replay_rejects_manifest_count_tampering(tmp_path: Path) -> None:
    built = _build(tmp_path)
    manifest_path = built.output / "manifest.json"
    manifest = json.loads(manifest_path.read_bytes())
    manifest["counts"]["hit_assignments"] += 1
    _rewrite_manifest(built.output, manifest)

    with pytest.raises(bank.PrefixBankError, match="manifest hit count mismatch"):
        _replay(built.output, full_source_scan=False)


def test_replay_rejects_self_consistent_rewrite_against_externally_pinned_root(
    tmp_path: Path,
) -> None:
    built = _build(tmp_path)
    pinned_root = bank.sha256_file(built.output / "SHA256SUMS")
    manifest = bank.strict_json(built.output / "manifest.json")
    manifest["certificate_semantics"] += " Tampered but internally rehashed."
    _rewrite_manifest(built.output, manifest)

    assert bank.sha256_file(built.output / "SHA256SUMS") != pinned_root
    with pytest.raises(bank.PrefixBankError, match="bank-root SHA-256 mismatch"):
        _replay(
            built.output,
            full_source_scan=False,
            expected_root_sha256=pinned_root,
        )


def test_replay_requires_independently_pinned_source_prefix_sha(
    tmp_path: Path,
) -> None:
    built = _build(tmp_path)

    with pytest.raises(
        bank.PrefixBankError,
        match="externally pinned source-prefix SHA-256 mismatch",
    ):
        _replay(
            built.output,
            full_source_scan=True,
            expected_source_prefix_sha256="0" * 64,
        )


def test_replay_hashes_and_parses_each_bank_artifact_from_one_read(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    built = _build(tmp_path)
    watched = {
        (built.output / name).resolve() for name in (*bank.SUMMED_NAMES, "SHA256SUMS")
    }
    reads: dict[Path, int] = {}
    original_read_bytes = Path.read_bytes

    def counted_read_bytes(path: Path) -> bytes:
        resolved = path.resolve()
        if resolved in watched:
            reads[resolved] = reads.get(resolved, 0) + 1
            if reads[resolved] > 1:
                raise AssertionError(f"bank artifact reread: {resolved.name}")
        return original_read_bytes(path)

    monkeypatch.setattr(Path, "read_bytes", counted_read_bytes)
    result = bank.replay_bank(
        built.output,
        full_source_scan=True,
        expected_root_sha256=built.manifest["bank_root_sha256"],
        expected_source_prefix_sha256=built.source.prefix_sha256,
    )

    assert result["ok"] is True
    assert reads == {path: 1 for path in watched}


@pytest.mark.parametrize("field_change", ["extra", "missing"])
def test_replay_requires_exact_manifest_fields(
    tmp_path: Path,
    field_change: str,
) -> None:
    built = _build(tmp_path)
    manifest = bank.strict_json(built.output / "manifest.json")
    if field_change == "extra":
        manifest["unexpected"] = None
    else:
        del manifest["certificate_semantics"]
    _rewrite_manifest(built.output, manifest)

    with pytest.raises(bank.PrefixBankError, match="bank manifest fields mismatch"):
        _replay(built.output, full_source_scan=False)


@pytest.mark.parametrize("artifact", ["certificates.jsonl", "coverage.jsonl"])
@pytest.mark.parametrize("field_change", ["extra", "missing"])
def test_replay_requires_exact_chained_artifact_fields(
    tmp_path: Path,
    artifact: str,
    field_change: str,
) -> None:
    built = _build(tmp_path)
    records = bank.strict_json_lines(built.output / artifact)
    if field_change == "extra":
        records[0]["unexpected"] = None
    else:
        field = (
            "terminal_claim"
            if artifact == "certificates.jsonl"
            else "generated_clause_sha256"
        )
        del records[0][field]
    _rewrite_chained_artifact(built.output, artifact, records)

    record_kind = "certificate" if artifact.startswith("certificate") else "coverage"
    with pytest.raises(
        bank.PrefixBankError,
        match=rf"{record_kind} record 0 fields mismatch",
    ):
        _replay(built.output, full_source_scan=False)


@pytest.mark.parametrize("artifact", ["certificates.jsonl", "coverage.jsonl"])
@pytest.mark.parametrize(
    ("source_index", "message"),
    [
        (True, "must be a nonnegative integer"),
        ("1", "must be a nonnegative integer"),
        (-1, "must be a nonnegative integer"),
        (3, "outside pinned prefix"),
    ],
)
def test_replay_rejects_invalid_source_index_types_and_ranges(
    tmp_path: Path,
    artifact: str,
    source_index: object,
    message: str,
) -> None:
    built = _build(tmp_path)
    records = bank.strict_json_lines(built.output / artifact)
    records[0]["source_record_index"] = source_index
    _rewrite_chained_artifact(built.output, artifact, records)

    with pytest.raises(bank.PrefixBankError, match=message):
        _replay(built.output, full_source_scan=False)


def test_replay_rejects_rehashed_claimed_generated_clause_sha(
    tmp_path: Path,
) -> None:
    built = _build(tmp_path)
    coverage = bank.strict_json_lines(built.output / "coverage.jsonl")
    coverage[0]["generated_clause_sha256"] = "0" * 64
    _rewrite_chained_artifact(built.output, "coverage.jsonl", coverage)

    with pytest.raises(
        bank.PrefixBankError,
        match="coverage generated clause replay mismatch",
    ):
        _replay(built.output, full_source_scan=False)


def test_replay_rejects_unknown_minimization_mode(tmp_path: Path) -> None:
    built = _build(tmp_path)
    manifest = bank.strict_json(built.output / "manifest.json")
    manifest["producer"]["minimization"] = "mystery-mode"
    _rewrite_manifest(built.output, manifest)

    with pytest.raises(bank.PrefixBankError, match="minimization mode is unknown"):
        _replay(built.output, full_source_scan=False)


def test_replay_rejects_self_consistent_literal_namespace_mismatch(
    tmp_path: Path,
) -> None:
    built = _build(tmp_path)
    manifest = bank.strict_json(built.output / "manifest.json")
    descriptor = dict(manifest["literal_namespace"]["descriptor"])
    descriptor["variable_count"] += 1
    manifest["literal_namespace"] = {
        "descriptor": descriptor,
        "descriptor_sha256": bank.sha256_value(descriptor),
    }
    _rewrite_manifest(built.output, manifest)

    with pytest.raises(
        bank.PrefixBankError, match="literal namespace descriptor mismatch"
    ):
        _replay(built.output, full_source_scan=False)


def test_source_journal_override_makes_bank_portable(tmp_path: Path) -> None:
    built = _build(tmp_path)
    root = bank.sha256_file(built.output / "SHA256SUMS")
    override = tmp_path / "relocated" / "learned.jsonl"
    override.parent.mkdir()
    override.write_bytes(built.source.journal.read_bytes())
    built.source.journal.unlink()

    with pytest.raises(bank.PrefixBankError, match="missing source journal"):
        bank.replay_bank(
            built.output,
            full_source_scan=True,
            expected_root_sha256=root,
            expected_source_prefix_sha256=built.source.prefix_sha256,
        )
    result = bank.replay_bank(
        built.output,
        full_source_scan=True,
        expected_root_sha256=root,
        expected_source_prefix_sha256=built.source.prefix_sha256,
        source_journal=override,
    )
    assert result["ok"] is True
    assert result["coverage_complete_verified"] is True


def test_full_replay_rejects_sound_orphan_in_no_minimize_bank(
    tmp_path: Path,
) -> None:
    combined = POSITIVES | SHIFTED_POSITIVES
    built = _build(
        tmp_path,
        minimize=False,
        pinned_sources=(combined,),
    )
    entries = bank.strict_json_lines(built.output / "certificates.jsonl")
    assert len(entries) == 1
    existing_clause = tuple(entries[0]["clause"])
    candidates = [
        bank.minimize_positive_source(source, minimize=False)
        for source in (POSITIVES, SHIFTED_POSITIVES)
    ]
    orphan_result = next(
        result
        for result in candidates
        if result is not None and result[2] != existing_clause
    )
    source, certificate, clause = orphan_result
    assert len(bank.clause_antichain([existing_clause, clause])[0]) == 2
    source_record = built.source.records[0]
    entries.append(
        bank._record(
            {
                "schema": bank.ENTRY_SCHEMA,
                "index": 1,
                "source_record_index": 0,
                "source_record_sha256": source_record["record_sha256"],
                "semantic_assignment_sha256": bank.sha256_value(
                    source_record["semantic_assignment"]
                ),
                "positive_memberships": [list(pair) for pair in sorted(source)],
                "certificate": certificate,
                "clause": list(clause),
                "clause_sha256": bank.sha256_value(list(clause)),
                "covered_unique_clause_count": 0,
                "covered_source_record_count": 0,
                "terminal_claim": False,
            },
            entries[-1]["record_sha256"],
        )
    )
    _rewrite_chained_artifact(built.output, "certificates.jsonl", entries)
    manifest = bank.strict_json(built.output / "manifest.json")
    manifest["counts"]["kept_antichain_clauses"] = 2
    manifest["kept_literal_histogram"] = bank._literal_histogram(
        [existing_clause, clause]
    )
    _rewrite_manifest(built.output, manifest)

    assert _replay(built.output, full_source_scan=False)["ok"] is True
    with pytest.raises(
        bank.PrefixBankError,
        match="canonical full-scan antichain",
    ):
        _replay(built.output, full_source_scan=True)


@pytest.mark.parametrize(
    ("artifact", "message"),
    [
        ("certificates.jsonl", "canonical full-scan antichain"),
        ("coverage.jsonl", "coverage order differs"),
    ],
)
def test_full_replay_rejects_noncanonical_bank_order(
    tmp_path: Path,
    artifact: str,
    message: str,
) -> None:
    built = _build(
        tmp_path,
        minimize=False,
        pinned_sources=(POSITIVES, SHIFTED_POSITIVES),
    )
    records = bank.strict_json_lines(built.output / artifact)
    assert len(records) == 2
    records.reverse()
    _rewrite_chained_artifact(built.output, artifact, records)

    assert _replay(built.output, full_source_scan=False)["ok"] is True
    with pytest.raises(bank.PrefixBankError, match=message):
        _replay(built.output, full_source_scan=True)


def test_clause_antichain_empty_clause_subsumes_everything() -> None:
    clauses = [(-1,), (), (-1, -2), ()]
    kept, cover = bank.clause_antichain(clauses)

    assert kept == ((),)
    assert cover == {(): (), (-1,): (), (-1, -2): ()}
