from __future__ import annotations

import copy
from pathlib import Path

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model as miner
import pytest
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_portfolio as runner


def _candidate(family: str) -> dict[str, str]:
    return {"family": family}


def _ledger() -> dict[str, object]:
    candidates = [
        _candidate("formalized-core-bank"),
        _candidate("formalized-core-bank"),
        _candidate("perpendicular-bisector-equality-component"),
        _candidate("two-kalmanson-cancellation"),
    ]
    script = miner.scanner_script_identity()
    return {
        "candidates": candidates,
        "scanner": {
            "name": miner.MINER_NAME,
            "schema": miner.MINER_SCHEMA,
            "version": miner.MINER_VERSION,
            "source_path": script["path"],
            "source_sha256": script["sha256"],
        },
        "scanner_dependencies": copy.deepcopy(miner.SCANNER_DEPENDENCIES),
        "source_valid_family_inventory": list(miner.SOURCE_VALID_FAMILIES),
        "family_inventory": {
            "family_candidate_counts": {
                "formalized-core-bank": 2,
                "perpendicular-bisector-equality-component": 1,
                "two-kalmanson-cancellation": 1,
            }
        },
    }


def _tamper_identity(identity: dict[str, object], field: str) -> None:
    if field == "schema":
        identity[field] = "old-v7-identity-schema"
    elif field == "scanner_name":
        identity[field] = "old-v7-miner"
    elif field == "scanner_schema":
        identity[field] = "old-v7-miner-schema"
    elif field == "verification_schema":
        identity[field] = "old-v7-verification-schema"
    elif field == "scanner_version":
        identity[field] = "7"
    elif field == "scanner_script_path":
        identity[field] = "scripts/old_v7_miner.py"
    elif field == "scanner_script_sha256":
        identity[field] = "0" * 64
    elif field == "scanner_script_bytes" or field == "candidate_count":
        identity[field] = int(identity[field]) + 1
    elif field == "candidate_families":
        identity[field] = list(identity[field])[:-1]
    elif field == "scanner_dependencies":
        dependencies = copy.deepcopy(identity[field])
        dependencies.pop(next(iter(dependencies)))
        identity[field] = dependencies
    elif field == "scanner_dependencies_sha256":
        identity[field] = "f" * 64
    elif field == "runner_receipt_schemas":
        schemas = dict(identity[field])
        schemas["verification"] = "old-v7-verification-schema"
        identity[field] = schemas
    else:  # pragma: no cover - keeps the parameter table exhaustive
        raise AssertionError(field)


def test_real_v8_miner_ledger_is_accepted_by_v8_runner() -> None:
    ledger = _ledger()
    accepted = runner.validate_real_miner_ledger(ledger)
    assert accepted == miner.build_scanner_identity(candidate_count=4)
    assert accepted["runner_receipt_schemas"] == runner.RUNNER_RECEIPT_SCHEMAS


def test_real_v8_miner_identity_receipt_is_accepted_by_v8_runner() -> None:
    receipt = miner.build_scanner_identity(candidate_count=4)
    assert (
        runner.validate_scanner_identity_contract(receipt, candidate_count=4)
        == receipt
    )


@pytest.mark.parametrize(
    "field",
    [
        "schema",
        "scanner_name",
        "scanner_schema",
        "verification_schema",
        "scanner_version",
        "scanner_script_path",
        "scanner_script_sha256",
        "scanner_script_bytes",
        "candidate_count",
        "candidate_families",
        "scanner_dependencies",
        "scanner_dependencies_sha256",
        "runner_receipt_schemas",
    ],
)
def test_every_cross_module_identity_field_is_fail_closed(field: str) -> None:
    identity = miner.build_scanner_identity(candidate_count=4)
    _tamper_identity(identity, field)
    with pytest.raises(runner.V8PortfolioError):
        runner.validate_scanner_identity_contract(identity, candidate_count=4)


def test_explicit_old_v7_identity_regression_is_rejected() -> None:
    old_v7 = miner.build_scanner_identity(candidate_count=14)
    old_v7.update(
        {
            "scanner_name": (
                "exact17-survivor-four-point-two-circle-v7-two-kalmanson-v7-"
                "source-valid-theorem-miner"
            ),
            "scanner_schema": (
                "p97-exact17-survivor-four-point-two-circle-v7-two-kalmanson-"
                "v7-source-valid-theorem-miner/v1"
            ),
            "verification_schema": (
                "p97-exact17-survivor-four-point-two-circle-v7-two-kalmanson-"
                "v7-source-valid-theorem-mine-verification/v1"
            ),
            "scanner_version": "7",
        }
    )
    with pytest.raises(runner.V8PortfolioError):
        runner.validate_scanner_identity_contract(old_v7, candidate_count=14)


@pytest.mark.parametrize(
    "field", ["name", "schema", "version", "source_path", "source_sha256"]
)
def test_real_ledger_scanner_field_tamper_is_rejected(field: str) -> None:
    ledger = _ledger()
    scanner = dict(ledger["scanner"])
    scanner[field] = "old-v7-value"
    ledger["scanner"] = scanner
    with pytest.raises(runner.V8PortfolioError, match="scanner identity"):
        runner.validate_real_miner_ledger(ledger)


def test_real_ledger_candidate_count_and_families_are_exact() -> None:
    ledger = _ledger()
    ledger["candidates"] = list(ledger["candidates"])[:-1]
    with pytest.raises(runner.V8PortfolioError, match="family counts"):
        runner.validate_real_miner_ledger(ledger)
    ledger = _ledger()
    ledger["source_valid_family_inventory"] = list(miner.SOURCE_VALID_FAMILIES[:-1])
    with pytest.raises(runner.V8PortfolioError, match="family inventory"):
        runner.validate_real_miner_ledger(ledger)


def test_real_ledger_dependency_inventory_is_exact() -> None:
    ledger = _ledger()
    dependencies = dict(ledger["scanner_dependencies"])
    dependencies.pop(next(iter(dependencies)))
    ledger["scanner_dependencies"] = dependencies
    with pytest.raises(runner.V8PortfolioError, match="dependency inventory"):
        runner.validate_real_miner_ledger(ledger)


def test_runtime_policy_is_bounded() -> None:
    assert runner.REQUESTED_CORE_LIMIT == 1
    assert runner.MAX_ACTIVE_JOBS == 12
    assert runner.SOLVE_TIMEOUT_S == 3_600
    assert runner.REPLAY_TIMEOUT_S == 3_600


def test_route_contract_is_fresh_v8() -> None:
    routes = runner.route_contract()
    assert routes["project"] == runner.PROJECT
    assert routes["output_root"] == runner.OUTPUT_ROOT.relative_to(runner.ROOT).as_posix()
    assert all("v8" in route.lower() for route in routes.values())
    assert all("v7" not in route.lower() for route in routes.values())


def test_direct_callable_defaults_route_to_v8(monkeypatch: pytest.MonkeyPatch) -> None:
    observed: dict[str, Path] = {}
    monkeypatch.setattr(runner, "_require_v8_ready", lambda: None)
    monkeypatch.setattr(
        runner,
        "_BASE_PREPARE_PORTFOLIO",
        lambda *, output_root: observed.setdefault("prepare", output_root) or {},
    )
    monkeypatch.setattr(
        runner,
        "_BASE_STATIC_CHECK",
        lambda *, root, run_root: observed.update(static=run_root) or {},
    )
    monkeypatch.setattr(
        runner,
        "_BASE_START_CANARY",
        lambda *, base_url, root, run_root: observed.update(canary=run_root) or {},
    )
    monkeypatch.setattr(
        runner,
        "_BASE_START_REST",
        lambda *, base_url, root, run_root: observed.update(rest=run_root) or {},
    )
    runner.prepare_portfolio()
    runner.static_check()
    runner.start_canary(base_url="http://127.0.0.1:7272")
    runner.start_rest(base_url="http://127.0.0.1:7272")
    assert observed == {
        "prepare": runner.OUTPUT_ROOT,
        "static": runner.OUTPUT_ROOT,
        "canary": runner.OUTPUT_ROOT,
        "rest": runner.OUTPUT_ROOT,
    }


def test_runtime_route_tamper_is_rejected(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(runner._BASE, "start_canary", runner._PARENT._start_canary_v7)
    with pytest.raises(runner.V8PortfolioError, match="start_canary"):
        runner._validate_runtime_entrypoint_routes()


def test_cli_help_does_not_prepare_or_contact_piqd(capsys: pytest.CaptureFixture[str]) -> None:
    assert runner.main(["--help"]) == 0
    assert "V8" in capsys.readouterr().out
