from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path
from types import SimpleNamespace

import pytest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "analyze_exact17_thirty_first_root_model.py"
REAL_MANIFEST = (
    ROOT
    / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirtieth-model-refinements.json"
)
HARDENED_NO_TERMINAL = (
    ROOT
    / "scratch/exact17-lean-to-sat/audit-thirty-first-model-analysis-hardened-no-terminal.json"
)


def module():
    spec = importlib.util.spec_from_file_location("exact17_child31_analyzer", SCRIPT)
    assert spec and spec.loader
    loaded = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(loaded)
    return loaded


def model_payload() -> dict[str, object]:
    return {
        "assignment": list(range(1, 309)),
        "job_id": "53044c24-da6c-4fdd-9f50-f4f539891383",
        "num_assigned": 308,
        "result": "SAT",
    }


def test_duplicate_model_key_is_rejected(tmp_path: Path) -> None:
    analyzer = module()
    path = tmp_path / "model.json"
    raw = b'{"assignment":[],"assignment":[],"job_id":"x","num_assigned":0,"result":"SAT"}'
    path.write_bytes(raw)
    with pytest.raises(ValueError, match="duplicate JSON key"):
        analyzer.load_assignment(
            path,
            expected_sha256=hashlib.sha256(raw).hexdigest(),
            expected_job_id=None,
        )


def test_model_schema_requires_total_signed_assignment(tmp_path: Path) -> None:
    analyzer = module()
    path = tmp_path / "model.json"
    payload = model_payload()
    payload["assignment"] = [1] * 308
    raw = json.dumps(payload, separators=(",", ":")).encode()
    path.write_bytes(raw)
    with pytest.raises(ValueError, match="not unique"):
        analyzer.load_assignment(
            path,
            expected_sha256=hashlib.sha256(raw).hexdigest(),
            expected_job_id=payload["job_id"],
        )


def test_atomic_output_replaces_only_after_durable_write(tmp_path: Path) -> None:
    analyzer = module()
    destination = tmp_path / "report.json"
    analyzer.atomic_write(destination, b"first\n")
    analyzer.atomic_write(destination, b"second\n")
    assert destination.read_bytes() == b"second\n"
    assert not list(tmp_path.glob(".*.tmp.*"))


def test_real_pre_solve_manifest_does_not_bind_child31_model() -> None:
    """The historical validation model is the parent producer model.

    This is the actual child31 ingress shape: its nested ``validation`` block
    predates the PIQD solve, so it must not be treated as a claim about the
    later child31 response model.
    """

    if not REAL_MANIFEST.exists():
        pytest.skip("child31 replay artifacts are not present")
    analyzer = module()
    manifest, manifest_sha256 = analyzer.read_json(REAL_MANIFEST)
    auth = analyzer.validate_ingress_manifest(
        manifest,
        manifest_sha256=manifest_sha256,
        cnf_sha256=analyzer.AUTHORIZED_CNF_SHA256,
        variables=analyzer.VARIABLE_COUNT,
        clauses=analyzer.CLAUSE_COUNT,
        model_sha256=analyzer.AUTHORIZED_MODEL_SHA256,
    )
    assert auth["manifest_sha256"] == manifest_sha256
    assert auth["model_declaration"] is False


def test_missing_terminal_identity_is_diagnostic_only() -> None:
    analyzer = module()
    payload, _ = analyzer.read_json(HARDENED_NO_TERMINAL)
    assert payload["status"] == "PASS"
    assert analyzer.production_authentication_status(None) is False
    assert analyzer.production_authentication_status(
        {"identity_authenticated": False}
    ) is False
    assert analyzer.production_authentication_status(
        {"identity_authenticated": True}
    ) is True


def terminal_payload(analyzer, *, include_solver: bool = True) -> dict[str, object]:
    manifest_sha256 = "f" * 64
    payload: dict[str, object] = {
        "artifact_kind": "p97-exact17-thirty-first-root-piqd-final/v1",
        "job_id": analyzer.AUTHORIZED_JOB_ID,
        "result": "SAT",
        "model_sha256": analyzer.AUTHORIZED_MODEL_SHA256,
        "root": {
            "sha256": analyzer.AUTHORIZED_CNF_SHA256,
            "variables": analyzer.VARIABLE_COUNT,
            "clauses": analyzer.CLAUSE_COUNT,
            "manifest_sha256": manifest_sha256,
        },
        "status": {
            "id": analyzer.AUTHORIZED_JOB_ID,
            "cnf_blob_hash": analyzer.AUTHORIZED_CNF_SHA256,
            "result": "SAT",
            "backend": "cadical",
            "project": analyzer.PROJECT,
            "producer_manifest_hash": manifest_sha256,
            "producer_manifest_blob_hash": manifest_sha256,
            "identity_hash": analyzer.expected_identity_hash(
                cnf_sha256=analyzer.AUTHORIZED_CNF_SHA256,
                manifest_sha256=manifest_sha256,
                backend="cadical",
                solver_profile="sat",
            ),
        },
        "daemon": {"daemon": {"sha256": analyzer.AUTHORIZED_DAEMON_SHA256}},
    }
    if include_solver:
        payload["solver"] = {"solver": "cadical", "lane": "sat"}
    return payload


def test_terminal_identity_is_recomputed_from_bound_fields() -> None:
    analyzer = module()
    terminal = terminal_payload(analyzer)
    auth = analyzer.validate_terminal_artifact(
        terminal,
        terminal_sha256="a" * 64,
        manifest_sha256="f" * 64,
        cnf_sha256=analyzer.AUTHORIZED_CNF_SHA256,
        model_sha256=analyzer.AUTHORIZED_MODEL_SHA256,
        job_id=analyzer.AUTHORIZED_JOB_ID,
    )
    assert auth["identity_authenticated"] is True
    assert auth["identity_limitation"] is None

    terminal["status"]["identity_hash"] = "0" * 64  # type: ignore[index]
    with pytest.raises(ValueError, match="identity hash mismatch"):
        analyzer.validate_terminal_artifact(
            terminal,
            terminal_sha256="a" * 64,
            manifest_sha256="f" * 64,
            cnf_sha256=analyzer.AUTHORIZED_CNF_SHA256,
            model_sha256=analyzer.AUTHORIZED_MODEL_SHA256,
            job_id=analyzer.AUTHORIZED_JOB_ID,
        )


def test_terminal_without_solver_identity_is_diagnostic_only() -> None:
    analyzer = module()
    auth = analyzer.validate_terminal_artifact(
        terminal_payload(analyzer, include_solver=False),
        terminal_sha256="a" * 64,
        manifest_sha256="f" * 64,
        cnf_sha256=analyzer.AUTHORIZED_CNF_SHA256,
        model_sha256=analyzer.AUTHORIZED_MODEL_SHA256,
        job_id=analyzer.AUTHORIZED_JOB_ID,
    )
    assert auth["identity_authenticated"] is False
    assert "omits solver backend/profile" in auth["identity_limitation"]


def test_alternate_production_cli_anchors_are_rejected() -> None:
    analyzer = module()
    args = SimpleNamespace(
        authorized_sha256="0" * 64,
        authorized_model_sha256=analyzer.AUTHORIZED_MODEL_SHA256,
        authorized_job_id=analyzer.AUTHORIZED_JOB_ID,
        clause_count=analyzer.CLAUSE_COUNT,
    )
    with pytest.raises(ValueError, match="authorized-sha256"):
        analyzer.validate_production_anchors(args)

    args.authorized_sha256 = analyzer.AUTHORIZED_CNF_SHA256
    args.clause_count += 1
    with pytest.raises(ValueError, match="clause-count"):
        analyzer.validate_production_anchors(args)
