#!/usr/bin/env python3
"""Independent finite validator for the explicit model of the v2 projection.

This checks every clause family in firstnonhit_v2.in over the 15-element
carrier.  It intentionally does not import the SMT query generator.
"""

D = set(range(15))
NAMES = {
    "pa": 0,
    "pb": 1,
    "ra": 2,
    "rb": 3,
    "qa": 4,
    "qb": 5,
    "ca": 6,
    "cb": 7,
    "oa": 8,
    "co": 0,
    **{f"g{i}": i for i in range(15)},
}
CEN = {
    0: 9,
    1: 9,
    2: 10,
    3: 10,
    4: 11,
    5: 11,
    6: 11,
    7: 11,
    8: 12,
    11: 12,
    14: 12,
    9: 13,
    12: 13,
    10: 14,
    13: 14,
}
ROWS = {
    9: {0, 1, 12, 13},
    10: {2, 3, 12, 14},
    11: {4, 5, 6, 7},
    12: {8, 11, 14, 0},
    13: {9, 12, 1, 2},
    14: {10, 13, 0, 3},
}
MEM = {(u, v) for u in D for v in ROWS[CEN[u]]}
BLOCKED = {(u, CEN[u]) for u in D}


def mem(u, v):
    return (u, v) in MEM


def blocked(u, c):
    return (u, c) in BLOCKED


def check(label, condition):
    if not condition:
        raise AssertionError(label)
    print(f"PASS {label}")


def main():
    # Universal carrier/row schema.
    check("all carrier centers are carriers", all(CEN[u] in D for u in D))
    check("center is not source", all(CEN[u] != u for u in D))
    check("mem has carrier endpoints", all(u in D and v in D for u, v in MEM))
    check("self membership", all(mem(u, u) for u in D))
    check("each row exact four", all(len(ROWS[CEN[u]]) == 4 for u in D))
    check(
        "equal centers equal supports",
        all(ROWS[CEN[u]] == ROWS[CEN[v]] for u in D for v in D if CEN[u] == CEN[v]),
    )
    check(
        "distinct-center intersections at most two",
        all(
            len(ROWS[CEN[u]] & ROWS[CEN[v]]) <= 2
            for u in D
            for v in D
            if CEN[u] != CEN[v]
        ),
    )
    check(
        "blocked deletion lies in selected row",
        all(not blocked(v, CEN[u]) or mem(u, v) for u in D for v in D),
    )
    check("own deletion blocked", all(blocked(u, CEN[u]) for u in D))
    check(
        "center fibers have size at most four",
        all(sum(CEN[u] == c for u in D) <= 4 for c in D),
    )

    # Named carrier and distinctness clauses.
    named = ["pa", "pb", "ra", "rb", "qa", "qb", "ca", "cb", "oa"]
    check("named points are carriers", all(NAMES[x] in D for x in named))
    check(
        "retained pairs disjoint",
        NAMES["pa"] != NAMES["pb"] and NAMES["ra"] != NAMES["rb"],
    )
    check(
        "retained pairs mutually disjoint",
        all(NAMES[x] != NAMES[y] for x in ("pa", "pb") for y in ("ra", "rb")),
    )
    check("Q pair distinct", NAMES["qa"] != NAMES["qb"])
    check("C pair distinct", NAMES["ca"] != NAMES["cb"])
    check(
        "Q avoids retained endpoints",
        all(
            NAMES[x] != NAMES[y] for x in ("qa", "qb") for y in ("pa", "pb", "ra", "rb")
        ),
    )
    check(
        "C avoids retained endpoints",
        all(
            NAMES[x] != NAMES[y] for x in ("ca", "cb") for y in ("pa", "pb", "ra", "rb")
        ),
    )
    check("C avoids oppApex1", all(NAMES[x] != NAMES["oa"] for x in ("ca", "cb")))
    check(
        "retained endpoints avoid oppApex1",
        all(NAMES[x] != NAMES["oa"] for x in ("pa", "pb", "ra", "rb")),
    )

    pa, pb, ra, rb = (NAMES[x] for x in ("pa", "pb", "ra", "rb"))
    qa, qb, ca, cb, oa, co = (NAMES[x] for x in ("qa", "qb", "ca", "cb", "oa", "co"))
    # Q/C same-blocker branch and incidence.
    check("Q mutual support", mem(qa, qb) and mem(qb, qa))
    check(
        "Q blocker differs from retained centers",
        CEN[qa] != CEN[pa] and CEN[qa] != CEN[ra],
    )
    check("Q/C blocker equality", CEN[qa] == CEN[qb] == CEN[ca] == CEN[cb])
    check("C blocker differs from oppApex1", CEN[ca] != oa and CEN[cb] != oa)

    # Weak omission, shared omission, and choice of co.
    check(
        "C omits one endpoint of each retained pair",
        all(
            not (mem(c, pa) and mem(c, pb)) and not (mem(c, ra) and mem(c, rb))
            for c in (ca, cb)
        ),
    )
    check("co is retained endpoint", co in {pa, pb, ra, rb})
    check("C rows omit co", not mem(ca, co) and not mem(cb, co))
    check(
        "ca omission/survival equivalence",
        all((not mem(ca, v)) == (not blocked(v, CEN[ca])) for v in (pa, pb, ra, rb)),
    )
    check(
        "cb omission/survival equivalence",
        all((not mem(cb, v)) == (not blocked(v, CEN[cb])) for v in (pa, pb, ra, rb)),
    )
    check(
        "oppApex1 does not block retained sources",
        not blocked(pa, oa) and not blocked(ra, oa),
    )

    # Added source-backed v2 constraints and the live cardinality guard.
    check("retained P blocker equality", CEN[pa] == CEN[pb])
    check("retained P-rho blocker equality", CEN[ra] == CEN[rb])
    check("retained blocker centers are distinct", CEN[ra] != CEN[pa])
    gs = [NAMES[f"g{i}"] for i in range(15)]
    check("fifteen carrier witnesses", all(g in D for g in gs))
    check("fifteen witnesses pairwise distinct", len(set(gs)) == 15)
    print("VALIDATION PASS: every v2 clause family")


if __name__ == "__main__":
    main()
