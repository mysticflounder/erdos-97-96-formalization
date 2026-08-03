#!/usr/bin/env python3
"""Scratch-only v19 arithmetic-core extraction with raw projection replay."""

from __future__ import annotations

import argparse
import json
import sys
import time
from collections.abc import Iterable, Sequence
from pathlib import Path

HERE = Path(__file__).resolve().parent
LANE = HERE.parent
sys.path.insert(0, str(LANE))

import z3  # noqa: E402
import round5_cegar_v12 as v12  # noqa: E402
import round5_cegar_v16 as v16  # noqa: E402
import round5_cegar_v17 as v17  # noqa: E402
import round5_cegar_v19 as v19  # noqa: E402


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def walk(expr: z3.ExprRef) -> Iterable[z3.ExprRef]:
    stack = [expr]
    seen: set[int] = set()
    while stack:
        node = stack.pop()
        node_id = node.get_id()
        if node_id in seen:
            continue
        seen.add(node_id)
        yield node
        if not z3.is_quantifier(node):
            stack.extend(node.children())


def reconstruct_raw(timeout_ms: int, seed: int) -> tuple[
    tuple[z3.BoolRef, ...], tuple[z3.BoolRef, ...], dict[str, object]
]:
    case = v19.Case("fresh", "DDD", 0, 2, 1)
    encoding = v16.Encoding(case, timeout_ms=timeout_ms, seed=seed)
    tracked_full, _ = encoding.make_solver()
    for family in sorted(encoding.groups):
        tracked_full.add(z3.Bool(f"track_{family}"))
    gate = v12.FullSolverGate(tracked_full)
    prepass, learned, _ = v12.run_boolean_prepass(
        encoding,
        gate,
        v12.PrepassConfig(30_000, 2_000_000, 256),
        seed,
        validated_miner_sha256=str(v19.provenance()["miner_v9_script_sha256"]),
    )
    if prepass.get("all_learned_cuts_theorem_sound_and_provenance_complete") is not True:
        raise RuntimeError("prepass admission audit failed")
    assertions = tuple(tracked_full.assertions())
    grouped = tuple(
        constraint
        for family in sorted(encoding.groups)
        for constraint in encoding.groups[family]
    )
    semantic = v16.collect_semantic_bools((*grouped, *assertions))
    return assertions, semantic, {
        "prepass_status": prepass.get("status"),
        "learned_cut_count": len(learned),
        "raw_assertion_count": len(assertions),
        "raw_formula_sha256": v17.raw_formula_sha256(assertions),
        "semantic_bool_count": len(semantic),
    }


def journal_assignments(journal: Path, limit: int) -> tuple[list[dict[str, object]], dict[str, object]]:
    recovered = v19.AssignmentJournal(journal).recover()
    proposed: dict[str, dict[str, object]] = {}
    completed: list[dict[str, object]] = []
    for record in recovered["records"]:
        payload = record["payload"]
        identity = payload["assignment_sha256"]
        if payload["phase"] == "proposed":
            proposed[identity] = payload
        elif len(completed) < limit:
            proposal = proposed[identity]
            completed.append({"proposal": proposal, "outcome": payload})
    if len(completed) < limit:
        raise RuntimeError(f"only {len(completed)} completed assignments")
    return completed, {
        "record_count": recovered["record_count"],
        "head_sha256": recovered["head_sha256"],
        "pending_count": len(recovered["pending"]),
        "completed_count": len(recovered["completed"]),
    }


def normalize_by_source(
    source: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    trackers: Sequence[z3.BoolRef],
) -> tuple[list[tuple[z3.BoolRef, ...]], dict[str, object]]:
    ctx = source[0].ctx
    substitutions = (
        tuple((fix.variable, z3.BoolVal(fix.value, ctx=ctx)) for fix in fixes)
        + tuple((tracker, z3.BoolVal(True, ctx=ctx)) for tracker in trackers)
    )
    groups: list[tuple[z3.BoolRef, ...]] = []
    pre_pb = 0
    for assertion in source:
        simplified = z3.simplify(z3.substitute(assertion, *substitutions))
        pre_pb += sum(
            node.decl().kind() in v17.PB_KINDS
            for node in walk(simplified)
            if not z3.is_quantifier(node)
        )
        rewritten = v17.rewrite_weighted_pbs(simplified)
        goal = z3.Goal(ctx=ctx)
        goal.add(rewritten)
        transformed = z3.Tactic("card2bv", ctx=ctx)(goal)
        if len(transformed) != 1:
            raise RuntimeError("per-source card2bv split the goal")
        groups.append(tuple(transformed[0]))
    flattened = tuple(item for group in groups for item in group)
    audit = v17.logic_audit(flattened)
    if audit["accepted"] is not True:
        raise RuntimeError(f"logic audit failed: {audit}")
    return groups, {
        "source_assertion_count": len(source),
        "normalized_assertion_count": len(flattened),
        "pre_normalization_pb_nodes": pre_pb,
        "logic_audit": audit,
    }


def check_groups(
    groups: Sequence[Sequence[z3.BoolRef]],
    source_ids: Sequence[int],
    timeout_ms: int,
    seed: int,
) -> tuple[str, float]:
    ctx = next((item.ctx for group in groups for item in group), z3.main_ctx())
    solver = z3.SolverFor("QF_LRA", ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    for source_id in source_ids:
        solver.add(*groups[source_id])
    started = time.monotonic()
    result = solver.check()
    return str(result), time.monotonic() - started


def tracked_core(
    groups: Sequence[Sequence[z3.BoolRef]], timeout_ms: int, seed: int
) -> tuple[str, list[int], float, str | None]:
    ctx = next(item.ctx for group in groups for item in group)
    solver = z3.SolverFor("QF_LRA", ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    labels: dict[str, int] = {}
    for source_id, group in enumerate(groups):
        for local_id, assertion in enumerate(group):
            label = z3.Bool(f"metric_core_s{source_id}_n{local_id}", ctx=ctx)
            labels[str(label)] = source_id
            solver.assert_and_track(assertion, label)
    started = time.monotonic()
    result = solver.check()
    elapsed = time.monotonic() - started
    if result != z3.unsat:
        reason = solver.reason_unknown() if result == z3.unknown else None
        return str(result), [], elapsed, reason
    return "unsat", sorted({labels[str(label)] for label in solver.unsat_core()}), elapsed, None


def shrink_source_core(
    groups: Sequence[Sequence[z3.BoolRef]], core: Sequence[int], timeout_ms: int, seed: int
) -> tuple[list[int], list[dict[str, object]]]:
    kept = list(core)
    checks: list[dict[str, object]] = []
    for candidate in list(kept):
        trial = [item for item in kept if item != candidate]
        status, elapsed = check_groups(groups, trial, timeout_ms, seed)
        checks.append({"removed": candidate, "status": status, "elapsed_seconds": elapsed})
        if status == "unsat":
            kept = trial
    return kept, checks


def deletion_core(
    groups: Sequence[Sequence[z3.BoolRef]], timeout_ms: int, seed: int
) -> tuple[list[int], list[dict[str, object]]]:
    """Find an inclusion-minimal UNSAT set of exact source groups."""
    kept = list(range(len(groups)))
    checks: list[dict[str, object]] = []
    status, elapsed = check_groups(groups, kept, timeout_ms, seed)
    checks.append({"kind": "all", "source_ids": kept, "status": status,
                   "elapsed_seconds": elapsed})
    if status != "unsat":
        raise RuntimeError(f"untracked per-source normalization is not UNSAT: {status}")
    granularity = 2
    while len(kept) >= 2:
        chunk_size = (len(kept) + granularity - 1) // granularity
        chunks = [kept[index:index + chunk_size] for index in range(0, len(kept), chunk_size)]
        reduced = False
        for chunk in chunks:
            status, elapsed = check_groups(groups, chunk, timeout_ms, seed)
            checks.append({"kind": "chunk", "source_ids": chunk, "status": status,
                           "elapsed_seconds": elapsed})
            if status == "unsat":
                kept = chunk
                granularity = 2
                reduced = True
                break
        if reduced:
            continue
        for chunk in chunks:
            chunk_set = set(chunk)
            complement = [item for item in kept if item not in chunk_set]
            if not complement:
                continue
            status, elapsed = check_groups(groups, complement, timeout_ms, seed)
            checks.append({"kind": "complement", "source_ids": complement,
                           "status": status, "elapsed_seconds": elapsed})
            if status == "unsat":
                kept = complement
                granularity = max(2, granularity - 1)
                reduced = True
                break
        if reduced:
            continue
        if granularity >= len(kept):
            break
        granularity = min(len(kept), granularity * 2)
    # Certify inclusion-minimality. UNKNOWN retains the source group.
    for candidate in list(kept):
        trial = [item for item in kept if item != candidate]
        status, elapsed = check_groups(groups, trial, timeout_ms, seed)
        checks.append({"kind": "single-delete", "removed": candidate,
                       "source_ids": trial, "status": status,
                       "elapsed_seconds": elapsed})
        if status == "unsat":
            kept = trial
    return kept, checks


def check_assertion_subset(
    assertions: Sequence[z3.BoolRef], indices: Sequence[int],
    timeout_ms: int, seed: int,
) -> tuple[str, float]:
    solver = z3.SolverFor("QF_LRA", ctx=assertions[0].ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*(assertions[index] for index in indices))
    started = time.monotonic()
    result = solver.check()
    return str(result), time.monotonic() - started


def normalized_deletion_core(
    assertions: Sequence[z3.BoolRef], timeout_ms: int, seed: int
) -> tuple[list[int], list[dict[str, object]]]:
    """Delta-debug to an inclusion-minimal direct QF_LRA assertion core."""
    kept = list(range(len(assertions)))
    checks: list[dict[str, object]] = []
    status, elapsed = check_assertion_subset(assertions, kept, timeout_ms, seed)
    checks.append({"kind": "all", "size": len(kept), "status": status,
                   "elapsed_seconds": elapsed})
    if status != "unsat":
        raise RuntimeError(f"normalized formula failed closed: {status}")
    granularity = 2
    while len(kept) >= 2:
        chunk_size = (len(kept) + granularity - 1) // granularity
        chunks = [kept[index:index + chunk_size] for index in range(0, len(kept), chunk_size)]
        reduced = False
        for chunk in chunks:
            status, elapsed = check_assertion_subset(assertions, chunk, timeout_ms, seed)
            checks.append({"kind": "chunk", "size": len(chunk), "status": status,
                           "elapsed_seconds": elapsed})
            if status == "unsat":
                kept = chunk
                granularity = 2
                reduced = True
                break
        if reduced:
            continue
        for chunk in chunks:
            chunk_set = set(chunk)
            complement = [item for item in kept if item not in chunk_set]
            status, elapsed = check_assertion_subset(
                assertions, complement, timeout_ms, seed
            )
            checks.append({"kind": "complement", "size": len(complement),
                           "status": status, "elapsed_seconds": elapsed})
            if status == "unsat":
                kept = complement
                granularity = max(2, granularity - 1)
                reduced = True
                break
        if reduced:
            continue
        if granularity >= len(kept):
            break
        granularity = min(len(kept), granularity * 2)
    for candidate in list(kept):
        trial = [item for item in kept if item != candidate]
        status, elapsed = check_assertion_subset(assertions, trial, timeout_ms, seed)
        checks.append({"kind": "single-delete", "size": len(trial),
                       "removed": candidate, "status": status,
                       "elapsed_seconds": elapsed})
        if status == "unsat":
            kept = trial
    return kept, checks


def source_candidates(
    standard: Sequence[z3.BoolRef], groups: Sequence[Sequence[z3.BoolRef]],
    indices: Sequence[int],
) -> dict[int, list[int]]:
    buckets: dict[int, list[tuple[int, z3.BoolRef]]] = {}
    for source_id, group in enumerate(groups):
        for assertion in group:
            buckets.setdefault(assertion.hash(), []).append((source_id, assertion))
    result: dict[int, list[int]] = {}
    for index in indices:
        assertion = standard[index]
        matches = sorted({
            source_id for source_id, candidate in buckets.get(assertion.hash(), [])
            if z3.eq(assertion, candidate)
        })
        if not matches:
            raise RuntimeError(f"normalized assertion {index} has no source match")
        result[index] = matches
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("journal", type=Path)
    parser.add_argument("--limit", type=int, default=12)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=97)
    args = parser.parse_args()

    completed, journal_meta = journal_assignments(args.journal, args.limit)
    raw, semantic, raw_meta = reconstruct_raw(3_600_000, args.seed)
    journal_hashes = {
        item["proposal"]["frozen_full_formula_sha256"] for item in completed
    }
    if journal_hashes != {raw_meta["raw_formula_sha256"]}:
        raise RuntimeError(f"raw formula authentication failed: {journal_hashes} vs {raw_meta}")

    semantic_by_name = {str(item): item for item in semantic}
    semantic_ids = {item.get_id(): str(item) for item in semantic}
    trackers = v17._tracker_refs(raw)
    tracker_ids = {item.get_id() for item in trackers}
    source = tuple(item for item in raw if item.get_id() not in tracker_ids)
    dependencies = [
        sorted({semantic_ids[node.get_id()] for node in walk(assertion) if node.get_id() in semantic_ids})
        for assertion in source
    ]

    results: list[dict[str, object]] = []
    for ordinal, item in enumerate(completed):
        proposal = item["proposal"]
        outcome = item["outcome"]
        values = {entry["bool"]: bool(entry["value"]) for entry in proposal["assignment"]}
        if set(values) != set(semantic_by_name):
            raise RuntimeError("journal assignment does not equal semantic-Bool universe")
        fixes = tuple(v19.Fix(semantic_by_name[name], values[name]) for name in sorted(values))
        groups, normalization = normalize_by_source(source, fixes, trackers)
        standard, _, standard_normalization = v19._fixed_normalized_formula(
            raw, fixes, str(raw_meta["raw_formula_sha256"])
        )
        if len(standard) != normalization["normalized_assertion_count"]:
            raise RuntimeError("source-preserving and standard normalization counts differ")
        print(json.dumps({"ordinal": ordinal, "normalization": normalization}, sort_keys=True), flush=True)
        normalized_core, shrink_checks = normalized_deletion_core(
            standard, args.timeout_ms, args.seed
        )
        candidates = source_candidates(standard, groups, normalized_core)
        minimized = sorted({source_id for ids in candidates.values() for source_id in ids})
        dependency_names = sorted({name for index in minimized for name in dependencies[index]})
        projected = tuple(v19.Fix(semantic_by_name[name], values[name]) for name in dependency_names)
        replay = v16.replay_projected_core(
            raw, projected, args.timeout_ms, args.seed, nonce=f"metric_{ordinal}"
        )
        raw_authenticated = False
        if replay["status"] == "unsat":
            v16.authenticate_unsat_core(replay)
            raw_authenticated = True
        record = {
            "ordinal": ordinal,
            "iteration": proposal["iteration"],
            "assignment_sha256": proposal["assignment_sha256"],
            "journal_outcome": outcome["status"],
            "normalization": normalization,
            "standard_normalization": standard_normalization,
            "core_method": "direct-QF_LRA-deletion-over-standard-normalized-assertions",
            "normalized_assertion_core": normalized_core,
            "normalized_assertion_source_candidates": {
                str(index): ids for index, ids in candidates.items()
            },
            "minimized_source_core": minimized,
            "shrink_checks": shrink_checks,
            "projected_fix_count": len(projected),
            "projected_fixes": [fix.record() for fix in projected],
            "raw_replay": replay,
            "raw_replay_authenticated": raw_authenticated,
        }
        write_json(HERE / f"entry-{ordinal:02d}.json", record)
        results.append(record)
        print(json.dumps({
            "ordinal": ordinal,
            "source_core": minimized,
            "projected_fix_count": len(projected),
            "raw_outcome": replay["status"],
        }, sort_keys=True), flush=True)

    summary = {
        "scheme": "v19-metric-core-analysis/v1",
        "journal": str(args.journal),
        "journal_authentication": journal_meta,
        "raw_reconstruction": raw_meta,
        "limit": args.limit,
        "results": [{
            key: record[key]
            for key in (
                "ordinal", "iteration", "assignment_sha256", "minimized_source_core",
                "projected_fix_count", "raw_replay_authenticated"
            )
        } for record in results],
    }
    write_json(HERE / "summary.json", summary)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
