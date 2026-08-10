#!/usr/bin/env python3
"""Bank weighted-Kalmanson instances found at an exact-17 PIQD wave boundary.

This script deliberately starts from source-faithful model-analysis artifacts,
re-minimizes their exact linear contradictions, and asks the existing generic
Lean-backed producer to certify the resulting weighted cancellations.  It is a
theorem-instance search, not an exact-cardinality closure claim.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
producer_bank = importlib.import_module("census.atail_force.producer_bank")
LANE = ROOT / "scratch/rigid221-blockerv-exact17-20260806"
DEFAULT_INPUTS = tuple(
    Path(__file__).resolve().parent / f"postwave-linear-{index}.json"
    for index in range(1, 4)
)


def sha256(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def canonical_sha256(value: Any) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return sha256(raw)


def repo_path(path: Path) -> str:
    resolved = path.resolve()
    try:
        return str(resolved.relative_to(ROOT))
    except ValueError:
        return str(resolved)


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def file_evidence(path: Path) -> dict[str, Any]:
    raw = path.read_bytes()
    return {"path": repo_path(path), "sha256": sha256(raw), "bytes": len(raw)}


def validate_analysis(path: Path) -> tuple[dict[str, Any], dict[str, Any]]:
    raw = path.read_bytes()
    payload = json.loads(raw)
    required_true = (
        "root_cnf_assignment_verified",
        "cut_receipt_chain_verified",
        "cnf_assignment_verified",
        "source_independent_model_checker_verified",
        "source_z3_assignment_verified",
    )
    failed = [name for name in required_true if payload.get(name) is not True]
    if failed:
        raise ValueError(f"{path}: failed evidence gates {failed}")
    if payload.get("linear_status") != "unsat":
        raise ValueError(f"{path}: expected exact linear UNSAT replay")
    if not payload.get("linear_core_rows"):
        raise ValueError(f"{path}: missing minimized linear core rows")
    return payload, {
        "path": repo_path(path),
        "sha256": sha256(raw),
        "bytes": len(raw),
    }


def historical_canonical_counts(root: Path) -> tuple[int, dict[str, int], int]:
    counts: dict[str, int] = {}
    records = 0
    files = 0
    for path in sorted(root.rglob("*.json")):
        try:
            payload = json.loads(path.read_text())
        except (OSError, UnicodeDecodeError, json.JSONDecodeError):
            continue
        results = payload.get("results") if isinstance(payload, dict) else None
        if not isinstance(results, list):
            continue
        found = False
        for item in results:
            if not isinstance(item, dict) or "canonical" not in item:
                continue
            digest = canonical_sha256(item["canonical"])
            counts[digest] = counts.get(digest, 0) + 1
            records += 1
            found = True
        files += int(found)
    return records, counts, files


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("inputs", nargs="*", type=Path, default=DEFAULT_INPUTS)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument(
        "--historical-root",
        type=Path,
        action="append",
        default=[],
        help=(
            "root containing prior theorem-search summaries; repeat to deduplicate "
            "against multiple banks (defaults to the exact-17 lane)"
        ),
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path(__file__).resolve().parent,
    )
    args = parser.parse_args()

    mine = load_module("postwave_mine", LANE / "mine_tracked_linear_supports.py")
    classify = load_module(
        "postwave_classify", LANE / "classify_unmatched_linear_supports.py"
    )
    replay = load_module(
        "postwave_replay", LANE / "replay_weighted_kalmanson_consumer.py"
    )
    historical_roots = args.historical_root or [LANE]
    historical_records = 0
    historical_files = 0
    historical_counts: dict[str, int] = {}
    for historical_root in historical_roots:
        root_records, root_counts, root_files = historical_canonical_counts(
            historical_root
        )
        historical_records += root_records
        historical_files += root_files
        for digest, count in root_counts.items():
            historical_counts[digest] = historical_counts.get(digest, 0) + count

    args.output_dir.mkdir(parents=True, exist_ok=True)
    results = []
    for index, path in enumerate(args.inputs, start=1):
        analysis, input_evidence = validate_analysis(path)
        support = mine.tracked_support(
            {
                "learned_rows": analysis["linear_core_rows"],
                "order": analysis["order"],
            },
            args.timeout_ms,
        )
        if support.get("status") != "unsat":
            raise RuntimeError(f"{path}: support minimization returned {support}")
        support_for_classification = {
            **support,
            "journal": repo_path(path),
            "iteration": index,
        }
        classification = classify.classify(support_for_classification)
        if not classification["pure_kalmanson"]:
            raise RuntimeError(f"{path}: minimized support is not pure Kalmanson")
        if not classification["positive_rational_cancellation"]:
            raise RuntimeError(f"{path}: no positive rational cancellation")
        weights = classification["weights"]
        inequalities = [atom for atom in support["atoms"] if atom[0] != "eq"]
        if weights is None or len(weights) != len(inequalities):
            raise RuntimeError(f"{path}: weight/inequality mismatch")
        terms = [
            replay.term_from_atom(atom, support["used_points"], int(weight))
            for atom, weight in zip(inequalities, weights, strict=True)
        ]
        rows = tuple(
            producer_bank.MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                exact=bool(row.get("exact", False)),
            )
            for row in analysis["rows"]
        )
        certificate = producer_bank.certify_weighted_kalmanson_cancellation(
            rows, len(analysis["order"]), analysis["order"], terms
        )
        canonical_digest = canonical_sha256(support["canonical"])
        record = {
            "schema": "p97-exact17-piqd-postwave-weighted-instance-v1",
            "status": "certified",
            "scope": (
                "cardinality-generic weighted-Kalmanson theorem instance; "
                "discovered in an exact-17 PIQD SAT model"
            ),
            "input": input_evidence,
            "order": analysis["order"],
            "rows": analysis["rows"],
            "linear_core_rows": analysis["linear_core_rows"],
            "support": support,
            "support_sha256": canonical_sha256(support),
            "canonical_support_sha256": canonical_digest,
            "historical_exact_matches": historical_counts.get(canonical_digest, 0),
            "classification": classification,
            "weighted_terms": terms,
            "weighted_certificate": certificate,
            "lean_consumer": certificate["lean_consumer"],
            "proof_status": (
                "accepted by the existing kernel-clean generic Lean consumer; "
                "not exact-17 coverage and not a universal leaf closure"
            ),
        }
        output = args.output_dir / f"postwave-weighted-certificate-{index}.json"
        output.write_text(json.dumps(record, indent=2, sort_keys=True) + "\n")
        results.append(
            {
                "input": input_evidence,
                "certificate": file_evidence(output),
                "canonical_support_sha256": canonical_digest,
                "historical_exact_matches": historical_counts.get(canonical_digest, 0),
                "point_count": classification["point_count"],
                "equality_count": classification["equality_count"],
                "inequality_count": classification["inequality_count"],
                "inequality_kinds": classification["inequality_kinds"],
                "unit_cancellation": classification["unit_cancellation"],
                "weights": weights,
                "lean_consumer": certificate["lean_consumer"],
            }
        )

    sources = (
        Path(__file__).resolve(),
        LANE / "mine_tracked_linear_supports.py",
        LANE / "classify_unmatched_linear_supports.py",
        LANE / "replay_weighted_kalmanson_consumer.py",
        Path(producer_bank.__file__).resolve(),
        ROOT
        / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean",
    )
    summary = {
        "schema": "p97-exact17-piqd-postwave-theorem-search-v1",
        "status": "complete",
        "records": len(results),
        "certified_weighted_instances": len(results),
        "historical_scan": {
            "roots": [repo_path(root) for root in historical_roots],
            "json_files_with_canonical_supports": historical_files,
            "canonical_support_records": historical_records,
        },
        "results": results,
        "sources": [file_evidence(path) for path in sources],
        "conclusion": (
            f"{len(results)} support signatures instantiate an existing "
            "cardinality-generic weighted-Kalmanson Lean theorem. They are "
            "reusable theorem-bank cuts, not exact-17 or universal closure."
        ),
    }
    output = args.output_dir / "postwave-theorem-search.json"
    output.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output),
                "records": len(results),
                "historical_records": historical_records,
                "results": results,
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
