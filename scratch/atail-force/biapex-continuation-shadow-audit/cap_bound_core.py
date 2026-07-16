#!/usr/bin/env python3
"""Monotone selected-row own-cap cuts used by the scratch refresh.

The cuts encode only the following already-proved necessary consequences:

* an interior-centered selected four-class meets its own indexed cap in at
  most two points; and
* a Moser-endpoint-centered selected four-class meets either incident cap in
  at most one point.

They do not assert metric realizability or a producer theorem.
"""

from __future__ import annotations

import sys
from pathlib import Path
from typing import Iterable, Mapping, Protocol


ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.multi_center import multi_center_census as mc  # noqa: E402


class RowLike(Protocol):
    center: int
    support: Iterable[int]


CAP_NAMES = ("S", "O1", "O2")
THEOREM_PROVENANCE = {
    "interior_bound": (
        "Problem97.CapSelectedRowCounting."
        "selectedFourClass_inter_capByIndex_card_le_two"
    ),
    "endpoint_bounds": [
        "Problem97.CapSelectedRowCounting."
        "selectedFourClass_inter_orderedCap_first_card_le_one",
        "Problem97.CapSelectedRowCounting."
        "selectedFourClass_inter_orderedCap_last_card_le_one",
        "Problem97.SurplusCapPacket.capByIndex_cgn4g_capData_oriented",
    ],
    "source": "lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean",
    "oriented_cap_source": (
        "lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean"
    ),
}


def cap_sets(frame: mc.Frame) -> Mapping[str, frozenset[int]]:
    return {name: getattr(frame, name) for name in CAP_NAMES}


def selected_row_own_cap_detection(
    rows: Iterable[RowLike],
    profile: tuple[int, int, int],
) -> dict[str, object] | None:
    """Return the first proved own-cap-bound violation, if any.

    The predicate is monotone under adding complete rows: once one selected
    row violates its bound, no later row can repair that prefix.
    """

    frame = mc.build_frame(profile)
    caps = cap_sets(frame)
    normalized = sorted(
        (
            int(row.center),
            frozenset(int(point) for point in row.support),
        )
        for row in rows
    )
    for center, support in normalized:
        if center in mc.MOSER_SET:
            for cap_name in mc.VERT_CAPS[center]:
                hits = support & caps[cap_name]
                if len(hits) > 1:
                    return {
                        "stage": "selected-row-endpoint-own-cap-bound",
                        "center": center,
                        "cap": cap_name,
                        "bound": 1,
                        "hits": sorted(hits),
                        "support": sorted(support),
                    }
            continue

        cap_name = frame.cap_of_int[center]
        hits = support & caps[cap_name]
        if len(hits) > 2:
            return {
                "stage": "selected-row-interior-own-cap-bound",
                "center": center,
                "cap": cap_name,
                "bound": 2,
                "hits": sorted(hits),
                "support": sorted(support),
            }
    return None


def all_selected_row_own_cap_detections(
    rows: Iterable[RowLike],
    profile: tuple[int, int, int],
) -> list[dict[str, object]]:
    """List every violating row/cap pair for reporting and validation."""

    frame = mc.build_frame(profile)
    caps = cap_sets(frame)
    detections: list[dict[str, object]] = []
    for center, support in sorted(
        (
            int(row.center),
            frozenset(int(point) for point in row.support),
        )
        for row in rows
    ):
        if center in mc.MOSER_SET:
            relevant = ((name, 1) for name in mc.VERT_CAPS[center])
            stage = "selected-row-endpoint-own-cap-bound"
        else:
            relevant = ((frame.cap_of_int[center], 2),)
            stage = "selected-row-interior-own-cap-bound"
        for cap_name, bound in relevant:
            hits = support & caps[cap_name]
            if len(hits) > bound:
                detections.append(
                    {
                        "stage": stage,
                        "center": center,
                        "cap": cap_name,
                        "bound": bound,
                        "hits": sorted(hits),
                        "support": sorted(support),
                    }
                )
    return detections
