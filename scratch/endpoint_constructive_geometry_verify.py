#!/usr/bin/env python3
"""Independent exact-coordinate verifier for endpoint constructive witnesses."""

from fractions import Fraction as Q
import json
from pathlib import Path


SOURCE = Path("scratch/endpoint_constructive_geometry_results.json")
OUT = Path("scratch/endpoint_constructive_geometry_verification.json")
REPORT = Path("scratch/endpoint_constructive_geometry_report.md")


def sub(p, q):
    return (p[0] - q[0], p[1] - q[1])


def cross(p, q, r):
    u, v = sub(q, p), sub(r, p)
    return u[0] * v[1] - u[1] * v[0]


def d2(p, q):
    u = sub(p, q)
    return u[0] * u[0] + u[1] * u[1]


def qs(x):
    return str(x.numerator) if x.denominator == 1 else f"{x.numerator}/{x.denominator}"


def main():
    src = json.loads(SOURCE.read_text())
    verified = {}
    report = [
        "# Constructive exact-rational endpoint geometry audit",
        "",
        "**Verdict: all four endpoint residual orders are locally realizable by strictly convex exact-rational configurations.**",
        "",
        "Scope: this refutes a local Euclidean-impossibility route using only the named shell",
        "equalities, the two source nonincidences, branch identity, and residual cyclic order.",
        "It is not a global Problem 97 configuration and does not realize anonymous deleted-row supports.",
        "",
        "The generator normalizes `O=(0,0)` and puts `C,M,J` on the rational unit circle.",
        "This verifier reparses only the final coordinates and recomputes every claim exactly.",
        "For each directed hull edge, every other representative has positive cross product;",
        "this simultaneously checks the displayed CCW order and strict convexity.",
        "",
    ]
    for key, row in src["witnesses"].items():
        pts = {name: (Q(x), Q(y)) for name, (x, y) in row["coordinates"].items()}
        branch, target = key.split("/")
        alias = "J" if branch == "A=J" else "X"
        canonical = "A" if branch == "A=J" else "C"
        reps = {name: p for name, p in pts.items() if name != alias}
        hull = row["ccw_hull_representatives"]
        assert len(hull) == len(reps) == len(set(reps.values()))
        assert pts[alias] == pts[canonical]
        assert "".join(x for x in hull if x in target) == target

        equalities = {
            "OC2=OM2": d2(pts["O"], pts["C"]) == d2(pts["O"], pts["M"]),
            "OC2=OJ2": d2(pts["O"], pts["C"]) == d2(pts["O"], pts["J"]),
            "AC2=AK2": d2(pts["A"], pts["C"]) == d2(pts["A"], pts["K"]),
            "BC2=BM2": d2(pts["B"], pts["C"]) == d2(pts["B"], pts["M"]),
            "XJ2=XK2": d2(pts["X"], pts["J"]) == d2(pts["X"], pts["K"]),
            "AM2!=AC2": d2(pts["A"], pts["M"]) != d2(pts["A"], pts["C"]),
            "BK2!=BC2": d2(pts["B"], pts["K"]) != d2(pts["B"], pts["C"]),
            "branch_identity": pts[alias] == pts[canonical],
        }
        assert all(equalities.values())

        edge_signs = {}
        for i, u in enumerate(hull):
            v = hull[(i + 1) % len(hull)]
            signs = {w: cross(reps[u], reps[v], reps[w])
                     for w in hull if w not in (u, v)}
            assert all(s > 0 for s in signs.values())
            edge_signs[u + v] = {w: qs(s) for w, s in signs.items()}

        distances = {
            "OC2=OM2=OJ2": qs(d2(pts["O"], pts["C"])),
            "AC2=AK2": qs(d2(pts["A"], pts["C"])),
            "AM2": qs(d2(pts["A"], pts["M"])),
            "BC2=BM2": qs(d2(pts["B"], pts["C"])),
            "BK2": qs(d2(pts["B"], pts["K"])),
            "XJ2=XK2": qs(d2(pts["X"], pts["J"])),
        }
        verified[key] = {
            "all_checks": True,
            "equalities_and_nonincidences": equalities,
            "all_directed_edge_point_cross_products": edge_signs,
            "distances": distances,
        }

        report += [f"## `{key}`", "", f"Full representative hull: `{' < '.join(hull)}` (CCW).", "",
                   f"Residual projection: `{' < '.join(target)}`.", "", "Coordinates:", ""]
        for name in ("O", "A", "B", "C", "J", "K", "M", "X"):
            report.append(f"- `{name} = ({qs(pts[name][0])}, {qs(pts[name][1])})`")
        report += ["", "Squared-distance checks:", ""]
        for name, value in distances.items():
            report.append(f"- `{name} = {value}`")
        report += ["", "Consecutive hull cross products (all strictly positive):", "",
                   "- " + ", ".join(f"`{x}`" for x in row["consecutive_cross_products"]), ""]

    OUT.write_text(json.dumps({"status": "VERIFIED_EXACT", "witnesses": verified}, indent=2) + "\n")
    REPORT.write_text("\n".join(report) + "\n")
    print(f"verified {len(verified)} witnesses; wrote {OUT} and {REPORT}")


if __name__ == "__main__":
    main()
