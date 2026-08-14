"""Targeted PolarOrderPacket refinement of the twelve prior Z3-SAT aliases.

This is not a new wave: it replays only the prior main-query SAT indices and
adds exactly the fifteen source-proved apex-relative strict-area inequalities.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor
from itertools import combinations
from pathlib import Path
from typing import Any

import z3

ROOT = Path(__file__).resolve().parent
BASE_PATH = ROOT.parent / "run_wave.py"
spec = importlib.util.spec_from_file_location("cap8_base", BASE_PATH)
assert spec and spec.loader
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)
TIMEOUT_MS = 5_000
ART = ROOT / "artifacts"
ART.mkdir(exist_ok=True)


def polar_areas() -> list[z3.BoolRef]:
    x = [z3.Real(f"x{i}") for i in range(6)]
    y = [z3.Real(f"y{i}") for i in range(6)]
    return [x[i] * y[j] - y[i] * x[j] < 0 for i, j in combinations(range(6), 2)]


def run(cmd: list[str], path: Path) -> tuple[str, str, float]:
    t0 = time.monotonic()
    p = subprocess.run(cmd + [str(path)], capture_output=True, text=True,
                       timeout=TIMEOUT_MS / 1000 + 8)
    out, err = p.stdout.strip(), p.stderr.strip()
    if not out:
        out = "timeout" if "timeout" in err.lower() else "unknown"
    return out, err, time.monotonic() - t0


def one_query(item: tuple[int, dict[str, Any]]) -> dict[str, Any]:
    idx, row = item
    path = ART / f"sat_alias_{idx:03d}.smt2"
    out, err, sec = run(["/Users/adam/bin/z3", "-smt2", "-T:5"], path)
    c_out, c_err, c_sec = run(
        ["/Users/adam/bin/cvc5", "--lang", "smt2", "--tlimit", str(TIMEOUT_MS)], path
    )
    return {"index": idx, "alias": row, "z3": out, "cvc5": c_out,
            "z3_seconds": round(sec, 3), "cvc5_seconds": round(c_sec, 3),
            "z3_stderr": err[-300:], "cvc5_stderr": c_err[-300:]}


def known_control(bad: bool = False) -> str:
    s = z3.Solver()
    x = [z3.Real(f"x{i}") for i in range(6)]
    y = [z3.Real(f"y{i}") for i in range(6)]
    for a, b, c in combinations(range(6), 3):
        s.add(base.orient(x, y, a, b, c) > 0)
    s.add(*(x[i] * y[j] - y[i] * x[j] < 0 for i, j in combinations(range(6), 2)))
    for i in range(6):
        s.add(x[i] == 100 + 100 * i, y[i] == 100 + i * i)
    if bad:
        s.add(x[0] * y[1] - y[0] * x[1] >= 0)
    return s.sexpr() + "\n(check-sat)\n"


def main() -> None:
    previous = json.loads((ROOT.parent / "results.json").read_text())
    rows = [(x["index"], x["alias"]) for x in previous["outcomes"] if x["z3"] == "sat"]
    if len(rows) != 12:
        raise RuntimeError(f"refinement requires exactly 12 prior SAT aliases, got {len(rows)}")
    areas = polar_areas()
    for idx, row in rows:
        (ART / f"sat_alias_{idx:03d}.smt2").write_text(base.smt2(row, extra=areas))
    with ThreadPoolExecutor(max_workers=12) as pool:
        outcomes = list(pool.map(one_query, rows))
    for outcome in outcomes:
        outcome["z3_exact_rational_model"] = False
        if outcome["z3"] == "sat":
            for seed in (0, 1, 4, 9):
                check = base.build(outcome["alias"], extra=areas)
                check.set(timeout=20_000, random_seed=seed)
                if check.check() == z3.sat:
                    model = check.model()
                    outcome["z3_exact_rational_model"] = all(
                        z3.is_true(model.eval(a, model_completion=True)) for a in check.assertions()
                    )
                    if outcome["z3_exact_rational_model"]:
                        break
    controls = []
    for name, bad in (("known_sat_planar_polar", False), ("bad_polar_area", True)):
        path = ART / f"control_{name}.smt2"
        path.write_text(known_control(bad))
        for solver, cmd in (("z3", ["/Users/adam/bin/z3", "-smt2", "-T:5"]),
                            ("cvc5", ["/Users/adam/bin/cvc5", "--lang", "smt2", "--tlimit", str(TIMEOUT_MS)])):
            out, err, sec = run(cmd, path)
            controls.append({"control": name, "solver": solver, "result": out,
                             "seconds": round(sec, 3), "stderr": err[-300:]})
    result = {
        "wave": "freshthird_firstnonhit_cap8_blocker_cycle_v1/polar_order_refinement",
        "source_clause": "15 inequalities signedArea2(oppApex1, p_i, p_j) < 0 for every i<j",
        "input_indices": [idx for idx, _ in rows],
        "input_count": len(rows), "area_constraint_count": len(areas),
        "outcomes": outcomes, "controls": controls,
        "classification": "targeted CEGAR refinement only; no expansion to prior UNKNOWN aliases",
    }
    (ROOT / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    hashes = {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
              for p in sorted(ART.glob("*.smt2"))}
    (ROOT / "SHA256SUMS.json").write_text(json.dumps(hashes, indent=2) + "\n")
    print(json.dumps({"inputs": len(rows), "areas": len(areas), "outcomes": len(outcomes), "controls": len(controls)}))


if __name__ == "__main__":
    main()
