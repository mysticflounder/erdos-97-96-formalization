"""Admission-grade forced-pair cert for witness ff2eb8fb (654 iter-68).

membership_crosscheck.py derivative (--pair 7 8 --radical-only --core
path) whose Singular calls use the flux-race-winning perm4 variable
order (random.Random(4).shuffle of the extended variable list; see
cf0a86c8-flux-race/RACE.md for the strategy precedent). msolve keeps
the canonical forward/reverse orders. Same ideal in every call — a
variable permutation only changes the monomial order.
"""
import importlib.util
import json
import random
import sys
from pathlib import Path

LANE = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/atail-force/unique-row-producer")
SP = Path("/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/37d29399-4937-4abd-92cd-4eebe85bf9f5/scratchpad")
EXPECT_SIG = "ff2eb8fbf191b1daebd984a73cb9226d43ad98cc1818f0715503f9ff94774aab"
PAIR = (7, 8)
TIMEOUT = 900.0
DELETION_TIMEOUT = 60.0
EXPECT_PERM4_FIRST = ["x8y", "t", "x7x", "x4y"]


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


mc = load_module("mc", LANE / "membership_crosscheck.py")

document = json.loads((SP / "iter68_654.json").read_text(encoding="utf-8"))
report = document["reports"][0]
mc.require(report["status"] == "SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY",
           "not a SAT witness")
signature = mc.replay_row_signature(report)
mc.require(signature == EXPECT_SIG, f"signature mismatch: {signature}")

oracle = mc.load_metric_oracle()
n = len(report["rows"]) + 1
rows = [
    oracle.MetricRow(mc.FIRST_APEX, tuple(sorted(report["card_five_support"])),
                     exact=True),
    *(oracle.MetricRow(int(center), tuple(sorted(support)), exact=False)
      for center, support in sorted(report["rows"].items(),
                                    key=lambda item: int(item[0]))),
]
variables = [str(v) for v in oracle.variable_symbols(n)]
polynomials = list(oracle.serialized_system(n, tuple(rows)))
points = oracle.coordinate_symbols(n)
sympy_variables = oracle.variable_symbols(n)

left, right = PAIR
pair_expr = oracle.squared_distance(points, left, right)
t_symbol = oracle.sp.Symbol("t")
rabinowitsch_poly = oracle.serialize_poly(
    oracle.sp.Poly(
        oracle.sp.expand(1 - t_symbol * pair_expr),
        *sympy_variables,
        t_symbol,
        domain=oracle.sp.QQ,
    )
)
extended_variables = variables + ["t"]
extended_polynomials = polynomials + [rabinowitsch_poly]

perm4_variables = list(extended_variables)
random.Random(4).shuffle(perm4_variables)
mc.require(perm4_variables[:4] == EXPECT_PERM4_FIRST,
           f"perm4 mismatch vs flux manifest: {perm4_variables[:4]}")

singular_unit = oracle.run_singular(
    perm4_variables, extended_polynomials, timeout_s=TIMEOUT
)
msolve_forward = oracle.run_msolve(
    extended_variables, extended_polynomials, timeout_s=TIMEOUT
)
msolve_reverse = oracle.run_msolve(
    list(reversed(extended_variables)), extended_polynomials,
    timeout_s=TIMEOUT
)

verdicts = {
    "singular_direct_reduction": "SKIPPED_RADICAL_ONLY",
    "rabinowitsch_singular": oracle.result_dict(singular_unit),
    "rabinowitsch_msolve_forward": oracle.result_dict(msolve_forward),
    "rabinowitsch_msolve_reverse": oracle.result_dict(msolve_reverse),
}
rabinowitsch_unit = (
    singular_unit.verdict == "UNIT"
    and msolve_forward.verdict == "UNIT"
    and msolve_reverse.verdict == "UNIT"
)
status = (
    "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP"
    if rabinowitsch_unit else "NOT_CROSSCHECKED"
)

forced_pair_core = None
if status != "NOT_CROSSCHECKED":
    active = list(enumerate(rows))
    attempts = []
    for original_index, _row in tuple(active):
        candidate = tuple(
            row for index, row in active if index != original_index
        )
        candidate_polynomials = (
            list(oracle.serialized_system(n, candidate))
            + [rabinowitsch_poly]
        )
        result = oracle.run_singular(
            perm4_variables,
            candidate_polynomials,
            timeout_s=DELETION_TIMEOUT,
        )
        removed = result.verdict == "UNIT"
        attempts.append({
            "original_index": original_index,
            "center": rows[original_index].center,
            "verdict": result.verdict,
            "removed": removed,
        })
        if removed:
            active = [item for item in active if item[0] != original_index]
    retained = tuple(row for _, row in active)
    retained_polynomials = list(oracle.serialized_system(n, retained))
    extended_retained = retained_polynomials + [rabinowitsch_poly]
    core_singular = oracle.run_singular(
        perm4_variables, extended_retained, timeout_s=TIMEOUT
    )
    core_forward = oracle.run_msolve(
        extended_variables, extended_retained, timeout_s=TIMEOUT
    )
    core_reverse = oracle.run_msolve(
        list(reversed(extended_variables)), extended_retained,
        timeout_s=TIMEOUT
    )
    core_unit = (
        core_singular.verdict == "UNIT"
        and core_forward.verdict == "UNIT"
        and core_reverse.verdict == "UNIT"
    )
    forced_pair_core = {
        "status": (
            "CROSSCHECKED_FORCED_ZERO_PAIR_CORE"
            if core_unit else "NOT_CROSSCHECKED"
        ),
        "pair": [left, right],
        "initial_row_count": len(rows),
        "retained_row_count": len(retained),
        "retained_equality_count": len(retained_polynomials),
        "retained_rows": [oracle.row_dict(row) for row in retained],
        "attempts": attempts,
        "rabinowitsch_singular": oracle.result_dict(core_singular),
        "rabinowitsch_msolve_forward": oracle.result_dict(core_forward),
        "rabinowitsch_msolve_reverse": oracle.result_dict(core_reverse),
    }

print(json.dumps({
    "schema": (
        "p97-atail-forced-zero-pair-membership-crosscheck-v1"
        "-perm4-singular-order"
    ),
    "row_signature_sha256": signature,
    "equality_sha256": oracle.canonical_sha256(polynomials),
    "pair": [left, right],
    "status": status,
    "forced_pair_core": forced_pair_core,
    "oracles": verdicts,
    "singular_variable_order": perm4_variables,
    "verdict_scope": (
        "dist2(pair) vanishes on every complex realization of this "
        "fixed equality shadow; distinct-label realizations are "
        "impossible, hence no real Euclidean witness"
    ),
}, indent=2, sort_keys=True))
