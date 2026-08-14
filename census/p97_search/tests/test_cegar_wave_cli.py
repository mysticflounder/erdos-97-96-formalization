from __future__ import annotations

import json
from pathlib import Path
from types import SimpleNamespace

import pytest

import census.p97_search.cegar_wave_cli as cli
from census.p97_search.tests.test_phase3_cegar_wave_engine import _fixture_control


def _control_file(tmp_path: Path) -> tuple[Path, Path]:
    control, package_root, _, _ = _fixture_control(tmp_path)
    path = tmp_path / "control.json"
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


def test_status_reports_validated_published_output(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "result.json"
    monkeypatch.setattr(
        cli, "validate_registered_output", lambda path: _validated_output()
    )

    assert cli.main(["status", str(output)]) == 0
    status = _json_stdout(capsys)
    assert status["schema"] == cli.CLI_SCHEMA
    assert status["status"] == "PASS"
    assert status["classification"] == "UNSAT_OBSERVED_DISCOVERY_ONLY"
    assert status["custody_status"] == "OFFLINE_VALIDATED"


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


def test_validate_output_branches_before_control_or_transport(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output = tmp_path / "result.json"
    monkeypatch.setattr(
        cli,
        "_load_control",
        lambda path: pytest.fail("control load was reached"),
    )
    monkeypatch.setattr(
        cli,
        "execute_registered_wave",
        lambda *args, **kwargs: pytest.fail("transport was reached"),
    )
    monkeypatch.setattr(
        cli,
        "validate_registered_output",
        lambda path: _validated_output(),
    )

    assert cli.main(["validate-output", str(output)]) == 0
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

    monkeypatch.setattr(cli, "check_registered_output", fake_check)
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
    output = tmp_path / "result.json"

    def explode(path: Path) -> dict[str, object]:
        raise error

    monkeypatch.setattr(cli, "validate_registered_output", explode)
    with pytest.raises(type(error)):
        cli.main(["validate-output", str(output)])
