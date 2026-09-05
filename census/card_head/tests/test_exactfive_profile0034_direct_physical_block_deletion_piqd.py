from __future__ import annotations

import concurrent.futures
import json
import os
from pathlib import Path

import pytest

from census.card_head import (
    exactfive_profile0034_direct_physical_block_deletion_piqd as producer,
)


@pytest.fixture(scope="module")
def parent_custody() -> dict[str, object]:
    return producer.authenticate_parent_run()


def test_direct_identity_and_exact_parent_pins() -> None:
    assert producer.SOLVER == "z3"
    assert producer.DIRECT_ORDER_ID == "parent-cvc5-direct"
    assert producer.DIRECT_ORDER == (
        "c000", "c007", "c012", "c005", "c008", "c009", "c011",
        "c010", "c001", "c006", "c002", "c004", "c003",
    )
    assert producer.PARENT_RECORD_PINS == {
        "manifest_file": "c1192f3afed7e089b8fbb7e49e8c4deec2cda36717e9cec537e3bf63689b96c5",
        "manifest": "6e469b3048aec1f26e1c94e644adf570752eaea49ee1dd91c60b3605d5ac50c4",
        "launch_file": "faedccc1afaa8050ac1b5d7a702dcadbbf0be6e7a5cceb8e0ae11bb45b16a250",
        "launch": "28547a2032ae396844226c89851524a24f4583b8b2824f445fe658bf1bf12997",
        "terminal_file": "09c2e3d4a9839814bf7c2c5dd4fd88b10002188acbb94d10c02be01c0954823f",
        "terminal": "db6ec92b4f2047722d3934abdac0d8bd79512768b3dc52b67cbedf71750513a5",
    }
    assert set(producer.DIRECT_ARTIFACT_PINS) == {"lt", "gt"}
    assert all(
        set(row) == {"result.json", "journal.smt2", "descriptor.json", "source-manifest.json"}
        for row in producer.DIRECT_ARTIFACT_PINS.values()
    )


def test_parent_authentication_binds_direct_source_modules(parent_custody: dict[str, object]) -> None:
    assert parent_custody["direct_order"] == list(producer.DIRECT_ORDER)
    assert parent_custody["module_sha256s"] == producer.MODULE_PINS
    assert set(parent_custody["source_systems"]) == {"lt", "gt"}
    assert parent_custody["parent_custody_sha256"] == producer._self_hash(
        parent_custody, "parent_custody_sha256"
    )
    assert parent_custody["parent_custody_sha256"] == producer.EXPECTED_PARENT_CUSTODY_SHA256


def test_caller_cannot_substitute_a_merely_self_hashed_parent(
    parent_custody: dict[str, object],
) -> None:
    tampered = json.loads(json.dumps(parent_custody))
    tampered["direct_order"] = list(reversed(producer.DIRECT_ORDER))
    tampered["parent_custody_sha256"] = producer._self_hash(
        tampered, "parent_custody_sha256"
    )
    with pytest.raises(producer.DirectPhysicalBlockDeletionError, match="not pinned"):
        producer.prepare_query(producer.anchor_spec("lt"), parent=tampered)


def test_exact_26_group_ledger_and_full_initial_formula(parent_custody: dict[str, object]) -> None:
    assert len(producer.GROUP_UNIVERSE) == 26
    assert producer.GROUP_UNIVERSE[:13] == tuple(
        f"edge-index-{index:02d}" for index in range(13)
    )
    assert producer.GROUP_UNIVERSE[13:24] == tuple(
        f"source-row-equality-{index:02d}" for index in range(11)
    )
    assert producer.GROUP_UNIVERSE[-2:] == ("radius-branch", "source-strict")
    for branch in producer.BRANCH_IDS:
        source_system = parent_custody["source_systems"][branch]
        ledger = producer.assertion_group_ledger(source_system)
        assert tuple(row["group_id"] for row in ledger) == producer.GROUP_UNIVERSE
        assert sum(len(row["commands"]) for row in ledger) == 156
        prepared = producer.prepare_query(producer.anchor_spec(branch), parent=parent_custody)
        assert prepared.spec.retained_group_ids == producer.GROUP_UNIVERSE
        assert len(prepared.query.journal_commands) == 177  # logic + 20 declarations + 156 assertions
        assert prepared.query.journal_commands == tuple(
            producer.source._build_smt_commands_current(source_system)
        )


def test_partition_plan_is_stable_bounded_and_has_no_slot_duplication() -> None:
    assert producer.GRANULARITIES == (2, 4, 8, 16, 26)
    probe_count = 1
    for round_index, granularity in enumerate(producer.GRANULARITIES, start=1):
        specs = producer.candidate_specs("lt", round_index, producer.GROUP_UNIVERSE, granularity)
        assert tuple(item for spec in specs for item in spec.deleted_block) == producer.GROUP_UNIVERSE
        assert all(set(spec.deleted_block).isdisjoint(spec.retained_group_ids) for spec in specs)
        probe_count += len(specs)
    assert probe_count == 57
    assert probe_count <= producer.QUERY_CAP_PER_BRANCH
    assert not any("slot" in group for group in producer.GROUP_UNIVERSE)


def test_queries_are_z3_only_with_fresh_controls(parent_custody: dict[str, object]) -> None:
    positive = producer.prepare_query(producer.control_spec("z3-control-positive"), parent=parent_custody)
    negative = producer.prepare_query(producer.control_spec("z3-control-negative"), parent=parent_custody)
    assert positive.query.descriptor["solver_profile"]["solvers"] == ["z3"]
    assert negative.query.descriptor["solver_profile"]["solvers"] == ["z3"]
    assert len(positive.query.journal_commands) == 3
    assert len(negative.query.journal_commands) == 4
    assert producer._request_id(positive) != producer._request_id(negative)
    assert positive.query.descriptor["solve"]["assumption_ids"] == []


def test_target_sat_readback_supplies_bound_order_id(
    parent_custody: dict[str, object],
) -> None:
    prepared = producer.prepare_query(producer.anchor_spec("lt"), parent=parent_custody)
    values = "(" + " ".join(f"({term} 0)" for term in prepared.query.get_values) + ")"
    verdict = producer.verify_sat_model(prepared.query, "z3", "(model)", values)
    assert not verdict.accepted
    assert verdict.evidence["reason"] != "exact_readback_unsupported"
    assert verdict.evidence["exact_coordinate_count"] == len(producer.source.CLASS_IDS)


def test_only_custody_valid_unsat_can_mutate_current_set() -> None:
    specs = producer.candidate_specs("gt", 1, producer.GROUP_UNIVERSE, 2)
    unresolved = {
        specs[0].key: {"disposition": "UNKNOWN"},
        specs[1].key: {"disposition": "SAT_REPLAYED"},
    }
    assert producer.choose_round_winner(specs, unresolved) is None
    accepted = dict(unresolved)
    accepted[specs[1].key] = {"disposition": "UNSAT_CUSTODY_VALID"}
    assert producer.choose_round_winner(specs, accepted) == specs[1]


@pytest.mark.parametrize("anchor_disposition", ["UNKNOWN", "SAT_REPLAYED", "SAT_REPLAY_REJECTED"])
def test_nonunsat_anchor_still_runs_every_granularity_and_preserves_groups(
    anchor_disposition: str, parent_custody: dict[str, object], tmp_path: Path
) -> None:
    def unresolved(prepared: producer.PreparedQuery) -> dict[str, object]:
        disposition = anchor_disposition if prepared.spec.round_index == 0 else "UNKNOWN"
        return {"disposition": disposition, "result_sha256": "0" * 64}

    with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:
        report = producer.run_branch(
            "lt",
            parent=parent_custody,
            root=tmp_path,
            transport=object(),
            executor=executor,
            cache=producer.SemanticVerdictCache(),
            query_runner=unresolved,
        )
    assert report["status"] == "INCONCLUSIVE_NO_SMALLER_UNSAT_SUBSET_DISCOVERED"
    assert report["query_count"] == 57
    assert [row["granularity"] for row in report["rounds"]] == [2, 4, 8, 16, 26]
    assert all(row["accepted_key"] is None for row in report["rounds"])
    assert report["initial_group_ids"] == list(producer.GROUP_UNIVERSE)
    assert report["final_group_ids"] == list(producer.GROUP_UNIVERSE)


def test_full_unsat_anchor_runs_all_five_bounded_rounds_without_false_mutation(
    parent_custody: dict[str, object], tmp_path: Path
) -> None:
    def result(prepared: producer.PreparedQuery) -> dict[str, object]:
        disposition = "UNSAT_CUSTODY_VALID" if prepared.spec.round_index == 0 else "SAT_REPLAYED"
        return {"disposition": disposition, "result_sha256": producer._sha(prepared.system_bytes)}

    with concurrent.futures.ThreadPoolExecutor(max_workers=20) as executor:
        report = producer.run_branch(
            "gt",
            parent=parent_custody,
            root=tmp_path,
            transport=object(),
            executor=executor,
            cache=producer.SemanticVerdictCache(),
            query_runner=result,
        )
    assert report["status"] == "FULL_FORMULA_UNSAT_NO_SMALLER_UNSAT_SUBSET"
    assert report["query_count"] == 57
    assert report["query_count"] <= producer.QUERY_CAP_PER_BRANCH
    assert [row["granularity"] for row in report["rounds"]] == [2, 4, 8, 16, 26]
    assert all(row["accepted_key"] is None for row in report["rounds"])
    assert report["final_group_ids"] == list(producer.GROUP_UNIVERSE)


def test_only_unsat_batch_winner_changes_the_adaptive_current(
    parent_custody: dict[str, object], tmp_path: Path
) -> None:
    first = producer.candidate_specs("lt", 1, producer.GROUP_UNIVERSE, 2)[0]

    def one_unsat(prepared: producer.PreparedQuery) -> dict[str, object]:
        disposition = (
            "UNSAT_CUSTODY_VALID"
            if prepared.spec.round_index == 1 and prepared.spec.probe_index == 0
            else "SAT_REPLAY_REJECTED"
        )
        return {"disposition": disposition, "result_sha256": producer._sha(prepared.system_bytes)}

    with concurrent.futures.ThreadPoolExecutor(max_workers=20) as executor:
        report = producer.run_branch(
            "lt",
            parent=parent_custody,
            root=tmp_path,
            transport=object(),
            executor=executor,
            cache=producer.SemanticVerdictCache(),
            query_runner=one_unsat,
        )
    assert report["status"] == "REDUCED_UNSAT"
    assert report["final_group_ids"] == list(first.retained_group_ids)
    assert report["rounds"][0]["current_before"] == list(producer.GROUP_UNIVERSE)
    assert report["rounds"][0]["current_after"] == list(first.retained_group_ids)
    assert all(
        row["current_before"] == row["current_after"] == list(first.retained_group_ids)
        for row in report["rounds"][1:]
    )
    assert report["query_count"] == 41


def test_checkpoint_and_manifest_are_governed_without_creating_run_root() -> None:
    checkpoint = json.loads(producer.CHECKPOINT_PATH.read_text())
    assert checkpoint["schema"] == "worktree-lane-checkpoint/v1"
    assert checkpoint["base_head"] == "ed08027473e9741b2a34fac7d7597d2fe6756085"
    assert checkpoint["owner"] == producer.CHECKPOINT_OWNER
    assert checkpoint["owned_paths"] == producer.OWNED_PATHS
    assert checkpoint["generated_roots"] == [
        "scratch/runs/exactfive-profile0034-direct-physical-block-deletion-piqd-20260905/run-0003",
    ]
    assert checkpoint["manifest_sha256"] == producer._self_hash(checkpoint, "manifest_sha256")
    assert not producer.RUN_ROOT.exists()
    manifest = producer.expected_run_manifest("2026-09-05T00:00:00Z")
    assert manifest["schema"] == "worktree-run-manifest/v1"
    assert manifest["base_head"] == checkpoint["base_head"]
    assert manifest["root"] == checkpoint["generated_roots"][0]
    assert any(path.endswith("source-manifest.json") for path in manifest["input_digests"])
    assert not producer.RUN_ROOT.exists()


def test_staged_artifact_reader_rejects_path_traversal(tmp_path: Path) -> None:
    descriptor = os.open(tmp_path, os.O_RDONLY)
    try:
        with pytest.raises(producer.DirectPhysicalBlockDeletionError, match="path is unsafe"):
            producer._read_fd_artifact(descriptor, "../foreign")
        with pytest.raises(producer.DirectPhysicalBlockDeletionError, match="path is unsafe"):
            producer._read_fd_artifact(descriptor, "/absolute")
    finally:
        os.close(descriptor)


def test_standalone_query_verifier_rejects_symlink_before_read(
    parent_custody: dict[str, object],
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    prepared = producer.prepare_query(
        producer.control_spec("z3-control-positive"), parent=parent_custody
    )
    target = tmp_path / "real-output"
    target.mkdir()
    link = tmp_path / "query-output"
    link.symlink_to(target, target_is_directory=True)
    read_attempted = False

    def forbidden_read(*args: object, **kwargs: object) -> bytes:
        nonlocal read_attempted
        read_attempted = True
        raise AssertionError("symlinked output was read")

    monkeypatch.setattr(producer, "_read", forbidden_read)
    with pytest.raises(producer.DirectPhysicalBlockDeletionError, match="directory is unsafe"):
        producer.verify_query_tree(prepared, link)
    assert not read_attempted


def test_hardlinked_custody_artifact_is_rejected(tmp_path: Path) -> None:
    output = tmp_path / "output"
    output.mkdir()
    shared = tmp_path / "shared.bin"
    shared.write_bytes(b"bound payload")
    custody = output / "custody.bin"
    os.link(shared, custody)
    assert custody.stat().st_nlink == 2
    record = producer._artifact_record("custody.bin", b"bound payload")
    with pytest.raises(producer.DirectPhysicalBlockDeletionError, match="unsafe input file"):
        producer._verify_artifact(output, record, set())


def test_run_root_symlink_is_rejected(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    target = tmp_path / "target"
    target.mkdir()
    link = tmp_path / "link"
    link.symlink_to(target, target_is_directory=True)
    monkeypatch.setattr(producer, "RUN_ROOT", link)
    with pytest.raises(producer.DirectPhysicalBlockDeletionError, match="symlink"):
        producer.ensure_run_root()


def test_offline_query_tree_binds_every_file(
    parent_custody: dict[str, object], tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    prepared = producer.prepare_query(producer.control_spec("z3-control-positive"), parent=parent_custody)
    custody: dict[str, object] = {}
    for key, name, payload in (
        ("system", "system.json", prepared.system_bytes),
        ("descriptor", "descriptor.json", prepared.query.descriptor_bytes),
        ("original_smt2", "original.smt2", prepared.query.original_smt2),
        ("journal_smt2", "journal.smt2", prepared.query.journal_smt2),
    ):
        (tmp_path / name).write_bytes(payload)
        custody[key] = producer._artifact_record(name, payload)
    source_records = []
    for index, snapshot in enumerate(prepared.query.source_files):
        name = f"source-{index:04d}-{producer._sha(snapshot.payload)[:16]}.bin"
        (tmp_path / name).write_bytes(snapshot.payload)
        source_records.append(producer._artifact_record(name, snapshot.payload))
    custody["sources"] = source_records
    engine = {"solver": "z3", "effective_status": "INCONCLUSIVE_UNKNOWN", "artifacts": {}}
    result = producer._result_record(prepared, engine, custody)
    (tmp_path / "result.json").write_bytes(producer._json(result))
    monkeypatch.setattr(producer, "_verify_engine", lambda *args: "UNKNOWN")
    assert producer.verify_query_tree(prepared, tmp_path)["disposition"] == "UNKNOWN"
    (tmp_path / "unbound.txt").write_text("not bound")
    with pytest.raises(producer.DirectPhysicalBlockDeletionError, match="unbound"):
        producer.verify_query_tree(prepared, tmp_path)


def test_claim_boundary_is_explicitly_negative() -> None:
    assert set(producer.FALSE_CLAIMS) == {
        "source_realization", "live_source_completeness", "all_order_coverage",
        "theorem", "lean_ingress", "closure", "promotion", "core_minimality",
    }
    assert not any(producer.FALSE_CLAIMS.values())
