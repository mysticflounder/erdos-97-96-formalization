#!/usr/bin/env python3
"""Ground exact-rational checks of the Z3 witnesses with cvc5 and Z3."""

from __future__ import annotations

import importlib.util
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("euclidean", ROOT / "run_euclidean.py")
euclidean = importlib.util.module_from_spec(spec)
assert spec.loader is not None
spec.loader.exec_module(euclidean)

MODELS = {
    "m012": {
        0: ("0", "0"), 1: ("1", "0"), 2: ("(/ 25 12)", "(/ 1 4)"),
        3: ("4", "1"), 4: ("1", "2"), 5: ("-2", "1"),
    },
    "m210": {
        0: ("0", "0"), 1: ("1", "0"), 2: ("(/ 7 4)", "(/ 1 4)"),
        3: ("2", "1"), 4: ("1", "2"), 5: ("0", "1"),
    },
}


def fixed_smt(name: str, m: tuple[int, int, int]) -> str:
    coords = MODELS[name]
    base = euclidean.smt_for(name, m).rsplit("(check-sat)", 1)[0]
    # cvc5 reports an `unsupported` warning for Z3's SMT timeout option;
    # remove that non-semantic option from the checker input.
    base = base.replace("(set-option : timeout 120000)\n", "")
    base = base.replace("(set-option :timeout 120000)\n", "")
    return base + "\n".join(f"(assert (= {euclidean.x(i)} {a}))\n(assert (= {euclidean.y(i)} {b}))" for i, (a, b) in coords.items()) + "\n(check-sat)\n"


def run(cmd: list[str], path: Path) -> str:
    p = subprocess.run(cmd + [str(path)], text=True, capture_output=True, check=False, timeout=15)
    return p.stdout + ("\n; stderr\n" + p.stderr if p.stderr else "")


def main() -> None:
    euclidean.ROOT.joinpath("fixed").mkdir(exist_ok=True)
    for name, m in {"m012": (0, 1, 2), "m210": (2, 1, 0)}.items():
        path = euclidean.ROOT / "fixed" / f"{name}.smt2"
        path.write_text(fixed_smt(name, m))
        z = run(["/Users/adam/bin/z3", "-smt2"], path)
        c = run(["/Users/adam/bin/cvc5", "--lang=smt2", "--tlimit=10000"], path)
        (euclidean.RAW / f"{name}.fixed.z3.txt").write_text(z)
        (euclidean.RAW / f"{name}.fixed.cvc5.txt").write_text(c)
        print(name, "z3", euclidean.status(z), "cvc5", euclidean.status(c))


if __name__ == "__main__":
    main()
