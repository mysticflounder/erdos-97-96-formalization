# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""PIQD CEGAR with incidence paths for one- and two-form cancellations."""

from __future__ import annotations

import itertools

import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as path_cegar
import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-global-source-cell-boolean-path-pair-cegar-piqd/v1"
ONE_FORM_LEARNER = path_cegar.minimal_incidence_path_conflict


def form_by_id(
    order: tuple[int, ...], form_id: tuple[int, ...]
) -> dict[str, object]:
    """Recover one generated strict-form record from its stable identifier."""
    for form in base.kalmanson_forms(order):
        if form["form"] == form_id:
            return form
    raise ValueError(f"unknown Kalmanson form id: {form_id}")


def incidence_minimize_pair_conflict(
    cell: dict[str, object],
    order: tuple[int, ...],
    conflict: dict[str, object],
) -> dict[str, object]:
    """Replace full row pins by the incidences used by four equality paths."""
    raw_forms = conflict.get("forms")
    if not isinstance(raw_forms, tuple) or len(raw_forms) != 2:
        raise TypeError("two-form conflict has malformed form identifiers")
    form_ids = tuple(tuple(int(value) for value in form) for form in raw_forms)
    forms = tuple(form_by_id(order, form_id) for form_id in form_ids)
    left_edges = tuple(
        base.distance_edge(*edge)
        for form in forms
        for edge in form["positive"]  # type: ignore[union-attr]
    )
    right_edges = tuple(
        base.distance_edge(*edge)
        for form in forms
        for edge in form["negative"]  # type: ignore[union-attr]
    )
    graph = path_cegar.equality_graph(cell)
    best: tuple[tuple[object, ...], dict[str, object]] | None = None
    for permutation in itertools.permutations(right_edges):
        paths = tuple(
            path_cegar.shortest_incidence_path(graph, left, right)
            for left, right in zip(left_edges, permutation, strict=True)
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
            {"left": left, "right": right, "steps": steps}
            for left, right, (_path_atoms, steps) in zip(
                left_edges, permutation, concrete_paths, strict=True
            )
        )
        minimized = {
            "kind": "two-form-incidence-path",
            "forms": form_ids,
            "pairings": pairings,
            "atoms": atoms,
        }
        key: tuple[object, ...] = (
            len(atoms),
            sum(len(steps) for _path_atoms, steps in concrete_paths),
            permutation,
            atoms,
        )
        if best is None or key < best[0]:
            best = (key, minimized)
    if best is None:
        raise RuntimeError("row-minimal two-form conflict has no incidence pairing")
    return best[1]


def minimal_incidence_linear_conflict(
    cell: dict[str, object], order: tuple[int, ...]
) -> dict[str, object] | None:
    """Prefer one-form paths, then incidence-minimize a two-form cancellation."""
    one_form = ONE_FORM_LEARNER(cell, order)
    if one_form is not None:
        return one_form
    pair = base.minimal_pair_cancellation_conflict(cell, order)
    if pair is None:
        return None
    return incidence_minimize_pair_conflict(cell, order, pair)


def main() -> int:
    """Run the path CEGAR CLI with the stronger one-or-two-form learner."""
    original_learner = path_cegar.minimal_incidence_path_conflict
    original_schema = path_cegar.SCHEMA
    path_cegar.minimal_incidence_path_conflict = minimal_incidence_linear_conflict
    path_cegar.SCHEMA = SCHEMA
    try:
        return path_cegar.main()
    finally:
        path_cegar.minimal_incidence_path_conflict = original_learner
        path_cegar.SCHEMA = original_schema


if __name__ == "__main__":
    raise SystemExit(main())
