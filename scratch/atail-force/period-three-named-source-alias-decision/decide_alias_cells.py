#!/usr/bin/env python3
"""Exact QF_LRA decision for the period-three named-source alias cells.

This is a scratch diagnostic, not a source theorem.  It starts from the
source-faithful fully-disjoint 25-role cell used by
``period-three-full-role-identity-quotient/probe_fully_disjoint.py`` and adds
only the newly justified semantic aliases:

* ``continuation.first`` is one of ``c0,c1,c2``;
* ``continuation.second`` is a different one of ``c0,c1,c2``.

The continuation names do not otherwise occur in the linear formula.  In
particular, this script does *not* identify them with the independent retained
first-apex frontier points ``q,w``.

The structural cells cover:

* equal and unequal first-apex row radii;
* frontier cap roles II, IO, and OI;
* both orientations of the complete named boundary word; and
* all six ordered distinct aliases into the three cycle sources.

Every cell negates the desired first-apex return occurrence by requiring each
fixed reverse outside pair to have unequal first-apex distances.  A SAT result
is therefore an exact rational witness only for this projected QF_LRA model.
It is not a planar Euclidean, MEC, total-CSS, minimality, or full-parent model.
"""

from __future__ import annotations

from fractions import Fraction
from hashlib import sha256
from itertools import combinations, permutations
import json
from multiprocessing import get_context
from pathlib import Path
import time

import z3


HERE = Path(__file__).resolve().parent
RESULT_PATH = HERE / "RESULT.json"
PROGRESS_PATH = HERE / "PROGRESS.jsonl"

FIRST = "first"
SECOND = "second"
SURPLUS = "surplus"

T0 = ("q", "w", "t0i", "t0s")
T1 = ("t1i0", "t1i1", "t1i2", "t1o")
CYCLE = ("c0", "c1", "c2")
PHYSICAL_FIVE = (*CYCLE, "nS", "nI")
BLOCKERS = ("b0", "b1", "b2")
TARGET_PAIRS = (("x0", "y0"), ("x1", "y1"), ("x2", "y2"))

ALL_PRIVATE = {
    *T0,
    *T1,
    *PHYSICAL_FIVE,
    *BLOCKERS,
    *(point for pair in TARGET_PAIRS for point in pair),
}


def edge(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def role_map(frontier_role: str) -> dict[str, str]:
    assert frontier_role in {"II", "IO", "OI"}
    roles = {
        "q": frontier_role[0],
        "w": frontier_role[1],
        "t0i": "I",
        "t0s": "S",
        "t1i0": "I",
        "t1i1": "I",
        "t1i2": "I",
        "t1o": "O",
        "c0": "O",
        "c1": "O",
        "c2": "O",
        "nS": "S",
        "nI": "I",
        "b0": "O",
        "b1": "O",
        "b2": "O",
        "x0": "I",
        "y0": "I",
        "x1": "I",
        "y1": "I",
        "x2": "I",
        "y2": "I",
    }
    assert set(roles) == ALL_PRIVATE
    return roles


def canonical_blocks(frontier_role: str) -> tuple[tuple[str, ...], ...]:
    roles = role_map(frontier_role)
    surplus_private = tuple(point for point in ("t0s", "nS") if roles[point] == "S")

    # Keep the pre-existing source-faithful first-cap order, merely inserting
    # any frontier point whose role is I.  The target pairs remain fresh and
    # fully disjoint.
    first_candidates = (
        "q", "w", "t0i", "t1i0", "t1i1", "t1i2", "nI",
        "x0", "y0", "x1", "y1", "x2", "y2",
    )
    first_private = tuple(point for point in first_candidates if roles[point] == "I")

    # b0 lies between c0,c1; b1 between c1,c2; b2 between c0,c2.  Extra
    # physical-cap roles are placed after the six-role straddle word.
    physical_candidates = (
        "c0", "b0", "b2", "c1", "b1", "c2", "t1o", "q", "w",
    )
    physical_private = tuple(point for point in physical_candidates if roles[point] == "O")

    assert set(surplus_private) | set(first_private) | set(physical_private) == ALL_PRIVATE
    assert len(set(surplus_private) | set(first_private) | set(physical_private)) == 22
    return surplus_private, first_private, physical_private


def boundary(frontier_role: str, orientation: str) -> tuple[str, ...]:
    surplus_private, first_private, physical_private = canonical_blocks(frontier_role)
    if orientation == "forward":
        result = (
            FIRST,
            *surplus_private,
            SECOND,
            *first_private,
            SURPLUS,
            *physical_private,
        )
    elif orientation == "reflected":
        result = (
            FIRST,
            *reversed(physical_private),
            SURPLUS,
            *reversed(first_private),
            SECOND,
            *reversed(surplus_private),
        )
    else:
        raise ValueError(orientation)
    assert len(result) == len(set(result)) == 25
    return result


def between(word: tuple[str, ...], a: str, middle: str, b: str) -> bool:
    positions = {point: index for index, point in enumerate(word)}
    lo, hi = sorted((positions[a], positions[b]))
    return lo < positions[middle] < hi


def build_solver(
    radius_arm: str,
    frontier_role: str,
    orientation: str,
) -> tuple[
    z3.Solver,
    dict[tuple[str, str], z3.ArithRef],
    dict[str, z3.ArithRef],
    list[tuple[str, z3.ArithRef, z3.ArithRef]],
    tuple[str, ...],
]:
    word = boundary(frontier_role, orientation)
    points = word
    roles = role_map(frontier_role)

    # Source-side smoke assertions for this representative.
    assert [roles[point] for point in T0].count("I") >= 2
    assert [roles[point] for point in T0].count("S") <= 1
    assert [roles[point] for point in T0].count("O") <= 1
    assert [roles[point] for point in T1].count("I") >= 2
    assert [roles[point] for point in T1].count("S") <= 1
    assert [roles[point] for point in T1].count("O") <= 1
    physical_word = tuple(point for point in word if roles.get(point) == "O")
    assert between(physical_word, "c0", "b0", "c1")
    assert between(physical_word, "c1", "b1", "c2")
    assert between(physical_word, "c2", "b2", "c0")

    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=30_000)
    distance = {
        edge(a, b): z3.Real("d__" + "__".join(edge(a, b)))
        for a, b in combinations(points, 2)
    }
    dv = lambda a, b: distance[edge(a, b)]
    differences: list[tuple[str, z3.ArithRef, z3.ArithRef]] = []

    def record_difference(name: str, u: z3.ArithRef, v: z3.ArithRef) -> None:
        differences.append((name, u, v))

    # Strict metric and the complete strict Kalmanson system for this word.
    solver.add(*(value >= 1 for value in distance.values()))
    for a, b, c in combinations(points, 3):
        solver.add(dv(a, b) + dv(b, c) >= dv(a, c) + 1)
        solver.add(dv(a, b) + dv(a, c) >= dv(b, c) + 1)
        solver.add(dv(a, c) + dv(b, c) >= dv(a, b) + 1)
    for ia, ib, ic, id_ in combinations(range(len(word)), 4):
        a, b, c, d = (word[index] for index in (ia, ib, ic, id_))
        diagonal = dv(a, c) + dv(b, d)
        solver.add(diagonal >= dv(a, b) + dv(c, d) + 1)
        solver.add(diagonal >= dv(a, d) + dv(b, c) + 1)

    r0, r1, physical_radius = z3.Reals("r0 r1 physical_radius")
    reverse_radii = z3.Reals("rr0 rr1 rr2")
    radii = {
        "r0": r0,
        "r1": r1,
        "physical": physical_radius,
        "rr0": reverse_radii[0],
        "rr1": reverse_radii[1],
        "rr2": reverse_radii[2],
    }
    solver.add(*(radius >= 1 for radius in radii.values()))

    solver.add(*(dv(FIRST, point) == r0 for point in T0))
    solver.add(*(dv(FIRST, point) == r1 for point in T1))
    if radius_arm == "equal":
        solver.add(r0 == r1)
    elif radius_arm == "unequal":
        record_difference("radius", r0, r1)
    else:
        raise ValueError(radius_arm)

    solver.add(*(dv(SECOND, point) == physical_radius for point in PHYSICAL_FIVE))
    for point in points:
        if point not in {*PHYSICAL_FIVE, SECOND}:
            record_difference(
                f"physical_exclusion__{point}",
                dv(SECOND, point),
                physical_radius,
            )
    record_difference("second_qw", dv(SECOND, "q"), dv(SECOND, "w"))

    for row in range(3):
        support = (CYCLE[row], CYCLE[(row + 1) % 3], *TARGET_PAIRS[row])
        center = BLOCKERS[row]
        radius = reverse_radii[row]
        solver.add(*(dv(center, point) == radius for point in support))
        for point in points:
            if point not in {*support, center}:
                record_difference(
                    f"reverse{row}_exclusion__{point}",
                    dv(center, point),
                    radius,
                )

        # Negation of the aggregate producer's desired first-apex co-radial
        # reverse outside pair.
        x, y = TARGET_PAIRS[row]
        record_difference(f"target{row}_gap", dv(FIRST, x), dv(FIRST, y))

    # Put load-bearing target negations first, then the frontier radius/QW
    # gaps, then exact-support exclusions.  The incremental extension below
    # preserves satisfiability after every accepted sign.
    priority = {
        "target0_gap": 0,
        "target1_gap": 1,
        "target2_gap": 2,
        "radius": 3,
        "second_qw": 4,
    }
    differences.sort(key=lambda item: (priority.get(item[0], 5), item[0]))
    return solver, distance, radii, differences, word


def verify_model(
    radius_arm: str,
    frontier_role: str,
    orientation: str,
    distance_values: dict[tuple[str, str], Fraction],
    radius_values: dict[str, Fraction],
) -> dict[str, str]:
    word = boundary(frontier_role, orientation)
    value = lambda a, b: distance_values[edge(a, b)]

    assert min(distance_values.values()) >= 1
    triangle_margins: list[Fraction] = []
    for a, b, c in combinations(word, 3):
        triangle_margins.extend((
            value(a, b) + value(b, c) - value(a, c),
            value(a, b) + value(a, c) - value(b, c),
            value(a, c) + value(b, c) - value(a, b),
        ))
    assert min(triangle_margins) >= 1

    kalmanson_margins: list[Fraction] = []
    for ia, ib, ic, id_ in combinations(range(len(word)), 4):
        a, b, c, d = (word[index] for index in (ia, ib, ic, id_))
        diagonal = value(a, c) + value(b, d)
        kalmanson_margins.extend((
            diagonal - value(a, b) - value(c, d),
            diagonal - value(a, d) - value(b, c),
        ))
    assert min(kalmanson_margins) >= 1

    assert len({value(FIRST, point) for point in T0}) == 1
    assert len({value(FIRST, point) for point in T1}) == 1
    if radius_arm == "equal":
        assert radius_values["r0"] == radius_values["r1"]
    else:
        assert abs(radius_values["r0"] - radius_values["r1"]) >= 1

    assert len({value(SECOND, point) for point in PHYSICAL_FIVE}) == 1
    assert all(
        abs(value(SECOND, point) - radius_values["physical"]) >= 1
        for point in word
        if point not in {*PHYSICAL_FIVE, SECOND}
    )
    assert abs(value(SECOND, "q") - value(SECOND, "w")) >= 1

    for row in range(3):
        support = (CYCLE[row], CYCLE[(row + 1) % 3], *TARGET_PAIRS[row])
        center = BLOCKERS[row]
        radius = radius_values[f"rr{row}"]
        assert all(value(center, point) == radius for point in support)
        assert all(
            abs(value(center, point) - radius) >= 1
            for point in word
            if point not in {*support, center}
        )
        x, y = TARGET_PAIRS[row]
        assert abs(value(FIRST, x) - value(FIRST, y)) >= 1

    return {
        "minimum_triangle_margin": str(min(triangle_margins)),
        "minimum_kalmanson_margin": str(min(kalmanson_margins)),
        "minimum_reverse_return_gap": str(min(
            abs(value(FIRST, x) - value(FIRST, y))
            for x, y in TARGET_PAIRS
        )),
    }


def append_progress(record: dict[str, object]) -> None:
    with PROGRESS_PATH.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(record, sort_keys=True) + "\n")
        handle.flush()


def smoke_tests() -> None:
    # Hand-checkable strict-Kalmanson metric.
    a, b, c, d = "a", "b", "c", "d"
    ledger = {
        edge(a, b): Fraction(1),
        edge(b, c): Fraction(1),
        edge(c, d): Fraction(1),
        edge(a, d): Fraction(1),
        edge(a, c): Fraction(2),
        edge(b, d): Fraction(2),
    }
    diagonal = ledger[edge(a, c)] + ledger[edge(b, d)]
    assert diagonal > ledger[edge(a, b)] + ledger[edge(c, d)]
    assert diagonal > ledger[edge(a, d)] + ledger[edge(b, c)]

    assert len(tuple(permutations(CYCLE, 2))) == 6
    for role in ("II", "IO", "OI"):
        forward = boundary(role, "forward")
        reflected = boundary(role, "reflected")
        assert reflected == (forward[0], *reversed(forward[1:]))


def solve_structural_cell(cell: tuple[str, str, str]) -> dict[str, object]:
    radius_arm, frontier_role, orientation = cell
    cell_id = f"{radius_arm}-{frontier_role}-{orientation}"
    solver, distance, radii, differences, word = build_solver(
        radius_arm, frontier_role, orientation
    )
    # The descriptor hash identifies the exact encoder branch.  It is kept
    # independent of the semantic continuation alias on purpose: the source
    # audit says that alias adds no arithmetic atom.
    formula_descriptor = {
        "encoder": "period-three-named-source-alias-decision-v1",
        "radius_arm": radius_arm,
        "frontier_role": frontier_role,
        "orientation": orientation,
        "target_negation": True,
    }
    formula_hash = sha256(
        json.dumps(formula_descriptor, sort_keys=True).encode("utf-8")
    ).hexdigest()
    result = solver.check()
    chosen_signs: dict[str, str] = {}
    extension_checks = 1
    extension_failure: dict[str, object] | None = None
    if result == z3.sat:
        # Exact incremental generic-point construction.  At each step, prefer
        # the current rational model's strict direction.  If it is equal or
        # that unit-gap branch is infeasible, try the other direction.  Every
        # accepted prefix remains exactly QF_LRA SAT.
        for name, u, v in differences:
            model = solver.model()
            u_value = rational(model.eval(u, model_completion=True))
            v_value = rational(model.eval(v, model_completion=True))
            preferred = True if u_value >= v_value else False
            accepted = False
            statuses: list[dict[str, str]] = []
            for positive in (preferred, not preferred):
                constraint = u >= v + 1 if positive else v >= u + 1
                solver.push()
                solver.add(constraint)
                candidate = solver.check()
                extension_checks += 1
                reason = solver.reason_unknown() if candidate == z3.unknown else ""
                solver.pop()
                statuses.append({
                    "direction": "u_gt_v" if positive else "v_gt_u",
                    "status": str(candidate),
                    "reason": reason,
                })
                if candidate == z3.sat:
                    solver.add(constraint)
                    chosen_signs[name] = "u_gt_v" if positive else "v_gt_u"
                    accepted = True
                    break
            if not accepted:
                extension_failure = {"difference": name, "attempts": statuses}
                result = z3.unknown
                break
        if extension_failure is None:
            result = solver.check()
            extension_checks += 1
    record: dict[str, object] = {
        "cell_id": cell_id,
        "radius_arm": radius_arm,
        "frontier_role": frontier_role,
        "orientation": orientation,
        "formula_descriptor": formula_descriptor,
        "formula_descriptor_sha256": formula_hash,
        "status": str(result),
        "disequalities": len(differences),
        "incremental_lra_checks": extension_checks,
    }
    if extension_failure is not None:
        record["incremental_extension_failure"] = extension_failure
        record["status"] = "unknown"
    elif result == z3.unknown:
        record["reason_unknown"] = solver.reason_unknown()
    elif result == z3.sat:
        assert len(chosen_signs) == len(differences)
        record["chosen_disequality_signs"] = chosen_signs
        model = solver.model()
        distance_values = {
            pair: rational(model.eval(variable, model_completion=True))
            for pair, variable in distance.items()
        }
        radius_values = {
            name: rational(model.eval(variable, model_completion=True))
            for name, variable in radii.items()
        }
        verification = verify_model(
            radius_arm,
            frontier_role,
            orientation,
            distance_values,
            radius_values,
        )
        witness_id = f"witness-{cell_id}"
        record["witness_id"] = witness_id
        record["verification"] = verification
        record["witness"] = {
            "boundary": list(word),
            "radii": {name: str(value) for name, value in radius_values.items()},
            "distances": {
                "|".join(pair): str(value)
                for pair, value in sorted(distance_values.items())
            },
            "verification": verification,
        }
    return record


def main() -> None:
    smoke_tests()
    PROGRESS_PATH.write_text("", encoding="utf-8")
    started = time.time()
    structural_results: list[dict[str, object]] = []
    alias_results: list[dict[str, object]] = []
    witness_ledgers: dict[str, dict[str, object]] = {}

    # Reflection is an exact formula automorphism: both Kalmanson inequalities
    # are included for every cyclic quadruple, and all non-order constraints
    # are label-preserving.  Solve only the forward word, then independently
    # substitute each rational witness into the reflected word.
    solved_cells = [
        (radius_arm, frontier_role, "forward")
        for radius_arm in ("equal", "unequal")
        for frontier_role in ("II", "IO", "OI")
    ]
    aliases = tuple(permutations(CYCLE, 2))

    append_progress({
        "event": "run_start",
        "solved_forward_cells": len(solved_cells),
        "structural_cells_after_reflection_transport": 2 * len(solved_cells),
        "alias_cells": 2 * len(solved_cells) * len(aliases),
        "workers": len(solved_cells),
    })
    with get_context("spawn").Pool(processes=len(solved_cells)) as pool:
        for index, record in enumerate(
            pool.imap_unordered(solve_structural_cell, solved_cells, chunksize=1),
            1,
        ):
            witness = record.pop("witness", None)
            if witness is not None:
                witness_ledgers[str(record["witness_id"])] = witness
            structural_results.append(record)
            append_progress({
                "event": "structural_cell_complete",
                "completed": index,
                "total": len(solved_cells),
                "elapsed_seconds": round(time.time() - started, 3),
                **record,
            })

            reflected = dict(record)
            reflected["cell_id"] = str(record["cell_id"]).replace(
                "-forward", "-reflected"
            )
            reflected["orientation"] = "reflected"
            reflected_descriptor = dict(record["formula_descriptor"])
            reflected_descriptor["orientation"] = "reflected"
            reflected["formula_descriptor"] = reflected_descriptor
            reflected["formula_descriptor_sha256"] = sha256(
                json.dumps(reflected_descriptor, sort_keys=True).encode("utf-8")
            ).hexdigest()
            reflected["reflection_transport_from"] = record["cell_id"]
            if witness is not None:
                raw_distances = {
                    tuple(name.split("|")): Fraction(value)
                    for name, value in witness["distances"].items()
                }
                raw_radii = {
                    name: Fraction(value) for name, value in witness["radii"].items()
                }
                reflected_verification = verify_model(
                    str(record["radius_arm"]),
                    str(record["frontier_role"]),
                    "reflected",
                    raw_distances,
                    raw_radii,
                )
                reflected_witness_id = str(record["witness_id"]).replace(
                    "-forward", "-reflected"
                )
                reflected["witness_id"] = reflected_witness_id
                reflected["verification"] = reflected_verification
                reflected_witness = dict(witness)
                reflected_witness["boundary"] = list(boundary(
                    str(record["frontier_role"]), "reflected"
                ))
                reflected_witness["verification"] = reflected_verification
                reflected_witness["reflection_transport_from"] = record["witness_id"]
                witness_ledgers[reflected_witness_id] = reflected_witness
            structural_results.append(reflected)

            # The ordered alias is semantic metadata: none of its two names
            # occur in the formula except through their already-distinct c_i
            # labels.  All six instances share this formula and witness.
            for structural_record in (record, reflected):
              for first_source, second_source in aliases:
                first_index = CYCLE.index(first_source)
                second_index = CYCLE.index(second_source)
                relative = (
                    "successor"
                    if second_index == (first_index + 1) % 3
                    else "predecessor"
                )
                alias_record = {
                    "cell_id": structural_record["cell_id"],
                    "continuation_first": first_source,
                    "continuation_second": second_source,
                    "relative_cycle_orientation": relative,
                    "formula_descriptor_sha256": structural_record["formula_descriptor_sha256"],
                    "status": structural_record["status"],
                }
                if "witness_id" in structural_record:
                    alias_record["witness_id"] = structural_record["witness_id"]
                alias_results.append(alias_record)

    structural_results.sort(key=lambda result: str(result["cell_id"]))
    alias_results.sort(key=lambda result: (
        str(result["cell_id"]),
        str(result["continuation_first"]),
        str(result["continuation_second"]),
    ))

    status_counts: dict[str, int] = {}
    for result in alias_results:
        status = str(result["status"])
        status_counts[status] = status_counts.get(status, 0) + 1

    output = {
        "schema": "period-three-named-source-alias-decision-v1",
        "epistemic_status": (
            "EXACT_QF_LRA_DECISION_WITH_SUBSTITUTION_VERIFIED_RATIONAL_"
            "WITNESSES_NOT_EUCLIDEAN_NOT_MEC_NOT_TOTAL_CSS_NOT_FULL_PARENT_NOT_LEAN"
        ),
        "source_audit": {
            "supported": [
                "continuation.first and continuation.second are distinct physical vertices",
                "under the global all-reverse period-three branch, both occur among c0,c1,c2",
            ],
            "not_supported": [
                "continuation.first or continuation.second equals retained frontier q or w",
                "the named-source aliases alone add any distance equality or inequality",
            ],
            "formula_consequence": (
                "all six ordered aliases share one identical formula per structural cell"
            ),
        },
        "coverage_within_fixed_25_role_family": {
            "radius_arms": ["equal", "unequal"],
            "frontier_roles": ["II", "IO", "OI"],
            "boundary_orientations": ["forward", "reflected"],
            "ordered_distinct_named_source_aliases": [
                list(alias) for alias in aliases
            ],
            "solved_forward_cells": len(solved_cells),
            "structural_cells": len(structural_results),
            "alias_cells": len(alias_results),
        },
        "target_negation": (
            "for every reverse pair {x_i,y_i}, dist(first,x_i) != dist(first,y_i)"
        ),
        "status_counts": status_counts,
        "structural_results": structural_results,
        "alias_results": alias_results,
        "witness_ledgers": witness_ledgers,
        "elapsed_seconds": round(time.time() - started, 3),
        "claims_excluded": [
            "source-complete quotient outside the fixed fully-disjoint 25-role family",
            "planar Euclidean realization",
            "minimum-enclosing-circle or cap-segment realization",
            "extension to a total CriticalShellSystem",
            "minimality or no-M44 realization",
            "refutation of the aggregate full-L occurrence theorem",
            "closure of a Lean sorry",
        ],
    }
    RESULT_PATH.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    append_progress({
        "event": "run_complete",
        "status_counts": status_counts,
        "solved_forward_cells": len(solved_cells),
        "structural_cells": len(structural_results),
        "alias_cells": len(alias_results),
        "elapsed_seconds": output["elapsed_seconds"],
    })
    print(json.dumps({
        "result_path": str(RESULT_PATH),
        "status_counts": status_counts,
        "structural_cells": len(structural_results),
        "alias_cells": len(alias_results),
        "elapsed_seconds": output["elapsed_seconds"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
