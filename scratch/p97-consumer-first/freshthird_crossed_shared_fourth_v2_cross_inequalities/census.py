#!/usr/bin/env python3
"""Shared-fourth crossed-three-row QF_LRA census with source cross NE's.

This is theorem-discovery bookkeeping only.  The role admissions and metric
consumer are copied from the v1 scratch census; the two strict disequalities
are the source theorems named in README.md and are split into four sign arms.
"""
from __future__ import annotations

import itertools
import json
import subprocess
from collections import Counter
from pathlib import Path

from z3 import Real, SolverFor, sat

HERE = Path(__file__).resolve().parent
ART = HERE / "artifacts"
RES = HERE / "results"
ROLES = ("firstCenter", "commonCenter", "oppositeCenter",
         "commonOutside", "oppositeOutside", "sharedFourth")
OPTIONAL_ALIASES = (
    ("commonCenter", "oppositeOutside"),
    ("oppositeCenter", "commonOutside"),
    ("firstCenter", "sharedFourth"),
)
CROSS_NAMES = ("commonRow_cross_dist_ne", "oppositeRow_cross_dist_ne")
# 0 means left < right; 1 means left > right.
SIGN_ARMS = tuple(itertools.product((0, 1), repeat=2))

PROVED_NE = {
    tuple(sorted(p)) for p in itertools.combinations(ROLES, 2)
    if tuple(sorted(p)) not in {tuple(sorted(p)) for p in OPTIONAL_ALIASES}
}

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
    for a, b in PROVED_NE:
        if find(a) == find(b):
            return None
    return {r: find(r) for r in ROLES}


def edge(a, b):
    return tuple(sorted((a, b)))


def add_problem(s, alias, order, signs=None, with_kalmanson=True,
                with_triangles=True):
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

    if signs is not None:
        # The two source-proved NE's, each split exactly into < or >.
        cross = (
            (dist("commonCenter", "oppositeOutside"),
             dist("commonCenter", "commonOutside")),
            (dist("oppositeCenter", "commonOutside"),
             dist("oppositeCenter", "oppositeOutside")),
        )
        for (left, right), sign in zip(cross, signs):
            s.add(left < right if sign == 0 else left > right)

    if with_kalmanson:
        for ia, ib, ic, id_ in itertools.combinations(range(6), 4):
            a, b, c, e = (order[ia], order[ib], order[ic], order[id_])
            s.add(dist(b, c) + dist(a, e) < dist(a, c) + dist(b, e))
            s.add(dist(a, b) + dist(c, e) < dist(a, c) + dist(b, e))
    return d


def build(alias, order, signs=None, with_kalmanson=True,
          with_triangles=True):
    s = SolverFor("QF_LRA")
    d = add_problem(s, alias, order, signs, with_kalmanson, with_triangles)
    return s, d


def z3_status(alias, order, signs=None, with_kalmanson=True,
              with_triangles=True):
    s, d = build(alias, order, signs, with_kalmanson, with_triangles)
    result = s.check()
    status = str(result)
    model = None
    if result == sat:
        model = {str(k): str(s.model().eval(v)) for k, v in d.items()}
    return status, model, s.sexpr()


def cvc5_status(path):
    try:
        p = subprocess.run(["cvc5", "--lang", "smt2", "--quiet", str(path)],
                           capture_output=True, text=True, timeout=30)
    except (OSError, subprocess.TimeoutExpired) as exc:
        return "unknown:" + type(exc).__name__
    out = (p.stdout + p.stderr).strip().lower()
    if out.startswith("sat"):
        return "sat"
    if out.startswith("unsat"):
        return "unsat"
    return "unknown:" + out[:120]


def portable_sexpr(sexpr):
    # z3's SolverFor.sexpr can append z3-only model-add commands.
    body = "\n".join(
        line for line in sexpr.splitlines()
        if not line.lstrip().startswith("(model-add ")
    )
    return "(set-logic QF_LRA)\n" + body + "\n(check-sat)\n"


def replay(artifact, z3_result, model=None):
    cvc5_result = cvc5_status(artifact)
    record = {"z3": z3_result, "cvc5": cvc5_result,
              "exact_match": z3_result == cvc5_result}
    if model is not None:
        record["model"] = model
    if not record["exact_match"] or z3_result not in {"sat", "unsat"}:
        raise SystemExit("solver mismatch/unknown; fail closed")
    return record


def main():
    ART.mkdir(parents=True, exist_ok=True)
    RES.mkdir(parents=True, exist_ok=True)
    identity = {r: r for r in ROLES}
    controls = []
    # Known SAT/UNSAT smoke controls, run before any sign-arm production.
    for name, order, kwargs in (
        ("sat_metric_equalities", ORDERS[0], {"with_kalmanson": False}),
        ("unsat_full_first_order", ORDERS[1], {"with_kalmanson": True}),
    ):
        z, model, sexpr = z3_status(identity, order, **kwargs)
        path = ART / (name + ".smt2")
        path.write_text(portable_sexpr(sexpr))
        controls.append({"name": name, **replay(path, z, model)})

    rows = []
    substantive = []
    for bits in itertools.product((0, 1), repeat=3):
        alias = partitions_for_alias_bits(bits)
        alias_label = "".join(map(str, bits))
        if alias is None:
            rows.append({"alias_bits": alias_label,
                         "admission": "inconsistent_with_proved_ne"})
            continue
        aliased = len(set(alias.values())) < 6
        for order_index, order in enumerate(ORDERS):
            base = {"alias_bits": alias_label, "order_index": order_index,
                    "order": order, "alias": alias}
            if aliased:
                base.update({
                    "admission": "blocked_missing_distinctness_for_strict_six_boundary",
                    "missing_alias": [p for bit, p in zip(bits, OPTIONAL_ALIASES)
                                      if bit],
                })
                if bits[0]:
                    base["contextual_admission"] = (
                        "excluded_by_enclosing_residual_cap_membership")
                rows.append(base)
                continue
            for signs in SIGN_ARMS:
                sign_label = "".join(map(str, signs))
                z, model, sexpr = z3_status(identity, order, signs)
                path = ART / ("arm_%s_%02d_%s.smt2" %
                              (alias_label, order_index, sign_label))
                path.write_text(portable_sexpr(sexpr))
                rec = {**base, "signs": sign_label,
                       "sign_relations": {
                           CROSS_NAMES[0]: "<" if signs[0] == 0 else ">",
                           CROSS_NAMES[1]: "<" if signs[1] == 0 else ">",
                       }, "admission": "candidate_order_missing_source_boundary_lift",
                       "artifact": str(path.relative_to(HERE))}
                rec.update(replay(path, z, model))
                rows.append(rec)
                substantive.append(rec)

    status_rows = [x for x in substantive if x["z3"] in {"sat", "unsat"}]
    survivors = [x for x in status_rows if x["z3"] == "sat"]
    survivor_signs = Counter(x["signs"] for x in survivors)
    survivor_orders = Counter(x["order_index"] for x in survivors)
    survivor_order_signs = Counter((x["order_index"], x["signs"])
                                   for x in survivors)
    def cyclic_adjacent(order, left, right):
        i, j = order.index(left), order.index(right)
        return (i - j) % 6 in (1, 5)

    positional = {
        "firstCenter_adjacent_to_a_selected_center": sum(
            any(cyclic_adjacent(x["order"], "firstCenter", c)
                for c in ("commonCenter", "oppositeCenter"))
            for x in survivors
        ),
        "commonCenter_adjacent_to_oppositeCenter": sum(
            cyclic_adjacent(x["order"], "commonCenter", "oppositeCenter")
            for x in survivors
        ),
        "commonOutside_adjacent_to_oppositeOutside": sum(
            cyclic_adjacent(x["order"], "commonOutside", "oppositeOutside")
            for x in survivors
        ),
    }
    summary = {
        "controls": [
            {k: c[k] for k in ("name", "z3", "cvc5", "exact_match")}
            for c in controls
        ],
        "alias_admission_counts": {
            "all_distinct_sign_arms": len(substantive),
            "blocked_alias_order_rows": 7 * len(ORDERS),
        },
        "sign_arm_count": len(SIGN_ARMS),
        "order_count": len(ORDERS),
        "z3_unsat": sum(x["z3"] == "unsat" for x in status_rows),
        "z3_sat": len(survivors),
        "exact_replays": sum(x["exact_match"] for x in status_rows),
        "survivor_sign_counts": dict(sorted(survivor_signs.items())),
        "smallest_recurring_survivor_motif": {
            "kind": "cross_sign",
            "signs": min(survivor_signs, key=lambda sg: (survivor_signs[sg], sg)),
            "count": min(survivor_signs.values()),
        },
        "survivor_order_counts": dict(sorted(survivor_orders.items())),
        "survivor_positional_motifs": positional,
        "survivor_order_sign_motifs": [
            {"order_index": oi, "signs": sg, "count": n}
            for (oi, sg), n in sorted(survivor_order_signs.items())
        ],
        "contextual_admission_tier": {
            "excluded_alias": ["commonCenter", "oppositeOutside"],
            "remaining_optional_aliases": [
                ["oppositeCenter", "commonOutside"],
                ["firstCenter", "sharedFourth"],
            ],
            "contextually_excluded_alias_order_rows": 4 * len(ORDERS),
            "remaining_optional_alias_order_rows": 3 * len(ORDERS),
            "source_basis": [
                "TwoSourceFirstFiberCollision.lean:1275-1276",
                "TwoSourceFirstFiberCollision.lean:1162-1170",
            ],
            "applied_to_sign_arms": False,
        },
    }
    (RES / "census.json").write_text(json.dumps(
        {"controls": controls, "orders": [list(o) for o in ORDERS],
         "cross_non_equalities": list(CROSS_NAMES),
         "sign_arms": ["".join(map(str, s)) for s in SIGN_ARMS],
         "rows": rows}, indent=2) + "\n")
    (RES / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps({"controls": controls, "substantive": len(substantive),
                      "z3_unsat": summary["z3_unsat"],
                      "z3_sat": summary["z3_sat"],
                      "exact_replays": summary["exact_replays"]}))


if __name__ == "__main__":
    main()
