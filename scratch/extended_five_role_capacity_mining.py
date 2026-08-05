#!/usr/bin/env python3
"""Diagnostic source-faithful capacity audit for the live M/B endpoint schema.

This is a linear-arithmetic relaxation of the Euclidean source.  It keeps the
full Kalmanson inequalities for all seven roles, the exact shell equalities
and nonmemberships from the follow-up, and the necessary named-center forms of
the pair/triple perpendicular-bisector bounds.  SAT is only a candidate
metric witness; UNSAT is useful only as an audit of this explicitly stated
relaxation and is not a Lean closure certificate.
"""

from __future__ import annotations

import json
from itertools import combinations, permutations
from pathlib import Path

import z3


def pair(a: str, b: str) -> tuple[str, str]:
    return tuple(sorted((a, b)))


def insert_roles(base: str, extras: tuple[str, ...]) -> list[tuple[str, ...]]:
    """All O-anchored cyclic orders projecting to ``base``."""
    tail = tuple(base[1:])
    return [
        ("O",) + p
        for p in permutations(tail + extras)
        if tuple(x for x in p if x not in extras) == tail
    ]


def branches() -> dict[str, dict]:
    return {
        "A=J": {
            "roles": tuple("OACXKMB"),
            "residuals": ("OAKXC", "OCXKA"),
            "equalities": (
                (pair("O", "A"), pair("O", "C")),
                (pair("A", "C"), pair("A", "K")),
                (pair("X", "A"), pair("X", "K")),
                (pair("O", "C"), pair("O", "M")),
                (pair("B", "C"), pair("B", "M")),
                # P1: Q.C is in the X-centered class containing K.
                (pair("X", "C"), pair("X", "K")),
            ),
            "nonmemberships": (
                # M is out of the full A-shell; K is out of the full B-shell.
                (pair("A", "M"), pair("A", "C")),
                (pair("B", "K"), pair("B", "C")),
            ),
        },
        "X=C": {
            "roles": tuple("OACJ KMB".replace(" ", "")),
            "residuals": ("OCAKJ", "OJKAC"),
            "equalities": (
                (pair("O", "J"), pair("O", "C")),
                (pair("A", "C"), pair("A", "K")),
                # P2: Q.J is in the K-centered class containing C=X.
                (pair("J", "K"), pair("J", "C")),
                (pair("O", "C"), pair("O", "M")),
                (pair("B", "C"), pair("B", "M")),
                # The exact X-shell has J,K; with X=C this is CJ=CK.
                (pair("C", "J"), pair("C", "K")),
            ),
            "nonmemberships": (
                (pair("A", "M"), pair("A", "C")),
                (pair("B", "K"), pair("B", "C")),
            ),
        },
    }


def distance_vars(roles: tuple[str, ...]):
    pairs = list(combinations(sorted(roles), 2))
    return pairs, {p: z3.Real(f"d_{p[0]}{p[1]}") for p in pairs}


def d(ds, a: str, b: str):
    return ds[pair(a, b)]


def kalmanson_constraints(order: tuple[str, ...], ds) -> list:
    out = []
    for a, b, c, e in combinations(order, 4):
        # Both strict Kalmanson gaps, normalized by positive scaling.
        out.append(d(ds, a, c) + d(ds, b, e) - d(ds, b, c) - d(ds, a, e) >= 1)
        out.append(d(ds, a, c) + d(ds, b, e) - d(ds, a, b) - d(ds, c, e) >= 1)
    return out


def triangle_constraints(roles: tuple[str, ...], ds) -> list:
    # Non-strict triangle inequalities are necessary for every metric and do
    # not assume the stronger strict-triangle relaxation used by the old LP.
    return [
        d(ds, a, c) <= d(ds, a, b) + d(ds, b, c)
        for a, b, c in combinations(roles, 3)
    ]


def equality_constraints(equalities, ds) -> list:
    return [d(ds, *left) == d(ds, *right) for left, right in equalities]


def capacity_constraints(roles: tuple[str, ...], ds) -> list:
    out = []
    # Every named carrier center is a necessary subset of the full carrier
    # set, so these cardinality bounds cannot create a false source witness.
    for a, b in combinations(roles, 2):
        hits = [d(ds, z, a) == d(ds, z, b) for z in roles if z not in (a, b)]
        out.append(z3.PbLe([(h, 1) for h in hits], 2))
    for a, b, c in combinations(roles, 3):
        hits = [
            z3.And(d(ds, z, a) == d(ds, z, b), d(ds, z, a) == d(ds, z, c))
            for z in roles
            if z not in (a, b, c)
        ]
        out.append(z3.PbLe([(h, 1) for h in hits], 1))
    return out


def saturated_cm_constraints(roles: tuple[str, ...], ds) -> list:
    # O and B are the two known centers for {C,M}; saturation forbids every
    # other named carrier center from lying on that perpendicular bisector.
    return [
        d(ds, z, "C") != d(ds, z, "M")
        for z in roles
        if z not in ("C", "M", "O", "B")
    ]


def solve_case(branch: dict, order: tuple[str, ...], use_capacity: bool):
    roles = branch["roles"]
    pairs, ds = distance_vars(roles)
    solver = z3.Solver()
    solver.set(timeout=30_000)
    solver.add(*(x >= 1 for x in ds.values()))
    solver.add(*kalmanson_constraints(order, ds))
    solver.add(*triangle_constraints(roles, ds))
    solver.add(*equality_constraints(branch["equalities"], ds))
    solver.add(*(d(ds, *left) != d(ds, *right)
                 for left, right in branch["nonmemberships"]))
    if use_capacity:
        solver.add(*capacity_constraints(roles, ds))
        solver.add(*saturated_cm_constraints(roles, ds))
    status = solver.check()
    if status == z3.sat:
        model = solver.model()
        values = []
        for p in pairs:
            value = model.eval(ds[p], model_completion=True)
            values.append(str(value))
        return "SAT", dict(zip(("".join(p) for p in pairs), values))
    if status == z3.unsat:
        return "UNSAT", None
    return "UNKNOWN", None


def main() -> None:
    result = {}
    report = [
        "# Full seven-role endpoint capacity audit",
        "",
        "The Kalmanson system ranges over every four-subset of each seven-role",
        "order.  The capacity layer imposes named-carrier pair-center <= 2,",
        "named-carrier triple-center <= 1, and saturation of the known O,B",
        "centers for the pair {C,M}.  SAT is only a metric-relaxation witness.",
        "",
    ]
    for name, branch in branches().items():
        rows = []
        for base in branch["residuals"]:
            for order in insert_roles(base, ("M", "B")):
                full_status, full_witness = solve_case(branch, order, False)
                cap_status, cap_witness = solve_case(branch, order, True)
                rows.append({
                    "base": base,
                    "order": "".join(order),
                    "full_status": full_status,
                    "capacity_status": cap_status,
                    "witness": cap_witness,
                })
        result[name] = {"schema": branch, "rows": rows}
        report.extend([
            f"## {name}", "",
            f"- insertion orders: {len(rows)}",
            f"- full 7-role Kalmanson + shell SAT: {sum(r['full_status'] == 'SAT' for r in rows)}",
            f"- full 7-role Kalmanson + shell UNSAT: {sum(r['full_status'] == 'UNSAT' for r in rows)}",
            f"- after named capacity + saturated {{C,M}} SAT: {sum(r['capacity_status'] == 'SAT' for r in rows)}",
            f"- after named capacity + saturated {{C,M}} UNSAT: {sum(r['capacity_status'] == 'UNSAT' for r in rows)}",
            f"- UNKNOWN: {sum(r['capacity_status'] == 'UNKNOWN' for r in rows)}", "",
            "| base | order | full 7-role | capacity layer |", "|---|---|---|---|",
        ])
        for r in rows:
            report.append(f"| {r['base']} | {r['order']} | {r['full_status']} | {r['capacity_status']} |")
        report.extend(["", "Capacity SAT witnesses:", ""])
        for r in rows:
            if r["capacity_status"] == "SAT":
                report.append(f"- `{r['base']}` / `{r['order']}`: " + ", ".join(
                    f"d{k}={v}" for k, v in r["witness"].items()))
        report.append("")
    output = Path("scratch/extended_five_role_capacity_mining_report.md")
    output.write_text("\n".join(report) + "\n")
    Path("scratch/extended_five_role_capacity_mining.json").write_text(
        json.dumps(result, indent=2) + "\n"
    )
    print(output)
    for name, data in result.items():
        rows = data["rows"]
        print(name, "full", {s: sum(r["full_status"] == s for r in rows) for s in ("SAT", "UNSAT", "UNKNOWN")},
              "capacity", {s: sum(r["capacity_status"] == s for r in rows) for s in ("SAT", "UNSAT", "UNKNOWN")})


if __name__ == "__main__":
    main()
