"""Local QF_NRA feasibility probe for the FirstNonHit same-blocker arm.

The packet encoded here is deliberately small and source-mapped:

* Q1,Q2,C1,C2 are four distinct points in the selected row at the common
  blocker center Q (one exact circle);
* C1,C2 are strict points of a fixed first-cap half-plane and have distinct
  squared distances from oppApex1;
* P1,P2 and R1,R2 are two retained first-apex radius pairs, each in that
  strict cap, with radii 2 and 3.

The cap half-plane and fixed coordinates are a local geometric witness model,
not a universal encoding of the Lean packet.  SAT therefore only records a
finite/local feasibility result.  The malformed control deliberately asks the
same four row points to be distinct and equal on two different exact circles.
"""

from __future__ import annotations

import json
import subprocess
from fractions import Fraction
from pathlib import Path

import z3

ROOT = Path(__file__).resolve().parent
ART = ROOT / "artifacts"
READBACK = ROOT / "readback"


def d2(
    a: tuple[z3.ArithRef, z3.ArithRef], b: tuple[z3.ArithRef, z3.ArithRef]
) -> z3.ArithRef:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def build(
    *, malformed: bool = False, rational_witness: bool = False
) -> tuple[z3.Solver, dict[str, tuple[z3.ArithRef, z3.ArithRef]]]:
    names = ("q1", "q2", "c1", "c2", "p1", "p2", "r1", "r2")
    pts = {name: (z3.Real(f"{name}_x"), z3.Real(f"{name}_y")) for name in names}
    q = (z3.RealVal(0), z3.RealVal(0))
    # A fixed frame is only a local coordinate witness, not a theorem-level
    # normalization of the full Lean surface.
    opp = (z3.RealVal(0), z3.RealVal(-1) / 2)
    s = z3.SolverFor("QF_NRA")
    s.set(timeout=30_000, random_seed=9717)
    # Every named point is distinct from the common blocker center.
    for name in names:
        s.add(d2(pts[name], q) > 0)
    # Four exact row points on the common-blocker circle of radius one.
    for name in ("q1", "q2", "c1", "c2"):
        s.add(d2(pts[name], q) == 1)
    for i, left in enumerate(("q1", "q2", "c1", "c2")):
        for right in ("q1", "q2", "c1", "c2")[i + 1 :]:
            s.add(d2(pts[left], pts[right]) > 0)
    if malformed:
        # Known UNSAT control: distinct points cannot lie on both radius-one
        # and radius-two circles around the same center.
        for name in ("q1", "q2", "c1", "c2"):
            s.add(d2(pts[name], q) == 4)
    else:
        # Strict first-cap positions: this local cap is the open half-plane
        # y > 0; Q1/Q2 are retained outside it to preserve the named split.
        for name in ("c1", "c2", "p1", "p2", "r1", "r2"):
            s.add(pts[name][1] > 0)
        for name in ("q1", "q2"):
            s.add(pts[name][1] < 0)
        # Distinct first-apex radii for the two C points.
        s.add(d2(pts["c1"], opp) != d2(pts["c2"], opp))
        # Retained two-radius packet, with exact radii 2 and 3.
        for name in ("p1", "p2"):
            s.add(d2(pts[name], opp) == 4)
        for name in ("r1", "r2"):
            s.add(d2(pts[name], opp) == 9)
        for left in ("p1", "p2", "r1", "r2"):
            for right in ("p1", "p2", "r1", "r2"):
                if left < right:
                    s.add(d2(pts[left], pts[right]) > 0)
        if rational_witness:
            # An independent exact-rational replay witness.  The free run can
            # choose algebraic circle coordinates; this branch makes the
            # existence result auditable by plain Fraction substitution.
            witness = {
                "q1": (-z3.Q(4, 5), -z3.Q(3, 5)),
                "q2": (z3.Q(3, 5), -z3.Q(4, 5)),
                "c1": (z3.Q(4, 5), z3.Q(3, 5)),
                "c2": (-z3.Q(3, 5), z3.Q(4, 5)),
                "p1": (z3.Q(6, 5), z3.Q(11, 10)),
                "p2": (-z3.Q(6, 5), z3.Q(11, 10)),
                "r1": (z3.Q(9, 5), z3.Q(19, 10)),
                "r2": (-z3.Q(9, 5), z3.Q(19, 10)),
            }
            for name, (x, y) in witness.items():
                s.add(pts[name][0] == x, pts[name][1] == y)
    return s, pts


def frac(value: z3.ExprRef) -> str:
    value = z3.simplify(value)
    if z3.is_rational_value(value):
        return str(Fraction(value.numerator_as_long(), value.denominator_as_long()))
    return str(value)


def run(
    label: str, malformed: bool, rational_witness: bool = False
) -> dict[str, object]:
    solver, pts = build(malformed=malformed, rational_witness=rational_witness)
    smt = ART / f"{label}.smt2"
    smt.write_text(
        "(set-logic QF_NRA)\n" + solver.sexpr() + "\n(check-sat)\n", encoding="utf-8"
    )
    result = solver.check()
    record: dict[str, object] = {"label": label, "z3": str(result), "smt2": str(smt)}
    if result == z3.sat:
        model = solver.model()
        values = {
            name: [frac(model.eval(coord, model_completion=True)) for coord in point]
            for name, point in pts.items()
        }
        record["readback"] = values
        (READBACK / f"{label}.json").write_text(
            json.dumps(record, indent=2) + "\n", encoding="utf-8"
        )
    cvc5 = subprocess.run(
        ["cvc5", "--lang", "smt2", "--tlimit=30000", str(smt)],
        capture_output=True,
        text=True,
        timeout=40,
        check=False,
    )
    record["cvc5"] = (
        cvc5.stdout.strip() or f"exit={cvc5.returncode}; stderr={cvc5.stderr.strip()}"
    )
    return record


if __name__ == "__main__":
    print(
        json.dumps(
            [
                run("sat_source_local", False),
                run("sat_source_exact_rational_witness", False, rational_witness=True),
                run("unsat_malformed_two_radii", True),
            ],
            indent=2,
        )
    )
