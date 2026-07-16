"""Extract the exact ff2eb8fb Rabinowitsch pair-(7,8) system for a flux race.

Replays the witness signature and base equality hash exactly like
membership_crosscheck.py, then builds the SAME extended ideal it
certifies (base polynomials + expand(1 - t*d^2(7,8)), variables + t)
and dumps variables + expanded polynomials.
"""
import importlib.util
import json
import sys
from pathlib import Path

LANE = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/atail-force/unique-row-producer")
SP = Path("/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/37d29399-4937-4abd-92cd-4eebe85bf9f5/scratchpad")
EXPECT_SIG = "ff2eb8fbf191b1daebd984a73cb9226d43ad98cc1818f0715503f9ff94774aab"
PAIR = (7, 8)


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
mc.require(list(report["selected_pair_sources"]) == list(PAIR),
           f"pair mismatch: {report['selected_pair_sources']}")

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
equality_sha256 = oracle.canonical_sha256(polynomials)
reported = report.get("metric_equality_audit", {}).get(
    "expanded_polynomial_sha256")
if reported is not None:
    mc.require(equality_sha256 == reported,
               f"equality hash mismatch: {equality_sha256} vs {reported}")

points = oracle.coordinate_symbols(n)
sympy_variables = oracle.variable_symbols(n)
pair_expr = oracle.squared_distance(points, *PAIR)
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

out = {
    "row_signature_sha256": signature,
    "base_equality_sha256": equality_sha256,
    "extended_sha256": oracle.canonical_sha256(extended_polynomials),
    "pair": list(PAIR),
    "n": n,
    "variable_count": len(extended_variables),
    "polynomial_count": len(extended_polynomials),
    "variables": extended_variables,
    "polynomials": extended_polynomials,
}
(SP / "ff2eb8fb_rabinowitsch_system.json").write_text(
    json.dumps(out), encoding="utf-8")
print(json.dumps({k: out[k] for k in
                  ("row_signature_sha256", "base_equality_sha256",
                   "extended_sha256", "pair", "n",
                   "variable_count", "polynomial_count")}, indent=2))
