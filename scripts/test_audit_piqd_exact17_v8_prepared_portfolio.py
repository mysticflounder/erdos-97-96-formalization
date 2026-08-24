from __future__ import annotations

from pathlib import Path

import audit_piqd_exact17_v8_prepared_portfolio as audit
import pytest


def _ref(path: str, raw: bytes) -> dict[str, object]:
    return {"path": path, "sha256": audit.sha256_bytes(raw), "bytes": len(raw)}


def _synthetic_campaign() -> tuple[dict[str, object], dict[str, object], dict[str, object]]:
    source_cells: list[dict[str, object]] = []
    production_cells: list[dict[str, object]] = []
    transformed: list[dict[str, object]] = []
    for source_id, source_identity in audit.runner.SOURCE_CELL_IDENTITIES.items():
        production_id = f"{source_id}-{audit.runner.PORTFOLIO_CELL_SUFFIX}"
        source_refs = {
            "cnf": {
                "path": f"source/{source_id}.cnf",
                "sha256": source_identity["cnf_sha256"],
                "bytes": source_identity["cnf_bytes"],
            },
            "producer_manifest": {
                "path": f"source/{source_id}-producer.json",
                "sha256": source_identity["producer_sha256"],
                "bytes": source_identity["producer_bytes"],
            },
            "wave_manifest": {
                "path": f"source/{source_id}-wave.json",
                "sha256": source_identity["wave_sha256"],
                "bytes": source_identity["wave_bytes"],
            },
        }
        source_cell = {
            "cell_id": source_id,
            "cnf": source_refs["cnf"],
            "producer_manifest": source_refs["producer_manifest"],
            "wave_manifest": source_refs["wave_manifest"],
        }
        source_cells.append(source_cell)
        production_cells.append(
            {
                "portfolio_cell_id": production_id,
                "source_cell_id": source_id,
                "source_cnf": dict(source_refs["cnf"]),
                "producer_manifest": {
                    "path": f"artifacts/cells/{production_id}/producer-manifest.json",
                    "sha256": audit.runner.PRODUCTION_CELL_IDENTITIES[production_id]["producer_sha256"],
                    "bytes": audit.runner.PRODUCTION_CELL_IDENTITIES[production_id]["producer_bytes"],
                },
                "wave_manifest": {
                    "path": f"artifacts/cells/{production_id}/wave-manifest.json",
                    "sha256": audit.runner.PRODUCTION_CELL_IDENTITIES[production_id]["wave_sha256"],
                    "bytes": audit.runner.PRODUCTION_CELL_IDENTITIES[production_id]["wave_bytes"],
                },
                "expected_identity_hash": audit.runner.PRODUCTION_CELL_IDENTITIES[production_id]["identity_hash"],
            }
        )
        transformed.append({"portfolio_cell_id": production_id, "producer_raw": b"{}", "wave_raw": b"{}"})
    source_campaign = {"cells": source_cells}
    campaign = {"cells": production_cells}
    bundle = {
        "source_cell_identities": audit.runner.SOURCE_CELL_IDENTITIES,
        "production_cell_identities": audit.runner.PRODUCTION_CELL_IDENTITIES,
        "transformed": transformed,
    }
    return source_campaign, campaign, bundle


def test_exact_inventory_accepts_create_once_shape(tmp_path: Path) -> None:
    cells = [{"portfolio_cell_id": "cell-00"}]
    expected = audit.expected_output_files(cells)
    for relative in expected:
        path = tmp_path / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(b"x")
    (tmp_path / "events").mkdir()
    (tmp_path / "tmp").mkdir()
    result = audit.validate_exact_output_inventory(tmp_path, expected)
    assert result == {"files": 4, "directories": 5}


def test_exact_inventory_rejects_extra_file(tmp_path: Path) -> None:
    expected = audit.expected_output_files([{"portfolio_cell_id": "cell-00"}])
    for relative in expected:
        path = tmp_path / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(b"x")
    (tmp_path / "events").mkdir()
    (tmp_path / "tmp").mkdir()
    (tmp_path / "events" / "unexpected.json").write_bytes(b"x")
    with pytest.raises(audit.PreparedPortfolioAuditError, match="file inventory"):
        audit.validate_exact_output_inventory(tmp_path, expected)


def test_order_binding_rejects_permuted_production_cells() -> None:
    source_campaign, campaign, bundle = _synthetic_campaign()
    cells = campaign["cells"]
    assert isinstance(cells, list)
    cells[0], cells[1] = cells[1], cells[0]
    with pytest.raises(audit.PreparedPortfolioAuditError, match="order or source binding"):
        audit._validate_order_and_binding(source_campaign, campaign, bundle)


def test_generated_manifest_bytes_are_compared_to_derived_bytes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "prepared"
    producer_raw = audit.canonical_json_bytes({"producer_id": "cell-00"})
    wave_raw = audit.canonical_json_bytes({"wave_id": "cell-00"})
    producer_path = run_root / "artifacts/cells/cell-00/producer-manifest.json"
    wave_path = run_root / "artifacts/cells/cell-00/wave-manifest.json"
    producer_path.parent.mkdir(parents=True)
    producer_path.write_bytes(producer_raw)
    wave_path.write_bytes(wave_raw)
    cell = {
        "portfolio_cell_id": "cell-00",
        "producer_manifest": _ref(
            "prepared/artifacts/cells/cell-00/producer-manifest.json", producer_raw
        ),
        "wave_manifest": _ref(
            "prepared/artifacts/cells/cell-00/wave-manifest.json", wave_raw
        ),
    }
    monkeypatch.setattr(audit.runner._BASE, "_require_source_production_config", lambda *args, **kwargs: None)
    monkeypatch.setattr(audit.runner._BASE, "validate_wave_manifest", lambda wave: None)
    assert audit._validate_generated_files(
        tmp_path,
        run_root,
        [cell],
        {"cell-00": {"producer_raw": producer_raw, "wave_raw": wave_raw}},
    ) == 1
    mutated = audit.canonical_json_bytes({"producer_id": "tampered"})
    producer_path.write_bytes(mutated)
    cell["producer_manifest"] = _ref(
        "prepared/artifacts/cells/cell-00/producer-manifest.json", mutated
    )
    with pytest.raises(audit.PreparedPortfolioAuditError, match="bytes drifted"):
        audit._validate_generated_files(
            tmp_path,
            run_root,
            [cell],
            {"cell-00": {"producer_raw": producer_raw, "wave_raw": wave_raw}},
        )


def test_read_ref_rejects_parent_traversal(tmp_path: Path) -> None:
    outside = tmp_path.parent / "outside.json"
    outside.write_bytes(b"{}")
    with pytest.raises(audit.PreparedPortfolioAuditError, match="unsafe"):
        audit._read_ref(tmp_path, _ref("../outside.json", b"{}"), "test", 1024)


def test_summary_json_is_canonical() -> None:
    value = {"status": "PASS", "cell_count": 76}
    assert audit.canonical_json_bytes(value) == b'{"cell_count":76,"status":"PASS"}'


def test_live_runner_governed_symbols_resolve() -> None:
    assert audit.runner.miner.MINER_RELATIVE
    assert audit.runner.SOURCE_PREPARER_RELATIVE
    assert audit.runner.CHECKPOINT_RELATIVE
    assert audit.runner.RUNNER_CODE_CHECKPOINT_RELATIVE
    assert audit.runner.RUNNER_RELATIVE
    assert audit.runner.RUNNER_TEST_RELATIVE
