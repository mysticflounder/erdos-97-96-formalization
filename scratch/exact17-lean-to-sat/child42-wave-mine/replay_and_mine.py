"""Authenticate, replay, and mine only the finalized Child42 SAT model.

The established Child41 miner supplies the producer-bank mechanics.  This
wrapper owns the Child42 custody checks, authenticates every parent analysis
by immutable bytes, and independently checks both orientations of every
accepted occurrence before publishing the derived JSON.
"""

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
OUT = HERE / "child42-analysis.json"
MODEL = SCRATCH / "piqd-child42-core1-custody-model.json"
FINAL = SCRATCH / "piqd-child42-core1-custody-final.json"
CNF = SCRATCH / "exact17-forty-second-root-forty-first-model-refinements.cnf"
CHILD38_LEDGER = SCRATCH / "child38-wave-mine" / "child38-cancellation-bank-ledger.json"
CHILD39 = SCRATCH / "child39-wave-mine" / "child39-analysis.json"
CHILD40 = SCRATCH / "child40-wave-mine" / "child40-analysis.json"
CHILD41 = SCRATCH / "child41-wave-mine" / "child41-analysis.json"

JOB = "283f5c21-de62-4318-8a11-bcb4632a5f76"
CNF_SHA = "375b7bc42381175119545627ab55c6bacb285fa35e4486f0b11193300620921f"
MODEL_SHA = "9df868b2160c2e3b1f37cee35212c4cc405f63b3ad2f8671eacd2b6b52419bad"
FINAL_SHA = "53e6f847c1541840e9cbb2c2503d49553a0e8a90489afae6ea99770c55159e45"
CANONICAL_ASSIGNMENT_SHA = "21f8b5732e8d31d711ad61bfa95b2cf6d3b9fed51767a879a1a145d321f2a105"
MANIFEST_SHA = "8df92c533959f8717b2d897756d5c668e95f6adf9bb7bdca6eb5d8ee7ef758e4"
IDENTITY = "fc27757e8567b5a9de8d6db316010716548122283a00aeb690298a0737cc5599"
PROJECT = "erdos-97-96-exact17-child42"
VARS = 308
CLAUSES = 5_848_452
ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
CLAUSES_PER_OCCURRENCE = 2 * 2

PRIOR_SOURCES = {
    CHILD38_LEDGER: {
        "sha256": "f5bf704cb1c00d87b8855ece06980a951b739943fd7516746f8c2b4f7df7f32d",
        "schema": "p97-exact17-child38-six-hit-cancellation-bank/v1",
        "entries": 28,
        "clause_count": 112,
    },
    CHILD39: {
        "sha256": "80d5688d010ed77d074c024fe5b5ee499a8aff4be055347d902f61fd52afb1ba",
        "schema": "p97-exact17-child39-independent-wave-analysis/v1",
        "replay": (5_847_388, 308),
        "new_occurrences": 49,
        "new_clauses": 196,
    },
    CHILD40: {
        "sha256": "110ecabb4ec949fe943a1e69e240ff7a2253beb4b37f018c55ea6cb759d95541",
        "schema": "p97-exact17-child40-independent-wave-analysis/v2",
        "replay": (5_847_584, 308),
        "new_occurrences": 84,
        "new_clauses": 336,
    },
    CHILD41: {
        "sha256": "f1861dff33d8412e0bd8b4bfec311c7aa0c7d35b088126a0dfc69edd21e6d354",
        "schema": "p97-exact17-child41-independent-wave-analysis/v1",
        "replay": (5_847_920, 308),
        "new_occurrences": 133,
        "new_clauses": 532,
    },
}

spec = importlib.util.spec_from_file_location(
    "child41_miner", SCRATCH / "child41-wave-mine" / "replay_and_mine.py"
)
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


def load_strict_bytes(raw: bytes, *, source: str) -> dict[str, Any]:
    value = json.loads(raw, object_pairs_hook=reject_duplicate_keys)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {source}")
    return value


def load_strict(path: Path) -> dict[str, Any]:
    return load_strict_bytes(path.read_bytes(), source=str(path))


def canonical_assignment_sha(literals: list[int]) -> str:
    return hashlib.sha256(" ".join(str(literal) for literal in literals).encode()).hexdigest()


def exact_assignment(model: dict[str, Any]) -> dict[int, bool]:
    literals = model.get("model", {}).get("assignment")
    if type(literals) is not list or len(literals) != VARS:
        raise ValueError("assignment must be exactly 308 literals")
    result: dict[int, bool] = {}
    for literal in literals:
        if type(literal) is not int or literal == 0 or abs(literal) > VARS:
            raise ValueError("assignment contains a malformed or out-of-range literal")
        if abs(literal) in result:
            raise ValueError("assignment contains a duplicate/conflicting variable")
        result[abs(literal)] = literal > 0
    if set(result) != set(range(1, VARS + 1)):
        raise ValueError("assignment is not total over variables 1..308")
    return result


def validate_custody(
    final: dict[str, Any],
    model: dict[str, Any],
    actual_final_sha: str,
    actual_model_sha: str,
) -> dict[int, bool]:
    if actual_final_sha != FINAL_SHA or actual_model_sha != MODEL_SHA:
        raise ValueError("Child42 custody artifact bytes drifted")
    binding = final.get("binding")
    if (
        final.get("schema") != "p97-exact17-child42-piqd-final/v2"
        or final.get("result") != "SAT"
        or final.get("job_id") != JOB
        or final.get("model_sha256") != MODEL_SHA
        or not isinstance(binding, dict)
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
    if (
        model.get("schema") != "p97-exact17-child42-piqd-model/v3"
        or model.get("job_id") != JOB
        or model.get("cnf_sha256") != CNF_SHA
        or model.get("manifest_sha256") != MANIFEST_SHA
        or model.get("completion_identity_hash") != IDENTITY
        or model.get("model", {}).get("result") != "SAT"
        or model.get("model", {}).get("backend") != "cadical"
        or model.get("model", {}).get("solver_profile") != "sat"
        or model.get("model", {}).get("num_assigned") != VARS
    ):
        raise ValueError("model custody identity/result drifted")
    status = final.get("completion_status")
    if (
        not isinstance(status, dict)
        or status.get("id") != JOB
        or status.get("result") != "SAT"
        or status.get("status") != "completed"
        or status.get("run_epoch") != 1
        or status.get("cnf_blob_hash") != CNF_SHA
        or status.get("producer_manifest_hash") != MANIFEST_SHA
        or status.get("identity_hash") != IDENTITY
        or status.get("recovery_action") is not None
    ):
        raise ValueError("terminal completion identity/epoch drifted")
    checked = final.get("model_check")
    if (
        not isinstance(checked, dict)
        or checked.get("job_id") != JOB
        or checked.get("project") != PROJECT
        or checked.get("job_completed_at") != status.get("completed_at")
        or checked.get("cnf_blob_hash") != CNF_SHA
        or checked.get("model_sha256") != CANONICAL_ASSIGNMENT_SHA
        or checked.get("num_assigned") != VARS
        or checked.get("num_vars") != VARS
        or checked.get("num_clauses") != CLAUSES
        or checked.get("outcome") != "SATISFIED"
    ):
        raise ValueError("model-check attestation drifted")
    replay = final.get("model_replay")
    if replay != {"clauses_checked": CLAUSES, "satisfies_all": True}:
        raise ValueError("terminal replay attestation drifted")
    literals = model["model"]["assignment"]
    if canonical_assignment_sha(literals) != CANONICAL_ASSIGNMENT_SHA:
        raise ValueError("canonical assignment digest mismatch")
    return exact_assignment(model)


def _require_conclusion(payload: dict[str, Any], expected: dict[str, Any]) -> None:
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
        if (
            len(payload.get("entries", [])) != expected["entries"]
            or payload.get("clause_count") != expected["clause_count"]
            or payload.get("record_count") != 28
            or payload.get("forward_record_count") != 597
            or payload.get("reverse_record_count") != 597
        ):
            raise ValueError("Child38 ledger census drifted")
        return payload
    replay = payload.get("independent_replay")
    replay_variables = replay.get("variables", replay.get("assignment_count")) if isinstance(replay, dict) else None
    if (
        not isinstance(replay, dict)
        or replay.get("clauses_checked") != expected["replay"][0]
        or replay_variables != expected["replay"][1]
        or replay.get("satisfies_all") is not True
    ):
        raise ValueError(f"prior replay census drifted: {path}")
    _require_conclusion(payload, {
        "new_source_valid_occurrences": expected["new_occurrences"],
        "new_source_valid_occurrence_clauses_if_banked": expected["new_clauses"],
    })
    occurrences = payload.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list) or sum(len(item.get("candidates", [])) for item in occurrences) != expected["new_occurrences"]:
        raise ValueError(f"prior occurrence census drifted: {path}")
    for item in occurrences:
        if item.get("bank_exact_count") != 0 or item.get("bank_strict_subsumed_count") != 0:
            raise ValueError(f"prior bank relation drifted: {path}")
    return payload


def prior_bank_with_child41() -> tuple[set[frozenset[tuple[int, int]]], dict[str, Any]]:
    sources = {path: validate_prior_source(path, expected) for path, expected in PRIOR_SOURCES.items()}
    base: set[frozenset[tuple[int, int]]] = set()
    ledger = sources[CHILD38_LEDGER]
    for entry in ledger["entries"]:
        base.add(frozenset(tuple(hit) for hit in entry["hits"]))
        base.add(frozenset(tuple(hit) for hit in entry["reflected_hits"]))
    for path in (CHILD39, CHILD40, CHILD41):
        for occurrence in sources[path]["two_kalmanson_occurrences"]:
            for candidate in occurrence["candidates"]:
                item = miner.support(candidate)
                base.add(item)
                base.add(miner.reflected(item))
    if len(base) != 562:
        raise ValueError(f"parent support census drifted: {len(base)}")
    return base, {
        "sources": [str(path.relative_to(ROOT)) for path in PRIOR_SOURCES],
        "source_sha256": {str(path.relative_to(ROOT)): expected["sha256"] for path, expected in PRIOR_SOURCES.items()},
        "support_count_with_orientations": len(base),
        "child41_bank_included": True,
    }


def validate_source_pairs(
    result: dict[str, Any], rows: tuple[Any, ...], bank: set[frozenset[tuple[int, int]]]
) -> dict[str, Any]:
    occurrences = result.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list) or len(occurrences) != 1:
        raise ValueError("Child42 must have exactly one selected occurrence scan")
    occurrence = occurrences[0]
    if (
        occurrence.get("producer_record_count") != 83
        or occurrence.get("distinct_support_count") != 45
        or occurrence.get("subset_minimal_count") != 35
        or occurrence.get("bank_exact_count") != 0
        or occurrence.get("bank_strict_subsumed_count") != 0
        or occurrence.get("new_occurrence_count") != 35
        or len(occurrence.get("candidates", [])) != 35
    ):
        raise ValueError("Child42 occurrence census or parent relation drifted")
    forward_order = ORDER
    reverse_order = tuple(reversed(ORDER))
    reverse_records = miner.enumerate_two_kalmanson_cancellations(rows, 17, reverse_order, max_cores=100_000)
    reverse_by_support = {miner.path_hits(record): record for record in reverse_records}
    seen: set[frozenset[tuple[int, int]]] = set()
    for candidate in occurrence["candidates"]:
        hits = miner.support(candidate)
        if (
            not hits
            or hits in seen
            or hits in bank
            or any(previous < hits for previous in bank)
            or candidate.get("bank_relation") != "new-occurrence-existing-family"
        ):
            raise ValueError("accepted support is duplicate or parent-bank related")
        seen.add(hits)
        producer = validate_candidate_envelope(candidate, hits)
        reverse = reverse_by_support.get(miner.reflected(hits))
        if reverse is None:
            raise ValueError("paired forward/reflected source producer check failed")
        forward_lean = project_record_for_lean(producer, hits, forward_order, rows)
        reverse_lean = project_record_for_lean(
            reverse, miner.reflected(hits), reverse_order, rows
        )
        if not lean_occurrence_check(
            hits,
            forward_lean,
            reverse_lean,
            rows=rows,
            forward_order=forward_order,
            reverse_order=reverse_order,
        ):
            raise ValueError("paired forward/reflected source producer check failed")
        candidate["classification"] = "SOURCE-VALID; new finite occurrence of the existing generic two-Kalmanson family"
        candidate["source_bridge"] = "sourceAssign_cancellationOccurrenceClause after checked TwoKalmansonCancellationData and selected-hit antecedents"
        candidate["reverse_producer_sha256"] = hashlib.sha256(json.dumps(reverse, sort_keys=True, separators=(",", ":")).encode()).hexdigest()
        candidate["occurrence_clause_count"] = CLAUSES_PER_OCCURRENCE
    if len(seen) != 35:
        raise ValueError("accepted support count drifted")
    diagnostics = result.get("diagnostic_only")
    if not isinstance(diagnostics, list) or any(
        record.get("stage") == "equality-convex-two-kalmanson-cancellation" for record in diagnostics
    ):
        raise ValueError("diagnostic list contains an accepted-family record")
    return {
        "schema": "p97-exact17-child42-source-validation/v1",
        "paired_source_checked": len(seen),
        "forward_producer_replayed": len(seen),
        "reflected_producer_replayed": len(seen),
        "occurrence_clause_orders": 2,
        "occurrence_clause_directions": 2,
        "clauses_per_occurrence": CLAUSES_PER_OCCURRENCE,
        "new_occurrence_clauses": CLAUSES_PER_OCCURRENCE * len(seen),
        "diagnostic_records_excluded": len(diagnostics),
    }


def validate_candidate_envelope(
    candidate: dict[str, Any], hits: frozenset[tuple[int, int]]
) -> dict[str, Any]:
    producer = candidate.get("producer")
    if (
        not isinstance(producer, dict)
        or producer.get("stage") != "equality-convex-two-kalmanson-cancellation"
    ):
        raise ValueError("diagnostic/non-Kalmanson record entered accepted candidates")
    if miner.path_hits(producer) != hits:
        raise ValueError("candidate producer support mismatch")
    return producer


def main() -> None:
    # Authenticate and parse the exact same bytes.  The established Child41
    # miner is then pointed at immutable snapshots of those bytes, so a path
    # replacement cannot make its replay consume a different custody object.
    final_bytes = FINAL.read_bytes()
    model_bytes = MODEL.read_bytes()
    actual_final_sha = hashlib.sha256(final_bytes).hexdigest()
    actual_model_sha = hashlib.sha256(model_bytes).hexdigest()
    final = load_strict_bytes(final_bytes, source=str(FINAL))
    model = load_strict_bytes(model_bytes, source=str(MODEL))
    assignment = validate_custody(
        final, model, actual_final_sha, actual_model_sha
    )

    miner.CNF = CNF
    miner.JOB = JOB
    miner.CNF_SHA = CNF_SHA
    miner.MODEL_SHA = MODEL_SHA
    miner.VARS = VARS
    miner.CLAUSES = CLAUSES
    miner.ORDER = ORDER
    miner.prior_bank = prior_bank_with_child41

    rows = tuple(
        miner.MetricRow(center, tuple(point for point in range(17) if assignment[1 + 17 * center + point]), True)
        for center in range(17)
    )
    if {len(row.support) for row in rows} != {4} or any(row.center in row.support for row in rows):
        raise ValueError("decoded rows are not exact-four off-center rows")
    next_centers = [center for center in range(17) if assignment[290 + center]]
    selected_orders = [index for index in range(2) if assignment[307 + index]]
    if next_centers != [0] or selected_orders != [1]:
        raise ValueError(f"selector drift: {next_centers=} {selected_orders=}")

    with tempfile.TemporaryDirectory(
        dir=HERE, prefix=".child42-custody-snapshot-"
    ) as snapshot_dir:
        snapshot = Path(snapshot_dir)
        snapshot_model = snapshot / MODEL.name
        snapshot_final = snapshot / FINAL.name
        snapshot_output = snapshot / "child42-analysis.json"
        snapshot_model.write_bytes(model_bytes)
        snapshot_final.write_bytes(final_bytes)
        miner.MODEL = snapshot_model
        miner.FINAL = snapshot_final
        miner.OUT = snapshot_output
        miner.main()
        result = load_strict(snapshot_output)

    bank, bank_metadata = prior_bank_with_child41()
    source_validation = validate_source_pairs(result, rows, bank)
    for record in result["diagnostic_only"]:
        record["classification"] = "DIAGNOSTIC; no source-valid producer bridge established"
        record["source_bridge"] = "requires a new SourceRealization producer/transport theorem"
    result["schema"] = "p97-exact17-child42-independent-wave-analysis/v1"
    result["provenance"]["model_file_sha256"] = actual_model_sha
    result["provenance"]["canonical_assignment_sha256"] = CANONICAL_ASSIGNMENT_SHA
    result["provenance"]["custody_final_sha256"] = actual_final_sha
    result["provenance"]["final_file_sha256"] = actual_final_sha
    result["provenance"]["manifest_sha256"] = MANIFEST_SHA
    result["provenance"]["identity_hash"] = IDENTITY
    result["provenance"]["parent_analysis_sha256"] = {str(path.relative_to(ROOT)): expected["sha256"] for path, expected in PRIOR_SOURCES.items()}
    result["prior_source_bank"] = bank_metadata
    result["source_validation"] = source_validation
    result["conclusion"]["wave"] = "Child42"
    result["conclusion"]["new_source_valid_occurrences"] = source_validation[
        "paired_source_checked"
    ]
    result["conclusion"]["new_source_valid_occurrence_clauses_if_banked"] = (
        source_validation["new_occurrence_clauses"]
    )
    result["conclusion"]["exact17_closure"] = "not closed; Child42 authenticated SAT model survives"
    result["conclusion"]["source_bridge"] = "Existing generic TwoKalmansonCancellationData consumer; no new SourceRealization producer bridge identified."
    OUT.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "path": str(OUT),
        "status": result["status"],
        "replay": result["independent_replay"],
        "prior_bank": bank_metadata,
        "source_validation": source_validation,
        "diagnostic_count": len(result["diagnostic_only"]),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
