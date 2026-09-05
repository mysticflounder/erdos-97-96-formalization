from __future__ import annotations

import json
import re
from pathlib import Path
from types import SimpleNamespace

import pytest

from census.card_head import exactfive_profile0034_seven_order_coverage_piqd as subject


def _system(classes: dict[str, str]) -> dict[str, object]:
    return {"role_class": classes}


def _distinct_roles() -> dict[str, str]:
    roles = ("c1", "p", "q", "s", "t", "a", "d", "c2", "O")
    return {role: f"c{index:03d}" for index, role in enumerate(roles)}


def test_cyclic_order_has_wraparound_branches_and_reversal() -> None:
    term = subject.cyclic_order_term(("c000", "c001", "c002"))
    assert "(< rank_c000 rank_c001)" in term
    assert "(< rank_c002 rank_c000)" in term
    system = _system(_distinct_roles())
    atoms = subject.avoidance_assertions(system)
    assert len(atoms) == 4
    assert all("(assert (not (or" in atom for atom in atoms)


def test_alias_collapse_removes_strict_pattern_atom() -> None:
    roles = _distinct_roles()
    roles["p"] = roles["c1"]
    system = _system(roles)
    assert all(not item["admissible"] for item in subject.avoidance_patterns(system) if item["roles"][1] == "p")
    assert len(subject.avoidance_assertions(system)) == 2


def test_pattern_choices_are_exact_four() -> None:
    assert subject.pattern_role_choices() == (("p", "s"), ("p", "t"), ("q", "s"), ("q", "t"))


def test_profile_system_contains_parent_and_claim_boundaries() -> None:
    system = subject.build_coverage_system(0)
    assert system["schema"] == subject.SYSTEM_SCHEMA
    assert system["coverage_parent"]["run_id"] == "run-0001"
    assert all(value is False for value in system["claims"].values())


def test_query_is_deterministic_and_contains_avoidance() -> None:
    first = subject.prepare_profile_query(0, timeout_ms=2_000)
    second = subject.prepare_profile_query(0, timeout_ms=2_000)
    assert first.query.descriptor_bytes == second.query.descriptor_bytes
    journal = first.query.journal_smt2.decode("ascii")
    assert journal.count("(assert (not (or") == 4
    assert first.query.descriptor["stage_id"] == "seven-order-coverage"
    assert first.query.descriptor["semantic_verifier"]["id"] == "exactfive-profile0034-seven-order-coverage-replay"


@pytest.mark.parametrize("control", ["positive", "negative"])
def test_controls_are_available_without_coverage_atoms(control: str) -> None:
    prepared = subject.prepare_control_query(control, timeout_ms=1_000)
    assert prepared.key == f"control-{control}"
    assert "strict_kalmanson_quartet" in prepared.query.journal_smt2.decode("ascii")


def test_workers_are_capped() -> None:
    assert subject.normalize_workers(20) == 20
    assert subject.normalize_workers(200) == 20
    with pytest.raises(subject.SevenOrderCoverageError, match="positive"):
        subject.normalize_workers(0)


def test_terminal_record_keeps_false_claims() -> None:
    result = {"key": "profile-0000-a", "result_sha256": "b", "engines": []}
    terminal = subject.terminal_record([result], [])
    assert terminal["claims"] == subject.FALSE_CLAIMS
    assert terminal["summary"]["profiles"] == 1
    assert terminal["terminal_sha256"] == subject._manifest_hash(terminal, "terminal_sha256")


def test_sat_replay_accepts_parent_witness_and_rejects_covered_order(monkeypatch) -> None:
    prepared = subject.prepare_profile_query(0, timeout_ms=60_000)
    artifact = subject.PARENT_ROOT / "artifacts" / "profiles" / prepared.key / "z3.solve.json"
    payload = json.loads(artifact.read_text())
    accepted = subject.verify_sat_model(prepared.query, "z3", payload["model"], payload["values"])
    assert accepted.accepted
    assert accepted.evidence["all_admissible_coverage_atoms_replayed"] is True

    pattern = subject.avoidance_patterns(prepared.system)[0]["classes"]
    forced = payload["values"]
    for rank, value in zip(pattern, range(7), strict=True):
        forced = re.sub(rf"\({re.escape('rank_' + rank)} [^)]*\)", f"(rank_{rank} {value})", forced)
    monkeypatch.setattr(subject.parent, "replay_assignment", lambda *_args: subject.parent.ReplayOutcome(True, {}))
    rejected = subject.verify_sat_model(prepared.query, "z3", payload["model"], forced)
    assert not rejected.accepted
    assert rejected.evidence["reason"] == "coverage_avoidance"


def test_parent_manifest_self_hash_is_checked(monkeypatch, tmp_path: Path) -> None:
    manifest = {
        "schema": "worktree-run-manifest/v1",
        "manifest_sha256": "bad",
        "input_digests": {},
        "source_digests": {},
    }
    (tmp_path / "run_manifest.json").write_text(json.dumps(manifest))
    monkeypatch.setattr(subject, "PARENT_ROOT", tmp_path)
    with pytest.raises(subject.SevenOrderCoverageError, match="identity|self-hash"):
        subject._validate_parent_manifest()


def test_parent_digest_drift_is_rejected(monkeypatch, tmp_path: Path) -> None:
    target = tmp_path / "source.txt"
    target.write_text("current")
    manifest = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": subject.PARENT_LANE,
        "run_id": "run-0001",
        "base_head": subject.PARENT_BASE_HEAD,
        "root": f"scratch/runs/{subject.PARENT_LANE}/run-0001",
        "manifest_sha256": "",
        "input_digests": {},
        "source_digests": {"source.txt": "0" * 64},
    }
    manifest["manifest_sha256"] = subject._manifest_hash(manifest, "manifest_sha256")
    (tmp_path / "run_manifest.json").write_text(json.dumps(manifest))
    monkeypatch.setattr(subject, "PARENT_ROOT", tmp_path)
    monkeypatch.setattr(subject.parent, "REPOSITORY_ROOT", tmp_path)
    with pytest.raises(subject.SevenOrderCoverageError, match="digest"):
        subject._validate_parent_manifest()


def test_coverage_run_manifest_input_drift_is_rejected(monkeypatch, tmp_path: Path) -> None:
    source = tmp_path / "source.txt"
    input_file = tmp_path / "input.txt"
    source.write_text("source")
    input_file.write_text("input")
    manifest = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": subject.LANE_ID,
        "run_id": subject.RUN_ID,
        "root": f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}",
        "owner": subject.RUN_OWNER,
        "base_head": subject.BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {"source.txt": subject._sha(source.read_bytes())},
        "input_digests": {"input.txt": subject._sha(input_file.read_bytes())},
        "created_utc": "2026-09-05T00:53:26Z",
        "manifest_sha256": "",
    }
    manifest["manifest_sha256"] = subject._manifest_hash(manifest, "manifest_sha256")
    run_root = tmp_path / "scratch" / "runs" / subject.LANE_ID / subject.RUN_ID
    run_root.mkdir(parents=True)
    (run_root / "run_manifest.json").write_text(json.dumps(manifest))
    input_file.write_text("mutated")
    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    monkeypatch.setattr(subject.parent, "REPOSITORY_ROOT", tmp_path)
    with pytest.raises(subject.SevenOrderCoverageError, match="digest drifted"):
        subject._load_run_manifest()


def test_current_successor_run_manifest_is_loadable() -> None:
    manifest = subject._load_run_manifest()
    assert manifest["lane_id"] == subject.LANE_ID
    assert manifest["run_id"] == subject.RUN_ID
    assert manifest["owner"] == subject.RUN_OWNER


def test_control_semantics_are_reasserted_after_directory_replay() -> None:
    bad = {"engines": [{"solver": "z3", "raw_status": "UNKNOWN", "effective_status": "INCONCLUSIVE_UNKNOWN"}, {"solver": "cvc5", "raw_status": "SAT", "effective_status": "SAT_SEMANTICALLY_REPLAYED"}]}
    with pytest.raises(subject.SevenOrderCoverageError, match="control"):
        subject._check_control("positive", bad)


def test_launch_self_hash_mutation_is_rejected() -> None:
    indexes = tuple(range(subject.EXPECTED_UNRESOLVED))
    record = subject.launch_record(indexes, workers=1, timeout_ms=1_000, server="http://127.0.0.1:7272", run_manifest_sha256="a" * 64)
    mutated = dict(record)
    mutated["workers"] = 2
    assert mutated["launch_sha256"] != subject._manifest_hash(mutated, "launch_sha256")


def test_terminal_directory_mismatch_fails_closed(tmp_path: Path) -> None:
    prepared = subject.prepare_profile_query(0, timeout_ms=60_000)
    with pytest.raises(subject.parent.HardSourceSwapOrderPiqdError):
        subject.verify_terminal_directory(tmp_path / "missing", prepared)


def test_launch_is_explicit_and_default_is_silent(monkeypatch, capsys) -> None:
    monkeypatch.setattr(subject, "run_census", lambda **_kwargs: {"summary": {"profiles": 212}})
    assert subject.main([]) == 0
    assert capsys.readouterr().out == ""
    assert subject.main(["--launch"]) == 0
    assert capsys.readouterr().out == ""


def test_cli_errors_are_compact(monkeypatch, capsys) -> None:
    monkeypatch.setattr(subject, "unresolved_parent_profiles", lambda: (_ for _ in ()).throw(subject.SevenOrderCoverageError("mutated parent")))
    assert subject.main([]) == 1
    assert capsys.readouterr().err == "error: mutated parent\n"


def test_run_census_creates_artifact_parents_before_execution(monkeypatch, tmp_path: Path) -> None:
    run_root = tmp_path / "run-0001"
    run_root.mkdir()
    calls: list[Path] = []

    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    monkeypatch.setattr(subject, "unresolved_parent_profiles", lambda: (0,))
    monkeypatch.setattr(subject, "_load_run_manifest", lambda: {"manifest_sha256": "m"})
    monkeypatch.setattr(subject, "_ensure_launch_record", lambda *_args, **_kwargs: {"launch_sha256": "l"})
    monkeypatch.setattr(subject, "prepare_control_query", lambda control, **_kwargs: SimpleNamespace(key=f"control-{control}"))
    monkeypatch.setattr(subject, "prepare_profile_query", lambda *_args, **_kwargs: SimpleNamespace(key="profile-0000-test"))

    def execute(_prepared, output_directory, **_kwargs):
        assert (run_root / "artifacts" / "controls").is_dir()
        assert (run_root / "artifacts" / "profiles").is_dir()
        assert output_directory.parent.is_dir()
        calls.append(output_directory)
        if output_directory.name == "control-positive":
            statuses = [("SAT", "SAT_SEMANTICALLY_REPLAYED")] * 2
        elif output_directory.name == "control-negative":
            statuses = [("UNSAT", "UNSAT_DISCOVERY_ONLY")] * 2
        else:
            statuses = [("UNSAT", "UNSAT_DISCOVERY_ONLY")] * 2
        return {"key": output_directory.name, "result_sha256": "r", "engines": [{"solver": solver, "raw_status": raw, "effective_status": effective} for solver, (raw, effective) in zip(("z3", "cvc5"), statuses, strict=True)]}

    monkeypatch.setattr(subject.parent, "_execute_or_resume", execute)
    monkeypatch.setattr(subject, "_execute_profile", execute)
    monkeypatch.setattr(subject, "terminal_record", lambda *_args, **_kwargs: {"summary": {"profiles": 1}})
    monkeypatch.setattr(subject.parent, "_write_create_once", lambda *_args, **_kwargs: None)
    subject.run_census(workers=1, timeout_ms=1_000)
    assert len(calls) == 3
