#!/usr/bin/env python3
"""Search exact one-sided distance predicates for the five-role residuals.

For each ordered pair of distance variables this tests either
``d_left - d_right >= 0`` or its reverse.  A residual order is marked closed
only when an exact positive dependence of strict Kalmanson gaps together with
that nonnegative predicate is found.  Thus this is a sound diagnostic for the
linear Kalmanson relaxation; it does not assert that a candidate predicate is
geometrically produced.
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
    vec,
)


def pred_label(left, right):
    return "d" + "".join(left) + ">=d" + "".join(right)


def residuals(data):
    roles = data["roles"]
    pairs = list(combinations(sorted(roles), 2))
    pi = {p: i for i, p in enumerate(pairs)}
    out = []
    for tail in permutations([r for r in roles if r != "O"]):
        order = ("O",) + tail
        gaps = kalmanson_gaps(order, pi)
        if positive_gap_certificate(pi, gaps, data["equalities"]) is None:
            out.append(("".join(order), pi, gaps, pairs))
    return out


def main():
    result = {}
    for name, data in SYSTEMS.items():
        rows = residuals(data)
        pairs = rows[0][3]
        candidates = []
        # Equalities are quotiented by the existing row equalities only for
        # candidate generation; opposite one-sided predicates remain distinct.
        for left, right in permutations(pairs, 2):
            candidates.append((left, right))

        cover = {pred_label(l, r): [] for l, r in candidates}
        certs = {}
        for left, right in candidates:
            label = pred_label(left, right)
            for order_name, pi, gaps, _ in rows:
                candidate = vec(pi, [(1, *left), (-1, *right)])
                cert = positive_gap_certificate(
                    pi, gaps + [(label, candidate)], data["equalities"]
                )
                if cert is not None and label in cert[0]:
                    cover[label].append(order_name)
                    certs[label + "::" + order_name] = {
                        "labels": list(cert[0]),
                        "coefficients": [str(x) for x in cert[1]],
                    }

        ranked = sorted(
            ((len(v), k) for k, v in cover.items() if v), reverse=True
        )
        all_orders = {x[0] for x in rows}
        union = set().union(*(set(v) for v in cover.values()))
        result[name] = {
            "residual_orders": sorted(all_orders),
            "ranked": [
                {"predicate": k, "closed_count": n, "orders": cover[k]}
                for n, k in ranked[:40]
            ],
            "uncovered_by_any": sorted(all_orders - union),
            "certificates": certs,
        }
        print(name)
        print("  residual:", len(all_orders))
        for n, k in ranked[:15]:
            print(f"  {n:2d}/16 {k}: {','.join(cover[k])}")
        print("  uncovered by any one-sided distance comparison:",
              sorted(all_orders - union))

    out = Path("scratch/five_role_linear_predicate_search.json")
    out.write_text(json.dumps(result, indent=2) + "\n")
    print(out)


if __name__ == "__main__":
    main()
