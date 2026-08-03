from __future__ import annotations

import json
import multiprocessing
from pathlib import Path
from queue import Empty
from typing import Any

import pytest
import z3

import round5_cegar_v17 as v17
import round5_cegar_v19 as v19
import round5_cegar_v34_telemetry as telemetry


def _tiny_formula() -> tuple[tuple[z3.BoolRef, ...], tuple[v19.Fix, ...], str]:
    flag = z3.Bool("telemetry_test_flag")
    assertions = (flag, z3.Not(flag))
    fixes: tuple[v19.Fix, ...] = ()
    return assertions, fixes, v17.raw_formula_sha256(assertions)


def _assert_nonnegative_tree(value: object) -> None:
    if isinstance(value, dict):
        for key, child in value.items():
            if key.endswith("_seconds"):
                assert isinstance(child, (int, float))
                assert child >= 0.0
            else:
                _assert_nonnegative_tree(child)
    elif isinstance(value, list):
        for child in value:
            _assert_nonnegative_tree(child)


def _spawn_install_probe(queue: Any, install_in_child: bool) -> None:
    """Top-level target required by multiprocessing's spawn start method."""
    before = v19._normalized_check is telemetry._timed_normalized_check
    if install_in_child:
        with telemetry.installed():
            during = v19._normalized_check is telemetry._timed_normalized_check
    else:
        during = v19._normalized_check is telemetry._timed_normalized_check
    after = v19._normalized_check is telemetry._timed_normalized_check
    queue.put({"before": before, "during": during, "after": after})


def test_installed_check_preserves_status_and_normalization_identity(monkeypatch) -> None:
    assertions, fixes, formula_hash = _tiny_formula()
    monkeypatch.setattr(v17, "TRACKER_ALLOWLIST", set())
    original_status, _, original_record = v19._normalized_check(
        assertions, fixes, 1_000, 97, formula_hash
    )

    with telemetry.installed():
        status, _, record = v19._normalized_check(
            assertions, fixes, 1_000, 97, formula_hash
        )

    assert status == original_status == "unsat"
    assert (
        record["normalization"]["normalized_replay_identity"]
        == original_record["normalization"]["normalized_replay_identity"]
    )
    runtime = record["normalization"]["runtime_telemetry"]
    assert runtime["status"] == "complete"
    assert "card2bv_seconds" in runtime["phases"]
    _assert_nonnegative_tree(runtime)


def test_primary_replay_reconstruction_and_outcome_are_durable(
    tmp_path: Path, monkeypatch
) -> None:
    assertions, fixes, formula_hash = _tiny_formula()
    monkeypatch.setattr(v17, "TRACKER_ALLOWLIST", set())
    journal = v19.AssignmentJournal(tmp_path / "journal")

    with telemetry.installed():
        journal.append(
            {
                "phase": "proposed",
                "iteration": 0,
                "assignment": [],
                "assignment_sha256": "assignment-0",
            }
        )
        first_status, _, _ = v19._normalized_check(
            assertions, fixes, 1_000, 97, formula_hash
        )
        rebuilt, rebuilt_fixes, _ = v19._reconstruct_frozen(
            assertions, fixes, formula_hash
        )
        second_status, _, _ = v19._normalized_check(
            rebuilt, rebuilt_fixes, 1_000, 97, formula_hash
        )
        caller_payload = {
            "phase": "outcome",
            "iteration": 0,
            "assignment_sha256": "assignment-0",
            "status": second_status,
            "blocker": None,
        }
        journal.append(caller_payload)

    assert first_status == second_status == "unsat"
    assert "runtime_telemetry" not in caller_payload
    recovered = journal.recover()
    outcome = recovered["completed"][0]
    runtime = outcome["runtime_telemetry"]
    assert [check["label"] for check in runtime["checks"]] == ["primary", "replay"]
    assert runtime["reconstructions"][0]["label"] == "fresh_reconstruction"
    assert runtime["measured_phase_seconds"] <= runtime["total_seconds"]
    _assert_nonnegative_tree(runtime)


def test_recovered_journal_rejects_telemetry_tampering(tmp_path: Path) -> None:
    journal = v19.AssignmentJournal(tmp_path / "journal")
    with telemetry.installed():
        journal.append(
            {
                "phase": "proposed",
                "iteration": 0,
                "assignment": [],
                "assignment_sha256": "assignment-0",
            }
        )
        journal.append(
            {
                "phase": "outcome",
                "iteration": 0,
                "assignment_sha256": "assignment-0",
                "status": "unknown",
                "blocker": None,
            }
        )

    outcome_path = tmp_path / "journal" / "000001.json"
    record = json.loads(outcome_path.read_text())
    record["payload"]["runtime_telemetry"]["total_seconds"] += 1.0
    outcome_path.write_text(json.dumps(record))
    with pytest.raises(RuntimeError, match="journal payload hash mismatch"):
        journal.recover()


def test_installer_restores_predecessor_functions_after_error() -> None:
    originals = (
        v19._fixed_normalized_formula,
        v19._normalized_check,
        v19._reconstruct_frozen,
        v19.AssignmentJournal.append,
    )
    with pytest.raises(RuntimeError, match="stop"), telemetry.installed():
        raise RuntimeError("stop")
    assert originals == (
        v19._fixed_normalized_formula,
        v19._normalized_check,
        v19._reconstruct_frozen,
        v19.AssignmentJournal.append,
    )


def test_spawn_requires_child_local_installation() -> None:
    context = multiprocessing.get_context("spawn")
    results: list[dict[str, bool]] = []
    with telemetry.installed():
        for install_in_child in (False, True):
            queue = context.Queue()
            process = context.Process(
                target=_spawn_install_probe, args=(queue, install_in_child)
            )
            process.start()
            process.join(15)
            if process.is_alive():
                process.terminate()
                process.join(5)
                pytest.fail("spawn telemetry probe timed out")
            assert process.exitcode == 0
            try:
                results.append(queue.get(timeout=5))
            except Empty:
                pytest.fail("spawn telemetry probe returned no result")
            finally:
                queue.close()
                queue.join_thread()

    assert results == [
        {"before": False, "during": False, "after": False},
        {"before": False, "during": True, "after": False},
    ]


def test_inherited_v19_solve_writes_authenticated_telemetry(
    tmp_path: Path, monkeypatch
) -> None:
    assertions, fixes, formula_hash = _tiny_formula()
    monkeypatch.setattr(v17, "TRACKER_ALLOWLIST", set())

    def bounded_check(
        frozen_assertions: tuple[z3.BoolRef, ...],
        frozen_fixes: tuple[v19.Fix, ...],
        timeout_ms: int,
        seed: int,
        iteration: int,
        frozen_full_formula_sha256: str,
    ) -> tuple[str, None, tuple[v19.Fix, ...], dict[str, object]]:
        del iteration
        first_status, _, primary = v19._normalized_check(
            frozen_assertions,
            frozen_fixes,
            timeout_ms,
            seed,
            frozen_full_formula_sha256,
        )
        rebuilt, rebuilt_fixes, reconstruction = v19._reconstruct_frozen(
            frozen_assertions, frozen_fixes, frozen_full_formula_sha256
        )
        replay_status, _, replay = v19._normalized_check(
            rebuilt,
            rebuilt_fixes,
            timeout_ms,
            seed,
            frozen_full_formula_sha256,
        )
        assert first_status == replay_status == "unsat"
        return "unsat", None, (), {
            "status": "unsat",
            "primary": primary,
            "fresh_reconstruction": reconstruction,
            "fresh_replay": replay,
        }

    def bounded_predecessor_solve(**kwargs: object) -> dict[str, object]:
        outcome, _, _, _ = v19.v16.check_assignment(
            assertions,
            fixes,
            int(kwargs["timeout_ms"]),
            int(kwargs["seed"]),
            0,
        )
        return {
            "status": outcome,
            "complete": False,
            "boolean_prepass": {},
            "frozen_full_formula_sha256": formula_hash,
        }

    monkeypatch.setattr(v19, "check_assignment", bounded_check)
    monkeypatch.setattr(v19.v16, "solve_case", bounded_predecessor_solve)
    case = v19.Case("fresh", "SSS", 0, 1, 2)
    frozen = {"script_sha256": "bounded-v19-integration"}

    with telemetry.installed():
        result = v19.solve_case(
            case,
            timeout_ms=1_000,
            out_dir=tmp_path,
            seed=97,
            max_assignments=1,
            expected_script_sha256=str(frozen["script_sha256"]),
            frozen_provenance=frozen,
        )

    assert result["status"] == "unsat"
    journal = v19.AssignmentJournal(
        tmp_path / case.case_id / "assignment-journal-v19"
    )
    recovered = journal.recover()
    assert recovered["record_count"] == 2
    runtime = recovered["completed"][0]["runtime_telemetry"]
    assert [check["label"] for check in runtime["checks"]] == ["primary", "replay"]
    assert len(runtime["reconstructions"]) == 1
    _assert_nonnegative_tree(runtime)
