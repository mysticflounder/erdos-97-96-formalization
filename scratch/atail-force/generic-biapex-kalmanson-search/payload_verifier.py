"""Exact, solver-independent verification of exported search payloads."""

from __future__ import annotations

import itertools
from fractions import Fraction


def parse_rational(value: str) -> Fraction:
    """Parse the rational format emitted by Z3's LRA model printer."""

    if value.endswith("?"):
        raise ValueError(f"inexact algebraic model value is not supported: {value}")
    return Fraction(value)


def verify_payload(
    *,
    n: int,
    second_apex: int,
    rows: dict[int, tuple[int, ...]],
    blockers: dict[int, int],
    distances: dict[str, str],
    distance_lower_bound: Fraction,
) -> dict[str, object]:
    """Check every exported structural and linear-metric constraint exactly.

    This deliberately does not call Z3 or either encoding builder.  A failed
    check raises ``RuntimeError`` instead of emitting a purported SAT witness.
    """

    errors: list[str] = []
    vertices = tuple(range(n))
    expected_pairs = tuple(itertools.combinations(vertices, 2))
    expected_keys = {f"{left},{right}" for left, right in expected_pairs}
    if set(distances) != expected_keys:
        missing = sorted(expected_keys - set(distances))
        extra = sorted(set(distances) - expected_keys)
        errors.append(f"distance-key mismatch: missing={missing}, extra={extra}")

    parsed: dict[tuple[int, int], Fraction] = {}
    for left, right in expected_pairs:
        key = f"{left},{right}"
        if key not in distances:
            continue
        try:
            parsed[left, right] = parse_rational(distances[key])
        except ValueError as error:
            errors.append(str(error))

    def distance(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        return parsed[tuple(sorted((left, right)))]

    if set(rows) != set(vertices):
        errors.append(f"row centers are not exactly 0..{n - 1}: {sorted(rows)}")
    normalized_rows: dict[int, tuple[int, ...]] = {}
    for center in vertices:
        support = tuple(rows.get(center, ()))
        normalized_rows[center] = support
        if len(support) != 4 or len(set(support)) != 4:
            errors.append(f"row {center} is not a four-element set: {support}")
        if center in support:
            errors.append(f"row {center} contains its center")
        if any(point not in vertices for point in support):
            errors.append(f"row {center} contains an out-of-range point: {support}")

    if set(blockers) != set(vertices):
        errors.append(
            f"blocker sources are not exactly 0..{n - 1}: {sorted(blockers)}"
        )
    for source in vertices:
        center = blockers.get(source)
        if center is None:
            continue
        if center not in vertices:
            errors.append(f"blocker({source}) is out of range: {center}")
        elif center in {source, 0, second_apex}:
            errors.append(f"blocker({source}) uses a forbidden center: {center}")
        elif source not in normalized_rows[center]:
            errors.append(f"row at blocker({source})={center} omits its source")

    for left, right in itertools.combinations(vertices, 2):
        overlap = set(normalized_rows[left]) & set(normalized_rows[right])
        if len(overlap) > 2:
            errors.append(f"rows {left},{right} intersect in {sorted(overlap)}")

    for first, second in itertools.combinations(vertices, 2):
        centers = [
            center
            for center in vertices
            if {first, second} <= set(normalized_rows[center])
        ]
        if len(centers) > 2:
            errors.append(
                f"pair {first},{second} has too many bisector centers: {centers}"
            )

    for center_left, center_right in itertools.combinations(vertices, 2):
        common = set(normalized_rows[center_left]) & set(
            normalized_rows[center_right]
        )
        for point_left, point_right in itertools.combinations(sorted(common), 2):
            alternates = (center_left < point_left < center_right) != (
                center_left < point_right < center_right
            )
            if not alternates:
                errors.append(
                    "nonalternating shared pair: "
                    f"centers={center_left},{center_right}, "
                    f"points={point_left},{point_right}"
                )

    def reachable(start: int, reverse: bool) -> set[int]:
        seen = {start}
        frontier = [start]
        while frontier:
            current = frontier.pop()
            if reverse:
                neighbors = [
                    center
                    for center in vertices
                    if current in normalized_rows[center]
                ]
            else:
                neighbors = normalized_rows[current]
            for neighbor in neighbors:
                if neighbor not in seen:
                    seen.add(neighbor)
                    frontier.append(neighbor)
        return seen

    if vertices:
        forward = reachable(0, reverse=False)
        backward = reachable(0, reverse=True)
        if forward != set(vertices) or backward != set(vertices):
            errors.append(
                f"selected digraph is not strongly connected: "
                f"forward={sorted(forward)}, backward={sorted(backward)}"
            )

    if len(parsed) == len(expected_pairs):
        for pair, value in parsed.items():
            if value < distance_lower_bound:
                errors.append(
                    f"distance {pair}={value} is below {distance_lower_bound}"
                )

        for center, support in normalized_rows.items():
            if len(support) != 4 or any(point not in vertices for point in support):
                continue
            radii = {distance(center, point) for point in support}
            if len(radii) != 1:
                errors.append(f"row {center} is not equidistant: {sorted(radii)}")
            elif next(iter(radii)) <= 0:
                errors.append(f"row {center} has nonpositive radius")

        for a, b, c, d in itertools.combinations(vertices, 4):
            diagonals = distance(a, c) + distance(b, d)
            first = distance(a, b) + distance(c, d) + 1
            second = distance(a, d) + distance(b, c) + 1
            if diagonals < first:
                errors.append(f"first Kalmanson inequality fails at {a,b,c,d}")
            if diagonals < second:
                errors.append(f"second Kalmanson inequality fails at {a,b,c,d}")

        for a, b, c in itertools.combinations(vertices, 3):
            if distance(a, b) + distance(b, c) < distance(a, c):
                errors.append(f"triangle ab+bc>=ac fails at {a,b,c}")
            if distance(a, c) + distance(b, c) < distance(a, b):
                errors.append(f"triangle ac+bc>=ab fails at {a,b,c}")
            if distance(a, b) + distance(a, c) < distance(b, c):
                errors.append(f"triangle ab+ac>=bc fails at {a,b,c}")

    if errors:
        preview = "; ".join(errors[:10])
        suffix = "" if len(errors) <= 10 else f"; ... ({len(errors)} total)"
        raise RuntimeError(f"exported SAT payload failed exact verification: {preview}{suffix}")

    return {
        "status": "EXACT_RATIONAL_PAYLOAD_VERIFIED",
        "solver_independent": True,
        "distance_count": len(parsed),
        "row_count": len(normalized_rows),
        "blocker_count": len(blockers),
    }
