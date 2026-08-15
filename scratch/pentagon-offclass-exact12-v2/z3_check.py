#!/usr/bin/env python3
"""Independent second-solver check of the persisted DIMACS instance."""

from __future__ import annotations

import json
import subprocess
from pathlib import Path


HERE = Path(__file__).resolve().parent


def main() -> int:
    completed = subprocess.run(
        ["z3", "-dimacs", str(HERE / "instance.cnf")],
        capture_output=True,
        text=True,
        timeout=60,
        check=False,
    )
    output = completed.stdout + completed.stderr
    first_line = output.splitlines()[0] if output.splitlines() else ""
    (HERE / "z3.log").write_text(first_line + "\n", encoding="utf-8")
    if completed.returncode != 0 or first_line != "s SATISFIABLE":
        raise RuntimeError(f"unexpected Z3 result: {completed.returncode} {first_line}")
    result = {
        "schema": "p97_pentagon_offclass_exact12_v2.second_solver.v1",
        "status": "SAT",
        "solver": "z3 -dimacs",
        "returncode": completed.returncode,
    }
    (HERE / "z3.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print("PASS z3=SAT")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
