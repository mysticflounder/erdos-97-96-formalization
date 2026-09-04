"""Planar QF_NRA checks for cells surviving the CardGe13 LRA relaxation."""

from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import asdict, dataclass
from pathlib import Path

import cardge13_exact13_tight_cover_lra_piqd as lra


@dataclass(frozen=True)
class Cell:
    name: str
    z: int
    b0: int
    b1: int
    c0: tuple[int, ...]
    c1: tuple[int, ...]
    k: tuple[int, ...]
    ell: tuple[int, ...]
    radius_order: str


CELLS = {
    "z3-lra-survivor": Cell(
        "z3-lra-survivor",
        z=8,
        b0=7,
        b1=8,
        c0=(2, 3, 4, 5),
        c1=(0, 1, 7, 9),
        k=(6, 10, 11, 12),
        ell=(3, 7, 8, 9),
        radius_order="K<L",
    ),
    "cvc5-lra-survivor": Cell(
        "cvc5-lra-survivor",
        z=11,
        b0=4,
        b1=6,
        c0=(1, 3, 5, 10),
        c1=(0, 2, 7, 12),
        k=(4, 6, 8, 9),
        ell=(5, 10, 11, 12),
        radius_order="K>L",
    ),
}


class CellError(RuntimeError):
    pass


def validate_cell(cell: Cell) -> None:
    universe = set(lra.LABELS)
    rows = [set(cell.c0), set(cell.c1), set(cell.k), set(cell.ell)]
    if any(len(row) != 4 or not row <= universe for row in rows):
        raise CellError("every row must be a four-subset of Fin 13")
    c0, c1, k, ell = rows
    if c0 & c1 or c0 & k or c1 & k:
        raise CellError("C0, C1, and K must be pairwise disjoint")
    if c0 | c1 | k != universe - {cell.z}:
        raise CellError("C0, C1, and K must tightly cover A without z")
    if cell.z not in ell or cell.z in c0 | c1 | k or k & ell:
        raise CellError("z/K/L incidences violate the tight branch")
    if {len(k & lra.SECOND_OPPOSITE_INTERIOR), len(ell & lra.SECOND_OPPOSITE_INTERIOR)} != {2, 3}:
        raise CellError("K/L must realize the corrected 2+3 interior profile")
    if k | ell < lra.SECOND_OPPOSITE_INTERIOR:
        raise CellError("K/L must cover the five-point second-opposite interior")
    if {len(c0 & ell), len(c1 & ell)} != {1, 2}:
        raise CellError("L minus z must split 1+2 across C0/C1")
    if len({cell.b0, cell.b1, lra.SECOND_APEX}) != 3:
        raise CellError("the three row centers must be pairwise distinct")
    if cell.b0 in c0 or cell.b1 in c1 or lra.SECOND_APEX in k | ell:
        raise CellError("a center occurs in its own support")
    if cell.radius_order not in {"K<L", "K>L"}:
        raise CellError("unknown K/L radius order")


def _sqdist(i: int, j: int) -> str:
    return (
        f"(+ (* (- x_{i} x_{j}) (- x_{i} x_{j})) "
        f"(* (- y_{i} y_{j}) (- y_{i} y_{j})))"
    )


def _left(a: int, b: int, c: int) -> str:
    return (
        f"(- (* (- x_{b} x_{a}) (- y_{c} y_{a})) "
        f"(* (- y_{b} y_{a}) (- x_{c} x_{a})))"
    )


def build_commands(cell: Cell) -> tuple[str, ...]:
    validate_cell(cell)
    commands = ["(set-logic QF_NRA)"]
    for i in lra.LABELS:
        commands.extend((f"(declare-const x_{i} Real)", f"(declare-const y_{i} Real)"))
    for row in lra.ROWS:
        commands.append(f"(declare-const r2_{row} Real)")
        commands.append(f"(assert (> r2_{row} 0))")

    commands.extend(
        (
            "(assert (= x_2 0))",
            "(assert (= y_2 0))",
            "(assert (= x_8 1))",
            "(assert (= y_8 0))",
        )
    )
    order = lra.DIRECT_ORDER
    for index, a in enumerate(order):
        b = order[(index + 1) % len(order)]
        for c in order:
            if c not in {a, b}:
                commands.append(f"(assert (> {_left(a, b, c)} 0))")

    row_data = (
        ("C0", cell.b0, cell.c0),
        ("C1", cell.b1, cell.c1),
        ("K", lra.SECOND_APEX, cell.k),
        ("L", lra.SECOND_APEX, cell.ell),
    )
    for name, center, support in row_data:
        for point in support:
            commands.append(f"(assert (= {_sqdist(center, point)} r2_{name}))")

    if cell.radius_order == "K<L":
        commands.append("(assert (< r2_K r2_L))")
    else:
        commands.append("(assert (> r2_K r2_L))")

    # hnoFive makes the two named A2 rows full four-point radius classes.
    for name, support in (("K", set(cell.k)), ("L", set(cell.ell))):
        for point in lra.LABELS:
            if point != lra.SECOND_APEX and point not in support:
                commands.append(
                    f"(assert (distinct {_sqdist(lra.SECOND_APEX, point)} r2_{name}))"
                )
    return tuple(commands)


def journal_bytes(cell: Cell) -> bytes:
    return ("\n".join(build_commands(cell)) + "\n").encode("ascii")


def inventory(cell: Cell) -> dict[str, int]:
    commands = build_commands(cell)
    return {
        "commands": len(commands),
        "coordinate_variables": 26,
        "radius_squared_variables": 4,
        "supporting_edge_strict_forms": 143,
        "row_equalities": 16,
        "a2_off_radius_disequalities": 16,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cell", choices=tuple(CELLS), required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()

    cell = CELLS[args.cell]
    payload = journal_bytes(cell)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(payload)
    report = {
        "schema": "cardge13-exact13-tight-cover-planar-qfnra-piqd/v1",
        "created_utc": lra._utc_now(),
        "cell": asdict(cell),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(payload).hexdigest(),
        "inventory": inventory(cell),
        "encoded": [
            "fixed exact-tight-cover support cell",
            "corrected 2+3 K/L interior profile and 1+2 C/L trace",
            "source-allowed blocker-center incidences, including blocker=z",
            "four circle rows and K/L radius order",
            "K/L full-class exclusions from hnoFive",
            "strict convexity in the DR direct cyclic order",
        ],
        "omitted": [
            "formal Lean proof of the fresh-or-tight finite split",
            "cap-interior triangle predicates beyond cyclic order",
            "q/w/deleted frontier roles and good-source provenance",
            "all exact-LRA survivor cells other than this witness cell",
        ],
        "claim_boundary": "one fixed planar survivor check; never a P97 counterexample",
        "solves": [],
    }
    if args.solver:
        report["solves"] = lra.run_piqd(
            args.out,
            build_commands(cell),
            tuple(args.solver),
            args.timeout_ms,
            label=f"cardge13-{cell.name}-qfnra",
        )
    if args.event:
        args.event.parent.mkdir(parents=True, exist_ok=True)
        args.event.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "cell": cell.name,
                "journal_sha256": report["journal_sha256"],
                "inventory": report["inventory"],
                "statuses": [row.get("solved", {}).get("status") for row in report["solves"]],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
