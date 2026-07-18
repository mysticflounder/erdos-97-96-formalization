#!/usr/bin/env python3
"""Exact Kalmanson/LRA audit of the 14-label equal-blocker finite boundary.

The script enumerates every cap-compatible cyclic order modulo rotation and
reflection, quotients by every automorphism of the complete labelled finite
surface, and checks the resulting exact rational linear systems with Z3.

SAT means only feasibility of the displayed abstract distance inequalities.
It is never reported as Euclidean realizability.  UNSAT is accompanied by an
independent exact Farkas replay of the common four-label obstruction.
"""

from __future__ import annotations

import argparse
import itertools
import json
import multiprocessing as mp
import os
import subprocess
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any, Iterable

import z3


LABEL_COUNT = 14

FIRST_APEX = 0
SECOND_APEX = 1
REMAINING_MOSER_VERTEX = 2
DELETED = 3
UNUSED_SOURCE = 4
CONTINUATION_FIRST = 3
CONTINUATION_SECOND = 11
PARTNER = 12
COMMON_BLOCKER = 6

SURPLUS_INTERIOR = (6, 7, 13)
FIRST_OPPOSITE_INTERIOR = (5, 8, 9, 10)
PHYSICAL_SECOND_INTERIOR = (3, 4, 11, 12)

SURPLUS_CAP = frozenset((0, 1, *SURPLUS_INTERIOR))
FIRST_OPPOSITE_CAP = frozenset((1, 2, *FIRST_OPPOSITE_INTERIOR))
PHYSICAL_SECOND_CAP = frozenset((0, 2, *PHYSICAL_SECOND_INTERIOR))

FIRST_APEX_RADIUS_CLASS = frozenset((3, 4, 5, 6, 8))
PHYSICAL_RADIUS_CLASS = frozenset((3, 5, 6, 11, 12))

BLOCKER = (2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 6, 3)

GLOBAL_ROWS = (
    frozenset((4, 5, 6, 8)),
    frozenset((5, 6, 11, 12)),
    frozenset((0, 3, 6, 8)),
    frozenset((1, 13, 4, 6)),
    frozenset((2, 3, 5, 7)),
    frozenset((3, 4, 8, 11)),
    frozenset((4, 8, 9, 12)),
    frozenset((5, 3, 8, 11)),
    frozenset((6, 4, 9, 10)),
    frozenset((7, 4, 10, 13)),
    frozenset((8, 4, 11, 13)),
    frozenset((9, 3, 8, 12)),
    frozenset((10, 3, 8, 13)),
    frozenset((11, 3, 8, 10)),
)

DISTANCE_KEYS = tuple(itertools.combinations(range(LABEL_COUNT), 2))
TRIPLES = tuple(itertools.combinations(range(LABEL_COUNT), 3))
POSITION_QUADRUPLES = tuple(itertools.combinations(range(LABEL_COUNT), 4))


def distance_key(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("diagonal distances are represented by the constant zero")
    return (left, right) if left < right else (right, left)


def apply_permutation(values: Iterable[int], permutation: tuple[int, ...]) -> frozenset[int]:
    return frozenset(permutation[value] for value in values)


def surface_automorphisms() -> tuple[tuple[int, ...], ...]:
    """Automorphisms preserving every named role, cap, row, blocker, and radius class."""

    fixed = {
        FIRST_APEX,
        SECOND_APEX,
        REMAINING_MOSER_VERTEX,
        DELETED,
        UNUSED_SOURCE,
        CONTINUATION_FIRST,
        CONTINUATION_SECOND,
        PARTNER,
        COMMON_BLOCKER,
    }
    automorphisms: list[tuple[int, ...]] = []
    for surplus in itertools.permutations(SURPLUS_INTERIOR):
        for first in itertools.permutations(FIRST_OPPOSITE_INTERIOR):
            for physical in itertools.permutations(PHYSICAL_SECOND_INTERIOR):
                image = list(range(LABEL_COUNT))
                for source, target in zip(SURPLUS_INTERIOR, surplus, strict=True):
                    image[source] = target
                for source, target in zip(FIRST_OPPOSITE_INTERIOR, first, strict=True):
                    image[source] = target
                for source, target in zip(PHYSICAL_SECOND_INTERIOR, physical, strict=True):
                    image[source] = target
                permutation = tuple(image)
                if any(permutation[value] != value for value in fixed):
                    continue
                if apply_permutation(SURPLUS_CAP, permutation) != SURPLUS_CAP:
                    continue
                if apply_permutation(FIRST_OPPOSITE_CAP, permutation) != FIRST_OPPOSITE_CAP:
                    continue
                if apply_permutation(PHYSICAL_SECOND_CAP, permutation) != PHYSICAL_SECOND_CAP:
                    continue
                if (
                    apply_permutation(FIRST_APEX_RADIUS_CLASS, permutation)
                    != FIRST_APEX_RADIUS_CLASS
                ):
                    continue
                if apply_permutation(PHYSICAL_RADIUS_CLASS, permutation) != PHYSICAL_RADIUS_CLASS:
                    continue
                if any(permutation[BLOCKER[source]] != BLOCKER[permutation[source]]
                       for source in range(LABEL_COUNT)):
                    continue
                if any(apply_permutation(GLOBAL_ROWS[center], permutation)
                       != GLOBAL_ROWS[permutation[center]]
                       for center in range(LABEL_COUNT)):
                    continue
                automorphisms.append(permutation)
    if not automorphisms:
        raise AssertionError("the identity must be a surface automorphism")
    return tuple(sorted(automorphisms))


def raw_cap_orders() -> Iterable[tuple[int, ...]]:
    """One representative per rotation/reflection class of compatible cycles.

    Rotation is fixed by putting the first apex first.  Of the two boundary
    orientations, retain the one whose cap arcs occur as

        0, surplus interior, 1, first-opposite interior, 2, physical interior.

    Reversal gives the omitted orientation and has the same distance system.
    """

    for surplus in itertools.permutations(SURPLUS_INTERIOR):
        for first in itertools.permutations(FIRST_OPPOSITE_INTERIOR):
            for physical in itertools.permutations(PHYSICAL_SECOND_INTERIOR):
                yield (0, *surplus, 1, *first, 2, *physical)


def canonical_orders(
    automorphisms: tuple[tuple[int, ...], ...],
) -> tuple[tuple[int, ...], ...]:
    representatives: set[tuple[int, ...]] = set()
    for order in raw_cap_orders():
        orbit = [tuple(permutation[label] for label in order)
                 for permutation in automorphisms]
        representatives.add(min(orbit))
    return tuple(sorted(representatives))


def z3_distance(
    distances: dict[tuple[int, int], z3.ArithRef],
    left: int,
    right: int,
) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return distances[distance_key(left, right)]


def add_equal_radius_class(
    solver: z3.Solver,
    distances: dict[tuple[int, int], z3.ArithRef],
    center: int,
    support: Iterable[int],
) -> None:
    points = sorted(support)
    anchor = points[0]
    for point in points[1:]:
        solver.add(z3_distance(distances, center, point)
                   == z3_distance(distances, center, anchor))


def build_base_solver(timeout_ms: int) -> tuple[z3.Solver, dict[tuple[int, int], z3.ArithRef]]:
    solver = z3.SolverFor("QF_LRA")
    solver.set("timeout", timeout_ms)
    distances = {
        key: z3.Real(f"d_{key[0]}_{key[1]}")
        for key in DISTANCE_KEYS
    }

    # Distinct Euclidean vertices have positive distances.  The complete
    # strict homogeneous system may be scaled so every positive distance and
    # every strict Kalmanson slack is at least one.
    for distance in distances.values():
        solver.add(distance >= 1)

    # All three triangle inequalities for each unordered triple.
    for first, second, third in TRIPLES:
        d12 = z3_distance(distances, first, second)
        d13 = z3_distance(distances, first, third)
        d23 = z3_distance(distances, second, third)
        solver.add(d12 + d13 >= d23)
        solver.add(d12 + d23 >= d13)
        solver.add(d13 + d23 >= d12)

    # The exact equalities supplied by every represented selected row.
    for center, row in enumerate(GLOBAL_ROWS):
        add_equal_radius_class(solver, distances, center, row)

    # The two retained exact-five physical-apex radius classes.  These include
    # the deleted endpoint omitted from each displayed four-point apex row.
    add_equal_radius_class(solver, distances, FIRST_APEX, FIRST_APEX_RADIUS_CLASS)
    add_equal_radius_class(solver, distances, SECOND_APEX, PHYSICAL_RADIUS_CLASS)
    return solver, distances


def add_kalmanson_constraints(
    solver: z3.Solver,
    distances: dict[tuple[int, int], z3.ArithRef],
    order: tuple[int, ...],
) -> None:
    for ia, ib, ic, id_ in POSITION_QUADRUPLES:
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        diagonal_sum = z3_distance(distances, a, c) + z3_distance(distances, b, d)
        solver.add(
            diagonal_sum
            >= z3_distance(distances, b, c) + z3_distance(distances, a, d) + 1
        )
        solver.add(
            diagonal_sum
            >= z3_distance(distances, a, b) + z3_distance(distances, c, d) + 1
        )


def rational_from_z3(value: z3.ArithRef) -> Fraction:
    value = z3.simplify(value)
    if not z3.is_rational_value(value):
        raise TypeError(f"non-rational QF_LRA model value: {value}")
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def extract_ledger(
    model: z3.ModelRef,
    distances: dict[tuple[int, int], z3.ArithRef],
) -> dict[str, str]:
    ledger: dict[str, str] = {}
    for key in DISTANCE_KEYS:
        value = rational_from_z3(model.eval(distances[key], model_completion=True))
        ledger[f"{key[0]}-{key[1]}"] = str(value)
    return ledger


def fraction_distance(ledger: dict[str, str], left: int, right: int) -> Fraction:
    if left == right:
        return Fraction(0)
    first, second = distance_key(left, right)
    return Fraction(ledger[f"{first}-{second}"])


def verify_sat_ledger(order: tuple[int, ...], ledger: dict[str, str]) -> dict[str, str]:
    values = [Fraction(value) for value in ledger.values()]
    if min(values) < 1:
        raise AssertionError("distance normalization failed")

    for first, second, third in TRIPLES:
        d12 = fraction_distance(ledger, first, second)
        d13 = fraction_distance(ledger, first, third)
        d23 = fraction_distance(ledger, second, third)
        if d12 + d13 < d23 or d12 + d23 < d13 or d13 + d23 < d12:
            raise AssertionError("triangle inequality failed in exact replay")

    equality_classes = [(center, row) for center, row in enumerate(GLOBAL_ROWS)]
    equality_classes.extend([
        (FIRST_APEX, FIRST_APEX_RADIUS_CLASS),
        (SECOND_APEX, PHYSICAL_RADIUS_CLASS),
    ])
    for center, support in equality_classes:
        radii = {fraction_distance(ledger, center, point) for point in support}
        if len(radii) != 1:
            raise AssertionError("selected-row equality failed in exact replay")

    minimum_slack: Fraction | None = None
    for ia, ib, ic, id_ in POSITION_QUADRUPLES:
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        diagonal = fraction_distance(ledger, a, c) + fraction_distance(ledger, b, d)
        side_one = fraction_distance(ledger, b, c) + fraction_distance(ledger, a, d)
        side_two = fraction_distance(ledger, a, b) + fraction_distance(ledger, c, d)
        for slack in (diagonal - side_one, diagonal - side_two):
            if slack < 1:
                raise AssertionError("Kalmanson normalization failed in exact replay")
            minimum_slack = slack if minimum_slack is None else min(minimum_slack, slack)
    return {"minimum_distance": str(min(values)), "minimum_kalmanson_slack": str(minimum_slack)}


def check_chunk(arguments: tuple[int, list[tuple[int, tuple[int, ...]]], int]) -> dict[str, Any]:
    chunk_id, indexed_orders, timeout_ms = arguments
    solver, distances = build_base_solver(timeout_ms)
    results: list[dict[str, Any]] = []
    started = time.monotonic()
    for order_id, order in indexed_orders:
        solver.push()
        add_kalmanson_constraints(solver, distances, order)
        check_started = time.monotonic()
        verdict = solver.check()
        elapsed = time.monotonic() - check_started
        result: dict[str, Any] = {
            "order_id": order_id,
            "order": list(order),
            "verdict": str(verdict),
            "elapsed_seconds": round(elapsed, 6),
        }
        if verdict == z3.sat:
            ledger = extract_ledger(solver.model(), distances)
            result["ledger"] = ledger
            result["exact_replay"] = verify_sat_ledger(order, ledger)
        elif verdict == z3.unknown:
            result["reason_unknown"] = solver.reason_unknown()
        results.append(result)
        solver.pop()
    return {
        "chunk_id": chunk_id,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "results": results,
    }


def farkas_certificate() -> dict[str, Any]:
    """Replay the common exact certificate as sparse rational linear forms."""

    d06 = distance_key(0, 6)
    d08 = distance_key(0, 8)
    d26 = distance_key(2, 6)
    d28 = distance_key(2, 8)

    constraints = [
        {
            "name": "complementary_kalmanson_0_6_8_2",
            "coefficients": {d08: Fraction(1), d26: Fraction(1),
                             d06: Fraction(-1), d28: Fraction(-1)},
            "rhs": Fraction(1),
        },
        {
            "name": "row_0_equality_forward",
            "coefficients": {d06: Fraction(1), d08: Fraction(-1)},
            "rhs": Fraction(0),
        },
        {
            "name": "row_2_equality_forward",
            "coefficients": {d28: Fraction(1), d26: Fraction(-1)},
            "rhs": Fraction(0),
        },
    ]
    total: dict[tuple[int, int], Fraction] = {}
    rhs = Fraction(0)
    for constraint in constraints:
        rhs += constraint["rhs"]
        for key, coefficient in constraint["coefficients"].items():
            total[key] = total.get(key, Fraction(0)) + coefficient
    total = {key: coefficient for key, coefficient in total.items() if coefficient}
    if total or rhs != 1:
        raise AssertionError(f"invalid Farkas replay: total={total}, rhs={rhs}")

    return {
        "multipliers": {constraint["name"]: "1" for constraint in constraints},
        "constraints": [
            {
                "name": constraint["name"],
                "coefficients": {
                    f"d_{key[0]}_{key[1]}": str(value)
                    for key, value in constraint["coefficients"].items()
                },
                "rhs": str(constraint["rhs"]),
            }
            for constraint in constraints
        ],
        "sum": "0 >= 1",
        "valid": True,
    }


def smoke_tests(timeout_ms: int) -> dict[str, Any]:
    # Known-SAT strict Kalmanson metric on four abstract points.
    sat_solver = z3.SolverFor("QF_LRA")
    sat_solver.set("timeout", timeout_ms)
    d01, d02, d03, d12, d13, d23 = z3.Reals("s_d01 s_d02 s_d03 s_d12 s_d13 s_d23")
    for distance in (d01, d02, d03, d12, d13, d23):
        sat_solver.add(distance >= 1)
    sat_solver.add(d02 + d13 >= d12 + d03 + 1)
    sat_solver.add(d02 + d13 >= d01 + d23 + 1)
    sat_verdict = sat_solver.check()
    if sat_verdict != z3.sat:
        raise AssertionError(f"known-SAT smoke test returned {sat_verdict}")

    # Known-UNSAT shared-middle-pair core, independently replayed below.
    unsat_solver = z3.SolverFor("QF_LRA")
    unsat_solver.set("timeout", timeout_ms)
    unsat_solver.add(d02 + d13 >= d01 + d23 + 1)
    unsat_solver.add(d01 == d02)
    unsat_solver.add(d13 == d23)
    unsat_verdict = unsat_solver.check()
    if unsat_verdict != z3.unsat:
        raise AssertionError(f"known-UNSAT smoke test returned {unsat_verdict}")
    certificate = farkas_certificate()
    return {
        "known_sat_strict_quadruple": str(sat_verdict),
        "known_unsat_shared_middle_pair": str(unsat_verdict),
        "farkas_replay": certificate["sum"],
    }


def representative_cvc5_cross_check(order: tuple[int, ...], timeout_ms: int) -> str:
    solver, distances = build_base_solver(timeout_ms)
    add_kalmanson_constraints(solver, distances, order)
    smt2 = solver.sexpr() + "\n(check-sat)\n"
    process = subprocess.run(
        ["cvc5", "--lang", "smt2", "--tlimit", str(timeout_ms)],
        input=smt2,
        capture_output=True,
        text=True,
        timeout=timeout_ms / 1000 + 30,
        check=False,
    )
    verdicts = [line.strip() for line in process.stdout.splitlines()
                if line.strip() in {"sat", "unsat", "unknown"}]
    if not verdicts:
        raise RuntimeError(
            f"cvc5 produced no verdict (exit {process.returncode}): {process.stderr}"
        )
    return verdicts[-1]


def write_json(path: Path, payload: Any) -> None:
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--jobs", type=int, default=min(24, os.cpu_count() or 1))
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--output-dir", type=Path, default=Path(__file__).resolve().parent)
    args = parser.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)

    run_started = time.monotonic()
    smoke = smoke_tests(args.timeout_ms)
    automorphisms = surface_automorphisms()
    orders = canonical_orders(automorphisms)
    raw_count = (
        len(tuple(itertools.permutations(SURPLUS_INTERIOR)))
        * len(tuple(itertools.permutations(FIRST_OPPOSITE_INTERIOR)))
        * len(tuple(itertools.permutations(PHYSICAL_SECOND_INTERIOR)))
    )
    if raw_count != 3456:
        raise AssertionError(f"unexpected cap-order count: {raw_count}")

    # The same exact certificate applies to every compatible order.
    if not all(order.index(0) < order.index(6) < order.index(8) < order.index(2)
               for order in orders):
        raise AssertionError("the common four-label order schema did not cover every order")
    if not ({6, 8} <= GLOBAL_ROWS[0] and {6, 8} <= GLOBAL_ROWS[2]):
        raise AssertionError("the common two-row incidence schema is absent")
    certificate = farkas_certificate()
    write_json(args.output_dir / "farkas_certificate.json", certificate)

    indexed_orders = list(enumerate(orders))
    chunk_count = min(max(args.jobs, 1), len(indexed_orders))
    chunks: list[list[tuple[int, tuple[int, ...]]]] = [[] for _ in range(chunk_count)]
    for index, item in enumerate(indexed_orders):
        chunks[index % chunk_count].append(item)

    log_path = args.output_dir / "run.jsonl"
    sat_ledgers: list[dict[str, Any]] = []
    totals = {"sat": 0, "unsat": 0, "unknown": 0}
    with log_path.open("w", encoding="utf-8") as log:
        header = {
            "type": "header",
            "raw_directed_orders": 2 * raw_count,
            "rotation_reflection_quotient_orders": raw_count,
            "surface_automorphism_count": len(automorphisms),
            "canonical_order_count": len(orders),
            "jobs": chunk_count,
            "timeout_ms_per_order": args.timeout_ms,
            "distance_variables": len(DISTANCE_KEYS),
            "positive_distance_constraints": len(DISTANCE_KEYS),
            "triangle_constraints": 3 * len(TRIPLES),
            "selected_row_equalities": 3 * len(GLOBAL_ROWS) + 8,
            "kalmanson_constraints_per_order": 2 * len(POSITION_QUADRUPLES),
            "smoke_tests": smoke,
        }
        log.write(json.dumps(header, sort_keys=True) + "\n")
        log.flush()
        print(json.dumps(header, indent=2, sort_keys=True), flush=True)

        context = mp.get_context("spawn")
        worker_arguments = [
            (chunk_id, chunk, args.timeout_ms)
            for chunk_id, chunk in enumerate(chunks)
        ]
        with context.Pool(processes=chunk_count) as pool:
            for completed, chunk_result in enumerate(
                pool.imap_unordered(check_chunk, worker_arguments), start=1
            ):
                for result in chunk_result["results"]:
                    verdict = result["verdict"]
                    totals[verdict] += 1
                    if verdict == "sat":
                        sat_ledgers.append(result)
                    log.write(json.dumps({"type": "order", **result}, sort_keys=True) + "\n")
                progress = {
                    "type": "progress",
                    "completed_chunks": completed,
                    "total_chunks": chunk_count,
                    "checked_orders": sum(totals.values()),
                    "totals": totals.copy(),
                    "chunk_id": chunk_result["chunk_id"],
                    "chunk_elapsed_seconds": chunk_result["elapsed_seconds"],
                }
                log.write(json.dumps(progress, sort_keys=True) + "\n")
                log.flush()
                print(json.dumps(progress, sort_keys=True), flush=True)

        cvc5_verdict = representative_cvc5_cross_check(orders[0], args.timeout_ms)
        summary = {
            "type": "summary",
            "canonical_order_count": len(orders),
            "totals": totals,
            "all_orders_farkas_schema_covered": True,
            "farkas_sum": certificate["sum"],
            "representative_cvc5_verdict": cvc5_verdict,
            "elapsed_seconds": round(time.monotonic() - run_started, 6),
        }
        log.write(json.dumps(summary, sort_keys=True) + "\n")
        log.flush()

    write_json(args.output_dir / "summary.json", summary)
    write_json(args.output_dir / "automorphisms.json", [list(p) for p in automorphisms])
    if sat_ledgers:
        write_json(args.output_dir / "sat_ledgers.json", sat_ledgers)
    print(json.dumps(summary, indent=2, sort_keys=True), flush=True)

    if totals["unknown"]:
        return 2
    if totals["sat"]:
        return 1
    if totals["unsat"] != len(orders) or cvc5_verdict != "unsat":
        return 3
    return 0


if __name__ == "__main__":
    sys.exit(main())
