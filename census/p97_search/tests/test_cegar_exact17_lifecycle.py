from __future__ import annotations

import hashlib
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import cegar_exact17_lifecycle as lifecycle
from scripts import export_exact17_thirty_eighth_root as child38_exporter
from scripts import run_piqd_exact17_thirty_eighth_root as child38
from scripts import test_run_piqd_exact17_thirty_second_root as base_test
from scripts import (
    validate_exact17_thirty_seventh_model_refinements_export as child38_export_validation,
)
from scripts import (
    validate_exact17_thirty_seventh_model_refinements_ingress as child38_ingress,
)


class _Child38FakeClient(base_test.FakeClient):
    job_id = "job-child38"

    def __init__(self, root: bytes, spec: child38.RunnerSpec) -> None:
        super().__init__(root, child38._lifecycle_spec(spec))
        self.model_job_id = self.job_id

    def submit(self, *args: Any, **kwargs: Any) -> dict[str, Any]:
        response = super().submit(*args, **kwargs)
        response["job_id"] = self.job_id
        return response

    def _status(self, phase: str, *, result: str | None = None) -> dict[str, Any]:
        response = super()._status(phase, result=result)
        response["id"] = self.job_id
        return response

    def confirm(self, job_id: str) -> dict[str, Any]:
        self.confirm_calls += 1
        assert job_id == self.job_id
        if self.confirm_failure == "before_effect":
            raise RuntimeError("injected pre-confirm crash")
        self.phase = "confirmed"
        if self.confirm_failure == "conflict":
            raise child38.ConfirmConflictError("injected HTTP 409")
        if self.confirm_failure == "after_effect":
            raise RuntimeError("injected post-confirm crash")
        return {
            "job_id": self.job_id,
            "blob_hash": self.spec.root_sha256,
            "status": "confirmed",
        }


def _fixture(
    tmp_path: Path,
) -> tuple[child38.RunnerPaths, child38.RunnerSpec, _Child38FakeClient]:
    root = b"p cnf 3 2\n1 0\n2 3 0\n"
    child = tmp_path / "child.cnf"
    child.write_bytes(root)
    manifest = tmp_path / "ingress.json"
    manifest.write_bytes(b'{"fixture":"child38"}\n')
    empty = tmp_path / "empty"
    empty.write_text("fixture\n", encoding="utf-8")
    export_paths = child38_exporter.ExportPaths(
        parent=empty,
        model=empty,
        lean_root=empty,
        lean_export=empty,
        child=child,
        receipt=empty,
    )
    export_spec = child38_export_validation.ExportSpec(
        variables=3,
        parent_clauses=0,
        new_clauses=2,
        parent_sha256="a" * 64,
        child_sha256=hashlib.sha256(root).hexdigest(),
        child_bytes=len(root),
        model_sha256="b" * 64,
        publication_state="PROVISIONED",
    )
    ingress_paths = child38_ingress.IngressPaths(
        export=export_paths,
        parent_manifest=empty,
        daemon_build_receipt=empty,
        manifest=manifest,
    )
    ingress_spec = child38_ingress.IngressSpec(
        export=export_spec,
        parent_manifest_sha256="c" * 64,
    )
    paths = child38.RunnerPaths(
        ingress=ingress_paths,
        intent=tmp_path / "intent.json",
        prepared=tmp_path / "prepared.json",
        state=tmp_path / "state.json",
        final=tmp_path / "final.json",
        model=tmp_path / "model.json",
        solver_log=tmp_path / "solver.log",
        lock=tmp_path / "runner.lock",
    )
    spec = child38.RunnerSpec(
        ingress=ingress_spec,
        manifest_sha256=hashlib.sha256(manifest.read_bytes()).hexdigest(),
        root_sha256=hashlib.sha256(root).hexdigest(),
        root_bytes=len(root),
        variables=3,
        clauses=2,
    )
    client = _Child38FakeClient(root, spec)
    client.manifest = manifest.read_bytes()
    client.stored_manifest = client.manifest
    client.attestation_overrides.update(
        {
            "completed_at": 123456789,
            "proof_blob_hash": None,
            "kept_cnf_blob_hash": None,
            "proof_format": None,
            "model_blob_hash": None,
        }
    )
    return paths, spec, client


def test_closed_profile_plan_is_an_honest_compatibility_boundary() -> None:
    plan = lifecycle.lifecycle_plan()
    assert plan == {
        "schema": lifecycle.LIFECYCLE_SCHEMA,
        "profile": "exact17-child38",
        "project": "erdos-97-96-exact17-child38",
        "artifact_namespace": "child38",
        "execution_mode": "LEGACY_COMPATIBLE_PIQD_LIFECYCLE",
        "compatibility_route": "scripts/run_piqd_exact17_thirty_eighth_root.py",
        "native_shared_engine": False,
        "workers": 1,
        "sequential": True,
        "local_fallback": False,
        "proof_or_theorem_claim": False,
        "commands": [
            "validate-local",
            "live-identity",
            "start",
            "reconcile",
            "finalize",
        ],
        "custody": [
            "intent",
            "prepared",
            "state",
            "final",
            "model",
            "solver-log",
            "lock",
        ],
    }


def test_cleanup_report_retains_every_current_boundary() -> None:
    report = lifecycle.cleanup_eligibility()
    assert report["status"] == "RETAIN"
    assert report["eligible"] is False
    assert report["deletion_performed"] is False
    assert report["blockers"] == [
        "native shared lifecycle replacement is not implemented",
        "fresh native campaign and semantic validation are not complete",
        "successor admission is not complete",
        "rollback drill is not complete",
        "legacy caller count is not proven zero",
    ]
    assert report["protected"] == [
        "Child38 lifecycle and custody artifacts",
        "Child39 frozen shadow and successor inputs",
        "Child32 base lifecycle implementation and historical evidence",
    ]


class _StringSubclass(str):
    pass


@pytest.mark.parametrize(
    "profile", ["", "exact17-child39", _StringSubclass("exact17-child38")]
)
def test_profile_boundary_requires_the_exact_builtin_child38_name(
    profile: str,
) -> None:
    with pytest.raises(lifecycle.Exact17LifecycleError, match="exact builtin string"):
        lifecycle.require_profile(profile)


@pytest.mark.parametrize("job_id", ["", 1, True, _StringSubclass("job-child32")])
def test_reconcile_rejects_nonexact_job_ids_before_delegation(
    job_id: object,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        child38,
        "reconcile_prepared_job",
        lambda *args, **kwargs: pytest.fail("legacy reconciliation was reached"),
    )
    with pytest.raises(lifecycle.Exact17LifecycleError, match="job_id"):
        lifecycle.reconcile(object(), job_id)  # type: ignore[arg-type]


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("project", "erdos-97-96-exact17-child39", "project crossed"),
        ("artifact_namespace", _StringSubclass("child38"), "namespace crossed"),
    ],
)
def test_child38_spec_cannot_cross_profile_before_delegation(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    field: str,
    value: str,
    message: str,
) -> None:
    paths, spec, _client = _fixture(tmp_path)
    monkeypatch.setattr(
        child38,
        "validate_local",
        lambda *args, **kwargs: pytest.fail("legacy validation was reached"),
    )
    with pytest.raises(lifecycle.Exact17LifecycleError, match=message):
        lifecycle.validate_local(
            paths=paths,
            spec=replace(spec, **{field: value}),
            ingress_validator=base_test._validated,
        )


def test_reconcile_rejects_crossed_ordinary_job_id(tmp_path: Path) -> None:
    paths, spec, client = _fixture(tmp_path)
    lifecycle.start(
        client,
        paths=paths,
        spec=spec,
        ingress_validator=base_test._validated,
    )
    paths.prepared.unlink()
    paths.state.unlink()
    with pytest.raises(ValueError, match="crossed.*identity"):
        lifecycle.reconcile(
            client,
            "job-child39",
            paths=paths,
            spec=spec,
            ingress_validator=base_test._validated,
        )


def test_child38_start_and_sat_finalize_use_the_hardened_lifecycle(
    tmp_path: Path,
) -> None:
    paths, spec, client = _fixture(tmp_path)
    state = lifecycle.start(
        client,
        paths=paths,
        spec=spec,
        ingress_validator=base_test._validated,
    )
    assert state["phase"] == "confirmed"
    assert state["schema"] == "p97-exact17-child38-piqd-state/v3"
    assert state["binding"]["timeout_s"] == spec.timeout_s
    assert state["binding"]["march_timeout_s"] == spec.march_timeout_s
    assert client.submit_calls == 1 and client.confirm_calls == 1

    client.phase = "completed"
    report = lifecycle.finalize(
        client,
        paths=paths,
        spec=spec,
        ingress_validator=base_test._validated,
    )
    assert report["result"] == "SAT"
    assert report["model_replay"] == {"clauses_checked": 2, "satisfies_all": True}
    assert paths.final.is_file() and paths.model.is_file()


def test_prepare_response_loss_requires_explicit_reconciliation_without_retry(
    tmp_path: Path,
) -> None:
    paths, spec, client = _fixture(tmp_path)
    original_submit = client.submit

    def lose_prepare_response(*args: Any, **kwargs: Any) -> dict[str, Any]:
        original_submit(*args, **kwargs)
        raise RuntimeError("injected lost prepare response")

    client.submit = lose_prepare_response
    with pytest.raises(RuntimeError, match="lost prepare response"):
        lifecycle.start(
            client,
            paths=paths,
            spec=spec,
            ingress_validator=base_test._validated,
        )
    assert paths.intent.is_file()
    assert not paths.prepared.exists() and not paths.state.exists()

    client.submit = original_submit
    state = lifecycle.reconcile(
        client,
        "job-child38",
        paths=paths,
        spec=spec,
        ingress_validator=base_test._validated,
    )
    assert state["phase"] == "confirmed"
    assert state["prepared_record"]["submitted"] is None
    assert (
        state["prepared_record"]["submission_mode"]
        == "reconciled_after_prepare_response_failure"
    )
    assert client.submit_calls == 1 and client.confirm_calls == 1
