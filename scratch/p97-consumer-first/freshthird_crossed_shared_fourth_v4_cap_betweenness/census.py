#!/usr/bin/env python3
"""Exact cap-order admission census for the shared-fourth crossed arm.

This is a source-entitlement audit, not a metric or Lean proof.  The six
endpoint roles are the cap-interior members of the three exact rows; F, C,
and O are their cap-local row centers.  Unknown center/endpoint aliases are
enumerated rather than silently forbidden.  A strict-between constraint is
enabled only when its center is not aliased with either endpoint.
"""
from __future__ import annotations

import itertools
import json
from collections import Counter
from pathlib import Path

HERE = Path(__file__).resolve().parent
RES = HERE / "results"

ENDPOINTS = ("P1", "P2", "A", "B", "R1", "R2")
CENTERS = ("F", "C", "O")
ROLES = ENDPOINTS + CENTERS
BETWEEN = (("F", "P1", "P2"), ("C", "A", "B"), ("O", "R1", "R2"))

# Source-proved center/endpoint exclusions.  All endpoint roles are distinct:
# P/R disjointness is hpairsDisjoint, and A/B are each outside the P/R union
# by CapSourceThirdCanonicalRowWitness.  Each center is outside its own exact
# row support by CriticalFourShell.center_not_mem_support.
OWN_NE = {frozenset((c, a)) for c, a, b in BETWEEN for a in (a, b)}
# The three actual blocker/source centers are distinct from the witness data:
# hblockersNe and the two source witness blocker exclusions.
CENTER_NE = {frozenset(p) for p in itertools.combinations(CENTERS, 2)}
ENDPOINT_NE = {frozenset(p) for p in itertools.combinations(ENDPOINTS, 2)}
for p, q in itertools.product(("P1", "P2"), ("R1", "R2")):
    ENDPOINT_NE.add(frozenset((p, q)))
for a in ("A", "B"):
    for p in ENDPOINTS:
        if p not in ("A", "B"):
            ENDPOINT_NE.add(frozenset((a, p)))
KNOWN_NE = ENDPOINT_NE | OWN_NE | CENTER_NE

# The only center/endpoint aliases not ruled out by the current source
# interface.  F and O cannot use their own pair; C cannot use A/B.
ALIAS_TARGETS = {
    "F": ("A", "B", "R1", "R2"),
    "C": ("P1", "P2", "R1", "R2"),
    "O": ("P1", "P2", "A", "B"),
}
SIGN_ARMS = tuple("".join(bits) for bits in itertools.product("01", repeat=2))


def alias_patterns():
    """Yield center -> endpoint or None, rejecting shared endpoint aliases."""
    for choices in itertools.product(*((None,) + ALIAS_TARGETS[c]
                                       for c in CENTERS)):
        chosen = tuple(x for x in choices if x is not None)
        if len(chosen) != len(set(chosen)):
            continue
        yield dict(zip(CENTERS, choices))


def classes(alias):
    parent = {r: r for r in ROLES}
    for c, e in alias.items():
        if e is not None:
            parent[c] = e
    return {r: parent[r] for r in ROLES}


def active_between(alias):
    cl = classes(alias)
    return tuple((cl[c], cl[a], cl[b]) for c, a, b in BETWEEN
                 if cl[c] not in (cl[a], cl[b]))


def satisfies(order, constraints):
    pos = {r: i for i, r in enumerate(order)}
    return all(pos[a] < pos[c] < pos[b] or pos[b] < pos[c] < pos[a]
               for c, a, b in constraints)


def canonical_linear(order):
    rev = tuple(reversed(order))
    return min(tuple(order), rev)


def canonical_cycle(order):
    order = tuple(order)
    variants = []
    for x in (order, tuple(reversed(order))):
        for i in range(len(x)):
            variants.append(x[i:] + x[:i])
    return min(variants)


def main():
    RES.mkdir(parents=True, exist_ok=True)
    rows = []
    linear_total = cycle_total = 0
    linear_by_k = Counter()
    cycle_by_k = Counter()
    alias_count = Counter()

    for alias in alias_patterns():
        cl = classes(alias)
        reps = tuple(dict.fromkeys(cl[r] for r in ROLES))
        constraints = active_between(alias)
        label = ",".join(f"{c}={alias[c]}" for c in CENTERS
                         if alias[c] is not None) or "none"
        lin = {canonical_linear(o) for o in itertools.permutations(reps)
               if satisfies(o, constraints)}
        # Boundary-only cyclic candidates are reported separately.  The
        # source theorem is linear, so betweenness is not imposed cyclically.
        cyc = {canonical_cycle(o) for o in itertools.permutations(reps)}
        k = len(reps)
        alias_count[k] += 1
        linear_by_k[k] += len(lin)
        cycle_by_k[k] += len(cyc)
        linear_total += len(lin)
        cycle_total += len(cyc)
        rows.append({
            "alias": alias,
            "representatives": reps,
            "active_strict_betweenness": constraints,
            "linear_orders_mod_reversal": len(lin),
            "cyclic_orders_mod_dihedral_boundary_only": len(cyc),
            "sign_arms": list(SIGN_ARMS),
            "sign_constraint_status": "not represented: X,Y,S are outside cap order",
        })

    summary = {
        "alias_patterns": len(rows),
        "alias_patterns_by_cap_point_count": dict(sorted(alias_count.items())),
        "linear_order_survivors_mod_reversal": linear_total,
        "linear_order_survivors_by_cap_point_count": dict(sorted(linear_by_k.items())),
        "cyclic_boundary_candidates_mod_dihedral_boundary_only": cycle_total,
        "cyclic_candidates_by_cap_point_count": dict(sorted(cycle_by_k.items())),
        "sign_arms": list(SIGN_ARMS),
        "sign_arm_interpretation": {
            "0": "left distance < right distance",
            "1": "left distance > right distance",
        },
        "survivors_remain": linear_total > 0,
        "closure": "none; combinatorial scratch census only",
    }
    (RES / "census.json").write_text(json.dumps({
        "known_nonaliases": [sorted(x) for x in sorted(KNOWN_NE, key=lambda x: sorted(x))],
        "rows": rows,
    }, indent=2) + "\n")
    (RES / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
