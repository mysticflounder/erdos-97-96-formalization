from __future__ import annotations

import hashlib
import json
import math
import os
import shutil
import stat
import sys
from itertools import product
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

import census.p97_search.freshthird_firstnonhit_live_retained_static_v1 as runner

NONHIT_BRANCHES = ("sameBlocker", "sourceRowOmission")
INTERACTION_BRANCHES = (
    "sameBlocker",
    "sourceRowOmission",
    "distinctBlockersDifferentCaps",
    "sameCapWithInternalFiberSource",
)
ORIGIN_BRANCHES = ("P", "P_rho", "Q")
EXPECTED_CELLS = set(product(NONHIT_BRANCHES, INTERACTION_BRANCHES, ORIGIN_BRANCHES))


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
        ).encode("utf-8")
        + b"\n"
    )


def _json(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def _result_paths(output: Path) -> list[Path]:
    return sorted(output.glob("artifacts/cell-*/result.json"))


def _probe_result_paths(output: Path) -> list[Path]:
    return sorted(output.glob("artifacts/cell-*/counterfactuals/*/*/result.json"))


def _manifest_paths(output: Path) -> list[Path]:
    return sorted(
        path
        for path in output.rglob("*.json")
        if path.is_file()
        and not path.is_symlink()
        and ("manifest" in path.name or "inventory" in path.name)
    )


@pytest.fixture(scope="module")
def completed_run(
    tmp_path_factory: pytest.TempPathFactory,
) -> tuple[Path, dict[str, object]]:
    output = tmp_path_factory.mktemp("freshthird-live-retained-static") / "run"
    summary = runner.run_wave(output, allow_test_output=True)
    return output, summary


def test_plan_has_explicit_unique_2x4x3_cells() -> None:
    plan = runner.plan_wave()

    assert isinstance(plan, list)
    assert len(plan) == 24
    cells = {(cell["nonhit"], cell["interaction"], cell["origin"]) for cell in plan}
    assert len(cells) == 24
    assert cells == EXPECTED_CELLS
    assert all(isinstance(cell, dict) for cell in plan)


def test_one_cell_and_all_probes_bind_ordered_provenance(tmp_path: Path) -> None:
    artifacts = tmp_path / "artifacts"
    artifacts.mkdir()
    cell = runner.plan_wave()[0]
    result = runner._cell_result(
        cell,
        artifacts,
        {"snapshot_sha256": "a" * 64},
        "b" * 64,
        {"solver": "controlled"},
    )

    assert result["provenance_binding"] == result["signature"]["provenance_binding"]
    assert result["provenance_binding"]["schema"] == runner.packet.PROVENANCE_SCHEMA
    probe_results = sorted(artifacts.rglob("counterfactuals/*/*/result.json"))
    assert len(probe_results) == 5 * 2
    for path in probe_results:
        probe = _json(path)
        assert probe["provenance_binding"] == result["provenance_binding"]


def test_full_run_has_sat_cells_canonical_manifests_and_validates(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    output, summary = completed_run
    results = [_json(path) for path in _result_paths(output)]
    probe_results = [_json(path) for path in _probe_result_paths(output)]
    manifests = [_json(path) for path in _manifest_paths(output)]

    assert summary["schema"] == runner.RUN_SCHEMA
    assert summary["run_id"] == output.name
    assert len(results) == 24
    assert len(probe_results) == 24 * 5 * 2
    assert {result["status"] for result in results} == {"SAT_ABSTRACTION"}
    assert {
        (
            result["cell"]["nonhit"],
            result["cell"]["interaction"],
            result["cell"]["origin"],
        )
        for result in results
    } == EXPECTED_CELLS
    assert all(isinstance(result["signature"], dict) for result in results)
    assert all(
        result["provenance_binding"] == result["signature"]["provenance_binding"]
        for result in results
    )
    assert all(
        result["provenance_binding"]["schema"] == runner.packet.PROVENANCE_SCHEMA
        for result in (*results, *probe_results)
    )
    assert {result["status"] for result in probe_results} <= {
        "SAT_ABSTRACTION",
        "UNSAT_RELAXATION",
    }
    assert [row["id"] for row in summary["predicate_panel"]] == [
        "common_p_omission",
        "common_p_rho_omission",
        "retained_centers_equal",
        "retained_support_overlap_ge_two",
        "retained_cross_center_membership",
    ]
    assert len(summary["predicate_summary"]) == 5

    assert manifests
    assert any(
        isinstance(manifest, dict)
        and ("artifact_inventory" in manifest or "artifacts" in manifest)
        for manifest in manifests
    )
    for path in _manifest_paths(output):
        assert path.read_bytes() == _canonical_json(_json(path)), path

    source_archive = _json(output / "artifacts" / "source-snapshot" / "manifest.json")
    assert isinstance(source_archive, dict)
    assert {row["path"] for row in source_archive["archived"]} == set(
        runner._snapshot_paths()
    )
    assert all(len(row["git_blob_oid"]) == 40 for row in source_archive["archived"])
    run_state = _json(output / "run_state.json")
    assert run_state["status"] == "COMPLETE"
    assert run_state["completed_cells"] == 24
    assert run_state["completed_counterfactuals"] == 24 * 5 * 2
    assert run_state["run_manifest_sha256"] == summary["run_manifest_sha256"]
    assert summary["solver"]["native_path"]
    assert len(summary["solver"]["native_sha256"]) == 64

    validated = runner.validate_run(output)
    assert validated["schema"] == runner.RUN_SCHEMA


def _copy_run(source: Path, tmp_path: Path, name: str) -> Path:
    destination = tmp_path / name
    shutil.copytree(source, destination)
    return destination


def test_rerun_to_same_path_is_zero_solver_terminal_reentry(
    completed_run: tuple[Path, dict[str, object]],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    output, summary = completed_run

    def unexpected_solver(*_args: object, **_kwargs: object) -> None:
        raise AssertionError("terminal reentry must not construct a solver")

    monkeypatch.setattr(runner.packet, "build_packet", unexpected_solver)

    assert runner.run_wave(output, allow_test_output=True) == summary


def test_cell_failure_leaves_durable_failed_state(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "failed-run"

    def fail_cell(*_args: object, **_kwargs: object) -> None:
        raise runner.StaticRunnerError("controlled cell failure")

    monkeypatch.setattr(runner, "_cell_result", fail_cell)
    with pytest.raises(runner.StaticRunnerError, match="controlled cell failure"):
        runner.run_wave(output, allow_test_output=True)

    state = runner._validate_run_state(output, "FAILED")
    assert state["completed_cells"] == 0
    assert state["completed_counterfactuals"] == 0
    assert state["error"] == {
        "type": "StaticRunnerError",
        "message": "controlled cell failure",
    }
    with pytest.raises(runner.StaticRunnerError):
        runner.run_wave(output, allow_test_output=True)


def test_archive_preflight_failure_leaves_durable_failed_state(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "failed-archive"

    def fail_archive(*_args: object, **_kwargs: object) -> None:
        raise runner.StaticRunnerError("controlled archive failure")

    monkeypatch.setattr(runner, "_source_archive", fail_archive)
    with pytest.raises(runner.StaticRunnerError, match="controlled archive failure"):
        runner.run_wave(output, allow_test_output=True)

    state = runner._validate_run_state(output, "FAILED")
    assert state["completed_cells"] == 0
    assert state["error"] == {
        "type": "StaticRunnerError",
        "message": "controlled archive failure",
    }


def test_result_signature_tampering_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-signature")
    result_path = _result_paths(output)[0]
    result = _json(result_path)
    assert isinstance(result, dict)
    signature = result["signature"]
    assert isinstance(signature, dict)
    signature["origin"] = "tampered"
    result_path.write_bytes(_canonical_json(result))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_smt2_tampering_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-smt2")
    smt2_paths = sorted(output.rglob("*.smt2"))
    assert smt2_paths
    smt2_paths[0].write_bytes(smt2_paths[0].read_bytes() + b"\n; tampered\n")

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_promotion_claim_still_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-promotion")
    manifest_path = output / "run_manifest.json"
    manifest = _json(manifest_path)
    assert isinstance(manifest, dict)
    manifest["promotion_ready"] = True
    manifest.pop("run_manifest_sha256")
    manifest["run_manifest_sha256"] = hashlib.sha256(
        _canonical_json(manifest)
    ).hexdigest()
    manifest_path.write_bytes(_canonical_json(manifest))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_postflight_source_claim_still_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-postflight")
    manifest_path = output / "run_manifest.json"
    manifest = _json(manifest_path)
    assert isinstance(manifest, dict)
    manifest["postflight_source_content_sha256"] = "0" * 64
    manifest.pop("run_manifest_sha256")
    manifest["run_manifest_sha256"] = hashlib.sha256(
        _canonical_json(manifest)
    ).hexdigest()
    manifest_path.write_bytes(_canonical_json(manifest))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_extra_claim_still_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-extra-claim")
    manifest_path = output / "run_manifest.json"
    manifest = _json(manifest_path)
    assert isinstance(manifest, dict)
    manifest["theorem"] = True
    manifest.pop("run_manifest_sha256")
    manifest["run_manifest_sha256"] = hashlib.sha256(
        _canonical_json(manifest)
    ).hexdigest()
    manifest_path.write_bytes(_canonical_json(manifest))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_snapshot_clean_flag_fails_structural_validation(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    snapshot = dict(completed_run[1]["source_snapshot"])
    snapshot["files"] = [dict(row) for row in snapshot["files"]]
    row = snapshot["files"][0]
    row["clean"] = not row["clean"]
    snapshot.pop("snapshot_sha256")
    snapshot["snapshot_sha256"] = hashlib.sha256(_canonical_json(snapshot)).hexdigest()

    with pytest.raises(runner.StaticRunnerError):
        runner._validate_snapshot_self_hash(snapshot)


def test_rehashed_dirty_index_oid_must_name_a_git_blob(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    snapshot = dict(completed_run[1]["source_snapshot"])
    snapshot["files"] = [dict(row) for row in snapshot["files"]]
    row = snapshot["files"][0]
    row["git_status"] = f" M {row['path']}"
    row["clean"] = False
    row["index_blob_oid"] = "0" * 40
    snapshot.pop("snapshot_sha256")
    snapshot["snapshot_sha256"] = hashlib.sha256(_canonical_json(snapshot)).hexdigest()

    with pytest.raises(runner.StaticRunnerError):
        runner._validate_snapshot_self_hash(snapshot)


def test_current_git_metadata_must_match_captured_snapshot(
    completed_run: tuple[Path, dict[str, object]], monkeypatch: pytest.MonkeyPatch
) -> None:
    output, summary = completed_run
    current = dict(summary["source_snapshot"])
    current["files"] = [dict(row) for row in current["files"]]
    row = current["files"][0]
    row["git_status"] = f" M {row['path']}"
    row["clean"] = False
    current.pop("snapshot_sha256")
    current["snapshot_sha256"] = hashlib.sha256(_canonical_json(current)).hexdigest()
    monkeypatch.setattr(runner, "_source_snapshot", lambda: current)

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_rehashed_inventory_cannot_add_unreferenced_artifact(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "tampered-extra-artifact")
    extra = output / "artifacts" / "unreferenced.txt"
    extra.write_bytes(b"unreferenced\n")
    manifest_path = output / "run_manifest.json"
    manifest = _json(manifest_path)
    assert isinstance(manifest, dict)
    manifest["artifact_inventory"].append(
        {
            "path": "unreferenced.txt",
            "sha256": hashlib.sha256(extra.read_bytes()).hexdigest(),
            "size": extra.stat().st_size,
        }
    )
    manifest.pop("run_manifest_sha256")
    manifest["run_manifest_sha256"] = hashlib.sha256(
        _canonical_json(manifest)
    ).hexdigest()
    manifest_path.write_bytes(_canonical_json(manifest))

    with pytest.raises(runner.StaticRunnerError):
        runner.validate_run(output)


def test_extra_empty_artifact_directory_fails_validation(
    completed_run: tuple[Path, dict[str, object]], tmp_path: Path
) -> None:
    output = _copy_run(completed_run[0], tmp_path, "extra-empty-directory")
    (output / "artifacts" / "unreferenced-empty").mkdir()

    with pytest.raises(runner.StaticRunnerError, match="directory path set"):
        runner.validate_run(output)


def test_aggregate_status_distinguishes_terminal_and_mixed_results() -> None:
    assert runner._aggregate_status(["SAT_ABSTRACTION"] * 24) == "SAT_ABSTRACTION"
    assert runner._aggregate_status(["UNSAT_RELAXATION"] * 24) == "UNSAT_RELAXATION"
    assert (
        runner._aggregate_status(["SAT_ABSTRACTION", "UNSAT_RELAXATION"])
        == "MIXED_RELAXATION"
    )
    with pytest.raises(runner.StaticRunnerError):
        runner._aggregate_status(["UNKNOWN"])


def test_counterfactual_classification_has_exact_polarity() -> None:
    assert (
        runner._counterfactual_classification(
            "SAT_ABSTRACTION", "SAT_ABSTRACTION", "UNSAT_RELAXATION"
        )
        == "FORCED_TRUE_IN_FINITE_PACKET"
    )
    assert (
        runner._counterfactual_classification(
            "SAT_ABSTRACTION", "UNSAT_RELAXATION", "SAT_ABSTRACTION"
        )
        == "FORCED_FALSE_IN_FINITE_PACKET"
    )
    with pytest.raises(runner.StaticRunnerError):
        runner._counterfactual_classification(
            "SAT_ABSTRACTION", "UNSAT_RELAXATION", "UNSAT_RELAXATION"
        )


def test_signature_must_match_outer_cell(
    completed_run: tuple[Path, dict[str, object]],
) -> None:
    output = completed_run[0]
    first, second = [_json(path) for path in _result_paths(output)[:2]]
    assert isinstance(first, dict) and isinstance(second, dict)
    assert isinstance(first["signature"], dict)
    assert first["cell"] != second["cell"]

    with pytest.raises(runner.StaticRunnerError):
        runner._validate_signature_cell(first["signature"], second["cell"])


def test_nonstandard_json_number_is_rejected(tmp_path: Path) -> None:
    with pytest.raises(ValueError):
        runner._canonical_json({"value": math.nan})

    path = tmp_path / "nan.json"
    path.write_bytes(b'{"value":NaN}\n')
    with pytest.raises(runner.StaticRunnerError):
        runner._read_canonical_json(path, "NaN control")


def test_hardlinked_json_and_source_are_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    original = tmp_path / "value.json"
    original.write_bytes(b"{}\n")
    alias = tmp_path / "alias.json"
    os.link(original, alias)
    with pytest.raises(runner.StaticRunnerError, match="hard link"):
        runner._read_canonical_json(original, "hardlink control")

    source_root = tmp_path / "repo"
    source_root.mkdir()
    source = source_root / "source.py"
    source.write_text("pass\n", encoding="utf-8")
    os.link(source, tmp_path / "source-alias.py")
    monkeypatch.setattr(runner.packet, "REPO_ROOT", source_root)
    with pytest.raises(runner.StaticRunnerError, match="hard link"):
        runner._validated_source_path("source.py")


def test_atomic_write_fsyncs_file_and_parent_directory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    observed_modes: list[int] = []
    observed_directories: list[Path] = []
    real_fsync = runner.os.fsync
    real_directory_fsync = runner._fsync_directory

    def recording_fsync(descriptor: int) -> None:
        observed_modes.append(os.fstat(descriptor).st_mode)
        real_fsync(descriptor)

    def recording_directory_fsync(path: Path) -> None:
        observed_directories.append(path)
        real_directory_fsync(path)

    monkeypatch.setattr(runner.os, "fsync", recording_fsync)
    monkeypatch.setattr(runner, "_fsync_directory", recording_directory_fsync)
    runner._atomic_write(tmp_path / "first" / "second" / "value.txt", b"durable\n")

    assert any(stat.S_ISREG(mode) for mode in observed_modes)
    assert any(stat.S_ISDIR(mode) for mode in observed_modes)
    assert {tmp_path, tmp_path / "first", tmp_path / "first" / "second"} <= set(
        observed_directories
    )


def test_solver_identity_binds_native_library() -> None:
    identity = runner._solver_identity()
    native_path = Path(str(identity["native_path"]))

    assert native_path.is_file()
    assert identity["native_size"] == native_path.stat().st_size
    assert (
        identity["native_sha256"]
        == hashlib.sha256(native_path.read_bytes()).hexdigest()
    )
    assert (
        Path(str(identity["loader_path"])) == Path(runner.z3.z3core.__file__).resolve()
    )
    assert len(identity["loader_sha256"]) == 64


def test_single_wave_lock_rejects_concurrent_holder(tmp_path: Path) -> None:
    output = tmp_path / "run"
    with (
        runner._wave_lock(output, allow_test_output=True),
        pytest.raises(runner.StaticRunnerError, match="holds the run lock"),
        runner._wave_lock(output, allow_test_output=True),
    ):
        pass


def test_single_wave_lock_rejects_symlink(tmp_path: Path) -> None:
    output = tmp_path / "run"
    target = tmp_path / "lock-target"
    target.write_text("not a lock\n", encoding="utf-8")
    lock_path = tmp_path / ".freshthird-firstnonhit-live-retained-v1.lock"
    lock_path.symlink_to(target)

    with (
        pytest.raises(runner.StaticRunnerError),
        runner._wave_lock(output, allow_test_output=True),
    ):
        pass


def test_production_snapshot_requires_clean_pushed_inputs(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    snapshot: dict[str, object] = {
        "git_head": "a" * 40,
        "files": [{"clean": True}, {"clean": True}],
    }
    monkeypatch.setattr(
        runner,
        "_git",
        lambda args: "" if args[0] == "status" else "a" * 40,
    )
    runner._validate_production_snapshot(snapshot)

    snapshot["files"] = [{"clean": True}, {"clean": False}]
    with pytest.raises(runner.StaticRunnerError, match="dirty"):
        runner._validate_production_snapshot(snapshot)

    snapshot["files"] = [{"clean": True}]
    monkeypatch.setattr(
        runner,
        "_git",
        lambda args: "" if args[0] == "status" else "b" * 40,
    )
    with pytest.raises(runner.StaticRunnerError, match="not pushed"):
        runner._validate_production_snapshot(snapshot)

    monkeypatch.setattr(
        runner,
        "_git",
        lambda args: " M tracked.py" if args[0] == "status" else "a" * 40,
    )
    with pytest.raises(runner.StaticRunnerError, match="tracked worktree"):
        runner._validate_production_snapshot(snapshot)


def test_named_role_packet_production_is_disabled(tmp_path: Path) -> None:
    output = tmp_path / "disabled-production"

    with pytest.raises(runner.StaticRunnerError, match="production disabled"):
        runner.run_wave(output)
    assert not output.exists()


def test_production_receipt_blocks_a_second_output(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    production_root = tmp_path / "production"
    first_output = production_root / "first"
    second_output = production_root / "second"
    calls: list[Path] = []
    monkeypatch.setattr(runner, "DEFAULT_RUN_PARENT", production_root)
    monkeypatch.setattr(runner.packet, "PRODUCTION_LAUNCH_ENABLED", True)

    def fake_run(output: Path, allow_test_output: bool = False) -> dict[str, object]:
        assert allow_test_output is False
        calls.append(output)
        output.mkdir(parents=True)
        runner._write_run_state(
            output,
            run_id=output.name,
            status="COMPLETE",
            source_snapshot_sha256="a" * 64,
            encoding_manifest_sha256="b" * 64,
            completed_cells=24,
            error=None,
            run_manifest_sha256="c" * 64,
        )
        return {"status": "controlled-complete"}

    monkeypatch.setattr(runner, "_run_wave_locked", fake_run)
    assert runner.run_wave(first_output) == {"status": "controlled-complete"}
    receipt = runner._validate_receipt(production_root / "single-wave-receipt.json")
    assert receipt["status"] == "COMPLETE"
    assert receipt["run_id"] == "first"

    runner._write_receipt(
        production_root / "single-wave-receipt.json",
        run_id="first",
        output_dir=first_output,
        status="CLAIMED",
        run_state_sha256=None,
        error=None,
    )
    monkeypatch.setattr(
        runner,
        "_terminal_reentry",
        lambda output: {"status": "recovered", "output": str(output)},
    )
    assert runner.run_wave(first_output) == {
        "status": "recovered",
        "output": str(first_output),
    }
    recovered = runner._validate_receipt(production_root / "single-wave-receipt.json")
    assert recovered["status"] == "COMPLETE"

    with pytest.raises(runner.StaticRunnerError, match="already recorded"):
        runner.run_wave(second_output)
    assert calls == [first_output]


def test_source_path_with_symlinked_ancestor_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    real = tmp_path / "real"
    real.mkdir()
    (real / "source.py").write_text("pass\n", encoding="utf-8")
    linked = tmp_path / "linked"
    linked.symlink_to(real, target_is_directory=True)
    monkeypatch.setattr(runner.packet, "REPO_ROOT", tmp_path)

    with pytest.raises(runner.StaticRunnerError):
        runner._validated_source_path("linked/source.py")


def test_symlink_output_root_is_rejected(
    tmp_path: Path,
) -> None:
    if not hasattr(os, "symlink"):
        pytest.skip("symlinks are unavailable on this platform")

    target = tmp_path / "target"
    target.mkdir()
    output = tmp_path / "output-link"
    output.symlink_to(target, target_is_directory=True)

    with pytest.raises(runner.StaticRunnerError):
        runner.run_wave(output, allow_test_output=True)


def test_regular_file_output_root_is_rejected(tmp_path: Path) -> None:
    output = tmp_path / "output-file"
    output.write_text("not a run directory\n", encoding="utf-8")

    with pytest.raises(runner.StaticRunnerError, match="existing output root"):
        runner.run_wave(output, allow_test_output=True)
