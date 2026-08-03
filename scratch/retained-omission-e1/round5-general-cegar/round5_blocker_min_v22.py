"""Bounded v22 blocker-minimization pilot over the saved v19 terminal.

This is external Z3 evidence only.  A projected blocker is admitted only when
the exact v19 raw blob is hash-authenticated and independently reparsed for
both the primary check and a fresh replay.  SAT, UNKNOWN, preprocessing
failure, or replay disagreement fails closed.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import time
from collections.abc import Sequence
from pathlib import Path

import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v20 as v20
import z3

HERE = Path(__file__).resolve().parent
SCHEMA_VERSION = 22
DEFAULT_OUTPUT = HERE / "v22-blocker-minimization-pilot.json"


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def fix_records(fixes: Sequence[v16.Fix]) -> list[dict[str, object]]:
    return [fix.record() for fix in fixes]


def _saved_raw_and_assignment(
    assignment_ordinal: int,
) -> tuple[dict[str, object], Path, tuple[dict[str, object], ...]]:
    terminal = v20.authenticate_v19_terminal()
    blockers = terminal["blockers"]
    if not isinstance(blockers, list) or not 0 <= assignment_ordinal < len(blockers):
        raise ValueError("assignment ordinal is outside the authenticated v19 journal")
    result_path = Path(str(terminal["result_path"]))
    result = json.loads(result_path.read_text())
    blob = result["frozen_blob_hashes"]["full_frozen"]
    raw_path = result_path.parent / str(blob["file"])
    if v20.file_sha256(raw_path) != blob["sha256"]:
        raise RuntimeError("saved v19 raw blob SHA-256 mismatch")
    assignment = tuple(blockers[assignment_ordinal])
    if len(assignment) != 825:
        raise RuntimeError("saved v19 assignment is not complete")
    return terminal, raw_path, assignment


def _parse_authenticated_raw(
    raw_path: Path, expected_hash: str
) -> tuple[z3.BoolRef, ...]:
    with gzip.open(raw_path, "rt", encoding="utf-8") as handle:
        assertions = tuple(z3.parse_smt2_string(handle.read()))
    if v17.raw_formula_sha256(assertions) != expected_hash:
        raise RuntimeError("freshly parsed raw-formula identity mismatch")
    return assertions


def _fixes(records: Sequence[dict[str, object]]) -> tuple[v16.Fix, ...]:
    return tuple(
        v16.Fix(z3.Bool(str(item["bool"])), bool(item["value"]))
        for item in records
    )


def preprocess_partial_assignment(
    assertions: Sequence[z3.BoolRef], fixes: Sequence[v16.Fix]
) -> tuple[tuple[z3.BoolRef, ...], dict[str, object]]:
    """Soundly eliminate fixed Bools, then lower as many PB nodes as possible."""
    trackers = v17._tracker_refs(assertions)
    tracker_names = {str(item) for item in trackers}
    if tracker_names != v17.TRACKER_ALLOWLIST:
        raise RuntimeError("raw formula tracker allowlist mismatch")
    tracker_ids = {item.get_id() for item in trackers}
    substitutions = (
        tuple((fix.variable, z3.BoolVal(fix.value)) for fix in fixes)
        + tuple((tracker, z3.BoolVal(True)) for tracker in trackers)
    )
    simplified = tuple(
        z3.simplify(z3.substitute(assertion, *substitutions))
        for assertion in assertions
        if assertion.get_id() not in tracker_ids
    )
    goal = z3.Goal()
    goal.add(*simplified)
    transformed = z3.Then("pb-preprocess", "card2bv")(goal)
    if len(transformed) != 1:
        raise RuntimeError("partial-assignment preprocessing split the goal")
    normalized = tuple(transformed[0])
    audit = v17.logic_audit(normalized)
    return normalized, {
        "source_assertion_count": len(assertions) - len(trackers),
        "tracker_count": len(trackers),
        "normalized_assertion_count": len(normalized),
        "logic_audit": audit,
        "pipeline": ["substitute fixes and trackers=true", "simplify", "pb-preprocess", "card2bv"],
    }


def replay_projection(
    raw_path: Path,
    raw_hash: str,
    records: Sequence[dict[str, object]],
    *,
    timeout_ms: int,
    seed: int,
    replay_label: str,
) -> dict[str, object]:
    started = time.monotonic()
    try:
        assertions = _parse_authenticated_raw(raw_path, raw_hash)
        normalized, preprocessing = preprocess_partial_assignment(assertions, _fixes(records))
        solver = z3.Solver()
        solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
        solver.add(*normalized)
        check_started = time.monotonic()
        outcome = solver.check()
        return {
            "replay_label": replay_label,
            "status": str(outcome),
            "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
            "retained_fix_count": len(records),
            "retained_fixes_sha256": canonical_sha256(list(records)),
            "raw_formula_sha256": raw_hash,
            "preprocessing": preprocessing,
            "solve_seconds": time.monotonic() - check_started,
            "elapsed_seconds": time.monotonic() - started,
        }
    except (
        MemoryError,
        OSError,
        RecursionError,
        RuntimeError,
        ValueError,
        z3.Z3Exception,
    ) as exc:  # fail closed and preserve the exact bottleneck
        return {
            "replay_label": replay_label,
            "status": "preprocess_error",
            "error": f"{type(exc).__name__}: {exc}",
            "retained_fix_count": len(records),
            "retained_fixes_sha256": canonical_sha256(list(records)),
            "raw_formula_sha256": raw_hash,
            "elapsed_seconds": time.monotonic() - started,
        }


def selector_core_probe(
    raw_path: Path,
    raw_hash: str,
    records: Sequence[dict[str, object]],
    *,
    timeout_ms: int,
    seed: int,
) -> dict[str, object]:
    """V16 selector route with Z3 core minimization; discovery only."""
    assertions = _parse_authenticated_raw(raw_path, raw_hash)
    solver = z3.Solver()
    solver.set(
        timeout=max(1, timeout_ms), random_seed=seed, threads=1,
        unsat_core=True, **{"smt.core.minimize": True},
    )
    solver.add(*assertions)
    selected = v16._add_selector_fixes(solver, _fixes(records), "v22_selector")
    started = time.monotonic()
    outcome = solver.check(*(selector for selector, _ in selected))
    core = tuple(solver.unsat_core()) if outcome == z3.unsat else ()
    return {
        "status": str(outcome),
        "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "elapsed_seconds": time.monotonic() - started,
        "timeout_ms": timeout_ms,
        "core_minimization": ["smt.core.minimize"],
        "raw_core_size": len(core),
        "authenticated_projection": False,
    }


def run_pilot(
    *, assignment_ordinal: int, retained_suffix: int, timeout_ms: int,
    selector_timeout_ms: int, seed: int,
) -> dict[str, object]:
    terminal, raw_path, assignment = _saved_raw_and_assignment(assignment_ordinal)
    if not 0 < retained_suffix <= len(assignment):
        raise ValueError("retained suffix must be between 1 and 825")
    candidate = assignment[-retained_suffix:]
    primary = replay_projection(
        raw_path, str(terminal["raw_full_formula_sha256"]), candidate,
        timeout_ms=timeout_ms, seed=seed, replay_label="primary_fresh_raw_parse",
    )
    fresh = replay_projection(
        raw_path, str(terminal["raw_full_formula_sha256"]), candidate,
        timeout_ms=timeout_ms, seed=seed, replay_label="independent_fresh_raw_replay",
    )
    admitted = primary["status"] == fresh["status"] == "unsat"
    selector = selector_core_probe(
        raw_path, str(terminal["raw_full_formula_sha256"]), assignment,
        timeout_ms=selector_timeout_ms, seed=seed,
    )
    return {
        "schema_version": SCHEMA_VERSION,
        "kind": "v22-blocker-minimization-pilot",
        "production_launched": False,
        "assignment_ordinal": assignment_ordinal,
        "complete_fix_count": len(assignment),
        "candidate_selection": f"deterministic saved-order suffix of {retained_suffix} fixes",
        "candidate_fixes": list(candidate),
        "candidate_fixes_sha256": canonical_sha256(list(candidate)),
        "raw_full_formula_sha256": terminal["raw_full_formula_sha256"],
        "selector_route": selector,
        "delta_route": {
            "status": "admitted_unsat_projection" if admitted else "fail_closed",
            "admitted": admitted,
            "retained_fix_count": retained_suffix if admitted else len(assignment),
            "removed_fix_count": len(assignment) - retained_suffix if admitted else 0,
            "primary": primary,
            "fresh": fresh,
        },
        "trust_boundary": "external Z3 exact-n15 replay; no Lean theorem or kernel ingress",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--assignment-ordinal", type=int, default=0)
    parser.add_argument("--retained-suffix", type=int, default=55)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--selector-timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    output = run_pilot(
        assignment_ordinal=args.assignment_ordinal,
        retained_suffix=args.retained_suffix,
        timeout_ms=args.timeout_ms,
        selector_timeout_ms=args.selector_timeout_ms,
        seed=args.seed,
    )
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "output": str(args.output),
        "selector_status": output["selector_route"]["status"],
        "delta_status": output["delta_route"]["status"],
        "retained_fix_count": output["delta_route"]["retained_fix_count"],
    }, sort_keys=True))
    return 0 if output["delta_route"]["admitted"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
