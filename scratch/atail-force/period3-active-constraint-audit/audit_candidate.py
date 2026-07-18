#!/usr/bin/env python3
"""Name and rank every margin of a saved period-three Euclidean candidate.

This is a replay/audit tool, not an optimizer.  It consumes the JSON printed by
one of the search scripts in ``../cycle-three-rows-euclidean`` and recomputes
all margins from the saved parameter vector.  ``--example-seed`` is only a
smoke test for the label ledger; it does not reproduce a search result.
"""

from __future__ import annotations

import argparse
import importlib
import json
from pathlib import Path
import sys

import numpy as np


HERE = Path(__file__).resolve().parent
SEARCH_DIR = HERE.parent / "cycle-three-rows-euclidean"
sys.path.insert(0, str(SEARCH_DIR))

CORE_CAP_NAMES = ("q0", "c0", "c2", "q1", "c1", "q2")
ROW_PAIRS = ((0, 1), (1, 2), (2, 0))


def load_module(name: str):
    return importlib.import_module(name)


def load_parameters(path: Path) -> np.ndarray:
    payload = json.loads(path.read_text())
    if isinstance(payload, list):
        return np.array(payload, dtype=float)
    result = payload.get("result", payload)
    parameters = result.get("parameters")
    if parameters is None:
        raise SystemExit(
            f"{path} has no result.parameters vector; a scalar checkpoint "
            "cannot be replayed"
        )
    return np.array(parameters, dtype=float)


def source_labels(group_name: str) -> list[str]:
    return [
        f"{group_name}:left<q0",
        f"{group_name}:q0<q1",
        f"{group_name}:q1<q2",
        f"{group_name}:q2<right",
        f"{group_name}:apex<=pi/2",
    ]


def hull_labels(
    points: dict[str, np.ndarray], order: tuple[str, ...]
) -> list[str]:
    labels: list[str] = []
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        for name in points:
            if name not in (first, second):
                labels.append(f"strict_hull:edge={first}->{second}:left={name}")
    return labels


def pairwise_labels(points: dict[str, np.ndarray]) -> list[str]:
    names = tuple(points)
    return [
        f"pairwise_distinct:{names[i]}!={names[j]}"
        for i in range(len(names))
        for j in range(i)
    ]


def physical_exact_labels(points: dict[str, np.ndarray]) -> list[str]:
    support = {"left", "q0", "q1", "q2", "right"}
    return [
        f"physical_exact_class:{name}!~o"
        for name in points
        if name not in support and name != "o"
    ]


def row_exclusion_labels(
    points: dict[str, np.ndarray], supports: tuple[set[str], set[str], set[str]]
) -> list[str]:
    labels: list[str] = []
    for row, support in enumerate(supports):
        for name in points:
            if name not in support and name != f"c{row}":
                labels.append(f"row_exact_class_exclusions:row={row}:exclude={name}")
    return labels


def base_labels(
    points: dict[str, np.ndarray],
    order: tuple[str, ...],
    source_group: str,
    target_names: tuple[str, ...],
) -> dict[str, list[str]]:
    return {
        source_group: source_labels(source_group),
        "strict_hull": hull_labels(points, order),
        "outside_cap_side": [
            f"outside_cap_side:{name}" for name in ("o", *target_names)
        ],
        "physical_cap_side": [
            f"physical_cap_side:{name}" for name in CORE_CAP_NAMES
        ],
        "mec_containment": [
            f"mec_containment:{name}"
            for name in points
            if name not in ("o", "left", "right")
        ],
        "pairwise_distinct": pairwise_labels(points),
    }


def exact_labels(
    points: dict[str, np.ndarray],
    supports: tuple[set[str], set[str], set[str]],
) -> dict[str, list[str]]:
    return {
        "physical_exact_class": physical_exact_labels(points),
        "row_exact_class_exclusions": row_exclusion_labels(points, supports),
        "parameterized_equality_gate": ["parameterized_equality_gate:max_error"],
    }


def six_target(parameters: np.ndarray):
    module = load_module("search_cycle_three_rows")
    result = module.evaluate(parameters)
    targets = ("x00", "x01", "x10", "x11", "x20", "x21")
    supports = tuple(
        {
            f"q{first}",
            f"q{second}",
            f"x{row}0",
            f"x{row}1",
        }
        for row, (first, second) in enumerate(ROW_PAIRS)
    )
    labels = base_labels(
        result.points, result.order, "source_angle_order", targets
    )
    labels.update(
        {
            "physical_exact_class_audit": physical_exact_labels(result.points),
            "row_exact_class_exclusions_audit": row_exclusion_labels(
                result.points, supports
            ),
            "parameterized_equalities_audit": [
                f"parameterized_equalities_audit:row={row}:target=x{row}{slot}"
                for row in range(3)
                for slot in range(2)
            ],
        }
    )
    return result.groups, labels, result.order


def triangle(parameters: np.ndarray):
    module = load_module("search_three_target_cycle")
    result = module.evaluate(parameters)
    targets = ("z01", "z12", "z20")
    supports = (
        {"q0", "q1", "z01", "z20"},
        {"q1", "q2", "z01", "z12"},
        {"q2", "q0", "z12", "z20"},
    )
    labels = base_labels(result.points, result.order, "source_order", targets)
    labels.update(exact_labels(result.points, supports))
    groups = {**result.search_groups, **result.audit_groups}
    return groups, labels, result.order


def partial(parameters: np.ndarray, schema: str, pivot: int):
    module = load_module("search_partial_overlap")
    result = module.evaluate(parameters, schema, pivot)
    _, supports = module.construct(parameters, schema, pivot)
    targets = tuple(name for name in result.points if name[0] in ("s", "u"))
    labels = base_labels(result.points, result.order, "source_order", targets)
    labels.update(exact_labels(result.points, supports))
    groups = {**result.search_groups, **result.audit_groups}
    return groups, labels, result.order


def star(parameters: np.ndarray):
    module = load_module("search_four_target_star")
    result = module.evaluate(parameters)
    targets = ("z", "u0", "u1", "u2")
    supports = (
        {"q0", "q1", "z", "u0"},
        {"q1", "q2", "z", "u1"},
        {"q2", "q0", "z", "u2"},
    )
    labels = base_labels(result.points, result.order, "source_order", targets)
    labels["blocker_multiplier_box"] = [
        *(f"blocker_multiplier_box:lambda{row}>=0.44" for row in range(3)),
        *(f"blocker_multiplier_box:lambda{row}<=0.64" for row in range(3)),
    ]
    labels.update(exact_labels(result.points, supports))
    groups = {**result.search_groups, **result.audit_groups}
    return groups, labels, result.order


def example_parameters(schema: str) -> np.ndarray:
    if schema == "six-disjoint":
        return load_module("search_cycle_three_rows").exact_complete_row_seed()
    if schema == "triangle":
        return np.array(
            [1.45, 0.08, 0.85, 1.28, 0.52, 0.53, 0.54], dtype=float
        )
    if schema == "four-path":
        return load_module("search_partial_overlap").seed_parameters("four-path")
    if schema == "five-one-overlap":
        return load_module("search_partial_overlap").seed_parameters(
            "five-one-overlap"
        )
    if schema == "four-star":
        return np.array(
            [1.45, 0.08, 0.85, 1.28, 0.6, -0.1, -0.5, -1.0, 2.2],
            dtype=float,
        )
    raise ValueError(schema)


def evaluate(schema: str, parameters: np.ndarray, pivot: int):
    if schema == "six-disjoint":
        return six_target(parameters)
    if schema == "triangle":
        return triangle(parameters)
    if schema in ("four-path", "five-one-overlap"):
        return partial(parameters, schema, pivot)
    if schema == "four-star":
        return star(parameters)
    raise ValueError(schema)


def flatten(
    groups: dict[str, list[float]], labels: dict[str, list[str]]
) -> list[dict[str, float | str]]:
    rows: list[dict[str, float | str]] = []
    for group, values in groups.items():
        names = labels.get(group)
        if names is None:
            raise AssertionError(f"missing labels for group {group}")
        if len(names) != len(values):
            raise AssertionError(
                f"{group}: {len(values)} margins but {len(names)} labels"
            )
        rows.extend(
            {"group": group, "constraint": name, "margin": float(value)}
            for name, value in zip(names, values, strict=True)
        )
    return sorted(rows, key=lambda row: float(row["margin"]))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--schema",
        required=True,
        choices=(
            "triangle",
            "four-path",
            "four-star",
            "five-one-overlap",
            "six-disjoint",
        ),
    )
    parser.add_argument("--pivot", type=int, choices=range(3), default=0)
    parser.add_argument("--input", type=Path)
    parser.add_argument("--example-seed", action="store_true")
    parser.add_argument("--limit", type=int, default=20)
    args = parser.parse_args()
    if (args.input is None) == (not args.example_seed):
        raise SystemExit("choose exactly one of --input or --example-seed")
    parameters = (
        example_parameters(args.schema)
        if args.example_seed
        else load_parameters(args.input)
    )
    groups, labels, order = evaluate(args.schema, parameters, args.pivot)
    rows = flatten(groups, labels)
    print(
        json.dumps(
            {
                "schema": args.schema,
                "pivot": args.pivot if "path" in args.schema or "overlap" in args.schema else None,
                "replay_only": True,
                "cyclic_order": list(order),
                "parameters": parameters.tolist(),
                "minimum_margin": rows[0]["margin"],
                "ranked_constraints": rows[: args.limit],
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
