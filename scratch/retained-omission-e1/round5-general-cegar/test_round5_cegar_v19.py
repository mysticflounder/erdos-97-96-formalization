from __future__ import annotations

import argparse
import gzip
import json
import time
from pathlib import Path

import pytest
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v18 as v18
import round5_cegar_v19 as v19
import z3

HERE = Path(__file__).resolve().parent
PRODUCTION_CASE = (
    HERE / "artifacts-v17-production1" /
    "20260802T142433.875648Z-case-pid61508" /
    "fresh_DDD_k0_d2_f1"
)
PRODUCTION_TRACE = PRODUCTION_CASE / "cegar_trace_v17.json"
PRODUCTION_FORMULA = PRODUCTION_CASE / "full_frozen_v17.smt2.gz"


def load_trace() -> dict[str, object]:
    assert PRODUCTION_TRACE.is_file()
    value = json.loads(PRODUCTION_TRACE.read_text())
    assert isinstance(value, dict)
    return value


def frozen_fixed_entry() -> dict[str, object]:
    trace = load_trace()
    entries = [
        entry for entry in trace["iterations"]
        if entry["full_check"]["lane"] == "fixed_assignment_qf_lra"
    ]
    assert entries
    entry = entries[0]
    assert entry["full_check"]["status"] == "unsat"
    assert len(entry["assignment"]) == 825
    return entry


def fixes_from_entry(entry: dict[str, object], *, ctx: z3.Context | None = None):
    return tuple(
        v19.Fix(z3.Bool(item["bool"], ctx=ctx), bool(item["value"]))
        for item in entry["assignment"]
    )


def test_normalized_identity_never_serializes_normalized_assertions(monkeypatch) -> None:
    monkeypatch.setattr(v17, "TRACKER_ALLOWLIST", set())
    x = z3.Real("x_no_sexpr")
    frozen = (x > 0, x < 1)

    def forbidden_sexpr(_self):
        raise AssertionError("normalized assertion sexpr() was called")

    monkeypatch.setattr(z3.BoolRef, "sexpr", forbidden_sexpr)
    normalized, trackers, record = v19._fixed_normalized_formula(
        frozen, (), "frozen-sha-canary"
    )
    assert normalized
    assert trackers == ()
    assert record["normalized_formula_serialized"] is False
    assert record["normalized_formula_sha256"] is None
    identity = record["normalized_replay_identity"]
    assert identity["is_raw_formula_sha256"] is False
    assert identity["components"]["frozen_full_formula_sha256"] == "frozen-sha-canary"


def test_primary_and_fresh_replay_agree_without_formula_serialization(monkeypatch) -> None:
    monkeypatch.setattr(v17, "TRACKER_ALLOWLIST", set())
    x = z3.Real("x_replay")
    frozen = (x > 0, x < 0)
    frozen_hash = v17.raw_formula_sha256(frozen)
    first_status, _, first = v19._normalized_check(
        frozen, (), 2_000, 97, frozen_hash
    )
    reconstructed, fixes, hashes = v19._reconstruct_frozen(
        frozen, (), frozen_hash
    )
    replay_status, _, replay = v19._normalized_check(
        reconstructed, fixes, 2_000, 97, frozen_hash
    )
    assert (first_status, replay_status) == ("unsat", "unsat")
    v19.validate_normalization_identity(
        first["normalization"]["normalized_replay_identity"],
        replay["normalization"]["normalized_replay_identity"],
    )
    assert hashes == {
        "source_assertions_sha256": frozen_hash,
        "reconstructed_assertions_sha256": frozen_hash,
    }


def test_compositional_identity_rejects_tampering() -> None:
    identity = v19._normalization_identity(
        frozen_full_formula_sha256="formula",
        assignment_sha256="assignment",
        source_assertion_count=26,
        normalized_assertion_count=39_448,
        tracker_count=26,
        frozen_raw_pb_nodes=4_768,
        pre_normalization_pb_nodes=658,
    )
    tampered = json.loads(json.dumps(identity))
    tampered["components"]["normalized_assertion_count"] += 1
    with pytest.raises(RuntimeError, match="differs from primary"):
        v19.validate_normalization_identity(identity, tampered)
    with pytest.raises(RuntimeError, match="hash is invalid"):
        v19.validate_normalization_identity(tampered, tampered)


def test_frozen_v17_blocker_is_exactly_the_full_825_literal_assignment() -> None:
    entry = frozen_fixed_entry()
    fixes = fixes_from_entry(entry)
    blocker = v16.blocker_for_core(fixes)
    assert z3.is_or(blocker)
    assert len(blocker.children()) == 825
    actual: dict[str, bool] = {}
    for literal in blocker.children():
        if z3.is_not(literal):
            actual[str(literal.arg(0))] = False
        else:
            actual[str(literal)] = True
    expected = {
        str(fix.variable): not fix.value
        for fix in fixes
    }
    assert actual == expected
    solver = z3.Solver()
    solver.add(*(fix.variable == fix.value for fix in fixes), blocker)
    assert solver.check() == z3.unsat


def test_v19_inherits_the_complete_v18_static_bank() -> None:
    assert v19.static_triangle_bank is v18.static_triangle_bank
    assert v19.static_triangle_bank_manifest() == v18.static_triangle_bank_manifest()
    assert len(v19.static_triangle_bank("DDD")) == 15_684


def test_journal_recovers_completed_and_pending_assignments(tmp_path: Path) -> None:
    journal = v19.AssignmentJournal(tmp_path / "assignment-journal-v19")
    journal.append({
        "phase": "proposed",
        "iteration": 0,
        "assignment": [{"bool": "a", "value": True}],
        "assignment_sha256": "assignment-0",
        "frozen_full_formula_sha256": "formula",
    })
    journal.append({
        "phase": "outcome",
        "iteration": 0,
        "assignment_sha256": "assignment-0",
        "status": "unknown",
        "blocker": None,
    })
    journal.append({
        "phase": "proposed",
        "iteration": 1,
        "assignment": [{"bool": "a", "value": False}],
        "assignment_sha256": "assignment-1",
        "frozen_full_formula_sha256": "formula",
    })
    state = v19.AssignmentJournal(journal.path).recover()
    assert state["record_count"] == 3
    assert [item["assignment_sha256"] for item in state["completed"]] == [
        "assignment-0"
    ]
    assert [item["assignment_sha256"] for item in state["pending"]] == [
        "assignment-1"
    ]
    assert not list(journal.path.glob("*.tmp"))


def test_journal_rejects_tampering(tmp_path: Path) -> None:
    journal = v19.AssignmentJournal(tmp_path / "assignment-journal-v19")
    journal.append({
        "phase": "proposed",
        "iteration": 0,
        "assignment": [],
        "assignment_sha256": "assignment",
        "frozen_full_formula_sha256": "formula",
    })
    path = journal.path / "000000.json"
    record = json.loads(path.read_text())
    record["payload"]["iteration"] = 99
    path.write_text(json.dumps(record))
    with pytest.raises(RuntimeError, match="payload hash mismatch"):
        journal.recover()


def test_unknown_outcome_has_no_blocker(monkeypatch) -> None:
    fixes = fixes_from_entry(frozen_fixed_entry())

    def unknown_check(*_args, **_kwargs):
        return "unknown", None, {
            "status": "unknown", "reason_unknown": "bounded-test-timeout"
        }

    monkeypatch.setattr(v19, "_normalized_check", unknown_check)
    status, model, core, record = v19.check_assignment(
        (), fixes, 1, 97, 45, frozen_full_formula_sha256="frozen"
    )
    assert status == "unknown"
    assert model is None
    assert core == ()
    assert record["reason_unknown"] == "bounded-test-timeout"


def test_one_frozen_v17_full_blocker_replays_unsat_with_v19_bounded() -> None:
    """One exact frozen v17 assignment; no master loop or production search."""
    assert PRODUCTION_FORMULA.is_file()
    trace = load_trace()
    entry = frozen_fixed_entry()
    with gzip.open(PRODUCTION_FORMULA, "rt", encoding="utf-8") as handle:
        smt2 = handle.read()
    assert smt2.endswith("(check-sat)\n")
    frozen = tuple(z3.parse_smt2_string(smt2.removesuffix("(check-sat)\n")))
    fixes = fixes_from_entry(entry)
    started = time.monotonic()
    status, model, core, record = v19.check_assignment(
        frozen,
        fixes,
        timeout_ms=5_000,
        seed=97,
        iteration=int(entry["iteration"]),
        frozen_full_formula_sha256=trace["full_frozen_formula_sha256"],
    )
    elapsed = time.monotonic() - started
    assert status == entry["full_check"]["status"] == "unsat"
    assert model is None
    assert len(core) == 825
    assert record["generalized"] is False
    primary_identity = record["primary"]["normalization"][
        "normalized_replay_identity"
    ]
    replay_identity = record["fresh_normalized_full_replay"][
        "normalized_replay_identity"
    ]
    v19.validate_normalization_identity(primary_identity, replay_identity)
    assert elapsed < 120, f"bounded v19 replay took {elapsed:.3f}s"


def test_provenance_pins_v18_and_v19_sources() -> None:
    provenance = v19.provenance()
    assert provenance["schema_version"] == 19
    assert provenance["script_sha256"] == v19.file_sha256(v19.SCRIPT_PATH)
    assert provenance["schema_sha256"] == v19.file_sha256(v19.SCHEMA_PATH)
    assert provenance["base_v18_script_sha256"] == v19.file_sha256(
        v19.HERE / "round5_cegar_v18.py"
    )
    assert provenance["static_equality_triangle_bank_manifest"] == (
        v18.static_triangle_bank_manifest()
    )
    assert provenance["normalization_source_sha256"] == (
        v19.normalization_source_sha256()
    )
    assert provenance["focused_test_source_sha256"] == v19.file_sha256(
        v19.TEST_PATH
    )
    assert provenance["focused_test_log_sha256"] == v19.optional_file_sha256(
        v19.FOCUSED_TEST_LOG_PATH
    )


def test_parser_rejects_broad_matrix_execution(monkeypatch) -> None:
    class FakeParser:
        @staticmethod
        def parse_args():
            return argparse.Namespace(command="matrix")

    monkeypatch.setattr(v19, "parser", lambda: FakeParser())
    with pytest.raises(SystemExit, match="only one-case"):
        v19.main()
    schema = json.loads(v19.SCHEMA_PATH.read_text())
    assert schema["execution_guard"].startswith("only one explicit case")
