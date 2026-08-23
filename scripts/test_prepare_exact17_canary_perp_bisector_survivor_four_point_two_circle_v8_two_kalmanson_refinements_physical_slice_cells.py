from __future__ import annotations

import json
from pathlib import Path

import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_physical_slice_cells as preparer
import pytest


def _config(*, finalized: bool = False) -> dict[str, object]:
    return {
        "base_head": preparer.BASE_HEAD,
        "blocker": "V8 Lean packet is not frozen",
        "generated_root": preparer.RUN_ROOT.relative_to(preparer.ROOT).as_posix(),
        "lane_id": preparer.LANE_ID,
        "production_pins_finalized": finalized,
        "schema": preparer.PRODUCTION_CONFIG_SCHEMA,
        "source_paths": {
            "exporter": preparer.EXPORTER_RELATIVE,
            "root": preparer.ROOT_SOURCE_RELATIVE,
            "source": preparer.SOURCE_RELATIVE,
        },
    }


def _write_config(tmp_path: Path, value: dict[str, object]) -> Path:
    path = tmp_path / "config.json"
    path.write_text(json.dumps(value, sort_keys=True), encoding="utf-8")
    return path


def test_provisional_config_fails_closed(tmp_path: Path) -> None:
    path = _write_config(tmp_path, _config())
    with pytest.raises(preparer.V8PreparationError, match="source pins are incomplete"):
        preparer.require_production_pins(path)


def test_false_finality_under_provisional_schema_fails_closed(tmp_path: Path) -> None:
    path = _write_config(tmp_path, _config(finalized=True))
    with pytest.raises(preparer.V8PreparationError, match="finalized support schema"):
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
def test_config_route_tamper_fails(
    tmp_path: Path, field: str, replacement: str, message: str
) -> None:
    value = _config()
    value[field] = replacement
    path = _write_config(tmp_path, value)
    with pytest.raises(preparer.V8PreparationError, match=message):
        preparer.require_production_pins(path)


@pytest.mark.parametrize("source_field", ["root", "source", "exporter"])
def test_source_route_tamper_fails(tmp_path: Path, source_field: str) -> None:
    value = _config()
    source_paths = dict(value["source_paths"])
    source_paths[source_field] = "lean/old-v7.lean"
    value["source_paths"] = source_paths
    path = _write_config(tmp_path, value)
    with pytest.raises(preparer.V8PreparationError, match="source routes"):
        preparer.require_production_pins(path)


def test_route_contract_contains_only_v8_routes() -> None:
    contract = preparer.route_contract()
    assert contract["run_root"] == (
        "scratch/runs/exact17-v8-two-kalmanson-successor-preparer-20260823/"
        "preparation-v1"
    )
    assert all("v8" in route.lower() for route in contract.values())
    assert all("v7" not in route.lower() for route in contract.values())


def test_direct_call_rejects_non_v8_output_root(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(preparer, "validate_committed_dependencies", lambda: None)
    with pytest.raises(preparer.V8PreparationError, match="output root drifted"):
        preparer.prepare_campaign(run_root=preparer.ROOT / "scratch/runs/v7/run")


def test_category_id_rewrites_only_the_exact_parent_prefix() -> None:
    parent = preparer._PARENT.SOURCE_CELL_PREFIX + "-next-center-02-physical-none"
    result = preparer.category_id(parent)
    assert result == preparer.SOURCE_CELL_PREFIX + "-next-center-02-physical-none"
    assert "v8-two-kalmanson" in result
    with pytest.raises(preparer.V8PreparationError):
        preparer.category_id("not-a-parent-cell")


def test_cli_help_does_not_touch_parent_or_files(capsys: pytest.CaptureFixture[str]) -> None:
    assert preparer.main(["--help"]) == 0
    assert "V8" in capsys.readouterr().out
