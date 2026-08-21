# Copyright (c) 2026 Adam McKenna. All rights reserved.
"""Focused contract tests for the authenticated v5 true-EightHit lane."""

from __future__ import annotations

import hashlib
import json

import prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio as subject
import pytest


def test_production_pins_are_finalized() -> None:
    assert subject.PRODUCTION_PINS_FINALIZED is True
    assert (
        subject.SOURCE_CAMPAIGN_SHA256
        == "0f12101f828c919c4cebe8cf7467a3e138b14f37c4ae3cfb8989018c3c40e368"
    )
    assert (
        subject.SOURCE_RUN_MANIFEST_SHA256
        == "b2b386f92e1ea35c896dbfd50a8b888b39d42480b92c697c5c1cd214e0d38b2f"
    )
    assert subject.SOURCE_PREPARER_COMMIT == "b2fd08db695253931b3e85a8d71d16858df36d1f"
    assert (
        subject.CHECKPOINT_SHA256
        == "a7f669806491e2cb3e3bc8b02e26522ea563418ee748d1902893a4caafdbb37b"
    )
    assert tuple(subject.SOURCE_CELL_IDENTITIES) == subject.CELL_CATEGORIES
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


def test_prepare_rejects_repository_escape_before_authentication(tmp_path) -> None:
    output = tmp_path / "portfolio"
    with pytest.raises(subject.PreparationError, match="escapes repository"):
        subject.prepare_portfolio(root=tmp_path, output_root=output)
    assert not output.exists()
