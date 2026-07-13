#!/usr/bin/env python3
"""Exact normalization checkpoint for the immutable ATAIL cvc5 V2 result.

cvc5 1.3.3 terminates a ``--tlimit`` query by signal after printing
``cvc5 interrupted by timeout.`` without a status line.  The V2 runner kept
all raw evidence but classified that statusless path as ``ERROR``.  This
checkpoint validates the complete manifest/result binding and normalizes only
that exact raw shape to ``TIMEOUT``.  It runs no solver.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path
from typing import Any, Mapping

from census.atail_force import three_center_surface as surface


SCHEMA = "p97_atail_force_cvc5_pilot_checkpoint.v1"
MANIFEST_SCHEMA = "p97_atail_force_cvc5_pilot_manifest.v2"
RESULT_SCHEMA = "p97_atail_force_cvc5_pilot_results.v2"

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
MANIFEST = HERE / "cvc5_pilot_manifest_v2.json"
RAW_RESULT = HERE / "cvc5_pilot_results_v2.json"
DEFAULT_CHECKPOINT = HERE / "cvc5_pilot_checkpoint.json"
EXPECTED_CASE_COUNT = 7
EXPECTED_TIMEOUT_DIAGNOSTIC = "cvc5 interrupted by timeout."


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise surface.SurfaceError(message)


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    try:
        with path.open("rb") as handle:
            for block in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(block)
    except OSError as exc:
        raise surface.SurfaceError(f"cannot hash {path}: {exc}") from exc
    return digest.hexdigest()


def _json_digest(value: Any) -> str:
    encoded = json.dumps(value, separators=(",", ":"), sort_keys=True)
    return hashlib.sha256(encoded.encode("utf-8")).hexdigest()


def _canonical(value: Mapping[str, Any]) -> str:
    return json.dumps(value, sort_keys=True, indent=2) + "\n"


def _read_json(path: Path, context: str) -> dict[str, Any]:
    try:
        with path.open(encoding="utf-8") as handle:
            value = json.load(handle)
    except (OSError, json.JSONDecodeError) as exc:
        raise surface.SurfaceError(f"cannot load {context} {path}: {exc}") from exc
    _require(isinstance(value, dict), f"{context} is not a JSON object")
    return value


def _write_atomic(path: Path, content: str, *, exclusive: bool) -> None:
    from census.atail_force.inequality_pilot import _write_atomic

    _write_atomic(path, content, exclusive=exclusive)


def _validated_manifest() -> dict[str, Any]:
    manifest = _read_json(MANIFEST, "cvc5 V2 manifest")
    _require(manifest.get("schema") == MANIFEST_SCHEMA, "manifest schema drift")
    stored = manifest.get("manifest_sha256")
    body = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
    _require(stored == _json_digest(body), "manifest self-digest drift")
    _require(len(manifest.get("cases", [])) == EXPECTED_CASE_COUNT, "case-count drift")
    return manifest


def _normalize_record(
    record: Mapping[str, Any], case: Mapping[str, Any]
) -> dict[str, Any]:
    case_id = case["case_id"]
    _require(record.get("case_id") == case_id, f"{case_id}: case-id drift")
    _require(
        record.get("system_input_sha256") == case["system_input_sha256"],
        f"{case_id}: system digest drift",
    )
    counts = record.get("constraint_counts")
    _require(isinstance(counts, dict), f"{case_id}: missing constraint ledger")
    expected_counts = {
        "variables": case["variables"],
        "equalities": case["equalities"],
        "weak_inequalities": case["weak_inequalities"],
        "strict_inequalities": case["strict_inequalities"],
        "assertions": (
            case["equalities"]
            + case["weak_inequalities"]
            + case["strict_inequalities"]
        ),
    }
    _require(counts == expected_counts, f"{case_id}: constraint-count drift")
    smt2_digest = record.get("smt2_sha256")
    _require(
        isinstance(smt2_digest, str) and len(smt2_digest) == 64,
        f"{case_id}: malformed SMT2 digest",
    )
    raw_verdict = record.get("verdict")
    if raw_verdict == "ERROR":
        _require(record.get("solver_status") is None, f"{case_id}: unexpected status")
        _require(record.get("returncode") == -6, f"{case_id}: unexpected return code")
        _require(
            record.get("diagnostic_suffix") == EXPECTED_TIMEOUT_DIAGNOSTIC,
            f"{case_id}: timeout diagnostic drift",
        )
        elapsed = record.get("elapsed_seconds")
        _require(
            isinstance(elapsed, (int, float)) and 30 <= elapsed <= 35,
            f"{case_id}: timeout elapsed-time drift",
        )
        normalized = "TIMEOUT"
        evidence = "statusless cvc5 --tlimit termination with exact timeout diagnostic"
    else:
        _require(
            raw_verdict
            in {"SAT_CANDIDATE", "UNSAT_PROPOSAL", "TIMEOUT", "UNKNOWN"},
            f"{case_id}: unrecognized raw verdict {raw_verdict!r}",
        )
        normalized = raw_verdict
        evidence = "raw verdict retained"
    return {
        "case_id": case_id,
        "raw_verdict": raw_verdict,
        "normalized_verdict": normalized,
        "normalization_evidence": evidence,
        "elapsed_seconds": record.get("elapsed_seconds"),
        "system_input_sha256": record["system_input_sha256"],
        "smt2_sha256": smt2_digest,
        "constraint_counts": counts,
    }


def build_checkpoint() -> dict[str, Any]:
    manifest = _validated_manifest()
    raw = _read_json(RAW_RESULT, "cvc5 V2 raw result")
    _require(raw.get("schema") == RESULT_SCHEMA, "raw result schema drift")
    _require(
        raw.get("manifest_sha256") == manifest["manifest_sha256"],
        "raw result/manifest binding drift",
    )
    _require(raw.get("engine_sha256") == manifest["policy"]["engine_sha256"],
             "engine digest drift")
    nice = raw.get("nice_preflight")
    _require(
        nice == {"effective_nice": 10, "passed": True, "returncode": 0, "stderr": ""},
        "nice preflight drift",
    )
    smoke = raw.get("smoke")
    _require(isinstance(smoke, dict) and smoke.get("passed") is True, "smoke drift")
    records = raw.get("results")
    _require(
        isinstance(records, list) and len(records) == EXPECTED_CASE_COUNT,
        "raw result case-count drift",
    )
    cases = manifest["cases"]
    _require(
        [record.get("case_id") for record in records]
        == [case["case_id"] for case in cases],
        "raw result case order drift",
    )
    normalized = [
        _normalize_record(record, case)
        for record, case in zip(records, cases, strict=True)
    ]
    counts = dict(
        sorted(Counter(row["normalized_verdict"] for row in normalized).items())
    )
    _require(counts == {"TIMEOUT": 7}, "terminal normalized histogram drift")
    inputs = (Path(__file__).resolve(), MANIFEST, RAW_RESULT)
    body = {
        "schema": SCHEMA,
        "manifest_self_sha256": manifest["manifest_sha256"],
        "manifest_file_sha256": _sha256(MANIFEST),
        "raw_result_file_sha256": _sha256(RAW_RESULT),
        "input_sha256": {
            str(path.relative_to(REPO_ROOT)): _sha256(path) for path in inputs
        },
        "nice_preflight": nice,
        "smoke_passed": True,
        "raw_total_elapsed_seconds": raw.get("total_elapsed_seconds"),
        "normalized_status_counts": counts,
        "results": normalized,
        "interpretation": {
            "solver_status_obtained": False,
            "sat_candidate_obtained": False,
            "unsat_proposal_obtained": False,
            "mathematical_claim": False,
            "scope": "seven frozen full-inequality representatives only",
        },
    }
    return {**body, "checkpoint_sha256": _json_digest(body)}


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    args = parser.parse_args()
    try:
        current = build_checkpoint()
        if args.write:
            _write_atomic(args.checkpoint, _canonical(current), exclusive=True)
        else:
            stored = _read_json(args.checkpoint, "cvc5 checkpoint")
            _require(stored == current, "cvc5 checkpoint drift")
        return 0
    except (surface.SurfaceError, OSError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
