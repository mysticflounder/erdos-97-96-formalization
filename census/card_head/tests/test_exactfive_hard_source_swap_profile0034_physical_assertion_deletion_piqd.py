from __future__ import annotations

import concurrent.futures
import json
import subprocess
import sys
import threading
from collections.abc import Mapping
from fractions import Fraction
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile0034_physical_assertion_deletion_piqd as lane,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter
from census.p97_search.tests import (
    test_phase3_piqd_smt_source_adapter as adapter_test,
)


@pytest.fixture(scope="module")
def parent_record() -> dict[str, Any]:
    terminal = lane._strict(lane._read(lane.PARENT_TERMINAL_PATH), "terminal")
    descriptors = {
        branch: lane._strict(
            lane._read(lane._parent_selected_paths(branch)[1]),
            f"{branch} descriptor",
        )
        for branch in ("lt", "gt")
    }
    return lane._derive_parent_record(terminal, descriptors)


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
        "lost": (None, "INCONCLUSIVE_TRANSPORT_LOSS"),
    }[status]
    provenance = None
    semantic = None
    if raw == "UNSAT":
        provenance = {
            "basis": "get-unsat-assumptions",
            "named_core_support": False,
            "daemon_field": "core",
            "assumption_terms": [],
            "source_atom_ids": [],
            "terminal_unsat": True,
        }
    if raw == "SAT":
        semantic = {"accepted": status == "sat"}
    result = {
        "query_spec": lane.query_spec_record(spec),
        "retained_assertion_ids": list(spec.retained_assertion_ids),
        "engine": {
            "raw_status": raw,
            "effective_status": effective,
            "unsat_assumptions": provenance,
            "semantic_replay": semantic,
        },
        "claims": dict(lane.FALSE_CLAIMS),
    }
    result["result_sha256"] = lane._self_hash(result, "result_sha256")
    return result


def test_runner_bootstraps_repository_import_from_external_cwd(tmp_path: Path) -> None:
    completed = subprocess.run(
        [sys.executable, str(lane.RUNNER_PATH), "--help"],
        cwd=tmp_path,
        check=False,
        capture_output=True,
        text=True,
        timeout=30,
    )
    assert completed.returncode == 0
    assert "--init-only" in completed.stdout


def test_checkpoint_is_create_once_governed() -> None:
    checkpoint = lane._load_checkpoint()
    assert checkpoint["base_head"] == lane.CHECKPOINT_BASE_HEAD
    assert checkpoint["owned_paths"] == lane._OWNED_PATHS
    assert checkpoint["generated_roots"] == [
        f"scratch/runs/{lane.LANE_ID}/{lane.RUN_ID}"
    ]
    assert checkpoint["manifest_sha256"] == lane._self_hash(
        checkpoint, "manifest_sha256"
    )


def test_common_parent_inventory_has_exact_48_assertions(
    parent_record: dict[str, Any],
) -> None:
    rows = parent_record["assertions"]
    assert [row["assertion_id"] for row in rows] == list(lane.ASSERTION_IDS)
    assert len(rows) == 48
    assert sum(row["family"] == "supporting-edge" for row in rows) == 44
    assert sum(row["family"] == "source-row-equality" for row in rows) == 4
    assert len({row["command_sha256"] for row in rows}) <= 48
    assert parent_record["common_journal_sha256"] == lane.PARENT_COMMON_JOURNAL_SHA256


def test_parent_authentication_pins_selected_results() -> None:
    record = lane.authenticate_parent_run()
    assert record["parent_terminal_sha256"] == lane.PARENT_TERMINAL_SHA256
    assert record["selected_keys"] == lane.PARENT_SELECTED_KEYS
    assert record["parent_custody_sha256"] == lane._self_hash(
        record, "parent_custody_sha256"
    )


def test_partition_and_dynamic_specs_are_canonical() -> None:
    blocks = lane.stable_partition(lane.ASSERTION_IDS, 7)
    assert tuple(row for block in blocks for row in block) == lane.ASSERTION_IDS
    assert max(map(len, blocks)) - min(map(len, blocks)) <= 1
    specs = lane.candidate_specs(
        lane.ASSERTION_IDS, blocks, round_index=1, phase="block"
    )
    assert len({spec.key for spec in specs}) == 7
    assert all(spec.current_sha256 == lane._ids_sha256(lane.ASSERTION_IDS) for spec in specs)
    assert all(spec.key.endswith(spec.block_sha256[:16]) for spec in specs)
    assert lane.query_spec_from_record(lane.query_spec_record(specs[3])) == specs[3]
    assert lane._use_block_phase(lane.ASSERTION_IDS[:4], 2) is True
    assert lane._use_block_phase(lane.ASSERTION_IDS[:3], 2) is True
    assert lane.stable_partition(lane.ASSERTION_IDS[:3], 2) == (
        lane.ASSERTION_IDS[:2],
        lane.ASSERTION_IDS[2:3],
    )
    assert lane._use_block_phase(lane.ASSERTION_IDS[:3], 3) is False


@pytest.mark.parametrize(
    "bad",
    [
        ("assertion-001", "assertion-000"),
        ("assertion-000", "assertion-000"),
        ("assertion-999",),
    ],
)
def test_noncanonical_assertion_lists_fail_closed(bad: tuple[str, ...]) -> None:
    with pytest.raises(lane.Profile0034PhysicalAssertionDeletionError):
        lane.canonical_assertion_ids(bad)


def test_each_probe_physically_omits_only_its_block(
    parent_record: dict[str, Any],
) -> None:
    block = ("assertion-000", "assertion-017", "assertion-047")
    spec = lane.candidate_specs(
        lane.ASSERTION_IDS, (block,), round_index=3, phase="block"
    )[0]
    prepared = lane.prepare_query(spec, parent_record=parent_record)
    commands = prepared.query.journal_commands
    actual_assertions = [row for row in commands if row.startswith("(assert ")]
    expected = [
        row["command"]
        for row in parent_record["assertions"]
        if row["assertion_id"] not in set(block)
    ]
    assert actual_assertions == expected
    assert len(actual_assertions) == 45
    assert prepared.query.descriptor["named_atoms"] == []
    assert prepared.query.descriptor["solve"]["assumption_ids"] == []
    assert " Bool" not in prepared.query.journal_smt2.decode("ascii")
    assert "(=>" not in prepared.query.journal_smt2.decode("ascii")


def test_control_queries_are_self_contained() -> None:
    positive = lane.prepare_query(lane.control_spec(lane.CONTROL_KEYS[0]))
    negative = lane.prepare_query(lane.control_spec(lane.CONTROL_KEYS[1]))
    assert positive.query.journal_commands == (
        "(declare-fun t () Real)",
        "(assert (= t 1))",
    )
    assert len(negative.query.journal_commands) == 3
    assert positive.system["kind"] == "control"
    assert all("parent-custody" not in row.path for row in positive.query.source_files)


def test_exact_replay_checks_retained_assertions_only(
    parent_record: dict[str, Any], monkeypatch: pytest.MonkeyPatch
) -> None:
    retained = lane.ASSERTION_IDS[:3]
    spec = lane.candidate_specs(
        lane.ASSERTION_IDS,
        (lane.ASSERTION_IDS[3:],),
        round_index=1,
        phase="block",
    )[0]
    assert spec.retained_assertion_ids == retained
    system = lane.build_system(spec, parent_record)
    source = lane.parent.deletion.source
    coords = {class_id: (Fraction(0), Fraction(0)) for class_id in source.CLASS_IDS}
    coords.update(source.predecessor._frame_coordinates(system["source_system"]["order_id"]))
    calls = {"area": 0, "distance": 0}

    def area(*_args: object) -> Fraction:
        calls["area"] += 1
        return Fraction(1)

    def distance(*_args: object) -> Fraction:
        calls["distance"] += 1
        return Fraction(0)

    monkeypatch.setattr(source, "_area_value", area)
    monkeypatch.setattr(source, "_distance_value", distance)
    evidence = lane._replay_assertions(system, coords)
    assert evidence["accepted"] is True
    assert evidence["checked_assertions"] == 3
    assert calls == {"area": 3, "distance": 0}


@pytest.mark.parametrize(
    ("status", "expected"),
    [
        ("unsat", "UNSAT_CUSTODY_VALID"),
        ("sat", "SAT_REPLAYED"),
        ("unresolved", "SAT_REPLAY_UNRESOLVED"),
        ("unknown", "UNKNOWN"),
        ("lost", "TRANSPORT_LOST"),
    ],
)
def test_result_statuses_are_conservative(status: str, expected: str) -> None:
    spec = lane.candidate_specs(
        lane.ASSERTION_IDS,
        ((lane.ASSERTION_IDS[0],),),
        round_index=1,
        phase="singleton",
    )[0]
    assert lane.classify_result(_result(spec, status)) == expected


def test_only_first_canonical_unsat_wins_and_siblings_do_not_combine() -> None:
    blocks = lane.stable_partition(lane.ASSERTION_IDS, 4)
    specs = lane.candidate_specs(
        lane.ASSERTION_IDS, blocks, round_index=1, phase="block"
    )
    results = {spec.key: _result(spec, "sat") for spec in specs}
    results[specs[1].key] = _result(specs[1], "unsat")
    results[specs[3].key] = _result(specs[3], "unsat")
    winner = lane.choose_round_winner(specs, results)
    assert winner == specs[1]
    assert set(winner.retained_assertion_ids) == set(lane.ASSERTION_IDS) - set(
        blocks[1]
    )
    assert set(blocks[3]) <= set(winner.retained_assertion_ids)


def test_stale_sibling_result_is_rejected() -> None:
    specs = lane.candidate_specs(
        lane.ASSERTION_IDS,
        lane.stable_partition(lane.ASSERTION_IDS, 2),
        round_index=1,
        phase="block",
    )
    results = {spec.key: _result(spec, "sat") for spec in specs}
    results[specs[1].key]["retained_assertion_ids"] = []
    with pytest.raises(lane.Profile0034PhysicalAssertionDeletionError):
        lane.choose_round_winner(specs, results)


def test_deletion_loop_changes_current_only_on_unsat(
    tmp_path: Path,
    parent_record: dict[str, Any],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    seen: list[lane.QuerySpec] = []
    lock = threading.Lock()

    def prepare(spec: lane.QuerySpec, **_kwargs: object) -> SimpleNamespace:
        return SimpleNamespace(key=spec.key, spec=spec)

    def run(prepared: SimpleNamespace, *_args: object) -> dict[str, Any]:
        with lock:
            seen.append(prepared.spec)
        status = (
            "unsat"
            if prepared.spec.round_index == 1 and prepared.spec.probe_index == 1
            else "sat"
        )
        return _result(prepared.spec, status)

    monkeypatch.setattr(lane, "prepare_query", prepare)
    monkeypatch.setattr(lane, "_run_prepared", run)
    monkeypatch.setattr(
        lane,
        "_write_round",
        lambda _root, record: {
            "path": f"events/rounds/round-{record['round_index']:04d}.json",
            "bytes": 1,
            "sha256": "0" * 64,
            "round_sha256": record["round_sha256"],
        },
    )
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        report = lane.run_deletion(
            parent_record=parent_record,
            root=tmp_path,
            transport=object(),
            query_executor=pool,
            cache=lane.SemanticVerdictCache(),
        )
    first_block = lane.stable_partition(lane.ASSERTION_IDS, 2)[0]
    assert report["removed_assertion_ids"] == list(first_block)
    assert report["selected_result"]["origin"] == "current-run"
    assert all(spec.current_assertion_ids == lane.ASSERTION_IDS for spec in seen[:2])
    assert report["deletion_stable"] is True


def test_query_cap_stops_without_unchecked_mutation(
    tmp_path: Path,
    parent_record: dict[str, Any],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(lane, "QUERY_CAP", 1)
    monkeypatch.setattr(
        lane,
        "prepare_query",
        lambda spec, **_kwargs: SimpleNamespace(key=spec.key, spec=spec),
    )
    monkeypatch.setattr(
        lane,
        "_run_prepared",
        lambda prepared, *_args: _result(prepared.spec, "unknown"),
    )
    monkeypatch.setattr(
        lane,
        "_write_round",
        lambda _root, record: {
            "path": "events/rounds/round-0001.json",
            "bytes": 1,
            "sha256": "0" * 64,
            "round_sha256": record["round_sha256"],
        },
    )
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        report = lane.run_deletion(
            parent_record=parent_record,
            root=tmp_path,
            transport=object(),
            query_executor=pool,
            cache=lane.SemanticVerdictCache(),
        )
    assert report["query_count"] == 1
    assert report["stop_reason"] == "QUERY_CAP"
    assert report["final_assertion_ids"] == list(lane.ASSERTION_IDS)
    assert report["selected_result"]["origin"] == "authenticated-parent"


def test_partial_cap_unsat_authorizes_only_the_tested_first_block(
    tmp_path: Path,
    parent_record: dict[str, Any],
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(lane, "QUERY_CAP", 1)
    monkeypatch.setattr(
        lane,
        "prepare_query",
        lambda spec, **_kwargs: SimpleNamespace(key=spec.key, spec=spec),
    )
    monkeypatch.setattr(
        lane,
        "_run_prepared",
        lambda prepared, *_args: _result(prepared.spec, "unsat"),
    )
    monkeypatch.setattr(
        lane,
        "_write_round",
        lambda _root, record: {
            "path": "events/rounds/round-0001.json",
            "bytes": 1,
            "sha256": "0" * 64,
            "round_sha256": record["round_sha256"],
        },
    )
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        report = lane.run_deletion(
            parent_record=parent_record,
            root=tmp_path,
            transport=object(),
            query_executor=pool,
            cache=lane.SemanticVerdictCache(),
        )
    first = lane.stable_partition(lane.ASSERTION_IDS, 2)[0]
    assert report["removed_assertion_ids"] == list(first)
    assert report["stop_reason"] == "QUERY_CAP"
    assert report["selected_result"]["origin"] == "current-run"


def test_real_transaction_publishes_and_verifies_unsat_tree(
    tmp_path: Path, parent_record: dict[str, Any]
) -> None:
    spec = lane.candidate_specs(
        lane.ASSERTION_IDS,
        ((lane.ASSERTION_IDS[0],),),
        round_index=1,
        phase="singleton",
    )[0]
    prepared = lane.prepare_query(spec, parent_record=parent_record)
    transport = GenericNamedPiqd({"z3": "UNSAT"}, unsat_core=[])
    output = tmp_path / prepared.key
    cache = lane.SemanticVerdictCache()
    result = lane.run_query(prepared, output, transport, cache)
    assert output.is_dir()
    assert result["disposition"] == "UNSAT_CUSTODY_VALID"
    assert result["engine"]["assumption_labels"] == []
    assert result["engine"]["session_lifecycle"]["close_observed_state"] == "closed"
    assert lane.verify_query_tree(prepared, output, cache) == result
    assert transport.actual_solves == 1
    assert all(row["state"] == "closed" for row in transport.sessions.values())


def test_query_tree_rejects_unexpected_nested_artifact(
    tmp_path: Path, parent_record: dict[str, Any]
) -> None:
    spec = lane.candidate_specs(
        lane.ASSERTION_IDS,
        ((lane.ASSERTION_IDS[1],),),
        round_index=1,
        phase="singleton",
    )[0]
    prepared = lane.prepare_query(spec, parent_record=parent_record)
    output = tmp_path / prepared.key
    lane.run_query(
        prepared,
        output,
        GenericNamedPiqd({"z3": "UNKNOWN"}, unsat_core=[]),
        lane.SemanticVerdictCache(),
    )
    (output / "malicious").mkdir()
    with pytest.raises(lane.Profile0034PhysicalAssertionDeletionError):
        lane.verify_query_tree(prepared, output)


def test_query_tree_rejects_tampered_omitted_inventory(
    tmp_path: Path, parent_record: dict[str, Any]
) -> None:
    spec = lane.candidate_specs(
        lane.ASSERTION_IDS,
        ((lane.ASSERTION_IDS[2],),),
        round_index=1,
        phase="singleton",
    )[0]
    prepared = lane.prepare_query(spec, parent_record=parent_record)
    output = tmp_path / prepared.key
    lane.run_query(
        prepared,
        output,
        GenericNamedPiqd({"z3": "UNKNOWN"}, unsat_core=[]),
        lane.SemanticVerdictCache(),
    )
    result_path = output / "result.json"
    result = lane._strict(lane._read(result_path), "result")
    result["omitted_assertion_ids"] = []
    result["result_sha256"] = lane._self_hash(result, "result_sha256")
    result_path.chmod(0o600)
    result_path.write_bytes(lane._json(result))
    with pytest.raises(lane.Profile0034PhysicalAssertionDeletionError):
        lane.verify_query_tree(prepared, output)


def test_current_and_recorded_source_drift_fails_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = {
        "source_digests": lane._source_map(lane._manifest_sources()),
    }
    monkeypatch.setattr(lane, "_git_read", lambda *_args: b"drift")
    with pytest.raises(lane.Profile0034PhysicalAssertionDeletionError):
        lane._authenticate_source_commit(manifest, "0" * 40)


def test_worker_and_timeout_limits_fail_closed() -> None:
    for workers in (0, 21, True):
        with pytest.raises(lane.Profile0034PhysicalAssertionDeletionError):
            lane.run_campaign(workers=workers, init_only=True)
    for timeout in (59, 61, float("nan"), True):
        with pytest.raises(lane.Profile0034PhysicalAssertionDeletionError):
            lane.run_campaign(timeout_s=timeout, init_only=True)


def test_all_claims_remain_false() -> None:
    assert lane.FALSE_CLAIMS
    assert not any(lane.FALSE_CLAIMS.values())
