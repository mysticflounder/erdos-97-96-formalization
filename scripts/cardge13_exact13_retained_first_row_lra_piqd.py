"""Add the retained first-apex exact-four row to the CardGe13 PIQD audit."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_tight_cover_lra_piqd as base

FIRST_APEX = 1
FIRST_OPPOSITE_INTERIOR = frozenset((6, 7))
ROW = "T"


def _member(i: int) -> str:
    return f"m_{ROW}_{i}"


def build_commands() -> tuple[str, ...]:
    commands = list(base.build_commands())
    for i in base.LABELS:
        commands.append(f"(declare-const {_member(i)} Bool)")
    commands.append("(declare-const r_T Real)")
    commands.append(
        f"(assert {base._exactly((_member(i) for i in base.LABELS), 4)})"
    )
    commands.append("(assert (>= r_T 1))")
    commands.append(f"(assert (not {_member(FIRST_APEX)}))")
    for i in FIRST_OPPOSITE_INTERIOR:
        commands.append(f"(assert {_member(i)})")
    for i in base.LABELS:
        if i == FIRST_APEX:
            continue
        distance = base._distance(FIRST_APEX, i)
        commands.append(f"(assert (=> {_member(i)} (= {distance} r_T)))")
        commands.append(
            f"(assert (=> (not {_member(i)}) "
            f"(or (>= {distance} (+ r_T 1)) (>= r_T (+ {distance} 1)))))"
        )
    return tuple(commands)


def journal_bytes() -> bytes:
    return ("\n".join(build_commands()) + "\n").encode("ascii")


def inventory(commands: tuple[str, ...]) -> dict[str, int]:
    result = base.inventory(commands)
    result["row_supports"] = 5
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()
    commands = build_commands()
    payload = journal_bytes()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(payload)
    report: dict[str, Any] = {
        "schema": "cardge13-exact13-retained-first-row-lra-piqd/v1",
        "created_utc": base._utc_now(),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(payload).hexdigest(),
        "inventory": inventory(commands),
        "claim_boundary": (
            "conditional exact-tight-cover Kalmanson-metric discovery with retained "
            "first-apex exact-four incidence"
        ),
        "solves": [],
    }
    if args.solver:
        report["solves"] = base.run_piqd(
            args.out, commands, tuple(args.solver), args.timeout_ms,
            label="cardge13-exact13-retained-first-row-lra",
        )
    if args.event:
        args.event.parent.mkdir(parents=True, exist_ok=True)
        args.event.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "journal_sha256": report["journal_sha256"],
        "inventory": report["inventory"],
        "statuses": [row.get("solved", {}).get("status") for row in report["solves"]],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
