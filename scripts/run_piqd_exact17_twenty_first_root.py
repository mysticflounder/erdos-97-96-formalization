#!/usr/bin/env python3
"""Submit and finalize the twenty-first Lean-owned exact-17 PIQD root.

The twentieth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the child rooted at
the twentieth model refinements so no earlier job state or artifact can be
overwritten.

The Lean exporter and independent ingress validators produced the pinned
child21 artifacts below. Terminal SAT finalization additionally requires one
complete, duplicate-free assignment from a single solver run; the damaged log
written by two simultaneous solver processes is rejected before any accepted
artifact is written.
"""

from __future__ import annotations

import hashlib
import json
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twentieth_root.py"
BASE_RUNNER_SHA256 = "ccbc0f71e1040a2db01ad019dd48c5b1d78d4bbf59d4029477536b876ae210ea"

UNPOPULATED = "REPLACE_AFTER_CHILD21_EXPORT_AND_INGRESS_VALIDATION"
JOB_ID = "b676c3ab-2084-4ed4-b0b2-94a6aa1dafda"
FINALIZATION_DAEMON_SHA256 = (
    "49737240832cb24d2ff086ba26cfde6b86aa0fc81c31666b6c6541879448a7e7"
)
EXPECTED_BACKEND = "cadical"
EXPECTED_PROJECT = "erdos-97-96-formalization"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical twentieth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("twentieth") != 5:
        raise RuntimeError("unexpected twentieth-root specialization surface")
    source = source.replace("twentieth", "twenty-first")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_first_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("twentieth-root runner did not return a namespace")
    return inherited


def require_export_constants(runner: dict[str, Any]) -> None:
    missing = [
        name
        for name in ("CLAUSES", "BYTES", "CNF_SHA256", "MANIFEST_SHA256")
        if runner.get(name) in (None, UNPOPULATED)
    ]
    if missing:
        raise SystemExit(
            "child21 exporter/validator values are not populated: "
            + ", ".join(missing)
        )


def require_single_run_assignment(
    runner: dict[str, Any], value: object
) -> list[int]:
    """Accept only one complete, duplicate-free SAT assignment."""
    require = runner["require"]
    require(isinstance(value, list), "SAT assignment is not a list")
    require(
        len(value) == runner["VARIABLES"],
        "SAT assignment width does not equal the authenticated variable count",
    )
    variables: set[int] = set()
    for literal in value:
        require(
            isinstance(literal, int) and not isinstance(literal, bool),
            "bad SAT literal",
        )
        variable = abs(literal)
        require(1 <= variable <= runner["VARIABLES"], "SAT model has wrong variable")
        require(variable not in variables, "SAT model repeats a variable")
        variables.add(variable)
    require(
        variables == set(range(1, runner["VARIABLES"] + 1)),
        "SAT model is incomplete",
    )
    return value


def finalization_identity(runner: dict[str, Any]) -> dict[str, Any]:
    """Admit only the rotated daemon for terminal inspection/finalization."""
    require = runner["require"]
    run_json = runner["run_json"]
    version = run_json(["piqc", "version"])
    daemon = version.get("daemon")
    require(
        isinstance(daemon, dict)
        and daemon.get("sha256") == FINALIZATION_DAEMON_SHA256,
        "wrong post-rotation live daemon for finalization",
    )
    limits = version.get("limits")
    require(
        isinstance(limits, dict) and limits.get("max_var") == 1_000_000,
        "wrong live limits after daemon rotation",
    )
    registry = run_json(["piqc", "solvers"])
    require(registry.get("daemon") == daemon, "solver registry daemon mismatch")
    entries = registry.get("solvers")
    require(isinstance(entries, list), "malformed solver registry")
    matches = [
        entry
        for entry in entries
        if isinstance(entry, dict) and entry.get("name") == runner["SOLVER_NAME"]
    ]
    require(len(matches) == 1, "pinned solver is not unique")
    solver = matches[0]
    require(solver.get("usable") is True, "pinned solver unusable")
    require(solver.get("lane") == "sat", "pinned solver is not on SAT lane")
    require(
        solver.get("sha256") == runner["SOLVER_SHA256"],
        "pinned solver SHA-256 changed",
    )
    require(
        solver.get("solver_signature") == "cadical-3.0.0",
        "pinned solver signature changed",
    )
    return {"version": version, "solver": solver}


def finalize_after_daemon_rotation(runner: dict[str, Any]) -> None:
    """Finalize the confirmed child21 job without admitting a new submission."""
    require = runner["require"]
    run_json = runner["run_json"]
    scratch = runner["SCRATCH"]
    state_path = runner["STATE"]
    final_path = runner["FINAL"]
    require(state_path.is_file(), f"missing production state: {state_path}")
    require(not final_path.exists(), f"refusing to replace final report: {final_path}")

    # Keep the original daemon gate for the immutable root/manifest ingress.
    local = runner["validate_local"]()
    state = json.loads(state_path.read_text())
    require(state.get("phase") == "confirmed", "production job is not confirmed")
    require(state.get("root") == local, "root changed after confirmation")
    original_daemon = state.get("daemon")
    require(isinstance(original_daemon, dict), "state omitted original daemon identity")
    require(
        original_daemon.get("daemon", {}).get("sha256") == runner["DAEMON_SHA256"],
        "confirmed state does not retain the original daemon identity",
    )
    original_solver = state.get("solver")
    require(isinstance(original_solver, dict), "state omitted original solver identity")
    require(original_solver.get("name") == runner["SOLVER_NAME"], "original solver name changed")
    require(original_solver.get("sha256") == runner["SOLVER_SHA256"], "original solver hash changed")
    require(original_solver.get("solver_signature") == "cadical-3.0.0", "original solver signature changed")

    prepared = state.get("prepared")
    require(isinstance(prepared, dict), "state omitted prepared job identity")
    job_id = prepared.get("job_id")
    require(job_id == JOB_ID, "confirmed state names the wrong child21 job")
    identity_hash = prepared.get("identity_hash")
    require(isinstance(identity_hash, str) and identity_hash, "prepared state omitted identity hash")
    require(prepared.get("cnf_blob_hash") == runner["CNF_SHA256"], "prepared state names wrong root")
    require(prepared.get("num_vars") == runner["VARIABLES"], "prepared state names wrong variable count")
    require(prepared.get("num_clauses") == runner["CLAUSES"], "prepared state names wrong clause count")

    identity = finalization_identity(runner)
    status = run_json(["piqc", "status", job_id])
    require(status.get("status") == "completed", f"job is not terminal: {status.get('status')}")
    require(status.get("id") == job_id, "terminal status names wrong job")
    require(status.get("cnf_blob_hash") == runner["CNF_SHA256"], "terminal status names wrong root")
    require(status.get("identity_hash") == identity_hash, "terminal status identity hash changed")
    require(status.get("backend") == EXPECTED_BACKEND, "terminal status backend changed")
    require(status.get("project") == EXPECTED_PROJECT, "terminal status project changed")
    require(
        status.get("producer_manifest_hash") == runner["MANIFEST_SHA256"],
        "terminal status names wrong manifest",
    )
    stored = runner["retrieve_and_hash"](job_id, "stored-final")
    result = status.get("result")
    report: dict[str, Any] = {
        "artifact_kind": "p97-exact17-twenty-first-root-piqd-final/v2",
        "daemon": identity["version"],
        "daemon_original": original_daemon,
        "daemon_finalization": identity["version"],
        "daemon_rotation": {
            "from_sha256": runner["DAEMON_SHA256"],
            "to_sha256": FINALIZATION_DAEMON_SHA256,
        },
        "solver": identity["solver"],
        "solver_original": original_solver,
        "job_id": job_id,
        "identity_hash": identity_hash,
        "root_sha256": runner["CNF_SHA256"],
        "manifest_sha256": runner["MANIFEST_SHA256"],
        "variables": runner["VARIABLES"],
        "clauses": runner["CLAUSES"],
        "backend": EXPECTED_BACKEND,
        "job_identity": {
            "job_id": job_id,
            "identity_hash": identity_hash,
            "root_sha256": runner["CNF_SHA256"],
            "manifest_sha256": runner["MANIFEST_SHA256"],
            "variables": runner["VARIABLES"],
            "clauses": runner["CLAUSES"],
            "backend": EXPECTED_BACKEND,
            "project": EXPECTED_PROJECT,
        },
        "root": local,
        "status": status,
        "stored_final": stored,
        "finalized_at_utc": datetime.now(UTC).isoformat(),
    }
    if result == "SAT":
        model = run_json(["piqc", "job", "model", job_id])
        require(model.get("result") == "SAT", "model endpoint is not SAT")
        require(model.get("job_id") == job_id, "model endpoint names wrong job")
        raw_assignment = model.get("assignment")
        require(isinstance(raw_assignment, list), "SAT assignment is not a list")
        require(
            model.get("num_assigned") == runner["VARIABLES"],
            "model endpoint assignment count does not equal the authenticated variable count",
        )
        assignment = require_single_run_assignment(runner, raw_assignment)
        model_path = scratch / "piqd-twenty-first-root-model.json"
        require(not model_path.exists(), f"refusing to replace model: {model_path}")
        runner["atomic_json"](model_path, model)
        report.update({
            "result": "SAT",
            "model_path": str(model_path.relative_to(runner["ROOT"])),
            "model_sha256": runner["sha256_file"](model_path),
            "model_replay": runner["replay_model"](assignment),
            "next_gate": "mandatory_general_theorem_search",
        })
    elif result == "UNSAT":
        report.update({
            "result": "UNSAT",
            "proof_replay_complete": False,
            "next_gate": "retrieve_clause_map_and_proof_then_independently_replay",
        })
    else:
        raise SystemExit(f"terminal job has non-proof result: {result}")
    runner["atomic_json"](final_path, report)
    print(json.dumps({"job_id": job_id, "report": str(final_path), "result": result}, sort_keys=True))


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-twenty-first-root-twentieth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twentieth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-twentieth-model-refinements-export-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_200,
            "BYTES": 291_573_600,
            "CNF_SHA256": "bc42cd2756d6b3d84c5eb265762bc346a893dbdbc01bbe8ac5dbcb2f53f89720",
            "MANIFEST_SHA256": "6ffd148a57458b23929dc933eeb2b35607f860c790b8cda347090311105cbe22",
            "DAEMON_SHA256": "fa66c08a9f341bb03ce1c39d32737f6b5bb91efe31d6a55f86f903caf207383c",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    require_export_constants(runner)
    # The inherited start/static-check paths retain DAEMON_SHA256. Only the
    # terminal finalizer admits the approved post-rotation daemon.
    runner["finalize"] = lambda: finalize_after_daemon_rotation(runner)
    runner["main"]()


if __name__ == "__main__":
    main()
