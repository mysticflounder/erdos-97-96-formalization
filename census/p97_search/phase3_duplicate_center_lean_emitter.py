#!/usr/bin/env python3
"""Emit checked Lean data for the frozen Phase-3 duplicate-center census.

The input is deliberately pinned to the refreshed bounded set of 100 canonical
``(k,n,profile) = (4,10,(4,4,5))`` SAT witnesses.  This emitter independently
checks the frozen file hashes, result hash chain, row hashes, and the direct
duplicate-center closure paths.  It then deterministically deduplicates the
100 records to 23 full metric-row patterns and certificates.

The generated Lean module proves only that those 100 saved records have
checked duplicate-center cores.  It makes no completeness or live-P97 claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

ARTIFACT_SCHEMA = "p97-phase3-structural-screen-manifest-v1"
RESULT_SCHEMA = "p97-phase3-structural-screen-record-v1"
SUMMARY_SCHEMA = "p97-phase3-structural-screen-summary-v1"
SOURCE_MANIFEST_SHA256 = (
    "a0ab7b496412e8470a5dbd35e8f12e9ed0834f01674be013fed2a1d544dff41e"
)
EXPECTED_FILE_SHA256 = {
    "manifest.json": (
        "3faef7c54c313d003aa90dbb63ab783d4fa8a8df4f50892790d96670f7486c9c"
    ),
    "results.jsonl": (
        "e79e150701a2e59ea64b7a8a4609cddbcf9cbab9f11a3a6f28a8d71456af888b"
    ),
    "singular-smoke.json": (
        "aec9ef1fea6ada62ad3093ed31914cd75a0ce1f21ddecc2e13267a4400f45634"
    ),
    "summary.json": (
        "7abde3c065dffdf284bedb1f26baf94b7a5abd55e93b52baa924c503265f7fd4"
    ),
}
EXPECTED_MODEL_COUNT = 100
EXPECTED_UNIQUE_COUNT = 23
EXPECTED_CLASSIFICATION = "STRUCTURAL_CORE_REPLAYED"
EXPECTED_TRUST = "PYTHON_CERTIFICATE_REPLAYED_NOT_KERNEL_LANDED"
EXPECTED_STAGE = "equality-duplicate-center"
LEAN_NAMESPACE_RE = re.compile(
    r"[A-Za-z][A-Za-z0-9_']*(?:\.[A-Za-z][A-Za-z0-9_']*)*"
)

FullPattern = tuple[tuple[int, ...], ...]


class DuplicateCenterEmissionError(ValueError):
    """The frozen artifact cannot be safely translated to Lean data."""


@dataclass(frozen=True)
class Step:
    kind: str
    first: int
    second: int
    center: int | None = None


@dataclass(frozen=True)
class ClosurePath:
    field: str
    first: tuple[int, int]
    last: tuple[int, int]
    steps: tuple[Step, ...]


@dataclass(frozen=True)
class DuplicateCenterCertificate:
    p: int
    q: int
    r: int
    a: int
    b: int
    paths: tuple[ClosurePath, ...]
    proof_sha256: str


@dataclass(frozen=True)
class EmissionData:
    patterns: tuple[FullPattern, ...]
    certificates: tuple[DuplicateCenterCertificate, ...]
    metric_rows_sha256: tuple[str, ...]
    certificate_proof_sha256: tuple[str, ...]
    source_to_unique: tuple[int, ...]
    source_canonical_digest: tuple[str, ...]
    summary_sha256: str
    result_chain_tail: str


def _canonical_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as error:
        raise DuplicateCenterEmissionError(
            f"value is not canonical JSON: {error}"
        ) from error


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_value(value: Any) -> str:
    return _sha256_bytes(_canonical_bytes(value))


def _require_mapping(value: Any, where: str) -> Mapping[str, Any]:
    if not isinstance(value, dict):
        raise DuplicateCenterEmissionError(f"{where} must be a JSON object")
    return value


def _read_json(path: Path) -> Mapping[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as error:
        raise DuplicateCenterEmissionError(f"cannot read {path}: {error}") from error
    return _require_mapping(value, str(path))


def _check_pinned_files(artifact: Path) -> None:
    try:
        names = {path.name for path in artifact.iterdir() if path.is_file()}
    except OSError as error:
        raise DuplicateCenterEmissionError(
            f"cannot inspect artifact directory {artifact}: {error}"
        ) from error
    if names != set(EXPECTED_FILE_SHA256):
        raise DuplicateCenterEmissionError(
            "artifact file set mismatch: "
            f"expected {sorted(EXPECTED_FILE_SHA256)}, got {sorted(names)}"
        )
    for name, expected in EXPECTED_FILE_SHA256.items():
        path = artifact / name
        try:
            actual = _sha256_bytes(path.read_bytes())
        except OSError as error:
            raise DuplicateCenterEmissionError(f"cannot read {path}: {error}") from error
        if actual != expected:
            raise DuplicateCenterEmissionError(
                f"{name} SHA-256 mismatch: expected {expected}, got {actual}"
            )


def _validate_manifest(manifest: Mapping[str, Any]) -> None:
    source = _require_mapping(manifest.get("source"), "manifest source")
    if (
        manifest.get("schema") != ARTIFACT_SCHEMA
        or manifest.get("expected_result_count") != EXPECTED_MODEL_COUNT
        or source.get("manifest_sha256") != SOURCE_MANIFEST_SHA256
        or source.get("model_count") != EXPECTED_MODEL_COUNT
        or source.get("status") != "PARTIAL"
        or source.get("result_claim")
        != "SAT witness census only; semantic enumeration is incomplete"
    ):
        raise DuplicateCenterEmissionError("unexpected frozen manifest identity/scope")
    configuration = _require_mapping(
        manifest.get("configuration"), "manifest configuration"
    )
    if (
        configuration.get("metric_row_exact") is not False
        or configuration.get("order_independent") is not True
    ):
        raise DuplicateCenterEmissionError("unexpected metric-row configuration")


def _load_records(path: Path) -> list[Mapping[str, Any]]:
    records: list[Mapping[str, Any]] = []
    try:
        with path.open(encoding="utf-8") as source:
            for line_number, line in enumerate(source, start=1):
                try:
                    value = json.loads(line)
                except json.JSONDecodeError as error:
                    raise DuplicateCenterEmissionError(
                        f"{path}:{line_number}: invalid JSON: {error}"
                    ) from error
                records.append(_require_mapping(value, f"{path}:{line_number}"))
    except OSError as error:
        raise DuplicateCenterEmissionError(f"cannot read {path}: {error}") from error
    if len(records) != EXPECTED_MODEL_COUNT:
        raise DuplicateCenterEmissionError(
            f"expected {EXPECTED_MODEL_COUNT} result records, got {len(records)}"
        )
    return records


def _validate_summary(
    summary: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
) -> tuple[str, str]:
    unsigned = dict(summary)
    claimed_summary_hash = unsigned.pop("summary_sha256", None)
    if claimed_summary_hash != _sha256_value(unsigned):
        raise DuplicateCenterEmissionError("summary.json has invalid summary hash")
    if (
        summary.get("schema") != SUMMARY_SCHEMA
        or summary.get("status") != "COMPLETE"
        or summary.get("model_count") != EXPECTED_MODEL_COUNT
        or summary.get("structural_core_count") != EXPECTED_MODEL_COUNT
        or summary.get("structurally_unresolved_count") != 0
        or summary.get("source_manifest_sha256") != SOURCE_MANIFEST_SHA256
        or summary.get("classification_counts")
        != {EXPECTED_CLASSIFICATION: EXPECTED_MODEL_COUNT}
        or summary.get("detector_family_counts")
        != {EXPECTED_STAGE: EXPECTED_MODEL_COUNT}
        or summary.get("forbidden_claims_emitted") != []
    ):
        raise DuplicateCenterEmissionError("unexpected frozen summary identity/scope")
    artifacts = _require_mapping(summary.get("artifacts"), "summary artifacts")
    for name in ("manifest.json", "results.jsonl", "singular-smoke.json"):
        entry = _require_mapping(artifacts.get(name), f"summary artifact {name}")
        if entry.get("sha256") != EXPECTED_FILE_SHA256[name]:
            raise DuplicateCenterEmissionError(
                f"summary artifact hash mismatch for {name}"
            )
    tail = records[-1].get("record_sha256")
    if summary.get("result_chain_tail") != tail:
        raise DuplicateCenterEmissionError("summary result-chain tail mismatch")
    assert isinstance(claimed_summary_hash, str)
    assert isinstance(tail, str)
    return claimed_summary_hash, tail


def _label(value: Any, where: str) -> int:
    if type(value) is not int or not 0 <= value < 10:
        raise DuplicateCenterEmissionError(f"{where} is not a label in 0..9")
    return value


def _sha256_string(value: Any, where: str) -> str:
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise DuplicateCenterEmissionError(f"{where} is not a lowercase SHA-256")
    return value


def _validate_metric_rows(
    value: Any,
    *,
    where: str,
    expected_count: int,
    require_all_centers: bool,
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    if not isinstance(value, list) or len(value) != expected_count:
        raise DuplicateCenterEmissionError(
            f"{where} must contain exactly {expected_count} rows"
        )
    rows: list[tuple[int, tuple[int, ...]]] = []
    for row_index, raw_row in enumerate(value):
        row = _require_mapping(raw_row, f"{where}[{row_index}]")
        if set(row) != {"center", "support", "exact"} or row["exact"] is not False:
            raise DuplicateCenterEmissionError(
                f"{where}[{row_index}] must be one non-exact metric row"
            )
        center = _label(row["center"], f"{where}[{row_index}].center")
        support_raw = row["support"]
        if not isinstance(support_raw, list) or len(support_raw) != 4:
            raise DuplicateCenterEmissionError(
                f"{where}[{row_index}] support must contain four labels"
            )
        support = tuple(
            _label(point, f"{where}[{row_index}].support")
            for point in support_raw
        )
        if support != tuple(sorted(set(support))) or center in support:
            raise DuplicateCenterEmissionError(
                f"{where}[{row_index}] support is not canonical"
            )
        rows.append((center, support))
    if rows != sorted(rows) or len({center for center, _ in rows}) != len(rows):
        raise DuplicateCenterEmissionError(f"{where} rows are not center-sorted")
    if require_all_centers and tuple(center for center, _ in rows) != tuple(range(10)):
        raise DuplicateCenterEmissionError(f"{where} does not cover centers 0..9")
    return tuple(rows)


def _parse_edge(value: Any, where: str) -> tuple[int, int]:
    if not isinstance(value, list) or len(value) != 2:
        raise DuplicateCenterEmissionError(f"{where} must be a two-label edge")
    return _label(value[0], where), _label(value[1], where)


def _parse_path(
    value: Any,
    *,
    expected_field: str,
    expected_first: tuple[int, int],
    expected_last: tuple[int, int],
    selected_rows: Mapping[int, tuple[int, ...]],
    where: str,
) -> ClosurePath:
    path = _require_mapping(value, where)
    if set(path) != {
        "field",
        "first",
        "last",
        "length",
        "row_equality_steps",
        "steps",
    }:
        raise DuplicateCenterEmissionError(f"{where} has unexpected fields")
    first = _parse_edge(path["first"], f"{where}.first")
    last = _parse_edge(path["last"], f"{where}.last")
    if (
        path["field"] != expected_field
        or first != expected_first
        or last != expected_last
    ):
        raise DuplicateCenterEmissionError(f"{where} obligation mismatch")
    raw_steps = path["steps"]
    if not isinstance(raw_steps, list) or path["length"] != len(raw_steps):
        raise DuplicateCenterEmissionError(f"{where} has invalid step count")
    current = first
    parsed: list[Step] = []
    row_step_count = 0
    for step_index, raw_step in enumerate(raw_steps):
        step = _require_mapping(raw_step, f"{where}.steps[{step_index}]")
        kind = step.get("kind")
        if kind == "row":
            if set(step) != {"kind", "center", "first", "second"}:
                raise DuplicateCenterEmissionError(
                    f"{where}.steps[{step_index}] has unexpected row fields"
                )
            center = _label(step["center"], f"{where}.steps[{step_index}].center")
            first_label = _label(
                step["first"], f"{where}.steps[{step_index}].first"
            )
            second_label = _label(
                step["second"], f"{where}.steps[{step_index}].second"
            )
            support = selected_rows.get(center)
            if (
                current != (center, first_label)
                or support is None
                or first_label not in support
                or second_label not in support
            ):
                raise DuplicateCenterEmissionError(
                    f"{where}.steps[{step_index}] row equality does not replay"
                )
            current = center, second_label
            parsed.append(Step("row", first_label, second_label, center))
            row_step_count += 1
        elif kind == "flip":
            if set(step) != {"kind", "first", "second"}:
                raise DuplicateCenterEmissionError(
                    f"{where}.steps[{step_index}] has unexpected flip fields"
                )
            first_label = _label(
                step["first"], f"{where}.steps[{step_index}].first"
            )
            second_label = _label(
                step["second"], f"{where}.steps[{step_index}].second"
            )
            if current != (first_label, second_label):
                raise DuplicateCenterEmissionError(
                    f"{where}.steps[{step_index}] flip does not compose"
                )
            current = second_label, first_label
            parsed.append(Step("flip", first_label, second_label))
        else:
            raise DuplicateCenterEmissionError(
                f"{where}.steps[{step_index}] has unsupported kind"
            )
    if current != last or path["row_equality_steps"] != row_step_count:
        raise DuplicateCenterEmissionError(f"{where} does not replay to its endpoint")
    return ClosurePath(expected_field, first, last, tuple(parsed))


def _parse_certificate(
    value: Any,
    *,
    full_rows: tuple[tuple[int, tuple[int, ...]], ...],
    where: str,
) -> DuplicateCenterCertificate:
    certificate = _require_mapping(value, where)
    if certificate.get("stage") != EXPECTED_STAGE:
        raise DuplicateCenterEmissionError(f"{where} is not a duplicate-center core")
    proof_sha256 = _sha256_string(
        certificate.get("proof_sha256"), f"{where}.proof_sha256"
    )
    unsigned = dict(certificate)
    unsigned.pop("proof_sha256")
    if proof_sha256 != _sha256_value(unsigned):
        raise DuplicateCenterEmissionError(f"{where} has invalid proof hash")

    raw_selected_rows = certificate.get("rows")
    selected = _validate_metric_rows(
        raw_selected_rows,
        where=f"{where}.rows",
        expected_count=len(raw_selected_rows)
        if isinstance(raw_selected_rows, list)
        else -1,
        require_all_centers=False,
    )
    full_row_set = set(full_rows)
    if not selected or any(row not in full_row_set for row in selected):
        raise DuplicateCenterEmissionError(
            f"{where} certificate rows are not a nonempty subset of full rows"
        )
    if certificate.get("nogood_sha256") != _sha256_value(raw_selected_rows):
        raise DuplicateCenterEmissionError(f"{where} has invalid nogood hash")
    if (
        certificate.get("side_conditions") != [{"kind": "injective-realization"}]
        or certificate.get("direct_row_equality_replay") is not True
    ):
        raise DuplicateCenterEmissionError(
            f"{where} has unexpected side conditions/trust claim"
        )

    core = _require_mapping(certificate.get("core"), f"{where}.core")
    if set(core) != {"centers", "triple"}:
        raise DuplicateCenterEmissionError(f"{where}.core has unexpected fields")
    centers = core["centers"]
    triple = core["triple"]
    if not isinstance(centers, list) or len(centers) != 2:
        raise DuplicateCenterEmissionError(f"{where}.core has invalid centers")
    if not isinstance(triple, list) or len(triple) != 3:
        raise DuplicateCenterEmissionError(f"{where}.core has invalid triple")
    a, b = (_label(item, f"{where}.core.centers") for item in centers)
    p, q, r = (_label(item, f"{where}.core.triple") for item in triple)
    if len({p, q, r}) != 3 or a == b:
        raise DuplicateCenterEmissionError(
            f"{where}.core violates duplicate-center side conditions"
        )
    obligations = (
        ("ap_aq", (a, p), (a, q)),
        ("ap_ar", (a, p), (a, r)),
        ("bp_bq", (b, p), (b, q)),
        ("bp_br", (b, p), (b, r)),
    )
    raw_paths = certificate.get("closure_paths")
    if not isinstance(raw_paths, list) or len(raw_paths) != len(obligations):
        raise DuplicateCenterEmissionError(f"{where} has invalid closure paths")
    selected_by_center = dict(selected)
    paths = tuple(
        _parse_path(
            raw_path,
            expected_field=field,
            expected_first=first,
            expected_last=last,
            selected_rows=selected_by_center,
            where=f"{where}.closure_paths[{index}]",
        )
        for index, (raw_path, (field, first, last)) in enumerate(
            zip(raw_paths, obligations, strict=True)
        )
    )
    if certificate.get("max_closure_path_length") != max(
        len(path.steps) for path in paths
    ):
        raise DuplicateCenterEmissionError(f"{where} has invalid maximum path length")
    minimum = _require_mapping(certificate.get("minimum"), f"{where}.minimum")
    if (
        minimum.get("criterion")
        != "minimum number of whole concrete center/support row choices preserving "
        "every recorded closure obligation"
        or minimum.get("method") != "exhaustive subsets in increasing cardinality"
        or minimum.get("minimum_row_count") != len(selected)
        or minimum.get("source_row_count") != 10
        or type(minimum.get("optimal_subset_count")) is not int
        or minimum["optimal_subset_count"] < 1
        or type(minimum.get("subsets_tested")) is not int
        or minimum["subsets_tested"] < 1
    ):
        raise DuplicateCenterEmissionError(f"{where} has invalid minimum-row audit")
    return DuplicateCenterCertificate(p, q, r, a, b, paths, proof_sha256)


def _full_pattern(
    rows: tuple[tuple[int, tuple[int, ...]], ...],
) -> FullPattern:
    return tuple(support for _, support in rows)


def load_artifact(artifact: Path) -> EmissionData:
    """Validate the exact frozen artifact and build deterministic Lean inputs."""

    artifact = artifact.resolve()
    _check_pinned_files(artifact)
    manifest = _read_json(artifact / "manifest.json")
    _validate_manifest(manifest)
    records = _load_records(artifact / "results.jsonl")
    summary = _read_json(artifact / "summary.json")
    summary_sha256, result_chain_tail = _validate_summary(summary, records)

    previous: str | None = None
    entries: list[
        tuple[FullPattern, DuplicateCenterCertificate, str, str]
    ] = []
    canonical_digests: list[str] = []
    for index, record in enumerate(records):
        where = f"results.jsonl:{index + 1}"
        unsigned = dict(record)
        record_sha256 = _sha256_string(
            unsigned.pop("record_sha256", None), f"{where}.record_sha256"
        )
        if record_sha256 != _sha256_value(unsigned):
            raise DuplicateCenterEmissionError(f"{where} has invalid record hash")
        if (
            record.get("schema") != RESULT_SCHEMA
            or record.get("screen_index") != index
            or record.get("source_model_index") != index
            or record.get("source_manifest_sha256") != SOURCE_MANIFEST_SHA256
            or record.get("previous_record_sha256") != previous
            or record.get("classification") != EXPECTED_CLASSIFICATION
            or record.get("trust") != EXPECTED_TRUST
            or record.get("detector", {}).get("stage") != EXPECTED_STAGE
            or record.get("certificate_validation")
            != {
                "validator": (
                    "cap_selected_nogood_certificate_probe._validate_certificate"
                ),
                "n": 10,
                "passed": True,
            }
        ):
            raise DuplicateCenterEmissionError(
                f"{where} has unexpected identity/classification"
            )
        previous = record_sha256

        raw_rows = record.get("metric_rows")
        rows = _validate_metric_rows(
            raw_rows,
            where=f"{where}.metric_rows",
            expected_count=10,
            require_all_centers=True,
        )
        metric_rows_sha256 = _sha256_string(
            record.get("metric_rows_sha256"), f"{where}.metric_rows_sha256"
        )
        if metric_rows_sha256 != _sha256_value(raw_rows):
            raise DuplicateCenterEmissionError(f"{where} has invalid metric-row hash")
        certificate = _parse_certificate(
            record.get("certificate"),
            full_rows=rows,
            where=f"{where}.certificate",
        )
        detector = _require_mapping(record.get("detector"), f"{where}.detector")
        certificate_core = _require_mapping(
            record["certificate"].get("core"), f"{where}.certificate.core"
        )
        if detector.get("core") != certificate_core:
            raise DuplicateCenterEmissionError(
                f"{where} detector/certificate core mismatch"
            )
        canonical_digest = _sha256_string(
            record.get("canonical_digest"), f"{where}.canonical_digest"
        )
        canonical_digests.append(canonical_digest)
        entries.append(
            (
                _full_pattern(rows),
                certificate,
                metric_rows_sha256,
                canonical_digest,
            )
        )

    by_pattern: dict[
        FullPattern, tuple[DuplicateCenterCertificate, str]
    ] = {}
    for pattern, certificate, rows_sha256, _ in entries:
        current = by_pattern.get(pattern)
        candidate = certificate, rows_sha256
        if current is not None and current != candidate:
            raise DuplicateCenterEmissionError(
                "one full metric-row pattern has inconsistent certificates"
            )
        by_pattern[pattern] = candidate
    patterns = tuple(sorted(by_pattern))
    if len(patterns) != EXPECTED_UNIQUE_COUNT:
        raise DuplicateCenterEmissionError(
            f"expected {EXPECTED_UNIQUE_COUNT} unique patterns, got {len(patterns)}"
        )
    index_of = {pattern: index for index, pattern in enumerate(patterns)}
    certificates = tuple(by_pattern[pattern][0] for pattern in patterns)
    metric_hashes = tuple(by_pattern[pattern][1] for pattern in patterns)
    proof_hashes = tuple(certificate.proof_sha256 for certificate in certificates)
    source_to_unique = tuple(index_of[pattern] for pattern, _, _, _ in entries)
    if len(source_to_unique) != EXPECTED_MODEL_COUNT or set(source_to_unique) != set(
        range(EXPECTED_UNIQUE_COUNT)
    ):
        raise DuplicateCenterEmissionError("source-to-unique map is not surjective")
    return EmissionData(
        patterns=patterns,
        certificates=certificates,
        metric_rows_sha256=metric_hashes,
        certificate_proof_sha256=proof_hashes,
        source_to_unique=source_to_unique,
        source_canonical_digest=tuple(canonical_digests),
        summary_sha256=summary_sha256,
        result_chain_tail=result_chain_tail,
    )


def _lean_vector(items: Sequence[str], *, indent: int = 0) -> list[str]:
    prefix = " " * indent
    lines = [f"{prefix}!["]
    for index, item in enumerate(items):
        comma = "," if index + 1 < len(items) else ""
        item_lines = item.splitlines()
        lines.append(f"{prefix}  {item_lines[0]}")
        lines.extend(f"{prefix}  {line}" for line in item_lines[1:])
        lines[-1] += comma
    lines.append(f"{prefix}]")
    return lines


def _render_pattern(pattern: FullPattern) -> str:
    rows = [
        "{" + ", ".join(str(point) for point in support) + "}"
        for support in pattern
    ]
    return "\n".join(line.lstrip() for line in _lean_vector(rows))


def _render_path(path: ClosurePath) -> list[str]:
    step_values = []
    for step in path.steps:
        if step.kind == "row":
            assert step.center is not None
            step_values.append(f".row {step.center} {step.first} {step.second}")
        else:
            step_values.append(f".flip {step.first} {step.second}")
    lines = [
        "{",
        f"  first := ({path.first[0]}, {path.first[1]})",
        f"  last := ({path.last[0]}, {path.last[1]})",
        "  steps := [",
    ]
    for index, step in enumerate(step_values):
        comma = "," if index + 1 < len(step_values) else ""
        lines.append(f"    {step}{comma}")
    lines.extend(["  ]", "}"])
    return lines


def _render_certificate(certificate: DuplicateCenterCertificate) -> str:
    lines = [
        "{",
        f"  p := {certificate.p}",
        f"  q := {certificate.q}",
        f"  r := {certificate.r}",
        f"  a := {certificate.a}",
        f"  b := {certificate.b}",
    ]
    for path in certificate.paths:
        path_lines = _render_path(path)
        lines.append(f"  {path.field} := {path_lines[0]}")
        lines.extend(f"  {line}" for line in path_lines[1:])
    lines.append("}")
    return "\n".join(lines)


def _render_string_vector(values: Sequence[str]) -> list[str]:
    return _lean_vector([json.dumps(value) for value in values])


def render_module(
    data: EmissionData,
    *,
    namespace: str = "Problem97.Phase3Bounded100DuplicateCenterData",
) -> str:
    """Render a standalone generated Lean data/checker module."""

    if LEAN_NAMESPACE_RE.fullmatch(namespace) is None:
        raise DuplicateCenterEmissionError(f"invalid Lean namespace {namespace!r}")
    namespace_parts = namespace.split(".")
    if namespace_parts[0] != "Problem97":
        raise DuplicateCenterEmissionError("generated namespace must be under Problem97")
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        "import Erdos9796Proof.P97.Phase3DuplicateCenterCertificate",
        "",
        "/-!",
        "# Generated bounded Phase-3 duplicate-center data",
        "",
        "Generated by",
        "`census/p97_search/phase3_duplicate_center_lean_emitter.py`; do not",
        "edit this module directly.",
        "",
        "Scope: exactly the frozen bounded set of 100 canonical Phase-3 SAT",
        "witness records. The source enumeration is partial. This module proves",
        "neither Phase-3 coverage nor a connection to a live",
        "`FaithfulCarrierPattern`.",
        "",
        f"Frozen manifest SHA-256: `{EXPECTED_FILE_SHA256['manifest.json']}`.",
        f"Frozen results SHA-256: `{EXPECTED_FILE_SHA256['results.jsonl']}`.",
        f"Frozen summary SHA-256: `{EXPECTED_FILE_SHA256['summary.json']}`.",
        f"Source manifest SHA-256: `{SOURCE_MANIFEST_SHA256}`.",
        "-/",
        "",
        "set_option linter.style.longLine false",
        "",
    ]
    lines.extend(f"namespace {part}" for part in namespace_parts)
    lines.extend(
        [
            "",
            "open Census554.EqualityCore",
            "open Phase3DuplicateCenterCertificate",
            "",
            (
                f'def frozenManifestSha256 : String := '
                f'"{EXPECTED_FILE_SHA256["manifest.json"]}"'
            ),
            (
                f'def frozenResultsSha256 : String := '
                f'"{EXPECTED_FILE_SHA256["results.jsonl"]}"'
            ),
            (
                f'def frozenSummarySha256 : String := '
                f'"{EXPECTED_FILE_SHA256["summary.json"]}"'
            ),
            f'def sourceManifestSha256 : String := "{SOURCE_MANIFEST_SHA256}"',
            f'def sourceSummaryPayloadSha256 : String := "{data.summary_sha256}"',
            f'def resultChainTail : String := "{data.result_chain_tail}"',
            "",
            "/-- The 23 distinct full ten-row patterns, in canonical row order. -/",
            "def uniquePattern : Fin 23 → RowPattern Label :=",
        ]
    )
    lines.extend(_lean_vector([_render_pattern(pattern) for pattern in data.patterns]))
    lines.extend(
        [
            "",
            "/-- One directly replayed duplicate-center certificate per pattern. -/",
            "def uniqueCertificate : Fin 23 → DuplicateCenterCertificate :=",
        ]
    )
    lines.extend(
        _lean_vector(
            [_render_certificate(certificate) for certificate in data.certificates]
        )
    )
    lines.extend(
        [
            "",
            "/-- Frozen full-row hashes in the same canonical order. -/",
            "def uniqueMetricRowsSha256 : Fin 23 → String :=",
        ]
    )
    lines.extend(_render_string_vector(data.metric_rows_sha256))
    lines.extend(
        [
            "",
            "/-- Frozen certificate proof hashes in canonical pattern order. -/",
            "def uniqueCertificateProofSha256 : Fin 23 → String :=",
        ]
    )
    lines.extend(_render_string_vector(data.certificate_proof_sha256))
    lines.extend(
        [
            "",
            "/-- Map each frozen source-record index to its canonical pattern. -/",
            "def sourceToUnique : Fin 100 → Fin 23 :=",
        ]
    )
    lines.extend(_lean_vector([str(index) for index in data.source_to_unique]))
    lines.extend(
        [
            "",
            "/-- Canonical SAT-model digests in frozen source-record order. -/",
            "def sourceCanonicalDigest : Fin 100 → String :=",
        ]
    )
    lines.extend(_render_string_vector(data.source_canonical_digest))
    lines.extend(
        [
            "",
            "/-- All 23 deduplicated certificates reduce successfully in Lean. -/",
            "theorem uniqueCertificate_check :",
            "    ∀ i : Fin 23,",
            "      (uniqueCertificate i).check (uniquePattern i) = true := by",
            "  decide",
            "",
            "/-- Every saved source record inherits its checked canonical core. -/",
            "theorem sourceCertificate_check (i : Fin 100) :",
            "    (uniqueCertificate (sourceToUnique i)).check",
            "      (uniquePattern (sourceToUnique i)) = true :=",
            "  uniqueCertificate_check (sourceToUnique i)",
            "",
            "/-- Scoped terminal theorem for each of the 100 saved row systems. -/",
            "theorem source_not_realizes (i : Fin 100) :",
            "    ¬ ∃ pointOf,",
            "      Realizes (uniquePattern (sourceToUnique i)) pointOf :=",
            "  (uniqueCertificate (sourceToUnique i)).not_realizes_of_check",
            "    (sourceCertificate_check i)",
            "",
        ]
    )
    lines.extend(f"end {part}" for part in reversed(namespace_parts))
    return "\n".join(lines) + "\n"


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifact", type=Path, help="frozen structural artifact")
    parser.add_argument("output", type=Path, help="generated Lean module")
    parser.add_argument(
        "--namespace",
        default="Problem97.Phase3Bounded100DuplicateCenterData",
        help="generated Lean namespace",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail unless the existing output is byte-for-byte current",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    data = load_artifact(args.artifact)
    rendered = render_module(data, namespace=args.namespace)
    output = args.output.resolve()
    if args.check:
        try:
            existing = output.read_text(encoding="utf-8")
        except OSError as error:
            raise SystemExit(f"cannot read generated output {output}: {error}") from error
        if existing != rendered:
            raise SystemExit(f"generated output is stale: {output}")
        print(f"PASS {output}")
        return 0

    output.parent.mkdir(parents=True, exist_ok=True)
    temporary_path: Path | None = None
    try:
        with tempfile.NamedTemporaryFile(
            "w",
            encoding="utf-8",
            dir=output.parent,
            prefix=f".{output.name}.",
            suffix=".tmp",
            delete=False,
        ) as temporary:
            temporary.write(rendered)
            temporary.flush()
            os.fsync(temporary.fileno())
            temporary_path = Path(temporary.name)
        temporary_path.replace(output)
    finally:
        if temporary_path is not None and temporary_path.exists():
            temporary_path.unlink()
    print(
        f"WROTE {output} "
        f"source_records={len(data.source_to_unique)} "
        f"unique_patterns={len(data.patterns)}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
