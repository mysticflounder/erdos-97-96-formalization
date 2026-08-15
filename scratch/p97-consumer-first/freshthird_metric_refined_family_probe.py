#!/usr/bin/env python3
"""Cheap family probe to choose a tractable tracked-core packet."""

import sys
from pathlib import Path
from collections import defaultdict

from z3 import SolverFor, sat, unknown

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from freshthird_full_fidelity_cegar import ORDER_ARMS, STRUCTURAL_TIMEOUT_MS, add_full_fidelity_constraints, build_pure_arm
from freshthird_metric_core import tracked_metric

def main():
    s, _, c = build_pure_arm(ORDER_ARMS["outside_fresh_between_source_canonical"], STRUCTURAL_TIMEOUT_MS)
    add_full_fidelity_constraints(s,c,1,1,enforce_equal_shell_slots_in_row=True)
    assert s.check() == sat
    r = tracked_metric(s.model(), c, solve_core=False)
    by = defaultdict(list)
    for label, fam, det, expr in r["records"]:
        by[fam].append((label,expr))
    print("families", ",".join(f"{k}:{len(v)}" for k,v in by.items()))
    families = list(by)
    candidates = [
      ["known_row_exclusion","blocker_slot_shell","blocker_exact_shell_count","blocker_row_membership"],
      ["known_row_exclusion","blocker_slot_shell","blocker_exact_shell_count","blocker_row_membership","kalmanson"],
      ["known_row_exclusion","blocker_slot_shell","kalmanson"],
      ["known_row_exclusion","blocker_slot_shell","triangle","kalmanson"],
      ["known_row_exclusion","blocker_slot_shell","known_row_equal_radius","kalmanson"],
    ]
    for fs in candidates:
      p=SolverFor("QF_LRA"); p.set(timeout=15000)
      for f in fs:
        for _,e in by.get(f,[]): p.add(e)
      q=p.check(); print("subset", "+".join(fs), q)

if __name__ == "__main__": main()
