#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent exact-QF_NRA cross-check of `residual_456_exact_witness.json`.

The primary checker uses a hand-written biquadratic field and rational
intervals.  This checker instead feeds the serialized coordinates and the two
positive square-root equations to Z3/NLSAT, then asks for a counterexample to
each claimed family of identities or inequalities.  Every query must be
``unsat``.  This is trusted exact solver evidence, not a Lean kernel proof.
"""

from __future__ import annotations

import itertools
import json
from fractions import Fraction
from pathlib import Path
from typing import Any, Iterable

import z3


HERE = Path(__file__).resolve().parent
REPORT = HERE / "residual_456_exact_witness.json"
ROWS = {
    0: (1, 3, 4, 5),
    1: (0, 2, 5, 6),
    2: (1, 7, 8, 9),
    3: (0, 7, 10, 11),
}
ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
BLOCKER_OF_SOURCE = {
    0: 1,
    1: 0,
    2: 1,
    3: 0,
    4: 0,
    5: 0,
    6: 1,
    7: 2,
    8: 2,
    9: 2,
    10: 3,
    11: 3,
}


def rational(text: str) -> z3.ArithRef:
    value = Fraction(text)
    return z3.RealVal(f"{value.numerator}/{value.denominator}")


def check_unsat(
    roots: Iterable[z3.BoolRef], bad: z3.BoolRef, name: str
) -> None:
    solver = z3.Tactic("qfnra-nlsat").solver()
    solver.set("timeout", 30_000)
    solver.add(*roots, bad)
    verdict = solver.check()
    if verdict != z3.unsat:
        raise AssertionError(f"{name}: expected unsat, got {verdict}: {solver.reason_unknown()}")


def main() -> int:
    report = json.loads(REPORT.read_text(encoding="utf-8"))
    if not report["epistemic_status"].startswith("EXACT_BIQUADRATIC"):
        raise AssertionError("unexpected primary witness status")
    sqrt3 = z3.Real("sqrt3")
    sqrtk = z3.Real("sqrtk")
    k = rational(report["field"]["K"])
    roots = (
        sqrt3 > 0,
        sqrt3 * sqrt3 == 3,
        sqrtk > 0,
        sqrtk * sqrtk == k,
    )
    check_unsat(roots, z3.BoolVal(False), "root consistency control")
    root_solver = z3.Tactic("qfnra-nlsat").solver()
    root_solver.add(*roots)
    if root_solver.check() != z3.sat:
        raise AssertionError("positive root system is not satisfiable")

    def decode(coefficients: list[str]) -> z3.ArithRef:
        c0, c1, c2, c3 = map(rational, coefficients)
        return c0 + c1 * sqrt3 + c2 * sqrtk + c3 * sqrt3 * sqrtk

    points: dict[int, tuple[z3.ArithRef, z3.ArithRef]] = {
        int(label): (decode(point["x"]), decode(point["y"]))
        for label, point in report["construction"][
            "coordinates_by_basis_coefficients"
        ].items()
    }

    def d2(left: int, right: int) -> z3.ArithRef:
        dx = points[left][0] - points[right][0]
        dy = points[left][1] - points[right][1]
        return z3.simplify(dx * dx + dy * dy)

    def cross(a: int, b: int, c: int) -> z3.ArithRef:
        abx = points[b][0] - points[a][0]
        aby = points[b][1] - points[a][1]
        acx = points[c][0] - points[a][0]
        acy = points[c][1] - points[a][1]
        return z3.simplify(abx * acy - aby * acx)

    row_failures = [
        d2(center, label) != 1
        for center, support in ROWS.items()
        for label in support
    ]
    check_unsat(roots, z3.Or(*row_failures), "row identities")

    exact_failures = [
        d2(center, label) == 1
        for center, support in ROWS.items()
        for label in range(12)
        if label not in support
    ]
    check_unsat(roots, z3.Or(*exact_failures), "exact-row exclusions")

    distinct_failures = [
        d2(left, right) <= 0
        for left in range(12)
        for right in range(left + 1, 12)
    ]
    check_unsat(roots, z3.Or(*distinct_failures), "pairwise distinctness")

    convex_failures = []
    for index, left in enumerate(ORDER):
        right = ORDER[(index + 1) % len(ORDER)]
        convex_failures.extend(
            cross(left, right, label) <= 0
            for label in ORDER
            if label not in (left, right)
        )
    check_unsat(roots, z3.Or(*convex_failures), "strict convexity")

    cap_data = {
        "S": (0, 1, 2, {1, 2, 3, 4}),
        "O1": (1, 2, 0, {0, 2, 5, 6, 7}),
        "O2": (2, 0, 1, {0, 1, 8, 9, 10, 11}),
    }
    cap_failures = []
    for _name, (opposite, left, right, members) in cap_data.items():
        opposite_area = cross(opposite, left, right)
        for label in range(12):
            product = cross(label, left, right) * opposite_area
            cap_failures.append(product > 0 if label in members else product <= 0)
    check_unsat(roots, z3.Or(*cap_failures), "cap arc membership")

    mec = report["mec_audit"]
    center_x = rational(mec["moser_circle_center"][0])
    center_y = rational(mec["moser_circle_center"][1])
    radius2 = decode(mec["moser_circle_radius_squared"])
    mec_failures = []
    for label in range(12):
        dx = points[label][0] - center_x
        dy = points[label][1] - center_y
        gap = z3.simplify(dx * dx + dy * dy - radius2)
        classification = mec["point_classification"][str(label)]
        if classification == "boundary":
            mec_failures.append(gap != 0)
        elif classification == "inside":
            mec_failures.append(gap >= 0)
        elif classification == "outside":
            mec_failures.append(gap <= 0)
        else:
            raise AssertionError(f"unknown MEC classification {classification}")
    check_unsat(roots, z3.Or(*mec_failures), "Moser circumdisk classification")

    def has_four_equal(center: int, labels: Iterable[int]) -> z3.BoolRef:
        alternatives = []
        for quadruple in itertools.combinations(labels, 4):
            radius = d2(center, quadruple[0])
            alternatives.append(
                z3.And(*(d2(center, label) == radius for label in quadruple[1:]))
            )
        return z3.Or(*alternatives)

    for center in range(4, 12):
        labels = [label for label in range(12) if label != center]
        check_unsat(
            roots,
            has_four_equal(center, labels),
            f"absence of global K4 at center {center}",
        )

    for source, blocker in BLOCKER_OF_SOURCE.items():
        if source not in ROWS[blocker]:
            raise AssertionError("saved source is not in blocker support")
        labels = [
            label for label in range(12) if label not in (source, blocker)
        ]
        check_unsat(
            roots,
            has_four_equal(blocker, labels),
            f"no-q-free deletion source {source}, blocker {blocker}",
        )

    print(
        json.dumps(
            {
                "schema": "p97-atail-residual-456-z3-crosscheck-v1",
                "epistemic_status": "EXACT_QF_NRA_CROSSCHECK_NOT_KERNEL_PROOF",
                "z3_version": z3.get_version_string(),
                "row_identity_checks": len(row_failures),
                "exact_exclusion_checks": len(exact_failures),
                "pairwise_distinctness_checks": len(distinct_failures),
                "strict_convexity_checks": len(convex_failures),
                "cap_arc_checks": len(cap_failures),
                "MEC_classification_checks": len(mec_failures),
                "global_K4_absence_centers": list(range(4, 12)),
                "no_qfree_source_checks": len(BLOCKER_OF_SOURCE),
                "status": "PASS_ALL_NEGATED_CLAIMS_UNSAT",
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
