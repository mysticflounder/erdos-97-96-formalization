from __future__ import annotations

import gzip
import hashlib
import json
from pathlib import Path

import pytest
import z3

import round5_cegar_v20 as v20
import run_v20_cube_wave as wave


@pytest.fixture(scope="module")
def terminal() -> dict[str, object]:
    return v20.authenticate_v19_terminal()


@pytest.fixture(scope="module")
def manifest(terminal: dict[str, object]) -> dict[str, object]:
    return v20.build_manifest(terminal)


def test_terminal_v19_resume_authenticates_all_full_blockers(terminal) -> None:
    assert terminal["summary_sha256"] == v20.TERMINAL_V19_SUMMARY_SHA256
    assert terminal["result_sha256"] == v20.TERMINAL_V19_RESULT_SHA256
    assert terminal["raw_full_formula_sha256"] == v20.TERMINAL_V19_RAW_FORMULA_SHA256
    assert terminal["full_blocker_count"] == 190
    assert terminal["journal"]["record_count"] == 380
    assert terminal["journal"]["completed_assignment_count"] == 190
    assert terminal["journal"]["pending_assignment_count"] == 0
    assert {len(blocker) for blocker in terminal["blockers"]} == {825}


def test_default_partition_is_exhaustive_pairwise_disjoint_and_balanced(manifest) -> None:
    v20.authenticate_manifest(manifest)
    assert manifest["cube_count"] == 16
    assert len({cube["assignment_sha256"] for cube in manifest["cubes"]}) == 16
    counts = manifest["terminal_proposal_joint_counts"]
    assert len(counts) == 16
    assert sum(counts.values()) == 190
    assert min(counts.values()) >= 6
    assert max(counts.values()) <= 14
    assert manifest["empirical_counts_are_soundness_inputs"] is False


def test_partition_validator_rejects_missing_and_overlapping_cubes() -> None:
    cubes = v20.make_partition(("a", "b", "c"))
    with pytest.raises(RuntimeError, match="not exhaustive"):
        v20.validate_partition(("a", "b", "c"), cubes[:-1])
    overlap = json.loads(json.dumps(cubes))
    overlap[1]["assignment"] = overlap[0]["assignment"]
    overlap[1]["assignment_sha256"] = overlap[0]["assignment_sha256"]
    with pytest.raises(RuntimeError, match="overlap"):
        v20.validate_partition(("a", "b", "c"), overlap)


def test_blockers_and_cube_literals_are_admitted_only_to_master() -> None:
    raw = z3.Solver()
    raw.add(z3.Real("x") > 0)
    raw_before = raw.sexpr()
    master = z3.Solver()
    master.add(z3.Or(z3.Bool("a"), z3.Bool("b")))
    cube = v20.make_partition(("a", "b"))[2]
    blocker = [{"bool": "a", "value": False}, {"bool": "b", "value": True}]
    record = v20.admit_master_only(master, [blocker], cube)
    assert raw.sexpr() == raw_before
    assert len(raw.assertions()) == 1
    assert len(master.assertions()) == 4
    assert record["constraint_destination"] == "boolean_master_only"
    assert record["raw_full_formula_augmented"] is False


def _child(cube: dict[str, object], manifest: dict[str, object], status: str,
           complete: bool) -> dict[str, object]:
    files = {
        role: {"file": f"{role}.artifact", "sha256": f"{index}" * 64}
        for index, role in enumerate(
            ("cegar_trace", "boolean_prepass", "boolean_master", "full_frozen"),
            start=3,
        )
    }
    if status == "sat":
        files["sat_witness"] = {"file": "witness.json", "sha256": "7" * 64}
    evidence = {
        "cube_result": {"file": "cube-result.json", "sha256": "1" * 64},
        "child_attestation": {
            "file": "child-attestation.json", "sha256": "2" * 64,
        },
        "inherited": {
            "files": files,
            "assignment_journal": {
                "directory": "assignment-journal-v19",
                "head_sha256": "8" * 64,
                "completed_assignment_sha256": "9" * 64,
                "record_count": 2,
            },
            "final_master_formula_sha256": "a" * 64,
            "cumulative_blocker_sha256": "b" * 64,
        },
    }
    return {
        "cube_id": cube["cube_id"],
        "manifest_sha256": manifest["manifest_sha256"],
        "status": status,
        "complete": complete,
        "authenticated_evidence": evidence,
        "authenticated_evidence_sha256": v20.canonical_sha256(evidence),
    }


def test_aggregate_unsat_only_when_every_declared_cube_closes(manifest) -> None:
    all_unsat = {
        cube["cube_id"]: _child(cube, manifest, "unsat", True)
        for cube in manifest["cubes"]
    }
    aggregate = v20.aggregate_cube_results(manifest, all_unsat)
    assert aggregate["status"] == "unsat"
    assert aggregate["complete"] is True
    assert aggregate["conditional_unsat"] is True
    assert aggregate["closed_unsat_cube_count"] == 16
    assert len(aggregate["authenticated_children"]) == 16
    assert aggregate["authenticated_children"][0]["cube_result_sha256"] == "1" * 64


def test_aggregate_rejects_complete_child_without_authenticated_evidence(manifest) -> None:
    rows = {
        cube["cube_id"]: _child(cube, manifest, "unsat", True)
        for cube in manifest["cubes"]
    }
    victim = manifest["cubes"][0]["cube_id"]
    rows[victim].pop("authenticated_evidence")
    rows[victim].pop("authenticated_evidence_sha256")
    aggregate = v20.aggregate_cube_results(manifest, rows)
    assert aggregate["status"] == "unknown"
    assert aggregate["complete"] is False
    assert aggregate["unresolved_cubes"][0]["evidence_authenticated"] is False


def test_aggregate_changes_when_authenticated_evidence_changes(manifest) -> None:
    cube = manifest["cubes"][0]
    first = _child(cube, manifest, "unknown", False)
    second = json.loads(json.dumps(first))
    second["authenticated_evidence"]["cube_result"]["sha256"] = "4" * 64
    second["authenticated_evidence_sha256"] = v20.canonical_sha256(
        second["authenticated_evidence"]
    )
    aggregate_a = v20.aggregate_cube_results(manifest, {cube["cube_id"]: first})
    aggregate_b = v20.aggregate_cube_results(manifest, {cube["cube_id"]: second})
    assert v20.canonical_sha256(aggregate_a) != v20.canonical_sha256(aggregate_b)


def test_unknown_and_missing_cube_never_close_unsat(manifest) -> None:
    cubes = manifest["cubes"]
    rows = {
        cube["cube_id"]: _child(cube, manifest, "unsat", True)
        for cube in cubes
    }
    rows[cubes[3]["cube_id"]] = _child(cubes[3], manifest, "unknown", False)
    unknown = v20.aggregate_cube_results(manifest, rows)
    assert unknown["status"] == "unknown"
    assert unknown["complete"] is False
    assert unknown["conditional_unsat"] is False
    del rows[cubes[7]["cube_id"]]
    missing = v20.aggregate_cube_results(manifest, rows)
    assert missing["status"] == "unknown"
    assert missing["conditional_unsat"] is False
    assert missing["missing_cube_ids"] == [cubes[7]["cube_id"]]


def test_resume_authenticates_exact_child_result_hash(
    tmp_path: Path, manifest, monkeypatch
) -> None:
    cube = manifest["cubes"][0]
    directory = tmp_path / cube["cube_id"]
    directory.mkdir()
    result = {
        "schema_version": 20,
        "kind": "v20-cube-child",
        "manifest_sha256": manifest["manifest_sha256"],
        "cube_id": cube["cube_id"],
        "cube_assignment": cube["assignment"],
        "cube_assignment_sha256": cube["assignment_sha256"],
        "raw_full_formula_sha256": v20.TERMINAL_V19_RAW_FORMULA_SHA256,
        "imported_full_blocker_count": 190,
        "imported_full_blockers_sha256": manifest["terminal_v19"]["full_blockers_sha256"],
        "v19_terminal_summary_sha256": manifest["terminal_v19"]["summary_sha256"],
        "master_only_admission": {
            "full_blocker_count": 190,
            "full_blockers_sha256": manifest["terminal_v19"]["full_blockers_sha256"],
            "cube_id": cube["cube_id"],
            "cube_assignment_sha256": cube["assignment_sha256"],
            "raw_full_formula_augmented": False,
            "constraint_destination": "boolean_master_only",
            "master_formula_sha256_after_admission": "a" * 64,
        },
        "status": "unknown",
        "complete": False,
        "inherited_result": {
            "status": "unknown",
            "complete": False,
            "initial_master_formula_sha256": "a" * 64,
        },
    }
    v20.atomic_write_json(directory / "cube-result.json", result)
    v20.atomic_write_json(directory / "child-attestation.json", {
        "cube_id": cube["cube_id"],
        "cube_result_file": "cube-result.json",
        "cube_result_sha256": v20.file_sha256(directory / "cube-result.json"),
        "manifest_sha256": manifest["manifest_sha256"],
    })
    monkeypatch.setattr(
        wave, "_authenticate_inherited_artifacts", lambda *_args: {"trace": "3" * 64}
    )
    authenticated = wave.authenticate_child_directory(directory, manifest, cube)
    assert {key: authenticated[key] for key in result} == result
    assert authenticated["authenticated_evidence"]["cube_result"]["sha256"] == (
        v20.file_sha256(directory / "cube-result.json")
    )
    result["master_only_admission"]["master_formula_sha256_after_admission"] = "b" * 64
    v20.atomic_write_json(directory / "cube-result.json", result)
    v20.atomic_write_json(directory / "child-attestation.json", {
        "cube_id": cube["cube_id"],
        "cube_result_file": "cube-result.json",
        "cube_result_sha256": v20.file_sha256(directory / "cube-result.json"),
        "manifest_sha256": manifest["manifest_sha256"],
    })
    with pytest.raises(RuntimeError, match="resume contract mismatch"):
        wave.authenticate_child_directory(directory, manifest, cube)
    result["status"] = "unsat"
    v20.atomic_write_json(directory / "cube-result.json", result)
    with pytest.raises(RuntimeError, match="attestation mismatch"):
        wave.authenticate_child_directory(directory, manifest, cube)


def test_resume_rejects_wrapper_status_not_bound_to_inherited(tmp_path: Path) -> None:
    result = {
        "status": "unsat",
        "complete": True,
        "inherited_result": {
            "status": "unknown",
            "complete": False,
            "full_frozen_formula_sha256": v20.TERMINAL_V19_RAW_FORMULA_SHA256,
        },
    }
    with pytest.raises(RuntimeError, match="status is not bound"):
        wave._authenticate_inherited_artifacts(tmp_path, result)


def test_resume_requires_declared_journal(tmp_path: Path) -> None:
    result = {
        "status": "unknown",
        "complete": False,
        "inherited_result": {
            "status": "unknown",
            "complete": False,
            "full_frozen_formula_sha256": v20.TERMINAL_V19_RAW_FORMULA_SHA256,
            "assignment_journal": {"directory": "assignment-journal-v19"},
        },
    }
    with pytest.raises(RuntimeError, match="missing inherited assignment journal"):
        wave._authenticate_inherited_artifacts(tmp_path, result)


def test_resume_rejects_omitted_journal_declaration(tmp_path: Path) -> None:
    with pytest.raises(RuntimeError, match="journal declaration"):
        wave._authenticate_journal(tmp_path, {})


def test_replayed_boolean_master_formula_hash_is_bound(tmp_path: Path) -> None:
    path = tmp_path / "master.smt2.gz"
    formula = b"(assert false)\n(check-sat)\n"
    path.write_bytes(gzip.compress(formula))
    body = path.read_bytes()
    assert wave._authenticate_replayed_formula_hash(
        body, hashlib.sha256(formula).hexdigest(), "Boolean-master"
    ) == hashlib.sha256(formula).hexdigest()
    with pytest.raises(RuntimeError, match="formula hash mismatch"):
        wave._authenticate_replayed_formula_hash(body, "0" * 64, "Boolean-master")


def test_journal_is_paired_recordwise_with_trace_and_cumulative_chain() -> None:
    assignment = [{"bool": "a", "value": True}]
    assignment_sha = v20.canonical_sha256(assignment)
    blocker = v20.blocker_from_assignment(assignment).sexpr()
    blocker_sha = hashlib.sha256(blocker.encode()).hexdigest()
    full_check = {
        "status": "unsat",
        "assignment_sha256": assignment_sha,
        "expected_complete_blocker_sha256": blocker_sha,
    }
    after = "b" * 64
    cumulative = v20.canonical_sha256([blocker_sha])
    records = [
        {"payload": {"phase": "proposed", "iteration": 0,
                     "assignment": assignment, "assignment_sha256": assignment_sha}},
        {"payload": {"phase": "outcome", "iteration": 0,
                     "assignment_sha256": assignment_sha, "status": "unsat",
                     "full_check_sha256": v20.canonical_sha256(full_check),
                     "blocker": {"projected_core": assignment,
                                 "projected_core_sha256": assignment_sha,
                                 "blocker": blocker, "blocker_sha256": blocker_sha}}},
    ]
    trace = {
        "iterations": [{"iteration": 0, "assignment": assignment,
                        "assignment_sha256": assignment_sha,
                        "full_check": full_check,
                        "master_formula_sha256_before": "a" * 64,
                        "projected_core": assignment,
                        "projected_core_sha256": assignment_sha,
                        "blocker": blocker, "blocker_sha256": blocker_sha,
                        "master_formula_sha256_after": after,
                        "cumulative_blocker_sha256": cumulative}],
        "blocker_count": 1, "cumulative_blocker_sha256": cumulative,
        "final_master_formula_sha256": after,
    }
    inherited = {
        "initial_master_formula_sha256": "a" * 64,
        "blocker_count": 1, "cumulative_blocker_sha256": cumulative,
        "final_master_formula_sha256": after,
    }
    wave._authenticate_journal_trace(records, trace, inherited)
    corrupted_assignment = json.loads(json.dumps(trace))
    corrupted_assignment["iterations"][0]["assignment"][0]["value"] = False
    with pytest.raises(RuntimeError, match="iteration mismatch"):
        wave._authenticate_journal_trace(records, corrupted_assignment, inherited)
    trace["iterations"][0]["cumulative_blocker_sha256"] = "0" * 64
    with pytest.raises(RuntimeError, match="blocker chain mismatch"):
        wave._authenticate_journal_trace(records, trace, inherited)


def test_resume_requires_load_bearing_trace(tmp_path: Path, monkeypatch) -> None:
    result = {
        "status": "unknown",
        "complete": False,
        "inherited_result": {
            "status": "unknown",
            "complete": False,
            "full_frozen_formula_sha256": v20.TERMINAL_V19_RAW_FORMULA_SHA256,
            "assignment_journal": {"directory": "assignment-journal-v19"},
            "cegar_trace_file": "cegar_trace_v19.json",
            "cegar_trace_sha256": "0" * 64,
        },
    }
    monkeypatch.setattr(wave, "_authenticate_journal", lambda *_args: [])
    with pytest.raises(RuntimeError, match="missing inherited CEGAR trace"):
        wave._authenticate_inherited_artifacts(tmp_path, result)


def test_dead_staging_tree_is_quarantined_deterministically(tmp_path: Path) -> None:
    cube_id = "cube-000-deadbeefdead"
    pending = tmp_path / f".{cube_id}.pending.99999999"
    pending.mkdir()
    (pending / "partial.json").write_text("{}\n")
    quarantined = wave.quarantine_stale_staging(tmp_path, cube_id)
    assert quarantined == [tmp_path / ".quarantine-v20" / pending.name]
    assert not pending.exists()
    assert (quarantined[0] / "partial.json").is_file()


def test_live_staging_tree_is_never_moved(tmp_path: Path, monkeypatch) -> None:
    cube_id = "cube-000-feedfacefeed"
    pending = tmp_path / f".{cube_id}.pending.12345"
    pending.mkdir()
    monkeypatch.setattr(wave, "_pid_is_alive", lambda _pid: True)
    with pytest.raises(RuntimeError, match="live v20 staging lease"):
        wave.quarantine_stale_staging(tmp_path, cube_id)
    assert pending.is_dir()


def test_run_child_preserves_inherited_v19_artifact_names(
    tmp_path: Path, manifest, monkeypatch
) -> None:
    cube = manifest["cubes"][0]
    manifest_path = tmp_path / "manifest.json"
    manifest_path.write_text(json.dumps(manifest))
    terminal = {
        "summary_sha256": manifest["terminal_v19"]["summary_sha256"],
        "blockers": [],
        "full_blocker_count": 190,
        "full_blockers_sha256": manifest["terminal_v19"]["full_blockers_sha256"],
    }
    monkeypatch.setattr(v20, "authenticate_manifest", lambda _manifest: None)
    monkeypatch.setattr(v20, "authenticate_v19_terminal", lambda _path: terminal)
    monkeypatch.setattr(v20.v19, "provenance", lambda: {"script_sha256": "0" * 64})

    def fake_solve_case(**kwargs):
        case_dir = kwargs["out_dir"] / v20.CASE_ID
        case_dir.mkdir(parents=True)
        for filename in (
            "cegar_trace_v19.json", "boolean_prepass_v19.json",
            "boolean_master_v19.smt2.gz", "full_frozen_v19.smt2.gz",
        ):
            (case_dir / filename).write_text("preserved")
        (case_dir / "assignment-journal-v19").mkdir()
        return {
            "status": "unknown", "complete": False,
            "full_frozen_formula_sha256": v20.TERMINAL_V19_RAW_FORMULA_SHA256,
            "cegar_trace_file": "cegar_trace_v19.json",
            "boolean_prepass_file": "boolean_prepass_v19.json",
            "boolean_master_file": "boolean_master_v19.smt2.gz",
            "full_frozen_file": "full_frozen_v19.smt2.gz",
            "frozen_blob_hashes": {
                "boolean_master": {"file": "boolean_master_v19.smt2.gz"},
                "full_frozen": {"file": "full_frozen_v19.smt2.gz"},
            },
        }

    monkeypatch.setattr(v20.v19, "solve_case", fake_solve_case)
    out_dir = tmp_path / "out"
    child = v20.run_child(
        manifest_path, cube["cube_id"], out_dir, timeout_ms=1,
        bool_timeout_ms=1, replay_timeout_ms=1, max_assignments=1, seed=97,
    )
    case_dir = out_dir / v20.CASE_ID
    assert child["inherited_result"]["assignment_journal"]["directory"] == (
        "assignment-journal-v19"
    )
    assert (case_dir / "assignment-journal-v19").is_dir()
    assert not list(case_dir.glob("*v20*"))


def test_wave_defaults_to_preflight_and_never_spawns(monkeypatch, capsys) -> None:
    monkeypatch.setattr(wave.subprocess, "run",
                        lambda *_args, **_kwargs: pytest.fail("preflight spawned a child"))
    monkeypatch.setattr(wave.sys, "argv", ["run_v20_cube_wave.py"])
    assert wave.main() == 0
    report = json.loads(capsys.readouterr().out)
    assert report["mode"] == "preflight"
    assert report["solver_launched"] is False
    assert report["cube_count"] == 16
    assert report["planned_workers"] == 16


def test_parallel_worker_bound_is_one_process_per_cube_and_core() -> None:
    assert wave.parser().parse_args([]).workers == 16
    assert wave.resolve_workers(16, cube_count=16, cpu_count=24) == 16
    assert wave.resolve_workers(16, cube_count=8, cpu_count=24) == 8
    with pytest.raises(ValueError, match="positive"):
        wave.resolve_workers(0, cube_count=16, cpu_count=24)
    with pytest.raises(ValueError, match="exceeds available cores"):
        wave.resolve_workers(25, cube_count=16, cpu_count=24)
