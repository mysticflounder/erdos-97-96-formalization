from __future__ import annotations

import copy
import json
from collections import Counter
from dataclasses import replace
from pathlib import Path

import pytest
import z3

import round5_cegar_v19 as v19
import run_v19_retry_matrix as runner


HERE = Path(__file__).resolve().parent
PRODUCTION_V17_SUMMARY = (
    HERE
    / "artifacts-v17-production1"
    / "20260802T142433.875648Z-case-pid61508"
    / "summary.json"
)
EXPECTED_CASE = "fresh_DDD_k0_d2_f1"
EXPECTED_CUMULATIVE = "f5d7cd9cd5aee94e251777a9eb4ca39c0ba7327fbcdf56b4e4c51f7596bdb35c"
EXPECTED_FROZEN = "bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720"
EXPECTED_UNIVERSE = "cc924f5fff0675896986228c7a85432e18b1a5d032e39ef407e73aac84678848"


@pytest.fixture(scope="module")
def resume() -> runner.ValidatedResume:
    assert PRODUCTION_V17_SUMMARY.is_file(), "focused production-v17 fixture is missing"
    spec = runner.ResumeSpec(
        PRODUCTION_V17_SUMMARY,
        runner.file_sha256(PRODUCTION_V17_SUMMARY),
    )
    return runner.validate_resume_artifact(spec)


def _fixes(items: tuple[tuple[str, bool], ...]) -> tuple[v19.Fix, ...]:
    return tuple(v19.Fix(z3.Bool(name), value) for name, value in items)


def _escaping_assignment(resume: runner.ValidatedResume) -> tuple[tuple[str, bool], ...]:
    assignment = dict(resume.blockers[36].assignment)
    assignment["block_1_0"] = not assignment["block_1_0"]
    return tuple((name, assignment[name]) for name in resume.semantic_bools)


def _synthetic_journal(
    root: Path, *, with_pending: bool = True
) -> tuple[
    Path,
    dict[str, object],
    dict[str, object],
    tuple[str, ...],
    str,
]:
    path = root / "assignment-journal-v19"
    journal = v19.AssignmentJournal(path)
    universe = ("a", "b")
    full_hash = "a" * 64
    assignment = (("a", True), ("b", False))
    assignment_record = runner._signed_record(assignment)
    assignment_hash = runner.canonical_sha256(assignment_record)
    journal.append({
        "phase": "proposed",
        "iteration": 0,
        "assignment": assignment_record,
        "assignment_sha256": assignment_hash,
        "frozen_full_formula_sha256": full_hash,
    })
    core = (("a", True),)
    blocker_formula = runner._reconstructed_blocker(core).sexpr()
    blocker_hash = runner.sha256_bytes(blocker_formula.encode())
    blocker = {
        "projected_core": runner._signed_record(core),
        "projected_core_sha256": runner.canonical_sha256(runner._signed_record(core)),
        "blocker": blocker_formula,
        "blocker_sha256": blocker_hash,
    }
    full_check = {"status": "unsat", "lane": "synthetic_test"}
    journal.append({
        "phase": "outcome",
        "iteration": 0,
        "assignment_sha256": assignment_hash,
        "status": "unsat",
        "full_check_sha256": runner.canonical_sha256(full_check),
        "blocker": blocker,
    })
    if with_pending:
        pending = (("a", False), ("b", True))
        pending_record = runner._signed_record(pending)
        journal.append({
            "phase": "proposed",
            "iteration": 1,
            "assignment": pending_record,
            "assignment_sha256": runner.canonical_sha256(pending_record),
            "frozen_full_formula_sha256": full_hash,
        })
    trace = {
        "iterations": [{
            "iteration": 0,
            "assignment_sha256": assignment_hash,
            "full_check": full_check,
            "blocker_sha256": blocker_hash,
        }],
    }
    return path, v19._journal_summary(journal), trace, universe, full_hash


def test_authenticates_and_reconstructs_all_64_production_blockers(
    resume: runner.ValidatedResume,
) -> None:
    assert resume.case.case_id == EXPECTED_CASE
    assert resume.full_frozen_formula_sha256 == EXPECTED_FROZEN
    assert resume.semantic_bool_universe_sha256 == EXPECTED_UNIVERSE
    assert len(resume.semantic_bools) == 825
    assert len(resume.blockers) == 64
    assert resume.cumulative_blocker_sha256 == EXPECTED_CUMULATIVE
    assert Counter(blocker.lane for blocker in resume.blockers) == {
        "equality_closure_raw_replay": 45,
        "fixed_assignment_qf_lra": 19,
    }
    assert [blocker.ordinal for blocker in resume.blockers] == list(range(64))
    assert runner.canonical_sha256(
        [blocker.blocker_sha256 for blocker in resume.blockers]
    ) == EXPECTED_CUMULATIVE


def test_rejects_wrong_outer_summary_digest() -> None:
    with pytest.raises(RuntimeError, match="resume summary hash mismatch"):
        runner.validate_resume_artifact(
            runner.ResumeSpec(PRODUCTION_V17_SUMMARY, "0" * 64)
        )


def test_rejects_tampered_blocker_and_replay_records(
    resume: runner.ValidatedResume,
) -> None:
    trace = runner.read_json(resume.trace_path)
    bad_blocker = copy.deepcopy(trace)
    bad_blocker["iterations"][0]["blocker_sha256"] = "0" * 64  # type: ignore[index]
    with pytest.raises(RuntimeError, match="blocker hash mismatch"):
        runner.validate_trace_object(bad_blocker, expected_case_id=EXPECTED_CASE)

    bad_raw_replay = copy.deepcopy(trace)
    bad_raw_replay["iterations"][0]["full_check"]["replay"]["status"] = "sat"  # type: ignore[index]
    with pytest.raises(RuntimeError, match="raw replay is not UNSAT"):
        runner.validate_trace_object(bad_raw_replay, expected_case_id=EXPECTED_CASE)

    fixed_index = next(item.ordinal for item in resume.blockers if not item.generalized)
    bad_fixed = copy.deepcopy(trace)
    bad_fixed["iterations"][fixed_index]["full_check"][  # type: ignore[index]
        "fresh_normalized_full_replay"
    ]["replay_status"] = "sat"
    with pytest.raises(RuntimeError, match="fresh replay status mismatch"):
        runner.validate_trace_object(bad_fixed, expected_case_id=EXPECTED_CASE)


def test_rejects_reordered_trace_even_if_entries_are_intact(
    resume: runner.ValidatedResume,
) -> None:
    trace = runner.read_json(resume.trace_path)
    trace["iterations"][0], trace["iterations"][1] = (  # type: ignore[index]
        trace["iterations"][1], trace["iterations"][0]
    )
    with pytest.raises(RuntimeError, match="iteration order"):
        runner.validate_trace_object(trace, expected_case_id=EXPECTED_CASE)


def test_corrects_v8_entry_hash_projection_after_the_sole_unsat() -> None:
    selected = runner.load_authenticated_case_selection()
    source = runner.source_matrix.read_json_hashed(
        runner.source_matrix.V8_SUMMARY,
        runner.source_matrix.V8_SUMMARY_SHA256,
    )
    unresolved = [item for item in source["results"] if item.get("status") == "unknown"]
    assert len(selected) == len(unresolved) == 67
    assert all(
        selected[index].v8_result_entry_sha256
        == runner.canonical_sha256(unresolved[index])
        for index in range(67)
    )
    inherited = runner.source_matrix.load_case_selection()
    assert sum(
        inherited[index].v8_result_entry_sha256
        != selected[index].v8_result_entry_sha256
        for index in range(67)
    ) == 55


def test_runtime_prepass_imports_every_blocker_before_any_master_check(
    resume: runner.ValidatedResume,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    master = z3.Solver()

    class Encoding:
        groups: dict[str, tuple[z3.BoolRef, ...]] = {}

    class Gate:
        solver = z3.Solver()

    def inherited_prepass(*_args: object, **_kwargs: object):
        return {"inherited": True}, [], master

    monkeypatch.setattr(
        runner.v17, "raw_formula_sha256",
        lambda _assertions: resume.full_frozen_formula_sha256,
    )
    monkeypatch.setattr(
        runner.v16, "collect_semantic_bools",
        lambda _assertions: tuple(z3.Bool(name) for name in resume.semantic_bools),
    )
    report, learned, returned = runner._runtime_resume_prepass(
        resume, inherited_prepass
    )(Encoding(), Gate())
    imported = report["resume_import"]
    assert returned is master and learned == []
    assert len(master.assertions()) == 64
    assert imported["imported_before_first_master_check"] is True
    assert imported["frozen_full_formula_augmented"] is False
    assert imported["cumulative_blocker_sha256"] == EXPECTED_CUMULATIVE


def test_first_resumed_proposal_guard_accepts_only_outside_both_banks(
    resume: runner.ValidatedResume,
) -> None:
    candidate = _escaping_assignment(resume)
    calls: list[int] = []

    def delegate(
        _frozen: tuple[z3.BoolRef, ...],
        _fixes_arg: tuple[v19.Fix, ...],
        _timeout: int,
        _seed: int,
        iteration: int,
        _full_hash: str | None = None,
    ):
        calls.append(iteration)
        return "sat", None, (), {"status": "sat"}

    guard = runner.FirstResumedProposalGuard(resume, resume.case)
    guard.wrap(delegate)((), _fixes(candidate), 1, 97, 0, EXPECTED_FROZEN)
    audit = guard.record()
    assert calls == [0]
    assert audit["assignment_sha256"] == "5b2bf174b1c0b7b08eb0dba81987b9748d30bf853d9e4aa126bb408fb9b1c876"
    assert audit["outside_every_imported_blocker"] is True
    assert audit["outside_static_triangle_bank"] is True

    with pytest.raises(RuntimeError, match="violates imported blockers"):
        runner.audit_resumed_proposal(
            resume, resume.case, _fixes(resume.blockers[36].assignment)
        )
    without_imported = replace(
        resume, blockers=(),
        cumulative_blocker_sha256=runner.canonical_sha256([]),
    )
    with pytest.raises(RuntimeError, match="static triangle cuts"):
        runner.audit_resumed_proposal(
            without_imported, resume.case, _fixes(resume.blockers[0].assignment)
        )


def test_composed_trace_remains_standard_and_recursively_resumable(
    resume: runner.ValidatedResume,
) -> None:
    source = runner.read_json(resume.trace_path)
    terminal = copy.deepcopy(resume.blockers[0].source_iteration)
    terminal["iteration"] = 0
    terminal["full_check"] = {"status": "unknown"}
    for field in (
        "projected_core", "projected_core_sha256", "blocker", "blocker_sha256",
        "master_formula_sha256_after", "cumulative_blocker_sha256",
    ):
        terminal.pop(field, None)
    child = {
        "case_id": resume.case.case_id,
        "full_frozen_formula_sha256": resume.full_frozen_formula_sha256,
        "semantic_bools": list(resume.semantic_bools),
        "semantic_bool_count": len(resume.semantic_bools),
        "initial_master_formula_sha256": source["final_master_formula_sha256"],
        "final_master_formula_sha256": source["final_master_formula_sha256"],
        "blocker_count": 0,
        "cumulative_blocker_sha256": runner.canonical_sha256([]),
        "iterations": [terminal],
    }
    combined = runner.compose_resumed_trace(resume, child)
    universe, formula, blockers, cumulative = runner.validate_trace_object(
        combined, expected_case_id=EXPECTED_CASE
    )
    assert combined["kind"] == "retained-core-v19-resumed-trace/v2"
    assert universe == resume.semantic_bools
    assert formula == EXPECTED_FROZEN
    assert len(blockers) == 64
    assert cumulative == EXPECTED_CUMULATIVE
    assert len(combined["iterations"]) == 65


def test_composed_trace_uses_a_fixed_nonzero_resume_offset(
    resume: runner.ValidatedResume, monkeypatch: pytest.MonkeyPatch,
) -> None:
    source = runner.read_json(resume.trace_path)
    child = {
        "case_id": resume.case.case_id,
        "final_master_formula_sha256": source["final_master_formula_sha256"],
        "iterations": [{"iteration": ordinal} for ordinal in range(3)],
    }
    captured: dict[str, object] = {}
    original_validate = runner.validate_trace_object

    def capture_combined(trace: dict[str, object], **kwargs: object):
        if trace is child:
            return (
                resume.semantic_bools, resume.full_frozen_formula_sha256, (),
                runner.canonical_sha256([]),
            )
        if trace.get("kind") == "retained-core-v19-resumed-trace/v2":
            captured.update(trace)
            raise RuntimeError("captured composed trace")
        return original_validate(trace, **kwargs)

    monkeypatch.setattr(runner, "validate_trace_object", capture_combined)
    with pytest.raises(RuntimeError, match="captured composed trace"):
        runner.compose_resumed_trace(resume, child)

    imported = len(resume.blockers)
    iterations = captured["iterations"]
    assert isinstance(iterations, list)
    assert [entry["iteration"] for entry in iterations[imported:imported + 3]] == [
        imported, imported + 1, imported + 2,
    ]


def test_child_command_is_niced_and_global_worker_bound_is_24(
    resume: runner.ValidatedResume,
) -> None:
    selected = next(
        item for item in runner.load_authenticated_case_selection()
        if item.case.case_id == resume.case.case_id
    )
    command = runner.build_child_command(
        selected, HERE / "never-launched", runner.Budgets(), 97, resume
    )
    assert Path(command[0]).name == "nice"
    assert command[1:3] == ("-n", "10")
    assert "--resume" in command
    assert runner.bounded_workers("24") == 24
    with pytest.raises(Exception):
        runner.bounded_workers("25")


def test_assignment_journal_authenticates_completed_and_pending_records(
    tmp_path: Path,
) -> None:
    path, summary, trace, universe, full_hash = _synthetic_journal(tmp_path)
    validated = runner.validate_assignment_journal(
        path, summary, case_id="synthetic", universe=universe,
        full_hash=full_hash, incremental_trace=trace,
    )
    assert validated.record_count == 3
    assert len(validated.completed_assignment_sha256) == 1
    assert len(validated.pending_assignments) == 1
    assert validated.pending_assignments[0].assignment == (("a", False), ("b", True))


def test_assignment_journal_rejects_tamper_and_filename_gap(tmp_path: Path) -> None:
    tamper_root = tmp_path / "tamper"
    path, summary, trace, universe, full_hash = _synthetic_journal(tamper_root)
    first = path / "000000.json"
    record = json.loads(first.read_text())
    record["payload"]["iteration"] = 99
    first.write_text(json.dumps(record))
    with pytest.raises(RuntimeError, match="payload hash mismatch"):
        runner.validate_assignment_journal(
            path, summary, case_id="synthetic", universe=universe,
            full_hash=full_hash, incremental_trace=trace,
        )

    gap_root = tmp_path / "gap"
    gap_path, gap_summary, gap_trace, gap_universe, gap_full = _synthetic_journal(
        gap_root, with_pending=False
    )
    (gap_path / "000001.json").rename(gap_path / "000002.json")
    with pytest.raises(RuntimeError, match="filename gap"):
        runner.validate_assignment_journal(
            gap_path, gap_summary, case_id="synthetic", universe=gap_universe,
            full_hash=gap_full, incremental_trace=gap_trace,
        )


def test_pending_assignment_is_forced_before_fresh_master_work(
    resume: runner.ValidatedResume,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    assignment = _escaping_assignment(resume)
    pending = runner.PendingAssignment(
        iteration=64,
        assignment=assignment,
        assignment_sha256=runner.canonical_sha256(runner._signed_record(assignment)),
        frozen_full_formula_sha256=resume.full_frozen_formula_sha256,
        source_case_id=resume.case.case_id,
        source_journal_head_sha256="b" * 64,
        source_journal_record_count=129,
    )
    resumed = replace(resume, pending_assignments=(pending,))
    master = z3.Solver()

    class Encoding:
        groups: dict[str, tuple[z3.BoolRef, ...]] = {}

    class Gate:
        solver = z3.Solver()

    monkeypatch.setattr(
        runner.v17, "raw_formula_sha256",
        lambda _assertions: resume.full_frozen_formula_sha256,
    )
    monkeypatch.setattr(
        runner.v16, "collect_semantic_bools",
        lambda _assertions: tuple(z3.Bool(name) for name in resume.semantic_bools),
    )
    wrapped = runner._runtime_resume_prepass(
        resumed, lambda *_args, **_kwargs: ({}, [], master)
    )
    report, _, returned = wrapped(Encoding(), Gate())
    assert isinstance(returned, runner.PendingFirstSolver)
    assert returned.check() == z3.sat
    observed = runner.v16.canonical_assignment(
        returned.model(), tuple(z3.Bool(name) for name in resume.semantic_bools)
    )
    assert observed == assignment
    assert report["resume_import"]["pending_forced_before_fresh_proposals"] is True


def test_compositional_normalization_identity_rejects_authenticated_tamper() -> None:
    formula_hash = "c" * 64
    assignment_hash = "d" * 64
    identity = v19._normalization_identity(
        frozen_full_formula_sha256=formula_hash,
        assignment_sha256=assignment_hash,
        source_assertion_count=10,
        normalized_assertion_count=8,
        tracker_count=2,
        frozen_raw_pb_nodes=4,
        pre_normalization_pb_nodes=4,
    )
    record = {
        "status": "unsat",
        "normalization": {
            "logic_audit": {"accepted": True, "classification": "QF_LRA"},
            "normalized_formula_sha256": None,
            "normalized_formula_serialized": False,
            "normalized_replay_identity": identity,
        },
    }
    assert runner._validate_qf_lra_record(
        record, "synthetic", expected_full_formula_sha256=formula_hash,
        expected_assignment_sha256=assignment_hash,
    ) == identity
    bad = copy.deepcopy(record)
    components = bad["normalization"]["normalized_replay_identity"]["components"]  # type: ignore[index]
    components["complete_assignment_sha256"] = "e" * 64
    bad["normalization"]["normalized_replay_identity"]["sha256"] = (  # type: ignore[index]
        runner.canonical_sha256(components)
    )
    with pytest.raises(RuntimeError, match="identity assignment mismatch"):
        runner._validate_qf_lra_record(
            bad, "synthetic", expected_full_formula_sha256=formula_hash,
            expected_assignment_sha256=assignment_hash,
        )


def test_solver_free_preflight_authenticates_production_v17_artifact(
    capsys: pytest.CaptureFixture[str],
) -> None:
    spec = f"{PRODUCTION_V17_SUMMARY}::{runner.file_sha256(PRODUCTION_V17_SUMMARY)}"
    assert runner.main(["matrix", "--resume", spec, "--workers", "1"]) == 0
    record = json.loads(capsys.readouterr().out)
    assert record["event"] == "preflight_only"
    assert record["launch"] is False
    assert record["resume_blocker_counts"] == {EXPECTED_CASE: 64}
