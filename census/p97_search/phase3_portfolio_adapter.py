"""Adapt authenticated Phase-3 v3 artifacts into P10B scenarios.

This module is deliberately a read-only boundary.  It authenticates the
learned, survivor, and productivity JSONL streams, replays each referenced
semantic assignment into v3 metric rows, and emits the feature/detector
scenario format consumed by :mod:`phase3_portfolio`.

The adapter does not run a detector, select a clause, alter a bank, or change
the Class-A cascade.  A detector trace is emitted only when the existing
productivity record proves that the detector was reached.  Missing trace data
therefore remains missing, and the P10B scheduler will report ``UNKNOWN``.
That is intentional: a hypothetical reordered schedule is never allowed to
reinterpret an unrecorded detector as a negative result.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib
import json
from pathlib import Path
from typing import Any, Mapping, Sequence

from census.p97_search import phase3_portfolio as portfolio
from census.p97_search import phase3_productivity as productivity


ADAPTER_SCHEMA = "p97-phase3-real-corpus-portfolio-adapter-v1"
TRACE_SCHEMA = "p97-phase3-detector-trace-v1"

# This is the actual order of detector calls in the v3 coordinator.  The
# portfolio namespace also contains ``structural`` as a reserved successor
# slot, but v3's structural certificate minimization is downstream of the
# metric-core match rather than a separate detector call.  The adapter never
# invents an observation for that reserved slot.
LIVE_DETECTOR_ORDER = (
    "metric-core",
    "three-rhombus",
    "cap-order",
    "rhombus-cap-order",
    "shared-pair",
    "kalmanson",
    "algebraic",
)

CLASSIFICATION_DETECTOR = {
    "learned-structural": "metric-core",
    "learned-seven-point-three-rhombus": "three-rhombus",
    "learned-cap-order": "cap-order",
    "learned-rhombus-cap-order": "rhombus-cap-order",
    "learned-shared-pair-cyclic-separation": "shared-pair",
    "learned-kalmanson-cap-order": "kalmanson",
    "learned-algebraic": "algebraic",
    "learned-real-distinctness": "algebraic",
}

COST_FIELD = {
    "metric-core": "metric_detector",
    "three-rhombus": "three_rhombus_detector",
    "cap-order": "cap_order_minimization_replay",
    "rhombus-cap-order": "rhombus_cap_order_minimization_replay",
    "shared-pair": "shared_pair_minimization_replay",
    "kalmanson": "kalmanson_minimization_replay",
    "algebraic": "algebraic_certificate_replay",
}


class AdapterError(ValueError):
    """Malformed, unauthenticated, or semantically incomplete source data."""


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _strict_records(path: Path, v3: Any) -> list[dict[str, Any]]:
    try:
        records = v3._strict_json_lines(path)
    except Exception as exc:  # v3 exposes a project-specific error type
        raise AdapterError(f"cannot read strict JSONL {path}: {exc}") from exc
    return records


def _validate_chain(
    records: Sequence[Mapping[str, Any]],
    *,
    path: Path,
    expected_schema: str,
    v3: Any,
    productivity_records: bool = False,
) -> str | None:
    previous: str | None = None
    for index, record in enumerate(records):
        try:
            if productivity_records:
                productivity._validate_record(
                    record, index=index, previous=previous
                )
            else:
                v3._validate_record_hash(
                    record, previous, where=f"{path}:{index + 1}"
                )
        except Exception as exc:
            raise AdapterError(f"{path}:{index + 1}: {exc}") from exc
        if record.get("schema") != expected_schema:
            raise AdapterError(
                f"{path}:{index + 1}: expected schema {expected_schema}"
            )
        if record.get("index") != index:
            raise AdapterError(f"{path}:{index + 1}: non-dense record index")
        previous = record.get("record_sha256")
        if not isinstance(previous, str):
            raise AdapterError(f"{path}:{index + 1}: missing record hash")
    return previous


def _source_records(
    *,
    learned_path: Path,
    survivors_path: Path | None,
    productivity_path: Path,
    v3: Any,
    encoding: Any,
) -> tuple[
    list[dict[str, Any]],
    list[dict[str, Any]] | None,
    list[dict[str, Any]],
    dict[str, dict[str, Any]],
]:
    learned = _strict_records(learned_path, v3)
    learned_schema = v3._learned_schema(encoding)
    _validate_chain(
        learned,
        path=learned_path,
        expected_schema=learned_schema,
        v3=v3,
    )

    survivors: list[dict[str, Any]] | None = None
    if survivors_path is not None:
        survivors = _strict_records(survivors_path, v3)
        _validate_chain(
            survivors,
            path=survivors_path,
            expected_schema=v3._survivor_schema(encoding),
            v3=v3,
        )

    productivity_values = _strict_records(productivity_path, v3)
    _validate_chain(
        productivity_values,
        path=productivity_path,
        expected_schema=productivity.RECORD_SCHEMA,
        v3=v3,
        productivity_records=True,
    )

    sources: dict[str, dict[str, Any]] = {}
    for kind, records in (("learned", learned), ("survivor", survivors or [])):
        for record in records:
            record_hash = record.get("record_sha256")
            if not isinstance(record_hash, str):
                raise AdapterError(f"{kind} source record has no hash")
            if record_hash in sources:
                raise AdapterError("duplicate source record hash across streams")
            sources[record_hash] = record
    return learned, survivors, productivity_values, sources


def _certificate_identity(source: Mapping[str, Any]) -> str:
    certificate = source.get("certificate")
    if certificate is not None:
        return productivity.sha256_value(certificate)
    for key in (
        "algebraic_template_sha256",
        "certificate_payload_sha256",
        "certificate_sha256",
    ):
        value = source.get(key)
        if isinstance(value, str):
            return value
    record_hash = source.get("record_sha256")
    if isinstance(record_hash, str):
        return record_hash
    raise AdapterError("terminal source has no certificate identity")


def _costs(productivity_record: Mapping[str, Any]) -> dict[str, int]:
    raw = productivity_record.get("cost_ns")
    if not isinstance(raw, Mapping):
        raise AdapterError("productivity record has no cost_ns map")
    result: dict[str, int] = {}
    for detector, field in COST_FIELD.items():
        if field not in raw:
            continue
        value = raw[field]
        if type(value) is not int or value < 0:
            raise AdapterError(f"invalid {field} timing")
        result[detector] = value
    return result


def _observations(
    productivity_record: Mapping[str, Any], source: Mapping[str, Any]
) -> dict[str, dict[str, Any]]:
    classification = productivity_record.get("classification")
    if not isinstance(classification, str):
        raise AdapterError("productivity classification is missing")
    terminal = CLASSIFICATION_DETECTOR.get(classification)
    if terminal is None and classification != "structurally-unresolved-survivor":
        raise AdapterError(f"unsupported v3 classification {classification}")

    costs = _costs(productivity_record)
    observations: dict[str, dict[str, Any]] = {}
    for detector in LIVE_DETECTOR_ORDER:
        if detector not in costs:
            continue
        status = "MATCH" if detector == terminal else "NO_MATCH"
        observation: dict[str, Any] = {
            "schema": TRACE_SCHEMA,
            "status": status,
            "cost_ns": costs[detector],
            "classification": classification if status == "MATCH" else None,
            "certificate_sha256": (
                _certificate_identity(source) if status == "MATCH" else None
            ),
        }
        observations[detector] = observation

    if terminal is not None:
        before_terminal = LIVE_DETECTOR_ORDER[: LIVE_DETECTOR_ORDER.index(terminal)]
        if any(detector not in observations for detector in before_terminal):
            raise AdapterError(
                f"productivity trace omits a detector before terminal {terminal}"
            )
        if terminal not in observations:
            raise AdapterError(f"productivity trace omits terminal {terminal}")
        # Missing detectors are expected after the terminal and are deliberately
        # absent.  The scheduler records them as skipped or UNKNOWN if moved
        # ahead of the terminal.
    return observations


def _scenario_with_lineage(
    *,
    feature_record: Mapping[str, Any],
    productivity_record: Mapping[str, Any],
    source: Mapping[str, Any],
    source_kind: str,
    observations: Mapping[str, Any],
) -> dict[str, Any]:
    scenario = portfolio.make_scenario(
        scenario_id=f"v3-raw-sat-{productivity_record['raw_sat_index']}",
        feature_record=feature_record,
        observations=observations,
    )
    unsigned = dict(scenario)
    unsigned["trace_schema"] = TRACE_SCHEMA
    unsigned["source"] = {
        "kind": source_kind,
        "record_sha256": source["record_sha256"],
        "productivity_record_sha256": productivity_record["record_sha256"],
    }
    unsigned.pop("scenario_sha256", None)
    return {**unsigned, "scenario_sha256": productivity.sha256_value(unsigned)}


def adapt_records(
    *,
    learned_records: Sequence[Mapping[str, Any]],
    productivity_records: Sequence[Mapping[str, Any]],
    survivors_records: Sequence[Mapping[str, Any]] = (),
    v3: Any | None = None,
    encoding: Any | None = None,
) -> list[dict[str, Any]]:
    """Replay authenticated source records and return P10B scenarios."""

    if v3 is None:
        v3 = importlib.import_module(
            "census.p97_search.phase3_structural_cegar_projected_static_v3"
        )
    if encoding is None:
        encoding = v3._phase3_encoding(projected_static_v3=True)
    learned_schema = v3._learned_schema(encoding)
    survivor_schema = v3._survivor_schema(encoding)
    sources: dict[str, Mapping[str, Any]] = {}
    for kind, records, expected in (
        ("learned", learned_records, learned_schema),
        ("survivor", survivors_records, survivor_schema),
    ):
        previous: str | None = None
        for index, source in enumerate(records):
            v3._validate_record_hash(
                source, previous, where=f"{kind} record {index}"
            )
            if source.get("schema") != expected or source.get("index") != index:
                raise AdapterError(f"{kind} source identity mismatch at {index}")
            record_hash = source.get("record_sha256")
            if not isinstance(record_hash, str) or record_hash in sources:
                raise AdapterError("duplicate or missing source record hash")
            sources[record_hash] = source
            previous = record_hash

    productivity_previous: str | None = None
    scenarios: list[dict[str, Any]] = []
    feature_previous: str | None = None
    for index, productivity_record in enumerate(productivity_records):
        productivity._validate_record(
            productivity_record, index=index, previous=productivity_previous
        )
        productivity_previous = productivity_record["record_sha256"]
        source_ref = productivity_record.get("source")
        if not isinstance(source_ref, Mapping):
            raise AdapterError(f"productivity record {index} has no source")
        source_hash = source_ref.get("record_sha256")
        if not isinstance(source_hash, str):
            raise AdapterError(f"productivity record {index} has invalid source hash")
        source = sources.get(source_hash)
        if source is None:
            raise AdapterError(
                f"productivity record {index} references unavailable source {source_hash}"
            )
        if source.get("raw_sat_index") != productivity_record["raw_sat_index"]:
            raise AdapterError(f"raw SAT index mismatch at productivity record {index}")
        assignment = encoding.assignment_from_record(source)
        assignment_hash = v3._assignment_hash(encoding, assignment)
        claimed_assignment = productivity_record.get("assignment_sha256")
        if (
            claimed_assignment != assignment_hash
            or source.get("assignment_sha256") != assignment_hash
        ):
            raise AdapterError(
                f"assignment hash mismatch at productivity record {index}"
            )
        try:
            obj = encoding.decode(assignment)
            encoding.validate(obj, assignment)
            rows = v3._metric_rows(obj)
            rows_payload = [row.as_dict() for row in rows]
        except Exception as exc:
            raise AdapterError(
                f"source assignment replay failed at productivity record {index}: {exc}"
            ) from exc
        feature = portfolio.make_feature_record(
            index=index,
            raw_sat_index=productivity_record["raw_sat_index"],
            assignment_sha256=assignment_hash,
            source_record_sha256=str(source_hash),
            rows=rows_payload,
            previous_record_sha256=feature_previous,
        )
        feature_previous = feature["record_sha256"]
        scenario = _scenario_with_lineage(
            feature_record=feature,
            productivity_record=productivity_record,
            source=source,
            source_kind=(
                "survivor"
                if source.get("schema") == survivor_schema
                else "learned"
            ),
            observations=_observations(productivity_record, source),
        )
        portfolio.validate_scenario(scenario)
        scenarios.append(scenario)
    portfolio.validate_feature_chain(
        [scenario["feature_record"] for scenario in scenarios]
    )
    return scenarios


def adapt_corpus(
    *,
    learned_path: str | Path,
    productivity_path: str | Path,
    survivors_path: str | Path | None = None,
) -> dict[str, Any]:
    """Build an authenticated adapter report and scenario list from v3 files."""

    learned_path = Path(learned_path)
    productivity_path = Path(productivity_path)
    survivor_path = None if survivors_path is None else Path(survivors_path)
    v3 = importlib.import_module(
        "census.p97_search.phase3_structural_cegar_projected_static_v3"
    )
    encoding = v3._phase3_encoding(projected_static_v3=True)
    learned, survivors, productivity_values, _sources = _source_records(
        learned_path=learned_path,
        survivors_path=survivor_path,
        productivity_path=productivity_path,
        v3=v3,
        encoding=encoding,
    )
    scenarios = adapt_records(
        learned_records=learned,
        survivors_records=survivors or (),
        productivity_records=productivity_values,
        v3=v3,
        encoding=encoding,
    )
    report_unsigned = {
        "schema": ADAPTER_SCHEMA,
        "source_schema": v3._learned_schema(encoding),
        "survivor_schema": v3._survivor_schema(encoding),
        "productivity_schema": productivity.RECORD_SCHEMA,
        "learned_file_sha256": _sha256_file(learned_path),
        "productivity_file_sha256": _sha256_file(productivity_path),
        "survivors_file_sha256": (
            None if survivor_path is None else _sha256_file(survivor_path)
        ),
        "learned_count": len(learned),
        "survivor_count": len(survivors or []),
        "productivity_count": len(productivity_values),
        "scenario_count": len(scenarios),
        "feature_terminal_record_sha256": (
            scenarios[-1]["feature_record"]["record_sha256"]
            if scenarios
            else None
        ),
        "scenarios": scenarios,
        "trust_boundary": (
            "read-only authenticated source replay; no detector selection, "
            "clause admission, bank mutation, or terminal proof authority"
        ),
    }
    return {
        **report_unsigned,
        "report_sha256": productivity.sha256_value(report_unsigned),
    }


def _write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_bytes(productivity.canonical_bytes(value) + b"\n")
    temporary.replace(path)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--learned", type=Path, required=True)
    parser.add_argument("--productivity", type=Path, required=True)
    parser.add_argument("--survivors", type=Path)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument(
        "--report",
        type=Path,
        help="optional adapter report; --out always receives the scenario array",
    )
    args = parser.parse_args(argv)
    report = adapt_corpus(
        learned_path=args.learned,
        productivity_path=args.productivity,
        survivors_path=args.survivors,
    )
    _write_json(args.out, report["scenarios"])
    if args.report is not None:
        _write_json(args.report, report)
    print(
        json.dumps(
            {
                "out": str(args.out),
                "report": None if args.report is None else str(args.report),
                "report_sha256": report["report_sha256"],
                "schema": ADAPTER_SCHEMA,
                "scenario_count": report["scenario_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
