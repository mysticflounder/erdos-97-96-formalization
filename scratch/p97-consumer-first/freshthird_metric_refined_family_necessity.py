#!/usr/bin/env python3
import sys
from pathlib import Path
from collections import defaultdict
from z3 import SolverFor

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from freshthird_full_fidelity_cegar import ORDER_ARMS, STRUCTURAL_TIMEOUT_MS, add_full_fidelity_constraints, build_pure_arm
from freshthird_metric_core import tracked_metric

s, _, c = build_pure_arm(ORDER_ARMS['outside_fresh_between_source_canonical'], STRUCTURAL_TIMEOUT_MS)
add_full_fidelity_constraints(s, c, 1, 1, enforce_equal_shell_slots_in_row=True)
assert s.check() == __import__('z3').sat
r = tracked_metric(s.model(), c, solve_core=False)
by = defaultdict(list)
for x in r['records']:
    by[x[1]].append(x)
print('families', ','.join(f'{k}:{len(v)}' for k, v in by.items()))
for ex in by:
    q = SolverFor('QF_LRA')
    q.set(timeout=10000)
    for f, vals in by.items():
        if f != ex:
            q.add(*[x[3] for x in vals])
    print('exclude', ex, q.check())
