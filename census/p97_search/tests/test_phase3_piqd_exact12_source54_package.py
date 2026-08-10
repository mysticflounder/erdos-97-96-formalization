from __future__ import annotations

import os
from pathlib import Path
from types import SimpleNamespace

import pytest

from census.card_head import exact12_v14_ordered_coverage as coverage_module
from census.card_head import exact12_v14_source_order_bank as bank_module
from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.p97_search import phase3_piqd_exact12_source54_package as package


def test_extension_profile_is_exact_all_enabled_and_immutable() -> None:
    assert dict(package._EXTENSION_PROFILE) == {
        "include_equal_k4": True,
        "include_equilateral_bisector": True,
        "include_three_triad": True,
        "include_perpendicular_bisector": True,
    }
    with pytest.raises(TypeError):
        package._EXTENSION_PROFILE["include_equal_k4"] = False


def test_strict_json_rejects_duplicates_constants_and_noncanonical_bytes(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    with pytest.raises(package.Exact12Source54PackageError, match="strict JSON"):
        package.parse_strict_json(b'{"x":1,"x":2}', require_canonical=False)
    with pytest.raises(package.Exact12Source54PackageError, match="strict JSON"):
        package.parse_strict_json(b'{"x":NaN}', require_canonical=False)
    with pytest.raises(package.Exact12Source54PackageError, match="not canonical"):
        package.parse_strict_json(b'{"b": 2, "a": 1}', require_canonical=True)
    assert package.parse_strict_json(b'{"a":1,"b":2}', require_canonical=True) == {
        "a": 1,
        "b": 2,
    }

    def recursive_failure(*_args: object, **_kwargs: object) -> object:
        raise RecursionError

    monkeypatch.setattr(package.json, "loads", recursive_failure)
    with pytest.raises(package.Exact12Source54PackageError, match="strict JSON"):
        package.parse_strict_json(b"[]", require_canonical=False)


def test_generic_variable_entry_validator_rejects_gaps_and_type_drift() -> None:
    valid = [
        {"variable": 1, "kind": "left"},
        {"variable": 2, "kind": "right"},
    ]
    package._validate_contiguous_variable_entries(
        valid,
        expected_num_variables=2,
        expected_kind_counts={"left": 1, "right": 1},
    )
    with pytest.raises(package.Exact12Source54PackageError, match="ID or kind"):
        package._validate_contiguous_variable_entries(
            [{"variable": 1, "kind": "left"}, {"variable": 3, "kind": "right"}],
            expected_num_variables=2,
            expected_kind_counts={"left": 1, "right": 1},
        )
    with pytest.raises(package.Exact12Source54PackageError, match="ID or kind"):
        package._validate_contiguous_variable_entries(
            [{"variable": True, "kind": "left"}],
            expected_num_variables=1,
            expected_kind_counts={"left": 1},
        )


def test_total_map_covers_exact_allocation_and_decodes_choice_rows() -> None:
    materialized = materialize_cell(package.CELL_INDEX)
    rebuilt = SimpleNamespace(
        instance=materialized.instance,
        compiled=materialized.compiled,
    )
    variable_map = package.build_total_variable_map(rebuilt)
    package.validate_total_variable_map(variable_map)
    assert variable_map["entries"][0]["kind"] == "choice"
    assert variable_map["entries"][42_710]["kind"] == "relation"
    assert variable_map["entries"][-1] == {
        "variable": 44_855,
        "kind": "relation",
        "left_edge_index": 64,
        "right_edge_index": 65,
        "left_edge": [9, 11],
        "right_edge": [10, 11],
        "lexicographic_rank": 2_144,
    }

    selected = [
        entry["variable"]
        for entry in variable_map["entries"]
        if entry["kind"] == "choice" and entry["candidate_index"] == 0
    ]
    cube = package.decode_model_to_base_cube(variable_map, selected)
    assert set(cube) == {str(center) for center in range(12)}
    with pytest.raises(package.Exact12Source54PackageError, match="selects 0 rows"):
        package.decode_model_to_base_cube(variable_map, selected[1:])

    resigned = package.parse_strict_json(
        package.canonical_json_bytes(variable_map), require_canonical=True
    )
    resigned["entries"][0]["candidate_index"] = 1
    with pytest.raises(
        package.Exact12Source54PackageError, match="exact cell-8 allocation"
    ):
        package.validate_total_variable_map(resigned)

    with pytest.raises(package.Exact12Source54PackageError, match="complete model"):
        package.decode_and_validate_model(rebuilt, variable_map, selected)


def test_clause_anomaly_scan_is_independent_and_v1_rejects_anomalies() -> None:
    clean = package._scan_clauses(((1, -2), (-1, 3)))
    assert clean == {
        "clauses_scanned": 2,
        "tautological_clauses": 0,
        "repeated_literal_clauses": 0,
        "empty_clauses": 0,
    }
    package._require_zero_anomalies(clean)
    dirty = package._scan_clauses(((1, 1), (2, -2), ()))
    assert dirty["repeated_literal_clauses"] == 1
    assert dirty["tautological_clauses"] == 1
    assert dirty["empty_clauses"] == 1
    with pytest.raises(package.Exact12Source54PackageError, match="v1 rejects"):
        package._require_zero_anomalies(dirty)


def test_frozen_bank_prefix_restores_live_append_only_bank() -> None:
    original_bank = bank_module.PROOF_BACKED_CUBE_BINDINGS
    original_detector = coverage_module.PROOF_BACKED_CUBE_BINDINGS
    assert len(original_bank) >= package.SOURCE_ORDER_CUTS
    assert len(original_detector) >= package.SOURCE_ORDER_CUTS
    with package._frozen_source54_bank():
        assert len(bank_module.PROOF_BACKED_CUBE_BINDINGS) == 54
        assert len(coverage_module.PROOF_BACKED_CUBE_BINDINGS) == 54
        assert (
            package.sha256_json(bank_module.PROOF_BACKED_CUBE_BINDINGS)
            == package.SOURCE54_BINDINGS_SHA256
        )
    assert bank_module.PROOF_BACKED_CUBE_BINDINGS is original_bank
    assert coverage_module.PROOF_BACKED_CUBE_BINDINGS is original_detector


def test_pinned_artifact_records_reject_self_consistent_substitution() -> None:
    records = [
        {"name": name, "bytes": size, "file_sha256": digest}
        for name, size, digest in package._PINNED_PACKAGE_ARTIFACTS
    ]
    package._validate_pinned_artifact_records(records)
    records[3]["file_sha256"] = "0" * 64
    with pytest.raises(package.Exact12Source54PackageError, match="pinned source54"):
        package._validate_pinned_artifact_records(records)


def test_create_once_preserves_an_existing_directory(tmp_path: Path) -> None:
    output = tmp_path / "package"
    output.mkdir()
    sentinel = output / "sentinel"
    sentinel.write_bytes(b"preserve")
    with pytest.raises(package.Exact12Source54PackageError, match="already exists"):
        package._write_create_once(output, {"artifact": b"new"})
    assert sentinel.read_bytes() == b"preserve"


def test_create_once_rejects_symlinked_parent(tmp_path: Path) -> None:
    real_parent = tmp_path / "real"
    real_parent.mkdir()
    alias = tmp_path / "alias"
    alias.symlink_to(real_parent, target_is_directory=True)
    with pytest.raises(package.Exact12Source54PackageError, match="cannot open"):
        package._write_create_once(alias / "package", {"artifact": b"new"})
    assert not (real_parent / "package").exists()


def test_create_once_detects_output_directory_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "package"
    moved = tmp_path / "original-package"
    real_fstat = package.os.fstat
    raced = False

    def replacing_fstat(descriptor: int) -> os.stat_result:
        nonlocal raced
        result = real_fstat(descriptor)
        if not raced and output.exists():
            output.rename(moved)
            output.mkdir()
            raced = True
        return result

    monkeypatch.setattr(package.os, "fstat", replacing_fstat)
    with pytest.raises(package.Exact12Source54PackageError, match="replaced"):
        package._write_create_once(output, {"artifact": b"new"})
    assert raced
    assert output.is_dir()
    assert moved.is_dir()
    assert not (output / "artifact").exists()
    assert not (moved / "artifact").exists()


@pytest.mark.skipif(
    os.environ.get("P97_RUN_EXACT12_SOURCE54_LIVE") != "1",
    reason="set P97_RUN_EXACT12_SOURCE54_LIVE=1 for solver-free live reconstruction",
)
def test_live_package_reconstructs_and_reloads(tmp_path: Path) -> None:
    repo_root = Path(__file__).resolve().parents[3]
    loaded = package.build_package(repo_root, tmp_path / "source54-package")
    assert loaded.producer_manifest["claims"] == {
        "source_entitlement": False,
        "sat": False,
        "unsat": False,
        "proof": False,
        "universal": False,
        "aggregate_cell_coverage": False,
        "lean_closure": False,
        "solver_receipt": False,
    }
    assert package.sha256_bytes(loaded.artifacts["discovery.cnf"]) == package.CNF_SHA256
    assert package.sha256_bytes(loaded.artifacts["package-index.json"]) == (
        package.PACKAGE_INDEX_SHA256
    )
    package._validate_source54_bank(
        package.parse_strict_json(
            loaded.artifacts["source-order-bank.json"], require_canonical=True
        )
    )

    detached = loaded.producer_manifest
    detached["claims"]["sat"] = True
    assert loaded.producer_manifest["claims"]["sat"] is False

    resigned = loaded.producer_manifest
    resigned["scope"]["normalized_v14_cell"] = 9
    body = dict(resigned)
    body.pop("identity")
    resigned["identity"] = {"canonical_body_sha256": package.sha256_json(body)}
    with pytest.raises(package.Exact12Source54PackageError, match="finite scope"):
        package._validate_producer_manifest(resigned)

    reloaded = package.load_package(loaded.directory)
    assert reloaded.artifacts == loaded.artifacts
