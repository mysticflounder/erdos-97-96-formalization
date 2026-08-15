"""Focused adversarial tests for the immutable Lean-owned Child43 gate."""

from __future__ import annotations

from dataclasses import replace
from pathlib import Path

import export_exact17_forty_third_root as exporter
import pytest
import run_piqd_exact17_forty_third_root as runner
import validate_exact17_forty_third_ingress as ingress
import validate_exact17_forty_third_wave_export as export_validation
from validate_exact17_forty_third_wave_export import (
    CHILD_BYTES,
    CHILD_CLAUSES,
    EXPECTED_MODEL_CUT_SUFFIX_INDICES,
    FINAL_SHA256,
    LEAN_EXPORT_PATH,
    LEAN_EXPORT_SHA256,
    LEAN_ROOT_PATH,
    LEAN_ROOT_SHA256,
    NEW_CLAUSES,
    PARENT_CLAUSES,
    PARENT_SHA256,
    PRODUCTION_SPEC,
    SUFFIX,
    UnprovisionedError,
    authenticated_model,
    require_motivating_model_cut,
    validate_sources,
    validate_spec,
)


def test_lean_source_pins_and_exact_boundary() -> None:
    validate_spec(PRODUCTION_SPEC, require_source_pins=True)
    validate_sources()
    assert (PRODUCTION_SPEC.variables, PRODUCTION_SPEC.parent_clauses) == (
        308,
        PARENT_CLAUSES,
    )
    assert (PARENT_CLAUSES, NEW_CLAUSES, CHILD_CLAUSES) == (
        5_848_452,
        140,
        5_848_592,
    )
    assert len(SUFFIX) == NEW_CLAUSES
    assert PRODUCTION_SPEC.parent_sha256 == PARENT_SHA256
    assert FINAL_SHA256 == "53e6f847c1541840e9cbb2c2503d49553a0e8a90489afae6ea99770c55159e45"
    assert CHILD_BYTES == 291_694_814
    assert PRODUCTION_SPEC.child_bytes == CHILD_BYTES
    assert PRODUCTION_SPEC.child_sha256 == "dbfbd84473cfe86a0e596322c0c0af8a077fc830ab5a9976c5efa7ea80a96c76"
    assert PRODUCTION_SPEC.provisioned
    assert LEAN_ROOT_PATH.endswith("BlockerVExactSeventeenFortySecondModelRefinements.lean")
    assert LEAN_EXPORT_PATH.endswith("BlockerVExactSeventeenFortySecondModelRefinementsExport.lean")
    assert LEAN_ROOT_SHA256 == "702928b75a8e5574a7f5f1ef8943c6a4c56f6bd5aaa6690f48307ec4ca9bed49"
    assert LEAN_EXPORT_SHA256 == "467cd65cd426e1be21759aedf87602150d5573aa9201e7dfe5fc810b898fd414"


def test_authenticated_child42_model_rejects_suffix() -> None:
    assignment = authenticated_model(Path(PRODUCTION_SPEC.model_path))
    assert require_motivating_model_cut(SUFFIX, assignment) == EXPECTED_MODEL_CUT_SUFFIX_INDICES


def test_production_paths_bind_child43_and_authenticated_child42_parent() -> None:
    assert "exact17-forty-third-root-forty-second-model-refinements.cnf" in str(exporter.PRODUCTION_PATHS.child)
    assert "child43" in str(exporter.PRODUCTION_PATHS.receipt)
    assert "child42" in PRODUCTION_SPEC.model_path
    assert "exact17-forty-second-root-forty-first-model-refinements.cnf" in PRODUCTION_SPEC.parent_path
    assert runner.PRODUCTION_RUNNER_SPEC.artifact_namespace == "child43"
    for path in (
        runner.PRODUCTION_RUNNER_PATHS.intent,
        runner.PRODUCTION_RUNNER_PATHS.prepared,
        runner.PRODUCTION_RUNNER_PATHS.state,
        runner.PRODUCTION_RUNNER_PATHS.final,
        runner.PRODUCTION_RUNNER_PATHS.model,
        runner.PRODUCTION_RUNNER_PATHS.solver_log,
        runner.PRODUCTION_RUNNER_PATHS.lock,
    ):
        assert "child43" in str(path)


def test_unprovisioned_gates_use_isolated_paths(tmp_path: Path) -> None:
    export_paths = exporter.ExportPaths(
        *(tmp_path / name for name in ("parent.cnf", "model.json", "root.lean", "export.lean", "child.cnf", "receipt.json"))
    )
    ingress_paths = ingress.IngressPaths(
        export=export_paths,
        parent_manifest=tmp_path / "parent-manifest.json",
        daemon_build_receipt=tmp_path / "daemon-receipt.txt",
        manifest=tmp_path / "ingress.json",
    )
    isolated_export = replace(
        ingress.PRODUCTION_INGRESS_SPEC.export,
        parent_path=str(export_paths.parent),
        child_path=str(export_paths.child),
        model_path=str(export_paths.model),
        lean_root_path=str(export_paths.lean_root),
        lean_export_path=str(export_paths.lean_export),
        receipt_path=str(export_paths.receipt),
    )
    isolated_ingress = replace(
        ingress.PRODUCTION_INGRESS_SPEC,
        export=isolated_export,
        parent_manifest_sha256=None,
    )
    with pytest.raises(UnprovisionedError, match="UNPROVISIONED"):
        ingress.validate_ingress(ingress_paths, spec=isolated_ingress)
    runner_paths = runner.RunnerPaths(
        ingress=ingress_paths,
        intent=tmp_path / "intent.json",
        prepared=tmp_path / "prepared.json",
        state=tmp_path / "state.json",
        final=tmp_path / "final.json",
        model=tmp_path / "runner-model.json",
        solver_log=tmp_path / "solver.log",
        lock=tmp_path / "runner.lock",
    )
    isolated_runner = replace(
        runner.PRODUCTION_RUNNER_SPEC,
        ingress=isolated_ingress,
        manifest_sha256=None,
    )
    with pytest.raises(UnprovisionedError, match="UNPROVISIONED"):
        runner.start(None, paths=runner_paths, spec=isolated_runner)


def test_standalone_ingress_requires_manifest_pin(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    export_paths = exporter.ExportPaths(
        *(tmp_path / name for name in ("parent.cnf", "model.json", "root.lean", "export.lean", "child.cnf", "receipt.json"))
    )
    for path in (export_paths.child, export_paths.receipt):
        path.write_bytes(b"fixture\n")
    manifest = tmp_path / "ingress.json"
    manifest.write_bytes(b"{}\n")
    paths = ingress.IngressPaths(
        export=export_paths,
        parent_manifest=tmp_path / "parent-manifest.json",
        daemon_build_receipt=tmp_path / "daemon-receipt.txt",
        manifest=manifest,
    )
    export_spec = replace(
        PRODUCTION_SPEC,
        publication_state="PROVISIONED",
        child_sha256="c" * 64,
        child_bytes=8,
        parent_path=str(export_paths.parent),
        child_path=str(export_paths.child),
        model_path=str(export_paths.model),
        lean_root_path=str(export_paths.lean_root),
        lean_export_path=str(export_paths.lean_export),
        receipt_path=str(export_paths.receipt),
    )
    spec = replace(ingress.PRODUCTION_INGRESS_SPEC, export=export_spec)
    assert spec.provisioned
    monkeypatch.setattr(ingress, "MANIFEST_SHA256", None)
    with pytest.raises(UnprovisionedError, match="manifest SHA-256 is unpinned"):
        ingress.validate_ingress(paths, spec=spec)


def test_stable_json_snapshot_rejects_symlink(tmp_path: Path) -> None:
    target = tmp_path / "target.json"
    target.write_bytes(b"{}\n")
    link = tmp_path / "link.json"
    link.symlink_to(target)
    with pytest.raises(ValueError, match="stable regular file"):
        ingress._read_snapshot(link)


@pytest.mark.parametrize(
    ("line", "message"),
    [
        (b"p  cnf 308 5848592\n", "noncanonical DIMACS header bytes"),
        (b"p cnf 308 5848592", "noncanonical DIMACS header bytes"),
        (b"-307  -9 -6 0\n", "noncanonical DIMACS clause bytes"),
        (b"-307 -9 -6 0", "noncanonical DIMACS clause bytes"),
    ],
)
def test_dimacs_parser_rejects_noncanonical_raw_bytes(line: bytes, message: str) -> None:
    parser = export_validation._header if line.startswith(b"p") else export_validation._clause
    with pytest.raises(ValueError, match=message):
        parser(line)


def test_explicit_falsey_manifest_pin_cannot_fall_back(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    export_paths = exporter.ExportPaths(
        *(tmp_path / name for name in ("parent.cnf", "model.json", "root.lean", "export.lean", "child.cnf", "receipt.json"))
    )
    for path in (export_paths.child, export_paths.receipt):
        path.write_bytes(b"fixture\n")
    manifest = tmp_path / "ingress.json"
    manifest.write_bytes(b"{}\n")
    paths = ingress.IngressPaths(
        export=export_paths,
        parent_manifest=tmp_path / "parent-manifest.json",
        daemon_build_receipt=tmp_path / "daemon-receipt.txt",
        manifest=manifest,
    )
    export_spec = replace(
        PRODUCTION_SPEC,
        publication_state="PROVISIONED",
        child_sha256="c" * 64,
        child_bytes=8,
        parent_path=str(export_paths.parent),
        child_path=str(export_paths.child),
        model_path=str(export_paths.model),
        lean_root_path=str(export_paths.lean_root),
        lean_export_path=str(export_paths.lean_export),
        receipt_path=str(export_paths.receipt),
    )
    spec = replace(ingress.PRODUCTION_INGRESS_SPEC, export=export_spec)
    monkeypatch.setattr(ingress, "MANIFEST_SHA256", "a" * 64)
    with pytest.raises(ValueError, match="explicit manifest SHA-256 pin is malformed"):
        ingress.validate_ingress(paths, spec=spec, expected_manifest_sha256="")


@pytest.mark.parametrize(
    "arguments, expected_returncode",
    [
        (["--help"], 0),
        ([], 2),
        (["invalid"], 2),
    ],
)
def test_export_cli_requires_explicit_subcommand_and_is_non_mutating(
    arguments: list[str], expected_returncode: int, monkeypatch: pytest.MonkeyPatch
) -> None:
    called = False

    def unexpected_export() -> dict[str, object]:
        nonlocal called
        called = True
        raise AssertionError("parser invoked publication")

    monkeypatch.setattr(exporter, "export_child43", unexpected_export)
    with pytest.raises(SystemExit) as raised:
        exporter.main(arguments)
    assert raised.value.code == expected_returncode
    assert not called


def test_losing_concurrent_export_preserves_winner_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    child = tmp_path / "child43.cnf"
    receipt = tmp_path / "child43-receipt.json"
    paths = exporter.ExportPaths(
        Path(export_validation.PARENT_PATH),
        Path(export_validation.MODEL_PATH),
        Path(export_validation.LEAN_ROOT_PATH),
        Path(export_validation.LEAN_EXPORT_PATH),
        child,
        receipt,
    )
    test_spec = replace(
        export_validation.PRODUCTION_SPEC,
        publication_state="PROVISIONED",
        child_sha256=export_validation.CHILD_SHA256,
        child_bytes=export_validation.CHILD_BYTES,
        lean_root_sha256="a" * 64,
        lean_export_sha256="b" * 64,
    )
    expected_hashes = {
        paths.parent: export_validation.PARENT_SHA256,
        paths.model: export_validation.MODEL_SHA256,
        paths.lean_root: test_spec.lean_root_sha256,
        paths.lean_export: test_spec.lean_export_sha256,
    }

    def fake_sha256(path: Path) -> str:
        return expected_hashes.get(path, export_validation.CHILD_SHA256)

    def fake_lean(_source: Path, output: Path) -> None:
        output.write_bytes(b"losing candidate\n")

    real_link = exporter.os.link

    def racing_link(
        source: Path, destination: Path, *, follow_symlinks: bool = True
    ) -> None:
        if destination == child:
            child.write_bytes(b"winner root\n")
            raise FileExistsError(destination)
        real_link(source, destination, follow_symlinks=follow_symlinks)

    monkeypatch.setattr(exporter, "sha256_file", fake_sha256)
    monkeypatch.setattr(exporter, "validate_export", lambda *_args, **_kwargs: {"status": "PASS"})
    monkeypatch.setattr(exporter, "_run_lean", fake_lean)
    monkeypatch.setattr(exporter.os, "link", racing_link)

    with pytest.raises(FileExistsError):
        exporter.export_child43(paths, spec=test_spec)

    assert child.read_bytes() == b"winner root\n"
    assert not receipt.exists()
