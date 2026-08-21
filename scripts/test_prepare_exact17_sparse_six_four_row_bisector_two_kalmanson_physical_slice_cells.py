# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Adversarial tests for the two-Kalmanson successor preparer."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path
from typing import Any

import prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_physical_slice_cells as subject
import pytest


def _root() -> bytes:
    return b"p cnf 308 2\n1 0\n-2 3 0\n"


def _fixture(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, *, register_root: bool = True
) -> tuple[dict[str, Any], list[tuple[int, str]]]:
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
    checkpoint = tmp_path / "checkpoint.json"
    checkpoint_payload = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": subject.LANE_ID,
        "base_head": subject.BASE_HEAD,
        "owned_paths": [
            (
                "scripts/prepare_exact17_sparse_six_four_row_bisector_"
                "two_kalmanson_physical_slice_cells.py"
            ),
            (
                "scripts/test_prepare_exact17_sparse_six_four_row_bisector_"
                "two_kalmanson_physical_slice_cells.py"
            ),
        ],
        "generated_roots": ["output"] if register_root else [],
    }
    checkpoint_self_hash = subject.sha256_bytes(
        subject.canonical_json_bytes(checkpoint_payload)
    )
    checkpoint_payload["manifest_sha256"] = checkpoint_self_hash
    checkpoint.write_bytes(subject.canonical_json_bytes(checkpoint_payload))
    monkeypatch.setattr(subject, "PARENT_CLAUSES", 2)
    monkeypatch.setattr(subject, "CELL_CLAUSES", 8)
    monkeypatch.setattr(subject, "EXPECTED_SOURCE_SHA256", _sha(source))
    monkeypatch.setattr(subject, "EXPECTED_ROOT_SOURCE_SHA256", _sha(root_source))
    monkeypatch.setattr(subject, "EXPECTED_EXPORTER_SHA256", _sha(exporter))
    monkeypatch.setattr(subject, "EXPECTED_VARIABLE_MAP_SHA256", _sha(variable_map))
    monkeypatch.setattr(subject, "EXPECTED_CHECKPOINT_SHA256", _sha(checkpoint))
    monkeypatch.setattr(
        subject, "EXPECTED_CHECKPOINT_MANIFEST_SHA256", checkpoint_self_hash
    )
    monkeypatch.setattr(subject, "PINNED_SOURCE_COMMIT", "a" * 40)
    monkeypatch.setattr(subject, "REGISTERED_GENERATED_ROOT", "output")
    calls: list[tuple[int, str]] = []

    def fake_root_export(_repo: Path, _exporter: Path, output: Path) -> None:
        calls.append((-1, "root"))
        output.write_bytes(parent.read_bytes())

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

    def fake_commit_verify(_repo: Path, commit: str, paths: tuple[Path, ...]) -> None:
        assert commit == "a" * 40
        assert paths == (source, root_source, exporter)

    return (
        {
            "parent": parent,
            "variable_map": variable_map,
            "source": source,
            "root_source": root_source,
            "exporter": exporter,
            "checkpoint": checkpoint,
            "output": tmp_path / "output",
            "fake_root_export": fake_root_export,
            "fake_export": fake_export,
            "fake_commit_verify": fake_commit_verify,
        },
        calls,
    )


def _sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _initialize(tmp_path: Path, paths: dict[str, Any]) -> dict[str, Any]:
    return subject.initialize_run_root(
        repo_root=tmp_path,
        source_path=paths["source"],
        root_source_path=paths["root_source"],
        exporter_path=paths["exporter"],
        variable_map_path=paths["variable_map"],
        checkpoint_path=paths["checkpoint"],
        output_root=paths["output"],
    )


def _prepare(tmp_path: Path, paths: dict[str, Any]) -> dict[str, Any]:
    return subject.prepare_campaign(
        repo_root=tmp_path,
        source_commit="a" * 40,
        source_path=paths["source"],
        root_source_path=paths["root_source"],
        exporter_path=paths["exporter"],
        variable_map_path=paths["variable_map"],
        checkpoint_path=paths["checkpoint"],
        output_root=paths["output"],
        lean_root_exporter=paths["fake_root_export"],
        lean_exporter=paths["fake_export"],
        commit_verifier=paths["fake_commit_verify"],
    )


def test_prepare_refuses_before_registered_manifest_skeleton(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    with pytest.raises(
        subject.PreparationError, match="governed run root is unavailable"
    ):
        _prepare(tmp_path, paths)
    assert calls == []
    assert not paths["output"].exists()


def test_requires_exact_registered_output_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    with pytest.raises(subject.PreparationError, match="registered generated root"):
        subject.initialize_run_root(
            repo_root=tmp_path,
            output_root=tmp_path / "other",
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
        )


def test_requires_pinned_source_commit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    with pytest.raises(
        subject.PreparationError, match="differs from the production pin"
    ):
        subject.prepare_campaign(
            repo_root=tmp_path,
            source_commit="b" * 40,
            source_path=paths["source"],
            root_source_path=paths["root_source"],
            exporter_path=paths["exporter"],
            variable_map_path=paths["variable_map"],
            checkpoint_path=paths["checkpoint"],
            output_root=paths["output"],
        )


def test_checkpoint_must_register_generated_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch, register_root=False)
    with pytest.raises(subject.PreparationError, match="does not register"):
        _initialize(tmp_path, paths)


def test_checkpoint_self_hash_must_match_content(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    checkpoint = json.loads(paths["checkpoint"].read_bytes())
    checkpoint["manifest_sha256"] = "0" * 64
    paths["checkpoint"].write_bytes(subject.canonical_json_bytes(checkpoint))
    monkeypatch.setattr(
        subject, "EXPECTED_CHECKPOINT_SHA256", _sha(paths["checkpoint"])
    )
    with pytest.raises(subject.PreparationError, match="self-hash drifted"):
        _initialize(tmp_path, paths)


def test_successor_dimensions_and_exact_six_units() -> None:
    parent = b"p cnf 308 7409261\n1 0\n"
    payload = subject.cell_cnf_bytes(parent, 16, "unique-10")
    lines = payload.splitlines()
    assert lines[0] == b"p cnf 308 7409267"
    assert lines[-6:] == [
        b"306 0",
        b"-279 0",
        b"-280 0",
        b"-281 0",
        b"-282 0",
        b"283 0",
    ]
    assert subject.next_center_variable(0) == 290
    assert subject.next_center_variable(16) == 306


def test_initialize_creates_exact_governed_skeleton(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    result = _initialize(tmp_path, paths)
    assert result["status"] == "RUN_ROOT_INITIALIZED"
    assert calls == []
    assert {path.name for path in paths["output"].iterdir()} == {
        "artifacts",
        "events",
        "tmp",
        "run_manifest.json",
    }
    run = json.loads((paths["output"] / "run_manifest.json").read_bytes())
    assert run["lane_id"] == subject.LANE_ID
    assert run["run_id"] == subject.RUN_ID
    assert run["owner"] == "exact17-two-kalmanson-preparer"
    assert run["root"] == "output"


def test_cli_initialize_run_root_is_offline_and_does_not_export(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    source = tmp_path / "source.lean"
    root_source = tmp_path / "root.lean"
    exporter = tmp_path / "exporter.lean"
    checkpoint = tmp_path / "checkpoint.json"
    output = tmp_path / "output"
    for path in (source, root_source, exporter, checkpoint):
        path.write_text("fixture")
    observed: dict[str, Any] = {}

    def fake_initialize(**kwargs: Any) -> dict[str, str]:
        observed.update(kwargs)
        return {"status": "RUN_ROOT_INITIALIZED"}

    def forbidden_prepare(**_kwargs: Any) -> dict[str, Any]:
        raise AssertionError("preparation/export must not run in initialization mode")

    monkeypatch.setattr(subject, "initialize_run_root", fake_initialize)
    monkeypatch.setattr(subject, "prepare_campaign", forbidden_prepare)
    assert (
        subject.main(
            [
                "--source",
                str(source),
                "--root-source",
                str(root_source),
                "--exporter",
                str(exporter),
                "--checkpoint",
                str(checkpoint),
                "--output-root",
                str(output),
                "--initialize-run-root",
            ]
        )
        == 0
    )
    assert observed == {
        "source_path": source,
        "root_source_path": root_source,
        "exporter_path": exporter,
        "checkpoint_path": checkpoint,
        "output_root": output,
    }
    assert json.loads(capsys.readouterr().out) == {"status": "RUN_ROOT_INITIALIZED"}


def test_prepares_all_76_cells_and_validates_sentinels(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    report = _prepare(tmp_path, paths)
    assert report["status"] == "PREPARED_LOCAL_ONLY"
    assert report["production_run"] is False
    assert report["cell_count"] == 76
    assert report["direct_lean_cells_validated"] == 4
    assert calls[0] == (-1, "root")
    assert calls[1:] == list(subject.DIRECT_SENTINELS)
    cells = paths["output"] / "artifacts" / "cells"
    assert len(list(cells.iterdir())) == 76
    campaign = json.loads(
        (paths["output"] / "artifacts" / "campaign-manifest.json").read_bytes()
    )
    assert campaign["schema"] == subject.CAMPAIGN_SCHEMA
    assert campaign["cell_count"] == 76
    assert campaign["source"]["source_commit"] == "a" * 40
    first = campaign["cells"][0]
    producer = json.loads((tmp_path / first["producer_manifest"]["path"]).read_bytes())
    wave = json.loads((tmp_path / first["wave_manifest"]["path"]).read_bytes())
    assert producer["source_manifest"]["finite_schema"] == subject.FINITE_SCHEMA
    assert producer["source_manifest"]["source_theorem"] == subject.SOURCE_THEOREM
    assert wave["encoding"]["num_clauses"] == 8


@pytest.mark.parametrize(
    "label", ["source", "root_source", "exporter", "variable_map", "checkpoint"]
)
def test_support_digest_mutations_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, label: str
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    paths[label].write_bytes(paths[label].read_bytes() + b"mutation")
    with pytest.raises(subject.PreparationError, match="digest drifted"):
        _initialize(tmp_path, paths)


@pytest.mark.parametrize("mutation", ["manifest", "extra", "nonempty"])
def test_initialized_skeleton_rejects_mutation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, mutation: str
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
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


def test_corrupt_direct_lean_sentinel_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    old_lane = subject.accepted.LANE_ID
    old_category = subject.accepted.category_id

    def corrupt_export(
        _repo: Path,
        _exporter: Path,
        center: int,
        category: str,
        output: Path,
    ) -> None:
        calls.append((center, category))
        output.write_bytes(b"p cnf 308 8\n1 0\n")

    paths["fake_export"] = corrupt_export
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError):
        _prepare(tmp_path, paths)
    assert subject.accepted.LANE_ID == old_lane
    assert subject.accepted.category_id is old_category


def test_preparer_contains_no_piqd_launch_path() -> None:
    source = Path(subject.__file__).read_text()
    assert "prepare-cnf" not in source
    assert "piqc" not in source.lower()
    assert "requests." not in source


def test_private_export_rejects_workspace_symlink_insertion(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "output"
    (run_root / "tmp").mkdir(parents=True)
    outside = tmp_path / "outside.cnf"
    outside.write_bytes(b"outside")
    target = run_root / "tmp" / "published.cnf"
    monkeypatch.setattr(subject, "ROOT", tmp_path)
    monkeypatch.setattr(subject, "REGISTERED_GENERATED_ROOT", "output")

    def insert_symlink(bound: Path, _pass_fds: tuple[int, ...]) -> None:
        bound.unlink()
        bound.symlink_to(outside)

    with pytest.raises(subject.PreparationError, match="reserved inode"):
        subject._publish_private_export(target, insert_symlink)
    assert not target.exists()
    assert outside.read_bytes() == b"outside"
    assert not list((run_root / "tmp").iterdir())


def test_private_export_rejects_final_path_swap_before_publication(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "output"
    (run_root / "tmp").mkdir(parents=True)
    outside = tmp_path / "outside.cnf"
    outside.write_bytes(b"outside")
    target = run_root / "tmp" / "published.cnf"
    monkeypatch.setattr(subject, "ROOT", tmp_path)
    monkeypatch.setattr(subject, "REGISTERED_GENERATED_ROOT", "output")

    def swap_final_path(bound: Path, _pass_fds: tuple[int, ...]) -> None:
        bound.write_bytes(b"p cnf 1 0\n")
        target.symlink_to(outside)

    with pytest.raises(subject.PreparationError, match="target already exists"):
        subject._publish_private_export(target, swap_final_path)
    assert target.is_symlink()
    assert outside.read_bytes() == b"outside"


@pytest.mark.parametrize("attack", ["mutate", "replace"])
def test_support_mutation_or_replacement_during_export_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, attack: str
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)

    def attacked_root_export(_repo: Path, _exporter: Path, output: Path) -> None:
        calls.append((-1, "root"))
        if attack == "mutate":
            paths["source"].write_bytes(b"mutated during export\n")
        else:
            original = paths["source"].with_suffix(".original")
            paths["source"].rename(original)
            paths["source"].write_bytes(original.read_bytes())
        output.write_bytes(paths["parent"].read_bytes())

    paths["fake_root_export"] = attacked_root_export
    with pytest.raises(subject.PreparationError, match="source .*drifted"):
        _prepare(tmp_path, paths)


def test_write_once_symlink_race_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    destination = tmp_path / "artifact.json"
    outside = tmp_path / "outside.json"
    outside.write_bytes(b"outside")
    real_link = subject.os.link
    inserted = False

    def raced_link(
        source: str,
        target: str,
        *,
        src_dir_fd: int | None = None,
        dst_dir_fd: int | None = None,
        follow_symlinks: bool = True,
    ) -> None:
        nonlocal inserted
        if not inserted and target == destination.name:
            inserted = True
            subject.os.symlink(outside, target, dir_fd=dst_dir_fd)
        real_link(
            source,
            target,
            src_dir_fd=src_dir_fd,
            dst_dir_fd=dst_dir_fd,
            follow_symlinks=follow_symlinks,
        )

    monkeypatch.setattr(subject.os, "link", raced_link)
    with pytest.raises(subject.PreparationError, match="concurrent artifact is unsafe"):
        subject._secure_write_once(destination, b"trusted")
    assert destination.is_symlink()
    assert outside.read_bytes() == b"outside"


def test_predecessor_globals_are_restored(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    old_lane = subject.accepted.LANE_ID
    old_category = subject.accepted.category_id
    _initialize(tmp_path, paths)
    assert subject.accepted.LANE_ID == old_lane
    assert subject.accepted.category_id is old_category
