#!/usr/bin/env python3
"""Check exact shell-curvature turn feasibility for one finite survivor.

This checks only the scalar consequences exported by the production
shell-curvature theorems.  A SAT result is not a Euclidean realization.
"""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path

import z3


NORMALIZED_HALF_PI = Fraction(1)
NORMALIZED_TWO_PI = Fraction(4)
NORMALIZED_PI = Fraction(2)

FIVE_ROLE_SCHEMA = (
    (0, 2),
    (0, 4),
    (1, 2),
    (1, 3),
    (2, 3),
    (2, 4),
)


def rational(value: Fraction) -> z3.RatNumRef:
    return z3.Q(value.numerator, value.denominator)


def as_fraction(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def schema_embeddings(rows: dict[int, set[int]], n: int) -> list[dict[str, object]]:
    embeddings: list[dict[str, object]] = []
    for selected in itertools.combinations(range(n), 5):
        for reflected in (False, True):
            roles = tuple(reversed(selected)) if reflected else selected
            if all(roles[point] in rows[roles[center]] for center, point in FIVE_ROLE_SCHEMA):
                embeddings.append(
                    {
                        "increasing_vertices": list(selected),
                        "reflected": reflected,
                        "role_map": list(roles),
                    }
                )
    return embeddings


def separated_quarter_turn_arc_witnesses(
    row_ledger: list[dict[str, object]], n: int
) -> list[dict[str, object]]:
    base_arcs: list[dict[str, object]] = []
    for entry in row_ledger:
        center = int(entry["center"])
        offsets = entry["centered_reverse_offsets"]
        global_start = (-center) % n
        base_arcs.extend(
            [
                {
                    "center": center,
                    "kind": "center_to_second_support",
                    "start": global_start,
                    "end": global_start + int(offsets[1]),
                },
                {
                    "center": center,
                    "kind": "third_support_to_period_end",
                    "start": global_start + int(offsets[2]),
                    "end": global_start + n,
                },
            ]
        )
    shifted_arcs: list[dict[str, object]] = []
    for arc in base_arcs:
        for shift in range(-2, 3):
            shifted_arcs.append(
                {
                    **arc,
                    "start": int(arc["start"]) + shift * n,
                    "end": int(arc["end"]) + shift * n,
                }
            )

    witnesses: list[dict[str, object]] = []
    seen: set[tuple[tuple[int, int, int, str], ...]] = set()
    for chosen in itertools.combinations(shifted_arcs, 4):
        if len({(arc["center"], arc["kind"]) for arc in chosen}) != 4:
            continue
        ordered = sorted(chosen, key=lambda arc: (arc["start"], arc["end"]))
        if any(ordered[i]["end"] > ordered[i + 1]["start"] for i in range(3)):
            continue
        cut = int(ordered[0]["start"])
        if int(ordered[-1]["end"]) - cut > n:
            continue
        normalized = tuple(
            (
                int(arc["start"]) - cut,
                int(arc["end"]) - cut,
                int(arc["center"]),
                str(arc["kind"]),
            )
            for arc in ordered
        )
        if normalized in seen:
            continue
        seen.add(normalized)
        witnesses.append(
            {
                "cut_global_index_mod_n": cut % n,
                "normalized_arcs": [
                    {
                        "start": start,
                        "end": end,
                        "center": center,
                        "kind": kind,
                    }
                    for start, end, center, kind in normalized
                ],
            }
        )
    return witnesses


def turn_disjoint_quarter_turn_arc_witnesses(
    row_ledger: list[dict[str, object]], n: int
) -> list[dict[str, object]]:
    """Find four arcs whose open-curvature turn supports are disjoint.

    `openWindowArcCurvature chart a b` uses the edge-turn increments from
    `a` through `b - 2`.  Consequently the exact aggregation condition is
    `b - 1 <= a'`, one index weaker than the current production consumer's
    sufficient condition `b <= a'`.
    """
    base_arcs: list[dict[str, object]] = []
    for entry in row_ledger:
        center = int(entry["center"])
        offsets = entry["centered_reverse_offsets"]
        global_start = (-center) % n
        base_arcs.extend(
            [
                {
                    "center": center,
                    "kind": "center_to_second_support",
                    "start": global_start,
                    "end": global_start + int(offsets[1]),
                },
                {
                    "center": center,
                    "kind": "third_support_to_period_end",
                    "start": global_start + int(offsets[2]),
                    "end": global_start + n,
                },
            ]
        )
    shifted_arcs = [
        {**arc, "start": int(arc["start"]) + shift * n,
         "end": int(arc["end"]) + shift * n}
        for arc in base_arcs
        for shift in range(-2, 3)
    ]
    witnesses: list[dict[str, object]] = []
    seen: set[tuple[tuple[int, int, int, str], ...]] = set()
    for chosen in itertools.combinations(shifted_arcs, 4):
        if len({(arc["center"], arc["kind"]) for arc in chosen}) != 4:
            continue
        ordered = sorted(chosen, key=lambda arc: (arc["start"], arc["end"]))
        if any(int(ordered[i]["end"]) - 1 > int(ordered[i + 1]["start"])
               for i in range(3)):
            continue
        cut = int(ordered[0]["start"])
        if int(ordered[-1]["end"]) - 1 - cut >= n:
            continue
        normalized = tuple(
            (
                int(arc["start"]) - cut,
                int(arc["end"]) - cut,
                int(arc["center"]),
                str(arc["kind"]),
            )
            for arc in ordered
        )
        if normalized in seen:
            continue
        seen.add(normalized)
        witnesses.append(
            {
                "cut_global_index_mod_n": cut % n,
                "normalized_arcs": [
                    {"start": start, "end": end, "center": center, "kind": kind}
                    for start, end, center, kind in normalized
                ],
            }
        )
    return witnesses


def strict_hit_checks(payload: dict[str, object], rows: dict[int, set[int]]) -> dict[str, object]:
    first_apex = int(payload["first_apex"])
    exact_class = set(int(x) for x in payload["first_apex_exact_class"])
    strict = set(int(x) for x in payload["first_opposite_strict"])
    caps = payload["closed_caps"]
    surplus = set(int(x) for x in caps["surplus"])
    second_opposite = set(int(x) for x in caps["second_opposite"])
    return {
        "first_apex_row_equals_exact_class": rows[first_apex] == exact_class,
        "strict_hit_count": len(exact_class & strict),
        "surplus_adjacent_hit_count": len(exact_class & surplus),
        "second_opposite_adjacent_hit_count": len(exact_class & second_opposite),
    }


def check(payload: dict[str, object]) -> dict[str, object]:
    n = int(payload["n"])
    rows = {int(center): set(int(point) for point in support)
            for center, support in payload["rows"].items()}
    if set(rows) != set(range(n)):
        raise ValueError("the ledger requires one selected class at every center")
    if any(len(support) != 4 or center in support for center, support in rows.items()):
        raise ValueError("every selected class must have four noncenter support points")

    turns = [z3.Real(f"turn_{i}") for i in range(n)]
    constraints: list[tuple[str, z3.BoolRef]] = [
        ("full_turn_sum", z3.Sum(*turns) == rational(NORMALIZED_TWO_PI))
    ]
    for index, turn in enumerate(turns):
        constraints.append((f"turn_{index}_positive", turn > 0))
        constraints.append((f"turn_{index}_lt_pi", turn < rational(NORMALIZED_PI)))

    row_ledger: list[dict[str, object]] = []
    for center, support in sorted(rows.items()):
        offsets = sorted((center - point) % n for point in support)
        if offsets[0] == 0:
            raise ValueError(f"center {center} occurs in its own selected class")
        second_offset = offsets[1]
        third_offset = offsets[2]
        global_start = (-center) % n
        left_turns = [
            (global_start + offset) % n for offset in range(second_offset - 1)
        ]
        right_turns = [
            (global_start + offset) % n
            for offset in range(third_offset, n - 1)
        ]
        left_sum = z3.Sum(*(turns[index] for index in left_turns))
        right_sum = z3.Sum(*(turns[index] for index in right_turns))
        constraints.append(
            (f"center_{center}_left_quarter_turn", left_sum > rational(NORMALIZED_HALF_PI))
        )
        constraints.append(
            (f"center_{center}_right_quarter_turn", right_sum > rational(NORMALIZED_HALF_PI))
        )
        row_ledger.append(
            {
                "center": center,
                "support": sorted(support),
                "centered_reverse_offsets": offsets,
                "second_support_left_turn_indices": left_turns,
                "third_support_right_turn_indices": right_turns,
            }
        )

    solver = z3.SolverFor("QF_LRA")
    tracked = {label: z3.Bool(label) for label, _ in constraints}
    for label, constraint in constraints:
        solver.assert_and_track(constraint, tracked[label])
    status = solver.check()
    result: dict[str, object] = {
        "schema": "p97-exact-two-shell-curvature-scalar-ledger-v1",
        "source_scope": (
            "Exact rational replay of the scalar turn inequalities exported by "
            "the production shell-curvature theorems; not a Euclidean realization"
        ),
        "n": n,
        "normalized_constants": {"pi_over_two": "1", "pi": "2", "two_pi": "4"},
        "strict_hit_checks": strict_hit_checks(payload, rows),
        "five_role_consumer_embeddings": schema_embeddings(rows, n),
        "row_ledger": row_ledger,
        "solver_status": str(status).upper(),
    }
    blocker_image = {int(center) for center in payload.get("blockers", {}).values()}
    result["blocker_image_centers"] = sorted(blocker_image)

    def annotate_exact_rows(witnesses: list[dict[str, object]]) -> None:
        for witness in witnesses:
            centers = {
                int(arc["center"]) for arc in witness["normalized_arcs"]
            }
            witness["all_centers_in_blocker_image"] = centers <= blocker_image

    separated = separated_quarter_turn_arc_witnesses(row_ledger, n)
    turn_disjoint = turn_disjoint_quarter_turn_arc_witnesses(row_ledger, n)
    annotate_exact_rows(separated)
    annotate_exact_rows(turn_disjoint)
    result["four_separated_quarter_turn_arc_witnesses"] = separated
    result["four_turn_disjoint_quarter_turn_arc_witnesses"] = turn_disjoint
    if status == z3.unsat:
        core = [str(label) for label in solver.unsat_core()]

        # Greedy deletion gives a replayable subset-minimal exact-QF_LRA core.
        minimized = core[:]
        changed = True
        while changed:
            changed = False
            for label in minimized[:]:
                trial = [item for item in minimized if item != label]
                replay = z3.SolverFor("QF_LRA")
                constraint_by_label = dict(constraints)
                replay.add(*(constraint_by_label[item] for item in trial))
                if replay.check() == z3.unsat:
                    minimized = trial
                    changed = True
                    break
        result["unsat_core"] = core
        result["deletion_minimal_unsat_core"] = minimized
    if status == z3.sat:
        model = solver.model()
        values = [as_fraction(model.eval(turn, model_completion=True)) for turn in turns]
        result["turn_model"] = [str(value) for value in values]
        result["turn_sum"] = str(sum(values))
        result["all_turns_positive_and_lt_pi"] = all(
            0 < value < NORMALIZED_PI for value in values
        )
        margins = []
        for entry in row_ledger:
            left = sum(values[i] for i in entry["second_support_left_turn_indices"])
            right = sum(values[i] for i in entry["third_support_right_turn_indices"])
            margins.append(
                {
                    "center": entry["center"],
                    "left_curvature": str(left),
                    "right_curvature": str(right),
                    "left_margin_over_pi_over_two": str(left - NORMALIZED_HALF_PI),
                    "right_margin_over_pi_over_two": str(right - NORMALIZED_HALF_PI),
                }
            )
        result["verified_row_margins"] = margins
        result["all_row_margins_positive"] = all(
            Fraction(entry["left_margin_over_pi_over_two"]) > 0
            and Fraction(entry["right_margin_over_pi_over_two"]) > 0
            for entry in margins
        )
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    payload = json.loads(args.source.read_text())
    result = check(payload)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
