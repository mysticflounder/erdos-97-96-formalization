"""Independently replay and mine the authenticated exact-17 Child40 SAT model."""

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

SCRATCH = ROOT / "scratch/exact17-lean-to-sat"
CNF = SCRATCH / "exact17-thirty-fortieth-root-thirty-ninth-model-refinements.cnf"
MODEL = SCRATCH / "piqd-child40-core1-custody-model.json"
FINAL = SCRATCH / "piqd-child40-core1-custody-final.json"
LOG = SCRATCH / "piqd-child40-core1-custody-solver.log"
MANIFEST = SCRATCH / "piqd-ingress-manifest-thirty-ninth-model-refinements-core1.json"
RECEIPT = SCRATCH / "child40-export-receipt.json"
CHILD39_ANALYSIS = SCRATCH / "child39-wave-mine/child39-analysis.json"
OUT = SCRATCH / "child40-wave-mine/child40-analysis.json"

JOB_ID = "3d2779d0-4962-417d-b62a-a482b20e2772"
IDENTITY = "0ca5dcac481b012dc32cb8b5e483c4883bead4cdc9c628f62271d44227dfc364"
CNF_SHA = "555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034"
MODEL_SHA = "4691c0e416186c830f41e549f79076e1738fd83952d11371b4dc23ad8f7d3df7"
FINAL_SHA = "efc210bbbabf7b6687a220e224ddf68f913fdbd42fd4e3999c53f6a02965169f"
LOG_SHA = "49f215a82137d0d454f8497ba75f2c6ce5542d80de89a37dfa546661fd49241b"
MANIFEST_SHA = "df1c180056ee4c47e1d5ddc645ebda10a0129c9abcb6a41cace6749627469cd8"
RECEIPT_SHA = "28229868ae4aa0906411bad45efbe2b5cdc947d0bead388432aad80847db2516"
CANONICAL_ASSIGNMENT_SHA = (
    "fc2f883132eb9799f6f905b7af32ae3dce30f3516f8d89c85ef682ef2fc05e3a"
)
VARIABLES = 308
CLAUSES = 5_847_584

ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path: Path) -> dict[str, Any]:
    result = json.loads(path.read_text(), object_pairs_hook=reject_duplicate_keys)
    if not isinstance(result, dict):
        raise TypeError(f"expected JSON object in {path}")
    return result


def exact_assignment(model: dict[str, Any]) -> dict[int, bool]:
    literals = model.get("model", {}).get("assignment")
    if not isinstance(literals, list):
        raise TypeError("model assignment is missing")
    result: dict[int, bool] = {}
    for literal in literals:
        if type(literal) is not int or literal == 0 or abs(literal) in result:
            raise ValueError("assignment contains a malformed or duplicate literal")
        result[abs(literal)] = literal > 0
    if set(result) != set(range(1, VARIABLES + 1)):
        raise ValueError("assignment is not total over variables 1..308")
    return result


def replay_dimacs(assignment: dict[int, bool]) -> dict[str, Any]:
    digest = hashlib.sha256()
    header: tuple[int, int] | None = None
    clause_count = 0
    pending: list[int] = []
    with CNF.open("rb") as stream:
        for raw in stream:
            digest.update(raw)
            line = raw.decode("ascii").strip()
            if not line or line.startswith("c"):
                continue
            fields = line.split()
            if fields[0] == "p":
                if header is not None or len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise ValueError("malformed or duplicate DIMACS header")
                header = (int(fields[2]), int(fields[3]))
                continue
            if header is None:
                raise ValueError("clause precedes DIMACS header")
            for token in fields:
                literal = int(token)
                if literal != 0:
                    if abs(literal) > VARIABLES:
                        raise ValueError(f"literal out of range: {literal}")
                    pending.append(literal)
                    continue
                clause_count += 1
                if not pending:
                    raise ValueError(f"empty clause at index {clause_count}")
                if not any(assignment[abs(lit)] == (lit > 0) for lit in pending):
                    raise ValueError(f"assignment falsifies clause {clause_count}")
                pending.clear()
    actual_sha = digest.hexdigest()
    if pending:
        raise ValueError("unterminated final DIMACS clause")
    if header != (VARIABLES, CLAUSES) or clause_count != CLAUSES or actual_sha != CNF_SHA:
        raise ValueError(
            f"DIMACS mismatch: header={header}, clauses={clause_count}, sha256={actual_sha}"
        )
    return {
        "variables": VARIABLES,
        "clauses_checked": clause_count,
        "sha256": actual_sha,
        "satisfies_all": True,
    }


def support_from_json(candidate: dict[str, Any]) -> frozenset[tuple[int, int]]:
    return frozenset((int(hit[0]), int(hit[1])) for hit in candidate["support"])


def child39_bank() -> tuple[int, set[frozenset[tuple[int, int]]]]:
    analysis = load_json(CHILD39_ANALYSIS)
    entries = [
        support_from_json(candidate)
        for order in analysis["two_kalmanson_occurrences"]
        for candidate in order["candidates"]
        if candidate["bank_relation"] == "new-occurrence-existing-family"
    ]
    if len(entries) != 49:
        raise ValueError(f"expected 49 Child39 bank entries, found {len(entries)}")
    base = set(entries)
    return len(base), base | {reflected(support) for support in base}


def clean(value: Any) -> Any:
    if isinstance(value, dict):
        return {str(key): clean(item) for key, item in value.items()}
    if isinstance(value, (list, tuple, set, frozenset)):
        return [clean(item) for item in value]
    return value


def main() -> None:
    expected_hashes = {
        CNF: CNF_SHA,
        MODEL: MODEL_SHA,
        FINAL: FINAL_SHA,
        LOG: LOG_SHA,
        MANIFEST: MANIFEST_SHA,
        RECEIPT: RECEIPT_SHA,
    }
    for path, expected in expected_hashes.items():
        actual = sha256_file(path)
        if actual != expected:
            raise ValueError(f"provenance mismatch for {path}: {actual}")

    model = load_json(MODEL)
    final = load_json(FINAL)
    if (
        model.get("schema") != "p97-exact17-child40-piqd-model/v3"
        or model.get("job_id") != JOB_ID
        or model.get("cnf_sha256") != CNF_SHA
        or model.get("manifest_sha256") != MANIFEST_SHA
        or model.get("completion_identity_hash") != IDENTITY
        or model.get("model", {}).get("result") != "SAT"
        or model.get("model", {}).get("num_assigned") != VARIABLES
    ):
        raise ValueError("Child40 model identity or result drifted")
    if (
        final.get("schema") != "p97-exact17-child40-piqd-final/v2"
        or final.get("job_id") != JOB_ID
        or final.get("result") != "SAT"
        or final.get("model_sha256") != MODEL_SHA
        or final.get("binding", {}).get("cnf_sha256") != CNF_SHA
        or final.get("binding", {}).get("manifest_sha256") != MANIFEST_SHA
        or final.get("model_check", {}).get("model_sha256") != CANONICAL_ASSIGNMENT_SHA
        or final.get("model_check", {}).get("outcome") != "SATISFIED"
        or final.get("model_check", {}).get("num_clauses") != CLAUSES
        or final.get("model_check", {}).get("num_vars") != VARIABLES
    ):
        raise ValueError("Child40 final attestation drifted")

    assignment = exact_assignment(model)
    replay = replay_dimacs(assignment)
    rows = tuple(
        MetricRow(
            center,
            tuple(point for point in range(17) if assignment[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    if {len(row.support) for row in rows} != {4}:
        raise ValueError("decoded selected rows are not all exact fours")
    if any(row.center in row.support for row in rows):
        raise ValueError("decoded selected row contains its center")
    if [center for center in range(17) if assignment[290 + center]] != [15]:
        raise ValueError("decoded next-center choice drifted")
    selected_order_indices = [
        index for index in range(2) if assignment[307 + index]
    ]
    if selected_order_indices != [1]:
        raise ValueError("decoded named-order choice drifted")

    bank_base_count, bank = child39_bank()
    scans: list[dict[str, Any]] = []
    cancellations: list[dict[str, Any]] = []
    # Order-specific metric consequences are guarded by the SAT model's named-order
    # selector.  Mining the inactive branch would manufacture clauses that do not
    # refute this assignment (and can rediscover cuts already present under the
    # opposite guard).
    for order_index in selected_order_indices:
        order = ORDERS[order_index]
        formalized = scan_all_formalized_cores(rows, 17, order)
        scans.append(
            {
                "order_index": order_index,
                "order": list(order),
                "record_count": len(formalized),
                "records": clean(formalized),
            }
        )
        produced = enumerate_two_kalmanson_cancellations(rows, 17, order)
        by_support = {path_hits(record): record for record in produced}
        minimal: list[dict[str, Any]] = []
        for support, record in by_support.items():
            if any(other < support for other in by_support):
                continue
            if support in bank:
                relation = "exact-child39-bank-support"
            elif any(previous < support for previous in bank):
                relation = "strictly-subsumed-by-child39-bank"
            else:
                relation = "new-occurrence-existing-family"
            minimal.append(
                {
                    "support": [list(hit) for hit in sorted(support)],
                    "support_size": len(support),
                    "bank_relation": relation,
                    "producer": clean(record),
                }
            )
        minimal.sort(key=lambda item: (item["support_size"], item["support"]))
        cancellations.append(
            {
                "order_index": order_index,
                "order": list(order),
                "producer_record_count": len(produced),
                "distinct_support_count": len(by_support),
                "subset_minimal_count": len(minimal),
                "subset_minimal_size_counts": dict(
                    Counter(item["support_size"] for item in minimal)
                ),
                "bank_exact_count": sum(
                    item["bank_relation"] == "exact-child39-bank-support"
                    for item in minimal
                ),
                "bank_strict_subsumed_count": sum(
                    item["bank_relation"] == "strictly-subsumed-by-child39-bank"
                    for item in minimal
                ),
                "new_occurrence_count": sum(
                    item["bank_relation"] == "new-occurrence-existing-family"
                    for item in minimal
                ),
                "candidates": minimal,
            }
        )

    new_occurrences = sum(item["new_occurrence_count"] for item in cancellations)
    report = {
        "schema": "p97-exact17-child40-independent-wave-analysis/v2",
        "status": "PASS",
        "provenance": {
            "job_id": JOB_ID,
            "completion_identity_hash": IDENTITY,
            "cnf_sha256": CNF_SHA,
            "model_sha256": MODEL_SHA,
            "final_sha256": FINAL_SHA,
            "solver_log_sha256": LOG_SHA,
            "manifest_sha256": MANIFEST_SHA,
            "canonical_assignment_sha256": CANONICAL_ASSIGNMENT_SHA,
        },
        "independent_replay": replay,
        "decoded_model": {
            "rows": {str(row.center): list(row.support) for row in rows},
            "next_centers": [15],
            "named_order_indices": selected_order_indices,
        },
        "child39_bank": {
            "base_occurrence_count": 49,
            "distinct_base_support_count": bank_base_count,
            "oriented_support_count": len(bank),
            "source": str(CHILD39_ANALYSIS.relative_to(ROOT)),
        },
        "formalized_core_scans": scans,
        "two_kalmanson_occurrences": cancellations,
        "conclusion": {
            "new_source_valid_occurrences": new_occurrences,
            "new_source_valid_occurrence_clauses_if_banked": 4 * new_occurrences,
            "theorem_bank_yield": (
                "existing generic two-Kalmanson cancellation family; inspect "
                "formalized-core records separately for any new source bridge"
            ),
            "exact17_closure": "not closed; authenticated SAT model survives Child40",
        },
    }
    OUT.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "path": str(OUT),
                "sha256": sha256_file(OUT),
                "status": report["status"],
                "replay": replay,
                "formalized_core_counts": [item["record_count"] for item in scans],
                "cancellation_summary": [
                    {
                        key: item[key]
                        for key in (
                            "order_index",
                            "producer_record_count",
                            "distinct_support_count",
                            "subset_minimal_count",
                            "bank_exact_count",
                            "bank_strict_subsumed_count",
                            "new_occurrence_count",
                        )
                    }
                    for item in cancellations
                ],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
