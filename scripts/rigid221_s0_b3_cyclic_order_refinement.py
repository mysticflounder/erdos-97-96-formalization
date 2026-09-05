#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit directed-edge prefixes of the Rigid221 B3 cyclic-order block.

Each cell starts with the immutable 145-assertion Moser-disk prefix from the
exact-five factorization, then appends one to thirteen directed cyclic-edge
groups.  This module only serializes formulas; every solver call must go
through PiQD.
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

import rigid221_s0_b3_exactfive_factorization as factor
import rigid221_s0_blockerv_exactfive_probe as legacy
import rigid221_s0_blockerv_midpoint_order_probe as midpoint_order
import z3

RESULT_SCHEMA = "rigid221-s0-b3-cyclic-order-refinement-manifest/v1"
BASE_ASSERTIONS = factor.EXPECTED_CUMULATIVE_COUNTS[factor.ORDER_SENSITIVE_BLOCK_INDEX - 1]
EDGE_ASSERTIONS = len(legacy.ROLE_ORDER) - 2
EDGE_COUNT = len(legacy.ROLE_ORDER)
EXPECTED_CUMULATIVE_COUNTS = tuple(
    BASE_ASSERTIONS + EDGE_ASSERTIONS * edge_count
    for edge_count in range(1, EDGE_COUNT + 1)
)


class RefinementError(ValueError):
    """A cyclic-edge count, order contract, or serialization invariant failed."""


@dataclass(frozen=True)
class CellSpec:
    """One source-correct order and a nonempty prefix of its directed edges."""

    name: str
    order_cell: str
    order: tuple[str, ...]
    edge_prefix_count: int


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise RefinementError(message)


def directed_edges(order: tuple[str, ...]) -> tuple[tuple[str, str], ...]:
    """Return cyclic directed edges in the parent block's emission order."""

    return tuple((first, order[(index + 1) % len(order)]) for index, first in enumerate(order))


def _order_cells() -> Mapping[str, midpoint_order.MidpointOrderCell]:
    return {cell.name: cell for cell in midpoint_order.CELLS}


def cell_specs() -> tuple[CellSpec, ...]:
    """Return all 26 monotone directed-edge prefixes."""

    return tuple(
        CellSpec(
            name=f"06-cyclic-order-{order_cell.name}-edges-{edge_count:02d}",
            order_cell=order_cell.name,
            order=order_cell.order,
            edge_prefix_count=edge_count,
        )
        for order_cell in midpoint_order.CELLS
        for edge_count in range(1, EDGE_COUNT + 1)
    )


def _validate_cell(cell: CellSpec) -> None:
    orders = _order_cells()
    _require(cell.order_cell in orders, f"unknown order cell {cell.order_cell}")
    _require(cell.order == orders[cell.order_cell].order, "cell order differs from its named control")
    _require(1 <= cell.edge_prefix_count <= EDGE_COUNT, "edge prefix must be between 1 and 13")
    _require(
        midpoint_order.source_midpoint_order_holds(cell.order),
        "active order does not put v strictly between u and xu",
    )


def build_solver(cell: CellSpec, timeout_ms: int = 30_000) -> z3.Solver:
    """Build one refinement cell without invoking a solver backend."""

    _require(timeout_ms > 0, "timeout_ms must be positive")
    _validate_cell(cell)
    base_cell = factor.CellSpec(
        name=f"moser-disk-{cell.order_cell}",
        prefix_length=factor.ORDER_SENSITIVE_BLOCK_INDEX,
        order_cell=cell.order_cell,
        order=cell.order,
    )
    solver = factor.build_solver(base_cell, timeout_ms)
    points, _radii = legacy._symbols()
    for first, second in directed_edges(cell.order)[: cell.edge_prefix_count]:
        before = len(solver.assertions())
        for other in cell.order:
            if other not in {first, second}:
                solver.add(legacy._z3_orient(points[first], points[second], points[other]) > 0)
        added = len(solver.assertions()) - before
        _require(
            added == EDGE_ASSERTIONS,
            f"directed edge {first}->{second} emitted {added} assertions, expected {EDGE_ASSERTIONS}",
        )
    return solver


def export_smt2(
    cell: CellSpec,
    timeout_ms: int = 30_000,
    *,
    include_check_sat: bool = False,
) -> str:
    """Return deterministic flat QF_NRA bytes for one refinement cell."""

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


def _full_parent_formula(order_cell: midpoint_order.MidpointOrderCell) -> str:
    parent_cell = factor.CellSpec(
        name=f"06-cyclic-order-{order_cell.name}",
        prefix_length=factor.ORDER_SENSITIVE_BLOCK_INDEX + 1,
        order_cell=order_cell.name,
        order=order_cell.order,
    )
    return factor.export_smt2(parent_cell)


def static_check() -> dict[str, Any]:
    """Validate edge counts and endpoint bytes without solving."""

    _require(BASE_ASSERTIONS == 145, "parent Moser-disk prefix count changed")
    _require(EDGE_ASSERTIONS == 11, "directed-edge assertion count changed")
    _require(EDGE_COUNT == 13, "cyclic edge count changed")
    _require(
        EXPECTED_CUMULATIVE_COUNTS == tuple(range(156, 289, 11)),
        "cumulative directed-edge counts changed",
    )
    cells = cell_specs()
    _require(len(cells) == 26, "refinement cell count changed")
    formula_hashes: dict[str, str] = {}
    for cell in cells:
        formula = export_smt2(cell)
        expected = EXPECTED_CUMULATIVE_COUNTS[cell.edge_prefix_count - 1]
        parsed = z3.parse_smt2_string(formula)
        _require(len(parsed) == expected, f"SMT parser lost assertions for {cell.name}")
        _require(
            all(token not in formula for token in ("pbeq", "pbge", "pble")),
            f"{cell.name} contains a pseudo-Boolean operator",
        )
        if cell.edge_prefix_count == EDGE_COUNT:
            parent_formula = _full_parent_formula(_order_cells()[cell.order_cell])
            _require(
                formula == parent_formula,
                f"full {cell.order_cell} cyclic-order bytes differ from the parent factorization",
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


def _edge_ledger(order: tuple[str, ...]) -> tuple[dict[str, Any], ...]:
    return tuple(
        {
            "position": position,
            "from": first,
            "to": second,
            "against": [role for role in order if role not in {first, second}],
            "assertions": EDGE_ASSERTIONS,
        }
        for position, (first, second) in enumerate(directed_edges(order), start=1)
    )


def build_manifest(timeout_ms: int) -> tuple[dict[str, Any], dict[str, str]]:
    """Build the selected/omitted edge ledger and all query-free cells."""

    check = static_check()
    formulas: dict[str, str] = {}
    cells: list[dict[str, Any]] = []
    for cell in cell_specs():
        formula = export_smt2(cell, timeout_ms)
        formulas[cell.name] = formula
        ledger = _edge_ledger(cell.order)
        cells.append(
            {
                "name": cell.name,
                "order_cell": cell.order_cell,
                "order": list(cell.order),
                "edge_prefix_count": cell.edge_prefix_count,
                "assertions": EXPECTED_CUMULATIVE_COUNTS[cell.edge_prefix_count - 1],
                "formula_bytes": len(formula.encode()),
                "formula_sha256": hashlib.sha256(formula.encode()).hexdigest(),
                "selected_edges": list(ledger[: cell.edge_prefix_count]),
                "omitted_edges": list(ledger[cell.edge_prefix_count :]),
            }
        )
    manifest = {
        "schema": RESULT_SCHEMA,
        "scope": "bounded-fixed-order-cyclic-edge-prefixes",
        "verdict_scope": "formula-scoped-discovery",
        "cell_kind": "monotone-control",
        "direct_consumer": factor.DIRECT_CONSUMER,
        "solver_policy": "piqd-only",
        "static_check": check,
        "producer_sha256": _sha256_path(Path(__file__)),
        "parent_factorization_sha256": _sha256_path(Path(factor.__file__)),
        "base_probe_sha256": _sha256_path(Path(legacy.__file__)),
        "midpoint_order_probe_sha256": _sha256_path(Path(midpoint_order.__file__)),
        "base_prefix": {
            "blocks": [block.name for block in factor.BLOCKS[: factor.ORDER_SENSITIVE_BLOCK_INDEX]],
            "assertions": BASE_ASSERTIONS,
        },
        "directed_edge_assertions": EDGE_ASSERTIONS,
        "cells": cells,
        "global_omissions": [
            "source derivation of all global strict-turn inequalities",
            "coverage over every Moser normalization and cyclic order",
            "source realization of SAT assignments",
            "the exact-cap and deletion-multiplicity blocks",
            "Lean ingress and certificate replay",
        ],
    }
    return manifest, formulas


def emit_bundle(output_root: Path, timeout_ms: int) -> dict[str, Any]:
    """Write the ledger and query-free formulas below one caller-owned run root."""

    manifest, formulas = build_manifest(timeout_ms)
    for name, formula in formulas.items():
        _atomic_write(output_root / "artifacts" / "inputs" / f"{name}.smt2", formula)
    manifest_path = output_root / "cyclic_order_refinement_manifest.json"
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
