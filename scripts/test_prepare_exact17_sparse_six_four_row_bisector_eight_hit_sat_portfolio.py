# Copyright (c) 2026 Adam McKenna. All rights reserved.
"""Focused contract tests for the provisional true-EightHit preparation lane."""

from __future__ import annotations

import hashlib
import json

import prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio as subject
import pytest


def test_production_pins_are_provisional_and_fail_closed() -> None:
    assert subject.PRODUCTION_PINS_FINALIZED is False
    assert subject.SOURCE_CAMPAIGN_SHA256 == ""
    assert subject.SOURCE_RUN_MANIFEST_SHA256 == ""
    assert subject.SOURCE_PREPARER_COMMIT == ""
    assert subject.CHECKPOINT_SHA256 == ""
    assert subject.PRODUCTION_CELL_IDENTITIES == {}
    with pytest.raises(subject.PreparationError, match="provisional"):
        subject.require_production_pins_finalized(subject.ROOT)


def test_exact_six_cell_sat_profile_contract() -> None:
    assert subject.CELL_CATEGORIES == (
        "none",
        "unique-06",
        "unique-07",
        "unique-08",
        "unique-09",
        "unique-10",
    )
    assert subject.CELL_COUNT == 6
    assert (subject.NUM_VARIABLES, subject.NUM_CLAUSES) == (308, 7_409_267)
    assert subject.BACKEND == "cadical"
    assert subject.SOURCE_SOLVER_PROFILE == "unsat"
    assert subject.SOLVER_PROFILE == "sat"
    assert subject.REQUESTED_CORE_LIMIT == 1
    assert subject.SOLVE_TIMEOUT_S == subject.REPLAY_TIMEOUT_S == 3_600
    assert subject.MAX_CONCURRENCY == 6
    assert "eight-hit" in subject.PORTFOLIO_SCHEMA
    assert "eight-hit" in subject.SOURCE_CAMPAIGN_SCHEMA


def test_raw_identity_is_sat_profile_and_cell_specific() -> None:
    first = subject.raw_dimacs_identity("a" * 64, "b" * 64)
    second = subject.raw_dimacs_identity("c" * 64, "b" * 64)
    assert first != second
    assert len(first) == len(second) == 64


def test_checkpoint_manifest_has_authenticated_shape() -> None:
    checkpoint = json.loads(subject.CHECKPOINT_PATH.read_bytes())
    claimed = checkpoint.pop("manifest_sha256")
    encoded = json.dumps(checkpoint, sort_keys=True, separators=(",", ":")).encode()
    assert claimed == hashlib.sha256(encoded).hexdigest()
    assert checkpoint["lane_id"] == subject.LANE_ID
    assert checkpoint["owned_paths"] == list(subject.PACKAGE_SOURCE_PATHS)


def test_prepare_does_not_materialize_unavailable_campaign() -> None:
    output = (
        subject.ROOT
        / "scratch/runs/exact17-eight-hit-sat-portfolio-20260821/test-unavailable"
    )
    with pytest.raises(subject.PreparationError, match="provisional"):
        subject.prepare_portfolio(root=subject.ROOT, output_root=output)
    assert not output.exists()
