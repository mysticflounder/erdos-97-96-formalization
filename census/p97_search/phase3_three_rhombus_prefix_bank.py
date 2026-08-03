#!/usr/bin/env python3
"""Build and replay an authenticated Phase-3 three-rhombus clause bank.

The source journal is consumed only through an explicitly pinned byte prefix.
Every learned clause is regenerated from a self-contained, inclusion-minimal
set of positive ``s[p,q]`` memberships and replayed by
``phase3_three_rhombus``.  The output is a reusable partial clause bank, never
a terminal Phase-3 certificate by itself.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import tempfile
from collections import Counter, defaultdict
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path
from typing import Any

from census.p97_search import phase3_three_rhombus as rhombus

BANK_SCHEMA = "p97-phase3-three-rhombus-prefix-bank-v1"
ENTRY_SCHEMA = "p97-phase3-three-rhombus-prefix-entry-v1"
COVERAGE_SCHEMA = "p97-phase3-three-rhombus-prefix-coverage-v1"
LEARNED_SCHEMA = "p97-phase3-structural-cegar-learned-projected-static-v2"
ARTIFACT_NAMES = ("certificates.jsonl", "coverage.jsonl")
SUMMED_NAMES = (*ARTIFACT_NAMES, "manifest.json")
MINIMIZATION_MODES = frozenset(
    {"deterministic-greedy-inclusion-minimal", "canonical-path-union"}
)
CERTIFICATE_SEMANTICS = (
    "Each clause is the negation of positive Phase-3 row memberships "
    "whose equality closure realizes the Lean-banked seven-point "
    "three-rhombus collision."
)
MANIFEST_FIELDS = frozenset(
    {
        "schema",
        "source",
        "producer",
        "literal_namespace",
        "counts",
        "hit_stage_counts",
        "generated_literal_histogram",
        "kept_literal_histogram",
        "artifacts",
        "certificate_semantics",
        "terminal_claim",
    }
)
SOURCE_FIELDS = frozenset(
    {
        "journal",
        "prefix_bytes",
        "prefix_records",
        "prefix_sha256",
        "head_record_sha256",
    }
)
PRODUCER_FIELDS = frozenset(
    {
        "script",
        "script_sha256",
        "detector_module",
        "detector_module_sha256",
        "minimization",
    }
)
COUNT_FIELDS = frozenset(
    {
        "source_records",
        "semantic_assignments",
        "hit_assignments",
        "miss_assignments",
        "unique_generated_clauses",
        "kept_antichain_clauses",
    }
)
ENTRY_FIELDS = frozenset(
    {
        "schema",
        "index",
        "source_record_index",
        "source_record_sha256",
        "semantic_assignment_sha256",
        "positive_memberships",
        "certificate",
        "clause",
        "clause_sha256",
        "covered_unique_clause_count",
        "covered_source_record_count",
        "terminal_claim",
        "previous_record_sha256",
        "record_sha256",
    }
)
COVERAGE_FIELDS = frozenset(
    {
        "schema",
        "index",
        "source_record_index",
        "source_record_sha256",
        "generated_clause_sha256",
        "kept_clause_sha256",
        "previous_record_sha256",
        "record_sha256",
    }
)
LITERAL_NAMESPACE_FIELDS = frozenset({"descriptor", "descriptor_sha256"})
LEARNED_RECORD_FIELDS = frozenset(
    {
        "schema",
        "index",
        "origin",
        "raw_sat_index",
        "assignment_sha256",
        "semantic_assignment",
        "stage",
        "certificate",
        "clause",
        "clause_sha256",
        "superseded_nogood_sha256",
        "previous_record_sha256",
        "record_sha256",
    }
)
BOOTSTRAP_ORIGINS = frozenset(
    {
        "bootstrap-structural-prefix",
        "bootstrap-structural-path-memberships",
        "bootstrap-cap-order-convex-five-point",
        "bootstrap-cap-order-convex-rhombus",
        "bootstrap-cap-order-selected-row-kalmanson",
        "bootstrap-shared-pair-cyclic-separation",
    }
)


class PrefixBankError(ValueError):
    """Raised when source or bank authentication fails closed."""


def _require_fields(
    value: Mapping[str, Any], expected: frozenset[str], where: str
) -> None:
    actual = set(value)
    if actual != expected:
        raise PrefixBankError(
            f"{where} fields mismatch: "
            f"missing={sorted(expected - actual)}, extra={sorted(actual - expected)}"
        )


def _require_int(value: Any, where: str, *, nonnegative: bool = True) -> int:
    if type(value) is not int or (nonnegative and value < 0):
        qualifier = "nonnegative " if nonnegative else ""
        raise PrefixBankError(f"{where} must be a {qualifier}integer")
    return value


def _require_digest(value: Any, where: str) -> str:
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise PrefixBankError(f"{where} must be a lowercase SHA-256 digest")
    return value


def _require_nonempty_string(value: Any, where: str) -> str:
    if type(value) is not str or not value:
        raise PrefixBankError(f"{where} must be a nonempty string")
    return value


def _require_str_int_map(value: Any, where: str) -> dict[str, int]:
    if not isinstance(value, Mapping) or any(
        not isinstance(key, str) or type(item) is not int or item < 0
        for key, item in value.items()
    ):
        raise PrefixBankError(f"{where} must map strings to nonnegative integers")
    return dict(value)


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        allow_nan=False,
    ).encode("utf-8")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_value(value: Any) -> str:
    return sha256_bytes(canonical_bytes(value))


def _literal_namespace_mapping() -> list[list[int]]:
    """Materialize the complete off-diagonal ``s`` literal namespace."""

    return [
        [center, point, rhombus.dense_membership_var(center, point)]
        for center in range(rhombus.N)
        for point in range(rhombus.N)
        if center != point
    ]


LITERAL_NAMESPACE = {
    "schema": "p97-phase3-row-major-s-dimacs-v1",
    "n": rhombus.N,
    "variable_count": rhombus.N * (rhombus.N - 1),
    "formula": "1 + (n-1)*center + (point if point<center else point-1)",
    "mapping_sha256": sha256_value(_literal_namespace_mapping()),
}
LITERAL_NAMESPACE_SHA256 = sha256_value(LITERAL_NAMESPACE)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _object_without_duplicate_keys(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def strict_json_bytes(raw: bytes, where: str) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=_object_without_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PrefixBankError(f"{where}: invalid JSON: {exc}") from exc
    if not isinstance(value, dict):
        raise PrefixBankError(f"{where}: expected a JSON object")
    return value


def strict_json(path: Path) -> dict[str, Any]:
    if not path.is_file():
        raise PrefixBankError(f"missing artifact {path}")
    return strict_json_bytes(path.read_bytes(), str(path))


def strict_json_lines(path: Path) -> list[dict[str, Any]]:
    if not path.is_file():
        raise PrefixBankError(f"missing artifact {path}")
    return strict_json_lines_bytes(path.read_bytes(), str(path))


def strict_json_lines_bytes(raw: bytes, where: str) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    for line_number, line in enumerate(raw.splitlines(), start=1):
        if not line.strip():
            raise PrefixBankError(f"{where}:{line_number}: blank JSONL line")
        result.append(strict_json_bytes(line, f"{where}:{line_number}"))
    return result


def _validate_learned_record(record: Mapping[str, Any], index: int, where: str) -> None:
    _require_fields(record, LEARNED_RECORD_FIELDS, where)
    if (
        record.get("schema") != LEARNED_SCHEMA
        or _require_int(record.get("index"), f"{where}: record index") != index
    ):
        raise PrefixBankError(f"{where}: learned-record identity mismatch")
    origin = _require_nonempty_string(record.get("origin"), f"{where}: origin")
    _require_nonempty_string(record.get("stage"), f"{where}: stage")
    previous = record.get("previous_record_sha256")
    if index == 0:
        if previous is not None:
            raise PrefixBankError(f"{where}: first previous record SHA must be null")
    else:
        _require_digest(previous, f"{where}: previous record SHA")
    certificate = record.get("certificate")
    if not isinstance(certificate, Mapping):
        raise PrefixBankError(f"{where}: certificate must be an object")
    clause = record.get("clause")
    if not isinstance(clause, list) or any(
        type(literal) is not int or literal == 0 for literal in clause
    ):
        raise PrefixBankError(f"{where}: clause must be a list of nonzero integers")
    if _require_digest(record.get("clause_sha256"), f"{where}: clause SHA") != (
        sha256_value(clause)
    ):
        raise PrefixBankError(f"{where}: clause SHA mismatch")
    superseded = record.get("superseded_nogood_sha256")
    if not isinstance(superseded, list):
        raise PrefixBankError(f"{where}: superseded hashes must be a list")
    for position, digest in enumerate(superseded):
        _require_digest(digest, f"{where}: superseded hash {position}")

    semantic = record.get("semantic_assignment")
    raw_sat_index = record.get("raw_sat_index")
    assignment_sha256 = record.get("assignment_sha256")
    is_bootstrap = origin in BOOTSTRAP_ORIGINS
    if is_bootstrap:
        if (
            raw_sat_index is not None
            or assignment_sha256 is not None
            or semantic is not None
        ):
            raise PrefixBankError(f"{where}: bootstrap assignment fields must be null")
    else:
        _require_int(raw_sat_index, f"{where}: raw SAT index")
        _require_digest(assignment_sha256, f"{where}: assignment SHA")
        if not isinstance(semantic, Mapping):
            raise PrefixBankError(
                f"{where}: dynamic semantic assignment must be an object"
            )
        try:
            rhombus.parse_semantic_assignment(semantic)
        except (KeyError, TypeError, ValueError, rhombus.CertificateError) as exc:
            raise PrefixBankError(
                f"{where}: invalid semantic assignment: {exc}"
            ) from exc


def pinned_prefix_records(
    journal: Path,
    *,
    prefix_bytes: int,
    prefix_records: int,
    prefix_sha256: str,
) -> list[dict[str, Any]]:
    prefix_bytes = _require_int(prefix_bytes, "prefix_bytes")
    prefix_records = _require_int(prefix_records, "prefix_records")
    prefix_sha256 = _require_digest(prefix_sha256, "prefix_sha256")
    if prefix_bytes == 0 or prefix_records == 0:
        raise PrefixBankError("pinned prefix dimensions must be positive")
    if not journal.is_file():
        raise PrefixBankError(f"missing source journal {journal}")
    with journal.open("rb") as handle:
        raw = handle.read(prefix_bytes)
    if len(raw) != prefix_bytes:
        raise PrefixBankError("source journal is shorter than the pinned prefix")
    if not raw.endswith(b"\n"):
        raise PrefixBankError("pinned byte boundary is not a complete JSONL record")
    actual_sha256 = sha256_bytes(raw)
    if actual_sha256 != prefix_sha256:
        raise PrefixBankError(
            "pinned source SHA-256 mismatch: "
            f"expected={prefix_sha256}, actual={actual_sha256}"
        )
    lines = raw.splitlines()
    if len(lines) != prefix_records:
        raise PrefixBankError(
            "pinned source record count mismatch: "
            f"expected={prefix_records}, actual={len(lines)}"
        )
    records = [
        strict_json_bytes(line, f"{journal}:prefix-record-{index}")
        for index, line in enumerate(lines)
    ]
    previous: str | None = None
    for index, record in enumerate(records):
        where = f"{journal}:prefix-record-{index}"
        _validate_learned_record(record, index, where)
        payload = dict(record)
        claimed = payload.pop("record_sha256", None)
        if payload.get("previous_record_sha256") != previous:
            raise PrefixBankError(f"{where}: broken record hash chain")
        if _require_digest(claimed, f"{where}: record hash") != sha256_value(payload):
            raise PrefixBankError(f"{where}: invalid record hash")
        previous = claimed
    return records


def _record(unsigned: Mapping[str, Any], previous: str | None) -> dict[str, Any]:
    payload = {**unsigned, "previous_record_sha256": previous}
    return {**payload, "record_sha256": sha256_value(payload)}


def _memberships(cert: Mapping[str, Any]) -> frozenset[tuple[int, int]]:
    raw = cert.get("used_positive_memberships")
    if not isinstance(raw, list):
        raise PrefixBankError("three-rhombus certificate lacks used memberships")
    try:
        result = rhombus.extract_positive_memberships(raw)
    except (TypeError, ValueError) as exc:
        raise PrefixBankError(f"invalid certificate memberships: {exc}") from exc
    if len(result) != len(raw):
        raise PrefixBankError("three-rhombus certificate repeats a membership")
    return result


def minimize_positive_source(
    positives: Iterable[tuple[int, int]],
    *,
    minimize: bool,
) -> tuple[frozenset[tuple[int, int]], dict[str, Any], tuple[int, ...]] | None:
    """Return a deterministic self-contained certificate source and clause.

    With ``minimize=True``, memberships are greedily removed in ascending
    order until no single further deletion retains any three-rhombus witness.
    This proves inclusion minimality, not minimum cardinality.
    """

    current = frozenset(positives)
    certificate = rhombus.detect_three_rhombus(current)
    if certificate is None:
        return None
    if minimize:
        changed = True
        while changed:
            changed = False
            for membership in sorted(current):
                candidate_source = current - {membership}
                candidate = rhombus.detect_three_rhombus(candidate_source)
                if candidate is not None:
                    current = candidate_source
                    certificate = candidate
                    changed = True
    # Regeneration on the final source makes the bank independent of omitted
    # assignment facts and pins the canonical witness/path choice.
    while True:
        certificate = rhombus.generate_closure(current)
        used = _memberships(certificate)
        if not used <= current:
            raise PrefixBankError("certificate introduced a non-source membership")
        if used == current:
            break
        # Canonical replay may expose source memberships that are irrelevant to
        # its own paths.  Shrink to the path union until a fixed point.
        current = used
    clause = tuple(rhombus.replay_closure(certificate, current))
    if len(clause) != len(set(clause)) or any(literal >= 0 for literal in clause):
        raise PrefixBankError("replayed clause is not a set of negative literals")
    return current, certificate, clause


def clause_antichain(
    clauses: Iterable[tuple[int, ...]],
) -> tuple[tuple[tuple[int, ...], ...], dict[tuple[int, ...], tuple[int, ...]]]:
    unique = set(clauses)
    if () in unique:
        return ((),), {clause: () for clause in unique}
    kept: list[tuple[int, ...]] = []
    by_literal: dict[int, list[tuple[int, ...]]] = defaultdict(list)
    clause_sets: dict[tuple[int, ...], frozenset[int]] = {}
    cover: dict[tuple[int, ...], tuple[int, ...]] = {}
    for clause in sorted(unique, key=lambda item: (len(item), item)):
        clause_set = frozenset(clause)
        candidates = {
            prior
            for literal in clause
            for prior in by_literal.get(literal, ())
            if clause_sets[prior] <= clause_set
        }
        if candidates:
            cover[clause] = min(candidates, key=lambda item: (len(item), item))
        else:
            kept.append(clause)
            clause_sets[clause] = clause_set
            for literal in clause:
                by_literal[literal].append(clause)
            cover[clause] = clause
    return tuple(kept), cover


def _write_json(path: Path, value: Any) -> None:
    path.write_bytes(json.dumps(value, indent=2, sort_keys=True).encode() + b"\n")


def _write_jsonl(path: Path, values: Iterable[Mapping[str, Any]]) -> None:
    with path.open("wb") as handle:
        for value in values:
            handle.write(canonical_bytes(value) + b"\n")


def _literal_histogram(clauses: Iterable[tuple[int, ...]]) -> dict[str, int]:
    return {
        str(length): count
        for length, count in sorted(Counter(map(len, clauses)).items())
    }


def build_bank(
    journal: Path,
    output: Path,
    *,
    prefix_bytes: int,
    prefix_records: int,
    prefix_sha256: str,
    minimize: bool,
) -> dict[str, Any]:
    if output.exists():
        raise PrefixBankError(f"refusing to overwrite existing output {output}")
    records = pinned_prefix_records(
        journal,
        prefix_bytes=prefix_bytes,
        prefix_records=prefix_records,
        prefix_sha256=prefix_sha256,
    )
    semantic_count = 0
    stage_counts: Counter[str] = Counter()
    first_by_clause: dict[
        tuple[int, ...], tuple[int, dict[str, Any], frozenset[tuple[int, int]]]
    ] = {}
    hits: list[tuple[int, tuple[int, ...]]] = []
    detector_cache: dict[
        frozenset[tuple[int, int]],
        tuple[frozenset[tuple[int, int]], dict[str, Any], tuple[int, ...]] | None,
    ] = {}
    for index, record in enumerate(records):
        semantic = record["semantic_assignment"]
        if semantic is None:
            continue
        if not isinstance(semantic, Mapping):
            raise PrefixBankError(
                f"source record {index} has invalid semantic assignment"
            )
        semantic_count += 1
        positives = rhombus.parse_semantic_assignment(semantic)
        if positives not in detector_cache:
            detector_cache[positives] = minimize_positive_source(
                positives, minimize=minimize
            )
        result = detector_cache[positives]
        if result is None:
            continue
        source, certificate, clause = result
        hits.append((index, clause))
        stage_counts[record["stage"]] += 1
        first_by_clause.setdefault(clause, (index, certificate, source))

    kept, cover = clause_antichain(first_by_clause)
    source_fan_in = Counter(cover[clause] for _, clause in hits)
    unique_fan_in = Counter(cover.values())

    output.parent.mkdir(parents=True, exist_ok=True)
    temporary = Path(tempfile.mkdtemp(prefix=f".{output.name}.", dir=output.parent))
    try:
        entry_records: list[dict[str, Any]] = []
        previous: str | None = None
        kept_sha: dict[tuple[int, ...], str] = {}
        for index, clause in enumerate(kept):
            source_index, certificate, source = first_by_clause[clause]
            source_record = records[source_index]
            unsigned = {
                "schema": ENTRY_SCHEMA,
                "index": index,
                "source_record_index": source_index,
                "source_record_sha256": source_record["record_sha256"],
                "semantic_assignment_sha256": sha256_value(
                    source_record["semantic_assignment"]
                ),
                "positive_memberships": [list(pair) for pair in sorted(source)],
                "certificate": certificate,
                "clause": list(clause),
                "clause_sha256": sha256_value(list(clause)),
                "covered_unique_clause_count": unique_fan_in[clause],
                "covered_source_record_count": source_fan_in[clause],
                "terminal_claim": False,
            }
            entry = _record(unsigned, previous)
            previous = entry["record_sha256"]
            entry_records.append(entry)
            kept_sha[clause] = entry["clause_sha256"]

        coverage_records: list[dict[str, Any]] = []
        previous = None
        for coverage_index, (source_index, generated) in enumerate(hits):
            kept_clause = cover[generated]
            unsigned = {
                "schema": COVERAGE_SCHEMA,
                "index": coverage_index,
                "source_record_index": source_index,
                "source_record_sha256": records[source_index]["record_sha256"],
                "generated_clause_sha256": sha256_value(list(generated)),
                "kept_clause_sha256": kept_sha[kept_clause],
            }
            coverage = _record(unsigned, previous)
            previous = coverage["record_sha256"]
            coverage_records.append(coverage)

        entries_path = temporary / "certificates.jsonl"
        coverage_path = temporary / "coverage.jsonl"
        _write_jsonl(entries_path, entry_records)
        _write_jsonl(coverage_path, coverage_records)
        module_path = Path(rhombus.__file__).resolve()
        script_path = Path(__file__).resolve()
        manifest = {
            "schema": BANK_SCHEMA,
            "source": {
                "journal": str(journal.resolve()),
                "prefix_bytes": prefix_bytes,
                "prefix_records": prefix_records,
                "prefix_sha256": prefix_sha256,
                "head_record_sha256": records[-1]["record_sha256"],
            },
            "producer": {
                "script": str(script_path),
                "script_sha256": sha256_file(script_path),
                "detector_module": str(module_path),
                "detector_module_sha256": sha256_file(module_path),
                "minimization": (
                    "deterministic-greedy-inclusion-minimal"
                    if minimize
                    else "canonical-path-union"
                ),
            },
            "literal_namespace": {
                "descriptor": LITERAL_NAMESPACE,
                "descriptor_sha256": LITERAL_NAMESPACE_SHA256,
            },
            "counts": {
                "source_records": len(records),
                "semantic_assignments": semantic_count,
                "hit_assignments": len(hits),
                "miss_assignments": semantic_count - len(hits),
                "unique_generated_clauses": len(first_by_clause),
                "kept_antichain_clauses": len(kept),
            },
            "hit_stage_counts": dict(sorted(stage_counts.items())),
            "generated_literal_histogram": _literal_histogram(first_by_clause),
            "kept_literal_histogram": _literal_histogram(kept),
            "artifacts": {
                "certificates.jsonl": sha256_file(entries_path),
                "coverage.jsonl": sha256_file(coverage_path),
            },
            "certificate_semantics": CERTIFICATE_SEMANTICS,
            "terminal_claim": False,
        }
        manifest_path = temporary / "manifest.json"
        _write_json(manifest_path, manifest)
        sums = {name: sha256_file(temporary / name) for name in SUMMED_NAMES}
        (temporary / "SHA256SUMS").write_text(
            "".join(f"{digest}  {name}\n" for name, digest in sorted(sums.items()))
        )
        os.rename(temporary, output)
    except BaseException:
        shutil.rmtree(temporary, ignore_errors=True)
        raise
    return {
        **manifest,
        "bank_root_sha256": sha256_file(output / "SHA256SUMS"),
    }


def _validate_chain(
    records: Sequence[Mapping[str, Any]],
    schema: str,
    where: str,
    fields: frozenset[str],
) -> None:
    previous: str | None = None
    for index, record in enumerate(records):
        _require_fields(record, fields, f"{where} record {index}")
        payload = dict(record)
        claimed = payload.pop("record_sha256", None)
        _require_digest(claimed, f"{where} record {index} hash")
        if (
            record.get("schema") != schema
            or _require_int(record.get("index"), f"{where} record index") != index
            or payload.get("previous_record_sha256") != previous
            or claimed != sha256_value(payload)
        ):
            raise PrefixBankError(f"{where} record {index} failed identity/hash replay")
        previous = claimed


def _read_sha256sums_bytes(raw: bytes) -> dict[str, str]:
    result: dict[str, str] = {}
    try:
        lines = raw.decode("ascii").splitlines()
    except UnicodeDecodeError as exc:
        raise PrefixBankError("SHA256SUMS is not ASCII") from exc
    if not lines:
        raise PrefixBankError("SHA256SUMS is empty")
    for line_number, line in enumerate(lines, start=1):
        parts = line.split("  ")
        if len(parts) != 2:
            raise PrefixBankError(f"SHA256SUMS:{line_number}: malformed line")
        digest, name = parts
        if (
            len(digest) != 64
            or any(character not in "0123456789abcdef" for character in digest)
            or name not in SUMMED_NAMES
            or name in result
        ):
            raise PrefixBankError(f"SHA256SUMS:{line_number}: invalid entry")
        result[name] = digest
    if set(result) != set(SUMMED_NAMES):
        raise PrefixBankError("SHA256SUMS does not name the exact bank artifacts")
    return result


def _read_artifact_bytes(path: Path) -> bytes:
    if not path.is_file():
        raise PrefixBankError(f"missing artifact {path}")
    return path.read_bytes()


def replay_bank(
    output: Path,
    *,
    full_source_scan: bool,
    expected_root_sha256: str,
    expected_source_prefix_sha256: str,
    source_journal: Path | None = None,
) -> dict[str, Any]:
    if type(full_source_scan) is not bool:
        raise PrefixBankError("full_source_scan must be a Boolean")
    expected_root_sha256 = _require_digest(
        expected_root_sha256, "expected bank-root SHA-256"
    )
    expected_source_prefix_sha256 = _require_digest(
        expected_source_prefix_sha256,
        "expected source-prefix SHA-256",
    )
    sums_path = output / "SHA256SUMS"
    sums_raw = _read_artifact_bytes(sums_path)
    actual_root_sha256 = sha256_bytes(sums_raw)
    if actual_root_sha256 != expected_root_sha256:
        raise PrefixBankError(
            "bank-root SHA-256 mismatch: "
            f"expected={expected_root_sha256}, actual={actual_root_sha256}"
        )
    sums = _read_sha256sums_bytes(sums_raw)
    artifact_raw: dict[str, bytes] = {}
    for name, expected in sums.items():
        raw = _read_artifact_bytes(output / name)
        if sha256_bytes(raw) != expected:
            raise PrefixBankError(f"SHA256SUMS mismatch for {name}")
        artifact_raw[name] = raw

    manifest = strict_json_bytes(artifact_raw["manifest.json"], "manifest.json")
    _require_fields(manifest, MANIFEST_FIELDS, "bank manifest")
    if (
        manifest.get("schema") != BANK_SCHEMA
        or manifest.get("terminal_claim") is not False
    ):
        raise PrefixBankError("bank manifest schema or terminal claim mismatch")
    source_meta = manifest.get("source")
    if not isinstance(source_meta, Mapping):
        raise PrefixBankError("bank manifest lacks source metadata")
    _require_fields(source_meta, SOURCE_FIELDS, "manifest source")
    manifest_source_prefix_sha256 = _require_digest(
        source_meta.get("prefix_sha256"), "manifest source-prefix SHA-256"
    )
    if manifest_source_prefix_sha256 != expected_source_prefix_sha256:
        raise PrefixBankError(
            "externally pinned source-prefix SHA-256 mismatch: "
            f"expected={expected_source_prefix_sha256}, "
            f"manifest={manifest_source_prefix_sha256}"
        )
    source_journal_name = _require_nonempty_string(
        source_meta.get("journal"), "manifest source journal"
    )
    producer = manifest.get("producer")
    if not isinstance(producer, Mapping):
        raise PrefixBankError("bank manifest lacks producer metadata")
    _require_fields(producer, PRODUCER_FIELDS, "manifest producer")
    minimization = producer.get("minimization")
    if minimization not in MINIMIZATION_MODES:
        raise PrefixBankError("manifest minimization mode is unknown")
    _require_nonempty_string(producer.get("script"), "manifest producer script")
    _require_nonempty_string(
        producer.get("detector_module"), "manifest detector module"
    )
    if _require_digest(
        producer.get("script_sha256"), "manifest producer script SHA-256"
    ) != sha256_file(Path(__file__).resolve()):
        raise PrefixBankError("bank producer script SHA-256 mismatch")
    if _require_digest(
        producer.get("detector_module_sha256"),
        "manifest detector module SHA-256",
    ) != sha256_file(Path(rhombus.__file__).resolve()):
        raise PrefixBankError("bank detector module SHA-256 mismatch")
    literal_namespace = manifest.get("literal_namespace")
    if not isinstance(literal_namespace, Mapping):
        raise PrefixBankError("bank manifest lacks literal namespace")
    _require_fields(
        literal_namespace, LITERAL_NAMESPACE_FIELDS, "manifest literal namespace"
    )
    if (
        literal_namespace.get("descriptor") != LITERAL_NAMESPACE
        or literal_namespace.get("descriptor_sha256") != LITERAL_NAMESPACE_SHA256
    ):
        raise PrefixBankError("literal namespace descriptor mismatch")
    counts = manifest.get("counts")
    if not isinstance(counts, Mapping):
        raise PrefixBankError("bank manifest lacks counts")
    _require_fields(counts, COUNT_FIELDS, "manifest counts")
    for name, value in counts.items():
        _require_int(value, f"manifest count {name}")
    _require_str_int_map(manifest.get("hit_stage_counts"), "hit_stage_counts")
    _require_str_int_map(
        manifest.get("generated_literal_histogram"),
        "generated_literal_histogram",
    )
    _require_str_int_map(
        manifest.get("kept_literal_histogram"), "kept_literal_histogram"
    )
    if manifest.get("certificate_semantics") != CERTIFICATE_SEMANTICS:
        raise PrefixBankError("certificate_semantics mismatch")
    journal = source_journal or Path(source_journal_name)
    records = pinned_prefix_records(
        journal,
        prefix_bytes=_require_int(source_meta["prefix_bytes"], "prefix_bytes"),
        prefix_records=_require_int(source_meta["prefix_records"], "prefix_records"),
        prefix_sha256=expected_source_prefix_sha256,
    )
    if (
        _require_digest(
            source_meta.get("head_record_sha256"), "source head record SHA-256"
        )
        != records[-1]["record_sha256"]
    ):
        raise PrefixBankError("source head record mismatch")
    artifact_hashes = manifest.get("artifacts")
    if not isinstance(artifact_hashes, Mapping) or set(artifact_hashes) != set(
        ARTIFACT_NAMES
    ):
        raise PrefixBankError("manifest does not name the exact bank artifacts")
    for name, expected in artifact_hashes.items():
        expected = _require_digest(expected, f"artifact SHA-256 for {name}")
        if sha256_bytes(artifact_raw[name]) != expected:
            raise PrefixBankError(f"artifact SHA-256 mismatch for {name}")
    if any(artifact_hashes[name] != sums[name] for name in ARTIFACT_NAMES):
        raise PrefixBankError("manifest artifact hashes differ from SHA256SUMS")
    entries = strict_json_lines_bytes(
        artifact_raw["certificates.jsonl"], "certificates.jsonl"
    )
    coverage = strict_json_lines_bytes(artifact_raw["coverage.jsonl"], "coverage.jsonl")
    _validate_chain(entries, ENTRY_SCHEMA, "certificate", ENTRY_FIELDS)
    _validate_chain(coverage, COVERAGE_SCHEMA, "coverage", COVERAGE_FIELDS)

    clauses_by_sha: dict[str, tuple[int, ...]] = {}
    clauses: list[tuple[int, ...]] = []
    minimized = minimization == "deterministic-greedy-inclusion-minimal"
    for entry in entries:
        if entry.get("terminal_claim") is not False:
            raise PrefixBankError("certificate terminal claim must be false")
        source_index = _require_int(
            entry["source_record_index"], "certificate source index"
        )
        if not 0 <= source_index < len(records):
            raise PrefixBankError("certificate source index is outside pinned prefix")
        source_record = records[source_index]
        if (
            _require_digest(
                entry["source_record_sha256"], "certificate source record SHA"
            )
            != source_record["record_sha256"]
        ):
            raise PrefixBankError("certificate source record SHA mismatch")
        semantic = source_record["semantic_assignment"]
        if semantic is None:
            raise PrefixBankError("certificate source lacks a semantic assignment")
        if _require_digest(
            entry["semantic_assignment_sha256"],
            "certificate semantic assignment SHA",
        ) != sha256_value(semantic):
            raise PrefixBankError("certificate semantic assignment SHA mismatch")
        positives = rhombus.extract_positive_memberships(entry["positive_memberships"])
        source_positives = rhombus.parse_semantic_assignment(semantic)
        if not positives <= source_positives:
            raise PrefixBankError("certificate uses a non-positive source membership")
        clause = tuple(rhombus.replay_closure(entry["certificate"], positives))
        clause_sha = _require_digest(entry["clause_sha256"], "certificate clause SHA")
        if list(clause) != entry["clause"] or sha256_value(list(clause)) != clause_sha:
            raise PrefixBankError("certificate clause replay mismatch")
        _require_int(
            entry["covered_unique_clause_count"],
            "certificate unique-clause fan-in",
        )
        _require_int(
            entry["covered_source_record_count"],
            "certificate source fan-in",
        )
        if minimized:
            for membership in positives:
                if rhombus.detect_three_rhombus(positives - {membership}) is not None:
                    raise PrefixBankError("certificate source is not inclusion-minimal")
        if clause_sha in clauses_by_sha:
            raise PrefixBankError("certificate repeats a clause SHA")
        clauses.append(clause)
        clauses_by_sha[clause_sha] = clause
    kept, cover = clause_antichain(clauses)
    if len(kept) != len(clauses) or any(cover[clause] != clause for clause in clauses):
        raise PrefixBankError("certificate clauses are not an antichain")

    coverage_by_source: dict[int, Mapping[str, Any]] = {}
    kept_fan_in: Counter[str] = Counter()
    kept_unique_fan_in: dict[str, set[str]] = defaultdict(set)
    generated_clause_shas: set[str] = set()
    generated_clauses_by_sha: dict[str, tuple[int, ...]] = {}
    replay_cache: dict[
        frozenset[tuple[int, int]],
        tuple[frozenset[tuple[int, int]], dict[str, Any], tuple[int, ...]] | None,
    ] = {}
    replayed_stage_counts: Counter[str] = Counter()
    for item in coverage:
        source_index = _require_int(
            item["source_record_index"], "coverage source index"
        )
        if not 0 <= source_index < len(records):
            raise PrefixBankError("coverage source index is outside pinned prefix")
        if source_index in coverage_by_source:
            raise PrefixBankError("coverage repeats a source record")
        if (
            _require_digest(item["source_record_sha256"], "coverage source record SHA")
            != records[source_index]["record_sha256"]
        ):
            raise PrefixBankError("coverage source record SHA mismatch")
        kept_sha = _require_digest(item["kept_clause_sha256"], "coverage kept SHA")
        kept_clause = clauses_by_sha.get(kept_sha)
        if kept_clause is None:
            raise PrefixBankError("coverage references an unknown kept clause")
        semantic = records[source_index]["semantic_assignment"]
        if semantic is None:
            raise PrefixBankError("coverage source lacks a semantic assignment")
        source_positives = rhombus.parse_semantic_assignment(semantic)
        if source_positives not in replay_cache:
            replay_cache[source_positives] = minimize_positive_source(
                source_positives, minimize=minimized
            )
        result = replay_cache[source_positives]
        generated_sha = _require_digest(
            item["generated_clause_sha256"], "coverage generated SHA"
        )
        if result is None or generated_sha != sha256_value(list(result[2])):
            raise PrefixBankError("coverage generated clause replay mismatch")
        prior_generated = generated_clauses_by_sha.setdefault(generated_sha, result[2])
        if prior_generated != result[2]:
            raise PrefixBankError("generated clause SHA collision")
        if not frozenset(kept_clause) <= frozenset(result[2]):
            raise PrefixBankError(
                "coverage kept clause does not subsume generated clause"
            )
        kept_fan_in[kept_sha] += 1
        kept_unique_fan_in[kept_sha].add(generated_sha)
        generated_clause_shas.add(generated_sha)
        replayed_stage_counts[records[source_index]["stage"]] += 1
        coverage_by_source[source_index] = item

    if full_source_scan:
        expected_hits: list[tuple[int, tuple[int, ...]]] = []
        expected_first_by_clause: dict[
            tuple[int, ...],
            tuple[int, frozenset[tuple[int, int]], dict[str, Any]],
        ] = {}
        for index, record in enumerate(records):
            semantic = record["semantic_assignment"]
            if semantic is None:
                continue
            source_positives = rhombus.parse_semantic_assignment(semantic)
            if source_positives not in replay_cache:
                replay_cache[source_positives] = minimize_positive_source(
                    source_positives, minimize=minimized
                )
            result = replay_cache[source_positives]
            if result is None:
                if index in coverage_by_source:
                    raise PrefixBankError("coverage claims a detector miss")
                continue
            source, certificate, generated = result
            expected_hits.append((index, generated))
            expected_first_by_clause.setdefault(generated, (index, source, certificate))

        expected_kept, expected_cover = clause_antichain(expected_first_by_clause)
        if tuple(clauses) != expected_kept:
            raise PrefixBankError(
                "certificate clauses differ from the canonical full-scan antichain"
            )
        for entry, clause in zip(entries, expected_kept, strict=True):
            source_index, source, certificate = expected_first_by_clause[clause]
            if entry["source_record_index"] != source_index:
                raise PrefixBankError(
                    "certificate source order differs from canonical full replay"
                )
            if entry["positive_memberships"] != [list(pair) for pair in sorted(source)]:
                raise PrefixBankError(
                    "certificate memberships differ from canonical full replay"
                )
            if entry["certificate"] != certificate:
                raise PrefixBankError(
                    "certificate payload differs from canonical full replay"
                )

        if len(expected_hits) != len(coverage):
            raise PrefixBankError("coverage count differs from full source replay")
        expected_kept_sha = {
            clause: sha256_value(list(clause)) for clause in expected_kept
        }
        for item, (source_index, generated) in zip(
            coverage, expected_hits, strict=True
        ):
            if item["source_record_index"] != source_index:
                raise PrefixBankError(
                    "coverage order differs from canonical full source replay"
                )
            if item["generated_clause_sha256"] != sha256_value(list(generated)):
                raise PrefixBankError("coverage changes a full-replay detector hit")
            if (
                item["kept_clause_sha256"]
                != expected_kept_sha[expected_cover[generated]]
            ):
                raise PrefixBankError(
                    "coverage differs from the canonical antichain cover"
                )

    semantic_count = sum(
        record["semantic_assignment"] is not None for record in records
    )
    if counts["source_records"] != len(records):
        raise PrefixBankError("manifest source count mismatch")
    if counts["semantic_assignments"] != semantic_count:
        raise PrefixBankError("manifest semantic-assignment count mismatch")
    if counts["kept_antichain_clauses"] != len(entries):
        raise PrefixBankError("manifest antichain count mismatch")
    if counts["hit_assignments"] != len(coverage):
        raise PrefixBankError("manifest hit count mismatch")
    if counts["miss_assignments"] != semantic_count - len(coverage):
        raise PrefixBankError("manifest miss count mismatch")
    if counts["unique_generated_clauses"] != len(generated_clause_shas):
        raise PrefixBankError("manifest generated-clause count mismatch")
    for entry in entries:
        clause_sha = _require_digest(entry["clause_sha256"], "certificate clause SHA")
        if entry["covered_source_record_count"] != kept_fan_in[clause_sha]:
            raise PrefixBankError("certificate source fan-in mismatch")
        if entry["covered_unique_clause_count"] != len(kept_unique_fan_in[clause_sha]):
            raise PrefixBankError("certificate unique-clause fan-in mismatch")
    if dict(sorted(replayed_stage_counts.items())) != manifest["hit_stage_counts"]:
        raise PrefixBankError("manifest hit-stage counts mismatch")
    if (
        _literal_histogram(clauses_by_sha.values())
        != manifest["kept_literal_histogram"]
    ):
        raise PrefixBankError("manifest kept-clause histogram mismatch")
    if (
        _literal_histogram(generated_clauses_by_sha.values())
        != manifest["generated_literal_histogram"]
    ):
        raise PrefixBankError("manifest generated-clause histogram mismatch")
    return {
        "ok": True,
        "bank_root_sha256": actual_root_sha256,
        "full_source_scan": full_source_scan,
        "coverage_claims_verified": True,
        "coverage_complete_verified": full_source_scan,
        "source_records": len(records),
        "hit_assignments": len(coverage),
        "kept_antichain_clauses": len(entries),
        "terminal_claim": False,
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command", required=True)
    build = subparsers.add_parser("build")
    build.add_argument("--journal", type=Path, required=True)
    build.add_argument("--output", type=Path, required=True)
    build.add_argument("--prefix-bytes", type=int, required=True)
    build.add_argument("--prefix-records", type=int, required=True)
    build.add_argument("--prefix-sha256", required=True)
    build.add_argument("--no-minimize", action="store_true")
    replay = subparsers.add_parser("replay")
    replay.add_argument("--bank", type=Path, required=True)
    replay.add_argument("--expected-root-sha256", required=True)
    replay.add_argument("--expected-source-prefix-sha256", required=True)
    replay.add_argument("--source-journal", type=Path)
    replay.add_argument("--skip-source-completeness-scan", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.command == "build":
            result = build_bank(
                args.journal,
                args.output,
                prefix_bytes=args.prefix_bytes,
                prefix_records=args.prefix_records,
                prefix_sha256=args.prefix_sha256,
                minimize=not args.no_minimize,
            )
            print(
                json.dumps(
                    {
                        "bank_root_sha256": result["bank_root_sha256"],
                        "counts": result["counts"],
                    },
                    sort_keys=True,
                )
            )
        else:
            print(
                json.dumps(
                    replay_bank(
                        args.bank,
                        full_source_scan=not args.skip_source_completeness_scan,
                        expected_root_sha256=args.expected_root_sha256,
                        expected_source_prefix_sha256=(
                            args.expected_source_prefix_sha256
                        ),
                        source_journal=args.source_journal,
                    ),
                    sort_keys=True,
                )
            )
    except (OSError, KeyError, TypeError, ValueError, rhombus.CertificateError) as exc:
        parser.exit(2, f"error: {exc}\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
