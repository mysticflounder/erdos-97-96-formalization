from __future__ import annotations

import hashlib
import json
from pathlib import Path

import pytest

from census.p97_search.cegar_wave_semantic_profiles import (
    EXACT17_CHILD40,
    CapturedBytes,
    SemanticProfileError,
    parse_profile_bytes,
    validate_semantic_profile,
)
from census.p97_search.phase3_cegar_wave import canonical_json_bytes


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _legacy_pretty(value: object) -> bytes:
    return (
        json.dumps(
            value,
            sort_keys=True,
            indent=2,
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
        + b"\n"
    )


def _fixture(
    tmp_path: Path,
) -> tuple[bytes, dict[str, CapturedBytes], dict[str, object]]:
    parent_data = b"p cnf 3 2\n1 0\n2 0\n"
    child_data = b"p cnf 3 3\n1 0\n2 0\n3 0\n"
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    model_path = tmp_path / "model.json"
    export_path = tmp_path / "export.json"
    parent_manifest_path = tmp_path / "parent-manifest.json"
    ingress_path = tmp_path / "ingress.json"
    daemon_path = tmp_path / "daemon.txt"
    lean_root = tmp_path / "Root.lean"
    lean_export = tmp_path / "Export.lean"
    paths = {
        "parent_cnf": parent,
        "child_cnf": child,
        "model": model_path,
        "export_receipt": export_path,
        "parent_manifest": parent_manifest_path,
        "ingress_manifest": ingress_path,
        "daemon_build_receipt": daemon_path,
        "lean_root": lean_root,
        "lean_export": lean_export,
    }
    parent.write_bytes(parent_data)
    child.write_bytes(child_data)
    parent_manifest_data = b"parent ingress\n"
    daemon_data = b"daemon receipt\n"
    lean_root_data = b"root\n"
    lean_export_data = b"export\n"
    parent_manifest_path.write_bytes(parent_manifest_data)
    daemon_path.write_bytes(daemon_data)
    lean_root.write_bytes(lean_root_data)
    lean_export.write_bytes(lean_export_data)
    parent_sha = _sha(parent_data)
    child_sha = _sha(child_data)
    suffix_sha = _sha(b"3 0\n")
    model = {
        "schema": "p97-exact17-child39-piqd-model/v3",
        "job_id": "child39-job",
        "cnf_sha256": parent_sha,
        "manifest_sha256": "1" * 64,
        "completion_identity_hash": "2" * 64,
        "model": {
            "assignment": [1, 2, 3],
            "backend": "cadical",
            "job_id": "child39-job",
            "num_assigned": 3,
            "result": "SAT",
            "solver_profile": "sat",
        },
        "replay": {"clauses_checked": 2, "satisfies_all": True},
    }
    model_data = _legacy_pretty(model)
    model_path.write_bytes(model_data)
    model_sha = _sha(model_data)
    child_record = {
        "path": str(child),
        "sha256": child_sha,
        "bytes": len(child_data),
        "variables": 3,
        "clauses": 3,
    }
    validation = {
        "schema": "p97-exact17-child40-export-validation/v1",
        "status": "PASS",
        "parent": {"sha256": parent_sha, "clauses": 2},
        "child": {
            "sha256": child_sha,
            "bytes": len(child_data),
            "variables": 3,
            "clauses": 3,
        },
        "model": {
            "sha256": model_sha,
            "job_id": "child39-job",
            "parent_replay_exact": True,
        },
        "ordered_suffix_sha256": suffix_sha,
        "ordered_suffix_exact": True,
    }
    export = {
        "schema": "p97-exact17-child40-immutable-export-receipt/v1",
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "parent": {"path": str(parent), "sha256": parent_sha},
        "model": {"path": str(model_path), "sha256": model_sha},
        "lean": {
            "root": {"path": str(lean_root), "sha256": _sha(lean_root_data)},
            "export": {"path": str(lean_export), "sha256": _sha(lean_export_data)},
        },
        "child": child_record,
        "validation": validation,
        "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
    }
    export_data = _legacy_pretty(export)
    export_path.write_bytes(export_data)
    daemon_sha = _sha(daemon_data)
    ingress = {
        "schema": "p97-exact17-thirty-ninth-model-refinements-piqd-ingress/v1",
        "status": "PASS",
        "dimacs": {
            "path": str(child),
            "sha256": child_sha,
            "bytes": len(child_data),
            "variables": 3,
            "clauses": 3,
            "parent_prefix_clauses": 2,
            "checked_new_clauses": 1,
        },
        "parent_ingress": {
            "path": str(parent_manifest_path),
            "sha256": _sha(parent_manifest_data),
            "parent_dimacs_sha256": parent_sha,
        },
        "export_receipt": {
            "path": str(export_path),
            "sha256": _sha(export_data),
            "schema": export["schema"],
        },
        "lean": export["lean"],
        "model": export["model"],
        "validation": validation,
        "piqd": {
            "ingress": "raw-dimacs/v1",
            "daemon_build_receipt": {"path": str(daemon_path), "sha256": daemon_sha},
            "immutable_root_only": True,
            "stale_job_reuse_allowed": False,
            "python_authored_successor_clause_allowed": False,
        },
    }
    ingress_data = _legacy_pretty(ingress)
    ingress_path.write_bytes(ingress_data)
    payloads = {
        "parent_cnf": parent_data,
        "child_cnf": child_data,
        "model": model_data,
        "export_receipt": export_data,
        "parent_manifest": parent_manifest_data,
        "ingress_manifest": ingress_data,
        "daemon_build_receipt": daemon_data,
        "lean_root": lean_root_data,
        "lean_export": lean_export_data,
    }
    captures = {
        role: CapturedBytes(data, paths[role]) for role, data in payloads.items()
    }
    profile = {
        "schema": "p97-static-cnf-semantic-profile/v1",
        "profile_id": "exact17-child40",
        "validator": EXACT17_CHILD40,
        "classification": {"scope": "finite", "mode": "offline"},
        "control": {
            "domain_kind": "STATIC_CNF",
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
            "cnf_sha256": child_sha,
            "variables": 3,
            "clauses": 3,
        },
        "cleanup": {"cleanup_eligible": False, "lifecycle": "RETAIN"},
        "contract": {
            "parent": {"sha256": parent_sha, "variables": 3, "clauses": 2},
            "child": {"sha256": child_sha, "variables": 3, "clauses": 3},
            "model": {"sha256": model_sha, "job_id": "child39-job"},
            "ordered_suffix_sha256": suffix_sha,
            "schemas": {
                "model": "p97-exact17-child39-piqd-model/v3",
                "receipt": "p97-exact17-child40-immutable-export-receipt/v1",
                "ingress": "p97-exact17-thirty-ninth-model-refinements-piqd-ingress/v1",
            },
            "artifact_roles": sorted(payloads),
        },
    }
    return canonical_json_bytes(profile), captures, profile


def test_child40_profile_validates_captured_bytes_offline(tmp_path: Path) -> None:
    profile_bytes, captures, profile = _fixture(tmp_path)
    result = validate_semantic_profile(
        profile_bytes,
        captures,
        control=profile["control"],  # type: ignore[arg-type]
    )
    assert result["status"] == "PASS"
    assert result["classification"] == {"scope": "finite", "mode": "offline"}
    assert result["cleanup"] == {"cleanup_eligible": False, "lifecycle": "RETAIN"}


def test_profile_requires_canonical_json_and_closed_validator(tmp_path: Path) -> None:
    profile_bytes, _, profile = _fixture(tmp_path)
    assert parse_profile_bytes(profile_bytes).validator == EXACT17_CHILD40
    with pytest.raises(SemanticProfileError, match="canonical JSON"):
        parse_profile_bytes(profile_bytes + b"\n")
    profile["validator"] = "legacy-launcher"
    with pytest.raises(
        SemanticProfileError, match="unknown semantic-profile validator"
    ):
        validate_semantic_profile(profile, {})


def test_profile_control_and_capture_binding_fail_closed(tmp_path: Path) -> None:
    profile_bytes, captures, profile = _fixture(tmp_path)
    crossed = dict(profile["control"])
    crossed["cnf_sha256"] = "0" * 64
    with pytest.raises(SemanticProfileError, match="control crossed"):
        validate_semantic_profile(profile_bytes, captures, control=crossed)
    captures["child_cnf"] = CapturedBytes(
        b"p cnf 3 3\n1 0\n2 0\n-3 0\n", captures["child_cnf"].path
    )
    with pytest.raises(SemanticProfileError, match="CNF digest crossed profile"):
        validate_semantic_profile(profile_bytes, captures)

    class HostileArtifacts(dict[str, CapturedBytes]):
        def __iter__(self):
            raise AssertionError("hostile mapping hook dispatched")

    with pytest.raises(SemanticProfileError, match="exact builtin dict"):
        validate_semantic_profile(profile_bytes, HostileArtifacts(captures))


def test_profile_rejects_receipt_path_crossing(tmp_path: Path) -> None:
    profile_bytes, captures, _ = _fixture(tmp_path)
    receipt = json.loads(captures["export_receipt"].data)
    receipt["parent"]["path"] = str(tmp_path / "attacker.cnf")
    captures["export_receipt"] = CapturedBytes(
        canonical_json_bytes(receipt), captures["export_receipt"].path
    )
    with pytest.raises(SemanticProfileError, match="path crossed"):
        validate_semantic_profile(profile_bytes, captures)
