from __future__ import annotations

import itertools
import json
import multiprocessing
from concurrent.futures import ProcessPoolExecutor
from dataclasses import asdict
from unittest import mock

import pytest
import z3

import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v35 as v35

_REAL_HEAD_SOURCE_VERIFIER = v35._verified_head_source_hashes


def _semantic_and_trackers(encoding: object) -> tuple[set[str], set[str]]:
    solver, _ = encoding.make_solver()
    assertions = solver.assertions()
    return (
        {str(item) for item in v16.collect_semantic_bools(assertions)},
        set(v16.collect_tracker_names(assertions)),
    )


def _worktree_source_hashes() -> dict[str, str]:
    root = v35.v8.PROJECT_ROOT.resolve()
    return {
        path.resolve().relative_to(root).as_posix(): v35.file_sha256(path)
        for path in v35._provenance_source_paths().values()
    }


def _spawn_contract_probe_with_test_head(case_data: dict[str, object]) -> dict[str, object]:
    with mock.patch.object(
        v35, "_verified_head_source_hashes", _worktree_source_hashes
    ):
        return v35._spawn_contract_probe(case_data)


@pytest.fixture(autouse=True)
def _allow_uncommitted_test_checkout(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(v35, "_verified_head_source_hashes", _worktree_source_hashes)


@pytest.mark.parametrize("profiles", ["SSS", "SDD", "DDD"])
def test_transitivity_has_1320_clauses_and_no_new_semantic_booleans(profiles: str) -> None:
    case = v35.Case("fresh", profiles, 0, 2, 1)
    encoding = v35.Encoding(case, timeout_ms=1, seed=97)
    predecessor = v35.v33.Encoding(case, timeout_ms=1, seed=97)
    semantic, trackers = _semantic_and_trackers(encoding)
    predecessor_semantic, _ = _semantic_and_trackers(predecessor)
    assert semantic == predecessor_semantic
    assert len(semantic) == 1031 + 15 * profiles.count("D")
    assert len(encoding.groups[v35.NONAPEX_TRANSITIVITY_FAMILY]) == 1320
    assert len(encoding.groups[v35.S_PROFILE_FAMILY]) == 12 * profiles.count("S")
    assert sum(map(len, encoding.groups.values())) == (
        sum(map(len, predecessor.groups.values())) + 1320
    )
    assert f"track_{v35.NONAPEX_TRANSITIVITY_FAMILY}" in trackers


def test_transitivity_clause_literal_shape() -> None:
    case = v35.Case("fresh", "DDD", 0, 2, 1)
    encoding = v35.Encoding(case, timeout_ms=1, seed=97)
    clause = encoding.groups[v35.NONAPEX_TRANSITIVITY_FAMILY][0]
    assert len(clause.children()) == 6
    text = clause.sexpr()
    assert "k4_0_1" in text and "k4_2_0" in text


def test_transitivity_clause_set_has_exact_orientation_and_scope() -> None:
    case = v35.Case("fresh", "DDD", 0, 2, 1)
    encoding = v35.Encoding(case, timeout_ms=1, seed=97)
    actual = [
        clause.sexpr()
        for clause in encoding.groups[v35.NONAPEX_TRANSITIVITY_FAMILY]
    ]
    expected = {
        z3.Or(
            z3.Not(encoding.k4[p, c]),
            z3.Not(encoding.k4[p, m]),
            z3.Not(encoding.k4[c, p]),
            z3.Not(encoding.k4[c, m]),
            z3.Not(encoding.k4[m, c]),
            encoding.k4[m, p],
        ).sexpr()
        for p, c, m in itertools.permutations(v35.v8.NONAPICES, 3)
    }
    n = len(v35.v8.NONAPICES)
    assert n == 12
    assert v35.NONAPEX_TRANSITIVITY_COUNT == n * (n - 1) * (n - 2) == 1320
    assert len(actual) == len(set(actual)) == len(expected) == 1320
    assert set(actual) == expected


def test_isolated_transitivity_clause_truth_table() -> None:
    atoms = z3.Bools("h_pc h_pm h_cp h_cm h_mc h_mp")
    clause = z3.Or(*(z3.Not(atom) for atom in atoms[:5]), atoms[5])
    for values in itertools.product((False, True), repeat=6):
        solver = z3.Solver()
        solver.add(clause)
        solver.add(*(atom == value for atom, value in zip(atoms, values, strict=True)))
        expected_sat = not (all(values[:5]) and not values[5])
        assert (solver.check() == z3.sat) is expected_sat


def test_bound_runtime_adds_tracker_allowlist_and_restores() -> None:
    before = v17.TRACKER_ALLOWLIST
    with v35._bound_v35_runtime():
        assert f"track_{v35.NONAPEX_TRANSITIVITY_FAMILY}" in v17.TRACKER_ALLOWLIST
        encoding = v35.Encoding(v35.Case("fresh", "DDD", 0, 2, 1), timeout_ms=1, seed=97)
        _, trackers = _semantic_and_trackers(encoding)
        assert trackers == set(v17.TRACKER_ALLOWLIST)
    assert v17.TRACKER_ALLOWLIST == before


def test_bound_runtime_restores_tracker_allowlist_on_exception() -> None:
    before = v17.TRACKER_ALLOWLIST
    with pytest.raises(RuntimeError, match="sentinel"), v35._bound_v35_runtime():
        raise RuntimeError("sentinel")
    assert v17.TRACKER_ALLOWLIST == before


def test_provenance_and_schema_are_versioned() -> None:
    frozen = v35.provenance()
    schema = json.loads(v35.SCHEMA_PATH.read_text())
    assert frozen["schema_version"] == 35
    assert schema["schema_version"] == 35
    assert frozen["git_head_commit"] == v35._git_head_commit()
    assert frozen["script_sha256"] == v35.file_sha256(v35.SCRIPT_PATH)
    assert frozen["schema_sha256"] == v35.file_sha256(v35.SCHEMA_PATH)
    assert schema["composition"]["mathematical_source_contract"].startswith(
        "schema_v33/source_contract extended by "
    )
    contract = frozen["nonapex_full_shell_transitivity_contract"]
    assert contract["family"] == v35.NONAPEX_TRANSITIVITY_FAMILY
    assert contract["ordered_distinct_nonapex_centers"] == 1320
    assert contract["semantic_boolean_delta"] == 0
    assert v35.verify_frozen_provenance(frozen) == frozen


def test_head_source_gate_rejects_dirty_source(monkeypatch: pytest.MonkeyPatch) -> None:
    relative = v35.SCHEMA_PATH.resolve().relative_to(
        v35.v8.PROJECT_ROOT.resolve()
    ).as_posix()
    monkeypatch.setattr(
        v35, "_provenance_source_paths", lambda: {"schema_v35.json": v35.SCHEMA_PATH}
    )
    monkeypatch.setattr(v35, "_git_head_blobs", lambda paths: {relative: b"dirty"})
    with pytest.raises(RuntimeError, match="differs from HEAD"):
        _REAL_HEAD_SOURCE_VERIFIER()


def test_spawn_probe_reports_family() -> None:
    case = v35.Case("fresh", "DDD", 0, 2, 1)
    with mock.patch.object(v35, "_verified_head_source_hashes", _worktree_source_hashes):
        result = v35._spawn_contract_probe(asdict(case))
    assert result["schema_version"] == 35
    assert result["nonapex_transitivity_clause_count"] == 1320
    assert result["nonapex_transitivity_tracker_present"] is True


def test_spawned_probe_reports_exact_v35_contract() -> None:
    case = v35.Case("fresh", "DDD", 0, 2, 1)
    context = multiprocessing.get_context("spawn")
    with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
        result = pool.submit(
            _spawn_contract_probe_with_test_head, asdict(case)
        ).result(timeout=120)
    assert result["pid"] != multiprocessing.current_process().pid
    assert result["start_method"] == "spawn"
    assert result["module"] == v35.WORKER_MODULE_ID
    assert result["encoding_class"] == "round5_cegar_v35.Encoding"
    assert result["semantic_bool_count"] == 1076
    assert result["nonapex_transitivity_clause_count"] == 1320
    assert result["nonapex_transitivity_tracker_present"] is True
    assert result["tracker_allowlist_exact"] is True


def test_hard_canary_cli_selects_exact_cases_and_delegates_once() -> None:
    args = v35.parser().parse_args(["hard-canary"])
    selected = v35.hard_canary_cases(args.profiles)
    observed = [(case.kept, case.deleted, case.fresh) for case in selected]
    expected = list(v35.HARD_CANARY_ROLE_TRIPLES)
    assert observed == expected
    assert len({case.case_id for case in selected}) == 12
    assert all(case.arm == "fresh" and case.profiles == "DDD" for case in selected)

    with mock.patch.object(v35, "run_matrix", return_value=17) as run_matrix:
        assert v35.dispatch(args) == 17
    run_matrix.assert_called_once()
    call_args, call_kwargs = run_matrix.call_args
    assert call_kwargs == {}
    assert call_args[0] is args
    assert call_args[2] == "hard-canary"
    assert [
        (case.kept, case.deleted, case.fresh) for case in call_args[1]
    ] == expected


def test_hard_canary_cli_rejects_non_ddd_without_dispatch() -> None:
    with pytest.raises(SystemExit):
        v35.parser().parse_args(["hard-canary", "--profiles", "SSS"])
    with pytest.raises(ValueError, match="only the DDD"):
        v35.hard_canary_cases("SSS")
