#!/usr/bin/env python3
"""Exact rational replay of the initial exact-six mutual row projection.

This deliberately encodes only the fields exposed by
ExactSixMutualCompleteRowManifest and the seven role constructors.  It does
not encode strict convexity, cyclic cap order, MEC containment, minimality, or
noM44.  Every arithmetic check uses fractions.Fraction.
"""

from __future__ import annotations

import argparse
import json
from dataclasses import dataclass
from fractions import Fraction as Q
from pathlib import Path

Point = tuple[Q, Q]


def add(a: Point, b: Point) -> Point:
    return (a[0] + b[0], a[1] + b[1])


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def norm2(a: Point) -> Q:
    return a[0] * a[0] + a[1] * a[1]


def dist2(a: Point, b: Point) -> Q:
    return norm2(sub(a, b))


def rotate_rational(v: Point, t: Q) -> Point:
    """Rotate by the rational unit-circle parameter t."""
    den = 1 + t * t
    c = (1 - t * t) / den
    s = 2 * t / den
    return (c * v[0] - s * v[1], s * v[0] + c * v[1])


def unit_point(t: Q) -> Point:
    return rotate_rational((Q(1), Q(0)), t)


def shell(center: Point, source: Point, params: tuple[Q, Q, Q]) -> frozenset[Point]:
    v = sub(source, center)
    return frozenset({source, *(add(center, rotate_rational(v, t)) for t in params)})


ORBITS = (
    "continuationOrder",
    "reverseContinuationOrder",
    "sharesFirstAtSource",
    "sharesFirstAtTarget",
    "sharesSecondAtSource",
    "sharesSecondAtTarget",
    "fourDistinct",
)


@dataclass(frozen=True)
class Witness:
    orbit: str
    points: dict[str, Point]
    apex_class: frozenset[Point]
    cap: frozenset[Point]
    cap_interior: frozenset[Point]
    physical: frozenset[Point]
    roles: dict[str, Point]
    blockers: dict[str, Point]
    supports: dict[str, frozenset[Point]]
    carrier: frozenset[Point]


def build(orbit: str) -> Witness:
    if orbit not in ORBITS:
        raise ValueError(orbit)
    apex = (Q(0), Q(0))
    p = [unit_point(t) for t in (Q(0), Q(1, 2), Q(1), Q(2), Q(3))]
    unused = (Q(2), Q(3))
    endpoint0 = (Q(5), Q(7))
    endpoint1 = (Q(7), Q(11))

    first, second = p[0], p[1]
    role_map = {
        "continuationOrder": (p[0], p[1]),
        "reverseContinuationOrder": (p[1], p[0]),
        "sharesFirstAtSource": (p[0], p[2]),
        "sharesFirstAtTarget": (p[2], p[0]),
        "sharesSecondAtSource": (p[1], p[2]),
        "sharesSecondAtTarget": (p[2], p[1]),
        "fourDistinct": (p[2], p[3]),
    }
    source, target = role_map[orbit]
    if orbit == "fourDistinct":
        physical = frozenset(p[:4])
        cap_interior = physical
        cap = frozenset({*physical, unused, endpoint1})
    else:
        physical = frozenset(p[:3])
        cap_interior = frozenset({*physical, unused})
        cap = frozenset({*cap_interior, endpoint0, endpoint1})

    blockers = {
        "unused": (Q(10), Q(1)),
        "source": (Q(20), Q(3)),
        "target": (Q(30), Q(7)),
    }
    params = (Q(1, 5), Q(2, 5), Q(3, 5))
    supports = {
        "unused": shell(blockers["unused"], unused, params),
        "source": shell(blockers["source"], source, params),
        "target": shell(blockers["target"], target, params),
    }
    named = {
        "apex": apex,
        "unused": unused,
        "endpoint0": endpoint0,
        "endpoint1": endpoint1,
        **{f"p{i}": x for i, x in enumerate(p)},
    }
    carrier = frozenset({
        *named.values(),
        *blockers.values(),
        *(x for support in supports.values() for x in support),
    })
    return Witness(
        orbit=orbit,
        points=named,
        apex_class=frozenset(p),
        cap=cap,
        cap_interior=cap_interior,
        physical=physical,
        roles={"first": first, "second": second, "source": source, "target": target},
        blockers=blockers,
        supports=supports,
        carrier=carrier,
    )


def validate(w: Witness) -> dict[str, bool]:
    a = w.points["apex"]
    u = w.points["unused"]
    f, s, q, t = (w.roles[k] for k in ("first", "second", "source", "target"))
    b = w.blockers
    r = w.supports
    apex_r2 = dist2(a, next(iter(w.apex_class)))
    selected_apex = frozenset(x for x in w.carrier if dist2(a, x) == apex_r2)
    selected_rows = {
        k: frozenset(x for x in w.carrier if dist2(b[k], x) == dist2(b[k], src))
        for k, src in (("unused", u), ("source", q), ("target", t))
    }
    checks = {
        "carrier_points_distinct": len(w.carrier) == len(set(w.carrier)),
        "cap_card_eq_six": len(w.cap) == 6,
        "cap_interior_card_eq_four": len(w.cap_interior) == 4,
        "cap_interior_subset_cap": w.cap_interior <= w.cap,
        "unused_mem_cap": u in w.cap,
        "unused_not_mem_apex_class": u not in w.apex_class,
        "apex_class_complete_card_five": selected_apex == w.apex_class and len(w.apex_class) == 5,
        "physical_exact_intersection": w.physical == w.apex_class & w.cap_interior,
        "physical_card_three_or_four": len(w.physical) in (3, 4),
        "roles_subset_physical": {f, s, q, t} <= w.physical,
        "continuation_sources_ne": f != s,
        "mutual_sources_ne": q != t,
        "unused_not_mem_physical": u not in w.physical,
        "all_blockers_mem_carrier": set(b.values()) <= w.carrier,
        "all_three_blockers_pairwise_ne": len(set(b.values())) == 3,
        "blockers_ne_apex": all(x != a for x in b.values()),
        "blocker_ne_own_source": b["unused"] != u and b["source"] != q and b["target"] != t,
        "mutual_blockers_ne": b["source"] != b["target"],
        "row_supports_complete": all(selected_rows[k] == r[k] for k in r),
        "row_supports_card_four": all(len(x) == 4 for x in r.values()),
        "row_sources_mem_support": u in r["unused"] and q in r["source"] and t in r["target"],
        "row_blockers_not_mem_support": all(b[k] not in r[k] for k in r),
        "unused_row_omits_continuation": f not in r["unused"] and s not in r["unused"],
        "mutual_rows_omit_each_other": t not in r["source"] and q not in r["target"],
        "unused_physical_inter_le_one": len(w.physical & r["unused"]) <= 1,
        "source_physical_inter_le_two": len(w.physical & r["source"]) <= 2,
        "target_physical_inter_le_two": len(w.physical & r["target"]) <= 2,
        "mutual_support_inter_le_two": len(r["source"] & r["target"]) <= 2,
    }
    if w.orbit == "continuationOrder":
        checks["orbit_identity"] = q == f and t == s
    elif w.orbit == "reverseContinuationOrder":
        checks["orbit_identity"] = q == s and t == f
    elif w.orbit == "sharesFirstAtSource":
        checks["orbit_identity"] = q == f and t != s
    elif w.orbit == "sharesFirstAtTarget":
        checks["orbit_identity"] = t == f and q != s
    elif w.orbit == "sharesSecondAtSource":
        checks["orbit_identity"] = q == s and t not in (f, s)
    elif w.orbit == "sharesSecondAtTarget":
        checks["orbit_identity"] = t == s and q not in (f, s)
    else:
        checks["orbit_identity"] = len({f, s, q, t}) == 4 and {f, s, q, t} == w.physical
    return checks


def qstr(x: Q) -> str:
    return str(x.numerator) if x.denominator == 1 else f"{x.numerator}/{x.denominator}"


def point_json(p: Point) -> list[str]:
    return [qstr(p[0]), qstr(p[1])]


def serialize(w: Witness, checks: dict[str, bool]) -> dict:
    labels = {point: name for name, point in w.points.items()}
    for name, point in w.blockers.items():
        labels.setdefault(point, f"blocker_{name}")
    for row, support in w.supports.items():
        for i, point in enumerate(sorted(support)):
            labels.setdefault(point, f"{row}_support_{i}")
    return {
        "schema": "p97-exact6-manifest-first-gate-row-cap-projection-v1",
        "orbit": w.orbit,
        "verdict": "EXACT_ROW_CAP_PROJECTION_WITNESS" if all(checks.values()) else "INVALID",
        "omitted": [
            "strict convexity and cyclic boundary order",
            "minimum-enclosing-circle containment and nonobtuse support triangle",
            "global minimality and noM44",
            "criticality/no-qfree facts beyond the displayed complete rows",
        ],
        "checks": checks,
        "roles": {k: point_json(v) for k, v in w.roles.items()},
        "blockers": {k: point_json(v) for k, v in w.blockers.items()},
        "supports": {k: [point_json(x) for x in sorted(v)] for k, v in w.supports.items()},
        "apex_class": [point_json(x) for x in sorted(w.apex_class)],
        "cap": [point_json(x) for x in sorted(w.cap)],
        "cap_interior": [point_json(x) for x in sorted(w.cap_interior)],
        "physical": [point_json(x) for x in sorted(w.physical)],
        "carrier": [point_json(x) for x in sorted(w.carrier)],
        "carrier_labels": {name: point_json(point) for point, name in labels.items()},
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    results = []
    for orbit in ORBITS:
        witness = build(orbit)
        checks = validate(witness)
        result = serialize(witness, checks)
        results.append(result)
        print(f"{orbit}: {result['verdict']} ({sum(checks.values())}/{len(checks)} checks)")
        if not all(checks.values()):
            print("  failed:", [name for name, ok in checks.items() if not ok])
    payload = {"results": results}
    if args.output:
        args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    if any(result["verdict"] == "INVALID" for result in results):
        raise SystemExit(1)


if __name__ == "__main__":
    main()
