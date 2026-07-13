#!/usr/bin/env python3
"""Construct exact distinct witnesses for three-center equality skeletons."""
from __future__ import annotations

from collections import Counter
from itertools import product
from typing import Any, Mapping

import sympy as sp
from sympy.polys.numberfields import to_number_field

from census.atail_force import three_center_surface as surface


Point = tuple[sp.Expr, sp.Expr]

FREE_RADIUS_CANDIDATES = tuple(
    sp.Rational(numerator, denominator)
    for numerator, denominator in (
        (2, 1),
        (3, 1),
        (1, 1),
        (4, 1),
        (5, 1),
        (3, 2),
        (1, 2),
        (1, 4),
        (3, 4),
        (5, 4),
        (9, 1),
    )
)


def _d2(left: Point, right: Point) -> sp.Expr:
    return sp.expand(
        (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2
    )


def _exact_zero(value: sp.Expr) -> bool:
    simplified = sp.simplify(sp.radsimp(sp.expand(value)))
    if simplified == 0:
        return True
    if simplified.is_zero is False:
        return False
    try:
        return to_number_field(simplified) == 0
    except (NotImplementedError, sp.PolynomialError) as exc:
        raise surface.SurfaceError(
            f"undecidable exact zero test: {simplified}"
        ) from exc


def _same_point(left: Point, right: Point) -> bool:
    return _exact_zero(_d2(left, right))


def _triangle(moser_masks: tuple[int, int, int]) -> tuple[Point, Point, Point]:
    equal_b_c = bool(moser_masks[1] & 1 and moser_masks[2] & 1)
    c_is_one = bool(moser_masks[0] & 2 and moser_masks[2] & 2)
    b_is_one = bool(moser_masks[0] & 4 and moser_masks[1] & 4)

    if equal_b_c and (b_is_one or c_is_one):
        b = c = sp.Integer(1)
    elif equal_b_c:
        b = c = sp.Integer(2)
    else:
        b = sp.Integer(1 if b_is_one else 2)
        c = sp.Integer(1 if c_is_one else (2 if b_is_one else 3))
    ux = sp.simplify((c - b + 1) / 2)
    uy2 = sp.simplify(c - ux**2)
    if uy2.is_positive is not True:
        raise surface.SurfaceError(f"nonpositive triangle height: {uy2}")
    u = (ux, sp.sqrt(uy2))
    v = (sp.Integer(0), sp.Integer(0))
    w = (sp.Integer(1), sp.Integer(0))
    centers = (u, v, w)

    for center in surface.CENTERS:
        selected_anchors = [
            vertex
            for vertex, mask in enumerate(moser_masks)
            if mask & (1 << center)
        ]
        if len(selected_anchors) == 2:
            left = _d2(centers[center], centers[selected_anchors[0]])
            right = _d2(centers[center], centers[selected_anchors[1]])
            if not _exact_zero(left - right):
                raise surface.SurfaceError("triangle misses an anchor-radius equality")
    return centers


def _forced_radii(
    joint: surface.JointClass,
    centers: tuple[Point, Point, Point],
) -> tuple[sp.Expr | None, sp.Expr | None, sp.Expr | None]:
    radii: list[sp.Expr | None] = []
    for center in surface.CENTERS:
        selected = [
            vertex
            for vertex, mask in enumerate(joint.moser_masks)
            if mask & (1 << center)
        ]
        if not selected:
            radii.append(None)
            continue
        radius = sp.simplify(_d2(centers[center], centers[selected[0]]))
        if any(
            not _exact_zero(
                _d2(centers[center], centers[vertex]) - radius
            )
            for vertex in selected[1:]
        ):
            raise surface.SurfaceError("inconsistent forced class radius")
        radii.append(radius)
    return tuple(radii)


def _pair_intersections(
    left: Point,
    right: Point,
    left_radius2: sp.Expr,
    right_radius2: sp.Expr,
) -> tuple[Point, Point]:
    dx = sp.expand(right[0] - left[0])
    dy = sp.expand(right[1] - left[1])
    center_distance2 = sp.expand(dx**2 + dy**2)
    if _exact_zero(center_distance2):
        raise surface.SurfaceError("coincident circle centers")
    along = sp.simplify(
        (left_radius2 - right_radius2 + center_distance2)
        / (2 * center_distance2)
    )
    base = (
        sp.simplify(left[0] + along * dx),
        sp.simplify(left[1] + along * dy),
    )
    height_coefficient2 = sp.simplify(
        (left_radius2 - along**2 * center_distance2) / center_distance2
    )
    height = sp.sqrt(height_coefficient2)
    perpendicular = (-dy, dx)
    plus = (
        sp.simplify(base[0] + height * perpendicular[0]),
        sp.simplify(base[1] + height * perpendicular[1]),
    )
    minus = (
        sp.simplify(base[0] - height * perpendicular[0]),
        sp.simplify(base[1] - height * perpendicular[1]),
    )
    return plus, minus


def _append_if_fresh(candidate: Point, points: list[Point]) -> bool:
    if any(_same_point(candidate, existing) for existing in points):
        return False
    points.append(candidate)
    return True


def _try_support_points(
    joint: surface.JointClass,
    centers: tuple[Point, Point, Point],
    radii: tuple[sp.Expr, sp.Expr, sp.Expr],
) -> dict[int, list[Point]] | None:
    counts = Counter(
        mask for cap in surface.CAPS for mask in joint.cap_masks(cap)
    )
    support: dict[int, list[Point]] = {mask: [] for mask in range(1, 7)}
    used = list(centers)

    for mask, left, right in ((3, 0, 1), (5, 0, 2), (6, 1, 2)):
        needed = counts[mask]
        if needed == 0:
            continue
        candidates = _pair_intersections(
            centers[left], centers[right], radii[left], radii[right]
        )
        for candidate in candidates:
            if _append_if_fresh(candidate, used):
                support[mask].append(candidate)
                if len(support[mask]) == needed:
                    break
        if len(support[mask]) != needed:
            return None

    for mask, center in ((1, 0), (2, 1), (4, 2)):
        needed = counts[mask]
        if needed == 0:
            continue
        radius = sp.sqrt(radii[center])
        for parameter in range(25):
            t = sp.Integer(parameter)
            denominator = 1 + t**2
            direction = (
                sp.simplify((1 - t**2) / denominator),
                sp.simplify(2 * t / denominator),
            )
            candidate = (
                sp.simplify(centers[center][0] + radius * direction[0]),
                sp.simplify(centers[center][1] + radius * direction[1]),
            )
            if _append_if_fresh(candidate, used):
                support[mask].append(candidate)
                if len(support[mask]) == needed:
                    break
        if len(support[mask]) != needed:
            return None
    return support


def _circumcenter_data(centers: tuple[Point, Point, Point]) -> tuple[sp.Expr, sp.Expr]:
    u = centers[0]
    oy = sp.simplify(
        ((u[0] - sp.Rational(1, 2)) ** 2 + u[1] ** 2 - sp.Rational(1, 4))
        / (2 * u[1])
    )
    radius2 = sp.simplify(sp.Rational(1, 4) + oy**2)
    return oy, radius2


def _substitutions(
    joint: surface.JointClass,
    order: surface.OrderDecoration,
    centers: tuple[Point, Point, Point],
    radii: tuple[sp.Expr, sp.Expr, sp.Expr],
    support: Mapping[int, list[Point]],
) -> dict[str, sp.Expr]:
    oy, radius2 = _circumcenter_data(centers)
    substitutions: dict[str, sp.Expr] = {
        "v1x": centers[0][0],
        "v1y": centers[0][1],
        "oy": oy,
        "R2": radius2,
        "ru2": radii[0],
        "rv2": radii[1],
        "rw2": radii[2],
    }
    positions = {mask: 0 for mask in range(1, 7)}
    for cap in surface.CAPS:
        prefix = surface.CAP_POINT_PREFIX[cap]
        for index, mask in enumerate(order.block(cap), start=1):
            position = positions[mask]
            point = support[mask][position]
            positions[mask] += 1
            substitutions[f"{prefix}{index}x"] = point[0]
            substitutions[f"{prefix}{index}y"] = point[1]
    return substitutions


def _separators_nonzero(
    system: Any,
    substitutions: Mapping[str, sp.Expr],
) -> bool:
    symbol_substitutions = {
        sp.Symbol(name, real=True): value for name, value in substitutions.items()
    }
    return all(
        not _exact_zero(separator.subs(symbol_substitutions))
        for separator in surface.equality_separators(system)
    )


def find_witness(
    joint: surface.JointClass,
    order: surface.OrderDecoration,
) -> dict[str, Any]:
    """Find an exact separator-satisfying equality witness for one class."""
    centers = _triangle(joint.moser_masks)
    forced = _forced_radii(joint, centers)
    free_centers = [center for center, radius in enumerate(forced) if radius is None]
    complex_fallback: tuple[
        dict[str, sp.Expr], tuple[sp.Expr, ...]
    ] | None = None

    def finish(
        substitutions: dict[str, sp.Expr],
        choices: tuple[sp.Expr, ...],
        is_real: bool,
    ) -> dict[str, Any]:
        system = surface.build_equality_system(joint, order)
        verified, failures = surface.verify_equalities(system, substitutions)
        if not verified:
            raise surface.SurfaceError(
                f"constructed witness failed class {joint.class_id}: {failures[:1]}"
            )
        if not _separators_nonzero(system, substitutions):
            raise surface.SurfaceError(
                f"constructed witness has a zero separator for class {joint.class_id}"
            )
        return {
            "substitutions": substitutions,
            "all_coordinates_real": is_real,
            "free_radius_choices": [str(choice) for choice in choices],
        }

    for choices in product(FREE_RADIUS_CANDIDATES, repeat=len(free_centers)):
        radii = list(forced)
        for center, choice in zip(free_centers, choices):
            radii[center] = choice
        exact_radii = tuple(sp.simplify(radius) for radius in radii)
        support = _try_support_points(joint, centers, exact_radii)
        if support is None:
            continue
        substitutions = _substitutions(
            joint, order, centers, exact_radii, support
        )
        is_real = all(value.is_real is True for value in substitutions.values())
        if is_real:
            return finish(substitutions, choices, True)
        if complex_fallback is None:
            complex_fallback = substitutions, choices
    if complex_fallback is not None:
        substitutions, choices = complex_fallback
        return finish(substitutions, choices, False)
    raise surface.SurfaceError(
        f"no distinct equality witness found for class {joint.class_id}"
    )
