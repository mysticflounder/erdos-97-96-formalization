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


def test_v8_base_owns_every_source_route_and_hook() -> None:
    expected = {
        "RUNNER_CODE_CHECKPOINT_RELATIVE": runner.RUNNER_CODE_CHECKPOINT_RELATIVE,
        "CHECKPOINT_RELATIVE": runner.CHECKPOINT_RELATIVE,
        "SOURCE_PREPARER_RELATIVE": runner.SOURCE_PREPARER_RELATIVE,
        "EXPECTED_SOURCE_PREPARER_RELATIVE": (
            runner.EXPECTED_SOURCE_PREPARER_RELATIVE
        ),
        "SOURCE_PREPARATION_CONFIG_RELATIVE": (
            runner.SOURCE_PREPARATION_CONFIG_RELATIVE
        ),
        "RUNNER_RELATIVE": runner.RUNNER_RELATIVE,
        "RUNNER_TEST_RELATIVE": runner.RUNNER_TEST_RELATIVE,
        "SOURCE_RUN_ROOT_RELATIVE": runner.SOURCE_RUN_ROOT_RELATIVE,
        "SOURCE_RUN_ROOT": runner.SOURCE_RUN_ROOT,
        "EXPECTED_SOURCE_LANE_ID": runner.EXPECTED_SOURCE_LANE_ID,
        "EXPECTED_SOURCE_RUN_ID": runner.EXPECTED_SOURCE_RUN_ID,
        "EXPECTED_SOURCE_BASE_HEAD": runner.EXPECTED_SOURCE_BASE_HEAD,
        "SOURCE_CAMPAIGN_SCHEMA": runner.SOURCE_CAMPAIGN_SCHEMA,
        "EXPECTED_SOURCE_THEOREM": runner.EXPECTED_SOURCE_THEOREM,
        "EXPECTED_SOURCE_PATH": runner.EXPECTED_SOURCE_PATH,
        "EXPECTED_ROOT_SOURCE_PATH": runner.EXPECTED_ROOT_SOURCE_PATH,
        "EXPECTED_FINITE_SCHEMA": runner.EXPECTED_FINITE_SCHEMA,
        "EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA": (
            runner.EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA
        ),
        "GLOBAL_CAPACITY_ROOT": runner.GLOBAL_CAPACITY_ROOT,
    }
    for name, value in expected.items():
        assert getattr(runner._BASE, name) == value
    assert runner._BASE._transform_source_cell is runner._transform_source_cell
    assert runner._BASE._validate_cell is runner._validate_cell
    assert runner._BASE.PRODUCTION_PINS_FINALIZED is False
    assert "v7" not in runner.SOURCE_RUN_ROOT_RELATIVE.lower()
    assert "v7" not in runner.EXPECTED_SOURCE_THEOREM.lower()
    assert "v7" not in runner.GLOBAL_CAPACITY_ROOT.as_posix().lower()


def test_v8_provisional_pins_never_fall_back_to_v7() -> None:
    for name in (
        "SOURCE_CAMPAIGN_SHA256",
        "SOURCE_RUN_MANIFEST_SHA256",
        "SOURCE_PREPARER_COMMIT",
        "SOURCE_PREPARER_SHA256",
        "CHECKPOINT_SHA256",
        "RUNNER_CODE_CHECKPOINT_SHA256",
        "SOURCE_CELL_IDENTITIES_SHA256",
        "PRODUCTION_CELL_IDENTITIES_SHA256",
    ):
        assert getattr(runner._BASE, name) == ""
    for name in (
        "SOURCE_CAMPAIGN_BYTES",
        "SOURCE_RUN_MANIFEST_BYTES",
        "SOURCE_PREPARER_BYTES",
        "CHECKPOINT_BYTES",
        "RUNNER_CODE_CHECKPOINT_BYTES",
    ):
        assert getattr(runner._BASE, name) == 0
    assert runner._BASE.SOURCE_CELL_IDENTITIES == {}
    assert runner._BASE.PRODUCTION_CELL_IDENTITIES == {}


def test_v8_base_has_no_uppercase_v7_route_or_schema_binding() -> None:
    inherited_v7 = {
        name: value
        for name, value in vars(runner._BASE).items()
        if name.isupper() and "v7" in repr(value).lower()
    }
    assert inherited_v7 == {}


def _campaign_cell(source_id: str, portfolio_id: str) -> dict[str, object]:
    ref = {"path": "scratch/input", "sha256": "0" * 64, "bytes": 1}
    return {
        "portfolio_cell_id": portfolio_id,
        "source_cell_id": source_id,
        "center": 2,
        "category": "none",
        "ordinal": 12,
        "source_cnf": ref,
        "producer_manifest": ref,
        "wave_manifest": ref,
        "expected_identity_hash": "1" * 64,
    }


def test_v8_cell_validator_rejects_v7_prefix_and_suffix() -> None:
    source_id = runner.CANARY_SOURCE_CELL_ID
    cell = _campaign_cell(source_id, runner.CANARY_PORTFOLIO_CELL_ID)
    assert runner._validate_cell(cell, 12) == cell

    v7_source = source_id.replace(
        "v8-two-kalmanson", "v7-two-kalmanson", 1
    )
    with pytest.raises(RuntimeError, match="not V8-owned"):
        runner._validate_cell(
            _campaign_cell(v7_source, f"{v7_source}-{runner.PORTFOLIO_CELL_SUFFIX}"),
            12,
        )

    v7_suffix = "canary-two-kalmanson-v7-sat-profile-v1"
    with pytest.raises(RuntimeError, match="V8 source cell"):
        runner._validate_cell(
            _campaign_cell(source_id, f"{source_id}-{v7_suffix}"), 12
        )


def test_v8_transform_rejects_v7_source_before_parsing_payload() -> None:
    v7_source = runner.CANARY_SOURCE_CELL_ID.replace(
        "v8-two-kalmanson", "v7-two-kalmanson", 1
    )
    with pytest.raises(RuntimeError, match="not V8-owned"):
        runner._transform_source_cell(
            source_cell={"cell_id": v7_source},
            ordinal=12,
            cnf=b"",
            source_producer_raw=b"",
            source_wave_raw=b"",
            source_preparer_commit="0" * 40,
        )


def test_v8_transform_accepts_a_source_shaped_v8_cell(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    source_id = runner.CANARY_SOURCE_CELL_ID
    source_preparer_commit = "2" * 40
    cnf = b"synthetic V8 DIMACS bytes"
    source_producer = {
        "producer_id": source_id,
        "backend": runner._BASE.BACKEND,
        "solver_profile": runner._BASE.SOURCE_SOLVER_PROFILE,
        "query_polarity": runner._BASE.QUERY_POLARITY,
        "source_manifest": {
            "source_id": source_id,
            "source_theorem": runner.EXPECTED_SOURCE_THEOREM,
            "source_path": runner.EXPECTED_SOURCE_PATH,
            "root_source_path": runner.EXPECTED_ROOT_SOURCE_PATH,
            "finite_schema": runner.EXPECTED_FINITE_SCHEMA,
        },
        "production_config": {
            "path": runner.SOURCE_PREPARATION_CONFIG_RELATIVE,
            "schema": runner.EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA,
            "target_code": {
                "commit": source_preparer_commit,
                "preparer": {
                    "path": runner.EXPECTED_SOURCE_PREPARER_RELATIVE,
                }
            },
        },
    }
    producer_raw = runner.canonical_json_bytes(source_producer)
    source_wave = {
        "wave_id": source_id,
        "encoding": {
            "cnf_sha256": runner.sha256_bytes(cnf),
            "producer_manifest_sha256": runner.sha256_bytes(producer_raw),
            "num_variables": runner.NUM_VARIABLES,
            "num_clauses": runner.NUM_CLAUSES,
            "query_polarity": runner._BASE.QUERY_POLARITY,
        },
        "execution": {
            "backend": runner._BASE.BACKEND,
            "solver_profile": runner._BASE.SOURCE_SOLVER_PROFILE,
        },
    }
    validated_waves: list[dict[str, object]] = []
    monkeypatch.setattr(
        runner._BASE,
        "scan_dimacs",
        lambda _cnf: (runner.NUM_VARIABLES, runner.NUM_CLAUSES),
    )
    monkeypatch.setattr(
        runner._BASE,
        "validate_wave_manifest",
        lambda wave: validated_waves.append(copy.deepcopy(wave)),
    )

    transformed = runner._transform_source_cell(
        source_cell={
            "cell_id": source_id,
            "ordinal": 12,
            "direct_lean_bytes_validated": True,
            "center": 2,
            "category": "none",
        },
        ordinal=12,
        cnf=cnf,
        source_producer_raw=producer_raw,
        source_wave_raw=runner.canonical_json_bytes(source_wave),
        source_preparer_commit=source_preparer_commit,
    )

    assert transformed["source_cell_id"] == source_id
    assert transformed["portfolio_cell_id"] == runner.CANARY_PORTFOLIO_CELL_ID
    assert transformed["ordinal"] == 12
    assert transformed["center"] == 2
    assert transformed["category"] == "none"
    assert len(validated_waves) == 2
    assert validated_waves[1]["wave_id"] == runner.CANARY_PORTFOLIO_CELL_ID
    assert validated_waves[1]["execution"] == {
        "backend": runner._BASE.BACKEND,
        "solver_profile": runner._BASE.SOLVER_PROFILE,
        "shard_id": 12,
        "shard_count": runner.CELL_COUNT,
    }
    transformed_producer = runner._BASE._strict_json(
        transformed["producer_raw"], "transformed producer"
    )
    assert transformed_producer["producer_id"] == runner.CANARY_PORTFOLIO_CELL_ID
    assert transformed_producer["solver_profile"] == runner._BASE.SOLVER_PROFILE
    assert transformed_producer["profile_source_producer_manifest_sha256"] == (
        runner.sha256_bytes(producer_raw)
    )


def _production_checkpoint() -> dict[str, object]:
    payload: dict[str, object] = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": runner.LANE_ID,
        "owner": runner.RUN_OWNER,
        "base_head": runner.BASE_HEAD,
        "created_utc": "2026-08-23T00:00:00Z",
        "owned_paths": [runner.CHECKPOINT_RELATIVE],
        "durable_paths": sorted(
            [
                miner.MINER_RELATIVE,
                runner.RUNNER_CODE_CHECKPOINT_RELATIVE,
                runner.RUNNER_RELATIVE,
                runner.RUNNER_TEST_RELATIVE,
                runner.SOURCE_PREPARER_RELATIVE,
            ]
        ),
        "generated_roots": [runner.OUTPUT_ROOT.relative_to(runner.ROOT).as_posix()],
        "manifest_sha256": "",
    }
    payload["manifest_sha256"] = runner._BASE._self_hash(payload)
    return payload


def test_v8_checkpoint_roles_are_distinct_and_source_clean() -> None:
    # The preparation config intentionally pins the pre-repair runner bytes
    # until the control-plane owner refreezes it.  Exercise only this runner's
    # independent checkpoint-role contract here.
    runner._validate_checkpoint_roles()
    assert runner.CHECKPOINT_RELATIVE != runner.RUNNER_CODE_CHECKPOINT_RELATIVE
    runner._validate_production_checkpoint_payload(_production_checkpoint())
    runner_code = runner._checkpoint_payload(
        runner.RUNNER_CODE_CHECKPOINT_RELATIVE, "V8 runner-code checkpoint"
    )
    runner._validate_runner_code_checkpoint_payload(runner_code)
    with pytest.raises(RuntimeError, match="production checkpoint contract"):
        runner._validate_production_checkpoint_payload(runner_code)


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("base_head", "0" * 40),
        ("owned_paths", [*runner.RUNNER_CODE_CHECKPOINT_OWNED_PATHS, "old-v7"]),
    ],
)
def test_v8_runner_code_checkpoint_field_tamper_is_rejected(
    field: str, replacement: object
) -> None:
    payload = runner._checkpoint_payload(
        runner.RUNNER_CODE_CHECKPOINT_RELATIVE, "V8 runner-code checkpoint"
    )
    payload[field] = replacement
    payload["manifest_sha256"] = runner._BASE._self_hash(payload)
    with pytest.raises(RuntimeError, match="runner-code checkpoint contract"):
        runner._validate_runner_code_checkpoint_payload(payload)


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("lane_id", "old-v7-lane"),
        ("owner", "old-v7-owner"),
        ("base_head", "0" * 40),
        ("owned_paths", [".codex/worktree-checkpoints/old-v7.json"]),
        ("generated_roots", ["scratch/runs/old-v7/run"]),
    ],
)
def test_v8_production_checkpoint_field_tamper_is_rejected(
    field: str, replacement: object
) -> None:
    payload = _production_checkpoint()
    payload[field] = replacement
    payload["manifest_sha256"] = runner._BASE._self_hash(payload)
    with pytest.raises(RuntimeError, match="production checkpoint contract"):
        runner._validate_production_checkpoint_payload(payload)


def test_v8_checkpoint_path_alias_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        runner, "CHECKPOINT_RELATIVE", runner.RUNNER_CODE_CHECKPOINT_RELATIVE
    )
    with pytest.raises(RuntimeError, match="checkpoint paths alias"):
        runner._validate_checkpoint_roles()


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
    rendered = capsys.readouterr().out
    assert "V8" in rendered
    for command in (
        "derive-identities",
        "prepare",
        "static-check",
        "start-canary",
        "start-rest",
    ):
        assert command in rendered
