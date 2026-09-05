from __future__ import annotations

import concurrent.futures
import json
import os
import threading
from collections.abc import Mapping
from fractions import Fraction
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.card_head import (
    exactfive_profile0034_new_mirror_physical_block_deletion_piqd as lane,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter
from census.p97_search.tests import (
    test_phase3_piqd_smt_source_adapter as adapter_test,
)

EXPECTED_UNIVERSE = (
    "edge-index-00",
    "edge-index-01",
    "edge-index-02",
    "edge-index-03",
    "edge-index-04",
    "edge-index-05",
    "edge-index-06",
    "edge-index-07",
    "edge-index-08",
    "edge-index-09",
    "edge-index-10",
    "edge-index-11",
    "edge-index-12",
    "source-row-equality-00",
    "source-row-equality-01",
    "source-row-equality-02",
    "source-row-equality-03",
    "source-row-equality-04",
    "source-row-equality-05",
    "source-row-equality-06",
    "source-row-equality-07",
    "source-row-equality-08",
    "source-row-equality-09",
    "source-row-equality-10",
    "radius-branch",
    "source-strict",
)
EXPECTED_BASES = {
    "lt": (
        "edge-index-00",
        "edge-index-03",
        "edge-index-04",
        "source-row-equality-01",
        "source-row-equality-05",
    ),
    "gt": (
        "edge-index-00",
        "edge-index-03",
        "source-row-equality-00",
        "source-row-equality-01",
        "source-row-equality-03",
        "source-row-equality-05",
    ),
}
EXPECTED_WITNESSES = {
    "lt": {
        "x_c002": "9/8",
        "Y_c002": "-3/8",
        "x_c004": "1",
        "Y_c004": "-1/2",
        "x_c005": "6/67",
        "Y_c005": "-16/67",
        "x_c006": "1",
        "Y_c006": "0",
        "x_c007": "0",
        "Y_c007": "1",
        "x_c008": "1",
        "Y_c008": "0",
        "x_c009": "0",
        "Y_c009": "1",
        "x_c010": "1",
        "Y_c010": "0",
        "x_c011": "0",
        "Y_c011": "1",
        "x_c012": "1",
        "Y_c012": "0",
    },
    "gt": {
        "x_c002": "3/4",
        "Y_c002": "-1/4",
        "x_c004": "2",
        "Y_c004": "0",
        "x_c005": "6/67",
        "Y_c005": "-16/67",
        "x_c006": "1",
        "Y_c006": "0",
        "x_c007": "1/97",
        "Y_c007": "56/97",
        "x_c008": "1",
        "Y_c008": "0",
        "x_c009": "0",
        "Y_c009": "1",
        "x_c010": "1",
        "Y_c010": "0",
        "x_c011": "0",
        "Y_c011": "1",
        "x_c012": "1",
        "Y_c012": "0",
    },
}


@pytest.fixture(scope="module")
def custody() -> dict[str, Any]:
    return lane.authenticate_parent_runs()


class GenericNamedPiqd(adapter_test.FakeCurrentPiqd):
    """Adapt the maintained in-memory transport to exact readback variables."""

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> adapter.JsonResponse:
        if method == "POST" and path.endswith("/solve") and body is not None:
            original = json.loads(lane._canonical(body))
            adapted = dict(body)
            adapted["get_values"] = ["x"]
            response = super().request_json(method, path, adapted)
            session_id = path.split("/")[2]
            data = self.sessions[session_id]
            data["solve_request"] = original
            receipt = data["receipt"]
            if receipt is not None:
                receipt["get_values"] = list(original["get_values"])
                receipt["request_sha256"] = adapter_test._solve_request_sha(
                    data["journal"], original
                )
            return response
        return super().request_json(method, path, body)


def _result(spec: lane.QuerySpec, status: str) -> dict[str, Any]:
    raw, effective = {
        "unsat": ("UNSAT", "UNSAT_DISCOVERY_ONLY"),
        "sat": ("SAT", "SAT_SEMANTICALLY_REPLAYED"),
        "unresolved": ("SAT", "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"),
        "unknown": ("UNKNOWN", "INCONCLUSIVE_UNKNOWN"),
    }[status]
    result = {
        "query_spec": lane.query_spec_record(spec),
        "retained_group_ids": list(spec.retained_group_ids),
        "engine": {"raw_status": raw, "effective_status": effective},
        "claims": dict(lane.FALSE_CLAIMS),
    }
    result["result_sha256"] = lane._self_hash(result, "result_sha256")
    return result


def _prepared(spec: lane.QuerySpec) -> SimpleNamespace:
    return SimpleNamespace(key=spec.key, spec=spec)


def _smt_fraction(raw: str) -> str:
    value = Fraction(raw)
    if value.denominator == 1:
        return str(value.numerator)
    if value.numerator < 0:
        return f"(- (/ {-value.numerator} {value.denominator}))"
    return f"(/ {value.numerator} {value.denominator})"


def _witness_values(prepared: lane.PreparedQuery, branch: str) -> str:
    values = lane.BASE_WITNESS_VALUES[branch]
    return (
        "("
        + " ".join(
            f"({term} {_smt_fraction(values[term])})"
            for term in prepared.query.get_values
        )
        + ")"
    )


def test_group_universe_bases_and_complements_are_frozen() -> None:
    assert lane.GROUP_UNIVERSE == EXPECTED_UNIVERSE
    assert len(lane.GROUP_UNIVERSE) == 26
    assert lane.BASE_GROUP_IDS == EXPECTED_BASES
    for branch in lane.BRANCH_IDS:
        expected = tuple(
            row for row in EXPECTED_UNIVERSE if row not in EXPECTED_BASES[branch]
        )
        assert lane.REMOVABLE_GROUP_IDS[branch] == expected
        assert set(lane.BASE_GROUP_IDS[branch]).isdisjoint(expected)
        assert set(lane.BASE_GROUP_IDS[branch]) | set(expected) == set(
            EXPECTED_UNIVERSE
        )


def test_embedded_exact_rational_witnesses_are_frozen(
    custody: dict[str, Any],
) -> None:
    assert lane.BASE_WITNESS_VALUES == EXPECTED_WITNESSES
    for branch in lane.BRANCH_IDS:
        witness = custody["base_witnesses"][branch]
        assert witness["evidence"]["accepted"] is False
        assert witness["values"] == EXPECTED_WITNESSES[branch]
        assert witness["witness_sha256"] == lane._sha(
            lane._canonical(EXPECTED_WITNESSES[branch])
        )


@pytest.mark.parametrize(
    ("items", "granularity", "sizes"),
    [
        (("a", "b", "c", "d", "e"), 2, (3, 2)),
        (("a", "b", "c", "d", "e"), 3, (2, 2, 1)),
        (("a", "b"), 9, (1, 1)),
    ],
)
def test_stable_partition_is_ordered_and_balanced(
    items: tuple[str, ...], granularity: int, sizes: tuple[int, ...]
) -> None:
    blocks = lane.stable_partition(items, granularity)
    assert tuple(map(len, blocks)) == sizes
    assert tuple(row for block in blocks for row in block) == items
    assert max(sizes) - min(sizes) <= 1


@pytest.mark.parametrize(("items", "granularity"), [((), 2), (("a",), 0)])
def test_stable_partition_rejects_bad_requests(
    items: tuple[str, ...], granularity: int
) -> None:
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError):
        lane.stable_partition(items, granularity)


def test_dynamic_keys_bind_branch_current_and_deleted_block() -> None:
    lt = lane.candidate_specs("lt", 7, lane.GROUP_UNIVERSE, 3)
    gt = lane.candidate_specs("gt", 7, lane.GROUP_UNIVERSE, 3)
    assert len({spec.key for spec in lt + gt}) == 6
    for spec in lt + gt:
        assert spec.branch_id in spec.key
        assert spec.current_sha256[:16] in spec.key
        assert spec.block_sha256[:16] in spec.key
        assert spec.retained_group_ids == tuple(
            row for row in spec.current_group_ids if row not in spec.deleted_block
        )
        assert set(spec.deleted_block).isdisjoint(lane.BASE_GROUP_IDS[spec.branch_id])


def test_query_spec_round_trip_and_current_hash_guard() -> None:
    spec = lane.candidate_specs("lt", 1, lane.GROUP_UNIVERSE, 2)[0]
    assert lane.query_spec_from_record(lane.query_spec_record(spec)) == spec
    record = lane.query_spec_record(spec)
    record["current_sha256"] = "0" * 64
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError):
        lane.query_spec_from_record(record)
    record = lane.query_spec_record(spec)
    record["key"] += "-stale"
    with pytest.raises(
        lane.Profile0034PhysicalBlockDeletionError,
        match="dynamic query key drifted",
    ):
        lane.query_spec_from_record(record)


@pytest.mark.parametrize(("branch", "assertion_count"), [("lt", 35), ("gt", 26)])
def test_base_query_is_physical_and_keeps_source_order(
    branch: str, assertion_count: int, custody: dict[str, Any]
) -> None:
    spec = lane.candidate_specs(branch, 1, lane.GROUP_UNIVERSE, 1)[0]
    assert spec.retained_group_ids == lane.BASE_GROUP_IDS[branch]
    prepared = lane.prepare_query(spec, parent=custody)
    commands = prepared.query.journal_commands
    assertions = tuple(row for row in commands if row.startswith("(assert "))
    assert all("=>" not in command and " Bool" not in command for command in assertions)
    assert len(assertions) == assertion_count
    assert "(=>" not in prepared.query.journal_smt2.decode("ascii")
    assert " Bool" not in prepared.query.journal_smt2.decode("ascii")
    assert prepared.query.descriptor["named_atoms"] == []
    assert prepared.query.descriptor["solve"]["assumption_ids"] == []
    assert prepared.assumption_labels == ()


def test_sat_replay_checks_exactly_the_retained_physical_groups(
    custody: dict[str, Any],
) -> None:
    branch = "lt"
    base_spec = lane.candidate_specs(branch, 1, lane.GROUP_UNIVERSE, 1)[0]
    base = lane.prepare_query(base_spec, parent=custody)
    values = _witness_values(base, branch)
    accepted = lane.verify_sat_model(base.query, lane.SOLVER, "model", values)
    assert accepted.accepted is False
    retained = tuple(
        row
        for row in lane.GROUP_UNIVERSE
        if row in set(lane.BASE_GROUP_IDS[branch]) | {"edge-index-01"}
    )
    current = tuple(
        row for row in lane.GROUP_UNIVERSE if row in set(retained) | {"source-strict"}
    )
    block = ("source-strict",)
    current_sha256 = lane._group_sha256(current)
    block_sha256 = lane._group_sha256(block)
    strict_spec = lane.QuerySpec(
        key=f"z3-lt-r099-{current_sha256[:16]}-drop-{block_sha256[:16]}",
        branch_id=branch,
        round_index=99,
        probe_index=0,
        current_group_ids=current,
        deleted_block=block,
        retained_group_ids=retained,
        current_sha256=current_sha256,
        block_sha256=block_sha256,
    )
    strict = lane.prepare_query(strict_spec, parent=custody)
    rejected = lane.verify_sat_model(
        strict.query, lane.SOLVER, "model", _witness_values(strict, branch)
    )
    assert rejected.accepted is False
    assert rejected.evidence["reason"] == "supporting_edge"


@pytest.mark.parametrize("branch", lane.BRANCH_IDS)
def test_anchor_is_the_exact_parent_journal(
    branch: str, custody: dict[str, Any]
) -> None:
    prepared = lane.prepare_query(lane.anchor_spec(branch), parent=custody)
    expected = tuple(
        lane.deletion._build_smt_commands_current(
            custody["source_systems"][branch]
        )
    )
    assert prepared.query.journal_commands == expected
    assert prepared.query.original_smt2 == lane._journal(expected)
    assert prepared.spec.retained_group_ids == lane.GROUP_UNIVERSE


def test_source_snapshots_bind_all_transitive_inputs(custody: dict[str, Any]) -> None:
    prepared = lane.prepare_query(lane.anchor_spec("lt"), parent=custody)
    snapshots = {row.path: row.payload for row in prepared.query.source_files}
    expected_sources = {
        Path(lane.__file__),
        lane.SPEC_PATH,
        Path(lane.deletion.__file__),
        Path(lane.adapter.__file__),
        Path(lane.deletion.bo_source.__file__),
    }
    assert set(lane._manifest_sources()) == expected_sources
    assert len(snapshots) == 2 + len(lane._manifest_sources()) + len(
        lane._manifest_inputs()
    )
    for index, path in enumerate(lane._manifest_sources()):
        name = lane._repo_path(path).replace("/", "--")
        assert snapshots[f"source-{index:02d}-{name}"] == lane._read(path)
    for index, path in enumerate(lane._manifest_inputs()):
        name = lane._repo_path(path).replace("/", "--")
        assert snapshots[f"input-{index:02d}-{name}"] == lane._read(path)
    assert prepared.query.descriptor["sources"] == [
        {"path": row.path, "bytes": len(row.payload), "sha256": lane._sha(row.payload)}
        for row in prepared.query.source_files
    ]


def test_parent_custody_binds_full_source_unsat_journals(
    custody: dict[str, Any],
) -> None:
    assert (
        custody["parent_terminal_sha256"] == lane.SOURCE_PARENT_TERMINAL_SHA256
    )
    assert (
        custody["source_parent_result_file_sha256s"] == lane.SOURCE_PARENT_RESULT_FILES
    )
    assert (
        custody["source_parent_journal_file_sha256s"]
        == lane.SOURCE_PARENT_JOURNAL_FILES
    )
    for branch in lane.BRANCH_IDS:
        commands = lane.deletion._build_smt_commands_current(
            custody["source_systems"][branch]
        )
        assert (
            lane._sha(lane._journal(commands))
            == lane.SOURCE_PARENT_JOURNAL_FILES[branch]
        )


def test_checkpoint_registers_only_the_active_run() -> None:
    checkpoint = lane._load_checkpoint()
    assert lane.RUN_ID == "run-0001"
    assert checkpoint["generated_roots"] == [
        f"scratch/runs/{lane.LANE_ID}/{lane.RUN_ID}"
    ]


def test_canonical_winner_is_first_valid_candidate() -> None:
    specs = lane.candidate_specs("lt", 1, lane.GROUP_UNIVERSE, 2)
    results = {spec.key: _result(spec, "unsat") for spec in reversed(specs)}
    assert lane.choose_round_winner(specs, results) == specs[0]


def test_round_winner_rejects_a_stale_sibling() -> None:
    specs = lane.candidate_specs("lt", 1, lane.GROUP_UNIVERSE, 2)
    results = {spec.key: _result(spec, "sat") for spec in specs}
    stale = dict(results[specs[1].key])
    stale["query_spec"] = dict(stale["query_spec"])
    stale["query_spec"]["current_sha256"] = "f" * 64
    stale["result_sha256"] = lane._self_hash(stale, "result_sha256")
    results[specs[1].key] = stale
    with pytest.raises(
        lane.Profile0034PhysicalBlockDeletionError,
        match="stale round sibling rejected",
    ):
        lane.choose_round_winner(specs, results)


def test_round_replay_recomputes_the_whole_partition(tmp_path: Path) -> None:
    branch = "lt"
    specs = lane.candidate_specs(branch, 1, lane.GROUP_UNIVERSE, 2)
    results = {spec.key: _result(spec, "sat") for spec in specs}
    record = lane._round_record(branch, 1, 2, specs, results, None)
    path = tmp_path / "events" / "rounds" / branch / "round-0001.json"
    path.parent.mkdir(parents=True)
    path.write_bytes(lane._json(record))
    report = {
        "round_files": [
            {
                "path": f"events/rounds/{branch}/round-0001.json",
                "sha256": lane._sha(lane._read(path)),
                "round_sha256": record["round_sha256"],
            }
        ],
        "final_group_ids": list(lane.GROUP_UNIVERSE),
        "final_sha256": lane._group_sha256(lane.GROUP_UNIVERSE),
        "deletion_stable": False,
    }
    terminal = {
        "queries": {
            spec.key: {
                "query_spec": lane.query_spec_record(spec),
                "disposition": "SAT_REPLAYED",
                "result_sha256": results[spec.key]["result_sha256"],
            }
            for spec in specs
        }
    }
    lane._verify_round_files(tmp_path, branch, report, terminal)
    record["candidates"] = record["candidates"][:-1]
    record["candidate_keys"] = record["candidate_keys"][:-1]
    record["round_sha256"] = lane._self_hash(record, "round_sha256")
    path.write_bytes(lane._json(record))
    report["round_files"][0] = {
        "path": f"events/rounds/{branch}/round-0001.json",
        "sha256": lane._sha(lane._read(path)),
        "round_sha256": record["round_sha256"],
    }
    with pytest.raises(
        lane.Profile0034PhysicalBlockDeletionError,
        match="round partition drifted",
    ):
        lane._verify_round_files(tmp_path, branch, report, terminal)


@pytest.mark.parametrize("status", ["sat", "unresolved", "unknown"])
def test_non_unsat_results_never_change_current(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, status: str
) -> None:
    monkeypatch.setattr(lane, "prepare_query", lambda spec, **_kwargs: _prepared(spec))

    def runner(prepared: SimpleNamespace) -> dict[str, Any]:
        return _result(
            prepared.spec,
            "unsat" if prepared.spec.round_index == 0 else status,
        )

    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
        report = lane.run_branch(
            "lt",
            parent={},
            root=tmp_path,
            transport=SimpleNamespace(),
            query_executor=executor,
            cache=lane.SemanticVerdictCache(),
            query_cap=3,
            query_runner=runner,
        )
    assert tuple(report["final_group_ids"]) == lane.GROUP_UNIVERSE
    assert report["selected_result"]["key"] == lane.anchor_spec("lt").key
    assert report["deletion_stable"] is False


def test_one_unsat_candidate_is_the_only_current_change(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setattr(lane, "prepare_query", lambda spec, **_kwargs: _prepared(spec))
    first_round = lane.candidate_specs("lt", 1, lane.GROUP_UNIVERSE, 2)
    accepted = first_round[0]

    def runner(prepared: SimpleNamespace) -> dict[str, Any]:
        if prepared.spec.round_index == 0 or prepared.key == accepted.key:
            return _result(prepared.spec, "unsat")
        return _result(prepared.spec, "unknown")

    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
        report = lane.run_branch(
            "lt",
            parent={},
            root=tmp_path,
            transport=SimpleNamespace(),
            query_executor=executor,
            cache=lane.SemanticVerdictCache(),
            query_cap=3,
            query_runner=runner,
        )
    assert tuple(report["final_group_ids"]) == accepted.retained_group_ids
    assert report["removed_group_ids"] == list(accepted.deleted_block)
    assert report["selected_result"]["key"] == accepted.key


def test_query_cap_stops_before_a_partial_batch(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    observed: list[str] = []
    monkeypatch.setattr(lane, "prepare_query", lambda spec, **_kwargs: _prepared(spec))

    def runner(prepared: SimpleNamespace) -> dict[str, Any]:
        observed.append(prepared.key)
        return _result(prepared.spec, "unsat")

    with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:
        report = lane.run_branch(
            "gt",
            parent={},
            root=tmp_path,
            transport=SimpleNamespace(),
            query_executor=executor,
            cache=lane.SemanticVerdictCache(),
            query_cap=1,
            query_runner=runner,
        )
    assert observed == [lane.anchor_spec("gt").key]
    assert report["query_count"] == 1
    assert report["stop_reason"] == "query-cap"
    assert report["deletion_stable"] is False


def test_stability_requires_all_singletons_to_replay(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    base = lane.BASE_GROUP_IDS["lt"]
    tiny_universe = base + ("radius-branch", "source-strict")
    monkeypatch.setattr(lane, "GROUP_UNIVERSE", tiny_universe)
    monkeypatch.setitem(
        lane.REMOVABLE_GROUP_IDS, "lt", ("radius-branch", "source-strict")
    )
    monkeypatch.setattr(lane, "prepare_query", lambda spec, **_kwargs: _prepared(spec))

    def runner(prepared: SimpleNamespace) -> dict[str, Any]:
        status = "unsat" if prepared.spec.round_index == 0 else "sat"
        return _result(prepared.spec, status)

    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
        report = lane.run_branch(
            "lt",
            parent={},
            root=tmp_path,
            transport=SimpleNamespace(),
            query_executor=executor,
            cache=lane.SemanticVerdictCache(),
            query_runner=runner,
        )
    assert report["deletion_stable"] is True
    assert report["stop_reason"] == "singleton-closed"
    assert tuple(report["singleton_removals_tested"]) == (
        "radius-branch",
        "source-strict",
    )


def test_stability_is_false_when_one_singleton_is_unknown(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    base = lane.BASE_GROUP_IDS["lt"]
    tiny_universe = base + ("radius-branch", "source-strict")
    monkeypatch.setattr(lane, "GROUP_UNIVERSE", tiny_universe)
    monkeypatch.setitem(
        lane.REMOVABLE_GROUP_IDS, "lt", ("radius-branch", "source-strict")
    )
    monkeypatch.setattr(lane, "prepare_query", lambda spec, **_kwargs: _prepared(spec))

    def runner(prepared: SimpleNamespace) -> dict[str, Any]:
        if prepared.spec.round_index == 0:
            return _result(prepared.spec, "unsat")
        status = (
            "unknown" if prepared.spec.deleted_block == ("source-strict",) else "sat"
        )
        return _result(prepared.spec, status)

    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
        report = lane.run_branch(
            "lt",
            parent={},
            root=tmp_path,
            transport=SimpleNamespace(),
            query_executor=executor,
            cache=lane.SemanticVerdictCache(),
            query_runner=runner,
        )
    assert report["deletion_stable"] is False
    assert report["stop_reason"] == "singleton-unresolved"


def test_semantic_verdict_cache_calls_exact_replay_once(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    observed: list[tuple[str, str]] = []

    def verify(
        _query: adapter.SourceSemanticQuery,
        solver: str,
        _model: str,
        values: str | None,
    ) -> adapter.SemanticVerification:
        assert values is not None
        observed.append((solver, values))
        return adapter.SemanticVerification(True, {"accepted": True})

    monkeypatch.setattr(lane, "verify_sat_model", verify)
    query = SimpleNamespace(descriptor_bytes=b"{}\n", journal_smt2=b"(check-sat)\n")
    cache = lane.SemanticVerdictCache()
    first = cache.verify(query, "z3", "model", "values")
    second = cache.verify(query, "z3", "model", "values")
    assert first == second
    assert observed == [("z3", "values")]
    assert cache.calls == 1


def test_request_ids_are_dynamic_key_bound_and_repeatable() -> None:
    specs = lane.candidate_specs("lt", 2, lane.GROUP_UNIVERSE, 4)
    ids = [lane._query_request_id(spec.key) for spec in specs]
    assert len(set(ids)) == len(ids)
    assert ids == [lane._query_request_id(spec.key) for spec in specs]


def test_run_query_publishes_with_real_output_transaction(
    tmp_path: Path,
    custody: dict[str, Any],
) -> None:
    prepared = lane.prepare_query(lane.anchor_spec("lt"), parent=custody)
    output = tmp_path / prepared.key
    transport = GenericNamedPiqd({"z3": "UNSAT"}, unsat_core=[])
    result = lane.run_query(
        prepared,
        output,
        transport,
        lane.SemanticVerdictCache(),
    )
    assert output.is_dir()
    assert (output / "result.json").is_file()
    assert lane.classify_result(result) == "UNSAT_CUSTODY_VALID"
    assert transport.actual_solves == 1
    assert transport.active == 0
    assert {session["state"] for session in transport.sessions.values()} == {"closed"}
    assert lane.verify_query_tree(prepared, output)["result_sha256"] == (
        result["result_sha256"]
    )


def test_artifact_records_reject_path_escape_and_digest_drift(tmp_path: Path) -> None:
    payload = b"bound\n"
    path = tmp_path / "bound.bin"
    path.write_bytes(payload)
    record = lane._artifact_record(path.name, payload)
    assert lane._verify_artifact(tmp_path, record, set()) == payload
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError):
        lane._verify_artifact(tmp_path, {**record, "path": "../bound.bin"}, set())
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError):
        lane._verify_artifact(tmp_path, {**record, "sha256": "0" * 64}, set())


def test_source_commit_binding_rejects_unbound_commit(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = {"source_digests": lane._source_map(lane._manifest_sources())}
    commit = "1" * 40

    def git_read(arguments: tuple[str, ...], _where: str) -> bytes:
        relative = arguments[1].split(":", 1)[1]
        return lane._read(lane.REPOSITORY_ROOT / relative)

    monkeypatch.setattr(lane, "_git_read", git_read)
    assert lane._authenticate_source_commit(manifest, commit) == commit
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError):
        lane._authenticate_source_commit(manifest, "short")
    bad = {"source_digests": dict(manifest["source_digests"])}
    bad["source_digests"][lane._repo_path(Path(lane.__file__))] = "0" * 64
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError):
        lane._authenticate_source_commit(bad, commit)


def test_runtime_inventory_rejects_artifacts_before_launch(tmp_path: Path) -> None:
    (tmp_path / "run_manifest.json").write_text("{}\n", encoding="ascii")
    (tmp_path / "artifacts").mkdir()
    (tmp_path / "events").mkdir()
    (tmp_path / "tmp").mkdir()
    (tmp_path / "artifacts" / "early.bin").write_bytes(b"early")
    with pytest.raises(
        lane.Profile0034PhysicalBlockDeletionError,
        match="artifacts precede launch",
    ):
        lane._inventory(tmp_path)


def test_runtime_inventory_rejects_nested_query_artifact(tmp_path: Path) -> None:
    (tmp_path / "run_manifest.json").write_text("{}\n", encoding="ascii")
    artifacts = tmp_path / "artifacts"
    events = tmp_path / "events"
    artifacts.mkdir()
    events.mkdir()
    (tmp_path / "tmp").mkdir()
    (events / "launch.json").write_text("{}\n", encoding="ascii")
    query = artifacts / lane.anchor_spec("lt").key
    query.mkdir()
    (query / "result.json").write_text("{}\n", encoding="ascii")
    (query / "nested").mkdir()
    with pytest.raises(
        lane.Profile0034PhysicalBlockDeletionError,
        match="runtime query tree is incomplete",
    ):
        lane._inventory(tmp_path)


def test_custody_paths_reject_symlinks_to_valid_external_targets(tmp_path: Path) -> None:
    external = tmp_path / "external"
    external.mkdir()
    (external / "valid.json").write_text("{}\n", encoding="ascii")
    root = tmp_path / "run"
    root.mkdir()
    (root / "run_manifest.json").symlink_to(external / "valid.json")
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="manifest"):
        lane._inventory(root)

    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    events = root / "events"
    events.mkdir()
    (root / "run_manifest.json").unlink()
    (root / "run_manifest.json").write_text("{}\n", encoding="ascii")
    (events / "launch.json").symlink_to(external / "valid.json")
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="event"):
        lane._inventory(root)

    launch = events / "launch.json"
    launch.unlink()
    launch.write_text("{}\n", encoding="ascii")
    (events / "rounds").symlink_to(external, target_is_directory=True)
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="round"):
        lane._inventory(root)

    launch.unlink()
    launch.symlink_to(external / "valid.json")
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="launch"):
        lane._read_launch(launch)
    terminal = events / "terminal.json"
    terminal.symlink_to(external / "valid.json")
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="terminal"):
        lane._read_terminal(terminal)


def test_custody_paths_reject_fifo_records_without_blocking(tmp_path: Path) -> None:
    root = tmp_path / "run"
    root.mkdir()
    os.mkfifo(root / "run_manifest.json")
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="manifest"):
        lane._inventory(root)

    (root / "run_manifest.json").unlink()
    (root / "run_manifest.json").write_text("{}\n", encoding="ascii")
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    events = root / "events"
    events.mkdir()
    os.mkfifo(events / "launch.json")
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="event"):
        lane._inventory(root)

    (events / "launch.json").unlink()
    (events / "launch.json").write_text("{}\n", encoding="ascii")
    os.mkfifo(events / "terminal.json")
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError, match="event"):
        lane._inventory(root)


def test_terminal_rejects_reused_session_identity() -> None:
    controls = {
        key: _result(
            lane.control_spec(key),
            "sat" if key.endswith("positive") else "unsat",
        )
        for key in lane.CONTROL_KEYS
    }
    branch_reports: dict[str, dict[str, Any]] = {}
    for branch in lane.BRANCH_IDS:
        spec = lane.anchor_spec(branch)
        result = _result(spec, "unsat")
        branch_reports[branch] = {
            "branch_id": branch,
            "query_specs": {spec.key: lane.query_spec_record(spec)},
            "results": {spec.key: result},
        }
    for result in [
        *controls.values(),
        *[next(iter(row["results"].values())) for row in branch_reports.values()],
    ]:
        result["engine"]["session_id"] = "reused-session"
        result["result_sha256"] = lane._self_hash(result, "result_sha256")
    with pytest.raises(
        lane.Profile0034PhysicalBlockDeletionError,
        match="session identities crossed",
    ):
        lane._terminal_record(
            {"manifest_sha256": "1" * 64},
            {"launch_sha256": "2" * 64},
            controls,
            branch_reports,
        )


def test_campaign_orders_controls_then_concurrent_branches_on_one_executor(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    manifest = {"manifest_sha256": "1" * 64}
    phases = iter(("INITIALIZED", "LAUNCHED", "TERMINAL"))
    events: list[str] = []
    event_lock = threading.Lock()
    barrier = threading.Barrier(2, timeout=3)
    executors: list[concurrent.futures.Executor] = []
    reports: dict[str, dict[str, Any]] = {}

    monkeypatch.setattr(lane, "ensure_run_root", lambda: (tmp_path, manifest))
    monkeypatch.setattr(lane, "authenticate_parent_runs", dict)
    monkeypatch.setattr(lane, "_inventory", lambda _root: next(phases))
    monkeypatch.setattr(
        lane, "authenticate_execution_commit", lambda _manifest: "1" * 40
    )
    monkeypatch.setattr(lane, "_initialize_runtime_dirs", lambda _root: None)
    monkeypatch.setattr(lane, "_publish_once", lambda _path, _payload: None)
    monkeypatch.setattr(lane, "prepare_query", lambda spec, **_kwargs: _prepared(spec))

    def run_prepared(
        prepared: SimpleNamespace, _root: Path, _transport: object, _cache: object
    ) -> dict[str, Any]:
        with event_lock:
            events.append(prepared.key)
        status = "sat" if prepared.key.endswith("positive") else "unsat"
        return _result(prepared.spec, status)

    def run_branch(branch: str, **kwargs: Any) -> dict[str, Any]:
        executor = kwargs["query_executor"]
        executors.append(executor)
        with event_lock:
            events.append(f"branch-{branch}")
        barrier.wait()
        spec = lane.anchor_spec(branch)
        result = _result(spec, "unsat")
        report = {
            "branch_id": branch,
            "query_specs": {spec.key: lane.query_spec_record(spec)},
            "results": {spec.key: result},
            "selected_result": {
                "key": spec.key,
                "result_sha256": result["result_sha256"],
                "disposition": "UNSAT_CUSTODY_VALID",
            },
            "final_group_ids": list(spec.retained_group_ids),
        }
        reports[branch] = report
        return report

    monkeypatch.setattr(lane, "_run_prepared", run_prepared)
    monkeypatch.setattr(lane, "run_branch", run_branch)
    monkeypatch.setattr(
        lane,
        "verify_query_tree",
        lambda _prepared_query, _output, _cache: next(
            iter(reports[_prepared_query.spec.branch_id]["results"].values())
        ),
    )
    monkeypatch.setattr(lane, "_terminal_record", lambda *_args: {"done": True})
    monkeypatch.setattr(lane, "verify_terminal_run", lambda *_args: {"done": True})
    assert lane.run_campaign(workers=7, transport=SimpleNamespace()) == {"done": True}
    assert events[:2] == list(lane.CONTROL_KEYS)
    assert set(events[2:]) == {"branch-lt", "branch-gt"}
    assert len(executors) == 2 and executors[0] is executors[1]
    assert executors[0]._max_workers == 7


@pytest.mark.parametrize(
    "server",
    ["file:///tmp/piqd", "http://user@127.0.0.1:7272", "http://host/path?q=1"],
)
def test_server_validation_fails_closed(server: str) -> None:
    with pytest.raises(lane.Profile0034PhysicalBlockDeletionError):
        lane._validate_server(server)


def test_launch_limits_and_all_claims_are_false() -> None:
    manifest = {"manifest_sha256": "2" * 64}
    launch = lane._launch_record(
        manifest, "1" * 40, "http://127.0.0.1:7272", lane.MAX_WORKERS
    )
    assert lane.MAX_WORKERS == lane.DEFAULT_WORKERS == 20
    assert lane.QUERY_CAP_PER_BRANCH == 128
    assert launch["solves_per_session"] == 1
    assert launch["resume"] is False
    assert launch["claims"] == lane.FALSE_CLAIMS
    assert not any(launch["claims"].values())
    assert launch["launch_sha256"] == lane._self_hash(launch, "launch_sha256")


def test_claims_never_grant_promotion_or_theorem_status() -> None:
    assert set(lane.FALSE_CLAIMS) == {
        "live_source_completeness",
        "core_minimality",
        "source_realization",
        "all_profile_execution",
        "lean_ingress",
        "live_closure",
        "promotion",
        "theorem",
    }
    assert all(value is False for value in lane.FALSE_CLAIMS.values())
