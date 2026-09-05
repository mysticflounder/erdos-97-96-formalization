"""Focused preflight tests for the sequential confirmation producer."""

from pathlib import Path

import pytest

from census.card_head import (
    exactfive_profile0034_new_mirror_reduced_sequential_confirmation_piqd as subject,
)


def test_fresh_four_cell_plan() -> None:
    assert subject.WORKERS == 1
    assert subject.QUERY_PLAN == (
        ("z3-target-gt", "z3", "gt"),
        ("z3-target-lt", "z3", "lt"),
        ("z3-control-positive", "z3", "positive"),
        ("z3-control-negative", "z3", "negative"),
    )
    assert all(row[1] == "z3" for row in subject.QUERY_PLAN)


def test_target_group_shapes() -> None:
    assert len(subject.GT_GROUP_IDS) == 7
    assert len(subject.LT_GROUP_IDS) == 8
    assert "source-row-equality-01" not in subject.GT_GROUP_IDS
    assert "source-row-equality-01" not in subject.LT_GROUP_IDS


def test_parent_pins_and_claims() -> None:
    assert subject.PARENT_PINS["manifest"] == "a019d04b982f95b50bc170d059f3266b5cb022072609a1b299debec9b4718e59"
    assert subject.PARENT_PINS["custody"] == "6f70dbf7d81353bfd815df50e43f3e048331aa365178bd8872c9c1f922899a9d"
    assert all(value is False for value in subject.FALSE_CLAIMS.values())


def test_source_manifest_directly_pins_replay_modules() -> None:
    paths = {path.resolve() for path in subject._source_paths()}
    recovery = subject.parent.parent.parent
    supporting_edge = recovery.deletion
    assert Path(recovery.__file__).resolve() in paths
    assert Path(supporting_edge.__file__).resolve() in paths
    assert Path(supporting_edge.bo_source.__file__).resolve() in paths


def test_target_journal_preflight() -> None:
    custody = subject.authenticate_parent_run()
    for key in ("z3-target-gt", "z3-target-lt"):
        prepared = subject.prepare_query(key, custody=custody)
        assert prepared.query.assumptions == ()
        assert prepared.query.descriptor["named_atoms"] == []
        assert "(check-sat" not in prepared.query.journal_smt2.decode("ascii")


def test_local_request_and_session_identity() -> None:
    custody = subject.authenticate_parent_run()
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
    label, profile = subject._session_identity(prepared)
    assert subject._request_id("z3-target-gt") in label
    assert label.startswith("p97-smt-source/z3-target-gt/z3/")
    assert profile == subject._sha(subject._canonical(prepared.query.descriptor["solver_profile"]))


def test_corrupt_result_is_rejected(tmp_path) -> None:
    custody = subject.authenticate_parent_run()
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
    output = tmp_path / "cell"
    output.mkdir()
    bad = {"schema": subject.RESULT_SCHEMA, "key": prepared.key, "result_sha256": "0" * 64}
    (output / "result.json").write_bytes(subject._json(bad))
    with pytest.raises(subject.SequentialConfirmationError):
        subject.verify_cell_tree(prepared, output)
