#!/usr/bin/env python3
"""Exact total-CriticalShellSystem audit for the pinned 29-point model.

This checker does not weaken ``CriticalShellSystem`` to a row-incidence
shadow.  For every source it enumerates exact Euclidean radius classes of
cardinality four and requires that deleting the source leaves no radius class
of cardinality at least four at the proposed blocker center.  Those are
exactly the data needed to choose ``CriticalSelectedFourClass`` and prove its
``no_qfree`` field.

The imported 29-point checker remains the authority for strict convexity,
MEC/caps, no-IsM44, and the local robust packet.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
MODEL_PATH = HERE.parent / "robust-four-center" / "verify_strict_convex_local_gap.py"
EXPECTED_MODEL_SHA256 = (
    "98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698"
)


def load_model() -> Any:
    digest = hashlib.sha256(MODEL_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_MODEL_SHA256, (
        "the pinned 29-point verifier changed; re-audit the total-CSS result "
        f"before accepting it (expected {EXPECTED_MODEL_SHA256}, got {digest})"
    )
    spec = importlib.util.spec_from_file_location(
        "atail_strict_convex_local_gap", MODEL_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


R = load_model()


def check() -> dict[str, object]:
    regression = R.check()
    assert regression["status"] == "PASS"

    points = R.build_points()
    profiles = {
        center: R.G.radius_profile(points, center) for center in sorted(points)
    }
    candidates = {
        source: R.B.exact_blocker_candidates(profiles, source)
        for source in sorted(points)
    }
    uncovered = sorted(source for source, rows in candidates.items() if not rows)

    # A deterministic witness assignment is enough: CriticalShellSystem has no
    # injectivity or coherence requirement beyond the exact per-source blocker
    # shell and its deletion failure.
    assignment = {
        source: rows[0]
        for source, rows in candidates.items()
        if rows
    }
    for source, row in assignment.items():
        center = row["center"]
        support = set(row["support"])
        assert center != source
        assert source in support
        assert len(support) == 4
        assert not R.has_k4_after_deletion(profiles[center], {source})

    return {
        "status": "PASS",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "model_source_sha256": EXPECTED_MODEL_SHA256,
        "coordinate_sha256": regression["coordinate_sha256"],
        "carrier_card": len(points),
        "all_center_global_k4": regression["all_center_global_k4"],
        "centers_without_k4": regression["centers_without_k4"],
        "total_critical_shell_system_exists": not uncovered,
        "sources_without_exact_deletion_blocker": uncovered,
        "candidate_count_by_source": {
            source: len(rows) for source, rows in candidates.items()
        },
        "deterministic_total_assignment": assignment,
        "consequence": (
            "if total_critical_shell_system_exists is true, the exact local "
            "regression omits all-center global K4 but not total CSS"
        ),
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
