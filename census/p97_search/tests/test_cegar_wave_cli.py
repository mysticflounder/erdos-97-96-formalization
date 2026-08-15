from __future__ import annotations

import json
from pathlib import Path
from types import SimpleNamespace

import pytest

import census.p97_search.cegar_wave_cli as cli
from census.p97_search.phase3_cegar_wave_control import ASSUMPTION_CNF
from census.p97_search.tests.test_cegar_wave_registry import (
    _fixture_data_only_control,
)
from census.p97_search.tests.test_phase3_cegar_wave_engine import _fixture_control
from census.p97_search.tests.test_phase3_smt_oneshot_engine import (
    _packet as _smt_packet,
)


def _control_file(tmp_path: Path) -> tuple[Path, Path]:
    control, package_root, _, _ = _fixture_control(tmp_path)
    path = tmp_path / "control.json"
    path.write_bytes(control.canonical_bytes)
    return path, package_root


def _data_only_control_file(tmp_path: Path) -> tuple[Path, Path]:
    control, package_root, _receipt = _fixture_data_only_control(tmp_path)
    path = tmp_path / "data-only-control.json"
    path.write_bytes(control.canonical_bytes)
    return path, package_root


def _smt_control_file(tmp_path: Path) -> tuple[Path, Path]:
    control, package_root = _smt_packet(tmp_path / "smt-packet")
    path = tmp_path / "smt-control.json"
    path.write_bytes(control.canonical_bytes)
    return path, package_root


def _json_stdout(capsys: pytest.CaptureFixture[str]) -> dict[str, object]:
    captured = capsys.readouterr()
    assert captured.err == ""
    return json.loads(captured.out)


def _validated_output() -> dict[str, object]:
    return {
        "result": {"classification": "UNSAT_OBSERVED_DISCOVERY_ONLY"},
        "envelope_sha256": "b" * 64,
    }


def _assumption_validated_output() -> dict[str, object]:
    return {
        "summary": {"classification": "CELLS_UNSAT_DISCOVERY_ONLY"},
        "envelope_sha256": "c" * 64,
    }


def test_status_reports_structural_observation_only(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "result.json"
    monkeypatch.setattr(
        cli, "inspect_registered_output_structure", lambda path: _validated_output()
    )

    assert cli.main(["status", str(output)]) == 0
    status = _json_stdout(capsys)
    assert status["schema"] == cli.CLI_SCHEMA
    assert status["status"] == "OBSERVED"
    assert status["classification"] == "UNSAT_OBSERVED_DISCOVERY_ONLY"
    assert status["custody_status"] == "STRUCTURAL_ONLY"


def test_status_and_validation_accept_assumption_engine_summary(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "assumption-result.json"
    monkeypatch.setattr(
        cli,
        "inspect_registered_output_structure",
        lambda path: _assumption_validated_output(),
    )
    assert cli.main(["status", str(output)]) == 0
    assert _json_stdout(capsys)["classification"] == "CELLS_UNSAT_DISCOVERY_ONLY"

    control_path, package_root = _control_file(tmp_path)
    monkeypatch.setattr(
        cli,
        "validate_registered_output",
        lambda *args: _assumption_validated_output(),
    )
    assert (
        cli.main(
            [
                "validate-output",
                str(control_path),
                str(output),
                "--package-root",
                str(package_root),
            ]
        )
        == 0
    )
    assert _json_stdout(capsys)["classification"] == "CELLS_UNSAT_DISCOVERY_ONLY"


def test_validate_replay_is_distinct_strict_command(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    output = tmp_path / "assumption-result.json"
    monkeypatch.setattr(
        cli,
        "validate_registered_replay",
        lambda *args: _assumption_validated_output(),
    )
    assert (
        cli.main(
            [
                "validate-replay",
                str(control_path),
                str(output),
                "--package-root",
                str(package_root),
            ]
        )
        == 0
    )
    payload = _json_stdout(capsys)
    assert payload["command"] == "validate-replay"
    assert payload["custody_status"] == "OFFLINE_CROSS_BOUND"


def test_plan_reports_registered_execution(
    tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    control_path, package_root = _control_file(tmp_path)

    assert (
        cli.main(["plan", str(control_path), "--package-root", str(package_root)]) == 0
    )
    plan = _json_stdout(capsys)
    assert plan["schema"] == cli.CLI_SCHEMA
    assert plan["execution"]["plan"]["proof_path"] is None
    assert plan["execution"]["ingress"]["num_variables"] == 3


def test_validate_ingress_is_transport_free(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    monkeypatch.setattr(
        cli,
        "execute_registered_wave",
        lambda *args, **kwargs: pytest.fail("execution was reached"),
    )

    assert (
        cli.main(
            [
                "validate-ingress",
                str(control_path),
                "--package-root",
                str(package_root),
            ]
        )
        == 0
    )
    payload = _json_stdout(capsys)
    assert payload["status"] == "PASS"
    assert payload["ingress"]["num_clauses"] == 2


def test_data_only_cli_plans_and_validates_but_cannot_run(
    tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    control_path, package_root = _data_only_control_file(tmp_path)
    output = tmp_path / "result.json"
    journal = tmp_path / "journal"

    assert (
        cli.main(["plan", str(control_path), "--package-root", str(package_root)]) == 0
    )
    plan = _json_stdout(capsys)
    assert plan["execution"]["plan"]["steps"][-1] == "stop-without-execution"

    assert (
        cli.main(
            [
                "validate-ingress",
                str(control_path),
                "--package-root",
                str(package_root),
            ]
        )
        == 0
    )
    ingress = _json_stdout(capsys)["ingress"]
    retained = {row["role"]: row for row in ingress["semantic_artifacts"]}[
        "daemon_build_receipt"
    ]
    assert retained["link_count"] == 3
    assert retained["custody"] == "RETAINED_LEGACY_HARDLINK_REFERENCE"

    assert (
        cli.main(
            [
                "run",
                str(control_path),
                "--package-root",
                str(package_root),
                "--output",
                str(output),
                "--journal-root",
                str(journal),
            ]
        )
        == 2
    )
    captured = capsys.readouterr()
    error = json.loads(captured.err)
    assert error["error"] == "registered data-only wave cannot execute"
    assert not output.exists()
    assert not journal.exists()


def test_run_delegates_once_and_never_exposes_proof_path(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    output = tmp_path / "result.json"
    journal = tmp_path / "journal"
    seen: list[tuple[object, ...]] = []

    def fake_execute(control: object, root: object, **kwargs: object) -> object:
        seen.append((control, root, kwargs))
        return SimpleNamespace(
            classification="SAT_OBSERVED",
            envelope={"envelope_sha256": "a" * 64},
            envelope_path=output,
        )

    monkeypatch.setattr(cli, "execute_registered_wave", fake_execute)
    assert (
        cli.main(
            [
                "run",
                str(control_path),
                "--package-root",
                str(package_root),
                "--output",
                str(output),
                "--journal-root",
                str(journal),
                "--timeout-s",
                "17",
            ]
        )
        == 0
    )
    payload = _json_stdout(capsys)
    assert payload["classification"] == "SAT_OBSERVED"
    assert len(seen) == 1
    kwargs = seen[0][2]
    assert kwargs == {
        "output_path": output,
        "base_url": "http://127.0.0.1:7272",
        "journal_root": journal,
        "timeout_s": 17,
    }
    assert "proof_path" not in kwargs


def test_recover_static_delegates_offline_to_sealed_receipt(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    output = tmp_path / "result.json"
    receipt = tmp_path / "solver-receipt.json"
    receipt.write_text("{}")
    seen: list[tuple[object, ...]] = []

    def fake_recover(control: object, root: object, **kwargs: object) -> object:
        seen.append((control, root, kwargs))
        return SimpleNamespace(
            classification="SAT_OBSERVED",
            envelope={"envelope_sha256": "e" * 64},
            envelope_path=output,
        )

    monkeypatch.setattr(cli, "recover_registered_static_output", fake_recover)
    assert (
        cli.main(
            [
                "recover-static",
                str(control_path),
                str(receipt),
                "--package-root",
                str(package_root),
                "--output",
                str(output),
            ]
        )
        == 0
    )
    payload = _json_stdout(capsys)
    assert payload["classification"] == "SAT_OBSERVED"
    assert payload["custody_status"] == "OFFLINE_CROSS_BOUND"
    assert len(seen) == 1
    assert seen[0][2] == {"output_path": output, "receipt_path": receipt}


def test_run_forwards_only_assumption_specific_solver_signature(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    output = tmp_path / "assumption-result.json"
    seen: list[dict[str, object]] = []
    assumption_control = SimpleNamespace(
        registration=SimpleNamespace(wave_kind=ASSUMPTION_CNF)
    )

    def fake_execute(*args: object, **kwargs: object) -> object:
        seen.append(kwargs)
        return SimpleNamespace(
            classification="INCONCLUSIVE",
            envelope={"envelope_sha256": "d" * 64},
            output_path=output,
        )

    monkeypatch.setattr(cli, "_load_control", lambda _path: assumption_control)
    monkeypatch.setattr(cli, "execute_registered_wave", fake_execute)
    assert (
        cli.main(
            [
                "run",
                str(control_path),
                "--package-root",
                str(package_root),
                "--output",
                str(output),
                "--solver-signature",
                "cadical-current",
                "--existing-session-id",
                "11111111-1111-4111-8111-111111111111",
            ]
        )
        == 0
    )
    assert _json_stdout(capsys)["output"] == str(output)
    assert seen == [
        {
            "output_path": output,
            "base_url": "http://127.0.0.1:7272",
            "timeout_s": None,
            "solver_signature": "cadical-current",
            "resume_session": "11111111-1111-4111-8111-111111111111",
        }
    ]


def test_run_rejects_existing_session_for_static_control_before_execution(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    monkeypatch.setattr(
        cli,
        "execute_registered_wave",
        lambda *args, **kwargs: pytest.fail("execution was reached"),
    )
    assert (
        cli.main(
            [
                "run",
                str(control_path),
                "--package-root",
                str(package_root),
                "--output",
                str(tmp_path / "result.json"),
                "--journal-root",
                str(tmp_path / "journal"),
                "--existing-session-id",
                "11111111-1111-4111-8111-111111111111",
            ]
        )
        == 2
    )
    captured = capsys.readouterr()
    assert captured.out == ""
    assert "permitted only for ASSUMPTION_CNF run" in captured.err


def test_run_rejects_noncanonical_existing_session_before_execution(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    assumption_control = SimpleNamespace(
        registration=SimpleNamespace(wave_kind=ASSUMPTION_CNF)
    )
    monkeypatch.setattr(cli, "_load_control", lambda _path: assumption_control)
    monkeypatch.setattr(
        cli,
        "execute_registered_wave",
        lambda *args, **kwargs: pytest.fail("execution was reached"),
    )
    assert (
        cli.main(
            [
                "run",
                str(control_path),
                "--package-root",
                str(package_root),
                "--output",
                str(tmp_path / "result.json"),
                "--solver-signature",
                "cadical-current",
                "--existing-session-id",
                "11111111-1111-4111-8111-11111111111A",
            ]
        )
        == 2
    )
    captured = capsys.readouterr()
    assert captured.out == ""
    assert "canonical UUID" in captured.err


def test_non_run_command_rejects_existing_session_at_argument_boundary(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    monkeypatch.setattr(
        cli,
        "_load_control",
        lambda _path: pytest.fail("control loading was reached"),
    )
    with pytest.raises(SystemExit) as error:
        cli.main(
            [
                "plan",
                str(control_path),
                "--package-root",
                str(package_root),
                "--existing-session-id",
                "11111111-1111-4111-8111-111111111111",
            ]
        )
    assert error.value.code == 2


def test_public_cli_rejects_legacy_resume_session_alias_before_control_loading(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    monkeypatch.setattr(
        cli,
        "_load_control",
        lambda _path: pytest.fail("control loading was reached"),
    )
    with pytest.raises(SystemExit) as error:
        cli.main(
            [
                "run",
                str(control_path),
                "--package-root",
                str(package_root),
                "--output",
                str(tmp_path / "result.json"),
                "--resume-session",
                "11111111-1111-4111-8111-111111111111",
            ]
        )
    assert error.value.code == 2


def test_validate_output_cross_binds_control_without_transport(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    output = tmp_path / "result.json"
    monkeypatch.setattr(
        cli,
        "execute_registered_wave",
        lambda *args, **kwargs: pytest.fail("transport was reached"),
    )
    monkeypatch.setattr(
        cli,
        "validate_registered_output",
        lambda control, root, path: _validated_output(),
    )

    assert (
        cli.main(
            [
                "validate-output",
                str(control_path),
                str(output),
                "--package-root",
                str(package_root),
            ]
        )
        == 0
    )
    payload = _json_stdout(capsys)
    assert payload["status"] == "PASS"
    assert payload["classification"] == "UNSAT_OBSERVED_DISCOVERY_ONLY"


def test_check_cross_binds_control_package_and_output_without_transport(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    output = tmp_path / "result.json"
    seen: list[tuple[object, ...]] = []

    def fake_check(control: object, root: object, path: object) -> dict[str, object]:
        seen.append((control, root, path))
        return _validated_output()

    monkeypatch.setattr(cli, "validate_registered_output", fake_check)
    monkeypatch.setattr(
        cli,
        "execute_registered_wave",
        lambda *args, **kwargs: pytest.fail("transport was reached"),
    )
    assert (
        cli.main(
            [
                "check",
                str(control_path),
                str(output),
                "--package-root",
                str(package_root),
            ]
        )
        == 0
    )
    payload = _json_stdout(capsys)
    assert payload["status"] == "PASS"
    assert payload["custody_status"] == "OFFLINE_CROSS_BOUND"
    assert len(seen) == 1
    assert seen[0][1:] == (package_root, output)


@pytest.mark.parametrize("timeout", ["0", "-1"])
def test_run_rejects_nonpositive_timeout_before_execution(
    timeout: str,
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    monkeypatch.setattr(
        cli,
        "execute_registered_wave",
        lambda *args, **kwargs: pytest.fail("execution was reached"),
    )
    result = cli.main(
        [
            "run",
            str(control_path),
            "--package-root",
            str(package_root),
            "--output",
            str(tmp_path / "result.json"),
            "--journal-root",
            str(tmp_path / "journal"),
            "--timeout-s",
            timeout,
        ]
    )
    assert result == 2
    captured = capsys.readouterr()
    assert captured.out == ""
    assert "positive integer" in captured.err


def test_relative_paths_fail_closed(
    tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    output = tmp_path / "result.json"
    assert cli.main(["status", output.name]) == 2
    captured = capsys.readouterr()
    assert captured.out == ""
    assert "absolute native path" in captured.err


@pytest.mark.parametrize("error", [RuntimeError("boom"), KeyboardInterrupt()])
def test_unexpected_and_process_control_exceptions_propagate(
    error: BaseException,
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    control_path, package_root = _control_file(tmp_path)
    output = tmp_path / "result.json"

    def explode(control: object, root: Path, path: Path) -> dict[str, object]:
        raise error

    monkeypatch.setattr(cli, "validate_registered_output", explode)
    with pytest.raises(type(error)):
        cli.main(
            [
                "validate-output",
                str(control_path),
                str(output),
                "--package-root",
                str(package_root),
            ]
        )


@pytest.mark.parametrize(
    ("command", "status"),
    [
        ("lifecycle-plan", "LEGACY_COMPATIBLE_PIQD_LIFECYCLE"),
        ("lifecycle-cleanup-status", "RETAIN"),
    ],
)
def test_lifecycle_reports_are_transport_free(
    command: str,
    status: str,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        cli.exact17_lifecycle,
        "new_client",
        lambda *args, **kwargs: pytest.fail("transport was reached"),
    )
    assert cli.main([command, "--profile", "exact17-child38"]) == 0
    payload = _json_stdout(capsys)
    assert payload["profile"] == "exact17-child38"
    lifecycle = payload["lifecycle"]
    assert isinstance(lifecycle, dict)
    assert status in lifecycle.values()


def test_lifecycle_local_validation_is_transport_free(
    capsys: pytest.CaptureFixture[str], monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(
        cli.exact17_lifecycle,
        "new_client",
        lambda *args, **kwargs: pytest.fail("transport was reached"),
    )
    monkeypatch.setattr(
        cli.exact17_lifecycle,
        "validate_local",
        lambda profile: {"profile": profile, "validated": True},
    )
    assert cli.main(["lifecycle-validate-local", "--profile", "exact17-child38"]) == 0
    payload = _json_stdout(capsys)
    assert payload["lifecycle"] == {
        "profile": "exact17-child38",
        "validated": True,
    }


def test_lifecycle_start_constructs_one_client_and_delegates(
    capsys: pytest.CaptureFixture[str], monkeypatch: pytest.MonkeyPatch
) -> None:
    client = object()
    calls: list[tuple[object, str]] = []
    monkeypatch.setattr(cli.exact17_lifecycle, "new_client", lambda profile: client)

    def start(received: object, profile: str) -> dict[str, object]:
        calls.append((received, profile))
        return {"phase": "confirmed"}

    monkeypatch.setattr(cli.exact17_lifecycle, "start", start)
    assert cli.main(["lifecycle-start", "--profile", "exact17-child38"]) == 0
    assert calls == [(client, "exact17-child38")]
    assert _json_stdout(capsys)["lifecycle"] == {"phase": "confirmed"}


def test_lifecycle_reconcile_forwards_the_exact_job_id(
    capsys: pytest.CaptureFixture[str], monkeypatch: pytest.MonkeyPatch
) -> None:
    client = object()
    calls: list[tuple[object, str, str]] = []
    monkeypatch.setattr(cli.exact17_lifecycle, "new_client", lambda profile: client)

    def reconcile(received: object, job_id: str, profile: str) -> dict[str, object]:
        calls.append((received, job_id, profile))
        return {"phase": "confirmed"}

    monkeypatch.setattr(cli.exact17_lifecycle, "reconcile", reconcile)
    assert (
        cli.main(
            [
                "lifecycle-reconcile",
                "--profile",
                "exact17-child38",
                "--job-id",
                "job-child38",
            ]
        )
        == 0
    )
    assert calls == [(client, "job-child38", "exact17-child38")]
    assert _json_stdout(capsys)["status"] == "PASS"


def test_lifecycle_invalid_profile_fails_before_client_construction(
    capsys: pytest.CaptureFixture[str], monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(
        cli.exact17_lifecycle,
        "new_client",
        lambda *args, **kwargs: pytest.fail("client construction was reached"),
    )
    assert cli.main(["lifecycle-start", "--profile", "exact17-child39"]) == 2
    captured = capsys.readouterr()
    assert captured.out == ""
    assert "exact builtin string" in captured.err


def test_lifecycle_known_unprovisioned_error_is_reported(
    capsys: pytest.CaptureFixture[str], monkeypatch: pytest.MonkeyPatch
) -> None:
    def unprovisioned(profile: str) -> dict[str, object]:
        raise cli.exact17_lifecycle.UnprovisionedError("missing frozen input")

    monkeypatch.setattr(cli.exact17_lifecycle, "validate_local", unprovisioned)
    assert cli.main(["lifecycle-validate-local", "--profile", "exact17-child38"]) == 2
    captured = capsys.readouterr()
    assert captured.out == ""
    assert "missing frozen input" in captured.err


@pytest.mark.parametrize("error", [RuntimeError("boom"), KeyboardInterrupt()])
def test_lifecycle_unexpected_and_process_control_exceptions_propagate(
    error: BaseException, monkeypatch: pytest.MonkeyPatch
) -> None:
    def explode(profile: str) -> dict[str, object]:
        raise error

    monkeypatch.setattr(cli.exact17_lifecycle, "validate_local", explode)
    with pytest.raises(type(error)):
        cli.main(["lifecycle-validate-local", "--profile", "exact17-child38"])


@pytest.mark.parametrize(
    "foreign_args",
    [
        ["--journal-root", "/tmp/journal"],
        ["--timeout-s", "3"],
        ["--solver-signature", "foreign"],
        ["--existing-session-id", "00000000-0000-4000-8000-000000000001"],
    ],
)
def test_smt_run_rejects_static_and_assumption_options_before_dispatch(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
    foreign_args: list[str],
) -> None:
    control_path, package_root = _smt_control_file(tmp_path)
    dispatched = False

    def forbidden(*args: object, **kwargs: object) -> object:
        nonlocal dispatched
        dispatched = True
        raise AssertionError("dispatch reached")

    monkeypatch.setattr(cli, "execute_registered_wave", forbidden)
    argv = [
        "run",
        str(control_path),
        "--package-root",
        str(package_root),
        "--output",
        str(tmp_path / "output"),
        *foreign_args,
    ]
    assert cli.main(argv) == 2
    captured = capsys.readouterr()
    assert "SMT_ONESHOT run rejects" in captured.err
    assert dispatched is False
