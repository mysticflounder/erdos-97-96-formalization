#!/usr/bin/env python3
"""Test two-row robust completion packets against the no-packing regression.

The collision arm may provide two four-subsets of one five-point radius class
(intersection three); the packed-core arm may provide two disjoint exact
four-classes.  This audit asks whether either two-row mode, at an omitted
non-triangle center, forces four disjoint outer arcs after strict-pair
bisector localization is imposed.

It is an exact finite selected-row regression at n=11, not a Euclidean model.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
from types import ModuleType
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_DIR = HERE.parent / "unique4-three-row-placement-source-audit"
SEARCH_SCRIPT = SOURCE_DIR / "search_arc_packing_critical_map.py"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_search() -> ModuleType:
    spec = importlib.util.spec_from_file_location("critical_map_search", SEARCH_SCRIPT)
    if spec is None or spec.loader is None:
        raise RuntimeError(SEARCH_SCRIPT)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def first_disjoint_four_multi(
    base: ModuleType, rows: list[tuple[int, dict[str, Any]]], n: int
) -> tuple[dict[str, Any], ...] | None:
    arcs: list[dict[str, Any]] = []
    for row_id, (center, option) in enumerate(rows):
        for arc in option["arcs"]:
            arcs.append(
                {
                    **arc,
                    "row_id": row_id,
                    "center": center,
                    "turn_support": base.turn_support(arc, n),
                }
            )
    for chosen in itertools.combinations(arcs, 4):
        if all(
            chosen[first]["turn_support"].isdisjoint(chosen[second]["turn_support"])
            for first in range(4)
            for second in range(first + 1, 4)
        ):
            return chosen
    return None


def curvature_ledger_multi(
    rows: list[tuple[int, dict[str, Any]]], n: int
) -> tuple[str, list[str] | None]:
    turns = [z3.Real(f"turn_{index}") for index in range(n)]
    solver = z3.SolverFor("QF_LRA")
    solver.add(z3.Sum(*turns) == 4)
    solver.add(*(turn > 0 for turn in turns))
    solver.add(*(turn < 2 for turn in turns))
    for row_id, (center, option) in enumerate(rows):
        offsets = option["offsets"]
        start = (-center) % n
        left = [(start + offset) % n for offset in range(int(offsets[1]) - 1)]
        right = [
            (start + offset) % n for offset in range(int(offsets[2]), n - 1)
        ]
        solver.add(z3.Sum(*(turns[index] for index in left)) > 1)
        solver.add(z3.Sum(*(turns[index] for index in right)) > 1)
    status = solver.check()
    if status != z3.sat:
        return str(status).upper(), None
    model = solver.model()
    return "SAT", [str(model.eval(turn, model_completion=True)) for turn in turns]


def profile_geometry(profile: int) -> tuple[set[int], set[int]]:
    second_apex = 4
    surplus_vertex = 4 + (profile - 2) + 1
    strict_first_cap = set(range(second_apex + 1, surplus_vertex))
    triangle_vertices = {0, second_apex, surplus_vertex}
    return strict_first_cap, triangle_vertices


def option_from_row(
    options: list[dict[str, Any]], row: dict[str, Any]
) -> dict[str, Any]:
    support = tuple(map(int, row["support"]))
    matches = [option for option in options if option["support"] == support]
    if len(matches) != 1:
        raise AssertionError("stored row is outside the option table")
    return matches[0]


def find_two_row_regression(
    payload: dict[str, Any], search: ModuleType, mode: str
) -> dict[str, Any] | None:
    search.validate_sat_counterpattern(payload)
    n = int(payload["n"])
    profile = int(payload["exact_two_profile"])
    base = search.load_base()
    options = search.exact_two_options(base, n, profile)
    selected = [
        option_from_row(options[center], row)
        for center, row in enumerate(payload["rows"])
    ]
    supports = [set(map(int, option["support"])) for option in selected]
    strict_cap, triangle_vertices = profile_geometry(profile)
    strict_pair = supports[0] & strict_cap
    if len(strict_pair) != 2:
        raise AssertionError("not an exact-two first row")
    blocker_image = set(map(int, payload["blockers"]))
    completion_centers = sorted(
        set(range(n)) - blocker_image - triangle_vertices
    )

    for center in completion_centers:
        first = selected[center]
        first_support = supports[center]
        for second in options[center]:
            second_support = set(map(int, second["support"]))
            if second_support == first_support:
                continue
            if mode == "five_class":
                if len(first_support & second_support) != 3:
                    continue
                if len(first_support | second_support) != 5:
                    continue
            elif mode == "disjoint_classes":
                if first_support & second_support:
                    continue
            else:
                raise ValueError(mode)

            # Distinct-center circle intersections remain at most two.
            if any(
                len(second_support & supports[other]) > 2
                for other in range(n)
                if other != center
            ):
                continue
            # Source-level bisector localization for the exact strict pair.
            if strict_pair <= second_support and center not in strict_cap:
                continue

            rows = [(row_center, option) for row_center, option in enumerate(selected)]
            rows.append((center, second))
            if first_disjoint_four_multi(base, rows, n) is not None:
                continue
            curvature_status, turn_model = curvature_ledger_multi(rows, n)
            if curvature_status != "SAT":
                continue
            return {
                "mode": mode,
                "completion_center": center,
                "first_support": sorted(first_support),
                "second_support": sorted(second_support),
                "support_intersection": sorted(first_support & second_support),
                "support_union": sorted(first_support | second_support),
                "strict_pair": sorted(strict_pair),
                "second_row_contains_strict_pair": strict_pair <= second_support,
                "bisector_localization_holds": True,
                "four_arc_packing_absent_with_both_rows": True,
                "joint_curvature_status": curvature_status,
                "joint_turn_model": turn_model,
            }
    return None


def build_report() -> dict[str, Any]:
    search = load_search()
    records: list[dict[str, Any]] = []
    for profile in (4, 5):
        source = SOURCE_DIR / f"critical_map_profile{profile}.json"
        payload = json.loads(source.read_text())
        records.append(
            {
                "profile": profile,
                "source": str(source.relative_to(ROOT)),
                "source_sha256": sha256(source),
                "five_class_regression": find_two_row_regression(
                    payload, search, "five_class"
                ),
                "disjoint_classes_regression": find_two_row_regression(
                    payload, search, "disjoint_classes"
                ),
            }
        )
    return {
        "epistemic_status": (
            "EXACT_FINITE_REGRESSION_FOR_SPLIT_ROBUST_COMPLETION_ROWS"
        ),
        "scope_warning": (
            "n=11 selected-row abstraction only; the two-row packets are not "
            "claimed Euclidean or source-realizable, and this gives no "
            "arbitrary-cardinality coverage"
        ),
        "search_script": str(SEARCH_SCRIPT.relative_to(ROOT)),
        "search_script_sha256": sha256(SEARCH_SCRIPT),
        "records": records,
        "interpretation": (
            "A non-null regression shows that merely having two completion rows "
            "at the omitted robust center, even in the five-class or disjoint-class "
            "mode, does not force a four-arc packing after bisector localization. "
            "The singleton arm is intentionally outside this audit."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=HERE / "split_robust_regression.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    rendered = json.dumps(build_report(), indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit("split robust regression artifact is stale")
        print("PASS: split robust completion regression replays exactly")
        return
    args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
