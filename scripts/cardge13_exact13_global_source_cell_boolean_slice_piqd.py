# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Pure Boolean PIQD slice for the exact-13 source and Kalmanson conflict bank."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_slice_piqd as sliced

SCHEMA = "cardge13-exact13-global-source-cell-boolean-slice-piqd/v1"


def build_commands(
    order: tuple[int, ...],
    role_pins: tuple[tuple[str, int], ...] = (),
    row_pins: tuple[tuple[str, tuple[int, ...]], ...] = (),
) -> tuple[tuple[str, ...], tuple[dict[str, object], ...]]:
    """Build source combinatorics plus locally proved Kalmanson conflict clauses."""
    roles, rows = sliced.normalize_pins(role_pins, row_pins)
    source = list(base.source_commands("strict"))
    if not source or source[0] != "(set-logic QF_LRA)":
        raise AssertionError("source-command logic prelude drifted")
    source[0] = "(set-logic QF_UF)"
    bank = base.conflict_bank(order)
    source.extend(
        f"(assert {base.disjunction(f'(not {atom})' for atom in record['atoms'])})"
        for record in bank
    )
    source.extend(
        f"(assert {base.role(name, roles[name])})" for name in sorted(roles)
    )
    for row in base.BASE_ROWS:
        if row in rows:
            source.extend(f"(assert {base.member(row, point)})" for point in rows[row])
    return tuple(source), bank


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--pin-role", action="append", type=sliced.parse_role_pin, default=[])
    parser.add_argument("--pin-row", action="append", type=sliced.parse_row_pin, default=[])
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-refinements", type=int, default=25)
    args = parser.parse_args()

    role_pins, row_pins = sliced.normalize_pins(
        tuple(args.pin_role), tuple(args.pin_row)
    )
    order = base.DIRECT_ORDER if args.orientation == "direct" else base.MIRROR_ORDER
    commands, bank = build_commands(
        order, tuple(role_pins.items()), tuple(row_pins.items())
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
            label=f"cardge13-exact13-boolean-slice-{args.orientation}",
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
            rows = cell["base_rows"]
            if any(roles[name] != label for name, label in role_pins.items()):
                raise AssertionError("decoded model violates a role pin")
            if any(set(rows[name]) != set(support) for name, support in row_pins.items()):
                raise AssertionError("decoded model violates a row pin")
            decoded.append({"solver": solve["solver"], "cell": cell})
    report = {
        "schema": SCHEMA,
        "claim_boundary": (
            "source combinatorics and the finite bank of locally proved strict "
            "Kalmanson conflict clauses; no free distance variables"
        ),
        "orientation": args.orientation,
        "role_pins": role_pins,
        "row_pins": {name: list(support) for name, support in row_pins.items()},
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
