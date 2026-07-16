#!/usr/bin/env python3
"""Replay the exact strict-convex negative support-localization boundary.

This checker pins and invokes the stronger exact symbolic model maintained by
the robust-four-center lane.  It records only the fields relevant to the
no-M44 support-localization question.
"""

from __future__ import annotations

import hashlib
import importlib.util
from pathlib import Path


HERE = Path(__file__).resolve().parent
UPSTREAM = HERE.parent / "robust-four-center" / "verify_strict_convex_local_gap.py"
EXPECTED_UPSTREAM_SHA256 = (
    "98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698"
)
EXPECTED_COORDINATE_SHA256 = (
    "b07182bc396ee9b6131961e2a80f5ce420706bf9bb6f292d90471d80300c83c4"
)


def load_upstream():
    digest = hashlib.sha256(UPSTREAM.read_bytes()).hexdigest()
    assert digest == EXPECTED_UPSTREAM_SHA256, (
        "the pinned strict-convex verifier changed; re-audit before reuse "
        f"(expected {EXPECTED_UPSTREAM_SHA256}, got {digest})"
    )
    spec = importlib.util.spec_from_file_location("strict_convex_local_gap", UPSTREAM)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def check() -> None:
    result = load_upstream().check()
    assert result["coordinate_sha256"] == EXPECTED_COORDINATE_SHA256
    assert result["carrier_card"] == 29
    assert result["cap_cards"] == [5, 8, 19]
    assert result["unique_mec_boundary"] == ["A", "C", "O"]
    assert result["mec_triangle_nonobtuse"] is True
    assert result["no_m44_all_mec_permutations"] is True
    assert result["first_apex_off_surplus_marginal"] == ["C", "D", "E", "J"]
    assert result["second_apex_double_survivor_classes"] == [
        ["C", "G", "K", "O"]
    ]
    assert result["max_second_apex_survivor_inter_marginal_card"] == 1
    assert result["direct_two_hit_target"] is False
    assert result["q_row_confinement_target"] is False
    assert result["no_required_support_center_bisects_pair"] is True
    assert result["all_center_global_k4"] is False
    assert result["omitted_live_layer"] == [
        "all-center HasNEquidistantProperty 4",
        "total CriticalShellSystem",
    ]


if __name__ == "__main__":
    check()
    print(
        "PASS: exact strict-convex/no-M44 local model refutes both the "
        "two-hit and one-row-confinement targets; only all-center K4 and "
        "total criticality remain omitted"
    )
