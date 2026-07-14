"""Enumerate the formalized metric cores present in one proposed row set.

The older CEGAR scanners intentionally return the first recognized core.  That
is the right interface for pruning, but it throws away useful producer-bank
information: one expensive exact-oracle witness can contain several already
formalized obstructions.  This module exposes the complementary all-match
interface.

The scanner is discovery infrastructure, not a proof checker.  Every returned
record names the Lean consumer which justifies accepting that core.  A matcher
result without a consumer is rejected rather than silently banked.
"""

from __future__ import annotations

import importlib.util
import json
from functools import lru_cache
from pathlib import Path
from types import ModuleType
from typing import Any, Callable, Mapping, Sequence

from census.global_confinement import metric_realizability_probe as metric


MetricRow = metric.MetricRow
CoreRecord = dict[str, Any]

_ROOT = Path(__file__).resolve().parents[2]
_COMMON_SYSTEM_PROBE = _ROOT / "scratch" / "atail-force" / (
    "common_system_metric_probe.py"
)

_GENERIC_METRIC_CONSUMER = (
    "Problem97.Census554.false_of_metricCoreAlternative"
)


class MissingLeanConsumerError(ValueError):
    """A recognized core cannot be accepted without a named Lean consumer."""


def _validate_order(n: int, order: Sequence[int]) -> tuple[int, ...]:
    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("order is not a permutation of the ambient labels")
    return cyclic_order


def _json_value(value: Any) -> Any:
    """Return a deterministic JSON-compatible copy of matcher output."""

    if isinstance(value, Mapping):
        return {
            str(key): _json_value(value[key])
            for key in sorted(value, key=lambda item: str(item))
        }
    if isinstance(value, (tuple, list)):
        return [_json_value(item) for item in value]
    if isinstance(value, (str, int, float, bool)) or value is None:
        return value
    raise TypeError(f"core metadata is not JSON-compatible: {type(value)!r}")


def canonical_core_record(
    match: Mapping[str, Any],
    *,
    source: str,
    orientation: str | None = None,
    lean_consumer: str | None = None,
) -> CoreRecord:
    """Normalize one recognized match and enforce proof-consumer metadata."""

    stage = str(match.get("stage", ""))
    if not stage:
        raise ValueError("recognized core is missing its stage")
    if "core" not in match:
        raise ValueError(f"recognized core {stage!r} is missing its payload")

    consumer = lean_consumer or match.get("lean_consumer")
    if not isinstance(consumer, str) or not consumer:
        raise MissingLeanConsumerError(
            f"recognized accepted core {stage!r} has no Lean consumer"
        )

    resolved_orientation = orientation
    if resolved_orientation is None:
        resolved_orientation = match.get("cyclic_orientation")
    if resolved_orientation is None:
        resolved_orientation = "invariant"
    if resolved_orientation not in {"invariant", "forward", "reverse"}:
        raise ValueError(
            f"recognized core {stage!r} has invalid orientation "
            f"{resolved_orientation!r}"
        )

    reserved = {
        "stage",
        "core",
        "lean_consumer",
        "cyclic_orientation",
        "orientation",
        "source",
    }
    record: CoreRecord = {
        "stage": stage,
        "core": _json_value(match["core"]),
        "orientation": resolved_orientation,
        # Keep the established checkpoint spelling as well as the public,
        # geometry-neutral field above.
        "cyclic_orientation": resolved_orientation,
        "lean_consumer": consumer,
        "source": source,
    }
    metadata = {
        key: _json_value(value)
        for key, value in match.items()
        if key not in reserved
    }
    if metadata:
        record["metadata"] = _json_value(metadata)
    return record


def _record_key(record: Mapping[str, Any]) -> str:
    semantic = {
        "stage": record["stage"],
        "core": record["core"],
        "orientation": record["orientation"],
        "lean_consumer": record["lean_consumer"],
    }
    return json.dumps(semantic, sort_keys=True, separators=(",", ":"))


@lru_cache(maxsize=1)
def _load_common_system_probe() -> ModuleType:
    """Load the established scratch matcher bank without copying its logic."""

    spec = importlib.util.spec_from_file_location(
        "atail_force_common_system_metric_probe", _COMMON_SYSTEM_PROBE
    )
    if spec is None or spec.loader is None:
        raise ImportError(f"cannot load matcher bank {_COMMON_SYSTEM_PROBE}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def _metric_bank_matches(
    rows: Sequence[MetricRow],
    n: int,
    order: tuple[int, ...],
    *,
    include_extended: bool,
    include_ordered: bool,
) -> list[CoreRecord]:
    closure = metric._row_equality_closure(n, rows)
    closure_index = metric._closure_circle_index(closure, n)

    checks: list[tuple[str, Callable[[], Mapping[str, int] | None], str]] = [
        (
            "equality-duplicate-center",
            lambda: metric._duplicate_center_core_from_closure(
                closure, n, index=closure_index
            ),
            "invariant",
        ),
        (
            "equality-exact-off-circle",
            lambda: metric._exact_off_circle_core_from_closure(
                rows, closure, n, index=closure_index
            ),
            "invariant",
        ),
        (
            "equality-perpendicular-bisector-convex",
            lambda: metric._perpendicular_bisector_core_from_closure(
                closure, n, index=closure_index
            ),
            "invariant",
        ),
    ]

    if include_extended:
        extended = (
            ("equality-equal-k4", "_equal_k4_core_from_closure"),
            (
                "equality-equilateral-bisector-collision",
                "_equilateral_bisector_collision_core_from_closure",
            ),
            ("equality-three-triad-collision", "_three_triad_collision_core_from_closure"),
            (
                "equality-surplus-source-collision",
                "_surplus_source_collision_core_from_closure",
            ),
            ("equality-six-row-anchor-collision", "_six_row_anchor_collision_core_from_closure"),
            (
                "equality-six-point-two-pair-collision",
                "_six_point_two_pair_collision_core_from_closure",
            ),
            (
                "equality-six-point-five-circle-collision-a",
                "_six_point_five_circle_collision_core_a_from_closure",
            ),
            (
                "equality-six-point-five-circle-collision-b",
                "_six_point_five_circle_collision_core_b_from_closure",
            ),
            (
                "equality-six-point-five-circle-collision-c",
                "_six_point_five_circle_collision_core_c_from_closure",
            ),
            (
                "equality-seven-point-five-circle-collision",
                "_seven_point_five_circle_collision_core_from_closure",
            ),
            (
                "equality-eight-point-five-circle-collision",
                "_eight_point_five_circle_collision_core_from_closure",
            ),
            (
                "equality-six-point-circle-chain-collision",
                "_six_point_circle_chain_collision_core_from_closure",
            ),
            (
                "equality-seven-point-six-circle-collision",
                "_seven_point_six_circle_collision_core_from_closure",
            ),
            (
                "equality-seven-point-six-circle-collision-b",
                "_seven_point_six_circle_collision_core_b_from_closure",
            ),
            (
                "equality-seven-point-twin-four-circle-collision",
                "_seven_point_twin_four_circle_collision_core_from_closure",
            ),
            (
                "equality-seven-point-orbit-collision",
                "_seven_point_orbit_collision_core_from_closure",
            ),
            (
                "equality-seven-point-circle-network-collision",
                "_seven_point_circle_network_collision_core_from_closure",
            ),
        )
        for stage, function_name in extended:
            matcher = getattr(metric, function_name)
            checks.append(
                (
                    stage,
                    lambda matcher=matcher: matcher(
                        closure, n, index=closure_index
                    ),
                    "invariant",
                )
            )

    if include_ordered:
        reverse_order = tuple(reversed(order))
        ordered = (
            (
                "equality-convex-five-point",
                metric._five_point_bisector_circle_core_from_closure,
            ),
            (
                "equality-convex-rhombus-equilateral",
                metric._convex_rhombus_equilateral_core_from_closure,
            ),
            (
                "equality-convex-eight-point-five-row-circle-intersection-order",
                metric._five_row_circle_intersection_order_core_from_closure,
            ),
        )
        for stage, matcher in ordered:
            checks.append(
                (
                    stage,
                    lambda matcher=matcher: matcher(
                        closure, n, order, index=closure_index
                    ),
                    "forward",
                )
            )
            checks.append(
                (
                    f"{stage}-reverse",
                    lambda matcher=matcher: matcher(
                        closure, n, reverse_order, index=closure_index
                    ),
                    "reverse",
                )
            )

    records: list[CoreRecord] = []
    for stage, find_core, orientation in checks:
        core = find_core()
        if core is None:
            continue
        consumer = _GENERIC_METRIC_CONSUMER
        if stage.startswith("equality-convex-five-point"):
            consumer = (
                "Problem97.Census554.ConvexFivePointCore.false_of_core"
                if orientation == "forward"
                else "Problem97.Census554.ConvexFivePointCore.false_of_core_of_neg"
            )
        elif stage.startswith("equality-convex-rhombus-equilateral"):
            consumer = (
                "Problem97.Census554.ConvexRhombusCore.false_of_core"
                if orientation == "forward"
                else "Problem97.Census554.ConvexRhombusCore.false_of_core_of_neg"
            )
        elif stage.startswith(
            "equality-convex-eight-point-five-row-circle-intersection-order"
        ):
            consumer = (
                "Problem97.Census554.FiveRowCircleIntersectionOrderCore.false_of_core"
                if orientation == "forward"
                else (
                    "Problem97.Census554.FiveRowCircleIntersectionOrderCore."
                    "false_of_core_of_neg"
                )
            )
        records.append(
            canonical_core_record(
                {"stage": stage, "core": core},
                source="metric-bank",
                orientation=orientation,
                lean_consumer=consumer,
            )
        )
    return records


_COMMON_ORDERED_MATCHERS = (
    (
        "six_point_two_circle_arc_overtake_order_core",
        "equality-convex-six-point-two-circle-arc-overtake-order-reverse",
        "Problem97.Census554.SixPointTwoCircleArcOvertakeOrderCore.false_of_core_of_neg",
    ),
    (
        "six_point_nested_center_order_core",
        "equality-convex-six-point-nested-center-order-reverse",
        "Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core_of_neg",
    ),
    (
        "six_point_two_circle_order_core",
        "equality-convex-six-point-two-circle-order-reverse",
        "Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core_of_neg",
    ),
    (
        "six_point_circle_chain_order_core",
        "equality-convex-six-point-circle-chain-order-reverse",
        "Problem97.Census554.SixPointCircleChainOrderCore.false_of_core_of_neg",
    ),
    (
        "six_point_circle_chain_wrap_order_core",
        "equality-convex-six-point-circle-chain-wrap-order-reverse",
        "Problem97.Census554.SixPointCircleChainWrapOrderCore.false_of_core_of_neg",
    ),
    (
        "seven_point_split_bridge_order_core",
        "equality-convex-seven-point-split-bridge-order-reverse",
        "Problem97.Census554.SevenPointSplitBridgeOrderCore.false_of_core_of_neg",
    ),
    (
        "seven_point_split_bridge_tail_order_core",
        "equality-convex-seven-point-split-bridge-tail-order-reverse",
        "Problem97.Census554.SevenPointSplitBridgeTailOrderCore.false_of_core_of_neg",
    ),
    (
        "four_point_two_circle_bisector_order_core",
        "equality-convex-four-point-two-circle-bisector-order-reverse",
        "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
    ),
    (
        "five_row_circle_intersection_order_core",
        "equality-convex-eight-point-five-row-circle-intersection-order-reverse",
        "Problem97.Census554.FiveRowCircleIntersectionOrderCore.false_of_core_of_neg",
    ),
)


def _common_system_matches(
    rows: Sequence[MetricRow], n: int, order: tuple[int, ...]
) -> list[CoreRecord]:
    bank = _load_common_system_probe()
    records: list[CoreRecord] = []

    nested = bank.nested_equal_chord_core(rows, n, order)
    if nested is not None:
        records.append(
            canonical_core_record(
                nested, source="common-system-bank", orientation="invariant"
            )
        )

    reverse_order = tuple(reversed(order))
    for function_name, reverse_stage, reverse_consumer in _COMMON_ORDERED_MATCHERS:
        matcher = getattr(bank, function_name)
        forward = matcher(rows, n, order)
        if forward is not None:
            records.append(
                canonical_core_record(
                    forward, source="common-system-bank", orientation="forward"
                )
            )
        reverse = matcher(rows, n, reverse_order)
        if reverse is not None:
            reverse_match = {
                **reverse,
                "stage": reverse_stage,
                "lean_consumer": reverse_consumer,
            }
            records.append(
                canonical_core_record(
                    reverse_match,
                    source="common-system-bank",
                    orientation="reverse",
                )
            )
    return records


def scan_all_formalized_cores(
    rows: Sequence[MetricRow],
    n: int,
    order: Sequence[int],
    *,
    include_extended: bool = True,
    include_ordered: bool = True,
    include_common_system: bool = True,
) -> tuple[CoreRecord, ...]:
    """Return every recognized formalized core family present in ``rows``.

    "Every" means every matcher family/orientation in the current metric and
    common-system banks.  Individual family matchers retain their established
    canonical first embedding; this wrapper does not enumerate automorphic
    copies of the same core.
    """

    cyclic_order = _validate_order(n, order)
    records = _metric_bank_matches(
        rows,
        n,
        cyclic_order,
        include_extended=include_extended,
        include_ordered=include_ordered,
    )
    if include_common_system:
        records.extend(_common_system_matches(rows, n, cyclic_order))

    unique: dict[str, CoreRecord] = {}
    for record in records:
        # Prefer the shared production metric-bank record when a scratch
        # matcher recognizes the identical semantic core afterwards.
        unique.setdefault(_record_key(record), record)
    return tuple(unique[key] for key in sorted(unique))


__all__ = [
    "CoreRecord",
    "MetricRow",
    "MissingLeanConsumerError",
    "canonical_core_record",
    "scan_all_formalized_cores",
]
