from __future__ import annotations

import json
import os
import stat
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_exact17_package as package_module
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_exact17_package import (
    PACKAGE_RESULT_SCHEMA,
    PRODUCER_SCHEMA,
    SELECTED_ANONYMOUS_POSITIONS,
    SELECTED_CNF_PATH,
    SELECTED_DIRECTORY,
    SELECTED_MANIFEST_PATH,
    SELECTED_ORDER,
    SELECTED_STRUCTURAL_CNF_PATH,
    SELECTED_VALIDATION_PATH,
    UPSTREAM_SCHEMA,
    UPSTREAM_SCOPE,
    VALIDATION_SCHEMA,
    VARIABLE_MAP_SCHEMA,
    VARIABLE_MAP_STATUS,
    Exact17Identity,
    Exact17PackageError,
    package_exact17,
)


@dataclass(frozen=True)
class Exact17Fixture:
    repo_root: Path
    cnf_path: Path
    structural_path: Path
    manifest_path: Path
    validation_path: Path
    output_dir: Path
    variables: int = 6
    clauses: int = 21
    structural_variables: int = 6
    structural_clauses: int = 17


def _digest(label: str) -> str:
    return sha256_bytes(label.encode("utf-8"))


def _write_json(path: Path, value: object) -> None:
    path.write_bytes(canonical_json_bytes(value))


def _read_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_bytes())
    assert isinstance(value, dict)
    return value


def _digest_record(count: int, label: str) -> dict[str, object]:
    return {
        "count": count,
        "square_sum": _digest(f"{label}-square-sum"),
        "sum": _digest(f"{label}-sum"),
        "xor": _digest(f"{label}-xor"),
    }


def _refresh_identity(
    fixture: Exact17Fixture,
    monkeypatch: pytest.MonkeyPatch,
    *,
    variables: int | None = None,
    clauses: int | None = None,
) -> None:
    cnf = fixture.cnf_path.read_bytes()
    structural_cnf = fixture.structural_path.read_bytes()
    identity = Exact17Identity(
        cnf_sha256=sha256_bytes(cnf),
        cnf_bytes=len(cnf),
        manifest_sha256=sha256_bytes(fixture.manifest_path.read_bytes()),
        validation_sha256=sha256_bytes(fixture.validation_path.read_bytes()),
        num_variables=fixture.variables if variables is None else variables,
        num_clauses=fixture.clauses if clauses is None else clauses,
        structural_cnf_sha256=sha256_bytes(structural_cnf),
        structural_cnf_bytes=len(structural_cnf),
        structural_num_variables=fixture.structural_variables,
        structural_num_clauses=fixture.structural_clauses,
    )
    monkeypatch.setattr(package_module, "SELECTED_V12T_IDENTITY", identity)


def _fixture(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> Exact17Fixture:
    repo_root = tmp_path / "repo"
    input_dir = repo_root / SELECTED_DIRECTORY
    input_dir.mkdir(parents=True)
    cnf_path = repo_root / SELECTED_CNF_PATH
    structural_path = repo_root / SELECTED_STRUCTURAL_CNF_PATH
    manifest_path = repo_root / SELECTED_MANIFEST_PATH
    validation_path = repo_root / SELECTED_VALIDATION_PATH
    clauses = [f"{index % 6 + 1} 0" for index in range(21)]
    cnf_path.write_bytes(("p cnf 6 21\n" + "\n".join(clauses) + "\n").encode())
    structural_clauses = [f"{index % 6 + 1} 0" for index in range(17)]
    structural_path.write_bytes(
        ("p cnf 6 17\n" + "\n".join(structural_clauses) + "\n").encode()
    )

    blocks = {key: 0 for key in package_module._CLAUSE_BLOCK_KEYS}
    blocks["source_coverage"] = 17
    for key in package_module._REQUIRED_TRANSITIVE_BLOCKS:
        blocks[key] = 1
    source_hashes = {
        key: _digest(f"manifest-source-{key}")
        for key in package_module._MANIFEST_SOURCE_HASH_KEYS
    }
    cut_admission: dict[str, dict[str, object]] = {}
    cut_keys = (
        "direct_five_ccw_three_rows",
        "direct_shared_middle_endpoint_pair",
        "direct_six_ccw_two_k2_three_rows",
        "two_rows_shared_late_pair",
    )
    for key in cut_keys:
        record: dict[str, object] = {
            "clauses": blocks[key],
            "lean_consumer": f"Problem97.Fixture.{key}",
            "orientation_scope": "one normalized fixture order",
        }
        if key == "two_rows_shared_late_pair":
            record["antecedent"] = "fixture antecedent"
        cut_admission[key] = record
    manifest = {
        "analyses": [
            {"path": f"analysis/{index:02d}.json", "sha256": _digest(f"a-{index}")}
            for index in range(44)
        ],
        "anonymous_positions": SELECTED_ANONYMOUS_POSITIONS,
        "artifacts": [{"path": "artifacts/bank.json", "sha256": _digest("bank")}],
        "clause_blocks": blocks,
        "clauses": 21,
        "cnf": SELECTED_CNF_PATH,
        "cnf_sha256": sha256_bytes(cnf_path.read_bytes()),
        "cut_admission": cut_admission,
        "learned_record_kinds": {"formalized-bank": 1, "weighted-kalmanson": 1},
        "learned_replay": "verified",
        "order": SELECTED_ORDER,
        "order_index": 0,
        "schema": UPSTREAM_SCHEMA,
        "scope": UPSTREAM_SCOPE,
        "source_hashes": source_hashes,
        "transitive_two_circle": True,
        "transitive_two_circle_metadata": {
            "comparison_xor_variables": 73440,
            "distance_label_bits": 8,
            "distance_label_variables": 1088,
            "edge_pair_comparisons": 9180,
            "five_point_forbidden_cores": 1,
            "forbidden_cores": 1,
        },
        "variables": 6,
    }
    _write_json(manifest_path, manifest)

    validation_source_hashes = {
        report_key: source_hashes[manifest_key]
        for report_key, manifest_key in package_module._SOURCE_HASH_CROSSWALK.items()
    }
    report = {
        "anonymous_positions": SELECTED_ANONYMOUS_POSITIONS,
        "cadical_model_roundtrip": "PASS",
        "candidate_cnf": SELECTED_CNF_PATH,
        "candidate_cnf_sha256": sha256_bytes(cnf_path.read_bytes()),
        "candidate_exact_regeneration": "PASS",
        "candidate_manifest": SELECTED_MANIFEST_PATH,
        "candidate_manifest_sha256": sha256_bytes(manifest_path.read_bytes()),
        "order": SELECTED_ORDER,
        "order_index": 0,
        "schema": VALIDATION_SCHEMA,
        "source_hashes": validation_source_hashes,
        "source_z3_models_checked": 1,
        "static_clause_digests": {
            key: _digest_record(blocks[key], f"static-{key}")
            for key in package_module._STATIC_DIGEST_KEYS
        },
        "status": "PASS",
        "structural_clauses": 17,
        "structural_cnf": SELECTED_STRUCTURAL_CNF_PATH,
        "structural_cnf_sha256": sha256_bytes(structural_path.read_bytes()),
        "transitive_clause_digests": {
            "convex_five_point": _digest_record(1, "transitive-convex-five-point")
        },
        "truth_table_assignments": dict(package_module._TRUTH_TABLE_ASSIGNMENTS),
        "variables": 6,
    }
    _write_json(validation_path, report)
    fixture = Exact17Fixture(
        repo_root=repo_root,
        cnf_path=cnf_path,
        structural_path=structural_path,
        manifest_path=manifest_path,
        validation_path=validation_path,
        output_dir=repo_root / "scratch" / "exact17-package",
    )
    _refresh_identity(fixture, monkeypatch)
    return fixture


def _package(fixture: Exact17Fixture, *, output_dir: Path | None = None):
    return package_exact17(
        cnf_path=fixture.cnf_path,
        upstream_manifest_path=fixture.manifest_path,
        validation_report_path=fixture.validation_path,
        output_dir=fixture.output_dir if output_dir is None else output_dir,
        repo_root=fixture.repo_root,
    )


def _mutate_manifest(
    fixture: Exact17Fixture,
    monkeypatch: pytest.MonkeyPatch,
    mutation: Callable[[dict[str, Any]], None],
) -> None:
    manifest = _read_json(fixture.manifest_path)
    mutation(manifest)
    _write_json(fixture.manifest_path, manifest)
    _refresh_identity(fixture, monkeypatch)


def _mutate_report(
    fixture: Exact17Fixture,
    monkeypatch: pytest.MonkeyPatch,
    mutation: Callable[[dict[str, Any]], None],
) -> None:
    report = _read_json(fixture.validation_path)
    mutation(report)
    _write_json(fixture.validation_path, report)
    _refresh_identity(fixture, monkeypatch)


def _canonical_document(path: Path) -> dict[str, Any]:
    raw = path.read_bytes()
    value = json.loads(raw)
    assert raw == canonical_json_bytes(value)
    assert isinstance(value, dict)
    return value


def _expected_manifest_report_coverage() -> dict[str, Any]:
    return {
        "complete": False,
        "inventory_granularity": (
            "TOP_LEVEL_FIELDS_WITH_PARTIAL_MAPS_EXPANDED_TO_LEAVES"
        ),
        "scope": "UPSTREAM_MANIFEST_FIELDS_VS_FROZEN_V12T_VALIDATION_REPORT",
        "report_cross_validated_manifest_fields": [
            "anonymous_positions",
            "clause_blocks.direct_five_ccw_three_rows",
            "clause_blocks.direct_shared_middle_endpoint_pair",
            "clause_blocks.direct_six_ccw_two_k2_three_rows",
            "clause_blocks.kalmanson_core",
            "clause_blocks.seven_point_schema_c",
            "clause_blocks.seven_point_schema_f",
            "clause_blocks.six_point_schema_d",
            "clause_blocks.six_point_schema_e",
            "clause_blocks.six_point_schema_g",
            "clause_blocks.three_shell_rotation_bank",
            "clause_blocks.transitive_convex_five_point",
            "clause_blocks.two_circle_bisector",
            "clause_blocks.two_rows_shared_late_pair",
            "cnf",
            "cnf_sha256",
            "order",
            "order_index",
            "source_hashes.base_cnf_exporter",
            "source_hashes.direct_exporter",
            "source_hashes.direct_row_consumers",
            "source_hashes.fullcover",
            "source_hashes.shared_late_pair",
            "source_hashes.source_runner",
            "variables",
        ],
        "aggregate_only_relations": [
            {
                "manifest_fields": [
                    "clause_blocks.exact_four",
                    "clause_blocks.fifth_center_exactly_one",
                    "clause_blocks.fifth_row_source_and_one_hit",
                    "clause_blocks.initial_learned_patterns",
                    "clause_blocks.named_row_units",
                    "clause_blocks.old_row_cap_units",
                    "clause_blocks.old_row_outside_partition",
                    "clause_blocks.source_coverage",
                    "clause_blocks.two_center_common_hit",
                ],
                "relation": "SUM_EQUALS",
                "validation_report_field": "structural_clauses",
            }
        ],
        "manifest_fields_authenticated_only_by_exact_pinned_bytes": [
            "analyses",
            "artifacts",
            "clause_blocks.learned_nogoods",
            "clause_blocks.proposal_two_kalmanson_equality_label",
            "clause_blocks.transitive_label_selected_equality",
            "clause_blocks.transitive_label_xor_definition",
            "clause_blocks.transitive_two_circle_bisector",
            "clauses",
            "cut_admission",
            "learned_record_kinds",
            "learned_replay",
            "schema",
            "scope",
            "source_hashes.order_base",
            "source_hashes.producer_bank",
            "transitive_two_circle",
            "transitive_two_circle_metadata.comparison_xor_variables",
            "transitive_two_circle_metadata.distance_label_bits",
            "transitive_two_circle_metadata.distance_label_variables",
            "transitive_two_circle_metadata.edge_pair_comparisons",
            "transitive_two_circle_metadata.five_point_forbidden_cores",
            "transitive_two_circle_metadata.forbidden_cores",
        ],
        "whole_manifest_byte_authentication": {
            "package_identity_pin": True,
            "validation_report_field": "candidate_manifest_sha256",
        },
    }


def test_emits_deterministic_honest_one_job_package(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    first = _package(fixture)
    second_dir = fixture.repo_root / "scratch" / "exact17-package-replay"
    second = _package(fixture, output_dir=second_dir)

    expected_names = {
        "discovery.cnf",
        "ingress-identity.json",
        "order.json",
        "package-result.json",
        "producer-manifest.json",
        "structural-roundtrip.cnf",
        "upstream-manifest.json",
        "validation-report.json",
        "variable-map.json",
        "wave-manifest.json",
    }
    assert {path.name for path in fixture.output_dir.iterdir()} == expected_names
    assert {path.name: path.read_bytes() for path in fixture.output_dir.iterdir()} == {
        path.name: path.read_bytes() for path in second_dir.iterdir()
    }
    assert _package(fixture) == first
    assert first.as_dict() == second.as_dict()
    assert (fixture.output_dir / "discovery.cnf").read_bytes() == (
        fixture.cnf_path.read_bytes()
    )
    assert (fixture.output_dir / "structural-roundtrip.cnf").read_bytes() == (
        fixture.structural_path.read_bytes()
    )
    assert (fixture.output_dir / "upstream-manifest.json").read_bytes() == (
        fixture.manifest_path.read_bytes()
    )
    assert (fixture.output_dir / "validation-report.json").read_bytes() == (
        fixture.validation_path.read_bytes()
    )

    for name in expected_names - {
        "discovery.cnf",
        "structural-roundtrip.cnf",
        "upstream-manifest.json",
        "validation-report.json",
    }:
        _canonical_document(fixture.output_dir / name)
    variable_map = _canonical_document(fixture.output_dir / "variable-map.json")
    assert variable_map["schema"] == VARIABLE_MAP_SCHEMA
    assert variable_map["semantic_status"] == VARIABLE_MAP_STATUS
    assert variable_map["named_variables"] == []
    assert variable_map["opaque_variable_ranges"] == [[1, 6]]
    assert variable_map["coverage"] == {
        "full_variable_map_custody": False,
        "named_variables": 0,
        "opaque_variables": 6,
    }

    producer_raw = (fixture.output_dir / "producer-manifest.json").read_bytes()
    producer = _canonical_document(fixture.output_dir / "producer-manifest.json")
    ingress = _canonical_document(fixture.output_dir / "ingress-identity.json")
    wave = _canonical_document(fixture.output_dir / "wave-manifest.json")
    result = _canonical_document(fixture.output_dir / "package-result.json")
    validate_wave_manifest(wave)
    assert producer["schema"] == PRODUCER_SCHEMA
    assert ingress["structural_cnf_sha256"] == sha256_bytes(
        fixture.structural_path.read_bytes()
    )
    assert producer["artifacts"]["structural_cnf"] == {
        "bytes": len(fixture.structural_path.read_bytes()),
        "num_clauses": fixture.structural_clauses,
        "num_variables": fixture.structural_variables,
        "path": "structural-roundtrip.cnf",
        "sha256": sha256_bytes(fixture.structural_path.read_bytes()),
    }
    assert producer["provenance"]["source_hash_cross_validation"]["status"] == (
        "PARTIAL"
    )
    expected_coverage = _expected_manifest_report_coverage()
    assert (
        producer["provenance"]["manifest_report_cross_binding_coverage"]
        == expected_coverage
    )
    assert wave["encoding"]["producer_manifest_sha256"] == sha256_bytes(producer_raw)
    assert wave["encoding"]["query_polarity"] == UNSAT_MEANS_OBSTRUCTION
    assert wave["execution"] == {
        "backend": "cadical",
        "order_sha256": producer["artifacts"]["order"]["sha256"],
        "seed": 97,
        "shard_count": 1,
        "shard_id": 0,
        "solver_profile": "sat",
    }
    assert wave["promotion"] == {
        "consumer_theorem": None,
        "evidence_classification": LOCAL_CERTIFICATE,
        "lift_theorem": None,
        "producer_theorem": None,
    }
    claims = result["claims"]
    assert result["schema"] == PACKAGE_RESULT_SCHEMA
    assert result["artifacts"]["structural_cnf_sha256"] == sha256_bytes(
        fixture.structural_path.read_bytes()
    )
    assert result["manifest_report_cross_binding_coverage"] == expected_coverage
    assert claims == producer["provenance"]["claims"]
    assert claims["complete_manifest_report_cross_binding"] is False
    assert {key for key, value in claims.items() if value} == {
        "exact_cnf_byte_identity",
        "exact_structural_cnf_byte_identity",
        "exact_upstream_manifest_byte_identity",
        "exact_validation_report_byte_identity",
    }
    assert first.as_dict() == result


def test_reads_each_selected_input_exactly_once(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    original_open = package_module.os.open
    counts = {
        fixture.cnf_path.name: 0,
        fixture.structural_path.name: 0,
        fixture.manifest_path.name: 0,
        fixture.validation_path.name: 0,
    }

    def counting_open(path: os.PathLike[str] | str, *args: Any, **kwargs: Any) -> int:
        name = Path(os.fsdecode(path)).name
        if name in counts:
            counts[name] += 1
        return original_open(path, *args, **kwargs)

    monkeypatch.setattr(package_module.os, "open", counting_open)
    _package(fixture)
    assert counts == {name: 1 for name in counts}


def test_streams_dimacs_across_tiny_read_chunks(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    monkeypatch.setattr(package_module, "_READ_CHUNK_BYTES", 3)
    _package(fixture)


@pytest.mark.parametrize(
    "raw",
    [
        b'{"schema":"first","schema":"second"}\n',
        b'{"schema":NaN}\n',
        b'{"schema":Infinity}\n',
    ],
    ids=("duplicate-key", "nan", "infinity"),
)
@pytest.mark.parametrize("target", ["manifest", "validation"])
def test_rejects_non_strict_json(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    raw: bytes,
    target: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    path = fixture.manifest_path if target == "manifest" else fixture.validation_path
    path.write_bytes(raw)
    _refresh_identity(fixture, monkeypatch)

    with pytest.raises(Exact17PackageError, match="not strict JSON"):
        _package(fixture)


@pytest.mark.parametrize("target", ["manifest", "validation"])
def test_rejects_deeply_nested_json_inside_package_error_boundary(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, target: str
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    raw = b'{"nested":' + b"[" * 500_000 + b"0" + b"]" * 500_000 + b"}\n"
    path = fixture.manifest_path if target == "manifest" else fixture.validation_path
    path.write_bytes(raw)
    _refresh_identity(fixture, monkeypatch)

    with pytest.raises(Exact17PackageError, match="not strict JSON"):
        _package(fixture)


def test_private_schema_validators_reject_builtin_type_subclasses() -> None:
    class DictSubclass(dict[str, Any]):
        pass

    class ListSubclass(list[Any]):
        pass

    class IntSubclass(int):
        pass

    class StringSubclass(str):
        pass

    with pytest.raises(Exact17PackageError, match="must be an object"):
        package_module._mapping(DictSubclass(), "value")
    with pytest.raises(Exact17PackageError, match="must be an array"):
        package_module._sequence(ListSubclass(), "value")
    with pytest.raises(Exact17PackageError, match="must be an integer"):
        package_module._plain_int(IntSubclass(1), "value")
    with pytest.raises(Exact17PackageError, match="must be a non-empty string"):
        package_module._string(StringSubclass("value"), "value")


@pytest.mark.parametrize(
    ("target", "message"),
    [
        ("manifest", "upstream manifest identity"),
        ("validation", "validation report identity"),
    ],
)
def test_rejects_raw_json_identity_drift(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    target: str,
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    path = fixture.manifest_path if target == "manifest" else fixture.validation_path
    path.write_bytes(path.read_bytes() + b" ")

    with pytest.raises(Exact17PackageError, match=message):
        _package(fixture)


def test_rejects_canonical_manifest_field_mutation_by_exact_byte_pin(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    manifest = _read_json(fixture.manifest_path)
    manifest["learned_record_kinds"]["formalized-bank"] += 1
    _write_json(fixture.manifest_path, manifest)

    with pytest.raises(Exact17PackageError, match="upstream manifest identity"):
        _package(fixture)


@pytest.mark.parametrize(
    ("directory", "message"),
    [
        (
            "source-faithful-cap9-direct-cnf-v12-exact-all-cores-44",
            "incomplete non-transitive v12",
        ),
        (
            "source-faithful-cap9-direct-cnf-v15-exact-all-cores-44",
            "PASS v15 export.*non-transitive candidate-v2",
        ),
        (
            "source-faithful-cap9-direct-cnf-v14b-exact-all-cores-44",
            "valid v14b successor is deferred and unsupported",
        ),
    ],
)
def test_rejects_neighboring_candidate_paths_without_misclassification(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    directory: str,
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    alternate = (
        fixture.repo_root
        / "scratch"
        / "rigid221-blockerv-exact17-20260806"
        / directory
        / "o0-p0-1.cnf"
    )

    with pytest.raises(Exact17PackageError, match=message):
        package_exact17(
            cnf_path=alternate,
            upstream_manifest_path=fixture.manifest_path,
            validation_report_path=fixture.validation_path,
            output_dir=fixture.output_dir,
            repo_root=fixture.repo_root,
        )


@pytest.mark.parametrize(
    ("schema", "message"),
    [
        (
            "p97-rigid221-exact17-source-faithful-boolean-cnf-candidate-v2",
            "unsupported non-transitive candidate-v2 shape",
        ),
        ("p97-exact17-unknown", "not the selected v12t candidate-v4 schema"),
    ],
)
def test_rejects_wrong_manifest_schema_even_with_selected_path_and_pass_report(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    schema: str,
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_manifest(
        fixture, monkeypatch, lambda manifest: manifest.__setitem__("schema", schema)
    )

    with pytest.raises(Exact17PackageError, match=message):
        _package(fixture)


def test_rejects_wrong_validation_schema(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_report(
        fixture,
        monkeypatch,
        lambda report: report.__setitem__("schema", "p97-exact17-validation-unknown"),
    )

    with pytest.raises(
        Exact17PackageError, match="validation report has the wrong schema"
    ):
        _package(fixture)


@pytest.mark.parametrize("target", ["manifest", "validation"])
def test_rejects_extra_top_level_schema_field(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, target: str
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    mutate = lambda document: document.__setitem__("unexpected", True)
    if target == "manifest":
        _mutate_manifest(fixture, monkeypatch, mutate)
    else:
        _mutate_report(fixture, monkeypatch, mutate)

    with pytest.raises(Exact17PackageError, match="keys mismatch"):
        _package(fixture)


def test_rejects_raw_cnf_identity_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.cnf_path.write_bytes(
        fixture.cnf_path.read_bytes().replace(b"1 0\n", b"-1 0\n", 1)
    )

    with pytest.raises(Exact17PackageError, match="CNF identity"):
        _package(fixture)


def test_rejects_manifest_cnf_cross_hash_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.cnf_path.write_bytes(
        fixture.cnf_path.read_bytes().replace(b"1 0\n", b"-1 0\n", 1)
    )
    _refresh_identity(fixture, monkeypatch)

    with pytest.raises(Exact17PackageError, match="manifest CNF hash mismatch"):
        _package(fixture)


def test_rejects_validation_manifest_cross_hash_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_report(
        fixture,
        monkeypatch,
        lambda report: report.__setitem__("candidate_manifest_sha256", "0" * 64),
    )

    with pytest.raises(Exact17PackageError, match="candidate manifest hash mismatch"):
        _package(fixture)


def test_rejects_validation_cnf_cross_hash_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_report(
        fixture,
        monkeypatch,
        lambda report: report.__setitem__("candidate_cnf_sha256", "0" * 64),
    )

    with pytest.raises(Exact17PackageError, match="candidate CNF hash mismatch"):
        _package(fixture)


def test_rejects_structural_cnf_cross_hash_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.structural_path.write_bytes(
        fixture.structural_path.read_bytes().replace(b"1 0\n", b"-1 0\n", 1)
    )
    _refresh_identity(fixture, monkeypatch)

    with pytest.raises(Exact17PackageError, match="structural CNF hash mismatch"):
        _package(fixture)


@pytest.mark.parametrize(
    ("cnf", "message"),
    [
        (b"p cnf 6 0\n", "variables and clauses must be nonzero"),
        (
            b"p cnf 6 20\n" + b"1 0\n" * 21,
            "clause count does not match",
        ),
        (
            b"p cnf 5 21\n" + b"6 0\n" + b"1 0\n" * 20,
            "literal is outside",
        ),
        (
            b"p cnf 6 21\n" + b"1 0\n" * 20 + b"1\n",
            "end with exactly one 0",
        ),
    ],
    ids=("zero-clause", "header-count", "literal-range", "unterminated-clause"),
)
def test_rejects_invalid_streamed_dimacs(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    cnf: bytes,
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.cnf_path.write_bytes(cnf)

    with pytest.raises(Exact17PackageError, match=message):
        _package(fixture)


@pytest.mark.parametrize(
    ("cnf", "message"),
    [
        (b"p cnf " + b"9" * 5000 + b" 1\n1 0\n", "decimal digit limit"),
        (b"p cnf 6 1\n" + b"9" * 5000 + b" 0\n", "decimal digit limit"),
        (b"p cnf 06 1\n1 0\n", "canonical decimal integer"),
        (b"p cnf 6 1\n01 0\n", "canonical decimal integer"),
        (b"p cnf 6 1\n+1 0\n", "canonical decimal integer"),
        (b"p cnf 6 1\n-01 0\n", "canonical decimal integer"),
    ],
    ids=(
        "overlong-header",
        "overlong-literal",
        "leading-zero-header",
        "leading-zero-literal",
        "plus-literal",
        "negative-leading-zero-literal",
    ),
)
def test_rejects_bad_dimacs_integer_tokens_inside_package_error_boundary(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    cnf: bytes,
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.cnf_path.write_bytes(cnf)

    with pytest.raises(Exact17PackageError, match=message):
        _package(fixture)


def test_rejects_invalid_structural_dimacs(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.structural_path.write_bytes(b"p cnf 6 1\n7 0\n")

    with pytest.raises(Exact17PackageError, match="literal is outside"):
        _package(fixture)


def test_rejects_structural_dimension_identity_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.structural_path.write_bytes(b"p cnf 7 17\n" + b"1 0\n" * 17)
    _refresh_identity(fixture, monkeypatch)

    with pytest.raises(Exact17PackageError, match="structural CNF identity"):
        _package(fixture)


@pytest.mark.parametrize(
    ("target", "message"),
    [
        ("manifest", "manifest dimensions do not match DIMACS"),
        ("report", "validation report variable count mismatch"),
    ],
)
def test_rejects_dimension_drift_in_json_records(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    target: str,
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    mutate = lambda document: document.__setitem__("variables", 7)
    if target == "manifest":
        _mutate_manifest(fixture, monkeypatch, mutate)
    else:
        _mutate_report(fixture, monkeypatch, mutate)

    with pytest.raises(Exact17PackageError, match=message):
        _package(fixture)


def test_rejects_manifest_scope_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_manifest(
        fixture,
        monkeypatch,
        lambda manifest: manifest.__setitem__("scope", "aggregate coverage"),
    )

    with pytest.raises(Exact17PackageError, match="manifest scope mismatch"):
        _package(fixture)


@pytest.mark.parametrize("target", ["manifest", "report"])
def test_rejects_order_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, target: str
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    mutate = lambda document: document.__setitem__(
        "order", list(reversed(SELECTED_ORDER))
    )
    if target == "manifest":
        _mutate_manifest(fixture, monkeypatch, mutate)
    else:
        _mutate_report(fixture, monkeypatch, mutate)

    with pytest.raises(Exact17PackageError, match="order"):
        _package(fixture)


@pytest.mark.parametrize(
    "field", ["status", "cadical_model_roundtrip", "candidate_exact_regeneration"]
)
def test_rejects_every_nonpass_validation_status(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, field: str
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_report(
        fixture, monkeypatch, lambda report: report.__setitem__(field, "FAIL")
    )

    with pytest.raises(Exact17PackageError, match=rf"{field} must be PASS"):
        _package(fixture)


def test_rejects_manifest_source_hash_shape(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)

    def delete_source_hash(manifest: dict[str, Any]) -> None:
        del manifest["source_hashes"]["source_runner"]

    _mutate_manifest(fixture, monkeypatch, delete_source_hash)
    with pytest.raises(Exact17PackageError, match="source_hashes keys mismatch"):
        _package(fixture)


def test_rejects_validation_source_hash_cross_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)

    def drift_source_hash(report: dict[str, Any]) -> None:
        report["source_hashes"]["source_runner"] = "0" * 64

    _mutate_report(fixture, monkeypatch, drift_source_hash)
    with pytest.raises(
        Exact17PackageError, match="source hash mismatch for source_runner"
    ):
        _package(fixture)


@pytest.mark.parametrize(
    ("mutation", "message"),
    [
        (
            lambda manifest: manifest["clause_blocks"].__delitem__("source_coverage"),
            "clause_blocks keys mismatch",
        ),
        (
            lambda manifest: manifest["clause_blocks"].update(
                {
                    "exact_four": 1,
                    "transitive_two_circle_bisector": 0,
                }
            ),
            "required clause block 'transitive_two_circle_bisector' is empty",
        ),
        (
            lambda manifest: manifest["clause_blocks"].__setitem__(
                "source_coverage", 16
            ),
            "clause blocks do not sum",
        ),
        (
            lambda manifest: manifest.__setitem__("transitive_two_circle", False),
            "transitive_two_circle must be true",
        ),
        (
            lambda manifest: manifest["transitive_two_circle_metadata"].__setitem__(
                "forbidden_cores", 2
            ),
            "metadata count mismatch",
        ),
        (
            lambda manifest: manifest["transitive_two_circle_metadata"].__setitem__(
                "edge_pair_comparisons", 1
            ),
            "edge-pair comparison count mismatch",
        ),
        (
            lambda manifest: manifest["transitive_two_circle_metadata"].__setitem__(
                "distance_label_bits", 7
            ),
            "distance-label bit width mismatch",
        ),
        (
            lambda manifest: manifest["transitive_two_circle_metadata"].__setitem__(
                "distance_label_variables", 1
            ),
            "distance-label variable count mismatch",
        ),
        (
            lambda manifest: manifest["transitive_two_circle_metadata"].__setitem__(
                "comparison_xor_variables", 1
            ),
            "comparison-XOR variable count mismatch",
        ),
    ],
    ids=(
        "missing",
        "required-empty",
        "sum",
        "flag",
        "metadata",
        "edge-pair-metadata",
        "distance-label-bit-width",
        "distance-label-metadata",
        "comparison-xor-metadata",
    ),
)
def test_rejects_clause_block_and_transitive_drift(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    mutation: Callable[[dict[str, Any]], None],
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_manifest(fixture, monkeypatch, mutation)

    with pytest.raises(Exact17PackageError, match=message):
        _package(fixture)


def test_rejects_structural_report_clause_count_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    _mutate_report(
        fixture,
        monkeypatch,
        lambda report: report.__setitem__("structural_clauses", 18),
    )

    with pytest.raises(Exact17PackageError, match="structural clause count mismatch"):
        _package(fixture)


def test_rejects_sum_preserving_structural_clause_block_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    manifest = _read_json(fixture.manifest_path)
    manifest["clause_blocks"]["source_coverage"] -= 1
    manifest["clause_blocks"]["learned_nogoods"] += 1
    _write_json(fixture.manifest_path, manifest)
    report = _read_json(fixture.validation_path)
    report["candidate_manifest_sha256"] = sha256_bytes(
        fixture.manifest_path.read_bytes()
    )
    _write_json(fixture.validation_path, report)
    _refresh_identity(fixture, monkeypatch)

    with pytest.raises(Exact17PackageError, match="clause-block cross-binding"):
        _package(fixture)


@pytest.mark.parametrize(
    ("target", "message"),
    [
        ("cnf", "manifest CNF path mismatch"),
        ("analysis", "normalized repo-relative path"),
        ("structural", "structural CNF path mismatch"),
    ],
)
def test_rejects_internal_path_drift(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    target: str,
    message: str,
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    if target == "cnf":
        _mutate_manifest(
            fixture,
            monkeypatch,
            lambda manifest: manifest.__setitem__("cnf", "../escape.cnf"),
        )
    elif target == "analysis":
        _mutate_manifest(
            fixture,
            monkeypatch,
            lambda manifest: manifest["analyses"][0].__setitem__(
                "path", "../escape.json"
            ),
        )
    else:
        _mutate_report(
            fixture,
            monkeypatch,
            lambda report: report.__setitem__("structural_cnf", "../escape.cnf"),
        )

    with pytest.raises(Exact17PackageError, match=message):
        _package(fixture)


@pytest.mark.parametrize(
    "attribute", ["cnf_path", "structural_path", "manifest_path", "validation_path"]
)
def test_rejects_symlinked_selected_inputs(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, attribute: str
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    path = getattr(fixture, attribute)
    target = path.with_name(f"{path.name}.target")
    path.rename(target)
    path.symlink_to(target.name)

    with pytest.raises(Exact17PackageError, match="cannot safely open"):
        _package(fixture)


def test_rejects_nonregular_selected_input(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.manifest_path.unlink()
    fixture.manifest_path.mkdir()

    with pytest.raises(Exact17PackageError, match="not a regular file"):
        _package(fixture)


def test_rejects_symlinked_repo_root_component(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    alias_parent = tmp_path / "alias-parent"
    alias_parent.symlink_to(fixture.repo_root.parent, target_is_directory=True)
    alias_root = alias_parent / fixture.repo_root.name

    with pytest.raises(Exact17PackageError, match="repo_root path contains a symlink"):
        package_exact17(
            cnf_path=alias_root / SELECTED_CNF_PATH,
            upstream_manifest_path=alias_root / SELECTED_MANIFEST_PATH,
            validation_report_path=alias_root / SELECTED_VALIDATION_PATH,
            output_dir=fixture.output_dir,
            repo_root=alias_root,
        )


@pytest.mark.parametrize("attribute", ["manifest_path", "structural_path"])
def test_rejects_same_inode_mutation_during_capture(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, attribute: str
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    path = getattr(fixture, attribute)
    target_inode = path.stat().st_ino
    original_read = package_module.os.read
    mutated = False

    def mutating_read(descriptor: int, size: int) -> bytes:
        nonlocal mutated
        chunk = original_read(descriptor, size)
        if not mutated and chunk and os.fstat(descriptor).st_ino == target_inode:
            mutated = True
            path.write_bytes(path.read_bytes() + b" ")
        return chunk

    monkeypatch.setattr(package_module, "_READ_CHUNK_BYTES", 7)
    monkeypatch.setattr(package_module.os, "read", mutating_read)
    with pytest.raises(Exact17PackageError, match="changed while being captured"):
        _package(fixture)


@pytest.mark.parametrize("attribute", ["manifest_path", "structural_path"])
def test_rejects_path_inode_swap_during_capture(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, attribute: str
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    path = getattr(fixture, attribute)
    target_inode = path.stat().st_ino
    original_payload = path.read_bytes()
    original_read = package_module.os.read
    swapped = False

    def swapping_read(descriptor: int, size: int) -> bytes:
        nonlocal swapped
        chunk = original_read(descriptor, size)
        if not swapped and chunk and os.fstat(descriptor).st_ino == target_inode:
            swapped = True
            displaced = path.with_name(f"displaced-{path.name}")
            path.rename(displaced)
            path.write_bytes(original_payload)
        return chunk

    monkeypatch.setattr(package_module.os, "read", swapping_read)
    with pytest.raises(Exact17PackageError, match="path binding changed"):
        _package(fixture)


def test_rejects_symlinked_output_directory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    real_output = fixture.repo_root / "scratch" / "real-output"
    real_output.mkdir()
    fixture.output_dir.symlink_to(real_output, target_is_directory=True)

    with pytest.raises(Exact17PackageError, match="symlink or non-directory"):
        _package(fixture)


def test_rejects_different_preexisting_output_artifact(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.output_dir.mkdir()
    (fixture.output_dir / "producer-manifest.json").write_bytes(b"tampered\n")

    with pytest.raises(
        Exact17PackageError, match="refusing different existing artifact"
    ):
        _package(fixture)


def test_preserves_attacker_planted_temporary_looking_output(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.output_dir.mkdir()
    planted = fixture.output_dir / (".phase3-piqd-exact17-package-" + "0" * 32 + ".tmp")
    planted.write_bytes(b"attacker-owned\n")

    with pytest.raises(Exact17PackageError, match="extra entries"):
        _package(fixture)
    assert planted.read_bytes() == b"attacker-owned\n"


def test_rejects_preexisting_hardlinked_output(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.output_dir.mkdir()
    external = tmp_path / "external-discovery.cnf"
    external.write_bytes(fixture.cnf_path.read_bytes())
    os.link(external, fixture.output_dir / "discovery.cnf")

    with pytest.raises(Exact17PackageError, match="not a private regular file"):
        _package(fixture)
    assert external.read_bytes() == fixture.cnf_path.read_bytes()


def test_concurrent_install_replacement_is_preserved_and_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    target = fixture.output_dir / "discovery.cnf"
    displaced = tmp_path / "displaced-discovery.cnf"
    original_write = package_module.os.write
    replaced = False

    def replacing_write(descriptor: int, payload: bytes) -> int:
        nonlocal replaced
        written = original_write(descriptor, payload)
        if not replaced and target.exists():
            replaced = True
            target.rename(displaced)
            target.write_bytes(b"attacker-replacement\n")
        return written

    monkeypatch.setattr(package_module.os, "write", replacing_write)
    with pytest.raises(Exact17PackageError, match="changed before install"):
        _package(fixture)
    assert target.read_bytes() == b"attacker-replacement\n"


def test_final_verification_rejects_byte_identical_inode_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    target = fixture.output_dir / "discovery.cnf"
    displaced = tmp_path / "final-displaced-discovery.cnf"
    original_install = package_module._install_output
    replaced = False

    def replacing_install(
        directory_fd: int, name: str, payload: bytes
    ) -> tuple[int, int, int, int, int, int]:
        nonlocal replaced
        identity = original_install(directory_fd, name, payload)
        if name == "package-result.json" and not replaced:
            replaced = True
            exact_payload = target.read_bytes()
            target.rename(displaced)
            target.write_bytes(exact_payload)
        return identity

    monkeypatch.setattr(package_module, "_install_output", replacing_install)
    with pytest.raises(Exact17PackageError, match="verification failed"):
        _package(fixture)
    assert target.read_bytes() == fixture.cnf_path.read_bytes()


def test_final_verification_rejects_concurrent_extra_entry(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    attacker = fixture.output_dir / "attacker-extra"
    original_install = package_module._install_output

    def injecting_install(
        directory_fd: int, name: str, payload: bytes
    ) -> tuple[int, int, int, int, int, int]:
        identity = original_install(directory_fd, name, payload)
        if name == "package-result.json":
            attacker.write_bytes(b"keep me\n")
        return identity

    monkeypatch.setattr(package_module, "_install_output", injecting_install)
    with pytest.raises(Exact17PackageError, match="directory changed"):
        _package(fixture)
    assert attacker.read_bytes() == b"keep me\n"


def test_rejects_and_preserves_preexisting_cooperative_writer_lock(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    fixture.output_dir.mkdir()
    lock = fixture.output_dir / package_module._OUTPUT_LOCK_NAME
    lock.write_bytes(b"foreign cooperative writer\n")

    with pytest.raises(Exact17PackageError, match="writer lock already exists"):
        _package(fixture)
    assert lock.read_bytes() == b"foreign cooperative writer\n"


def test_rejects_and_preserves_replaced_cooperative_writer_lock(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    lock = fixture.output_dir / package_module._OUTPUT_LOCK_NAME
    displaced = tmp_path / "displaced-owned-writer-lock"
    original_install = package_module._install_output
    replaced = False

    def replacing_install(
        directory_fd: int, name: str, payload: bytes
    ) -> tuple[int, int, int, int, int, int]:
        nonlocal replaced
        identity = original_install(directory_fd, name, payload)
        if name == "package-result.json" and not replaced:
            replaced = True
            lock.rename(displaced)
            lock.write_bytes(b"foreign replacement lock\n")
        return identity

    monkeypatch.setattr(package_module, "_install_output", replacing_install)
    with pytest.raises(Exact17PackageError, match="writer lock was replaced"):
        _package(fixture)
    assert lock.read_bytes() == b"foreign replacement lock\n"
    assert displaced.exists()


def test_post_directory_fsync_replacement_is_preserved_and_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _fixture(tmp_path, monkeypatch)
    target = fixture.output_dir / "discovery.cnf"
    displaced = tmp_path / "post-fsync-displaced-discovery.cnf"
    original_fsync = package_module.os.fsync
    replaced = False

    def replacing_directory_fsync(descriptor: int) -> None:
        nonlocal replaced
        original_fsync(descriptor)
        if not replaced and stat.S_ISDIR(os.fstat(descriptor).st_mode):
            replaced = True
            target.rename(displaced)
            target.write_bytes(b"post-fsync attacker replacement\n")

    monkeypatch.setattr(package_module.os, "fsync", replacing_directory_fsync)
    with pytest.raises(Exact17PackageError, match="verification failed"):
        _package(fixture)
    assert target.read_bytes() == b"post-fsync attacker replacement\n"
    assert displaced.read_bytes() == fixture.cnf_path.read_bytes()
    assert not (fixture.output_dir / package_module._OUTPUT_LOCK_NAME).exists()
