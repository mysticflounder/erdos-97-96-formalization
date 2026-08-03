#!/usr/bin/env python3
"""Round-5 v17: equality closure plus audited fixed-assignment QF_LRA.

Every generalized blocker is authenticated by raw replay against the frozen
v15 formula.  The fallback normalizes PB constraints only after a complete
semantic-Bool assignment, audits the result as QF_LRA, and admits only the
complete assignment after an independent fresh normalized-full replay.

This is external exact-n15 solver evidence, not a Lean proof or universal
closure result.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from collections import deque
from pathlib import Path
from typing import Iterable, Sequence

import z3
from z3.z3util import is_expr_val

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v16 as v16


HERE = Path(__file__).resolve().parent
TARGET = v16.TARGET
SCHEMA_VERSION = 17
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v17.json"
TEST_PATH = HERE / "test_round5_cegar_v17.py"
FOCUSED_TEST_LOG_PATH = HERE / "focused-tests-v17.log"
FOCUSED_TEST_COMMAND = "uv run --with pytest pytest -q test_round5_cegar_v17.py"
Case = v16.Case
Fix = v16.Fix


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def optional_file_sha256(path: Path) -> str | None:
    return file_sha256(path) if path.is_file() else None


def canonical_sha256(value: object) -> str:
    return v16.canonical_sha256(value)


def raw_formula_sha256(assertions: Sequence[z3.BoolRef]) -> str:
    """Hash raw assertions without assuming Z3's global main context."""
    ctx = assertions[0].ctx if assertions else z3.main_ctx()
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=1, random_seed=0, threads=1)
    solver.add(*assertions)
    return v16.formula_sha256(solver)


def source_contract() -> dict[str, object]:
    contract = v16.source_contract()
    role_map = dict(contract["role_map"])
    role_map["boolean_assignment_cegar"] = (
        "v12 proposes complete semantic-Bool assignments; v17 first searches "
        "for an explained equality-closure contradiction and raw-replays it, "
        "otherwise exactly linearizes PB terms, audits QF_LRA, and blocks only "
        "a complete assignment after independent normalized-full replay"
    )
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    inherited = v16.provenance()
    return {
        **inherited,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "base_v16_script_sha256": file_sha256(HERE / "round5_cegar_v16.py"),
        "base_v16_schema_sha256": file_sha256(HERE / "schema_v16.json"),
        "focused_test_source": TEST_PATH.name,
        "focused_test_source_sha256": file_sha256(TEST_PATH),
        "focused_test_log": FOCUSED_TEST_LOG_PATH.name,
        "focused_test_log_sha256": optional_file_sha256(FOCUSED_TEST_LOG_PATH),
        "focused_test_command": FOCUSED_TEST_COMMAND,
        "source_contract": source_contract(),
    }


def verify_frozen_provenance(
    frozen: dict[str, object], expected_script_sha256: str | None = None
) -> dict[str, object]:
    current = provenance()
    if frozen != current:
        differing = sorted(
            key for key in set(frozen) | set(current)
            if frozen.get(key) != current.get(key)
        )
        raise RuntimeError(f"frozen provenance differs from worker source: {differing}")
    if expected_script_sha256 is not None and current["script_sha256"] != expected_script_sha256:
        raise RuntimeError("worker v17 source hash differs from parent invocation")
    return current


def _tracker_refs(expressions: Iterable[z3.ExprRef]) -> tuple[z3.BoolRef, ...]:
    refs: dict[str, z3.BoolRef] = {}
    for node in v16._walk(expressions):
        if (
            z3.is_const(node) and not is_expr_val(node) and z3.is_bool(node)
            and node.decl().kind() == z3.Z3_OP_UNINTERPRETED
            and str(node).startswith("track_")
        ):
            refs[str(node)] = node
    return tuple(refs[name] for name in sorted(refs))


def _fix_map(fixes: Sequence[Fix]) -> dict[str, Fix]:
    result = {str(fix.variable): fix for fix in fixes}
    if len(result) != len(fixes):
        raise RuntimeError("duplicate semantic fix")
    return result


def _edge(center: int, point: int) -> tuple[int, int]:
    return tuple(sorted((center, point)))  # type: ignore[return-value]


def equality_closure_core(fixes: Sequence[Fix]) -> tuple[Fix, ...]:
    """Return a concrete Boolean explanation of a distance-equality clash."""
    by_name = _fix_map(fixes)
    adjacency: dict[tuple[int, int], list[tuple[tuple[int, int], tuple[Fix, ...]]]] = {}
    targets: list[tuple[tuple[int, int], dict[tuple[int, int], Fix], tuple[Fix, ...]]] = []

    def get(name: str) -> Fix | None:
        return by_name.get(name)

    def add_row(
        center: int, names: Sequence[str], activation: Fix | None,
        false_is_disequality: bool,
    ) -> None:
        row_fixes = [get(name) for name in names]
        present = [fix for fix in row_fixes if fix is not None]
        if len(present) != len(names):
            return
        true_items = [(name, fix) for name, fix in zip(names, present) if fix.value]
        if not true_items:
            return
        anchor_name, anchor_fix = true_items[0]
        anchor_point = int(anchor_name.rsplit("_", 1)[1])
        anchor_edge = _edge(center, anchor_point)
        for name, fix in true_items[1:]:
            point = int(name.rsplit("_", 1)[1])
            other = _edge(center, point)
            explanation = (anchor_fix, fix) + ((activation,) if activation else ())
            adjacency.setdefault(anchor_edge, []).append((other, explanation))
            adjacency.setdefault(other, []).append((anchor_edge, explanation))
        if false_is_disequality:
            true_edges = {
                _edge(center, int(name.rsplit("_", 1)[1])): fix
                for name, fix in true_items
            }
            for name, fix in zip(names, present):
                if not fix.value:
                    point = int(name.rsplit("_", 1)[1])
                    base = (fix,) + ((activation,) if activation else ())
                    targets.append((_edge(center, point), true_edges, base))

    for center in v8.POINTS:
        add_row(center, [f"k4_{center}_{x}" for x in v8.POINTS if x != center], None, False)
        active = next(
            (fix for q in v8.POINTS if (fix := get(f"block_{q}_{center}")) is not None and fix.value),
            None,
        )
        if active is not None:
            add_row(
                center,
                [f"critical_row_{center}_{x}" for x in v8.POINTS if x != center],
                active,
                True,
            )
    for apex_index, apex in enumerate(v8.APICES):
        for cls in range(2):
            names = [f"rich_{apex_index}_{cls}_{x}" for x in v8.POINTS if x != apex]
            if any(name in by_name for name in names):
                add_row(apex, names, None, True)

    best: tuple[Fix, ...] | None = None
    for start, goals, base in targets:
        goal_set = set(goals)
        queue = deque([start])
        previous: dict[tuple[int, int], tuple[tuple[int, int], tuple[Fix, ...]] | None] = {start: None}
        found: tuple[int, int] | None = start if start in goal_set else None
        while queue and found is None:
            here = queue.popleft()
            for nxt, explanation in adjacency.get(here, ()):
                if nxt in previous:
                    continue
                previous[nxt] = (here, explanation)
                if nxt in goal_set:
                    found = nxt
                    break
                queue.append(nxt)
        if found is None:
            continue
        collected = list(base)
        collected.append(goals[found])
        cursor = found
        while previous[cursor] is not None:
            parent, explanation = previous[cursor]  # type: ignore[misc]
            collected.extend(explanation)
            cursor = parent
        unique = {str(fix.variable): fix for fix in collected}
        candidate = tuple(unique[name] for name in sorted(unique))
        if best is None or len(candidate) < len(best):
            best = candidate
    return best or ()


PB_KINDS = {
    z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST,
    z3.Z3_OP_PB_LE, z3.Z3_OP_PB_GE, z3.Z3_OP_PB_EQ,
}

TRACKER_ALLOWLIST = frozenset({
    "track_apex_global_k4_profile_compatibility",
    "track_apex_packet_b1_profile_compatibility",
    "track_common_deletion_packets",
    "track_critical_blocker_map",
    "track_critical_full_row",
    "track_critical_no_competing_K4",
    "track_critical_row_cross_cap_rich_slice_one_hit",
    "track_cyclic_alternation_cut",
    "track_distinct_circle_overlap",
    "track_exact_rich_profiles",
    "track_four_point_squared_cnd",
    "track_global_K4",
    "track_no_all_apex_shell",
    "track_nonapex_global_k4_squared_superadditivity",
    "track_normal_form",
    "track_packet_B2_equals_critical_row",
    "track_pair_center_multiplicity",
    "track_positive_distances",
    "track_positive_squared_distances",
    "track_rich_apex_not_critical_center",
    "track_same_shell_squared_superadditivity",
    "track_source_in_critical_row",
    "track_squared_distance_equality_transport",
    "track_strict_kalmanson",
    "track_strict_triangle",
    "track_triple_center_multiplicity",
})


def _rewrite_weighted_pb(node: z3.ExprRef, children: Sequence[z3.ExprRef]) -> z3.BoolRef:
    kind = node.decl().kind()
    params = [int(value) for value in node.params()]
    threshold = params[0]
    weights = [1] * len(children) if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST} else params[1:]
    if len(weights) != len(children) or any(weight < 0 for weight in weights):
        raise RuntimeError("unsupported PB weights")
    if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST}:
        return node.decl()(*children)
    if (
        kind == z3.Z3_OP_PB_GE and threshold == 13 and len(children) == 14
        and weights.count(1) == 13 and weights.count(2) == 1
    ):
        units = [child for child, weight in zip(children, weights) if weight == 1]
        heavy = next(child for child, weight in zip(children, weights) if weight == 2)
        return z3.And(z3.AtLeast(*units, 11), z3.Or(heavy, z3.And(*units)))
    raise RuntimeError(
        f"unexpected fixed-assignment PB shape: kind={kind}, threshold={threshold}, "
        f"arity={len(children)}, weights={weights}"
    )


def rewrite_weighted_pbs(expression: z3.ExprRef, memo: dict[int, z3.ExprRef] | None = None) -> z3.ExprRef:
    memo = {} if memo is None else memo
    node_id = expression.get_id()
    if node_id in memo:
        return memo[node_id]
    if z3.is_quantifier(expression) or expression.num_args() == 0:
        result = expression
    else:
        children = tuple(rewrite_weighted_pbs(child, memo) for child in expression.children())
        result = _rewrite_weighted_pb(expression, children) if expression.decl().kind() in PB_KINDS else expression.decl()(*children)
    memo[node_id] = result
    return result


def logic_audit(assertions: Sequence[z3.BoolRef]) -> dict[str, object]:
    counts = {
        "nodes": 0, "pb_nodes": 0, "quantifiers": 0, "bad_sorts": 0,
        "integer_nodes": 0, "bitvector_nodes": 0, "array_nodes": 0,
        "uf_applications": 0, "nonlinear_nodes": 0, "ite_nodes": 0,
    }
    examples: list[str] = []
    for node in v16._walk(assertions):
        counts["nodes"] += 1
        sort_kind = node.sort().kind()
        if sort_kind not in {z3.Z3_BOOL_SORT, z3.Z3_REAL_SORT}:
            counts["bad_sorts"] += 1
            if sort_kind == z3.Z3_INT_SORT:
                counts["integer_nodes"] += 1
            elif sort_kind == z3.Z3_BV_SORT:
                counts["bitvector_nodes"] += 1
            elif sort_kind == z3.Z3_ARRAY_SORT:
                counts["array_nodes"] += 1
            if len(examples) < 8:
                examples.append(node.sexpr())
        if z3.is_quantifier(node):
            counts["quantifiers"] += 1
            continue
        kind = node.decl().kind()
        if kind in PB_KINDS:
            counts["pb_nodes"] += 1
        if kind == z3.Z3_OP_ITE:
            counts["ite_nodes"] += 1
        if kind == z3.Z3_OP_UNINTERPRETED and node.num_args() > 0:
            counts["uf_applications"] += 1
        if kind == z3.Z3_OP_POWER:
            counts["nonlinear_nodes"] += 1
        elif kind == z3.Z3_OP_MUL:
            nonnumerals = sum(not z3.is_rational_value(child) for child in node.children())
            if nonnumerals > 1:
                counts["nonlinear_nodes"] += 1
        elif kind == z3.Z3_OP_DIV and not z3.is_rational_value(node.arg(1)):
            counts["nonlinear_nodes"] += 1
    accepted = all(counts[key] == 0 for key in (
        "pb_nodes", "ite_nodes", "quantifiers", "bad_sorts", "uf_applications", "nonlinear_nodes"
    ))
    return {**counts, "classification": "QF_LRA" if accepted else "REJECTED", "accepted": accepted, "examples": examples}


def _assignment_record(fixes: Sequence[Fix]) -> list[dict[str, object]]:
    return [fix.record() for fix in sorted(fixes, key=lambda item: str(item.variable))]


def _fixed_normalized_formula(
    frozen_assertions: Sequence[z3.BoolRef], fixes: Sequence[Fix]
) -> tuple[tuple[z3.BoolRef, ...], tuple[z3.BoolRef, ...], dict[str, object]]:
    started = time.monotonic()
    trackers = _tracker_refs(frozen_assertions)
    tracker_names = {str(tracker) for tracker in trackers}
    if tracker_names != TRACKER_ALLOWLIST:
        raise RuntimeError(
            "frozen formula tracker allowlist mismatch: "
            f"missing={sorted(TRACKER_ALLOWLIST - tracker_names)}, "
            f"extra={sorted(tracker_names - TRACKER_ALLOWLIST)}"
        )
    raw_pb_count = sum(
        node.decl().kind() in PB_KINDS
        for node in v16._walk(frozen_assertions)
        if not z3.is_quantifier(node)
    )
    is_round5_universe = len(fixes) == 825 and any(
        str(fix.variable).startswith("block_") for fix in fixes
    )
    if is_round5_universe and raw_pb_count != 4_768:
        raise RuntimeError(f"frozen raw PB inventory changed: expected 4768, got {raw_pb_count}")
    tracker_ids = {tracker.get_id() for tracker in trackers}
    ctx = frozen_assertions[0].ctx if frozen_assertions else z3.main_ctx()
    substitutions = (
        tuple((fix.variable, z3.BoolVal(fix.value, ctx=ctx)) for fix in fixes)
        + tuple((tracker, z3.BoolVal(True, ctx=ctx)) for tracker in trackers)
    )
    source = [assertion for assertion in frozen_assertions if assertion.get_id() not in tracker_ids]
    simplified = [z3.simplify(z3.substitute(assertion, *substitutions)) for assertion in source]
    pb_nodes = [node for node in v16._walk(simplified) if not z3.is_quantifier(node) and node.decl().kind() in PB_KINDS]
    before_pb = len(pb_nodes)
    pb_shapes: dict[str, int] = {}
    for node in pb_nodes:
        key = f"kind={node.decl().kind()};arity={node.num_args()};params={','.join(map(str, node.params()))}"
        pb_shapes[key] = pb_shapes.get(key, 0) + 1
    combined = z3.And(*simplified)
    rewritten = rewrite_weighted_pbs(combined)
    goal = z3.Goal(ctx=ctx)
    goal.add(rewritten)
    transformed = z3.Tactic("card2bv", ctx=ctx)(goal)
    if len(transformed) != 1:
        raise RuntimeError(f"card2bv produced {len(transformed)} subgoals")
    normalized = tuple(transformed[0])
    audit = logic_audit(normalized)
    if audit["accepted"] is not True:
        raise RuntimeError(f"post-normalization logic audit rejected formula: {audit}")
    formula_hash = hashlib.sha256("\n".join(assertion.sexpr() for assertion in normalized).encode()).hexdigest()
    return normalized, trackers, {
        "elapsed_seconds": time.monotonic() - started,
        "source_assertion_count": len(source),
        "frozen_raw_pb_nodes": raw_pb_count,
        "normalized_assertion_count": len(normalized),
        "pre_normalization_pb_nodes": before_pb,
        "pre_normalization_pb_shapes": dict(sorted(pb_shapes.items())),
        "normalized_formula_sha256": formula_hash,
        "logic_audit": audit,
    }


def _normalized_check(
    frozen_assertions: Sequence[z3.BoolRef], fixes: Sequence[Fix], timeout_ms: int, seed: int
) -> tuple[str, z3.ModelRef | None, dict[str, object]]:
    normalized, trackers, normalization = _fixed_normalized_formula(frozen_assertions, fixes)
    ctx = frozen_assertions[0].ctx if frozen_assertions else z3.main_ctx()
    solver = z3.SolverFor("QF_LRA", ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*normalized)
    started = time.monotonic()
    outcome = solver.check()
    elapsed = time.monotonic() - started
    raw_core: tuple[z3.BoolRef, ...] = ()
    model = solver.model() if outcome == z3.sat else None
    if model is not None:
        for fix in fixes:
            model.update_value(fix.variable.decl(), z3.BoolVal(fix.value, ctx=ctx))
        for tracker in trackers:
            model.update_value(tracker.decl(), z3.BoolVal(True, ctx=ctx))
    record = {
        "status": str(outcome), "elapsed_seconds": elapsed,
        "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "normalization": normalization,
        "tracker_assumption_count": len(trackers),
        "tracker_mode": "exact_allowlist_substituted_true",
        "tracker_core_status": "not_requested_after_assumption_lane_timed_out",
        "tracker_core": sorted(str(item) for item in raw_core),
        "tracker_core_sha256": canonical_sha256(sorted(str(item) for item in raw_core)),
    }
    return str(outcome), model, record


def _reconstruct_frozen(
    assertions: Sequence[z3.BoolRef], fixes: Sequence[Fix]
) -> tuple[tuple[z3.BoolRef, ...], tuple[Fix, ...], dict[str, str]]:
    fresh_ctx = z3.Context()
    reconstructed = tuple(assertion.translate(fresh_ctx) for assertion in assertions)
    reconstructed_fixes = tuple(
        Fix(z3.Bool(str(fix.variable), ctx=fresh_ctx), fix.value) for fix in fixes
    )
    before = canonical_sha256([assertion.sexpr() for assertion in assertions])
    after = canonical_sha256([assertion.sexpr() for assertion in reconstructed])
    if before != after:
        raise RuntimeError("fresh raw-formula reconstruction changed frozen formula hash")
    return reconstructed, reconstructed_fixes, {
        "source_assertions_sha256": before,
        "reconstructed_assertions_sha256": after,
    }


def _validate_raw_model(
    frozen_assertions: Sequence[z3.BoolRef], model: z3.ModelRef
) -> dict[str, object]:
    failures = []
    for index, assertion in enumerate(frozen_assertions):
        value = model.eval(assertion, model_completion=True)
        if not z3.is_true(value):
            failures.append({"index": index, "assertion": assertion.sexpr(), "value": value.sexpr()})
            if len(failures) == 8:
                break
    return {"checked": len(frozen_assertions), "failures": failures}


def check_assignment(
    frozen_assertions: Sequence[z3.BoolRef], fixes: Sequence[Fix],
    timeout_ms: int, seed: int, iteration: int,
) -> tuple[str, z3.ModelRef | None, tuple[Fix, ...], dict[str, object]]:
    assignment_record = _assignment_record(fixes)
    assignment_hash = canonical_sha256(assignment_record)
    universe_hash = canonical_sha256(sorted(str(fix.variable) for fix in fixes))
    if len(fixes) != 825 or len({str(fix.variable) for fix in fixes}) != 825:
        raise RuntimeError("v17 requires exactly 825 unique complete semantic fixes")
    expected_blocker_hash = hashlib.sha256(v16.blocker_for_core(fixes).sexpr().encode()).hexdigest()
    closure_core = equality_closure_core(fixes)
    if closure_core:
        replay = v16.replay_projected_core(
            frozen_assertions, closure_core, timeout_ms, seed,
            nonce=f"v17_closure_{iteration:06d}",
        )
        if replay["status"] == "unknown":
            return "unknown", None, (), {
                "status": "unknown", "lane": "equality_closure_raw_replay",
                "reason_unknown": replay["reason_unknown"], "replay": replay,
            }
        v16.authenticate_unsat_core(replay)
        return "unsat", None, closure_core, {
            "status": "unsat", "lane": "equality_closure_raw_replay",
            "generalized": True, "assignment_sha256": assignment_hash,
            "projected_core_size": len(closure_core), "replay": replay,
        }

    first_status, model, first = _normalized_check(frozen_assertions, fixes, timeout_ms, seed)
    if first_status == "unknown":
        return "unknown", None, (), {
            "status": "unknown", "lane": "fixed_assignment_qf_lra",
            "reason_unknown": first["reason_unknown"], "primary": first,
        }
    if first_status == "sat":
        assert model is not None
        validation = _validate_raw_model(frozen_assertions, model)
        if validation["failures"]:
            raise RuntimeError("normalized SAT model failed frozen raw assertion evaluation")
        return "sat", model, (), {
            "status": "sat", "lane": "fixed_assignment_qf_lra",
            "reason_unknown": None, "primary": first, "raw_model_validation": validation,
        }

    raw_formula_hash = raw_formula_sha256(frozen_assertions)
    reconstructed, replay_fixes, reconstruction = _reconstruct_frozen(frozen_assertions, fixes)
    replay_status, _, replay = _normalized_check(reconstructed, replay_fixes, timeout_ms, seed)
    replay_assignment_hash = canonical_sha256(_assignment_record(replay_fixes))
    if replay_assignment_hash != assignment_hash:
        raise RuntimeError("fresh normalized replay assignment identity changed")
    if replay_status == "unknown":
        return "unknown", None, (), {
            "status": "unknown", "lane": "fixed_assignment_qf_lra_replay",
            "reason_unknown": replay["reason_unknown"], "primary": first, "replay": replay,
        }
    if replay_status != "unsat":
        raise RuntimeError(f"fresh normalized replay disagreed with UNSAT primary: {replay_status}")
    replay_normalization = replay["normalization"]
    assert isinstance(replay_normalization, dict)
    replay.update({
        "replay_status": replay_status,
        "theory_logic": "QF_LRA",
        "qf_lra_audit": replay_normalization["logic_audit"],
        "normalized_formula_sha256": replay_normalization["normalized_formula_sha256"],
        "fixed_assignment_pb_nodes": replay_normalization["pre_normalization_pb_nodes"],
        "frozen_raw_pb_nodes": replay_normalization["frozen_raw_pb_nodes"],
        "raw_formula_sha256": raw_formula_hash,
        **reconstruction,
        "semantic_bool_universe_sha256": universe_hash,
        "assignment_sha256": replay_assignment_hash,
        "complete_blocker_sha256": expected_blocker_hash,
        "complete_assignment_size": len(replay_fixes),
    })
    return "unsat", None, tuple(fixes), {
        "status": "unsat", "lane": "fixed_assignment_qf_lra",
        "reason_unknown": None, "generalized": False,
        "blocker_scope": "complete_semantic_assignment",
        "assignment_sha256": assignment_hash,
        "semantic_bool_universe_sha256": universe_hash,
        "expected_complete_blocker_sha256": expected_blocker_hash,
        "frozen_full_formula_sha256": raw_formula_hash,
        "primary": first, "fresh_normalized_full_replay": replay,
    }


def _rename_v17_artifacts(case_dir: Path, result: dict[str, object]) -> None:
    mapping = {
        "cegar_trace_v16.json": "cegar_trace_v17.json",
        "boolean_prepass_v16.json": "boolean_prepass_v17.json",
        "boolean_master_v16.smt2.gz": "boolean_master_v17.smt2.gz",
        "full_frozen_v16.smt2.gz": "full_frozen_v17.smt2.gz",
        "witness_v16.json": "witness_v17.json",
    }
    for old, new in mapping.items():
        old_path = case_dir / old
        if old_path.exists():
            old_path.rename(case_dir / new)
        for key, value in list(result.items()):
            if value == old:
                result[key] = new
    trace_path = case_dir / "cegar_trace_v17.json"
    prepass_path = case_dir / "boolean_prepass_v17.json"
    if trace_path.exists():
        result["cegar_trace_sha256"] = file_sha256(trace_path)
    if prepass_path.exists():
        result["boolean_prepass_sha256"] = file_sha256(prepass_path)
    blob_hashes = {}
    for role, filename in (
        ("boolean_master", "boolean_master_v17.smt2.gz"),
        ("full_frozen", "full_frozen_v17.smt2.gz"),
    ):
        path = case_dir / filename
        if path.is_file():
            blob_hashes[role] = {"file": filename, "sha256": file_sha256(path)}
    result["frozen_blob_hashes"] = blob_hashes
    result["result_hash_contract"] = {
        "embedded": False,
        "reason": "A result.json SHA-256 cannot be embedded in result.json without changing the hashed bytes.",
        "external_attestation": "summary.json:results[0].result_file_sha256",
    }


def _rename_incomplete_reason(result: dict[str, object]) -> None:
    reason = result.get("reason_incomplete")
    if reason == "v16_assignment_budget_exhausted":
        result["reason_incomplete"] = "v17_assignment_budget_exhausted"
    elif reason == "v16_wall_clock_budget_exhausted":
        result["reason_incomplete"] = "v17_wall_clock_budget_exhausted"


def solve_case(*args: object, **kwargs: object) -> dict[str, object]:
    old_check = v16.check_assignment
    old_verify = v16.verify_frozen_provenance
    try:
        v16.check_assignment = check_assignment
        v16.verify_frozen_provenance = verify_frozen_provenance
        result = v16.solve_case(*args, **kwargs)
    finally:
        v16.check_assignment = old_check
        v16.verify_frozen_provenance = old_verify
    case = kwargs.get("case", args[0] if args else None)
    out_dir = kwargs.get("out_dir", args[2] if len(args) > 2 else None)
    if isinstance(case, Case) and isinstance(out_dir, Path):
        case_dir = out_dir / case.case_id
        _rename_v17_artifacts(case_dir, result)
        _rename_incomplete_reason(result)
        result["theory_classification"] = "post-assignment exact PB-to-If normalization, audited QF_LRA"
        result["solver_lane"] = "explained equality closure with raw replay; otherwise SolverFor(QF_LRA) with fresh normalized replay"
        v12.write_json(case_dir / "result.json", result)
    return result


def parser() -> argparse.ArgumentParser:
    parser = v16.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = HERE / "artifacts-v17"
    return parser


def run_one(args: argparse.Namespace, case: Case, command: str) -> int:
    started = time.monotonic()
    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    invocation = {
        **frozen, "argv": list(__import__("sys").argv), "case_count": 1,
        "workers": 1,
        "resolved_budgets": {
            "timeout_ms": args.timeout_ms,
            "bool_timeout_ms": args.bool_timeout_ms,
            "replay_timeout_ms": args.replay_timeout_ms,
            "max_assignments": args.max_assignments,
            "max_bool_power_cuts": args.max_bool_power_cuts,
            "max_bool_power_candidates": args.max_bool_power_candidates,
        },
    }
    v12.write_json(run_dir / "invocation.json", invocation)
    result = solve_case(
        case=case, timeout_ms=args.timeout_ms, out_dir=run_dir, seed=args.seed,
        max_power_cuts=args.max_power_cuts,
        max_power_candidates=args.max_power_candidates,
        bool_timeout_ms=args.bool_timeout_ms,
        max_bool_power_cuts=args.max_bool_power_cuts,
        max_bool_power_candidates=args.max_bool_power_candidates,
        max_assignments=args.max_assignments,
        replay_timeout_ms=args.replay_timeout_ms,
        expected_script_sha256=str(frozen["script_sha256"]),
        frozen_provenance=frozen,
    )
    result_path = run_dir / case.case_id / "result.json"
    result_file_sha256 = file_sha256(result_path)
    result_attested = {**result, "result_file_sha256": result_file_sha256}
    complete = result.get("complete") is True
    summary = {
        **invocation, "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": {str(result["status"]): 1}, "complete": complete,
        "results": [result_attested],
    }
    v12.write_json(run_dir / "summary.json", summary)
    print(json.dumps({
        "counts": summary["counts"], "complete": complete,
        "run_dir": str(run_dir),
    }, sort_keys=True))
    return 0 if complete else 2


def main() -> int:
    args = parser().parse_args()
    if args.command == "smoke":
        args.workers = 1
        return run_one(args, Case("paired", "SSS", 0, 1, None), "smoke")
    if args.command == "case":
        args.workers = 1
        case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
        return run_one(args, case, "case")
    raise SystemExit("v17 permits only one-case or smoke runs; no broad matrix")


if __name__ == "__main__":
    raise SystemExit(main())
