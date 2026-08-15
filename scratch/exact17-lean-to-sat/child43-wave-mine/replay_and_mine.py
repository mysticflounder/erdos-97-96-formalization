"""Authenticate, replay, and mine only the finalized Child43 SAT model."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
import tempfile
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[3]
SCRATCH = ROOT / "scratch" / "exact17-lean-to-sat"
HERE = Path(__file__).resolve().parent
OUT = HERE / "child43-analysis.json"
MODEL = SCRATCH / "piqd-child43-core1-custody-model.json"
FINAL = SCRATCH / "piqd-child43-core1-custody-final.json"
CNF = SCRATCH / "exact17-forty-third-root-forty-second-model-refinements.cnf"
CHILD38_LEDGER = SCRATCH / "child38-wave-mine" / "child38-cancellation-bank-ledger.json"
CHILD39 = SCRATCH / "child39-wave-mine" / "child39-analysis.json"
CHILD40 = SCRATCH / "child40-wave-mine" / "child40-analysis.json"
CHILD41 = SCRATCH / "child41-wave-mine" / "child41-analysis.json"
CHILD42 = SCRATCH / "child42-wave-mine" / "child42-analysis.json"

JOB = "9a1a3903-6ba3-4f41-8e74-0d11ee8ba7eb"
CNF_SHA = "dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76"
MODEL_SHA = "5a68926a32d5406ffdea187dc4e4c18330799160a4e8596fc463fcc3160530ce"
FINAL_SHA = "8585ed1a1d997ff16c305514d6640b12ada876ef9cc4d2d737bd596ecb97505b"
CANONICAL_ASSIGNMENT_SHA = "9e613d516c92b818a1b37bfa2c416e448b5e7919169345b6fff954a3325f72c2"
MANIFEST_SHA = "6805434e1cf96526d93d4fc2eb291e1cab9ac6b7cc9417b5010c8f8a1b038171"
IDENTITY = "771e886b591360e2109ea94d7f1940b9e3cedeb7b0b6d448b8da549563f1f1c1"
PROJECT = "erdos-97-96-exact17-child43"
VARS = 308
CLAUSES = 5_848_592
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
CLAUSES_PER_OCCURRENCE = 4

PRIOR_SOURCES = {
    CHILD38_LEDGER: {"sha256": "f5bf704cb1c00d87b8855ece06980a951b739943fd7516746f8c2b4f7df7f32d", "schema": "p97-exact17-child38-six-hit-cancellation-bank/v1", "entries": 28, "clause_count": 112},
    CHILD39: {"sha256": "80d5688d010ed77d074c024fe5b5ee499a8aff4be055347d902f61fd52afb1ba", "schema": "p97-exact17-child39-independent-wave-analysis/v1", "replay": (5_847_388, 308), "new_occurrences": 49, "new_clauses": 196},
    CHILD40: {"sha256": "110ecabb4ec949fe943a1e69e240ff7a2253beb4b37f018c55ea6cb759d95541", "schema": "p97-exact17-child40-independent-wave-analysis/v2", "replay": (5_847_584, 308), "new_occurrences": 84, "new_clauses": 336},
    CHILD41: {"sha256": "f1861dff33d8412e0bd8b4bfec311c7aa0c7d35b088126a0dfc69edd21e6d354", "schema": "p97-exact17-child41-independent-wave-analysis/v1", "replay": (5_847_920, 308), "new_occurrences": 133, "new_clauses": 532},
    CHILD42: {"sha256": "1a93c64bd9b5cbe6d0431b3fd801dba57c515cf1e2423894132dd4d052635c68", "schema": "p97-exact17-child42-independent-wave-analysis/v1", "replay": (5_848_452, 308), "new_occurrences": 35, "new_clauses": 140},
}

spec = importlib.util.spec_from_file_location("child41_miner", SCRATCH / "child41-wave-mine" / "replay_and_mine.py")
if spec is None or spec.loader is None:
    raise RuntimeError("cannot load established Child41 miner")
miner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(miner)
sys.path.insert(0, str(ROOT))
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    project_record_for_lean,
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
        raise ValueError("Child43 custody artifact bytes drifted")
    binding = final.get("binding", {})
    if (
        final.get("schema") != "p97-exact17-child43-piqd-final/v2"
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
    if canonical_assignment_sha(literals) != CANONICAL_ASSIGNMENT_SHA:
        raise ValueError("canonical assignment digest mismatch")
    if (
        model.get("schema") != "p97-exact17-child43-piqd-model/v3"
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


def require_conclusion(payload: dict[str, Any], expected: dict[str, Any]) -> None:
    conclusion = payload.get("conclusion")
    if not isinstance(conclusion, dict):
        raise TypeError("prior analysis has no conclusion")
    for key, value in expected.items():
        if conclusion.get(key) != value:
            raise ValueError(f"prior conclusion drifted: {key}")


def validate_prior_source(path: Path, expected: dict[str, Any]) -> dict[str, Any]:
    if sha(path) != expected["sha256"]:
        raise ValueError(f"prior source bytes drifted: {path}")
    payload = load_strict(path)
    if payload.get("status") != "PASS" or payload.get("schema") != expected["schema"]:
        raise ValueError(f"prior source status/schema drifted: {path}")
    if path == CHILD38_LEDGER:
        if (len(payload.get("entries", [])) != expected["entries"]
                or payload.get("clause_count") != expected["clause_count"]
                or payload.get("record_count") != 28
                or payload.get("forward_record_count") != 597
                or payload.get("reverse_record_count") != 597):
            raise ValueError("Child38 ledger census drifted")
        return payload
    replay = payload.get("independent_replay")
    variables = replay.get("variables", replay.get("assignment_count")) if isinstance(replay, dict) else None
    if (not isinstance(replay, dict) or replay.get("clauses_checked") != expected["replay"][0]
            or variables != expected["replay"][1] or replay.get("satisfies_all") is not True):
        raise ValueError(f"prior replay census drifted: {path}")
    require_conclusion(payload, {"new_source_valid_occurrences": expected["new_occurrences"], "new_source_valid_occurrence_clauses_if_banked": expected["new_clauses"]})
    occurrences = payload.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list) or sum(len(x.get("candidates", [])) for x in occurrences) != expected["new_occurrences"]:
        raise ValueError(f"prior occurrence census drifted: {path}")
    for item in occurrences:
        if item.get("bank_exact_count") != 0 or item.get("bank_strict_subsumed_count") != 0:
            raise ValueError(f"prior bank relation drifted: {path}")
    return payload


def prior_bank_with_child42() -> tuple[set[frozenset[tuple[int, int]]], dict[str, Any]]:
    sources = {path: validate_prior_source(path, expected) for path, expected in PRIOR_SOURCES.items()}
    bank: set[frozenset[tuple[int, int]]] = set()
    for entry in sources[CHILD38_LEDGER]["entries"]:
        bank.add(frozenset(tuple(hit) for hit in entry["hits"]))
        bank.add(frozenset(tuple(hit) for hit in entry["reflected_hits"]))
    for path in (CHILD39, CHILD40, CHILD41, CHILD42):
        for occurrence in sources[path]["two_kalmanson_occurrences"]:
            for candidate in occurrence["candidates"]:
                support = miner.support(candidate)
                bank.add(support)
                bank.add(miner.reflected(support))
    if len(bank) != 632:
        raise ValueError(f"parent support census drifted: {len(bank)}")
    return bank, {"sources": [str(p.relative_to(ROOT)) for p in PRIOR_SOURCES], "source_sha256": {str(p.relative_to(ROOT)): e["sha256"] for p, e in PRIOR_SOURCES.items()}, "support_count_with_orientations": len(bank), "child42_bank_included": True}


def validate_candidate_envelope(candidate: dict[str, Any], hits: frozenset[tuple[int, int]]) -> dict[str, Any]:
    producer = candidate.get("producer")
    if not isinstance(producer, dict) or producer.get("stage") != "equality-convex-two-kalmanson-cancellation":
        raise ValueError("diagnostic/non-Kalmanson record entered accepted candidates")
    if miner.path_hits(producer) != hits:
        raise ValueError("candidate producer support mismatch")
    return producer


def validate_source_pairs(result: dict[str, Any], rows: tuple[Any, ...], bank: set[frozenset[tuple[int, int]]]) -> dict[str, Any]:
    occurrences = result.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list) or len(occurrences) != 1:
        raise ValueError("Child43 must have exactly one selected occurrence scan")
    occurrence = occurrences[0]
    candidates = occurrence.get("candidates", [])
    if occurrence.get("order_index") != 1 or occurrence.get("order") != list(ORDER):
        raise ValueError("selected order drifted")
    reverse_order = tuple(reversed(ORDER))
    reverse_records = miner.enumerate_two_kalmanson_cancellations(rows, 17, reverse_order, max_cores=100_000)
    reverse_by_support = {miner.path_hits(record): record for record in reverse_records}
    seen: set[frozenset[tuple[int, int]]] = set()
    for candidate in candidates:
        hits = miner.support(candidate)
        if not hits or hits in seen or hits in bank or any(previous < hits for previous in bank):
            raise ValueError("accepted support is duplicate or parent-bank related")
        if candidate.get("bank_relation") != "new-occurrence-existing-family":
            raise ValueError("candidate bank relation drifted")
        seen.add(hits)
        producer = validate_candidate_envelope(candidate, hits)
        reverse = reverse_by_support.get(miner.reflected(hits))
        if reverse is None:
            raise ValueError("reflected source producer missing")
        forward_lean = project_record_for_lean(producer, hits, ORDER, rows)
        reverse_lean = project_record_for_lean(reverse, miner.reflected(hits), reverse_order, rows)
        if not lean_occurrence_check(hits, forward_lean, reverse_lean, rows=rows, forward_order=ORDER, reverse_order=reverse_order):
            raise ValueError("paired source producer check failed")
        candidate["classification"] = "SOURCE-VALID; new finite occurrence of the existing generic two-Kalmanson family"
        candidate["source_bridge"] = "sourceAssign_cancellationOccurrenceClause after checked TwoKalmansonCancellationData and selected-hit antecedents"
        candidate["reverse_producer_sha256"] = hashlib.sha256(json.dumps(reverse, sort_keys=True, separators=(",", ":")).encode()).hexdigest()
        candidate["occurrence_clause_count"] = CLAUSES_PER_OCCURRENCE
    if len(seen) != len(candidates):
        raise ValueError("accepted support count drifted")
    diagnostics = result.get("diagnostic_only")
    if not isinstance(diagnostics, list) or any(x.get("stage") == "equality-convex-two-kalmanson-cancellation" for x in diagnostics):
        raise ValueError("diagnostic list contains an accepted-family record")
    return {"schema": "p97-exact17-child43-source-validation/v1", "paired_source_checked": len(seen), "forward_producer_replayed": len(seen), "reflected_producer_replayed": len(seen), "occurrence_clause_orders": 2, "occurrence_clause_directions": 2, "clauses_per_occurrence": CLAUSES_PER_OCCURRENCE, "new_occurrence_clauses": CLAUSES_PER_OCCURRENCE * len(seen), "diagnostic_records_excluded": len(diagnostics)}


def main() -> None:
    final_bytes = FINAL.read_bytes()
    model_bytes = MODEL.read_bytes()
    final_sha = hashlib.sha256(final_bytes).hexdigest()
    model_sha = hashlib.sha256(model_bytes).hexdigest()
    final = load_strict_bytes(final_bytes, str(FINAL))
    model = load_strict_bytes(model_bytes, str(MODEL))
    assignment = validate_custody(final, model, final_sha, model_sha)
    miner.CNF, miner.JOB, miner.CNF_SHA = CNF, JOB, CNF_SHA
    miner.MODEL_SHA, miner.VARS, miner.CLAUSES, miner.ORDER = MODEL_SHA, VARS, CLAUSES, ORDER
    miner.prior_bank = prior_bank_with_child42
    rows = tuple(miner.MetricRow(c, tuple(p for p in range(17) if assignment[1 + 17 * c + p]), True) for c in range(17))
    if {len(row.support) for row in rows} != {4} or any(row.center in row.support for row in rows):
        raise ValueError("decoded rows are not exact-four off-center rows")
    next_centers = [c for c in range(17) if assignment[290 + c]]
    selected_orders = [i for i in range(2) if assignment[307 + i]]
    if next_centers != [0] or selected_orders != [1]:
        raise ValueError(f"selector drift: {next_centers=} {selected_orders=}")
    with tempfile.TemporaryDirectory(dir=HERE, prefix=".child43-custody-snapshot-") as d:
        snap = Path(d)
        miner.MODEL, miner.FINAL = snap / MODEL.name, snap / FINAL.name
        miner.OUT = snap / "child43-analysis.json"
        miner.MODEL.write_bytes(model_bytes)
        miner.FINAL.write_bytes(final_bytes)
        miner.main()
        result = load_strict(miner.OUT)
    bank, metadata = prior_bank_with_child42()
    source_validation = validate_source_pairs(result, rows, bank)
    for record in result["diagnostic_only"]:
        record["classification"] = "DIAGNOSTIC; no source-valid producer bridge established"
        record["source_bridge"] = "requires a new SourceRealization producer/transport theorem"
    result["schema"] = "p97-exact17-child43-independent-wave-analysis/v1"
    result["provenance"].update({"model_file_sha256": model_sha, "canonical_assignment_sha256": CANONICAL_ASSIGNMENT_SHA, "custody_final_sha256": final_sha, "final_file_sha256": final_sha, "manifest_sha256": MANIFEST_SHA, "identity_hash": IDENTITY, "parent_analysis_sha256": {str(p.relative_to(ROOT)): e["sha256"] for p, e in PRIOR_SOURCES.items()}})
    result["prior_source_bank"] = metadata
    result["source_validation"] = source_validation
    result["conclusion"].update({"wave": "Child43", "new_source_valid_occurrences": source_validation["paired_source_checked"], "new_source_valid_occurrence_clauses_if_banked": source_validation["new_occurrence_clauses"], "exact17_closure": "not closed; Child43 authenticated SAT model survives", "source_bridge": "Existing generic TwoKalmansonCancellationData consumer; no new SourceRealization producer bridge identified."})
    OUT.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"path": str(OUT), "status": result["status"], "replay": result["independent_replay"], "prior_bank": metadata, "source_validation": source_validation, "diagnostic_count": len(result["diagnostic_only"])}, sort_keys=True))


if __name__ == "__main__":
    main()
