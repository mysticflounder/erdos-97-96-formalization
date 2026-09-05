# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
from fractions import Fraction

import pytest

from census.card_head import rigid221_s0_c3_fullrow_planar_qfnra_piqd as subject


def test_checkpoint16_positive_control_replays_exactly() -> None:
    points = subject.checkpoint16_control_points()
    replay = subject.check_checkpoint16_control(points)
    assert replay["accepted"]
    assert replay["hull"]["constraint_count"] == 80
    assert replay["hull"]["minimum"] == "51/20165"
    assert replay["rows"]["O"]["multiplicity"] == 5
    assert all(row["accepted"] for row in replay["rows"].values())
    assert all(replay["O_off_fiber"].values())
    assert points["p"] == (Fraction(8, 17), Fraction(-15, 17))


def test_negative_control_is_a_genuine_geometric_corruption() -> None:
    corrupted = subject.corrupted_control_points()
    assert corrupted["b_ab"] == corrupted["a"]
    assert not subject.check_checkpoint16_control(corrupted)["accepted"]
    commands = subject.build_smt_commands(subject.build_control_system("negative"))
    assert (
        len(commands)
        == subject.formula_inventory(subject.build_control_system("negative"))[
            "commands"
        ]
    )
    assert "(assert (> " in "\n".join(commands)


def test_control_rejects_a_point_moved_off_the_full_O_circle() -> None:
    points = subject.checkpoint16_control_points()
    ax, ay = points["a"]
    points["a"] = (ax + Fraction(1, 7), ay)
    replay = subject.check_control_geometry(points)
    assert not replay["accepted"]
    assert not replay["rows"]["O"]["accepted"]


def test_control_formula_inventory_covers_full_O_circle_and_off_fiber() -> None:
    system = subject.build_control_system("positive")
    inventory = subject.formula_inventory(system)
    assert inventory["row_equalities"] == 8
    assert inventory["radius_positivity"] == 5
    assert inventory["off_fiber_exclusions"] == 4
    assert len(subject.build_smt_commands(system)) == inventory["commands"]


@pytest.mark.parametrize("mode", subject.MODES)
@pytest.mark.parametrize("stage", subject.STAGES)
def test_target_formula_inventory(mode: str, stage: str) -> None:
    system = subject.build_target_system(mode, stage)
    inventory = subject.formula_inventory(system)
    assert inventory["row_equalities"] == 16
    assert inventory["radius_positivity"] == 5
    assert inventory["distinctness"] == 153
    assert inventory["off_fiber_exclusions"] == (0 if stage == "row-equalities" else 64)
    assert inventory["alternate_four_class_exclusions"] == (
        2860 if stage == "full-uniqueness" else 0
    )
    assert inventory["convexity"] == (306 if mode == "all-order" else 288)
    assert len(subject.build_smt_commands(system)) == inventory["commands"]


def test_full_uniqueness_has_exact_combinatorial_count() -> None:
    commands = subject.build_smt_commands(
        subject.build_target_system("fixed-forward", "full-uniqueness")
    )
    assert sum(command.startswith("(assert (not (and ") for command in commands) == 2860
    for row in ("F1", "Ku", "Ks", "Kr"):
        center, support = subject.ROWS[row]
        assert (
            len(
                [
                    role
                    for role in subject.ROLES
                    if role != center and role not in support
                ]
            )
            == 13
        )


def test_deletion_matrix_is_derived_from_exact_supports() -> None:
    assert subject.deletion_matrix() == subject.EXPECTED_DELETION_MATRIX
    assert [
        list(row.values()).count("kill") for row in subject.deletion_matrix().values()
    ] == [2, 2, 2]
    assert [
        list(row.values()).count("survive")
        for row in subject.deletion_matrix().values()
    ] == [1, 1, 1]


def _alternate_four_fiber_coordinates() -> dict[str, tuple[Fraction, Fraction]]:
    coords = {
        role: (Fraction(index + 10), Fraction((index + 10) ** 2))
        for index, role in enumerate(subject.ROLES)
    }
    coords["bu"] = (Fraction(0), Fraction(0))
    coords.update(
        {
            "u": (Fraction(1), Fraction(0)),
            "s": (Fraction(-1), Fraction(0)),
            "ua": (Fraction(0), Fraction(1)),
            "ub": (Fraction(0), Fraction(-1)),
            "p": (Fraction(2), Fraction(0)),
            "q": (Fraction(-2), Fraction(0)),
            "f1": (Fraction(0), Fraction(2)),
            "f2": (Fraction(0), Fraction(-2)),
        }
    )
    return coords


def test_actual_inventory_detects_an_off_support_alternate_four_fiber() -> None:
    replay = subject.target_multiplicity_replay(_alternate_four_fiber_coordinates())
    ku = replay["before_deletion"]["Ku"]
    assert ku["multiplicity_vector"][:2] == [4, 4]
    assert not replay["full_uniqueness_checks"]["Ku"]["accepted"]
    assert not replay["full_uniqueness_accepted"]


def test_deletion_classification_detects_a_corrupted_survive_cell() -> None:
    maxima = {
        "u": {"Ku": 3, "Ks": 4, "Kr": 3},
        "s": {"Ku": 3, "Ks": 3, "Kr": 4},
        "r": {"Ku": 4, "Ks": 3, "Kr": 3},
    }
    assert (
        subject.deletion_matrix_from_maxima(maxima) == subject.EXPECTED_DELETION_MATRIX
    )
    maxima["u"]["Ks"] = 3
    assert (
        subject.deletion_matrix_from_maxima(maxima) != subject.EXPECTED_DELETION_MATRIX
    )


def test_all_order_encoding_has_every_ordered_exposure_pair() -> None:
    commands = subject.build_smt_commands(
        subject.build_target_system("all-order", "row-equalities")
    )
    exposure = [command for command in commands if "(* nx_" in command]
    assert len(exposure) == 18 * 17
    assert any("nx_O" in command and "x_p" in command for command in exposure)
    assert any("nx_p" in command and "x_O" in command for command in exposure)


@pytest.mark.parametrize("mode", ("fixed-forward", "fixed-reverse"))
def test_fixed_order_encoding_has_18_times_16_halfplanes(mode: str) -> None:
    system = subject.build_target_system(mode, "row-equalities")
    commands = subject.build_smt_commands(system)
    assert subject.formula_inventory(system)["convexity"] == 18 * 16
    assert sum("(- (* (- x_" in command for command in commands) == 18 * 16


def test_exact_hull_derivation_recovers_all_control_points() -> None:
    points = subject.checkpoint16_control_points()
    derived = subject.derive_cyclic_hull_order(points)
    assert set(derived) == set(subject.CONTROL_ORDER)
    assert len(derived) == 10


def test_exact_parser_rejects_algebraic_values() -> None:
    with pytest.raises(subject.S0FullRowError, match="unsupported"):
        subject._parse_values("((x (root-obj (+ (^ x 2) (- 2)) 1)))", ("x",))


def test_algebraic_sat_readback_is_classified_unknown() -> None:
    prepared = subject.prepare_query(subject.build_control_system("positive"))
    replay = subject.verify_sat_model(
        prepared.query,
        "z3",
        "(model)",
        "((x_O (root-obj (+ (^ x 2) (- 2)) 1)))",
    )
    assert not replay.accepted
    assert replay.evidence["replay_status"] == "UNKNOWN"


def test_prepared_query_binds_byte_identical_journal() -> None:
    prepared = subject.prepare_query(
        subject.build_target_system("fixed-forward", "row-equalities"), timeout_ms=1234
    )
    assert prepared.query.original_smt2 == prepared.query.journal_smt2
    assert prepared.query.journal_smt2 == b"".join(
        command.encode("ascii") + b"\n" for command in prepared.query.journal_commands
    )
    assert prepared.query.descriptor["solver_profile"]["solvers"] == list(
        subject.adapter.SOLVERS
    )
    assert prepared.query.descriptor["solver_profile"]["timeout_ms"] == 1234


def test_checkpoint_and_manifest_governance(
    monkeypatch: pytest.MonkeyPatch, tmp_path
) -> None:
    checkpoint = subject.authenticate_checkpoint()
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run-0001")
    root, manifest = subject.ensure_run_root()
    assert manifest["base_head"] == checkpoint["base_head"]
    assert manifest["source_digests"]
    assert manifest["input_digests"]
    assert manifest["manifest_sha256"] == subject._self_hash(
        manifest, "manifest_sha256"
    )
    assert json.loads((root / "run_manifest.json").read_text()) == manifest
    assert not any((root / "artifacts").iterdir())
    assert not any((root / "events").iterdir())
    root_again, manifest_again = subject.ensure_run_root()
    assert root_again == root
    assert manifest_again == manifest


def test_checkpoint_base_head_must_be_an_ancestor(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    class Result:
        returncode = 1

    monkeypatch.setattr(subject.subprocess, "run", lambda *args, **kwargs: Result())
    with pytest.raises(subject.S0FullRowError, match="base_head"):
        subject.authenticate_checkpoint()


def test_manifest_refuses_preexisting_unbound_artifact(
    monkeypatch: pytest.MonkeyPatch, tmp_path
) -> None:
    run_root = tmp_path / "run-0001"
    run_root.mkdir()
    (run_root / "orphan").write_text("unbound\n")
    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    with pytest.raises(subject.S0FullRowError, match="no manifest"):
        subject.ensure_run_root()


def test_targets_cannot_run_without_control_prefix(
    monkeypatch: pytest.MonkeyPatch, tmp_path
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run-0001")
    with pytest.raises(subject.S0FullRowError, match="controls first"):
        subject.run_diagnostic(query_keys=("target-all-order-row-equalities",))


def test_invalid_launch_inputs_create_no_generated_root(
    monkeypatch: pytest.MonkeyPatch, tmp_path
) -> None:
    run_root = tmp_path / "run-0001"
    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    with pytest.raises(subject.S0FullRowError, match="invalid timeout"):
        subject.run_diagnostic(timeout_ms=0)
    assert not run_root.exists()
    with pytest.raises(subject.adapter.SmtSourceAdapterError, match="invalid PIQD"):
        subject.run_diagnostic(server="not-a-url")
    assert not run_root.exists()


def test_generated_root_symlink_is_rejected(
    monkeypatch: pytest.MonkeyPatch, tmp_path
) -> None:
    target = tmp_path / "target"
    target.mkdir()
    run_root = tmp_path / "run-0001"
    run_root.symlink_to(target, target_is_directory=True)
    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    with pytest.raises(subject.S0FullRowError, match="symlink"):
        subject.ensure_run_root()


def test_generated_root_parent_symlink_is_rejected(
    monkeypatch: pytest.MonkeyPatch, tmp_path
) -> None:
    target = tmp_path / "target"
    target.mkdir()
    linked_parent = tmp_path / "linked"
    linked_parent.symlink_to(target, target_is_directory=True)
    monkeypatch.setattr(subject, "RUN_ROOT", linked_parent / "lane" / "run-0001")
    with pytest.raises(subject.S0FullRowError, match="symlink path component"):
        subject.ensure_run_root()


def test_generated_root_regular_file_is_rejected(
    monkeypatch: pytest.MonkeyPatch, tmp_path
) -> None:
    run_root = tmp_path / "run-0001"
    run_root.write_text("not a directory\n")
    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    with pytest.raises(subject.S0FullRowError, match="not a directory"):
        subject.ensure_run_root()


def test_completed_run_validates_launch_before_return(tmp_path) -> None:
    events = tmp_path / "events"
    events.mkdir()
    (events / "launch.json").write_text("{}\n")
    (events / "terminal.json").write_text("{}\n")
    with pytest.raises(subject.S0FullRowError, match="launch drifted"):
        subject._validate_completed_run(
            tmp_path,
            {"manifest_sha256": "0" * 64},
            server="http://127.0.0.1:7272",
            timeout_ms=60_000,
            keys=("control-positive",),
        )
