#!/usr/bin/env python3
"""Round-2 bounded geometry census over coverage-classified survivors.

Twelve centered quantiles are selected from each case's deterministic survivor
stream.  Each receives one three-second cvc5 QF_NRA query with no retry.  The
first cvc5 UNSAT core is greedily reduced with bounded Z3 calls and checked
once more by Z3.  Every solver result is discovery evidence, not a Lean proof.
"""

from __future__ import annotations

import argparse
import json
import time
from collections import Counter
from dataclasses import dataclass
from itertools import product
from pathlib import Path
from typing import Any, Callable, Iterable, Mapping

from census.atail_force import producer_coverage_census as coverage
from census.atail_force import producer_geometry as geometry
from census.atail_force import producer_pattern_census as round1
from census.atail_force import producer_surface as surface


SCHEMA = "p97_atail_force_producer_pattern_census_round2.v1"
HERE = Path(__file__).resolve().parent
DEFAULT_CHECKPOINT = HERE / "producer_pattern_census_round2_checkpoint.json"
SURVIVORS_PER_CASE = 12
CVC5_TIMEOUT_SECONDS = 3.0
Z3_REDUCTION_TIMEOUT_MS = 500
Z3_CROSSCHECK_TIMEOUT_MS = 3_000
TOTAL_QUERY_BUDGET = SURVIVORS_PER_CASE * len(surface.PRODUCER_CASES)


class Round2CensusError(ValueError):
    """The survivor census or its checkpoint violates its fixed contract."""


@dataclass(frozen=True)
class SelectedSurvivor:
    assignment_id: str
    survivor_ordinal: int
    survivor_count: int
    case: surface.ProducerCase
    assignment: surface.ApexClassAssignment
    order: tuple[int, ...]
    system: geometry.GeometrySystem
    input_sha256: str


Runner = Callable[[geometry.GeometrySystem, Iterable[str] | None], Mapping[str, Any]]


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise Round2CensusError(message)


def _iter_survivor_pairs(case: surface.ProducerCase):
    """Yield target-negating pairs surviving the complete coverage classifier."""

    second_classes = tuple(surface.iter_exact_apex_classes(case, "opp_apex2"))
    off = set(surface.off_surplus_labels(case))
    for first, second in product(
        surface.iter_exact_apex_classes(case, "opp_apex1"), second_classes
    ):
        if len(off & set(first.support) & set(second.support)) > 1:
            continue
        result = coverage.classify_pair(case, first, second)
        if result.classification == "survivor":
            yield first, second


def _centered_quantile_ordinals(total: int, count: int) -> tuple[int, ...]:
    _require(total >= count > 0, "insufficient survivors for quantile sample")
    ordinals = tuple(((2 * index + 1) * total) // (2 * count) for index in range(count))
    _require(len(set(ordinals)) == count, "quantile ordinals collide")
    return ordinals


def select_survivors(
    case: surface.ProducerCase, *, count: int = SURVIVORS_PER_CASE
) -> tuple[SelectedSurvivor, ...]:
    """Select centered quantiles from the deterministic survivor stream."""

    _require(0 < count <= SURVIVORS_PER_CASE, "selection exceeds fixed budget")
    total = sum(1 for _ in _iter_survivor_pairs(case))
    wanted = _centered_quantile_ordinals(total, count)
    wanted_set = set(wanted)
    selected: list[SelectedSurvivor] = []
    for ordinal, (first, second) in enumerate(_iter_survivor_pairs(case)):
        if ordinal not in wanted_set:
            continue
        assignment = round1._canonical_assignment(first, second)
        blueprint = geometry.blueprint_from_surface(case, assignment)
        system = geometry.build_geometry_system(blueprint)
        smt2 = geometry.build_cvc5_smt2(system)
        selected.append(
            SelectedSurvivor(
                assignment_id=f"{case.case_id}_round2_s{ordinal:06d}",
                survivor_ordinal=ordinal,
                survivor_count=total,
                case=case,
                assignment=assignment,
                order=tuple(int(label) for label in blueprint.cyclic_order),
                system=system,
                input_sha256=round1._digest_text(smt2),
            )
        )
    _require(tuple(item.survivor_ordinal for item in selected) == wanted, "selection drift")
    return tuple(selected)


def _default_cvc5_runner(
    system: geometry.GeometrySystem, enabled: Iterable[str] | None
) -> Mapping[str, Any]:
    return geometry.run_cvc5_bounded(
        system, enabled, timeout_seconds=CVC5_TIMEOUT_SECONDS
    )


def _default_z3_runner(
    system: geometry.GeometrySystem,
    enabled: Iterable[str] | None,
    timeout_ms: int,
) -> Mapping[str, Any]:
    return geometry.run_z3_bounded(system, enabled, timeout_ms=timeout_ms)


def normalized_cvc5_status(raw: Mapping[str, Any]) -> str:
    """Treat cvc5's internal-tlimit abort as fail-closed TIMEOUT."""

    status = str(raw.get("status", "ERROR"))
    stderr = str(raw.get("stderr", ""))
    if status == "ERROR" and "cvc5 interrupted by timeout" in stderr:
        return "TIMEOUT"
    return status


Z3Runner = Callable[
    [geometry.GeometrySystem, Iterable[str] | None, int], Mapping[str, Any]
]


def reduce_cvc5_core_with_z3(
    system: geometry.GeometrySystem,
    core: Iterable[str],
    *,
    runner: Z3Runner = _default_z3_runner,
) -> dict[str, Any]:
    """Greedily shrink one cvc5 core with fixed-budget Z3 deletion checks."""

    current = list(core)
    calls = 0
    unknown_deletions = 0
    for atom in tuple(current):
        candidate = tuple(name for name in current if name != atom)
        result = dict(runner(system, candidate, Z3_REDUCTION_TIMEOUT_MS))
        calls += 1
        if result.get("status") == "UNSAT":
            current.remove(atom)
        elif result.get("status") == "UNKNOWN":
            unknown_deletions += 1
    crosscheck = dict(runner(system, tuple(current), Z3_CROSSCHECK_TIMEOUT_MS))
    calls += 1
    return {
        "method": "cvc5-seeded greedy deletion by bounded Z3",
        "seed_size": len(tuple(core)),
        "reduced_size": len(current),
        "reduced_core": current,
        "reduction_timeout_ms_per_call": Z3_REDUCTION_TIMEOUT_MS,
        "crosscheck_timeout_ms": Z3_CROSSCHECK_TIMEOUT_MS,
        "oracle_calls": calls,
        "unknown_deletions_retained": unknown_deletions,
        "crosscheck_status": crosscheck.get("status", "ERROR"),
        "crosscheck_core": list(crosscheck.get("unsat_core", ())),
        "evidence_scope": "bounded Z3 crosscheck; not a Lean proof or certified MUS",
    }


def _item_record(item: SelectedSurvivor) -> dict[str, Any]:
    first = item.assignment.opp_apex1_exact
    second = item.assignment.opp_apex2_exact
    classified = coverage.classify_pair(item.case, first, second)
    _require(classified.classification == "survivor", "selected pair is not a survivor")
    return {
        "assignment_id": item.assignment_id,
        "case_id": item.case.case_id,
        "survivor_ordinal": item.survivor_ordinal,
        "survivor_count": item.survivor_count,
        "coverage_classification": classified.classification,
        "coverage_patterns": list(classified.patterns),
        "assignment": item.assignment.as_dict(),
        "cyclic_order": list(item.order),
        "geometry": {
            "variables": len(item.system.variables),
            "named_atoms": len(item.system.atoms),
            "input_sha256": item.input_sha256,
        },
    }


def run_census(
    *,
    cvc5_runner: Runner = _default_cvc5_runner,
    z3_runner: Z3Runner = _default_z3_runner,
) -> dict[str, Any]:
    items = tuple(
        item for case in surface.PRODUCER_CASES for item in select_survivors(case)
    )
    _require(len(items) == TOTAL_QUERY_BUDGET, "query budget drift")
    results: list[dict[str, Any]] = []
    first_core_crosschecked = False
    started = time.monotonic()
    for item in items:
        call_started = time.monotonic()
        raw = dict(cvc5_runner(item.system, None))
        raw_status = str(raw.get("status", "ERROR"))
        status = normalized_cvc5_status(raw)
        record: dict[str, Any] = {
            **_item_record(item),
            "status": status,
            "elapsed_seconds": round(time.monotonic() - call_started, 6),
            "solver_returncode": raw.get("returncode"),
            "solver_stderr_tail": str(raw.get("stderr", ""))[-1000:],
            "evidence_scope": "bounded cvc5 discovery evidence only; not a Lean proof",
        }
        if status != raw_status:
            record["raw_solver_status"] = raw_status
            record["status_normalization"] = "cvc5 internal timeout is fail-closed TIMEOUT"
        if status == "UNSAT":
            try:
                core = round1.parse_named_unsat_core(
                    str(raw.get("stdout", "")), item.system.atom_names()
                )
            except round1.PatternCensusError as exc:
                record["status"] = "UNSAT_CORE_PARSE_ERROR"
                record["parse_error"] = str(exc)
            else:
                record["named_unsat_core"] = list(core)
                record["normalized_core_shape"] = list(
                    round1.normalize_core_shape(core, item)
                )
                if not first_core_crosschecked:
                    record["z3_reduction_crosscheck"] = reduce_cvc5_core_with_z3(
                        item.system, core, runner=z3_runner
                    )
                    first_core_crosschecked = True
        results.append(record)

    shapes: dict[tuple[str, ...], list[str]] = {}
    for record in results:
        shape = tuple(record.get("normalized_core_shape", ()))
        if shape:
            shapes.setdefault(shape, []).append(record["assignment_id"])
    recurring = [
        {
            "normalized_core_shape": list(shape),
            "count": len(assignments),
            "assignments": assignments,
        }
        for shape, assignments in sorted(shapes.items())
        if len(assignments) >= 2
    ]
    status_counts = dict(sorted(Counter(row["status"] for row in results).items()))
    survivors = [
        {"assignment_id": row["assignment_id"], "case_id": row["case_id"], "status": row["status"]}
        for row in results
        if row["status"] != "UNSAT"
    ]
    body = {
        "schema": SCHEMA,
        "epistemic_status": "BOUNDED_SOLVER_DISCOVERY_EVIDENCE_NOT_LEAN_PROOF",
        "policy": {
            "survivors_per_case": SURVIVORS_PER_CASE,
            "query_count": TOTAL_QUERY_BUDGET,
            "selection": "centered quantiles of deterministic coverage-classified survivor stream",
            "cvc5_timeout_seconds_per_query": CVC5_TIMEOUT_SECONDS,
            "cvc5_retries": 0,
            "automatic_extension": False,
            "z3_crosscheck_count": 1,
            "timeout_normalization": "cvc5 internal-tlimit abort is fail-closed TIMEOUT",
        },
        "results": results,
        "summary": {
            "status_counts": status_counts,
            "recurring_cores": recurring,
            "solver_survivors": survivors,
            "elapsed_seconds": round(time.monotonic() - started, 6),
        },
    }
    return {**body, "checkpoint_sha256": round1._json_digest(body)}


def validate_checkpoint(document: Mapping[str, Any]) -> None:
    _require(document.get("schema") == SCHEMA, "checkpoint schema drift")
    body = {key: value for key, value in document.items() if key != "checkpoint_sha256"}
    _require(document.get("checkpoint_sha256") == round1._json_digest(body), "digest drift")
    results = document.get("results")
    _require(isinstance(results, list) and len(results) == TOTAL_QUERY_BUDGET, "result count drift")
    expected = {
        item.assignment_id: item
        for case in surface.PRODUCER_CASES
        for item in select_survivors(case)
    }
    _require(set(expected) == {row.get("assignment_id") for row in results}, "selection ids drift")
    crosschecks = 0
    for row in results:
        item = expected[row["assignment_id"]]
        _require(row.get("coverage_classification") == "survivor", "coverage drift")
        _require(row.get("survivor_ordinal") == item.survivor_ordinal, "ordinal drift")
        _require(row.get("geometry", {}).get("input_sha256") == item.input_sha256, "input drift")
        if row.get("status") == "UNSAT":
            names = tuple(row.get("named_unsat_core", ()))
            _require(bool(names), "UNSAT row lacks a core")
            _require(
                tuple(row.get("normalized_core_shape", ()))
                == round1.normalize_core_shape(names, item),
                "normalized shape drift",
            )
        if "z3_reduction_crosscheck" in row:
            crosschecks += 1
            reduced = row["z3_reduction_crosscheck"]
            _require(set(reduced.get("reduced_core", ())) <= set(row.get("named_unsat_core", ())), "reduced core escaped seed")
    _require(crosschecks <= 1, "multiple Z3 crosschecks stored")


def repair_timeout_statuses(document: Mapping[str, Any]) -> dict[str, Any]:
    """Reclassify already-recorded cvc5 tlimit aborts without rerunning them."""

    repaired = json.loads(json.dumps(document))
    changed = 0
    for row in repaired.get("results", ()):
        if row.get("status") not in {"ERROR", "UNKNOWN"}:
            continue
        if row.get("status") == "UNKNOWN" and row.get("raw_solver_status") != "ERROR":
            continue
        if "cvc5 interrupted by timeout" not in str(row.get("solver_stderr_tail", "")):
            raise Round2CensusError("refusing to rewrite a non-timeout ERROR")
        row["raw_solver_status"] = "ERROR"
        row["status"] = "TIMEOUT"
        row["status_normalization"] = "cvc5 internal timeout is fail-closed TIMEOUT"
        changed += 1
    _require(changed > 0, "checkpoint has no timeout statuses to repair")
    repaired["policy"]["timeout_normalization"] = "cvc5 internal-tlimit abort is fail-closed TIMEOUT"
    results = repaired["results"]
    repaired["summary"]["status_counts"] = dict(
        sorted(Counter(row["status"] for row in results).items())
    )
    repaired["summary"]["solver_survivors"] = [
        {"assignment_id": row["assignment_id"], "case_id": row["case_id"], "status": row["status"]}
        for row in results
        if row["status"] != "UNSAT"
    ]
    body = {key: value for key, value in repaired.items() if key != "checkpoint_sha256"}
    repaired["checkpoint_sha256"] = round1._json_digest(body)
    return repaired


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--run", action="store_true")
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--repair-timeouts", action="store_true")
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    args = parser.parse_args()
    if args.run:
        document = run_census()
        round1._write_atomic(args.checkpoint, round1._canonical(document))
        print(round1._canonical(document["summary"]), end="")
        return
    try:
        document = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise Round2CensusError(f"cannot load checkpoint: {exc}") from exc
    if args.repair_timeouts:
        document = repair_timeout_statuses(document)
        validate_checkpoint(document)
        round1._write_atomic(args.checkpoint, round1._canonical(document))
    else:
        validate_checkpoint(document)
    print(round1._canonical(document["summary"]), end="")


if __name__ == "__main__":
    main()
