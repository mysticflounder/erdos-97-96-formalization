#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Emit source-traceable prefixes of the Rigid221 B3 exact-five probe.

The historical 1,020-assertion formula is preserved as a byte-regression
target.  Active cells use the two source-consistent strict-cap orders from
``rigid221_s0_blockerv_midpoint_order_probe`` and add one constraint block at
a time.  This module only serializes formulas; every solver call must go
through PiQD.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections.abc import Callable, Iterator, Mapping, Sequence
from contextlib import contextmanager
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Any

import rigid221_s0_blockerv_exactfive_probe as legacy
import rigid221_s0_blockerv_midpoint_order_probe as midpoint_order
import z3

RESULT_SCHEMA = "rigid221-s0-b3-exactfive-factor-manifest/v1"
DIRECT_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure."
    "false_of_exactFourMutualOmissionRigid221_physicalApex_"
    "sourceEqU_blockerV_sourceRowHeavy"
)


class FactorizationError(ValueError):
    """A block count, order contract, or serialization invariant failed."""


@dataclass(frozen=True)
class ConstraintBlock:
    """One append-only group in the exact-five formula."""

    name: str
    expected_assertions: int
    clause_class: str
    entitlement: str
    description: str


@dataclass(frozen=True)
class BuildContext:
    """Shared Z3 symbols for one factorized cell."""

    points: Mapping[str, legacy.Z3Point]
    rho2: z3.ArithRef
    source_radius2: z3.ArithRef
    opposite_radius2: z3.ArithRef


@dataclass(frozen=True)
class CellSpec:
    """One monotone prefix and its selected cyclic-order control."""

    name: str
    prefix_length: int
    order_cell: str
    order: tuple[str, ...]


BLOCKS = (
    ConstraintBlock(
        "gauge",
        9,
        "ASSUMPTION_CONTROL",
        "fixed-cell-control",
        "positive radii and the rational Moser coordinates",
    ),
    ConstraintBlock(
        "role-distinctness",
        78,
        "ASSUMPTION_CONTROL",
        "fixed-cell-control",
        "pairwise distinctness of all thirteen modeled roles",
    ),
    ConstraintBlock(
        "physical-fiber",
        13,
        "ROOT_STATIC",
        "mixed-source-and-finite-closure",
        "the exact five-point physical fiber at O",
    ),
    ConstraintBlock(
        "source-fiber",
        13,
        "ROOT_STATIC",
        "mixed-source-and-finite-closure",
        "the exact source row centered literally at v",
    ),
    ConstraintBlock(
        "opposite-fiber",
        13,
        "ROOT_STATIC",
        "mixed-source-and-finite-closure",
        "the exact v-indexed row centered at cv",
    ),
    ConstraintBlock(
        "moser-disk",
        19,
        "ASSUMPTION_CONTROL",
        "fixed-cell-control",
        "MEC disk, boundary triple, and non-obtuse Moser triangle",
    ),
    ConstraintBlock(
        "cyclic-order",
        143,
        "ASSUMPTION_CONTROL",
        "source-consistent-fixed-order-control",
        "one complete strict cyclic order with v between u and xu",
    ),
    ConstraintBlock(
        "exact-cap",
        72,
        "ASSUMPTION_CONTROL",
        "selected-branch-and-fixed-cap-control",
        "cap endpoint patterns, one-hot arms, and J = {u, xu, v}",
    ),
    ConstraintBlock(
        "source-deletion-multiplicity",
        330,
        "ROOT_STATIC",
        "modeled-source-consequence",
        "no q-free four-point fiber at v after deleting u",
    ),
    ConstraintBlock(
        "opposite-deletion-multiplicity",
        330,
        "ROOT_STATIC",
        "modeled-source-consequence",
        "no q-free four-point fiber at cv after deleting v",
    ),
)

EXPECTED_CUMULATIVE_COUNTS = (9, 87, 100, 113, 126, 145, 288, 360, 690, 1020)
ORDER_SENSITIVE_BLOCK_INDEX = 6


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise FactorizationError(message)


@contextmanager
def _using_order(order: tuple[str, ...]) -> Iterator[None]:
    """Temporarily select one order without changing the archived default."""

    previous = legacy.ORDER
    try:
        legacy.ORDER = order
        yield
    finally:
        legacy.ORDER = previous


def _add_gauge(solver: z3.Solver, context: BuildContext) -> None:
    solver.add(context.rho2 > 0, context.source_radius2 > 0, context.opposite_radius2 > 0)
    for role, point in legacy.FIXED_POINTS.items():
        solver.add(context.points[role][0] == legacy._z3_rat(point[0]))
        solver.add(context.points[role][1] == legacy._z3_rat(point[1]))


def _add_role_distinctness(solver: z3.Solver, context: BuildContext) -> None:
    for left, right in combinations(legacy.ROLE_ORDER, 2):
        solver.add(
            z3.Or(
                context.points[left][0] != context.points[right][0],
                context.points[left][1] != context.points[right][1],
            )
        )


def _add_physical_fiber(solver: z3.Solver, context: BuildContext) -> None:
    legacy._add_exact_fiber(solver, context.points, "O", context.rho2, legacy.PHYSICAL)


def _add_source_fiber(solver: z3.Solver, context: BuildContext) -> None:
    legacy._add_exact_fiber(
        solver,
        context.points,
        "v",
        context.source_radius2,
        legacy.SOURCE_ROW,
    )


def _add_opposite_fiber(solver: z3.Solver, context: BuildContext) -> None:
    legacy._add_exact_fiber(
        solver,
        context.points,
        "cv",
        context.opposite_radius2,
        legacy.OPPOSITE_ROW,
    )


def _add_moser_disk(solver: z3.Solver, context: BuildContext) -> None:
    mec = (legacy._z3_rat(legacy.MEC_CENTER[0]), legacy._z3_rat(legacy.MEC_CENTER[1]))
    for role in legacy.ROLE_ORDER:
        solver.add(
            legacy._z3_dist2(mec, context.points[role]) <= legacy._z3_rat(legacy.MEC_RADIUS2)
        )
    for role in legacy.MOSER:
        solver.add(
            legacy._z3_dist2(mec, context.points[role]) == legacy._z3_rat(legacy.MEC_RADIUS2)
        )
    m1, m2, o = (context.points[role] for role in legacy.MOSER)
    solver.add(legacy._z3_dot(legacy._z3_sub(m2, m1), legacy._z3_sub(o, m1)) >= 0)
    solver.add(legacy._z3_dot(legacy._z3_sub(o, m2), legacy._z3_sub(m1, m2)) >= 0)
    solver.add(legacy._z3_dot(legacy._z3_sub(m1, o), legacy._z3_sub(m2, o)) >= 0)


def _add_cyclic_order(
    solver: z3.Solver,
    context: BuildContext,
    order: tuple[str, ...],
) -> None:
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        for other in order:
            if other not in {first, second}:
                solver.add(legacy._z3_orient(context.points[first], context.points[second], context.points[other]) > 0)


def _add_exact_cap(
    solver: z3.Solver,
    context: BuildContext,
    order: tuple[str, ...],
) -> None:
    with _using_order(order):
        legacy._add_cap_constraints(solver, context.points)


def _add_source_deletion(solver: z3.Solver, context: BuildContext) -> None:
    legacy._add_no_qfree(solver, context.points, "v", "u")


def _add_opposite_deletion(solver: z3.Solver, context: BuildContext) -> None:
    legacy._add_no_qfree(solver, context.points, "cv", "v")


BlockBuilder = Callable[[z3.Solver, BuildContext, tuple[str, ...]], None]


def _without_order(builder: Callable[[z3.Solver, BuildContext], None]) -> BlockBuilder:
    def wrapped(
        solver: z3.Solver,
        context: BuildContext,
        _order: tuple[str, ...],
    ) -> None:
        builder(solver, context)

    return wrapped


BLOCK_BUILDERS: tuple[BlockBuilder, ...] = (
    _without_order(_add_gauge),
    _without_order(_add_role_distinctness),
    _without_order(_add_physical_fiber),
    _without_order(_add_source_fiber),
    _without_order(_add_opposite_fiber),
    _without_order(_add_moser_disk),
    _add_cyclic_order,
    _add_exact_cap,
    _without_order(_add_source_deletion),
    _without_order(_add_opposite_deletion),
)


def cell_specs() -> tuple[CellSpec, ...]:
    """Return the fourteen non-duplicate monotone cells."""

    cells: list[CellSpec] = []
    for index, block in enumerate(BLOCKS):
        prefix_length = index + 1
        if index < ORDER_SENSITIVE_BLOCK_INDEX:
            cells.append(
                CellSpec(
                    name=f"{index:02d}-{block.name}",
                    prefix_length=prefix_length,
                    order_cell="common",
                    order=legacy.ORDER,
                )
            )
            continue
        for order_cell in midpoint_order.CELLS:
            cells.append(
                CellSpec(
                    name=f"{index:02d}-{block.name}-{order_cell.name}",
                    prefix_length=prefix_length,
                    order_cell=order_cell.name,
                    order=order_cell.order,
                )
            )
    return tuple(cells)


def build_solver(cell: CellSpec, timeout_ms: int = 30_000) -> z3.Solver:
    """Build one prefix without invoking a solver backend."""

    _require(timeout_ms > 0, "timeout_ms must be positive")
    _require(1 <= cell.prefix_length <= len(BLOCKS), "invalid block prefix length")
    if cell.prefix_length > ORDER_SENSITIVE_BLOCK_INDEX and cell.order_cell != "legacy":
        _require(
            midpoint_order.source_midpoint_order_holds(cell.order),
            "active order does not put v strictly between u and xu",
        )
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", timeout_ms)
    points, radii = legacy._symbols()
    context = BuildContext(points, radii[0], radii[1], radii[2])
    for index, (block, builder) in enumerate(zip(BLOCKS, BLOCK_BUILDERS, strict=True)):
        if index >= cell.prefix_length:
            break
        before = len(solver.assertions())
        builder(solver, context, cell.order)
        added = len(solver.assertions()) - before
        _require(
            added == block.expected_assertions,
            f"block {block.name} emitted {added} assertions, expected {block.expected_assertions}",
        )
    return solver


def export_smt2(
    cell: CellSpec,
    timeout_ms: int = 30_000,
    *,
    include_check_sat: bool = False,
) -> str:
    """Return deterministic flat QF_NRA bytes for one cell."""

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


def _legacy_cell() -> CellSpec:
    return CellSpec("legacy-full-regression", len(BLOCKS), "legacy", legacy.ORDER)


def static_check() -> dict[str, Any]:
    """Validate block counts and byte preservation without solving."""

    _require(len(BLOCKS) == len(BLOCK_BUILDERS), "block metadata and builders differ")
    _require(
        tuple(sum(block.expected_assertions for block in BLOCKS[: index + 1]) for index in range(len(BLOCKS)))
        == EXPECTED_CUMULATIVE_COUNTS,
        "cumulative assertion contract changed",
    )
    legacy_formula = legacy.export_smt2(include_check_sat=False)
    factor_formula = export_smt2(_legacy_cell())
    _require(factor_formula == legacy_formula, "full legacy bytes changed during factorization")
    _require(
        all(token not in factor_formula for token in ("pbeq", "pbge", "pble")),
        "factorized serialization contains a pseudo-Boolean operator",
    )
    for cell in cell_specs():
        formula = export_smt2(cell)
        parsed = z3.parse_smt2_string(formula)
        expected = EXPECTED_CUMULATIVE_COUNTS[cell.prefix_length - 1]
        _require(len(parsed) == expected, f"SMT parser lost assertions for {cell.name}")
    for order_cell in midpoint_order.CELLS:
        full = CellSpec(
            name=f"full-{order_cell.name}",
            prefix_length=len(BLOCKS),
            order_cell=order_cell.name,
            order=order_cell.order,
        )
        _require(
            export_smt2(full)
            == midpoint_order.export_smt2(order_cell, include_check_sat=False),
            f"full {order_cell.name} bytes differ from the source-order probe",
        )
    return {
        "status": "STATIC_CHECK_OK",
        "cells": len(cell_specs()),
        "legacy_full_formula_sha256": hashlib.sha256(legacy_formula.encode()).hexdigest(),
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


def build_manifest(timeout_ms: int) -> tuple[dict[str, Any], dict[str, str]]:
    """Build the encoded/omitted ledger and every query-free cell."""

    check = static_check()
    formulas: dict[str, str] = {}
    cells: list[dict[str, Any]] = []
    block_names = tuple(block.name for block in BLOCKS)
    for cell in cell_specs():
        formula = export_smt2(cell, timeout_ms)
        formulas[cell.name] = formula
        assertion_count = EXPECTED_CUMULATIVE_COUNTS[cell.prefix_length - 1]
        cells.append(
            {
                "name": cell.name,
                "order_cell": cell.order_cell,
                "order": list(cell.order) if cell.order_cell != "common" else None,
                "assertions": assertion_count,
                "formula_bytes": len(formula.encode()),
                "formula_sha256": hashlib.sha256(formula.encode()).hexdigest(),
                "encoded_blocks": list(block_names[: cell.prefix_length]),
                "omitted_blocks": list(block_names[cell.prefix_length :]),
            }
        )
    manifest = {
        "schema": RESULT_SCHEMA,
        "scope": "bounded-fixed-order-formula-prefixes",
        "direct_consumer": DIRECT_CONSUMER,
        "solver_policy": "piqd-only",
        "static_check": check,
        "producer_sha256": _sha256_path(Path(__file__)),
        "base_probe_sha256": _sha256_path(Path(legacy.__file__)),
        "midpoint_order_probe_sha256": _sha256_path(Path(midpoint_order.__file__)),
        "blocks": [
            {
                "name": block.name,
                "assertions": block.expected_assertions,
                "clause_class": block.clause_class,
                "entitlement": block.entitlement,
                "description": block.description,
            }
            for block in BLOCKS
        ],
        "cells": cells,
        "global_omissions": [
            "coverage over every Moser normalization and cyclic order",
            "source realization of SAT assignments",
            "strict-cap placement of xv or centerAt(v)",
            "a q/w residual omitted from the v-indexed row",
            "Lean ingress and certificate replay",
        ],
    }
    return manifest, formulas


def emit_bundle(output_root: Path, timeout_ms: int) -> dict[str, Any]:
    """Write the durable ledger and query-free formulas below one run root."""

    manifest, formulas = build_manifest(timeout_ms)
    for name, formula in formulas.items():
        _atomic_write(output_root / "artifacts" / "inputs" / f"{name}.smt2", formula)
    manifest_path = output_root / "factor_manifest.json"
    _atomic_write(manifest_path, _canonical_json(manifest, pretty=True))
    return {
        "status": "EMITTED",
        "cells": len(formulas),
        "manifest": str(manifest_path),
        "manifest_sha256": _sha256_path(manifest_path),
    }


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-root", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    if args.timeout_ms <= 0:
        raise SystemExit("--timeout-ms must be positive")
    if args.output_root is None and not args.check:
        raise SystemExit("supply --check or --output-root")
    try:
        result = static_check() if args.output_root is None else emit_bundle(args.output_root, args.timeout_ms)
    except (FactorizationError, OSError, z3.Z3Exception) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2
    if args.verbose:
        print(_canonical_json(result, pretty=True), end="")
    elif args.output_root is not None:
        print(_canonical_json(result, pretty=False), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
