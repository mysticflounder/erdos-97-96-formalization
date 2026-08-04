#!/usr/bin/env python3
"""Exact QF_NRA audit of the four endpoint five-role cyclic orders.

Inputs are the 120 source-faithful M/B insertions recorded by
``five_role_extended_packet_results.json``.  This is a bounded named-role
Euclidean diagnostic, not a P97 realization or a Lean proof.
"""

from __future__ import annotations

import argparse
import json
import subprocess
import time
from fractions import Fraction
from itertools import combinations
from pathlib import Path

import z3


INPUT = Path("scratch/five_role_extended_packet_results.json")
OUT = Path("scratch/five_role_euclidean_qfnra_results.json")
REPORT = Path("scratch/five_role_euclidean_qfnra_report.md")
INSTANCE_DIR = Path("scratch/five_role_euclidean_qfnra_instances")

BRANCHES = {
    "A=J": {
        "roles": ("O", "A", "C", "X", "K", "M", "B"),
        "equalities": (("O", "A", "C"), ("A", "C", "K"),
                       ("X", "A", "K"), ("O", "C", "M"),
                       ("B", "C", "M")),
        "inequalities": (("A", "C", "M"), ("B", "C", "K")),
        "shells": {"SigmaA": ("A", "C"), "SigmaB": ("B", "C"),
                   "SigmaX": ("X", "A")},
    },
    "X=C": {
        "roles": ("O", "A", "C", "J", "K", "M", "B"),
        "equalities": (("O", "J", "C"), ("A", "C", "K"),
                       ("C", "J", "K"), ("O", "C", "M"),
                       ("B", "C", "M")),
        "inequalities": (("A", "C", "M"), ("B", "C", "K")),
        "shells": {"SigmaA": ("A", "C"), "SigmaB": ("B", "C"),
                   "SigmaX": ("C", "J")},
    },
}


def at_most(xs, k):
    """Pure Boolean encoding, keeping the formula inside QF_NRA."""
    if len(xs) <= k:
        return z3.BoolVal(True)
    return z3.And(*(z3.Or(*(z3.Not(x) for x in subset))
                    for subset in combinations(xs, k + 1)))


class EuclideanProblem:
    def __init__(self, branch: str, residual: str, order: str, timeout_ms: int):
        self.branch = branch
        self.residual = residual
        self.order = tuple(order)
        self.data = BRANCHES[branch]
        assert set(self.order) == set(self.data["roles"])
        assert self.order[0] == "O"
        self.x = {r: z3.Real(f"x_{r}") for r in self.order}
        self.y = {r: z3.Real(f"y_{r}") for r in self.order}
        self.cap = {r: z3.Bool(f"cap_{r}") for r in self.order}
        self.constraints: dict[str, z3.BoolRef] = {}
        self.active: set[str] = set()
        self.solver = z3.SolverFor("QF_NRA")
        self.solver.set(timeout=timeout_ms)
        self._build()

    def add(self, name, expr, *, lazy=False):
        assert name not in self.constraints
        self.constraints[name] = expr
        if not lazy:
            self.activate(name)

    def activate(self, name):
        if name not in self.active:
            self.solver.add(self.constraints[name])
            self.active.add(name)

    def d2(self, a, b):
        return (self.x[a] - self.x[b]) ** 2 + (self.y[a] - self.y[b]) ** 2

    def eqdist(self, center, u, v):
        if center in (u, v):
            return z3.BoolVal(False)
        return self.d2(center, u) == self.d2(center, v)

    def orient(self, a, b, c):
        return ((self.x[b] - self.x[a]) * (self.y[c] - self.y[a])
                - (self.y[b] - self.y[a]) * (self.x[c] - self.x[a]))

    def _build(self):
        # Similarity gauge: any realization can be translated to O=0, rotated
        # orientation-preservingly so the next edge is horizontal-positive,
        # then scaled positively to make that edge have length one.
        p = self.order[1]
        self.add("gauge_O_x", self.x["O"] == 0)
        self.add("gauge_O_y", self.y["O"] == 0)
        self.add("gauge_next_x", self.x[p] == 1)
        self.add("gauge_next_y", self.y[p] == 0)

        # The alternating rank-3 order type: every linearly ordered triple is
        # counterclockwise.  This is exact strict convexity in the fixed cyclic
        # order (and rules out coincidences and collinearities).
        for i, j, k in combinations(range(7), 3):
            a, b, c = self.order[i], self.order[j], self.order[k]
            self.add(f"orient_{a}{b}{c}", self.orient(a, b, c) > 0)

        for center, u, v in self.data["equalities"]:
            self.add(f"eq_{center}_{u}{v}", self.eqdist(center, u, v))
        for center, u, v in self.data["inequalities"]:
            self.add(f"neq_{center}_{u}{v}", z3.Not(self.eqdist(center, u, v)))

        # A physical four-support shell can contain at most four named points.
        for shell, (center, radius_point) in self.data["shells"].items():
            members = [self.eqdist(center, radius_point, r)
                       for r in self.order if r != center]
            self.add(f"{shell}_named_card_le4", at_most(members, 4), lazy=True)

        # Closed-cap facts and source-exact Sigma_B intersection.  The cap is
        # combinatorial here; no unrecorded disk/MEC geometry is introduced.
        for r in ("C", "M", "K", "B"):
            self.add(f"cap_in_{r}", self.cap[r])
        self.add("cap_out_O", z3.Not(self.cap["O"]))
        exits = [z3.And(self.cap[self.order[i]],
                        z3.Not(self.cap[self.order[(i + 1) % 7]]))
                 for i in range(7)]
        self.add("cap_cyclic_contiguous", at_most(exits, 1), lazy=True)
        for r in self.order:
            member = self.eqdist("B", "C", r)
            if r in ("C", "M"):
                self.add(f"SigmaB_cap_exact_in_{r}", z3.And(self.cap[r], member))
            else:
                self.add(f"SigmaB_cap_exact_out_{r}",
                         z3.Not(z3.And(self.cap[r], member)), lazy=True)

        # Source multiplicity restrictions among named representatives.
        for u, v in combinations(sorted(self.order), 2):
            centers = [self.eqdist(z, u, v) for z in self.order if z not in (u, v)]
            self.add(f"pair_center_le2_{u}{v}", at_most(centers, 2), lazy=True)
        for u, v, w in combinations(sorted(self.order), 3):
            centers = [z3.And(self.eqdist(z, u, v), self.eqdist(z, u, w))
                       for z in self.order if z not in (u, v, w)]
            self.add(f"triple_center_le1_{u}{v}{w}", at_most(centers, 1), lazy=True)

    def plain_smt2(self):
        s = z3.SolverFor("QF_NRA")
        for expr in self.constraints.values():
            s.add(expr)
        return s.to_smt2() + "\n(check-sat)\n"

    def solve_z3(self, wall_timeout_s):
        started = time.monotonic()
        rounds = 0
        while True:
            remaining_ms = int((started + wall_timeout_s - time.monotonic()) * 1000)
            if remaining_ms <= 0:
                return {"status": "UNKNOWN", "wall_seconds": time.monotonic() - started,
                        "reason": "cumulative_wall_timeout", "lazy_rounds": rounds,
                        "active_constraint_count": len(self.active)}
            self.solver.set(timeout=remaining_ms)
            status = self.solver.check()
            rounds += 1
            if status != z3.sat:
                break
            candidate = self.solver.model()
            violated = [name for name, expr in self.constraints.items()
                        if name not in self.active and
                        not z3.is_true(candidate.eval(expr, model_completion=True))]
            if not violated:
                break
            for name in violated:
                self.activate(name)
        wall = time.monotonic() - started
        if status == z3.unsat:
            # Replay the sufficient active subset with named tracking.  A core
            # is solver-trusted evidence only, not a proof certificate.
            core_solver = z3.SolverFor("QF_NRA")
            core_solver.set(timeout=max(1, int(wall_timeout_s * 1000)))
            core_solver.set(unsat_core=True)
            for name in sorted(self.active):
                core_solver.assert_and_track(self.constraints[name], z3.Bool(name))
            core_status = core_solver.check()
            core = (sorted(map(str, core_solver.unsat_core()))
                    if core_status == z3.unsat else [])
            return {"status": "UNSAT", "wall_seconds": wall,
                    "solver_trusted_core": core,
                    "core_replay_status": str(core_status).upper(),
                    "auditable_sufficient_active_set": sorted(self.active),
                    "lazy_rounds": rounds, "active_constraint_count": len(self.active)}
        if status == z3.unknown:
            return {"status": "UNKNOWN", "wall_seconds": wall,
                    "reason": self.solver.reason_unknown(), "lazy_rounds": rounds,
                    "active_constraint_count": len(self.active)}
        model = self.solver.model()
        coords = {}
        rational = True
        for r in self.order:
            coords[r] = {}
            for axis, var in (("x", self.x[r]), ("y", self.y[r])):
                val = model.eval(var, model_completion=True)
                coords[r][axis] = str(val)
                rational &= z3.is_rational_value(val)
        caps = {r: z3.is_true(model.eval(self.cap[r], model_completion=True))
                for r in self.order}
        out = {"status": "SAT", "wall_seconds": wall,
               "lazy_rounds": rounds, "active_constraint_count": len(self.active),
               "witness": {"coordinates": coords, "cap": caps,
                           "all_coordinates_rational": rational}}
        if rational:
            ok, detail = validate_fraction_witness(self.branch, self.order, coords, caps)
            out["independent_exact_fraction_validation"] = ok
            out["validation_detail"] = detail
            assert ok, detail
            out["witness_size"] = witness_size(coords)
        else:
            out["independent_exact_fraction_validation"] = False
            out["validation_detail"] = "Z3 returned a non-rational algebraic coordinate"
        return out


def parse_fraction(s):
    if s.startswith("(- ") and s.endswith(")"):
        return -parse_fraction(s[3:-1])
    if s.startswith("(/ ") and s.endswith(")"):
        a, b = s[3:-1].split()
        return Fraction(int(a), int(b))
    return Fraction(s)


def witness_size(coords):
    values = [parse_fraction(coords[r][a]) for r in coords for a in ("x", "y")]
    return {
        "max_abs_numerator": max(abs(v.numerator) for v in values),
        "max_denominator": max(v.denominator for v in values),
        "sum_abs_numerators": sum(abs(v.numerator) for v in values),
    }


def validate_fraction_witness(branch, order, encoded_coords, cap, require_gauge=True):
    """Independent exact readback, deliberately not evaluating Z3 formulas."""
    q = {r: (parse_fraction(encoded_coords[r]["x"]),
             parse_fraction(encoded_coords[r]["y"])) for r in order}
    def d2(a, b):
        return (q[a][0] - q[b][0]) ** 2 + (q[a][1] - q[b][1]) ** 2
    def eq(center, u, v):
        return center not in (u, v) and d2(center, u) == d2(center, v)
    def ori(a, b, c):
        return ((q[b][0] - q[a][0]) * (q[c][1] - q[a][1])
                - (q[b][1] - q[a][1]) * (q[c][0] - q[a][0]))
    checks = []
    if require_gauge:
        checks += [q["O"] == (0, 0), q[order[1]] == (1, 0)]
    checks += [ori(order[i], order[j], order[k]) > 0
               for i, j, k in combinations(range(7), 3)]
    data = BRANCHES[branch]
    checks += [eq(*e) for e in data["equalities"]]
    checks += [not eq(*e) for e in data["inequalities"]]
    for center, radius in data["shells"].values():
        checks.append(sum(eq(center, radius, r) for r in order if r != center) <= 4)
    checks += [cap[r] for r in ("C", "M", "K", "B")]
    checks.append(not cap["O"])
    exits = sum(cap[order[i]] and not cap[order[(i + 1) % 7]] for i in range(7))
    checks.append(exits <= 1)
    for r in order:
        member = eq("B", "C", r)
        checks.append((cap[r] and member) if r in ("C", "M")
                      else not (cap[r] and member))
    for u, v in combinations(sorted(order), 2):
        checks.append(sum(eq(z, u, v) for z in order if z not in (u, v)) <= 2)
    for u, v, w in combinations(sorted(order), 3):
        checks.append(sum(eq(z, u, v) and eq(z, u, w)
                          for z in order if z not in (u, v, w)) <= 1)
    bad = [i for i, value in enumerate(checks) if not value]
    return not bad, ("PASS" if not bad else f"failed independent checks {bad}")


def run_cvc5(smt2, timeout_s):
    started = time.monotonic()
    try:
        p = subprocess.run(
            ["cvc5", "--lang", "smt2", "--nl-cov", "--force-logic=QF_NRA",
             "--tlimit", str(timeout_s * 1000)],
            input=smt2, capture_output=True, text=True, timeout=timeout_s + 20)
    except subprocess.TimeoutExpired:
        return {"status": "UNKNOWN", "reason": "subprocess_timeout",
                "wall_seconds": time.monotonic() - started}
    verdict = "UNKNOWN"
    for line in p.stdout.splitlines():
        if line.strip() in ("sat", "unsat", "unknown"):
            verdict = line.strip().upper()
            break
    return {"status": verdict, "wall_seconds": time.monotonic() - started,
            "returncode": p.returncode,
            "stderr_tail": p.stderr.strip().splitlines()[-3:]}


def smoke_test(timeout_ms, cvc5_timeout_s):
    x, y = z3.Reals("smoke_x smoke_y")
    sat_formula = z3.And(x == 1, y == 1, x * y == 1)
    unsat_formula = z3.And(x == 1, y == 1, x * y != 1)
    results = {}
    for name, formula, expected in (("sat", sat_formula, "SAT"),
                                    ("unsat", unsat_formula, "UNSAT")):
        s = z3.SolverFor("QF_NRA"); s.set(timeout=timeout_ms); s.add(formula)
        zres = str(s.check()).upper()
        p = z3.SolverFor("QF_NRA"); p.add(formula)
        cres = run_cvc5(p.to_smt2() + "\n(check-sat)\n", cvc5_timeout_s)
        assert zres == expected and cres["status"] == expected, (name, zres, cres)
        results[name] = {"expected": expected, "z3": zres, "cvc5": cres["status"]}
    return results


def make_report(result):
    rows = result["instances"]
    lines = [
        "# Five-role endpoint exact Euclidean QF_NRA audit", "",
        "**Status: bounded named-role solver diagnostic only. This is not a Lean theorem or a full P97 Euclidean realization.**", "",
        "## Result", "",
        f"Audited {len(rows)} source-faithful cyclic orders: the four surviving five-role orders, each with all 30 M/B insertions from the extended packet.", "",
    ]
    for solver in ("z3", "cvc5"):
        counts = result["summary"][solver]
        lines.append(f"- {solver}: " + ", ".join(f"{k} {v}" for k, v in counts.items()))
    lines += ["", f"Cross-solver disagreements: {result['summary']['cross_solver_disagreements']}. ", ""]
    if result["smallest_sat_witnesses"]:
        lines += ["## Smallest exact-rational SAT witnesses", ""]
        for w in result["smallest_sat_witnesses"]:
            lines.append(f"- `{w['branch']}` / `{w['residual']}` / `{w['order']}`: size {w['witness_size']}; coordinates {w['coordinates']}")
        lines.append("")
    unsat = [r for r in rows if r["z3"]["status"] == "UNSAT"]
    if unsat:
        lines += ["## UNSAT lanes", "",
                  "Z3 cores are preserved in the JSON and instance SMT-LIB is preserved under the instance directory. These are solver-trusted QF_NRA results, not proof certificates.", ""]
        for r in unsat:
            lines.append(f"- `{r['branch']}` / `{r['residual']}` / `{r['order']}`: Z3 core size {len(r['z3']['solver_trusted_core'])}; cvc5 `{r['cvc5']['status']}`")
        lines.append("")
    lines += [
        "## Encoding boundary", "",
        "Coordinates are planar reals. Translation/rotation/scale are normalized by fixing O=(0,0) and the next cyclic point=(1,0). Every ordered triple has positive exact orientation, enforcing the fixed strict-convex cyclic order. The source-recorded equalities, exclusions, shell cardinalities, cap/Sigma-B coupling, and named pair/triple multiplicities are included.", "",
        "Anonymous shell fillers, erased-row support coupling, physical cap/MEC geometry, the full ambient carrier, and the global no-K4 condition are absent. SAT therefore establishes only this named-role local feasibility. P1/P2 were not assumed because they are not source-forced.", "",
        f"Machine-readable results: `{OUT}`. Reproducible instances: `{INSTANCE_DIR}/`.", "",
    ]
    return "\n".join(lines)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--z3-timeout", type=int, default=20, help="seconds per instance")
    ap.add_argument("--cvc5-timeout", type=int, default=20, help="seconds per instance")
    ap.add_argument("--start", type=int, default=0)
    ap.add_argument("--limit", type=int)
    ap.add_argument("--output", type=Path, default=OUT)
    ap.add_argument("--report", type=Path, default=REPORT)
    args = ap.parse_args()
    packet = json.loads(INPUT.read_text())
    jobs = []
    for branch, bdata in packet["branches"].items():
        for row in bdata["rows"]:
            jobs.append((branch, row["residual"], row["order"]))
    assert len(jobs) == 120 and len(set(jobs)) == 120
    jobs = jobs[args.start:]
    if args.limit:
        jobs = jobs[:args.limit]
    INSTANCE_DIR.mkdir(exist_ok=True)
    results = []
    for index, (branch, residual, order) in enumerate(jobs, 1):
        problem = EuclideanProblem(branch, residual, order, args.z3_timeout * 1000)
        smt2 = problem.plain_smt2()
        slug = f"{branch.replace('=', 'eq')}_{residual}_{order}.smt2"
        (INSTANCE_DIR / slug).write_text(smt2)
        zr = problem.solve_z3(args.z3_timeout)
        cr = run_cvc5(smt2, args.cvc5_timeout)
        results.append({"index": index, "branch": branch, "residual": residual,
                        "order": order, "instance": str(INSTANCE_DIR / slug),
                        "z3": zr, "cvc5": cr})
        print(f"[{index}/{len(jobs)}] {branch} {residual} {order}: Z3={zr['status']} cvc5={cr['status']}", flush=True)
    def counts(solver):
        return {k: sum(r[solver]["status"] == k for r in results)
                for k in ("SAT", "UNSAT", "UNKNOWN")}
    disagreement = [r for r in results
                    if r["z3"]["status"] != "UNKNOWN" and r["cvc5"]["status"] != "UNKNOWN"
                    and r["z3"]["status"] != r["cvc5"]["status"]]
    candidates = [r for r in results if r["z3"]["status"] == "SAT"
                  and r["z3"].get("independent_exact_fraction_validation")]
    candidates.sort(key=lambda r: (r["z3"]["witness_size"]["max_abs_numerator"],
                                   r["z3"]["witness_size"]["max_denominator"],
                                   r["z3"]["witness_size"]["sum_abs_numerators"]))
    smallest = [{"branch": r["branch"], "residual": r["residual"], "order": r["order"],
                 "witness_size": r["z3"]["witness_size"],
                 "coordinates": r["z3"]["witness"]["coordinates"]}
                for r in candidates[:10]]
    output = {
        "diagnostic_only": True,
        "input": str(INPUT),
        "normalization": "O=(0,0), next cyclic role=(1,0); sound under translation, orientation-preserving rotation, positive scale",
        "strict_convexity": "orientation(p_i,p_j,p_k)>0 for every i<j<k in the fixed cyclic order",
        "solvers": {"z3": {"version": z3.get_version_string(), "timeout_seconds": args.z3_timeout},
                    "cvc5": {"version": "1.3.3", "flags": ["--nl-cov", "--force-logic=QF_NRA"],
                             "timeout_seconds": args.cvc5_timeout}},
        "smoke_test": smoke_test(args.z3_timeout * 1000, args.cvc5_timeout),
        "summary": {"z3": counts("z3"), "cvc5": counts("cvc5"),
                    "cross_solver_disagreements": len(disagreement),
                    "independently_validated_exact_rational_sat": len(candidates)},
        "smallest_sat_witnesses": smallest,
        "instances": results,
        "omitted": ["anonymous shell fillers", "erased-row support coupling",
                    "physical cap/MEC geometry", "full ambient carrier", "global no-K4"],
    }
    args.output.write_text(json.dumps(output, indent=2) + "\n")
    args.report.write_text(make_report(output))
    print(json.dumps(output["summary"], indent=2))


if __name__ == "__main__":
    main()
