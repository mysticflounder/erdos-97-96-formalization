#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Source-mapped finite named-role quotient for one repaired FirstNonHit wave."""

from __future__ import annotations

import itertools
from dataclasses import dataclass


CASES = ("retained", "common", "common_sameblocker")
Q = ("q0", "q1", "q2", "q3")
C = ("c_first", "c_second")
ACTIVE = {
    "retained": Q + C + ("ret_z", "ret_w"),
    "common": Q + C,
    "common_sameblocker": Q + C + ("w0", "w1", "w2", "w3"),
}

# Exact production RowPattern from ThirteenPointSevenCircleCollision.lean.
PATTERN = {
    1: (0, 3, 6, 8),
    2: (3, 0, 7, 10),
    3: (6, 1, 5, 8),
    4: (10, 2, 6, 7),
    5: (9, 3, 10, 8),
    7: (11, 1, 3, 9),
    8: (12, 2, 3, 7),
}
PATTERN_CENTERS = tuple(PATTERN)
PATTERN_LABELS = tuple(range(13))


def v(role: str) -> str:
    return f"v_{role}"


def b(role: str) -> str:
    return f"b_{role}"


def slot(role: str, index: int) -> str:
    return f"s_{role}_{index}"


def slots(role: str) -> tuple[str, ...]:
    return tuple(slot(role, i) for i in range(4))


def smt_and(parts: list[str] | tuple[str, ...]) -> str:
    if not parts:
        return "true"
    if len(parts) == 1:
        return parts[0]
    return "(and " + " ".join(parts) + ")"


def smt_or(parts: list[str] | tuple[str, ...]) -> str:
    if not parts:
        return "false"
    if len(parts) == 1:
        return parts[0]
    return "(or " + " ".join(parts) + ")"


def member(role: str, point_term: str) -> str:
    """Exact membership in the four-slot selected support for role's row."""
    return smt_or([f"(= {point_term} {s})" for s in slots(role)])


def overlap_count(left: str, right: str) -> str:
    return "(+ " + " ".join(
        f"(ite {member(right, s)} 1 0)" for s in slots(left)
    ) + ")"


def same_support(left: str, right: str) -> str:
    # Both supports are already exact, duplicate-free four-sets.  Mutual
    # inclusion makes the intended equality explicit for auditing.
    return smt_and(
        [member(right, s) for s in slots(left)]
        + [member(left, s) for s in slots(right)]
    )


@dataclass
class Formula:
    lines: list[str]
    catalog: list[dict]
    assertion_index: int = 0

    def declare(self, sort: str, *names: str) -> None:
        for name in names:
            self.lines.append(f"(declare-const {name} {sort})")

    def add(self, expression: str, group: str, source: str) -> None:
        name = f"a{self.assertion_index:04d}_{group}"
        self.assertion_index += 1
        self.lines.append(f"(assert (! {expression} :named {name}))")
        self.catalog.append({"name": name, "group": group, "source": source})


def build(case: str) -> tuple[str, list[dict]]:
    if case not in CASES:
        raise ValueError(case)
    roles = ACTIVE[case]
    f = Formula(
        [
            "(set-logic QF_LIA)",
            "(set-option :produce-models true)",
            "(set-option :produce-unsat-cores true)",
        ],
        [],
    )
    for role in roles:
        f.declare("Int", v(role), b(role), *slots(role))
    f.declare(
        "Int", "first_tag", "first_deleted", "second_tag", "second_deleted",
        "second_source_cap", "q_cap", "repeat_z", "repeat_w",
    )
    for i in range(4):
        f.declare("Int", f"blocker_cap_{i}")
        f.declare("Bool", f"q{i}_source_in_its_blocker_cap")
    f.declare("Bool", "q_center_nonrobust", "second_internal_q0", "second_internal_q1")

    # Every materialized source has its actual selected CriticalFourShell:
    # exact cardinality four, source membership, and center nonmembership.
    for role in roles:
        f.add(f"(distinct {' '.join(slots(role))})", "support4", "CriticalFourShell.support_card")
        f.add(member(role, v(role)), "source_mem", "CriticalFourShell.q_mem_support")
        f.add(smt_and([f"(not (= {b(role)} {s}))" for s in slots(role)]),
              "center_off_support", "CriticalFourShell.center_not_mem_support")

    # Equal source values are the same CarrierVertex, hence have the same
    # actual blocker.  Equal blocker centers have exactly equal supports.
    for left, right in itertools.combinations(roles, 2):
        f.add(f"(=> (= {v(left)} {v(right)}) (= {b(left)} {b(right)}))",
              "alias_functional", "CriticalShellSystem.centerAt proof irrelevance")
        f.add(f"(=> (= {b(left)} {b(right)}) {same_support(left, right)})",
              "same_blocker_support", "selectedSupports_eq_of_actualBlockers_eq")
        f.add(f"(=> (not (= {b(left)} {b(right)})) (<= {overlap_count(left, right)} 2))",
              "distinct_center_overlap", "SelectedFourClass.inter_card_le_two")

    # The actual theorem has a carrier-wide fiber bound.  On the named-role
    # quotient it forbids every five pairwise-distinct named sources with one
    # blocker.  Aliases count once, as actual Finset cardinality requires.
    for five in itertools.combinations(roles, 5):
        source_terms = [v(role) for role in five]
        equal_blockers = [f"(= {b(five[0])} {b(role)})" for role in five[1:]]
        f.add(f"(not {smt_and([f'(distinct {' '.join(source_terms)})', *equal_blockers])})",
              "fiber_le4", "actualBlockerFiber_card_le_four")

    # Q.source1/Q.source2 plus the anonymous two support fillers materialized
    # as carrier-source roles.  No C or auxiliary inequality is added here.
    f.add(f"(distinct {' '.join(v(role) for role in Q)})", "q_support4",
          "CriticalFourShell.support_card + support_subset_A")
    for i, role in enumerate(Q):
        f.add(f"(= {slot('q0', i)} {v(role)})", "q_support4",
              "Q row exact four-support enumeration")
    f.add(f"(= {b('q0')} {b('q1')})", "q_pair_blocker",
          "FreshThirdBlockerFiber.blockers_eq")

    # C supplies exactly one proved inequality.  C/Q/aux aliases otherwise
    # remain legal and are resolved by the functional/equal-support clauses.
    f.add(f"(not (= {v('c_first')} {v('c_second')}))", "c_sources_ne",
          "TwoCapSourceThirdCanonicalRowSurface.sources_ne")

    # Source-faithful deletion fan on every Q-support point.  Blocker-cap
    # placement is retained, as is the exact same-center/nonrobust arm.
    for i, role in enumerate(Q):
        f.add(f"(and (<= 0 blocker_cap_{i}) (<= blocker_cap_{i} 2))",
              "q_deletion_fan", "SourceFaithfulSelectedFourDeletionFan")
        f.add(f"(=> (= {b(role)} {b('q0')}) q_center_nonrobust)",
              "q_deletion_fan", "SourceFaithfulSelectedFourDeletionFan same-center arm")

    # Exact blocker boundary: the exact-four arm is detected by all four Q
    # support sources sharing the Q blocker; otherwise q2 or q3 is a distinct
    # center row.  Its two omissions follow from exact four supports and the
    # universal overlap<=2 clause, so no surrogate qdist is asserted.
    f.add(
        smt_or([
            smt_and([f"(= {b('q2')} {b('q0')})", f"(= {b('q3')} {b('q0')})"]),
            f"(not (= {b('q2')} {b('q0')}))",
            f"(not (= {b('q3')} {b('q0')}))",
        ]),
        "q_boundary", "freshThird_qRow_exact_blocker_boundary",
    )

    # Repeated-cap pair.  Cross-deletion survival is encoded by exact
    # selected-support nonmembership, using the proved iff.
    f.add("(and (<= 0 repeat_z) (<= repeat_z 3) (<= 0 repeat_w) (<= repeat_w 3) (not (= repeat_z repeat_w)))",
          "repeat_pair", "exists_repeatedBlockerCap_pair_outcome")
    pair_arms: list[str] = []
    for i, j in itertools.permutations(range(4), 2):
        ri, rj = Q[i], Q[j]
        outcome = smt_or([
            f"(= {b(ri)} {b(rj)})",
            f"q{i}_source_in_its_blocker_cap",
            f"q{j}_source_in_its_blocker_cap",
            f"(not {member(ri, v(rj))})",
            f"(not {member(rj, v(ri))})",
        ])
        pair_arms.append(smt_and([
            f"(= repeat_z {i})", f"(= repeat_w {j})",
            f"(= blocker_cap_{i} blocker_cap_{j})", outcome,
        ]))
    f.add(smt_or(pair_arms), "repeat_pair", "exists_repeatedBlockerCap_pair_outcome")

    # First NonHit (two constructors) and second Interaction (four).
    f.add("(or (= first_tag 0) (= first_tag 1))", "first_nonhit", "FreshThirdCapSourceNonHit")
    f.add("(or (= first_deleted 0) (= first_deleted 1))", "first_nonhit", "FreshThirdCapSourceNonHit.deleted_eq")
    first_deleted_term = f"(ite (= first_deleted 0) {v('q0')} {v('q1')})"
    f.add(f"(=> (= first_tag 0) (= {b('c_first')} {b('q0')}))",
          "first_nonhit", "FreshThirdCapSourceNonHit.sameBlocker")
    f.add(f"(=> (= first_tag 1) (and (not (= {b('c_first')} {b('q0')})) (not {member('c_first', first_deleted_term)})))",
          "first_nonhit", "FreshThirdCapSourceNonHit.sourceRowOmission + center_ne theorem")

    f.add("(and (<= 0 second_tag) (<= second_tag 3))", "second_interaction", "FreshThirdCapSourceInteraction")
    f.add("(or (= second_deleted 0) (= second_deleted 1))", "second_interaction", "FreshThirdCapSourceInteraction.deleted_eq")
    f.add("(and (<= 0 second_source_cap) (<= second_source_cap 2) (<= 0 q_cap) (<= q_cap 2))",
          "second_interaction", "FreshThirdCapSourceInteraction cap indices")
    second_deleted_term = f"(ite (= second_deleted 0) {v('q0')} {v('q1')})"
    f.add(f"(=> (= second_tag 0) (= {b('c_second')} {b('q0')}))",
          "second_interaction", "FreshThirdCapSourceInteraction.sameBlocker")
    f.add(f"(=> (= second_tag 1) (and (not (= {b('c_second')} {b('q0')})) (not {member('c_second', second_deleted_term)})))",
          "second_interaction", "FreshThirdCapSourceInteraction.sourceRowOmission + center_ne theorem")
    exact_two = smt_and([
        f"(not (= {b('c_second')} {b('q0')}))",
        member("c_second", v("q0")), member("c_second", v("q1")),
        f"(not {member('c_second', v('q2'))})", f"(not {member('c_second', v('q3'))})",
    ])
    f.add(f"(=> (= second_tag 2) (and {exact_two} (not (= second_source_cap q_cap))))",
          "second_interaction", "FreshThirdCapSourceInteraction.distinctBlockersDifferentCaps")
    f.add(f"(=> (= second_tag 3) (and {exact_two} (= second_source_cap q_cap) (or second_internal_q0 second_internal_q1)))",
          "second_interaction", "FreshThirdCapSourceInteraction.sameCapWithInternalFiberSource")

    if case == "retained":
        f.add(f"(not (= {v('ret_z')} {v('ret_w')}))", "retained",
              "exists_retainedFirstApex_mutualDeletionPair_threeLocationCases.z_ne_w")
        f.add(f"(not (= {b('ret_z')} {b('ret_w')}))", "retained",
              "exists_retainedFirstApex_mutualDeletionPair_threeLocationCases.centers_ne")
        f.add(f"(not {member('ret_z', v('ret_w'))})", "retained",
              "mutual deletion survival + cross_deletion_survives_iff_not_mem_selected_support")
        f.add(f"(not {member('ret_w', v('ret_z'))})", "retained",
              "mutual deletion survival + cross_deletion_survives_iff_not_mem_selected_support")

    if case == "common_sameblocker":
        f.add("(= first_tag 0)", "common_sameblocker", "first sameBlocker constructor")
        f.add("(= second_tag 0)", "common_sameblocker", "second sameBlocker constructor")
        f.add(f"(distinct {' '.join(v(f'w{i}') for i in range(4))})", "common_w4",
              "freshThird_commonRadius_sameBlocker_exists_four... W.card=4")
        for i in range(4):
            role = f"w{i}"
            f.add(f"(not {member('q0', v(role))})", "common_w4",
                  "freshThird_commonRadius_sameBlocker_exists_four... off selected shell")
            f.add(f"(not (= {b(role)} {b('q0')}))", "common_w4",
                  "freshThird_commonRadius_sameBlocker_exists_four... blocker center distinct")

    return "\n".join(f.lines) + "\n", f.catalog


def declared_names(case: str) -> list[str]:
    roles = ACTIVE[case]
    names: list[str] = []
    for role in roles:
        names.extend([v(role), b(role), *slots(role)])
    names.extend([
        "first_tag", "first_deleted", "second_tag", "second_deleted",
        "second_source_cap", "q_cap", "repeat_z", "repeat_w",
        *[f"blocker_cap_{i}" for i in range(4)],
        *[f"q{i}_source_in_its_blocker_cap" for i in range(4)],
        "q_center_nonrobust", "second_internal_q0", "second_internal_q1",
    ])
    return names
