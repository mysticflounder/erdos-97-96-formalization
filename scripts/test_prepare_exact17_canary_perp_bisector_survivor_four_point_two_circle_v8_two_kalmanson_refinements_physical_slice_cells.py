from __future__ import annotations

import copy
import json
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
    assert "without exporting" in capsys.readouterr().out
