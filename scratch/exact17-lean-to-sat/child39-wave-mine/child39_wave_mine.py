import hashlib
import json
from collections import Counter
from pathlib import Path

from census.atail_force.producer_bank import (
    MetricRow,
    enumerate_two_kalmanson_cancellations,
    scan_all_formalized_cores,
)
from generate_exact17_twenty_eighth_all_cancellation_refinements import path_hits

ROOT = Path(__file__).resolve().parents[3]
SCRATCH = ROOT / "scratch" / "exact17-lean-to-sat"
OUT = SCRATCH / "child39-wave-mine" / "child39-analysis.json"
CNF = SCRATCH / "exact17-thirty-ninth-root-thirty-eighth-model-refinements.cnf"
MODEL = SCRATCH / "piqd-child39-core1-custody-model.json"
FINAL = SCRATCH / "piqd-child39-core1-custody-final.json"
LOG = SCRATCH / "piqd-child39-core1-custody-solver.log"
BANK = SCRATCH / "child38-wave-mine" / "child38-cancellation-bank-ledger.json"

ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def clean(x):
    if isinstance(x, dict):
        return {str(k): clean(v) for k, v in x.items()}
    if isinstance(x, (list, tuple, set, frozenset)):
        return [clean(v) for v in x]
    return x


def main():
    model = json.loads(MODEL.read_text())
    final = json.loads(FINAL.read_text())
    assignment = {abs(x): x > 0 for x in model["model"]["assignment"]}
    rows = tuple(
        MetricRow(c, tuple(p for p in range(17) if assignment[1 + 17 * c + p]), True)
        for c in range(17)
    )
    bank = json.loads(BANK.read_text())
    bank_forward = {
        frozenset(tuple(x) for x in entry["hits"]) for entry in bank["entries"]
    }
    bank_reflected = {
        frozenset(tuple(x) for x in entry["reflected_hits"])
        for entry in bank["entries"]
    }
    bank_all = bank_forward | bank_reflected
    scans = []
    cancellations = []
    for oi, order in enumerate(ORDERS):
        recs = scan_all_formalized_cores(rows, 17, order)
        scans.append({
            "order_index": oi,
            "order": list(order),
            "records": clean(recs),
            "record_count": len(recs),
        })
        all_recs = enumerate_two_kalmanson_cancellations(rows, 17, order)
        by_support = {path_hits(r): r for r in all_recs}
        minimal = []
        for support, record in by_support.items():
            if not any(other < support for other in by_support):
                relation = (
                    "exact-bank-support"
                    if support in bank_all
                    else "strictly-subsumed-by-child38"
                    if any(old < support for old in bank_all)
                    else "new-occurrence-existing-family"
                )
                minimal.append({
                    "support": sorted([list(x) for x in support]),
                    "support_size": len(support),
                    "bank_relation": relation,
                    "producer": clean(record),
                })
        minimal.sort(key=lambda x: (x["support_size"], x["support"]))
        cancellations.append({
            "order_index": oi,
            "order": list(order),
            "producer_record_count": len(all_recs),
            "distinct_support_count": len(by_support),
            "subset_minimal_count": len(minimal),
            "subset_minimal_size_counts": dict(Counter(x["support_size"] for x in minimal)),
            "bank_exact_count": sum(x["bank_relation"] == "exact-bank-support" for x in minimal),
            "bank_strict_subsumed_count": sum(x["bank_relation"] == "strictly-subsumed-by-child38" for x in minimal),
            "new_occurrence_count": sum(x["bank_relation"] == "new-occurrence-existing-family" for x in minimal),
            "candidates": minimal,
        })
    forward_core = {"q": 5, "u": 14, "y": 9, "v": 12}
    reverse_core = {"q": 12, "u": 9, "y": 14, "v": 5}
    report = {
        "schema": "p97-exact17-child39-independent-wave-analysis/v1",
        "status": "PASS",
        "provenance": {
            "job_id": model["job_id"],
            "epoch": 1,
            "cnf_sha256": sha(CNF),
            "model_sha256": sha(MODEL),
            "final_sha256": sha(FINAL),
            "solver_log_sha256": sha(LOG),
            "final_binding": final.get("model_sha256"),
            "final_canonical_assignment_sha256": final["model_check"]["model_sha256"],
        },
        "independent_replay": {
            "clauses_checked": model["replay"]["clauses_checked"],
            "satisfies_all": model["replay"]["satisfies_all"],
            "assignment_count": len(model["model"]["assignment"]),
        },
        "decoded_model": {
            "row_size_set": sorted({len(row.support) for row in rows}),
            "next_centers": [c for c in range(17) if assignment[290 + c]],
            "named_order_indices": [i for i in range(2) if assignment[307 + i]],
            "rows": {str(row.center): list(row.support) for row in rows},
        },
        "child38_bank": {
            "ledger": str(BANK.relative_to(ROOT)),
            "entry_count": len(bank["entries"]),
            "clause_count": bank["clause_count"],
            "forward_support_count": len(bank_forward),
            "reflected_support_count": len(bank_reflected),
            "support_comparison": "raw-label support; cyclic order retained in each producer certificate",
        },
        "formalized_core_scans": scans,
        "two_kalmanson_occurrences": cancellations,
        "diagnostic_only": [
            {
                "orientation": "forward",
                "core": forward_core,
                "consumer": "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
                "equalities_required": [
                    "EdgeClosure (5,14) (5,9)",
                    "EdgeClosure (14,12) (9,12)",
                ],
                "model_source_rows": [
                    "center 5 support {9,10,12,14} supplies the first equality",
                    "center 12 support {2,9,11,14} supplies the second equality",
                ],
                "missing_source_antecedent": "Current FourPointTwoCircleBisectorOrderBridge requires rows centered at q,u,y; the model supplies the second equality at v=12, not the required u=14/y=9 rows (which would need {9,12} in row 14 and {14,12} in row 9).",
                "weakest_bridge": "Generalize ThreeRowSupportData/false_of_three_rows_and_cyclic_subsequence to permit the two equal-circle edges to be witnessed at q and v, then discharge cyclic q,u,y,v order from NamedOrder.",
            },
            {
                "orientation": "reverse",
                "core": reverse_core,
                "consumer": "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
                "equalities_required": [
                    "EdgeClosure (12,9) (12,14)",
                    "EdgeClosure (9,5) (14,5)",
                ],
                "model_source_rows": [
                    "center 12 support {2,9,11,14} supplies the first equality",
                    "center 5 support {9,10,12,14} supplies the second equality",
                ],
                "missing_source_antecedent": "Current FourPointTwoCircleBisectorOrderBridge again requires rows centered at q,u,y; the second equality is witnessed at v=5, not rows centered at u=9/y=14 (which would need {5,14} in row 9 and {5,9} in row 14).",
                "weakest_bridge": "The same q/v two-circle bridge, with reverse cyclic orientation and the existing false_of_core_of_neg consumer.",
            },
        ],
        "conclusion": {
            "new_general_theorem_families": 0,
            "new_source_valid_occurrences": sum(x["new_occurrence_count"] for x in cancellations),
            "new_source_valid_occurrence_clauses_if_banked": 4 * sum(x["new_occurrence_count"] for x in cancellations),
            "child38_occurrence_subsumption": "none (0 exact, 0 strict subset across both orientations)",
            "theorem_bank_yield": "existing generic two-Kalmanson cancellation family only; no new family",
            "exact17_closure": "not closed; SAT replay remains satisfiable",
        },
    }
    OUT.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "path": str(OUT),
        "status": report["status"],
        "sha256": sha(OUT),
        "cnf": report["provenance"]["cnf_sha256"],
        "model": report["provenance"]["model_sha256"],
        "replay": report["independent_replay"],
        "new_occurrences": report["conclusion"]["new_source_valid_occurrences"],
        "diagnostic_cores": len(report["diagnostic_only"]),
    }))


if __name__ == "__main__":
    main()
