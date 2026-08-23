from __future__ import annotations

import hashlib
import json
from pathlib import Path

import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_physical_slice_cells as preparer
import pytest


def test_v7_preparer_source_and_clause_contract_is_frozen() -> None:
    preparer.validate_committed_dependencies()
    assert preparer.PARENT_VARIABLES == 308
    assert preparer.IMMEDIATE_PARENT_CLAUSES == 7_409_788
    assert preparer.PARENT_CLAUSES == 7_409_810
    assert preparer.CELL_CLAUSES == 7_409_816
    assert preparer.CELL_COUNT == 76
    assert len(preparer.EXPECTED_SUFFIX) == 22
    assert len(set(preparer.EXPECTED_SUFFIX)) == 22
    assert (
        hashlib.sha256(
            preparer._BASE.canonical_json_bytes(preparer.EXPECTED_SUFFIX)
        ).hexdigest()
        == preparer.EXPECTED_SUFFIX_SHA256
    )
    preparer._validate_v7_contract()


def test_v7_preparer_config_phase_is_fail_closed() -> None:
    assert preparer._BASE.PRODUCTION_PINS_FINALIZED is False
    assert preparer._BASE.PINNED_SOURCE_COMMIT == ""
    assert preparer._BASE.REGISTERED_GENERATED_ROOT == ""
    assert preparer.missing_lean_dependencies() == ()
    if not preparer.PRODUCTION_CONFIG_PATH.exists():
        return

    raw = preparer.PRODUCTION_CONFIG_PATH.read_bytes()
    config = json.loads(raw)
    preparer._BASE._validate_production_config_payload(config)
    assert raw == preparer._BASE.canonical_json_bytes(config)
    assert config["generated_root"] == (
        "scratch/runs/exact17-v7-two-kalmanson-successor-preparer-20260823/"
        "preparation-v1"
    )
    target = config["target_code"]
    target_paths = {
        "preparer": preparer.PREPARER_PATH,
        "test": preparer.TEST_PATH,
    }
    pins_match_live = all(
        pin["path"] == path.relative_to(preparer.ROOT).as_posix()
        and pin["bytes"] == len(live := path.read_bytes())
        and pin["sha256"] == preparer._sha256(live)
        for role, path in target_paths.items()
        for pin in (target[role],)
    )
    synthetic_commit = "1" * 40

    def config_blob_reader(
        repo_root: Path, commit: str, relative_path: str
    ) -> bytes:
        assert repo_root == preparer.ROOT
        assert commit == synthetic_commit
        assert relative_path == preparer.PRODUCTION_CONFIG_RELATIVE.as_posix()
        return raw

    def preflight() -> dict[str, object]:
        return preparer.preflight_configuration(
            production_config_path=preparer.PRODUCTION_CONFIG_PATH,
            production_config_commit=synthetic_commit,
            output_root=preparer.ROOT / config["generated_root"],
            config_blob_reader=config_blob_reader,
        )
    if pins_match_live:
        assert preflight()["status"] == "PRODUCTION_PREFLIGHT_OK"
    else:
        with pytest.raises(preparer.PreparationError):
            preflight()


def test_v7_preparer_uses_fresh_source_ids_and_schemas() -> None:
    cell_id = preparer._BASE._cell_id(2, "none")
    assert cell_id == (
        "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
        "refinements-next-center-02-physical-none"
    )
    labels = (
        preparer.PRODUCTION_CONFIG_SCHEMA,
        preparer._BASE.SCHEMA,
        preparer._BASE.CAMPAIGN_SCHEMA,
        preparer._BASE.FINITE_SCHEMA,
        preparer._BASE.ROOT_PRODUCER_SCHEMA,
        preparer._BASE.SOURCE_THEOREM,
    )
    assert all("v7" in label.lower() for label in labels)
    assert preparer._BASE.SOURCE_PATH == preparer.SOURCE_PATH
    assert preparer._BASE.EXPORTER_PATH == preparer.EXPORTER_PATH


def test_v7_preparer_help_never_describes_the_v5_packet(
    capsys: pytest.CaptureFixture[str],
) -> None:
    assert preparer.main(["--help"]) == 0
    rendered = capsys.readouterr().out
    for required in ("V7", "22-clause", "7,409,810", "7,409,816", "76"):
        assert required in rendered
    for stale in ("V5", "20-clause", "7,409,780", "7,409,786"):
        assert stale not in rendered
