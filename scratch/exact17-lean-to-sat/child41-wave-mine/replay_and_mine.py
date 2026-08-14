#!/usr/bin/env python3
"""Authenticate, replay, and mine only the finalized Child41 model."""

from __future__ import annotations

import hashlib
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT))

from census.atail_force.producer_bank import (
    MetricRow,
    enumerate_two_kalmanson_cancellations,
    scan_all_formalized_cores,
)
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    path_hits,
    reflected,
)


SCRATCH = ROOT / "scratch" / "exact17-lean-to-sat"
CNF = SCRATCH / "exact17-forty-first-root-fortieth-model-refinements.cnf"
MODEL = SCRATCH / "piqd-child41-core1-custody-model.json"
FINAL = SCRATCH / "piqd-child41-core1-custody-final.json"
CHILD40 = SCRATCH / "child40-wave-mine/child40-analysis.json"
CHILD39 = SCRATCH / "child39-wave-mine/child39-analysis.json"
CHILD38_LEDGER = SCRATCH / "child38-wave-mine/child38-cancellation-bank-ledger.json"
OUT = Path(__file__).resolve().parent / "child41-analysis.json"

JOB = "038ded12-0e98-4c93-b666-2ca2ac06da5e"
CNF_SHA = "fc19386fdd9703f5313e1bf49b164d87c5905c56c727cfea6408dc7d01e78d24"
MODEL_SHA = "cf1cb831223700ebc376a50048260fc280a32aed7c91723c262b8a1274b5896a"
VARS = 308
CLAUSES = 5_847_920
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)


def sha(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def load(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text())
    if not isinstance(value, dict):
        raise TypeError(f"expected object: {path}")
    return value


def clean(value: Any) -> Any:
    if isinstance(value, dict):
        return {str(k): clean(v) for k, v in value.items()}
    if isinstance(value, (tuple, set, frozenset)):
        return [clean(v) for v in value]
    if isinstance(value, list):
        return [clean(v) for v in value]
    return value


def assignment(model: dict[str, Any]) -> dict[int, bool]:
    literals = model["model"]["assignment"]
    result = {abs(lit): lit > 0 for lit in literals if isinstance(lit, int) and lit}
    if len(result) != VARS or set(result) != set(range(1, VARS + 1)):
        raise ValueError("assignment is not total over variables 1..308")
    return result


def replay(a: dict[int, bool]) -> dict[str, Any]:
    digest = hashlib.sha256()
    header = None
    pending: list[int] = []
    checked = 0
    with CNF.open("rb") as stream:
        for raw in stream:
            digest.update(raw)
            line = raw.decode("ascii").strip()
            if not line or line.startswith("c"):
                continue
            fields = line.split()
            if fields[0] == "p":
                header = (int(fields[2]), int(fields[3]))
                continue
            for token in fields:
                lit = int(token)
                if lit:
                    pending.append(lit)
                else:
                    checked += 1
                    if not any(a[abs(x)] == (x > 0) for x in pending):
                        raise ValueError(f"assignment falsifies clause {checked}")
                    pending.clear()
    actual = digest.hexdigest()
    if header != (VARS, CLAUSES) or checked != CLAUSES or actual != CNF_SHA:
        raise ValueError(f"DIMACS mismatch: {header=} {checked=} {actual=}")
    return {"variables": VARS, "clauses_checked": checked, "sha256": actual, "satisfies_all": True}


def support(candidate: dict[str, Any]) -> frozenset[tuple[int, int]]:
    return frozenset((int(a), int(b)) for a, b in candidate["support"])


def prior_bank() -> tuple[set[frozenset[tuple[int, int]]], dict[str, Any]]:
    base = set()
    ledger = load(CHILD38_LEDGER)
    for entry in ledger["entries"]:
        base.add(sup := frozenset(tuple(hit) for hit in entry["hits"]))
        base.add(frozenset(tuple(hit) for hit in entry["reflected_hits"]))
    for path in (CHILD39, CHILD40):
        analysis = load(path)
        for order in analysis["two_kalmanson_occurrences"]:
            for candidate in order["candidates"]:
                item = support(candidate)
                base.add(item)
                base.add(reflected(item))
    return base, {
        "sources": [
            str(CHILD38_LEDGER.relative_to(ROOT)),
            str(CHILD39.relative_to(ROOT)),
            str(CHILD40.relative_to(ROOT)),
        ],
        "support_count_with_orientations": len(base),
    }


def main() -> None:
    actual_model_sha = sha(MODEL)
    final = load(FINAL)
    model = load(MODEL)
    if actual_model_sha != MODEL_SHA:
        raise ValueError(f"model SHA mismatch: {actual_model_sha}")
    if final.get("result") != "SAT" or final.get("job_id") != JOB:
        raise ValueError("final custody identity/result mismatch")
    if final.get("model_sha256") != MODEL_SHA or final.get("binding", {}).get("cnf_sha256") != CNF_SHA:
        raise ValueError("final custody model/CNF binding mismatch")
    if model.get("job_id") != JOB or model.get("cnf_sha256") != CNF_SHA or model.get("model", {}).get("result") != "SAT":
        raise ValueError("model custody identity/result mismatch")

    a = assignment(model)
    replay_result = replay(a)
    rows = tuple(
        MetricRow(center, tuple(point for point in range(17) if a[1 + 17 * center + point]), True)
        for center in range(17)
    )
    if {len(row.support) for row in rows} != {4} or any(row.center in row.support for row in rows):
        raise ValueError("decoded rows are not exact-four off-center rows")
    next_centers = [center for center in range(17) if a[290 + center]]
    selected_orders = [index for index in range(2) if a[307 + index]]
    if next_centers != [0] or selected_orders != [1]:
        raise ValueError(f"selector drift: {next_centers=} {selected_orders=}")

    bank, bank_metadata = prior_bank()
    scans = []
    cancellations = []
    for order_index in selected_orders:
        order = ORDER
        formalized = scan_all_formalized_cores(rows, 17, order)
        scans.append({"order_index": order_index, "order": list(order), "record_count": len(formalized), "records": clean(formalized)})
        produced = enumerate_two_kalmanson_cancellations(rows, 17, order)
        by_support = {path_hits(record): record for record in produced}
        minimal = []
        for selected, producer in by_support.items():
            if any(other < selected for other in by_support):
                continue
            if selected in bank:
                relation = "exact-parent-bank-support"
            elif any(previous < selected for previous in bank):
                relation = "strictly-subsumed-by-parent-bank"
            else:
                relation = "new-occurrence-existing-family"
            minimal.append({
                "support": [list(hit) for hit in sorted(selected)],
                "support_size": len(selected),
                "bank_relation": relation,
                "producer": clean(producer),
            })
        minimal.sort(key=lambda item: (item["support_size"], item["support"]))
        cancellations.append({
            "order_index": order_index,
            "order": list(order),
            "producer_record_count": len(produced),
            "distinct_support_count": len(by_support),
            "subset_minimal_count": len(minimal),
            "subset_minimal_size_counts": dict(Counter(x["support_size"] for x in minimal)),
            "bank_exact_count": sum(x["bank_relation"] == "exact-parent-bank-support" for x in minimal),
            "bank_strict_subsumed_count": sum(x["bank_relation"] == "strictly-subsumed-by-parent-bank" for x in minimal),
            "new_occurrence_count": sum(x["bank_relation"] == "new-occurrence-existing-family" for x in minimal),
            "candidates": minimal,
        })

    new_count = sum(x["new_occurrence_count"] for x in cancellations)
    diagnostic = []
    for scan in scans:
        for record in scan["records"]:
            stage = record.get("stage", "")
            if stage != "equality-convex-two-kalmanson-cancellation":
                diagnostic.append({
                    "stage": stage,
                    "orientation": record.get("orientation"),
                    "consumer": record.get("lean_consumer"),
                    "core": record.get("core"),
                    "classification": "diagnostic-only; no general SourceRealization bridge established in this mine",
                })

    output = {
        "schema": "p97-exact17-child41-independent-wave-analysis/v1",
        "status": "PASS",
        "provenance": {
            "job_id": JOB,
            "cnf_sha256": CNF_SHA,
            "model_sha256": MODEL_SHA,
            "final_file_sha256": sha(FINAL),
            "model_file_sha256": actual_model_sha,
            "manifest_sha256": model.get("manifest_sha256"),
        },
        "independent_replay": replay_result,
        "decoded_model": {
            "rows": {str(row.center): list(row.support) for row in rows},
            "next_centers": next_centers,
            "named_order_indices": selected_orders,
            "selected_order": list(ORDER),
        },
        "prior_source_bank": bank_metadata,
        "formalized_core_scans": scans,
        "diagnostic_only": diagnostic,
        "two_kalmanson_occurrences": cancellations,
        "conclusion": {
            "new_source_valid_occurrences": new_count,
            "new_source_valid_occurrence_clauses_if_banked": 4 * new_count,
            "theorem_bank_yield": "existing generic two-Kalmanson cancellation family only",
            "new_general_source_valid_schema": False,
            "exact17_closure": "not closed; Child41 authenticated SAT model survives",
            "next_refinement": "bank only the new minimal two-Kalmanson occurrences if parent-bank comparison is confirmed; no new bridge candidate",
        },
    }
    OUT.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "path": str(OUT),
        "status": output["status"],
        "replay": replay_result,
        "selected_orders": selected_orders,
        "scan_counts": [x["record_count"] for x in scans],
        "cancellation_summary": [{k: x[k] for k in ("producer_record_count", "distinct_support_count", "subset_minimal_count", "bank_exact_count", "bank_strict_subsumed_count", "new_occurrence_count")} for x in cancellations],
        "diagnostic_count": len(diagnostic),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
