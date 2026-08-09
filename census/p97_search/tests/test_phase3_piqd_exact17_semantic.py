from __future__ import annotations

import base64
import hashlib
import json
from collections.abc import Callable
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_exact17_semantic as semantic


def _write(root: Path, label: str, content: bytes) -> str:
    path = root / label
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(content)
    return hashlib.sha256(content).hexdigest()


SyntheticCustodyFactory = Callable[..., tuple[str, str, dict[str, str]]]
_LIVE_V19_MANIFEST = (
    "scratch/rigid221-blockerv-exact17-20260806/"
    "source-faithful-cap9-direct-cnf-v19-piqd-source-entitled-20260809/"
    "o0-p0-1.manifest.json"
)


def _live_v19_manifest() -> dict[str, Any]:
    root = Path(__file__).resolve().parents[3]
    raw = (root / _LIVE_V19_MANIFEST).read_bytes()
    assert hashlib.sha256(raw).hexdigest() == semantic.PINNED_V19_MANIFEST_SHA256
    parsed = json.loads(raw)
    assert isinstance(parsed, dict)
    return parsed


def _write_synthetic_custody(
    root: Path,
    *,
    cnf_bytes: bytes = b"p cnf 74813 3\n1 0\n273 0\n-286 0\n",
) -> tuple[str, str, dict[str, str], dict[str, Any], str]:
    repo = Path(__file__).resolve().parents[3]
    source_labels = {
        name: f"producer/{name}.py" for name in semantic.EXPECTED_SOURCE_KEYS
    }
    source_hashes: dict[str, str] = {}
    for name, label in source_labels.items():
        content = (
            (
                repo / "scratch/rigid221-blockerv-exact17-20260806/"
                "exact17_source_faithful_cegar.py"
            ).read_bytes()
            if name == "source_runner"
            else f"source:{name}\n".encode()
        )
        source_hashes[name] = _write(root, label, content)
    artifact_label = "inputs/bank.json"
    artifact_hash = _write(root, artifact_label, b'{"bank":1}\n')
    analyses = []
    for index in range(44):
        label = f"inputs/run-{index:02d}.analysis.json"
        digest = _write(root, label, f'{{"analysis":{index}}}\n'.encode())
        analyses.append({"path": label, "sha256": digest})
    cnf_label = "out/candidate.cnf"
    cnf_hash = _write(root, cnf_label, cnf_bytes)
    manifest_label = "out/candidate.manifest.json"
    manifest = {
        "schema": semantic.ACCEPTED_MANIFEST_SCHEMA,
        "scope": "one authenticated finite exact17 case",
        "order_index": 0,
        "anonymous_positions": [0, 1],
        "order": list(semantic.EXACT_ORDER),
        "variables": 74813,
        "clauses": 3 if cnf_bytes.count(b" 0\n") == 3 else 1,
        "cnf": cnf_label,
        "cnf_sha256": cnf_hash,
        "clause_blocks": {name: 1 for name in semantic.REQUIRED_CLAUSE_BLOCKS},
        "learned_record_kinds": {},
        "cut_admission": {},
        "learned_replay": "verified",
        "source_hashes": source_hashes,
        "artifacts": [{"path": artifact_label, "sha256": artifact_hash}],
        "analyses": analyses,
        "transitive_two_circle": True,
        "transitive_two_circle_metadata": semantic.EXPECTED_TRANSITIVE_METADATA,
    }
    manifest_bytes = semantic.canonical_json(manifest)
    manifest_hash = _write(root, manifest_label, manifest_bytes)
    sidecar_label = "out/producer-provenance.json"
    sidecar = {
        "schema": semantic.PROVENANCE_SIDECAR_SCHEMA,
        "manifest": {"label": manifest_label, "sha256": manifest_hash},
        "command": ["python3", "producer/encoder.py", "--one-core"],
        "runtime": {
            "executable": "/usr/bin/python3",
            "interpreter_version": "3.synthetic",
            "one_core": True,
        },
        "case": {"order_index": 0, "anonymous_positions": [0, 1]},
        "order": list(semantic.EXACT_ORDER),
        "source_hashes": source_hashes,
    }
    _write(root, sidecar_label, semantic.canonical_json(sidecar))
    return manifest_label, sidecar_label, source_labels, manifest, manifest_hash


@pytest.fixture
def synthetic_custody(
    monkeypatch: pytest.MonkeyPatch,
) -> SyntheticCustodyFactory:
    """Install a private synthetic artifact root without widening production APIs."""

    def make(
        root: Path,
        *,
        cnf_bytes: bytes = b"p cnf 74813 3\n1 0\n273 0\n-286 0\n",
    ) -> tuple[str, str, dict[str, str]]:
        manifest_label, sidecar_label, sources, manifest, manifest_hash = (
            _write_synthetic_custody(root, cnf_bytes=cnf_bytes)
        )
        contract = semantic._LaneArtifactContract(
            manifest_sha256=manifest_hash,
            cnf_sha256=manifest["cnf_sha256"],
            variables=manifest["variables"],
            clauses=manifest["clauses"],
            scope=manifest["scope"],
            clause_blocks_sha256=hashlib.sha256(
                semantic.canonical_json(manifest["clause_blocks"])
            ).hexdigest(),
            learned_record_kinds_sha256=hashlib.sha256(
                semantic.canonical_json(manifest["learned_record_kinds"])
            ).hexdigest(),
            cut_admission_sha256=hashlib.sha256(
                semantic.canonical_json(manifest["cut_admission"])
            ).hexdigest(),
        )
        monkeypatch.setattr(semantic, "_PRODUCTION_ARTIFACT_CONTRACT", contract)
        return manifest_label, sidecar_label, sources

    return make


def _tiny_contract() -> semantic.AllocationContract:
    return semantic.AllocationContract(
        points=(0, 1, 2),
        fifth_candidates=(0,),
        distance_label_bits=2,
    )


def _consistent_assignment(variable_map: dict[str, Any]) -> list[int]:
    count = variable_map["coverage"]["variable_count"]
    truth = {variable: variable % 2 == 1 for variable in range(1, count + 1)}
    for record in variable_map["allocations"]["comparison_xor_helpers"]:
        result = record["formula"]["result"]
        left, right = record["formula"]["inputs"]
        truth[result] = truth[left] != truth[right]
    return [
        variable if truth[variable] else -variable for variable in range(1, count + 1)
    ]


def _production_assignment(variable_map: dict[str, Any]) -> list[int]:
    supports = {
        center: {(center + offset) % 17 for offset in (1, 2, 4, 8)}
        for center in range(17)
    }
    supports.update(
        {
            0: {11, 1, 2, 15},
            3: {0, 1, 2, 4},
            8: {6, 9, 1, 3},
            9: {6, 7, 4, 5},
            10: {8, 9, 13, 14},
            11: {8, 10, 15, 16},
        }
    )
    count = variable_map["coverage"]["variable_count"]
    truth = {variable: False for variable in range(1, count + 1)}
    allocations = variable_map["allocations"]
    for record in allocations["selected_incidence"]:
        truth[record["variable"]] = record["point"] in supports[record["center"]]
    for record in allocations["fifth_choice"]:
        truth[record["variable"]] = record["point"] == 0
    for record in allocations["comparison_xor_helpers"]:
        result = record["formula"]["result"]
        left, right = record["formula"]["inputs"]
        truth[result] = truth[left] != truth[right]
    return [
        variable if truth[variable] else -variable for variable in range(1, count + 1)
    ]


def test_captures_canonical_embedded_source_and_input_bytes(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path)
    bundle = semantic.capture_source_bundle(
        tmp_path,
        manifest,
        sources,
        provenance_sidecar_label=sidecar,
    )

    assert bundle.payload["accepted"] is True
    assert bundle.canonical_bytes == semantic.canonical_json(bundle.payload)
    assert hashlib.sha256(bundle.canonical_bytes).hexdigest() == bundle.sha256
    assert bundle.payload["coverage"] == {
        "declared_source_dependencies": 9,
        "captured_source_dependencies": 9,
        "declared_inputs": 45,
        "captured_inputs": 45,
    }
    for record in [
        bundle.payload["manifest"],
        bundle.payload["provenance_sidecar"],
        *bundle.payload["sources"],
        *bundle.payload["inputs"],
    ]:
        content = base64.b64decode(record["base64"], validate=True)
        assert len(content) == record["byte_count"]
        assert hashlib.sha256(content).hexdigest() == record["sha256"]
    assert semantic.validate_source_bundle(bundle) == bundle.payload

    tampered_payload = json.loads(bundle.canonical_bytes)
    tampered_payload["sources"][0]["base64"] = base64.b64encode(
        b"x" * tampered_payload["sources"][0]["byte_count"]
    ).decode("ascii")
    tampered_bytes = semantic.canonical_json(tampered_payload)
    tampered_bundle = semantic.SourceBundle(
        tampered_payload,
        tampered_bytes,
        hashlib.sha256(tampered_bytes).hexdigest(),
    )
    with pytest.raises(semantic.SemanticCustodyError, match="embedded byte hash"):
        semantic.validate_source_bundle(tampered_bundle)


def test_embedded_base64_rejects_unused_noncanonical_pad_bits(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path)
    bundle = semantic.capture_source_bundle(
        tmp_path,
        manifest,
        sources,
        provenance_sidecar_label=sidecar,
    )
    payload = json.loads(bundle.canonical_bytes)
    record = next(item for item in payload["sources"] if item["base64"].endswith("=="))
    encoded = record["base64"]
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    canonical_index = alphabet.index(encoded[-3])
    noncanonical_index = (canonical_index & 0b110000) | 0b000001
    record["base64"] = encoded[:-3] + alphabet[noncanonical_index] + "=="
    assert base64.b64decode(record["base64"], validate=True) == base64.b64decode(
        encoded,
        validate=True,
    )
    tampered_bytes = semantic.canonical_json(payload)
    tampered_bundle = semantic.SourceBundle(
        payload,
        tampered_bytes,
        hashlib.sha256(tampered_bytes).hexdigest(),
    )
    with pytest.raises(semantic.SemanticCustodyError, match="base64 is not canonical"):
        semantic.validate_source_bundle(tampered_bundle)


@pytest.mark.parametrize(
    "bad_json",
    [
        b'{"a":1,"a":2}',
        b'{"a":NaN}',
        b"[]",
        b'{ "a": 1 }',
    ],
)
def test_strict_json_rejects_duplicates_nonfinite_root_and_format(
    bad_json: bytes,
) -> None:
    with pytest.raises(semantic.SemanticCustodyError):
        semantic.load_strict_json(bad_json)


def test_manifest_type_and_duplicate_input_fail_closed(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest_label, sidecar_label, sources = synthetic_custody(tmp_path)
    manifest_path = tmp_path / manifest_label
    manifest = json.loads(manifest_path.read_bytes())
    manifest["analyses"][0] = manifest["artifacts"][0]
    manifest_path.write_bytes(semantic.canonical_json(manifest))

    with pytest.raises(semantic.SemanticCustodyError, match="duplicate"):
        semantic.capture_source_bundle(
            tmp_path,
            manifest_label,
            sources,
            provenance_sidecar_label=sidecar_label,
        )

    manifest, sidecar, sources = synthetic_custody(tmp_path / "typed")
    typed_path = tmp_path / "typed" / manifest
    typed = json.loads(typed_path.read_bytes())
    typed["order_index"] = False
    typed_path.write_bytes(semantic.canonical_json(typed))
    with pytest.raises(semantic.SemanticCustodyError, match="order_index"):
        semantic.capture_source_bundle(
            tmp_path / "typed",
            manifest,
            sources,
            provenance_sidecar_label=sidecar,
        )


def test_source_hash_tampering_returns_structured_audit(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path)
    (tmp_path / sources["direct_exporter"]).write_bytes(b"changed\n")

    with pytest.raises(semantic.ProvenanceMismatchError) as caught:
        semantic.capture_source_bundle(
            tmp_path,
            manifest,
            sources,
            provenance_sidecar_label=sidecar,
        )
    audit = caught.value.audit
    assert audit.accepted is False
    assert [(item.category, item.name) for item in audit.mismatches] == [
        ("producer_source", "direct_exporter")
    ]
    assert audit.candidate_bundle.payload["accepted"] is False


def test_sidecar_disagreement_and_extra_key_fail_closed(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path)
    sidecar_path = tmp_path / sidecar
    payload = json.loads(sidecar_path.read_bytes())
    payload["case"]["extra"] = 1
    sidecar_path.write_bytes(semantic.canonical_json(payload))

    with pytest.raises(semantic.SemanticCustodyError, match="sidecar case keys"):
        semantic.capture_source_bundle(
            tmp_path,
            manifest,
            sources,
            provenance_sidecar_label=sidecar,
        )


def test_paths_and_symlinks_are_rejected(tmp_path: Path) -> None:
    target = tmp_path / "target.txt"
    target.write_bytes(b"target")
    link = tmp_path / "linked.txt"
    link.symlink_to(target)

    with pytest.raises(semantic.SemanticCustodyError):
        semantic.snapshot_file(tmp_path, "../target.txt", max_bytes=100)
    with pytest.raises(semantic.SemanticCustodyError):
        semantic.snapshot_file(tmp_path, "linked.txt", max_bytes=100)


def test_authenticated_read_detects_toctou(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "source.py"
    path.write_bytes(b"stable")
    real_fstat = semantic.os.fstat
    calls = 0

    class ChangedStat:
        def __init__(self, original: Any) -> None:
            self._original = original
            self.st_size = original.st_size + 1

        def __getattr__(self, name: str) -> Any:
            return getattr(self._original, name)

    def changed_fstat(fd: int) -> Any:
        nonlocal calls
        calls += 1
        result = real_fstat(fd)
        return ChangedStat(result) if calls == 2 else result

    monkeypatch.setattr(semantic.os, "fstat", changed_fstat)
    with pytest.raises(semantic.SemanticCustodyError, match="changed"):
        semantic.snapshot_file(tmp_path, "source.py", max_bytes=100)


def test_complete_live_allocation_contract() -> None:
    variable_map = semantic.load_strict_json(semantic.build_variable_map())
    coverage = variable_map["coverage"]

    assert coverage["first_variable"] == 1
    assert coverage["last_variable"] == 74813
    assert coverage["variable_count"] == 74813
    assert coverage["contiguous_exact"] is True
    assert coverage["regions"] == {
        "selected_incidence": {"first": 1, "last": 272, "count": 272},
        "fifth_choice": {"first": 273, "last": 285, "count": 13},
        "distance_label_bits": {"first": 286, "last": 1373, "count": 1088},
        "comparison_xor_helpers": {
            "first": 1374,
            "last": 74813,
            "count": 73440,
        },
    }


def test_map_formula_and_model_tampering_are_rejected() -> None:
    contract = _tiny_contract()
    variable_map_bytes = semantic.build_variable_map(contract)
    variable_map = semantic.load_strict_json(variable_map_bytes)
    assignment = _consistent_assignment(variable_map)
    decoded = semantic.validate_and_decode(variable_map_bytes, assignment, contract)

    assert decoded["helper_validation"] == {
        "formula": "helper = left XOR right",
        "validated": True,
        "count": 6,
    }
    assert decoded["source_predicate_replay_status"] == {
        "status": "NOT_RUN_BY_STRUCTURAL_DECODER",
        "replayed_predicates": [],
        "next_requirement": (
            "call replay_source_semantics with an accepted semantic package, "
            "exact CNF bytes, production map, and total model"
        ),
    }
    assert all(value is False for value in decoded["claims"].values())

    tampered_map = json.loads(variable_map_bytes)
    formula = tampered_map["allocations"]["comparison_xor_helpers"][0]["formula"]
    formula["inputs"][0] += 1
    with pytest.raises(semantic.SemanticCustodyError, match="allocation"):
        semantic.validate_variable_map(semantic.canonical_json(tampered_map), contract)

    helper = variable_map["allocations"]["comparison_xor_helpers"][0]["variable"]
    tampered_model = assignment.copy()
    tampered_model[helper - 1] *= -1
    with pytest.raises(semantic.SemanticCustodyError, match="XOR"):
        semantic.validate_and_decode(variable_map_bytes, tampered_model, contract)

    with pytest.raises(semantic.SemanticCustodyError, match="total"):
        semantic.validate_and_decode(variable_map_bytes, assignment[:-1], contract)
    duplicate = assignment.copy()
    duplicate[-1] = duplicate[0]
    with pytest.raises(semantic.SemanticCustodyError, match="duplicate"):
        semantic.validate_and_decode(variable_map_bytes, duplicate, contract)


def test_fresh_successor_semantic_package_replay_and_receipt(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path)
    bundle = semantic.capture_source_bundle(
        tmp_path,
        manifest,
        sources,
        provenance_sidecar_label=sidecar,
    )
    cnf_bytes = (tmp_path / "out/candidate.cnf").read_bytes()
    variable_map_bytes = semantic.build_variable_map()
    variable_map = semantic.load_strict_json(variable_map_bytes)
    model = _production_assignment(variable_map)
    package = semantic.build_semantic_package(
        source_bundle=bundle,
        cnf_bytes=cnf_bytes,
        variable_map_bytes=variable_map_bytes,
    )
    parsed_package = semantic.validate_semantic_package(
        package,
        source_bundle=bundle,
        cnf_bytes=cnf_bytes,
        variable_map_bytes=variable_map_bytes,
    )
    assert parsed_package["schema"] == semantic.SEMANTIC_PACKAGE_SCHEMA
    assert parsed_package["cnf"]["variables"] == 74813
    tampered_package = json.loads(package)
    tampered_package["case"]["order_index"] = 1
    with pytest.raises(semantic.SemanticCustodyError, match="recomputed bindings"):
        semantic.validate_semantic_package(
            semantic.canonical_json(tampered_package),
            source_bundle=bundle,
            cnf_bytes=cnf_bytes,
            variable_map_bytes=variable_map_bytes,
        )
    replay = semantic.replay_source_semantics(
        package_bytes=package,
        cnf_bytes=cnf_bytes,
        model=model,
        source_bundle=bundle,
        variable_map_bytes=variable_map_bytes,
    )
    assert replay["semantic_evidence"]["evidence"] == {
        "finite_source_custody": True,
        "total_model": True,
        "all_cnf_clauses_satisfied": True,
        "source_predicates_replayed": True,
        "cnf_clauses_checked": 3,
        "replayed_predicates": list(semantic.REPLAYED_SOURCE_PREDICATES),
    }
    assert all(
        value is False for value in replay["semantic_evidence"]["claims"].values()
    )

    receipt = semantic.issue_semantic_receipt(
        package_bytes=package,
        cnf_bytes=cnf_bytes,
        model=model,
        source_bundle=bundle,
        variable_map_bytes=variable_map_bytes,
    )
    parsed = semantic.validate_semantic_receipt(
        receipt,
        package_bytes=package,
        cnf_bytes=cnf_bytes,
        model=model,
        source_bundle=bundle,
        variable_map_bytes=variable_map_bytes,
    )
    assert parsed["classification"] == "FINITE_SOURCE_SEMANTIC_RECEIPT"
    assert all(value is False for value in parsed["claims"].values())

    tampered = json.loads(receipt)
    tampered["classification"] = "ACCEPTED"
    with pytest.raises(semantic.SemanticCustodyError, match="self-hash"):
        semantic.validate_semantic_receipt(
            semantic.canonical_json(tampered),
            package_bytes=package,
            cnf_bytes=cnf_bytes,
            model=model,
            source_bundle=bundle,
            variable_map_bytes=variable_map_bytes,
        )


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("schema", "candidate-v5", "candidate-v4"),
        ("transitive_two_circle", False, "must be true"),
        ("variables", 74812, "must equal 74813"),
        ("learned_replay", "skipped", "must be verified"),
        ("order_index", 1, "order_index 0"),
    ],
)
def test_fresh_manifest_semantic_contract_tampering_fails_closed(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
    field: str,
    value: Any,
    message: str,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path)
    path = tmp_path / manifest
    payload = json.loads(path.read_bytes())
    payload[field] = value
    path.write_bytes(semantic.canonical_json(payload))
    with pytest.raises(semantic.SemanticCustodyError, match=message):
        semantic.capture_source_bundle(
            tmp_path,
            manifest,
            sources,
            provenance_sidecar_label=sidecar,
        )


def test_source_label_duplication_and_cnf_collision_fail_closed(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path / "duplicate")
    duplicate_labels = {name: next(iter(sources.values())) for name in sources}
    with pytest.raises(semantic.SemanticCustodyError, match="unique"):
        semantic.capture_source_bundle(
            tmp_path / "duplicate",
            manifest,
            duplicate_labels,
            provenance_sidecar_label=sidecar,
        )

    manifest, sidecar, sources = synthetic_custody(tmp_path / "collision")
    path = tmp_path / "collision" / manifest
    payload = json.loads(path.read_bytes())
    payload["cnf"] = sources["source_runner"]
    path.write_bytes(semantic.canonical_json(payload))
    with pytest.raises(semantic.SemanticCustodyError, match="raw bytes"):
        semantic.capture_source_bundle(
            tmp_path / "collision",
            manifest,
            sources,
            provenance_sidecar_label=sidecar,
        )


def test_pinned_runner_and_required_clause_blocks_fail_closed(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    manifest, sidecar, sources = synthetic_custody(tmp_path / "runner")
    path = tmp_path / "runner" / manifest
    payload = json.loads(path.read_bytes())
    payload["source_hashes"]["source_runner"] = "0" * 64
    path.write_bytes(semantic.canonical_json(payload))
    with pytest.raises(semantic.SemanticCustodyError, match="adapter update"):
        semantic.capture_source_bundle(
            tmp_path / "runner",
            manifest,
            sources,
            provenance_sidecar_label=sidecar,
        )

    manifest, sidecar, sources = synthetic_custody(tmp_path / "blocks")
    path = tmp_path / "blocks" / manifest
    payload = json.loads(path.read_bytes())
    payload["clause_blocks"]["source_coverage"] = 0
    path.write_bytes(semantic.canonical_json(payload))
    with pytest.raises(semantic.SemanticCustodyError, match="clause_blocks"):
        semantic.capture_source_bundle(
            tmp_path / "blocks",
            manifest,
            sources,
            provenance_sidecar_label=sidecar,
        )


def test_production_contract_rejects_one_clause_advertised_blocks() -> None:
    manifest = _live_v19_manifest()
    fake_cnf = b"p cnf 74813 1\n1 -1 0\n"
    manifest["clauses"] = 1
    manifest["cnf_sha256"] = hashlib.sha256(fake_cnf).hexdigest()
    tampered_sha = hashlib.sha256(semantic.canonical_json(manifest)).hexdigest()
    with pytest.raises(semantic.SemanticCustodyError, match="clauses must equal"):
        semantic._validate_lane_manifest(
            manifest,
            manifest_sha256=tampered_sha,
        )


def test_production_contract_rejects_rehashed_manifest_and_cnf_substitution() -> None:
    manifest = _live_v19_manifest()
    reserialized_sha = hashlib.sha256(semantic.canonical_json(manifest)).hexdigest()
    assert reserialized_sha != semantic.PINNED_V19_MANIFEST_SHA256
    with pytest.raises(semantic.SemanticCustodyError, match="raw bytes"):
        semantic._validate_lane_manifest(
            manifest,
            manifest_sha256=reserialized_sha,
        )

    manifest["cnf_sha256"] = hashlib.sha256(b"replacement CNF").hexdigest()
    with pytest.raises(semantic.SemanticCustodyError, match="CNF hash"):
        semantic._validate_lane_manifest(
            manifest,
            manifest_sha256=semantic.PINNED_V19_MANIFEST_SHA256,
        )


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("scope", 7),
        ("learned_record_kinds", []),
        ("cut_admission", {"unexpected": {}}),
    ],
)
def test_production_contract_rejects_malformed_pinned_metadata(
    field: str,
    value: Any,
) -> None:
    manifest = _live_v19_manifest()
    manifest[field] = value
    with pytest.raises(semantic.SemanticCustodyError, match=field):
        semantic._validate_lane_manifest(
            manifest,
            manifest_sha256=semantic.PINNED_V19_MANIFEST_SHA256,
        )


def test_cnf_and_source_predicate_vacuity_gates(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    unsatisfied = b"p cnf 74813 1\n-1 0\n"
    manifest, sidecar, sources = synthetic_custody(
        tmp_path / "unsatisfied",
        cnf_bytes=unsatisfied,
    )
    bundle = semantic.capture_source_bundle(
        tmp_path / "unsatisfied",
        manifest,
        sources,
        provenance_sidecar_label=sidecar,
    )
    variable_map_bytes = semantic.build_variable_map()
    variable_map = semantic.load_strict_json(variable_map_bytes)
    model = _production_assignment(variable_map)
    package = semantic.build_semantic_package(
        source_bundle=bundle,
        cnf_bytes=unsatisfied,
        variable_map_bytes=variable_map_bytes,
    )
    with pytest.raises(semantic.SemanticCustodyError, match="not satisfied"):
        semantic.replay_source_semantics(
            package_bytes=package,
            cnf_bytes=unsatisfied,
            model=model,
            source_bundle=bundle,
            variable_map_bytes=variable_map_bytes,
        )

    source_only = b"p cnf 74813 1\n-286 0\n"
    manifest, sidecar, sources = synthetic_custody(
        tmp_path / "source",
        cnf_bytes=source_only,
    )
    bundle = semantic.capture_source_bundle(
        tmp_path / "source",
        manifest,
        sources,
        provenance_sidecar_label=sidecar,
    )
    package = semantic.build_semantic_package(
        source_bundle=bundle,
        cnf_bytes=source_only,
        variable_map_bytes=variable_map_bytes,
    )
    invalid_model = model.copy()
    invalid_model[0] = -1
    with pytest.raises(semantic.SemanticCustodyError, match="size exactly four"):
        semantic.replay_source_semantics(
            package_bytes=package,
            cnf_bytes=source_only,
            model=invalid_model,
            source_bundle=bundle,
            variable_map_bytes=variable_map_bytes,
        )


def test_cnf_header_and_package_binding_tampering_fail_closed(
    tmp_path: Path,
    synthetic_custody: SyntheticCustodyFactory,
) -> None:
    wrong_header = b"p cnf 74812 1\n-286 0\n"
    manifest, sidecar, sources = synthetic_custody(
        tmp_path,
        cnf_bytes=wrong_header,
    )
    bundle = semantic.capture_source_bundle(
        tmp_path,
        manifest,
        sources,
        provenance_sidecar_label=sidecar,
    )
    variable_map_bytes = semantic.build_variable_map()
    with pytest.raises(semantic.SemanticCustodyError, match="variable count"):
        semantic.build_semantic_package(
            source_bundle=bundle,
            cnf_bytes=wrong_header,
            variable_map_bytes=variable_map_bytes,
        )


def test_live_v12t_fails_closed_with_all_three_source_mismatches() -> None:
    root = Path(__file__).resolve().parents[3]
    audit = semantic.audit_live_v12t(root)
    mismatches = {item.name: item for item in audit.mismatches}

    assert audit.accepted is False
    assert audit.status == "PROVENANCE_MISMATCH"
    assert audit.source_count == 8
    assert audit.input_count == 45
    assert audit.missing_bindings == ("canonical producer provenance sidecar",)
    assert set(mismatches) == {
        "base_cnf_exporter",
        "direct_exporter",
        "producer_bank",
    }
    assert mismatches["base_cnf_exporter"].expected_sha256.startswith("8082ce7f")
    assert mismatches["base_cnf_exporter"].actual_sha256.startswith("5a544227")
    assert mismatches["direct_exporter"].expected_sha256.startswith("0dfe147b")
    assert mismatches["direct_exporter"].actual_sha256.startswith("6a480862")
    assert mismatches["producer_bank"].expected_sha256.startswith("df0e5815")
    assert mismatches["producer_bank"].actual_sha256.startswith("e2c63a11")
    assert audit.candidate_bundle.payload["accepted"] is False
    assert all(value is False for value in audit.payload()["claims"].values())
