#!/usr/bin/env python3
"""Audit four-turn-arc packing after restoring critical-map circle constraints.

This remains a finite selected-row abstraction at one fixed carrier cardinality.
It strengthens the earlier global-K4/curvature search by adding the source-valid
facts that distinct-center circle supports meet in at most two points, every
source lies in the selected row at its fixed blocker, the blocker map has no
fixed point, and the first-apex fiber is exactly its selected four-class.

A SAT result is only a counterpattern to that strengthened finite abstraction.
An UNSAT result is exact only within this encoding and is not a Euclidean or
arbitrary-cardinality theorem.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BASE_SCRIPT = (
    HERE.parent
    / "unique4-global-k4-curvature-packing"
    / "search_arc_packing_counterexample.py"
)


def load_base() -> ModuleType:
    spec = importlib.util.spec_from_file_location("arc_packing_base", BASE_SCRIPT)
    if spec is None or spec.loader is None:
        raise RuntimeError(BASE_SCRIPT)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def exact_two_options(
    base: ModuleType, n: int, profile: int
) -> list[list[dict[str, Any]]]:
    if n != 11 or profile not in {4, 5}:
        raise ValueError("the exact-two profile filter is defined only for n=11 and 4/5")
    options = [base.row_options(center, n) for center in range(n)]
    second_apex = 4
    surplus_vertex = 4 + (profile - 2) + 1
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
    return options


def selected_member(
    selected_index: list[z3.ArithRef],
    options: list[list[dict[str, Any]]],
    center: int,
    point: int,
) -> z3.BoolRef:
    indices = [
        index
        for index, option in enumerate(options[center])
        if point in option["support"]
    ]
    if not indices:
        return z3.BoolVal(False)
    return z3.Or(*(selected_index[center] == index for index in indices))


def add_source_faithful_constraints(
    solver: z3.Solver,
    selected_index: list[z3.ArithRef],
    blockers: list[z3.ArithRef],
    options: list[list[dict[str, Any]]],
    n: int,
) -> None:
    members = [
        [selected_member(selected_index, options, center, point) for point in range(n)]
        for center in range(n)
    ]

    # Two positive-radius circles with distinct carrier centers share at most
    # two points.  The statement remains true for selected four-subsets.
    for first in range(n):
        for second in range(first + 1, n):
            shared = [
                z3.And(members[first][point], members[second][point])
                for point in range(n)
            ]
            solver.add(z3.AtMost(*shared, 2))

    for source in range(n):
        solver.add(0 <= blockers[source], blockers[source] < n)
        solver.add(blockers[source] != source)
        for center in range(n):
            solver.add(z3.Implies(blockers[source] == center, members[center][source]))

        # In the exact-four first-apex residual, the complete first-apex class
        # is exactly the fixed critical-map fiber at center 0.
        solver.add((blockers[source] == 0) == members[0][source])


def render_rows(
    base: ModuleType,
    selected: list[dict[str, Any]],
    n: int,
) -> list[dict[str, Any]]:
    return [
        {
            "center": center,
            "support": list(option["support"]),
            "offsets": option["offsets"],
            "arcs": [
                {
                    **arc,
                    "turn_support": sorted(base.turn_support(arc, n)),
                }
                for arc in option["arcs"]
            ],
        }
        for center, option in enumerate(selected)
    ]


def solve(
    n: int,
    profile: int,
    round_cap: int,
    log_every: int,
) -> dict[str, Any]:
    base = load_base()
    options = exact_two_options(base, n, profile)
    selected_index = [z3.Int(f"row_{center}") for center in range(n)]
    blockers = [z3.Int(f"blocker_{source}") for source in range(n)]
    solver = z3.Solver()
    solver.set(random_seed=0)
    for center in range(n):
        solver.add(0 <= selected_index[center])
        solver.add(selected_index[center] < len(options[center]))
    add_source_faithful_constraints(solver, selected_index, blockers, options, n)

    connectivity_cuts = 0
    packing_cuts = 0
    curvature_cuts = 0
    for round_number in range(round_cap + 1):
        if log_every and round_number % log_every == 0:
            print(
                f"profile={profile} round={round_number} "
                f"connectivity={connectivity_cuts} packing={packing_cuts} "
                f"curvature={curvature_cuts}",
                file=sys.stderr,
                flush=True,
            )
        status = solver.check()
        if status != z3.sat:
            return {
                "n": n,
                "status": str(status).upper(),
                "rounds": round_number,
                "exact_two_profile": profile,
                "connectivity_cuts": connectivity_cuts,
                "packing_cuts": packing_cuts,
                "curvature_cuts": curvature_cuts,
                "epistemic_status": "EXACT_Z3_RESULT_WITHIN_STATED_FINITE_ENCODING",
                "scope": (
                    "n=11 cyclic selected-row abstraction with exact-two first row, "
                    "strong connectivity, exact rational curvature, pairwise support "
                    "intersection at most two, and fixed critical-map source/fiber constraints; "
                    "not Euclidean, MEC/noM44, full radius partitions, or arbitrary-cardinality"
                ),
            }

        model = solver.model()
        indices = [model.eval(variable).as_long() for variable in selected_index]
        selected = [options[center][index] for center, index in enumerate(indices)]

        sink = base.sink_component(selected, n)
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

        witness = base.first_disjoint_four(selected, n)
        if witness is not None:
            involved = sorted({int(arc["center"]) for arc in witness})
            solver.add(
                z3.Or(
                    *(selected_index[center] != indices[center] for center in involved)
                )
            )
            packing_cuts += 1
            continue

        curvature_status, core_centers, turn_model = base.curvature_ledger(selected, n)
        if curvature_status == "UNSAT":
            if not core_centers:
                return {
                    "n": n,
                    "status": "UNSAT_CURVATURE_WITHOUT_ROW_CORE",
                    "rounds": round_number,
                }
            solver.add(
                z3.Or(
                    *(
                        selected_index[center] != indices[center]
                        for center in sorted(core_centers)
                    )
                )
            )
            curvature_cuts += 1
            continue
        if curvature_status == "UNKNOWN":
            return {
                "n": n,
                "status": "UNKNOWN_CURVATURE_LEDGER",
                "rounds": round_number,
            }

        blocker_values = [model.eval(blocker).as_long() for blocker in blockers]
        return {
            "n": n,
            "status": "SAT_NO_FOUR_ARC_PACKING",
            "rounds": round_number,
            "exact_two_profile": profile,
            "connectivity_cuts": connectivity_cuts,
            "packing_cuts": packing_cuts,
            "curvature_cuts": curvature_cuts,
            "epistemic_status": "EXACT_FINITE_COUNTERPATTERN_TO_STATED_ABSTRACTION",
            "scope": (
                "n=11 cyclic selected-row abstraction with exact-two first row, "
                "strong connectivity, exact rational curvature, pairwise support "
                "intersection at most two, and fixed critical-map source/fiber constraints; "
                "not Euclidean, MEC/noM44, full radius partitions, or arbitrary-cardinality"
            ),
            "blockers": blocker_values,
            "blocker_image": sorted(set(blocker_values)),
            "omitted_centers": sorted(set(range(n)) - set(blocker_values)),
            "turn_model": turn_model,
            "rows": render_rows(base, selected, n),
        }

    return {
        "n": n,
        "status": "ROUND_CAP_REACHED_UNRESOLVED",
        "rounds": round_cap,
        "exact_two_profile": profile,
        "connectivity_cuts": connectivity_cuts,
        "packing_cuts": packing_cuts,
        "curvature_cuts": curvature_cuts,
        "epistemic_status": "UNRESOLVED_UNDER_ROUND_CAP",
    }


def validate_sat_counterpattern(payload: dict[str, Any]) -> None:
    if payload.get("status") != "SAT_NO_FOUR_ARC_PACKING":
        raise AssertionError("checkpoint is not a SAT counterpattern")
    base = load_base()
    n = int(payload["n"])
    profile = int(payload["exact_two_profile"])
    options = exact_two_options(base, n, profile)
    rows = payload["rows"]
    blockers = list(map(int, payload["blockers"]))
    if len(rows) != n or len(blockers) != n:
        raise AssertionError("wrong carrier cardinality")
    selected: list[dict[str, Any]] = []
    supports: list[set[int]] = []
    for center, row in enumerate(rows):
        if int(row["center"]) != center:
            raise AssertionError("center order drift")
        support = tuple(map(int, row["support"]))
        matches = [option for option in options[center] if option["support"] == support]
        if len(matches) != 1:
            raise AssertionError(f"row {center} is outside the encoded option set")
        selected.append(matches[0])
        supports.append(set(support))
    if any(
        len(supports[first] & supports[second]) > 2
        for first in range(n)
        for second in range(first + 1, n)
    ):
        raise AssertionError("distinct-center support intersection exceeds two")
    for source, blocker in enumerate(blockers):
        if blocker == source:
            raise AssertionError("blocker fixed point")
        if source not in supports[blocker]:
            raise AssertionError("source absent from its blocker row")
        if (blocker == 0) != (source in supports[0]):
            raise AssertionError("first-apex fiber is not exactly its selected row")
    fibers = [sum(blocker == center for blocker in blockers) for center in range(n)]
    if max(fibers) > 4:
        raise AssertionError("critical fiber exceeds selected row cardinality")
    if base.sink_component(selected, n) is not None:
        raise AssertionError("selected witness digraph is not strongly connected")
    if base.first_disjoint_four(selected, n) is not None:
        raise AssertionError("four disjoint turn arcs exist")
    curvature_status, _, turn_model = base.curvature_ledger(selected, n)
    if curvature_status != "SAT" or turn_model != payload["turn_model"]:
        raise AssertionError("exact curvature ledger does not replay")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, default=11)
    parser.add_argument("--exact-two-profile", type=int, choices=(4, 5), required=True)
    parser.add_argument("--round-cap", type=int, default=100_000)
    parser.add_argument("--log-every", type=int, default=100)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.check:
        if args.output is None:
            raise SystemExit("--check requires --output")
        payload = json.loads(args.output.read_text())
        validate_sat_counterpattern(payload)
        print("PASS: critical-map arc-packing SAT counterpattern replays exactly")
        return
    result = solve(args.n, args.exact_two_profile, args.round_cap, args.log_every)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
