#!/usr/bin/env python3
"""Search for a cyclic selected-row system with no four disjoint turn arcs.

This is an abstraction audit, not a Euclidean realization.  At every cyclic
carrier center it chooses four noncenter support indices.  The second and
third support positions determine the two strict quarter-turn arcs exported
by ShellCurvature.  A SAT result refutes the purely combinatorial packing
lemma; UNSAT would be exact only for the requested carrier cardinality.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import z3


def row_options(center: int, n: int) -> list[dict[str, object]]:
    options: list[dict[str, object]] = []
    for support in itertools.combinations((p for p in range(n) if p != center), 4):
        offsets = sorted((center - point) % n for point in support)
        start = (-center) % n
        arcs = (
            {
                "kind": "center_to_second_support",
                "start": start,
                "end": start + offsets[1],
            },
            {
                "kind": "third_support_to_period_end",
                "start": start + offsets[2],
                "end": start + n,
            },
        )
        options.append({"support": support, "offsets": offsets, "arcs": arcs})
    return options


def turn_support(arc: dict[str, object], n: int) -> frozenset[int]:
    start = int(arc["start"])
    end = int(arc["end"])
    return frozenset(index % n for index in range(start, end - 1))


def first_disjoint_four(
    selected: list[dict[str, object]], n: int
) -> tuple[dict[str, object], ...] | None:
    arcs: list[dict[str, object]] = []
    for center, option in enumerate(selected):
        for arc in option["arcs"]:
            arcs.append(
                {
                    **arc,
                    "center": center,
                    "turn_support": turn_support(arc, n),
                }
            )
    for chosen in itertools.combinations(arcs, 4):
        if all(
            chosen[i]["turn_support"].isdisjoint(chosen[j]["turn_support"])
            for i in range(4)
            for j in range(i + 1, 4)
        ):
            return chosen
    return None


def sink_component(selected: list[dict[str, object]], n: int) -> set[int] | None:
    adjacency = [set(int(point) for point in option["support"]) for option in selected]
    reverse = [set() for _ in range(n)]
    for center, targets in enumerate(adjacency):
        for target in targets:
            reverse[target].add(center)

    seen: set[int] = set()
    order: list[int] = []

    def visit(vertex: int) -> None:
        if vertex in seen:
            return
        seen.add(vertex)
        for target in adjacency[vertex]:
            visit(target)
        order.append(vertex)

    for vertex in range(n):
        visit(vertex)

    components: list[set[int]] = []
    seen.clear()

    def collect(vertex: int, component: set[int]) -> None:
        if vertex in seen:
            return
        seen.add(vertex)
        component.add(vertex)
        for target in reverse[vertex]:
            collect(target, component)

    for vertex in reversed(order):
        if vertex not in seen:
            component: set[int] = set()
            collect(vertex, component)
            components.append(component)
    if len(components) == 1:
        return None
    for component in components:
        if all(adjacency[center] <= component for center in component):
            return component
    raise AssertionError("non-strong digraph has no sink component")


def curvature_ledger(
    selected: list[dict[str, object]], n: int
) -> tuple[str, set[int], list[str] | None]:
    turns = [z3.Real(f"turn_{index}") for index in range(n)]
    solver = z3.SolverFor("QF_LRA")
    solver.add(z3.Sum(*turns) == 4)
    solver.add(*(turn > 0 for turn in turns))
    solver.add(*(turn < 2 for turn in turns))
    labels: dict[str, z3.BoolRef] = {}
    for center, option in enumerate(selected):
        offsets = option["offsets"]
        start = (-center) % n
        left_indices = [(start + offset) % n for offset in range(int(offsets[1]) - 1)]
        right_indices = [
            (start + offset) % n for offset in range(int(offsets[2]), n - 1)
        ]
        for kind, indices in (("left", left_indices), ("right", right_indices)):
            label = f"row_{center}_{kind}"
            labels[label] = z3.Bool(label)
            solver.assert_and_track(z3.Sum(*(turns[index] for index in indices)) > 1, labels[label])
    status = solver.check()
    if status == z3.sat:
        model = solver.model()
        return "SAT", set(), [str(model.eval(turn, model_completion=True)) for turn in turns]
    if status == z3.unsat:
        centers = {int(str(label).split("_")[1]) for label in solver.unsat_core()}
        return "UNSAT", centers, None
    return "UNKNOWN", set(), None


def solve(
    n: int,
    round_cap: int,
    exact_two_profile: int | None,
    require_strong_connectivity: bool,
    require_curvature_sat: bool,
) -> dict[str, object]:
    options = [row_options(center, n) for center in range(n)]
    if exact_two_profile is not None:
        if n != 11 or exact_two_profile not in {4, 5}:
            raise ValueError("the exact-two profile filter is defined only for n=11 and 4/5")
        second_apex = 4
        surplus_vertex = 4 + (exact_two_profile - 2) + 1
        surplus = set(range(0, second_apex + 1))
        strict = set(range(second_apex + 1, surplus_vertex))
        second_opposite = {surplus_vertex, *range(surplus_vertex + 1, n), 0}
        options[0] = [
            option
            for option in options[0]
            if len(set(option["support"]) & strict) == 2
            and len(set(option["support"]) & surplus) == 1
            and len(set(option["support"]) & second_opposite) == 1
        ]
    selected_index = [z3.Int(f"row_{center}") for center in range(n)]
    solver = z3.Solver()
    for center in range(n):
        solver.add(0 <= selected_index[center])
        solver.add(selected_index[center] < len(options[center]))

    connectivity_cuts = 0
    packing_cuts = 0
    curvature_cuts = 0
    for round_number in range(round_cap + 1):
        status = solver.check()
        if status != z3.sat:
            return {
                "n": n,
                "status": str(status).upper(),
                "rounds": round_number,
                "exact_two_profile": exact_two_profile,
                "require_strong_connectivity": require_strong_connectivity,
                "connectivity_cuts": connectivity_cuts,
                "packing_cuts": packing_cuts,
                "curvature_cuts": curvature_cuts,
                "require_curvature_sat": require_curvature_sat,
                "scope": "cyclic selected-row abstraction only",
            }
        model = solver.model()
        indices = [model.eval(variable).as_long() for variable in selected_index]
        selected = [options[center][index] for center, index in enumerate(indices)]
        if require_strong_connectivity:
            sink = sink_component(selected, n)
            if sink is not None:
                exits = [
                    selected_index[center] == index
                    for center in sorted(sink)
                    for index, option in enumerate(options[center])
                    if not set(option["support"]) <= sink
                ]
                if not exits:
                    return {
                        "n": n,
                        "status": "UNSAT_STRONG_CONNECTIVITY_STRUCTURAL",
                        "rounds": round_number,
                        "sink": sorted(sink),
                    }
                solver.add(z3.Or(*exits))
                connectivity_cuts += 1
                continue
        witness = first_disjoint_four(selected, n)
        if witness is None and require_curvature_sat:
            curvature_status, core_centers, turn_model = curvature_ledger(selected, n)
            if curvature_status == "UNSAT":
                if not core_centers:
                    return {
                        "n": n,
                        "status": "UNSAT_CURVATURE_WITHOUT_ROW_CORE",
                        "rounds": round_number,
                    }
                solver.add(z3.Or(*(
                    selected_index[center] != indices[center]
                    for center in sorted(core_centers)
                )))
                curvature_cuts += 1
                continue
            if curvature_status == "UNKNOWN":
                return {
                    "n": n,
                    "status": "UNKNOWN_CURVATURE_LEDGER",
                    "rounds": round_number,
                }
        else:
            turn_model = None
        if witness is None:
            return {
                "n": n,
                "status": "SAT_NO_FOUR_ARC_PACKING",
                "rounds": round_number,
                "exact_two_profile": exact_two_profile,
                "require_strong_connectivity": require_strong_connectivity,
                "connectivity_cuts": connectivity_cuts,
                "packing_cuts": packing_cuts,
                "curvature_cuts": curvature_cuts,
                "require_curvature_sat": require_curvature_sat,
                "turn_model": turn_model,
                "scope": "cyclic selected-row abstraction only; not Euclidean",
                "rows": [
                    {
                        "center": center,
                        "support": list(option["support"]),
                        "offsets": option["offsets"],
                        "arcs": [
                            {
                                **arc,
                                "turn_support": sorted(turn_support(arc, n)),
                            }
                            for arc in option["arcs"]
                        ],
                    }
                    for center, option in enumerate(selected)
                ],
            }
        involved = sorted({int(arc["center"]) for arc in witness})
        solver.add(z3.Or(*(selected_index[center] != indices[center] for center in involved)))
        packing_cuts += 1

    return {
        "n": n,
        "status": "ROUND_CAP_REACHED_UNRESOLVED",
        "rounds": round_cap,
        "exact_two_profile": exact_two_profile,
        "require_strong_connectivity": require_strong_connectivity,
        "connectivity_cuts": connectivity_cuts,
        "packing_cuts": packing_cuts,
        "curvature_cuts": curvature_cuts,
        "require_curvature_sat": require_curvature_sat,
        "scope": "cyclic selected-row abstraction only",
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--round-cap", type=int, default=100_000)
    parser.add_argument("--exact-two-profile", type=int, choices=(4, 5))
    parser.add_argument("--require-strong-connectivity", action="store_true")
    parser.add_argument("--require-curvature-sat", action="store_true")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.n < 5:
        raise SystemExit("n must be at least 5")
    result = solve(
        args.n,
        args.round_cap,
        args.exact_two_profile,
        args.require_strong_connectivity,
        args.require_curvature_sat,
    )
    if args.check:
        if args.output is None:
            raise SystemExit("--check requires --output")
        expected = json.loads(args.output.read_text())
        if result != expected:
            raise AssertionError("arc-packing checkpoint drifted")
        print("PASS: arc-packing checkpoint matches exact replay")
        return
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
