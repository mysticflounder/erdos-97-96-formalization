#!/usr/bin/env python3
"""Test a small tracked packet before attempting full raw core."""
import sys
from pathlib import Path
from collections import defaultdict
from z3 import SolverFor, sat
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE))
from freshthird_full_fidelity_cegar import ORDER_ARMS,STRUCTURAL_TIMEOUT_MS,add_full_fidelity_constraints,build_pure_arm
from freshthird_metric_core import tracked_metric

s,_,c=build_pure_arm(ORDER_ARMS["outside_fresh_between_source_canonical"],STRUCTURAL_TIMEOUT_MS)
add_full_fidelity_constraints(s,c,1,1,enforce_equal_shell_slots_in_row=True)
assert s.check()==sat
r=tracked_metric(s.model(),c,solve_core=False)
by=defaultdict(list)
for rec in r['records']: by[rec[1]].append(rec)
print('counts',','.join(f'{k}:{len(v)}' for k,v in by.items()))
candidates = [
  ["known_row_exclusion","blocker_slot_shell"],
  ["known_row_exclusion","blocker_slot_shell","known_row_equal_radius"],
  ["known_row_exclusion","blocker_slot_shell","blocker_exact_shell_count"],
  ["known_row_exclusion","blocker_slot_shell","blocker_radius_positive"],
  ["known_row_exclusion","blocker_slot_shell","distance_positive"],
  ["known_row_exclusion","blocker_slot_shell","blocker_row_membership"],
  ["known_row_radius_positive","known_row_equal_radius","known_row_exclusion","blocker_radius_positive","blocker_row_membership","blocker_slot_shell","blocker_exact_shell_count"],
  ["known_row_equal_radius","known_row_exclusion","blocker_radius_positive","blocker_row_membership","blocker_slot_shell","blocker_exact_shell_count"],
  ["known_row_radius_positive","known_row_exclusion","blocker_radius_positive","blocker_row_membership","blocker_slot_shell","blocker_exact_shell_count"],
  ["known_row_radius_positive","known_row_equal_radius","known_row_exclusion","blocker_row_membership","blocker_slot_shell","blocker_exact_shell_count"],
  ["known_row_radius_positive","known_row_equal_radius","known_row_exclusion","blocker_radius_positive","blocker_slot_shell","blocker_exact_shell_count"],
  ["known_row_radius_positive","known_row_equal_radius","known_row_exclusion","blocker_radius_positive","blocker_row_membership","blocker_slot_shell","blocker_exact_shell_count","nonpinned_blocker_row_cap"],
  ["distance_positive","known_row_radius_positive","known_row_equal_radius","known_row_exclusion","blocker_radius_positive","blocker_row_membership","blocker_slot_shell","blocker_exact_shell_count"],
  ["distance_positive","known_row_radius_positive","known_row_equal_radius","known_row_exclusion","blocker_radius_positive","blocker_row_membership","blocker_slot_shell","blocker_exact_shell_count","nonpinned_blocker_row_cap"],
]
for fs in candidates:
  q=SolverFor('QF_LRA');q.set(timeout=15000)
  for fam in fs:
    q.add(*[x[3] for x in by.get(fam,[])])
  print('subset','+'.join(fs),'result',q.check())
