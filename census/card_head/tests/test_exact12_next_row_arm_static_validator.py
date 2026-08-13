from __future__ import annotations

import os
from pathlib import Path

import pytest

import census.card_head.exact12_next_row_arm_static_validator as validator
from census.card_head.exact12_next_row_arm_static_validator import (
    ArmStaticWorkdirValidationError,
    _assert_directory,
    _read,
    _strict_json,
    _validate_assignment,
    validate_arm_static_workdir,
)

WORKDIR = Path(
    "scratch/rigid221-sourceheavy-anchor/"
    "exact12-next-row-arm-static-canary-cell6-20260812-v21-"
    "reciprocal-first-opposite-surplus-second-opposite-common-five-retry1"
)


def test_preserved_v21_is_valid_without_transport_or_source_refresh() -> None:
    result = validate_arm_static_workdir(WORKDIR)
    assert result["valid"] is True
    assert result["finite_diagnostic_only"] is True
    assert result["classification"] == "STRUCTURALLY_UNRESOLVED"
    assert result["dimacs"]["satisfied"] == 645155


def test_current_source_mode_reports_provenance_drift() -> None:
    with pytest.raises(ArmStaticWorkdirValidationError, match="live source"):
        validate_arm_static_workdir(WORKDIR, repo_root=Path("."))


def test_validator_rejects_symlinked_control_file(tmp_path: Path) -> None:
    target = tmp_path / "real.json"
    target.write_text("{}")
    link = tmp_path / "summary.json"
    link.symlink_to(target)
    with pytest.raises(
        ArmStaticWorkdirValidationError, match="symlink|Too many levels"
    ):
        _read(link)


def test_validator_rejects_hardlinked_control_file(tmp_path: Path) -> None:
    target = tmp_path / "real.json"
    target.write_text("{}")
    alias = tmp_path / "summary.json"
    os.link(target, alias)
    with pytest.raises(ArmStaticWorkdirValidationError, match="hard-linked"):
        _read(alias)


def test_validator_rejects_symlinked_ancestor(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    (real / "summary.json").write_text("{}")
    alias = tmp_path / "alias"
    alias.symlink_to(real, target_is_directory=True)
    with pytest.raises(ArmStaticWorkdirValidationError, match="symlink"):
        _read(alias / "summary.json")


def test_validator_rejects_symlinked_directory_identity(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    alias = tmp_path / "alias"
    alias.symlink_to(real, target_is_directory=True)
    with pytest.raises(ArmStaticWorkdirValidationError, match="symlink|traverse"):
        _assert_directory(alias)


def test_validator_bounds_json_and_rejects_hostile_assignment(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setattr(validator, "MAX_JSON_BYTES", 4)
    with pytest.raises(ArmStaticWorkdirValidationError, match="bounded size"):
        _strict_json(b"12345", tmp_path / "hostile.json")
    monkeypatch.setattr(validator, "MAX_JSON_BYTES", 64)
    with pytest.raises(ArmStaticWorkdirValidationError, match="non-finite"):
        _strict_json(b"NaN", tmp_path / "nan.json")
    assignment = list(range(1, validator.EXPECTED_VARIABLES + 1))
    assignment[-1] = -1
    with pytest.raises(ArmStaticWorkdirValidationError, match="duplicate variable"):
        _validate_assignment(assignment)
    assignment[0] = True
    with pytest.raises(ArmStaticWorkdirValidationError, match="invalid signed literal"):
        _validate_assignment(assignment)
