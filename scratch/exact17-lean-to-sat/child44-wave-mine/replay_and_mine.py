# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticate, replay, and mine only the finalized Child44 SAT model."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[3]
SCRATCH = ROOT / "scratch" / "exact17-lean-to-sat"
HERE = Path(__file__).resolve().parent
OUT = HERE / "child44-analysis.json"
CNF = SCRATCH / "exact17-forty-fourth-root-forty-third-model-refinements.cnf"
MODEL = SCRATCH / "piqd-child44-core1-custody-model.json"
FINAL = SCRATCH / "piqd-child44-core1-custody-final.json"
CHILD38_LEDGER = SCRATCH / "child38-wave-mine" / "child38-cancellation-bank-ledger.json"
CHILD39 = SCRATCH / "child39-wave-mine" / "child39-analysis.json"
CHILD40 = SCRATCH / "child40-wave-mine" / "child40-analysis.json"
CHILD41 = SCRATCH / "child41-wave-mine" / "child41-analysis.json"
CHILD42 = SCRATCH / "child42-wave-mine" / "child42-analysis.json"
CHILD43 = SCRATCH / "child43-wave-mine" / "child43-analysis.json"

JOB = "f717c352-2456-412a-ae45-d910f47d3e94"
CNF_SHA = "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
MODEL_SHA = "2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a"
FINAL_SHA = "b16aa0a0440180dc4187167ba0152c22ff47d68325406aa6664ff3a0e7a26efa"
CANONICAL_ASSIGNMENT_SHA = "5436c27196fd618ed7641c940fb56cfb7ee20a4e0f2c777c171da8e7c45af819"
MANIFEST_SHA = "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
IDENTITY = "97825c01cb69aed6c8eceaa6e32ff7ebc0c328dfebe4406ee7dcc204f35c82a2"
PROJECT = "erdos-97-96-exact17-child44"
VARS = 308
CLAUSES = 5_848_820
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
CLAUSES_PER_OCCURRENCE = 4

PRIOR_SOURCES = {
    CHILD38_LEDGER: {"sha256": "f5bf704cb1c00d87b8855ece06980a951b739943fd7516746f8c2b4f7df7f32d", "schema": "p97-exact17-child38-six-hit-cancellation-bank/v1", "entries": 28, "clause_count": 112},
    CHILD39: {"sha256": "80d5688d010ed77d074c024fe5b5ee499a8aff4be055347d902f61fd52afb1ba", "schema": "p97-exact17-child39-independent-wave-analysis/v1", "replay": (5_847_388, 308), "new_occurrences": 49, "new_clauses": 196},
    CHILD40: {"sha256": "110ecabb4ec949fe943a1e69e240ff7a2253beb4b37f018c55ea6cb759d95541", "schema": "p97-exact17-child40-independent-wave-analysis/v2", "replay": (5_847_584, 308), "new_occurrences": 84, "new_clauses": 336},
    CHILD41: {"sha256": "f1861dff33d8412e0bd8b4bfec311c7aa0c7d35b088126a0dfc69edd21e6d354", "schema": "p97-exact17-child41-independent-wave-analysis/v1", "replay": (5_847_920, 308), "new_occurrences": 133, "new_clauses": 532},
    CHILD42: {"sha256": "1a93c64bd9b5cbe6d0431b3fd801dba57c515cf1e2423894132dd4d052635c68", "schema": "p97-exact17-child42-independent-wave-analysis/v1", "replay": (5_848_452, 308), "new_occurrences": 35, "new_clauses": 140},
    CHILD43: {"sha256": "c3ed03bc91979563804328675784be47dab81271daf7eeb7c6d5f07e59cd156e", "schema": "p97-exact17-child43-independent-wave-analysis/v1", "replay": (5_848_592, 308), "new_occurrences": 57, "new_clauses": 228},
}

spec = importlib.util.spec_from_file_location("child41_miner", SCRATCH / "child41-wave-mine" / "replay_and_mine.py")
if spec is None or spec.loader is None:
    raise RuntimeError("cannot load established Child41 miner")
miner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(miner)
sys.path.insert(0, str(ROOT))
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    path_hits,
    project_record_for_lean,
    reflected,
)


def sha(path: Path) -> str:
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


def load_strict_bytes(raw: bytes, source: str) -> dict[str, Any]:
    value = json.loads(raw, object_pairs_hook=reject_duplicate_keys)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {source}")
    return value


def load_strict(path: Path) -> dict[str, Any]:
    return load_strict_bytes(path.read_bytes(), str(path))


def clean(value: Any) -> Any:
    if isinstance(value, dict):
        return {str(key): clean(item) for key, item in value.items()}
    if isinstance(value, (tuple, set, frozenset)):
        return [clean(item) for item in value]
    if isinstance(value, list):
        return [clean(item) for item in value]
    return value


def canonical_assignment_sha(literals: list[int]) -> str:
    return hashlib.sha256(" ".join(str(x) for x in literals).encode()).hexdigest()


def exact_assignment(model: dict[str, Any]) -> dict[int, bool]:
    literals = model.get("model", {}).get("assignment")
    if type(literals) is not list or len(literals) != VARS:
        raise ValueError("assignment must be exactly 308 literals")
    result: dict[int, bool] = {}
    for literal in literals:
        if type(literal) is not int or literal == 0 or abs(literal) > VARS:
            raise ValueError("malformed assignment literal")
        if abs(literal) in result:
            raise ValueError("assignment contains duplicate variable")
        result[abs(literal)] = literal > 0
    if set(result) != set(range(1, VARS + 1)):
        raise ValueError("assignment is not total")
    return result


def validate_custody(final: dict[str, Any], model: dict[str, Any], final_sha: str, model_sha: str) -> dict[int, bool]:
    if final_sha != FINAL_SHA or model_sha != MODEL_SHA:
        raise ValueError("Child44 custody artifact bytes drifted")
    binding = final.get("binding", {})
    if (
        final.get("schema") != "p97-exact17-child44-piqd-final/v2"
        or final.get("result") != "SAT" or final.get("job_id") != JOB
        or final.get("model_sha256") != MODEL_SHA
        or binding.get("cnf_sha256") != CNF_SHA
        or binding.get("manifest_sha256") != MANIFEST_SHA
        or binding.get("identity_hash") != IDENTITY
        or binding.get("project") != PROJECT
        or binding.get("backend") != "cadical"
        or binding.get("solver_profile") != "sat"
        or binding.get("timeout_s") != 3600
        or binding.get("march_timeout_s") != 900
        or binding.get("requested_core_limit") != 1
    ):
        raise ValueError("final custody binding drifted")
    status = final.get("completion_status", {})
    if (
        status.get("id") != JOB or status.get("result") != "SAT"
        or status.get("status") != "completed" or status.get("run_epoch") != 1
        or status.get("cnf_blob_hash") != CNF_SHA
        or status.get("producer_manifest_hash") != MANIFEST_SHA
        or status.get("identity_hash") != IDENTITY
        or status.get("recovery_action") is not None
    ):
        raise ValueError("completion identity drifted")
    checked = final.get("model_check", {})
    if (
        checked.get("job_id") != JOB or checked.get("project") != PROJECT
        or checked.get("job_completed_at") != status.get("completed_at")
        or checked.get("cnf_blob_hash") != CNF_SHA
        or checked.get("model_sha256") != CANONICAL_ASSIGNMENT_SHA
        or checked.get("num_assigned") != VARS or checked.get("num_vars") != VARS
        or checked.get("num_clauses") != CLAUSES or checked.get("outcome") != "SATISFIED"
    ):
        raise ValueError("model-check attestation drifted")
    if final.get("model_replay") != {"clauses_checked": CLAUSES, "satisfies_all": True}:
        raise ValueError("terminal replay attestation drifted")
    literals = model.get("model", {}).get("assignment")
    if not isinstance(literals, list) or canonical_assignment_sha(literals) != CANONICAL_ASSIGNMENT_SHA:
        raise ValueError("canonical assignment digest mismatch")
    if (
        model.get("schema") != "p97-exact17-child44-piqd-model/v3"
        or model.get("job_id") != JOB or model.get("cnf_sha256") != CNF_SHA
        or model.get("manifest_sha256") != MANIFEST_SHA
        or model.get("completion_identity_hash") != IDENTITY
        or model.get("model", {}).get("result") != "SAT"
        or model.get("model", {}).get("backend") != "cadical"
        or model.get("model", {}).get("solver_profile") != "sat"
        or model.get("model", {}).get("num_assigned") != VARS
    ):
        raise ValueError("model custody identity drifted")
    return exact_assignment(model)


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
                literal = int(token)
                if literal:
                    pending.append(literal)
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


def validate_prior_source(path: Path, expected: dict[str, Any]) -> dict[str, Any]:
    if sha(path) != expected["sha256"]:
        raise ValueError(f"prior source bytes drifted: {path}")
    payload = load_strict(path)
    if payload.get("status") != "PASS" or payload.get("schema") != expected["schema"]:
        raise ValueError(f"prior source status/schema drifted: {path}")
    if path == CHILD38_LEDGER:
        if (len(payload.get("entries", [])) != expected["entries"]
                or payload.get("clause_count") != expected["clause_count"]
                or payload.get("record_count") != 28):
            raise ValueError("Child38 ledger census drifted")
        return payload
    replay_data = payload.get("independent_replay")
    variables = replay_data.get("variables", replay_data.get("assignment_count")) if isinstance(replay_data, dict) else None
    if (not isinstance(replay_data, dict)
            or replay_data.get("clauses_checked") != expected["replay"][0]
            or variables != expected["replay"][1]
            or replay_data.get("satisfies_all") is not True):
        raise ValueError(f"prior replay census drifted: {path}")
    conclusion = payload.get("conclusion", {})
    if (conclusion.get("new_source_valid_occurrences") != expected["new_occurrences"]
            or conclusion.get("new_source_valid_occurrence_clauses_if_banked") != expected["new_clauses"]):
        raise ValueError(f"prior conclusion drifted: {path}")
    occurrences = payload.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list) or sum(len(x.get("candidates", [])) for x in occurrences) != expected["new_occurrences"]:
        raise ValueError(f"prior occurrence census drifted: {path}")
    return payload


def prior_bank() -> tuple[set[frozenset[tuple[int, int]]], dict[str, Any]]:
    sources = {path: validate_prior_source(path, expected) for path, expected in PRIOR_SOURCES.items()}
    bank: set[frozenset[tuple[int, int]]] = set()
    for entry in sources[CHILD38_LEDGER]["entries"]:
        bank.add(frozenset(tuple(hit) for hit in entry["hits"]))
        bank.add(frozenset(tuple(hit) for hit in entry["reflected_hits"]))
    for path in (CHILD39, CHILD40, CHILD41, CHILD42, CHILD43):
        for occurrence in sources[path]["two_kalmanson_occurrences"]:
            for candidate in occurrence["candidates"]:
                hits = support(candidate)
                bank.add(hits)
                bank.add(reflected(hits))
    return bank, {
        "sources": [str(path.relative_to(ROOT)) for path in PRIOR_SOURCES],
        "source_sha256": {str(path.relative_to(ROOT)): expected["sha256"] for path, expected in PRIOR_SOURCES.items()},
        "support_count_with_orientations": len(bank),
        "child43_bank_included": True,
    }


def validate_candidate_envelope(candidate: dict[str, Any], hits: frozenset[tuple[int, int]]) -> dict[str, Any]:
    producer = candidate.get("producer")
    if not isinstance(producer, dict) or producer.get("stage") != "equality-convex-two-kalmanson-cancellation":
        raise ValueError("diagnostic/non-Kalmanson record entered accepted candidates")
    if path_hits(producer) != hits:
        raise ValueError("candidate producer support mismatch")
    return producer


def source_check(result: dict[str, Any], rows: tuple[Any, ...], bank: set[frozenset[tuple[int, int]]]) -> dict[str, Any]:
    occurrences = result.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list) or len(occurrences) != 1:
        raise ValueError("Child44 must have exactly one selected occurrence scan")
    occurrence = occurrences[0]
    if occurrence.get("order_index") != 1 or occurrence.get("order") != list(ORDER):
        raise ValueError("selected order drifted")
    candidates = occurrence.get("candidates", [])
    accepted = [item for item in candidates if item.get("bank_relation") == "new-occurrence-existing-family"]
    reverse_order = tuple(reversed(ORDER))
    reverse_records = miner.enumerate_two_kalmanson_cancellations(rows, 17, reverse_order, max_cores=100_000)
    reverse_by_support = {path_hits(record): record for record in reverse_records}
    seen: set[frozenset[tuple[int, int]]] = set()
    for candidate in accepted:
        hits = support(candidate)
        if not hits or hits in seen or hits in bank or any(previous < hits for previous in bank):
            raise ValueError("accepted support is duplicate or parent-bank related")
        seen.add(hits)
        producer = validate_candidate_envelope(candidate, hits)
        reverse = reverse_by_support.get(reflected(hits))
        if reverse is None:
            raise ValueError("reflected source producer missing")
        forward_lean = project_record_for_lean(producer, hits, ORDER, rows)
        reverse_lean = project_record_for_lean(reverse, reflected(hits), reverse_order, rows)
        if not lean_occurrence_check(hits, forward_lean, reverse_lean, rows=rows, forward_order=ORDER, reverse_order=reverse_order):
            raise ValueError("paired source producer check failed")
        candidate["classification"] = "SOURCE-VALID; new finite occurrence of the existing generic two-Kalmanson family"
        candidate["source_bridge"] = "sourceAssign_cancellationOccurrenceClause after checked TwoKalmansonCancellationData and selected-hit antecedents"
        candidate["reverse_producer_sha256"] = hashlib.sha256(json.dumps(reverse, sort_keys=True, separators=(",", ":")).encode()).hexdigest()
        candidate["occurrence_clause_count"] = CLAUSES_PER_OCCURRENCE
    diagnostics = result.get("diagnostic_only")
    if not isinstance(diagnostics, list) or any(item.get("stage") == "equality-convex-two-kalmanson-cancellation" for item in diagnostics):
        raise ValueError("diagnostic list contains an accepted-family record")
    return {
        "schema": "p97-exact17-child44-source-validation/v1",
        "paired_source_checked": len(seen),
        "forward_producer_replayed": len(seen),
        "reflected_producer_replayed": len(seen),
        "occurrence_clause_orders": 2,
        "occurrence_clause_directions": 2,
        "clauses_per_occurrence": CLAUSES_PER_OCCURRENCE,
        "new_occurrence_clauses": CLAUSES_PER_OCCURRENCE * len(seen),
        "diagnostic_records_excluded": len(diagnostics),
        "minimal_exact_parent_count": sum(item.get("bank_relation") == "exact-parent-bank-support" for item in candidates),
        "minimal_strict_subsumed_count": sum(item.get("bank_relation") == "strictly-subsumed-by-parent-bank" for item in candidates),
    }


def main() -> None:
    final_bytes = FINAL.read_bytes()
    model_bytes = MODEL.read_bytes()
    final_sha = hashlib.sha256(final_bytes).hexdigest()
    model_sha = hashlib.sha256(model_bytes).hexdigest()
    final = load_strict_bytes(final_bytes, str(FINAL))
    model = load_strict_bytes(model_bytes, str(MODEL))
    assignment = validate_custody(final, model, final_sha, model_sha)
    replay_result = replay(assignment)
    rows = tuple(miner.MetricRow(center, tuple(point for point in range(17) if assignment[1 + 17 * center + point]), True) for center in range(17))
    if {len(row.support) for row in rows} != {4} or any(row.center in row.support for row in rows):
        raise ValueError("decoded rows are not exact-four off-center rows")
    next_centers = [center for center in range(17) if assignment[290 + center]]
    selected_orders = [index for index in range(2) if assignment[307 + index]]
    if next_centers != [15] or selected_orders != [1]:
        raise ValueError(f"selector drift: {next_centers=} {selected_orders=}")
    bank, bank_metadata = prior_bank()
    formalized = miner.scan_all_formalized_cores(rows, 17, ORDER)
    produced = miner.enumerate_two_kalmanson_cancellations(rows, 17, ORDER, max_cores=100_000)
    by_support = {path_hits(record): record for record in produced}
    minimal = []
    for hits, producer in by_support.items():
        if any(other < hits for other in by_support):
            continue
        if hits in bank:
            relation = "exact-parent-bank-support"
        elif any(previous < hits for previous in bank):
            relation = "strictly-subsumed-by-parent-bank"
        else:
            relation = "new-occurrence-existing-family"
        minimal.append({"support": [list(hit) for hit in sorted(hits)], "support_size": len(hits), "bank_relation": relation, "producer": clean(producer)})
    minimal.sort(key=lambda item: (item["support_size"], item["support"]))
    diagnostics = []
    for record in formalized:
        if record.get("stage") != "equality-convex-two-kalmanson-cancellation":
            diagnostics.append({"stage": record.get("stage"), "orientation": record.get("orientation"), "consumer": record.get("lean_consumer"), "core": record.get("core"), "classification": "DIAGNOSTIC; no SourceRealization bridge admitted"})
    output = {
        "schema": "p97-exact17-child44-independent-wave-analysis/v1",
        "status": "PASS",
        "provenance": {"job_id": JOB, "cnf_sha256": CNF_SHA, "model_file_sha256": model_sha, "custody_final_sha256": final_sha, "canonical_assignment_sha256": CANONICAL_ASSIGNMENT_SHA, "manifest_sha256": MANIFEST_SHA, "identity_hash": IDENTITY, "parent_analysis_sha256": {str(path.relative_to(ROOT)): expected["sha256"] for path, expected in PRIOR_SOURCES.items()}},
        "independent_replay": replay_result,
        "decoded_model": {"rows": {str(row.center): list(row.support) for row in rows}, "next_centers": next_centers, "named_order_indices": selected_orders, "selected_order": list(ORDER)},
        "prior_source_bank": bank_metadata,
        "formalized_core_scans": [{"order_index": 1, "order": list(ORDER), "record_count": len(formalized), "records": clean(formalized)}],
        "diagnostic_only": diagnostics,
        "two_kalmanson_occurrences": [{"order_index": 1, "order": list(ORDER), "producer_record_count": len(produced), "distinct_support_count": len(by_support), "subset_minimal_count": len(minimal), "subset_minimal_size_counts": dict(Counter(item["support_size"] for item in minimal)), "bank_exact_count": sum(item["bank_relation"] == "exact-parent-bank-support" for item in minimal), "bank_strict_subsumed_count": sum(item["bank_relation"] == "strictly-subsumed-by-parent-bank" for item in minimal), "new_occurrence_count": sum(item["bank_relation"] == "new-occurrence-existing-family" for item in minimal), "candidates": minimal}],
        "conclusion": {"new_source_valid_occurrences": sum(item["bank_relation"] == "new-occurrence-existing-family" for item in minimal), "new_source_valid_occurrence_clauses_if_banked": CLAUSES_PER_OCCURRENCE * sum(item["bank_relation"] == "new-occurrence-existing-family" for item in minimal), "theorem_bank_yield": "existing generic two-Kalmanson cancellation family only", "new_general_source_valid_schema": False, "exact17_closure": "not closed; Child44 authenticated SAT model survives", "next_refinement": "do not create Child45; Child44 adds no new theorem family and requires finite-orbit coverage analysis"},
    }
    output["source_validation"] = source_check(output, rows, bank)
    OUT.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"path": str(OUT), "status": output["status"], "replay": replay_result, "selected_orders": selected_orders, "next_centers": next_centers, "scan_count": len(formalized), "cancellation_summary": {key: output["two_kalmanson_occurrences"][0][key] for key in ("producer_record_count", "distinct_support_count", "subset_minimal_count", "bank_exact_count", "bank_strict_subsumed_count", "new_occurrence_count")}, "source_validation": output["source_validation"], "diagnostic_count": len(diagnostics)}, sort_keys=True))


if __name__ == "__main__":
    main()
