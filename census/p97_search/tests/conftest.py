# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Collection policy for immutable Card18 historical snapshot suites."""

from __future__ import annotations

import hashlib
from pathlib import Path

import pytest

_REPO_ROOT = Path(__file__).resolve().parents[3]
_SOURCE_HEAVY_PATH = (
    _REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean"
)
_HISTORICAL_SOURCE_HEAVY_SHA256 = (
    "c5e46308208ac2ae75fdf7e6a21db18fd03825af7f44bed7f3f47ffc630b542b"
)
_HISTORICAL_CARD18_SUITES = frozenset(
    {
        "test_rigid221_card18_source_packet.py",
        "test_rigid221_card18_source_custody.py",
        "test_rigid221_card18_crossed_incidence_custody.py",
        "test_rigid221_card18_labeled_projection_custody.py",
        "test_rigid221_card18_predicate_coverage.py",
        "test_rigid221_card18_predicate_coverage_v2.py",
        "test_rigid221_card18_predicate_coverage_v3.py",
    }
)


def _source_heavy_matches_historical_snapshot() -> bool:
    try:
        payload = _SOURCE_HEAVY_PATH.read_bytes()
    except OSError:
        return False
    return hashlib.sha256(payload).hexdigest() == _HISTORICAL_SOURCE_HEAVY_SHA256


def pytest_collection_modifyitems(items: list[pytest.Item]) -> None:
    """Run immutable suites only in their pinned historical source checkout."""

    if _source_heavy_matches_historical_snapshot():
        return

    marker = pytest.mark.skip(
        reason=(
            "immutable Card18 v1-v3 suite requires historical source snapshot "
            "9abb3417c06fd973dfa502009d5f517f0b25c24c"
        )
    )
    for item in items:
        if Path(str(item.path)).name in _HISTORICAL_CARD18_SUITES:
            item.add_marker(marker)
