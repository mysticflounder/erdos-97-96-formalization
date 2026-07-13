#!/usr/bin/env python3
"""Exact three-center windows over the mined L2 joint-class inventory.

This module adds the geometric data deliberately forgotten by the finite
multi-center census: one global convex order for the support points selected
by K(U), K(V), and K(W).  It does not assert that a census row is geometrically
realizable, that every live leaf has been extracted into the inventory in
Lean, or that selected-four supports force the full-filter overlap required by
ATAIL-FORCE.

Every emitted constraint is nevertheless leaf-implied if the input row and
order arise from a genuine DoubleApex leaf.  Thus a future exact UNSAT
certificate can exclude that decorated row; SAT is only a window model.
"""
from __future__ import annotations

import hashlib
import json
import math
from collections import Counter
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Any, Iterator, Mapping, Sequence

import sympy as sp

from census.candidate_d_probe import encoder as enc


SCHEMA = "multi_center_l2_class_inventory_certificate.v1"
EXPECTED_CLASS_COUNT = 3375
EXPECTED_INVENTORY_SHA256 = (
    "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
)

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
DEFAULT_INVENTORY = (
    REPO_ROOT
    / "certificates"
    / "multi_center"
    / "reports"
    / "l2_class_inventory_certificate.json"
)

CENTERS = (0, 1, 2)
CAPS = ("S", "O1", "O2")
CAP_ORDER = {cap: index for index, cap in enumerate(CAPS)}
CAP_VERTICES = {
    "S": (1, 2),
    "O1": (0, 2),
    "O2": (0, 1),
}
CAP_OWN_INDEX = {"S": 1, "O1": 2, "O2": 3}
CAP_POINT_PREFIX = {"S": "s", "O1": "p", "O2": "q"}
PAIR_CAP = {
    frozenset((1, 2)): ("S", "O1", "O2"),
    frozenset((0, 2)): ("O1", "S", "O2"),
    frozenset((0, 1)): ("O2", "S", "O1"),
}


class SurfaceError(ValueError):
    """The inventory or a requested order violates the surface contract."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise SurfaceError(message)


def _is_int(value: Any) -> bool:
    return type(value) is int


def _has(mask: int, center: int) -> bool:
    return bool(mask & (1 << center))


def _key_digest(keys: Sequence[str]) -> str:
    digest = hashlib.sha256()
    for key in sorted(keys):
        digest.update(key.encode("utf-8"))
        digest.update(b"\n")
    return digest.hexdigest()


@dataclass(frozen=True)
class JointClass:
    """One canonical L2/full-participant selected-support class."""

    class_id: int
    class_key: str
    class_key_sha256: str
    first_n: int
    last_n: int
    moser_masks: tuple[int, int, int]
    cap_rows: tuple[tuple[str, int, int], ...]

    def cap_masks(self, cap: str) -> tuple[int, ...]:
        _require(cap in CAPS, f"unknown cap {cap!r}")
        masks: list[int] = []
        for row_cap, mask, count in self.cap_rows:
            if row_cap == cap:
                masks.extend([mask] * count)
        return tuple(masks)

    @property
    def interior_point_count(self) -> int:
        return sum(count for _cap, _mask, count in self.cap_rows)

    @property
    def membership_incidence_count(self) -> int:
        anchor_count = sum(mask.bit_count() for mask in self.moser_masks)
        interior_count = sum(
            mask.bit_count() * count for _cap, mask, count in self.cap_rows
        )
        return anchor_count + interior_count


@dataclass(frozen=True)
class OrderDecoration:
    """Membership-mask order inside each of the three cap blocks."""

    s: tuple[int, ...]
    o1: tuple[int, ...]
    o2: tuple[int, ...]

    def block(self, cap: str) -> tuple[int, ...]:
        if cap == "S":
            return self.s
        if cap == "O1":
            return self.o1
        if cap == "O2":
            return self.o2
        raise SurfaceError(f"unknown cap {cap!r}")

    def as_json(self) -> dict[str, list[int]]:
        return {cap: list(self.block(cap)) for cap in CAPS}


def _validate_local_cuts(joint: JointClass) -> None:
    selected_counts = []
    for center in CENTERS:
        anchor_count = sum(_has(mask, center) for mask in joint.moser_masks)
        interior_count = sum(
            count
            for _cap, mask, count in joint.cap_rows
            if _has(mask, center)
        )
        selected_counts.append(anchor_count + interior_count)
    _require(
        selected_counts == [4, 4, 4],
        f"class {joint.class_id} does not encode three selected-four supports: "
        f"{selected_counts}",
    )
    _require(
        joint.membership_incidence_count == 12,
        f"class {joint.class_id} has non-twelve membership incidence count",
    )

    for center, mask in enumerate(joint.moser_masks):
        _require(
            not _has(mask, center),
            f"class {joint.class_id} selects center {center} in its own class",
        )

    for center in CENTERS:
        for cap, vertices in CAP_VERTICES.items():
            if center not in vertices:
                continue
            used = sum(
                _has(joint.moser_masks[vertex], center)
                for vertex in vertices
                if vertex != center
            )
            used += sum(
                count
                for row_cap, mask, count in joint.cap_rows
                if row_cap == cap and _has(mask, center)
            )
            _require(
                used <= 1,
                f"class {joint.class_id} violates H1 at center {center}, {cap}",
            )

    for left, right in combinations(CENTERS, 2):
        shared_mask = (1 << left) | (1 << right)
        shared = sum(
            (mask & shared_mask) == shared_mask for mask in joint.moser_masks
        )
        shared += sum(
            count
            for _cap, mask, count in joint.cap_rows
            if (mask & shared_mask) == shared_mask
        )
        _require(
            shared <= 2,
            f"class {joint.class_id} violates pairwise class overlap C2",
        )

        common_cap, other_left, other_right = PAIR_CAP[frozenset((left, right))]
        shared_by_cap = {
            cap: sum(
                count
                for row_cap, mask, count in joint.cap_rows
                if row_cap == cap and (mask & shared_mask) == shared_mask
            )
            for cap in CAPS
        }
        _require(
            shared_by_cap[common_cap] == 0,
            f"class {joint.class_id} violates K-Q3-5 for {left},{right}",
        )
        _require(
            not (
                shared_by_cap[other_left] > 0
                and shared_by_cap[other_right] > 0
            ),
            f"class {joint.class_id} violates K-Q3-1 for {left},{right}",
        )

    triple_support = sum(mask == 7 for mask in joint.moser_masks)
    triple_support += sum(
        count for _cap, mask, count in joint.cap_rows if mask == 7
    )
    _require(
        triple_support <= 1,
        f"class {joint.class_id} violates the three-center C4 consequence",
    )


def parse_class_row(row: Mapping[str, Any]) -> JointClass:
    """Parse and independently replay all local cuts on one report row."""
    class_id = row.get("id")
    _require(_is_int(class_id), f"class row has invalid id {class_id!r}")
    context = f"class {class_id}"
    raw_key = row.get("class_key")
    _require(isinstance(raw_key, str), f"{context} has no string class key")
    _require(len(raw_key) == row.get("class_key_length"), f"{context} key length drift")
    key_sha256 = hashlib.sha256(raw_key.encode("utf-8")).hexdigest()
    _require(
        key_sha256 == row.get("class_key_sha256"),
        f"{context} key digest drift",
    )
    try:
        key = json.loads(raw_key)
    except json.JSONDecodeError as exc:
        raise SurfaceError(f"{context} has invalid class-key JSON") from exc
    _require(isinstance(key, list) and len(key) == 4, f"{context} key is malformed")
    _require(
        json.dumps(key, separators=(",", ":")) == raw_key,
        f"{context} key is not canonically serialized",
    )

    layer, participants, raw_moser_masks, raw_cap_rows = key
    _require(layer == "L2", f"{context} has unsupported layer {layer!r}")
    _require(participants == [0, 1, 2], f"{context} is not full-participant L2")
    _require(
        isinstance(raw_moser_masks, list) and len(raw_moser_masks) == 3,
        f"{context} has malformed Moser masks",
    )
    _require(
        all(_is_int(mask) and 0 <= mask <= 7 for mask in raw_moser_masks),
        f"{context} has an out-of-range Moser mask",
    )
    _require(isinstance(raw_cap_rows, list), f"{context} has malformed cap rows")

    cap_rows: list[tuple[str, int, int]] = []
    slots: set[tuple[str, int]] = set()
    previous_slot: tuple[int, int] | None = None
    for index, entry in enumerate(raw_cap_rows):
        _require(
            isinstance(entry, list) and len(entry) == 3,
            f"{context} cap row {index} is malformed",
        )
        cap, mask, count = entry
        _require(cap in CAPS, f"{context} cap row {index} has unknown cap")
        _require(
            _is_int(mask) and 1 <= mask <= 7,
            f"{context} cap row {index} has invalid mask",
        )
        _require(
            _is_int(count) and count > 0,
            f"{context} cap row {index} has nonpositive count",
        )
        slot = (cap, mask)
        _require(slot not in slots, f"{context} duplicates cap/mask slot {slot}")
        slots.add(slot)
        ordered_slot = (CAP_ORDER[cap], mask)
        _require(
            previous_slot is None or previous_slot < ordered_slot,
            f"{context} cap rows are not canonically ordered",
        )
        previous_slot = ordered_slot
        cap_rows.append((cap, mask, count))

    for field in ("first_n", "last_n"):
        _require(_is_int(row.get(field)), f"{context} has invalid {field}")
    first_n = int(row["first_n"])
    last_n = int(row["last_n"])
    seen = row.get("seen_n_values")
    _require(
        isinstance(seen, list) and all(_is_int(value) for value in seen),
        f"{context} has malformed seen_n_values",
    )
    _require(bool(seen), f"{context} was never seen")
    _require(
        seen == sorted(set(seen)),
        f"{context} has noncanonical seen_n_values",
    )
    _require(first_n == seen[0] and last_n == seen[-1], f"{context} n-range drift")
    _require(row.get("seen_count") == len(seen), f"{context} seen-count drift")
    statuses = row.get("status_counts")
    _require(isinstance(statuses, dict), f"{context} has malformed statuses")
    _require(
        statuses.get("SAT", 0) > 0
        and statuses.get("UNSAT") == 0
        and statuses.get("INDETERMINATE") == 0,
        f"{context} has a nonterminal or non-SAT source status",
    )

    joint = JointClass(
        class_id=class_id,
        class_key=raw_key,
        class_key_sha256=key_sha256,
        first_n=first_n,
        last_n=last_n,
        moser_masks=tuple(raw_moser_masks),
        cap_rows=tuple(cap_rows),
    )
    _validate_local_cuts(joint)
    return joint


def load_inventory(
    path: Path = DEFAULT_INVENTORY,
) -> tuple[dict[str, Any], tuple[JointClass, ...]]:
    """Load the pinned 3,375-row inventory and replay its fixed boundary."""
    try:
        with path.open(encoding="utf-8") as handle:
            report = json.load(handle)
    except (OSError, json.JSONDecodeError) as exc:
        raise SurfaceError(f"cannot load inventory {path}: {exc}") from exc
    _require(isinstance(report, dict), "inventory is not a JSON object")
    _require(report.get("schema") == SCHEMA, "inventory schema drift")
    _require(report.get("class_count") == EXPECTED_CLASS_COUNT, "class-count drift")
    _require(
        report.get("terminal_class_count") == EXPECTED_CLASS_COUNT,
        "terminal class-count drift",
    )
    _require(report.get("terminal_n") == 32, "terminal-n drift")
    _require(report.get("bad_class_rows") == [], "inventory reports bad class rows")
    claims = report.get("claims")
    _require(
        isinstance(claims, dict) and all(claims.values()),
        "inventory claims are not all true",
    )
    rows = report.get("rows")
    _require(isinstance(rows, list), "inventory rows are malformed")
    _require(len(rows) == EXPECTED_CLASS_COUNT, "inventory row-count drift")
    classes = tuple(parse_class_row(row) for row in rows)
    _require(
        [joint.class_id for joint in classes] == list(range(EXPECTED_CLASS_COUNT)),
        "class identifiers are not contiguous",
    )
    keys = [joint.class_key for joint in classes]
    _require(keys == sorted(keys), "class rows are not sorted by key")
    _require(len(set(keys)) == len(keys), "class keys are not unique")
    digest = _key_digest(keys)
    _require(digest == EXPECTED_INVENTORY_SHA256, "pinned inventory digest drift")
    _require(
        report.get("full_inventory_sha256") == digest
        and report.get("terminal_inventory_sha256") == digest,
        "report inventory digest drift",
    )
    return report, classes


def _multinomial_count(values: Sequence[int]) -> int:
    counts = Counter(values)
    result = math.factorial(len(values))
    for count in counts.values():
        result //= math.factorial(count)
    return result


def order_decoration_count(joint: JointClass) -> int:
    """Number of mask-distinct cap-block orders for one class."""
    result = 1
    for cap in CAPS:
        result *= _multinomial_count(joint.cap_masks(cap))
    return result


def canonical_decoration(joint: JointClass) -> OrderDecoration:
    return OrderDecoration(
        s=tuple(sorted(joint.cap_masks("S"))),
        o1=tuple(sorted(joint.cap_masks("O1"))),
        o2=tuple(sorted(joint.cap_masks("O2"))),
    )


def _unique_multiset_permutations(values: Sequence[int]) -> Iterator[tuple[int, ...]]:
    counts = Counter(values)
    keys = sorted(counts)
    length = len(values)

    def visit(prefix: list[int]) -> Iterator[tuple[int, ...]]:
        if len(prefix) == length:
            yield tuple(prefix)
            return
        for value in keys:
            if counts[value] == 0:
                continue
            counts[value] -= 1
            prefix.append(value)
            yield from visit(prefix)
            prefix.pop()
            counts[value] += 1

    yield from visit([])


def iter_order_decorations(joint: JointClass) -> Iterator[OrderDecoration]:
    """Lazily enumerate every membership-distinct global cap-block order."""
    blocks: dict[str, tuple[int, ...]] = {}

    def visit(cap_index: int) -> Iterator[OrderDecoration]:
        if cap_index == len(CAPS):
            yield OrderDecoration(blocks["S"], blocks["O1"], blocks["O2"])
            return
        cap = CAPS[cap_index]
        for order in _unique_multiset_permutations(joint.cap_masks(cap)):
            blocks[cap] = order
            yield from visit(cap_index + 1)
        blocks.pop(cap, None)

    yield from visit(0)


def _validate_decoration(joint: JointClass, order: OrderDecoration) -> None:
    for cap in CAPS:
        got = order.block(cap)
        _require(
            all(_is_int(mask) and 1 <= mask <= 7 for mask in got),
            f"class {joint.class_id} has an invalid order mask in {cap}",
        )
        _require(
            Counter(got) == Counter(joint.cap_masks(cap)),
            f"class {joint.class_id} order does not match the {cap} multiset",
        )


def expected_system_size(joint: JointClass) -> dict[str, int]:
    """Closed-form dimensions before constructing a SymPy system."""
    interior = joint.interior_point_count
    polygon_points = interior + 3
    return {
        "interior_points": interior,
        "polygon_points": polygon_points,
        "variables": 7 + 2 * interior,
        "equalities": 14,
        "weak_inequalities": interior + 3,
        "strict_inequalities": 4 + 3 * interior + math.comb(polygon_points, 3),
        "equality_separators": math.comb(polygon_points, 2) + 1,
    }


@dataclass
class _EqualityCore:
    cs: enc.CS
    u: tuple[Any, Any]
    v: tuple[Any, Any]
    w: tuple[Any, Any]
    circumcenter: tuple[Any, Any]
    radius2: Any
    class_radii: tuple[Any, Any, Any]
    block_points: dict[str, list[tuple[str, tuple[Any, Any], int]]]


def _build_equality_core(
    joint: JointClass, order: OrderDecoration
) -> _EqualityCore:
    _validate_decoration(joint, order)
    cs = enc.CS(f"atail_force_c{joint.class_id}")
    u = cs.point("v1")
    v = cs.fixed("v2", (enc.R0, enc.R0))
    w = cs.fixed("v3", (enc.R1, enc.R0))
    centers = (u, v, w)
    oy = cs.var("oy")
    circumcenter = (enc.HALF, oy)
    radius2 = cs.var("R2")
    class_radii = (cs.var("ru2"), cs.var("rv2"), cs.var("rw2"))

    cs.eqs.append(sp.expand(enc.d2(u, circumcenter) - radius2))
    cs.eqs.append(sp.expand(enc.d2(v, circumcenter) - radius2))

    for anchor, mask in zip(centers, joint.moser_masks):
        for center in CENTERS:
            if _has(mask, center):
                cs.eqs.append(
                    sp.expand(enc.d2(anchor, centers[center]) - class_radii[center])
                )

    block_points: dict[str, list[tuple[str, tuple[Any, Any], int]]] = {}
    for cap in CAPS:
        points = []
        prefix = CAP_POINT_PREFIX[cap]
        for index, mask in enumerate(order.block(cap), start=1):
            name = f"{prefix}{index}"
            point = cs.point(name)
            points.append((name, point, mask))
            for center in CENTERS:
                if _has(mask, center):
                    cs.eqs.append(
                        sp.expand(
                            enc.d2(point, centers[center]) - class_radii[center]
                        )
                    )
        block_points[cap] = points

    expected = expected_system_size(joint)
    _require(len(cs.vars) == expected["variables"], "equality variable-count drift")
    _require(len(cs.eqs) == expected["equalities"], "equality-count drift")
    return _EqualityCore(
        cs=cs,
        u=u,
        v=v,
        w=w,
        circumcenter=circumcenter,
        radius2=radius2,
        class_radii=class_radii,
        block_points=block_points,
    )


def _cyclic_sequence(
    core: _EqualityCore,
) -> list[tuple[str, tuple[Any, Any]]]:
    return (
        [("v2", core.v)]
        + [
            (name, point)
            for name, point, _mask in core.block_points["S"]
        ]
        + [("v3", core.w)]
        + [
            (name, point)
            for name, point, _mask in core.block_points["O1"]
        ]
        + [("v1", core.u)]
        + [
            (name, point)
            for name, point, _mask in core.block_points["O2"]
        ]
    )


def build_system(joint: JointClass, order: OrderDecoration) -> enc.CS:
    """Build one exact global-order window for K(U), K(V), and K(W)."""
    core = _build_equality_core(joint, order)
    cs = core.cs
    u, v, w = core.u, core.v, core.w
    block_points = core.block_points
    radius2 = core.radius2
    circumcenter = core.circumcenter

    cs.gt.extend([radius2, *core.class_radii])
    for cap in CAPS:
        for _name, point, _mask in block_points[cap]:
            cs.ge.append(sp.expand(radius2 - enc.d2(point, circumcenter)))
            enc.add_cap_signs(cs, point, CAP_OWN_INDEX[cap], u, v, w)

    cs.ge.append(sp.expand(enc.dot(enc.sub(v, u), enc.sub(w, u))))
    cs.ge.append(sp.expand(enc.dot(enc.sub(w, v), enc.sub(u, v))))
    cs.ge.append(sp.expand(enc.dot(enc.sub(u, w), enc.sub(v, w))))

    sequence = _cyclic_sequence(core)
    enc.add_convex_order(cs, [point for _name, point in sequence])

    expected = expected_system_size(joint)
    actual = {
        "variables": len(cs.vars),
        "equalities": len(cs.eqs),
        "weak_inequalities": len(cs.ge),
        "strict_inequalities": len(cs.gt),
    }
    _require(
        all(actual[field] == expected[field] for field in actual),
        f"class {joint.class_id} system-size drift: {actual} != {expected}",
    )
    cs.meta = {
        "schema": "p97_atail_force_three_center_system.v1",
        "class_id": joint.class_id,
        "class_key_sha256": joint.class_key_sha256,
        "order": order.as_json(),
        "sigma": [name for name, _point in sequence],
        **expected,
    }
    return cs


def build_equality_system(
    joint: JointClass, order: OrderDecoration
) -> enc.CS:
    """Return the shared exact 14-equation core without inequalities."""
    core = _build_equality_core(joint, order)
    cs = core.cs
    expected = expected_system_size(joint)
    cs.meta = {
        "schema": "p97_atail_force_three_center_equality_system.v1",
        "class_id": joint.class_id,
        "class_key_sha256": joint.class_key_sha256,
        "order": order.as_json(),
        "sigma": [name for name, _point in _cyclic_sequence(core)],
        **expected,
        "weak_inequalities": 0,
        "strict_inequalities": 0,
    }
    return cs


def collapsed_equilateral_substitution(
    joint: JointClass, order: OrderDecoration
) -> dict[str, sp.Expr]:
    """Exact Q(sqrt(3)) solution of the bare equations, with collisions.

    Put U,V,W at a unit equilateral triangle and all three class radii at
    one. Since K-Q3-5 removes mask 7, every interior membership mask omits a
    Moser vertex; placing that support point at an omitted vertex satisfies
    all of its selected-class distance equations. The points are deliberately
    allowed to collide, so this is not a separator or inequality witness.
    """
    _validate_decoration(joint, order)
    sqrt_three = sp.sqrt(3)
    centers = {
        0: (sp.Rational(1, 2), sqrt_three / 2),
        1: (sp.Integer(0), sp.Integer(0)),
        2: (sp.Integer(1), sp.Integer(0)),
    }
    substitutions: dict[str, sp.Expr] = {
        "v1x": centers[0][0],
        "v1y": centers[0][1],
        "oy": sqrt_three / 6,
        "R2": sp.Rational(1, 3),
        "ru2": sp.Integer(1),
        "rv2": sp.Integer(1),
        "rw2": sp.Integer(1),
    }
    for cap in CAPS:
        prefix = CAP_POINT_PREFIX[cap]
        for index, mask in enumerate(order.block(cap), start=1):
            omitted = next(center for center in CENTERS if not _has(mask, center))
            point = centers[omitted]
            substitutions[f"{prefix}{index}x"] = point[0]
            substitutions[f"{prefix}{index}y"] = point[1]
    return substitutions


def verify_equalities(
    cs: enc.CS,
    substitutions: Mapping[str, sp.Expr],
) -> tuple[bool, list[dict[str, Any]]]:
    """Replay every equality in exact SymPy arithmetic."""
    required = {str(variable) for variable in cs.vars}
    if set(substitutions) != required:
        return False, [
            {
                "kind": "variable_mismatch",
                "missing": sorted(required - set(substitutions)),
                "extra": sorted(set(substitutions) - required),
            }
        ]
    symbol_substitutions = {
        sp.Symbol(name, real=True): value for name, value in substitutions.items()
    }
    failures = []
    for index, equation in enumerate(cs.eqs):
        value = sp.simplify(sp.expand(equation.subs(symbol_substitutions)))
        if value != 0:
            failures.append(
                {"kind": "equality", "index": index, "value": str(value)}
            )
    return not failures, failures


def equality_separators(cs: enc.CS) -> list[sp.Expr]:
    """Pairwise distinctness and triangle nondegeneracy for ideal solvers."""
    points = list(cs.points.values())
    separators = [
        sp.expand(enc.d2(left, right)) for left, right in combinations(points, 2)
    ]
    separators.append(
        sp.expand(enc.sA2(cs.points["v2"], cs.points["v3"], cs.points["v1"]))
    )
    return separators
