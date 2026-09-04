"""Add faithful all-center K4 witnesses to the CardGe13 abstract PIQD audit."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_retained_first_row_lra_piqd as retained

core = retained.base


def _member(center: int, support: int) -> str:
    return f"m_G{center}_{support}"


def build_commands() -> tuple[str, ...]:
    commands = list(retained.build_commands())
    for center in core.LABELS:
        for support in core.LABELS:
            commands.append(f"(declare-const {_member(center, support)} Bool)")
        commands.append(f"(declare-const r_G{center} Real)")
        commands.append(
            f"(assert {core._exactly((_member(center, i) for i in core.LABELS), 4)})"
        )
        commands.append(f"(assert (>= r_G{center} 1))")
        commands.append(f"(assert (not {_member(center, center)}))")
        for support in core.LABELS:
            if support == center:
                continue
            distance = core._distance(center, support)
            commands.append(
                f"(assert (=> {_member(center, support)} (= {distance} r_G{center})))"
            )
    return tuple(commands)


def journal_bytes() -> bytes:
    return ("\n".join(build_commands()) + "\n").encode("ascii")


def inventory(commands: tuple[str, ...]) -> dict[str, int]:
    result = retained.inventory(commands)
    result["row_supports"] = 18
    result["global_k4_centers"] = 13
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
        "schema": "cardge13-exact13-all-center-k4-lra-piqd/v1",
        "created_utc": core._utc_now(),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(payload).hexdigest(),
        "inventory": inventory(commands),
        "claim_boundary": (
            "conditional direct-profile exact-tight-cover abstract Kalmanson metric "
            "with retained first-apex row and existential all-center K4 supports"
        ),
        "solves": [],
    }
    if args.solver:
        report["solves"] = core.run_piqd(
            args.out, commands, tuple(args.solver), args.timeout_ms,
            label="cardge13-exact13-all-center-k4-lra",
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
