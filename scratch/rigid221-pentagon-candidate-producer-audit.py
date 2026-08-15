#!/usr/bin/env python3
"""Finite incidence audit for the proposed rigid221 pentagon producer.

This deliberately models only the named-point predicates needed to test the
candidate witness xu.  It is not a metric realization oracle or a Lean proof.
"""

from z3 import And, Bool, BoolVal, Not, PbGe, Solver, sat, unsat

from census.rigid221_pentagon_oracle import CAP_SIDE, CLASS_LABELS, EDGE


U, XU, DELETED, V, XV, A, W = range(7)
NAMES = ("u", "xu", "deleted", "v", "xv", "A", "w")
PHYSICAL_CLASS = set(CLASS_LABELS)

physical = [Bool(f"physical_{name}") for name in NAMES]
opp_cap_2 = [Bool(f"opp_cap_2_{name}") for name in NAMES]
k_xv = [Bool(f"k_xv_{name}") for name in NAMES]
k_xu = [Bool(f"k_xu_{name}") for name in NAMES]
actual_xu_row = Bool("actual_xu_row")


GROUPS = {
    # Already represented by the stage-5 named-point projection.
    "physical_exact_five": [
        physical[i] == BoolVal(i in PHYSICAL_CLASS) for i in range(7)
    ],
    "xu_in_opp_cap_2": [opp_cap_2[XU], BoolVal(XU in CAP_SIDE)],
    "kxv_physical_trace_is_u_xv": [
        k_xv[i] == BoolVal(i in set(EDGE["xv"])) for i in PHYSICAL_CLASS
    ],
    # Smallest source-faithful extension needed for the xu witness.
    "xu_is_actual_selected_row": [actual_xu_row],
    "xu_in_own_selected_support": [k_xu[XU]],
    "deleted_in_xu_selected_support": [k_xu[DELETED]],
}

STAGE5_PROJECTION = (
    "physical_exact_five",
    "xu_in_opp_cap_2",
    "kxv_physical_trace_is_u_xv",
)
SOURCE_EXTENSION = tuple(GROUPS)

xu_in_T = And(opp_cap_2[XU], Not(k_xv[XU]))
xu_row_has_two_physical_hits = PbGe(
    [(And(k_xu[i], physical[i]), 1) for i in range(7)], 2
)
xu_witnesses_candidate = And(
    actual_xu_row, xu_in_T, xu_row_has_two_physical_hits
)


def status(groups: tuple[str, ...], assertion) -> str:
    solver = Solver()
    for group in groups:
        solver.add(*GROUPS[group])
    solver.add(assertion)
    result = solver.check()
    assert result in (sat, unsat)
    return str(result).upper()


print("candidate := xu is an actual selected row, xu in T, and |K_xu ∩ physical| >= 2")
print("stage5_projection + candidate:", status(STAGE5_PROJECTION, xu_witnesses_candidate))
print("stage5_projection + not(candidate):", status(STAGE5_PROJECTION, Not(xu_witnesses_candidate)))
print("source_extension + candidate:", status(SOURCE_EXTENSION, xu_witnesses_candidate))
print("source_extension + not(candidate):", status(SOURCE_EXTENSION, Not(xu_witnesses_candidate)))
print("drop-one audit against not(candidate):")
for dropped in SOURCE_EXTENSION:
    retained = tuple(group for group in SOURCE_EXTENSION if group != dropped)
    print(f"  drop {dropped}: {status(retained, Not(xu_witnesses_candidate))}")
