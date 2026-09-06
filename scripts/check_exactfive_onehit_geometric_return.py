#!/usr/bin/env python3
"""Verify the bounded exact-five geometric one-hit return model.

This checker consumes only the raw rational JSON model.  It is deliberately
local: it does not claim a global K4 configuration or a total critical-shell
system.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_MODEL = (
    ROOT / "docs/references/exactfive-source-geometry-2026-09-05/"
    "onehit-geometric-return.json"
)
SCHEMA = "exactfive-geometric-return-verification/v1"


class VerificationError(RuntimeError):
    pass


Point = tuple[Fraction, Fraction]


def rational(value: str) -> Fraction:
    return Fraction(value)


def point(value: list[str]) -> Point:
    return rational(value[0]), rational(value[1])


def cross(a: Point, b: Point, c: Point) -> Fraction:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def dot(a: Point, b: Point, c: Point) -> Fraction:
    return (a[0] - b[0]) * (c[0] - b[0]) + (a[1] - b[1]) * (c[1] - b[1])


def dist_sq(a: Point, b: Point) -> Fraction:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def fs(value: Fraction) -> str:
    return str(value)


def check(condition: bool, name: str, detail: str = "") -> None:
    if not condition:
        suffix = f": {detail}" if detail else ""
        raise VerificationError(f"{name}{suffix}")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_json(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def heavy_classes(points: dict[str, Point], center: str) -> dict[str, list[str]]:
    groups: dict[Fraction, list[str]] = {}
    for name, value in points.items():
        radius_sq = dist_sq(points[center], value)
        if radius_sq:
            groups.setdefault(radius_sq, []).append(name)
    return {
        fs(radius_sq): sorted(names)
        for radius_sq, names in sorted(groups.items(), key=lambda item: item[0])
        if len(names) >= 4
    }


def parse_model(path: Path) -> tuple[dict[str, Any], dict[str, Point]]:
    model = json.loads(path.read_text())
    check(model.get("schema") == "exactfive-geometric-return-control/v1", "model schema")
    points = {name: point(value) for name, value in model["points"].items()}
    expected = model.get("expected", {})
    check(len(points) == expected.get("point_count", len(points)), "point count", str(len(points)))
    check(len(set(points.values())) == len(points), "point distinctness")
    return model, points


def verify(model_path: Path) -> dict[str, Any]:
    model, points = parse_model(model_path)
    names = list(model["ccw_order"])
    check(set(names) == set(points), "ccw name coverage")
    check(len(names) == len(points), "ccw name count")

    # Every directed hull edge supports all other vertices strictly on its left.
    ccw_values = [
        cross(points[names[i]], points[names[(i + 1) % len(names)]], points[name])
        for i in range(len(names))
        for name in names
        if name not in {names[i], names[(i + 1) % len(names)]}
    ]
    check(all(value > 0 for value in ccw_values), "ccw supporting edges")

    mec = model["mec"]
    mec_center = point(mec["center"])
    mec_radius_sq = rational(mec["radius_squared"])
    mec_slacks = [mec_radius_sq - dist_sq(mec_center, value) for value in points.values()]
    check(all(value >= 0 for value in mec_slacks), "MEC containment")
    boundary = [name for name, value in points.items() if dist_sq(mec_center, value) == mec_radius_sq]
    check(set(boundary) == set(mec["support"]), "MEC exact boundary", repr(boundary))
    check(len(boundary) == 3, "MEC boundary cardinality", str(len(boundary)))

    O, R, L = (points[name] for name in ("O", "R", "L"))
    acute_dots = [dot(R, O, L), dot(O, R, L), dot(O, L, R)]
    check(all(value > 0 for value in acute_dots), "support triangle strictly acute")
    # Solve M = alpha*O + beta*R + gamma*L, alpha+beta+gamma=1.
    det = cross(O, R, L)
    alpha = cross(mec_center, R, L) / det
    beta = cross(O, mec_center, L) / det
    gamma = cross(O, R, mec_center) / det
    barycentric = [alpha, beta, gamma]
    check(all(value > 0 for value in barycentric), "MEC positive barycentric coordinates")
    check(alpha + beta + gamma == 1, "MEC barycentric sum")
    reconstructed = (
        alpha * O[0] + beta * R[0] + gamma * L[0],
        alpha * O[1] + beta * R[1] + gamma * L[1],
    )
    check(reconstructed == mec_center, "MEC barycentric reconstruction")
    check(
        all(dist_sq(mec_center, points[name]) <= mec_radius_sq for name in mec["support"]),
        "MEC support containment",
    )

    # The closed opposite cap is the side of the chord not containing its apex.
    cap_chords = {"O": ("R", "L"), "R": ("L", "O"), "L": ("O", "R")}
    expected_cap_cards = model.get("expected", {}).get(
        "closed_cap_sizes", {"O": 13, "R": 7, "L": 6}
    )
    cap_closed: dict[str, set[str]] = {}
    cap_strict: dict[str, set[str]] = {}
    cap_margins: list[Fraction] = []
    for apex, (a_name, b_name) in cap_chords.items():
        a, b, apex_point = points[a_name], points[b_name], points[apex]
        apex_side = cross(a, b, apex_point)
        closed = {
            name for name, value in points.items() if cross(a, b, value) * apex_side <= 0
        }
        strict = {
            name for name, value in points.items() if cross(a, b, value) * apex_side < 0
        }
        cap_closed[apex] = closed
        cap_strict[apex] = strict
        check(len(closed) == expected_cap_cards[apex], f"closed opposite cap {apex}", str(len(closed)))
        check(closed - strict == {a_name, b_name}, f"cap chord partition {apex}")
        cap_margins.extend(
            abs(cross(a, b, value) * apex_side)
            for value in points.values()
            if cross(a, b, value) * apex_side
        )

    advertised = {
        center: {radius: sorted(names) for radius, names in classes.items()}
        for center, classes in model["advertised_heavy_classes"].items()
    }
    enumerated = {center: heavy_classes(points, center) for center in points}
    heavy_centers = {center for center, classes in enumerated.items() if classes}
    check(heavy_centers == set(advertised), "heavy-center support", repr(sorted(heavy_centers)))
    check(
        {center: classes for center, classes in enumerated.items() if classes} == advertised,
        "advertised heavy radius classes",
    )
    absent_count = len(points) - len(heavy_centers)
    check(
        absent_count == model.get("expected", {}).get("global_k4_failures", absent_count),
        "global K4 absent-center count",
        str(absent_count),
    )

    # The 5-point O class is the first row; the selected R row is its advertised
    # 4-point subrow.  U, C and L retain their exact 4-point physical rows.
    E = set(model["anchors"])
    omitted, retained = model["omitted"], model["retained"]
    def unique_class(center: str, cardinality: int) -> set[str]:
        candidates = [names for names in advertised[center].values() if len(names) == cardinality]
        check(len(candidates) == 1, f"unique advertised class {center}/{cardinality}")
        return set(candidates[0])

    firstrow = unique_class(model["first_apex"], 5) - {omitted}
    secondrow = set(model["second_selected_row"])
    oldrow = unique_class(model["old_center"], 4)
    newrow = unique_class(model["new_center"], 4)
    surplusrow = unique_class(model["surplus_apex"], 4)
    omittedrow = unique_class(model["omitted_center"], 4)
    first_class = unique_class(model["first_apex"], 5)
    second_class = unique_class(model["second_apex"], 5)
    rows = {
        "firstrow": firstrow,
        "secondrow": secondrow,
        "oldrow": oldrow,
        "newrow": newrow,
        "surplusrow": surplusrow,
        "omittedrow": omittedrow,
    }
    row_by_center = {
        "O": firstrow,
        "R": secondrow,
        "U": oldrow,
        "C": newrow,
        "L": surplusrow,
        model["omitted_center"]: omittedrow,
    }
    check(E == first_class, "anchors equal full first-apex class")
    check(E <= cap_strict[model["first_apex"]], "anchors strictly inside first cap")
    check(firstrow == E - {omitted}, "fixed first row")
    check(len(secondrow) == 4, "fixed second selected row cardinality")
    check(secondrow <= second_class, "second row is a subrow of full second class")
    check(all(len(row) == 4 for row in rows.values()), "physical row sizes")
    intersections = {
        f"{left}&{right}": len(rows[left] & rows[right])
        for left, right in combinations(rows, 2)
    }
    check(max(intersections.values()) <= 2, "all support intersections", repr(intersections))

    fresh_sources = [model["fresh"], model["return_source"]]
    for fresh in fresh_sources:
        check(fresh not in E, f"{fresh} avoids anchors")
        for row_name in ("firstrow", "secondrow", "surplusrow"):
            check(fresh not in rows[row_name], f"{fresh} avoids {row_name}")
    check(retained in oldrow and retained in newrow, "retained row membership")
    check(omitted not in newrow and omitted not in secondrow, "omitted second-row exclusion")
    check(all(source not in secondrow for source in fresh_sources), "fresh sources avoid second row")
    check(model["fresh"] in newrow, "fresh source occurs in its next row")
    check(model["return_source"] in oldrow, "return source occurs in old row")

    # Every advertised 5-class at O and R remains a 4-class after any one
    # deletion; the R class also survives deletion of q and w jointly.
    survivors: dict[str, int] = {}
    for center in ("O", "R"):
        support = set(next(iter(advertised[center].values())))
        minimum = min(len(support - {deleted}) for deleted in points)
        survivors[center] = minimum
        check(minimum >= 4, f"{center} survives every single deletion", str(minimum))
    r_support = set(next(iter(advertised["R"].values())))
    joint_remaining = len(r_support - {omitted, retained})
    check(joint_remaining >= 4, "R survives joint omitted-retained deletion", str(joint_remaining))

    # All ten anchor pairs are admissible at R because q,w and every anchor
    # avoid the selected R row; q,w is the unique shortest chord.
    anchor_pairs = list(combinations(sorted(E), 2))
    pair_lengths = {(left, right): dist_sq(points[left], points[right]) for left, right in anchor_pairs}
    check(all(len(r_support - set(pair)) >= 4 for pair in anchor_pairs), "all anchor pairs admissible at R")
    minimum_pair = min(pair_lengths, key=pair_lengths.get)
    minimum_value = pair_lengths[minimum_pair]
    check(minimum_pair == ("q", "w"), "unique shortest anchor chord", repr(minimum_pair))
    check(sum(value == minimum_value for value in pair_lengths.values()) == 1, "shortest chord uniqueness")

    # Partial shell choices and the two-step override: w:U -> C -> U.
    choices = dict(model["partial_choices"])
    original_choices = choices.copy()
    row_for_center = row_by_center
    for source, center in choices.items():
        check(source in row_for_center[center], f"partial choice {source}->{center} membership")
        check(source != center, f"partial choice {source}->{center} center separation")
        rich = heavy_classes(points, center)
        chosen_radius = fs(dist_sq(points[center], points[source]))
        check(chosen_radius in rich and len(rich[chosen_radius]) == 4, f"{source}->{center} exact four row")
        check(len(rich) == 1, f"{source}->{center} no other rich radius")
    check(choices[omitted] == model["omitted_center"], "omitted endpoint blocker")
    check(choices[retained] == model["old_center"], "retained old blocker")
    check(choices[omitted] != choices[retained], "omitted and retained blockers distinct")
    check(omitted in omittedrow and retained not in omittedrow, "omitted blocker row orientation")

    visited = [choices[retained]]
    for fresh, expected, old_center, next_center in (
        ("f0", "C", "U", "C"),
        ("x0", "U", "C", "U"),
    ):
        check(choices[retained] == old_center, f"{fresh} sees expected old blocker")
        check(choices[fresh] == expected, f"{fresh} advertised blocker")
        check(fresh not in E and fresh not in firstrow and fresh not in secondrow, f"{fresh} strict freshness")
        check(fresh not in rows["surplusrow"], f"{fresh} avoids surplus row")
        check(fresh not in row_by_center[old_center], f"{fresh} avoids old row {old_center}")
        check(omitted not in row_for_center[next_center], f"{next_center} omits omitted endpoint")
        check(retained in row_for_center[next_center], f"{next_center} retains retained endpoint")
        before = choices.copy()
        choices[retained] = next_center
        check(all(choices[name] == before[name] for name in choices if name != retained), f"{fresh} all other choices fixed")
        check(retained in row_for_center[choices[retained]], f"override {retained}->{next_center}")
        visited.append(choices[retained])
    check(visited == ["U", "C", "U"], "blocker return cycle", repr(visited))
    check(choices == original_choices, "final partial choices restored")

    oldrow_cover_remainder = oldrow - (firstrow | newrow | secondrow)
    check(oldrow_cover_remainder == {"x0", "x1", "x2"}, "old-row cover failure", repr(sorted(oldrow_cover_remainder)))
    unique_four_union = set().union(*(set(names) for classes in advertised.values() for names in classes.values() if len(names) == 4))
    uncovered_sources = set(points) - unique_four_union
    expected_uncovered = model.get("expected", {}).get("uncovered_critical_sources", len(uncovered_sources))
    check(len(unique_four_union) == len(points) - expected_uncovered, "unique four-row support union size")
    check(len(uncovered_sources) == expected_uncovered, "uncovered critical source count")

    source_hash = sha256(Path(__file__).resolve())
    model_hash = sha256(model_path)
    minima = {
        "ccw_edge_cross": fs(min(ccw_values)),
        "mec_slack": fs(min(mec_slacks)),
        "acute_support_dot": fs(min(acute_dots)),
        "barycentric_coordinate": fs(min(barycentric)),
        "strict_cap_margin": fs(min(cap_margins)),
        "anchor_chord_squared": fs(minimum_value),
    }
    result: dict[str, Any] = {
        "schema": SCHEMA,
        "scope": model["scope"],
        "model": str(model_path.relative_to(ROOT)),
        "model_sha256": model_hash,
        "verifier": str(Path(__file__).resolve().relative_to(ROOT)),
        "verifier_sha256": source_hash,
        "points": {"count": len(points), "distinct": True, "ccw_supporting_edge_tests": len(ccw_values)},
        "mec": {
            "inside_count": len(mec_slacks),
            "boundary": sorted(boundary),
            "support_triangle": ["O", "R", "L"],
            "barycentric": [fs(value) for value in barycentric],
        },
        "caps": {apex: {"closed_count": len(cap_closed[apex]), "strict_count": len(cap_strict[apex])} for apex in cap_chords},
        "heavy_classes": advertised,
        "heavy_center_count": len(heavy_centers),
        "global_k4_absent_center_count": absent_count,
        "rows": {name: sorted(row) for name, row in rows.items()},
        "row_intersection_max": max(intersections.values()),
        "fresh_sources": fresh_sources,
        "survivors": {"single_deletion_minimum": survivors, "joint_q_w_at_R": joint_remaining},
        "anchor_chord": {"pair_count": len(anchor_pairs), "minimum_pair": list(minimum_pair), "minimum_squared": fs(minimum_value)},
        "return_cycle": {"visited_centers": visited, "old_row_cover_remainder": sorted(oldrow_cover_remainder)},
        "unique_four_row_support_union": sorted(unique_four_union),
        "uncovered_critical_sources": sorted(uncovered_sources),
        "minima": minima,
        "checks": {"status": "PASS"},
    }
    return result


def write_report(path: Path, result: dict[str, Any]) -> None:
    unsigned = dict(result)
    unsigned.pop("self_hash", None)
    result["self_hash"] = hashlib.sha256(canonical_json(unsigned)).hexdigest()
    path.write_bytes(canonical_json(result))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--model", type=Path, default=DEFAULT_MODEL)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    model_path = args.model if args.model.is_absolute() else ROOT / args.model
    try:
        result = verify(model_path)
    except (OSError, ValueError, KeyError, VerificationError) as exc:
        print(f"ERROR: {exc}")
        return 1
    if args.report:
        report_path = args.report if args.report.is_absolute() else ROOT / args.report
        write_report(report_path, result)
        print(json.dumps({"status": "PASS", "report": str(report_path.relative_to(ROOT))}, sort_keys=True))
    else:
        print(json.dumps({"status": "PASS", "points": result["points"]["count"], "heavy_centers": result["heavy_center_count"], "return_cycle": result["return_cycle"]["visited_centers"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
