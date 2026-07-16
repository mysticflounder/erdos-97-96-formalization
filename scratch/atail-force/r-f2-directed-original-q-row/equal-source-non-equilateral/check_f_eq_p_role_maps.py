#!/usr/bin/env python3
"""Audit all U1TwoLargeCapHypotheses role maps with f fixed to p.

This is a finite symbolic audit of the equalities already present in the
strict-witness normal form.  It is not a Euclidean realizability checker.
"""

from itertools import permutations


POINTS = ("x", "z1", "z2", "y")
KNOWN_CHORD_EDGES = {
    frozenset(("p", "z1")),
    frozenset(("p", "z2")),
    frozenset(("x", "z1")),
    frozenset(("y", "z2")),
    frozenset(("z1", "z2")),
}
KNOWN_NONCHORD_EDGES = {
    frozenset(("x", "z2")),
    frozenset(("y", "z1")),
}


def edge(a: str, b: str) -> frozenset[str]:
    return frozenset((a, b))


def equality_status(left: frozenset[str], right: frozenset[str]) -> str:
    if left == right:
        return "automatic"
    if left in KNOWN_CHORD_EDGES and right in KNOWN_CHORD_EDGES:
        return "automatic"
    if (
        left in KNOWN_CHORD_EDGES
        and right in KNOWN_NONCHORD_EDGES
        or right in KNOWN_CHORD_EDGES
        and left in KNOWN_NONCHORD_EDGES
    ):
        return "contradicted"
    return "missing"


def audit_role_map(a: str, c: str, d: str, e: str) -> dict[str, object]:
    f = "p"
    equalities = (
        ("h1", edge(c, a), edge(c, d)),
        ("h2", edge(c, a), edge(c, f)),
        ("h3", edge(d, c), edge(d, e)),
        ("h4", edge(d, c), edge(d, f)),
        ("h5", edge(f, a), edge(f, d)),
        ("h6", edge(f, a), edge(f, e)),
        ("h7", edge(e, a), edge(e, c)),
    )
    statuses = [
        (name, sorted(left), sorted(right), equality_status(left, right))
        for name, left, right in equalities
    ]
    return {
        "map": {"a": a, "c": c, "d": d, "e": e, "f": f},
        "statuses": statuses,
        "contradicted": any(item[3] == "contradicted" for item in statuses),
        "missing": [item for item in statuses if item[3] == "missing"],
    }


def main() -> None:
    audits = [audit_role_map(*role_map) for role_map in permutations(POINTS)]
    survivors = [audit for audit in audits if not audit["contradicted"]]
    survivors.sort(key=lambda audit: len(audit["missing"]))

    minimum = len(survivors[0]["missing"])
    minimizers = [audit for audit in survivors if len(audit["missing"]) == minimum]

    assert len(audits) == 24
    assert len(survivors) == 4
    assert minimum == 3
    assert len(minimizers) == 2

    print(f"all role maps: {len(audits)}")
    print(f"not immediately contradicted: {len(survivors)}")
    print(f"minimum missing equalities: {minimum}")
    for audit in minimizers:
        print(audit["map"])
        for name, left, right, _status in audit["missing"]:
            print(f"  {name}: d({','.join(left)}) = d({','.join(right)})")


if __name__ == "__main__":
    main()
