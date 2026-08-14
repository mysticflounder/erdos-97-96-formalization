from __future__ import annotations

import hashlib
import json
import sys
from dataclasses import replace
from pathlib import Path
from typing import Any, Self

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import export_exact17_thirty_second_root as exporter
import run_piqd_exact17_thirty_second_root as runner
import validate_exact17_thirty_first_model_refinements_export as export_validation
import validate_exact17_thirty_first_model_refinements_ingress as ingress


class FakeClient:
    def __init__(self, root: bytes, spec: runner.RunnerSpec) -> None:
        self.root = root
        self.manifest = b'{"fixture":"child32"}\n'
        self.stored_root = root
        self.stored_manifest = self.manifest
        self.spec = spec
        self.phase = "prepared"
        self.existing = False
        self.submit_calls = 0
        self.confirm_calls = 0
        self.confirm_failure: str | None = None
        self.daemon_protocol = spec.ingress.daemon_protocol_version
        self.model_job_id = "job-child32"
        self.model_backend = spec.ingress.backend
        self.model_profile = spec.ingress.solver_profile
        self.model_num_assigned = spec.variables
        self.terminal_result = "SAT"
        self.model_check_calls = 0
        self.model_check_payload: dict[str, Any] | None = None
        self.prepare_core_override: Any = runner.REQUESTED_CORE_LIMIT
        self.status_core_override: Any = runner.REQUESTED_CORE_LIMIT
        self.run_epoch_override: Any | None = None
        self.recovery_action_override: Any = None
        self.omit_recovery_action = False
        self.attestation_overrides: dict[str, Any] = {}
        self.attestation_missing: set[str] = set()
        self.log_mode = "valid"
        self.log_bytes = b"c SATISFIABLE\nv 1 2 3 0\n"
        self.log_calls = 0
        self.kept_cnf = root
        self.proof_bytes = b"1 0\n"
        self.kept_hash = hashlib.sha256(self.kept_cnf).hexdigest()
        self.proof_hash = hashlib.sha256(self.proof_bytes).hexdigest()
        self.clause_map_payload = {
            "version": runner.CLAUSE_MAP_VERSION,
            "submitted_sha256": hashlib.sha256(root).hexdigest(),
            "submitted_clauses": spec.clauses,
            "kept_sha256": self.kept_hash,
            "kept_clauses": spec.clauses,
            "exceptions": [],
            "expansion_rule": runner.CLAUSE_MAP_EXPANSION_RULE,
            "boundary": runner.CLAUSE_MAP_BOUNDARY,
        }

    def version(self) -> dict[str, Any]:
        return {
            "daemon": {
                "name": self.spec.daemon_name,
                "version": self.spec.daemon_version,
                "protocol_version": self.daemon_protocol,
                "sha256": self.spec.ingress.daemon_sha256,
            },
            "limits": {"max_var": 1_000_000},
        }

    def solvers(self) -> dict[str, Any]:
        daemon = self.version()["daemon"]
        return {
            "daemon": daemon,
            "solvers": [
                {
                    "name": self.spec.ingress.solver_name,
                    "sha256": self.spec.ingress.solver_sha256,
                    "solver_signature": self.spec.ingress.solver_signature,
                    "protocol_version": self.spec.ingress.daemon_protocol_version,
                    "solver": self.spec.ingress.backend,
                    "lane": "sat",
                    "usable": True,
                }
            ],
        }

    def submit(
        self,
        cnf: Path,
        manifest: Path,
        *,
        backend: str,
        profile: str,
        project: str,
        requested_core_limit: int,
        timeout_s: int | None = None,
        march_timeout_s: int | None = None,
    ) -> dict[str, Any]:
        self.submit_calls += 1
        assert cnf.read_bytes() == self.root
        assert hashlib.sha256(manifest.read_bytes()).hexdigest() == (
            self.spec.manifest_sha256
        )
        assert (backend, profile, project) == (
            self.spec.ingress.backend,
            self.spec.ingress.solver_profile,
            self.spec.project,
        )
        assert type(requested_core_limit) is int
        assert requested_core_limit == runner.REQUESTED_CORE_LIMIT
        if runner._uses_hardened_protocol(self.spec):
            assert timeout_s == self.spec.timeout_s
            assert march_timeout_s == self.spec.march_timeout_s
        response = {
            "existing": self.existing,
            "cnf_blob_hash": self.spec.root_sha256,
            "num_vars": self.spec.variables,
            "num_clauses": self.spec.clauses,
            "identity_hash": runner.expected_identity_hash(self.spec),
            "job_id": "job-child32",
            "backend": self.spec.ingress.backend,
            "solver_profile": self.spec.ingress.solver_profile,
            "producer_manifest_hash": self.spec.manifest_sha256,
            "producer_manifest_blob_hash": self.spec.manifest_sha256,
            "requested_core_limit": self.prepare_core_override,
        }
        return response

    def _status(self, phase: str, *, result: str | None = None) -> dict[str, Any]:
        payload: dict[str, Any] = {
            "id": "job-child32",
            "identity_hash": runner.expected_identity_hash(self.spec),
            "cnf_blob_hash": self.spec.root_sha256,
            "producer_manifest_hash": self.spec.manifest_sha256,
            "producer_manifest_blob_hash": self.spec.manifest_sha256,
            "project": self.spec.project,
            "backend": self.spec.ingress.backend,
            "solver_profile": self.spec.ingress.solver_profile,
            "num_vars": self.spec.variables,
            "num_clauses": self.spec.clauses,
            "status": phase,
            "requested_core_limit": self.status_core_override,
            "run_epoch": (
                self.run_epoch_override
                if self.run_epoch_override is not None
                else (0 if phase in {"prepared", "confirmed"} else 1)
            ),
            "recovery_action": self.recovery_action_override,
        }
        if self.omit_recovery_action:
            payload.pop("recovery_action")
        if runner._uses_hardened_protocol(self.spec):
            payload.update(
                {"timeout_s": self.spec.timeout_s, "march_timeout_s": self.spec.march_timeout_s}
            )
        if result is not None:
            payload["result"] = result
            payload["daemon_sha256"] = self.spec.ingress.daemon_sha256
            payload["attested_solver_processes"] = runner.ATTESTED_SOLVER_PROCESSES
            payload["attestation_basis"] = runner.ATTESTATION_BASIS
            payload["log_sha256"] = hashlib.sha256(self.log_bytes).hexdigest()
            if self.spec.artifact_namespace == "child33":
                payload.update(
                    {
                        "completed_at": 123456789,
                        "proof_blob_hash": None,
                        "kept_cnf_blob_hash": None,
                        "proof_format": None,
                        "model_blob_hash": None,
                    }
                )
                if result == "UNSAT":
                    payload.update(
                        {
                            "proof_blob_hash": self.proof_hash,
                            "kept_cnf_blob_hash": self.kept_hash,
                            "proof_format": "compacted_lrat",
                            "model_blob_hash": None,
                        }
                    )
            payload.update(self.attestation_overrides)
            for field in self.attestation_missing:
                payload.pop(field, None)
        return payload

    def status(self, _job_id: str) -> dict[str, Any]:
        if self.phase == "completed":
            return self._status("completed", result=self.terminal_result)
        return self._status(self.phase)

    def retrieve_cnf(self, _job_id: str, destination: Path) -> None:
        destination.write_bytes(self.stored_root)

    def retrieve_blob(
        self, _job_id: str, blob_hash: str, destination: Path
    ) -> None:
        if blob_hash == self.spec.manifest_sha256:
            destination.write_bytes(self.stored_manifest)
        elif blob_hash == self.kept_hash:
            destination.write_bytes(self.kept_cnf)
        else:
            raise AssertionError(f"unexpected blob {blob_hash}")

    def retrieve_proof(self, _job_id: str, destination: Path) -> dict[str, Any]:
        destination.write_bytes(self.proof_bytes)
        return {"bytes": len(self.proof_bytes), "sha256": self.proof_hash}

    def clause_map(self, _job_id: str) -> dict[str, Any]:
        return self.clause_map_payload

    def confirm(self, job_id: str) -> dict[str, Any]:
        self.confirm_calls += 1
        assert job_id == "job-child32"
        if self.confirm_failure == "before_effect":
            raise RuntimeError("injected pre-confirm crash")
        self.phase = "confirmed"
        if self.confirm_failure == "conflict":
            raise runner.ConfirmConflictError("injected HTTP 409")
        if self.confirm_failure == "after_effect":
            raise RuntimeError("injected post-confirm crash")
        return {
            "job_id": "job-child32",
            "blob_hash": self.spec.root_sha256,
            "status": "confirmed",
        }

    def model(self, _job_id: str) -> dict[str, Any]:
        return {
            "job_id": self.model_job_id,
            "result": "SAT",
            "backend": self.model_backend,
            "solver_profile": self.model_profile,
            "num_assigned": self.model_num_assigned,
            "assignment": [1, 2, 3],
        }

    def model_check(self, job_id: str) -> dict[str, Any]:
        self.model_check_calls += 1
        if self.model_check_payload is not None:
            return self.model_check_payload
        return {
            "job_id": job_id,
            "project": self.spec.project,
            "cnf_blob_hash": self.spec.root_sha256,
            "outcome": "SATISFIED",
            "announcement": "NONE",
            "detail": (
                f"the model satisfies all {self.spec.clauses} clauses. "
                f"Project {self.spec.project} declares no counterexample scope, "
                "so piqd makes no claim about what that means"
            ),
            "clause_index": None,
            "clause": None,
            "num_vars": self.spec.variables,
            "num_clauses": self.spec.clauses,
            "num_assigned": self.spec.variables,
            "ce_scope": None,
            "checked_at": 123456790,
            "announced_at": None,
            "model_sha256": hashlib.sha256(b"1 2 3").hexdigest(),
            "job_completed_at": 123456789,
        }

    def retrieve_log(self, _job_id: str, destination: Path) -> dict[str, Any]:
        self.log_calls += 1
        if self.log_mode == "missing":
            raise RuntimeError("injected missing solver log")
        if self.log_mode == "empty":
            payload = b""
        elif self.log_mode == "truncated":
            payload = self.log_bytes[: max(1, len(self.log_bytes) // 2)]
        elif self.log_mode == "changed":
            payload = self.log_bytes + b"changed\n"
        else:
            payload = self.log_bytes
        destination.write_bytes(payload)
        return {
            "bytes": len(payload),
            "sha256": hashlib.sha256(payload).hexdigest(),
        }


def _fixture(tmp_path: Path) -> tuple[runner.RunnerPaths, runner.RunnerSpec, bytes]:
    root = b"p cnf 3 2\n1 0\n2 3 0\n"
    child = tmp_path / "child.cnf"
    child.write_bytes(root)
    manifest = tmp_path / "ingress.json"
    manifest.write_bytes(b'{"fixture":"child32"}\n')
    empty = tmp_path / "empty"
    empty.write_text("fixture\n", encoding="utf-8")
    export_paths = exporter.ExportPaths(
        parent=empty,
        ledger=empty,
        lean_root=empty,
        lean_export=empty,
        child=child,
        receipt=empty,
    )
    export_spec = export_validation.ExportSpec(
        variables=3,
        parent_clauses=0,
        new_clauses=2,
        parent_sha256="a" * 64,
        child_sha256=hashlib.sha256(root).hexdigest(),
        child_bytes=len(root),
        ledger_schema="fixture/v1",
        ledger_sha256="b" * 64,
        occurrence_count=0,
        expected_output_paths=(),
        publication_state="PROVISIONED",
    )
    ingress_paths = ingress.IngressPaths(
        export=export_paths,
        publication_inputs=export_validation.PublicationInputs(
            lean_output=empty,
            analysis=empty,
            parent_ledger=empty,
            parent_cnf=empty,
        ),
        parent_manifest=empty,
        manifest=manifest,
    )
    ingress_spec = ingress.IngressSpec(
        export=export_spec,
        parent_manifest_sha256="c" * 64,
    )
    spec = runner.RunnerSpec(
        ingress=ingress_spec,
        manifest_sha256=hashlib.sha256(manifest.read_bytes()).hexdigest(),
        root_sha256=hashlib.sha256(root).hexdigest(),
        root_bytes=len(root),
        variables=3,
        clauses=2,
    )
    paths = runner.RunnerPaths(
        ingress=ingress_paths,
        intent=tmp_path / "intent.json",
        prepared=tmp_path / "prepared.json",
        state=tmp_path / "state.json",
        final=tmp_path / "final.json",
        model=tmp_path / "model.json",
        solver_log=tmp_path / "solver.log",
        lock=tmp_path / "runner.lock",
    )
    return paths, spec, root


def _validated(*_args: object, **_kwargs: object) -> dict[str, Any]:
    return {"status": "PASS", "schema": "fixture-ingress-validation/v1"}


def test_immutable_records_are_private_atomic_and_never_overwritten(
    tmp_path: Path,
) -> None:
    target = tmp_path / "custody.json"
    runner._immutable_json(target, {"value": 1})
    original = target.read_bytes()
    assert target.stat().st_mode & 0o777 == 0o600
    with pytest.raises(FileExistsError):
        runner._immutable_json(target, {"value": 2})
    assert target.read_bytes() == original
    assert list(tmp_path.glob(".custody.json.*.tmp")) == []


def test_start_refuses_stale_solver_log_before_submission(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    paths.solver_log.write_text("stale\n", encoding="utf-8")
    with pytest.raises(FileExistsError, match="stale"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.submit_calls == 0
    assert not paths.intent.exists()


def test_start_and_sat_finalize_bind_every_identity(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["phase"] == "confirmed"
    assert state["binding"]["solver_profile"] == "sat"
    assert (
        state["prepared_record"]["submitted"]["producer_manifest_hash"]
        == spec.manifest_sha256
    )
    assert (
        state["prepared_record"]["prepared_status"]["producer_manifest_hash"]
        == spec.manifest_sha256
    )
    client.phase = "completed"
    report = runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert report["result"] == "SAT"
    assert report["model_replay"] == {"clauses_checked": 2, "satisfies_all": True}
    assert client.log_calls == 1
    assert report["solver_log"]["sha256"] == hashlib.sha256(client.log_bytes).hexdigest()
    assert paths.model.is_file() and paths.final.is_file()


def _child33_fixture(
    tmp_path: Path,
) -> tuple[runner.RunnerPaths, runner.RunnerSpec, bytes]:
    tmp_path.mkdir(parents=True, exist_ok=True)
    paths, spec, root = _fixture(tmp_path)
    return paths, replace(
        spec,
        project="erdos-97-96-exact17-child33",
        artifact_namespace="child33",
    ), root


def test_hardened_prepare_omits_timeouts_and_status_binds_them(
    tmp_path: Path,
) -> None:
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    submitted = state["prepared_record"]["submitted"]
    assert "timeout_s" not in submitted and "march_timeout_s" not in submitted
    prepared_status = state["prepared_record"]["prepared_status"]
    assert prepared_status["timeout_s"] == spec.timeout_s
    assert prepared_status["march_timeout_s"] == spec.march_timeout_s
    assert state["binding"]["timeout_s"] == spec.timeout_s
    assert state["binding"]["march_timeout_s"] == spec.march_timeout_s


@pytest.mark.parametrize("field", ["timeout_s", "march_timeout_s"])
@pytest.mark.parametrize("replacement", ["missing", None, 0, True, 1.0, "3600", 3601])
def test_hardened_status_requires_exact_timeouts_before_confirmation(
    tmp_path: Path, field: str, replacement: Any
) -> None:
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def crossed_status(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        if replacement == "missing":
            payload.pop(field)
        else:
            payload[field] = replacement
        return payload

    client.status = crossed_status
    with pytest.raises(ValueError, match="timeout crossed hardened identity"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 0


def test_child33_sat_requires_bound_model_check_row(tmp_path: Path) -> None:
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    report = runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert report["model_check"]["job_completed_at"] == 123456789
    assert client.model_check_calls == 1

    paths, spec, root = _child33_fixture(tmp_path / "bad")
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.model_check_payload = {
        **FakeClient(root, spec).model_check("job-child32"),
        "project": "wrong-project",
    }
    with pytest.raises(ValueError, match="model-check crossed project"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


def test_child33_sat_binds_model_check_to_exact_assignment_and_schema(
    tmp_path: Path,
) -> None:
    paths, spec, root = _child33_fixture(tmp_path / "digest")
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.model_check_payload = {
        **FakeClient(root, spec).model_check("job-child32"),
        "model_sha256": "d" * 64,
    }
    with pytest.raises(ValueError, match="model-check crossed model identity"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()

    paths, spec, root = _child33_fixture(tmp_path / "detail")
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.model_check_payload = {
        **FakeClient(root, spec).model_check("job-child32"),
        "detail": None,
    }
    with pytest.raises(ValueError, match="model-check no-scope detail drifted"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()

    paths, spec, root = _child33_fixture(tmp_path / "schema")
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    payload = FakeClient(root, spec).model_check("job-child32")
    del payload["clause_index"]
    client.model_check_payload = payload
    with pytest.raises(ValueError, match="model-check schema drifted"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


@pytest.mark.parametrize(
    ("mutation", "error"),
    [
        ("detail_punctuation", "model-check no-scope detail drifted"),
        ("detail_whitespace", "model-check no-scope detail drifted"),
        ("detail_count", "model-check no-scope detail drifted"),
        ("detail_project", "model-check no-scope detail drifted"),
        ("announcement", "model-check announcement drifted"),
        ("ce_scope", "model-check CE scope drifted"),
        ("clause_index", "model-check names a clause index"),
        ("clause", "model-check names a clause"),
        ("completed_at", "model-check crossed completed_at"),
        ("checked_at", "model-check checked_at predates completion"),
        ("announced_at", "model-check was already announced"),
        ("extra_key", "model-check schema drifted"),
    ],
)
def test_child33_sat_rejects_model_check_contract_drift(
    tmp_path: Path,
    mutation: str,
    error: str,
) -> None:
    paths, spec, root = _child33_fixture(tmp_path / mutation)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    payload = FakeClient(root, spec).model_check("job-child32")
    if mutation == "detail_punctuation":
        payload["detail"] += "."
    elif mutation == "detail_whitespace":
        payload["detail"] = payload["detail"].replace(" clauses. Project", " clauses.  Project")
    elif mutation == "detail_count":
        payload["detail"] = payload["detail"].replace(
            str(spec.clauses), str(spec.clauses - 1)
        )
    elif mutation == "detail_project":
        payload["detail"] = payload["detail"].replace(spec.project, "wrong-project")
    elif mutation == "announcement":
        payload["announcement"] = "POSSIBLE_COUNTEREXAMPLE"
    elif mutation == "ce_scope":
        payload["ce_scope"] = {"name": "wrong-scope"}
    elif mutation == "clause_index":
        payload["clause_index"] = 1
    elif mutation == "clause":
        payload["clause"] = [1, -2]
    elif mutation == "completed_at":
        payload["job_completed_at"] -= 1
    elif mutation == "checked_at":
        payload["checked_at"] = payload["job_completed_at"] - 1
    elif mutation == "announced_at":
        payload["announced_at"] = payload["checked_at"]
    elif mutation == "extra_key":
        payload["unexpected"] = "field"
    else:  # pragma: no cover - the parametrization is exhaustive
        raise AssertionError(f"unhandled mutation: {mutation}")
    client.model_check_payload = payload
    with pytest.raises(ValueError, match=error):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


def test_child33_sat_rejects_nonnull_proof_shape(tmp_path: Path) -> None:
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    original_status = client.status

    def crossed_status(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        payload["proof_blob_hash"] = "a" * 64
        return payload

    client.status = crossed_status
    with pytest.raises(ValueError, match="SAT populated proof_blob_hash"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert client.log_calls == 0


def test_child33_unsat_requires_compacted_lrat_and_never_model_checks(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(
        runner,
        "_run_independent_lean_lrat_replay",
        lambda kept, proof, spec: {"status": "PASS"},
    )
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    client.terminal_result = "UNSAT"
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    report = runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert report["proof_replay_complete"] is True
    assert report["unsat_certificate"]["job_id"] == "job-child32"
    assert report["unsat_certificate"]["root_sha256"] == spec.root_sha256
    assert report["unsat_certificate"]["manifest_sha256"] == spec.manifest_sha256
    assert report["unsat_certificate"]["kept_cnf"]["sha256"] == client.kept_hash
    assert report["unsat_certificate"]["proof"]["sha256"] == client.proof_hash
    assert client.model_check_calls == 0
    assert not paths.model.exists()

    paths, spec, root = _child33_fixture(tmp_path / "bad")
    client = FakeClient(root, spec)
    client.terminal_result = "UNSAT"
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    original_status = client.status

    def crossed_status(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        payload["proof_format"] = "march_cu_manifest"
        return payload

    client.status = crossed_status
    with pytest.raises(ValueError, match="proof format"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert client.model_check_calls == 0


@pytest.mark.parametrize(
    ("mutation", "error"),
    [
        ("version", "clause-map version"),
        ("submitted_hash", "crossed submitted CNF"),
        ("submitted_count", "submitted clause count"),
        ("kept_hash", "crossed kept CNF"),
        ("kept_count", "kept clause count"),
        ("expansion", "expansion rule"),
        ("boundary", "certificate boundary"),
        ("exception", "exception"),
    ],
)
def test_child33_unsat_clause_map_is_fail_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    mutation: str,
    error: str,
) -> None:
    monkeypatch.setattr(
        runner,
        "_run_independent_lean_lrat_replay",
        lambda kept, proof, spec: {"status": "PASS"},
    )
    paths, spec, root = _child33_fixture(tmp_path / mutation)
    client = FakeClient(root, spec)
    client.terminal_result = "UNSAT"
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    if mutation == "version":
        client.clause_map_payload["version"] = "piqd-clause-map/v0"
    elif mutation == "submitted_hash":
        client.clause_map_payload["submitted_sha256"] = "0" * 64
    elif mutation == "submitted_count":
        client.clause_map_payload["submitted_clauses"] = spec.clauses - 1
    elif mutation == "kept_hash":
        client.clause_map_payload["kept_sha256"] = "0" * 64
    elif mutation == "kept_count":
        client.clause_map_payload["kept_clauses"] = spec.clauses - 1
    elif mutation == "expansion":
        client.clause_map_payload["expansion_rule"] = "keep everything"
    elif mutation == "boundary":
        client.clause_map_payload["boundary"] = "UNSAT proves the source"
    elif mutation == "exception":
        client.clause_map_payload["exceptions"] = [
            {
                "submitted_id": 1,
                "kind": "dropped_tautology",
                "submitted_sha256": runner._clause_sha256([1]),
            }
        ]
    else:  # pragma: no cover - parametrization is exhaustive
        raise AssertionError(mutation)
    with pytest.raises(ValueError, match=error):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


def test_child33_unsat_rejects_proof_hash_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(
        runner,
        "_run_independent_lean_lrat_replay",
        lambda kept, proof, spec: {"status": "PASS"},
    )
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    client.terminal_result = "UNSAT"
    client.proof_hash = "0" * 64
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    with pytest.raises(ValueError, match="proof hash drifted"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


def test_child33_unsat_reconstructs_kept_cnf_independently(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(
        runner,
        "_run_independent_lean_lrat_replay",
        lambda kept, proof, spec: {"status": "PASS"},
    )
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    client.terminal_result = "UNSAT"
    client.kept_cnf = b"p cnf 3 2\n1 0\n1 2 0\n"
    client.kept_hash = hashlib.sha256(client.kept_cnf).hexdigest()
    client.clause_map_payload["kept_sha256"] = client.kept_hash
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    with pytest.raises(ValueError, match="differs from independently reconstructed"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


@pytest.mark.parametrize("replacement", [0, 2, True, 1.0, "1", None])
def test_prepare_requested_core_limit_is_exactly_builtin_one(
    tmp_path: Path, replacement: Any
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.prepare_core_override = replacement
    with pytest.raises(ValueError, match="requested[ _]core[ _]limit"):
        runner.start(client, paths, spec, ingress_validator=_validated)


@pytest.mark.parametrize("replacement", [0, 2, True, 1.0, "1", None])
def test_status_requested_core_limit_is_exactly_builtin_one(
    tmp_path: Path, replacement: Any
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def crossed_status(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        payload["requested_core_limit"] = replacement
        return payload

    client.status = crossed_status
    with pytest.raises(ValueError, match="requested[ _]core[ _]limit"):
        runner.start(client, paths, spec, ingress_validator=_validated)


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("attested_solver_processes", "missing"),
        ("attested_solver_processes", None),
        ("attested_solver_processes", 0),
        ("attested_solver_processes", True),
        ("attested_solver_processes", 1.0),
        ("attestation_basis", "missing"),
        ("attestation_basis", None),
        ("attestation_basis", "WRONG"),
        ("attestation_basis", 1),
        ("log_sha256", "missing"),
        ("log_sha256", None),
        ("log_sha256", "0"),
    ],
)
def test_completed_attestation_is_exact_and_typed(
    tmp_path: Path, field: str, replacement: Any
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    if replacement == "missing":
        client.attestation_missing.add(field)
    else:
        client.attestation_overrides[field] = replacement
    with pytest.raises(ValueError, match="attestation|single-process|solver-log"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert client.log_calls == 0


@pytest.mark.parametrize("mode", ["missing", "empty", "truncated", "changed"])
def test_completed_solver_log_is_nonempty_complete_and_bound(
    tmp_path: Path, mode: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.log_mode = mode
    with pytest.raises((RuntimeError, ValueError), match="log|artifact|hash|empty|truncated"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


def test_completed_solver_log_digest_is_mandatory(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.attestation_missing.add("log_sha256")
    with pytest.raises(ValueError, match="solver-log"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)


def test_confirm_http_409_recovers_by_same_job_status(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.confirm_failure = "conflict"
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["confirmation"] == {
        "method": "confirm_409_status_recovery",
        "recovered_from": "confirmed",
    }
    assert client.confirm_calls == 1


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("producer_manifest_hash", None),
        ("producer_manifest_hash", "wrong"),
        ("producer_manifest_blob_hash", None),
        ("producer_manifest_blob_hash", "wrong"),
    ],
)
def test_prepare_status_remains_authoritative_for_manifest_binding(
    tmp_path: Path, field: str, replacement: str | None
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def crossed_status(job_id: str) -> dict[str, Any]:
        status = original_status(job_id)
        if replacement is None:
            status.pop(field)
        else:
            status[field] = replacement
        return status

    client.status = crossed_status
    with pytest.raises(ValueError, match=f"PIQD {field} crossed child32 identity"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.intent.is_file()
    assert not paths.prepared.exists() and not paths.state.exists()


@pytest.mark.parametrize("replacement", [None, True, 1.0, 1, 2])
def test_pre_run_status_requires_exact_zero_run_epoch(
    tmp_path: Path, replacement: Any
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.run_epoch_override = replacement
    if replacement is None:
        original_status = client.status

        def status_without_epoch(job_id: str) -> dict[str, Any]:
            payload = original_status(job_id)
            payload.pop("run_epoch")
            return payload

        client.status = status_without_epoch
    with pytest.raises(ValueError, match="run epoch"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 0


@pytest.mark.parametrize("replacement", [None, True, 0, 1.0, 2])
def test_terminal_status_requires_exact_one_run_epoch(
    tmp_path: Path, replacement: Any
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.run_epoch_override = replacement
    if replacement is None:
        original_status = client.status

        def status_without_epoch(job_id: str) -> dict[str, Any]:
            payload = original_status(job_id)
            payload.pop("run_epoch")
            return payload

        client.status = status_without_epoch
    with pytest.raises(ValueError, match="run epoch"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists()


@pytest.mark.parametrize("mode", ["missing", "recovered"])
def test_status_rejects_missing_or_nonnull_recovery_action(
    tmp_path: Path, mode: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    if mode == "missing":
        client.omit_recovery_action = True
    else:
        client.recovery_action_override = "REQUEUED_AFTER_KILL"
    with pytest.raises(ValueError, match="recovery history|recovery action"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 0


@pytest.mark.parametrize(
    ("phase", "run_epoch"),
    [
        ("prepared", 0),
        ("confirmed", 0),
        ("running", 1),
        ("completed", 1),
        ("failed", 1),
    ],
)
def test_job_guard_accepts_only_fresh_lifecycle_epochs(
    tmp_path: Path, phase: str, run_epoch: int
) -> None:
    _paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    status = client._status(phase)
    status["run_epoch"] = run_epoch
    assert runner._check_job(status, "job-child32", spec, phase) == phase


@pytest.mark.parametrize(
    "phase", ["prepared", "confirmed", "running", "completed", "failed"]
)
@pytest.mark.parametrize(
    "replacement", [None, False, True, 0.0, 1.0, "0", "1", 2, [], {}]
)
def test_job_guard_rejects_null_wrong_type_or_wrong_epoch(
    tmp_path: Path, phase: str, replacement: Any
) -> None:
    _paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    status = client._status(phase)
    status["run_epoch"] = replacement
    with pytest.raises(ValueError, match="run epoch"):
        runner._check_job(status, "job-child32", spec, phase)


@pytest.mark.parametrize("phase", ["prepared", "confirmed", "running", "completed", "failed"])
@pytest.mark.parametrize(
    "replacement", [False, 0, "REQUEUED_AFTER_KILL", [], {}]
)
def test_job_guard_rejects_every_nonnull_recovery_marker(
    tmp_path: Path, phase: str, replacement: Any
) -> None:
    _paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    status = client._status(phase)
    status["recovery_action"] = replacement
    with pytest.raises(ValueError, match="recovery history"):
        runner._check_job(status, "job-child32", spec, phase)


@pytest.mark.parametrize(
    "phase", ["prepared", "confirmed", "running", "completed", "failed"]
)
def test_job_guard_rejects_omitted_recovery_marker(
    tmp_path: Path, phase: str
) -> None:
    _paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    status = client._status(phase)
    status.pop("recovery_action")
    with pytest.raises(ValueError, match="omitted its recovery action"):
        runner._check_job(status, "job-child32", spec, phase)


@pytest.mark.parametrize("field", ["num_vars", "num_clauses"])
@pytest.mark.parametrize("phase", ["prepared", "completed"])
def test_job_guard_accepts_status_schema_omitting_prepare_only_counts(
    tmp_path: Path, field: str, phase: str
) -> None:
    _paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    status = client._status(phase)
    status.pop(field)
    assert runner._check_job(status, "job-child32", spec, phase) == phase


@pytest.mark.parametrize("field", ["num_vars", "num_clauses"])
@pytest.mark.parametrize("phase", ["prepared", "completed"])
@pytest.mark.parametrize(
    "replacement", [None, False, True, 0, 1, 1.0, "3", [], {}]
)
def test_job_guard_rejects_wrong_typed_or_wrong_echoed_counts(
    tmp_path: Path, field: str, phase: str, replacement: Any
) -> None:
    _paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    status = client._status(phase)
    status[field] = replacement
    with pytest.raises(ValueError, match=f"PIQD {field} crossed child32 identity"):
        runner._check_job(status, "job-child32", spec, phase)


@pytest.mark.parametrize("field", ["num_vars", "num_clauses"])
def test_prepare_guard_still_requires_declared_counts(
    tmp_path: Path, field: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    response = client.submit(
        paths.ingress.export.child,
        paths.ingress.manifest,
        backend=spec.ingress.backend,
        profile=spec.ingress.solver_profile,
        project=spec.project,
        requested_core_limit=runner.REQUESTED_CORE_LIMIT,
        timeout_s=spec.timeout_s,
        march_timeout_s=spec.march_timeout_s,
    )
    response.pop(field)
    with pytest.raises(ValueError, match=f"PIQD prepare {field} crossed child32 identity"):
        runner._check_prepare_response(
            response, "job-child32", spec, expected_existing=False
        )


def test_confirmed_status_requires_pre_run_epoch_zero(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def corrupt_confirmed_epoch(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        if payload["status"] == "confirmed":
            payload["run_epoch"] = 1
        return payload

    client.status = corrupt_confirmed_epoch
    with pytest.raises(ValueError, match="run epoch"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 1
    assert paths.prepared.is_file() and not paths.state.exists()


@pytest.mark.parametrize("mode", ["missing", "nonnull"])
def test_confirmed_status_requires_explicit_null_recovery_action(
    tmp_path: Path, mode: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def corrupt_confirmed_recovery(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        if payload["status"] == "confirmed":
            if mode == "missing":
                payload.pop("recovery_action")
            else:
                payload["recovery_action"] = "REQUEUED_AFTER_KILL"
        return payload

    client.status = corrupt_confirmed_recovery
    with pytest.raises(ValueError, match="recovery history|recovery action"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 1
    assert paths.prepared.is_file() and not paths.state.exists()


@pytest.mark.parametrize("phase", ["running", "completed", "failed"])
def test_post_confirm_route_accepts_fresh_first_run_lifecycle(
    tmp_path: Path, phase: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def advance_after_confirm(job_id: str) -> dict[str, Any]:
        if client.phase == "confirmed":
            return client._status(phase)
        return original_status(job_id)

    client.status = advance_after_confirm
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["post_confirm_status"]["status"] == phase
    assert state["post_confirm_status"]["run_epoch"] == 1
    assert state["post_confirm_status"]["recovery_action"] is None


def test_nonterminal_null_attestation_fields_are_not_identity_claims(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def status_with_null_attestation(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        payload["daemon_sha256"] = None
        payload["attested_solver_processes"] = None
        return payload

    client.status = status_with_null_attestation
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["phase"] == "confirmed"
    assert client.submit_calls == 1 and client.confirm_calls == 1


def test_nonterminal_populated_attestation_field_must_match(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_status = client.status

    def status_with_wrong_daemon(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        payload["daemon_sha256"] = "0" * 64
        return payload

    client.status = status_with_wrong_daemon
    with pytest.raises(ValueError, match="daemon_sha256 crossed child32 identity"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 0


def test_exact_existing_job_is_unattributable_and_never_resubmitted(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.existing = True
    with pytest.raises(ValueError, match="existing flag drifted"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.intent.is_file()
    assert not paths.prepared.exists() and not paths.state.exists()

    with pytest.raises(runner.UnreconciledPrepareError, match="refusing resubmit"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.submit_calls == 1


def test_explicit_reconciliation_recovers_intent_without_resubmitting(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_submit = client.submit

    def lose_prepare_response(*args: Any, **kwargs: Any) -> dict[str, Any]:
        original_submit(*args, **kwargs)
        raise RuntimeError("injected lost prepare response")

    client.submit = lose_prepare_response
    with pytest.raises(RuntimeError, match="lost prepare response"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.intent.is_file()
    assert not paths.prepared.exists() and not paths.state.exists()

    client.submit = original_submit
    state = runner.reconcile_prepared_job(
        client,
        "job-child32",
        paths,
        spec,
        ingress_validator=_validated,
    )
    assert state["phase"] == "confirmed"
    assert state["confirmation"]["method"] == "direct"
    assert state["prepared_record"]["submitted"] is None
    assert (
        state["prepared_record"]["submission_mode"]
        == "reconciled_after_prepare_response_failure"
    )
    assert client.submit_calls == 1 and client.confirm_calls == 1


def test_explicit_reconciliation_accepts_status_without_prepare_only_counts(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_submit = client.submit
    original_status = client.status

    def lose_prepare_response(*args: Any, **kwargs: Any) -> dict[str, Any]:
        original_submit(*args, **kwargs)
        raise RuntimeError("injected lost prepare response")

    def status_without_prepare_counts(job_id: str) -> dict[str, Any]:
        status = original_status(job_id)
        status.pop("num_vars", None)
        status.pop("num_clauses", None)
        return status

    client.submit = lose_prepare_response
    with pytest.raises(RuntimeError, match="lost prepare response"):
        runner.start(client, paths, spec, ingress_validator=_validated)

    client.submit = original_submit
    client.status = status_without_prepare_counts
    state = runner.reconcile_prepared_job(
        client,
        "job-child32",
        paths,
        spec,
        ingress_validator=_validated,
    )
    assert state["phase"] == "confirmed"
    assert client.submit_calls == 1 and client.confirm_calls == 1


def test_child33_reconciliation_records_exact_legacy_identity_migration(
    tmp_path: Path,
) -> None:
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    original_submit = client.submit

    def lose_prepare_response(*args: Any, **kwargs: Any) -> dict[str, Any]:
        original_submit(*args, **kwargs)
        raise RuntimeError("injected pre-fix prepare response loss")

    client.submit = lose_prepare_response
    with pytest.raises(RuntimeError, match="pre-fix prepare response loss"):
        runner.start(client, paths, spec, ingress_validator=_validated)

    intent = json.loads(paths.intent.read_text(encoding="utf-8"))
    intent["binding"] = runner._legacy_timeout_inclusive_binding(spec)
    paths.intent.write_text(
        json.dumps(intent, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    client.submit = original_submit

    with pytest.raises(ValueError, match="requires explicit identity-contract migration"):
        runner.reconcile_prepared_job(
            client,
            "job-child32",
            paths,
            spec,
            ingress_validator=_validated,
        )
    assert client.confirm_calls == 0
    assert not paths.prepared.exists() and not paths.state.exists()

    state = runner.reconcile_prepared_job(
        client,
        "job-child32",
        paths,
        spec,
        ingress_validator=_validated,
        allow_legacy_intent_migration=True,
    )
    prepared = state["prepared_record"]
    assert prepared["submission_mode"] == "reconciled_after_identity_contract_fix"
    assert prepared["binding"] == runner._expected_binding(spec)
    assert prepared["intent_binding_migration"] == (
        runner._expected_intent_binding_migration(
            spec, runner.sha256_file(paths.intent), "job-child32"
        )
    )
    assert client.submit_calls == 1 and client.confirm_calls == 1

    client.phase = "completed"
    report = runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert report["result"] == "SAT"
    assert report["model_replay"] == {"clauses_checked": 2, "satisfies_all": True}


def test_child33_reconciliation_rejects_near_legacy_identity(
    tmp_path: Path,
) -> None:
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    original_submit = client.submit

    def lose_prepare_response(*args: Any, **kwargs: Any) -> dict[str, Any]:
        original_submit(*args, **kwargs)
        raise RuntimeError("injected prepare response loss")

    client.submit = lose_prepare_response
    with pytest.raises(RuntimeError, match="prepare response loss"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    intent = json.loads(paths.intent.read_text(encoding="utf-8"))
    intent["binding"] = runner._legacy_timeout_inclusive_binding(spec)
    intent["binding"]["identity_hash"] = "0" * 64
    paths.intent.write_text(
        json.dumps(intent, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    client.submit = original_submit

    with pytest.raises(ValueError, match="submission intent binding drifted"):
        runner.reconcile_prepared_job(
            client,
            "job-child32",
            paths,
            spec,
            ingress_validator=_validated,
        )
    assert client.confirm_calls == 0
    assert not paths.prepared.exists() and not paths.state.exists()


@pytest.mark.parametrize(
    "field",
    ("job_id", "intent_sha256", "from_binding", "to_binding"),
)
def test_child33_migrated_prepared_record_rejects_tampering(
    tmp_path: Path, field: str
) -> None:
    paths, spec, root = _child33_fixture(tmp_path)
    client = FakeClient(root, spec)
    original_submit = client.submit

    def lose_prepare_response(*args: Any, **kwargs: Any) -> dict[str, Any]:
        original_submit(*args, **kwargs)
        raise RuntimeError("injected prepare response loss")

    client.submit = lose_prepare_response
    with pytest.raises(RuntimeError, match="prepare response loss"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    intent = json.loads(paths.intent.read_text(encoding="utf-8"))
    intent["binding"] = runner._legacy_timeout_inclusive_binding(spec)
    paths.intent.write_text(
        json.dumps(intent, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    client.submit = original_submit
    runner.reconcile_prepared_job(
        client,
        "job-child32",
        paths,
        spec,
        ingress_validator=_validated,
        allow_legacy_intent_migration=True,
    )

    paths.state.unlink()
    prepared = json.loads(paths.prepared.read_text(encoding="utf-8"))
    migration = prepared["intent_binding_migration"]
    if field in {"job_id", "intent_sha256"}:
        migration[field] = "0" * 64
    else:
        migration[field]["identity_hash"] = "0" * 64
    paths.prepared.write_text(
        json.dumps(prepared, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )

    with pytest.raises(ValueError, match="prepared intent-binding migration drifted"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 1


def test_reconciliation_refuses_stale_solver_log(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_submit = client.submit

    def lose_prepare_response(*args: Any, **kwargs: Any) -> dict[str, Any]:
        original_submit(*args, **kwargs)
        raise RuntimeError("injected lost prepare response")

    client.submit = lose_prepare_response
    with pytest.raises(RuntimeError, match="lost prepare response"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    paths.solver_log.write_text("stale\n", encoding="utf-8")

    client.submit = original_submit
    with pytest.raises(FileExistsError, match="existing child32 custody"):
        runner.reconcile_prepared_job(
            client,
            "job-child32",
            paths,
            spec,
            ingress_validator=_validated,
        )
    assert client.submit_calls == 1 and client.confirm_calls == 0


def test_resume_refuses_stale_solver_log(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.confirm_failure = "before_effect"
    with pytest.raises(RuntimeError, match="pre-confirm crash"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.prepared.is_file() and not paths.state.exists()
    paths.solver_log.write_text("stale\n", encoding="utf-8")

    client.confirm_failure = None
    with pytest.raises(FileExistsError, match="stale"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.submit_calls == 1 and client.confirm_calls == 1


def test_finalize_refuses_stale_solver_log(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    paths.solver_log.write_text("stale\n", encoding="utf-8")
    client.phase = "completed"

    with pytest.raises(FileExistsError, match="stale"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert client.log_calls == 0


def test_crash_before_confirm_resumes_from_durable_prepared_record(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.confirm_failure = "before_effect"
    with pytest.raises(RuntimeError, match="pre-confirm crash"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.prepared.is_file() and not paths.state.exists()
    assert client.phase == "prepared" and client.submit_calls == 1

    client.confirm_failure = None
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["confirmation"]["method"] == "direct"
    assert client.submit_calls == 1 and client.confirm_calls == 2


def test_crash_after_confirm_recovers_without_confirming_twice(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.confirm_failure = "after_effect"
    with pytest.raises(RuntimeError, match="post-confirm crash"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.prepared.is_file() and not paths.state.exists()
    assert client.phase == "confirmed" and client.confirm_calls == 1

    client.confirm_failure = None
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["confirmation"] == {
        "method": "status_recovery",
        "recovered_from": "confirmed",
    }
    assert client.submit_calls == 1 and client.confirm_calls == 1


def test_existing_nonprepared_job_without_local_custody_is_rejected(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.existing = True
    client.phase = "completed"
    with pytest.raises(ValueError, match="existing flag drifted"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.intent.is_file()
    assert not paths.prepared.exists() and not paths.state.exists()


def test_tampered_prepared_custody_fails_before_reconfirmation(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.confirm_failure = "before_effect"
    with pytest.raises(RuntimeError, match="pre-confirm crash"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    prepared = json.loads(paths.prepared.read_text(encoding="utf-8"))
    prepared["binding"]["solver_profile"] = "wrong"
    paths.prepared.write_text(json.dumps(prepared) + "\n", encoding="utf-8")
    client.confirm_failure = None
    with pytest.raises(ValueError, match="prepared binding drifted"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.confirm_calls == 1 and not paths.state.exists()


def test_bad_protocol_and_crossed_model_fail_closed(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.daemon_protocol = 2
    with pytest.raises(ValueError, match="daemon build/protocol"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.submit_calls == 0

    client.daemon_protocol = 1
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.model_job_id = "different-job"
    with pytest.raises(ValueError, match="model crossed"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists() and not paths.model.exists()


@pytest.mark.parametrize(
    "field",
    [
        "job_id",
        "backend",
        "solver_profile",
        "result",
        "num_assigned",
    ],
)
def test_model_endpoint_shape_cannot_cross_child32_binding(
    tmp_path: Path, field: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    model = {
        "job_id": "job-child32",
        "result": "SAT",
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "num_assigned": spec.variables,
        "assignment": [1, 2, 3],
    }
    if field == "job_id":
        model[field] = "different-job"
    elif field == "backend":
        model[field] = "wrong-backend"
    elif field == "solver_profile":
        model[field] = "wrong-profile"
    elif field == "result":
        model[field] = "UNKNOWN"
    else:
        model[field] = 2
    client.model = lambda _job_id: model
    expected_errors = {
        "job_id": "model crossed",
        "backend": "model backend",
        "solver_profile": "model profile",
        "result": "model endpoint",
        "num_assigned": "model width",
    }
    with pytest.raises(ValueError, match=expected_errors[field]):
        runner.finalize(client, paths, spec, ingress_validator=_validated)


def test_model_fixture_matches_live_endpoint_shape(tmp_path: Path) -> None:
    _paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    assert set(client.model("job-child32")) == {
        "job_id",
        "result",
        "backend",
        "solver_profile",
        "num_assigned",
        "assignment",
    }


def test_prepared_and_confirmed_state_records_are_reauthenticated(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    prepared = json.loads(paths.prepared.read_text(encoding="utf-8"))
    prepared["prepared_status"]["solver_profile"] = "wrong-profile"
    paths.prepared.write_text(json.dumps(prepared) + "\n", encoding="utf-8")
    client.phase = "completed"
    with pytest.raises(ValueError, match="PIQD solver_profile crossed"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)


def test_confirmed_state_record_cannot_cross_root(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    state = json.loads(paths.state.read_text(encoding="utf-8"))
    state["confirmation"]["response"]["blob_hash"] = "0" * 64
    paths.state.write_text(json.dumps(state) + "\n", encoding="utf-8")
    client.phase = "completed"
    with pytest.raises(ValueError, match="confirmation identity drifted"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)


def test_live_solver_backend_is_bound_to_registry_solver(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    client.solvers = lambda: {
        "daemon": client.version()["daemon"],
        "solvers": [
            {
                "name": spec.ingress.solver_name,
                "sha256": spec.ingress.solver_sha256,
                "solver_signature": spec.ingress.solver_signature,
                "protocol_version": spec.ingress.daemon_protocol_version,
                "solver": "wrong-backend",
                "lane": "sat",
                "usable": True,
            }
        ],
    }
    with pytest.raises(ValueError, match="solver backend drifted"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert client.submit_calls == 0


def test_submit_exception_leaves_intent_and_restart_never_resubmits(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    calls = 0

    def lose_response(*_args: object, **_kwargs: object) -> dict[str, Any]:
        nonlocal calls
        calls += 1
        assert paths.intent.is_file()
        raise RuntimeError("injected ambiguous submit failure")

    client.submit = lose_response
    with pytest.raises(RuntimeError, match="ambiguous submit failure"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.intent.is_file()
    assert not paths.prepared.exists() and not paths.state.exists()

    with pytest.raises(runner.UnreconciledPrepareError, match="refusing resubmit"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert calls == 1


def test_submit_uses_held_snapshots_after_source_path_replacement(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    original_submit = client.submit

    def replace_sources_then_submit(
        cnf: Path,
        manifest: Path,
        **kwargs: str,
    ) -> dict[str, Any]:
        paths.ingress.export.child.write_bytes(b"attacker root\n")
        paths.ingress.manifest.write_bytes(b"attacker manifest\n")
        return original_submit(cnf, manifest, **kwargs)

    client.submit = replace_sources_then_submit
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["phase"] == "confirmed"
    assert paths.ingress.export.child.read_bytes() == b"attacker root\n"


@pytest.mark.parametrize("artifact", ["cnf", "manifest"])
def test_preconfirm_remote_input_tamper_fails_closed(
    tmp_path: Path, artifact: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    if artifact == "cnf":
        client.stored_root = root + b"c tampered\n"
    else:
        client.stored_manifest = client.manifest + b" "
    with pytest.raises(ValueError, match="stored artifact"):
        runner.start(client, paths, spec, ingress_validator=_validated)
    assert paths.intent.is_file()
    assert not paths.prepared.exists() and not paths.state.exists()


@pytest.mark.parametrize("daemon_sha256", [None, "0" * 64])
def test_terminal_result_requires_deciding_daemon_build(
    tmp_path: Path, daemon_sha256: str | None
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    original_status = client.status

    def terminal_status(job_id: str) -> dict[str, Any]:
        payload = original_status(job_id)
        if daemon_sha256 is None:
            payload.pop("daemon_sha256", None)
        else:
            payload["daemon_sha256"] = daemon_sha256
        return payload

    client.status = terminal_status
    with pytest.raises(ValueError, match="daemon"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists() and not paths.model.exists()


@pytest.mark.parametrize("artifact", ["cnf", "manifest"])
def test_final_remote_input_tamper_fails_before_model_publication(
    tmp_path: Path, artifact: str
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    if artifact == "cnf":
        client.stored_root = root + b"c tampered\n"
    else:
        client.stored_manifest = client.manifest + b" "
    with pytest.raises(ValueError, match="stored artifact"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert not paths.final.exists() and not paths.model.exists()


def test_sat_replay_uses_held_remote_cnf_after_local_path_swap(
    tmp_path: Path,
) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    swapped = False

    def swap_after_local_validation(_job_id: str) -> dict[str, Any]:
        nonlocal swapped
        if not swapped:
            paths.ingress.export.child.write_bytes(b"attacker root\n")
            swapped = True
        return client._status("completed", result="SAT")

    client.status = swap_after_local_validation
    report = runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert report["model_replay"] == {"clauses_checked": 2, "satisfies_all": True}
    assert paths.ingress.export.child.read_bytes() == b"attacker root\n"


def test_subprocess_adapter_delegates_prepare_with_exact_core_limit(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    client = runner.SubprocessPiqdClient()
    observed: dict[str, Any] = {}

    def fake_prepare(
        cnf: Path,
        manifest: Path,
        *,
        backend: str,
        profile: str,
        project: str,
        requested_core_limit: int,
    ) -> dict[str, Any]:
        observed.update(
            {
                "cnf": cnf,
                "manifest": manifest,
                "backend": backend,
                "profile": profile,
                "project": project,
                "requested_core_limit": requested_core_limit,
            }
        )
        return {"existing": True}

    monkeypatch.setattr(runner, "_stream_prepare_cnf", fake_prepare)
    result = client.submit(
        Path("/dev/fd/17"),
        Path("/dev/fd/18"),
        backend="cadical",
        profile="sat",
        project="fixture",
        requested_core_limit=runner.REQUESTED_CORE_LIMIT,
    )
    assert result == {"existing": True}
    assert observed["cnf"] == Path("/dev/fd/17")
    assert observed["manifest"] == Path("/dev/fd/18")
    assert observed["backend"] == "cadical"
    assert observed["profile"] == "sat"
    assert observed["project"] == "fixture"
    assert observed["requested_core_limit"] == runner.REQUESTED_CORE_LIMIT


def test_subprocess_adapter_model_check_is_strict_and_fail_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    client = runner.SubprocessPiqdClient()
    observed: dict[str, Any] = {}

    class Response:
        def __enter__(self) -> Self:
            return self

        def __exit__(self, *_args: object) -> None:
            return None

        def read(self) -> bytes:
            return b'{"job_id":"job/1"}'

    def fake_urlopen(request: Any, *, timeout: int) -> Response:
        observed.update({"url": request.full_url, "method": request.method, "timeout": timeout})
        return Response()

    monkeypatch.setattr(runner.urllib.request, "urlopen", fake_urlopen)
    assert client.model_check("job/1") == {"job_id": "job/1"}
    assert observed == {
        "url": "http://127.0.0.1:7272/jobs/job%2F1/model-check",
        "method": "GET",
        "timeout": 900,
    }

    def reject_urlopen(_request: Any, *, timeout: int) -> Response:
        raise runner.urllib.error.HTTPError(
            "http://127.0.0.1:7272/jobs/job%2F1/model-check",
            404,
            "missing",
            {},
            None,
        )

    monkeypatch.setattr(runner.urllib.request, "urlopen", reject_urlopen)
    with pytest.raises(runner.urllib.error.HTTPError):
        client.model_check("job/1")


def test_subprocess_adapter_status_requests_terminal_log_digest(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    client = runner.SubprocessPiqdClient()
    observed: dict[str, Any] = {}

    class Response:
        def __enter__(self) -> Self:
            return self

        def __exit__(self, *_args: object) -> None:
            return None

        def read(self) -> bytes:
            return b'{"id":"job/1","log_sha256":"abc"}'

    def fake_urlopen(request: Any, *, timeout: int) -> Response:
        observed.update({"url": request.full_url, "method": request.method, "timeout": timeout})
        return Response()

    monkeypatch.setattr(runner.urllib.request, "urlopen", fake_urlopen)
    assert client.status("job/1") == {"id": "job/1", "log_sha256": "abc"}
    assert observed == {
        "url": "http://127.0.0.1:7272/jobs/job%2F1?log_digest=true",
        "method": "GET",
        "timeout": 900,
    }


def test_unprovisioned_runner_refuses_before_client() -> None:
    unprovisioned = replace(runner.PRODUCTION_RUNNER_SPEC, manifest_sha256=None)
    assert not unprovisioned.provisioned
    with pytest.raises(export_validation.UnprovisionedError):
        runner.expected_identity_hash(unprovisioned)


def test_production_runner_is_provisioned() -> None:
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
