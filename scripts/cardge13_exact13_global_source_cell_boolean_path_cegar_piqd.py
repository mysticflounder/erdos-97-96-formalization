# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""PIQD CEGAR with incidence-minimal transitive row-equality paths."""

from __future__ import annotations

import argparse
import hashlib
import heapq
import itertools
import json
from collections import defaultdict
from pathlib import Path

import cardge13_exact13_global_source_cell_boolean_slice_piqd as boolean
import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_slice_piqd as sliced

SCHEMA = "cardge13-exact13-global-source-cell-boolean-path-cegar-piqd/v1"
Edge = tuple[int, int]


def equality_graph(
    cell: dict[str, object],
) -> dict[Edge, tuple[tuple[Edge, tuple[str, ...], dict[str, object]], ...]]:
    """Build the edge-distance graph justified by the decoded selected rows."""
    graph: dict[Edge, list[tuple[Edge, tuple[str, ...], dict[str, object]]]] = (
        defaultdict(list)
    )
    for name, center, support in base.cell_rows(cell):
        for left, right in itertools.combinations(support, 2):
            left_edge = base.distance_edge(center, left)
            right_edge = base.distance_edge(center, right)
            atoms = base.row_pin_atoms(name, center, (left, right))
            step = {
                "row": name,
                "center": center,
                "left_support": left,
                "right_support": right,
                "left_edge": left_edge,
                "right_edge": right_edge,
            }
            graph[left_edge].append((right_edge, atoms, step))
            reverse = dict(step)
            reverse.update(
                left_support=right,
                right_support=left,
                left_edge=right_edge,
                right_edge=left_edge,
            )
            graph[right_edge].append((left_edge, atoms, reverse))
    return {
        edge: tuple(
            sorted(neighbors, key=lambda item: (item[0], item[1], str(item[2])))
        )
        for edge, neighbors in graph.items()
    }


def shortest_incidence_path(
    graph: dict[Edge, tuple[tuple[Edge, tuple[str, ...], dict[str, object]], ...]],
    start: Edge,
    target: Edge,
) -> tuple[tuple[str, ...], tuple[dict[str, object], ...]] | None:
    """Find a deterministic low-incidence equality path between two edges."""
    if start == target:
        return (), ()
    serial = itertools.count()
    queue: list[
        tuple[int, int, tuple[str, ...], int, Edge, tuple[dict[str, object], ...]]
    ] = [(0, 0, (), next(serial), start, ())]
    best: dict[Edge, tuple[int, int]] = {start: (0, 0)}
    while queue:
        atom_count, step_count, atoms, _serial, edge, path = heapq.heappop(queue)
        if best.get(edge, (10**9, 10**9)) < (atom_count, step_count):
            continue
        if edge == target:
            return atoms, path
        for neighbor, step_atoms, step in graph.get(edge, ()):
            combined = tuple(sorted(set(atoms) | set(step_atoms)))
            cost = (len(combined), step_count + 1)
            if cost >= best.get(neighbor, (10**9, 10**9)):
                continue
            best[neighbor] = cost
            heapq.heappush(
                queue,
                (
                    cost[0],
                    cost[1],
                    combined,
                    next(serial),
                    neighbor,
                    (*path, step),
                ),
            )
    return None


def minimal_incidence_path_conflict(
    cell: dict[str, object], order: tuple[int, ...]
) -> dict[str, object] | None:
    """Find one Kalmanson form collapsed by a small explicit equality path."""
    graph = equality_graph(cell)
    best: tuple[tuple[object, ...], dict[str, object]] | None = None
    for form in base.kalmanson_forms(order):
        positive = form["positive"]
        negative = form["negative"]
        form_id = form["form"]
        if not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise TypeError("malformed Kalmanson edges")
        if not isinstance(form_id, tuple):
            raise TypeError("malformed Kalmanson form id")
        positive_edges = tuple(base.distance_edge(*edge) for edge in positive)
        for permutation in itertools.permutations(negative):
            negative_edges = tuple(base.distance_edge(*edge) for edge in permutation)
            paths = tuple(
                shortest_incidence_path(graph, left, right)
                for left, right in zip(positive_edges, negative_edges, strict=True)
            )
            if any(path is None for path in paths):
                continue
            concrete_paths = tuple(path for path in paths if path is not None)
            atoms = tuple(
                sorted({atom for path_atoms, _steps in concrete_paths for atom in path_atoms})
            )
            if not atoms:
                continue
            pairings = tuple(
                {
                    "left": left,
                    "right": right,
                    "steps": steps,
                }
                for left, right, (_path_atoms, steps) in zip(
                    positive_edges, negative_edges, concrete_paths, strict=True
                )
            )
            conflict = {
                "kind": "transitive-incidence-path",
                "form": form_id,
                "pairings": pairings,
                "atoms": atoms,
            }
            key: tuple[object, ...] = (
                len(atoms),
                sum(len(steps) for _path_atoms, steps in concrete_paths),
                form_id,
                negative_edges,
                atoms,
            )
            if best is None or key < best[0]:
                best = (key, conflict)
    return None if best is None else best[1]


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--pin-role", action="append", type=sliced.parse_role_pin, default=[])
    parser.add_argument("--pin-row", action="append", type=sliced.parse_row_pin, default=[])
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-refinements", type=int, default=500)
    args = parser.parse_args()

    role_pins, row_pins = sliced.normalize_pins(tuple(args.pin_role), tuple(args.pin_row))
    order = base.DIRECT_ORDER if args.orientation == "direct" else base.MIRROR_ORDER
    commands, bank = boolean.build_commands(
        order, tuple(role_pins.items()), tuple(row_pins.items())
    )
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)

    original_learner = base.minimal_linear_conflict
    base.minimal_linear_conflict = minimal_incidence_path_conflict
    try:
        solves = (
            base.run_piqd_chunked(
                args.out,
                commands,
                tuple(args.solver or ()),
                args.timeout_ms,
                label=f"cardge13-exact13-boolean-path-cegar-{args.orientation}",
                order=order,
                max_refinements=args.max_refinements,
            )
            if args.solver
            else []
        )
    finally:
        base.minimal_linear_conflict = original_learner

    report = {
        "schema": SCHEMA,
        "claim_boundary": (
            "source combinatorics plus direct conflicts and learned incidence-path "
            "Kalmanson clauses; no free distance variables"
        ),
        "orientation": args.orientation,
        "role_pins": role_pins,
        "row_pins": {name: list(support) for name, support in row_pins.items()},
        "order": list(order),
        "command_count": len(commands),
        "base_conflict_count": len(bank),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "solves": solves,
        "cegar_statuses": [solve.get("cegar_status") for solve in solves],
    }
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_bytes(canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "commands": len(commands),
                "base_conflicts": len(bank),
                "journal_sha256": report["journal_sha256"],
                "statuses": [row.get("solved", {}).get("status") for row in solves],
                "cegar_statuses": [row.get("cegar_status") for row in solves],
                "iterations": [len(row.get("iterations", ())) for row in solves],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
