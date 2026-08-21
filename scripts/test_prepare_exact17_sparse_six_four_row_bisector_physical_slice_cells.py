# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Adversarial tests for four-row-bisector physical-slice preparation."""

from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path

import prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells as subject
import pytest


def _root() -> bytes:
    return b"p cnf 308 2\n1 0\n-2 3 0\n"


def test_next_center_units_match_the_authenticated_variable_map() -> None:
    assert subject.next_center_variable(0) == 290
    assert subject.next_center_variable(16) == 306
    assert subject.category_units(0, "none")[0] == 290
    assert subject.category_units(16, "none")[0] == 306


def _fixture(
    tmp_path: Path,
) -> tuple[dict[str, Path], list[tuple[int, str]]]:
    parent = tmp_path / "root.cnf"
    parent.write_bytes(_root())
    variable_map = tmp_path / "variable-map.json"
    variable_map.write_bytes(b'{"variables":308}\n')
    source = tmp_path / "source.lean"
    source.write_bytes(b"theorem source : True := by trivial\n")
    root_source = tmp_path / "root-source.lean"
    root_source.write_bytes(b"def root : List Nat := []\n")
    exporter = tmp_path / "exporter.lean"
    exporter.write_bytes(b"def main : IO Unit := pure ()\n")
    variable_sha = hashlib.sha256(variable_map.read_bytes()).hexdigest()
    checkpoint = tmp_path / "checkpoint.json"
    checkpoint.write_bytes(
        subject.canonical_json_bytes(
            {
                "schema": "worktree-lane-checkpoint/v1",
                "lane_id": subject.LANE_ID,
                "base_head": subject.BASE_HEAD,
                "owned_paths": [
                    "source.lean",
                    "root-source.lean",
                    "exporter.lean",
                    "scripts/prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells.py",
                    "scripts/test_prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells.py",
                ],
                "generated_roots": ["output"],
            }
        )
    )
    subject.PARENT_CLAUSES = 2
    subject.CELL_CLAUSES = 8
    subject.EXPECTED_SOURCE_SHA256 = hashlib.sha256(source.read_bytes()).hexdigest()
    subject.EXPECTED_ROOT_SOURCE_SHA256 = hashlib.sha256(
        root_source.read_bytes()
    ).hexdigest()
    subject.EXPECTED_EXPORTER_SHA256 = hashlib.sha256(exporter.read_bytes()).hexdigest()
    subject.EXPECTED_VARIABLE_MAP_SHA256 = variable_sha
    subject.EXPECTED_CHECKPOINT_SHA256 = hashlib.sha256(
        checkpoint.read_bytes()
    ).hexdigest()
    calls: list[tuple[int, str]] = []

    def fake_export(
        _repo: Path,
        _exporter: Path,
        center: int,
        category: str,
        output: Path,
    ) -> None:
        calls.append((center, category))
        output.write_bytes(
            subject.cell_cnf_bytes(parent.read_bytes(), center, category)
        )

    def fake_root_export(_repo: Path, _exporter: Path, output: Path) -> None:
        calls.append((-1, "root"))
        output.write_bytes(parent.read_bytes())

    def fake_commit_verify(_repo: Path, commit: str, paths: tuple[Path, ...]) -> None:
        assert commit == "a" * 40
        assert paths == (source, root_source, exporter)

    paths = {
        "parent": parent,
        "source": source,
        "root_source": root_source,
        "exporter": exporter,
        "variable_map": variable_map,
        "checkpoint": checkpoint,
        "output": tmp_path / "output",
    }
    paths["fake_export"] = fake_export  # type: ignore[assignment]
    paths["fake_root_export"] = fake_root_export  # type: ignore[assignment]
    paths["fake_commit_verify"] = fake_commit_verify  # type: ignore[assignment]
    return paths, calls


def _prepare(
    tmp_path: Path,
) -> tuple[dict[str, Path], dict[str, object], list[tuple[int, str]]]:
    paths, calls = _fixture(tmp_path)
    _initialize(tmp_path, paths)
    report = subject.prepare_campaign(
        repo_root=tmp_path,
        source_commit="a" * 40,
        source_path=paths["source"],
        root_source_path=paths["root_source"],
        exporter_path=paths["exporter"],
        variable_map_path=paths["variable_map"],
        checkpoint_path=paths["checkpoint"],
        output_root=paths["output"],
        lean_root_exporter=paths["fake_root_export"],  # type: ignore[arg-type]
        lean_exporter=paths["fake_export"],  # type: ignore[arg-type]
        commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
    )
    return paths, report, calls


def _initialize(tmp_path: Path, paths: dict[str, Path]) -> dict[str, object]:
    return subject.initialize_run_root(
        repo_root=tmp_path,
        source_path=paths["source"],
        root_source_path=paths["root_source"],
        exporter_path=paths["exporter"],
        variable_map_path=paths["variable_map"],
        checkpoint_path=paths["checkpoint"],
        output_root=paths["output"],
    )


def _cell(output: Path, center: int, category: str) -> Path:
    identifier = subject.category_id(center, category)
    return output / "artifacts" / "cells" / identifier / f"{identifier}.cnf"


def test_initialize_creates_only_exact_empty_governed_skeleton(tmp_path: Path) -> None:
    paths, calls = _fixture(tmp_path)
    result = _initialize(tmp_path, paths)
    assert result["status"] == "RUN_ROOT_INITIALIZED"
    assert calls == []
    assert {path.name for path in paths["output"].iterdir()} == {
        "artifacts",
        "events",
        "tmp",
        "run_manifest.json",
    }
    assert all(
        not list((paths["output"] / name).iterdir())
        for name in ("artifacts", "events", "tmp")
    )
    manifest = json.loads((paths["output"] / "run_manifest.json").read_bytes())
    assert manifest["schema"] == "worktree-run-manifest/v1"
    assert manifest["lane_id"] == subject.LANE_ID
    assert manifest["run_id"] == subject.RUN_ID
    assert manifest["base_head"] == subject.BASE_HEAD
    assert set(manifest) == {
        "schema",
        "lane_id",
        "run_id",
        "root",
        "owner",
        "base_head",
        "output_classes",
        "source_digests",
        "input_digests",
        "created_utc",
        "manifest_sha256",
    }
    variable_path = subject._repo_relative(tmp_path, paths["variable_map"])
    assert manifest["input_digests"] == {
        variable_path: hashlib.sha256(paths["variable_map"].read_bytes()).hexdigest()
    }
    assert variable_path not in manifest["source_digests"]


def test_initialize_exact_reentry_is_idempotent(tmp_path: Path) -> None:
    paths, _ = _fixture(tmp_path)
    first = _initialize(tmp_path, paths)
    before = (paths["output"] / "run_manifest.json").read_bytes()
    second = _initialize(tmp_path, paths)
    assert first["status"] == "RUN_ROOT_INITIALIZED"
    assert second["status"] == "RUN_ROOT_ALREADY_INITIALIZED"
    assert (paths["output"] / "run_manifest.json").read_bytes() == before


@pytest.mark.parametrize("mutation", ["manifest", "extra", "nonempty"])
def test_initialize_rejects_mutated_or_populated_skeleton(
    tmp_path: Path, mutation: str
) -> None:
    paths, _ = _fixture(tmp_path)
    _initialize(tmp_path, paths)
    if mutation == "manifest":
        manifest = paths["output"] / "run_manifest.json"
        manifest.write_bytes(manifest.read_bytes() + b" ")
    elif mutation == "extra":
        (paths["output"] / "unexpected").write_text("x")
    else:
        (paths["output"] / "artifacts" / "partial").write_text("x")
    with pytest.raises(subject.PreparationError):
        _initialize(tmp_path, paths)


def test_prepare_requires_preinitialized_empty_skeleton(tmp_path: Path) -> None:
    paths, _ = _fixture(tmp_path)
    with pytest.raises(
        subject.PreparationError, match="governed run root is unavailable"
    ):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="a" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
            lean_root_exporter=paths["fake_root_export"],  # type: ignore[arg-type]
            lean_exporter=paths["fake_export"],  # type: ignore[arg-type]
            commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
        )


def test_prepares_and_directly_checks_all_76_source_categories(tmp_path: Path) -> None:
    paths, report, calls = _prepare(tmp_path)
    assert report["cell_count"] == 76
    assert report["direct_lean_cells_validated"] == len(subject.DIRECT_SENTINELS)
    assert report["production_run"] is False
    assert calls[0] == (-1, "root")
    assert calls[1:] == list(subject.DIRECT_SENTINELS)
    assert len(list((paths["output"] / "artifacts" / "cells").iterdir())) == 76
    assert not list((paths["output"] / "tmp").iterdir())


def test_header_and_full_multiplicity_units_are_exact(tmp_path: Path) -> None:
    paths, _, _ = _prepare(tmp_path)
    assert _cell(paths["output"], 0, "none").read_bytes() == (
        b"p cnf 308 8\n1 0\n-2 3 0\n290 0\n-7 0\n-8 0\n-9 0\n-10 0\n-11 0\n"
    )
    assert _cell(paths["output"], 0, "unique-06").read_bytes() == (
        b"p cnf 308 8\n1 0\n-2 3 0\n290 0\n7 0\n-8 0\n-9 0\n-10 0\n-11 0\n"
    )
    assert subject.category_units(12, "unique-06") == (
        302,
        211,
        -212,
        -213,
        -214,
        -215,
    )


def test_self_unique_category_is_excluded_but_all_other_categories_remain(
    tmp_path: Path,
) -> None:
    paths, _, _ = _prepare(tmp_path)
    center_six = list(
        (paths["output"] / "artifacts" / "cells").glob(
            "four-row-bisector-next-center-06-*"
        )
    )
    assert len(center_six) == 5
    assert not (
        paths["output"]
        / "artifacts/cells/four-row-bisector-next-center-06-physical-unique-06"
    ).exists()


def test_producer_and_campaign_bind_all_ingress_identities(tmp_path: Path) -> None:
    paths, _, _ = _prepare(tmp_path)
    cell = _cell(paths["output"], 0, "none")
    producer = json.loads(cell.with_name("producer-manifest.json").read_bytes())
    assert producer["source_manifest"]["source_theorem"] == subject.SOURCE_THEOREM
    assert producer["exporter_sha256"] == subject.EXPECTED_EXPORTER_SHA256
    root_path = paths["output"] / "artifacts" / "cumulative-root.cnf"
    root_producer_path = paths["output"] / "artifacts" / "root-producer-manifest.json"
    assert (
        producer["parent_root_sha256"]
        == hashlib.sha256(root_path.read_bytes()).hexdigest()
    )
    assert (
        producer["parent_producer_sha256"]
        == hashlib.sha256(root_producer_path.read_bytes()).hexdigest()
    )
    assert producer["variable_map_sha256"] == subject.EXPECTED_VARIABLE_MAP_SHA256
    assert all(value is False for value in producer["claims"].values())
    wave = json.loads(cell.with_name("wave-manifest.json").read_bytes())
    subject.validate_wave_manifest(wave)
    assert wave["encoding"]["num_clauses"] == 8
    assert wave["parent_checkpoint_sha256"] == subject.EXPECTED_CHECKPOINT_SHA256
    campaign = json.loads(
        (paths["output"] / "artifacts" / "campaign-manifest.json").read_bytes()
    )
    assert campaign["cell_count"] == 76
    assert campaign["source"]["checkpoint_sha256"] == subject.EXPECTED_CHECKPOINT_SHA256


def test_direct_lean_byte_difference_is_rejected(tmp_path: Path) -> None:
    paths, _ = _fixture(tmp_path)
    _initialize(tmp_path, paths)

    def bad_export(
        _repo: Path,
        _exporter: Path,
        center: int,
        category: str,
        output: Path,
    ) -> None:
        payload = subject.cell_cnf_bytes(paths["parent"].read_bytes(), center, category)
        output.write_bytes(payload.replace(b"1 0\n", b"2 0\n", 1))

    with pytest.raises(subject.PreparationError):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="a" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
            lean_root_exporter=paths["fake_root_export"],  # type: ignore[arg-type]
            lean_exporter=bad_export,
            commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
        )


@pytest.mark.parametrize(
    ("key", "message"),
    [
        ("source", "source digest drifted"),
        ("root_source", "root_source digest drifted"),
        ("exporter", "exporter digest drifted"),
        ("variable_map", "variable_map digest drifted"),
        ("checkpoint", "checkpoint digest drifted"),
    ],
)
def test_every_bound_support_file_fails_closed_on_drift(
    tmp_path: Path, key: str, message: str
) -> None:
    paths, _ = _fixture(tmp_path)
    paths[key].write_bytes(paths[key].read_bytes() + b" ")
    with pytest.raises(subject.PreparationError, match=message):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="a" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
            lean_root_exporter=paths["fake_root_export"],  # type: ignore[arg-type]
            lean_exporter=paths["fake_export"],  # type: ignore[arg-type]
            commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
        )


def test_malformed_lean_root_export_is_rejected(tmp_path: Path) -> None:
    paths, _ = _fixture(tmp_path)
    _initialize(tmp_path, paths)

    def bad_root(_repo: Path, _exporter: Path, output: Path) -> None:
        output.write_bytes(paths["parent"].read_bytes().replace(b"1 0", b"4 0"))

    with pytest.raises(subject.PreparationError):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="a" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
            lean_root_exporter=bad_root,
            lean_exporter=paths["fake_export"],  # type: ignore[arg-type]
            commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
        )


def test_unpinned_source_identity_fails_before_writing(tmp_path: Path) -> None:
    paths, _ = _fixture(tmp_path)
    subject.EXPECTED_SOURCE_SHA256 = ""
    with pytest.raises(subject.PreparationError, match="not pinned"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="a" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
            lean_root_exporter=paths["fake_root_export"],  # type: ignore[arg-type]
            lean_exporter=paths["fake_export"],  # type: ignore[arg-type]
            commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
        )
    assert not paths["output"].exists()


def test_existing_cell_mutation_and_symlink_are_rejected(tmp_path: Path) -> None:
    paths, _, _ = _prepare(tmp_path)
    cell = _cell(paths["output"], 0, "none")
    cell.write_bytes(cell.read_bytes() + b"4 0\n")
    with pytest.raises(subject.PreparationError, match="not empty"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="a" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
            lean_root_exporter=paths["fake_root_export"],  # type: ignore[arg-type]
            lean_exporter=paths["fake_export"],  # type: ignore[arg-type]
            commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
        )
    cell.unlink()
    target = cell.with_name("target.cnf")
    target.write_bytes(b"x")
    cell.symlink_to(target)
    with pytest.raises(subject.PreparationError, match="not empty"):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="a" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
            lean_root_exporter=paths["fake_root_export"],  # type: ignore[arg-type]
            lean_exporter=paths["fake_export"],  # type: ignore[arg-type]
            commit_verifier=paths["fake_commit_verify"],  # type: ignore[arg-type]
        )


def test_exporter_invocation_uses_exact_cli_category(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    lean_root = tmp_path / "lean"
    exporter = lean_root / "Exporter.lean"
    lean_root.mkdir()
    exporter.write_text("def main : IO Unit := pure ()\n")
    output = tmp_path / "out.cnf"
    observed: list[object] = []

    def fake_run(command: list[str], *, cwd: Path, check: bool) -> None:
        observed.extend((command, cwd, check))

    monkeypatch.setattr(subject.subprocess, "run", fake_run)
    subject.run_lean_export(tmp_path, exporter, 12, "unique-06", output)
    assert observed[0] == [
        "lake",
        "env",
        "lean",
        "--run",
        "Exporter.lean",
        "12",
        "6",
        str(output),
    ]
    assert observed[1:] == [lean_root, True]


def test_root_exporter_invocation_uses_authoritative_root_mode(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    lean_root = tmp_path / "lean"
    exporter = lean_root / "Exporter.lean"
    lean_root.mkdir()
    exporter.write_text("def main : IO Unit := pure ()\n")
    output = tmp_path / "root.cnf"
    observed: list[object] = []

    def fake_run(command: list[str], *, cwd: Path, check: bool) -> None:
        observed.extend((command, cwd, check))

    monkeypatch.setattr(subject.subprocess, "run", fake_run)
    subject.run_lean_root_export(tmp_path, exporter, output)
    assert observed == [
        ["lake", "env", "lean", "--run", "Exporter.lean", "root", str(output)],
        lean_root,
        True,
    ]


def test_committed_support_requires_exact_git_blob_bytes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    source = tmp_path / "source.lean"
    source.write_bytes(b"source bytes\n")
    observed: list[object] = []

    def fake_run(
        command: list[str],
        *,
        cwd: Path,
        check: bool,
        capture_output: bool,
    ) -> subprocess.CompletedProcess[bytes]:
        observed.extend((command, cwd, check, capture_output))
        stdout = (
            b"commit\n" if command[1:3] == ["cat-file", "-t"] else source.read_bytes()
        )
        return subprocess.CompletedProcess(command, 0, stdout=stdout)

    monkeypatch.setattr(subject.subprocess, "run", fake_run)
    commit = "b" * 40
    subject.verify_committed_support(tmp_path, commit, (source,))
    assert observed == [
        ["git", "cat-file", "-t", commit],
        tmp_path,
        True,
        True,
        ["git", "show", f"{commit}:source.lean"],
        tmp_path,
        True,
        True,
    ]

    def wrong_run(
        command: list[str], **_kwargs: object
    ) -> subprocess.CompletedProcess[bytes]:
        stdout = b"commit\n" if command[1:3] == ["cat-file", "-t"] else b"different\n"
        return subprocess.CompletedProcess(command, 0, stdout=stdout)

    monkeypatch.setattr(subject.subprocess, "run", wrong_run)
    with pytest.raises(subject.PreparationError, match="differs from source commit"):
        subject.verify_committed_support(tmp_path, commit, (source,))


def test_committed_support_rejects_noncommit_object(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    source = tmp_path / "source.lean"
    source.write_bytes(b"source bytes\n")

    def fake_run(
        command: list[str], **_kwargs: object
    ) -> subprocess.CompletedProcess[bytes]:
        return subprocess.CompletedProcess(command, 0, stdout=b"tree\n")

    monkeypatch.setattr(subject.subprocess, "run", fake_run)
    with pytest.raises(subject.PreparationError, match="is not a commit"):
        subject.verify_committed_support(tmp_path, "b" * 40, (source,))


def test_regular_file_gate_rejects_hardlink(tmp_path: Path) -> None:
    source = tmp_path / "source"
    alias = tmp_path / "alias"
    source.write_bytes(b"payload")
    alias.hardlink_to(source)
    with pytest.raises(subject.PreparationError, match="exactly one hard link"):
        subject._require_regular(source, "source")
