#!/usr/bin/env python3
"""Proved selected-row own-cap cuts for the synchronized K-A shadow.

The predicates below encode only already-kernel-checked necessary bounds.  They
do not assert Euclidean realizability or a K-A producer theorem.
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
    """Return the first monotone own-cap-bound violation, if any."""

    detections = all_selected_row_own_cap_detections(rows, profile)
    return detections[0] if detections else None


def all_selected_row_own_cap_detections(
    rows: Iterable[RowLike],
    profile: tuple[int, int, int],
) -> list[dict[str, object]]:
    """List every violating selected row/cap pair."""

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
