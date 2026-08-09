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
from collections import Counter, deque
from collections.abc import Callable, Mapping, Sequence
from functools import lru_cache
from itertools import combinations, permutations
from pathlib import Path
from types import ModuleType
from typing import Any

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

_FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_CONSUMER = (
    "Problem97.CapCrossingKalmansonBridge."
    "false_of_selected_rows_in_five_ccw_order"
)
_FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_SOURCE = _ROOT / (
    "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean"
)
_FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_MODULE = (
    "Erdos9796Proof.P97.ATail.CapCrossingKalmanson"
)

_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_CONSUMER = (
    "Problem97.CapCrossingKalmansonBridge."
    "false_of_four_selected_rows_in_seven_ccw_order_C"
)
_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_REVERSE_CONSUMER = (
    "Problem97.CapCrossingKalmansonBridge."
    "false_of_four_selected_rows_in_seven_ccw_order_C_of_decreasing"
)
_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE = _ROOT / (
    "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean"
)
_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_MODULE = (
    "Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas"
)
_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_F_CONSUMERS = (
    (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_four_selected_rows_in_seven_ccw_order_F"
    ),
    (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_four_selected_rows_in_seven_ccw_order_F_of_decreasing"
    ),
)

_SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_SOURCE = (
    _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE
)
_SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_MODULE = (
    _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_MODULE
)
_SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_CONSUMERS = {
    "d": (
        (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_six_ccw_order_D"
        ),
        (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_six_ccw_order_D_of_decreasing"
        ),
    ),
    "e": (
        (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_six_ccw_order_E"
        ),
        (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_six_ccw_order_E_of_decreasing"
        ),
    ),
    "g": (
        (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_six_ccw_order_G"
        ),
        (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_six_ccw_order_G_of_decreasing"
        ),
    ),
}

_TWO_KALMANSON_CANCELLATION_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)
_TWO_KALMANSON_CANCELLATION_SOURCE = _ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "GenericRowNogoodCertificate.lean"
)
_TWO_KALMANSON_CANCELLATION_MODULE = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "GenericRowNogoodCertificate"
)
_WEIGHTED_KALMANSON_CANCELLATION_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_weightedKalmansonCancellationData_of_check"
)
_WEIGHTED_KALMANSON_CANCELLATION_SOURCE = (
    _TWO_KALMANSON_CANCELLATION_SOURCE
)
_WEIGHTED_KALMANSON_CANCELLATION_MODULE = (
    _TWO_KALMANSON_CANCELLATION_MODULE
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


def _direct_five_point_three_selected_row_kalmanson_core(
    rows: Sequence[MetricRow], order: tuple[int, ...]
) -> tuple[dict[str, int], int] | None:
    """Find the first forward-CCW direct-row Kalmanson terminal.

    For five cyclically ordered roles ``O < A < Y < E < C``, the checked Lean
    adapter consumes one selected row at each of ``Y``, ``O``, and ``A`` with
    direct support pairs ``{O, E}``, ``{E, C}``, and ``{C, O}``, respectively.
    This matcher deliberately does not inspect the transitive metric-equality
    closure and does not scan the reversed cyclic order.  A nonzero returned
    rotation index is a producer obligation: the Lean caller must construct
    the corresponding rotated CCW enumeration before applying the consumer's
    linear ``Fin`` index inequalities.
    """

    supports_by_center: dict[int, list[frozenset[int]]] = {}
    for row in rows:
        supports_by_center.setdefault(row.center, []).append(
            frozenset(row.support)
        )

    def contains_pair(center: int, left: int, right: int) -> bool:
        pair = {left, right}
        return any(
            pair <= support
            for support in supports_by_center.get(center, ())
        )

    for start in range(len(order)):
        rotated = order[start:] + order[:start]
        point_o = rotated[0]
        for positions in combinations(range(1, len(rotated)), 4):
            point_a, point_y, point_e, point_c = (
                rotated[position] for position in positions
            )
            if not contains_pair(point_y, point_o, point_e):
                continue
            if not contains_pair(point_o, point_e, point_c):
                continue
            if not contains_pair(point_a, point_c, point_o):
                continue
            return (
                {
                    "O": point_o,
                    "A": point_a,
                    "Y": point_y,
                    "E": point_e,
                    "C": point_c,
                },
                start,
            )
    return None


def _require_five_point_three_selected_row_kalmanson_consumer() -> None:
    """Fail closed if the production Lean consumer is absent from source."""

    if not _FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_SOURCE.is_file():
        raise MissingLeanConsumerError(
            "missing production Kalmanson selected-row consumer module"
        )
    source = _FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_SOURCE.read_text(
        encoding="utf-8"
    )
    required_source_fragments = (
        "namespace Problem97",
        "namespace CapCrossingKalmansonBridge",
        "theorem false_of_selected_rows_in_five_ccw_order",
    )
    if any(fragment not in source for fragment in required_source_fragments):
        raise MissingLeanConsumerError(
            "production Kalmanson module does not declare the selected-row "
            "consumer"
        )


def _direct_seven_point_four_selected_row_kalmanson_c_core(
    rows: Sequence[MetricRow], order: tuple[int, ...]
) -> tuple[dict[str, int], int] | None:
    """Find the first direct-row occurrence of seven-point schema C.

    For cyclically ordered roles ``a < b < c < d < e < f < g``, schema C
    requires direct selected-row incidences

    * row ``a`` contains ``{f, b}``;
    * row ``f`` contains ``{a, d, g}``;
    * row ``c`` contains ``{d, g}``; and
    * row ``e`` contains ``{f, b}``.

    Only the supplied row supports are inspected.  In particular, equality
    closure cannot manufacture one of the four selected rows consumed by the
    checked Lean adapter.
    """

    supports_by_center: dict[int, list[frozenset[int]]] = {}
    for row in rows:
        supports_by_center.setdefault(row.center, []).append(
            frozenset(row.support)
        )

    def contains(center: int, points: set[int]) -> bool:
        return any(
            points <= support
            for support in supports_by_center.get(center, ())
        )

    for start in range(len(order)):
        rotated = order[start:] + order[:start]
        for positions in combinations(range(len(rotated)), 7):
            point_a, point_b, point_c, point_d, point_e, point_f, point_g = (
                rotated[position] for position in positions
            )
            if not contains(point_a, {point_f, point_b}):
                continue
            if not contains(point_f, {point_a, point_d, point_g}):
                continue
            if not contains(point_c, {point_d, point_g}):
                continue
            if not contains(point_e, {point_f, point_b}):
                continue
            return (
                {
                    "a": point_a,
                    "b": point_b,
                    "c": point_c,
                    "d": point_d,
                    "e": point_e,
                    "f": point_f,
                    "g": point_g,
                },
                start,
            )
    return None


def _require_seven_point_four_selected_row_kalmanson_c_consumers() -> None:
    """Fail closed unless both orientation adapters exist in Lean source."""

    if not _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE.is_file():
        raise MissingLeanConsumerError(
            "missing production seven-point Kalmanson schema-C module"
        )
    source = _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE.read_text(
        encoding="utf-8"
    )
    required_source_fragments = (
        "namespace Problem97",
        "namespace CapCrossingKalmansonBridge",
        "theorem false_of_four_selected_rows_in_seven_ccw_order_C",
        (
            "theorem "
            "false_of_four_selected_rows_in_seven_ccw_order_C_of_decreasing"
        ),
    )
    if any(fragment not in source for fragment in required_source_fragments):
        raise MissingLeanConsumerError(
            "production seven-point Kalmanson schema-C module does not "
            "declare both selected-row consumers"
        )


def _direct_seven_point_four_selected_row_kalmanson_f_core(
    rows: Sequence[MetricRow], order: tuple[int, ...]
) -> tuple[dict[str, int], int] | None:
    """Find a direct-row occurrence of seven-point schema F."""

    supports_by_center: dict[int, list[frozenset[int]]] = {}
    for row in rows:
        supports_by_center.setdefault(row.center, []).append(
            frozenset(row.support)
        )

    def contains(center: int, points: set[int]) -> bool:
        return any(
            points <= support
            for support in supports_by_center.get(center, ())
        )

    for start in range(len(order)):
        rotated = order[start:] + order[:start]
        for positions in combinations(range(len(rotated)), 7):
            point_a, point_b, point_c, point_d, point_e, point_f, point_g = (
                rotated[position] for position in positions
            )
            if not contains(point_a, {point_f, point_c}):
                continue
            if not contains(point_f, {point_a, point_g, point_c}):
                continue
            if not contains(point_b, {point_f, point_e}):
                continue
            if not contains(point_d, {point_b, point_e, point_g}):
                continue
            return (
                {
                    "a": point_a,
                    "b": point_b,
                    "c": point_c,
                    "d": point_d,
                    "e": point_e,
                    "f": point_f,
                    "g": point_g,
                },
                start,
            )
    return None


def _require_seven_point_four_selected_row_kalmanson_f_consumers() -> None:
    """Fail closed unless both schema-F orientation adapters exist."""

    source_path = _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE
    if not source_path.is_file():
        raise MissingLeanConsumerError(
            "missing production seven-point Kalmanson schema-F module"
        )
    source = source_path.read_text(encoding="utf-8")
    required_source_fragments = (
        "namespace Problem97",
        "namespace CapCrossingKalmansonBridge",
        "theorem false_of_four_selected_rows_in_seven_ccw_order_F",
        (
            "theorem "
            "false_of_four_selected_rows_in_seven_ccw_order_F_of_decreasing"
        ),
    )
    if any(fragment not in source for fragment in required_source_fragments):
        raise MissingLeanConsumerError(
            "production seven-point Kalmanson schema-F module does not "
            "declare both selected-row consumers"
        )


def _direct_six_point_four_selected_row_kalmanson_core(
    rows: Sequence[MetricRow], order: tuple[int, ...], *, schema: str
) -> tuple[dict[str, int], int] | None:
    """Find a direct-row occurrence of six-point schema D, E, or G."""

    supports_by_center: dict[int, list[frozenset[int]]] = {}
    for row in rows:
        supports_by_center.setdefault(row.center, []).append(
            frozenset(row.support)
        )

    def contains(center: int, points: set[int]) -> bool:
        return any(
            points <= support
            for support in supports_by_center.get(center, ())
        )

    for start in range(len(order)):
        rotated = order[start:] + order[:start]
        for positions in combinations(range(len(rotated)), 6):
            point_a, point_b, point_c, point_d, point_e, point_f = (
                rotated[position] for position in positions
            )
            if schema == "d":
                matched = (
                    contains(point_a, {point_e, point_b})
                    and contains(point_e, {point_a, point_c, point_f})
                    and contains(point_b, {point_e, point_f})
                    and contains(point_d, {point_e, point_b, point_c})
                )
            elif schema == "e":
                matched = (
                    contains(point_a, {point_f, point_d})
                    and contains(point_e, {point_b, point_c})
                    and contains(point_b, {point_a, point_c, point_d})
                    and contains(point_c, {point_f, point_b})
                )
            elif schema == "g":
                matched = (
                    contains(point_a, {point_b, point_d})
                    and contains(point_b, {point_c, point_f})
                    and contains(point_c, {point_b, point_d})
                    and contains(point_e, {point_c, point_f})
                )
            else:
                raise ValueError(f"unknown six-point Kalmanson schema {schema!r}")
            if matched:
                return (
                    {
                        "a": point_a,
                        "b": point_b,
                        "c": point_c,
                        "d": point_d,
                        "e": point_e,
                        "f": point_f,
                    },
                    start,
                )
    return None


def _require_six_point_four_selected_row_kalmanson_consumers() -> None:
    """Fail closed unless all schema-D/E/G orientation adapters exist."""

    if not _SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_SOURCE.is_file():
        raise MissingLeanConsumerError(
            "missing production six-point Kalmanson schema module"
        )
    source = _SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_SOURCE.read_text(
        encoding="utf-8"
    )
    required_source_fragments = (
        "namespace Problem97",
        "namespace CapCrossingKalmansonBridge",
        "theorem false_of_four_selected_rows_in_six_ccw_order_D",
        "theorem false_of_four_selected_rows_in_six_ccw_order_D_of_decreasing",
        "theorem false_of_four_selected_rows_in_six_ccw_order_E",
        "theorem false_of_four_selected_rows_in_six_ccw_order_E_of_decreasing",
        "theorem false_of_four_selected_rows_in_six_ccw_order_G",
        "theorem false_of_four_selected_rows_in_six_ccw_order_G_of_decreasing",
    )
    if any(fragment not in source for fragment in required_source_fragments):
        raise MissingLeanConsumerError(
            "production six-point Kalmanson module does not declare all "
            "schema-D/E/G selected-row consumers"
        )


def _require_two_kalmanson_cancellation_consumer() -> None:
    """Fail closed unless the generic checked cancellation consumer exists."""

    if not _TWO_KALMANSON_CANCELLATION_SOURCE.is_file():
        raise MissingLeanConsumerError(
            "missing production two-Kalmanson cancellation module"
        )
    source = _TWO_KALMANSON_CANCELLATION_SOURCE.read_text(encoding="utf-8")
    required_source_fragments = (
        "namespace Problem97",
        "namespace ATailFrontierLiveClosure",
        "namespace GenericRowNogoodCertificate",
        "structure TwoKalmansonCancellationData",
        "theorem false_of_twoKalmansonCancellationData_of_check",
    )
    if any(fragment not in source for fragment in required_source_fragments):
        raise MissingLeanConsumerError(
            "production generic row-nogood module does not declare the "
            "checked two-Kalmanson cancellation consumer"
        )


def _require_weighted_kalmanson_cancellation_consumer() -> None:
    """Fail closed unless the generic checked weighted consumer exists."""

    if not _WEIGHTED_KALMANSON_CANCELLATION_SOURCE.is_file():
        raise MissingLeanConsumerError(
            "missing production weighted Kalmanson cancellation module"
        )
    source = _WEIGHTED_KALMANSON_CANCELLATION_SOURCE.read_text(
        encoding="utf-8"
    )
    required_source_fragments = (
        "namespace Problem97",
        "namespace ATailFrontierLiveClosure",
        "namespace GenericRowNogoodCertificate",
        "structure WeightedKalmansonTerm",
        "structure WeightedKalmansonCancellationData",
        "theorem false_of_weightedKalmansonCancellationData_of_check",
    )
    if any(fragment not in source for fragment in required_source_fragments):
        raise MissingLeanConsumerError(
            "production generic row-nogood module does not declare the "
            "checked weighted Kalmanson cancellation consumer"
        )


def _oriented_equality_path(
    rows: Sequence[MetricRow],
    n: int,
    first: tuple[int, int],
    last: tuple[int, int],
) -> dict[str, Any] | None:
    """Return a deterministic primitive row/flip path between two edges."""

    if first == last:
        return {"first": list(first), "steps": [], "last": list(last)}

    adjacency: dict[
        tuple[int, int],
        list[tuple[tuple[int, int], dict[str, Any]]],
    ] = {
        (left, right): []
        for left in range(n)
        for right in range(n)
        if left != right
    }
    for (left, right), neighbors in adjacency.items():
        neighbors.append(
            (
                (right, left),
                {"kind": "flip", "first": left, "second": right},
            )
        )
    for row in sorted(rows, key=lambda item: (item.center, item.support)):
        support = tuple(sorted(set(row.support)))
        for source in support:
            for target in support:
                if source == target:
                    continue
                adjacency[(row.center, source)].append(
                    (
                        (row.center, target),
                        {
                            "kind": "row",
                            "center": row.center,
                            "first": source,
                            "second": target,
                        },
                    )
                )
    for neighbors in adjacency.values():
        neighbors.sort(
            key=lambda item: (
                item[0],
                item[1]["kind"],
                tuple(item[1].get(key, -1) for key in (
                    "center", "first", "second"
                )),
            )
        )

    previous: dict[
        tuple[int, int],
        tuple[tuple[int, int], dict[str, Any]],
    ] = {}
    queue = deque([first])
    seen = {first}
    while queue:
        source = queue.popleft()
        for target, step in adjacency[source]:
            if target in seen:
                continue
            seen.add(target)
            previous[target] = (source, step)
            if target == last:
                queue.clear()
                break
            queue.append(target)
    if last not in seen:
        return None

    steps: list[dict[str, Any]] = []
    cursor = last
    while cursor != first:
        cursor, step = previous[cursor]
        steps.append(step)
    steps.reverse()
    return {"first": list(first), "steps": steps, "last": list(last)}


def _kalmanson_edges(
    quad: tuple[int, int, int, int], form: str
) -> tuple[tuple[tuple[int, int], tuple[int, int]], tuple[tuple[int, int], tuple[int, int]]]:
    a, b, c, d = quad
    if form == "adjacentSides":
        left = ((a, b), (c, d))
    elif form == "innerOuter":
        left = ((b, c), (a, d))
    else:
        raise ValueError(f"unknown Kalmanson form {form!r}")
    return left, ((a, c), (b, d))


def _two_kalmanson_cancellation_core(
    rows: Sequence[MetricRow], n: int, order: tuple[int, ...]
) -> dict[str, Any] | None:
    """Find two strict Kalmanson inequalities cancelling via row equality."""

    position = {label: index for index, label in enumerate(order)}
    indexed_rows = tuple(
        MetricRow(
            position[row.center],
            tuple(sorted(position[point] for point in set(row.support))),
            exact=row.exact,
        )
        for row in rows
    )
    closure = metric._row_equality_closure(n, indexed_rows)

    inequalities: list[
        tuple[
            tuple[int, int, int, int],
            str,
            tuple[tuple[int, int], tuple[int, int]],
            tuple[tuple[int, int], tuple[int, int]],
            tuple[tuple[tuple[int, int], int], ...],
        ]
    ] = []
    by_delta: dict[
        tuple[tuple[tuple[int, int], int], ...],
        int,
    ] = {}
    match_indices: tuple[int, int] | None = None
    for quad in combinations(range(n), 4):
        for form in ("adjacentSides", "innerOuter"):
            left, right = _kalmanson_edges(quad, form)
            left_roots = [closure.find(metric._edge(*edge)) for edge in left]
            right_roots = [closure.find(metric._edge(*edge)) for edge in right]
            delta = Counter(left_roots)
            delta.subtract(right_roots)
            signature = tuple(
                sorted((root, count) for root, count in delta.items() if count)
            )
            index = len(inequalities)
            inequalities.append((quad, form, left, right, signature))
            opposite = tuple((root, -count) for root, count in signature)
            if opposite in by_delta:
                match_indices = (by_delta[opposite], index)
                break
            by_delta.setdefault(signature, index)
        if match_indices is not None:
            break
    if match_indices is None:
        return None

    first = inequalities[match_indices[0]]
    second = inequalities[match_indices[1]]
    left_edges = (*first[2], *second[2])
    right_edges = (*first[3], *second[3])
    left_roots = [closure.find(metric._edge(*edge)) for edge in left_edges]
    right_roots = [closure.find(metric._edge(*edge)) for edge in right_edges]
    permutation = next(
        (
            candidate
            for candidate in permutations(range(4))
            if all(
                left_roots[index] == right_roots[candidate[index]]
                for index in range(4)
            )
        ),
        None,
    )
    if permutation is None:
        raise AssertionError("opposite Kalmanson deltas lack a slot permutation")

    paths = [
        _oriented_equality_path(
            indexed_rows, n, left_edges[index], right_edges[permutation[index]]
        )
        for index in range(4)
    ]
    if any(path is None for path in paths):
        raise AssertionError("closure-equivalent edges lack an equality path")

    row_choices = [
        {"center": row.center, "support": list(row.support)}
        for row in sorted(
            {
                (row.center, row.support): row
                for row in indexed_rows
            }.values(),
            key=lambda item: (item.center, item.support),
        )
    ]
    return {
        "first_quad": list(first[0]),
        "first_form": first[1],
        "second_quad": list(second[0]),
        "second_form": second[1],
        "permutation": list(permutation),
        "paths": paths,
        "row_choices": row_choices,
        "boundary_labels": list(order),
    }


def _two_kalmanson_path_checks(
    choices: Sequence[Mapping[str, Any]],
    path: Mapping[str, Any],
    first: tuple[int, int],
    last: tuple[int, int],
    n: int,
) -> bool:
    """Mirror ``GenericRowNogoodCertificate.checkPath`` on serialized data."""

    def edge(value: Any) -> tuple[int, int] | None:
        if not isinstance(value, (list, tuple)) or len(value) != 2:
            return None
        if any(isinstance(item, bool) or not isinstance(item, int) for item in value):
            return None
        result = (value[0], value[1])
        return result if all(0 <= item < n for item in result) else None

    if not isinstance(path, Mapping):
        return False
    cursor = edge(path.get("first"))
    stated_last = edge(path.get("last"))
    steps = path.get("steps")
    if cursor != first or stated_last != last or not isinstance(steps, list):
        return False
    for step in steps:
        if not isinstance(step, Mapping):
            return False
        kind = step.get("kind")
        if kind == "flip":
            source = edge((step.get("first"), step.get("second")))
            if source is None or cursor != source:
                return False
            cursor = (source[1], source[0])
        elif kind == "row":
            source = edge((step.get("center"), step.get("first")))
            target = edge((step.get("center"), step.get("second")))
            if source is None or target is None or cursor != source:
                return False
            if not any(
                choice["center"] == source[0]
                and source[1] in choice["support"]
                and target[1] in choice["support"]
                for choice in choices
            ):
                return False
            cursor = target
        else:
            return False
    return cursor == stated_last


def certify_two_kalmanson_cancellation(
    rows: Sequence[MetricRow],
    n: int,
    order: Sequence[int],
    proposed_core: Mapping[str, Any],
) -> CoreRecord:
    """Exactly replay one serialized two-Kalmanson Lean certificate.

    Unlike the discovery matcher, this checks the proposed quads, permutation,
    row choices, and all four primitive paths themselves.  A different core of
    the same theorem-bank family cannot authenticate this certificate.
    """

    cyclic_order = _validate_order(n, order)
    if not isinstance(proposed_core, Mapping):
        raise TypeError("two-Kalmanson certificate core is not an object")
    if proposed_core.get("boundary_labels") != list(cyclic_order):
        raise ValueError("two-Kalmanson boundary labels do not match the order")

    position = {label: index for index, label in enumerate(cyclic_order)}
    try:
        indexed_rows = tuple(
            MetricRow(
                position[row.center],
                tuple(sorted(position[point] for point in set(row.support))),
                exact=row.exact,
            )
            for row in rows
        )
    except KeyError as error:
        raise ValueError("row contains a label outside the cyclic order") from error

    choices_value = proposed_core.get("row_choices")
    if not isinstance(choices_value, list) or not choices_value:
        raise ValueError("two-Kalmanson certificate has no row choices")
    choices: list[dict[str, Any]] = []
    for value in choices_value:
        if not isinstance(value, Mapping):
            raise TypeError("malformed two-Kalmanson row choice")
        center = value.get("center")
        support = value.get("support")
        if (
            isinstance(center, bool)
            or not isinstance(center, int)
            or not 0 <= center < n
            or not isinstance(support, list)
            or not support
            or any(
                isinstance(point, bool)
                or not isinstance(point, int)
                or not 0 <= point < n
                for point in support
            )
            or len(set(support)) != len(support)
        ):
            raise ValueError("malformed two-Kalmanson row choice")
        canonical_support = sorted(support)
        if center in canonical_support:
            raise ValueError("two-Kalmanson row choice contains its center")
        if not any(
            row.center == center and set(canonical_support) <= set(row.support)
            for row in indexed_rows
        ):
            raise ValueError("two-Kalmanson row choice is not a positive source row")
        choices.append({"center": center, "support": canonical_support})
    if choices != sorted(
        { (choice["center"], tuple(choice["support"])): choice for choice in choices }.values(),
        key=lambda choice: (choice["center"], choice["support"]),
    ):
        raise ValueError("two-Kalmanson row choices are not canonical")

    def quad(name: str) -> tuple[int, int, int, int]:
        value = proposed_core.get(name)
        if (
            not isinstance(value, list)
            or len(value) != 4
            or any(isinstance(item, bool) or not isinstance(item, int) for item in value)
        ):
            raise ValueError(f"malformed two-Kalmanson {name}")
        result = tuple(value)
        if not all(0 <= result[index] < result[index + 1] < n for index in range(3)):
            raise ValueError(f"two-Kalmanson {name} is not strictly increasing")
        return result

    first_quad = quad("first_quad")
    second_quad = quad("second_quad")
    first_form = proposed_core.get("first_form")
    second_form = proposed_core.get("second_form")
    first_edges = _kalmanson_edges(first_quad, first_form)
    second_edges = _kalmanson_edges(second_quad, second_form)
    left_edges = (*first_edges[0], *second_edges[0])
    right_edges = (*first_edges[1], *second_edges[1])

    permutation = proposed_core.get("permutation")
    if (
        not isinstance(permutation, list)
        or len(permutation) != 4
        or any(isinstance(item, bool) or not isinstance(item, int) for item in permutation)
        or sorted(permutation) != [0, 1, 2, 3]
    ):
        raise ValueError("malformed two-Kalmanson permutation")
    paths = proposed_core.get("paths")
    if not isinstance(paths, list) or len(paths) != 4:
        raise ValueError("two-Kalmanson certificate does not have four paths")
    if not all(
        _two_kalmanson_path_checks(
            choices,
            paths[index],
            left_edges[index],
            right_edges[permutation[index]],
            n,
        )
        for index in range(4)
    ):
        raise ValueError("two-Kalmanson primitive path check failed")

    _require_two_kalmanson_cancellation_consumer()
    checked_core = {
        "first_quad": list(first_quad),
        "first_form": first_form,
        "second_quad": list(second_quad),
        "second_form": second_form,
        "permutation": list(permutation),
        "paths": _json_value(paths),
        "row_choices": choices,
        "boundary_labels": list(cyclic_order),
    }
    return canonical_core_record(
        {
            "stage": "equality-convex-two-kalmanson-cancellation",
            "core": checked_core,
            "lean_module": _TWO_KALMANSON_CANCELLATION_MODULE,
        },
        source="metric-bank-equality-closure",
        orientation="forward",
        lean_consumer=_TWO_KALMANSON_CANCELLATION_CONSUMER,
    )


def enumerate_two_kalmanson_cancellations(
    rows: Sequence[MetricRow],
    n: int,
    order: Sequence[int],
    *,
    max_cores: int = 10_000,
) -> tuple[CoreRecord, ...]:
    """Enumerate every distinct checked two-Kalmanson certificate in ``rows``.

    The legacy matcher deliberately returns the first hit.  This theorem-mining
    interface groups all strict inequalities by their equality-closure delta,
    pairs every opposite group, and retains every valid slot permutation.  The
    explicit bound prevents an unexpectedly dense closure from becoming an
    accidental unbounded production computation.
    """

    if max_cores <= 0:
        raise ValueError("max_cores must be positive")
    cyclic_order = _validate_order(n, order)
    position = {label: index for index, label in enumerate(cyclic_order)}
    try:
        indexed_rows = tuple(
            MetricRow(
                position[row.center],
                tuple(sorted(position[point] for point in set(row.support))),
                exact=row.exact,
            )
            for row in rows
        )
    except KeyError as error:
        raise ValueError("row contains a label outside the cyclic order") from error
    closure = metric._row_equality_closure(n, indexed_rows)

    inequalities: list[
        tuple[
            tuple[int, int, int, int],
            str,
            tuple[tuple[int, int], tuple[int, int]],
            tuple[tuple[int, int], tuple[int, int]],
            tuple[tuple[tuple[int, int], int], ...],
        ]
    ] = []
    by_delta: dict[
        tuple[tuple[tuple[int, int], int], ...],
        list[int],
    ] = {}
    for quad_value in combinations(range(n), 4):
        for form in ("adjacentSides", "innerOuter"):
            left, right = _kalmanson_edges(quad_value, form)
            delta = Counter(
                closure.find(metric._edge(*edge_value)) for edge_value in left
            )
            delta.subtract(
                closure.find(metric._edge(*edge_value)) for edge_value in right
            )
            signature = tuple(
                sorted((root, count) for root, count in delta.items() if count)
            )
            index = len(inequalities)
            inequalities.append((quad_value, form, left, right, signature))
            by_delta.setdefault(signature, []).append(index)

    row_choices = [
        {"center": row.center, "support": list(row.support)}
        for row in sorted(
            {
                (row.center, row.support): row
                for row in indexed_rows
            }.values(),
            key=lambda item: (item.center, item.support),
        )
    ]
    unique: dict[str, CoreRecord] = {}
    for signature in sorted(by_delta):
        opposite = tuple((root, -count) for root, count in signature)
        if opposite not in by_delta or signature > opposite:
            continue
        for first_index in by_delta[signature]:
            for second_index in by_delta[opposite]:
                if signature == opposite and first_index >= second_index:
                    continue
                first = inequalities[first_index]
                second = inequalities[second_index]
                left_edges = (*first[2], *second[2])
                right_edges = (*first[3], *second[3])
                left_roots = [
                    closure.find(metric._edge(*edge_value))
                    for edge_value in left_edges
                ]
                right_roots = [
                    closure.find(metric._edge(*edge_value))
                    for edge_value in right_edges
                ]
                for permutation in permutations(range(4)):
                    if not all(
                        left_roots[index] == right_roots[permutation[index]]
                        for index in range(4)
                    ):
                        continue
                    paths = [
                        _oriented_equality_path(
                            indexed_rows,
                            n,
                            left_edges[index],
                            right_edges[permutation[index]],
                        )
                        for index in range(4)
                    ]
                    if any(path is None for path in paths):
                        raise AssertionError(
                            "closure-equivalent edges lack an equality path"
                        )
                    core = {
                        "first_quad": list(first[0]),
                        "first_form": first[1],
                        "second_quad": list(second[0]),
                        "second_form": second[1],
                        "permutation": list(permutation),
                        "paths": paths,
                        "row_choices": row_choices,
                        "boundary_labels": list(cyclic_order),
                    }
                    record = certify_two_kalmanson_cancellation(
                        rows, n, cyclic_order, core
                    )
                    unique.setdefault(_record_key(record), record)
                    if len(unique) > max_cores:
                        raise ValueError(
                            "two-Kalmanson enumeration exceeded max_cores="
                            f"{max_cores}"
                        )
    return tuple(unique[key] for key in sorted(unique))


def _weighted_kalmanson_cancellation_core(
    rows: Sequence[MetricRow],
    n: int,
    order: tuple[int, ...],
    terms: Sequence[Mapping[str, Any]],
) -> dict[str, Any] | None:
    """Exactly check a proposed positive weighted Kalmanson cancellation.

    Discovery of the terms and weights is deliberately outside this function.
    This checker independently validates cyclic order, positive integral
    weights, equality-closure balance, and a primitive row/flip path for every
    repeated distance occurrence.
    """

    if not terms:
        raise ValueError("weighted Kalmanson certificate has no terms")
    position = {label: index for index, label in enumerate(order)}
    indexed_rows = tuple(
        MetricRow(
            position[row.center],
            tuple(sorted(position[point] for point in set(row.support))),
            exact=row.exact,
        )
        for row in rows
    )
    closure = metric._row_equality_closure(n, indexed_rows)

    checked_terms: list[dict[str, Any]] = []
    left_edges: list[tuple[int, int]] = []
    right_edges: list[tuple[int, int]] = []
    for term in terms:
        try:
            quad_labels = tuple(int(label) for label in term["quad"])
            form = str(term["form"])
            weight = int(term["weight"])
        except (KeyError, TypeError, ValueError) as error:
            raise ValueError(f"malformed weighted Kalmanson term: {term!r}") from error
        if len(quad_labels) != 4 or len(set(quad_labels)) != 4:
            raise ValueError(f"term quad is not four distinct labels: {term!r}")
        if any(label not in position for label in quad_labels):
            raise ValueError(f"term quad contains a non-boundary label: {term!r}")
        quad = tuple(position[label] for label in quad_labels)
        if tuple(sorted(quad)) != quad:
            raise ValueError(f"term quad is not in the declared cyclic order: {term!r}")
        if weight <= 0:
            raise ValueError(f"term weight is not positive: {term!r}")
        left, right = _kalmanson_edges(quad, form)
        for edge_value in left:
            left_edges.extend([edge_value] * weight)
        for edge_value in right:
            right_edges.extend([edge_value] * weight)
        checked_terms.append(
            {
                "quad": {
                    "a": quad[0],
                    "b": quad[1],
                    "c": quad[2],
                    "d": quad[3],
                },
                "quad_labels": list(quad_labels),
                "form": form,
                "weight": weight,
            }
        )

    right_by_root: dict[tuple[int, int], deque[tuple[int, int]]] = {}
    for edge_value in right_edges:
        root = closure.find(metric._edge(*edge_value))
        right_by_root.setdefault(root, deque()).append(edge_value)

    pairings = []
    for left in left_edges:
        root = closure.find(metric._edge(*left))
        candidates = right_by_root.get(root)
        if not candidates:
            return None
        right = candidates.popleft()
        path = _oriented_equality_path(indexed_rows, n, left, right)
        if path is None:
            raise AssertionError("closure-equivalent edges lack an equality path")
        pairings.append(
            {"left": list(left), "right": list(right), "path": path}
        )
    if any(candidates for candidates in right_by_root.values()):
        return None

    row_choices = [
        {"center": row.center, "support": list(row.support)}
        for row in sorted(
            {
                (row.center, row.support): row
                for row in indexed_rows
            }.values(),
            key=lambda item: (item.center, item.support),
        )
    ]
    return {
        "terms": checked_terms,
        "pairings": pairings,
        "row_choices": row_choices,
        "boundary_labels": list(order),
    }


def certify_weighted_kalmanson_cancellation(
    rows: Sequence[MetricRow],
    n: int,
    order: Sequence[int],
    terms: Sequence[Mapping[str, Any]],
) -> CoreRecord:
    """Return a proof-consumer-backed record for one proposed certificate."""

    cyclic_order = _validate_order(n, order)
    core = _weighted_kalmanson_cancellation_core(
        rows, n, cyclic_order, terms
    )
    if core is None:
        raise ValueError(
            "proposed weighted Kalmanson terms do not cancel modulo row equality"
        )
    _require_weighted_kalmanson_cancellation_consumer()
    return canonical_core_record(
        {
            "stage": "equality-convex-weighted-kalmanson-cancellation",
            "core": core,
            "lean_module": _WEIGHTED_KALMANSON_CANCELLATION_MODULE,
        },
        source="metric-bank-proposed-exact-linear-certificate",
        orientation="forward",
        lean_consumer=_WEIGHTED_KALMANSON_CANCELLATION_CONSUMER,
    )


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
    records: list[CoreRecord] = []

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
        cancellation_core = _two_kalmanson_cancellation_core(rows, n, order)
        if cancellation_core is not None:
            _require_two_kalmanson_cancellation_consumer()
            records.append(
                canonical_core_record(
                    {
                        "stage": "equality-convex-two-kalmanson-cancellation",
                        "core": cancellation_core,
                        "lean_module": _TWO_KALMANSON_CANCELLATION_MODULE,
                    },
                    source="metric-bank-equality-closure",
                    orientation="forward",
                    lean_consumer=_TWO_KALMANSON_CANCELLATION_CONSUMER,
                )
            )

        kalmanson_match = _direct_five_point_three_selected_row_kalmanson_core(
            rows, order
        )
        if kalmanson_match is not None:
            _require_five_point_three_selected_row_kalmanson_consumer()
            kalmanson_core, boundary_rotation_start = kalmanson_match
            records.append(
                canonical_core_record(
                    {
                        "stage": (
                            "equality-convex-five-point-three-selected-row-"
                            "kalmanson"
                        ),
                        "core": kalmanson_core,
                        "boundary_rotation_start": boundary_rotation_start,
                        "requires_rotated_ccw_enumeration": (
                            boundary_rotation_start != 0
                        ),
                        "lean_module": (
                            _FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_MODULE
                        ),
                    },
                    source="metric-bank-direct-rows",
                    orientation="forward",
                    lean_consumer=(
                        _FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_CONSUMER
                    ),
                )
            )

        schema_c_matches = (
            (
                _direct_seven_point_four_selected_row_kalmanson_c_core(
                    rows, order
                ),
                "forward",
                "equality-convex-seven-point-four-selected-row-kalmanson-c",
                _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_CONSUMER,
            ),
            (
                _direct_seven_point_four_selected_row_kalmanson_c_core(
                    rows, tuple(reversed(order))
                ),
                "reverse",
                (
                    "equality-convex-seven-point-four-selected-row-"
                    "kalmanson-c-reverse"
                ),
                _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_REVERSE_CONSUMER,
            ),
        )
        for match, orientation, stage, consumer in schema_c_matches:
            if match is None:
                continue
            _require_seven_point_four_selected_row_kalmanson_c_consumers()
            schema_c_core, boundary_rotation_start = match
            records.append(
                canonical_core_record(
                    {
                        "stage": stage,
                        "core": schema_c_core,
                        "boundary_rotation_start": boundary_rotation_start,
                        "requires_rotated_ccw_enumeration": (
                            boundary_rotation_start != 0
                        ),
                        "lean_module": (
                            _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_MODULE
                        ),
                    },
                    source="metric-bank-direct-rows",
                    orientation=orientation,
                    lean_consumer=consumer,
                )
            )

        schema_f_matches = (
            (
                _direct_seven_point_four_selected_row_kalmanson_f_core(
                    rows, order
                ),
                "forward",
                _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_F_CONSUMERS[0],
            ),
            (
                _direct_seven_point_four_selected_row_kalmanson_f_core(
                    rows, tuple(reversed(order))
                ),
                "reverse",
                _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_F_CONSUMERS[1],
            ),
        )
        for match, orientation, consumer in schema_f_matches:
            if match is None:
                continue
            _require_seven_point_four_selected_row_kalmanson_f_consumers()
            schema_f_core, boundary_rotation_start = match
            reverse_suffix = "-reverse" if orientation == "reverse" else ""
            records.append(
                canonical_core_record(
                    {
                        "stage": (
                            "equality-convex-seven-point-four-selected-row-"
                            f"kalmanson-f{reverse_suffix}"
                        ),
                        "core": schema_f_core,
                        "boundary_rotation_start": boundary_rotation_start,
                        "requires_rotated_ccw_enumeration": (
                            boundary_rotation_start != 0
                        ),
                        "lean_module": (
                            _SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_MODULE
                        ),
                    },
                    source="metric-bank-direct-rows",
                    orientation=orientation,
                    lean_consumer=consumer,
                )
            )

        for schema in ("d", "e", "g"):
            consumers = _SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_CONSUMERS[schema]
            schema_matches = (
                (
                    _direct_six_point_four_selected_row_kalmanson_core(
                        rows, order, schema=schema
                    ),
                    "forward",
                    consumers[0],
                ),
                (
                    _direct_six_point_four_selected_row_kalmanson_core(
                        rows, tuple(reversed(order)), schema=schema
                    ),
                    "reverse",
                    consumers[1],
                ),
            )
            for match, orientation, consumer in schema_matches:
                if match is None:
                    continue
                _require_six_point_four_selected_row_kalmanson_consumers()
                schema_core, boundary_rotation_start = match
                reverse_suffix = "-reverse" if orientation == "reverse" else ""
                records.append(
                    canonical_core_record(
                        {
                            "stage": (
                                "equality-convex-six-point-four-selected-row-"
                                f"kalmanson-{schema}{reverse_suffix}"
                            ),
                            "core": schema_core,
                            "boundary_rotation_start": boundary_rotation_start,
                            "requires_rotated_ccw_enumeration": (
                                boundary_rotation_start != 0
                            ),
                            "lean_module": (
                                _SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_MODULE
                            ),
                        },
                        source="metric-bank-direct-rows",
                        orientation=orientation,
                        lean_consumer=consumer,
                    )
                )

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
    "certify_two_kalmanson_cancellation",
    "enumerate_two_kalmanson_cancellations",
    "scan_all_formalized_cores",
]
