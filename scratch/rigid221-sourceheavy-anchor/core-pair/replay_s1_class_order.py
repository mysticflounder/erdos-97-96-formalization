"""Replay the S1 mid-angle witness constraint against the v26 model space.

Section 4.2 of docs/exact-twelve-biapex-schemas-2026-08-20.md: run S1
against the deletion-arm trace tables.  Computational form used here:

The physical class about the second apex (P2 = label 1) is
C = {t, v, u, xv, xu} = {0, 3, 6, 8, 9}.  The class is cocircular about
P2 and, by K1, lies in an open half-circle, so its angular order about P2
is linear.  For a convex polygon that linear order is the boundary order
of the carrier cut at P2.  Restricting the 48 canonical deck orders to C
and cutting at label 1 must therefore yield the possible class orders;
this script derives them from the deck rather than asserting them.

S1 (now Lean: Problem97.equidistant_classPoint_unique_of_convexIndep and
vsub_eq_radius_smul_chordResultant_of_separating_vector in
lean/Erdos9796Proof/P97/ATail/CocircularEquidistantWitness.lean) forces:
an on-class center z whose row contains a class pair {p, q} is an
equidistant witness of that pair, hence lies at the pair's mid-angle - in
particular STRICTLY BETWEEN p and q in the linear class order.  A pair
consecutive in the class order admits no on-class host at all.

The physical bridge (membership in a row implies equidistance from its
center) holds for the leaf's radius-class rows and is NOT part of the
source-faithful CNF contract; like the S2 test, this is an empirical
measurement of what a physically-bridged S1 bank would prune.

A cube is prunable by S1 only if it violates the betweenness constraint
under EVERY deck-consistent class order (the true geometry realizes one
of them).

Diagnostic only; nothing here is a certificate, a bank, or a wave.
"""

from __future__ import annotations

import itertools
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.exact12_v14_ordered_coverage import source_boundary_orders

APEX = 1
CLASS_LABELS = frozenset({0, 3, 6, 8, 9})
V26_SURVIVOR = {
    0: {1, 2, 3, 4}, 1: {0, 3, 6, 8}, 2: {0, 1, 10, 11}, 3: {0, 5, 7, 9},
    4: {0, 5, 6, 10}, 5: {3, 4, 8, 10}, 6: {2, 5, 8, 10}, 7: {5, 6, 8, 11},
    8: {4, 6, 9, 11}, 9: {0, 3, 7, 11}, 10: {2, 4, 5, 7}, 11: {4, 6, 7, 10},
}


def class_orders() -> list[tuple[int, ...]]:
    """Distinct linear class orders about the apex, from the deck."""

    seen = set()
    for _orientation, order in source_boundary_orders():
        cut = order.index(APEX)
        rotated = order[cut + 1 :] + order[: cut]
        linear = tuple(l for l in rotated if l in CLASS_LABELS)
        canonical = min(linear, tuple(reversed(linear)))
        seen.add(canonical)
    return sorted(seen)


def s1_violations(supports, linear):
    """(z, p, q) with z on-class hosting class pair not strictly between."""

    pos = {label: index for index, label in enumerate(linear)}
    out = []
    for z in CLASS_LABELS:
        class_members = (supports[z] & CLASS_LABELS) - {z}
        for p, q in itertools.combinations(sorted(class_members), 2):
            lo, hi = sorted((pos[p], pos[q]))
            if not (lo < pos[z] < hi):
                out.append((z, p, q))
    return out


def main() -> None:
    orders = class_orders()
    print(f"deck-consistent linear class orders (up to reversal): {len(orders)}")
    for linear in orders:
        print(f"  {linear}")

    for tag, supports in (("v26 authenticated survivor", V26_SURVIVOR),):
        per_order = [s1_violations(supports, o) for o in orders]
        prunable = all(v for v in per_order)
        print(f"\n{tag}:")
        for linear, viols in zip(orders, per_order):
            print(f"  order {linear}: {len(viols)} violations {viols[:4]}")
        print(f"  prunable by S1 (violates every order): {prunable}")

    models_path = (
        REPO_ROOT / "scratch/rigid221-sourceheavy-anchor/core-pair/"
        "v26_projected_models.json"
    )
    cubes = json.loads(models_path.read_text())["cubes"]
    counts = {tuple(): 0}
    per_order_violating = [0] * len(orders)
    prunable_count = 0
    for cube in cubes:
        supports = {int(k): set(v) for k, v in cube.items()}
        flags = [bool(s1_violations(supports, o)) for o in orders]
        for i, f in enumerate(flags):
            per_order_violating[i] += f
        prunable_count += all(flags)
    print(f"\nenumerated sample ({len(cubes)} models):")
    for linear, n in zip(orders, per_order_violating):
        print(f"  violating under order {linear}: {n}")
    print(f"  PRUNABLE by S1 (violate every deck-consistent order): {prunable_count}")


if __name__ == "__main__":
    main()
