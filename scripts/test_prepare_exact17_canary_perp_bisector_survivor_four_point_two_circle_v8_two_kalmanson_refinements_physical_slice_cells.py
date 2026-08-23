from __future__ import annotations

import copy
import json
import os
import shutil
from pathlib import Path

import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_physical_slice_cells as preparer
import pytest


def _config() -> dict[str, object]:
    return json.loads(preparer.PRODUCTION_CONFIG_PATH.read_bytes())


def _write_config(tmp_path: Path, value: dict[str, object]) -> Path:
    path = tmp_path / "config.json"
    path.write_bytes(preparer.canonical_json_bytes(value) + b"\n")
    return path


def test_finalized_config_authenticates_every_source(tmp_path: Path) -> None:
    path = _write_config(tmp_path, _config())
    accepted = preparer.require_production_pins(path)
    assert accepted["production_pins_finalized"] is True
    assert accepted["counts"]["root_clauses"] == 7_409_839


def test_nonfinal_production_flag_fails_closed(tmp_path: Path) -> None:
    value = _config()
    value["production_pins_finalized"] = False
    path = _write_config(tmp_path, value)
    with pytest.raises(preparer.V8PreparationError, match="not finalized"):
        preparer.require_production_pins(path)


@pytest.mark.parametrize(
    ("field", "replacement", "message"),
    [
        ("base_head", "0" * 40, "lane binding"),
        ("lane_id", "old-v7-lane", "lane binding"),
        ("generated_root", "scratch/runs/old-v7/run", "output root"),
        ("schema", "old-v7-schema", "schema"),
    ],
)
def test_top_level_route_tamper_fails(
    tmp_path: Path, field: str, replacement: str, message: str
) -> None:
    value = _config()
    value[field] = replacement
    path = _write_config(tmp_path, value)
    with pytest.raises(preparer.V8PreparationError, match=message):
        preparer.require_production_pins(path)


@pytest.mark.parametrize(
    ("count_field", "replacement"),
    [("variables", 307), ("root_clauses", 7_409_838), ("physical_cell_clauses", 7_409_844)],
)
def test_exact_count_tamper_fails(
    tmp_path: Path, count_field: str, replacement: int
) -> None:
    value = _config()
    counts = dict(value["counts"])
    counts[count_field] = replacement
    value["counts"] = counts
    path = _write_config(tmp_path, value)
    with pytest.raises(preparer.V8PreparationError, match="count contract"):
        preparer.require_production_pins(path)


PIN_CASES = (
    ("source_support", "root"),
    ("source_support", "source"),
    ("source_support", "exporter"),
    ("source_support", "ingress"),
    ("source_support", "generator"),
    ("target_code", "preparer"),
    ("target_code", "miner"),
    ("target_code", "runner"),
    ("parent_dependencies", "v7_preparer"),
    ("parent_dependencies", "v7_miner"),
    ("parent_dependencies", "v7_runner"),
)


@pytest.mark.parametrize(("inventory", "label"), PIN_CASES)
def test_every_finalized_artifact_pin_is_fail_closed(
    tmp_path: Path, inventory: str, label: str
) -> None:
    value = _config()
    items = copy.deepcopy(value[inventory])
    pin = dict(items[label])
    pin["sha256"] = "0" * 64
    items[label] = pin
    value[inventory] = items
    path = _write_config(tmp_path, value)
    with pytest.raises(preparer.V8PreparationError, match="live bytes drifted"):
        preparer.require_production_pins(path)


@pytest.mark.parametrize(("inventory", "label"), PIN_CASES)
@pytest.mark.parametrize("bad_path", ("/absolute/support.py", "support/../escape.py"))
def test_every_finalized_artifact_pin_rejects_unsafe_paths_before_io(
    tmp_path: Path, inventory: str, label: str, bad_path: str
) -> None:
    value = _config()
    items = copy.deepcopy(value[inventory])
    pin = dict(items[label])
    pin["path"] = bad_path
    items[label] = pin
    value[inventory] = items
    path = _write_config(tmp_path, value)
    with pytest.raises(preparer.V8PreparationError, match="normalized repository-relative"):
        preparer.require_production_pins(path)


def test_route_contract_contains_only_v8_routes() -> None:
    contract = preparer.route_contract()
    assert contract["run_root"] == (
        "scratch/runs/exact17-v8-two-kalmanson-successor-preparer-20260823/"
        "preparation-v1"
    )
    assert all("v8" in route.lower() for route in contract.values())
    assert all("v7" not in route.lower() for route in contract.values())


def test_direct_call_rejects_non_v8_output_root() -> None:
    with pytest.raises(preparer.V8PreparationError, match="output root drifted"):
        preparer.prepare_campaign(run_root=preparer.ROOT / "scratch/runs/v7/run")


def test_category_id_validates_parent_and_emits_v8() -> None:
    result = preparer.category_id(2, "none")
    assert result == preparer.SOURCE_CELL_PREFIX + "-next-center-02-physical-none"
    assert "v8-two-kalmanson" in result
    with pytest.raises(preparer._PARENT.PreparationError):
        preparer.category_id(99, "none")


def test_cli_help_does_not_export(capsys: pytest.CaptureFixture[str]) -> None:
    assert preparer.main(["--help"]) == 0
    assert "source-export" in capsys.readouterr().out


def _checkpoint_value(root: Path, *, head: str = "a" * 40) -> tuple[Path, dict[str, object]]:
    lane = "exact17-v8-two-kalmanson-successor-preparer-20260823"
    relative = f".codex/worktree-checkpoints/{lane}.json"
    path = root / relative
    value: dict[str, object] = {
        "base_head": head,
        "created_utc": "2026-08-23T12:30:00Z",
        "durable_paths": [],
        "generated_roots": [f"scratch/runs/{lane}/preparation-v1"],
        "lane_id": lane,
        "owned_paths": [relative],
        "owner": lane,
        "schema": "worktree-lane-checkpoint/v1",
    }
    value["manifest_sha256"] = preparer.sha256_bytes(preparer.canonical_json_bytes(value))
    return path, value


def _write_checkpoint(path: Path, value: dict[str, object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(preparer.canonical_json_bytes(value) + b"\n")


def _write_canonical(path: Path, value: dict[str, object]) -> bytes:
    raw = preparer.canonical_json_bytes(value)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(raw)
    return raw


def _ref(root: Path, path: Path, raw: bytes) -> dict[str, object]:
    return {
        "bytes": len(raw),
        "path": path.relative_to(root).as_posix(),
        "sha256": preparer.sha256_bytes(raw),
    }


def _build_small_source_packet(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> tuple[
    object,
    dict[str, object],
    Path,
    dict[str, object],
    str,
    preparer._ExportRootCustody,
]:
    root = tmp_path / "repo"
    lane = "exact17-v8-two-kalmanson-successor-preparer-20260823"
    run_root = root / "scratch/runs" / lane / "preparation-v1"
    artifacts = run_root / "artifacts"
    artifacts.mkdir(parents=True)
    (run_root / "events").mkdir()
    (run_root / "tmp").mkdir()
    monkeypatch.setattr(preparer, "ROOT", root)
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    monkeypatch.setattr(preparer, "ROOT_CLAUSES", 2)
    monkeypatch.setattr(preparer, "CELL_CLAUSES", 8)
    base = preparer._PARENT._BASE
    monkeypatch.setattr(base, "LANE_ID", lane)
    monkeypatch.setattr(base, "RUN_ID", "preparation-v1")
    monkeypatch.setattr(base, "PARENT_VARIABLES", 308)
    monkeypatch.setattr(base, "PARENT_CLAUSES", 2)
    monkeypatch.setattr(base, "CELL_CLAUSES", 8)
    monkeypatch.setattr(base, "CELL_COUNT", 76)
    monkeypatch.setattr(base, "SOURCE_THEOREM", preparer.SOURCE_THEOREM)
    monkeypatch.setattr(
        base,
        "FINITE_SCHEMA",
        f"{preparer.SOURCE_CELL_PREFIX}-physical-slice/v1",
    )
    monkeypatch.setattr(
        base,
        "CAMPAIGN_SCHEMA",
        f"{preparer.SOURCE_CELL_PREFIX}-physical-slice-campaign/v1",
    )
    monkeypatch.setattr(
        base,
        "ROOT_PRODUCER_SCHEMA",
        f"{preparer.SOURCE_CELL_PREFIX}-root-producer/v1",
    )
    monkeypatch.setattr(base, "PRODUCTION_CONFIG_SCHEMA", preparer.PRODUCTION_CONFIG_SCHEMA)
    monkeypatch.setattr(base, "category_id", preparer.category_id)
    monkeypatch.setattr(base, "_cell_id", preparer.category_id)
    head = "a" * 40
    checkpoint_path, checkpoint = _checkpoint_value(root, head=head)
    _write_checkpoint(checkpoint_path, checkpoint)
    checkpoint_raw = checkpoint_path.read_bytes()
    checkpoint_sha = preparer.sha256_bytes(checkpoint_raw)
    monkeypatch.setattr(base, "EXPECTED_CHECKPOINT_SHA256", checkpoint_sha)
    monkeypatch.setattr(base, "ORDER_SHA256", "b" * 64)

    source_pins = {
        role: {
            "bytes": 1,
            "commit": "c" * 40,
            "path": f"support/v8-{role}",
            "sha256": character * 64,
        }
        for role, character in (
            ("exporter", "1"),
            ("generator", "2"),
            ("ingress", "3"),
            ("root", "4"),
            ("source", "5"),
        )
    }
    config: dict[str, object] = {
        "source_commit": "c" * 40,
        "source_support": source_pins,
    }
    immediate_parent = {
        "bytes": 1,
        "path": "support/v7-parent-exporter",
        "sha256": "8" * 64,
    }
    variable_map = {
        "bytes": 1,
        "path": "support/variable-map.json",
        "sha256": "7" * 64,
    }
    delegated_preparer = {
        "bytes": 1,
        "path": "support/delegated-preparer.py",
        "sha256": "9" * 64,
    }
    hardened_preparer = {
        "bytes": 1,
        "path": "support/hardened-preparer.py",
        "sha256": "a" * 64,
    }
    production = {
        "bytes": 1,
        "commit": head,
        "path": "config/v8.json",
        "schema": preparer.PRODUCTION_CONFIG_SCHEMA,
        "sha256": "6" * 64,
        "support": {
            "checkpoint": {
                "bytes": len(checkpoint_raw),
                "path": checkpoint_path.relative_to(root).as_posix(),
                "sha256": checkpoint_sha,
            },
            "delegated_preparer": delegated_preparer,
            "hardened_preparer": hardened_preparer,
            "immediate_parent_exporter": immediate_parent,
            "source": {
                key: value
                for key, value in source_pins["source"].items()
                if key != "commit"
            },
            "root_source": {
                key: value
                for key, value in source_pins["root"].items()
                if key != "commit"
            },
            "exporter": {
                key: value
                for key, value in source_pins["exporter"].items()
                if key != "commit"
            },
            "variable_map": variable_map,
        },
        "target_code": {
            "commit": head,
            "preparer": {
                "bytes": 1,
                "path": "scripts/v8-preparer.py",
                "sha256": "d" * 64,
            },
            "test": {
                "bytes": 1,
                "path": "scripts/test-v8-preparer.py",
                "sha256": "e" * 64,
            },
        },
    }
    parent_novelty = {
        "schema": (
            "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
            "v8-two-kalmanson-refinements-parent-novelty/v1"
        ),
        "policy": {
            "parent_scan": "byte-exact-complete-v7-prefix",
            "successor_shape": "byte-exact V7 prefix plus ordered 29-clause suffix",
        },
        "immediate_parent_clause_count_scanned": preparer.V7_ROOT_CLAUSES,
        "suffix_clause_count": preparer.SUFFIX_CLAUSES,
        "suffix_clauses": [list(clause) for clause in preparer.EXPECTED_SUFFIX],
        "strict_new_suffix_indices": list(range(preparer.SUFFIX_CLAUSES)),
        "strict_new_suffix_count": preparer.SUFFIX_CLAUSES,
        "successor_multiplicity": [1] * preparer.SUFFIX_CLAUSES,
        "parent_body_exact_prefix": True,
        "suffix_exact_order": True,
        "immediate_parent_sha256": "f" * 64,
        "immediate_parent_bytes": 17,
    }
    delegated = {"schema": "p97-delegated-python-dependencies/v1", "dependencies": []}
    monkeypatch.setattr(base, "build_production_config_manifest", lambda _root: production)
    monkeypatch.setattr(
        base,
        "build_delegated_dependency_manifest",
        lambda *_args, **_kwargs: delegated,
    )
    variable_map_sha = "7" * 64
    root_raw = b"p cnf 308 2\n1 0\n-1 2 0\n"
    root_path = artifacts / "cumulative-root.cnf"
    root_path.write_bytes(root_raw)
    root_sha = preparer.sha256_bytes(root_raw)
    parent_novelty["successor_root_sha256"] = root_sha
    parent_novelty["successor_root_bytes"] = len(root_raw)
    root_producer_raw = base.build_root_producer(
        root_sha256=root_sha,
        root_bytes=len(root_raw),
        source_path=source_pins["source"]["path"],
        source_sha256=source_pins["source"]["sha256"],
        root_source_path=source_pins["root"]["path"],
        root_source_sha256=source_pins["root"]["sha256"],
        exporter_path=source_pins["exporter"]["path"],
        exporter_sha256=source_pins["exporter"]["sha256"],
        immediate_parent_exporter_path="support/v7-parent-exporter",
        immediate_parent_exporter_sha256="8" * 64,
        parent_novelty=parent_novelty,
        delegated_dependencies=delegated,
        production_config=production,
        checkpoint_path=checkpoint_path.relative_to(root).as_posix(),
        checkpoint_sha256=checkpoint_sha,
        variable_map_sha256=variable_map_sha,
        source_commit=config["source_commit"],
    )
    root_producer_path = artifacts / "root-producer-manifest.json"
    root_producer_path.write_bytes(root_producer_raw)
    root_producer_sha = preparer.sha256_bytes(root_producer_raw)
    cells: list[dict[str, object]] = []
    ordinal = 0
    for center in base.LEGAL_CENTERS:
        for category in base.accepted.hardened._physical_categories(center):
            identifier = preparer.category_id(center, category)
            directory = artifacts / "cells" / identifier
            directory.mkdir(parents=True)
            units = base.category_units(center, category)
            cnf_raw = (
                b"p cnf 308 8\n"
                + root_raw.split(b"\n", 1)[1]
                + b"".join(f"{unit} 0\n".encode() for unit in units)
            )
            cnf_path = directory / f"{identifier}.cnf"
            cnf_path.write_bytes(cnf_raw)
            producer_raw = base.build_producer(
                center,
                category,
                source_pins["source"]["path"],
                source_pins["source"]["sha256"],
                source_pins["root"]["path"],
                source_pins["root"]["sha256"],
                source_pins["exporter"]["path"],
                source_pins["exporter"]["sha256"],
                "support/v7-parent-exporter",
                "8" * 64,
                variable_map_sha,
                root_sha,
                root_producer_sha,
                parent_novelty,
                delegated,
                production,
            )
            producer_path = directory / "producer-manifest.json"
            producer_path.write_bytes(producer_raw)
            wave_raw = base.build_wave(
                center,
                category,
                preparer.sha256_bytes(cnf_raw),
                preparer.sha256_bytes(producer_raw),
                ordinal,
                source_pins["source"]["sha256"],
                variable_map_sha,
            )
            wave_path = directory / "wave-manifest.json"
            wave_path.write_bytes(wave_raw)
            cells.append(
                {
                    "category": category,
                    "cell_id": identifier,
                    "center": center,
                    "claims": base._claims(),
                    "cnf": _ref(root, cnf_path, cnf_raw),
                    "direct_lean_bytes_validated": (
                        center,
                        category,
                    )
                    in base.DIRECT_SENTINELS,
                    "ordinal": ordinal,
                    "producer_manifest": _ref(root, producer_path, producer_raw),
                    "wave_manifest": _ref(root, wave_path, wave_raw),
                }
            )
            ordinal += 1
    campaign_source = {
        "checkpoint_path": checkpoint_path.relative_to(root).as_posix(),
        "checkpoint_sha256": checkpoint_sha,
        "delegated_dependencies": delegated,
        "delegated_dependencies_sha256": preparer.sha256_bytes(
            preparer.canonical_json_bytes(delegated)
        ),
        "exporter_path": source_pins["exporter"]["path"],
        "exporter_sha256": source_pins["exporter"]["sha256"],
        "immediate_parent_exporter_path": "support/v7-parent-exporter",
        "immediate_parent_exporter_sha256": "8" * 64,
        "parent_novelty": parent_novelty,
        "parent_novelty_sha256": preparer.sha256_bytes(
            preparer.canonical_json_bytes(parent_novelty)
        ),
        "parent_producer_sha256": root_producer_sha,
        "parent_root_sha256": root_sha,
        "path": source_pins["source"]["path"],
        "production_config": production,
        "production_config_sha256": preparer.sha256_bytes(
            preparer.canonical_json_bytes(production)
        ),
        "root_source_path": source_pins["root"]["path"],
        "root_source_sha256": source_pins["root"]["sha256"],
        "sha256": source_pins["source"]["sha256"],
        "source_commit": config["source_commit"],
        "variable_map_path": "support/variable-map.json",
        "variable_map_sha256": variable_map_sha,
    }
    campaign = {
        "cell_count": 76,
        "cells": cells,
        "claims": {
            "exact17_closed": False,
            "proof_verified": False,
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
        },
        "project": "erdos-97-96-formalization",
        "run_id": "preparation-v1",
        "schema": base.CAMPAIGN_SCHEMA,
        "source": campaign_source,
        "status": "PREPARED_LOCAL_ONLY",
    }
    campaign_path = artifacts / "campaign-manifest.json"
    campaign_raw = _write_canonical(campaign_path, campaign)
    preparation = {
        "campaign_manifest": _ref(root, campaign_path, campaign_raw),
        "cell_count": 76,
        "claims": campaign["claims"],
        "delegated_dependencies": delegated,
        "delegated_dependencies_sha256": preparer.sha256_bytes(
            preparer.canonical_json_bytes(delegated)
        ),
        "direct_lean_cells_validated": sum(
            cell["direct_lean_bytes_validated"] for cell in cells
        ),
        "direct_lean_sentinels": [
            cell["cell_id"] for cell in cells if cell["direct_lean_bytes_validated"]
        ],
        "parent_novelty": parent_novelty,
        "parent_novelty_sha256": preparer.sha256_bytes(
            preparer.canonical_json_bytes(parent_novelty)
        ),
        "production_config": production,
        "production_config_sha256": preparer.sha256_bytes(
            preparer.canonical_json_bytes(production)
        ),
        "production_run": False,
        "run_id": "preparation-v1",
        "schema": f"{preparer.SOURCE_CELL_PREFIX}-physical-slice-source-export/v1",
        "status": "PREPARED_LOCAL_ONLY",
    }
    _write_canonical(artifacts / "preparation-report.json", preparation)
    run_manifest: dict[str, object] = {
        "base_head": head,
        "created_utc": "2026-08-23T12:30:00Z",
        "input_digests": {"support/variable-map.json": variable_map_sha},
        "lane_id": lane,
        "output_classes": ["artifacts", "events", "tmp"],
        "owner": lane,
        "root": run_root.relative_to(root).as_posix(),
        "run_id": "preparation-v1",
        "schema": "worktree-run-manifest/v1",
        "source_digests": {"config/v8.json": "6" * 64},
    }
    run_manifest["manifest_sha256"] = preparer.sha256_bytes(
        preparer.canonical_json_bytes(run_manifest)
    )
    run_raw = _write_canonical(run_root / "run_manifest.json", run_manifest)
    monkeypatch.setattr(base, "build_run_manifest", lambda *_args, **_kwargs: run_raw)
    root_custody = preparer._capture_export_root_custody(run_root)
    return base, config, checkpoint_path, checkpoint, head, root_custody


def _read_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_bytes())


def _rewrite_campaign(root: Path, campaign: dict[str, object]) -> None:
    campaign_path = preparer.RUN_ROOT / "artifacts/campaign-manifest.json"
    campaign_raw = _write_canonical(campaign_path, campaign)
    preparation_path = preparer.RUN_ROOT / "artifacts/preparation-report.json"
    preparation = _read_json(preparation_path)
    preparation["campaign_manifest"] = _ref(root, campaign_path, campaign_raw)
    _write_canonical(preparation_path, preparation)


def _rewrite_wave_and_campaign(
    root: Path, campaign: dict[str, object], cell: dict[str, object], wave: dict[str, object]
) -> None:
    wave_path = root / cell["wave_manifest"]["path"]
    wave_raw = _write_canonical(wave_path, wave)
    cell["wave_manifest"] = _ref(root, wave_path, wave_raw)
    _rewrite_campaign(root, campaign)


def _rewrite_cnf_chain(
    root: Path,
    campaign: dict[str, object],
    cell: dict[str, object],
    cnf_raw: bytes,
) -> None:
    cnf_path = root / cell["cnf"]["path"]
    cnf_path.write_bytes(cnf_raw)
    cell["cnf"] = _ref(root, cnf_path, cnf_raw)
    wave_path = root / cell["wave_manifest"]["path"]
    wave = _read_json(wave_path)
    wave["encoding"]["cnf_sha256"] = preparer.sha256_bytes(cnf_raw)
    _rewrite_wave_and_campaign(root, campaign, cell, wave)


def test_source_export_checkpoint_guard_matrix(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(preparer, "ROOT", tmp_path)
    path, baseline = _checkpoint_value(tmp_path)
    run_root = tmp_path / baseline["generated_roots"][0]
    cases = (
        ("schema", "old-v7-schema", "schema"),
        ("owner", "somebody-else", "owner"),
        ("base_head", "b" * 40, "base head"),
        ("generated_roots", ["scratch/runs/old-v7/preparation-v1"], "generated root"),
        ("owned_paths", ["old-v7-checkpoint.json"], "ownership"),
        ("durable_paths", ["artifacts/campaign-manifest.json"], "durability"),
        ("created_utc", "not-a-time", "timestamp"),
        ("manifest_sha256", "0" * 64, "self-hash"),
        ("lane_id", "exact17-v7-two-kalmanson-successor-preparer-20260823", "path"),
    )
    for field, replacement, message in cases:
        value = copy.deepcopy(baseline)
        value[field] = replacement
        if field == "lane_id":
            value["owner"] = replacement
        if field != "manifest_sha256":
            unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
            value["manifest_sha256"] = preparer.sha256_bytes(
                preparer.canonical_json_bytes(unsigned)
            )
        _write_checkpoint(path, value)
        with pytest.raises(preparer.V8PreparationError, match=message):
            preparer._validate_export_checkpoint(path, run_root=run_root, current_head="a" * 40)


def test_source_export_rejects_symlink_checkpoint(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(preparer, "ROOT", tmp_path)
    path, value = _checkpoint_value(tmp_path)
    target = tmp_path / "checkpoint-target.json"
    _write_checkpoint(target, value)
    path.parent.mkdir(parents=True)
    path.symlink_to(target)
    with pytest.raises(preparer.V8PreparationError, match="non-symlink"):
        preparer._validate_export_checkpoint(
            path,
            run_root=tmp_path / value["generated_roots"][0],
            current_head="a" * 40,
        )


def test_source_export_rejects_existing_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "preparation-v1"
    run_root.mkdir()
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    with pytest.raises(preparer.V8PreparationError, match="already exists"):
        preparer._validate_source_export_controls(
            run_root=run_root,
            lane_checkpoint_path=tmp_path / "checkpoint.json",
            config_path=preparer.PRODUCTION_CONFIG_PATH,
        )


def test_source_export_rejects_wrong_config_route(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "preparation-v1"
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    with pytest.raises(preparer.V8PreparationError, match="config route"):
        preparer._validate_source_export_controls(
            run_root=run_root,
            lane_checkpoint_path=tmp_path / "checkpoint.json",
            config_path=tmp_path / "old-v7-config.json",
        )


def test_source_export_rejects_current_head_source_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "preparation-v1"
    config_path = tmp_path / "config.json"
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    monkeypatch.setattr(preparer, "PRODUCTION_CONFIG_PATH", config_path)
    monkeypatch.setattr(preparer, "_current_head", lambda: "a" * 40)
    monkeypatch.setattr(preparer, "require_production_pins", lambda _path: {})
    monkeypatch.setattr(
        preparer,
        "_validate_export_checkpoint",
        lambda *_args, **_kwargs: ({}, b"{}"),
    )

    def drift(*_args: object, **_kwargs: object) -> None:
        raise preparer.V8PreparationError("differs from the current committed head")

    monkeypatch.setattr(preparer, "_verify_live_file_at_head", drift)
    with pytest.raises(preparer.V8PreparationError, match="current committed head"):
        preparer._validate_source_export_controls(
            run_root=run_root,
            lane_checkpoint_path=tmp_path / "checkpoint.json",
            config_path=config_path,
        )
    assert not run_root.exists()


def test_source_export_impl_happy_path_uses_temporary_root(tmp_path: Path) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"

    def validate(**_kwargs: object) -> tuple[dict[str, object], dict[str, object], str]:
        return {}, {}, "a" * 40

    def export(**_kwargs: object) -> dict[str, object]:
        run_root.mkdir(parents=True)
        return {"cell_count": 76, "status": "PREPARED_LOCAL_ONLY"}

    result = preparer._source_export_impl(
        run_root=run_root,
        lane_checkpoint_path=tmp_path / "checkpoint.json",
        config_path=tmp_path / "config.json",
        control_validator=validate,
        packet_exporter=export,
    )
    assert result["cell_count"] == 76
    assert run_root.is_dir()


def test_source_export_impl_never_deletes_root_created_by_failing_exporter(
    tmp_path: Path,
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    original_run_root = preparer.RUN_ROOT
    preparer.RUN_ROOT = run_root

    def validate(**_kwargs: object) -> tuple[dict[str, object], dict[str, object], str]:
        return {}, {}, "a" * 40

    def export(**_kwargs: object) -> dict[str, object]:
        run_root.mkdir(parents=True)
        (run_root / "foreign-marker").write_text("not exporter-owned")
        raise RuntimeError("synthetic export failure")

    try:
        with pytest.raises(RuntimeError, match="synthetic"):
            preparer._source_export_impl(
                run_root=run_root,
                lane_checkpoint_path=tmp_path / "checkpoint.json",
                config_path=tmp_path / "config.json",
                control_validator=validate,
                packet_exporter=export,
            )
        assert (run_root / "foreign-marker").read_text() == "not exporter-owned"
    finally:
        preparer.RUN_ROOT = original_run_root


def test_source_export_impl_does_not_delete_unowned_wrong_count_packet(
    tmp_path: Path,
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    original_run_root = preparer.RUN_ROOT
    preparer.RUN_ROOT = run_root

    def validate(**_kwargs: object) -> tuple[dict[str, object], dict[str, object], str]:
        return {}, {}, "a" * 40

    def export(**_kwargs: object) -> dict[str, object]:
        run_root.mkdir(parents=True)
        return {"cell_count": 75}

    try:
        with pytest.raises(preparer.V8PreparationError, match="cell count"):
            preparer._source_export_impl(
                run_root=run_root,
                lane_checkpoint_path=tmp_path / "checkpoint.json",
                config_path=tmp_path / "config.json",
                control_validator=validate,
                packet_exporter=export,
            )
        assert run_root.is_dir()
    finally:
        preparer.RUN_ROOT = original_run_root


def test_source_export_impl_rejects_missing_packet_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)

    result = lambda **_kwargs: ({}, {}, "a" * 40)
    exporter = lambda **_kwargs: {"cell_count": 76}
    with pytest.raises(preparer.V8PreparationError, match="did not create"):
        preparer._source_export_impl(
            run_root=run_root,
            lane_checkpoint_path=tmp_path / "checkpoint.json",
            config_path=tmp_path / "config.json",
            control_validator=result,
            packet_exporter=exporter,
        )


def test_real_packet_exporter_preserves_partial_root_and_blocks_retry(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    active_sink: list[list[preparer._ExportRootCustody]] = []

    class FakeBase:
        DELEGATED_PREPARER_PATH = tmp_path / "delegated.py"
        HARDENED_PREPARER_PATH = tmp_path / "hardened.py"
        VARIABLE_MAP_PATH = tmp_path / "variable-map.json"
        verify_committed_dependency_blobs = staticmethod(
            lambda *_args, **_kwargs: None
        )

        @staticmethod
        def _initialize_run_root_authenticated(**_kwargs: object) -> dict[str, object]:
            active_sink[0].append(
                preparer._initialize_export_root_with_custody(run_root, b"{}")
            )
            return {"status": "RUN_ROOT_INITIALIZED"}

        @staticmethod
        def _prepare_campaign_authenticated(**_kwargs: object) -> dict[str, object]:
            (run_root / "partial").write_text("owned")
            raise RuntimeError("synthetic real-export failure")

    @preparer.contextmanager
    def configured(
        *, root_custody_sink: list[preparer._ExportRootCustody], **_kwargs: object
    ) -> object:
        active_sink[:] = [root_custody_sink]
        yield FakeBase

    monkeypatch.setattr(preparer, "_configured_v8_export", configured)
    with pytest.raises(RuntimeError, match="synthetic real-export"):
        preparer._export_source_packet(
            config={"source_commit": "a" * 40},
            checkpoint_path=tmp_path / "checkpoint.json",
            checkpoint={},
            head="a" * 40,
        )
    assert (run_root / "partial").read_text() == "owned"
    assert (run_root / "run_manifest.json").read_bytes() == b"{}"
    with pytest.raises(preparer.V8PreparationError, match="refusing retry"):
        preparer._export_source_packet(
            config={"source_commit": "a" * 40},
            checkpoint_path=tmp_path / "checkpoint.json",
            checkpoint={},
            head="a" * 40,
        )


def test_export_failure_preserves_root_replacement_detached_original_and_sibling(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    detached = tmp_path / "detached-original"
    sibling = tmp_path / "lane" / ".preparation-v1.source-export-failure-marker"
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    active_sink: list[list[preparer._ExportRootCustody]] = []

    class FakeBase:
        DELEGATED_PREPARER_PATH = tmp_path / "delegated.py"
        HARDENED_PREPARER_PATH = tmp_path / "hardened.py"
        VARIABLE_MAP_PATH = tmp_path / "variable-map.json"
        verify_committed_dependency_blobs = staticmethod(
            lambda *_args, **_kwargs: None
        )

        @staticmethod
        def _initialize_run_root_authenticated(**_kwargs: object) -> dict[str, object]:
            active_sink[0].append(
                preparer._initialize_export_root_with_custody(run_root, b"{}")
            )
            return {"status": "RUN_ROOT_INITIALIZED"}

        @staticmethod
        def _prepare_campaign_authenticated(**_kwargs: object) -> dict[str, object]:
            run_root.rename(detached)
            shutil.copytree(detached, run_root)
            (run_root / "replacement-marker").write_text("replacement")
            (detached / "original-marker").write_text("original")
            sibling.mkdir()
            (sibling / "marker").write_text("sibling")
            raise RuntimeError("synthetic concurrent-export failure")

    @preparer.contextmanager
    def configured(
        *, root_custody_sink: list[preparer._ExportRootCustody], **_kwargs: object
    ) -> object:
        active_sink[:] = [root_custody_sink]
        yield FakeBase

    monkeypatch.setattr(preparer, "_configured_v8_export", configured)
    with pytest.raises(RuntimeError, match="synthetic concurrent-export"):
        preparer._export_source_packet(
            config={"source_commit": "a" * 40},
            checkpoint_path=tmp_path / "checkpoint.json",
            checkpoint={},
            head="a" * 40,
        )
    assert (run_root / "replacement-marker").read_text() == "replacement"
    assert (detached / "original-marker").read_text() == "original"
    assert (sibling / "marker").read_text() == "sibling"
    with pytest.raises(preparer.V8PreparationError, match="refusing retry"):
        preparer._export_source_packet(
            config={"source_commit": "a" * 40},
            checkpoint_path=tmp_path / "checkpoint.json",
            checkpoint={},
            head="a" * 40,
        )


def test_packet_exporter_does_not_clean_initializer_collision(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    run_root.parent.mkdir()
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)

    class FakeBase:
        DELEGATED_PREPARER_PATH = tmp_path / "delegated.py"
        HARDENED_PREPARER_PATH = tmp_path / "hardened.py"
        VARIABLE_MAP_PATH = tmp_path / "variable-map.json"

        @staticmethod
        def _initialize_run_root_authenticated(**_kwargs: object) -> dict[str, object]:
            run_root.mkdir()
            (run_root / "foreign-marker").write_text("collision")
            return {"status": "RUN_ROOT_ALREADY_INITIALIZED"}

    @preparer.contextmanager
    def configured(**_kwargs: object) -> object:
        yield FakeBase

    monkeypatch.setattr(preparer, "_configured_v8_export", configured)
    with pytest.raises(preparer.V8PreparationError, match="fresh run root"):
        preparer._export_source_packet(
            config={"source_commit": "a" * 40},
            checkpoint_path=tmp_path / "checkpoint.json",
            checkpoint={},
            head="a" * 40,
        )
    assert (run_root / "foreign-marker").read_text() == "collision"


def test_source_export_public_route_cannot_override_control_plane(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    captured: dict[str, object] = {}

    def call(**kwargs: object) -> dict[str, object]:
        captured.update(kwargs)
        return {"cell_count": 76}

    monkeypatch.setattr(preparer, "_source_export_impl", call)
    run_root = tmp_path / "preparation-v1"
    checkpoint = tmp_path / "checkpoint.json"
    assert preparer.source_export(run_root=run_root, lane_checkpoint_path=checkpoint) == {
        "cell_count": 76
    }
    assert captured["control_validator"] is preparer._validate_source_export_controls
    assert captured["packet_exporter"] is preparer._export_source_packet


@pytest.mark.parametrize(
    "message",
    (
        "wrong checkpoint",
        "wrong generated root",
        "wrong base head",
        "symlink control file",
        "current-head source drift",
    ),
)
def test_control_failure_never_calls_exporter_or_creates_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, message: str
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    called = False

    def reject(**_kwargs: object) -> tuple[dict[str, object], dict[str, object], str]:
        raise preparer.V8PreparationError(message)

    def export(**_kwargs: object) -> dict[str, object]:
        nonlocal called
        called = True
        run_root.mkdir(parents=True)
        return {"cell_count": 76}

    with pytest.raises(preparer.V8PreparationError, match=message):
        preparer._source_export_impl(
            run_root=run_root,
            lane_checkpoint_path=tmp_path / "checkpoint.json",
            config_path=tmp_path / "config.json",
            control_validator=reject,
            packet_exporter=export,
        )
    assert called is False
    assert not run_root.exists()


def test_source_export_cli_requires_explicit_registered_routes() -> None:
    with pytest.raises(SystemExit):
        preparer.main(["source-export"])


def test_export_adapter_context_has_only_v8_schema_and_identities() -> None:
    config = preparer.require_production_pins()
    legacy_base = preparer._PARENT._BASE
    expected_dependencies = {
        "delegated": legacy_base.DELEGATED_PREPARER_PATH,
        "hardened": legacy_base.HARDENED_PREPARER_PATH,
        "variable_map": legacy_base.VARIABLE_MAP_PATH,
    }
    prior_production_schema = legacy_base.PRODUCTION_CONFIG_SCHEMA
    checkpoint_path = (
        preparer.ROOT
        / ".codex/worktree-checkpoints/exact17-v8-source-export-hook-20260823.json"
    )
    checkpoint = json.loads(checkpoint_path.read_bytes())
    with preparer._configured_v8_export(
        config=config,
        checkpoint_path=checkpoint_path,
        checkpoint=checkpoint,
        head="a" * 40,
    ) as base:
        provenance = base.build_production_config_manifest(preparer.ROOT)
        visible = {
            "production": base.PRODUCTION_CONFIG_SCHEMA,
            "campaign": base.CAMPAIGN_SCHEMA,
            "finite": base.FINITE_SCHEMA,
            "root_producer": base.ROOT_PRODUCER_SCHEMA,
            "cell": base.category_id(2, "none"),
            "provenance": provenance["schema"],
        }
        assert all("v8" in value.lower() for value in visible.values())
        assert all("v7" not in value.lower() for value in visible.values())
        assert base.PRODUCER_SCHEMA == preparer.PRODUCER_SCHEMA
        assert base.SOURCE_SCHEMA == preparer.SOURCE_SCHEMA
        assert base.WAVE_SCHEMA == preparer.WAVE_SCHEMA
        assert {
            "delegated": base.DELEGATED_PREPARER_PATH,
            "hardened": base.HARDENED_PREPARER_PATH,
            "variable_map": base.VARIABLE_MAP_PATH,
        } == expected_dependencies
        assert all(
            "v7" not in value.lower()
            for value in (
                base.PRODUCER_SCHEMA,
                base.SOURCE_SCHEMA,
                base.WAVE_SCHEMA,
                base.FINITE_SCHEMA,
                base.CAMPAIGN_SCHEMA,
                base.ROOT_PRODUCER_SCHEMA,
                base.category_id(2, "none"),
            )
        )
    assert legacy_base.PRODUCTION_CONFIG_SCHEMA == prior_production_schema


def _runtime_support_validation_kwargs() -> dict[str, Path]:
    return {
        "repo_root": preparer.ROOT,
        "source_path": preparer.SOURCE_PATH,
        "root_source_path": preparer.ROOT_SOURCE_PATH,
        "exporter_path": preparer.EXPORTER_PATH,
        "immediate_parent_exporter_path": (
            preparer.ROOT / preparer.INHERITED_IMMEDIATE_PARENT_EXPORTER_RELATIVE
        ),
        "delegated_preparer_path": (
            preparer.ROOT / preparer.INHERITED_DELEGATED_PREPARER_RELATIVE
        ),
        "hardened_preparer_path": (
            preparer.ROOT / preparer.INHERITED_HARDENED_PREPARER_RELATIVE
        ),
        "variable_map_path": preparer.ROOT / preparer.INHERITED_VARIABLE_MAP_RELATIVE,
        "checkpoint_path": (
            preparer.ROOT
            / ".codex/worktree-checkpoints/"
            "exact17-v8-source-export-hook-20260823.json"
        ),
        "preparer_path": preparer.PREPARER_PATH,
        "test_path": preparer.TEST_PATH,
        "output_root": preparer.RUN_ROOT,
    }


def test_real_runtime_adapter_validates_every_live_inherited_support_file() -> None:
    config = _config()
    kwargs = _runtime_support_validation_kwargs()
    checkpoint_path = kwargs["checkpoint_path"]
    checkpoint = json.loads(checkpoint_path.read_bytes())
    with preparer._configured_v8_export(
        config=config,
        checkpoint_path=checkpoint_path,
        checkpoint=checkpoint,
        head="a" * 40,
    ) as base:
        digests = base._validate_support(**kwargs)
        assert digests["immediate_parent_exporter"] == (
            preparer.INHERITED_IMMEDIATE_PARENT_EXPORTER_SHA256
        )
        assert digests["delegated_preparer"] == (
            preparer.INHERITED_DELEGATED_PREPARER_SHA256
        )
        assert digests["hardened_preparer"] == (
            preparer.INHERITED_HARDENED_PREPARER_SHA256
        )
        assert digests["variable_map"] == preparer.INHERITED_VARIABLE_MAP_SHA256
        base.verify_committed_dependency_blobs(
            preparer.ROOT,
            kwargs["delegated_preparer_path"],
            kwargs["hardened_preparer_path"],
        )


@pytest.mark.parametrize(
    ("field", "relative", "label"),
    [
        (
            "immediate_parent_exporter_path",
            preparer.INHERITED_IMMEDIATE_PARENT_EXPORTER_RELATIVE,
            "immediate_parent_exporter",
        ),
        (
            "delegated_preparer_path",
            preparer.INHERITED_DELEGATED_PREPARER_RELATIVE,
            "delegated_preparer",
        ),
        (
            "hardened_preparer_path",
            preparer.INHERITED_HARDENED_PREPARER_RELATIVE,
            "hardened_preparer",
        ),
        (
            "variable_map_path",
            preparer.INHERITED_VARIABLE_MAP_RELATIVE,
            "variable_map",
        ),
    ],
)
def test_real_runtime_adapter_rejects_each_inherited_support_tamper(
    tmp_path: Path, field: str, relative: str, label: str
) -> None:
    config = _config()
    kwargs = _runtime_support_validation_kwargs()
    checkpoint_path = kwargs["checkpoint_path"]
    checkpoint = json.loads(checkpoint_path.read_bytes())
    tampered = tmp_path / Path(relative).name
    tampered.write_bytes((preparer.ROOT / relative).read_bytes() + b"\n")
    kwargs[field] = tampered
    with preparer._configured_v8_export(
        config=config,
        checkpoint_path=checkpoint_path,
        checkpoint=checkpoint,
        head="a" * 40,
    ) as base, pytest.raises(
        base.PreparationError, match=f"{label} digest drifted"
    ):
        base._validate_support(**kwargs)


@pytest.mark.parametrize(
    ("constant", "label"),
    [
        (
            "INHERITED_IMMEDIATE_PARENT_EXPORTER_SHA256",
            "immediate_parent_exporter",
        ),
        ("INHERITED_DELEGATED_PREPARER_SHA256", "delegated_preparer"),
        ("INHERITED_HARDENED_PREPARER_SHA256", "hardened_preparer"),
        ("INHERITED_VARIABLE_MAP_SHA256", "variable_map"),
    ],
)
def test_runtime_adapter_rejects_each_inherited_identity_pin_tamper(
    monkeypatch: pytest.MonkeyPatch, constant: str, label: str
) -> None:
    config = _config()
    checkpoint_path = (
        preparer.ROOT
        / ".codex/worktree-checkpoints/exact17-v8-source-export-hook-20260823.json"
    )
    checkpoint = json.loads(checkpoint_path.read_bytes())
    monkeypatch.setattr(preparer, constant, "0" * 64)
    with pytest.raises(
        preparer.V8PreparationError,
        match=f"inherited V8 runtime support {label} identity drifted",
    ), preparer._configured_v8_export(
        config=config,
        checkpoint_path=checkpoint_path,
        checkpoint=checkpoint,
        head="a" * 40,
    ):
        pass


@pytest.mark.parametrize(
    "constant",
    [
        "INHERITED_DELEGATED_PREPARER_COMMIT",
        "INHERITED_HARDENED_PREPARER_COMMIT",
    ],
)
def test_runtime_adapter_rejects_each_inherited_commit_pin_tamper(
    monkeypatch: pytest.MonkeyPatch, constant: str
) -> None:
    config = _config()
    kwargs = _runtime_support_validation_kwargs()
    checkpoint_path = kwargs["checkpoint_path"]
    checkpoint = json.loads(checkpoint_path.read_bytes())
    monkeypatch.setattr(preparer, constant, "0" * 40)
    with preparer._configured_v8_export(
        config=config,
        checkpoint_path=checkpoint_path,
        checkpoint=checkpoint,
        head="a" * 40,
    ) as base, pytest.raises(
        base.PreparationError, match="delegated dependency commit blob unavailable"
    ):
        base.verify_committed_dependency_blobs(
            preparer.ROOT,
            kwargs["delegated_preparer_path"],
            kwargs["hardened_preparer_path"],
        )


def test_export_adapter_replaces_inherited_post_create_initializer() -> None:
    config = preparer.require_production_pins()
    checkpoint_path = (
        preparer.ROOT
        / ".codex/worktree-checkpoints/exact17-v8-source-export-hook-20260823.json"
    )
    checkpoint = json.loads(checkpoint_path.read_bytes())
    base = preparer._PARENT._BASE
    inherited = base._initialize_run_root_authenticated
    inherited_governed = base._initialize_governed_skeleton
    sink: list[preparer._ExportRootCustody] = []
    with preparer._configured_v8_export(
        config=config,
        checkpoint_path=checkpoint_path,
        checkpoint=checkpoint,
        head="a" * 40,
        root_custody_sink=sink,
    ) as configured:
        assert configured._initialize_run_root_authenticated is not inherited
        assert configured._initialize_governed_skeleton is not inherited_governed
        assert sink == []
    assert base._initialize_run_root_authenticated is inherited
    assert base._initialize_governed_skeleton is inherited_governed


def test_failure_policy_contains_no_path_mutation_cleanup() -> None:
    source = Path(preparer.__file__).read_text()
    assert "_remove_failed_export_root" not in source
    assert "os.rmdir(" not in source
    assert "os.unlink(" not in source
    assert "os.rename(" not in source


def test_closing_custody_preserves_replaced_run_root_identity(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    run_root.mkdir(parents=True)
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    custody = preparer._capture_export_root_custody(run_root)
    retained = run_root.with_name("retained-owned-root")
    run_root.rename(retained)
    run_root.mkdir()
    (run_root / "foreign-marker").write_text("replacement")
    preparer._close_export_root_custody(custody)
    assert (run_root / "foreign-marker").read_text() == "replacement"
    assert retained.is_dir()


def test_initializer_rejects_replacement_before_custody_is_published(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "lane" / "preparation-v1"
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    retained = run_root.with_name("retained-created-root")
    original_open = preparer.os.open
    raced = False

    def raced_open(
        path: object, flags: int, *args: object, dir_fd: int | None = None, **kwargs: object
    ) -> int:
        nonlocal raced
        descriptor = original_open(path, flags, *args, dir_fd=dir_fd, **kwargs)
        if path == run_root.name and dir_fd is not None and not raced:
            raced = True
            run_root.rename(retained)
            run_root.mkdir()
            (run_root / "foreign-marker").write_text("replacement")
        return descriptor

    monkeypatch.setattr(preparer.os, "open", raced_open)
    with pytest.raises(preparer.V8PreparationError, match="crossed inode custody"):
        preparer._initialize_export_root_with_custody(run_root, b"{}")
    assert (run_root / "foreign-marker").read_text() == "replacement"
    assert retained.is_dir()


@pytest.mark.parametrize("failure_operation", ("fstat", "stat"))
def test_capture_directory_chain_closes_pending_component_on_metadata_failure(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    failure_operation: str,
) -> None:
    path = tmp_path / "capture-parent" / "capture-leaf"
    path.mkdir(parents=True)
    original_open = preparer.os.open
    original_fstat = preparer.os.fstat
    original_stat = preparer.os.stat
    target_fd: int | None = None
    injected = False

    def track_open(
        name: object,
        flags: int,
        *args: object,
        dir_fd: int | None = None,
        **kwargs: object,
    ) -> int:
        nonlocal target_fd
        descriptor = original_open(name, flags, *args, dir_fd=dir_fd, **kwargs)
        if name == path.name and target_fd is None:
            target_fd = descriptor
        return descriptor

    def fail_fstat(descriptor: int) -> os.stat_result:
        nonlocal injected
        if failure_operation == "fstat" and descriptor == target_fd and not injected:
            injected = True
            raise OSError("injected component fstat failure")
        return original_fstat(descriptor)

    def fail_stat(
        name: object, *args: object, **kwargs: object
    ) -> os.stat_result:
        nonlocal injected
        if failure_operation == "stat" and name == path.name and not injected:
            injected = True
            raise OSError("injected component stat failure")
        return original_stat(name, *args, **kwargs)

    monkeypatch.setattr(preparer.os, "open", track_open)
    monkeypatch.setattr(preparer.os, "fstat", fail_fstat)
    monkeypatch.setattr(preparer.os, "stat", fail_stat)
    with pytest.raises(OSError, match="injected component"):
        preparer._capture_directory_chain(path)
    assert injected and target_fd is not None
    with pytest.raises(OSError):
        original_fstat(target_fd)


@pytest.mark.parametrize("failure_operation", ("fstat", "stat"))
def test_open_export_directory_path_closes_pending_component_on_metadata_failure(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    failure_operation: str,
) -> None:
    base, _config_value, _checkpoint_path, _checkpoint, _head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    original_open = preparer.os.open
    original_fstat = preparer.os.fstat
    original_stat = preparer.os.stat
    target_fd: int | None = None
    injected = False

    def track_open(
        name: object,
        flags: int,
        *args: object,
        dir_fd: int | None = None,
        **kwargs: object,
    ) -> int:
        nonlocal target_fd
        descriptor = original_open(name, flags, *args, dir_fd=dir_fd, **kwargs)
        if name == "artifacts" and target_fd is None:
            target_fd = descriptor
        return descriptor

    def fail_fstat(descriptor: int) -> os.stat_result:
        nonlocal injected
        if failure_operation == "fstat" and descriptor == target_fd and not injected:
            injected = True
            raise OSError("injected retained-parent fstat failure")
        return original_fstat(descriptor)

    def fail_stat(
        name: object, *args: object, **kwargs: object
    ) -> os.stat_result:
        nonlocal injected
        if failure_operation == "stat" and name == "artifacts" and not injected:
            injected = True
            raise OSError("injected retained-parent stat failure")
        return original_stat(name, *args, **kwargs)

    monkeypatch.setattr(preparer.os, "open", track_open)
    monkeypatch.setattr(preparer.os, "fstat", fail_fstat)
    monkeypatch.setattr(preparer.os, "stat", fail_stat)
    try:
        with pytest.raises(OSError, match="injected retained-parent"):
            preparer._open_export_directory_path(
                base,
                root_custody,
                preparer.PurePosixPath("artifacts"),
                "injected directory",
            )
        assert injected and target_fd is not None
        with pytest.raises(OSError):
            original_fstat(target_fd)
    finally:
        preparer._close_export_root_custody(root_custody)


@pytest.mark.parametrize("phase", ("lane", "root"))
@pytest.mark.parametrize("failure_operation", ("fstat", "stat"))
def test_initializer_closes_pending_fd_and_preserves_pre_custody_failure_marker(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    phase: str,
    failure_operation: str,
) -> None:
    run_root = tmp_path / "runs" / "initializer-lane" / "preparation-v1"
    run_root.parent.parent.mkdir(parents=True)
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    target_name = run_root.parent.name if phase == "lane" else run_root.name
    original_open = preparer.os.open
    original_fstat = preparer.os.fstat
    original_stat = preparer.os.stat
    target_fd: int | None = None
    injected = False

    def track_open(
        name: object,
        flags: int,
        *args: object,
        dir_fd: int | None = None,
        **kwargs: object,
    ) -> int:
        nonlocal target_fd
        descriptor = original_open(name, flags, *args, dir_fd=dir_fd, **kwargs)
        if name == target_name and target_fd is None:
            target_fd = descriptor
        return descriptor

    def fail_fstat(descriptor: int) -> os.stat_result:
        nonlocal injected
        if failure_operation == "fstat" and descriptor == target_fd and not injected:
            injected = True
            raise OSError(f"injected {phase} fstat failure")
        return original_fstat(descriptor)

    def fail_stat(
        name: object, *args: object, **kwargs: object
    ) -> os.stat_result:
        nonlocal injected
        if failure_operation == "stat" and name == target_name and not injected:
            injected = True
            raise OSError(f"injected {phase} stat failure")
        return original_stat(name, *args, **kwargs)

    monkeypatch.setattr(preparer.os, "open", track_open)
    monkeypatch.setattr(preparer.os, "fstat", fail_fstat)
    monkeypatch.setattr(preparer.os, "stat", fail_stat)
    with pytest.raises(OSError, match=f"injected {phase}"):
        preparer._initialize_export_root_with_custody(run_root, b"{}")
    assert injected and target_fd is not None
    with pytest.raises(OSError):
        original_fstat(target_fd)
    assert run_root.parent.is_dir() and not run_root.parent.is_symlink()
    if phase == "lane":
        assert not run_root.exists()
        assert list(run_root.parent.iterdir()) == []
    else:
        assert run_root.is_dir() and not run_root.is_symlink()
        assert list(run_root.iterdir()) == []
        assert [path.name for path in run_root.parent.iterdir()] == [run_root.name]
    monkeypatch.setattr(preparer.os, "open", original_open)
    monkeypatch.setattr(preparer.os, "fstat", original_fstat)
    monkeypatch.setattr(preparer.os, "stat", original_stat)
    with pytest.raises(preparer.V8PreparationError, match="refusing retry"):
        preparer._initialize_export_root_with_custody(run_root, b"{}")


@pytest.mark.parametrize("phase", ("lane", "root"))
def test_initializer_persistent_open_failure_preserves_marker_and_blocks_retry(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, phase: str
) -> None:
    run_root = tmp_path / "runs" / "initializer-open-lane" / "preparation-v1"
    run_root.parent.parent.mkdir(parents=True)
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    target_name = run_root.parent.name if phase == "lane" else run_root.name
    original_open = preparer.os.open

    def fail_target_open(
        name: object,
        flags: int,
        *args: object,
        dir_fd: int | None = None,
        **kwargs: object,
    ) -> int:
        if name == target_name:
            raise OSError(f"persistent {phase} open failure")
        return original_open(name, flags, *args, dir_fd=dir_fd, **kwargs)

    monkeypatch.setattr(preparer.os, "open", fail_target_open)
    with pytest.raises(OSError, match=f"persistent {phase}"):
        preparer._initialize_export_root_with_custody(run_root, b"{}")
    assert run_root.parent.is_dir() and not run_root.parent.is_symlink()
    if phase == "lane":
        assert not run_root.exists()
        assert list(run_root.parent.iterdir()) == []
    else:
        assert run_root.is_dir() and not run_root.is_symlink()
        assert list(run_root.iterdir()) == []
        assert [path.name for path in run_root.parent.iterdir()] == [run_root.name]
    monkeypatch.setattr(preparer.os, "open", original_open)
    with pytest.raises(preparer.V8PreparationError, match="refusing retry"):
        preparer._initialize_export_root_with_custody(run_root, b"{}")


@pytest.mark.parametrize("phase", ("lane", "root"))
def test_initializer_open_failure_never_deletes_concurrent_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, phase: str
) -> None:
    run_root = tmp_path / "runs" / "initializer-replacement-lane" / "preparation-v1"
    run_root.parent.parent.mkdir(parents=True)
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    target_name = run_root.parent.name if phase == "lane" else run_root.name
    target_path = run_root.parent if phase == "lane" else run_root
    detached = target_path.with_name(f"{target_path.name}-detached-original")
    original_open = preparer.os.open
    original_mkdir = preparer.os.mkdir
    raced = False

    def race_after_mkdir(
        name: object,
        mode: int = 0o777,
        *args: object,
        dir_fd: int | None = None,
        **kwargs: object,
    ) -> None:
        nonlocal raced
        original_mkdir(name, mode, *args, dir_fd=dir_fd, **kwargs)
        if name == target_name and not raced:
            raced = True
            target_path.rename(detached)
            target_path.mkdir()
            (target_path / "foreign-marker").write_text("replacement")

    def fail_target_open(
        name: object,
        flags: int,
        *args: object,
        dir_fd: int | None = None,
        **kwargs: object,
    ) -> int:
        if name == target_name:
            raise OSError(f"persistent {phase} open failure")
        return original_open(name, flags, *args, dir_fd=dir_fd, **kwargs)

    monkeypatch.setattr(preparer.os, "mkdir", race_after_mkdir)
    monkeypatch.setattr(preparer.os, "open", fail_target_open)
    with pytest.raises(OSError, match=f"persistent {phase}"):
        preparer._initialize_export_root_with_custody(run_root, b"{}")
    assert raced
    assert (target_path / "foreign-marker").read_text() == "replacement"
    assert detached.is_dir() and not detached.is_symlink()
    assert list(detached.iterdir()) == []


@pytest.mark.parametrize("validator", ("parent-novelty", "root-plus-units"))
@pytest.mark.parametrize("failure_operation", ("second-dup", "second-fdopen"))
def test_validator_closes_transient_duplicates_on_transfer_failure(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    validator: str,
    failure_operation: str,
) -> None:
    left_path = tmp_path / "left.cnf"
    right_path = tmp_path / "right.cnf"
    left_path.write_bytes(b"p cnf 1 0\n")
    right_path.write_bytes(b"p cnf 1 0\n")
    left_fd = os.open(left_path, os.O_RDONLY)
    right_fd = os.open(right_path, os.O_RDONLY)
    original_dup = preparer.os.dup
    original_fdopen = preparer.os.fdopen
    original_fstat = preparer.os.fstat
    duplicates: list[int] = []
    dup_calls = 0
    fdopen_calls = 0

    class Published:
        def __init__(self, descriptor: int) -> None:
            self.descriptor = descriptor

        def verify(self, _label: str) -> os.stat_result:
            return original_fstat(self.descriptor)

    def fail_dup(descriptor: int) -> int:
        nonlocal dup_calls
        dup_calls += 1
        if failure_operation == "second-dup" and dup_calls == 2:
            raise OSError("injected second dup failure")
        duplicate = original_dup(descriptor)
        duplicates.append(duplicate)
        return duplicate

    def fail_fdopen(
        descriptor: int, *args: object, **kwargs: object
    ) -> object:
        nonlocal fdopen_calls
        fdopen_calls += 1
        if failure_operation == "second-fdopen" and fdopen_calls == 2:
            raise OSError("injected second fdopen failure")
        return original_fdopen(descriptor, *args, **kwargs)

    monkeypatch.setattr(preparer.os, "dup", fail_dup)
    monkeypatch.setattr(preparer.os, "fdopen", fail_fdopen)
    left = Published(left_fd)
    right = Published(right_fd)
    try:
        with pytest.raises(OSError, match="injected second"):
            if validator == "parent-novelty":
                preparer._validate_v8_parent_novelty(left, right)
            else:
                preparer._validate_exact_root_plus_units(
                    object(),
                    left,
                    right,
                    center=0,
                    category="none",
                    label="injected transfer",
                )
        assert len(duplicates) == (1 if failure_operation == "second-dup" else 2)
        for descriptor in duplicates:
            with pytest.raises(OSError):
                original_fstat(descriptor)
    finally:
        os.close(left_fd)
        os.close(right_fd)


def test_initializer_close_preserves_created_root_and_blocks_retry(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "runs" / "fresh-lane" / "preparation-v1"
    run_root.parent.parent.mkdir(parents=True)
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    custody = preparer._initialize_export_root_with_custody(run_root, b"{}")
    try:
        assert custody.created_lane_parent is True
        preparer._assert_export_root_custody(run_root, custody)
    finally:
        preparer._close_export_root_custody(custody)
    assert (run_root / "run_manifest.json").read_bytes() == b"{}"
    with pytest.raises(preparer.V8PreparationError, match="refusing retry"):
        preparer._initialize_export_root_with_custody(run_root, b"{}")


def test_closing_custody_preserves_replaced_lane_parent_identity(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "runs" / "lane" / "preparation-v1"
    run_root.mkdir(parents=True)
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    custody = preparer._capture_export_root_custody(run_root)
    lane = run_root.parent
    retained = lane.with_name("retained-lane")
    lane.rename(retained)
    shutil.copytree(retained, lane)
    (lane / "foreign-marker").write_text("replacement")
    preparer._close_export_root_custody(custody)
    assert (lane / "foreign-marker").read_text() == "replacement"
    assert (retained / "preparation-v1").is_dir()


def test_closing_custody_never_mutates_quarantine_like_sibling(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "runs" / "lane" / "preparation-v1"
    run_root.mkdir(parents=True)
    (run_root / "owned-marker").write_text("retained")
    monkeypatch.setattr(preparer, "RUN_ROOT", run_root)
    custody = preparer._capture_export_root_custody(run_root)
    lane = run_root.parent
    sibling = lane / ".preparation-v1.source-export-failure-existing"
    sibling.mkdir()
    (sibling / "marker").write_text("foreign")
    preparer._close_export_root_custody(custody)
    assert (run_root / "owned-marker").read_text() == "retained"
    assert (sibling / "marker").read_text() == "foreign"


def test_small_fixture_packet_passes_full_76_cell_custody_audit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    try:
        report = preparer._audit_source_packet(
            base=base,
            config=config,
            checkpoint_path=checkpoint_path,
            checkpoint=checkpoint,
            head=head,
            root_custody=root_custody,
        )
        assert report["cell_count"] == 76
        assert report["root_clauses"] == 2
        assert report["physical_cell_clauses"] == 8
        assert "v7" not in report["schema"].lower()
    finally:
        preparer._close_export_root_custody(root_custody)


def test_source_export_identity_is_hardened_create_once(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    try:
        preparer._audit_source_packet(
            base=base,
            config=config,
            checkpoint_path=checkpoint_path,
            checkpoint=checkpoint,
            head=head,
            root_custody=root_custody,
        )
        identity_path = preparer.RUN_ROOT / "artifacts/source-export-identity.json"
        identity_path.write_bytes(b"{}")
        with pytest.raises(preparer.V8PreparationError, match="differs"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)


def test_identity_publication_rejects_detached_artifacts_directory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    artifacts = preparer.RUN_ROOT / "artifacts"
    retained = preparer.RUN_ROOT / "artifacts-retained"
    original_open = preparer._open_export_directory_path
    raced = False

    def detach_artifacts(
        *args: object, **kwargs: object
    ) -> preparer._RetainedDirectoryPath:
        nonlocal raced
        directories = original_open(*args, **kwargs)
        label = args[3] if len(args) > 3 else kwargs.get("label")
        if label == "V8 source-export identity directory" and not raced:
            raced = True
            artifacts.rename(retained)
            shutil.copytree(retained, artifacts)
        return directories

    monkeypatch.setattr(preparer, "_open_export_directory_path", detach_artifacts)
    try:
        with pytest.raises(preparer.V8PreparationError, match="ancestor identity drifted"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)
    assert not (artifacts / "source-export-identity.json").exists()
    assert not (retained / "source-export-identity.json").exists()


def test_identity_publication_rejects_artifacts_replacement_after_packet_checks(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    artifacts = preparer.RUN_ROOT / "artifacts"
    retained = preparer.RUN_ROOT / "artifacts-retained-after-checks"
    original_write = preparer._secure_write_export_identity

    def replace_then_publish(*args: object, **kwargs: object) -> None:
        artifacts.rename(retained)
        shutil.copytree(retained, artifacts)
        (artifacts / "campaign-manifest.json").write_bytes(b"malicious replacement")
        original_write(*args, **kwargs)

    monkeypatch.setattr(preparer, "_secure_write_export_identity", replace_then_publish)
    try:
        with pytest.raises(preparer.V8PreparationError, match="ancestor identity drifted"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)
    assert not (artifacts / "source-export-identity.json").exists()
    assert not (retained / "source-export-identity.json").exists()


def test_identity_publication_rejects_new_hardlinked_file(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    identity_path = preparer.RUN_ROOT / "artifacts/source-export-identity.json"
    hardlink_path = preparer.RUN_ROOT / "artifacts/source-export-identity-hardlink.json"
    original_write = base._write_all

    def hardlink_after_write(descriptor: int, payload: bytes) -> None:
        original_write(descriptor, payload)
        os.link(identity_path, hardlink_path)

    monkeypatch.setattr(base, "_write_all", hardlink_after_write)
    try:
        with pytest.raises(preparer.V8PreparationError, match="publication drifted"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)
    assert identity_path.is_file()
    assert hardlink_path.is_file()
    assert identity_path.stat().st_ino == hardlink_path.stat().st_ino


def test_identity_replay_rejects_existing_same_payload_hardlink(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    identity_path = preparer.RUN_ROOT / "artifacts/source-export-identity.json"
    hardlink_path = preparer.RUN_ROOT / "artifacts/source-export-identity-hardlink.json"
    try:
        preparer._audit_source_packet(
            base=base,
            config=config,
            checkpoint_path=checkpoint_path,
            checkpoint=checkpoint,
            head=head,
            root_custody=root_custody,
        )
        os.link(identity_path, hardlink_path)
        original_read_fd_stable = base._read_fd_stable

        def permissive_identity_read(
            descriptor: int, label: str
        ) -> tuple[bytes, os.stat_result]:
            if label != "existing V8 source-export identity":
                return original_read_fd_stable(descriptor, label)
            os.lseek(descriptor, 0, os.SEEK_SET)
            chunks: list[bytes] = []
            while chunk := os.read(descriptor, 65_536):
                chunks.append(chunk)
            return b"".join(chunks), os.fstat(descriptor)

        monkeypatch.setattr(base, "_read_fd_stable", permissive_identity_read)
        with pytest.raises(
            preparer.V8PreparationError, match="singly linked regular file"
        ):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)
    assert identity_path.is_file()
    assert hardlink_path.is_file()
    assert identity_path.stat().st_ino == hardlink_path.stat().st_ino


def test_identity_replay_rejects_hardlink_added_during_retained_verify(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    identity_path = preparer.RUN_ROOT / "artifacts/source-export-identity.json"
    hardlink_path = preparer.RUN_ROOT / "artifacts/source-export-identity-hardlink.json"
    original_verify = preparer._RetainedDescendant.verify
    target_verifications = 0

    def hardlink_after_final_verify(
        retained: preparer._RetainedDescendant, label: str
    ) -> None:
        nonlocal target_verifications
        original_verify(retained, label)
        if label == "existing V8 source-export identity":
            target_verifications += 1
        if target_verifications == 2 and not hardlink_path.exists():
            os.link(identity_path, hardlink_path)

    try:
        preparer._audit_source_packet(
            base=base,
            config=config,
            checkpoint_path=checkpoint_path,
            checkpoint=checkpoint,
            head=head,
            root_custody=root_custody,
        )
        monkeypatch.setattr(
            preparer._RetainedDescendant, "verify", hardlink_after_final_verify
        )
        with pytest.raises(
            preparer.V8PreparationError, match="singly linked regular file"
        ):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)
    assert identity_path.is_file()
    assert hardlink_path.is_file()


def test_new_identity_rejects_hardlink_added_during_reopened_verify(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    identity_path = preparer.RUN_ROOT / "artifacts/source-export-identity.json"
    hardlink_path = preparer.RUN_ROOT / "artifacts/source-export-identity-hardlink.json"
    original_verify = preparer._RetainedDescendant.verify
    target_verifications = 0

    def hardlink_after_final_verify(
        retained: preparer._RetainedDescendant, label: str
    ) -> None:
        nonlocal target_verifications
        original_verify(retained, label)
        if label == "published V8 source-export identity":
            target_verifications += 1
        if target_verifications == 2 and not hardlink_path.exists():
            os.link(identity_path, hardlink_path)

    monkeypatch.setattr(
        preparer._RetainedDescendant, "verify", hardlink_after_final_verify
    )
    try:
        with pytest.raises(
            preparer.V8PreparationError, match="singly linked regular file"
        ):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)
    assert identity_path.is_file()
    assert hardlink_path.is_file()


def test_packet_audit_rejects_identical_path_replacement_before_audit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    run_root = preparer.RUN_ROOT
    retained = run_root.with_name("retained-original")
    run_root.rename(retained)
    shutil.copytree(retained, run_root)
    try:
        with pytest.raises(preparer.V8PreparationError, match="run-root custody"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)


def test_packet_audit_rejects_lane_parent_replacement_before_audit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    lane = preparer.RUN_ROOT.parent
    retained = lane.with_name("retained-lane-before-audit")
    lane.rename(retained)
    shutil.copytree(retained, lane)
    try:
        with pytest.raises(preparer.V8PreparationError, match="run-root custody"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)


def test_packet_audit_rejects_identical_replacement_during_audit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    run_root = preparer.RUN_ROOT
    retained = run_root.with_name("retained-during-audit")
    original_assert = preparer._assert_export_root_custody
    calls = 0

    def replace_then_assert(
        candidate: Path, custody: preparer._ExportRootCustody
    ) -> None:
        nonlocal calls
        calls += 1
        if calls == 5:
            candidate.rename(retained)
            shutil.copytree(retained, candidate)
        original_assert(candidate, custody)

    monkeypatch.setattr(preparer, "_assert_export_root_custody", replace_then_assert)
    try:
        with pytest.raises(preparer.V8PreparationError, match="run-root custody"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)


def test_packet_audit_rejects_lane_parent_replacement_during_audit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    lane = preparer.RUN_ROOT.parent
    retained = lane.with_name("retained-lane-during-audit")
    original_assert = preparer._assert_export_root_custody
    calls = 0

    def replace_then_assert(
        candidate: Path, custody: preparer._ExportRootCustody
    ) -> None:
        nonlocal calls
        calls += 1
        if calls == 5:
            lane.rename(retained)
            shutil.copytree(retained, lane)
        original_assert(candidate, custody)

    monkeypatch.setattr(preparer, "_assert_export_root_custody", replace_then_assert)
    try:
        with pytest.raises(preparer.V8PreparationError, match="run-root custody"):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)


def test_packet_audit_aba_reads_only_retained_descriptors(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    run_root = preparer.RUN_ROOT
    retained = run_root.with_name("retained-aba-original")
    transient = run_root.with_name("transient-aba-replacement")
    original_open = preparer._open_export_descendant
    raced = False

    def aba_open(*args: object, **kwargs: object) -> preparer._RetainedDescendant:
        nonlocal raced
        descendant = original_open(*args, **kwargs)
        if not raced:
            raced = True
            run_root.rename(retained)
            shutil.copytree(retained, run_root)
            (run_root / "run_manifest.json").write_bytes(b"not-json")
            run_root.rename(transient)
            retained.rename(run_root)
        return descendant

    monkeypatch.setattr(preparer, "_open_export_descendant", aba_open)
    try:
        report = preparer._audit_source_packet(
            base=base,
            config=config,
            checkpoint_path=checkpoint_path,
            checkpoint=checkpoint,
            head=head,
            root_custody=root_custody,
        )
        assert report["cell_count"] == 76
        assert (transient / "run_manifest.json").read_bytes() == b"not-json"
    finally:
        preparer._close_export_root_custody(root_custody)


def test_open_descendant_closes_leaf_when_post_open_custody_fails(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, _config_value, _checkpoint_path, _checkpoint, _head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    opened: list[int] = []

    def reject_after_open(
        self: preparer._RetainedDescendant, _label: str
    ) -> None:
        opened.append(self.descriptor)
        raise preparer.V8PreparationError("forced post-open custody failure")

    monkeypatch.setattr(preparer._RetainedDescendant, "verify", reject_after_open)
    try:
        with pytest.raises(preparer.V8PreparationError, match="post-open custody"):
            preparer._open_export_descendant(
                base,
                root_custody,
                preparer.PurePosixPath("run_manifest.json"),
                "fixture descendant",
            )
        assert len(opened) == 1
        with pytest.raises(OSError):
            os.fstat(opened[0])
    finally:
        preparer._close_export_root_custody(root_custody)


def test_capture_published_closes_descendant_when_metadata_read_fails(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, _config_value, _checkpoint_path, _checkpoint, _head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    original_open = preparer._open_export_descendant
    original_fstat = preparer.os.fstat
    target_fd: int | None = None

    def track_descendant(*args: object, **kwargs: object) -> preparer._RetainedDescendant:
        nonlocal target_fd
        descendant = original_open(*args, **kwargs)
        target_fd = descendant.descriptor
        return descendant

    def fail_target(descriptor: int) -> os.stat_result:
        if descriptor == target_fd:
            raise OSError("injected published fstat failure")
        return original_fstat(descriptor)

    monkeypatch.setattr(preparer, "_open_export_descendant", track_descendant)
    monkeypatch.setattr(preparer.os, "fstat", fail_target)
    try:
        with pytest.raises(OSError, match="published fstat"):
            preparer._capture_export_published(
                base,
                root_custody,
                "artifacts/cumulative-root.cnf",
                "injected published",
            )
        assert target_fd is not None
        with pytest.raises(OSError):
            original_fstat(target_fd)
    finally:
        preparer._close_export_root_custody(root_custody)


@pytest.mark.parametrize(
    "tamper",
    (
        "v7-schema",
        "cnf-prefix",
        "cnf-unit",
        "producer-cross-link",
        "producer-raw-hash",
        "wave-cross-link",
        "wave-raw-hash",
        "campaign-raw-hash",
        "campaign-claim",
        "producer-backend",
        "root-producer-link",
        "immediate-parent-cross-link",
        "production-provenance-rewrite",
        "producer-parent-novelty-cross-link",
        "producer-production-cross-link",
        "absolute-reference",
        "dotdot-reference",
        "symlink-parent",
    ),
)
def test_full_packet_audit_rejects_targeted_tamper(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, tamper: str
) -> None:
    base, config, checkpoint_path, checkpoint, head, root_custody = (
        _build_small_source_packet(tmp_path, monkeypatch)
    )
    root = preparer.ROOT
    campaign_path = preparer.RUN_ROOT / "artifacts/campaign-manifest.json"
    campaign = _read_json(campaign_path)
    cell = campaign["cells"][0]
    if tamper == "v7-schema":
        campaign["schema"] = (
            "canary-perp-bisector-survivor-four-point-two-circle-v7-two-"
            "kalmanson-refinements-physical-slice-campaign/v1"
        )
        _rewrite_campaign(root, campaign)
    elif tamper in {"cnf-prefix", "cnf-unit"}:
        cnf_path = root / cell["cnf"]["path"]
        lines = cnf_path.read_bytes().splitlines(keepends=True)
        if tamper == "cnf-prefix":
            lines[1] = b"2 0\n"
        else:
            lines[-1] = b"1 0\n"
        _rewrite_cnf_chain(root, campaign, cell, b"".join(lines))
    elif tamper in {"producer-cross-link", "producer-raw-hash"}:
        producer_path = root / cell["producer_manifest"]["path"]
        producer = _read_json(producer_path)
        producer["source_manifest"]["source_id"] = "old-v7-cell"
        producer["source_manifest_sha256"] = preparer.sha256_bytes(
            preparer.canonical_json_bytes(producer["source_manifest"])
        )
        producer_raw = _write_canonical(producer_path, producer)
        if tamper == "producer-cross-link":
            cell["producer_manifest"] = _ref(root, producer_path, producer_raw)
            wave_path = root / cell["wave_manifest"]["path"]
            wave = _read_json(wave_path)
            wave["encoding"]["producer_manifest_sha256"] = preparer.sha256_bytes(
                producer_raw
            )
            _rewrite_wave_and_campaign(root, campaign, cell, wave)
    elif tamper in {"wave-cross-link", "wave-raw-hash"}:
        wave_path = root / cell["wave_manifest"]["path"]
        wave = _read_json(wave_path)
        wave["execution"]["shard_id"] = 75
        wave_raw = _write_canonical(wave_path, wave)
        if tamper == "wave-cross-link":
            cell["wave_manifest"] = _ref(root, wave_path, wave_raw)
            _rewrite_campaign(root, campaign)
    elif tamper == "campaign-raw-hash":
        campaign["status"] = "TAMPERED"
        _write_canonical(campaign_path, campaign)
    elif tamper == "campaign-claim":
        campaign["claims"]["exact17_closed"] = True
        _rewrite_campaign(root, campaign)
    elif tamper == "producer-backend":
        producer_path = root / cell["producer_manifest"]["path"]
        producer = _read_json(producer_path)
        producer["backend"] = "evil"
        producer_raw = _write_canonical(producer_path, producer)
        cell["producer_manifest"] = _ref(root, producer_path, producer_raw)
        wave_path = root / cell["wave_manifest"]["path"]
        wave = _read_json(wave_path)
        wave["encoding"]["producer_manifest_sha256"] = preparer.sha256_bytes(
            producer_raw
        )
        _rewrite_wave_and_campaign(root, campaign, cell, wave)
    elif tamper == "root-producer-link":
        campaign["source"]["parent_producer_sha256"] = "0" * 64
        _rewrite_campaign(root, campaign)
    elif tamper == "immediate-parent-cross-link":
        campaign["source"]["immediate_parent_exporter_sha256"] = "0" * 64
        _rewrite_campaign(root, campaign)
    elif tamper == "production-provenance-rewrite":
        campaign["source"]["production_config"]["sha256"] = "0" * 64
        campaign["source"]["production_config_sha256"] = preparer.sha256_bytes(
            preparer.canonical_json_bytes(campaign["source"]["production_config"])
        )
        _rewrite_campaign(root, campaign)
    elif tamper in {
        "producer-parent-novelty-cross-link",
        "producer-production-cross-link",
    }:
        producer_path = root / cell["producer_manifest"]["path"]
        producer = _read_json(producer_path)
        field = (
            "parent_novelty"
            if tamper == "producer-parent-novelty-cross-link"
            else "production_config"
        )
        producer[field]["tampered"] = True
        producer[f"{field}_sha256"] = preparer.sha256_bytes(
            preparer.canonical_json_bytes(producer[field])
        )
        producer_raw = _write_canonical(producer_path, producer)
        cell["producer_manifest"] = _ref(root, producer_path, producer_raw)
        wave_path = root / cell["wave_manifest"]["path"]
        wave = _read_json(wave_path)
        wave["encoding"]["producer_manifest_sha256"] = preparer.sha256_bytes(
            producer_raw
        )
        _rewrite_wave_and_campaign(root, campaign, cell, wave)
    elif tamper in {"absolute-reference", "dotdot-reference"}:
        cell["cnf"]["path"] = (
            "/absolute/cell.cnf"
            if tamper == "absolute-reference"
            else "scratch/runs/../cell.cnf"
        )
        _rewrite_campaign(root, campaign)
    elif tamper == "symlink-parent":
        directory = (root / cell["cnf"]["path"]).parent
        retained = directory.with_name(directory.name + "-retained")
        directory.rename(retained)
        directory.symlink_to(retained, target_is_directory=True)
    else:
        raise AssertionError(tamper)
    try:
        with pytest.raises((preparer.V8PreparationError, base.PreparationError)):
            preparer._audit_source_packet(
                base=base,
                config=config,
                checkpoint_path=checkpoint_path,
                checkpoint=checkpoint,
                head=head,
                root_custody=root_custody,
            )
    finally:
        preparer._close_export_root_custody(root_custody)
