"""Read-only static audit of child34 custody artifacts and solver log."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
D = ROOT / "scratch/exact17-lean-to-sat"
EXPECTED_JOB = "3dc8ef3d-5cc3-49c1-b0e4-afc9d2552941"
EXPECTED_ROOT = "ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819"
EXPECTED_MANIFEST = "01a53c3772486002cbb7a54fb1db24a21027c38bd9670ab2814eb26fe3ef62a2"
EXPECTED_DAEMON = "f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089"
EXPECTED_SOLVER = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
EXPECTED_LOG = "4070e1829e50f6ccf5aa19460b7539afe70ff2dbf6ef61dee4df678849efb2b5"
EXPECTED_ASSIGNMENT = "7d845d28c31dea7a5f9322e44036dcf93bb7352601f35182b22da9f2e4bf7eca"


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    final = json.loads((D / "piqd-child34-core1-custody-final.json").read_text())
    model = json.loads((D / "piqd-child34-core1-custody-model.json").read_text())
    log_path = D / "piqd-child34-core1-custody-solver.log"
    log = log_path.read_text()
    assignment = model["model"]["assignment"]
    expected_final = {
        "binding", "completion_status", "daemon", "deciding_daemon_sha256",
        "job_id", "model_check", "model_replay", "model_sha256", "next_gate",
        "result", "schema", "solver", "solver_log", "stored_final",
    }
    assert set(final) == expected_final
    assert final["job_id"] == EXPECTED_JOB and final["result"] == "SAT"
    cs = final["completion_status"]
    for key, value in {
        "status": "completed", "result": "SAT", "run_epoch": 1,
        "recovery_action": None, "requested_core_limit": 1,
        "attested_solver_processes": 1,
        "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
        "backend": "cadical", "solver_profile": "sat", "timeout_s": 3600,
        "march_timeout_s": 900, "cnf_blob_hash": EXPECTED_ROOT,
        "producer_manifest_hash": EXPECTED_MANIFEST,
        "daemon_sha256": EXPECTED_DAEMON, "log_size_bytes": 7788,
        "log_sha256": EXPECTED_LOG,
    }.items():
        assert cs.get(key) == value, (key, cs.get(key), value)
    assert final["model_replay"] == {"clauses_checked": 5_847_256, "satisfies_all": True}
    mc = final["model_check"]
    assert mc["outcome"] == "SATISFIED" and mc["num_vars"] == 308
    assert mc["num_clauses"] == 5_847_256 and mc["num_assigned"] == 308
    assert mc["ce_scope"] is None and mc["announcement"] == "NONE"
    assert "no claim" in mc["detail"] and "no counterexample scope" in mc["detail"]
    assert final["next_gate"] == "mandatory_general_theorem_search"
    assert set(model) == {"cnf_sha256", "completion_identity_hash", "job_id", "manifest_sha256", "model", "replay", "schema"}
    assert len(assignment) == 308 and {abs(x) for x in assignment} == set(range(1, 309))
    assert sha(log_path) == EXPECTED_LOG
    assert "s SATISFIABLE" in log and "c exit 10" in log
    vlines = [line for line in log.splitlines() if line.startswith("v ")]
    assert vlines and vlines[-1].split()[-1] == "0"
    logged = [int(x) for line in vlines for x in (line.split()[1:-1] if line is vlines[-1] else line.split()[1:])]
    assert logged == assignment
    assignment_hash = hashlib.sha256(" ".join(map(str, assignment)).encode()).hexdigest()
    assert assignment_hash == EXPECTED_ASSIGNMENT
    assert model["replay"] == {"clauses_checked": 5_847_256, "satisfies_all": True}
    print(json.dumps({
        "status": "PASS", "final_schema": "exact-key-set",
        "job_id": EXPECTED_JOB, "root_sha256": EXPECTED_ROOT,
        "manifest_sha256": EXPECTED_MANIFEST, "daemon_sha256": EXPECTED_DAEMON,
        "solver_sha256": EXPECTED_SOLVER, "solver_log_sha256": EXPECTED_LOG,
        "log_assignment_matches_model": True, "terminator": "0",
        "ce_scope": None, "announcement": "NONE",
        "recovery_action": None, "run_epoch": 1,
    }, sort_keys=True))


if __name__ == "__main__":
    main()
