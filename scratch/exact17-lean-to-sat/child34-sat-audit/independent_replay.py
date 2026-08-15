"""Independent child34 SAT custody replay; no production runner imports."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
DIR = ROOT / "scratch/exact17-lean-to-sat"
CNF = DIR / "exact17-thirty-fourth-root-thirty-third-model-refinements.cnf"
MODEL = DIR / "piqd-child34-core1-custody-model.json"
FINAL = DIR / "piqd-child34-core1-custody-final.json"
EXPECTED_HASH = "ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819"
EXPECTED_VARS = 308
EXPECTED_CLAUSES = 5_847_256


def main() -> None:
    model_doc = json.loads(MODEL.read_text())
    assignment = model_doc["model"]["assignment"]
    assert type(assignment) is list and len(assignment) == EXPECTED_VARS
    assert all(type(x) is int and x != 0 for x in assignment)
    assert {abs(x) for x in assignment} == set(range(1, EXPECTED_VARS + 1))
    assert len(set(assignment)) == EXPECTED_VARS
    true_literals = set(assignment)
    digest = hashlib.sha256(CNF.read_bytes()).hexdigest()
    assert digest == EXPECTED_HASH
    checked = 0
    with CNF.open("rb") as stream:
        header = stream.readline()
        assert header == f"p cnf {EXPECTED_VARS} {EXPECTED_CLAUSES}\n".encode()
        for raw in stream:
            fields = raw.split()
            assert fields and fields[-1] == b"0"
            literals = [int(x) for x in fields[:-1]]
            assert literals and any(x in true_literals for x in literals)
            checked += 1
    assert checked == EXPECTED_CLAUSES
    final = json.loads(FINAL.read_text())
    assert final["model_replay"] == {"clauses_checked": EXPECTED_CLAUSES, "satisfies_all": True}
    print(json.dumps({
        "status": "PASS",
        "cnf_sha256": digest,
        "variables": len(assignment),
        "clauses_checked": checked,
        "assignment_domain": "exactly +/-1..+/-308, one literal per variable",
        "satisfies_all": True,
        "production_replay_record_matches": True,
    }, sort_keys=True))


if __name__ == "__main__":
    main()
