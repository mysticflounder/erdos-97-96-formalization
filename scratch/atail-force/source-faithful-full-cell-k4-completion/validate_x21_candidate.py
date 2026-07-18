#!/usr/bin/env python3
"""High-precision validation of the thin x21 completion candidate.

This script separates the mathematical strict inequalities from the numerical
safety floors used by ``completion_cegar.py``.  It refines three construction
parameters against the three independent x21 row equations with mpmath,
replays the full raw cell at several precisions, and substitutes bounded
rational reconstructions exactly.  A high-precision hit is still numerical;
only an exact rational substitution with zero row residual would be an exact
completion witness.
"""

from __future__ import annotations

import argparse
from fractions import Fraction as F
import hashlib
import itertools
import json
from pathlib import Path
import sys
from typing import Callable, Sequence

import mpmath as mp
import numpy as np


HERE = Path(__file__).resolve().parent
MODEL = HERE.parent / "full-parent-t0t1-exact-model"
sys.path.insert(0, str(MODEL))

import verify_exact_source_faithful_full_cell as exact  # noqa: E402


X21_SUPPORT = ("uS1", "t0s", "t1s", "o")
EXPECTED_ORDER = (
    "uS0", "uS1", "t0s", "t1s", "o", "uI", "t1i1", "t0i1",
    "t0i0", "t1i0", "x20", "x01", "x00", "x21", "left", "q0",
    "t1o", "t0o", "c0", "c2", "q1", "c1", "q2", "right", "x11",
    "x10",
)
T0 = ("t0i0", "t0i1", "t0o", "t0s")
T1 = ("t1i0", "t1i1", "t1o", "t1s")
UNUSED_ROW = ("c1", "uI", "uS0", "uS1")
PHYSICAL_FIVE = ("left", "q0", "q1", "q2", "right")
REVERSE_ROWS = (
    ("c0", ("q0", "q1", "x00", "x01")),
    ("c1", ("q1", "q2", "x10", "x11")),
    ("c2", ("q2", "q0", "x20", "x21")),
)


Point = tuple[mp.mpf, mp.mpf]


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: Point, second: Point) -> Point:
    return first[0] - second[0], first[1] - second[1]


def scale(coefficient: mp.mpf, point: Point) -> Point:
    return coefficient * point[0], coefficient * point[1]


def unit(angle: mp.mpf) -> Point:
    return mp.cos(angle), mp.sin(angle)


def rotate(point: Point, angle: mp.mpf) -> Point:
    cosine, sine = mp.cos(angle), mp.sin(angle)
    return (
        cosine * point[0] - sine * point[1],
        sine * point[0] + cosine * point[1],
    )


def sqdist(first: Point, second: Point) -> mp.mpf:
    delta = sub(first, second)
    return delta[0] * delta[0] + delta[1] * delta[1]


def cross(first: Point, second: Point, point: Point) -> mp.mpf:
    u, v = sub(second, first), sub(point, first)
    return u[0] * v[1] - u[1] * v[0]


def construct(parameters: Sequence[mp.mpf]) -> dict[str, Point]:
    if len(parameters) != 26:
        raise ValueError(len(parameters))
    (
        apex, q0_angle, q1_angle, q2_angle,
        lambda0, lambda1, lambda2, *target_angles,
    ) = parameters[:13]
    r0, r1, *extension_angles = parameters[13:]
    t_angles = extension_angles[:8]
    uI_angle, uS0_angle, uS1_angle = extension_angles[8:]
    o = (mp.mpf(0), mp.mpf(0))
    left = unit(mp.mpf(0))
    right = unit(apex)
    sources = [unit(q0_angle), unit(q1_angle), unit(q2_angle)]
    blockers = [
        scale(lambda0, add(sources[0], sources[1])),
        scale(lambda1, add(sources[1], sources[2])),
        scale(lambda2, add(sources[2], sources[0])),
    ]
    points: dict[str, Point] = {
        "o": o, "left": left, "right": right,
        "q0": sources[0], "q1": sources[1], "q2": sources[2],
        "c0": blockers[0], "c1": blockers[1], "c2": blockers[2],
    }
    for row, source_index in enumerate((0, 1, 2)):
        vector = sub(sources[source_index], blockers[row])
        for slot in range(2):
            points[f"x{row}{slot}"] = add(
                blockers[row], rotate(vector, target_angles[2 * row + slot])
            )
    for name, angle in zip((*T0, *T1), t_angles, strict=True):
        radius = r0 if name.startswith("t0") else r1
        points[name] = add(right, scale(radius, unit(angle)))
    unused_vector = sub(points["c1"], left)
    for name, angle in (
        ("uI", uI_angle), ("uS0", uS0_angle), ("uS1", uS1_angle)
    ):
        points[name] = add(left, rotate(unused_vector, angle))
    return points


def row_equations(parameters: Sequence[mp.mpf]) -> tuple[mp.mpf, mp.mpf, mp.mpf]:
    points = construct(parameters)
    distances = [sqdist(points["x21"], points[name]) for name in X21_SUPPORT]
    return tuple(value - distances[0] for value in distances[1:])


def all_pairwise_radius_gaps(
    points: dict[str, Point], center: str, excluded: set[str]
) -> list[mp.mpf]:
    names = [name for name in points if name != center and name not in excluded]
    distances = {name: sqdist(points[center], points[name]) for name in names}
    return [
        abs(distances[first] - distances[second])
        for index, first in enumerate(names)
        for second in names[:index]
    ]


def raw_ledger(parameters: Sequence[mp.mpf]) -> dict[str, mp.mpf]:
    points = construct(parameters)
    hull = [
        cross(
            points[EXPECTED_ORDER[index]],
            points[EXPECTED_ORDER[(index + 1) % len(EXPECTED_ORDER)]],
            points[name],
        )
        for index in range(len(EXPECTED_ORDER))
        for name in EXPECTED_ORDER
        if name not in (
            EXPECTED_ORDER[index], EXPECTED_ORDER[(index + 1) % len(EXPECTED_ORDER)]
        )
    ]
    pairwise = [
        sqdist(points[first], points[second])
        for index, first in enumerate(EXPECTED_ORDER)
        for second in EXPECTED_ORDER[:index]
    ]
    right = points["right"]
    mec_center = (mp.mpf("0.5"), (1 - right[0]) / (2 * right[1]))
    mec_radius = sqdist(mec_center, points["o"])
    mec = [
        mec_radius - sqdist(mec_center, point)
        for name, point in points.items()
        if name not in ("o", "left", "right")
    ]

    def cap_margin(a: str, b: str, opposite: str, name: str) -> mp.mpf:
        return -cross(points[a], points[b], points[opposite]) * cross(
            points[a], points[b], points[name]
        )

    cap = [
        cap_margin("o", "left", "right", name)
        for name in ("t0i0", "t0i1", "t1i0", "t1i1", "uI")
    ] + [
        cap_margin("left", "right", "o", name)
        for name in ("t0o", "t1o")
    ] + [
        cap_margin("right", "o", "left", name)
        for name in ("t0s", "t1s", "uS0", "uS1")
    ]

    def exact_class_exclusions(center: str, support: Sequence[str]) -> list[mp.mpf]:
        radius = sqdist(points[center], points[support[0]])
        return [
            abs(sqdist(points[center], point) - radius)
            for name, point in points.items()
            if name != center and name not in support
        ]

    equality_residuals: list[mp.mpf] = []
    for center, support in (
        ("o", PHYSICAL_FIVE), *REVERSE_ROWS,
        ("right", T0), ("right", T1), ("left", UNUSED_ROW),
    ):
        distances = [sqdist(points[center], points[name]) for name in support]
        equality_residuals.extend(abs(value - distances[0]) for value in distances[1:])
    new_row = [abs(value) for value in row_equations(parameters)]
    exact_exclusions = exact_class_exclusions("o", PHYSICAL_FIVE)
    for center, support in REVERSE_ROWS:
        exact_exclusions.extend(exact_class_exclusions(center, support))
    exact_exclusions.extend(exact_class_exclusions("right", T0))
    exact_exclusions.extend(exact_class_exclusions("right", T1))
    exact_exclusions.extend(exact_class_exclusions("left", UNUSED_ROW))
    singleton_other = all_pairwise_radius_gaps(points, "o", set(PHYSICAL_FIVE))
    for center, support in REVERSE_ROWS:
        singleton_other.extend(all_pairwise_radius_gaps(points, center, set(support)))
    singleton_other.extend(all_pairwise_radius_gaps(points, "left", set(UNUSED_ROW)))
    reverse_return = [
        abs(sqdist(points["right"], points[first]) -
            sqdist(points["right"], points[second]))
        for first, second in (("x00", "x01"), ("x10", "x11"), ("x20", "x21"))
    ]
    return {
        "strict_hull": min(hull),
        "pairwise_distinct_sq": min(pairwise),
        "mec_containment": min(mec),
        "cap_roles": min(cap),
        "support_triangle_nonobtuse": mp.pi / 2 - parameters[0],
        "radius_split": abs(parameters[13] - parameters[14]),
        "existing_row_max_abs_equality_residual": max(equality_residuals),
        "new_x21_row_max_abs_equality_residual": max(new_row),
        "exact_row_min_exclusion_gap": min(exact_exclusions),
        "known_center_min_other_radius_gap": min(singleton_other),
        "reverse_return_min_gap": min(reverse_return),
    }


def render_mpf(value: mp.mpf, digits: int = 40) -> str:
    return mp.nstr(value, digits, min_fixed=0, max_fixed=0)


def load_candidate(path: Path) -> list[str]:
    candidates = []
    for line in path.read_text().splitlines():
        payload = json.loads(line)
        atoms = payload.get("atoms", [])
        if atoms and atoms[0].get("center") == "x21":
            candidates.append(payload)
    if not candidates:
        raise ValueError(f"no x21 candidate in {path}")
    candidates.sort(
        key=lambda payload: payload["result"]["equality_max_normalized_residual"]
    )
    return [str(value) for value in candidates[0]["result"]["parameters"]]


def numerical_jacobian(parameters: list[mp.mpf]) -> np.ndarray:
    base_values = np.array([float(value) for value in row_equations(parameters)])
    result = np.zeros((3, 26), dtype=float)
    for index in range(26):
        step = mp.mpf("1e-7") * max(mp.mpf(1), abs(parameters[index]))
        moved = list(parameters)
        moved[index] += step
        values = np.array([float(value) for value in row_equations(moved)])
        result[:, index] = (values - base_values) / float(step)
    return result


def choose_refinement_columns(parameters: list[mp.mpf]) -> tuple[int, int, int]:
    jacobian = numerical_jacobian(parameters)
    best: tuple[float, tuple[int, int, int]] | None = None
    for columns in itertools.combinations(range(26), 3):
        determinant = abs(float(np.linalg.det(jacobian[:, columns])))
        candidate = (determinant, columns)
        if best is None or candidate > best:
            best = candidate
    assert best is not None and best[0] > 1e-10, best
    return best[1]


def refine(parameters: list[mp.mpf], columns: tuple[int, int, int]) -> list[mp.mpf]:
    def equations(first: mp.mpf, second: mp.mpf, third: mp.mpf):
        moved = list(parameters)
        moved[columns[0]] = first
        moved[columns[1]] = second
        moved[columns[2]] = third
        return row_equations(moved)

    solution = mp.findroot(
        equations,
        tuple(parameters[index] for index in columns),
        tol=mp.mpf("1e-90"), maxsteps=100,
    )
    refined = list(parameters)
    for index, value in zip(columns, solution, strict=True):
        refined[index] = value
    return refined


def rational_parameters(parameters: Sequence[mp.mpf], denominator: int):
    def rational(value: mp.mpf) -> F:
        return F(str(value)).limit_denominator(denominator)

    def half_angle(value: mp.mpf) -> F:
        return F(str(mp.tan(value / 2))).limit_denominator(denominator)

    base_parameters = parameters[:13]
    extension = parameters[13:]
    return {
        "base_angles": [
            half_angle(value)
            for value in (*base_parameters[:4], *base_parameters[7:])
        ],
        "base_scalars": [rational(value) for value in base_parameters[4:7]],
        "extension_scalars": [rational(value) for value in extension[:2]],
        "extension_angles": [half_angle(value) for value in extension[2:]],
    }


def exact_rational_substitution(parameters: Sequence[mp.mpf], denominator: int):
    rationalized = rational_parameters(parameters, denominator)
    points = exact.construct(rationalized)
    distances = [exact.sqdist(points["x21"], points[name]) for name in X21_SUPPORT]
    differences = [value - distances[0] for value in distances[1:]]
    hull = [
        exact.cross(
            points[EXPECTED_ORDER[index]],
            points[EXPECTED_ORDER[(index + 1) % len(EXPECTED_ORDER)]],
            points[name],
        )
        for index in range(len(EXPECTED_ORDER))
        for name in EXPECTED_ORDER
        if name not in (
            EXPECTED_ORDER[index], EXPECTED_ORDER[(index + 1) % len(EXPECTED_ORDER)]
        )
    ]
    coordinate_text = json.dumps({
        name: [str(point[0]), str(point[1])]
        for name, point in sorted(points.items())
    }, sort_keys=True, separators=(",", ":"))
    return {
        "denominator_bound": denominator,
        "strict_hull_positive": min(hull) > 0,
        "minimum_strict_hull": str(min(hull)),
        "new_row_exact": all(value == 0 for value in differences),
        "new_row_differences": [str(value) for value in differences],
        "new_row_max_abs_difference_float": max(abs(float(value)) for value in differences),
        "coordinate_digest": hashlib.sha256(coordinate_text.encode()).hexdigest(),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, default=HERE / "relaxed-probes.jsonl")
    parser.add_argument("--output", type=Path, default=HERE / "x21-validation.json")
    parser.add_argument("--log", type=Path, default=HERE / "x21-precision-log.jsonl")
    parser.add_argument("--dps", type=int, default=120)
    args = parser.parse_args()
    raw_parameters = load_candidate(args.input)
    mp.mp.dps = args.dps
    parameters = [mp.mpf(value) for value in raw_parameters]
    columns = choose_refinement_columns(parameters)
    refined = refine(parameters, columns)
    precision_records = []
    for dps in (30, 50, 80, args.dps):
        mp.mp.dps = dps
        ledger = raw_ledger([+value for value in refined])
        record = {
            "dps": dps,
            "ledger": {name: render_mpf(value) for name, value in ledger.items()},
        }
        precision_records.append(record)
        with args.log.open("a", encoding="utf-8") as handle:
            handle.write(json.dumps(record, sort_keys=True) + "\n")
    mp.mp.dps = args.dps
    rational_records = [
        exact_rational_substitution(refined, denominator)
        for denominator in (10_000, 1_000_000, 100_000_000)
    ]
    final_ledger = raw_ledger(refined)
    raw_positive_names = (
        "strict_hull", "pairwise_distinct_sq", "mec_containment", "cap_roles",
        "support_triangle_nonobtuse", "radius_split", "exact_row_min_exclusion_gap",
        "known_center_min_other_radius_gap", "reverse_return_min_gap",
    )
    payload = {
        "schema": "source-faithful-full-cell-x21-high-precision-validation-v1",
        "epistemic_status": "HIGH_PRECISION_NUMERIC_CANDIDATE_NOT_EXACT_PROOF",
        "status": (
            "HIGH_PRECISION_RAW_CELL_HIT"
            if all(final_ledger[name] > 0 for name in raw_positive_names)
            and final_ledger["new_x21_row_max_abs_equality_residual"] < mp.mpf("1e-80")
            else "HIGH_PRECISION_VALIDATION_FAILED"
        ),
        "source": str(args.input),
        "refined_parameter_indices": list(columns),
        "refined_parameters": [render_mpf(value, 100) for value in refined],
        "precision_ladder": precision_records,
        "rational_reconstruction": rational_records,
        "exact_rational_completion_found": any(
            record["new_row_exact"] and record["strict_hull_positive"]
            for record in rational_records
        ),
        "unsat_claim": False,
        "coverage_claim": False,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
