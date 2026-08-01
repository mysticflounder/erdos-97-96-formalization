#!/usr/bin/env python3
"""Exact rational-coordinate witnesses for the 4 x 3 live branch projection.

This is deliberately not a CounterexampleData model.  It checks the named
Euclidean consequences distilled from the live parameters of
TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence:

* the two source pairs lie on distinct positive first-apex radii;
* each pair lies on its common-blocker row;
* the blockers are distinct and avoid the first apex;
* one of the four CrossBlockerCoincidence aliases holds;
* the localized cycles can choose a1 and b1 and require
  b1 not on row(A), a1 not on row(B);
* the selected GeometricMultiplicityResidual contributes its exact named row
  memberships and distinctness.

All arithmetic is Fraction arithmetic.  The script additionally enumerates
every modeled carrier coordinate on each modeled row.  Thus an accidental
fifth named point on an exact four-shell is rejected.
"""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from itertools import combinations, product
from pathlib import Path


Point = tuple[Fraction, Fraction]

ARMS = ("A=b1", "A=b2", "B=a1", "B=a2")
RESIDUALS = ("third", "outside-first", "outside-second")


def point(x: int | Fraction, y: int | Fraction) -> Point:
    return Fraction(x), Fraction(y)


def d2(left: Point, right: Point) -> Fraction:
    return (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2


def frac_json(value: Fraction) -> int | str:
    if value.denominator == 1:
        return value.numerator
    return f"{value.numerator}/{value.denominator}"


def point_json(value: Point) -> list[int | str]:
    return [frac_json(value[0]), frac_json(value[1])]


def base_points(arm: str) -> dict[str, Point]:
    """Small arm-specific gauges with rational coordinates."""
    if arm in ("A=b1", "A=b2"):
        result = {
            "O": point(0, 0),
            "A": point(6, 0),
            "B": point(2, 2),
            "a1": point(3, 4),
            "a2": point(3, -4),
            "b1": point(6, 0) if arm == "A=b1" else point(0, 6),
            "b2": point(0, 6) if arm == "A=b1" else point(6, 0),
        }
    else:
        # The ordering of a1,a2 selects which one aliases B.
        result = {
            "O": point(0, 0),
            "A": point(0, 1),
            "B": point(5, 0),
            "a1": point(5, 0) if arm == "B=a1" else point(-5, 0),
            "a2": point(-5, 0) if arm == "B=a1" else point(5, 0),
            "b1": point(5, 12),
            "b2": point(5, -12),
        }
    return result


def add_residual_points(
    points: dict[str, Point], arm: str, residual: str
) -> tuple[dict[str, list[str]], dict[str, str]]:
    """Return forced row members and source-to-blocker aliases."""
    rows = {"A": ["a1", "a2"], "B": ["b1", "b2"]}
    blocker_aliases = {
        "center(a1)": "A",
        "center(a2)": "A",
        "center(b1)": "B",
        "center(b2)": "B",
    }
    if residual == "third":
        points.update(
            {
                "C": point(20, 17),
                "t1": point(23, 21),
                "t2": point(16, 20),
            }
        )
        rows["C"] = ["t1", "t2"]
        blocker_aliases.update({"center(t1)": "C", "center(t2)": "C"})
    elif residual == "outside-first":
        if arm in ("A=b1", "A=b2"):
            points.update({"x": point(11, 0), "o": point(1, 0)})
        else:
            points.update({"x": point(1, 6), "o": point(-1, 6)})
        rows["A"].extend(["x", "o"])
        blocker_aliases["center(x)"] = "A"
    elif residual == "outside-second":
        if arm in ("A=b1", "A=b2"):
            points.update({"x": point(4, 6), "o": point(-2, 0)})
        else:
            points.update({"x": point(17, 0), "o": point(-7, 0)})
        rows["B"].extend(["x", "o"])
        blocker_aliases["center(x)"] = "B"
    else:
        raise ValueError(residual)
    return rows, blocker_aliases


def check_branch(
    arm: str,
    residual: str,
    coordinate_overrides: dict[str, Point] | None = None,
) -> dict[str, object]:
    pts = base_points(arm)
    rows, blocker_aliases = add_residual_points(pts, arm, residual)
    if coordinate_overrides:
        pts.update(coordinate_overrides)
    checks: list[tuple[str, bool]] = []

    def require(name: str, condition: bool) -> None:
        checks.append((name, condition))

    first_r2 = d2(pts["O"], pts["a1"])
    second_r2 = d2(pts["O"], pts["b1"])
    row_r2 = {
        "A": d2(pts["A"], pts["a1"]),
        "B": d2(pts["B"], pts["b1"]),
    }
    if residual == "third":
        row_r2["C"] = d2(pts["C"], pts["t1"])

    require("first-apex first-pair equality", first_r2 == d2(pts["O"], pts["a2"]))
    require("first-apex second-pair equality", second_r2 == d2(pts["O"], pts["b2"]))
    require("first-apex radii positive", first_r2 > 0 and second_r2 > 0)
    require("first-apex radii distinct", first_r2 != second_r2)
    require("blockers distinct", pts["A"] != pts["B"])
    require("A avoids first apex", pts["A"] != pts["O"])
    require("B avoids first apex", pts["B"] != pts["O"])

    source_names = ("a1", "a2", "b1", "b2")
    require(
        "two source pairs pairwise distinct",
        all(pts[left] != pts[right] for left, right in combinations(source_names, 2)),
    )
    require("A differs from own sources", pts["A"] not in (pts["a1"], pts["a2"]))
    require("B differs from own sources", pts["B"] not in (pts["b1"], pts["b2"]))

    left, right = arm.split("=")
    require("cross-blocker alias", pts[left] == pts[right])

    for center, members in rows.items():
        for member in members:
            require(
                f"{member} lies on row({center})",
                d2(pts[center], pts[member]) == row_r2[center],
            )
        require(f"row({center}) radius positive", row_r2[center] > 0)
        require(
            f"forced row({center}) members distinct",
            len({pts[name] for name in members}) == len(members),
        )
        require(f"row({center}) named capacity", len(members) <= 4)

    # LPρ.fresh=b1 and LP.fresh=a1.  Taking the two cycle collisionSource
    # choices to be a1 and b1 adds the same two mutual omissions.  These
    # witnesses satisfy the stronger both-endpoints version, so either legal
    # collisionSource choice also works.
    require("LPρ/MPρ: b1 not on row(A)", d2(pts["A"], pts["b1"]) != row_r2["A"])
    require("LP/MP: a1 not on row(B)", d2(pts["B"], pts["a1"]) != row_r2["B"])
    require(
        "either MP cycle source avoids opposite row",
        all(d2(pts["A"], pts[name]) != row_r2["A"] for name in ("b1", "b2"))
        and all(d2(pts["B"], pts[name]) != row_r2["B"] for name in ("a1", "a2")),
    )

    if residual == "third":
        require("third sources distinct", pts["t1"] != pts["t2"])
        require(
            "third sources fresh from named pairs",
            all(pts[t] != pts[s] for t in ("t1", "t2") for s in source_names),
        )
        require("third blocker differs from A,B", pts["C"] not in (pts["A"], pts["B"]))
        require("third blocker differs from its sources", pts["C"] not in (pts["t1"], pts["t2"]))
    else:
        require("outside source fresh from named pairs", all(pts["x"] != pts[s] for s in source_names))
        require("outside pair distinct", pts["x"] != pts["o"])
        # The live cap/non-cap fields derive these remaining distinctness facts.
        require("other outside point fresh from named pairs", all(pts["o"] != pts[s] for s in source_names))
        residual_center = "A" if residual == "outside-first" else "B"
        require(
            "outside points differ from row center",
            pts["x"] != pts[residual_center] and pts["o"] != pts[residual_center],
        )

    # Every named coordinate here denotes a carrier point.  Exact shell
    # semantics therefore make all named points at the row radius members.
    # Reject any branch with more than four distinct named points on a row or
    # with a localized-cycle nonmember accidentally on its row.
    named_row_points: dict[str, list[str]] = {}
    for center, radius2 in row_r2.items():
        by_coord: dict[Point, list[str]] = {}
        for name, value in pts.items():
            if d2(pts[center], value) == radius2:
                by_coord.setdefault(value, []).append(name)
        named_row_points[center] = [
            "/".join(sorted(names)) for _, names in sorted(by_coord.items())
        ]
        require(f"exact-shell named capacity row({center})", len(by_coord) <= 4)

    require(
        "negative memberships absent from enumerated rows",
        not any("b1" in label.split("/") for label in named_row_points["A"])
        and not any("a1" in label.split("/") for label in named_row_points["B"]),
    )

    named_first_apex_points: dict[str, list[str]] = {}
    for radius_name, radius2 in (
        ("first_pair", first_r2),
        ("second_pair", second_r2),
    ):
        by_coord: dict[Point, list[str]] = {}
        for name, value in pts.items():
            if d2(pts["O"], value) == radius2:
                by_coord.setdefault(value, []).append(name)
        named_first_apex_points[radius_name] = [
            "/".join(sorted(names)) for _, names in sorted(by_coord.items())
        ]
        require(
            f"exact first-apex class named capacity {radius_name}",
            len(by_coord) <= 4,
        )

    failures = [name for name, ok in checks if not ok]
    return {
        "arm": arm,
        "residual": residual,
        "status": "EXACT_RATIONAL_WITNESS" if not failures else "FAILED",
        "points": {name: point_json(value) for name, value in sorted(pts.items())},
        "first_apex_radius_squared": {
            "first_pair": frac_json(first_r2),
            "second_pair": frac_json(second_r2),
        },
        "row_radius_squared": {
            name: frac_json(value) for name, value in sorted(row_r2.items())
        },
        "forced_rows": rows,
        "named_points_on_rows": named_row_points,
        "named_points_on_first_apex_radii": named_first_apex_points,
        "blocker_aliases": blocker_aliases,
        "cycle_choices": {
            "MPρ.collisionSource": "a1",
            "MP.collisionSource": "b1",
        },
        "cross_alias": arm,
        "checks": len(checks),
        "failures": failures,
    }


def render_markdown(results: list[dict[str, object]]) -> str:
    lines = [
        "# Exact 12-branch Euclidean projection audit",
        "",
        "| coincidence arm | residual arm | exact verdict | first-apex radii² | named row occupancy |",
        "|---|---|---|---|---|",
    ]
    for result in results:
        radii = result["first_apex_radius_squared"]
        occupancy = result["named_points_on_rows"]
        assert isinstance(radii, dict)
        assert isinstance(occupancy, dict)
        row_text = "; ".join(
            f"{center}: {','.join(labels)}"
            for center, labels in sorted(occupancy.items())
        )
        lines.append(
            f"| {result['arm']} | {result['residual']} | {result['status']} "
            f"| {radii['first_pair']}, {radii['second_pair']} | {row_text} |"
        )
    lines.extend(
        [
            "",
            "Verdict scope: each row is an explicit rational-coordinate witness for the",
            "named Euclidean projection listed in `README.md`. It is not a model of",
            "`CounterexampleData`, the cap order, all four-point supports, deletion",
            "robustness, minimality, `noM44`, or the tri-apex residual.",
            "",
        ]
    )
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path(__file__).resolve().parent,
    )
    args = parser.parse_args()

    smoke = check_branch(
        "A=b1",
        "third",
        coordinate_overrides={"a2": point(3, -5)},
    )
    assert smoke["status"] == "FAILED"
    assert "first-apex first-pair equality" in smoke["failures"]
    print("smoke test rejected a deliberately perturbed branch")

    results = [check_branch(arm, residual) for arm, residual in product(ARMS, RESIDUALS)]
    failures = [result for result in results if result["status"] == "FAILED"]
    assert len(results) == 12
    assert not failures, failures

    args.output_dir.mkdir(parents=True, exist_ok=True)
    json_path = args.output_dir / "results.json"
    markdown_path = args.output_dir / "results.md"
    json_path.write_text(json.dumps(results, indent=2) + "\n")
    markdown_path.write_text(render_markdown(results))
    print(f"verified {len(results)} exact rational witnesses")
    print(f"json: {json_path}")
    print(f"table: {markdown_path}")


if __name__ == "__main__":
    main()
