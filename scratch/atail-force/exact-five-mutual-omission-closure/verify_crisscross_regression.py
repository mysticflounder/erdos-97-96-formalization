"""Replay the pinned finite model at the mutual-omission normal form.

This imports the existing exact rational finite-metric regression and checks
the additional criss-cross and unique-double-blocker conclusions formalized in
``MutualOmissionCrissCross.lean``.  It is not a Euclidean/convex/MEC model.
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


def check() -> dict[str, object]:
    base = model.check()
    q = model.FIRST_SOURCE
    w = model.SECOND_SOURCE
    p = model.PHYSICAL_CENTER
    bq = model.blocker(q)
    bw = model.blocker(w)

    # Mutual omission and pairwise-distinct origin-tagged centers.
    assert w not in model.critical_shell(q)
    assert q not in model.critical_shell(w)
    assert bq != bw
    assert bq != p
    assert bw != p

    # The two crossed common-deletion packets and their canonical rows.
    assert model.exact_classes_at(bw, frozenset({q})) == (
        model.critical_shell(w),
    )
    assert model.exact_classes_at(p, frozenset({q})) == (
        model.PHYSICAL_CLASS - {q},
    )
    assert model.exact_classes_at(bq, frozenset({w})) == (
        model.critical_shell(q),
    )
    assert model.exact_classes_at(p, frozenset({w})) == (
        model.PHYSICAL_CLASS - {w},
    )

    # At most one actual blocker center blocks both deletions.  This is the
    # exact finite shadow of the global convex-perpendicular-bisector theorem.
    double_blocking_centers = {
        model.blocker(source)
        for source in model.VERTICES
        if not survives(q, model.blocker(source))
        and not survives(w, model.blocker(source))
    }
    assert len(double_blocking_centers) <= 1
    exceptional = next(iter(double_blocking_centers), None)
    for source in model.VERTICES:
        center = model.blocker(source)
        assert survives(q, center) or survives(w, center) or center == exceptional
    exceptional_fiber = (
        [source for source in model.VERTICES if model.blocker(source) == exceptional]
        if exceptional is not None
        else []
    )
    assert len(exceptional_fiber) <= 2
    assert all(source not in model.CAP for source in exceptional_fiber)

    return {
        "status": "PASS",
        "scope": (
            "exact rational finite metric with total K4, exact-five, total "
            "critical map, mutual omission criss-cross, and the unique "
            "double-blocking-center conclusion; not Euclidean/convex/MEC"
        ),
        "base_model_sha256": base["model_sha256"],
        "sources": [q, w],
        "actual_blockers": [bq, bw],
        "physical_apex": p,
        "double_blocking_centers": sorted(double_blocking_centers),
        "double_blocking_center_source_fiber": exceptional_fiber,
        "current_deletion_rows": [
            sorted(model.critical_shell(w)),
            sorted(model.PHYSICAL_CLASS - {q}),
        ],
        "successor_deletion_rows": [
            sorted(model.critical_shell(q)),
            sorted(model.PHYSICAL_CLASS - {w}),
        ],
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
