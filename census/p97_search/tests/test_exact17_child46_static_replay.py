"""Focused custody and source-replay tests for the registered Child46 SAT seam."""

from __future__ import annotations

import json
import stat
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

import census.p97_search.exact17_child46_static_replay as replay
from census.p97_search.exact17_source_model_replay import (
    canonical_assignment_from_source_model,
)

_SOURCE_MODEL: dict[str, Any] = {
    "rows": [
        [3, 6, 11, 14],
        [3, 4, 5, 13],
        [0, 1, 10, 15],
        [2, 4, 8, 15],
        [1, 5, 7, 11],
        [0, 2, 7, 13],
        [0, 4, 8, 11],
        [1, 2, 12, 16],
        [4, 6, 9, 16],
        [5, 6, 7, 13],
        [1, 8, 9, 14],
        [3, 8, 10, 15],
        [7, 8, 9, 16],
        [0, 5, 14, 16],
        [11, 13, 15, 16],
        [3, 10, 11, 16],
        [12, 13, 14, 15],
    ],
    "next_center": 0,
    "named_order": 0,
    "selected_order": [0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14],
    "digest": "ac327ee239463b615d5f551f54f185d8ceb80e9d82349fa238e684780bbb615a",
}


def _control() -> Any:
    return SimpleNamespace(
        registration=SimpleNamespace(
            wave_kind="STATIC_CNF",
            adapter_id="static-cnf-piqd",
            schema_version="v2",
            semantic_validator="p97-static-cnf-semantic-profile/v1",
        ),
        cnf=SimpleNamespace(sha256=replay.CHILD46_ROOT_SHA256),
        semantic_profile=SimpleNamespace(sha256=replay.CHILD46_PROFILE_SHA256),
        semantic_artifacts=(("parent_cnf", SimpleNamespace(sha256=replay.CHILD46_PARENT_SHA256)),),
    )


def _envelope() -> dict[str, Any]:
    assignment = canonical_assignment_from_source_model(_SOURCE_MODEL)
    return {
        "control": {"sha256": "c" * 64},
        "envelope_sha256": "e" * 64,
        "package": {"cnf_sha256": replay.CHILD46_ROOT_SHA256},
        "receipt": {
            "cnf_sha256": replay.CHILD46_ROOT_SHA256,
            "model_response_sha256": "m" * 64,
            "num_clauses": replay.CHILD46_CLAUSES,
            "num_variables": replay.CHILD46_VARIABLES,
            "source_manifest_sha256": replay.CHILD46_RUNNER_SOURCE_MANIFEST_SHA256,
        },
        "result": {
            "assignment": {
                str(abs(literal)): literal > 0 for literal in assignment
            },
            "classification": replay.SAT_OBSERVED,
            "returncode": 10,
            "verdict": "SAT",
        },
        "semantic_profile": {
            "metadata": {
                "profile_id": replay.CHILD46_PROFILE_ID,
                "validator": replay.CHILD46_PROFILE_VALIDATOR,
            },
            "sha256": replay.CHILD46_PROFILE_SHA256,
        },
        "wave_manifest": {
            "manifest": {
                "encoding": {
                    "cnf_sha256": replay.CHILD46_ROOT_SHA256,
                    "num_clauses": replay.CHILD46_CLAUSES,
                    "num_variables": replay.CHILD46_VARIABLES,
                },
                "source": {
                    "finite_schema": "p97-exact17-forty-sixth-export-validation/v1",
                    "ingress_hypotheses_sha256": replay.CHILD46_SOURCE_SHA256,
                    "live_leaf": "exact17-child46-forty-sixth-model-refinements",
                    "source_theorem": (
                        "Problem97.ATailBlockerVExactSeventeenFortySixthModelRefinements."
                        "sourceAssign_extendedFortySixthModelRefinementsCnf"
                    ),
                },
            }
        },
    }


def _run(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    *,
    envelope: dict[str, Any] | None = None,
    control: Any | None = None,
) -> replay.Child46StaticSatReplay:
    control_path = tmp_path / "control.json"
    output_path = tmp_path / "output.json"
    control_path.write_bytes(b"registered-control")
    output_path.write_bytes(b"registered-output")
    bound_control = _control() if control is None else control
    bound_envelope = _envelope() if envelope is None else envelope
    monkeypatch.setattr(replay, "load_wave_control", lambda data: bound_control)
    monkeypatch.setattr(
        replay,
        "validate_registered_output",
        lambda loaded, package_root, path: bound_envelope,
    )
    return replay.replay_child46_static_sat(
        control_path=control_path,
        package_root=tmp_path,
        output_path=output_path,
    )


def test_registered_sat_replays_source_and_is_deterministic(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    first = _run(monkeypatch, tmp_path)
    second = _run(monkeypatch, tmp_path)

    assert first.source_model.next_center == 0
    assert first.source_model.digest == _SOURCE_MODEL["digest"]
    assert first.metric_mine == replay.METRIC_MINE_DEFERRED
    assert first.as_dict() == second.as_dict()
    assert first.json_bytes() == second.json_bytes()
    assert json.loads(first.json_bytes())["replay_sha256"] == first.replay_sha256


def test_write_replay_publishes_once_with_private_mode(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    control_path = tmp_path / "control.json"
    output_path = tmp_path / "output.json"
    replay_path = tmp_path / "replay.json"
    control_path.write_bytes(b"registered-control")
    output_path.write_bytes(b"registered-output")
    monkeypatch.setattr(replay, "load_wave_control", lambda data: _control())
    monkeypatch.setattr(
        replay,
        "validate_registered_output",
        lambda loaded, package_root, path: _envelope(),
    )

    result = replay.write_child46_static_sat_replay(
        control_path=control_path,
        package_root=tmp_path,
        output_path=output_path,
        replay_path=replay_path,
    )

    assert replay_path.read_bytes() == result.json_bytes() + b"\n"
    assert stat.S_IMODE(replay_path.stat().st_mode) == 0o600
    with pytest.raises(replay.Child46StaticReplayError, match="publication failed"):
        replay.write_child46_static_sat_replay(
            control_path=control_path,
            package_root=tmp_path,
            output_path=output_path,
            replay_path=replay_path,
        )


@pytest.mark.parametrize(
    "mutation",
    [
        pytest.param(
            lambda envelope: envelope["semantic_profile"].update(
                metadata={"profile_id": "wrong", "validator": replay.CHILD46_PROFILE_VALIDATOR}
            ),
            id="profile-mutation",
        ),
        pytest.param(
            lambda envelope: envelope["package"].update(cnf_sha256="f" * 64),
            id="root-mutation",
        ),
        pytest.param(
            lambda envelope: envelope["wave_manifest"]["manifest"]["source"].update(
                ingress_hypotheses_sha256="f" * 64
            ),
            id="source-mutation",
        ),
        pytest.param(
            lambda envelope: envelope["receipt"].update(
                source_manifest_sha256=replay.CHILD46_SOURCE_SHA256
            ),
            id="runner-source-manifest-is-not-ingress-hypotheses",
        ),
        pytest.param(
            lambda envelope: envelope["result"].update(
                classification="UNSAT_OBSERVED_DISCOVERY_ONLY"
            ),
            id="result-mutation",
        ),
        pytest.param(
            lambda envelope: envelope["result"]["assignment"].update({"1": True}),
            id="assignment-mutation",
        ),
        pytest.param(
            lambda envelope: envelope["result"]["assignment"].pop("308"),
            id="assignment-not-total",
        ),
    ],
)
def test_registered_replay_fails_closed_on_mutation(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    mutation: Any,
) -> None:
    envelope = _envelope()
    mutation(envelope)
    with pytest.raises(replay.Child46StaticReplayError):
        _run(monkeypatch, tmp_path, envelope=envelope)


def test_control_root_and_parent_are_registered(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    for field, value in (
        ("cnf", SimpleNamespace(sha256="f" * 64)),
        ("semantic_profile", SimpleNamespace(sha256="f" * 64)),
        ("semantic_artifacts", (("parent_cnf", SimpleNamespace(sha256="f" * 64)),)),
    ):
        control = _control()
        setattr(control, field, value)
        with pytest.raises(replay.Child46StaticReplayError):
            _run(monkeypatch, tmp_path, control=control)


def test_registered_validator_is_mandatory(monkeypatch: pytest.MonkeyPatch, tmp_path: Path) -> None:
    control_path = tmp_path / "control.json"
    output_path = tmp_path / "output.json"
    control_path.write_bytes(b"registered-control")
    output_path.write_bytes(b"registered-output")
    monkeypatch.setattr(replay, "load_wave_control", lambda data: _control())
    calls: list[tuple[Any, Path, Path]] = []

    def reject(*args: Any) -> dict[str, Any]:
        calls.append(args)
        raise RuntimeError("structural-only path forbidden")

    monkeypatch.setattr(replay, "validate_registered_output", reject)
    with pytest.raises(replay.Child46StaticReplayError):
        replay.replay_child46_static_sat(
            control_path=control_path,
            package_root=tmp_path,
            output_path=output_path,
        )
    assert len(calls) == 1
