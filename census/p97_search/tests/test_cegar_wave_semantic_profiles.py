from __future__ import annotations

import hashlib
import json
from pathlib import Path

import pytest

import census.p97_search.cegar_wave_semantic_profiles as semantic_profiles
from census.p97_search.cegar_wave_semantic_profiles import (
    EXACT17_CHILD40,
    EXACT17_CHILD45,
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


def _child45_fixture(
    tmp_path: Path,
    *,
    assignment: list[int] | None = None,
    final_parent_sha256: str | None = None,
    requested_core_limit: object = 1,
    attested_solver_processes: object = 1,
    rejected_indices: list[object] | None = None,
    subsumed_indices: list[object] | None = None,
    receipt_parent_path: Path | None = None,
    child_data: bytes | None = None,
) -> tuple[bytes, dict[str, CapturedBytes], dict[str, object], object]:
    parent_data = b"p cnf 308 2\n1 0\n2 0\n"
    child_data = child_data or (b"p cnf 308 6\n1 0\n2 0\n1 2 0\n3 4 0\n-3 0\n4 0\n")
    paths = {
        "parent_cnf": tmp_path / "parent.cnf",
        "child_cnf": tmp_path / "child.cnf",
        "model": tmp_path / "model.json",
        "final": tmp_path / "final.json",
        "export_receipt": tmp_path / "receipt.json",
        "lean_root": tmp_path / "Root.lean",
        "lean_export": tmp_path / "Export.lean",
    }
    parent_sha = _sha(parent_data)
    child_sha = _sha(child_data)
    manifest_sha = "1" * 64
    identity_sha = "2" * 64
    job_id = "f717c352-2456-412a-ae45-d910f47d3e94"
    model = {
        "schema": "p97-exact17-child44-piqd-model/v3",
        "job_id": job_id,
        "cnf_sha256": parent_sha,
        "manifest_sha256": manifest_sha,
        "completion_identity_hash": identity_sha,
        "model": {
            "assignment": assignment if assignment is not None else list(range(1, 309)),
            "backend": "cadical",
            "job_id": job_id,
            "num_assigned": 308,
            "result": "SAT",
            "solver_profile": "sat",
        },
        "replay": {"clauses_checked": 2, "satisfies_all": True},
    }
    model_data = _legacy_pretty(model)
    model_sha = _sha(model_data)
    binding_parent_sha = final_parent_sha256 or parent_sha
    final = {
        "schema": "p97-exact17-child44-piqd-final/v2",
        "job_id": job_id,
        "result": "SAT",
        "model_sha256": model_sha,
        "next_gate": "mandatory_general_theorem_search",
        "binding": {
            "backend": "cadical",
            "cnf_sha256": binding_parent_sha,
            "identity_hash": identity_sha,
            "manifest_sha256": manifest_sha,
            "march_timeout_s": 900,
            "project": "fixture",
            "requested_core_limit": requested_core_limit,
            "solver_profile": "sat",
            "timeout_s": 3600,
        },
        "model_replay": {"clauses_checked": 2, "satisfies_all": True},
        "completion_status": {
            "id": job_id,
            "status": "completed",
            "result": "SAT",
            "backend": "cadical",
            "cnf_blob_hash": parent_sha,
            "producer_manifest_hash": manifest_sha,
            "producer_manifest_blob_hash": manifest_sha,
            "identity_hash": identity_sha,
            "solver_profile": "sat",
            "requested_core_limit": requested_core_limit,
            "attested_solver_processes": attested_solver_processes,
            "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
        },
        "stored_final": {
            "cnf": {"bytes": len(parent_data), "sha256": parent_sha},
            "producer_manifest": {"bytes": 10, "sha256": manifest_sha},
        },
        "daemon": {},
        "deciding_daemon_sha256": "3" * 64,
        "model_check": {},
        "solver": {},
        "solver_log": {},
    }
    final_data = _legacy_pretty(final)
    final_sha = _sha(final_data)
    lean_root_data = b"root\n"
    lean_export_data = b"export\n"
    suffix_sha = _sha(b"1 2 0\n3 4 0\n-3 0\n4 0\n")
    expected_final = {
        "path": str(paths["final"]),
        "sha256": final_sha,
        "job_id": job_id,
        "result": "SAT",
    }
    receipt = {
        "schema": "p97-exact17-child45-immutable-export-receipt/v1",
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "parent": {
            "path": str(receipt_parent_path or paths["parent_cnf"]),
            "sha256": parent_sha,
            "bytes": len(parent_data),
            "clauses": 2,
        },
        "model": {"path": str(paths["model"]), "sha256": model_sha},
        "final": expected_final,
        "lean": {
            "root": {
                "path": str(paths["lean_root"]),
                "sha256": _sha(lean_root_data),
            },
            "export": {
                "path": str(paths["lean_export"]),
                "sha256": _sha(lean_export_data),
            },
        },
        "child": {
            "path": str(paths["child_cnf"]),
            "sha256": child_sha,
            "bytes": len(child_data),
            "variables": 308,
            "clauses": 6,
        },
        "validation": {
            "schema": "p97-exact17-child45-export-validation/v1",
            "status": "PASS",
            "parent_sha256": parent_sha,
            "child_sha256": child_sha,
            "parent_bytes": len(parent_data),
            "child_bytes": len(child_data),
            "variables": 308,
            "parent_clauses": 2,
            "new_clauses": 4,
            "child_clauses": 6,
            "ordered_suffix_sha256": suffix_sha,
            "parent_subsumed_suffix_indices": (
                subsumed_indices if subsumed_indices is not None else [1]
            ),
            "authenticated_model_rejected_suffix_indices": (
                rejected_indices if rejected_indices is not None else [3]
            ),
            "final": expected_final,
        },
        "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
    }
    receipt_data = _legacy_pretty(receipt)
    payloads = {
        "parent_cnf": parent_data,
        "child_cnf": child_data,
        "model": model_data,
        "final": final_data,
        "export_receipt": receipt_data,
        "lean_root": lean_root_data,
        "lean_export": lean_export_data,
    }
    for role, data in payloads.items():
        paths[role].write_bytes(data)
    captures = {
        role: CapturedBytes(data, paths[role]) for role, data in payloads.items()
    }
    profile: dict[str, object] = {
        "schema": "p97-static-cnf-semantic-profile/v1",
        "profile_id": "exact17-child45",
        "validator": EXACT17_CHILD45,
        "classification": {"scope": "finite", "mode": "offline"},
        "control": {
            "domain_kind": "STATIC_CNF",
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
            "cnf_sha256": child_sha,
            "variables": 308,
            "clauses": 6,
        },
        "cleanup": {"cleanup_eligible": False, "lifecycle": "RETAIN"},
        "contract": {
            "parent": {"sha256": parent_sha, "variables": 308, "clauses": 2},
            "child": {"sha256": child_sha, "variables": 308, "clauses": 6},
            "model": {"sha256": model_sha, "job_id": job_id},
            "ordered_suffix_sha256": suffix_sha,
            "schemas": {
                "model": "p97-exact17-child44-piqd-model/v3",
                "receipt": "p97-exact17-child45-immutable-export-receipt/v1",
                "final": "p97-exact17-child44-piqd-final/v2",
                "validation": "p97-exact17-child45-export-validation/v1",
            },
            "artifact_roles": sorted(payloads),
        },
    }
    authority = semantic_profiles._Child45Authority(
        profile_bytes=canonical_json_bytes(profile),
        artifact_sha256=tuple(
            sorted((role, _sha(data)) for role, data in payloads.items())
        ),
    )
    return canonical_json_bytes(profile), captures, profile, authority


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


def test_child45_profile_validates_closed_seven_artifact_packet(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, profile, authority = _child45_fixture(tmp_path)
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD45_AUTHORITY", authority)
    result = validate_semantic_profile(
        profile_bytes,
        captures,
        control=profile["control"],  # type: ignore[arg-type]
    )
    assert result == {
        "status": "PASS",
        "schema": "p97-static-cnf-semantic-profile/v1",
        "validator": "exact17-child45",
        "classification": {"scope": "finite", "mode": "offline"},
        "cleanup": {"cleanup_eligible": False, "lifecycle": "RETAIN"},
        "cnf_sha256": _sha(captures["child_cnf"].data),
        "variables": 308,
        "clauses": 6,
    }


def test_child45_profile_and_artifact_authority_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, profile, authority = _child45_fixture(tmp_path)
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD45_AUTHORITY", authority)
    crossed_profile = json.loads(canonical_json_bytes(profile))
    crossed_profile["contract"]["ordered_suffix_sha256"] = "0" * 64
    with pytest.raises(SemanticProfileError, match="source-authoritative identity"):
        validate_semantic_profile(crossed_profile, captures)

    captures["final"] = CapturedBytes(
        captures["final"].data + b" ", captures["final"].path
    )
    with pytest.raises(SemanticProfileError, match="retained artifact crossed"):
        validate_semantic_profile(profile_bytes, captures)


@pytest.mark.parametrize(
    ("fixture_kwargs", "error"),
    [
        (
            {"final_parent_sha256": "9" * 64},
            "final parent binding drifted",
        ),
        (
            {
                "assignment": [*range(1, 308), 307],
            },
            "not a total signed assignment",
        ),
        (
            {"rejected_indices": [4]},
            "receipt validation drifted",
        ),
        (
            {"subsumed_indices": [2]},
            "receipt validation drifted",
        ),
        (
            {"requested_core_limit": True},
            "final parent binding drifted",
        ),
        (
            {"attested_solver_processes": True},
            "final completion custody drifted",
        ),
        (
            {"rejected_indices": [True]},
            "authenticated_model_rejected_suffix_indices must be builtin ints",
        ),
        (
            {"subsumed_indices": [True]},
            "parent_subsumed_suffix_indices must be builtin ints",
        ),
        (
            {"child_data": (b"p cnf 308 6\n-1 0\n2 0\n1 2 0\n2 3 0\n-3 0\n4 0\n")},
            "exact Child44 parent prefix",
        ),
    ],
)
def test_child45_semantic_crossings_fail_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    fixture_kwargs: dict[str, object],
    error: str,
) -> None:
    profile_bytes, captures, _profile, authority = _child45_fixture(
        tmp_path,
        **fixture_kwargs,  # type: ignore[arg-type]
    )
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD45_AUTHORITY", authority)
    with pytest.raises(SemanticProfileError, match=error):
        validate_semantic_profile(profile_bytes, captures)


def test_child45_receipt_path_crossing_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, _profile, authority = _child45_fixture(
        tmp_path, receipt_parent_path=tmp_path / "attacker.cnf"
    )
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD45_AUTHORITY", authority)
    with pytest.raises(SemanticProfileError, match="receipt DIMACS identity drifted"):
        validate_semantic_profile(profile_bytes, captures)


@pytest.mark.parametrize(
    "header",
    [b"p cnf +3 1\n1 0\n", b"p cnf 03 1\n1 0\n", b"p cnf \xff 1\n1 0\n"],
)
def test_dimacs_header_must_be_canonical_ascii(header: bytes) -> None:
    with pytest.raises(SemanticProfileError, match="DIMACS header"):
        semantic_profiles._dimacs(header, "fixture CNF")


@pytest.mark.parametrize("clause", [b"+1 0\n", b"01 0\n", b"1  0\n"])
def test_dimacs_clause_must_be_canonical_ascii(clause: bytes) -> None:
    with pytest.raises(SemanticProfileError, match="noncanonical DIMACS clause"):
        semantic_profiles._dimacs(b"p cnf 3 1\n" + clause, "fixture CNF")


def test_child45_retained_artifacts_require_captured_paths(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    profile_bytes, captures, _profile, authority = _child45_fixture(tmp_path)
    monkeypatch.setattr(semantic_profiles, "_EXACT17_CHILD45_AUTHORITY", authority)
    captures["lean_root"] = CapturedBytes(captures["lean_root"].data)
    with pytest.raises(SemanticProfileError, match="require exact captured paths"):
        validate_semantic_profile(profile_bytes, captures)
