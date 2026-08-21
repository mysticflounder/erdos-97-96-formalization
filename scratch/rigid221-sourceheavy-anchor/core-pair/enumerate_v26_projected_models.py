"""Enumerate all models of the v26 formula projected onto the cube choice.

Analysis-method gap 2 of docs/exact12-v24-survivor-structural-analysis-
2026-08-16.md ("projected model enumeration modulo symmetry"): measure the
true size of the v26 survivor space by enumerating distinct projected
cubes (one 4-element support row per center) of the live canary formula.

Method: block-and-solve with the cadical binary on the authenticated
canary CNF (discovery.cnf, 47,211 vars / 704,481 clauses).  The projection
variables are the 3,040 choice variables of SourceFaithfulCoverInstance;
each model fixes exactly one candidate per center (one-hot), so a
projected model is blocked by the 12-literal clause of its negated true
choice variables.  The harness was validated before use: the recorded
survivor assignment satisfies every clause of discovery.cnf and decodes
to the authenticated v26 cube at all 12 centers.

Diagnostic only.  Unauthenticated scratch solving: nothing here is a
certificate, a bank, or a wave.  Authentication flows only through the
proved pipeline.
"""

from __future__ import annotations

import json
import subprocess
import sys
import time
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.candidate_surface import build_model  # noqa: E402
from census.card_head.source_faithful_candidate_surface import (  # noqa: E402
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

WORKDIR = REPO_ROOT / (
    "scratch/runs/exact12-rigid221-all-order-common-five/"
    "canary-v14-20260818/artifacts/workdir"
)
CAP = 300


def main(scratch: Path) -> None:
    inst = SourceFaithfulCoverInstance(build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE))
    var_to_choice = {var: key for key, var in inst.choice_variables.items()}
    n_choice = max(inst.choice_variables.values())

    base_lines = (WORKDIR / "discovery.cnf").read_text().splitlines()
    header = base_lines[0].split()
    nvars, nclauses = int(header[2]), int(header[3])
    base_body = "\n".join(base_lines[1:])

    cubes: list[dict[int, list[int]]] = []
    blocks: list[str] = []
    work_cnf = scratch / "enum_work.cnf"
    start = time.time()
    while len(cubes) < CAP:
        work_cnf.write_text(
            f"p cnf {nvars} {nclauses + len(blocks)}\n" + base_body + "\n"
            + "\n".join(blocks) + ("\n" if blocks else "")
        )
        proc = subprocess.run(
            ["cadical", "-q", str(work_cnf)], capture_output=True, text=True
        )
        if proc.returncode == 20:
            print(f"UNSAT after {len(cubes)} models: enumeration COMPLETE")
            break
        if proc.returncode != 10:
            print(f"solver error rc={proc.returncode}: {proc.stderr[:500]}")
            return
        pos = set()
        for line in proc.stdout.splitlines():
            if line.startswith("v "):
                for tok in line.split()[1:]:
                    lit = int(tok)
                    if lit > 0:
                        pos.add(lit)
        true_choice = sorted(v for v in pos if v <= n_choice)
        if len(true_choice) != 12:
            print(f"decode error: {len(true_choice)} true choice vars")
            return
        cube = {}
        for var in true_choice:
            center, index = var_to_choice[var]
            cube[center] = sorted(inst.candidates[center][index])
        cubes.append(cube)
        blocks.append(" ".join(str(-v) for v in true_choice) + " 0")
        elapsed = time.time() - start
        print(f"model {len(cubes)}: choice vars {true_choice} ({elapsed:.0f}s)")
    else:
        print(f"CAP {CAP} reached: enumeration INCOMPLETE (lower bound only)")

    out = scratch / "v26_projected_models.json"
    out.write_text(json.dumps(
        {"cap": CAP, "complete": len(cubes) < CAP, "count": len(cubes),
         "cubes": [{str(k): v for k, v in cube.items()} for cube in cubes]},
        indent=1))
    print(f"distinct projected cubes: {len(cubes)}; written {out}")


if __name__ == "__main__":
    main(Path(sys.argv[1]))
