"""Focused adversarial tests for the immutable Lean-owned Child42 gate."""

from __future__ import annotations

from dataclasses import replace
from pathlib import Path

import export_exact17_forty_second_root as exporter
import pytest
import run_piqd_exact17_forty_second_root as runner
import validate_exact17_forty_second_ingress as ingress
import validate_exact17_forty_second_wave_export as export_validation
from validate_exact17_forty_second_wave_export import (
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
    validate_spec,
)


def test_lean_source_pins_and_exact_boundary() -> None:
    validate_spec(PRODUCTION_SPEC, require_source_pins=True)
    assert (PRODUCTION_SPEC.variables, PRODUCTION_SPEC.parent_clauses) == (
        308,
        PARENT_CLAUSES,
    )
    assert (PARENT_CLAUSES, NEW_CLAUSES, CHILD_CLAUSES) == (
        5_847_920,
        532,
        5_848_452,
    )
    assert len(SUFFIX) == NEW_CLAUSES
    assert PRODUCTION_SPEC.parent_sha256 == PARENT_SHA256
    assert FINAL_SHA256 == "21880b47dc8d1bb55ecfee96c675d03796e0223503f9e2b4a193808ece53af0f"
    assert CHILD_BYTES == 291_688_780
    assert PRODUCTION_SPEC.child_bytes == CHILD_BYTES
    assert PRODUCTION_SPEC.provisioned
    assert LEAN_ROOT_PATH.endswith("BlockerVExactSeventeenFortyFirstModelRefinements.lean")
    assert LEAN_EXPORT_PATH.endswith("BlockerVExactSeventeenFortyFirstModelRefinementsExport.lean")
    assert LEAN_ROOT_SHA256 == "4d091468219774aee9399305f9ed32c66a60dd000b117741f97b9ebd4b7a0ece"
    assert LEAN_EXPORT_SHA256 == "b7ffb50bda2444c0d6469ad00390e9e0350311e55d1d361ad63e8220ab930335"


def test_authenticated_child41_model_rejects_suffix() -> None:
    assignment = authenticated_model(Path(PRODUCTION_SPEC.model_path))
    assert require_motivating_model_cut(SUFFIX, assignment) == EXPECTED_MODEL_CUT_SUFFIX_INDICES


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

    monkeypatch.setattr(exporter, "export_child42", unexpected_export)
    with pytest.raises(SystemExit) as raised:
        exporter.main(arguments)
    assert raised.value.code == expected_returncode
    assert not called


def test_losing_concurrent_export_preserves_winner_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    child = tmp_path / "child42.cnf"
    receipt = tmp_path / "child42-receipt.json"
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
        exporter.export_child42(paths, spec=test_spec)

    assert child.read_bytes() == b"winner root\n"
    assert not receipt.exists()
