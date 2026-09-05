# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Test planar realizability of the authenticated exact-13 PIQD step-4 cell."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import cardge13_exact13_fixed_base_k4_scan as scan

SCHEMA = "cardge13-exact13-fixed-base-planar-piqd/v3"
EXACT_ROW_NAMES = frozenset(("K", "L", "T"))
CHALLENGE_CENTERS = scan.EXPECTED_CHALLENGE_CENTERS
SOURCE_ROW_NAMES = ("C0", "C1", "K", "L", "T")


def squared_distance(left: int, right: int) -> str:
    return (
        f"(+ (* (- x_{left} x_{right}) (- x_{left} x_{right})) "
        f"(* (- y_{left} y_{right}) (- y_{left} y_{right})))"
    )


def left_turn(a: int, b: int, c: int) -> str:
    return (
        f"(- (* (- x_{b} x_{a}) (- y_{c} y_{a})) "
        f"(* (- y_{b} y_{a}) (- x_{c} x_{a})))"
    )


def rows_from_binding(
    binding: dict[str, object],
    source_prefix: int = len(SOURCE_ROW_NAMES),
    challenge_prefix: int = len(CHALLENGE_CENTERS),
) -> tuple[tuple[str, int, tuple[int, ...]], ...]:
    if not 0 <= source_prefix <= len(SOURCE_ROW_NAMES):
        raise ValueError("source prefix must be between zero and five")
    if not 0 <= challenge_prefix <= len(CHALLENGE_CENTERS):
        raise ValueError(
            f"challenge prefix must be between zero and {len(CHALLENGE_CENTERS)}"
        )
    challenge_rows = binding["challenge_rows"]
    if not isinstance(challenge_rows, dict):
        raise TypeError("source-model challenge rows must be an object")
    source_rows = (
        ("C0", scan.FIXED_ROWS[0][0], scan.FIXED_ROWS[0][1]),
        ("C1", scan.FIXED_ROWS[1][0], scan.FIXED_ROWS[1][1]),
        ("K", scan.FIXED_ROWS[2][0], scan.FIXED_ROWS[2][1]),
        ("L", scan.FIXED_ROWS[3][0], scan.FIXED_ROWS[3][1]),
        ("T", scan.FIXED_ROWS[4][0], scan.FIXED_ROWS[4][1]),
    )
    return (
        *source_rows[:source_prefix],
        *(
            (f"G{center}", center, tuple(challenge_rows[str(center)]))
            for center in CHALLENGE_CENTERS[:challenge_prefix]
        ),
    )


def build_commands(
    source_event: Path = scan.DEFAULT_SOURCE_EVENT,
    source_prefix: int = len(SOURCE_ROW_NAMES),
    challenge_prefix: int = len(CHALLENGE_CENTERS),
) -> tuple[str, ...]:
    binding = scan.source_model_binding(source_event)
    rows = rows_from_binding(binding, source_prefix, challenge_prefix)
    commands = ["(set-logic QF_NRA)"]
    for label in scan.core.LABELS:
        commands.extend((f"(declare-const x_{label} Real)", f"(declare-const y_{label} Real)"))

    first = scan.ORDER[0]
    second = scan.ORDER[1]
    commands.extend(
        (
            f"(assert (= x_{first} 0))",
            f"(assert (= y_{first} 0))",
            f"(assert (= x_{second} 1))",
            f"(assert (= y_{second} 0))",
        )
    )
    for index, a in enumerate(scan.ORDER):
        b = scan.ORDER[(index + 1) % len(scan.ORDER)]
        for c in scan.ORDER:
            if c not in {a, b}:
                commands.append(f"(assert (> {left_turn(a, b, c)} 0))")

    for name, center, support in rows:
        radius = f"r2_{name}"
        commands.extend((f"(declare-const {radius} Real)", f"(assert (> {radius} 0))"))
        commands.extend(
            f"(assert (= {squared_distance(center, point)} {radius}))" for point in support
        )
        if name in EXACT_ROW_NAMES:
            commands.extend(
                f"(assert (distinct {squared_distance(center, point)} {radius}))"
                for point in scan.core.LABELS
                if point != center and point not in support
            )
    row_names = {name for name, _center, _support in rows}
    if {"K", "L"} <= row_names:
        commands.append("(assert (distinct r2_K r2_L))")
    return tuple(commands)


def inventory(
    source_event: Path = scan.DEFAULT_SOURCE_EVENT,
    source_prefix: int = len(SOURCE_ROW_NAMES),
    challenge_prefix: int = len(CHALLENGE_CENTERS),
) -> dict[str, int]:
    rows = rows_from_binding(
        scan.source_model_binding(source_event), source_prefix, challenge_prefix
    )
    row_names = {name for name, _center, _support in rows}
    return {
        "commands": len(build_commands(source_event, source_prefix, challenge_prefix)),
        "coordinate_variables": 26,
        "radius_squared_variables": len(rows),
        "supporting_edge_strict_forms": 143,
        "row_equalities": 4 * len(rows),
        "off_radius_disequalities": 8 * len(EXACT_ROW_NAMES & row_names),
        "distinct_row_radius_constraints": int({"K", "L"} <= row_names),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-event", type=Path, default=scan.DEFAULT_SOURCE_EVENT)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument(
        "--source-prefix",
        type=int,
        choices=range(len(SOURCE_ROW_NAMES) + 1),
        default=len(SOURCE_ROW_NAMES),
    )
    parser.add_argument(
        "--challenge-prefix",
        type=int,
        choices=range(len(CHALLENGE_CENTERS) + 1),
        default=len(CHALLENGE_CENTERS),
    )
    args = parser.parse_args()

    source_binding = scan.source_model_binding(args.source_event)
    commands = build_commands(
        args.source_event, args.source_prefix, args.challenge_prefix
    )
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    report = {
        "schema": SCHEMA,
        "source_model_binding": source_binding,
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "source_prefix": args.source_prefix,
        "source_rows": list(SOURCE_ROW_NAMES[: args.source_prefix]),
        "challenge_prefix": args.challenge_prefix,
        "challenge_centers": list(CHALLENGE_CENTERS[: args.challenge_prefix]),
        "inventory": inventory(
            args.source_event, args.source_prefix, args.challenge_prefix
        ),
        "encoded": [
            "thirteen labelled planar points in the authenticated direct cyclic order",
            "strict supporting-edge convexity for every boundary edge",
            f"{args.source_prefix} source equality rows from the step-4 base cell",
            "exact off-support exclusions only for the K/L/T full radius classes",
            f"{args.challenge_prefix} equality-only global-K4 rows from the step-4 PIQD prefix",
            "the source inequality between the two second-apex row radii",
        ],
        "omitted": [
            "mirror-orientation cells",
            "all source incidence cells other than the authenticated step-4 model",
            "later step-4 challenge rows outside the selected prefix",
            "cap-sector, deletion, and frontier predicates beyond their fixed support consequences",
            "a checked Lean or algebraic certificate for the solver result",
        ],
        "claim_boundary": (
            f"one fixed direct-orientation planar incidence cell with source prefix "
            f"{args.source_prefix} and challenge prefix {args.challenge_prefix}; "
            "solver evidence is formula-scoped "
            "and never a P97 theorem"
        ),
        "solves": [],
    }
    if args.solver:
        report["solves"] = scan.core.run_piqd(
            args.out,
            commands,
            tuple(args.solver),
            args.timeout_ms,
            label=(
                "cardge13-exact13-fixed-base-planar-source-"
                f"{args.source_prefix}-challenge-{args.challenge_prefix}"
            ),
        )
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
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
