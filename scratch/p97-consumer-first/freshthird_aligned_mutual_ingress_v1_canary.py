#!/usr/bin/env python3
"""Bounded structural canary for the FreshThird aligned+mutual ingress.

This is independent of every earlier FreshThird metric/cut encoder.  It
encodes only the source contract documented in the sibling origin file.  The
finite carrier is bookkeeping for selected-row membership, not a geometric
configuration.
"""

from __future__ import annotations

import argparse
from pathlib import Path

from z3 import And, Bool, BoolVal, If, Implies, Int, Solver, Sum, sat, unknown


HERE = Path(__file__).resolve().parent
STEM = HERE / "freshthird_aligned_mutual_ingress_v1"

# The two sources, four deletion endpoints, and two bookkeeping fillers permit
# every common-endpoint arm pair and the guarded all-endpoint-omission branch
# while retaining identical four-element rows.  Fillers are not claimed points
# of D.A or D.Aρ.
POINTS = ("source0", "source1", "p1", "p2", "q1", "q2", "f0", "f1")
SOURCE = ("source0", "source1")
ENDPOINT_ARMS = (
    ("p1", "q1"),
    ("p1", "q2"),
    ("p2", "q1"),
    ("p2", "q2"),
)
NORMALIZED_ARM_PAIRS = tuple(
    (first, second)
    for first in range(4)
    for second in range(4)
    if first // 2 == second // 2 or first % 2 == second % 2
)
KNOWN_IMPOSSIBLE_ARMS = ((0, 3), (1, 2), (2, 1), (3, 0))


def _sum_bools(items):
    return Sum([If(item, 1, 0) for item in items])


def build_contract(
    *,
    overfull_row: int | None = None,
    fixed_arms: tuple[int, int] | None = None,
    force_common_index_opp: bool = False,
) -> tuple[Solver, dict]:
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
    p_choices = [Int(f"deletionPChoice{row}") for row in range(2)]
    q_choices = [Int(f"deletionQChoice{row}") for row in range(2)]
    first_apex_failure = [Bool(f"firstApexFailure{row}") for row in range(2)]
    minimal_core_nonempty = [Bool(f"minimalDeletionCoreNonempty{row}") for row in range(2)]

    # FreshThirdAlignedRetainedConsumerPacket.1.
    solver.add(radii[0] != radii[1])
    solver.add(Bool("firstCapMultiPointRadiiRetained"))

    # FreshThirdAlignedEqualBlockerResidual: equal actual blockers, with one
    # common capInteriorByIndex witness.  No index is localized to a first cap.
    blocker_ids = [Int(f"actualBlocker{row}") for row in range(2)]
    common_cap_index = Int("commonCapInteriorIndex")
    opp_index1 = Int("oppIndex1")
    solver.add(blocker_ids[0] == blocker_ids[1])
    solver.add(0 <= common_cap_index, common_cap_index < 3)
    solver.add(0 <= opp_index1, opp_index1 < 3)
    blocker_cap_membership = [
        [Bool(f"blocker{row}_in_capInterior{i}") for i in range(3)]
        for row in range(2)
    ]
    for index in range(3):
        solver.add(
            Implies(
                common_cap_index == index,
                And(
                    blocker_cap_membership[0][index],
                    blocker_cap_membership[1][index],
                ),
            )
        )

    for row in range(2):
        support = rows[row]
        own_source = SOURCE[row]
        other_source = SOURCE[1 - row]

        # CapSourceThirdCanonicalRowWitness.
        solver.add(support[own_source])
        solver.add(_sum_bools(support.values()) == 4)

        # TwoCapSourcesMutualCrossMembership: actual reciprocal support hits.
        solver.add(support[other_source])

        # FreshThirdAlignedRetainedConsumerPacket singleton slices.
        for point in POINTS:
            solver.add(slices[row][point] == BoolVal(point == own_source))
        solver.add(_sum_bools(slices[row].values()) == 1)

        # FreshThirdAlignedSourceDeletionCoreCases: one fixed P x Q arm.
        solver.add(arms[row] == 2 * p_choices[row] + q_choices[row])
        solver.add(0 <= p_choices[row], p_choices[row] < 2)
        solver.add(0 <= q_choices[row], q_choices[row] < 2)
        for arm_index, (x, y) in enumerate(ENDPOINT_ARMS):
            chosen = arms[row] == arm_index
            # FreshThirdAlignedFixedDeletionCorePacket endpoint omissions.
            solver.add(Implies(chosen, And(support[x] == False, support[y] == False)))
            # Its surviving selected-row cardinality after double erase.
            survivor_count = _sum_bools(
                support[point] for point in POINTS if point not in (x, y)
            )
            solver.add(If(chosen, survivor_count, 4) == 4)

        # The source packet retains these facts as propositions; no geometric
        # encoding is invented for the failure or minimal-core fields.
        solver.add(first_apex_failure[row])
        solver.add(minimal_core_nonempty[row])

    # The equal-blocker source theorem gives exact selected-support equality.
    for point in POINTS:
        solver.add(rows[0][point] == rows[1][point])

    # Conditional first-cap consequences from the equal-blocker branch of
    # freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership.
    # The intersection vector is only an abstract membership representation of
    # the exact set equality; it carries no unproved cap geometry.
    shell_intersection = {
        point: Bool(f"shellIntersectsFirstCap_{point}") for point in POINTS
    }
    endpoint_omitted = {
        point: Bool(f"allCollisionEndpointsOmitted_{point}")
        for point in ("p1", "p2", "q1", "q2")
    }
    guarded_first_cap = common_cap_index == opp_index1
    for point in POINTS:
        solver.add(
            Implies(
                guarded_first_cap,
                shell_intersection[point] == BoolVal(point in SOURCE),
            )
        )
    for point, omitted in endpoint_omitted.items():
        solver.add(
            omitted == And(rows[0][point] == False, rows[1][point] == False)
        )
        solver.add(Implies(guarded_first_cap, omitted))

    # FreshThirdAlignedCommonDeletionCorePairPacket: a common endpoint lies in
    # the P pair or the Q pair, and both rows use that endpoint in their core.
    common_endpoint_in_p = Bool("commonDeletionEndpointInP")
    common_endpoint_slot = Int("commonDeletionEndpointSlot")
    solver.add(0 <= common_endpoint_slot, common_endpoint_slot < 2)
    solver.add(
        If(
            common_endpoint_in_p,
            And(
                p_choices[0] == common_endpoint_slot,
                p_choices[1] == common_endpoint_slot,
            ),
            And(
                q_choices[0] == common_endpoint_slot,
                q_choices[1] == common_endpoint_slot,
            ),
        )
    )

    if fixed_arms is not None:
        first, second = fixed_arms
        if first not in range(4) or second not in range(4):
            raise ValueError(f"invalid fixed arm pair: {fixed_arms}")
        solver.add(arms[0] == first, arms[1] == second)
    if force_common_index_opp:
        solver.add(guarded_first_cap)

    # Negative smoke mode deliberately contradicts support.card = 4.
    if overfull_row is not None:
        solver.add(_sum_bools(rows[overfull_row].values()) == 5)

    return solver, {
        "rows": rows,
        "slices": slices,
        "radii": radii,
        "arms": arms,
        "first_apex_failure": first_apex_failure,
        "minimal_core_nonempty": minimal_core_nonempty,
        "common_cap_index": common_cap_index,
        "opp_index1": opp_index1,
        "guarded_first_cap": guarded_first_cap,
        "shell_intersection": shell_intersection,
        "endpoint_omitted": endpoint_omitted,
    }


def _check(
    label: str,
    *,
    overfull_row: int | None,
    fixed_arms: tuple[int, int] | None,
    expected: str,
    force_common_index_opp: bool,
    smt_path: Path,
) -> tuple[str, str]:
    solver, context = build_contract(
        overfull_row=overfull_row,
        fixed_arms=fixed_arms,
        force_common_index_opp=force_common_index_opp,
    )
    smt_path.write_text(
        "(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n",
        encoding="utf-8",
    )
    result = solver.check()
    if result == unknown:
        raise RuntimeError(f"fail-closed: {label} returned unknown ({solver.reason_unknown()})")
    actual_name = "sat" if result == sat else "unsat"
    if actual_name != expected:
        raise RuntimeError(f"{label}: expected {expected}, got {actual_name}")

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
                if bool(model.eval(var, model_completion=True))
            ]
            detail.append(f"row{row}_support=" + ",".join(members))
    return actual_name, " ".join(detail)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--results", type=Path, default=STEM.with_name(STEM.name + "_results.txt"))
    args = parser.parse_args()
    checks = [
        (
            "positive_contract",
            None,
            None,
            "sat",
            False,
            STEM.with_name(STEM.name + "_positive.smt2"),
        ),
        (
            "guarded_first_cap_consequence",
            None,
            None,
            "sat",
            True,
            STEM.with_name(STEM.name + "_guarded_first_cap.smt2"),
        ),
        (
            "negative_overfull_row0",
            0,
            None,
            "unsat",
            False,
            STEM.with_name(STEM.name + "_overfull_row.smt2"),
        ),
    ]
    for first, second in KNOWN_IMPOSSIBLE_ARMS:
        checks.append(
            (
                f"negative_no_common_arm_{first:02d}_{second:02d}",
                None,
                (first, second),
                "unsat",
                False,
                STEM.with_name(STEM.name + f"_no_common_arm_{first:02d}_{second:02d}.smt2"),
            )
        )
    for first, second in NORMALIZED_ARM_PAIRS:
        checks.append(
            (
                f"normalized_arm_{first:02d}_{second:02d}",
                None,
                (first, second),
                "sat",
                False,
                STEM.with_name(STEM.name + f"_arm{first}{second}.smt2"),
            )
        )

    lines = [
        "campaign=freshthird_aligned_mutual_ingress_v1",
        "claim_scope=bounded structural diagnostic only; no universal closure",
        "source_model=only named retained producer facts; no stale metric cuts",
        "unknown_policy=fail-closed",
    ]
    try:
        for (
            label,
            overfull_row,
            fixed_arms,
            expected,
            force_common_index_opp,
            smt_path,
        ) in checks:
            _, detail = _check(
                label,
                overfull_row=overfull_row,
                fixed_arms=fixed_arms,
                expected=expected,
                force_common_index_opp=force_common_index_opp,
                smt_path=smt_path,
            )
            lines.append(detail)
            lines.append(f"{label}_smt={smt_path}")
    except (RuntimeError, ValueError) as exc:
        args.results.write_text("status=FAIL\n" + "\n".join(lines) + f"\n{exc}\n", encoding="utf-8")
        print(f"status=FAIL {exc}")
        return 1

    lines.insert(3, f"normalized_common_endpoint_arm_pairs={len(NORMALIZED_ARM_PAIRS)}")
    lines.insert(4, f"known_impossible_endpoint_arm_pairs={len(KNOWN_IMPOSSIBLE_ARMS)}")
    lines.insert(4, "filler_label=f0,f1 are bookkeeping only, not geometric point claims")
    args.results.write_text("status=PASS\n" + "\n".join(lines) + "\n", encoding="utf-8")
    print("status=PASS")
    print(f"checks={len(checks)} (1 positive, {len(NORMALIZED_ARM_PAIRS)} normalized pairs, {len(KNOWN_IMPOSSIBLE_ARMS)+1} negative controls, guarded branch)")
    print(f"results={args.results}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
