#!/usr/bin/env python3
"""Finite combinatorial shadow for FreshThird's noncanonical same-cap arm.

This intentionally models only fields present in the live packet: exact-four
selected supports for the two cap-source rows, reciprocal shell incidence for
the fresh pair, equal blocker value for that pair, distinct source/fresh
centers, and the same noncanonical cap carrying exactly one fresh source.
It is a satisfiability probe, not a metric or Lean proof.
"""

from itertools import combinations


sources = ("c1", "c2", "q1", "q2", "u", "v", "w", "x", "y", "z")
centers = {"c1": "A", "c2": "A", "q1": "B", "q2": "B"}
blocker = {"q1": "QB", "q2": "QB"}  # equal blocker for Q
opp_index1, shared_index = 0, 1

# The producer's cap-cardinality margin (8 <= |capByIndex oppIndex1|).
cap_by_index = {
    0: frozenset(("c1", "c2", "u", "v", "w", "x", "y", "z")),
    1: frozenset(("q1", "A", "B")),
    2: frozenset(("q2",)),
}
cap_interior = cap_by_index

all_rows = [frozenset(row) for row in combinations(sources, 4)]


def find_model():
    # Exact-four source rows contain both cap sources and both fresh sources.
    c_rows = [
        row
        for row in all_rows
        if {"c1", "q1", "q2"} <= row
    ]
    c_rows = [
        (r1, r2)
        for r1 in c_rows
        for r2 in c_rows
        if "c2" in r2 and "c1" in r1
    ]

    # Q's two shell supports are only required to contain reciprocal sources.
    q_rows = [row for row in all_rows if {"q1", "q2"} <= row]
    for c1_row, c2_row in c_rows:
        for q1_row in q_rows:
            # overlap_eq for each cap-source row is exactly {q1,q2}.
            if c1_row & q1_row != frozenset(("q1", "q2")):
                continue
            if c2_row & q1_row != frozenset(("q1", "q2")):
                continue
            # q1/q2 shell supports may be chosen equal, witnessing mutual
            # incidence q1 in shell(q2), q2 in shell(q1).
            q2_row = q1_row
            if "q1" not in q2_row or "q2" not in q1_row:
                continue
            # Canonical cap source membership; noncanonical shared cap for
            # both centers; exactly one Q source in that cap.
            if not {"c1", "c2"} <= cap_interior[opp_index1]:
                continue
            if not {"A", "B"} <= cap_interior[shared_index]:
                continue
            inside = {q for q in ("q1", "q2") if q in cap_by_index[shared_index]}
            if inside != {"q1"}:  # one-inside / one-outside
                continue
            # Distinct source and fresh centers; shared cap is noncanonical.
            if centers["c1"] == centers["q1"]:
                continue
            if shared_index == opp_index1:
                continue
            return {
                "support(c1)": sorted(c1_row),
                "support(c2)": sorted(c2_row),
                "support(q1)": sorted(q1_row),
                "support(q2)": sorted(q2_row),
                "center(c1)=center(c2)": centers["c1"],
                "center(q1)=center(q2)": centers["q1"],
                "blocker(q1)=blocker(q2)": blocker["q1"],
                "shared_cap_index": shared_index,
                "q_inside_shared_cap": sorted(inside),
                "q_outside_shared_cap": "q2",
                "cap0_cardinality": len(cap_by_index[0]),
            }
    return None


model = find_model()
assert model is not None, "shadow constraints unexpectedly unsatisfiable"
assert len(model["support(c1)"]) == len(model["support(c2)"]) == 4
assert set(("q1", "q2")) <= set(model["support(c1)"])
assert set(("q1", "q2")) <= set(model["support(c2)"])
assert set(("q1", "q2")) <= set(model["support(q1)"])
assert model["center(c1)=center(c2)"] != model["center(q1)=center(q2)"]
assert model["q_inside_shared_cap"] == ["q1"]
assert model["q_outside_shared_cap"] == "q2"
assert model["shared_cap_index"] != opp_index1

print("SAT: one-inside/one-outside shared-cap shadow")
for key, value in model.items():
    print(f"{key}: {value}")

