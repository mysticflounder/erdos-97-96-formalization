#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Exactly exercise the finite S0 cap predicates on a positive control.

This is an external ``Fraction`` conformance harness, not a source-bound S0
certificate.  It checks the closed half-plane, cap-interior, MEC, non-obtuse,
and strict cyclic-order predicates on one explicit twelve-point carrier.  It
does not establish cap completeness, L1, an S0 case, or Lean promotion.

``--smoke`` and ``--replay-result`` never write files.  ``--output-dir`` is the
only mode that writes, producing one deterministic JSON result.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-cap-semantics-positive-control/v1"
POSITIVE_STATUS = "CAP_SEMANTICS_POSITIVE_CONTROL_EXACT"
UNKNOWN_STATUS = "UNKNOWN"
BLOCKED_STATUS = "ENCODING_BLOCKED"
ALLOWED_STATUSES = frozenset({POSITIVE_STATUS, UNKNOWN_STATUS, BLOCKED_STATUS})
CLAIM_SCOPE = "FINITE_CAP_PREDICATE_POSITIVE_CONTROL_ONLY"
RESULT_FILENAME = "cap_semantics_result.json"
PROVENANCE_AUTHENTICATION_CLAIM = (
    "none; this does not authenticate uncommitted source bytes"
)
PROVENANCE_KEYS = frozenset({"authentication_claim", "git_head", "script_sha256"})

SOURCE_REFERENCES = (
    "Problem97.signedArea2",
    "Problem97.OnArcOpposite",
    "Problem97.MoserTriangle",
    "Problem97.CapTriple",
    "Problem97.SurplusCapPacket.capInteriorByIndex",
    "Problem97.SurplusCapPacket.oppIndex2",
    "Problem97.MEC.NonObtuseCircumscribedMoserTriangle",
    "docs/audits/2026-08-29-rigid221-s0-cap-semantics-computation.md",
)

ENCODED_FACTS = (
    "signedArea2 is evaluated over exact rational coordinates",
    "OnArcOpposite uses the closed product inequality <= 0",
    "C1,C2,C3 are derived by filtering the explicit closed carrier",
    "CapTriple cyclic endpoint membership and non-Moser exactly-one membership",
    "capInteriorByIndex erases the two endpoints of the selected cap",
    "surplusIdx maps to oppIndex2 and the corresponding Moser apex for all 0,1,2",
    "MEC center and positive squared radius contain every carrier point and put all Moser vertices on the boundary",
    "all three Moser-vertex non-obtuse dot products are nonnegative",
    "the named cyclic order is injective, has image exactly the carrier, and every nonincident point is strictly on the same side of every edge",
    "exact coordinate equality induces a 12-element quotient, so duplicate role coordinates are rejected",
)

ASSUMPTIONS = (
    "the closed carrier is exactly the twelve serialized named roles",
    "the twelve fixture roles are required to have pairwise-distinct exact coordinates",
    "the serialized cyclic order and Moser roles are fixed fixture data",
    "the fixture MEC center is (0,0) with squared radius 1",
    "surplusIdx=0 is fixture data rather than a consequence of an ambient source packet",
)

OMITTED_FACTS = (
    "any identification of this carrier with the source carrier D.A",
    "Cap-complete L1 hypotheses or conclusions",
    "S0-I and S0-N",
    "q/w roles or constraints",
    "source context, packet rows, and robust-surface hypotheses",
    "existence or uniqueness of an MEC for an arbitrary carrier",
    "a general ConvexIndep proof beyond the explicit cyclic-order certificate",
    "Lean kernel checking, theorem ingress, or promotion",
)

ROLE_ORDER = (
    "v1",
    "lower_right_steep",
    "lower_right_shallow",
    "v2",
    "upper_right_shallow",
    "upper_right_steep",
    "top",
    "upper_left_steep",
    "upper_left_shallow",
    "v3",
    "lower_left_shallow",
    "lower_left_steep",
)
ROLE_SET = frozenset(ROLE_ORDER)
MOSER_ROLES = ("v1", "v2", "v3")


class VerificationError(ValueError):
    """An exact predicate or strict parser check failed."""

    def __init__(self, code: str, detail: str) -> None:
        super().__init__(f"{code}: {detail}")
        self.code = code
        self.detail = detail


@dataclass(frozen=True)
class Fixture:
    """A finite named carrier with a cyclic order and MEC certificate."""

    points: tuple[tuple[str, Point], ...]
    order: tuple[str, ...]
    moser: tuple[str, str, str]
    surplus_idx: int
    mec_center: Point
    mec_radius_squared: F

    def point_map(self) -> dict[str, Point]:
        return dict(self.points)


@dataclass(frozen=True)
class VerificationReport:
    """Exact derived data retained in the serialized positive control."""

    caps: tuple[frozenset[str], frozenset[str], frozenset[str]]
    interiors: tuple[frozenset[str], frozenset[str], frozenset[str]]
    membership_counts: tuple[tuple[str, int], ...]
    opposite_table: tuple[tuple[int, int, str], ...]
    selected_interior: frozenset[str]
    dot_products: tuple[F, F, F]
    minimum_edge_area: F
    coordinate_quotient_cardinality: int


def fixture_12() -> Fixture:
    """Return the explicit twelve-point unit-circle fixture."""

    points: dict[str, Point] = {
        "v1": (F(0), F(-1)),
        "lower_right_steep": (F(3, 5), F(-4, 5)),
        "lower_right_shallow": (F(4, 5), F(-3, 5)),
        "v2": (F(1), F(0)),
        "upper_right_shallow": (F(4, 5), F(3, 5)),
        "upper_right_steep": (F(3, 5), F(4, 5)),
        "top": (F(0), F(1)),
        "upper_left_steep": (F(-3, 5), F(4, 5)),
        "upper_left_shallow": (F(-4, 5), F(3, 5)),
        "v3": (F(-1), F(0)),
        "lower_left_shallow": (F(-4, 5), F(-3, 5)),
        "lower_left_steep": (F(-3, 5), F(-4, 5)),
    }
    return Fixture(
        points=tuple((name, points[name]) for name in ROLE_ORDER),
        order=ROLE_ORDER,
        moser=MOSER_ROLES,
        surplus_idx=0,
        mec_center=(F(0), F(0)),
        mec_radius_squared=F(1),
    )


def signed_area2(v: Point, vj: Point, vk: Point) -> F:
    """Lean's ``signedArea2 v vj vk`` over exact rationals."""

    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def on_arc_opposite(vi: Point, vj: Point, vk: Point, x: Point) -> bool:
    """Lean's closed ``OnArcOpposite vi vj vk x`` predicate."""

    return signed_area2(x, vj, vk) * signed_area2(vi, vj, vk) <= 0


def _on_arc_opposite_strict(vi: Point, vj: Point, vk: Point, x: Point) -> bool:
    """Deliberately wrong open variant, used only as a negative control."""

    return signed_area2(x, vj, vk) * signed_area2(vi, vj, vk) < 0


def dot(a: Point, b: Point) -> F:
    return a[0] * b[0] + a[1] * b[1]


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def dist2(a: Point, b: Point) -> F:
    d = sub(a, b)
    return dot(d, d)


def _require(condition: bool, code: str, detail: str) -> None:
    if not condition:
        raise VerificationError(code, detail)


def validate_fixture_shape(fixture: Fixture) -> dict[str, Point]:
    """Check role identity, exact equality quotient, and index data."""

    names = tuple(name for name, _point in fixture.points)
    _require(len(names) == len(ROLE_ORDER), "role_count", "expected 12 roles")
    _require(
        frozenset(names) == ROLE_SET and len(set(names)) == len(names),
        "role_names",
        "carrier roles must occur exactly once",
    )
    points = fixture.point_map()
    quotient = frozenset(points.values())
    _require(
        len(quotient) == len(points),
        "duplicate_coordinates",
        "distinct role names collapse under exact point equality",
    )
    _require(
        len(fixture.order) == len(ROLE_ORDER)
        and frozenset(fixture.order) == ROLE_SET
        and len(set(fixture.order)) == len(fixture.order),
        "cyclic_order_image",
        "cyclic order must be injective with image exactly the carrier",
    )
    _require(
        fixture.moser == MOSER_ROLES,
        "moser_roles",
        "expected ordered Moser roles (v1,v2,v3)",
    )
    _require(fixture.surplus_idx in (0, 1, 2), "surplus_index", "index out of range")
    return points


def require_nondegenerate_moser(v1: Point, v2: Point, v3: Point) -> F:
    """Require the reference triangle to orient the cap half-planes."""

    area = signed_area2(v1, v2, v3)
    _require(area != 0, "collinear_moser", "Moser reference area is zero")
    return area


def derive_caps(
    fixture: Fixture, *, closed: bool = True
) -> tuple[frozenset[str], frozenset[str], frozenset[str]]:
    """Filter the explicit carrier by the three cyclic arc predicates."""

    points = fixture.point_map()
    v1, v2, v3 = (points[name] for name in fixture.moser)
    require_nondegenerate_moser(v1, v2, v3)
    predicate = on_arc_opposite if closed else _on_arc_opposite_strict
    triples = ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2))
    return tuple(
        frozenset(
            name
            for name, point in fixture.points
            if predicate(apex, endpoint1, endpoint2, point)
        )
        for apex, endpoint1, endpoint2 in triples
    )  # type: ignore[return-value]


def cap_membership_count(point: Point, moser_points: tuple[Point, Point, Point]) -> int:
    """Count closed arc predicates for one point, independent of a carrier."""

    v1, v2, v3 = moser_points
    return sum(
        (
            on_arc_opposite(v1, v2, v3, point),
            on_arc_opposite(v2, v3, v1, point),
            on_arc_opposite(v3, v1, v2, point),
        )
    )


def verify_cap_triple(
    fixture: Fixture,
    caps: tuple[frozenset[str], frozenset[str], frozenset[str]],
) -> tuple[tuple[str, int], ...]:
    """Check subset, endpoint, exact-one, and global arc equivalences."""

    for cap in caps:
        _require(cap <= ROLE_SET, "cap_subset", "cap contains a role outside carrier")
    v1, v2, v3 = fixture.moser
    endpoint_patterns = (
        ((v1, False), (v2, True), (v3, True)),
        ((v1, True), (v2, False), (v3, True)),
        ((v1, True), (v2, True), (v3, False)),
    )
    for cap_index, pattern in enumerate(endpoint_patterns):
        for role, expected in pattern:
            _require(
                (role in caps[cap_index]) is expected,
                "cap_endpoint_pattern",
                f"C{cap_index + 1} has wrong membership for {role}",
            )

    expected_caps = derive_caps(fixture)
    _require(
        caps == expected_caps, "cap_arc_equivalence", "cap differs from closed filter"
    )
    counts: list[tuple[str, int]] = []
    for role in ROLE_ORDER:
        if role in fixture.moser:
            continue
        count = sum(role in cap for cap in caps)
        _require(
            count == 1,
            "exactly_one_cap",
            f"non-Moser role {role} belongs to {count} caps",
        )
        counts.append((role, count))
    return tuple(counts)


def cap_interior_by_index(
    caps: tuple[frozenset[str], frozenset[str], frozenset[str]],
    index: int,
    moser: tuple[str, str, str] = MOSER_ROLES,
) -> frozenset[str]:
    """Literal endpoint erasure used by ``capInteriorByIndex``."""

    v1, v2, v3 = moser
    if index == 0:
        return caps[0] - {v2, v3}
    if index == 1:
        return caps[1] - {v3, v1}
    if index == 2:
        return caps[2] - {v1, v2}
    raise VerificationError("cap_index", f"invalid cap index {index}")


def opp_index2(index: int) -> int:
    """Literal finite table: 0↦2, 1↦0, 2↦1."""

    if index == 0:
        return 2
    if index == 1:
        return 0
    if index == 2:
        return 1
    raise VerificationError("surplus_index", f"invalid surplus index {index}")


def opposite_table(
    moser: tuple[str, str, str] = MOSER_ROLES,
) -> tuple[tuple[int, int, str], ...]:
    """Return every surplus index, opposite index, and opposite apex."""

    return tuple(
        (index, opp_index2(index), moser[opp_index2(index)]) for index in range(3)
    )


def verify_mec(fixture: Fixture, points: Mapping[str, Point]) -> None:
    """Check the supplied finite MEC certificate, without solving an MEC."""

    radius2 = fixture.mec_radius_squared
    _require(radius2 > 0, "mec_positive_radius", "MEC squared radius is not positive")
    for role, point in points.items():
        _require(
            dist2(fixture.mec_center, point) <= radius2,
            "mec_carrier_containment",
            f"{role} lies outside the supplied disk",
        )
    for role in fixture.moser:
        _require(
            dist2(fixture.mec_center, points[role]) == radius2,
            "mec_moser_boundary",
            f"{role} is not on the supplied boundary",
        )


def nonobtuse_dot_products(v1: Point, v2: Point, v3: Point) -> tuple[F, F, F]:
    """Return the three exact vertex dot products in Lean field order."""

    return (
        dot(sub(v2, v1), sub(v3, v1)),
        dot(sub(v3, v2), sub(v1, v2)),
        dot(sub(v1, v3), sub(v2, v3)),
    )


def verify_nonobtuse(v1: Point, v2: Point, v3: Point) -> tuple[F, F, F]:
    values = nonobtuse_dot_products(v1, v2, v3)
    _require(
        all(value >= 0 for value in values),
        "adjacent_moser_nonobtuse",
        f"negative Moser dot product: {values}",
    )
    return values


def verify_convex_order(fixture: Fixture, points: Mapping[str, Point]) -> F:
    """Check every edge/nonincident point has strict left orientation."""

    areas: list[F] = []
    order = fixture.order
    for index, first_name in enumerate(order):
        second_name = order[(index + 1) % len(order)]
        for other_name in order:
            if other_name in (first_name, second_name):
                continue
            area = signed_area2(
                points[first_name], points[second_name], points[other_name]
            )
            _require(
                area > 0,
                "strict_convex_order",
                f"edge {first_name}->{second_name}, point {other_name}, area {area}",
            )
            areas.append(area)
    _require(bool(areas), "strict_convex_order", "empty edge certificate")
    return min(areas)


def verify_fixture(fixture: Fixture) -> VerificationReport:
    """Run all exact positive-control checks and derive its metrics."""

    points = validate_fixture_shape(fixture)
    moser_points = tuple(points[name] for name in fixture.moser)
    require_nondegenerate_moser(*moser_points)
    caps = derive_caps(fixture)
    counts = verify_cap_triple(fixture, caps)
    interiors = tuple(cap_interior_by_index(caps, index) for index in range(3))
    table = opposite_table(fixture.moser)
    selected_index = opp_index2(fixture.surplus_idx)
    selected = interiors[selected_index]
    verify_mec(fixture, points)
    dots = verify_nonobtuse(*moser_points)
    minimum_area = verify_convex_order(fixture, points)
    return VerificationReport(
        caps=caps,
        interiors=interiors,  # type: ignore[arg-type]
        membership_counts=counts,
        opposite_table=table,
        selected_interior=selected,
        dot_products=dots,
        minimum_edge_area=minimum_area,
        coordinate_quotient_cardinality=len(frozenset(points.values())),
    )


def replace_fixture(
    fixture: Fixture,
    *,
    points: Mapping[str, Point] | None = None,
    order: Sequence[str] | None = None,
    moser: tuple[str, str, str] | None = None,
    surplus_idx: int | None = None,
) -> Fixture:
    """Create a mutation while preserving the fixture's other fields."""

    point_map = fixture.point_map()
    point_map.update(points or {})
    return Fixture(
        points=tuple((name, point_map[name]) for name in ROLE_ORDER),
        order=tuple(order) if order is not None else fixture.order,
        moser=moser if moser is not None else fixture.moser,
        surplus_idx=fixture.surplus_idx if surplus_idx is None else surplus_idx,
        mec_center=fixture.mec_center,
        mec_radius_squared=fixture.mec_radius_squared,
    )


def _require_exactly_one_probe(point: Point, fixture: Fixture) -> None:
    points = fixture.point_map()
    moser_points = tuple(points[name] for name in fixture.moser)
    count = cap_membership_count(point, moser_points)
    _require(count == 1, "exactly_one_cap", f"probe belongs to {count} caps")


def _reject_wrong_fixed_index(fixture: Fixture) -> None:
    hard_coded_index = 1
    actual = opp_index2(fixture.surplus_idx)
    _require(
        hard_coded_index == actual,
        "wrong_fixed_cap_index",
        f"surplus {fixture.surplus_idx} requires {actual}, not {hard_coded_index}",
    )


def _reject_missing_endpoint_erasure(fixture: Fixture) -> None:
    caps = derive_caps(fixture)
    opposite = opp_index2(fixture.surplus_idx)
    un_erased = caps[opposite]
    erased = cap_interior_by_index(caps, opposite, fixture.moser)
    _require(
        un_erased == erased,
        "missing_endpoint_erasure",
        f"un-erased cap retains {sorted(un_erased - erased)}",
    )


def _reject_outside_carrier_filter(fixture: Fixture) -> None:
    caps = derive_caps(fixture)
    external_role = "outside_probe"
    external_point = (F(0), F(2))
    points = fixture.point_map()
    v1, v2, v3 = (points[name] for name in fixture.moser)
    _require(
        on_arc_opposite(v1, v2, v3, external_point),
        "control_setup",
        "outside probe does not satisfy C1 sign",
    )
    contaminated = (caps[0] | {external_role}, caps[1], caps[2])
    verify_cap_triple(fixture, contaminated)


def _expect_error(code: str, action: Callable[[], object]) -> dict[str, Any]:
    observed = "NO_ERROR"
    detail = ""
    try:
        action()
    except VerificationError as exc:
        observed = exc.code
        detail = exc.detail
    return {
        "detail": detail,
        "expected_code": code,
        "observed_code": observed,
        "passed": observed == code,
    }


def diagnostic_controls(fixture: Fixture | None = None) -> dict[str, dict[str, Any]]:
    """Run the requested exact negative/diagnostic controls."""

    fixture = fixture or fixture_12()
    points = fixture.point_map()
    closed_caps = derive_caps(fixture)
    strict_caps = derive_caps(fixture, closed=False)
    adjacent = (
        points["v1"],
        points["lower_right_steep"],
        points["lower_right_shallow"],
    )

    def strict_endpoint_action() -> None:
        verify_cap_triple(fixture, strict_caps)

    def collinear_action() -> None:
        require_nondegenerate_moser((F(0), F(-1)), (F(0), F(0)), (F(0), F(1)))

    def interior_action() -> None:
        mutated = replace_fixture(fixture, points={"top": (F(0), F(0))})
        mutated_points = validate_fixture_shape(mutated)
        verify_convex_order(mutated, mutated_points)

    def duplicate_action() -> None:
        mutated = replace_fixture(
            fixture, points={"upper_right_steep": points["upper_right_shallow"]}
        )
        validate_fixture_shape(mutated)

    def malformed_fraction_action() -> None:
        parse_fraction("not-a-rational")

    controls = {
        "adjacent_moser_nonobtuse_failure": _expect_error(
            "adjacent_moser_nonobtuse", lambda: verify_nonobtuse(*adjacent)
        ),
        "collinear_moser_vertices": _expect_error("collinear_moser", collinear_action),
        "count_two_corner_point": _expect_error(
            "exactly_one_cap",
            lambda: _require_exactly_one_probe((F(-2), F(1)), fixture),
        ),
        "count_zero_central_point": _expect_error(
            "exactly_one_cap",
            lambda: _require_exactly_one_probe((F(0), F(-1, 3)), fixture),
        ),
        "duplicate_coordinates": _expect_error(
            "duplicate_coordinates", duplicate_action
        ),
        "interior_point_convexity_failure": _expect_error(
            "strict_convex_order", interior_action
        ),
        "malformed_serialized_replay": _expect_error(
            "malformed_fraction", malformed_fraction_action
        ),
        "missing_endpoint_erasure": _expect_error(
            "missing_endpoint_erasure",
            lambda: _reject_missing_endpoint_erasure(fixture),
        ),
        "outside_carrier_filter": _expect_error(
            "cap_subset", lambda: _reject_outside_carrier_filter(fixture)
        ),
        "strict_vs_closed_endpoints": _expect_error(
            "cap_endpoint_pattern", strict_endpoint_action
        ),
        "wrong_fixed_cap_index": _expect_error(
            "wrong_fixed_cap_index", lambda: _reject_wrong_fixed_index(fixture)
        ),
    }
    _require(
        closed_caps != strict_caps,
        "control_setup",
        "strict and closed cap filters unexpectedly agree",
    )
    return dict(sorted(controls.items()))


def fraction_text(value: F) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


_FRACTION_RE = re.compile(r"-?(?:0|[1-9][0-9]*)(?:/[1-9][0-9]*)?\Z")


def parse_fraction(value: object) -> F:
    """Parse only the canonical rational strings emitted by this script."""

    _require(
        isinstance(value, str) and _FRACTION_RE.fullmatch(value) is not None,
        "malformed_fraction",
        f"expected canonical rational string, got {value!r}",
    )
    try:
        parsed = F(value)
    except (ValueError, ZeroDivisionError) as exc:
        raise VerificationError("malformed_fraction", str(exc)) from exc
    _require(
        fraction_text(parsed) == value,
        "malformed_fraction",
        f"noncanonical rational string {value!r}",
    )
    return parsed


def point_json(point: Point) -> dict[str, str]:
    return {"x": fraction_text(point[0]), "y": fraction_text(point[1])}


def fixture_json(fixture: Fixture) -> dict[str, Any]:
    return {
        "carrier": {name: point_json(point) for name, point in fixture.points},
        "mec": {
            "center": point_json(fixture.mec_center),
            "radius_squared": fraction_text(fixture.mec_radius_squared),
        },
        "moser": list(fixture.moser),
        "order": list(fixture.order),
        "surplus_idx": fixture.surplus_idx,
    }


def _require_keys(
    value: object, expected: frozenset[str], context: str
) -> dict[str, Any]:
    _require(isinstance(value, dict), "malformed_json", f"{context} must be an object")
    actual = frozenset(value)
    _require(
        actual == expected,
        "malformed_json",
        f"{context} keys differ: missing={sorted(expected - actual)}, extra={sorted(actual - expected)}",
    )
    return value


def parse_point(value: object, context: str) -> Point:
    obj = _require_keys(value, frozenset({"x", "y"}), context)
    return (parse_fraction(obj["x"]), parse_fraction(obj["y"]))


def parse_fixture(value: object) -> Fixture:
    obj = _require_keys(
        value,
        frozenset({"carrier", "mec", "moser", "order", "surplus_idx"}),
        "fixture",
    )
    carrier = _require_keys(obj["carrier"], ROLE_SET, "fixture.carrier")
    mec = _require_keys(
        obj["mec"], frozenset({"center", "radius_squared"}), "fixture.mec"
    )
    _require(
        isinstance(obj["order"], list)
        and all(isinstance(name, str) for name in obj["order"]),
        "malformed_json",
        "fixture.order must be a string list",
    )
    _require(
        isinstance(obj["moser"], list)
        and len(obj["moser"]) == 3
        and all(isinstance(name, str) for name in obj["moser"]),
        "malformed_json",
        "fixture.moser must be a three-role list",
    )
    _require(
        isinstance(obj["surplus_idx"], int)
        and not isinstance(obj["surplus_idx"], bool),
        "malformed_json",
        "fixture.surplus_idx must be an integer",
    )
    fixture = Fixture(
        points=tuple(
            (name, parse_point(carrier[name], f"carrier.{name}")) for name in ROLE_ORDER
        ),
        order=tuple(obj["order"]),
        moser=tuple(obj["moser"]),  # type: ignore[arg-type]
        surplus_idx=obj["surplus_idx"],
        mec_center=parse_point(mec["center"], "fixture.mec.center"),
        mec_radius_squared=parse_fraction(mec["radius_squared"]),
    )
    validate_fixture_shape(fixture)
    return fixture


def current_provenance() -> dict[str, str]:
    """Return stable runtime source identifiers, without an auth claim."""

    script_path = Path(__file__).resolve()
    script_sha = hashlib.sha256(script_path.read_bytes()).hexdigest()
    head = "unavailable"
    try:
        completed = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=script_path.parent.parent,
            check=False,
            capture_output=True,
            text=True,
            timeout=2,
        )
        candidate = completed.stdout.strip()
        if completed.returncode == 0 and re.fullmatch(r"[0-9a-f]{40}", candidate):
            head = candidate
    except (OSError, subprocess.TimeoutExpired):
        pass
    return {
        "authentication_claim": PROVENANCE_AUTHENTICATION_CLAIM,
        "git_head": head,
        "script_sha256": script_sha,
    }


def validate_runtime_provenance(value: object) -> dict[str, str]:
    """Validate durable provenance while treating its Git HEAD as informational."""

    obj = _require_keys(value, PROVENANCE_KEYS, "runtime_provenance")
    _require(
        obj["authentication_claim"] == PROVENANCE_AUTHENTICATION_CLAIM,
        "malformed_provenance",
        "authentication disclaimer differs from the fixed text",
    )
    git_head = obj["git_head"]
    _require(
        isinstance(git_head, str)
        and (git_head == "unavailable" or re.fullmatch(r"[0-9a-f]{40}", git_head)),
        "malformed_provenance",
        "git_head must be 'unavailable' or lowercase 40-hex",
    )
    script_sha = obj["script_sha256"]
    _require(
        isinstance(script_sha, str) and re.fullmatch(r"[0-9a-f]{64}", script_sha),
        "malformed_provenance",
        "script_sha256 must be lowercase 64-hex",
    )
    current_script_sha = hashlib.sha256(
        Path(__file__).resolve().read_bytes()
    ).hexdigest()
    _require(
        script_sha == current_script_sha,
        "stale_result",
        "serialized script SHA-256 differs from the current harness",
    )
    return {
        "authentication_claim": obj["authentication_claim"],
        "git_head": git_head,
        "script_sha256": script_sha,
    }


def _report_json(report: VerificationReport) -> dict[str, Any]:
    return {
        "cap_interiors": [sorted(interior) for interior in report.interiors],
        "cap_members": [sorted(cap) for cap in report.caps],
        "cap_sizes": [len(cap) for cap in report.caps],
        "coordinate_quotient_cardinality": report.coordinate_quotient_cardinality,
        "minimum_edge_area2": fraction_text(report.minimum_edge_area),
        "moser_dot_products": [fraction_text(value) for value in report.dot_products],
        "non_moser_membership_counts": dict(report.membership_counts),
        "opposite_table": [
            {"apex": apex, "opp_index2": opposite, "surplus_idx": surplus}
            for surplus, opposite, apex in report.opposite_table
        ],
        "selected_J": sorted(report.selected_interior),
    }


def build_result(fixture: Fixture | None = None) -> dict[str, Any]:
    """Build the full deterministic exact positive-control result."""

    fixture = fixture or fixture_12()
    report = verify_fixture(fixture)
    controls = diagnostic_controls(fixture)
    failed = [name for name, control in controls.items() if not control["passed"]]
    _require(not failed, "diagnostic_control_failed", f"failed controls: {failed}")
    _require(
        tuple(len(cap) for cap in report.caps) == (7, 4, 4),
        "fixture_metrics",
        "expected cap sizes (7,4,4)",
    )
    _require(fixture.surplus_idx == 0, "fixture_metrics", "expected surplusIdx=0")
    expected_j = frozenset({"lower_right_steep", "lower_right_shallow"})
    _require(report.selected_interior == expected_j, "fixture_metrics", "unexpected J")
    return {
        "assumptions_ledger": list(ASSUMPTIONS),
        "claim_scope": CLAIM_SCOPE,
        "diagnostic_controls": controls,
        "encoded_ledger": list(ENCODED_FACTS),
        "fixture": fixture_json(fixture),
        "full_L1_claim": False,
        "omitted_ledger": list(OMITTED_FACTS),
        "promotion_claim": False,
        "runtime_provenance": current_provenance(),
        "s0_claim": False,
        "schema": SCHEMA,
        "source_binding_claim": False,
        "source_references": list(SOURCE_REFERENCES),
        "status": POSITIVE_STATUS,
        "verification": _report_json(report),
    }


def canonical_json(value: object, *, pretty: bool = False) -> str:
    return json.dumps(
        value,
        indent=2 if pretty else None,
        separators=None if pretty else (",", ":"),
        sort_keys=True,
    )


def replay_result(path: Path) -> dict[str, Any]:
    """Strictly parse, reconstruct, and exactly replay one serialized result."""

    try:
        raw = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise VerificationError("malformed_json", str(exc)) from exc
    expected_keys = frozenset(build_result())
    obj = _require_keys(raw, expected_keys, "result")
    _require(obj["status"] == POSITIVE_STATUS, "false_status", "result is not positive")
    _require(obj["schema"] == SCHEMA, "stale_result", "schema mismatch")
    _require(obj["claim_scope"] == CLAIM_SCOPE, "stale_result", "claim scope mismatch")
    serialized_provenance = validate_runtime_provenance(obj["runtime_provenance"])
    _require(
        obj["encoded_ledger"] == list(ENCODED_FACTS)
        and obj["assumptions_ledger"] == list(ASSUMPTIONS)
        and obj["omitted_ledger"] == list(OMITTED_FACTS)
        and obj["source_references"] == list(SOURCE_REFERENCES),
        "stale_result",
        "claim or source ledger differs from the current harness",
    )
    for flag in (
        "full_L1_claim",
        "s0_claim",
        "promotion_claim",
        "source_binding_claim",
    ):
        _require(obj[flag] is False, "false_claim", f"{flag} must be false")
    fixture = parse_fixture(obj["fixture"])
    recomputed = build_result(fixture)
    # Git HEAD records where the durable artifact was produced.  It is not a
    # semantic input and must survive replay across unrelated repository commits.
    recomputed["runtime_provenance"] = serialized_provenance
    _require(
        obj == recomputed, "stale_or_corrupt_result", "result differs from exact replay"
    )
    return recomputed


def blocked_result(error: VerificationError) -> dict[str, Any]:
    """Return a claim-bounded encoding/checker failure result."""

    return {
        "assumptions_ledger": list(ASSUMPTIONS),
        "claim_scope": CLAIM_SCOPE,
        "encoded_ledger": list(ENCODED_FACTS),
        "error": {"code": error.code, "detail": error.detail},
        "full_L1_claim": False,
        "omitted_ledger": list(OMITTED_FACTS),
        "promotion_claim": False,
        "s0_claim": False,
        "schema": SCHEMA,
        "source_binding_claim": False,
        "status": BLOCKED_STATUS,
    }


def summary_json(result: Mapping[str, Any]) -> dict[str, Any]:
    summary: dict[str, Any] = {"status": result["status"]}
    if result["status"] == POSITIVE_STATUS:
        controls = result["diagnostic_controls"]
        summary.update(
            {
                "cap_sizes": result["verification"]["cap_sizes"],
                "controls_passed": sum(
                    control["passed"] for control in controls.values()
                ),
                "controls_total": len(controls),
                "selected_J": result["verification"]["selected_J"],
            }
        )
    elif "error" in result:
        summary["error"] = result["error"]
    return summary


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Exact finite cap-predicate positive control; no S0/L1/source claim."
    )
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument(
        "--smoke", action="store_true", help="verify in memory and write nothing"
    )
    mode.add_argument(
        "--output-dir",
        type=Path,
        help=f"verify and write deterministic {RESULT_FILENAME}",
    )
    mode.add_argument(
        "--replay-result",
        type=Path,
        help="strictly parse and replay a prior result without writing",
    )
    parser.add_argument(
        "--verbose", action="store_true", help="print the full result JSON"
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = make_parser().parse_args(argv)
    try:
        result = (
            replay_result(args.replay_result) if args.replay_result else build_result()
        )
    except VerificationError as exc:
        result = blocked_result(exc)
        print(canonical_json(result if args.verbose else summary_json(result)))
        return 2

    if args.output_dir is not None:
        args.output_dir.mkdir(parents=True, exist_ok=True)
        target = args.output_dir / RESULT_FILENAME
        target.write_text(canonical_json(result, pretty=True) + "\n", encoding="utf-8")
    print(canonical_json(result if args.verbose else summary_json(result)))
    return 0 if result["status"] == POSITIVE_STATUS else 1


if __name__ == "__main__":
    raise SystemExit(main())
