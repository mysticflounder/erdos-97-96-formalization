#!/usr/bin/env python3
"""Exact six-role shared-fourth crossed-arm QF_LRA census.

This is a metric consumer diagnostic only.  Role admissions are copied from
FirstFiberCrossedThreeRowExactSupports; no unproved row or order assumptions
are imported from the older FreshThird scripts.
"""
from __future__ import annotations

import json
import itertools
import subprocess
from pathlib import Path

from z3 import Real, SolverFor, sat, unknown, unsat

HERE = Path(__file__).resolve().parent
ART = HERE / "artifacts"
RES = HERE / "results"
ROLES = ("firstCenter", "commonCenter", "oppositeCenter",
         "commonOutside", "oppositeOutside", "sharedFourth")

# Source-proved non-aliases.  The three omitted pairs are deliberately left
# open: center/support distinctness does not follow from the structure fields.
PROVED_NE = {
    tuple(sorted(p)) for p in itertools.combinations(ROLES, 2)
    if tuple(sorted(p)) not in {
        tuple(sorted(("commonCenter", "oppositeOutside"))),
        tuple(sorted(("oppositeCenter", "commonOutside"))),
        tuple(sorted(("firstCenter", "sharedFourth"))),
    }
}
OPTIONAL_ALIASES = (
    ("commonCenter", "oppositeOutside"),
    ("oppositeCenter", "commonOutside"),
    ("firstCenter", "sharedFourth"),
)

# Six-role cyclic orders, modulo rotation (firstCenter fixed) and reversal.
ORDERS = []
for tail in itertools.permutations(ROLES[1:]):
    order = (ROLES[0],) + tail
    rev = (ROLES[0],) + tuple(reversed(tail))
    if order < rev:
        ORDERS.append(order)
assert len(ORDERS) == 60


def partitions_for_alias_bits(bits):
    parent = {r: r for r in ROLES}
    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x
    def union(a, b):
        a, b = find(a), find(b)
        if a != b:
            parent[b] = a
    for bit, (a, b) in zip(bits, OPTIONAL_ALIASES):
        if bit:
            union(a, b)
    # Reject any transitive collision with a source-proved non-alias.
    for a, b in PROVED_NE:
        if find(a) == find(b):
            return None
    return {r: find(r) for r in ROLES}


def edge(a, b):
    return tuple(sorted((a, b)))


def add_problem(s, alias, with_kalmanson=True, with_triangles=True):
    d = {}
    reps = sorted(set(alias.values()))
    for a, b in itertools.combinations(reps, 2):
        d[edge(a, b)] = Real("d_%s_%s" % edge(a, b))
        s.add(d[edge(a, b)] > 0)
    def dist(a, b):
        a, b = alias[a], alias[b]
        return 0 if a == b else d[edge(a, b)]
    if with_triangles:
        for a, b, c in itertools.combinations(ROLES, 3):
            if len({alias[a], alias[b], alias[c]}) < 3:
                continue
            s.add(dist(a, b) + dist(b, c) > dist(a, c))
            s.add(dist(a, b) + dist(a, c) > dist(b, c))
            s.add(dist(a, c) + dist(b, c) > dist(a, b))
    # Exactly the three equalities licensed by the three exact supports.
    s.add(dist("firstCenter", "commonOutside") ==
          dist("firstCenter", "oppositeOutside"))
    s.add(dist("commonCenter", "commonOutside") ==
          dist("commonCenter", "sharedFourth"))
    s.add(dist("oppositeCenter", "oppositeOutside") ==
          dist("oppositeCenter", "sharedFourth"))
    if with_kalmanson:
        for ia, ib, ic, id_ in itertools.combinations(range(6), 4):
            a, b, c, e = order = CURRENT_ORDER[ia], CURRENT_ORDER[ib], CURRENT_ORDER[ic], CURRENT_ORDER[id_]
            # Both strict boundary Kalmanson inequalities.
            s.add(dist(b, c) + dist(a, e) < dist(a, c) + dist(b, e))
            s.add(dist(a, b) + dist(c, e) < dist(a, c) + dist(b, e))
    return d


def build(alias, order, with_kalmanson=True, with_triangles=True):
    global CURRENT_ORDER
    CURRENT_ORDER = order
    s = SolverFor("QF_LRA")
    d = add_problem(s, alias, with_kalmanson, with_triangles)
    return s, d


def z3_status(alias, order, with_kalmanson=True, with_triangles=True):
    s, d = build(alias, order, with_kalmanson, with_triangles)
    r = s.check()
    model = None
    if r == sat:
        model = {str(k): str(s.model().eval(v)) for k, v in d.items()}
    return str(r), model, s.sexpr()


def cvc5_status(smt2):
    p = subprocess.run(["cvc5", "--lang", "smt2", "--quiet", smt2],
                       capture_output=True, text=True, timeout=30)
    out = (p.stdout + p.stderr).strip().lower()
    if out.startswith("sat"):
        return "sat"
    if out.startswith("unsat"):
        return "unsat"
    return "unknown:" + out[:120]


def portable_sexpr(sexpr):
    # z3's SolverFor.sexpr appends model-add commands that are useful to z3
    # but are not SMT-LIB2 commands accepted by cvc5.
    return "\n".join(line for line in sexpr.splitlines()
                     if not line.lstrip().startswith("(model-add ")) + "\n(check-sat)\n"


def main():
    # Known controls are run before the census.  The unconstrained metric
    # control is SAT; the first full strict-order arm is the UNSAT control.
    alias = {r: r for r in ROLES}
    controls = []
    for name, order, kw in (
        ("sat_metric_equalities", ORDERS[0], dict(with_kalmanson=False)),
        # This order is a known strict-Kalmanson UNSAT control for the three
        # licensed equalities; ORDERS[0] is intentionally SAT.
        ("unsat_full_first_order", ORDERS[1], dict(with_kalmanson=True)),
    ):
        z, model, sexpr = z3_status(alias, order, **kw)
        path = ART / (name + ".smt2")
        path.write_text(portable_sexpr(sexpr))
        c = cvc5_status(str(path))
        controls.append({"name": name, "z3": z, "cvc5": c,
                         "exact_match": z == c, "model": model})
    if any(not x["exact_match"] or x["z3"] == "unknown" for x in controls):
        raise SystemExit("control mismatch/unknown; fail closed")

    rows = []
    substantive = []
    for bits in itertools.product((0, 1), repeat=3):
        alias = partitions_for_alias_bits(bits)
        label = "".join(map(str, bits))
        if alias is None:
            rows.append({"alias_bits": label, "admission": "inconsistent_with_proved_ne"})
            continue
        aliased = len(set(alias.values())) < 6
        for oi, order in enumerate(ORDERS):
            rec = {"alias_bits": label, "order_index": oi,
                   "order": order, "alias": alias}
            if aliased:
                rec["admission"] = "blocked_missing_distinctness_for_strict_six_boundary"
                rec["missing_alias"] = [p for bit, p in zip(bits, OPTIONAL_ALIASES) if bit]
                rows.append(rec)
                continue
            z, model, sexpr = z3_status(alias, order)
            fn = ART / ("arm_%s_%02d.smt2" % (label, oi))
            fn.write_text(portable_sexpr(sexpr))
            c = cvc5_status(str(fn))
            rec.update({"admission": "candidate_order_missing_source_boundary_lift",
                        "z3": z, "cvc5": c, "exact_match": z == c,
                        "model": model})
            rows.append(rec)
            substantive.append(rec)
            if z != c or z == "unknown":
                raise SystemExit("solver mismatch/unknown; fail closed")
    (RES / "census.json").write_text(json.dumps({"controls": controls,
        "orders": [list(o) for o in ORDERS], "rows": rows}, indent=2) + "\n")
    by = {"z3_unsat": sum(x.get("z3") == "unsat" for x in substantive),
          "z3_sat": sum(x.get("z3") == "sat" for x in substantive),
          "exact_replays": sum(x.get("exact_match") is True for x in substantive)}
    (RES / "summary.json").write_text(json.dumps(by, indent=2) + "\n")
    print(json.dumps({"controls": controls, "substantive": len(substantive), **by}))


if __name__ == "__main__":
    main()
