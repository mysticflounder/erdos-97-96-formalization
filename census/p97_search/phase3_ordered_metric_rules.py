"""Standalone ordered metric-rule records for the Phase-3 CEGAR coordinator.

This module does not learn SAT clauses and does not claim that its JSON records
have been checked by Lean.  It detects already-formalized ordered metric cores
over an explicit, caller-supplied complete list of compatible cyclic orders.
The emitted closure certificates use the existing cap-selected row-equality
exporter and validator.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from itertools import combinations
from typing import Any

from census.atail_force import producer_bank
from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric

SCHEMA = "p97-phase3-ordered-convex-rhombus-rule-v1"
RULE_ID = "ordered-convex-rhombus-equilateral"
FORWARD_STAGE = "equality-convex-rhombus-equilateral"
REVERSE_STAGE = "equality-convex-rhombus-equilateral-reverse"
LEAN_MODULE = "Erdos9796Proof.P97.Census554.ConvexRhombusCore"
LEAN_SOURCE = "lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean"
CORE_ROLES = ("a", "b", "c", "x", "y", "d")
ORIENTATIONS = ("forward", "reverse")
LEAN_CONSUMERS = (
    {
        "orientation": "forward",
        "stage": FORWARD_STAGE,
        "signed_area_case": "negative",
        "theorem": ("Problem97.Census554.ConvexRhombusCore.false_of_core_of_neg"),
    },
    {
        "orientation": "reverse",
        "stage": REVERSE_STAGE,
        "signed_area_case": "positive",
        "theorem": "Problem97.Census554.ConvexRhombusCore.false_of_core",
    },
)
PYTHON_TRUST_BOUNDARY = (
    "Python detection plus direct row-equality certificate replay only; the "
    "named Lean declarations are downstream consumers and are not invoked by "
    "this module"
)
COVERAGE_POLICY = (
    "the caller supplies the complete compatible cyclic-order enumeration; "
    "every supplied order is covered exactly once, without a reflection quotient"
)

CompatibleOrder = tuple[str, tuple[int, ...]]


class OrderedMetricRuleError(ValueError):
    """The ordered rule input or stored replay record is malformed."""


def _sha256_json(value: Any) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def _consumer(orientation: str) -> dict[str, str]:
    for consumer in LEAN_CONSUMERS:
        if consumer["orientation"] == orientation:
            return dict(consumer)
    raise OrderedMetricRuleError(f"unsupported orientation: {orientation}")


def _normalize_orders(
    compatible_orders: Sequence[tuple[str, Sequence[int]]],
    n: int,
    *,
    minimum_size: int = len(CORE_ROLES),
    core_label: str = "rhombus",
) -> tuple[CompatibleOrder, ...]:
    if type(n) is not int or n < minimum_size:
        raise OrderedMetricRuleError(
            f"ambient size is too small for the {core_label} core"
        )
    normalized: list[CompatibleOrder] = []
    seen_ids: set[str] = set()
    for raw_order_id, raw_order in compatible_orders:
        if not isinstance(raw_order_id, str) or not raw_order_id:
            raise OrderedMetricRuleError("compatible order id must be nonempty text")
        if raw_order_id in seen_ids:
            raise OrderedMetricRuleError("compatible order ids must be unique")
        order = tuple(raw_order)
        if (
            len(order) != n
            or any(type(label) is not int for label in order)
            or sorted(order) != list(range(n))
        ):
            raise OrderedMetricRuleError(
                f"compatible order {raw_order_id!r} is not a permutation"
            )
        seen_ids.add(raw_order_id)
        normalized.append((raw_order_id, order))
    if not normalized:
        raise OrderedMetricRuleError("compatible order enumeration is empty")
    return tuple(sorted(normalized))


def _detect_for_orientation(
    rows: Sequence[metric.MetricRow],
    n: int,
    order: Sequence[int],
    orientation: str,
) -> dict[str, Any] | None:
    consumer = _consumer(orientation)
    oriented_order = tuple(order)
    if orientation == "reverse":
        oriented_order = tuple(reversed(oriented_order))
    try:
        core = metric._convex_rhombus_equilateral_core(rows, n, oriented_order)
    except Exception as exc:
        raise OrderedMetricRuleError(f"convex-rhombus detector failed: {exc}") from exc
    if core is None:
        return None
    if (
        set(core) != set(CORE_ROLES)
        or any(type(label) is not int for label in core.values())
        or len(set(core.values())) != len(CORE_ROLES)
    ):
        raise OrderedMetricRuleError(
            "convex-rhombus detector returned a malformed core"
        )
    return {
        "orientation": orientation,
        "stage": consumer["stage"],
        "signed_area_case": consumer["signed_area_case"],
        "lean_theorem": consumer["theorem"],
        "core": dict(core),
    }


def detect_convex_rhombus(
    rows: Sequence[metric.MetricRow],
    n: int,
    order: Sequence[int],
    *,
    orientation: str = "forward",
) -> dict[str, Any] | None:
    """Detect one selected direction and attach its exact Lean-consumer metadata."""

    normalized = _normalize_orders((("order", order),), n)[0][1]
    return _detect_for_orientation(rows, n, normalized, orientation)


def _first_detection(
    rows: Sequence[metric.MetricRow], n: int, order: Sequence[int]
) -> dict[str, Any] | None:
    for orientation in ORIENTATIONS:
        detection = _detect_for_orientation(rows, n, order, orientation)
        if detection is not None:
            return detection
    return None


def build_convex_rhombus_order_record(
    rows: Sequence[metric.MetricRow],
    n: int,
    compatible_orders: Sequence[tuple[str, Sequence[int]]],
    *,
    closure_certificate_builder: Callable[..., dict[str, Any]] | None = None,
) -> dict[str, Any] | None:
    """Build a deterministic record only when every compatible order is covered."""

    orders = _normalize_orders(compatible_orders, n)
    build_closure = (
        certificates._certificate_for_detection
        if closure_certificate_builder is None
        else closure_certificate_builder
    )
    closure_by_hash: dict[str, dict[str, Any]] = {}
    coverage: list[dict[str, Any]] = []
    for order_id, order in orders:
        detection = _first_detection(rows, n, order)
        if detection is None:
            return None
        closure = build_closure(
            rows,
            n,
            {"stage": detection["stage"], "core": detection["core"]},
        )
        if certificates._validate_certificate(closure, n=n) is not True:
            raise OrderedMetricRuleError(
                "exported row-equality certificate failed direct replay"
            )
        proof_sha256 = closure.get("proof_sha256")
        if not isinstance(proof_sha256, str):
            raise OrderedMetricRuleError("closure certificate has no proof hash")
        old = closure_by_hash.setdefault(proof_sha256, closure)
        if old != closure:
            raise OrderedMetricRuleError("closure proof hash collision")
        coverage.append(
            {
                "order_id": order_id,
                "order": list(order),
                "orientation": detection["orientation"],
                "stage": detection["stage"],
                "signed_area_case": detection["signed_area_case"],
                "core": detection["core"],
                "closure_proof_sha256": proof_sha256,
                "lean_theorem": detection["lean_theorem"],
            }
        )

    order_stream = [
        {"order_id": order_id, "order": list(order)} for order_id, order in orders
    ]
    record: dict[str, Any] = {
        "schema": SCHEMA,
        "rule_id": RULE_ID,
        "n": n,
        "python_trust_boundary": PYTHON_TRUST_BOUNDARY,
        "coverage_policy": COVERAGE_POLICY,
        "lean_module": LEAN_MODULE,
        "lean_source": LEAN_SOURCE,
        "lean_consumers": [dict(consumer) for consumer in LEAN_CONSUMERS],
        "compatible_order_count": len(orders),
        "compatible_orders_sha256": _sha256_json(order_stream),
        "closure_certificates": [
            closure_by_hash[key] for key in sorted(closure_by_hash)
        ],
        "order_coverage": coverage,
        "order_coverage_sha256": _sha256_json(coverage),
    }
    record["record_sha256"] = _sha256_json(record)
    replay_convex_rhombus_order_record(rows, n, compatible_orders, record)
    return record


def replay_convex_rhombus_order_record(
    rows: Sequence[metric.MetricRow],
    n: int,
    compatible_orders: Sequence[tuple[str, Sequence[int]]],
    record: Mapping[str, Any],
) -> bool:
    """Replay identity, closure paths, theorem directions, and complete coverage."""

    expected_fields = {
        "schema",
        "rule_id",
        "n",
        "python_trust_boundary",
        "coverage_policy",
        "lean_module",
        "lean_source",
        "lean_consumers",
        "compatible_order_count",
        "compatible_orders_sha256",
        "closure_certificates",
        "order_coverage",
        "order_coverage_sha256",
        "record_sha256",
    }
    if set(record) != expected_fields:
        raise OrderedMetricRuleError("ordered metric-rule record fields mismatch")
    if (
        record["schema"] != SCHEMA
        or record["rule_id"] != RULE_ID
        or record["n"] != n
        or record["python_trust_boundary"] != PYTHON_TRUST_BOUNDARY
        or record["coverage_policy"] != COVERAGE_POLICY
        or record["lean_module"] != LEAN_MODULE
        or record["lean_source"] != LEAN_SOURCE
        or record["lean_consumers"] != [dict(consumer) for consumer in LEAN_CONSUMERS]
    ):
        raise OrderedMetricRuleError("ordered metric-rule identity mismatch")

    orders = _normalize_orders(compatible_orders, n)
    order_stream = [
        {"order_id": order_id, "order": list(order)} for order_id, order in orders
    ]
    if record["compatible_order_count"] != len(orders) or record[
        "compatible_orders_sha256"
    ] != _sha256_json(order_stream):
        raise OrderedMetricRuleError("compatible order universe mismatch")

    raw_closures = record["closure_certificates"]
    if not isinstance(raw_closures, list) or not raw_closures:
        raise OrderedMetricRuleError("closure certificate list is empty")
    closure_by_hash: dict[str, Mapping[str, Any]] = {}
    previous_hash: str | None = None
    for closure in raw_closures:
        if not isinstance(closure, Mapping):
            raise OrderedMetricRuleError("closure certificate is not an object")
        proof_sha256 = closure.get("proof_sha256")
        if (
            not isinstance(proof_sha256, str)
            or (previous_hash is not None and proof_sha256 <= previous_hash)
            or proof_sha256 in closure_by_hash
            or closure.get("stage") not in {FORWARD_STAGE, REVERSE_STAGE}
            or certificates._validate_certificate(closure, n=n) is not True
        ):
            raise OrderedMetricRuleError("closure certificate replay failed")
        closure_by_hash[proof_sha256] = closure
        previous_hash = proof_sha256

    coverage = record["order_coverage"]
    if (
        not isinstance(coverage, list)
        or len(coverage) != len(orders)
        or record["order_coverage_sha256"] != _sha256_json(coverage)
    ):
        raise OrderedMetricRuleError("order coverage count or hash mismatch")
    used_closures: set[str] = set()
    entry_fields = {
        "order_id",
        "order",
        "orientation",
        "stage",
        "signed_area_case",
        "core",
        "closure_proof_sha256",
        "lean_theorem",
    }
    for entry, (order_id, order) in zip(coverage, orders, strict=True):
        if not isinstance(entry, Mapping) or set(entry) != entry_fields:
            raise OrderedMetricRuleError("order coverage entry fields mismatch")
        if entry["order_id"] != order_id or entry["order"] != list(order):
            raise OrderedMetricRuleError("order coverage enumeration mismatch")
        expected = _first_detection(rows, n, order)
        if expected is None:
            raise OrderedMetricRuleError("stored order is no longer covered")
        for field in (
            "orientation",
            "stage",
            "signed_area_case",
            "core",
            "lean_theorem",
        ):
            if entry[field] != expected[field]:
                raise OrderedMetricRuleError(
                    f"order coverage {field} metadata mismatch"
                )
        proof_sha256 = entry["closure_proof_sha256"]
        closure = closure_by_hash.get(proof_sha256)
        if (
            closure is None
            or closure.get("stage") != expected["stage"]
            or closure.get("core") != expected["core"]
        ):
            raise OrderedMetricRuleError("order coverage closure mismatch")
        used_closures.add(proof_sha256)
    if used_closures != set(closure_by_hash):
        raise OrderedMetricRuleError("record contains unused closure certificates")

    payload = dict(record)
    record_sha256 = payload.pop("record_sha256")
    if record_sha256 != _sha256_json(payload):
        raise OrderedMetricRuleError("ordered metric-rule payload hash mismatch")
    return True


KALMANSON_SCHEMA = (
    "p97-phase3-ordered-five-point-three-selected-row-kalmanson-rule-v1"
)
KALMANSON_RULE_ID = "ordered-five-point-three-selected-row-kalmanson"
KALMANSON_STAGE = "equality-convex-five-point-three-selected-row-kalmanson"
KALMANSON_LEAN_MODULE = "Erdos9796Proof.P97.ATail.CapCrossingKalmanson"
KALMANSON_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean"
)
KALMANSON_LEAN_THEOREM = (
    "Problem97.CapCrossingKalmansonBridge."
    "false_of_selected_rows_in_five_ccw_order"
)
KALMANSON_CORE_ROLES = ("O", "A", "Y", "E", "C")
KALMANSON_ROW_ROLES = ("Y", "O", "A")
KALMANSON_DIRECT_SUPPORT_ROLES = {
    "Y": ("O", "E"),
    "O": ("E", "C"),
    "A": ("C", "O"),
}
KALMANSON_PYTHON_TRUST_BOUNDARY = (
    "Python direct selected-row detection and deterministic replay only; "
    "the named Lean declaration is metadata and is not invoked by this module"
)
KALMANSON_COVERAGE_POLICY = (
    "the caller supplies the complete compatible cyclic-order enumeration; "
    "every supplied order is replayed in its forward CCW orientation, including "
    "all within-fiber permutations and all boundary rotations"
)


def _normalize_kalmanson_rows(
    rows: Sequence[metric.MetricRow], n: int
) -> tuple[metric.MetricRow, ...]:
    normalized = tuple(sorted(rows, key=lambda row: (row.center, row.support)))
    if not normalized:
        raise OrderedMetricRuleError("Kalmanson row list is empty")
    centers: set[int] = set()
    for row in normalized:
        if (
            type(row.center) is not int
            or row.center < 0
            or row.center >= n
            or len(row.support) != 4
            or len(set(row.support)) != 4
            or any(
                type(point) is not int or point < 0 or point >= n
                for point in row.support
            )
            or row.center in row.support
            or row.center in centers
        ):
            raise OrderedMetricRuleError(
                "Kalmanson rows must be distinct-center four-point rows"
            )
        centers.add(row.center)
    return normalized


def _kalmanson_pair_bit(left: int, right: int, n: int) -> int:
    if left == right:
        raise OrderedMetricRuleError("Kalmanson support pair has equal endpoints")
    first, second = sorted((left, right))
    return 1 << (first * n + second)


@dataclass(frozen=True, slots=True)
class KalmansonOrderPositionIndex:
    """Compile fixed row supports for repeated selected-row detection."""

    n: int
    centers: tuple[int, ...]
    support_pair_masks: tuple[int, ...]
    position_quads: tuple[tuple[int, ...], ...]

    @classmethod
    def from_rows(
        cls, rows: Sequence[metric.MetricRow], n: int
    ) -> KalmansonOrderPositionIndex:
        normalized = _normalize_kalmanson_rows(rows, n)
        support_pair_masks = []
        for row in normalized:
            support_pair_masks.append(
                sum(
                    _kalmanson_pair_bit(left, right, n)
                    for left, right in combinations(row.support, 2)
                )
            )
        return cls(
            n=n,
            centers=tuple(row.center for row in normalized),
            support_pair_masks=tuple(support_pair_masks),
            position_quads=tuple(combinations(range(1, n), 4)),
        )

    def detect(
        self, row_mask: int, order: Sequence[int]
    ) -> dict[str, Any] | None:
        all_rows = (1 << len(self.centers)) - 1
        if (
            type(row_mask) is not int
            or row_mask <= 0
            or row_mask & ~all_rows
        ):
            raise OrderedMetricRuleError("Kalmanson row mask is malformed")
        normalized_order = _normalize_orders(
            [("order", order)],
            self.n,
            minimum_size=len(KALMANSON_CORE_ROLES),
            core_label="five-point selected-row Kalmanson",
        )[0][1]
        supports_by_center = [0] * self.n
        for index, center in enumerate(self.centers):
            if row_mask & (1 << index):
                supports_by_center[center] |= self.support_pair_masks[index]

        def contains_pair(center: int, left: int, right: int) -> bool:
            return bool(
                supports_by_center[center]
                & _kalmanson_pair_bit(left, right, self.n)
            )

        for start in range(self.n):
            rotated = normalized_order[start:] + normalized_order[:start]
            point_o = rotated[0]
            for positions in self.position_quads:
                point_a, point_y, point_e, point_c = (
                    rotated[position] for position in positions
                )
                if not contains_pair(point_y, point_o, point_e):
                    continue
                if not contains_pair(point_o, point_e, point_c):
                    continue
                if not contains_pair(point_a, point_c, point_o):
                    continue
                core = {
                    "O": point_o,
                    "A": point_a,
                    "Y": point_y,
                    "E": point_e,
                    "C": point_c,
                }
                direct_pairs: dict[str, list[int]] = {}
                row_centers: dict[str, int] = {}
                for row_role, pair_roles in KALMANSON_DIRECT_SUPPORT_ROLES.items():
                    center = core[row_role]
                    pair = [core[role] for role in pair_roles]
                    if not contains_pair(center, pair[0], pair[1]):
                        raise OrderedMetricRuleError(
                            "direct selected-row Kalmanson support replay failed"
                        )
                    row_centers[row_role] = center
                    direct_pairs[row_role] = pair
                return {
                    "orientation": "forward",
                    "stage": KALMANSON_STAGE,
                    "lean_theorem": KALMANSON_LEAN_THEOREM,
                    "core": core,
                    "core_role_order": list(KALMANSON_CORE_ROLES),
                    "boundary_rotation_start": start,
                    "requires_rotated_ccw_enumeration": start != 0,
                    "row_centers": row_centers,
                    "direct_support_pairs": direct_pairs,
                }
        return None


def detect_selected_row_kalmanson(
    rows: Sequence[metric.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Detect the direct three-row Lean consumer on one forward CCW order."""

    normalized_rows = _normalize_kalmanson_rows(rows, n)
    normalized_order = _normalize_orders(
        [("order", order)],
        n,
        minimum_size=len(KALMANSON_CORE_ROLES),
        core_label="five-point selected-row Kalmanson",
    )[0][1]
    try:
        detected = producer_bank._direct_five_point_three_selected_row_kalmanson_core(
            normalized_rows, normalized_order
        )
    except Exception as exc:
        raise OrderedMetricRuleError(
            f"direct selected-row Kalmanson detector failed: {exc}"
        ) from exc
    if detected is None:
        return None
    core, rotation_start = detected
    if (
        set(core) != set(KALMANSON_CORE_ROLES)
        or any(type(point) is not int for point in core.values())
        or len(set(core.values())) != len(KALMANSON_CORE_ROLES)
        or type(rotation_start) is not int
        or not 0 <= rotation_start < n
    ):
        raise OrderedMetricRuleError(
            "direct selected-row Kalmanson detector returned malformed data"
        )
    rows_by_center = {row.center: row for row in normalized_rows}
    direct_pairs: dict[str, list[int]] = {}
    row_centers: dict[str, int] = {}
    for row_role, pair_roles in KALMANSON_DIRECT_SUPPORT_ROLES.items():
        center = core[row_role]
        pair = [core[role] for role in pair_roles]
        row = rows_by_center.get(center)
        if row is None or not set(pair).issubset(row.support):
            raise OrderedMetricRuleError(
                "direct selected-row Kalmanson support replay failed"
            )
        row_centers[row_role] = center
        direct_pairs[row_role] = pair
    rotated = (
        normalized_order[rotation_start:] + normalized_order[:rotation_start]
    )
    role_positions = [rotated.index(core[role]) for role in KALMANSON_CORE_ROLES]
    if role_positions != sorted(role_positions) or role_positions[0] != 0:
        raise OrderedMetricRuleError(
            "direct selected-row Kalmanson order replay failed"
        )
    return {
        "orientation": "forward",
        "stage": KALMANSON_STAGE,
        "lean_theorem": KALMANSON_LEAN_THEOREM,
        "core": dict(core),
        "core_role_order": list(KALMANSON_CORE_ROLES),
        "boundary_rotation_start": rotation_start,
        "requires_rotated_ccw_enumeration": rotation_start != 0,
        "row_centers": row_centers,
        "direct_support_pairs": direct_pairs,
    }


def minimize_selected_row_kalmanson_rows(
    rows: Sequence[metric.MetricRow],
    n: int,
    compatible_orders: Sequence[tuple[str, Sequence[int]]],
    *,
    detector: Callable[
        [Sequence[metric.MetricRow], int, Sequence[int]], dict[str, Any] | None
    ] | None = None,
) -> tuple[tuple[metric.MetricRow, ...], dict[str, Any]] | None:
    """Find the first exact-cardinality row subset covering every order."""

    normalized_rows = _normalize_kalmanson_rows(rows, n)
    orders = _normalize_orders(
        compatible_orders,
        n,
        minimum_size=len(KALMANSON_CORE_ROLES),
        core_label="five-point selected-row Kalmanson",
    )
    detect = detect_selected_row_kalmanson if detector is None else detector
    for size in range(3, len(normalized_rows) + 1):
        for candidate in combinations(normalized_rows, size):
            detections = [
                detect(candidate, n, order)
                for _order_id, order in orders
            ]
            if all(detection is not None for detection in detections):
                stream = [
                    {
                        "order_id": order_id,
                        "core": detection["core"],
                        "boundary_rotation_start": detection[
                            "boundary_rotation_start"
                        ],
                        "row_centers": detection["row_centers"],
                    }
                    for (order_id, _order), detection in zip(
                        orders, detections, strict=True
                    )
                ]
                return tuple(candidate), {
                    "method": (
                        "exact-cardinality-then-lexicographic-row-subset-enumeration"
                    ),
                    "source_row_count": len(normalized_rows),
                    "retained_row_count": len(candidate),
                    "retained_rows": [row.as_dict() for row in candidate],
                    "compatible_order_count": len(orders),
                    "compatible_order_coverage_sha256": _sha256_json(stream),
                }
    return None


def build_selected_row_kalmanson_order_record(
    rows: Sequence[metric.MetricRow],
    n: int,
    compatible_orders: Sequence[tuple[str, Sequence[int]]],
    *,
    detector: Callable[
        [Sequence[metric.MetricRow], int, Sequence[int]], dict[str, Any] | None
    ] | None = None,
) -> dict[str, Any] | None:
    """Build a direct-row record iff the bound rows cover every order."""

    normalized_rows = _normalize_kalmanson_rows(rows, n)
    orders = _normalize_orders(
        compatible_orders,
        n,
        minimum_size=len(KALMANSON_CORE_ROLES),
        core_label="five-point selected-row Kalmanson",
    )
    detect = detect_selected_row_kalmanson if detector is None else detector
    coverage: list[dict[str, Any]] = []
    for order_id, order in orders:
        detected = detect(normalized_rows, n, order)
        if detected is None:
            return None
        coverage.append(
            {"order_id": order_id, "order": list(order), **detected}
        )
    order_stream = [
        {"order_id": order_id, "order": list(order)} for order_id, order in orders
    ]
    record: dict[str, Any] = {
        "schema": KALMANSON_SCHEMA,
        "rule_id": KALMANSON_RULE_ID,
        "n": n,
        "python_trust_boundary": KALMANSON_PYTHON_TRUST_BOUNDARY,
        "coverage_policy": KALMANSON_COVERAGE_POLICY,
        "lean_module": KALMANSON_LEAN_MODULE,
        "lean_source": KALMANSON_LEAN_SOURCE,
        "lean_theorem": KALMANSON_LEAN_THEOREM,
        "selected_rows": [row.as_dict() for row in normalized_rows],
        "compatible_order_count": len(orders),
        "compatible_orders_sha256": _sha256_json(order_stream),
        "order_coverage": coverage,
        "order_coverage_sha256": _sha256_json(coverage),
    }
    record["record_sha256"] = _sha256_json(record)
    replay_selected_row_kalmanson_order_record(
        normalized_rows, n, compatible_orders, record
    )
    return record


def replay_selected_row_kalmanson_order_record(
    rows: Sequence[metric.MetricRow],
    n: int,
    compatible_orders: Sequence[tuple[str, Sequence[int]]],
    record: Mapping[str, Any],
) -> bool:
    """Replay direct row incidences, exact roles, rotations, and all orders."""

    normalized_rows = _normalize_kalmanson_rows(rows, n)
    expected_fields = {
        "schema",
        "rule_id",
        "n",
        "python_trust_boundary",
        "coverage_policy",
        "lean_module",
        "lean_source",
        "lean_theorem",
        "selected_rows",
        "compatible_order_count",
        "compatible_orders_sha256",
        "order_coverage",
        "order_coverage_sha256",
        "record_sha256",
    }
    if set(record) != expected_fields:
        raise OrderedMetricRuleError("Kalmanson ordered-rule fields mismatch")
    if (
        record["schema"] != KALMANSON_SCHEMA
        or record["rule_id"] != KALMANSON_RULE_ID
        or record["n"] != n
        or record["python_trust_boundary"] != KALMANSON_PYTHON_TRUST_BOUNDARY
        or record["coverage_policy"] != KALMANSON_COVERAGE_POLICY
        or record["lean_module"] != KALMANSON_LEAN_MODULE
        or record["lean_source"] != KALMANSON_LEAN_SOURCE
        or record["lean_theorem"] != KALMANSON_LEAN_THEOREM
        or record["selected_rows"]
        != [row.as_dict() for row in normalized_rows]
    ):
        raise OrderedMetricRuleError("Kalmanson ordered-rule identity mismatch")
    orders = _normalize_orders(
        compatible_orders,
        n,
        minimum_size=len(KALMANSON_CORE_ROLES),
        core_label="five-point selected-row Kalmanson",
    )
    order_stream = [
        {"order_id": order_id, "order": list(order)} for order_id, order in orders
    ]
    if record["compatible_order_count"] != len(orders) or record[
        "compatible_orders_sha256"
    ] != _sha256_json(order_stream):
        raise OrderedMetricRuleError("Kalmanson compatible-order universe mismatch")
    coverage = record["order_coverage"]
    if (
        not isinstance(coverage, list)
        or len(coverage) != len(orders)
        or record["order_coverage_sha256"] != _sha256_json(coverage)
    ):
        raise OrderedMetricRuleError("Kalmanson order coverage count or hash mismatch")
    for entry, (order_id, order) in zip(coverage, orders, strict=True):
        expected = detect_selected_row_kalmanson(normalized_rows, n, order)
        if expected is None:
            raise OrderedMetricRuleError("stored Kalmanson order is no longer covered")
        if entry != {"order_id": order_id, "order": list(order), **expected}:
            raise OrderedMetricRuleError("Kalmanson order coverage metadata mismatch")
    payload = dict(record)
    record_sha256 = payload.pop("record_sha256")
    if record_sha256 != _sha256_json(payload):
        raise OrderedMetricRuleError("Kalmanson ordered-rule payload hash mismatch")
    return True
