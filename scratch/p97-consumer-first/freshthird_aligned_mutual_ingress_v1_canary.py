#!/usr/bin/env python3
"""Bounded structural canary for the FreshThird aligned+mutual ingress.

This is intentionally independent of every earlier FreshThird metric/cut
encoder.  It encodes only the contract documented in the sibling origin file.
The two smoke checks are positive SAT and an overfull selected-row UNSAT check;
neither is a geometric or universal result.
"""

from __future__ import annotations

import argparse
from pathlib import Path

from z3 import Bool, BoolVal, If, Int, Solver, Sum, sat, unknown


HERE = Path(__file__).resolve().parent
STEM = HERE / "freshthird_aligned_mutual_ingress_v1"

# Abstract names mirror the two retained collision pairs and two source rows.
# No filler points are needed: the two source labels plus the four endpoint
# labels already give the smallest carrier on which a four-row canary can
# realize every fixed deletion arm.
POINTS = ("source0", "source1", "p1", "p2", "q1", "q2")
SOURCE = ("source0", "source1")
ENDPOINT_ARMS = (
    ("p1", "q1"),
    ("p1", "q2"),
    ("p2", "q1"),
    ("p2", "q2"),
)


def _sum_bools(items):
    return Sum([If(item, 1, 0) for item in items])


def build_contract(*, overfull_row: int | None = None) -> tuple[Solver, dict]:
    solver = Solver()
    solver.set(timeout=10_000)
    rows = {
        row: {point: Bool(f"row{row}_{point}") for point in POINTS}
        for row in range(2)
    }
    slices = {
        row: {point: Bool(f"firstApexSlice{row}_{point}") for point in POINTS}
        for row in range(2)
    }
    radii = [Int("firstApexRadius0"), Int("firstApexRadius1")]
    arms = [Int("deletionArm0"), Int("deletionArm1")]
    first_apex_failure = [Bool(f"firstApexFailure{row}") for row in range(2)]
    minimal_core_nonempty = [Bool(f"minimalDeletionCoreNonempty{row}") for row in range(2)]

    # FreshThirdAlignedRetainedConsumerPacket.1 and source_ne are represented
    # by the two labelled sources and the strict radius inequality.
    solver.add(radii[0] != radii[1])

    for row in range(2):
        support = rows[row]
        own_source = SOURCE[row]
        other_source = SOURCE[1 - row]

        # CapSourceThirdCanonicalRowWitness: source.1 ∈ selected support and
        # selected support.card = 4.
        solver.add(support[own_source])
        solver.add(_sum_bools(support.values()) == 4)

        # TwoCapSourcesMutualCrossMembership: actual reciprocal support hits.
        solver.add(support[other_source])

        # First-apex singleton slice equality from
        # firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned.
        for point in POINTS:
            solver.add(slices[row][point] == BoolVal(point == own_source))
        solver.add(slices[row][own_source])
        solver.add(_sum_bools(slices[row].values()) == 1)

        # FreshThirdAlignedSourceDeletionCoreCases: exactly one of the four
        # fixed endpoint choices is selected for this row.
        solver.add(arms[row] >= 0, arms[row] < len(ENDPOINT_ARMS))
        for arm_index, (x, y) in enumerate(ENDPOINT_ARMS):
            chosen = arms[row] == arm_index
            # FreshThirdAlignedFixedDeletionCorePacket: x and y are omitted
            # from this selected row.
            solver.add(If(chosen, If(support[x], 1, 0), 0) == 0)
            solver.add(If(chosen, If(support[y], 1, 0), 0) == 0)
            # Same packet's HasNEquidistantPointsAt 4 after double erase,
            # represented solely by the surviving selected-row cardinality.
            survivor_count = _sum_bools(
                support[point] for point in POINTS if point not in (x, y)
            )
            solver.add(If(chosen, survivor_count, 4) == 4)

        # The source packet explicitly retains these facts.  They are Boolean
        # ingress facts, not guessed geometric consequences.
        solver.add(first_apex_failure[row])
        solver.add(minimal_core_nonempty[row])

    # Negative smoke mode deliberately contradicts the source support.card=4
    # field.  Keep the contradiction localized to the requested overfull row.
    if overfull_row is not None:
        solver.add(_sum_bools(rows[overfull_row].values()) == 5)

    return solver, {
        "rows": rows,
        "slices": slices,
        "radii": radii,
        "arms": arms,
        "first_apex_failure": first_apex_failure,
        "minimal_core_nonempty": minimal_core_nonempty,
    }


def _check(label: str, *, overfull_row: int | None, smt_path: Path) -> tuple[str, str]:
    solver, context = build_contract(overfull_row=overfull_row)
    smt_path.write_text(
        "(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n",
        encoding="utf-8",
    )
    result = solver.check()
    if result == unknown:
        raise RuntimeError(f"fail-closed: {label} returned unknown ({solver.reason_unknown()})")
    expected_name = "sat" if overfull_row is None else "unsat"
    actual_name = "sat" if result == sat else "unsat"
    if actual_name != expected_name:
        raise RuntimeError(f"{label}: expected {expected_name}, got {actual_name}")

    detail = [f"{label}={actual_name}"]
    if result == sat:
        model = solver.model()
        detail.append(
            "arms=" + ",".join(str(model.eval(v, model_completion=True)) for v in context["arms"])
        )
        for row in range(2):
            members = [
                point
                for point, var in context["rows"][row].items()
                if model.eval(var, model_completion=True)
            ]
            detail.append(f"row{row}_support=" + ",".join(members))
    return actual_name, " ".join(detail)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--results", type=Path, default=STEM.with_name(STEM.name + "_results.txt"))
    args = parser.parse_args()
    positive_smt = STEM.with_name(STEM.name + "_positive.smt2")
    overfull_smt = STEM.with_name(STEM.name + "_overfull_row.smt2")
    try:
        positive, positive_detail = _check("positive_contract", overfull_row=None, smt_path=positive_smt)
        negative, negative_detail = _check("negative_overfull_row0", overfull_row=0, smt_path=overfull_smt)
    except RuntimeError as exc:
        args.results.write_text(f"status=FAIL\n{exc}\n", encoding="utf-8")
        print(f"status=FAIL {exc}")
        return 1
    lines = [
        "campaign=freshthird_aligned_mutual_ingress_v1",
        "claim_scope=bounded structural diagnostic only; no universal closure",
        "source_model=only named retained producer facts; no stale metric cuts",
        f"{positive_detail}",
        f"{negative_detail}",
        "unknown_policy=fail-closed",
        f"positive_smt={positive_smt}",
        f"overfull_smt={overfull_smt}",
    ]
    args.results.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("status=PASS")
    print(f"positive={positive} negative_overfull_row0={negative}")
    print(f"results={args.results}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
