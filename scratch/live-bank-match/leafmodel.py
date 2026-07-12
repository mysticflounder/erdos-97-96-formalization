#!/usr/bin/env python3
"""Shared point-identification model over extracted leaf packets.

Union-find closure over equality atoms; contradiction = some disequality atom
with both sides in one class. Used by the validation gate and the comparator.
"""


class UF:
    def __init__(self):
        self.parent = {}

    def find(self, x: str) -> str:
        self.parent.setdefault(x, x)
        while self.parent[x] != x:
            self.parent[x] = self.parent[self.parent[x]]
            x = self.parent[x]
        return x

    def union(self, a: str, b: str) -> None:
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.parent[ra] = rb


def closure(leaf: dict) -> UF:
    uf = UF()
    for e in leaf["eqs"]:
        uf.union(e["lhs"], e["rhs"])
    return uf


def violations(leaf: dict, uf: UF) -> list[dict]:
    out = []
    for d in leaf["diseqs"]:
        if uf.find(d["lhs"]) == uf.find(d["rhs"]):
            out.append(d)
    return out


def resolve_rows(leaf: dict, uf: UF) -> list[dict]:
    """Rows with centers/members resolved to closure representatives."""
    out = []
    for r in leaf["rows"]:
        out.append({
            "row": r["row"],
            "center": uf.find(r["center"]) if r["center"] else None,
            "members": {uf.find(m) for m in r["members_at_radius"]},
        })
    return out
