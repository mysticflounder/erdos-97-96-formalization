from __future__ import annotations

import json
import os
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_exact17_direct6_package as package
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes


@dataclass
class Fixture:
    root: Path
    manifest_path: Path
    manifest: dict[str, Any]
    aggregate: bytes


def _record(root: Path, relative: str) -> dict[str, Any]:
    payload = (root / relative).read_bytes()
    return {
        "path": relative,
        "byte_count": len(payload),
        "sha256": sha256_bytes(payload),
    }


def _write_json(
    root: Path, relative: str, document: dict[str, Any], *, canonical: bool
) -> dict[str, Any]:
    payload = (
        canonical_json_bytes(document)
        if canonical
        else (json.dumps(document, indent=2, sort_keys=True) + "\n").encode()
    )
    path = root / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)
    return _record(root, relative)


def _aggregate(root_cnf: bytes, fragments: list[bytes], clauses: int) -> bytes:
    header, body = root_cnf.split(b"\n", 1)
    fields = header.split(b" ")
    fields[-1] = str(clauses).encode()
    return b" ".join(fields) + b"\n" + body + b"".join(fragments)


def _write_manifest(fixture: Fixture) -> None:
    fixture.manifest_path.write_bytes(canonical_json_bytes(fixture.manifest))


def _rebind(fixture: Fixture, record: dict[str, Any]) -> None:
    updated = _record(fixture.root, record["path"])
    record["byte_count"] = updated["byte_count"]
    record["sha256"] = updated["sha256"]


def _make_fixture(tmp_path: Path, *, unsat: bool = False) -> Fixture:
    root = tmp_path / "bundle"
    for relative in ("src", "root", "fragments", "receipts", "observations"):
        (root / relative).mkdir(parents=True, exist_ok=True)

    sources = {
        "src/map_builder.py": b"def variable_map():\n    return []\n",
        "src/producer.py": b"def produce():\n    return None\n",
        "src/replay.py": b"def replay():\n    return None\n",
    }
    for relative, payload in sources.items():
        (root / relative).write_bytes(payload)

    root_cnf = b"p cnf 3 1\n1 0\n"
    fragments = ([b"-1 0\n"] if unsat else [b"1 0\n"]) + [b"2 0\n"] * 7
    (root / "root/root.cnf").write_bytes(root_cnf)
    root_manifest = _write_json(
        root,
        "root/root-manifest.json",
        {
            "variables": 3,
            "clauses": 1,
            "order": list(package.EXACT17_ORDER),
            "historical": True,
        },
        canonical=False,
    )
    root_validation = _write_json(
        root,
        "root/root-validation.json",
        {"status": "PASS", "variables": 3, "clauses": 1},
        canonical=False,
    )
    order_sha = sha256_bytes(canonical_json_bytes(list(package.EXACT17_ORDER)))
    map_record = _write_json(
        root,
        "variable-map.json",
        {
            "schema": package.VARIABLE_MAP_SCHEMA,
            "order": list(package.EXACT17_ORDER),
            "entries": [
                ["selected", 0],
                ["selected", 1],
                ["distance_label_xor", 0, 1],
            ],
        },
        canonical=True,
    )

    refinements: list[dict[str, Any]] = []
    prior_fragments: list[bytes] = []
    parent = root_cnf
    parent_count = 1
    for ordinal, fragment in enumerate(fragments):
        fragment_path = f"fragments/{ordinal}.cnfpart"
        (root / fragment_path).write_bytes(fragment)
        fragment_record = _record(root, fragment_path)
        session_id = f"session-{ordinal}"
        if ordinal < 7:
            analysis_path = f"observations/{ordinal}-analysis.json"
            model_path = f"observations/{ordinal}-model.log"
            _write_json(
                root,
                analysis_path,
                {"status": "PASS", "round": ordinal},
                canonical=False,
            )
            (root / model_path).write_bytes(f"model {ordinal}\n".encode())
            analysis_sha = _record(root, analysis_path)["sha256"]
            model_sha = _record(root, model_path)["sha256"]
            receipt_schema = (
                "p97-piqd-two-kalmanson-label-cut-admission-v1"
                if ordinal < 2
                else "p97-piqd-two-kalmanson-label-cut-admission-v2"
            )
            provenance = {
                "analysis": analysis_path,
                "analysis_sha256": analysis_sha,
                "model_log": model_path,
                "model_log_sha256": model_sha,
                "session_id": session_id,
            }
            receipt = {
                "schema": receipt_schema,
                "session_id": session_id,
                "order": list(package.EXACT17_ORDER),
                "variables": 3,
                "appended_clause_count": 1,
                "appended_clause_sha256": fragment_record["sha256"],
                "analysis": analysis_path,
                "analysis_sha256": analysis_sha,
                "model_log": model_path,
                "model_log_sha256": model_sha,
                "learned_records": 10_000 + ordinal,
            }
        else:
            receipt_schema = "p97-piqd-two-kalmanson-pair-closure-admission-v3"
            selected_sha = sha256_bytes(b"fixture-selected-pairs")
            provenance = {
                "batch_count": 2,
                "selected_pair_count": 3,
                "selected_pair_sha256": selected_sha,
                "session_id": session_id,
            }
            receipt = {
                "schema": receipt_schema,
                "session_id": session_id,
                "order": list(package.EXACT17_ORDER),
                "variables": 3,
                "appended_clause_count": 1,
                "appended_clause_sha256": fragment_record["sha256"],
                "batches": [{"ordinal": 0}, {"ordinal": 1}],
                "selected_pair_count": 3,
                "selected_pair_sha256": selected_sha,
                "learned_records": 99_999,
            }
        receipt_record = _write_json(
            root,
            f"receipts/{ordinal}.json",
            receipt,
            canonical=False,
        )
        prior_fragments.append(fragment)
        result_count = parent_count + 1
        result = _aggregate(root_cnf, prior_fragments, result_count)
        refinements.append(
            {
                "ordinal": ordinal,
                "kind": "cut_round" if ordinal < 7 else "pair_closure",
                "receipt": receipt_record,
                "receipt_schema": receipt_schema,
                "clause_fragment": fragment_record,
                "clause_count": 1,
                "parent_formula_sha256": sha256_bytes(parent),
                "parent_clause_count": parent_count,
                "result_formula_sha256": sha256_bytes(result),
                "result_clause_count": result_count,
                "provenance": provenance,
            }
        )
        parent = result
        parent_count = result_count

    producer_sources = [_record(root, path) for path in sorted(sources)]
    replay_sources = [_record(root, "src/replay.py")]
    manifest: dict[str, Any] = {
        "schema": package.LANE_SCHEMA,
        "lane": {
            "label": package.LANE_LABEL,
            "scope": package.LANE_SCOPE,
            "order_index": 0,
            "anonymous_positions": list(package.EXACT17_ANONYMOUS_POSITIONS),
            "order": list(package.EXACT17_ORDER),
            "terminal_semantics": package.TERMINAL_SEMANTICS,
        },
        "producer": {
            "git_commit": "a" * 40,
            "argv": ["uv", "run", "python", "src/producer.py"],
            "executable": "/fixture/.venv/bin/python3",
            "version": "3.14.6",
            "source_files": producer_sources,
        },
        "root": {
            "cnf": _record(root, "root/root.cnf"),
            "manifest": root_manifest,
            "num_clauses": 1,
            "num_vars": 3,
            "validation": root_validation,
        },
        "variable_map": {
            "artifact": map_record,
            "entry_count": 3,
            "order_sha256": order_sha,
            "reconstructor": {
                "function": "variable_map",
                "source": "src/map_builder.py",
            },
            "schema": package.VARIABLE_MAP_SCHEMA,
        },
        "refinements": refinements,
        "aggregate": {
            "algorithm": package.AGGREGATE_ALGORITHM,
            "byte_count": len(parent),
            "num_clauses": parent_count,
            "num_vars": 3,
            "sha256": sha256_bytes(parent),
            "upload_cap_bytes": package.MAX_AGGREGATE_BYTES,
            "version": package.AGGREGATE_VERSION,
            "within_upload_cap": True,
        },
        "replay": {
            "expected_exact_global_lra_result": package.EXPECTED_EXACT_LRA_RESULT,
            "expected_structural_result": package.EXPECTED_STRUCTURAL_RESULT,
            "source_model_validator": {
                "argv_template": [
                    "uv",
                    "run",
                    "python",
                    "src/replay.py",
                    "--cnf",
                    "{stage_cnf}",
                ],
                "path": "src/replay.py",
                "source_files": replay_sources,
            },
        },
        "resource": {
            "max_cores": 1,
            "max_solver_processes": 1,
            "parallel": False,
            "wall_time_envelope_seconds": [1, 900],
        },
        "claims": {
            "normalized_case_only": True,
            "source_entitlement": False,
            "aggregate_case_coverage": False,
            "universal_lift": False,
            "theorem_closure": False,
            "lean_checked": False,
            "daemon_signed_attestation": False,
        },
    }
    manifest_path = root / "manifest.json"
    fixture = Fixture(root, manifest_path, manifest, parent)
    _write_manifest(fixture)
    return fixture


def _manifest_digest(fixture: Fixture) -> str:
    return sha256_bytes(fixture.manifest_path.read_bytes())


def _build(fixture: Fixture, name: str = "package") -> tuple[Any, Any]:
    return package.build_direct6_root_refinement_package(
        fixture.manifest_path,
        fixture.root.parent / name,
        expected_manifest_sha256=_manifest_digest(fixture),
    )


def _mutate_manifest(
    fixture: Fixture, mutation: Callable[[dict[str, Any]], None]
) -> None:
    mutation(fixture.manifest)
    _write_manifest(fixture)


def _receipt(fixture: Fixture, ordinal: int) -> dict[str, Any]:
    record = fixture.manifest["refinements"][ordinal]["receipt"]
    return json.loads((fixture.root / record["path"]).read_bytes())


def _write_receipt(fixture: Fixture, ordinal: int, value: dict[str, Any]) -> None:
    record = fixture.manifest["refinements"][ordinal]["receipt"]
    (fixture.root / record["path"]).write_bytes(
        (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()
    )
    _rebind(fixture, record)


def _refresh_chain(fixture: Fixture) -> None:
    root_cnf = (fixture.root / fixture.manifest["root"]["cnf"]["path"]).read_bytes()
    parent = root_cnf
    parent_count = fixture.manifest["root"]["num_clauses"]
    fragments: list[bytes] = []
    for ordinal, refinement in enumerate(fixture.manifest["refinements"]):
        fragment = (fixture.root / refinement["clause_fragment"]["path"]).read_bytes()
        fragments.append(fragment)
        refinement["parent_formula_sha256"] = sha256_bytes(parent)
        refinement["parent_clause_count"] = parent_count
        parent_count += refinement["clause_count"]
        parent = _aggregate(root_cnf, fragments, parent_count)
        refinement["result_formula_sha256"] = sha256_bytes(parent)
        refinement["result_clause_count"] = parent_count
        receipt = _receipt(fixture, ordinal)
        receipt["appended_clause_count"] = refinement["clause_count"]
        receipt["appended_clause_sha256"] = sha256_bytes(fragment)
        _write_receipt(fixture, ordinal, receipt)
    aggregate = fixture.manifest["aggregate"]
    aggregate.update(
        {
            "sha256": sha256_bytes(parent),
            "byte_count": len(parent),
            "num_clauses": parent_count,
        }
    )
    fixture.aggregate = parent
    _write_manifest(fixture)


def test_known_tiny_sat_package_is_deterministic_and_immutable(tmp_path: Path) -> None:
    fixture = _make_fixture(tmp_path)
    packet_a, result_a = _build(fixture, "out-a")
    packet_b, result_b = _build(fixture, "out-b")

    assert packet_a.cnf == fixture.aggregate == packet_b.cnf
    assert result_a.canonical_bytes == result_b.canonical_bytes
    assert result_a.as_dict()["expected_outcome"] == "PIQD_DISCOVERY_ONLY"
    assert packet_a.packet_id == package.WAVE_ID
    assert packet_a.package_hashes["discovery.cnf"] == sha256_bytes(fixture.aggregate)
    with pytest.raises(TypeError):
        result_a.artifact_hashes["new"] = "0" * 64  # type: ignore[index]


def test_known_tiny_unsat_is_classified_discovery_only(tmp_path: Path) -> None:
    fixture = _make_fixture(tmp_path, unsat=True)
    packet, result = _build(fixture)

    assert b"1 0\n-1 0\n" in packet.cnf
    payload = result.as_dict()
    assert payload["expected_outcome"] == "PIQD_DISCOVERY_ONLY"
    assert payload["claims"]["theorem_closure"] is False
    assert packet.wave_manifest["promotion"]["consumer_theorem"] is None


def test_learned_records_are_observational_not_clauses(tmp_path: Path) -> None:
    fixture = _make_fixture(tmp_path)
    for ordinal in range(8):
        receipt = _receipt(fixture, ordinal)
        receipt["learned_records"] = 1_000_000 + ordinal
        _write_receipt(fixture, ordinal, receipt)
    _write_manifest(fixture)
    packet, _result = _build(fixture)
    assert packet.cnf == fixture.aggregate


@pytest.mark.parametrize("attack", ["newline", "duplicate", "nan", "float"])
def test_manifest_rejects_noncanonical_or_non_strict_json(
    tmp_path: Path, attack: str
) -> None:
    fixture = _make_fixture(tmp_path)
    raw = fixture.manifest_path.read_bytes()
    if attack == "newline":
        raw += b"\n"
    elif attack == "duplicate":
        raw = raw.replace(b'{"aggregate":', b'{"schema":"duplicate","aggregate":', 1)
    elif attack == "nan":
        raw = raw.replace(b'"order_index":0', b'"order_index":NaN', 1)
    else:
        raw = raw.replace(b'"order_index":0', b'"order_index":0.0', 1)
    fixture.manifest_path.write_bytes(raw)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


def test_manifest_requires_independent_exact_digest(tmp_path: Path) -> None:
    fixture = _make_fixture(tmp_path)
    with pytest.raises(package.Direct6PackageError, match="pinned digest"):
        package.build_direct6_root_refinement_package(
            fixture.manifest_path,
            tmp_path / "out",
            expected_manifest_sha256="0" * 64,
        )


@pytest.mark.parametrize(
    "mutation",
    [
        lambda value: value.pop("variable_map"),
        lambda value: value.update({"unexpected": None}),
        lambda value: value["producer"].update({"runtime": {}}),
        lambda value: value["refinements"][0].pop("receipt"),
        lambda value: value["refinements"][0].pop("provenance"),
        lambda value: value["root"].pop("validation"),
        lambda value: value["claims"].update({"theorem_closure": True}),
        lambda value: value["resource"].update({"max_cores": 2}),
    ],
)
def test_key_tampering_and_nonconservative_claims_fail_closed(
    tmp_path: Path, mutation: Callable[[dict[str, Any]], None]
) -> None:
    fixture = _make_fixture(tmp_path)
    _mutate_manifest(fixture, mutation)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


def test_source_drift_inventory_order_and_replay_source_fail(tmp_path: Path) -> None:
    fixture = _make_fixture(tmp_path)
    (fixture.root / "src/producer.py").write_bytes(b"drift\n")
    with pytest.raises(package.Direct6PackageError, match="byte identity"):
        _build(fixture, "drift")

    fixture = _make_fixture(tmp_path / "order")
    fixture.manifest["producer"]["source_files"].reverse()
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError, match="canonical path order"):
        _build(fixture, "order")

    fixture = _make_fixture(tmp_path / "replay")
    fixture.manifest["replay"]["source_model_validator"]["path"] = "src/producer.py"
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError, match="sole replay source"):
        _build(fixture, "replay")


@pytest.mark.parametrize("attack", ["reorder", "duplicate", "gap", "kind"])
def test_refinement_reorder_duplicate_gap_and_kind_attacks(
    tmp_path: Path, attack: str
) -> None:
    fixture = _make_fixture(tmp_path)
    refs = fixture.manifest["refinements"]
    if attack == "reorder":
        refs[0], refs[1] = refs[1], refs[0]
    elif attack == "duplicate":
        refs[1] = dict(refs[0])
    elif attack == "gap":
        refs[3]["ordinal"] = 4
    else:
        refs[4]["kind"] = "pair_closure"
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


@pytest.mark.parametrize(
    "payload",
    [
        b"p cnf 3 1\n",
        b"c comment\n",
        b"1 0",
        b"4 0\n",
        b"1 0 0\n",
        b"1\t0\n",
        b"\n",
        b"01 0\n",
        b"1  0\n",
    ],
)
def test_fragment_format_header_dimension_and_termination_attacks(
    tmp_path: Path, payload: bytes
) -> None:
    fixture = _make_fixture(tmp_path)
    refinement = fixture.manifest["refinements"][0]
    target = fixture.root / refinement["clause_fragment"]["path"]
    target.write_bytes(payload)
    _rebind(fixture, refinement["clause_fragment"])
    _refresh_chain(fixture)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


def test_fragment_hash_and_stale_fifteen_twenty_four_mismatch_fail(
    tmp_path: Path,
) -> None:
    fixture = _make_fixture(tmp_path)
    target = (
        fixture.root / fixture.manifest["refinements"][0]["clause_fragment"]["path"]
    )
    target.write_bytes(b"3 0\n")
    with pytest.raises(package.Direct6PackageError, match="byte identity"):
        _build(fixture, "hash")

    fixture = _make_fixture(tmp_path / "stale")
    refinement = fixture.manifest["refinements"][0]
    refinement["clause_count"] = 15
    receipt = _receipt(fixture, 0)
    receipt["appended_clause_count"] = 24
    _write_receipt(fixture, 0, receipt)
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError, match="clause-count"):
        _build(fixture, "stale")


@pytest.mark.parametrize(
    ("key", "value"),
    [
        ("sha256", "0" * 64),
        ("byte_count", 1),
        ("num_vars", 4),
        ("num_clauses", 24),
        ("algorithm", "other/v1"),
        ("version", 2),
        ("upload_cap_bytes", 1),
        ("within_upload_cap", False),
    ],
)
def test_independent_aggregate_identity_and_algorithm_are_exact(
    tmp_path: Path, key: str, value: Any
) -> None:
    fixture = _make_fixture(tmp_path)
    fixture.manifest["aggregate"][key] = value
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


@pytest.mark.parametrize(
    "key",
    [
        "parent_formula_sha256",
        "parent_clause_count",
        "result_formula_sha256",
        "result_clause_count",
    ],
)
def test_formula_chain_hash_and_count_tampering_is_rejected(
    tmp_path: Path, key: str
) -> None:
    fixture = _make_fixture(tmp_path)
    fixture.manifest["refinements"][3][key] = (
        "0" * 64 if key.endswith("sha256") else 999
    )
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError, match="formula chain"):
        _build(fixture)


def test_root_header_dimensions_manifest_validation_and_hash_are_bound(
    tmp_path: Path,
) -> None:
    fixture = _make_fixture(tmp_path)
    fixture.manifest["root"]["num_vars"] = 4
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture, "dimensions")

    fixture = _make_fixture(tmp_path / "validation")
    validation = fixture.manifest["root"]["validation"]
    document = json.loads((fixture.root / validation["path"]).read_bytes())
    document["status"] = "FAIL"
    (fixture.root / validation["path"]).write_bytes(json.dumps(document).encode())
    _rebind(fixture, validation)
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError, match="PASS"):
        _build(fixture, "validation")

    fixture = _make_fixture(tmp_path / "hash")
    (fixture.root / "root/root.cnf").write_bytes(b"p cnf 3 1\n2 0\n")
    with pytest.raises(package.Direct6PackageError, match="byte identity"):
        _build(fixture, "hash")


@pytest.mark.parametrize(
    "attack", ["missing", "duplicate", "order", "schema", "pretty"]
)
def test_full_canonical_variable_map_is_acceptance_critical(
    tmp_path: Path, attack: str
) -> None:
    fixture = _make_fixture(tmp_path)
    record = fixture.manifest["variable_map"]["artifact"]
    path = fixture.root / record["path"]
    document = json.loads(path.read_bytes())
    if attack == "missing":
        document["entries"].pop()
    elif attack == "duplicate":
        document["entries"][2] = document["entries"][1]
    elif attack == "order":
        document["order"] = list(reversed(document["order"]))
    elif attack == "schema":
        document["schema"] = "other/v1"
    if attack == "pretty":
        path.write_bytes((json.dumps(document, indent=2) + "\n").encode())
    else:
        path.write_bytes(canonical_json_bytes(document))
    _rebind(fixture, record)
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


def test_reconstructor_receipts_and_provenance_files_must_exist(tmp_path: Path) -> None:
    selectors = [
        lambda value: value["variable_map"]["reconstructor"]["source"],
        lambda value: value["refinements"][2]["receipt"]["path"],
        lambda value: value["refinements"][1]["provenance"]["analysis"],
        lambda value: value["refinements"][4]["provenance"]["model_log"],
    ]
    for index, selector in enumerate(selectors):
        fixture = _make_fixture(tmp_path / str(index))
        (fixture.root / selector(fixture.manifest)).unlink()
        with pytest.raises(package.Direct6PackageError):
            _build(fixture, f"missing-{index}")


@pytest.mark.parametrize("attack", ["session", "analysis", "fragment", "pair"])
def test_receipt_and_provenance_bindings_are_exact(tmp_path: Path, attack: str) -> None:
    fixture = _make_fixture(tmp_path)
    ordinal = 7 if attack == "pair" else 0
    receipt = _receipt(fixture, ordinal)
    if attack == "session":
        receipt["session_id"] = "different"
    elif attack == "analysis":
        receipt["analysis_sha256"] = "0" * 64
    elif attack == "fragment":
        receipt["appended_clause_sha256"] = "0" * 64
    else:
        receipt["selected_pair_count"] = 4
    _write_receipt(fixture, ordinal, receipt)
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


def test_aggregate_cap_is_enforced_during_reconstruction(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _make_fixture(tmp_path)
    cap = len((fixture.root / "root/root.cnf").read_bytes()) + 1
    monkeypatch.setattr(package, "MAX_AGGREGATE_BYTES", cap)
    fixture.manifest["aggregate"]["upload_cap_bytes"] = cap
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError, match="exceeds 256 MiB"):
        _build(fixture)


@pytest.mark.parametrize(
    "mutation",
    [
        lambda value: value["resource"].update({"max_cores": True}),
        lambda value: value["aggregate"].update({"num_clauses": 9.0}),
        lambda value: value["resource"].update({"parallel": 0}),
        lambda value: value["resource"].update(
            {"wall_time_envelope_seconds": [1.0, 900]}
        ),
    ],
)
def test_bool_float_and_wrong_builtin_types_are_rejected(
    tmp_path: Path, mutation: Callable[[dict[str, Any]], None]
) -> None:
    fixture = _make_fixture(tmp_path)
    _mutate_manifest(fixture, mutation)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture)


def test_builtin_subclasses_are_rejected_at_internal_boundaries() -> None:
    class IntegerSubclass(int):
        pass

    class StringSubclass(str):
        pass

    class DictSubclass(dict[str, Any]):
        pass

    with pytest.raises(package.Direct6PackageError):
        package._integer(IntegerSubclass(1), "test")
    with pytest.raises(package.Direct6PackageError):
        package._string(StringSubclass("x"), "test")
    with pytest.raises(package.Direct6PackageError):
        package._object(DictSubclass(), "test")
    with pytest.raises(package.Direct6PackageError):
        package._require_builtin_json({"x": IntegerSubclass(1)}, "test")


def test_path_traversal_and_input_symlink_are_rejected(tmp_path: Path) -> None:
    fixture = _make_fixture(tmp_path)
    fixture.manifest["root"]["cnf"]["path"] = "../outside.cnf"
    _write_manifest(fixture)
    with pytest.raises(package.Direct6PackageError, match="relative POSIX"):
        _build(fixture, "traversal")

    fixture = _make_fixture(tmp_path / "symlink")
    record = fixture.manifest["refinements"][0]["clause_fragment"]
    source = fixture.root / record["path"]
    real = fixture.root / "real-fragment"
    source.rename(real)
    source.symlink_to(real)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture, "symlink")


def test_output_symlink_and_different_collision_are_rejected(tmp_path: Path) -> None:
    fixture = _make_fixture(tmp_path)
    target = tmp_path / "target"
    target.mkdir()
    output_link = tmp_path / "output-link"
    output_link.symlink_to(target, target_is_directory=True)
    with pytest.raises(package.Direct6PackageError, match="symlink"):
        package.build_direct6_root_refinement_package(
            fixture.manifest_path,
            output_link,
            expected_manifest_sha256=_manifest_digest(fixture),
        )

    collision = tmp_path / "collision"
    collision.mkdir()
    (collision / "discovery.cnf").write_bytes(b"different")
    with pytest.raises(
        package.Direct6PackageError, match="different existing artifact"
    ):
        package.build_direct6_root_refinement_package(
            fixture.manifest_path,
            collision,
            expected_manifest_sha256=_manifest_digest(fixture),
        )


def test_input_toc_tou_is_detected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _make_fixture(tmp_path)
    target = fixture.root / "src/producer.py"
    target_inode = target.stat().st_ino
    original_read = package.os.read
    changed = False

    def adversarial_read(descriptor: int, amount: int) -> bytes:
        nonlocal changed
        if not changed and os.fstat(descriptor).st_ino == target_inode:
            changed = True
            target.write_bytes(target.read_bytes() + b"# drift\n")
        return original_read(descriptor, amount)

    monkeypatch.setattr(package.os, "read", adversarial_read)
    with pytest.raises(
        package.Direct6PackageError, match="changed during authenticated read"
    ):
        _build(fixture)
    assert changed


def test_output_toc_tou_is_detected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _make_fixture(tmp_path)
    output = tmp_path / "output"
    original_install = package._install_output
    changed = False

    def adversarial_install(directory_fd: int, name: str, payload: bytes) -> None:
        nonlocal changed
        original_install(directory_fd, name, payload)
        if name == "discovery.cnf":
            changed = True
            (output / name).write_bytes(payload + b"c drift\n")

    monkeypatch.setattr(package, "_install_output", adversarial_install)
    with pytest.raises(package.Direct6PackageError):
        _build(fixture, "output")
    assert changed


def test_output_directory_replacement_is_detected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _make_fixture(tmp_path)
    output = tmp_path / "output"
    moved = tmp_path / "moved-output"
    original_install = package._install_output
    changed = False

    def adversarial_install(directory_fd: int, name: str, payload: bytes) -> None:
        nonlocal changed
        original_install(directory_fd, name, payload)
        if not changed:
            changed = True
            output.rename(moved)
            output.mkdir()

    monkeypatch.setattr(package, "_install_output", adversarial_install)
    with pytest.raises(
        package.Direct6PackageError, match="output directory was replaced"
    ):
        _build(fixture, "output")
    assert changed
