"""Reusable finite indexes for one Phase-3 metric classification.

The context is an acceleration layer only.  It keeps the legacy row ordering,
closure semantics, and Phase-3 cap/order universe intact while allowing the
certificate producers for one SAT assignment to share their small finite
search state.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass, field
from typing import Any

from census.global_confinement import metric_realizability_probe as metric
from census.p97_search import phase3_order_universe

Edge = tuple[int, int]
RowKey = tuple[int, tuple[int, ...], bool]


def _canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def _row_key(row: Any) -> RowKey:
    return (
        int(row.center),
        tuple(sorted(int(point) for point in row.support)),
        bool(row.exact),
    )


def _edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("metric-row distance edge has equal endpoints")
    return (left, right) if left < right else (right, left)


@dataclass(slots=True)
class ClassificationContext:
    """Caches the fixed universes shared by one decoded assignment."""

    rows: tuple[Any, ...]
    ordered_rows: tuple[Any, ...]
    n: int
    row_keys: tuple[RowKey, ...]
    row_support_masks: tuple[int, ...]
    equality_edges: tuple[tuple[Edge, ...], ...]
    order_universe: phase3_order_universe.Phase3OrderUniverse
    _row_index: dict[RowKey, int] = field(repr=False)
    _closure_cache: dict[int, Any] = field(default_factory=dict, repr=False)
    _graph_cache: dict[
        int, dict[Edge, list[tuple[Edge, dict[str, Any]]]]
    ] = field(default_factory=dict, repr=False)
    _covered_core_cache: dict[str, int] = field(
        default_factory=dict, repr=False
    )
    _order_sha256_cache: dict[int, str] = field(
        default_factory=dict, repr=False
    )
    _kalmanson_detection_cache: dict[
        tuple[int, tuple[int, ...]], dict[str, Any] | None
    ] = field(default_factory=dict, repr=False)
    _kalmanson_covered_order_mask_cache: dict[int, int] = field(
        default_factory=dict, repr=False
    )
    _kalmanson_coverage_query_cache: dict[tuple[int, int], bool] = field(
        default_factory=dict, repr=False
    )
    _kalmanson_order_position_index: Any | None = field(
        default=None, repr=False
    )
    _kalmanson_index_unavailable: bool = field(default=False, repr=False)

    @classmethod
    def from_rows(
        cls,
        rows: Sequence[Any],
        n: int,
        *,
        order_universe: phase3_order_universe.Phase3OrderUniverse | None = None,
    ) -> ClassificationContext:
        if type(n) is not int or n <= 0:
            raise ValueError("classification context requires positive n")
        original = tuple(rows)
        ordered = tuple(sorted(original, key=_row_key))
        keys = tuple(_row_key(row) for row in ordered)
        if len(keys) != len(set(keys)):
            raise ValueError("classification context rows contain duplicates")
        support_masks: list[int] = []
        equality_edges: list[tuple[Edge, ...]] = []
        for row in ordered:
            center = int(row.center)
            support = tuple(sorted(int(point) for point in row.support))
            if not 0 <= center < n or not support:
                raise ValueError("classification context row is malformed")
            if any(
                point == center or not 0 <= point < n for point in support
            ) or len(set(support)) != len(support):
                raise ValueError("classification context support is malformed")
            support_masks.append(sum(1 << point for point in support))
            reference = _edge(center, support[0])
            equality_edges.append(
                tuple(_edge(center, point) for point in support[1:])
            )
            if reference in equality_edges[-1]:
                raise ValueError("classification context has a self equality")
        universe = (
            phase3_order_universe.phase3_order_universe()
            if order_universe is None
            else order_universe
        )
        return cls(
            rows=original,
            ordered_rows=ordered,
            n=n,
            row_keys=keys,
            row_support_masks=tuple(support_masks),
            equality_edges=tuple(equality_edges),
            order_universe=universe,
            _row_index={key: index for index, key in enumerate(keys)},
        )

    @property
    def all_row_mask(self) -> int:
        return (1 << len(self.row_keys)) - 1

    @property
    def forward_position(self) -> tuple[tuple[int, ...], ...]:
        return tuple(
            record.forward_position for record in self.order_universe.orders
        )

    @property
    def reverse_position(self) -> tuple[tuple[int, ...], ...]:
        return tuple(
            record.reverse_position for record in self.order_universe.orders
        )

    def row_mask(self, rows: Sequence[Any]) -> int:
        mask = 0
        for row in rows:
            key = _row_key(row)
            try:
                index = self._row_index[key]
            except KeyError as exc:
                raise ValueError("row is outside classification context") from exc
            mask |= 1 << index
        return mask

    def rows_for_mask(self, row_mask: int) -> tuple[Any, ...]:
        if (
            type(row_mask) is not int
            or row_mask < 0
            or row_mask & ~self.all_row_mask
        ):
            raise ValueError("row mask is outside classification context")
        return tuple(
            self.ordered_rows[index]
            for index, key in enumerate(self.row_keys)
            if row_mask & (1 << index)
        )

    def closure_for_mask(self, row_mask: int) -> Any:
        """Return the exact metric equality closure for a row subset."""

        if row_mask not in self._closure_cache:
            closure = metric._EdgeClosure(self.n)
            for index, edges in enumerate(self.equality_edges):
                if not row_mask & (1 << index):
                    continue
                row = self.ordered_rows[index]
                reference = _edge(int(row.center), int(row.support[0]))
                for edge in edges:
                    closure.union(reference, edge)
            self._closure_cache[row_mask] = closure
        return self._closure_cache[row_mask]

    def closure_for_rows(self, rows: Sequence[Any]) -> Any:
        return self.closure_for_mask(self.row_mask(rows))

    def graph_for_mask(
        self, row_mask: int
    ) -> dict[Edge, list[tuple[Edge, dict[str, Any]]]]:
        """Build the legacy closure graph once for a selected row mask."""

        if row_mask not in self._graph_cache:
            graph: dict[Edge, list[tuple[Edge, dict[str, Any]]]] = {
                (left, right): []
                for left in range(self.n)
                for right in range(self.n)
            }
            for index, key in enumerate(self.row_keys):
                if not row_mask & (1 << index):
                    continue
                center, support, _exact = key
                for first in support:
                    for second in support:
                        if first == second:
                            continue
                        step = {
                            "kind": "row",
                            "center": center,
                            "first": first,
                            "second": second,
                        }
                        graph[(center, first)].append(
                            ((center, second), step)
                        )
            for first in range(self.n):
                for second in range(self.n):
                    if first == second:
                        continue
                    step = {"kind": "flip", "first": first, "second": second}
                    graph[(first, second)].append(((second, first), step))
            for successors in graph.values():
                successors.sort(
                    key=lambda item: (item[0], _canonical_json(item[1]))
                )
            self._graph_cache[row_mask] = graph
        return self._graph_cache[row_mask]

    def graph_for_rows(
        self, rows: Sequence[Any]
    ) -> dict[Edge, list[tuple[Edge, dict[str, Any]]]]:
        return self.graph_for_mask(self.row_mask(rows))

    def covered_order_mask_for_core(
        self,
        core: Mapping[str, Any],
        core_satisfied: Callable[[Sequence[int], Mapping[str, Any]], bool],
    ) -> int:
        """Cache the order mask rejected by one shared-pair core."""

        key = _canonical_json(dict(core))
        if key not in self._covered_core_cache:
            mask = 0
            for record in self.order_universe.orders:
                if not core_satisfied(record.order, core):
                    mask |= 1 << record.index
            self._covered_core_cache[key] = mask
        return self._covered_core_cache[key]

    def shared_pair_core_satisfied(
        self, record: Any, core: Mapping[str, Any]
    ) -> bool:
        """Evaluate one shared-pair core from a precomputed order position."""

        names = (
            "first_center",
            "second_center",
            "first_point",
            "second_point",
        )
        if not all(type(core.get(name)) is int for name in names):
            raise ValueError("shared-pair core has malformed role labels")
        values = tuple(int(core[name]) for name in names)
        if any(value < 0 or value >= self.n for value in values):
            raise ValueError("shared-pair core role label is outside the context")
        first_center, second_center, first_point, second_point = values
        left, right = sorted(
            (
                record.forward_position[first_center],
                record.forward_position[second_center],
            )
        )
        first_between = left < record.forward_position[first_point] < right
        second_between = left < record.forward_position[second_point] < right
        return first_between != second_between

    def order_sha256(self, record: Any) -> str:
        """Return the canonical hash used by the legacy order stream."""

        index = int(record.index)
        if index not in self._order_sha256_cache:
            payload = _canonical_json(list(record.order)).encode("utf-8")
            self._order_sha256_cache[index] = hashlib.sha256(payload).hexdigest()
        return self._order_sha256_cache[index]

    def kalmanson_detection(
        self,
        rows: Sequence[Any],
        n: int,
        order: Sequence[int],
    ) -> dict[str, Any] | None:
        """Cache the direct Kalmanson predicate for a row mask and order."""

        if n != self.n:
            raise ValueError("Kalmanson detector dimension differs from context")
        row_mask = self.row_mask(rows)
        normalized_order = tuple(order)
        key = (row_mask, normalized_order)
        if key not in self._kalmanson_detection_cache:
            from census.p97_search import phase3_ordered_metric_rules

            if (
                self._kalmanson_order_position_index is None
                and not self._kalmanson_index_unavailable
            ):
                try:
                    self._kalmanson_order_position_index = (
                        phase3_ordered_metric_rules.KalmansonOrderPositionIndex.from_rows(
                            self.ordered_rows, self.n
                        )
                    )
                except phase3_ordered_metric_rules.OrderedMetricRuleError:
                    self._kalmanson_index_unavailable = True
            if self._kalmanson_order_position_index is not None:
                self._kalmanson_detection_cache[key] = (
                    self._kalmanson_order_position_index.detect(
                        row_mask, normalized_order
                    )
                )
            else:
                self._kalmanson_detection_cache[key] = (
                    phase3_ordered_metric_rules.detect_selected_row_kalmanson(
                        self.rows_for_mask(row_mask), n, normalized_order
                    )
                )
        return self._kalmanson_detection_cache[key]

    def kalmanson_covered_order_mask(
        self, rows: Sequence[Any], n: int
    ) -> int:
        """Compile the direct Kalmanson detector into a universe bitmask."""

        if n != self.n:
            raise ValueError("Kalmanson detector dimension differs from context")
        row_mask = self.row_mask(rows)
        selected = self.rows_for_mask(row_mask)
        covered = self._kalmanson_covered_order_mask_cache.get(row_mask, 0)
        for record in self.order_universe.orders:
            bit = 1 << record.index
            if covered & bit:
                continue
            if self.kalmanson_detection(selected, n, record.order) is not None:
                covered |= bit
        self._kalmanson_covered_order_mask_cache[row_mask] = covered
        return covered

    def kalmanson_compatible_orders_are_covered(
        self, rows: Sequence[Any], n: int, compatible_order_mask: int
    ) -> bool:
        """Check only the compatible orders, caching each result lazily.

        Unlike ``kalmanson_covered_order_mask``, this method does not compile
        the complete 15,120-order universe up front.  It evaluates compatible
        order bits in stable universe order and stops at the first uncovered
        order.  Positive results are retained in the row-mask cache, while
        negative detector results remain available through the exact detector
        cache.
        """

        if n != self.n:
            raise ValueError("Kalmanson detector dimension differs from context")
        if (
            type(compatible_order_mask) is not int
            or compatible_order_mask < 0
            or compatible_order_mask & ~self.order_universe.all_orders_mask
        ):
            raise ValueError("compatible Kalmanson order mask is malformed")
        row_mask = self.row_mask(rows)
        query_key = (row_mask, compatible_order_mask)
        cached = self._kalmanson_coverage_query_cache.get(query_key)
        if cached is not None:
            return cached
        selected = self.rows_for_mask(row_mask)
        known_covered = (
            self._kalmanson_covered_order_mask_cache.get(row_mask, 0)
            & compatible_order_mask
        )
        remaining = compatible_order_mask & ~known_covered
        while remaining:
            bit = remaining & -remaining
            index = bit.bit_length() - 1
            record = self.order_universe.orders[index]
            if self.kalmanson_detection(selected, n, record.order) is None:
                self._kalmanson_coverage_query_cache[query_key] = False
                return False
            self._kalmanson_covered_order_mask_cache[row_mask] = (
                self._kalmanson_covered_order_mask_cache.get(row_mask, 0)
                | bit
            )
            remaining ^= bit
        self._kalmanson_coverage_query_cache[query_key] = True
        return True

    def covered_order_mask_for_cores(
        self,
        cores: Sequence[Mapping[str, Any]],
        core_satisfied: Callable[[Sequence[int], Mapping[str, Any]], bool],
    ) -> int:
        covered = 0
        for core in cores:
            covered |= self.covered_order_mask_for_core(core, core_satisfied)
        return covered
