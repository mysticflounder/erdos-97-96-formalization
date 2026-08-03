"""Immutable finite cap/order universe for the Phase-3 ``(4,10,(4,4,5))`` cell.

The universe is an acceleration index only.  Callers remain responsible for
constructing and replaying the ordered JSON witness selected by their legacy
certificate path.  Integer masks answer only the Boolean question whether all
orders compatible with a retained set of positive cap facts are covered.
"""

from __future__ import annotations

import functools
import itertools
from collections import Counter
from collections.abc import Callable, Sequence
from dataclasses import dataclass

PHASE3_N = 10
PHASE3_CAP_LABELS = tuple(range(3, PHASE3_N))
PHASE3_CAPS = (0, 1, 2)
PHASE3_FIBER_PROFILE = (2, 2, 3)
PHASE3_ANNOTATION_COUNT = 630
PHASE3_ORDERS_PER_ANNOTATION = 24
PHASE3_ORDER_COUNT = PHASE3_ANNOTATION_COUNT * PHASE3_ORDERS_PER_ANNOTATION

CapFact = tuple[int, int]
CapAnnotation = tuple[CapFact, ...]
Order = tuple[int, ...]


class Phase3OrderUniverseError(ValueError):
    """The requested fact or finite-universe construction is malformed."""


@dataclass(frozen=True, slots=True)
class Phase3OrderRecord:
    """One stable annotation/order pair in legacy traversal order."""

    index: int
    annotation_index: int
    facts: CapAnnotation
    order_id: str
    order: Order
    forward_position: tuple[int, ...]
    reverse_position: tuple[int, ...]


@dataclass(frozen=True, slots=True)
class Phase3OrderUniverse:
    """All 630 annotations and their 24 induced orders as integer masks."""

    annotations: tuple[CapAnnotation, ...]
    orders: tuple[Phase3OrderRecord, ...]
    annotation_order_masks: tuple[int, ...]
    fact_order_masks: tuple[int, ...]
    all_orders_mask: int

    @staticmethod
    def fact_index(fact: CapFact) -> int:
        if (
            not isinstance(fact, tuple)
            or len(fact) != 2
            or type(fact[0]) is not int
            or type(fact[1]) is not int
            or fact[0] not in PHASE3_CAP_LABELS
            or fact[1] not in PHASE3_CAPS
        ):
            raise Phase3OrderUniverseError(f"invalid Phase-3 cap fact: {fact!r}")
        label, cap = fact
        return (label - PHASE3_CAP_LABELS[0]) * len(PHASE3_CAPS) + cap

    def compatible_order_mask(self, retained_facts: Sequence[CapFact]) -> int:
        """Return all order IDs extending every retained positive cap fact."""

        retained = tuple(retained_facts)
        if retained != tuple(sorted(set(retained))):
            raise Phase3OrderUniverseError(
                "retained cap facts are duplicate or unsorted"
            )
        mask = self.all_orders_mask
        for fact in retained:
            mask &= self.fact_order_masks[self.fact_index(fact)]
        return mask

    @staticmethod
    def compatible_annotation_count(compatible_order_mask: int) -> int:
        order_count = compatible_order_mask.bit_count()
        if order_count % PHASE3_ORDERS_PER_ANNOTATION:
            raise Phase3OrderUniverseError(
                "compatible order mask does not contain complete annotations"
            )
        return order_count // PHASE3_ORDERS_PER_ANNOTATION

    def covered_order_mask(
        self, predicate: Callable[[Phase3OrderRecord], bool]
    ) -> int:
        """Compile a caller's legacy per-order Boolean predicate into a mask."""

        bits = bytearray((len(self.orders) + 7) // 8)
        for record in self.orders:
            if predicate(record):
                bits[record.index // 8] |= 1 << (record.index % 8)
        return int.from_bytes(bits, "little")

    def compatible_orders_are_covered(
        self,
        retained_facts: Sequence[CapFact],
        covered_order_mask: int,
    ) -> tuple[bool, int, int]:
        """Return soundness plus exact compatible annotation/order counts."""

        if (
            type(covered_order_mask) is not int
            or covered_order_mask < 0
            or covered_order_mask & ~self.all_orders_mask
        ):
            raise Phase3OrderUniverseError("covered order mask is outside universe")
        compatible = self.compatible_order_mask(retained_facts)
        annotation_count = self.compatible_annotation_count(compatible)
        return (
            compatible != 0 and (compatible & ~covered_order_mask) == 0,
            annotation_count,
            compatible.bit_count(),
        )


def _annotations() -> tuple[CapAnnotation, ...]:
    annotations: list[CapAnnotation] = []
    for values in itertools.product(PHASE3_CAPS, repeat=len(PHASE3_CAP_LABELS)):
        if sorted(Counter(values).values()) != list(PHASE3_FIBER_PROFILE):
            continue
        annotations.append(tuple(zip(PHASE3_CAP_LABELS, values, strict=True)))
    if len(annotations) != PHASE3_ANNOTATION_COUNT:
        raise Phase3OrderUniverseError(
            "Phase-3 cap universe does not have exactly 630 annotations"
        )
    return tuple(annotations)


def _orders_from_annotation(facts: CapAnnotation) -> tuple[Order, ...]:
    fibers = tuple(
        tuple(label for label, cap in facts if cap == index)
        for index in PHASE3_CAPS
    )
    raw = sorted(
        {
            (0, *fiber2, 1, *fiber0, 2, *fiber1)
            for fiber2, fiber0, fiber1 in itertools.product(
                itertools.permutations(fibers[2]),
                itertools.permutations(fibers[0]),
                itertools.permutations(fibers[1]),
            )
        }
    )
    if len(raw) != PHASE3_ORDERS_PER_ANNOTATION or any(
        sorted(order) != list(range(PHASE3_N)) for order in raw
    ):
        raise Phase3OrderUniverseError(
            "Phase-3 annotation does not induce exactly 24 orders"
        )
    return tuple(raw)


@functools.lru_cache(maxsize=1)
def phase3_order_universe() -> Phase3OrderUniverse:
    """Build the canonical universe once per process."""

    annotations = _annotations()
    records: list[Phase3OrderRecord] = []
    annotation_masks: list[int] = []
    fact_masks = [0] * (len(PHASE3_CAP_LABELS) * len(PHASE3_CAPS))
    for annotation_index, facts in enumerate(annotations):
        first_order_index = len(records)
        for order_number, order in enumerate(_orders_from_annotation(facts)):
            index = len(records)
            forward_position = tuple(order.index(label) for label in range(PHASE3_N))
            reverse = tuple(reversed(order))
            reverse_position = tuple(
                reverse.index(label) for label in range(PHASE3_N)
            )
            records.append(
                Phase3OrderRecord(
                    index=index,
                    annotation_index=annotation_index,
                    facts=facts,
                    order_id=f"order-{order_number:02d}",
                    order=order,
                    forward_position=forward_position,
                    reverse_position=reverse_position,
                )
            )
        annotation_mask = (
            (1 << PHASE3_ORDERS_PER_ANNOTATION) - 1
        ) << first_order_index
        annotation_masks.append(annotation_mask)
        for fact in facts:
            fact_masks[Phase3OrderUniverse.fact_index(fact)] |= annotation_mask
    if len(records) != PHASE3_ORDER_COUNT:
        raise Phase3OrderUniverseError(
            "Phase-3 cap universe does not have exactly 15,120 orders"
        )
    all_orders_mask = (1 << len(records)) - 1
    seen = 0
    for annotation_mask in annotation_masks:
        if seen & annotation_mask:
            raise Phase3OrderUniverseError("Phase-3 annotation order masks overlap")
        seen |= annotation_mask
    if seen != all_orders_mask:
        raise Phase3OrderUniverseError("Phase-3 annotation order masks are incomplete")
    return Phase3OrderUniverse(
        annotations=annotations,
        orders=tuple(records),
        annotation_order_masks=tuple(annotation_masks),
        fact_order_masks=tuple(fact_masks),
        all_orders_mask=all_orders_mask,
    )


@functools.cache
def cyclic_subsequence_order_mask(
    roles: tuple[int, ...], *, reverse: bool = False
) -> int:
    """Compile the legacy cyclic-subsequence predicate for one role tuple."""

    universe = phase3_order_universe()
    if (
        len(set(roles)) != len(roles)
        or any(type(role) is not int or not 0 <= role < PHASE3_N for role in roles)
    ):
        return 0
    if len(roles) <= 1:
        return universe.all_orders_mask
    bits = bytearray((len(universe.orders) + 7) // 8)
    for record in universe.orders:
        positions = record.reverse_position if reverse else record.forward_position
        role_positions = tuple(positions[role] for role in roles)
        winding = sum(
            (role_positions[(index + 1) % len(role_positions)] - position)
            % PHASE3_N
            for index, position in enumerate(role_positions)
        )
        if winding == PHASE3_N:
            bits[record.index // 8] |= 1 << (record.index % 8)
    return int.from_bytes(bits, "little")
