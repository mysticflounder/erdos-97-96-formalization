from __future__ import annotations

import json
from pathlib import Path

import pytest

from census.p97_search import phase3_adaptive_cubing as adaptive
from census.p97_search import phase3_structural_cegar_projected_static_v3 as v3

VARIABLES = (
    {"name": "a", "variable": 1, "key": ["a"]},
    {"name": "b", "variable": 2, "key": ["b"]},
    {"name": "c", "variable": 3, "key": ["c"]},
)


def _epoch() -> dict[str, object]:
    return adaptive.make_bank_epoch(
        epoch=0,
        source_sha256="a" * 64,
        learned_head_sha256=None,
        clause_count=7,
    )


def test_adaptive_plan_splits_hard_prefix_and_covers_root() -> None:
    calls: list[tuple[int, ...]] = []

    def pilot(spec: adaptive.CubeSpec, _budget: adaptive.PilotBudget) -> object:
        calls.append(spec.path)
        if spec.path == (0,):
            return {"verdict": "UNKNOWN", "reason": "pilot-timeout"}
        if spec.path == (0, 0):
            return {"verdict": "SAT"}
        if spec.path == (0, 1):
            return {"verdict": "UNKNOWN", "reason": "hard-leaf"}
        return {"verdict": "UNSAT", "reason": "bounded-discovery"}

    budget = adaptive.PilotBudget(wall_timeout_ms=100, max_pilots=8)
    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=2,
        budget=budget,
        bank_epoch=_epoch(),
        pilot_runner=pilot,
    )

    assert calls == [(0,), (1,), (0, 0), (0, 1)]
    assert [node["path"] for node in plan["nodes"] if node["action"] == "split"] == [[0]]
    assert plan["leaves"] == ["p1", "p00", "p01"]
    summary = adaptive.verify_plan(plan)
    assert summary["exact_cover"] is True
    assert summary["unknown_leaf_count"] == 1
    assert summary["retained_leaf_count"] == 2


def test_budget_overrun_becomes_interrupted_unknown_leaf() -> None:
    def pilot(_spec: adaptive.CubeSpec, _budget: adaptive.PilotBudget) -> object:
        return {
            "verdict": "SAT",
            "elapsed_ms": 101,
            "reason": "reported-after-budget",
        }

    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=1,
        budget=adaptive.PilotBudget(wall_timeout_ms=100, max_pilots=4),
        bank_epoch=_epoch(),
        pilot_runner=pilot,
    )

    assert all(node["action"] == "unknown" for node in plan["nodes"])
    assert all(
        node["pilot"]["effective_verdict"] == "INTERRUPTED"
        for node in plan["nodes"]
    )
    assert adaptive.verify_plan(plan)["exact_cover"] is True


def test_pilot_cap_is_explicit_and_never_omits_a_leaf() -> None:
    calls: list[tuple[int, ...]] = []

    def pilot(spec: adaptive.CubeSpec, _budget: adaptive.PilotBudget) -> object:
        calls.append(spec.path)
        return {"verdict": "SAT"}

    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=2,
        budget=adaptive.PilotBudget(conflict_limit=10, max_pilots=1),
        bank_epoch=_epoch(),
        pilot_runner=pilot,
    )

    assert calls == [(0,)]
    assert plan["nodes"][1]["action"] == "unknown"
    assert plan["nodes"][1]["pilot"]["reason"] == "pilot-cap-reached"
    assert adaptive.verify_plan(plan)["leaf_count"] == 2


def test_runner_exception_is_recorded_and_split_when_depth_allows() -> None:
    def pilot(spec: adaptive.CubeSpec, _budget: adaptive.PilotBudget) -> object:
        if spec.path == (0,):
            raise RuntimeError("pilot backend unavailable")
        return {"verdict": "SAT"}

    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=2,
        budget=adaptive.PilotBudget(conflict_limit=10, max_pilots=8),
        bank_epoch=_epoch(),
        pilot_runner=pilot,
    )
    exception_node = next(node for node in plan["nodes"] if node["path"] == [0])
    assert exception_node["pilot"]["verdict"] == "EXCEPTION"
    assert exception_node["action"] == "split"
    assert adaptive.verify_plan(plan)["exact_cover"] is True


def test_plan_write_load_and_tamper_detection(tmp_path: Path) -> None:
    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=1,
        budget=adaptive.PilotBudget(conflict_limit=10),
        bank_epoch=_epoch(),
        pilot_runner=lambda _spec, _budget: {"verdict": "UNKNOWN"},
    )
    path = tmp_path / "adaptive-plan.json"
    adaptive.write_plan(path, plan)
    assert adaptive.load_plan(path) == plan

    tampered = json.loads(path.read_text())
    tampered["nodes"][0]["literals"][0] *= -1
    with pytest.raises(adaptive.AdaptiveCubingError, match="hash mismatch"):
        adaptive.verify_plan(tampered)


def test_bank_epoch_transition_is_authenticated() -> None:
    first = _epoch()
    second = adaptive.make_bank_epoch(
        epoch=1,
        source_sha256="b" * 64,
        learned_head_sha256="c" * 64,
        clause_count=8,
        parent=first,
    )
    adaptive.validate_bank_epoch_transition(first, second)

    broken = dict(second)
    broken["parent_epoch_sha256"] = "d" * 64
    with pytest.raises(adaptive.AdaptiveCubingError, match="hash"):
        adaptive.validate_bank_epoch_transition(first, broken)


def test_successor_adapter_binds_live_semantic_variables() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    plan = v3.build_adaptive_cube_plan(
        encoding,
        initial_depth=1,
        max_depth=2,
        budget=adaptive.PilotBudget(conflict_limit=10),
        bank_epoch=_epoch(),
        pilot_runner=lambda _spec, _budget: {"verdict": "SAT"},
    )

    assert plan["schema"] == adaptive.SCHEMA
    assert plan["semantic_variables"] == [
        {
            "position": position,
            "name": name,
            "variable": variable,
            "key": list(key),
        }
        for position, (name, variable, key) in enumerate(
            v3._stable_semantic_variables(encoding, 2)
        )
    ]
    assert adaptive.verify_plan(plan)["exact_cover"] is True


def test_wave_consumes_authenticated_leaves_and_preserves_unknown(tmp_path: Path) -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    plan = v3.build_adaptive_cube_plan(
        encoding,
        initial_depth=1,
        max_depth=1,
        budget=adaptive.PilotBudget(conflict_limit=10),
        bank_epoch=_epoch(),
        pilot_runner=lambda _spec, _budget: {"verdict": "SAT"},
    )
    seen: list[tuple[int, ...]] = []

    def runner(spec: adaptive.CubeSpec) -> object:
        seen.append(spec.path)
        return {"verdict": "UNKNOWN" if spec.path == (1,) else "SAT"}

    state = v3.run_adaptive_cube_wave(
        encoding,
        plan,
        state_path=tmp_path / "wave.json",
        current_bank_epoch=_epoch(),
        leaf_runner=runner,
    )

    assert seen == [(0,), (1,)]
    assert state["status"] == "UNKNOWN"
    assert adaptive.verify_wave_state(state, plan)["unresolved_count"] == 1


def test_wave_crash_resume_replays_only_uncommitted_leaf(tmp_path: Path) -> None:
    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=1,
        budget=adaptive.PilotBudget(conflict_limit=10),
        bank_epoch=_epoch(),
        pilot_runner=lambda _spec, _budget: {"verdict": "SAT"},
    )
    state_path = tmp_path / "wave.json"
    first_calls: list[tuple[int, ...]] = []

    def crashing_runner(spec: adaptive.CubeSpec) -> object:
        first_calls.append(spec.path)
        if len(first_calls) == 2:
            raise SystemExit("simulated worker crash")
        return {"verdict": "SAT"}

    with pytest.raises(SystemExit, match="simulated worker crash"):
        adaptive.run_plan_wave(
            plan,
            state_path=state_path,
            current_bank_epoch=_epoch(),
            leaf_runner=crashing_runner,
        )

    checkpoint = adaptive.load_wave_state(state_path)
    assert checkpoint["status"] == "RUNNING"
    assert checkpoint["next_leaf_index"] == 1

    resumed_calls: list[tuple[int, ...]] = []
    state = adaptive.run_plan_wave(
        plan,
        state_path=state_path,
        current_bank_epoch=_epoch(),
        leaf_runner=lambda spec: (
            resumed_calls.append(spec.path) or {"verdict": "SAT"}
        ),
        resume=True,
    )
    assert resumed_calls == [(1,)]
    assert state["status"] == "COMPLETE"
    assert state["result_count"] == 2


def test_wave_budget_checkpoint_resumes_at_next_leaf(tmp_path: Path) -> None:
    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=2,
        budget=adaptive.PilotBudget(conflict_limit=10),
        bank_epoch=_epoch(),
        pilot_runner=lambda _spec, _budget: {"verdict": "SAT"},
    )
    state_path = tmp_path / "wave.json"
    partial = adaptive.run_plan_wave(
        plan,
        state_path=state_path,
        current_bank_epoch=_epoch(),
        leaf_runner=lambda _spec: {"verdict": "SAT"},
        max_leaves=1,
    )
    assert partial["status"] == "BUDGET"
    assert partial["next_leaf_index"] == 1

    resumed = adaptive.run_plan_wave(
        plan,
        state_path=state_path,
        current_bank_epoch=_epoch(),
        leaf_runner=lambda _spec: {"verdict": "SAT"},
        resume=True,
    )
    assert resumed["status"] == "COMPLETE"
    assert resumed["result_count"] == resumed["leaf_count"]


def test_wave_rejects_stale_bank_epoch_before_consumption(tmp_path: Path) -> None:
    first = _epoch()
    second = adaptive.make_bank_epoch(
        epoch=1,
        source_sha256="b" * 64,
        learned_head_sha256="c" * 64,
        clause_count=8,
        parent=first,
    )
    plan = adaptive.build_plan(
        VARIABLES,
        initial_depth=1,
        max_depth=1,
        budget=adaptive.PilotBudget(conflict_limit=10),
        bank_epoch=first,
        pilot_runner=lambda _spec, _budget: {"verdict": "SAT"},
    )

    with pytest.raises(adaptive.AdaptiveCubingError, match="stale bank epoch"):
        adaptive.run_plan_wave(
            plan,
            state_path=tmp_path / "wave.json",
            current_bank_epoch=second,
            leaf_runner=lambda _spec: {"verdict": "SAT"},
        )


def test_successor_wave_matches_fixed_cube_literal_order(tmp_path: Path) -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    depth = 3
    fixed_cubes = v3._cube_partition(encoding, depth)
    plan = v3.build_adaptive_cube_plan(
        encoding,
        initial_depth=depth,
        max_depth=depth,
        budget=adaptive.PilotBudget(conflict_limit=10),
        bank_epoch=_epoch(),
        pilot_runner=lambda _spec, _budget: {"verdict": "SAT"},
    )
    seen: list[tuple[int, ...]] = []
    state = v3.run_adaptive_cube_wave(
        encoding,
        plan,
        state_path=tmp_path / "wave.json",
        current_bank_epoch=_epoch(),
        leaf_runner=lambda spec: (
            seen.append(spec.literals) or {"verdict": "SAT"}
        ),
    )

    assert seen == list(fixed_cubes)
    assert state["status"] == "COMPLETE"
