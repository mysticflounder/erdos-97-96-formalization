# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""PIQD probe for one blocker-pair slice of the exact-13 global source cell."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-global-source-cell-pinned-piqd/v1"


def validate_blocker_pair(blocker0: int, blocker1: int) -> tuple[int, int]:
    """Validate a source-admissible ordered pair of raw blocker labels."""
    for blocker in (blocker0, blocker1):
        if blocker not in base.LABELS:
            raise ValueError(f"blocker label must lie in {base.LABELS}")
        if blocker in (base.SECOND_APEX, base.FIRST_APEX):
            raise ValueError("a blocker label cannot be an apex label")
    if blocker0 == blocker1:
        raise ValueError("the two blocker labels must be distinct")
    return blocker0, blocker1


def build_commands(
    order: tuple[int, ...],
    blocker0: int,
    blocker1: int,
    linear_mode: str = "strict",
) -> tuple[tuple[str, ...], tuple[dict[str, object], ...]]:
    """Append one ordered blocker-pair split to the global source formula."""
    blocker0, blocker1 = validate_blocker_pair(blocker0, blocker1)
    commands, bank = base.build_commands(order, linear_mode)
    return (
        (
            *commands,
            f"(assert {base.role('b0', blocker0)})",
            f"(assert {base.role('b1', blocker1)})",
        ),
        bank,
    )


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--linear-mode", choices=("equality", "strict"), default="strict")
    parser.add_argument("--blocker0", type=int, required=True)
    parser.add_argument("--blocker1", type=int, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--max-refinements", type=int, default=25)
    args = parser.parse_args()

    blocker0, blocker1 = validate_blocker_pair(args.blocker0, args.blocker1)
    order = base.DIRECT_ORDER if args.orientation == "direct" else base.MIRROR_ORDER
    commands, bank = build_commands(
        order, blocker0, blocker1, args.linear_mode
    )
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    solves = (
        base.run_piqd_chunked(
            args.out,
            commands,
            tuple(args.solver or ()),
            args.timeout_ms,
            label=(
                "cardge13-exact13-global-source-cell-"
                f"{args.orientation}-b0-{blocker0}-b1-{blocker1}"
            ),
            order=order,
            max_refinements=args.max_refinements,
        )
        if args.solver
        else []
    )
    decoded: list[dict[str, Any]] = []
    for solve in solves:
        result = solve.get("solved")
        if not isinstance(result, dict):
            raise TypeError("PIQD solve response is malformed")
        if result.get("status") == "SAT":
            replay = result.get("model_replay")
            model = result.get("model")
            if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED":
                raise AssertionError("PIQD SAT model did not replay")
            if not isinstance(model, str):
                raise TypeError("PIQD SAT model is missing")
            cell = base.decode_model(model)
            roles = cell["roles"]
            if roles["b0"] != blocker0 or roles["b1"] != blocker1:
                raise AssertionError("decoded model violates the blocker-pair split")
            decoded.append({"solver": solve["solver"], "cell": cell})
    report = {
        "schema": SCHEMA,
        "claim_boundary": (
            "one ordered blocker-pair slice of the source-combinatorial five-row "
            "cell with global K4 rows and strict linear Kalmanson inequalities; "
            "formula-scoped diagnostic"
        ),
        "orientation": args.orientation,
        "linear_mode": args.linear_mode,
        "blocker_pair": [blocker0, blocker1],
        "order": list(order),
        "command_count": len(commands),
        "conflict_count": len(bank),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "solves": solves,
        "decoded_sat_models": decoded,
        "cegar_statuses": [solve.get("cegar_status") for solve in solves],
    }
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_bytes(canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "blocker_pair": [blocker0, blocker1],
                "commands": len(commands),
                "conflicts": len(bank),
                "journal_sha256": report["journal_sha256"],
                "statuses": [row.get("solved", {}).get("status") for row in solves],
                "cegar_statuses": [row.get("cegar_status") for row in solves],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
