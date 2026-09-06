from __future__ import annotations

import hashlib
import json
from pathlib import Path

import cardge13_exact13_witnessed_key_guarded_cegar_wave3_piqd as subject


def test_guarded_schema_has_exact_shape_and_no_new_variables() -> None:
    cnf, _projection = subject.root.emit_root()
    before = len(cnf.names)
    clauses = subject.guarded_clauses(cnf)
    assert len(clauses) == 1815
    assert len({clause for clause in clauses}) == 1815
    assert all(len(clause) == 7 for clause in clauses)
    assert all(clause[:2] == (
        cnf.names[f"is_b0_{center}"], cnf.names[f"is_b1_{center}"]
    ) for center in subject.root.GLOBAL_CENTERS
               for clause in clauses if clause[:2] == (
                   cnf.names[f"is_b0_{center}"], cnf.names[f"is_b1_{center}"]
               ))
    for clause in clauses:
        assert sum(literal > 0 for literal in clause) == 2
        assert len({abs(literal) for literal in clause}) == 7
    for clause in clauses:
        cnf.add(*clause)
    assert len(cnf.names) == before == 432
    assert len(cnf.clauses) == 31283


def test_guarded_antecedents_cover_only_outside_apex_and_center() -> None:
    cnf, _projection = subject.root.emit_root()
    clauses = subject.guarded_clauses(cnf)
    for center in subject.root.GLOBAL_CENTERS:
        for apex, row in ((0, "K"), (0, "L"), (1, "T")):
            row_literals = {-cnf.names[f"m_{row}_{point}"] for point in subject.root.LABELS}
            family = [clause for clause in clauses
                      if clause[:2] == (cnf.names[f"is_b0_{center}"],
                                        cnf.names[f"is_b1_{center}"])
                      and len(set(clause) & row_literals) == 2]
            assert len(family) == 55
            for clause in family:
                names = {name for name, variable in cnf.names.items()
                         if -variable in clause}
                assert f"m_G{center}_{apex}" in names
                row_points = {int(name.rsplit("_", 1)[1]) for name in names
                              if name.startswith(f"m_{row}_")}
                assert len(row_points) == 2
                assert apex not in row_points and center not in row_points


def test_wave2_import_bindings_and_model_partition_are_pinned() -> None:
    bank = subject.WAVE2_RUN / "events/cut-bank.jsonl"
    root_path = subject.WAVE2_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    assert hashlib.sha256(bank.read_bytes()).hexdigest() == subject.WAVE2_BANK_SHA256
    assert sum(1 for _line in bank.open()) == subject.WAVE2_CUT_COUNT
    assert hashlib.sha256(root_path.read_bytes()).hexdigest() == subject.WAVE2_ROOT_SHA256
    report = subject.boundary.replay_run(subject.WAVE2_RUN)
    assert report["model_count"] == 6001
    assert report["guarded_violation_model_count"] == 4432
    assert report["guarded_survivor_count"] == 1569
    assert report["zero_form_survivor_count"] == 1569


def test_imported_and_final_bank_paths_bind_distinct_hashes() -> None:
    run_event = subject.RUN_ROOT / "events/run.json"
    if not run_event.exists():
        return
    wave2_import = json.loads(run_event.read_text())["wave2_import"]
    run_root = subject.RUN_ROOT.resolve()

    def resolve_under_run_root(raw: str) -> Path:
        path = Path(raw)
        resolved = (Path.cwd() / path).resolve() if not path.is_absolute() else path.resolve()
        assert resolved.is_relative_to(run_root)
        return resolved

    imported = resolve_under_run_root(str(wave2_import["imported_bank"]))
    final = resolve_under_run_root(str(wave2_import["final_bank"]))
    imported_hash = hashlib.sha256(imported.read_bytes()).hexdigest()
    final_hash = hashlib.sha256(final.read_bytes()).hexdigest()
    assert imported != final
    assert imported_hash == wave2_import["imported_bank_sha256"]
    assert final_hash == wave2_import["final_bank_sha256"]
    assert imported_hash != final_hash


def test_imported_parent_partition_is_independent_and_not_strongvalid_worded() -> None:
    partition = subject.independent_imported_parent_partition()
    assert partition == {
        "imported_guarded_violation_count": 4431,
        "imported_guarded_survivor_count": 1569,
    }
    producer = Path(subject.__file__).read_text()
    assert "all_old_root_and_StrongValid_replays_pass" not in producer
    assert "fails old StrongValid replay" not in producer
    audit = Path("docs/audits/2026-09-06-exact13-witnessed-key-guarded-cegar-wave3.md").read_text()
    imported_section = audit.split("## PIQD result", 1)[0]
    assert "corrected root and `StrongValid`" not in imported_section


def test_new_model_replay_event_is_explicitly_strongvalid_scoped() -> None:
    path = subject.RUN_ROOT / "events/new-model-strongvalid-replay.json"
    if not path.exists():
        return
    value = json.loads(path.read_text())
    assert value["new_model_count"] == 10001
    assert value["key_valid_replays"] == 10001
    assert value["strong_valid_replays"] == 10001
    assert value["historical_imported_parents_excluded"] is True


def test_source_bindings_include_lean_checker_and_wave2_producer() -> None:
    bindings = subject.source_bindings(subject.wave1.DEFAULT_SOURCE)
    assert str(subject.wave1.DEFAULT_SOURCE) in bindings
    assert "scripts/check_exact13_guarded_boundary.py" in bindings
    assert "scripts/cardge13_exact13_witnessed_key_cegar_wave2_piqd.py" in bindings
    assert subject.checker_commit_available() is True


def test_reseal_removes_stale_event_hash() -> None:
    result = subject.reseal({"event_sha256": "stale", "payload": 1})
    unsigned = {key: value for key, value in result.items() if key != "event_sha256"}
    expected = hashlib.sha256(
        json.dumps(unsigned, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    assert result["event_sha256"] == expected


def test_completed_run_has_sealed_custody_if_present() -> None:
    run_event = subject.RUN_ROOT / "events/run.json"
    if not run_event.exists():
        return
    value = json.loads(run_event.read_text())
    recorded = value.pop("event_sha256")
    assert recorded == hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    custody = json.loads((subject.RUN_ROOT / "events/piqd-custody.json").read_text())
    assert custody["deterministic_root_plus_cuts_relation_verified"] is True
