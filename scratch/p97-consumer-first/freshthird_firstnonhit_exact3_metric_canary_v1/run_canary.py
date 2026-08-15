#!/usr/bin/env python3
"""One bounded QF_NRA canary for the exact-three FirstNonHit survivor.

This driver intentionally encodes only the 13 selected-row equidistance
packets from input.json, a sound similarity gauge, and exact pairwise point
distinctness.  It is diagnostic evidence, not a universal or Lean claim.
"""

from __future__ import annotations

import hashlib
import json
import subprocess
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3


ROOT = Path(__file__).resolve().parent
INPUT = json.loads((ROOT / "input.json").read_text())
SUPPORTS = {int(c): tuple(v) for c, v in INPUT["selected_supports"].items()}
TIMEOUT_MS = 30_000


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def dist2(x: list[z3.ArithRef], y: list[z3.ArithRef], i: int, j: int) -> z3.ArithRef:
    return (x[i] - x[j]) ** 2 + (y[i] - y[j]) ** 2


def build_solver(
    row_centers: tuple[int, ...], *, malformed: bool = False
) -> tuple[z3.Solver, list[z3.ArithRef], list[z3.ArithRef], z3.ArithRef]:
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", TIMEOUT_MS)
    x = [z3.Real(f"x_{i}") for i in range(17)]
    y = [z3.Real(f"y_{i}") for i in range(17)]
    delta = z3.Real("delta")

    # Sound similarity gauge: distinct p0,p1 can be normalized to (0,0),(1,0).
    solver.add(x[0] == 0, y[0] == 0, x[1] == 1, y[1] == 0)

    # A finite set of distinct points has some positive separation floor.
    solver.add(delta > 0)
    for i in range(17):
        for j in range(i + 1, 17):
            solver.add(dist2(x, y, i, j) >= delta)

    for center in row_centers:
        support = SUPPORTS[center]
        reference = dist2(x, y, center, support[0])
        for point in support[1:]:
            solver.add(dist2(x, y, center, point) == reference)

    if malformed:
        solver.add(x[1] == x[2], y[1] == y[2])
    return solver, x, y, delta


def smt2_text(solver: z3.Solver) -> str:
    return "(set-logic QF_NRA)\n" + solver.sexpr() + "\n(check-sat)\n"


def run_cvc5(query: str, name: str) -> dict[str, Any]:
    query_path = ROOT / f"{name}.smt2"
    query_path.write_text(query)
    started = time.monotonic()
    try:
        proc = subprocess.run(
            [
                "cvc5",
                "--lang",
                "smt2",
                "--nl-cov",
                "--tlimit",
                str(TIMEOUT_MS),
                "--force-logic=QF_NRA",
                str(query_path),
            ],
            capture_output=True,
            text=True,
            timeout=35,
            check=False,
        )
    except subprocess.TimeoutExpired as exc:
        return {
            "verdict": "unknown",
            "reason": "subprocess-timeout",
            "wall_seconds": time.monotonic() - started,
            "stdout": exc.stdout or "",
            "stderr": exc.stderr or "",
        }
    verdict = "unknown"
    for line in proc.stdout.splitlines():
        if line.strip() in {"sat", "unsat", "unknown"}:
            verdict = line.strip()
            break
    return {
        "verdict": verdict,
        "returncode": proc.returncode,
        "wall_seconds": time.monotonic() - started,
        "stdout": proc.stdout,
        "stderr": proc.stderr,
    }


def run_z3(
    row_centers: tuple[int, ...], name: str, *, malformed: bool = False
) -> tuple[dict[str, Any], z3.ModelRef | None, list[z3.ArithRef], list[z3.ArithRef], z3.ArithRef]:
    solver, x, y, delta = build_solver(row_centers, malformed=malformed)
    (ROOT / f"{name}.smt2").write_text(smt2_text(solver))
    started = time.monotonic()
    verdict = solver.check()
    result = {
        "verdict": str(verdict),
        "wall_seconds": time.monotonic() - started,
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
    }
    return result, solver.model() if verdict == z3.sat else None, x, y, delta


def as_fraction(value: z3.ArithRef) -> Fraction | None:
    if z3.is_rational_value(value):
        return Fraction(value.numerator_as_long(), value.denominator_as_long())
    return None


def exact_model(
    model: z3.ModelRef,
    x: list[z3.ArithRef],
    y: list[z3.ArithRef],
    delta: z3.ArithRef,
) -> dict[str, Any] | None:
    coords: dict[str, list[str]] = {}
    fractions: dict[int, tuple[Fraction, Fraction]] = {}
    for i in range(17):
        xv = as_fraction(model.eval(x[i], model_completion=True))
        yv = as_fraction(model.eval(y[i], model_completion=True))
        if xv is None or yv is None:
            return None
        fractions[i] = (xv, yv)
        coords[str(i)] = [str(xv), str(yv)]
    dv = as_fraction(model.eval(delta, model_completion=True))
    if dv is None:
        return None

    def d2(i: int, j: int) -> Fraction:
        dx = fractions[i][0] - fractions[j][0]
        dy = fractions[i][1] - fractions[j][1]
        return dx * dx + dy * dy

    checks: list[dict[str, Any]] = []
    checks.append({"name": "gauge", "ok": fractions[0] == (0, 0) and fractions[1] == (1, 0)})
    checks.append({"name": "delta_positive", "ok": dv > 0})
    for i in range(17):
        for j in range(i + 1, 17):
            checks.append({"name": f"distinct_{i}_{j}", "ok": d2(i, j) >= dv})
    for center, support in SUPPORTS.items():
        radius = d2(center, support[0])
        checks.append({
            "name": f"row_{center}_equal_radius",
            "ok": all(d2(center, point) == radius for point in support[1:]),
            "radius2": str(radius),
        })
        checks.append({
            "name": f"row_{center}_center_support_distinct",
            "ok": all(d2(center, point) > 0 for point in support),
        })
        checks.append({
            "name": f"row_{center}_support_pairwise_distinct",
            "ok": all(d2(support[i], support[j]) > 0 for i in range(4) for j in range(i + 1, 4)),
        })
    failed = [entry["name"] for entry in checks if not entry["ok"]]
    return {
        "coordinates": coords,
        "delta": str(dv),
        "checks_total": len(checks),
        "checks_failed": failed,
        "authenticated": not failed,
    }


def fixed_model_query(model_data: dict[str, Any]) -> str:
    solver, x, y, delta = build_solver(tuple(SUPPORTS))
    for i in range(17):
        xv, yv = model_data["coordinates"][str(i)]
        solver.add(x[i] == z3.RealVal(xv), y[i] == z3.RealVal(yv))
    solver.add(delta == z3.RealVal(model_data["delta"]))
    return smt2_text(solver)


def validate_known_witness() -> dict[str, Any]:
    coords = {
        0: (Fraction(0), Fraction(0)),
        1: (Fraction(1), Fraction(0)),
        2: (Fraction(0), Fraction(1)),
        7: (Fraction(-1), Fraction(0)),
        11: (Fraction(0), Fraction(-1)),
    }
    remaining = [i for i in range(17) if i not in coords]
    for k, i in enumerate(remaining, start=2):
        coords[i] = (Fraction(k), Fraction(k * (k - 1)))

    def d2(i: int, j: int) -> Fraction:
        return sum((coords[i][axis] - coords[j][axis]) ** 2 for axis in (0, 1))

    pairwise = min(d2(i, j) for i in range(17) for j in range(i + 1, 17))
    row0 = [d2(0, point) for point in SUPPORTS[0]]
    return {
        "authenticated": pairwise > 0 and len(set(row0)) == 1,
        "minimum_distance_squared": str(pairwise),
        "K0_radius_squared": str(row0[0]),
    }


def minimize_unsat_rows() -> dict[str, Any]:
    core = list(SUPPORTS)
    trials: list[dict[str, Any]] = []
    for center in tuple(core):
        candidate = tuple(c for c in core if c != center)
        z3_result, _, _, _, _ = run_z3(candidate, f"min_drop_{center}_z3")
        solver, _, _, _ = build_solver(candidate)
        cvc5_result = run_cvc5(smt2_text(solver), f"min_drop_{center}_cvc5")
        retained_unsat = z3_result["verdict"] == "unsat" and cvc5_result["verdict"] == "unsat"
        trials.append({
            "dropped_center": center,
            "z3": z3_result["verdict"],
            "cvc5": cvc5_result["verdict"],
            "retained_unsat": retained_unsat,
        })
        if retained_unsat:
            core.remove(center)
    return {"minimized_row_centers": core, "trials": trials}


def main() -> int:
    manifest = json.loads((ROOT / "manifest.prelaunch.json").read_text())
    if manifest["hashes"]["input.json"] != sha256(ROOT / "input.json"):
        raise SystemExit("input hash differs from prelaunch manifest")
    if manifest["hashes"]["run_canary.py"] != sha256(ROOT / "run_canary.py"):
        raise SystemExit("encoder hash differs from prelaunch manifest")

    results: dict[str, Any] = {
        "schema": INPUT["schema"],
        "four_valued_semantics": [
            "semantic-UNSAT",
            "relaxation-UNSAT",
            "SAT-abstraction",
            "UNKNOWN",
        ],
        "known_sat_witness": validate_known_witness(),
        "stage2": {
            "launched": False,
            "reason": "No exact source-backed boundary/cap-order assumption was supplied; no relaxation cut admitted.",
        },
    }

    controls: dict[str, Any] = {}
    for name, rows, malformed, expected in (
        ("control_known_sat", (0,), False, "sat"),
        ("control_malformed_unsat", (0,), True, "unsat"),
    ):
        z3_result, _, _, _, _ = run_z3(rows, f"{name}.z3", malformed=malformed)
        solver, _, _, _ = build_solver(rows, malformed=malformed)
        cvc5_result = run_cvc5(smt2_text(solver), f"{name}.cvc5")
        controls[name] = {
            "expected": expected,
            "z3": z3_result,
            "cvc5": cvc5_result,
            "passed": z3_result["verdict"] == expected and cvc5_result["verdict"] == expected,
        }
    results["controls"] = controls
    if not all(control["passed"] for control in controls.values()):
        results["terminal_verdict"] = "UNKNOWN"
        results["terminal_reason"] = "control failure"
        (ROOT / "results.json").write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
        return 2

    centers = tuple(SUPPORTS)
    z3_result, model, x, y, delta = run_z3(centers, "stage1.z3")
    solver, _, _, _ = build_solver(centers)
    cvc5_result = run_cvc5(smt2_text(solver), "stage1.cvc5")
    results["stage1"] = {"z3": z3_result, "cvc5": cvc5_result}

    if z3_result["verdict"] == "sat" and model is not None:
        model_data = exact_model(model, x, y, delta)
        results["stage1"]["z3_exact_readback"] = model_data
        if model_data is None or not model_data["authenticated"]:
            results["terminal_verdict"] = "UNKNOWN"
            results["terminal_reason"] = "SAT model could not be authenticated in exact rational arithmetic"
        else:
            (ROOT / "stage1.z3.exact-model.json").write_text(
                json.dumps(model_data, indent=2, sort_keys=True) + "\n"
            )
            fixed_cvc5 = run_cvc5(fixed_model_query(model_data), "stage1.z3-model-readback.cvc5")
            results["stage1"]["independent_fixed_model_readback"] = fixed_cvc5
            if fixed_cvc5["verdict"] != "sat":
                results["terminal_verdict"] = "UNKNOWN"
                results["terminal_reason"] = "exact Z3 model failed independent cvc5 replay"
            else:
                results["terminal_verdict"] = "SAT-abstraction"
                results["terminal_reason"] = "exact rational model satisfies the encoded 13-row packet; omitted live facts remain"
    elif z3_result["verdict"] == "unsat" and cvc5_result["verdict"] == "unsat":
        results["stage1"]["fresh_replay_and_row_minimization"] = minimize_unsat_rows()
        results["terminal_verdict"] = "semantic-UNSAT"
        results["terminal_reason"] = "both fresh QF_NRA engines reject this fixed finite 13-row metric packet"
    else:
        results["terminal_verdict"] = "UNKNOWN"
        results["terminal_reason"] = "engines did not produce an authenticated decisive verdict"

    results["wave_data_only_general_theorem_mine"] = {
        "records_reviewed": ["stage1 solver verdicts", "exact readback if present", "controls"],
        "candidate": None,
        "outcome": "Filled after the terminal result is reviewed; no prior-wave or theorem-bank search is part of this canary.",
    }
    (ROOT / "results.json").write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
    return 0 if results["terminal_verdict"] != "UNKNOWN" else 3


if __name__ == "__main__":
    sys.exit(main())
