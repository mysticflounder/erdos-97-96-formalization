"""Adversarial, non-provisioning tests for the exact-17 Child44 chain."""

from __future__ import annotations

import hashlib
import json
import subprocess
import sys
from dataclasses import replace
from pathlib import Path

import export_exact17_forty_fourth_root as exporter
import pytest
import run_piqd_exact17_forty_fourth_root as runner
import validate_exact17_forty_fourth_ingress as ingress
from validate_exact17_forty_fourth_ingress import (
    PRODUCTION_INGRESS_SPEC,
    emit_ingress,
    validate_ingress,
)
from validate_exact17_forty_fourth_model_refinements_export import (
    CHILD_CLAUSES,
    EXPECTED_MODEL_CUT,
    EXPECTED_MODEL_CUT_ZERO_BASED,
    NEW_CLAUSES,
    PRODUCTION_SPEC,
    WEIGHTED_PROBE,
    UnprovisionedError,
    _parent_subsumptions,
    reject_weighted_successor,
)

ROOT = Path(__file__).resolve().parents[1]


def test_exact_child44_boundary_and_namespace() -> None:
    assert CHILD_CLAUSES == 5_848_820
    assert EXPECTED_MODEL_CUT == tuple(range(3, 228, 4))
    assert EXPECTED_MODEL_CUT_ZERO_BASED == tuple(range(2, 228, 4))
    assert runner.PRODUCTION_RUNNER_SPEC.artifact_namespace == "child44"
    for path in (runner.PRODUCTION_RUNNER_PATHS.intent, runner.PRODUCTION_RUNNER_PATHS.prepared, runner.PRODUCTION_RUNNER_PATHS.state, runner.PRODUCTION_RUNNER_PATHS.final, runner.PRODUCTION_RUNNER_PATHS.solver_log, runner.PRODUCTION_RUNNER_PATHS.lock):
        assert "child43" not in str(path)
        assert "child44" in str(path)


def test_weighted_probe_is_explicitly_rejected() -> None:
    suffix = [(-1,)] * NEW_CLAUSES
    for weighted, index in zip(WEIGHTED_PROBE, (24, 25, 26, 27, 140, 141, 142, 143)):
        suffix[index] = weighted
    with pytest.raises(UnprovisionedError, match="weighted eight-clause probe"):
        reject_weighted_successor(tuple(suffix))


def test_parent_subsumption_index_is_strict_and_model_cut_safe() -> None:
    parent = ((1,), (2, 3), (4, 5, 6))
    suffix = ((1, 2), (2, 3), (4, 5, 6, 7))
    matches = _parent_subsumptions(parent, suffix)
    assert matches[0] == (0,)
    assert matches[1] == (1,)
    assert matches[2] == (2,)


def test_unprovisioned_export_does_not_touch_isolated_paths(tmp_path: Path) -> None:
    paths = exporter.ExportPaths(
        parent=tmp_path / "parent.cnf",
        model=tmp_path / "model.json",
        lean_export=tmp_path / "export.lean",
        child=tmp_path / "child.cnf",
        receipt=tmp_path / "receipt.json",
    )
    with pytest.raises(UnprovisionedError):
        exporter.export_child44(paths, spec=type(PRODUCTION_SPEC)(publication_state="UNPROVISIONED", child_sha256=None, child_bytes=None, lean_root_sha256=None, lean_export_sha256=None, analysis_sha256=None))
    assert not paths.child.exists()
    assert not paths.receipt.exists()


def test_unprovisioned_ingress_does_not_touch_isolated_paths(tmp_path: Path) -> None:
    paths = exporter.ExportPaths(child=tmp_path / "child.cnf", receipt=tmp_path / "receipt.json")
    ingress_paths = runner.PRODUCTION_RUNNER_PATHS.ingress.__class__(
        export_parent=paths.parent,
        export_child=paths.child,
        export_model=paths.model,
        export_receipt=paths.receipt,
        parent_manifest=tmp_path / "parent-manifest.json",
        manifest=tmp_path / "manifest.json",
        final=tmp_path / "final.json",
    )
    with pytest.raises(UnprovisionedError):
        emit_ingress(
            ingress_paths,
            spec=replace(PRODUCTION_INGRESS_SPEC, daemon_sha256=None),
        )
    assert not ingress_paths.manifest.exists()


def test_runner_start_is_fail_closed_before_provisioning() -> None:
    spec = replace(runner.PRODUCTION_RUNNER_SPEC, manifest_sha256=None)
    with pytest.raises(UnprovisionedError, match="child44 PIQD runner"):
        runner.start(object(), spec=spec)  # type: ignore[arg-type]


def test_runner_path_adapter_exposes_base_export_child() -> None:
    paths = runner._paths(runner.PRODUCTION_RUNNER_PATHS)
    assert paths.ingress.export.child == runner.PRODUCTION_RUNNER_PATHS.ingress.export_child
    assert paths.ingress.manifest == runner.PRODUCTION_RUNNER_PATHS.ingress.manifest


@pytest.mark.parametrize("args", [("--help",), ()])
def test_export_cli_non_mutating_without_explicit_export(args: tuple[str, ...]) -> None:
    before = {path: path.exists() for path in (exporter.CHILD_PATH, exporter.RECEIPT_PATH)}
    result = subprocess.run([sys.executable, str(ROOT / "scripts/export_exact17_forty_fourth_root.py"), *args], cwd=ROOT, capture_output=True, text=True, check=False)
    if args == ("--help",):
        assert result.returncode == 0
    else:
        assert result.returncode != 0
    assert {path: path.exists() for path in before} == before


def test_export_receipt_contains_lean_root_and_source_provenance() -> None:
    source = exporter.export_child44.__module__
    assert source == "export_exact17_forty_fourth_root"
    assert exporter.PRODUCTION_SPEC.lean_root_sha256
    assert exporter.PRODUCTION_SPEC.analysis_sha256


def test_ingress_accepts_base_runner_manifest_keyword_fail_closed() -> None:
    spec = replace(PRODUCTION_INGRESS_SPEC, manifest_sha256="a" * 64)
    with pytest.raises(ValueError, match="manifest pin arguments disagree"):
        validate_ingress(spec=spec, expected_manifest_sha256="b" * 64)


def test_provisioned_runner_live_identity_uses_registry_semantics() -> None:
    ingress = replace(PRODUCTION_INGRESS_SPEC, manifest_sha256="a" * 64)
    spec = replace(
        runner.PRODUCTION_RUNNER_SPEC,
        ingress=ingress,
        manifest_sha256="a" * 64,
    )
    daemon = {
        "name": spec.daemon_name,
        "version": spec.daemon_version,
        "protocol_version": ingress.daemon_protocol_version,
        "sha256": ingress.daemon_sha256,
    }
    solver = {
        "name": ingress.solver_name,
        "sha256": ingress.solver_sha256,
        "solver_signature": ingress.solver_signature,
        "protocol_version": ingress.daemon_protocol_version,
        "solver": "cadical",
        "lane": "sat",
        "usable": True,
    }

    class IdentityClient:
        def version(self) -> dict[str, object]:
            return {"daemon": daemon}

        def solvers(self) -> dict[str, object]:
            return {"daemon": daemon, "solvers": [solver]}

    assert ingress.backend == "cadical"
    assert ingress.solver_profile == "sat"
    assert runner.live_identity(IdentityClient(), spec) == {
        "version": {"daemon": daemon},
        "solver": solver,
    }


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("manifest_sha256", "b" * 64),
        ("project", "wrong-project"),
        ("variables", 307),
        ("daemon_name", "wrong-daemon"),
        ("daemon_version", "9.9.9"),
        ("timeout_s", runner.TIMEOUT_S - 1),
        ("march_timeout_s", runner.MARCH_TIMEOUT_S - 1),
    ],
)
def test_runner_provisioning_rejects_identity_scope_drift(field: str, value: object) -> None:
    ingress_spec = replace(PRODUCTION_INGRESS_SPEC, manifest_sha256="a" * 64)
    runner_spec = replace(
        runner.PRODUCTION_RUNNER_SPEC,
        ingress=ingress_spec,
        manifest_sha256="a" * 64,
    )
    assert runner_spec.provisioned
    assert not replace(runner_spec, **{field: value}).provisioned


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("daemon_sha256", "b" * 64),
        ("daemon_source_commit", "b" * 40),
        ("daemon_build_receipt_sha256", "c" * 64),
        ("daemon_protocol_version", 2),
        ("solver_name", "wrong-solver"),
        ("solver_sha256", "d" * 64),
        ("solver_signature", "cadical-0.0.0"),
        ("backend", "wrong-backend"),
        ("solver_profile", "wrong-profile"),
    ],
)
def test_runner_provisioning_rejects_nested_ingress_identity_drift(
    field: str,
    value: object,
) -> None:
    ingress_spec = replace(PRODUCTION_INGRESS_SPEC, manifest_sha256="a" * 64)
    runner_spec = replace(
        runner.PRODUCTION_RUNNER_SPEC,
        ingress=ingress_spec,
        manifest_sha256="a" * 64,
    )
    assert runner_spec.provisioned
    assert not replace(runner_spec, ingress=replace(ingress_spec, **{field: value})).provisioned


def test_export_receipt_rejects_extra_or_substituted_fields(tmp_path: Path) -> None:
    paths = ingress.IngressPaths(
        export_parent=tmp_path / "parent.cnf",
        export_child=tmp_path / "child.cnf",
        export_model=tmp_path / "model.json",
        export_receipt=tmp_path / "receipt.json",
    )
    validation = {"final": {"sha256": "f" * 64}}
    receipt = {
        "schema": "p97-exact17-child44-immutable-export-receipt/v1",
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "parent": {"path": str(paths.export_parent.resolve()), "sha256": PRODUCTION_SPEC.parent_sha256},
        "lean": {
            "root": {"path": str(ingress.LEAN_ROOT_PATH.resolve()), "sha256": PRODUCTION_SPEC.lean_root_sha256},
            "export": {"path": str(ingress.LEAN_EXPORT_PATH.resolve()), "sha256": PRODUCTION_SPEC.lean_export_sha256},
        },
        "source": {"analysis": {"path": str(ingress.ANALYSIS_PATH.resolve()), "sha256": PRODUCTION_SPEC.analysis_sha256}},
        "model": {"path": str(paths.export_model.resolve()), "sha256": PRODUCTION_SPEC.model_sha256},
        "final": validation["final"],
        "child": {"path": str(paths.export_child.resolve()), "sha256": PRODUCTION_SPEC.child_sha256, "bytes": PRODUCTION_SPEC.child_bytes, "variables": 308, "clauses": 5_848_820},
        "validation": validation,
        "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
    }
    paths.export_receipt.write_text(json.dumps(receipt))
    ingress._receipt(paths, PRODUCTION_INGRESS_SPEC, validation)
    receipt["unexpected"] = True
    paths.export_receipt.write_text(json.dumps(receipt))
    with pytest.raises(ValueError, match="receipt content drifted"):
        ingress._receipt(paths, PRODUCTION_INGRESS_SPEC, validation)


def test_export_receipt_rejects_duplicate_json_keys(tmp_path: Path) -> None:
    paths = ingress.IngressPaths(
        export_parent=tmp_path / "parent.cnf",
        export_child=tmp_path / "child.cnf",
        export_model=tmp_path / "model.json",
        export_receipt=tmp_path / "receipt.json",
    )
    paths.export_receipt.write_text('{"schema":"first","schema":"second"}')
    with pytest.raises(ValueError, match="duplicate JSON key"):
        ingress._receipt(paths, PRODUCTION_INGRESS_SPEC, {})


def test_manifest_publication_rejects_symlinked_parent(tmp_path: Path) -> None:
    target = tmp_path / "real"
    target.mkdir()
    link = tmp_path / "link"
    link.symlink_to(target, target_is_directory=True)
    with pytest.raises(ValueError, match="contains a symlink"):
        ingress._immutable_json(link / "manifest.json", {"status": "PASS"})


def test_shared_runner_immutable_json_rejects_symlinked_ancestor(tmp_path: Path) -> None:
    target = tmp_path / "real"
    target.mkdir()
    link = tmp_path / "runner-artifacts"
    link.symlink_to(target, target_is_directory=True)
    with pytest.raises(OSError):
        runner._base._immutable_json(link / "artifact.json", {"status": "PASS"})


def test_shared_runner_lock_rejects_symlinked_ancestor(tmp_path: Path) -> None:
    target = tmp_path / "real"
    target.mkdir()
    link = tmp_path / "runner-locks"
    link.symlink_to(target, target_is_directory=True)
    with pytest.raises(OSError), runner._base._transaction_lock(link / "runner.lock"):
        pass


def test_shared_runner_snapshot_rejects_symlinked_destination_ancestor(tmp_path: Path) -> None:
    source = tmp_path / "source.cnf"
    source.write_bytes(b"p cnf 1 1\n1 0\n")
    target = tmp_path / "real"
    target.mkdir()
    link = tmp_path / "runner-snapshots"
    link.symlink_to(target, target_is_directory=True)
    with pytest.raises(OSError), runner._base._held_snapshot(
        source,
        link,
        expected_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
    ):
        pass


def test_shared_runner_lifecycle_read_rejects_direct_symlink(tmp_path: Path) -> None:
    target = tmp_path / "target.json"
    target.write_text('{"status":"PASS"}\n', encoding="utf-8")
    link = tmp_path / "intent.json"
    link.symlink_to(target)
    with pytest.raises(OSError):
        runner._base._read_json_record_nofollow(link)


def test_shared_runner_lifecycle_read_binds_record_and_hash(tmp_path: Path) -> None:
    record = tmp_path / "prepared.json"
    rendered = b'{"phase":"prepared"}\n'
    record.write_bytes(rendered)
    payload, digest = runner._base._read_json_record_nofollow(record)
    assert payload == {"phase": "prepared"}
    assert digest == hashlib.sha256(rendered).hexdigest()


def test_shared_runner_lifecycle_presence_does_not_follow_direct_symlink(
    tmp_path: Path,
) -> None:
    target = tmp_path / "missing.json"
    link = tmp_path / "state.json"
    link.symlink_to(target)
    assert runner._base._path_entry_exists_nofollow(link)


def test_shared_runner_regular_attestation_binds_one_descriptor(tmp_path: Path) -> None:
    payload = b"p cnf 1 1\n1 0\n"
    root = tmp_path / "root.cnf"
    root.write_bytes(payload)
    report = runner._base._attest_regular_nofollow(
        root,
        expected_sha256=hashlib.sha256(payload).hexdigest(),
        expected_bytes=len(payload),
        expected_prefix=b"p cnf 1 1\n",
    )
    assert report == {
        "sha256": hashlib.sha256(payload).hexdigest(),
        "bytes": len(payload),
    }


def test_shared_runner_regular_attestation_rejects_direct_symlink(
    tmp_path: Path,
) -> None:
    payload = b"p cnf 1 1\n1 0\n"
    target = tmp_path / "root-target.cnf"
    target.write_bytes(payload)
    link = tmp_path / "root.cnf"
    link.symlink_to(target)
    with pytest.raises(OSError):
        runner._base._attest_regular_nofollow(
            link,
            expected_sha256=hashlib.sha256(payload).hexdigest(),
        )
