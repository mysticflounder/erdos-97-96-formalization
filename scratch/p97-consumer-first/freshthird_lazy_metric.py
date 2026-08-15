#!/usr/bin/env python3
"""Lazy exact-rational metric checking for a frozen FreshThird model.

``tracked_metric(..., solve_core=False)`` is the sole packet producer.  This
module asserts every non-Kalmanson record unconditionally and initially omits
only the finite Kalmanson family.  After each exact QF_LRA SAT model, it
evaluates *every* still-omitted Kalmanson expression in that rational model and
activates false expressions in stable bounded batches.

The invariant is that the active packet is always a subset of the complete
named conjunction and no base assertion is ever removed.  Thus active-packet
UNSAT implies full-packet UNSAT.  A SAT result is reported as complete only
when the same exact model satisfies every omitted expression; it therefore
satisfies the full conjunction.  Every nonterminal SAT iteration activates at
least one previously omitted member of a finite family, so, absent a solver
UNKNOWN or the requested deadline, the loop terminates after at most one more
SAT check than there are Kalmanson records.  Batching changes only activation
order: no cut is declared satisfied without exact evaluation, and no omitted
cut is discarded from subsequent scans.
"""

from __future__ import annotations

import argparse
import sys
from fractions import Fraction
from pathlib import Path
from time import monotonic
from typing import Any

from z3 import Bool, SolverFor, sat, unsat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from freshthird_full_fidelity_cegar import (  # noqa: E402
    ORDER_ARMS,
    STRUCTURAL_TIMEOUT_MS,
    add_full_fidelity_constraints,
    build_pure_arm,
)
from freshthird_metric_core import tracked_metric  # noqa: E402


Record = tuple[str, str, str, Any]


def _exact_kalmanson_violations(
    exact_model, packet: dict[str, Any], omitted: list[Record]
) -> list[Record]:
    """Evaluate the complete omitted Kalmanson family in exact rationals.

    Z3 model evaluation of each full inequality is unexpectedly expensive.
    The packet exposes the same finite inequalities as role quadruples, so we
    evaluate each distance variable once and perform the additions and strict
    comparisons with ``Fraction``.  This is an exact evaluator, not a numeric
    filter or sampled cut generator.
    """
    role_index = packet["metric_role_index"]
    distances = packet["metric_distances"]
    specs = packet["kalmanson_specs"]

    values = {}
    for pair, variable in distances.items():
        value = exact_model.eval(variable, model_completion=True)
        values[pair] = Fraction(
            value.numerator_as_long(), value.denominator_as_long()
        )

    def d(first: str, second: str) -> Fraction:
        i, j = role_index[first], role_index[second]
        if i == j:
            return Fraction(0)
        return values[(i, j) if i < j else (j, i)]

    violated = []
    for record in omitted:
        label = record[0]
        a, b, c, e, arm = specs[label]
        rhs = d(a, c) + d(b, e)
        lhs = d(b, c) + d(a, e) if arm == "first" else d(a, b) + d(c, e)
        if not lhs < rhs:
            violated.append(record)
    return violated


def _raw_active_core(
    records: list[Record], timeout_ms: int
) -> tuple[str, str, list[str], float]:
    """Best-effort raw core for an already-UNSAT active packet."""
    started = monotonic()
    solver = SolverFor("QF_LRA")
    solver.set(timeout=max(1, timeout_ms))
    literal_to_label = {}
    for label, _family, _detail, expr in records:
        literal = Bool(f"lazy_metric_track_{label}")
        literal_to_label[str(literal)] = label
        solver.assert_and_track(expr, literal)

    result = solver.check()
    reason = solver.reason_unknown() if result != sat and result != unsat else ""
    raw_core = (
        [literal_to_label[str(literal)] for literal in solver.unsat_core()]
        if result == unsat
        else []
    )
    return str(result), reason, raw_core, monotonic() - started


def lazy_metric_check(
    model,
    context,
    *,
    timeout_ms: int | None = 120_000,
    extract_unsat_core: bool = True,
    core_timeout_ms: int = 10_000,
    progress: bool = False,
    max_cuts_per_iteration: int | None = None,
) -> dict[str, Any]:
    """Check the complete frozen metric packet by finite lazy separation.

    ``model`` and ``context`` are the structural-model values accepted by
    :func:`freshthird_metric_core.tracked_metric`.  ``timeout_ms=None`` removes
    the main-loop deadline.  Core extraction is a separate, bounded diagnostic
    and never changes or replaces the main verdict.
    """
    if timeout_ms is not None and timeout_ms < 0:
        raise ValueError("timeout_ms must be nonnegative or None")
    if core_timeout_ms < 0:
        raise ValueError("core_timeout_ms must be nonnegative")
    if max_cuts_per_iteration is not None and max_cuts_per_iteration <= 0:
        raise ValueError("max_cuts_per_iteration must be positive or None")

    started = monotonic()
    deadline = None if timeout_ms is None else started + timeout_ms / 1000
    packet = tracked_metric(model, context, solve_core=False)
    records: list[Record] = packet["records"]
    base_records = [record for record in records if record[1] != "kalmanson"]
    kalmanson_records = [record for record in records if record[1] == "kalmanson"]

    solver = SolverFor("QF_LRA")
    solver.add(*[expr for _label, _family, _detail, expr in base_records])

    active_records: list[Record] = []
    active_labels: set[str] = set()
    violated_per_iteration: list[int] = []
    activated_per_iteration: list[int] = []
    iterations = 0
    result_name = "unknown"
    status = "deadline" if timeout_ms == 0 else "unknown"
    reason_unknown = ""

    while timeout_ms != 0:
        if deadline is not None:
            remaining_ms = int((deadline - monotonic()) * 1000)
            if remaining_ms <= 0:
                # A preceding SAT check covered only the then-active subset;
                # it is not a full-packet SAT verdict after new cuts were added.
                result_name = "unknown"
                status = "deadline"
                reason_unknown = "main-loop deadline expired before solver check"
                break
            solver.set(timeout=max(1, remaining_ms))

        iterations += 1
        if progress:
            print(
                f"stage=lazy_check iteration={iterations} "
                f"active_kalmanson={len(active_records)}",
                flush=True,
            )
        result = solver.check()
        result_name = str(result)
        if progress:
            print(
                f"stage=lazy_check_result iteration={iterations} result={result_name}",
                flush=True,
            )
        if result == unsat:
            status = "unsat"
            break
        if result != sat:
            reason_unknown = solver.reason_unknown()
            status = "deadline" if "timeout" in reason_unknown.lower() else "unknown"
            break

        exact_model = solver.model()
        omitted = [
            record for record in kalmanson_records if record[0] not in active_labels
        ]
        if progress:
            print(
                f"stage=lazy_exact_scan iteration={iterations} omitted={len(omitted)}",
                flush=True,
            )
        violated = _exact_kalmanson_violations(exact_model, packet, omitted)
        if progress:
            print(
                f"stage=lazy_exact_scan_result iteration={iterations} "
                f"violated={len(violated)}",
                flush=True,
            )

        violated_per_iteration.append(len(violated))
        if not violated:
            status = "sat_full_conjunction"
            break

        # Activate a stable prefix to avoid rebuilding one near-monolithic
        # 10k-cut solve.  The unactivated suffix remains omitted and is
        # re-evaluated in every later exact model, so this is scheduling only.
        activated = (
            violated
            if max_cuts_per_iteration is None
            else violated[:max_cuts_per_iteration]
        )
        activated_per_iteration.append(len(activated))
        solver.add(*[expr for _label, _family, _detail, expr in activated])
        active_records.extend(activated)
        active_labels.update(label for label, _family, _detail, _expr in activated)

    main_runtime = monotonic() - started
    ordered_active_labels = [label for label, _family, _detail, _expr in active_records]

    core_result = "not_run"
    core_reason_unknown = ""
    raw_core: list[str] = []
    core_runtime = 0.0
    if status == "unsat" and extract_unsat_core and core_timeout_ms > 0:
        active_packet = [*base_records, *active_records]
        core_result, core_reason_unknown, raw_core, core_runtime = _raw_active_core(
            active_packet, core_timeout_ms
        )

    return {
        "result": result_name,
        "status": status,
        "reason_unknown": reason_unknown,
        "iterations": iterations,
        "base_assertion_count": len(base_records),
        "active_kalmanson_cuts": len(active_records),
        "total_kalmanson_cuts": len(kalmanson_records),
        "violated_per_iteration": violated_per_iteration,
        "activated_per_iteration": activated_per_iteration,
        "runtime_seconds": main_runtime,
        "total_runtime_seconds": main_runtime + core_runtime,
        "representatives": packet["representatives"],
        "records": records,
        "active_labels": ordered_active_labels,
        "core_result": core_result,
        "core_reason_unknown": core_reason_unknown,
        "raw_core": raw_core,
        "core_runtime_seconds": core_runtime,
    }


def render_compact(report: dict[str, Any], *, label_limit: int = 24) -> str:
    """Render a bounded CLI summary; the returned report retains full data."""

    def sample(labels: list[str]) -> str:
        shown = labels[:label_limit]
        suffix = f",...(+{len(labels) - label_limit})" if len(labels) > label_limit else ""
        return ",".join(shown) + suffix

    return "\n".join(
        [
            "campaign=freshthird_lazy_exact_metric_v1",
            f"result={report['result']} status={report['status']} "
            f"iterations={report['iterations']}",
            f"runtime_seconds={report['runtime_seconds']:.3f} "
            f"total_runtime_seconds={report['total_runtime_seconds']:.3f}",
            f"base_assertions={report['base_assertion_count']} "
            f"active_kalmanson={report['active_kalmanson_cuts']}/"
            f"{report['total_kalmanson_cuts']}",
            "violated_per_iteration="
            + ",".join(map(str, report["violated_per_iteration"])),
            "activated_per_iteration="
            + ",".join(map(str, report["activated_per_iteration"])),
            "representatives=" + ",".join(report["representatives"]),
            "active_labels=" + sample(report["active_labels"]),
            f"core_result={report['core_result']} raw_core_size={len(report['raw_core'])} "
            f"core_runtime_seconds={report['core_runtime_seconds']:.3f}",
            "raw_core=" + sample(report["raw_core"]),
        ]
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--core-timeout-ms", type=int, default=10_000)
    parser.add_argument("--no-core", action="store_true")
    parser.add_argument("--max-cuts-per-iteration", type=int)
    parser.add_argument(
        "--source-faithful-slots",
        action="store_true",
        help="also force equal-centre anonymous slots into the named row",
    )
    args = parser.parse_args(argv)

    structural, _stats, context = build_pure_arm(
        ORDER_ARMS["outside_fresh_between_source_canonical"],
        max(STRUCTURAL_TIMEOUT_MS, 5_000),
    )
    add_full_fidelity_constraints(
        structural,
        context,
        fresh_cap=1,
        row_cap=1,
        enforce_equal_shell_slots_in_row=args.source_faithful_slots,
    )
    structural_result = structural.check()
    if structural_result != sat:
        raise SystemExit(f"default frozen structural model was {structural_result}, not sat")

    report = lazy_metric_check(
        structural.model(),
        context,
        timeout_ms=args.timeout_ms,
        extract_unsat_core=not args.no_core,
        core_timeout_ms=args.core_timeout_ms,
        max_cuts_per_iteration=args.max_cuts_per_iteration,
    )
    print(render_compact(report))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
