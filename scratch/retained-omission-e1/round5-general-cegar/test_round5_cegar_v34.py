from __future__ import annotations

import json
import multiprocessing
import subprocess
from concurrent.futures import ProcessPoolExecutor
from dataclasses import asdict
from pathlib import Path
from unittest import mock

import pytest
import z3

import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v19 as v19
import round5_cegar_v30 as v30
import round5_cegar_v33 as v33
import round5_cegar_v34 as v34
import round5_cegar_v34_telemetry as telemetry

_REAL_HEAD_SOURCE_VERIFIER = v34._verified_head_source_hashes


def _worktree_source_hashes() -> dict[str, str]:
    root = v34.v8.PROJECT_ROOT.resolve()
    return {
        path.resolve().relative_to(root).as_posix(): v34.file_sha256(path)
        for path in v34._provenance_source_paths().values()
    }


@pytest.fixture(autouse=True)
def _allow_uncommitted_test_checkout(monkeypatch: pytest.MonkeyPatch) -> None:
    """Production has no bypass; tests supply the future committed hashes."""
    monkeypatch.setattr(
        v34, "_verified_head_source_hashes", _worktree_source_hashes
    )


def _spawn_contract_probe_with_test_head(case_data: dict[str, object]) -> dict[str, object]:
    with mock.patch.object(
        v34, "_verified_head_source_hashes", _worktree_source_hashes
    ):
        return v34._spawn_contract_probe(case_data)


def _fixture_predecessor_solve_case(**kwargs: object) -> dict[str, object]:
    case = kwargs["case"]
    out_dir = Path(kwargs["out_dir"])
    frozen = kwargs["frozen_provenance"]
    case_dir = out_dir / case.case_id
    journal = v19.AssignmentJournal(case_dir / "assignment-journal-v34")
    journal.append({"phase": "proposed", "assignment_sha256": "spawn-fixture"})
    journal.append(
        {
            "phase": "outcome",
            "assignment_sha256": "spawn-fixture",
            "status": "unknown",
        }
    )
    return {
        **frozen,
        "case_id": case.case_id,
        "case": asdict(case),
        "status": "unknown",
        "complete": False,
        "semantic_bool_count": 1076,
        "adapter_contract": {
            "acute_clause_count": 8,
            "s_profile_clause_count": 0,
            "endpoint_seed_family_counts": v34.NEW_FAMILY_COUNTS,
        },
        "constraint_counts": {
            "global_K4": 465,
            "nonapex_global_k4_squared_superadditivity": 4368,
            v34.ACUTE_FAMILY: 8,
            v34.S_PROFILE_FAMILY: 0,
            **v34.NEW_FAMILY_COUNTS,
        },
        "assignment_journal": v19._journal_summary(journal),
    }


def _spawn_fixture_worker(
    payload: tuple[dict[str, object], dict[str, object]],
) -> dict[str, object]:
    with (
        mock.patch.object(
            v34, "_verified_head_source_hashes", _worktree_source_hashes
        ),
        mock.patch.object(
            v34,
            "_BASE_V33_SOLVE_CASE",
            side_effect=_fixture_predecessor_solve_case,
        ),
    ):
        return v34._worker(payload)


def _semantic_and_tracker_names(encoding: object) -> tuple[set[str], set[str]]:
    solver, _ = encoding.make_solver()
    assertions = solver.assertions()
    semantic = {str(item) for item in v16.collect_semantic_bools(assertions)}
    trackers = set(v16.collect_tracker_names(assertions))
    return semantic, trackers


@pytest.mark.parametrize("profiles", ["SSS", "SDD", "DDD"])
def test_tracker_repair_preserves_the_v33_semantic_universe(profiles: str) -> None:
    case = v34.Case("fresh", profiles, 0, 2, 1)
    repaired = v34.Encoding(case, timeout_ms=1, seed=97)
    predecessor = v33.Encoding(case, timeout_ms=1, seed=97)
    repaired_semantic, repaired_trackers = _semantic_and_tracker_names(repaired)
    predecessor_semantic, _ = _semantic_and_tracker_names(predecessor)

    assert repaired_semantic == predecessor_semantic
    assert len(repaired_semantic) == 1031 + 15 * profiles.count("D")
    assert len(repaired.groups[v34.S_PROFILE_FAMILY]) == 12 * profiles.count("S")
    assert f"track_{v34.S_PROFILE_FAMILY}" in repaired_trackers
    assert repaired_trackers == {f"track_{family}" for family in repaired.groups}
    if profiles == "DDD":
        assert v34.S_PROFILE_FAMILY not in predecessor.groups

    with v34._bound_v34_runtime():
        _, bound_trackers = _semantic_and_tracker_names(repaired)
        assert bound_trackers == set(v17.TRACKER_ALLOWLIST)


def test_runtime_and_dispatch_are_nonrecursive_and_restore_on_error() -> None:
    runtime_before = (
        v12.SCHEMA_VERSION,
        v12.Encoding,
        v16.SCHEMA_VERSION,
        v16.Encoding,
        v19.provenance,
        v30.expected_semantic_bool_count,
    )
    with pytest.raises(RuntimeError, match="sentinel"), v34._bound_v34_runtime():
        assert v12.SCHEMA_VERSION == 34
        assert v12.Encoding is v34.Encoding
        assert v16.SCHEMA_VERSION == 34
        assert v16.Encoding is v34.Encoding
        assert v19.provenance is v34.provenance
        assert v30.expected_semantic_bool_count is v34.expected_semantic_bool_count
        assert v34.expected_semantic_bool_count(
            v34.Case("fresh", "DDD", 0, 2, 1)
        ) == 1076
        raise RuntimeError("sentinel")
    assert runtime_before == (
        v12.SCHEMA_VERSION,
        v12.Encoding,
        v16.SCHEMA_VERSION,
        v16.Encoding,
        v19.provenance,
        v30.expected_semantic_bool_count,
    )

    dispatch_before = (
        v33.Encoding,
        v33._bound_v33_runtime,
        v33.expected_semantic_bool_count,
    )
    with (
        pytest.raises(RuntimeError, match="dispatch sentinel"),
        v34._bound_v33_solve_dispatch(),
    ):
        assert v33.Encoding is v34.Encoding
        assert v33._bound_v33_runtime is v34._bound_v34_runtime
        assert v33.expected_semantic_bool_count is v34.expected_semantic_bool_count
        assert v34._BASE_V33_EXPECTED_SEMANTIC_BOOL_COUNT is not (
            v33.expected_semantic_bool_count
        )
        raise RuntimeError("dispatch sentinel")
    assert dispatch_before == (
        v33.Encoding,
        v33._bound_v33_runtime,
        v33.expected_semantic_bool_count,
    )


def test_ddd_spawn_contract_binds_v34_and_counts_semantics() -> None:
    case = v34.Case("fresh", "DDD", 0, 2, 1)
    context = multiprocessing.get_context("spawn")
    with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
        result = pool.submit(
            _spawn_contract_probe_with_test_head, asdict(case)
        ).result(timeout=120)

    assert result["pid"] != multiprocessing.current_process().pid
    assert result["module"] == v34.WORKER_MODULE_ID
    assert result["schema_version"] == 34
    assert result["encoding_class"] == "round5_cegar_v34.Encoding"
    assert result["semantic_bool_count"] == 1076
    assert result["constraint_counts"][v34.S_PROFILE_FAMILY] == 0
    assert result["s_profile_tracker_present"] is True
    assert result["tracker_allowlist_exact"] is True
    assert result["v12_encoding_bound"] is True
    assert result["v16_encoding_bound"] is True
    assert result["v19_provenance_bound"] is True
    assert result["v30_count_bound"] is True
    assert result["telemetry_source_sha256"] == telemetry.telemetry_source_sha256()
    assert result["telemetry_file_sha256"] == v34.file_sha256(v34.TELEMETRY_PATH)
    assert result["v34_semantic_prefix_counts"] == {
        "endpoint_j": 11,
        "endpoint_qrow": 15,
        "endpoint_qsel": 225,
    }


def test_provenance_and_source_contract_are_exact_and_versioned() -> None:
    frozen = v34.provenance()
    assert frozen["schema_version"] == 34
    assert frozen["script_sha256"] == v34.file_sha256(v34.SCRIPT_PATH)
    assert frozen["schema_sha256"] == v34.file_sha256(v34.SCHEMA_PATH)
    assert frozen["focused_test_source_sha256"] == v34.file_sha256(v34.TEST_PATH)
    assert frozen["focused_test_command"] == (
        "PYTHONDONTWRITEBYTECODE=1 uv run --with pytest pytest -q "
        "-p no:cacheprovider test_round5_cegar_v34.py "
        "test_round5_cegar_v34_telemetry.py"
    )
    assert frozen["focused_test_attestation"] == json.loads(
        v34.SCHEMA_PATH.read_text()
    )["focused_test_attestation"]
    assert frozen["focused_test_attestation_sha256"] == v34.canonical_sha256(
        frozen["focused_test_attestation"]
    )
    assert frozen["head_source_sha256"] == _worktree_source_hashes()
    assert "focused_test_log" not in frozen
    assert "focused_test_log_sha256" not in frozen
    assert frozen["v34_dependency_sha256"] == {
        "round5_cegar_v33.py": v34.file_sha256(v34.HERE / "round5_cegar_v33.py"),
        "schema_v33.json": v34.file_sha256(v34.HERE / "schema_v33.json"),
        "test_round5_cegar_v33.py": v34.file_sha256(
            v34.HERE / "test_round5_cegar_v33.py"
        ),
    }
    assert frozen["runtime_telemetry_contract"]["hashes"] == {
        "round5_cegar_v34_telemetry.py": v34.file_sha256(v34.TELEMETRY_PATH),
        "test_round5_cegar_v34_telemetry.py": v34.file_sha256(
            v34.TELEMETRY_TEST_PATH
        ),
        "installed_executable_source": telemetry.telemetry_source_sha256(),
    }
    assert v34.source_contract() == v33.source_contract()
    repair = frozen["tracker_admission_repair_contract"]
    assert repair["semantic_constraint_delta"] == 0
    assert repair["semantic_boolean_delta"] == 0
    assert repair["family"] == v34.S_PROFILE_FAMILY
    assert frozen["hard_canary_contract"]["role_triples"] == [
        list(triple) for triple in v34.HARD_CANARY_ROLE_TRIPLES
    ]
    assert v34.verify_frozen_provenance(frozen) == frozen
    altered = dict(frozen, schema_version=33)
    with pytest.raises(RuntimeError, match="schema_version"):
        v34.verify_frozen_provenance(altered)


def test_head_source_gate_rejects_missing_and_dirty_sources(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    relative = v34.SCHEMA_PATH.resolve().relative_to(
        v34.v8.PROJECT_ROOT.resolve()
    ).as_posix()
    missing = subprocess.CompletedProcess(
        args=[], returncode=0, stdout=f"HEAD:{relative} missing\n".encode(), stderr=b""
    )
    monkeypatch.setattr(v34.subprocess, "run", lambda *args, **kwargs: missing)
    with pytest.raises(RuntimeError, match="not tracked at HEAD"):
        v34._git_head_blobs((relative,))

    monkeypatch.setattr(
        v34, "_provenance_source_paths", lambda: {"schema_v34.json": v34.SCHEMA_PATH}
    )
    monkeypatch.setattr(v34, "_git_head_blobs", lambda paths: {relative: b"dirty"})
    with pytest.raises(RuntimeError, match="differs from HEAD"):
        _REAL_HEAD_SOURCE_VERIFIER()


def test_hard_canary_cli_selects_exact_cases_and_delegates_once() -> None:
    expected = [
        (0, 2, 1),
        (0, 2, 3),
        (0, 3, 1),
        (0, 3, 2),
        (1, 3, 0),
        (1, 3, 2),
        (2, 0, 1),
        (2, 0, 3),
        (3, 0, 1),
        (3, 0, 2),
        (3, 1, 0),
        (3, 1, 2),
    ]
    args = v34.parser().parse_args(["hard-canary"])
    assert args.command == "hard-canary"
    assert args.profiles == "DDD"
    selected = v34.hard_canary_cases(args.profiles)
    observed = [(case.kept, case.deleted, case.fresh) for case in selected]
    assert observed == expected
    assert len({case.case_id for case in selected}) == 12
    assert all(case.arm == "fresh" and case.profiles == "DDD" for case in selected)

    with mock.patch.object(v34, "run_matrix", return_value=17) as run_matrix:
        assert v34.dispatch(args) == 17
    run_matrix.assert_called_once()
    call_args, call_kwargs = run_matrix.call_args
    assert call_kwargs == {}
    assert call_args[0] is args
    assert call_args[2] == "hard-canary"
    assert [(case.kept, case.deleted, case.fresh) for case in call_args[1]] == expected


def test_hard_canary_cli_rejects_non_ddd_without_dispatch() -> None:
    with pytest.raises(SystemExit):
        v34.parser().parse_args(["hard-canary", "--profiles", "SSS"])
    with pytest.raises(ValueError, match="only the DDD"):
        v34.hard_canary_cases("SSS")


def test_installed_telemetry_preserves_normalization_identity(monkeypatch) -> None:
    flag = z3.Bool("v34_telemetry_identity_flag")
    assertions = (flag, z3.Not(flag))
    fixes: tuple[v19.Fix, ...] = ()
    formula_hash = v17.raw_formula_sha256(assertions)
    monkeypatch.setattr(v17, "TRACKER_ALLOWLIST", set())
    original_status, _, original = v19._normalized_check(
        assertions, fixes, 1_000, 97, formula_hash
    )
    with telemetry.installed():
        observed_status, _, observed = v19._normalized_check(
            assertions, fixes, 1_000, 97, formula_hash
        )
    assert observed_status == original_status == "unsat"
    assert observed["normalization"]["normalized_replay_identity"] == (
        original["normalization"]["normalized_replay_identity"]
    )


def test_solve_installs_and_summarizes_durable_telemetry(tmp_path: Path) -> None:
    case = v34.Case("fresh", "DDD", 0, 2, 1)
    original_check = v19._normalized_check

    def fake_predecessor_solve_case(**kwargs: object) -> dict[str, object]:
        assert v19._normalized_check is telemetry._timed_normalized_check
        out_dir = Path(kwargs["out_dir"])
        local_case = kwargs["case"]
        case_dir = out_dir / local_case.case_id
        journal = v19.AssignmentJournal(case_dir / "assignment-journal-v34")
        journal.append(
            {
                "phase": "proposed",
                "assignment_sha256": "v34-test-assignment",
            }
        )
        journal.append(
            {
                "phase": "outcome",
                "assignment_sha256": "v34-test-assignment",
                "status": "unknown",
            }
        )
        return {"assignment_journal": v19._journal_summary(journal)}

    with mock.patch.object(
        v34, "_BASE_V33_SOLVE_CASE", side_effect=fake_predecessor_solve_case
    ):
        result = v34.solve_case(case, timeout_ms=1, out_dir=tmp_path)
    assert v19._normalized_check is original_check
    runtime = result["runtime_telemetry"]
    assert runtime["schema_version"] == telemetry.TELEMETRY_SCHEMA_VERSION
    assert runtime["completed_assignment_count"] == 1
    assert runtime["reconciled"] is True
    journal = v19.AssignmentJournal(tmp_path / case.case_id / "assignment-journal-v34")
    payload = journal.recover()["completed"][0]["runtime_telemetry"]
    assert runtime["durable_payload_sha256"] == v34.canonical_sha256([payload])


def test_parent_validates_real_spawned_worker_and_terminal_policy(tmp_path: Path) -> None:
    case = v34.Case("fresh", "DDD", 0, 2, 1)
    frozen = v34.provenance()
    payload = {
        "case": asdict(case),
        "timeout_ms": 1,
        "out_dir": tmp_path,
    }
    context = multiprocessing.get_context("spawn")
    with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
        result = pool.submit(_spawn_fixture_worker, (payload, frozen)).result(timeout=120)
    result_path = tmp_path / case.case_id / "result.json"

    assert result["worker_attestation"]["pid"] != multiprocessing.current_process().pid
    assert result["worker_attestation"]["start_method"] == "spawn"
    assert v34._validate_child_result(result, case, frozen, result_path) == []

    result["complete"] = True
    result_path.write_text(json.dumps(result, sort_keys=True))
    assert "complete flag does not match fail-closed terminal policy" in v34._validate_child_result(
        result, case, frozen, result_path
    )

    result["complete"] = False
    result["status"] = "finished"
    result_path.write_text(json.dumps(result, sort_keys=True))
    assert "invalid terminal status" in v34._validate_child_result(
        result, case, frozen, result_path
    )
