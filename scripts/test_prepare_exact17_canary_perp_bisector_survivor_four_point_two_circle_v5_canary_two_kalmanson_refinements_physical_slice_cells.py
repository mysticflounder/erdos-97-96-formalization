# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Adversarial tests for the V5 canary two-Kalmanson preparer."""

from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
from typing import Any

import check_worktree_hygiene as hygiene
import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_physical_slice_cells as subject
import pytest


def test_target_test_path_is_this_lane() -> None:
    assert subject.TEST_PATH == subject.ROOT / (
        "scripts/test_prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_physical_slice_cells.py"
    )


def test_v5_lane_schemas_paths_and_provisional_globals_are_distinct() -> None:
    assert subject.LANE_ID == (
        "exact17-v5-canary-twok-successor-preparer-20260823"
    )
    assert subject.BASE_HEAD == "9fbf80623b867cb1f319d87649ed9f7fface9469"
    assert subject.PRODUCTION_CONFIG_RELATIVE.as_posix() == (
        "census/p97_search/waves/exact17/"
        "canary-perp-bisector-survivor-four-point-two-circle-"
        "v5-canary-two-kalmanson-preparation-config.json"
    )
    assert subject.PRODUCTION_CONFIG_PATH == (
        subject.ROOT / subject.PRODUCTION_CONFIG_RELATIVE
    )
    for schema in (
        subject.PRODUCTION_CONFIG_SCHEMA,
        subject.SCHEMA,
        subject.CAMPAIGN_SCHEMA,
        subject.FINITE_SCHEMA,
        subject.ROOT_PRODUCER_SCHEMA,
    ):
        assert "v5-canary-two-kalmanson-refinements" in schema
    assert "v5-canary-two-kalmanson-refinements" in subject.category_id(0, "none")
    assert subject.PRODUCTION_PINS_FINALIZED is False
    assert subject.REGISTERED_GENERATED_ROOT == ""


def test_immediate_parent_exporter_is_the_v4_combined_parent() -> None:
    assert subject.IMMEDIATE_PARENT_EXPORTER_PATH == subject.ROOT / (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
        "V4CombinedRefinementsPhysicalSliceCellExport.lean"
    )


def test_immediate_parent_export_uses_root_mode(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    lean_root = tmp_path / "lean"
    exporter = lean_root / "ImmediateParentExport.lean"
    output = tmp_path / "parent.cnf"
    lean_root.mkdir()
    exporter.write_text("def main : IO Unit := pure ()\n")
    commands: list[list[str]] = []

    def fake_run(command: list[str], **_kwargs: Any) -> None:
        commands.append(command)

    sentinel = object()

    def fake_publish(_output: Path, invoke: Any) -> object:
        invoke(output, ())
        return sentinel

    monkeypatch.setattr(subject.subprocess, "run", fake_run)
    monkeypatch.setattr(subject, "_publish_private_export", fake_publish)

    result = subject.run_lean_immediate_parent_export(tmp_path, exporter, output)

    assert result is sentinel
    assert commands == [
        [
            "lake",
            "env",
            "lean",
            "--run",
            "ImmediateParentExport.lean",
            "root",
            str(output),
        ]
    ]


_UNRELATED_PARENT_CLAUSES = (
    (-307, -264, -263, -179),
    (-308, -264, -263, -179),
    (-307, -210),
    (-308, -197),
    (-307, -277, -200),
    (-308, -277, -183),
    (-308, -277, -221),
    # Other short parent clauses are unrelated to the 20 successor slots.
    (-155, -172),
    (-162,),
    (-177,),
    (-149,),
    (-183,),
    (-165,),
    (-194,),
    (-154,),
    *(clause for clause in subject.EXPECTED_PARENT_SUBSUMER_CLAUSES if clause),
)


def _root() -> bytes:
    body = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode()
        for clause in _UNRELATED_PARENT_CLAUSES
    )
    return f"p cnf 308 {len(_UNRELATED_PARENT_CLAUSES)}\n".encode() + body


def _successor(
    *,
    suffix: tuple[tuple[int, ...], ...] | None = None,
    parent: bytes | None = None,
) -> bytes:
    parent = _root() if parent is None else parent
    clauses = (
        subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX
        if suffix is None
        else suffix
    )
    body = parent.split(b"\n", 1)[1]
    parent_clause_count = int(parent.split(b"\n", 1)[0].split()[3])
    suffix_bytes = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode() for clause in clauses
    )
    return (
        f"p cnf 308 {parent_clause_count + len(clauses)}\n".encode()
        + body
        + suffix_bytes
    )


def _assert_expected_strict_new_profile(novelty: dict[str, Any]) -> None:
    counts = novelty["parent_subsumer_count"]
    strict = tuple(index for index, count in enumerate(counts) if count == 0)
    assert tuple(counts) == subject.EXPECTED_PARENT_SUBSUMER_COUNTS
    assert (
        tuple(
            tuple(witness["clause"]) if witness is not None else ()
            for witness in novelty["parent_subsumer_witness"]
        )
        == subject.EXPECTED_PARENT_SUBSUMER_CLAUSES
    )
    assert strict == subject.EXPECTED_STRICT_NEW_SUFFIX_INDICES
    assert novelty["strict_new_suffix_indices"] == list(strict)
    assert novelty["strict_new_suffix_count"] == 20
    assert novelty["strict_new_per_occurrence"] == [1, 2, 3, 3, 2, 2, 4, 3]


def _fixture(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, *, register_root: bool = True
) -> tuple[dict[str, Any], list[tuple[int, str]]]:
    immediate_parent = tmp_path / "immediate-parent.cnf"
    immediate_parent.write_bytes(_root())
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
    immediate_parent_exporter = tmp_path / "immediate-parent-exporter.lean"
    immediate_parent_exporter.write_bytes(b"def main : IO Unit := pure ()\n")
    delegated_preparer = tmp_path / "delegated-preparer.py"
    delegated_preparer.write_bytes(b"def delegated(): return True\n")
    hardened_preparer = tmp_path / "hardened-preparer.py"
    hardened_preparer.write_bytes(b"def hardened(): return True\n")
    target_preparer = tmp_path / (
        "scripts/prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_physical_slice_cells.py"
    )
    target_preparer.parent.mkdir(parents=True)
    target_preparer.write_bytes(b"def target_preparer(): return True\n")
    target_test = tmp_path / (
        "scripts/test_prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_physical_slice_cells.py"
    )
    target_test.write_bytes(b"def target_test(): return True\n")
    production_config = tmp_path / subject.PRODUCTION_CONFIG_RELATIVE
    production_config.parent.mkdir(parents=True)
    run_id = "physical-slice-cell-campaign-v5"
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
            "scripts/prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_physical_slice_cells.py",
            "scripts/test_prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_physical_slice_cells.py",
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
        "immediate_parent_exporter": immediate_parent_exporter,
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
    monkeypatch.setattr(
        subject, "IMMEDIATE_PARENT_CLAUSES", len(_UNRELATED_PARENT_CLAUSES)
    )
    monkeypatch.setattr(
        subject,
        "PARENT_CLAUSES",
        len(_UNRELATED_PARENT_CLAUSES)
        + len(subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX),
    )
    monkeypatch.setattr(subject, "CELL_CLAUSES", subject.PARENT_CLAUSES + 6)
    calls: list[tuple[int, str]] = []

    def fake_root_export(_repo: Path, _exporter: Path, output: Path) -> None:
        calls.append((-1, "root"))
        if _exporter == immediate_parent_exporter:
            output.write_bytes(immediate_parent.read_bytes())
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
            immediate_parent_exporter,
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
            "immediate_parent": immediate_parent,
            "variable_map": variable_map,
            "source": source,
            "root_source": root_source,
            "exporter": exporter,
            "immediate_parent_exporter": immediate_parent_exporter,
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
        immediate_parent_exporter_path=paths["immediate_parent_exporter"],
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
        immediate_parent_exporter_path=paths["immediate_parent_exporter"],
        delegated_preparer_path=paths["delegated_preparer"],
        hardened_preparer_path=paths["hardened_preparer"],
        variable_map_path=paths["variable_map"],
        checkpoint_path=paths["checkpoint"],
        preparer_path=paths["target_preparer"],
        test_path=paths["target_test"],
        output_root=paths["output"],
        lean_root_exporter=paths["fake_root_export"],
        lean_immediate_parent_exporter=paths["fake_root_export"],
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
    immediate: bytes,
    *,
    suffix: tuple[tuple[int, ...], ...] | None = None,
    successor_parent: bytes | None = None,
) -> None:
    paths["immediate_parent"].write_bytes(immediate)
    paths["parent"].write_bytes(
        _successor(
            parent=immediate if successor_parent is None else successor_parent,
            suffix=suffix,
        )
    )


def _validate_parent_novelty_pair(
    tmp_path: Path, parent: bytes, stem: str
) -> dict[str, Any]:
    parent_path = tmp_path / f"{stem}-parent.cnf"
    successor_path = tmp_path / f"{stem}-successor.cnf"
    parent_path.write_bytes(parent)
    successor_path.write_bytes(_successor(parent=parent))
    published_parent = subject._PublishedFile.capture(parent_path, "test parent")
    published_successor = subject._PublishedFile.capture(
        successor_path, "test successor"
    )
    try:
        return subject.validate_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinement_parent_novelty(
            published_parent, published_successor
        )
    finally:
        published_successor.close()
        published_parent.close()


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
    parent = b"p cnf 308 7409780\n1 0\n"
    payload = subject.cell_cnf_bytes(parent, 16, "unique-10")
    lines = payload.splitlines()
    assert lines[0] == b"p cnf 308 7409786"
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


def test_survivor_four_point_two_circle_refinement_suffix_is_exact() -> None:
    suffix = subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX
    assert len(suffix) == 20
    assert len(set(suffix)) == 20
    assert subject.sha256_bytes(subject.canonical_json_bytes(suffix)) == (
        subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX_SHA256
    )
    assert suffix == (
        (-307, -207, -206, -132, -125, -50, -40, -258, -257, -98, -101),
        (-307, -9, -12, -153, -150, -94, -99, -233, -238),
        (-308, -9, -12, -153, -150, -94, -99, -233, -238),
        (-307, -113, -106, -179, -174, -60, -61, -79, -78),
        (-308, -113, -106, -179, -174, -60, -64, -79, -81),
        (-308, -226, -234, -70, -81, -206, -208, -175, -174),
        (-307, -7, -6, -103, -115, -160, -169, -50, -40, -268, -258, -52, -54),
        (-308, -7, -6, -103, -112, -211, -220, -50, -40, -265, -258, -52, -54),
        (-308, -252, -250, -236, -238, -65, -59, -42, -46, -136, -122, -219, -207),
        (-307, -169, -158, -209, -206, -268, -257, -98, -101),
        (-308, -220, -209, -158, -155, -265, -257, -95, -101),
        (-307, -153, -150, -52, -60, -94, -99, -222, -238),
        (-308, -153, -150, -52, -60, -94, -99, -222, -238),
        (-307, -9, -6, -103, -106, -38, -40, -52, -60),
        (-307, -240, -250, -236, -231, -44, -46, -168, -155),
        (-308, -9, -6, -103, -106, -38, -40, -52, -60),
        (-308, -240, -250, -236, -234, -47, -46, -219, -206),
        (-307, -7, -6, -103, -106, -38, -40, -52, -61, -75, -78),
        (-308, -7, -6, -103, -106, -38, -40, -52, -64, -75, -81),
        (-308, -252, -250, -236, -234, -47, -46, -219, -208, -184, -174),
    )
    assert subject.PARENT_VARIABLES == 308
    assert subject.IMMEDIATE_PARENT_CLAUSES == 7_409_760
    assert subject.PARENT_CLAUSES == 7_409_780
    assert subject.CELL_CLAUSES == 7_409_786
    assert subject.SOURCE_THEOREM.endswith(
        "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCell"
    )
    assert (2, "none") in subject.DIRECT_SENTINELS


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
    assert run["owner"] == subject.RUN_OWNER == "exact17-fourpoint-v6-preparer"
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
    assert value["created_utc"] == "2026-08-22T00:00:00Z"
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
    immediate_parent_exporter = tmp_path / "immediate-parent-exporter.lean"
    checkpoint = tmp_path / "checkpoint.json"
    production_config = tmp_path / "production-config.json"
    output = tmp_path / "output"
    for path in (source, root_source, exporter, immediate_parent_exporter, checkpoint):
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
                "--immediate-parent-exporter",
                str(immediate_parent_exporter),
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
        "immediate_parent_exporter_path": immediate_parent_exporter,
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
    assert report["direct_lean_cells_validated"] == 5
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
    _assert_expected_strict_new_profile(campaign["source"]["parent_novelty"])
    assert report["parent_novelty"]["successor_multiplicity"] == [1] * 20
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
    assert producer["parent_novelty"]["policy"]["subsumption"] == (
        "all 20 selected orbit clauses are strict-new"
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
    assert wave["encoding"]["num_clauses"] == subject.CELL_CLAUSES


def test_preparation_uses_owned_builders_and_v5_identity_everywhere(
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
    assert run_id == "physical-slice-cell-campaign-v5"
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


@pytest.mark.parametrize("suffix_index", range(20))
def test_exact_parent_duplicate_of_canary_clause_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, suffix_index: int
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    candidate = subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX[
        suffix_index
    ]
    duplicate = _root().replace(
        b"-307 -264 -263 -179 0\n",
        (" ".join(map(str, candidate)) + " 0\n").encode(),
        1,
    )
    _set_parent_pair(paths, duplicate)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="exact parent multiplicity"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


@pytest.mark.parametrize("suffix_index", range(20))
def test_additional_parent_subsumer_of_canary_clause_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, suffix_index: int
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    candidate = subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX[
        suffix_index
    ]
    subsumer = (" ".join(map(str, candidate[:2])) + " 0\n").encode()
    subsumed = _root().replace(b"-307 -264 -263 -179 0\n", subsumer, 1)
    _set_parent_pair(paths, subsumed)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="parent-subsumer profile"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


def test_parent_subsumer_with_duplicate_literal_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    subsumed = _root().replace(b"-307 -264 -263 -179 0\n", b"-307 -307 0\n", 1)
    _set_parent_pair(paths, subsumed)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="parent-subsumer profile"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


def test_unrelated_parent_clause_with_duplicate_literal_is_accepted(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    parent = _root().replace(b"-307 -264 -263 -179 0\n", b"1 1 0\n", 1)
    _set_parent_pair(paths, parent)
    _initialize(tmp_path, paths)
    report = _prepare(tmp_path, paths)
    novelty = report["parent_novelty"]
    assert novelty["exact_parent_multiplicity"] == [0] * 20
    _assert_expected_strict_new_profile(novelty)
    assert novelty["successor_multiplicity"] == [1] * 20
    assert novelty["suffix_clauses"] == [
        list(clause)
        for clause in subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX
    ]


def test_repeated_literal_in_canary_suffix_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    suffix = subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX
    repeated = suffix[0] + (suffix[0][0],)
    _set_parent_pair(paths, _root(), suffix=(repeated, *suffix[1:]))
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="repeats a literal"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


@pytest.mark.parametrize("mutation", ["value", "order", "guard"])
def test_wrong_canary_suffix_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, mutation: str
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    suffix = subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX
    candidate = suffix[0]
    if mutation == "value":
        wrong = candidate[:-1] + (-246,)
    elif mutation == "order":
        wrong = (candidate[1], candidate[0], *candidate[2:])
    else:
        wrong = (-306, *candidate)
    _set_parent_pair(paths, _root(), suffix=(wrong, *suffix[1:]))
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="suffix order/value drifted"):
        _prepare(tmp_path, paths)
    assert calls == [(-1, "root"), (-1, "root")]


def test_duplicate_canary_suffix_clause_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    suffix = subject.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX
    _set_parent_pair(paths, _root(), suffix=(*suffix, suffix[0]))
    immediate_parent = subject._PublishedFile.capture(
        paths["immediate_parent"], "test immediate parent"
    )
    successor = subject._PublishedFile.capture(paths["parent"], "test successor")
    try:
        with pytest.raises(
            subject.PreparationError, match="successor dimensions drifted"
        ):
            subject.validate_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinement_parent_novelty(
                immediate_parent, successor
            )
    finally:
        successor.close()
        immediate_parent.close()
    assert calls == []


def test_successor_trailing_clause_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    paths["parent"].write_bytes(_successor() + b"1 0\n")
    immediate_parent = subject._PublishedFile.capture(
        paths["immediate_parent"], "test immediate parent"
    )
    successor = subject._PublishedFile.capture(paths["parent"], "test successor")
    try:
        with pytest.raises(
            subject.PreparationError, match="successor has trailing clauses"
        ):
            subject.validate_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinement_parent_novelty(
                immediate_parent, successor
            )
    finally:
        successor.close()
        immediate_parent.close()
    assert calls == []


def test_generated_cell_repeated_unit_clause_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, _ = _fixture(tmp_path, monkeypatch)
    original_units = subject.accepted.hardened.category_units

    def repeated_units(center: int, category: str) -> tuple[int, ...]:
        units = original_units(center, category)
        return (*units[:-1], units[0])

    monkeypatch.setattr(subject.accepted.hardened, "category_units", repeated_units)
    _initialize(tmp_path, paths)
    with pytest.raises(subject.PreparationError, match="repeats a unit clause"):
        _prepare(tmp_path, paths)


def test_successor_parent_prefix_mutation_fails_before_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths, calls = _fixture(tmp_path, monkeypatch)
    mutated = _root().replace(b"-307 -264 -263 -179 0\n", b"-308 -264 0\n", 1)
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
        "immediate_parent_exporter",
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
        output.write_bytes(paths["immediate_parent"].read_bytes())

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
        output.write_bytes(paths["immediate_parent"].read_bytes())

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
