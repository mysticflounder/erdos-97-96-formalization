"""Regression tests for the exact13 guarded witnessed-Key wave6 lane."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import cardge13_exact13_witnessed_key_guarded_cegar_wave6_piqd as subject


def test_wave6_root_identity_and_guarded_clause_shape() -> None:
    cnf, _projection = subject.guarded_cnf()
    assert len(cnf.names) == subject.EXPECTED_ROOT_VARIABLES == 432
    assert len(cnf.clauses) == subject.EXPECTED_ROOT_CLAUSES == 31_283
    clauses = subject.wave3.guarded_clauses(subject.root.emit_root()[0])
    assert len(clauses) == subject.EXPECTED_GUARDED_COUNT == 1_815
    assert len({tuple(clause) for clause in clauses}) == 1_815
    assert all(len(clause) == 7 for clause in clauses)
    assert all(sum(literal > 0 for literal in clause) == 2 for clause in clauses)
    assert all(len({abs(literal) for literal in clause}) == 7 for clause in clauses)


def test_wave5_final_bank_is_pinned() -> None:
    root_path = subject.WAVE5_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    bank_path = subject.WAVE5_RUN / "events/cut-bank.jsonl"
    assert hashlib.sha256(root_path.read_bytes()).hexdigest() == subject.WAVE5_ROOT_SHA256
    assert hashlib.sha256(bank_path.read_bytes()).hexdigest() == subject.WAVE5_BANK_SHA256
    assert sum(1 for _line in bank_path.open()) == subject.IMPORTED_CUT_COUNT == 56_000


def test_checkpoint_declares_only_wave6_paths() -> None:
    checkpoint = json.loads(Path(".codex/worktree-checkpoints/exact13-witnessed-key-guarded-cegar-wave6-20260906.json").read_text())
    assert checkpoint["base_head"] == subject.BASE_HEAD
    assert checkpoint["generated_roots"] == [
        "scratch/runs/exact13-witnessed-key-guarded-cegar-wave6-20260906/run-0001"
    ]
    assert all("wave5" not in path for path in checkpoint["owned_paths"])


def test_complete_cone_query_keeps_all_strict_forms() -> None:
    vectors = tuple((((0, 1), 1),) for _index in range(subject.EXPECTED_STRICT_FORM_COUNT))
    commands, names = subject._cone_query(vectors, "cancellation")
    assert len(vectors) == 1_430
    assert len(names) == 1_430
    assert commands[0] == "(set-logic QF_LRA)"
    assert "(assert (= (+ " in commands[-2]


def test_source_declares_formula_only_boundary_and_replay_contract() -> None:
    source = Path(subject.__file__).read_text()
    assert "formula-scoped solver discovery" in source
    assert "all 1,430 strict forms" in source
    assert "exact Fraction replay" in source
    assert subject.NO_EXACT_KEY_ENUMERATION_BLOCKS is True
    assert subject.NO_EXISTENTIAL_WITNESS_CUT_VARIABLES is True
