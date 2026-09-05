"""Exact verifier for the P97 power-crossing control.

The certificate format is ``p97-power-crossing-control/v1``.  Coordinates,
radii, and every intermediate geometric quantity are parsed as
``fractions.Fraction``; floating point input is rejected.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Iterable, Sequence
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

DEFAULT_CERTIFICATE = Path("certificates/p97_power_crossing_control.json")


Point = tuple[Fraction, Fraction]


def _fraction(value: Any, field: str) -> Fraction:
    """Parse an exact rational, rejecting lossy numeric representations."""
    if isinstance(value, (bool, float)):
        raise ValueError(f"{field} must be an exact rational string or integer")  # noqa: TRY004
    if isinstance(value, Fraction):
        return value
    if isinstance(value, int):
        return Fraction(value)
    if isinstance(value, str):
        try:
            # Fraction accepts integer and ``p/q`` strings, but not decimals
            # with an implicit binary conversion.
            return Fraction(value)
        except (ValueError, ZeroDivisionError) as exc:
            raise ValueError(f"invalid rational for {field}: {value!r}") from exc
    raise ValueError(f"{field} must be an exact rational string or integer")


def _point(value: Any, index: int) -> Point:
    if isinstance(value, dict):
        if set(value) != {"x", "y"}:
            raise ValueError(f"points[{index}] must contain exactly x and y")
        value = (value["x"], value["y"])
    if not isinstance(value, (list, tuple)) or len(value) != 2:
        raise ValueError(f"points[{index}] must be a pair")
    return (_fraction(value[0], f"points[{index}].x"),
            _fraction(value[1], f"points[{index}].y"))


def _cross(u: Point, v: Point) -> Fraction:
    return u[0] * v[1] - u[1] * v[0]


def _sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def _orient(a: Point, b: Point, c: Point) -> Fraction:
    return _cross(_sub(b, a), _sub(c, a))


def _distance_sq(a: Point, b: Point) -> Fraction:
    d = _sub(a, b)
    return d[0] * d[0] + d[1] * d[1]


def _index(value: Any, labels: Any, field: str) -> int:
    """Resolve either an integer index or an optional point label."""
    if isinstance(value, bool):
        raise ValueError(f"{field} is not a point index")  # noqa: TRY004
    if isinstance(value, int):
        return value
    if isinstance(value, str):
        # Numeric strings are convenient in JSON and retain the schema's
        # point-label flexibility.
        try:
            if value.strip() and str(int(value)) == value.strip():
                return int(value)
        except ValueError:
            pass
        if isinstance(labels, dict) and value in labels:
            return _index(labels[value], labels, field)
        if isinstance(labels, list) and value in labels:
            return labels.index(value)
    raise ValueError(f"{field} is not a recognized point index or label")


def _validate_index(index: int, count: int, field: str) -> int:
    if not isinstance(index, int) or not 0 <= index < count:
        raise ValueError(f"{field}={index!r} is outside point range")
    return index


def _fibers(points: Sequence[Point], center: int) -> dict[Fraction, list[int]]:
    groups: dict[Fraction, list[int]] = {}
    for i, point in enumerate(points):
        radius = _distance_sq(points[center], point)
        if radius > 0:
            groups.setdefault(radius, []).append(i)
    return groups


def _power(point: Point, center: Point, radius_sq: Fraction) -> Fraction:
    return _distance_sq(point, center) - radius_sq


def _jsonable(value: Any) -> Any:
    if isinstance(value, Fraction):
        return str(value)
    if isinstance(value, dict):
        return {str(k): _jsonable(v) for k, v in value.items()}
    if isinstance(value, (list, tuple)):
        return [_jsonable(v) for v in value]
    return value


def _normalized_rows(data: dict[str, Any], points: Sequence[Point]) -> tuple[list[dict[str, Any]], Any]:
    rows = data.get("rows")
    if not isinstance(rows, list) or len(rows) != 4:
        raise ValueError("rows must contain exactly four rows")
    labels = data.get("point_labels")
    normalized: list[dict[str, Any]] = []
    centers: list[int] = []
    for r, row in enumerate(rows):
        if not isinstance(row, dict):
            raise ValueError(f"rows[{r}] must be an object")  # noqa: TRY004
        for key in ("center", "support", "radius_sq"):
            if key not in row:
                raise ValueError(f"rows[{r}] lacks {key}")
        center = _validate_index(_index(row["center"], labels, f"rows[{r}].center"), len(points), f"rows[{r}].center")
        support_raw = row["support"]
        if not isinstance(support_raw, list) or len(support_raw) != 4:
            raise ValueError(f"rows[{r}].support must contain exactly four points")
        support = [_validate_index(_index(x, labels, f"rows[{r}].support"), len(points), f"rows[{r}].support") for x in support_raw]
        if len(set(support)) != 4:
            raise ValueError(f"rows[{r}].support must contain four distinct points")
        radius = _fraction(row["radius_sq"], f"rows[{r}].radius_sq")
        if radius <= 0:
            raise ValueError(f"rows[{r}].radius_sq must be positive")
        if any(_distance_sq(points[center], points[i]) != radius for i in support):
            raise ValueError(f"rows[{r}] has a support point at the wrong radius")
        if center in centers:
            raise ValueError("row centers must be distinct")
        centers.append(center)
        normalized.append({"center": center, "support": support, "radius_sq": radius})
    return normalized, labels


def _crossing_weights(points: Sequence[Point], edges: Sequence[tuple[int, int]]) -> tuple[Fraction, Fraction, Fraction]:
    (a, b), (c, d) = edges
    ab = _sub(points[b], points[a])
    cd = _sub(points[d], points[c])
    denominator = _cross(ab, cd)
    if denominator == 0:
        raise ValueError("crossing edges are parallel or collinear")
    t = _cross(_sub(points[c], points[a]), cd) / denominator
    s = _cross(_sub(points[c], points[a]), ab) / denominator
    if not (0 < t < 1 and 0 < s < 1):
        raise ValueError("crossing_edges do not properly cross")
    return t, s, denominator


def validate_control(data: dict[str, Any]) -> dict[str, Any]:
    """Validate a power-crossing certificate and return an exact report.

    Malformed geometric data raises ``ValueError``. The report retains exact
    ``Fraction`` values; the CLI serializes them as rational strings.
    """
    if not isinstance(data, dict):
        raise ValueError("certificate must be a JSON object")  # noqa: TRY004
    if data.get("schema") != "p97-power-crossing-control/v1":
        raise ValueError("unsupported or missing certificate schema")
    raw_points = data.get("points")
    if not isinstance(raw_points, list) or len(raw_points) != 16:
        raise ValueError("points must contain exactly 16 points")
    points = [_point(p, i) for i, p in enumerate(raw_points)]
    order = data.get("ccw_order")
    if not isinstance(order, list) or len(order) != 16:
        raise ValueError("ccw_order must be a permutation of 0..15")
    try:
        order = [_index(x, data.get("point_labels"), "ccw_order") for x in order]
    except ValueError as exc:
        raise ValueError("ccw_order must be a permutation of 0..15") from exc
    if set(order) != set(range(16)):
        raise ValueError("ccw_order must be a permutation of 0..15")

    orientations = [_orient(points[a], points[b], points[c])
                    for a, b, c in combinations(order, 3)]
    if any(x <= 0 for x in orientations):
        raise ValueError("ccw_order does not give strict convexity")
    min_orientation = min(orientations)

    rows, labels = _normalized_rows(data, points)
    rows_by_center = {row["center"]: row for row in rows}
    full_fibers: dict[int, list[tuple[Fraction, list[int]]]] = {}
    for center in range(16):
        full_fibers[center] = [(radius, support) for radius, support in _fibers(points, center).items() if len(support) >= 4]
        if center in rows_by_center:
            row = rows_by_center[center]
            matching = [support for radius, support in full_fibers[center] if radius == row["radius_sq"]]
            if len(matching) != 1 or set(matching[0]) != set(row["support"]):
                raise ValueError(f"row at center {center} is not its full four-point fiber")
            if len(full_fibers[center]) != 1:
                raise ValueError(f"center {center} has more than one four-point fiber")
        elif full_fibers[center]:
            raise ValueError(f"unlisted center {center} has a four-point fiber")

    raw_edges = data.get("crossing_edges")
    if not isinstance(raw_edges, list) or len(raw_edges) != 2:
        raise ValueError("crossing_edges must contain exactly two edges")
    edges: list[tuple[int, int]] = []
    for i, edge in enumerate(raw_edges):
        if not isinstance(edge, list) or len(edge) != 2:
            raise ValueError(f"crossing_edges[{i}] must be a pair")
        u = _validate_index(_index(edge[0], labels, f"crossing_edges[{i}]"), 16, f"crossing_edges[{i}]")
        v = _validate_index(_index(edge[1], labels, f"crossing_edges[{i}]"), 16, f"crossing_edges[{i}]")
        if u == v:
            raise ValueError("crossing edges cannot be loops")
        edges.append((u, v))
    if edges[0] == edges[1] or edges[0] == edges[1][::-1]:
        raise ValueError("crossing_edges must be distinct")
    if set(edges[0]) & set(edges[1]):
        raise ValueError("properly crossing edges must have four distinct endpoints")
    t, s, _ = _crossing_weights(points, edges)

    row_by_center = rows_by_center
    overlap_sizes = []
    for edge in edges:
        if edge[0] not in row_by_center or edge[1] not in row_by_center:
            raise ValueError("every crossing-edge endpoint must have a certificate row")
        overlap = sorted(set(row_by_center[edge[0]]["support"]) & set(row_by_center[edge[1]]["support"]))
        if len(overlap) != 2:
            raise ValueError(f"circle pair {edge} shares {len(overlap)} support points, expected 2")
        overlap_sizes.append(overlap)

    # π_i(z)=|z-c_i|²-r_i² and h_i=|c_i|²-r_i².  The affine terms cancel
    # at the crossing point, leaving the same exact constant at every z.
    (a, b), (c, d) = edges
    h = {center: _distance_sq(points[center], (Fraction(0), Fraction(0))) - row_by_center[center]["radius_sq"]
         for center in (a, b, c, d)}
    delta = (1 - t) * h[a] + t * h[b] - (1 - s) * h[c] - s * h[d]
    identity_residuals = []
    for point in points:
        lhs = ((1 - t) * _power(point, points[a], row_by_center[a]["radius_sq"])
               + t * _power(point, points[b], row_by_center[b]["radius_sq"])
               - (1 - s) * _power(point, points[c], row_by_center[c]["radius_sq"])
               - s * _power(point, points[d], row_by_center[d]["radius_sq"]))
        identity_residuals.append(lhs - delta)
    if any(residual != 0 for residual in identity_residuals):
        raise ValueError("normalized crossing power identity failed")

    negative_witnesses: list[int] = []
    for point_index in overlap_sizes[0]:
        if (_power(points[point_index], points[c], row_by_center[c]["radius_sq"]) < 0
                or _power(points[point_index], points[d], row_by_center[d]["radius_sq"]) < 0):
            negative_witnesses.append(point_index)
    for point_index in overlap_sizes[1]:
        if (_power(points[point_index], points[a], row_by_center[a]["radius_sq"]) < 0
                or _power(points[point_index], points[b], row_by_center[b]["radius_sq"]) < 0):
            negative_witnesses.append(point_index)
    if len(set(negative_witnesses)) < 2:
        raise ValueError("crossing witness signs do not produce two distinct negative witnesses")

    return {
        "ok": True,
        "schema": data["schema"],
        "orientation_count": len(orientations),
        "min_orientation": min_orientation,
        "row_centers": sorted(rows_by_center),
        "radii": {center: row_by_center[center]["radius_sq"] for center in sorted(row_by_center)},
        "crossing_edges": [list(edge) for edge in edges],
        "crossing_weights": {"t": t, "s": s},
        "delta": delta,
        "overlap_supports": overlap_sizes,
        "negative_witness_indices": sorted(set(negative_witnesses)),
        "power_identity_residuals": identity_residuals,
    }


def _cyclotomic11(terms: Iterable[tuple[int, int]]) -> tuple[int, ...]:
    """Canonical Z[x]/(1+x+...+x^10) representation."""
    coeff = [0] * 11
    for exponent, multiplier in terms:
        coeff[exponent % 11] += multiplier
    # There is at most degree ten here, but keeping reduction general makes
    # this a self-contained exact ring operation.
    for degree in range(10, 9, -1):
        value = coeff[degree]
        if value:
            coeff[degree] = 0
            for lower in range(10):
                coeff[lower] -= value
    return tuple(coeff[:10])


def _regular11_distance_sq(a: int, b: int) -> tuple[int, ...]:
    k = (a - b) % 11
    return _cyclotomic11(((0, 2), (k, -1), ((-k) % 11, -1)))


def verify_regular11() -> dict[str, Any]:
    """Independently verify the exact regular-11-gon K3,3 control."""
    u_values = (0, 1, 2)
    v_values = (3, 6, 9)
    table: list[list[int]] = []
    rows: list[dict[str, Any]] = []
    for u in u_values:
        line: list[int] = []
        for v in v_values:
            center = (6 * (u + v)) % 11
            line.append(center)
            radius = _regular11_distance_sq(center, u)
            if radius == (0,) + (0,) * 9:
                raise ValueError("regular-11 control has zero radius")
            fiber = [point for point in range(11) if _regular11_distance_sq(center, point) == radius]
            if fiber != sorted((u, v)):
                raise ValueError(f"regular-11 row {(u, v)} has fiber {fiber}, expected {(u, v)}")
            rows.append({"center": center, "support": [u, v], "radius_sq": radius})
        table.append(line)
    centers = [row["center"] for row in rows]
    if len(set(centers)) != 9:
        raise ValueError("regular-11 row centers are not distinct")
    return {
        "ok": True,
        "modulus": 11,
        "u": list(u_values),
        "v": list(v_values),
        "center_table": table,
        "rows": rows,
        "distinct_centers": centers,
        "full_two_point_fibers": True,
        "incidence_subdivision": {"left": 3, "right": 3, "row_nodes": 9, "edges": 18},
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", nargs="?", type=Path, default=DEFAULT_CERTIFICATE)
    parser.add_argument("--regular11-only", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.regular11_only:
            report = verify_regular11()
        else:
            with args.certificate.open(encoding="utf-8") as stream:
                report = validate_control(json.load(stream))
    except (OSError, json.JSONDecodeError, ValueError) as exc:
        parser.error(str(exc))
    print(json.dumps(_jsonable(report), sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
