# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Repeatedly refine a PIQD exact-13 arithmetic assumption core."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_slice_piqd as sliced
import cardge13_exact13_global_source_cell_unsat_core_piqd as core_driver

SCHEMA = "cardge13-exact13-global-source-cell-unsat-core-refine-piqd/v1"


def seed_selectors(path: Path) -> tuple[str, ...]:
    """Read the authenticated-discovery event's selected arithmetic terms."""
    value = json.loads(path.read_text())
    records = value.get("core_records")
    if not isinstance(records, list) or not records:
        raise ValueError("seed event has no nonempty core_records array")
    selectors = tuple(record.get("selector") for record in records if isinstance(record, dict))
    if len(selectors) != len(records) or not all(isinstance(item, str) for item in selectors):
        raise ValueError("seed event contains malformed core selectors")
    if len(set(selectors)) != len(selectors):
        raise ValueError("seed event repeats a core selector")
    return selectors  # type: ignore[return-value]


def refine_core(
    journal_path: Path,
    commands: tuple[str, ...],
    selector_map: tuple[dict[str, object], ...],
    initial: tuple[str, ...],
    solver: str,
    timeout_ms: int,
    max_rounds: int,
) -> tuple[tuple[str, ...], list[dict[str, Any]]]:
    """Re-solve on each returned core until its selector set stabilizes."""
    if max_rounds <= 0:
        raise ValueError("max_rounds must be positive")
    known = {str(record["selector"]) for record in selector_map}
    if not set(initial) <= known:
        raise ValueError("seed core names selectors outside the rebuilt journal")
    current = initial
    rounds: list[dict[str, Any]] = []
    for index in range(max_rounds):
        solve = core_driver.run_piqd_core(
            journal_path, commands, current, solver, timeout_ms
        )
        if solve["solved"].get("status") != "UNSAT":
            raise RuntimeError(f"core refinement round {index} was not UNSAT")
        selected_records = core_driver.core_records(selector_map, solve["solved"])
        selected = tuple(str(record["selector"]) for record in selected_records)
        if not set(selected) <= set(current):
            raise RuntimeError("PIQD core escaped its assumption set")
        rounds.append(
            {
                "round": index,
                "input_size": len(current),
                "output_size": len(selected),
                "solve": solve,
            }
        )
        if set(selected) == set(current):
            return selected, rounds
        current = selected
    return current, rounds


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8") + b"\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seed-event", type=Path, required=True)
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--pin-role", action="append", type=sliced.parse_role_pin, default=[])
    parser.add_argument("--pin-row", action="append", type=sliced.parse_row_pin, default=[])
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", choices=("z3", "cvc5"), default="z3")
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    parser.add_argument("--max-rounds", type=int, default=8)
    args = parser.parse_args()

    roles, rows = sliced.normalize_pins(tuple(args.pin_role), tuple(args.pin_row))
    order = base.DIRECT_ORDER if args.orientation == "direct" else base.MIRROR_ORDER
    commands, selector_map, bank = core_driver.guarded_arithmetic_commands(
        order, roles, rows
    )
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    initial = seed_selectors(args.seed_event)
    selected, rounds = refine_core(
        args.out,
        commands,
        selector_map,
        initial,
        args.solver,
        args.timeout_ms,
        args.max_rounds,
    )
    by_selector = {str(record["selector"]): record for record in selector_map}
    final_records = tuple(by_selector[selector] for selector in selected)
    report = {
        "schema": SCHEMA,
        "claim_boundary": "one pinned exact-13 source cell; repeated arithmetic-core discovery only",
        "seed_event": str(args.seed_event),
        "orientation": args.orientation,
        "role_pins": roles,
        "row_pins": {name: list(support) for name, support in rows.items()},
        "order": list(order),
        "command_count": len(commands),
        "selector_count": len(selector_map),
        "conflict_count": len(bank),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "initial_core_size": len(initial),
        "final_core_size": len(selected),
        "rounds": rounds,
        "core_records": final_records,
    }
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_bytes(canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "initial_core_size": len(initial),
                "final_core_size": len(selected),
                "round_sizes": [row["output_size"] for row in rounds],
                "journal_sha256": report["journal_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
