from __future__ import annotations

import hashlib
import json
import subprocess
import sys
from dataclasses import replace
from pathlib import Path
from typing import Any

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
        return {
            "response": {
                "existing": self.existing,
                "cnf_blob_hash": self.spec.root_sha256,
                "num_vars": self.spec.variables,
                "num_clauses": self.spec.clauses,
                "identity_hash": runner.expected_identity_hash(self.spec),
                "job_id": "job-child32",
                "producer_manifest_hash": self.spec.manifest_sha256,
                "project": self.spec.project,
                "backend": self.spec.ingress.backend,
                "solver_profile": self.spec.ingress.solver_profile,
            },
            "confirmation_code": "confirm-child32",
        }

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
            "status": phase,
        }
        if result is not None:
            payload["result"] = result
            payload["daemon_sha256"] = self.spec.ingress.daemon_sha256
        return payload

    def status(self, _job_id: str) -> dict[str, Any]:
        if self.phase == "completed":
            return self._status("completed", result="SAT")
        return self._status(self.phase)

    def retrieve_cnf(self, _job_id: str, destination: Path) -> None:
        destination.write_bytes(self.stored_root)

    def retrieve_blob(
        self, _job_id: str, blob_hash: str, destination: Path
    ) -> None:
        assert blob_hash == self.spec.manifest_sha256
        destination.write_bytes(self.stored_manifest)

    def confirm(self, code: str) -> dict[str, Any]:
        self.confirm_calls += 1
        assert code == "confirm-child32"
        if self.confirm_failure == "before_effect":
            raise RuntimeError("injected pre-confirm crash")
        self.phase = "confirmed"
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
            "num_assigned": 3,
            "cnf_blob_hash": self.spec.root_sha256,
            "producer_manifest_hash": self.spec.manifest_sha256,
            "identity_hash": runner.expected_identity_hash(self.spec),
            "assignment": [1, 2, 3],
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


def test_start_and_sat_finalize_bind_every_identity(tmp_path: Path) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    state = runner.start(client, paths, spec, ingress_validator=_validated)
    assert state["phase"] == "confirmed"
    assert state["binding"]["solver_profile"] == "sat"
    client.phase = "completed"
    report = runner.finalize(client, paths, spec, ingress_validator=_validated)
    assert report["result"] == "SAT"
    assert report["model_replay"] == {"clauses_checked": 2, "satisfies_all": True}
    assert paths.model.is_file() and paths.final.is_file()


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
        "cnf_blob_hash",
        "producer_manifest_hash",
        "identity_hash",
        "project",
        "backend",
        "solver_profile",
        "completion_identity_hash",
    ],
)
def test_model_metadata_cannot_cross_child32_binding(tmp_path: Path, field: str) -> None:
    paths, spec, root = _fixture(tmp_path)
    client = FakeClient(root, spec)
    runner.start(client, paths, spec, ingress_validator=_validated)
    client.phase = "completed"
    client.model = lambda _job_id: {
        "job_id": "job-child32",
        "result": "SAT",
        "num_assigned": 3,
        "cnf_blob_hash": spec.root_sha256,
        "producer_manifest_hash": spec.manifest_sha256,
        "identity_hash": runner.expected_identity_hash(spec),
        "assignment": [1, 2, 3],
        field: "wrong",
    }
    with pytest.raises(ValueError, match=f"(model|PIQD) {field}"):
        runner.finalize(client, paths, spec, ingress_validator=_validated)


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


def test_subprocess_adapter_accepts_existing_without_confirmation_code_and_passes_fds(
) -> None:
    client = runner.SubprocessPiqdClient()
    observed: dict[str, Any] = {}

    def fake_run(
        command: list[str], *, pass_fds: tuple[int, ...] = ()
    ) -> subprocess.CompletedProcess[str]:
        observed.update({"command": command, "pass_fds": pass_fds})
        return subprocess.CompletedProcess(
            command,
            0,
            stdout=json.dumps({"existing": True}),
            stderr="",
        )

    client._run = fake_run
    result = client.submit(
        Path("/dev/fd/17"),
        Path("/dev/fd/18"),
        backend="cadical",
        profile="sat",
        project="fixture",
    )
    assert result == {
        "response": {"existing": True},
        "confirmation_code": None,
    }
    assert observed["pass_fds"] == (17, 18)


def test_unprovisioned_runner_refuses_before_client() -> None:
    unprovisioned = replace(runner.PRODUCTION_RUNNER_SPEC, manifest_sha256=None)
    assert not unprovisioned.provisioned
    with pytest.raises(export_validation.UnprovisionedError):
        runner.expected_identity_hash(unprovisioned)


def test_production_runner_is_provisioned() -> None:
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
