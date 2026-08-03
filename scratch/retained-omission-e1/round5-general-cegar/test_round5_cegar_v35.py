from __future__ import annotations

import json
from dataclasses import asdict
from pathlib import Path
from unittest import mock

import pytest

import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v35 as v35


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
    assert f"track_{v35.NONAPEX_TRANSITIVITY_FAMILY}" in trackers


def test_transitivity_clause_literal_shape() -> None:
    case = v35.Case("fresh", "DDD", 0, 2, 1)
    encoding = v35.Encoding(case, timeout_ms=1, seed=97)
    clause = encoding.groups[v35.NONAPEX_TRANSITIVITY_FAMILY][0]
    assert len(clause.children()) == 6
    text = clause.sexpr()
    assert "k4_0_1" in text and "k4_2_0" in text


def test_bound_runtime_adds_tracker_allowlist_and_restores() -> None:
    before = v17.TRACKER_ALLOWLIST
    with v35._bound_v35_runtime():
        assert f"track_{v35.NONAPEX_TRANSITIVITY_FAMILY}" in v17.TRACKER_ALLOWLIST
        encoding = v35.Encoding(v35.Case("fresh", "DDD", 0, 2, 1), timeout_ms=1, seed=97)
        _, trackers = _semantic_and_trackers(encoding)
        assert trackers == set(v17.TRACKER_ALLOWLIST)
    assert v17.TRACKER_ALLOWLIST == before


def test_provenance_and_schema_are_versioned() -> None:
    frozen = v35.provenance()
    schema = json.loads(v35.SCHEMA_PATH.read_text())
    assert frozen["schema_version"] == 35
    assert schema["schema_version"] == 35
    assert frozen["script_sha256"] == v35.file_sha256(v35.SCRIPT_PATH)
    assert frozen["schema_sha256"] == v35.file_sha256(v35.SCHEMA_PATH)
    contract = frozen["nonapex_full_shell_transitivity_contract"]
    assert contract["family"] == v35.NONAPEX_TRANSITIVITY_FAMILY
    assert contract["ordered_distinct_nonapex_centers"] == 1320
    assert contract["semantic_boolean_delta"] == 0
    assert v35.verify_frozen_provenance(frozen) == frozen


def test_spawn_probe_reports_family() -> None:
    case = v35.Case("fresh", "DDD", 0, 2, 1)
    with mock.patch.object(v35, "_verified_head_source_hashes", _worktree_source_hashes):
        result = v35._spawn_contract_probe(asdict(case))
    assert result["schema_version"] == 35
    assert result["nonapex_transitivity_clause_count"] == 1320
    assert result["nonapex_transitivity_tracker_present"] is True
