# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Adversarial tests for the six-hit-bisector successor preparer."""

from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
from typing import Any

import check_worktree_hygiene as hygiene
import prepare_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_six_hit_bisector_physical_slice_cells as subject
import pytest


def _root() -> bytes:
    return b"p cnf 308 2\n1 0\n-2 3 0\n"


def _successor(
    *,
    suffix: tuple[tuple[int, ...], ...] | None = None,
    parent: bytes | None = None,
) -> bytes:
    parent = _root() if parent is None else parent
    clauses = subject.EXPECTED_SIX_HIT_SUFFIX if suffix is None else suffix
    body = parent.split(b"\n", 1)[1]
    suffix_bytes = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode() for clause in clauses
    )
    return f"p cnf 308 {2 + len(clauses)}\n".encode() + body + suffix_bytes


def _fixture(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, *, register_root: bool = True
) -> tuple[dict[str, Any], list[tuple[int, str]]]:
    original_parent = tmp_path / "original-parent.cnf"
    original_parent.write_bytes(_root())
    parent = tmp_path / "root.cnf"
    parent.write_bytes(_successor())
    variable_map = tmp_path / "variable-map.json"
    variable_map.write_bytes(b'{"variables":308}\n')
    source = tmp_path / "source.lean"
    source.write_bytes(b"theorem source : True := by trivial\n")
    root_source = tmp_path / "root-source.lean"
    root_source.write_bytes(b"def root : List Nat := []\n")
    exporter = tmp_path / "exporter.lean"
    exporter.write_bytes(b"def main : IO Unit := pure ()\n")
    original_parent_exporter = tmp_path / "original-exporter.lean"
    original_parent_exporter.write_bytes(b"def main : IO Unit := pure ()\n")
    delegated_preparer = tmp_path / "delegated-preparer.py"
    delegated_preparer.write_bytes(b"def delegated(): return True\n")
    hardened_preparer = tmp_path / "hardened-preparer.py"
    hardened_preparer.write_bytes(b"def hardened(): return True\n")
    target_preparer = tmp_path / (
        "scripts/prepare_exact17_sparse_six_four_row_bisector_"
        "eight_hit_two_kalmanson_six_hit_bisector_physical_slice_cells.py"
    )
    target_preparer.parent.mkdir(parents=True)
    target_preparer.write_bytes(b"def target_preparer(): return True\n")
    target_test = tmp_path / (
        "scripts/test_prepare_exact17_sparse_six_four_row_bisector_"
        "eight_hit_two_kalmanson_six_hit_bisector_physical_slice_cells.py"
    )
    target_test.write_bytes(b"def target_test(): return True\n")
    production_config = tmp_path / subject.PRODUCTION_CONFIG_RELATIVE
    production_config.parent.mkdir(parents=True)
    run_id = "physical-slice-cell-campaign-v4"
    generated_root = f"scratch/runs/{subject.LANE_ID}/{run_id}"
    output = tmp_path / generated_root
    output.parent.mkdir(parents=True)
    checkpoint = tmp_path / "checkpoint.json"
    checkpoint_payload = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": subject.LANE_ID,
        "base_head": subject.BASE_HEAD,
        "owned_paths": [
            subject.PRODUCTION_CONFIG_RELATIVE.as_posix(),
            (
                "scripts/prepare_exact17_sparse_six_four_row_bisector_"
                "eight_hit_two_kalmanson_six_hit_bisector_physical_slice_cells.py"
            ),
            (
                "scripts/test_prepare_exact17_sparse_six_four_row_bisector_"
                "eight_hit_two_kalmanson_six_hit_bisector_physical_slice_cells.py"
            ),
        ],
        "generated_roots": [generated_root] if register_root else [],
        "durable_paths": [
            delegated_preparer.relative_to(tmp_path).as_posix(),
            hardened_preparer.relative_to(tmp_path).as_posix(),
        ],
    }
    checkpoint_self_hash = subject.sha256_bytes(
        subject.canonical_json_bytes(checkpoint_payload)
    )
    checkpoint_payload["manifest_sha256"] = checkpoint_self_hash
    checkpoint.write_bytes(subject.canonical_json_bytes(checkpoint_payload))
    support_paths = {
        "source": source,
        "root_source": root_source,
        "exporter": exporter,
        "original_parent_exporter": original_parent_exporter,
        "variable_map": variable_map,
    }
    support = {
        label: {
            "path": path.relative_to(tmp_path).as_posix(),
            "sha256": _sha(path),
            "bytes": path.stat().st_size,
        }
        for label, path in support_paths.items()
    }
    support["delegated_preparer"] = {
        "path": delegated_preparer.relative_to(tmp_path).as_posix(),
        "sha256": _sha(delegated_preparer),
        "bytes": delegated_preparer.stat().st_size,
        "commit": "a" * 40,
    }
    support["hardened_preparer"] = {
        "path": hardened_preparer.relative_to(tmp_path).as_posix(),
        "sha256": _sha(hardened_preparer),
        "bytes": hardened_preparer.stat().st_size,
        "commit": "a" * 40,
    }
    support["checkpoint"] = {
        "path": checkpoint.relative_to(tmp_path).as_posix(),
        "sha256": _sha(checkpoint),
        "bytes": checkpoint.stat().st_size,
        "manifest_sha256": checkpoint_self_hash,
    }
    config_payload = {
        "schema": subject.PRODUCTION_CONFIG_SCHEMA,
        "lane_id": subject.LANE_ID,
        "base_head": subject.BASE_HEAD,
        "generated_root": generated_root,
        "source_commit": "a" * 40,
        "target_code": {
            "commit": "b" * 40,
            "preparer": {
                "path": target_preparer.relative_to(tmp_path).as_posix(),
                "sha256": _sha(target_preparer),
                "bytes": target_preparer.stat().st_size,
            },
            "test": {
                "path": target_test.relative_to(tmp_path).as_posix(),
                "sha256": _sha(target_test),
                "bytes": target_test.stat().st_size,
            },
        },
        "support": support,
    }
    production_config.write_bytes(subject.canonical_json_bytes(config_payload))
    monkeypatch.setattr(subject, "ORIGINAL_PARENT_CLAUSES", 2)
    monkeypatch.setattr(subject, "PARENT_CLAUSES", 6)
    monkeypatch.setattr(subject, "CELL_CLAUSES", 12)
    calls: list[tuple[int, str]] = []

    def fake_root_export(_repo: Path, _exporter: Path, output: Path) -> None:
        calls.append((-1, "root"))
        if _exporter == original_parent_exporter:
            output.write_bytes(original_parent.read_bytes())
        else:
            assert _exporter == exporter
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
        assert paths == (
            source,
            root_source,
            exporter,
            original_parent_exporter,
            delegated_preparer,
            hardened_preparer,
        )

    def fake_dependency_commit_verify(
        _repo: Path, delegated: Path, hardened: Path
    ) -> None:
        assert delegated == delegated_preparer
        assert hardened == hardened_preparer

    def fake_config_blob_reader(_repo: Path, commit: str, relative: str) -> bytes:
        assert commit == "c" * 40
        assert relative == subject.PRODUCTION_CONFIG_RELATIVE.as_posix()
        return production_config.read_bytes()

    def fake_target_commit_verify(
        _repo: Path,
        config: subject._ProductionConfig,
        preparer: Path,
        test: Path,
    ) -> None:
        assert config.value["target_code"]["commit"] == "b" * 40
        assert preparer == target_preparer
        assert test == target_test

    return (
        {
            "parent": parent,
            "original_parent": original_parent,
            "variable_map": variable_map,
            "source": source,
            "root_source": root_source,
            "exporter": exporter,
            "original_parent_exporter": original_parent_exporter,
            "delegated_preparer": delegated_preparer,
            "hardened_preparer": hardened_preparer,
            "checkpoint": checkpoint,
            "target_preparer": target_preparer,
            "target_test": target_test,
            "production_config": production_config,
            "output": output,
            "generated_root": generated_root,
            "run_id": run_id,
            "fake_root_export": fake_root_export,
            "fake_export": fake_export,
            "fake_commit_verify": fake_commit_verify,
            "fake_dependency_commit_verify": fake_dependency_commit_verify,
            "fake_config_blob_reader": fake_config_blob_reader,
            "fake_target_commit_verify": fake_target_commit_verify,
        },
        calls,
    )


def _sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _initialize(
    tmp_path: Path, paths: dict[str, Any], *, output_root: Path | None = None
) -> dict[str, Any]:
    return subject.initialize_run_root(
        repo_root=tmp_path,
        production_config_path=paths["production_config"],
        production_config_commit="c" * 40,
        source_path=paths["source"],
        root_source_path=paths["root_source"],
        exporter_path=paths["exporter"],
        original_parent_exporter_path=paths["original_parent_exporter"],
        delegated_preparer_path=paths["delegated_preparer"],
        hardened_preparer_path=paths["hardened_preparer"],
        variable_map_path=paths["variable_map"],
        checkpoint_path=paths["checkpoint"],
        preparer_path=paths["target_preparer"],
        test_path=paths["target_test"],
        output_root=paths["output"] if output_root is None else output_root,
        config_blob_reader=paths["fake_config_blob_reader"],
        commit_verifier=paths["fake_commit_verify"],
        dependency_commit_verifier=paths["fake_dependency_commit_verify"],
        target_commit_verifier=paths["fake_target_commit_verify"],
    )


def _prepare(
    tmp_path: Path,
    paths: dict[str, Any],
    *,
    source_commit: str = "a" * 40,
) -> dict[str, Any]:
    return subject.prepare_campaign(
        repo_root=tmp_path,
        production_config_path=paths["production_config"],
        production_config_commit="c" * 40,
        source_commit=source_commit,
        source_path=paths["source"],
        root_source_path=paths["root_source"],
        exporter_path=paths["exporter"],
        original_parent_exporter_path=paths["original_parent_exporter"],
        delegated_preparer_path=paths["delegated_preparer"],
        hardened_preparer_path=paths["hardened_preparer"],
        variable_map_path=paths["variable_map"],
        checkpoint_path=paths["checkpoint"],
        preparer_path=paths["target_preparer"],
        test_path=paths["target_test"],
        output_root=paths["output"],
        lean_root_exporter=paths["fake_root_export"],
        lean_exporter=paths["fake_export"],
        commit_verifier=paths["fake_commit_verify"],
        dependency_commit_verifier=paths["fake_dependency_commit_verify"],
        config_blob_reader=paths["fake_config_blob_reader"],
        target_commit_verifier=paths["fake_target_commit_verify"],
    )


def _update_config(paths: dict[str, Any], update: Any) -> dict[str, Any]:
    payload = json.loads(paths["production_config"].read_bytes())
    update(payload)
    paths["production_config"].write_bytes(subject.canonical_json_bytes(payload))
    return payload


def _set_parent_pair(
    paths: dict[str, Any],
    original: bytes,
    *,
    suffix: tuple[tuple[int, ...], ...] | None = None,
    successor_parent: bytes | None = None,
) -> None:
    paths["original_parent"].write_bytes(original)
    paths["parent"].write_bytes(
        _successor(
            parent=original if successor_parent is None else successor_parent,
            suffix=suffix,
        )
    )


def _mutate_dimacs_body_in_place_same_size(path: Path) -> None:
    """Change one body byte without replacing the inode or changing file size."""
    with path.open("r+b", buffering=0) as handle:
        payload = handle.read()
        body_offset = payload.index(b"\n") + 1
        replacement = b"2" if payload[body_offset : body_offset + 1] != b"2" else b"1"
        handle.seek(body_offset)
        handle.write(replacement)
        handle.flush()
        os.fsync(handle.fileno())


def test_checked_in_configuration_refuses_production(tmp_path: Path) -> None:
    assert subject.PRODUCTION_PINS_FINALIZED is False
    assert subject.REGISTERED_GENERATED_ROOT == ""
    with pytest.raises(subject.PreparationError, match="pins are provisional"):
        subject._require_production_configuration(tmp_path, tmp_path / "output")


def test_alternate_production_config_path_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    alternate = tmp_path / "alternate-config.json"
    alternate.write_bytes(paths["production_config"].read_bytes())
    with pytest.raises(subject.PreparationError, match="fixed governed path"):
        subject._load_production_config(
            tmp_path, alternate, "c" * 40, paths["fake_config_blob_reader"]
        )


def test_uncommitted_production_config_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)

    def missing_blob(_repo: Path, _commit: str, _relative: str) -> bytes:
        raise subject.PreparationError("committed blob is unavailable")

    with pytest.raises(subject.PreparationError, match="committed blob is unavailable"):
        subject._load_production_config(
            tmp_path, paths["production_config"], "c" * 40, missing_blob
        )


def test_production_config_commit_mismatch_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)

    def exact_commit(_repo: Path, commit: str, _relative: str) -> bytes:
        if commit != "c" * 40:
            raise subject.PreparationError("production config commit mismatch")
        return paths["production_config"].read_bytes()

    with pytest.raises(subject.PreparationError, match="commit mismatch"):
        subject._load_production_config(
            tmp_path, paths["production_config"], "d" * 40, exact_commit
        )


def test_production_config_commit_cannot_equal_target_code_commit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _update_config(
        paths,
        lambda config: config["target_code"].update({"commit": "c" * 40}),
    )
    with pytest.raises(subject.PreparationError, match="form a self-cycle"):
        subject._load_production_config(
            tmp_path,
            paths["production_config"],
            "c" * 40,
            paths["fake_config_blob_reader"],
        )


def test_mutated_production_config_differs_from_committed_blob(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    committed = paths["production_config"].read_bytes()
    payload = json.loads(committed)
    payload["generated_root"] = "mutated-root"
    paths["production_config"].write_bytes(subject.canonical_json_bytes(payload))
    with pytest.raises(
        subject.PreparationError, match="production config digest drifted"
    ):
        subject._load_production_config(
            tmp_path,
            paths["production_config"],
            "c" * 40,
            lambda _repo, _commit, _relative: committed,
        )


def test_production_config_extra_key_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _update_config(paths, lambda config: config.update({"unexpected": True}))
    with pytest.raises(
        subject.PreparationError, match="production config keys drifted"
    ):
        subject._load_production_config(
            tmp_path,
            paths["production_config"],
            "c" * 40,
            paths["fake_config_blob_reader"],
        )


def test_production_config_wrong_pin_type_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _update_config(
        paths,
        lambda config: config["target_code"]["preparer"].update({"bytes": True}),
    )
    with pytest.raises(subject.PreparationError, match="positive integer"):
        subject._load_production_config(
            tmp_path,
            paths["production_config"],
            "c" * 40,
            paths["fake_config_blob_reader"],
        )


@pytest.mark.parametrize(
    ("generated_root", "message"),
    [
        ("scratch/runs/wrong-lane/fixture-run", "must be scratch/runs"),
        (
            f"scratch/runs/{subject.LANE_ID}/extra/fixture-run",
            "must be scratch/runs",
        ),
        (f"scratch/runs/{subject.LANE_ID}/bad id", "invalid shape"),
    ],
)
def test_production_generated_root_layout_and_run_id_are_exact(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    generated_root: str,
    message: str,
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _update_config(
        paths,
        lambda config: config.update({"generated_root": generated_root}),
    )
    config = subject._load_production_config(
        tmp_path,
        paths["production_config"],
        "c" * 40,
        paths["fake_config_blob_reader"],
    )
    try:
        with (
            pytest.raises(subject.PreparationError, match=message),
            subject._configured_production(config),
        ):
            pass
    finally:
        config.close()


def test_authenticated_run_id_replaces_stale_default_and_restores_scope(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    original_run_id = subject.RUN_ID
    original_registered_root = subject.REGISTERED_GENERATED_ROOT
    assert original_run_id != paths["run_id"]
    config = subject._load_production_config(
        tmp_path,
        paths["production_config"],
        "c" * 40,
        paths["fake_config_blob_reader"],
    )
    try:
        with (
            pytest.raises(RuntimeError, match="scope canary"),
            subject._configured_production(config),
        ):
            assert subject.RUN_ID == paths["run_id"]
            assert subject.REGISTERED_GENERATED_ROOT == paths["generated_root"]
            raise RuntimeError("scope canary")
    finally:
        config.close()
    assert subject.RUN_ID == original_run_id
    assert subject.REGISTERED_GENERATED_ROOT == original_registered_root


@pytest.mark.parametrize("role", ["target_preparer", "target_test"])
def test_target_code_live_drift_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, role: str
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    paths[role].write_bytes(paths[role].read_bytes() + b"# live drift\n")
    with pytest.raises(
        subject.PreparationError, match="(?:preparer|test) digest drifted"
    ):
        _initialize(tmp_path, paths)


def test_target_code_commit_blob_mismatch_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    config = subject._load_production_config(
        tmp_path,
        paths["production_config"],
        "c" * 40,
        paths["fake_config_blob_reader"],
    )
    try:
        with pytest.raises(subject.PreparationError, match="committed blob drifted"):
            subject.verify_committed_target_blobs(
                tmp_path,
                config,
                paths["target_preparer"],
                paths["target_test"],
                lambda _repo, _commit, _relative: b"wrong committed blob\n",
            )
    finally:
        config.close()


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
        _initialize(tmp_path, paths, output_root=tmp_path / "other")


def test_requires_pinned_source_commit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    with pytest.raises(
        subject.PreparationError, match="differs from the production pin"
    ):
        _prepare(tmp_path, paths, source_commit="d" * 40)


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
    _update_config(
        paths,
        lambda config: config["support"]["checkpoint"].update(
            {
                "sha256": _sha(paths["checkpoint"]),
                "bytes": paths["checkpoint"].stat().st_size,
            }
        ),
    )
    with pytest.raises(subject.PreparationError, match="self-hash drifted"):
        _initialize(tmp_path, paths)


def test_checkpoint_must_register_delegated_dependencies_as_durable(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    checkpoint = json.loads(paths["checkpoint"].read_bytes())
    checkpoint["durable_paths"] = []
    checkpoint.pop("manifest_sha256")
    checkpoint_self_hash = subject.sha256_bytes(
        subject.canonical_json_bytes(checkpoint)
    )
    checkpoint["manifest_sha256"] = checkpoint_self_hash
    paths["checkpoint"].write_bytes(subject.canonical_json_bytes(checkpoint))
    _update_config(
        paths,
        lambda config: config["support"]["checkpoint"].update(
            {
                "sha256": _sha(paths["checkpoint"]),
                "bytes": paths["checkpoint"].stat().st_size,
                "manifest_sha256": checkpoint_self_hash,
            }
        ),
    )
    with pytest.raises(subject.PreparationError, match="durability does not cover"):
        _initialize(tmp_path, paths)


def test_successor_dimensions_and_exact_six_units() -> None:
    parent = b"p cnf 308 7409265\n1 0\n"
    payload = subject.cell_cnf_bytes(parent, 16, "unique-10")
    lines = payload.splitlines()
    assert lines[0] == b"p cnf 308 7409271"
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


def test_six_hit_bisector_suffix_and_canary_are_exact() -> None:
    assert subject.EXPECTED_SIX_HIT_SUFFIX == (
        (-307, -155, -167, -28, -31, -223, -232),
        (-307, -60, -58, -141, -143, -111, -107),
        (-308, -206, -218, -28, -31, -223, -232),
        (-308, -60, -58, -141, -143, -111, -107),
    )
    assert subject.CANARY_ACTIVE_CLAUSE == (
        -307,
        -60,
        -58,
        -141,
        -143,
        -111,
        -107,
    )
    assert subject.PARENT_VARIABLES == 308
    assert subject.ORIGINAL_PARENT_CLAUSES == 7_409_261
    assert subject.PARENT_CLAUSES == 7_409_265
    assert subject.CELL_CLAUSES == 7_409_271


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
    assert run["run_id"] == paths["run_id"]
    assert run["owner"] == subject.RUN_OWNER == "exact17-six-hit-bisector-preparer"
    assert run["root"] == paths["generated_root"]


def test_initialized_manifest_satisfies_full_standard_hygiene_contract(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    raw = (paths["output"] / "run_manifest.json").read_bytes()
    checkpoint = hygiene.Checkpoint(
        path=paths["checkpoint"].relative_to(tmp_path).as_posix(),
        lane_id=subject.LANE_ID,
        owner=subject.RUN_OWNER,
        base_head=subject.BASE_HEAD,
        owned_paths=(),
        generated_roots=(paths["generated_root"],),
        durable_paths=(),
        raw_sha256=_sha(paths["checkpoint"]),
    )
    value, authenticated_paths = hygiene._validate_standard_run_manifest(
        tmp_path, paths["generated_root"], checkpoint, raw
    )
    assert set(value) == hygiene._RUN_MANIFEST_KEYS
    assert value["schema"] == hygiene.RUN_MANIFEST_SCHEMA
    assert value["lane_id"] == checkpoint.lane_id
    assert value["run_id"] == paths["run_id"]
    assert value["root"] == paths["generated_root"]
    assert value["owner"] == checkpoint.owner
    assert value["base_head"] == checkpoint.base_head
    assert value["created_utc"] == "2026-08-21T00:00:00Z"
    assert value["output_classes"] == list(hygiene.GENERATED_OUTPUT_CLASSES)
    assert value["source_digests"]
    assert value["input_digests"]
    assert authenticated_paths
    assert value["manifest_sha256"] == hygiene.manifest_self_hash(value)


def test_cli_initialize_run_root_is_offline_and_does_not_export(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    source = tmp_path / "source.lean"
    root_source = tmp_path / "root.lean"
    exporter = tmp_path / "exporter.lean"
    original_parent_exporter = tmp_path / "original-exporter.lean"
    checkpoint = tmp_path / "checkpoint.json"
    production_config = tmp_path / "production-config.json"
    output = tmp_path / "output"
    for path in (source, root_source, exporter, original_parent_exporter, checkpoint):
        path.write_text("fixture")
    production_config.write_text("fixture")
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
                "--original-parent-exporter",
                str(original_parent_exporter),
                "--checkpoint",
                str(checkpoint),
                "--production-config",
                str(production_config),
                "--production-config-commit",
                "c" * 40,
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
        "original_parent_exporter_path": original_parent_exporter,
        "checkpoint_path": checkpoint,
        "production_config_path": production_config,
        "production_config_commit": "c" * 40,
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
    assert calls[:2] == [(-1, "root"), (-1, "root")]
    assert calls[2:] == list(subject.DIRECT_SENTINELS)
    cells = paths["output"] / "artifacts" / "cells"
    assert len(list(cells.iterdir())) == 76
    campaign = json.loads(
        (paths["output"] / "artifacts" / "campaign-manifest.json").read_bytes()
    )
    assert campaign["schema"] == subject.CAMPAIGN_SCHEMA
    assert campaign["cell_count"] == 76
    assert campaign["source"]["source_commit"] == "a" * 40
    assert campaign["source"]["parent_novelty"]["parent_subsumer_count"] == [
        0,
        0,
        0,
        0,
    ]
    assert report["parent_novelty"]["successor_multiplicity"] == [1, 1, 1, 1]
    first = campaign["cells"][0]
    producer = json.loads((tmp_path / first["producer_manifest"]["path"]).read_bytes())
    wave = json.loads((tmp_path / first["wave_manifest"]["path"]).read_bytes())
    expected_identity = f"{first['cell_id']}-{paths['run_id']}"
    assert campaign["run_id"] == paths["run_id"]
    assert report["run_id"] == paths["run_id"]
    assert producer["producer_id"] == expected_identity
    assert wave["wave_id"] == expected_identity
    assert producer["source_manifest"]["finite_schema"] == subject.FINITE_SCHEMA
    assert producer["source_manifest"]["source_theorem"] == subject.SOURCE_THEOREM
    assert producer["parent_novelty"] == campaign["source"]["parent_novelty"]
    assert producer["parent_novelty"]["policy"]["subsumption"].startswith(
        "parent literal-set subset"
    )
    dependencies = producer["delegated_dependencies"]
    assert dependencies == campaign["source"]["delegated_dependencies"]
    assert [item["commit"] for item in dependencies["dependencies"]] == [
        "a" * 40,
        "a" * 40,
    ]
    production = producer["production_config"]
    assert production == campaign["source"]["production_config"]
    assert production == report["production_config"]
    assert production["commit"] == "c" * 40
    assert production["sha256"] == _sha(paths["production_config"])
    assert production["bytes"] == paths["production_config"].stat().st_size
    assert production["target_code"]["commit"] == "b" * 40
    assert (
        production["target_code"]["preparer"]
        == json.loads(paths["production_config"].read_bytes())["target_code"][
            "preparer"
        ]
    )
    assert (
        production["target_code"]["test"]
        == json.loads(paths["production_config"].read_bytes())["target_code"]["test"]
    )
    production_sha256 = subject.sha256_bytes(subject.canonical_json_bytes(production))
    assert campaign["source"]["production_config_sha256"] == production_sha256
    assert report["production_config_sha256"] == production_sha256
    assert producer["production_config_sha256"] == production_sha256
    assert producer["source_manifest"]["production_config"] == production
    assert producer["source_manifest"]["production_config_sha256"] == production_sha256
    root_producer = json.loads(
        (paths["output"] / "artifacts" / "root-producer-manifest.json").read_bytes()
    )
    assert root_producer["run_id"] == paths["run_id"]
    assert root_producer["production_config"] == production
    assert root_producer["production_config_sha256"] == production_sha256
    producer_sha256 = _sha(tmp_path / first["producer_manifest"]["path"])
    assert first["producer_manifest"]["sha256"] == producer_sha256
    assert wave["encoding"]["producer_manifest_sha256"] == producer_sha256
    run = json.loads((paths["output"] / "run_manifest.json").read_bytes())
    assert set(run) == {
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
    assert "delegated-preparer.py" in run["source_digests"]
    assert "hardened-preparer.py" in run["source_digests"]
    assert (
        paths["target_preparer"].relative_to(tmp_path).as_posix()
        in run["source_digests"]
    )
    assert (
        paths["target_test"].relative_to(tmp_path).as_posix() in run["source_digests"]
    )
    assert (
        run["source_digests"][subject.PRODUCTION_CONFIG_RELATIVE.as_posix()]
        == production["sha256"]
    )
    assert wave["encoding"]["num_clauses"] == 12


def test_preparation_uses_owned_builders_and_v4_identity_everywhere(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)

    def forbidden_predecessor_builder(*_args: Any, **_kwargs: Any) -> bytes:
        raise AssertionError("accepted predecessor manifest builder was called")

    for name in ("build_producer", "build_root_producer", "build_wave"):
        monkeypatch.setattr(subject.accepted, name, forbidden_predecessor_builder)

    report = _prepare(tmp_path, paths)
    run_id = paths["run_id"]
    assert run_id == "physical-slice-cell-campaign-v4"
    assert report["run_id"] == run_id
    run = json.loads((paths["output"] / "run_manifest.json").read_bytes())
    assert run["run_id"] == run_id
    assert run["root"] == f"scratch/runs/{subject.LANE_ID}/{run_id}"
    root_producer = json.loads(
        (paths["output"] / "artifacts" / "root-producer-manifest.json").read_bytes()
    )
    assert root_producer["run_id"] == run_id
    campaign = json.loads(
        (paths["output"] / "artifacts" / "campaign-manifest.json").read_bytes()
    )
    assert campaign["run_id"] == run_id
    assert len(campaign["cells"]) == 76
    for cell in campaign["cells"]:
        identity = f"{cell['cell_id']}-{run_id}"
        producer = json.loads(
            (tmp_path / cell["producer_manifest"]["path"]).read_bytes()
        )
        wave = json.loads((tmp_path / cell["wave_manifest"]["path"]).read_bytes())
        assert producer["producer_id"] == identity
        assert wave["wave_id"] == identity


def test_true_eight_hit_parent_duplicate_suffix_clause_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    duplicate = subject.EXPECTED_SIX_HIT_SUFFIX[0]
    original = (
        b"p cnf 308 2\n" + (" ".join(map(str, duplicate)) + " 0\n").encode() + b"1 0\n"
    )
    _set_parent_pair(paths, original)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="already occurs"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]
    assert not (paths["output"] / "artifacts" / "cells").exists()


def test_historical_parent_duplicate_literals_are_accepted_semantically(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    original = b"p cnf 308 2\n1 1 0\n-2 3 -2 0\n"
    _set_parent_pair(paths, original)
    _initialize(tmp_path, paths)
    report = _prepare(tmp_path, paths)
    assert report["cell_count"] == 76
    assert report["parent_novelty"]["exact_parent_multiplicity"] == [0, 0, 0, 0]
    assert report["parent_novelty"]["parent_subsumer_count"] == [0, 0, 0, 0]
    assert report["parent_novelty"]["successor_multiplicity"] == [1, 1, 1, 1]


def test_historical_duplicate_literals_still_trigger_set_subsumption(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    original = b"p cnf 308 2\n-307 -307 0\n1 0\n"
    _set_parent_pair(paths, original)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="subsumes"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


def test_parent_strict_subsumer_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    original = b"p cnf 308 2\n-307 0\n1 0\n"
    _set_parent_pair(paths, original)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="subsumes"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


def test_new_suffix_clause_repeated_literal_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    suffix = list(subject.EXPECTED_SIX_HIT_SUFFIX)
    suffix[0] = suffix[0] + (suffix[0][0],)
    _set_parent_pair(paths, _root(), suffix=tuple(suffix))
    _initialize(tmp_path, paths)
    with pytest.raises(
        subject.PreparationError,
        match="six-hit-bisector suffix clause 0 repeats a literal",
    ):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


def test_generated_cell_repeated_unit_clause_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        subject.accepted.hardened,
        "category_units",
        lambda _center, _category: (290, -1, -2, -3, -4),
    )
    with pytest.raises(subject.PreparationError, match="repeats a unit clause"):
        subject.category_units(0, "none")


@pytest.mark.parametrize("mutation", ["value", "order", "guard", "duplicate"])
def test_wrong_suffix_value_order_guard_or_duplicate_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, mutation: str
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    suffix = list(subject.EXPECTED_SIX_HIT_SUFFIX)
    if mutation == "value":
        suffix[0] = suffix[0][:-1] + (-6,)
    elif mutation == "order":
        suffix[0], suffix[1] = suffix[1], suffix[0]
    elif mutation == "guard":
        suffix[0] = (-306,) + suffix[0][1:]
    else:
        suffix[1] = suffix[0]
    _set_parent_pair(paths, _root(), suffix=tuple(suffix))
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="suffix order/value drifted"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


def test_successor_parent_prefix_mutation_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    mutated = b"p cnf 308 2\n1 0\n-2 4 0\n"
    _set_parent_pair(paths, _root(), successor_parent=mutated)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="parent prefix drifted"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


@pytest.mark.parametrize(
    "label",
    [
        "source",
        "root_source",
        "exporter",
        "original_parent_exporter",
        "delegated_preparer",
        "hardened_preparer",
        "variable_map",
        "checkpoint",
    ],
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


@pytest.mark.parametrize("attack", ["mutate", "replace"])
def test_production_config_mutation_or_replacement_during_export_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, attack: str
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)

    def attacked_root_export(_repo: Path, _exporter: Path, output: Path) -> None:
        calls.append((-1, "root"))
        target = paths["production_config"]
        if attack == "mutate":
            target.write_bytes(target.read_bytes() + b" ")
        else:
            original = target.with_suffix(".original")
            target.rename(original)
            target.write_bytes(original.read_bytes())
        output.write_bytes(paths["original_parent"].read_bytes())

    paths["fake_root_export"] = attacked_root_export
    with pytest.raises(
        subject.PreparationError, match="production[_ ]config .*drifted"
    ):
        _prepare(tmp_path, paths)


@pytest.mark.parametrize("dependency", ["delegated_preparer", "hardened_preparer"])
@pytest.mark.parametrize("attack", ["mutate", "replace"])
def test_dependency_mutation_or_inode_swap_during_export_fails_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    dependency: str,
    attack: str,
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)

    def attacked_root_export(_repo: Path, _exporter: Path, output: Path) -> None:
        calls.append((-1, "root"))
        target = paths[dependency]
        if attack == "mutate":
            target.write_bytes(target.read_bytes() + b"# mutation\n")
        else:
            original = target.with_suffix(".original")
            target.rename(original)
            target.write_bytes(original.read_bytes())
        output.write_bytes(paths["original_parent"].read_bytes())

    paths["fake_root_export"] = attacked_root_export
    with pytest.raises(subject.PreparationError, match=f"{dependency} .*drifted"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root")]


def test_dependency_git_show_blob_mismatch_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    delegated = tmp_path / "delegated.py"
    hardened = tmp_path / "hardened.py"
    delegated.write_bytes(b"delegated\n")
    hardened.write_bytes(b"hardened\n")
    monkeypatch.setattr(subject, "DELEGATED_PREPARER_COMMIT", "a" * 40)
    monkeypatch.setattr(subject, "HARDENED_PREPARER_COMMIT", "a" * 40)
    monkeypatch.setattr(subject, "EXPECTED_DELEGATED_PREPARER_SHA256", _sha(delegated))
    monkeypatch.setattr(subject, "EXPECTED_DELEGATED_PREPARER_BYTES", 10)
    monkeypatch.setattr(subject, "EXPECTED_HARDENED_PREPARER_SHA256", _sha(hardened))
    monkeypatch.setattr(subject, "EXPECTED_HARDENED_PREPARER_BYTES", 9)

    def fake_run(command: list[str], **_kwargs: Any) -> Any:
        if command[1:3] == ["cat-file", "-t"]:
            return subject.subprocess.CompletedProcess(command, 0, stdout=b"commit\n")
        assert command[1] == "show"
        return subject.subprocess.CompletedProcess(command, 0, stdout=b"wrong blob\n")

    monkeypatch.setattr(subject.subprocess, "run", fake_run)
    with pytest.raises(subject.PreparationError, match="committed blob drifted"):
        subject.verify_committed_dependency_blobs(tmp_path, delegated, hardened)


@pytest.mark.parametrize("attack", ["mutate", "replace"])
def test_generated_cell_path_race_fails_before_manifest_reference(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, attack: str
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    real_file_ref = subject.accepted._file_ref
    attacked = False

    def raced_file_ref(
        root: Path, path: Path, sha256: str, size: int
    ) -> dict[str, Any]:
        nonlocal attacked
        if not attacked:
            attacked = True
            if attack == "mutate":
                path.write_bytes(path.read_bytes() + b"mutation\n")
            else:
                original = path.with_suffix(".original")
                path.rename(original)
                path.write_bytes(original.read_bytes())
        return real_file_ref(root, path, sha256, size)

    monkeypatch.setattr(subject.accepted, "_file_ref", raced_file_ref)
    with pytest.raises(subject.PreparationError, match="generated cell .* drifted"):
        _prepare(tmp_path, paths)
    assert attacked


def test_generated_cell_same_size_in_place_mutation_fails_pre_reference_rehash(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    real_secure_write_once = subject._secure_write_once
    attacked = False

    def raced_secure_write_once(path: Path, payload: bytes) -> None:
        nonlocal attacked
        real_secure_write_once(path, payload)
        if not attacked and path.name == "wave-manifest.json":
            attacked = True
            cnf_path = next(path.parent.glob("*.cnf"))
            _mutate_dimacs_body_in_place_same_size(cnf_path)

    monkeypatch.setattr(subject, "_secure_write_once", raced_secure_write_once)
    with pytest.raises(
        subject.PreparationError, match="generated cell content drifted"
    ):
        _prepare(tmp_path, paths)
    assert attacked


def test_generated_cell_same_size_in_place_mutation_fails_before_manifest_reference(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    real_file_ref = subject.accepted._file_ref
    attacked = False

    def raced_file_ref(
        root: Path, path: Path, sha256: str, size: int
    ) -> dict[str, Any]:
        nonlocal attacked
        if not attacked:
            attacked = True
            _mutate_dimacs_body_in_place_same_size(path)
        return real_file_ref(root, path, sha256, size)

    monkeypatch.setattr(subject.accepted, "_file_ref", raced_file_ref)
    with pytest.raises(
        subject.PreparationError, match="generated cell content drifted"
    ):
        _prepare(tmp_path, paths)
    assert attacked


def test_generated_cell_same_size_in_place_mutation_fails_final_campaign_rehash(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    _initialize(tmp_path, paths)
    real_secure_write_once = subject._secure_write_once
    attacked = False

    def raced_secure_write_once(path: Path, payload: bytes) -> None:
        nonlocal attacked
        real_secure_write_once(path, payload)
        if not attacked and path.name == "preparation-report.json":
            attacked = True
            first_cell = next((paths["output"] / "artifacts" / "cells").glob("*/*.cnf"))
            _mutate_dimacs_body_in_place_same_size(first_cell)

    monkeypatch.setattr(subject, "_secure_write_once", raced_secure_write_once)
    with pytest.raises(
        subject.PreparationError, match="generated cell content drifted"
    ):
        _prepare(tmp_path, paths)
    assert attacked


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
