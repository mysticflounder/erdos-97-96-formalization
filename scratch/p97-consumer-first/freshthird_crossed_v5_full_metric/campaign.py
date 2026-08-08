#!/usr/bin/env python3
"""FreshThird crossed-row v5: source-faithful 13-role Euclidean campaign.

This is scratch diagnostic code.  It models squared Euclidean distances in
R^2, with W as the shared fourth only in the explicitly named subcase and
U,V=(X,Y) or (Y,X).  No source theorem is inferred from a solver result.
"""
from __future__ import annotations

import json
import subprocess
import time
from fractions import Fraction
from pathlib import Path

from z3 import Or, Real, SolverFor, is_rational_value, sat

HERE = Path(__file__).resolve().parent
ART = HERE / "artifacts"
RES = HERE / "results"
ROLES = ("p1", "p2", "r1", "r2", "s1", "s2", "A", "F", "C0", "O", "X", "Y", "W")


def d2(coords, a: str, b: str):
    ax, ay = coords[a]
    bx, by = coords[b]
    return (ax - bx) ** 2 + (ay - by) ** 2


def neq_point(coords, a: str, b: str):
    return Or(coords[a][0] != coords[b][0], coords[a][1] != coords[b][1])


def build(orientation: str):
    assert orientation in ("XY", "YX")
    coords = {r: (Real(f"{r}_x"), Real(f"{r}_y")) for r in ROLES}
    s = SolverFor("QF_NRA")
    s.set(timeout=30_000)
    U, V = (("X", "Y") if orientation == "XY" else ("Y", "X"))

    # Euclidean translation gauge; this does not change realizability.
    s.add(coords["F"][0] == 0, coords["F"][1] == 0)

    # Safe equalities: F-row, C0-row, O-row, and the two A pair equalities.
    s.add(d2(coords, "F", "p1") == d2(coords, "F", "p2"))
    s.add(d2(coords, "F", "p1") == d2(coords, "F", "X"))
    s.add(d2(coords, "F", "p1") == d2(coords, "F", "Y"))
    s.add(d2(coords, "C0", "s1") == d2(coords, "C0", "s2"))
    s.add(d2(coords, "C0", "s1") == d2(coords, "C0", U))
    s.add(d2(coords, "C0", "s1") == d2(coords, "C0", "W"))
    s.add(d2(coords, "O", "r1") == d2(coords, "O", "r2"))
    s.add(d2(coords, "O", "r1") == d2(coords, "O", V))
    s.add(d2(coords, "O", "r1") == d2(coords, "O", "W"))
    s.add(d2(coords, "A", "p1") == d2(coords, "A", "p2"))
    s.add(d2(coords, "A", "r1") == d2(coords, "A", "r2"))

    # Safe disequalities: radius mismatch / crossed-row differences.
    s.add(d2(coords, "C0", V) != d2(coords, "C0", U))
    s.add(d2(coords, "O", U) != d2(coords, "O", V))
    s.add(d2(coords, "A", "p1") != d2(coords, "A", "r1"))

    # Audited distinctness only.  p/r/s support nonaliases are explicit;
    # no blanket pairwise distinctness is introduced for cap centers.
    for a, b in (("p1", "p2"), ("r1", "r2"), ("s1", "s2")):
        s.add(neq_point(coords, a, b))
    for p in ("p1", "p2"):
        for r in ("r1", "r2"):
            s.add(neq_point(coords, p, r))
    for si in ("s1", "s2"):
        for q in ("p1", "p2", "r1", "r2"):
            s.add(neq_point(coords, si, q))

    # X,Y are outside the first cap: distinct from the listed cap-interior
    # p/r/s/F/O points.  W is outside the cap and excluded from named support
    # points; in particular it is distinct from p/r/s/X/Y and F/C0/O.
    s.add(neq_point(coords, "X", "Y"))
    for q in ("p1", "p2", "r1", "r2", "s1", "s2", "F", "O"):
        s.add(neq_point(coords, "X", q), neq_point(coords, "Y", q))
    for q in ("p1", "p2", "r1", "r2", "s1", "s2", "X", "Y", "F", "C0", "O"):
        s.add(neq_point(coords, "W", q))

    # Each row center is distinct from its own support points.  A is the
    # center of the two p/r support pairs represented by its safe equalities.
    for q in ("p1", "p2", "X", "Y"):
        s.add(neq_point(coords, "F", q))
    for q in ("s1", "s2", U, "W"):
        s.add(neq_point(coords, "C0", q))
    for q in ("r1", "r2", V, "W"):
        s.add(neq_point(coords, "O", q))
    for q in ("p1", "p2", "r1", "r2"):
        s.add(neq_point(coords, "A", q))

    # Center nonaliases explicitly audited by the packet.
    s.add(neq_point(coords, "F", "O"))
    s.add(neq_point(coords, "C0", "F"), neq_point(coords, "C0", "O"))
    return s, coords, {"U": U, "V": V}


def emit(solver, path: Path):
    path.write_text("(set-logic QF_NRA)\n" + solver.sexpr() + "\n(check-sat)\n(get-model)\n", encoding="utf-8")


def run_external(path: Path, engine: str):
    cmd = [engine, "--produce-models", "--tlimit=10000", str(path)] if engine == "cvc5" else [engine, str(path)]
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, timeout=40, check=False)
    except (FileNotFoundError, subprocess.TimeoutExpired) as exc:
        return {"status": "unavailable_or_timeout", "detail": type(exc).__name__}
    lines = proc.stdout.strip().splitlines()
    if "timeout" in proc.stderr.lower():
        status = "timeout"
    else:
        status = next((x.strip() for x in lines if x.strip() in {"sat", "unsat", "unknown"}), "malformed")
    return {"status": status, "returncode": proc.returncode, "stdout_head": lines[:8], "stderr_head": proc.stderr.strip().splitlines()[:4]}


def fraction_value(v):
    if is_rational_value(v):
        return Fraction(v.numerator_as_long(), v.denominator_as_long())
    return None


RATIONAL_XY = {
    "p1": (Fraction(0), Fraction(1)), "p2": (-Fraction(4, 5), -Fraction(3, 5)),
    "r1": (Fraction(3), Fraction(2)), "r2": (Fraction(13, 5), Fraction(16, 5)),
    "s1": (Fraction(9, 20), Fraction(29, 10)), "s2": (-Fraction(11, 40), Fraction(87, 40)),
    "A": (-Fraction(2), Fraction(1)), "F": (Fraction(0), Fraction(0)),
    "C0": (Fraction(21, 8), Fraction(0)), "O": (Fraction(1), Fraction(2)),
    "X": (-Fraction(1), Fraction(0)), "Y": (Fraction(1), Fraction(0)),
    "W": (Fraction(11, 5), Fraction(18, 5)),
}


def verify_values(vals, meta):
    def qd(a, b):
        ax, ay = vals[a]; bx, by = vals[b]
        return (ax - bx) ** 2 + (ay - by) ** 2

    eq_groups = [
        [qd("F", q) for q in ("p1", "p2", "X", "Y")],
        [qd("C0", q) for q in ("s1", "s2", meta["U"], "W")],
        [qd("O", q) for q in ("r1", "r2", meta["V"], "W")],
        [qd("A", q) for q in ("p1", "p2")], [qd("A", q) for q in ("r1", "r2")],
    ]
    checks = [all(x == g[0] for x in g) for g in eq_groups]
    checks += [qd("C0", meta["V"]) != qd("C0", meta["U"]), qd("O", meta["U"]) != qd("O", meta["V"]), qd("A", "p1") != qd("A", "r1")]
    distinct_pairs = [("p1", "p2"), ("r1", "r2"), ("s1", "s2"), ("F", "O"), ("C0", "F"), ("C0", "O")]
    distinct_pairs += [(p, r) for p in ("p1", "p2") for r in ("r1", "r2")]
    distinct_pairs += [(si, q) for si in ("s1", "s2") for q in ("p1", "p2", "r1", "r2")]
    distinct_pairs += [("X", "Y")]
    distinct_pairs += [(z, q) for z in ("X", "Y") for q in ("p1", "p2", "r1", "r2", "s1", "s2", "F", "O")]
    distinct_pairs += [("W", q) for q in ("p1", "p2", "r1", "r2", "s1", "s2", "X", "Y", "F", "C0", "O")]
    distinct_pairs += [("F", q) for q in ("p1", "p2", "X", "Y")]
    distinct_pairs += [("C0", q) for q in ("s1", "s2", meta["U"], "W")]
    distinct_pairs += [("O", q) for q in ("r1", "r2", meta["V"], "W")]
    distinct_pairs += [("A", q) for q in ("p1", "p2", "r1", "r2")]
    checks += [vals[a] != vals[b] for a, b in distinct_pairs]
    return {"kind": "exact_rational", "all_checks": all(checks), "checks_passed": sum(checks), "checks_total": len(checks), "coordinates": {r: [str(v[0]), str(v[1])] for r, v in vals.items()}}


def exact_verify(model, coords, meta):
    vals = {}
    for role, (x, y) in coords.items():
        xv, yv = fraction_value(model.eval(x, model_completion=True)), fraction_value(model.eval(y, model_completion=True))
        if xv is None or yv is None:
            return {"kind": "nonrational_or_unavailable", "coordinates": {role: [str(model.eval(x, model_completion=True)), str(model.eval(y, model_completion=True))] for role, (x, y) in coords.items()}}
        vals[role] = (xv, yv)

    return verify_values(vals, meta)


def smoke_tests():
    # Known tiny outcomes validate the distance/nonalias primitives.
    x0, x1 = Real("smoke_x0"), Real("smoke_x1")
    sat_s = SolverFor("QF_NRA"); sat_s.add(x0 == 0, x1 == 1, (x0 - x1) ** 2 == 1)
    unsat_s = SolverFor("QF_NRA"); unsat_s.add(x0 == x0, x0 != x0)
    return {"known_sat": str(sat_s.check()), "known_unsat": str(unsat_s.check())}


def main():
    ART.mkdir(parents=True, exist_ok=True); RES.mkdir(parents=True, exist_ok=True)
    summary = {"smoke": smoke_tests(), "cases": [], "closure": "none; scratch diagnostic only"}
    for orientation in ("XY", "YX"):
        solver, coords, meta = build(orientation)
        path = ART / f"shared_fourth_{orientation}.smt2"
        emit(solver, path)
        t0 = time.monotonic(); z3_result = solver.check(); elapsed = time.monotonic() - t0
        row = {"orientation": orientation, "U": meta["U"], "V": meta["V"], "z3": str(z3_result), "z3_seconds": round(elapsed, 3), "artifact": str(path.relative_to(HERE))}
        # The orientation swap is represented by exchanging the X/Y labels;
        # the packet itself does not license any geometric reflection.
        witness = dict(RATIONAL_XY)
        if orientation == "YX":
            witness["X"], witness["Y"] = witness["Y"], witness["X"]
        row["rational_witness"] = verify_values(witness, meta)
        (RES / f"rational_witness_{orientation}.json").write_text(json.dumps(row["rational_witness"], indent=2) + "\n", encoding="utf-8")
        pinned, pcoords, _ = build(orientation)
        for role, (wx, wy) in witness.items():
            pinned.add(pcoords[role][0] == str(wx), pcoords[role][1] == str(wy))
        pinned_path = ART / f"rational_witness_{orientation}.smt2"
        emit(pinned, pinned_path)
        row["z3_pinned"] = str(pinned.check())
        row["cvc5_pinned"] = run_external(pinned_path, "cvc5")
        if z3_result == sat:
            row["exact_verification"] = exact_verify(solver.model(), coords, meta)
            # Preserve the exact model independently of SMT's pretty printer.
            (RES / f"model_{orientation}.json").write_text(json.dumps(row["exact_verification"], indent=2) + "\n", encoding="utf-8")
        row["cvc5"] = run_external(path, "cvc5")
        summary["cases"].append(row)
    (RES / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"smoke": summary["smoke"], "cases": [{"orientation": c["orientation"], "U": c["U"], "V": c["V"], "z3": c["z3"], "z3_pinned": c["z3_pinned"], "cvc5": c["cvc5"]["status"], "cvc5_pinned": c["cvc5_pinned"]["status"], "rational_checks": [c["rational_witness"]["checks_passed"], c["rational_witness"]["checks_total"]]} for c in summary["cases"]], "closure": summary["closure"]}, indent=2))


if __name__ == "__main__":
    main()
