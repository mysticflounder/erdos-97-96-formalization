#!/usr/bin/env python3
"""Mine small additional distance predicates for the two five-role leaves.

The search is deliberately restricted to exact distance equalities among the
five named roles.  For each residual cyclic order it asks whether the strict
Kalmanson gaps become positively dependent after adding one candidate
equality, and then searches small equality sets that close every residual
order.  A hit is an exact Kalmanson implication, not a claim that the extra
predicate has a current geometric producer.
"""

from __future__ import annotations

import json
from itertools import combinations, permutations
from pathlib import Path

from five_role_kalmanson_enumeration import (
    SYSTEMS,
    kalmanson_gaps,
    pair,
    positive_gap_certificate,
    quotient_data,
    reduce_vec,
)


def key(eq):
    left, right = eq
    return tuple(sorted((left, right)))


def label(eq):
    return "d" + "".join(eq[0]) + "=d" + "".join(eq[1])


def residual_rows(name, data):
    roles = data["roles"]
    pairs = list(combinations(sorted(roles), 2))
    pi = {p: i for i, p in enumerate(pairs)}
    rows = []
    for tail in permutations([r for r in roles if r != "O"]):
        order = ("O",) + tail
        gaps = kalmanson_gaps(order, pi)
        if positive_gap_certificate(pi, gaps, data["equalities"]) is None:
            rows.append(("".join(order), order, pairs, pi, gaps))
    return rows


def complete_positive_gap_certificate(pi, gaps, equalities):
    """Include the zero-vector circuit omitted by the audit helper.

    An added equality can make one strict Kalmanson gap identically zero.
    That is already a contradiction, but the general circuit enumerator
    intentionally skips nullspaces of dimension greater than one and therefore
    does not report this singleton circuit.
    """
    full_to_reduced, reduced_dim = quotient_data(pi, equalities)
    for label_, gap in gaps:
        reduced = reduce_vec(full_to_reduced, reduced_dim, gap)
        if all(x == 0 for x in reduced):
            return ((label_,), (1,))
    return positive_gap_certificate(pi, gaps, equalities)


def main():
    all_results = {}
    for name, data in SYSTEMS.items():
        rows = residual_rows(name, data)
        pairs = rows[0][2]
        base = {key(eq) for eq in data["equalities"]}
        candidates = []
        for left, right in combinations(pairs, 2):
            eq = (left, right)
            if key(eq) in base:
                continue
            candidates.append(eq)

        cover = {}
        certs = {}
        for eq in candidates:
            closed = []
            for order_name, order, pairs, pi, gaps in rows:
                cert = complete_positive_gap_certificate(
                    pi, gaps, data["equalities"] + (eq,)
                )
                if cert is not None:
                    closed.append(order_name)
                    certs[label(eq) + "::" + order_name] = {
                        "labels": list(cert[0]),
                        "coefficients": [str(x) for x in cert[1]],
                    }
            cover[label(eq)] = closed

        ranked = sorted(
            ((len(v), k) for k, v in cover.items()), reverse=True
        )
        # Search pairs/triples only among the strongest candidates.  A full
        # pair search is tiny (at most 42 choose 2) but keep deterministic
        # output and avoid emitting every combination.
        top = [k for count, k in ranked if count > 0][:24]
        full = [order_name for order_name, *_ in rows]
        winning = []
        for size in (1, 2, 3):
            found = []
            for chosen in combinations(top, size):
                union = set()
                for k in chosen:
                    union.update(cover[k])
                if set(full) <= union:
                    found.append(chosen)
                    if len(found) >= 20:
                        break
            if found:
                winning = found
                break
        all_results[name] = {
            "residual_orders": full,
            "ranked_single_equalities": [
                {"predicate": k, "closed_count": count, "orders": cover[k]}
                for count, k in ranked[:20]
            ],
            "smallest_found_cover_size": len(winning[0]) if winning else None,
            "covers": [list(x) for x in winning],
            "certificates": certs,
        }

        print(name)
        print("  residual:", len(full))
        for count, k in ranked[:10]:
            if count:
                print(f"  {count:2d}/16 {k}: {','.join(cover[k])}")
        print("  smallest found cover:", all_results[name]["smallest_found_cover_size"])
        for x in winning[:5]:
            print("   ", " + ".join(x))
        covered_by_any = set().union(*(set(v) for v in cover.values()))
        print("  orders not closed by any one extra equality:",
              sorted(set(full) - covered_by_any))

    out = Path("scratch/five_role_extra_predicate_search.json")
    out.write_text(json.dumps(all_results, indent=2) + "\n")
    print(out)


if __name__ == "__main__":
    main()
