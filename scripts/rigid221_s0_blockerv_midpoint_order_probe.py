"""Source-consistent fixed-order probes for the Rigid221 blocker-``v`` arm.

The historical exact-five probe fixed the strict-second-cap roles in the
order ``v, u, xu``.  The proved source-row relation instead puts ``v``
strictly between the two source-row physical points.  This module preserves
the historical input and emits the two source-consistent order controls:
``u, v, xu`` and ``xu, v, u``.

The geometry is still a bounded fixed-cell experiment.  In particular, the
rational Moser normalization, complete named carrier, and chosen full cyclic
order remain controls rather than claims about every live source branch.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections.abc import Iterator, Sequence
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import rigid221_s0_blockerv_exactfive_probe as legacy

RESULT_SCHEMA = "rigid221-s0-blockerv-midpoint-order-probe/v1"


@dataclass(frozen=True)
class MidpointOrderCell:
    """One full-order control whose strict-cap segment obeys the source rule."""

    name: str
    order: tuple[str, ...]


FORWARD = MidpointOrderCell(
    name="forward",
    order=(
        "O",
        "au",
        "av",
        "delta",
        "m1",
        "u",
        "v",
        "xu",
        "m2",
        "xv",
        "bv",
        "bu",
        "cv",
    ),
)

REVERSE = MidpointOrderCell(
    name="reverse",
    order=(
        "O",
        "au",
        "av",
        "delta",
        "m1",
        "xu",
        "v",
        "u",
        "m2",
        "xv",
        "bv",
        "bu",
        "cv",
    ),
)

CELLS = (FORWARD, REVERSE)
_CELL_BY_NAME = {cell.name: cell for cell in CELLS}


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def source_midpoint_order_holds(order: Sequence[str]) -> bool:
    """Check the source-entitled ``u < v < xu`` or reflected cap relation.

    The relationship is invariant under reversing an ordered-cap presentation,
    so checking that ``v`` lies between the two source-row roles in the
    selected strict-cap segment is sufficient.
    """

    positions = {role: index for index, role in enumerate(order)}
    required = {"m1", "m2", "u", "v", "xu"}
    _require(required <= positions.keys(), "order omits a midpoint role")
    u_position = positions["u"]
    v_position = positions["v"]
    xu_position = positions["xu"]
    _require(
        positions["m1"] < min(u_position, v_position, xu_position)
        and max(u_position, v_position, xu_position) < positions["m2"],
        "source-row midpoint roles do not lie in the strict second-cap segment",
    )
    return min(u_position, xu_position) < v_position < max(u_position, xu_position)


@contextmanager
def _using_order(order: tuple[str, ...]) -> Iterator[None]:
    """Reuse the historical encoder without changing its archived default cell."""

    original_order = legacy.ORDER
    try:
        legacy.ORDER = order
        yield
    finally:
        legacy.ORDER = original_order


def build_solver(cell: MidpointOrderCell, timeout_ms: int) -> Any:
    """Build one source-consistent cell through the historical encoder."""

    _require(source_midpoint_order_holds(cell.order), "cell violates source midpoint order")
    with _using_order(cell.order):
        return legacy.build_solver(timeout_ms)


def export_smt2(
    cell: MidpointOrderCell,
    timeout_ms: int = 120000,
    *,
    include_check_sat: bool = True,
) -> str:
    """Emit deterministic QF_NRA bytes for one source-consistent order cell."""

    _require(source_midpoint_order_holds(cell.order), "cell violates source midpoint order")
    with _using_order(cell.order):
        return legacy.export_smt2(timeout_ms, include_check_sat=include_check_sat)


def direct_solve(cell: MidpointOrderCell, timeout_ms: int) -> dict[str, Any]:
    """Run the historical local solve and exact witness replay for one cell."""

    _require(source_midpoint_order_holds(cell.order), "cell violates source midpoint order")
    with _using_order(cell.order):
        return legacy.direct_solve(timeout_ms)


def run_smoke(timeout_ms: int) -> dict[str, Any]:
    """Check the structural order repair and deterministic SMT serialization."""

    _require(
        not source_midpoint_order_holds(legacy.ORDER),
        "historical exact-five order unexpectedly satisfies the midpoint relation",
    )
    rows: list[dict[str, Any]] = []
    for cell in CELLS:
        _require(source_midpoint_order_holds(cell.order), f"{cell.name} misses midpoint order")
        formula = export_smt2(cell, timeout_ms)
        session_formula = export_smt2(cell, timeout_ms, include_check_sat=False)
        _require(
            formula == f"{session_formula}(check-sat)\n",
            f"{cell.name} session SMT2 differs from queried prefix",
        )
        _require(
            all(token not in formula for token in ("pbeq", "pbge", "pble")),
            f"{cell.name} emits a pseudo-Boolean operator",
        )
        rows.append(
            {
                "cell": cell.name,
                "assertions": len(build_solver(cell, timeout_ms).assertions()),
                "formula_sha256": hashlib.sha256(formula.encode("utf-8")).hexdigest(),
            }
        )
    return {"schema": RESULT_SCHEMA, "cells": rows, "status": "SMOKE_OK"}


def _canonical_json(value: Any, *, pretty: bool) -> str:
    if pretty:
        return json.dumps(value, indent=2, sort_keys=True) + "\n"
    return json.dumps(value, separators=(",", ":"), sort_keys=True) + "\n"


def _atomic_write(path: Path, contents: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile("w", encoding="utf-8", dir=path.parent, delete=False) as handle:
        handle.write(contents)
        temporary = Path(handle.name)
    os.replace(temporary, path)


def _selected_cells(name: str) -> tuple[MidpointOrderCell, ...]:
    if name == "all":
        return CELLS
    return (_CELL_BY_NAME[name],)


def _document(cell: MidpointOrderCell, timeout_ms: int, direct: bool) -> tuple[str, str, dict[str, Any]]:
    formula = export_smt2(cell, timeout_ms)
    session_formula = export_smt2(cell, timeout_ms, include_check_sat=False)
    document: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "scope": "bounded-source-consistent-fixed-order-formula",
        "cell": cell.name,
        "formula_sha256": hashlib.sha256(formula.encode("utf-8")).hexdigest(),
        "formula_bytes": len(formula.encode("utf-8")),
        "session_formula_sha256": hashlib.sha256(session_formula.encode("utf-8")).hexdigest(),
        "session_formula_bytes": len(session_formula.encode("utf-8")),
        "assertions": len(build_solver(cell, timeout_ms).assertions()),
        "literal_source_blocker": "v",
        "exact_j_interior": sorted(legacy.EXACT_J),
        "source_midpoint_order": list(cell.order[5:8]),
        "historical_order_rejected": list(legacy.ORDER[5:8]),
    }
    if direct:
        document["direct_z3"] = direct_solve(cell, timeout_ms)
    return formula, session_formula, document


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cell", choices=("forward", "reverse", "all"), default="all")
    parser.add_argument("--output-root", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=120000)
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--direct-solve", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    if args.timeout_ms <= 0:
        raise SystemExit("--timeout-ms must be positive")
    if args.smoke:
        if args.output_root is not None or args.direct_solve:
            raise SystemExit("--smoke cannot be combined with output or direct-solve options")
        if args.verbose:
            print(_canonical_json(run_smoke(args.timeout_ms), pretty=True), end="")
        else:
            run_smoke(args.timeout_ms)
        return 0
    if args.output_root is None:
        raise SystemExit("supply --smoke or --output-root")
    if args.output_root.exists() and any(args.output_root.iterdir()):
        raise SystemExit("--output-root must be empty")
    summaries: list[dict[str, Any]] = []
    for cell in _selected_cells(args.cell):
        formula, session_formula, document = _document(cell, args.timeout_ms, args.direct_solve)
        _atomic_write(args.output_root / f"{cell.name}.smt2", formula)
        _atomic_write(args.output_root / f"{cell.name}.session.smt2", session_formula)
        _atomic_write(args.output_root / f"{cell.name}.json", _canonical_json(document, pretty=True))
        summaries.append(
            {
                "cell": cell.name,
                "assertions": document["assertions"],
                "formula_sha256": document["formula_sha256"],
                "status": document.get("direct_z3", {}).get("status", "EMITTED"),
            }
        )
    if args.verbose:
        print(_canonical_json({"schema": RESULT_SCHEMA, "cells": summaries}, pretty=True), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
