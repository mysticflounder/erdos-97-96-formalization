"""Fresh PIQD rerun of the immutable twenty-first exact-17 root.

The original child21 job is permanently inadmissible: two simultaneous solver
processes wrote two complete assignments into one log.  This runner submits the
byte-identical Lean-owned CNF under a new, explicit recovery manifest and admits
only one complete, duplicate-free assignment from one solver run.
"""

from __future__ import annotations

import hashlib
import json
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SOURCE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twenty_first_root.py"
SOURCE_RUNNER_SHA256 = "e2d83d78cf83491bc3e62744b7db86f937e1502e86f100730962d651a1e8627c"

DAMAGED_JOB_ID = "b676c3ab-2084-4ed4-b0b2-94a6aa1dafda"
DAEMON_SHA256 = "82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396"
MANIFEST_SHA256 = "dc92856c15ca520ecec614ca47e4b56a83888143244ff20160d5b52847e9ec08"
ORIGINAL_MANIFEST_SHA256 = "6ffd148a57458b23929dc933eeb2b35607f860c790b8cda347090311105cbe22"
ORIGINAL_REPORT_SHA256 = "00d51c817e710d6532a734b75241e6594d889c9119b13676443fbc82e37b4f04"
ORIGINAL_INGRESS_DAEMON_SHA256 = (
    "fa66c08a9f341bb03ce1c39d32737f6b5bb91efe31d6a55f86f903caf207383c"
)
EXPECTED_BACKEND = "cadical"
EXPECTED_PROJECT = "erdos-97-96-formalization"


def load_runner() -> tuple[dict[str, Any], dict[str, Any]]:
    source_bytes = SOURCE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != SOURCE_RUNNER_SHA256:
        raise RuntimeError(
            "child21 custody runner changed: "
            f"expected {SOURCE_RUNNER_SHA256}, got {actual_hash}"
        )
    namespace: dict[str, Any] = {
        "__file__": str(SOURCE_RUNNER),
        "__name__": "_piqd_exact17_twenty_first_root_custody",
    }
    exec(  # noqa: S102 -- the executed source bytes are pinned above
        compile(source_bytes.decode("utf-8"), str(SOURCE_RUNNER), "exec"),
        namespace,
    )
    runner = namespace["load_runner"]()
    if not isinstance(runner, dict):
        raise TypeError("child21 custody runner did not return a namespace")
    return namespace, runner


def require_single_daemon(runner: dict[str, Any]) -> dict[str, Any]:
    completed = runner["run"](["ps", "-ax", "-o", "pid=,command="])
    matches = [
        line.strip()
        for line in completed.stdout.splitlines()
        if "piqd run" in line
        and "--data-dir /Users/adam/.piqd" in line
        and "--bind 127.0.0.1:7272" in line
    ]
    runner["require"](
        len(matches) == 1,
        f"expected exactly one live PIQD daemon, found {len(matches)}",
    )
    pid, _, command = matches[0].partition(" ")
    return {"pid": int(pid), "command": command.strip()}


def validate_local(runner: dict[str, Any]) -> dict[str, Any]:
    require = runner["require"]
    cnf = runner["CNF"]
    manifest_path = runner["INGRESS_MANIFEST"]
    report_path = runner["INGRESS_REPORT"]
    require(cnf.is_file(), f"missing root: {cnf}")
    require(cnf.stat().st_size == runner["BYTES"], "child21 byte count changed")
    with cnf.open("rb") as handle:
        require(
            handle.readline()
            == f"p cnf {runner['VARIABLES']} {runner['CLAUSES']}\n".encode(),
            "bad child21 CNF header",
        )
    require(
        runner["sha256_file"](cnf) == runner["CNF_SHA256"],
        "child21 CNF SHA-256 changed",
    )
    require(
        runner["sha256_file"](manifest_path) == MANIFEST_SHA256,
        "fresh-rerun manifest changed",
    )
    require(
        runner["sha256_file"](report_path) == ORIGINAL_REPORT_SHA256,
        "original ingress report changed",
    )
    manifest = json.loads(manifest_path.read_text())
    dimacs = manifest.get("dimacs")
    require(isinstance(dimacs, dict), "rerun manifest omitted DIMACS identity")
    require(
        dimacs.get("sha256") == runner["CNF_SHA256"]
        and dimacs.get("bytes") == runner["BYTES"]
        and dimacs.get("variables") == runner["VARIABLES"]
        and dimacs.get("clauses") == runner["CLAUSES"],
        "rerun manifest names the wrong root",
    )
    validated = manifest.get("validated_ingress")
    require(isinstance(validated, dict), "rerun manifest omitted validated ingress")
    require(
        validated.get("manifest_sha256") == ORIGINAL_MANIFEST_SHA256
        and validated.get("report_sha256") == ORIGINAL_REPORT_SHA256
        and validated.get("status") == "PASS",
        "rerun manifest names the wrong validated ingress",
    )
    recovery = manifest.get("recovery")
    require(isinstance(recovery, dict), "rerun manifest omitted recovery provenance")
    require(
        recovery.get("supersedes_job_id") == DAMAGED_JOB_ID
        and recovery.get("original_model_admissible") is False
        and recovery.get("piqd_repair_daemon_sha256") == DAEMON_SHA256,
        "rerun recovery provenance changed",
    )
    report = json.loads(report_path.read_text())
    require(report.get("status") == "PASS", "original ingress report is not PASS")
    require(
        report.get("dimacs_sha256") == runner["CNF_SHA256"]
        and report.get("manifest_sha256") == ORIGINAL_MANIFEST_SHA256
        and report.get("piqd_daemon_sha256") == ORIGINAL_INGRESS_DAEMON_SHA256
        and report.get("variables") == runner["VARIABLES"]
        and report.get("clauses") == runner["CLAUSES"],
        "original ingress report names the wrong root",
    )
    return {
        "path": str(cnf.relative_to(ROOT)),
        "sha256": runner["CNF_SHA256"],
        "bytes": runner["BYTES"],
        "variables": runner["VARIABLES"],
        "clauses": runner["CLAUSES"],
        "validated_ingress_report": str(report_path.relative_to(ROOT)),
        "validated_ingress_report_sha256": ORIGINAL_REPORT_SHA256,
        "validated_ingress_manifest_sha256": ORIGINAL_MANIFEST_SHA256,
        "manifest": str(manifest_path.relative_to(ROOT)),
        "manifest_sha256": MANIFEST_SHA256,
        "supersedes_job_id": DAMAGED_JOB_ID,
    }


def finalize(
    runner: dict[str, Any],
    require_single_run_assignment: Any,
) -> None:
    require = runner["require"]
    run_json = runner["run_json"]
    state_path = runner["STATE"]
    final_path = runner["FINAL"]
    require(state_path.is_file(), f"missing production state: {state_path}")
    require(not final_path.exists(), f"refusing to replace final report: {final_path}")

    local = runner["validate_local"]()
    identity = runner["live_identity"]()
    state = json.loads(state_path.read_text())
    require(state.get("phase") == "confirmed", "production job is not confirmed")
    require(state.get("root") == local, "root changed after confirmation")
    require(state.get("daemon") == identity["version"], "daemon changed after confirmation")
    require(state.get("solver") == identity["solver"], "solver changed after confirmation")
    prepared = state.get("prepared")
    require(isinstance(prepared, dict), "state omitted prepared job identity")
    job_id = prepared.get("job_id")
    require(isinstance(job_id, str) and job_id, "state omitted job id")
    require(job_id != DAMAGED_JOB_ID, "fresh rerun reused the damaged job")
    identity_hash = prepared.get("identity_hash")
    require(isinstance(identity_hash, str) and identity_hash, "state omitted identity hash")
    require(prepared.get("cnf_blob_hash") == runner["CNF_SHA256"], "state names wrong root")
    require(prepared.get("num_vars") == runner["VARIABLES"], "state names wrong variable count")
    require(prepared.get("num_clauses") == runner["CLAUSES"], "state names wrong clause count")

    status = run_json(["piqc", "status", job_id])
    require(status.get("status") == "completed", f"job is not terminal: {status.get('status')}")
    require(status.get("id") == job_id, "terminal status names wrong job")
    require(status.get("cnf_blob_hash") == runner["CNF_SHA256"], "terminal status names wrong root")
    require(status.get("identity_hash") == identity_hash, "terminal identity hash changed")
    require(status.get("backend") == EXPECTED_BACKEND, "terminal backend changed")
    require(status.get("project") == EXPECTED_PROJECT, "terminal project changed")
    require(
        status.get("producer_manifest_hash") == MANIFEST_SHA256,
        "terminal status names wrong rerun manifest",
    )
    stored = runner["retrieve_and_hash"](job_id, "stored-final-fresh-rerun")
    result = status.get("result")
    report: dict[str, Any] = {
        "artifact_kind": "p97-exact17-twenty-first-root-piqd-fresh-rerun-final/v1",
        "daemon": identity["version"],
        "solver": identity["solver"],
        "job_id": job_id,
        "identity_hash": identity_hash,
        "root_sha256": runner["CNF_SHA256"],
        "manifest_sha256": MANIFEST_SHA256,
        "variables": runner["VARIABLES"],
        "clauses": runner["CLAUSES"],
        "backend": EXPECTED_BACKEND,
        "project": EXPECTED_PROJECT,
        "root": local,
        "status": status,
        "stored_final": stored,
        "single_daemon": require_single_daemon(runner),
        "finalized_at_utc": datetime.now(UTC).isoformat(),
    }
    if result == "SAT":
        model = run_json(["piqc", "job", "model", job_id])
        require(model.get("result") == "SAT", "model endpoint is not SAT")
        require(model.get("job_id") == job_id, "model endpoint names wrong job")
        require(
            model.get("num_assigned") == runner["VARIABLES"],
            "model endpoint assignment count is not exact",
        )
        assignment = require_single_run_assignment(runner, model.get("assignment"))
        model_path = runner["SCRATCH"] / "piqd-twenty-first-root-fresh-rerun-model.json"
        require(not model_path.exists(), f"refusing to replace model: {model_path}")
        runner["atomic_json"](model_path, model)
        report.update(
            {
                "result": "SAT",
                "model_path": str(model_path.relative_to(ROOT)),
                "model_sha256": runner["sha256_file"](model_path),
                "model_replay": runner["replay_model"](assignment),
                "next_gate": "mandatory_general_theorem_search",
            }
        )
    elif result == "UNSAT":
        report.update(
            {
                "result": "UNSAT",
                "proof_replay_complete": False,
                "next_gate": "retrieve_clause_map_and_proof_then_independently_replay",
            }
        )
    else:
        raise SystemExit(f"terminal job has non-proof result: {result}")
    runner["atomic_json"](final_path, report)
    print(
        json.dumps(
            {"job_id": job_id, "report": str(final_path), "result": result},
            sort_keys=True,
        )
    )


def main() -> None:
    source, runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch / "exact17-twenty-first-root-twentieth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twentieth-model-refinements-fresh-rerun.json",
            "INGRESS_REPORT": scratch
            / "piqd-ingress-twentieth-model-refinements-validation.json",
            "STATE": scratch / "piqd-twenty-first-root-fresh-rerun-live-state.json",
            "FINAL": scratch / "piqd-twenty-first-root-fresh-rerun-final.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_200,
            "BYTES": 291_573_600,
            "CNF_SHA256": "bc42cd2756d6b3d84c5eb265762bc346a893dbdbc01bbe8ac5dbcb2f53f89720",
            "MANIFEST_SHA256": MANIFEST_SHA256,
            "DAEMON_SHA256": DAEMON_SHA256,
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    base_live_identity = runner["live_identity"]

    def live_identity() -> dict[str, Any]:
        require_single_daemon(runner)
        return base_live_identity()

    runner["validate_local"] = lambda: validate_local(runner)
    runner["live_identity"] = live_identity
    runner["finalize"] = lambda: finalize(
        runner,
        source["require_single_run_assignment"],
    )
    runner["main"]()


if __name__ == "__main__":
    main()
