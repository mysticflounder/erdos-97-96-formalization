import gzip
import json
import re
import sys
import time
from pathlib import Path

import z3

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
import round5_cegar_v17 as v17  # noqa: E402

CASE = ROOT / "artifacts-v16-canary3/20260802T130201.186839Z-case-pid86814/fresh_DDD_k0_d2_f1"

with gzip.open(CASE / "full_frozen_v16.smt2.gz", "rt") as handle:
    assertions = tuple(z3.parse_smt2_string(handle.read()))
trace = json.loads((CASE / "cegar_trace_v16.json").read_text())
record = trace["iterations"][10]
assignment = {entry["bool"]: entry["value"] for entry in record["assignment"]}

decls: dict[str, z3.ExprRef] = {}
for node in v17.v16._walk(assertions):
    if node.num_args() == 0 and node.sort().kind() == z3.Z3_BOOL_SORT:
        decls[str(node)] = node
missing = sorted(set(assignment) - set(decls))
if missing:
    raise RuntimeError(f"missing assignment declarations: {missing[:8]}")
substitutions = tuple((decls[name], z3.BoolVal(value)) for name, value in assignment.items())

groups: dict[str, tuple[z3.BoolRef, ...]] = {}
normalization_started = time.monotonic()
for assertion in assertions[:26]:
    tracker = str(assertion.arg(0))
    family = tracker.removeprefix("track_")
    fixed = z3.simplify(z3.substitute(assertion.arg(1), *substitutions))
    rewritten = v17.rewrite_weighted_pbs(fixed)
    goal = z3.Goal()
    goal.add(rewritten)
    transformed = z3.Tactic("card2bv")(goal)
    if len(transformed) != 1:
        raise RuntimeError(f"{family}: card2bv subgoals={len(transformed)}")
    groups[family] = tuple(transformed[0])
print(f"normalized_groups={len(groups)} seconds={time.monotonic()-normalization_started:.3f}")

solver = z3.SolverFor("QF_LRA")
solver.set(timeout=120_000, random_seed=0, threads=1)
assumptions = []
for family, formulas in groups.items():
    assumption = z3.Bool(f"family_{family}")
    assumptions.append(assumption)
    solver.add(z3.Implies(assumption, z3.And(*formulas)))
started = time.monotonic()
status = solver.check(*assumptions)
core = sorted(str(item).removeprefix("family_") for item in solver.unsat_core()) if status == z3.unsat else []
result = {
    "assignment_sha256": record["assignment_sha256"],
    "status": str(status),
    "reason_unknown": solver.reason_unknown() if status == z3.unknown else None,
    "solve_seconds": time.monotonic() - started,
    "family_core": core,
    "family_sizes": {family: len(groups[family]) for family in core},
}
out = Path(__file__).with_name("family_core.json")
out.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
print(json.dumps(result, indent=2, sort_keys=True))
