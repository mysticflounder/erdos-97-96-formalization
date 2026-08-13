"""Focused tests for the child33 immutable ingress and runner adapter."""

from __future__ import annotations

import json
import sys
from dataclasses import replace
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import export_exact17_thirty_third_root as child33_export
import run_piqd_exact17_thirty_third_root as runner
import validate_exact17_thirty_second_model_refinements_export as export_validation
import validate_exact17_thirty_second_model_refinements_ingress as ingress


def test_production_identity_matches_piqd_raw_dimacs_v1_contract() -> None:
    assert runner.expected_identity_hash() == (
        "031ddc62b4d41ef0cfc1767cc43f4be2d9a9a7d0cf85784d72c9bfa5eb9c367f"
    )


def _write_json(path: Path, payload: object) -> None:
    path.write_text(json.dumps(payload, sort_keys=True) + "\n", encoding="utf-8")


def _fixture(tmp_path: Path) -> tuple[ingress.IngressPaths, ingress.IngressSpec]:
    parent = tmp_path / "parent.cnf"
    parent.write_text("p cnf 308 2\n1 0\n2 0\n", encoding="ascii")
    child = tmp_path / "child.cnf"
    suffix = "".join(
        " ".join(map(str, clause)) + " 0\n"
        for clause in export_validation.expected_suffix()
    )
    child.write_text("p cnf 308 10\n1 0\n2 0\n" + suffix, encoding="ascii")
    lean_root = tmp_path / "root.lean"
    lean_export = tmp_path / "export.lean"
    two_circle = tmp_path / "two-circle.lean"
    kalmanson = tmp_path / "kalmanson.lean"
    lean_root.write_text("root\n", encoding="utf-8")
    lean_export.write_text("export\n", encoding="utf-8")
    two_circle.write_text("two-circle\n", encoding="utf-8")
    kalmanson.write_text("kalmanson\n", encoding="utf-8")
    receipt_path = tmp_path / "receipt.json"
    export_paths = child33_export.ExportPaths(
        parent=parent,
        lean_root=lean_root,
        lean_export=lean_export,
        child=child,
        receipt=receipt_path,
        two_circle=two_circle,
        kalmanson=kalmanson,
    )
    export_spec = export_validation.ExportSpec(
        variables=308,
        parent_clauses=2,
        new_clauses=8,
        parent_sha256=export_validation.sha256_file(parent),
        child_sha256=export_validation.sha256_file(child),
        child_bytes=child.stat().st_size,
        publication_state="PROVISIONED",
        lean_root_path=str(lean_root.resolve()),
        lean_export_path=str(lean_export.resolve()),
        two_circle_path=str(two_circle.resolve()),
        kalmanson_path=str(kalmanson.resolve()),
        parent_path=str(parent.resolve()),
        child_path=str(child.resolve()),
        receipt_path=str(receipt_path.resolve()),
        lean_root_sha256=export_validation.sha256_file(lean_root),
        lean_export_sha256=export_validation.sha256_file(lean_export),
        two_circle_sha256=export_validation.sha256_file(two_circle),
        kalmanson_sha256=export_validation.sha256_file(kalmanson),
    )
    validation = export_validation.validate_export(parent, child, spec=export_spec)
    receipt = {
        "schema": ingress.RECEIPT_SCHEMA,
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "immutability": "exclusive-hard-link-and-exclusive-receipt/v1",
        "parent": {"path": str(parent.resolve()), "sha256": export_spec.parent_sha256},
        "child": {
            "path": str(child.resolve()),
            "sha256": export_spec.child_sha256,
            "bytes": export_spec.child_bytes,
            "variables": 308,
            "clauses": 10,
        },
        "lean": {
            "root": {"path": str(lean_root.resolve()), "sha256": export_validation.sha256_file(lean_root)},
            "export": {"path": str(lean_export.resolve()), "sha256": export_validation.sha256_file(lean_export)},
        },
        "source_modules": {
            "two_circle": {
                "path": str(two_circle.resolve()),
                "sha256": export_validation.sha256_file(two_circle),
            },
            "kalmanson": {
                "path": str(kalmanson.resolve()),
                "sha256": export_validation.sha256_file(kalmanson),
            },
        },
        "validation": validation,
    }
    _write_json(receipt_path, receipt)
    parent_manifest = tmp_path / "parent-manifest.json"
    _write_json(parent_manifest, {"schema": "parent-test/v1"})
    parent_manifest_sha = export_validation.sha256_file(parent_manifest)
    daemon_build_receipt = tmp_path / "piqd-build-receipt.txt"
    daemon_build_receipt.write_text("clean child33 PIQD build\n", encoding="utf-8")
    paths = ingress.IngressPaths(
        export=export_paths,
        parent_manifest=parent_manifest,
        daemon_build_receipt=daemon_build_receipt,
        manifest=tmp_path / "ingress-manifest.json",
    )
    spec = ingress.IngressSpec(
        export=export_spec,
        parent_manifest_sha256=parent_manifest_sha,
        daemon_sha256="d" * 64,
        daemon_source_commit="c" * 40,
        daemon_build_receipt_sha256=export_validation.sha256_file(
            daemon_build_receipt
        ),
        daemon_protocol_version=1,
        solver_name="cadical",
        solver_sha256="s" * 64,
        solver_signature="test-signature",
    )
    return paths, spec


def test_production_child33_ingress_and_runner_are_pinned() -> None:
    assert ingress.PRODUCTION_INGRESS_SPEC.provisioned
    assert runner.PRODUCTION_RUNNER_SPEC.provisioned
    assert runner.PRODUCTION_RUNNER_SPEC.manifest_sha256 == (
        "1f802e69fc382ba262cb54a9b21bee3b62b4c53cf6cbfaff837181cd9444fcfd"
    )
    assert runner.PRODUCTION_RUNNER_SPEC.daemon_version == "0.1.0"


def test_child33_runner_binds_pinned_root_and_replays_model(tmp_path: Path) -> None:
    spec = runner.PRODUCTION_RUNNER_SPEC
    assert spec.root_sha256 == "775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9"
    assert (spec.root_bytes, spec.variables, spec.clauses) == (291_620_468, 308, 5_847_248)
    assert spec.ingress.export.parent_sha256 == "c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d"
    assert spec.ingress.export.child_sha256 == spec.root_sha256
    assert spec.provisioned

    cnf = tmp_path / "tiny.cnf"
    cnf.write_text("p cnf 2 2\n1 0\n-2 0\n", encoding="ascii")
    tiny_spec = replace(spec, variables=2, clauses=2)
    assert runner.replay_model(cnf, [1, -2], tiny_spec) == {
        "clauses_checked": 2,
        "satisfies_all": True,
    }
    with pytest.raises(ValueError):
        runner.replay_model(cnf, [1, 2], tiny_spec)
    with pytest.raises(ValueError, match="artifact_namespace"):
        runner.replay_model(cnf, [1, -2], replace(tiny_spec, artifact_namespace="child32"))


def test_ingress_replays_receipt_and_refuses_overwrite(tmp_path: Path) -> None:
    paths, spec = _fixture(tmp_path)
    emitted = ingress.emit_ingress(paths, spec=spec)
    assert emitted["status"] == "PASS"
    manifest_sha = export_validation.sha256_file(paths.manifest)
    checked = ingress.validate_ingress(
        paths, spec=spec, expected_manifest_sha256=manifest_sha
    )
    assert checked["status"] == "PASS"
    with pytest.raises(FileExistsError):
        ingress.emit_ingress(paths, spec=spec)


def test_receipt_source_modules_and_schema_are_authenticated(tmp_path: Path) -> None:
    paths, spec = _fixture(tmp_path)
    ingress.emit_ingress(paths, spec=spec)
    receipt = json.loads(paths.export.receipt.read_text(encoding="utf-8"))
    receipt["source_modules"]["kalmanson"]["sha256"] = "0" * 64
    _write_json(paths.export.receipt, receipt)
    with pytest.raises(ValueError, match="source module"):
        ingress.validate_ingress(paths, spec=spec)
    receipt["source_modules"]["kalmanson"]["sha256"] = spec.export.kalmanson_sha256
    receipt["unexpected"] = True
    _write_json(paths.export.receipt, receipt)
    with pytest.raises(ValueError, match="schema"):
        ingress.validate_ingress(paths, spec=spec)


def test_daemon_build_receipt_and_source_commit_are_authenticated(
    tmp_path: Path,
) -> None:
    paths, spec = _fixture(tmp_path)
    ingress.emit_ingress(paths, spec=spec)
    paths.daemon_build_receipt.write_text("mutated build\n", encoding="utf-8")
    with pytest.raises(ValueError, match="build receipt"):
        ingress.validate_ingress(paths, spec=spec)

    source_commit_dir = tmp_path / "source-commit"
    source_commit_dir.mkdir()
    paths, spec = _fixture(source_commit_dir)
    ingress.emit_ingress(paths, spec=spec)
    changed = replace(spec, daemon_source_commit="e" * 40)
    with pytest.raises(ValueError, match="identity or policy"):
        ingress.validate_ingress(paths, spec=changed)


def test_child33_timeout_binding_rejects_mutated_status(tmp_path: Path) -> None:
    _paths, ingress_spec = _fixture(tmp_path)
    spec = runner.RunnerSpec(
        ingress=ingress_spec,
        manifest_sha256=ingress_spec.parent_manifest_sha256,
        root_sha256=ingress_spec.export.child_sha256,
        root_bytes=ingress_spec.export.child_bytes,
        variables=308,
        clauses=10,
        artifact_namespace="child33",
    )
    status = {
        "id": "job",
        "identity_hash": runner.expected_identity_hash(spec),
        "cnf_blob_hash": spec.root_sha256,
        "producer_manifest_hash": spec.manifest_sha256,
        "producer_manifest_blob_hash": spec.manifest_sha256,
        "project": spec.project,
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "requested_core_limit": runner.REQUESTED_CORE_LIMIT,
        "status": "prepared",
        "run_epoch": 0,
        "recovery_action": None,
        "timeout_s": spec.timeout_s,
        "march_timeout_s": spec.march_timeout_s,
    }
    assert runner._child32._check_job(status, "job", spec, "prepared") == "prepared"
    status["timeout_s"] += 1
    with pytest.raises(ValueError, match="timeout"):
        runner._child32._check_job(status, "job", spec, "prepared")


def test_child33_timeout_request_propagates(monkeypatch: pytest.MonkeyPatch) -> None:
    observed: dict[str, int] = {}

    def fake_prepare(
        cnf: Path,
        manifest: Path,
        *,
        backend: str,
        profile: str,
        project: str,
        requested_core_limit: int,
        timeout_s: int,
        march_timeout_s: int,
    ) -> dict[str, object]:
        del cnf, manifest, backend, profile, project, requested_core_limit
        observed.update(timeout_s=timeout_s, march_timeout_s=march_timeout_s)
        return {"existing": True}

    monkeypatch.setattr(runner._child32, "_stream_prepare_cnf", fake_prepare)
    client = runner._child32.SubprocessPiqdClient()
    client.submit(
        Path("/dev/fd/17"),
        Path("/dev/fd/18"),
        backend="cadical",
        profile="sat",
        project="child33",
        requested_core_limit=runner.REQUESTED_CORE_LIMIT,
        timeout_s=123,
        march_timeout_s=456,
    )
    assert observed == {"timeout_s": 123, "march_timeout_s": 456}


def test_child33_legacy_reconciliation_is_an_explicit_opt_in(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    observed: dict[str, object] = {}

    def fake_reconcile(*args: object, **kwargs: object) -> dict[str, str]:
        observed["args"] = args
        observed["kwargs"] = kwargs
        return {"phase": "confirmed"}

    monkeypatch.setattr(runner._child32, "reconcile_prepared_job", fake_reconcile)
    payload = runner.reconcile_legacy_identity_prepared_job(
        object(),
        "job",
        runner.PRODUCTION_RUNNER_PATHS,
        runner.PRODUCTION_RUNNER_SPEC,
        ingress_validator=ingress.validate_ingress,
    )
    assert payload == {"phase": "confirmed"}
    assert observed["kwargs"] == {
        "ingress_validator": ingress.validate_ingress,
        "allow_legacy_intent_migration": True,
    }


def test_transaction_lock_rejects_symlink(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.write_text("target\n", encoding="utf-8")
    link = tmp_path / "runner.lock"
    link.symlink_to(target)
    with pytest.raises(OSError), runner._child32._transaction_lock(link):
        pass
    regular = tmp_path / "regular.lock"
    with runner._child32._transaction_lock(regular):
        assert regular.is_file()


def test_transaction_lock_rejects_swap_before_yield(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    lock = tmp_path / "runner.lock"
    replacement = tmp_path / "replacement.lock"
    replacement.write_text("replacement\n", encoding="utf-8")
    original_stat = runner._child32.os.stat
    calls = 0

    def hostile_stat(path: object, *args: object, **kwargs: object):
        nonlocal calls
        calls += 1
        if Path(path) == lock and calls == 2:
            replacement.replace(lock)
        return original_stat(path, *args, **kwargs)

    monkeypatch.setattr(runner._child32.os, "stat", hostile_stat)
    with pytest.raises(ValueError, match="identity"), runner._child32._transaction_lock(lock):
        pass


def test_source_hash_rejects_replacement_during_hash(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    source = tmp_path / "source.lean"
    replacement = tmp_path / "replacement.lean"
    source.write_text("source\n", encoding="utf-8")
    replacement.write_text("replacement\n", encoding="utf-8")
    record = {"path": str(source.resolve()), "sha256": export_validation.sha256_file(source)}
    original_fstat = ingress.os.fstat
    calls = 0

    def hostile_fstat(fd: int):
        nonlocal calls
        calls += 1
        result = original_fstat(fd)
        if calls == 2:
            replacement.replace(source)
        return result

    monkeypatch.setattr(ingress.os, "fstat", hostile_fstat)
    with pytest.raises(ValueError, match="changed"):
        ingress._check_hash_record(record, source, "source")
