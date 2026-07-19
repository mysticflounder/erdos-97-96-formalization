"""Replay the mutual global-cap residual in the pinned finite metric model.

The cap colors below are only an abstract three-way blocker-cap assignment.
This is not a Euclidean, convex, or MEC realization.  It is a regression
against any consumer using only the total critical map, deletion-survival
colors, exceptional-fiber bound, and the resulting same-cap packet.
"""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path


MODEL_PATH = (
    Path(__file__).resolve().parents[1]
    / "paired-common-deletion-nonreturn-audit"
    / "exact_five_paired_cycle_model.py"
)
SPEC = importlib.util.spec_from_file_location("paired_cycle_model", MODEL_PATH)
assert SPEC is not None and SPEC.loader is not None
model = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(model)


def survives(deleted: int, center: int) -> bool:
    return bool(model.exact_classes_at(center, frozenset({deleted})))


def blocker_cap(center: int) -> int:
    """An abstract three-cap assignment, deliberately not geometric."""

    return center % 3


def check() -> dict[str, object]:
    base = model.check()
    q = model.FIRST_SOURCE
    w = model.SECOND_SOURCE

    double_blocking_centers = {
        model.blocker(source)
        for source in model.VERTICES
        if not survives(q, model.blocker(source))
        and not survives(w, model.blocker(source))
    }
    assert len(double_blocking_centers) == 1
    exceptional = next(iter(double_blocking_centers))
    exceptional_fiber = {
        source for source in model.VERTICES if model.blocker(source) == exceptional
    }
    assert len(exceptional_fiber) <= 2

    good = [source for source in model.VERTICES if source not in exceptional_fiber]
    assert len(good) >= 8
    for source in good:
        center = model.blocker(source)
        assert survives(q, center) or survives(w, center)

    # Sources 3 and 6 have distinct blockers in one abstract blocker cap,
    # and deletion of q survives at both blockers.
    source_1, source_2 = 3, 6
    center_1, center_2 = model.blocker(source_1), model.blocker(source_2)
    assert source_1 in good and source_2 in good
    assert source_1 != source_2
    assert center_1 != center_2
    assert blocker_cap(center_1) == blocker_cap(center_2)
    assert survives(q, center_1) and survives(q, center_2)

    row_1 = model.critical_shell(source_1)
    row_2 = model.critical_shell(source_2)
    assert q not in row_1 and q not in row_2
    assert len(row_1 & row_2) == 1

    return {
        "status": "PASS",
        "scope": (
            "exact rational finite metric with total K4, total critical map, "
            "mutual omission, exceptional-fiber bound, and an abstract "
            "three-cap blocker assignment; not Euclidean/convex/MEC"
        ),
        "base_model_sha256": base["model_sha256"],
        "exceptional_blocker": exceptional,
        "exceptional_fiber": sorted(exceptional_fiber),
        "good_source_count": len(good),
        "same_cap_pair": {
            "sources": [source_1, source_2],
            "blockers": [center_1, center_2],
            "abstract_cap": blocker_cap(center_1),
            "deleted": q,
            "rows": [sorted(row_1), sorted(row_2)],
            "row_intersection": sorted(row_1 & row_2),
        },
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
