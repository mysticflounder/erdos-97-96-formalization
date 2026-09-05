#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit individual strict-turn prefixes for the second B3 cyclic edge.

Each cell starts with the immutable 156-assertion prefix that completes the
first directed edge O->au, then appends one through eleven strict turns for
the second directed edge au->av. This module only serializes formulas; every
solver call must go through PiQD.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import rigid221_s0_b3_cyclic_order_refinement as edge_refinement
import rigid221_s0_b3_exactfive_factorization as factor
import rigid221_s0_blockerv_exactfive_probe as legacy
import rigid221_s0_blockerv_midpoint_order_probe as midpoint_order
import z3

RESULT_SCHEMA = "rigid221-s0-b3-cyclic-edge-turn-refinement-manifest/v1"
BASE_EDGE_PREFIX_COUNT = 1
REFINED_EDGE_POSITION = 2
BASE_ASSERTIONS = edge_refinement.EXPECTED_CUMULATIVE_COUNTS[BASE_EDGE_PREFIX_COUNT - 1]
TURN_ASSERTIONS = edge_refinement.EDGE_ASSERTIONS
EXPECTED_CUMULATIVE_COUNTS = tuple(
    BASE_ASSERTIONS + turn_count for turn_count in range(1, TURN_ASSERTIONS + 1)
)


class RefinementError(ValueError):
    """A turn count, order contract, or serialization invariant failed."""


@dataclass(frozen=True)
class CellSpec:
    """One source-correct order and a nonempty second-edge turn prefix."""

    name: str
    order_cell: str
    order: tuple[str, ...]
    turn_prefix_count: int


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise RefinementError(message)


def _order_cells() -> Mapping[str, midpoint_order.MidpointOrderCell]:
    return {cell.name: cell for cell in midpoint_order.CELLS}


def refined_edge(order: tuple[str, ...]) -> tuple[str, str]:
    """Return the second directed edge in the parent's cyclic emission order."""

    return edge_refinement.directed_edges(order)[REFINED_EDGE_POSITION - 1]


def turn_roles(order: tuple[str, ...]) -> tuple[str, ...]:
    """Return third roles for the second edge in original emission order."""

    first, second = refined_edge(order)
    return tuple(other for other in order if other not in {first, second})


def cell_specs() -> tuple[CellSpec, ...]:
    """Return all 22 monotone second-edge turn prefixes."""

    return tuple(
        CellSpec(
            name=(
                f"06-cyclic-order-{order_cell.name}-edge-02-turns-"
                f"{turn_count:02d}"
            ),
            order_cell=order_cell.name,
            order=order_cell.order,
            turn_prefix_count=turn_count,
        )
        for order_cell in midpoint_order.CELLS
        for turn_count in range(1, TURN_ASSERTIONS + 1)
    )


def _validate_cell(cell: CellSpec) -> None:
    orders = _order_cells()
    _require(cell.order_cell in orders, f"unknown order cell {cell.order_cell}")
    _require(cell.order == orders[cell.order_cell].order, "cell order differs from its named control")
    _require(
        1 <= cell.turn_prefix_count <= TURN_ASSERTIONS,
        "turn prefix must be between 1 and 11",
    )
    _require(
        midpoint_order.source_midpoint_order_holds(cell.order),
        "active order does not put v strictly between u and xu",
    )
    _require(
        edge_refinement.directed_edges(cell.order)[0] == ("O", "au"),
        "first directed edge changed from O->au",
    )
    _require(refined_edge(cell.order) == ("au", "av"), "second directed edge changed from au->av")
    _require(len(turn_roles(cell.order)) == TURN_ASSERTIONS, "second edge no longer has eleven turns")


def _base_cell(cell: CellSpec) -> edge_refinement.CellSpec:
    return edge_refinement.CellSpec(
        name=f"06-cyclic-order-{cell.order_cell}-edges-01",
        order_cell=cell.order_cell,
        order=cell.order,
        edge_prefix_count=BASE_EDGE_PREFIX_COUNT,
    )


def _turn_assertion(
    points: Mapping[str, tuple[z3.ArithRef, z3.ArithRef]],
    first: str,
    second: str,
    other: str,
) -> z3.BoolRef:
    return legacy._z3_orient(points[first], points[second], points[other]) > 0


def build_solver(cell: CellSpec, timeout_ms: int = 30_000) -> z3.Solver:
    """Build one turn-refinement cell without invoking a solver backend."""

    _require(timeout_ms > 0, "timeout_ms must be positive")
    _validate_cell(cell)
    solver = edge_refinement.build_solver(_base_cell(cell), timeout_ms)
    points, _radii = legacy._symbols()
    first, second = refined_edge(cell.order)
    for other in turn_roles(cell.order)[: cell.turn_prefix_count]:
        before = len(solver.assertions())
        solver.add(_turn_assertion(points, first, second, other))
        added = len(solver.assertions()) - before
        _require(added == 1, f"turn against {other} emitted {added} assertions, expected one")
    return solver


def export_smt2(
    cell: CellSpec,
    timeout_ms: int = 30_000,
    *,
    include_check_sat: bool = False,
) -> str:
    """Return deterministic flat QF_NRA bytes for one turn-refinement cell."""

    solver = build_solver(cell, timeout_ms)
    declaration_lines = sorted(
        line.strip()
        for line in solver.to_smt2().splitlines()
        if line.strip().startswith("(declare-fun ")
    )
    assertions = [f"(assert {assertion.sexpr()})" for assertion in solver.assertions()]
    commands = ["(set-logic QF_NRA)", *declaration_lines, *assertions]
    if include_check_sat:
        commands.append("(check-sat)")
    return "\n".join(commands) + "\n"


def _edge_two_parent_formula(order_cell: midpoint_order.MidpointOrderCell) -> str:
    parent_cell = edge_refinement.CellSpec(
        name=f"06-cyclic-order-{order_cell.name}-edges-02",
        order_cell=order_cell.name,
        order=order_cell.order,
        edge_prefix_count=REFINED_EDGE_POSITION,
    )
    return edge_refinement.export_smt2(parent_cell)


def _assertion_sexprs(solver: z3.Solver) -> tuple[str, ...]:
    return tuple(assertion.sexpr() for assertion in solver.assertions())


def _expected_turn_sexprs(order: tuple[str, ...]) -> tuple[str, ...]:
    points, _radii = legacy._symbols()
    first, second = refined_edge(order)
    return tuple(
        _turn_assertion(points, first, second, other).sexpr() for other in turn_roles(order)
    )


def static_check() -> dict[str, Any]:
    """Validate turn counts, append order, and endpoint bytes without solving."""

    _require(BASE_ASSERTIONS == 156, "complete first-edge prefix count changed")
    _require(TURN_ASSERTIONS == 11, "second-edge turn count changed")
    _require(
        EXPECTED_CUMULATIVE_COUNTS == tuple(range(157, 168)),
        "cumulative strict-turn counts changed",
    )
    cells = cell_specs()
    _require(len(cells) == 22, "turn-refinement cell count changed")
    formula_hashes: dict[str, str] = {}
    previous_by_order: dict[str, tuple[str, ...]] = {}
    for cell in cells:
        formula = export_smt2(cell)
        expected_count = EXPECTED_CUMULATIVE_COUNTS[cell.turn_prefix_count - 1]
        parsed = z3.parse_smt2_string(formula)
        _require(len(parsed) == expected_count, f"SMT parser lost assertions for {cell.name}")
        _require(
            all(token not in formula for token in ("pbeq", "pbge", "pble")),
            f"{cell.name} contains a pseudo-Boolean operator",
        )
        assertions = _assertion_sexprs(build_solver(cell))
        base_assertions = _assertion_sexprs(edge_refinement.build_solver(_base_cell(cell)))
        _require(assertions[:BASE_ASSERTIONS] == base_assertions, f"{cell.name} changed its base prefix")
        _require(
            assertions[BASE_ASSERTIONS:] == _expected_turn_sexprs(cell.order)[: cell.turn_prefix_count],
            f"{cell.name} changed second-edge turn order",
        )
        previous = previous_by_order.get(cell.order_cell, base_assertions)
        _require(assertions[:-1] == previous, f"{cell.name} did not append exactly one assertion")
        previous_by_order[cell.order_cell] = assertions
        if cell.turn_prefix_count == TURN_ASSERTIONS:
            parent_formula = _edge_two_parent_formula(_order_cells()[cell.order_cell])
            _require(
                formula == parent_formula,
                f"full {cell.order_cell} second-edge bytes differ from the run-0002 producer",
            )
            formula_hashes[cell.order_cell] = hashlib.sha256(formula.encode()).hexdigest()
    return {
        "status": "STATIC_CHECK_OK",
        "cells": len(cells),
        "full_formula_sha256": formula_hashes,
    }


def _sha256_path(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _canonical_json(value: object, *, pretty: bool) -> str:
    return json.dumps(value, indent=2 if pretty else None, sort_keys=True) + "\n"


def _atomic_write(path: Path, contents: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile("w", encoding="utf-8", dir=path.parent, delete=False) as handle:
        handle.write(contents)
        temporary = Path(handle.name)
    os.replace(temporary, path)


def _turn_ledger(order: tuple[str, ...]) -> tuple[dict[str, Any], ...]:
    points, _radii = legacy._symbols()
    first, second = refined_edge(order)
    return tuple(
        {
            "position": position,
            "from": first,
            "to": second,
            "against": other,
            "assertion": assertion.sexpr(),
            "assertion_sha256": hashlib.sha256(assertion.sexpr().encode()).hexdigest(),
        }
        for position, other in enumerate(turn_roles(order), start=1)
        for assertion in (_turn_assertion(points, first, second, other),)
    )


def build_manifest(timeout_ms: int) -> tuple[dict[str, Any], dict[str, str]]:
    """Build the selected/omitted turn ledger and all query-free cells."""

    check = static_check()
    formulas: dict[str, str] = {}
    cells: list[dict[str, Any]] = []
    for cell in cell_specs():
        formula = export_smt2(cell, timeout_ms)
        formulas[cell.name] = formula
        ledger = _turn_ledger(cell.order)
        first, second = refined_edge(cell.order)
        cells.append(
            {
                "name": cell.name,
                "order_cell": cell.order_cell,
                "order": list(cell.order),
                "refined_edge": {"position": REFINED_EDGE_POSITION, "from": first, "to": second},
                "turn_prefix_count": cell.turn_prefix_count,
                "assertions": EXPECTED_CUMULATIVE_COUNTS[cell.turn_prefix_count - 1],
                "formula_bytes": len(formula.encode()),
                "formula_sha256": hashlib.sha256(formula.encode()).hexdigest(),
                "selected_turns": list(ledger[: cell.turn_prefix_count]),
                "omitted_turns": list(ledger[cell.turn_prefix_count :]),
            }
        )
    manifest = {
        "schema": RESULT_SCHEMA,
        "scope": "bounded-fixed-order-second-edge-turn-prefixes",
        "verdict_scope": "formula-scoped-discovery",
        "cell_kind": "monotone-control",
        "direct_consumer": factor.DIRECT_CONSUMER,
        "solver_policy": "piqd-only",
        "static_check": check,
        "producer_sha256": _sha256_path(Path(__file__)),
        "parent_edge_refinement_sha256": _sha256_path(Path(edge_refinement.__file__)),
        "parent_factorization_sha256": _sha256_path(Path(factor.__file__)),
        "base_probe_sha256": _sha256_path(Path(legacy.__file__)),
        "midpoint_order_probe_sha256": _sha256_path(Path(midpoint_order.__file__)),
        "base_prefix": {
            "parent_edge_prefix_count": BASE_EDGE_PREFIX_COUNT,
            "completed_edge": {"position": 1, "from": "O", "to": "au"},
            "assertions": BASE_ASSERTIONS,
        },
        "refined_edge_position": REFINED_EDGE_POSITION,
        "turn_assertions": TURN_ASSERTIONS,
        "cells": cells,
        "global_omissions": [
            "source derivation of the selected global strict-turn inequalities",
            "the remaining directed cyclic edges after au->av",
            "coverage over every Moser normalization and cyclic order",
            "source realization of SAT assignments",
            "the exact-cap and deletion-multiplicity blocks",
            "Lean ingress and certificate replay",
        ],
    }
    return manifest, formulas


def emit_bundle(output_root: Path, timeout_ms: int) -> dict[str, Any]:
    """Write the turn ledger and query-free formulas below a caller-owned root."""

    manifest, formulas = build_manifest(timeout_ms)
    for name, formula in formulas.items():
        _atomic_write(output_root / "artifacts" / "inputs" / f"{name}.smt2", formula)
    manifest_path = output_root / "cyclic_edge_turn_refinement_manifest.json"
    _atomic_write(manifest_path, _canonical_json(manifest, pretty=True))
    return {
        "status": "EMITTED",
        "cells": len(formulas),
        "manifest": str(manifest_path),
        "manifest_sha256": _sha256_path(manifest_path),
    }


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    action = parser.add_mutually_exclusive_group(required=True)
    action.add_argument("--output-root", type=Path)
    action.add_argument("--check", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--verbose", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    if args.timeout_ms <= 0:
        raise SystemExit("--timeout-ms must be positive")
    try:
        result = static_check() if args.check else emit_bundle(args.output_root, args.timeout_ms)
    except (RefinementError, OSError, z3.Z3Exception) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2
    if args.verbose:
        print(_canonical_json(result, pretty=True), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
