# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mine a labelled arithmetic UNSAT core from one exact-13 source cell.

The finite source constraints and the direct two-row conflict bank stay
unconditional.  Every row-distance implication and strict Kalmanson inequality
gets its own Boolean selector.  A PIQD solve assumes every selector, so the
daemon's failed-assumption core identifies the arithmetic facts used by the
contradiction without weakening source admissibility.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_slice_piqd as sliced
import cardge13_exact13_tight_cover_lra_piqd as core

SCHEMA = "cardge13-exact13-global-source-cell-unsat-core-piqd/v1"


def assertion_body(command: str) -> str:
    """Return the body of one flat SMT assertion."""
    prefix = "(assert "
    if not command.startswith(prefix) or not command.endswith(")"):
        raise ValueError(f"not a flat SMT assertion: {command[:80]}")
    return command[len(prefix) : -1]


def pin_commands(
    roles: dict[str, int], rows: dict[str, tuple[int, ...]]
) -> tuple[str, ...]:
    commands = [f"(assert {base.role(name, roles[name])})" for name in sorted(roles)]
    for row in base.BASE_ROWS:
        if row in rows:
            commands.extend(f"(assert {base.member(row, point)})" for point in rows[row])
    return tuple(commands)


def guarded_arithmetic_commands(
    order: tuple[int, ...],
    roles: dict[str, int],
    rows: dict[str, tuple[int, ...]],
) -> tuple[tuple[str, ...], tuple[dict[str, object], ...], tuple[dict[str, object], ...]]:
    """Build the selector-guarded strict formula and its source map."""
    source = base.source_commands("strict")
    metric = base.distance_metric_commands(order, "strict")
    declarations = tuple(command for command in metric if command.startswith("(declare-"))
    assertions = tuple(command for command in metric if command.startswith("(assert "))
    if len(declarations) + len(assertions) != len(metric):
        raise ValueError("unexpected command in strict metric journal")

    kalmanson = base.kalmanson_forms(order)
    kalmanson_count = sum(command.startswith("(assert (> ") for command in assertions)
    if kalmanson_count != len(kalmanson):
        raise ValueError("strict Kalmanson assertion inventory drifted")
    first_kalmanson = len(assertions) - len(kalmanson)

    selector_map: list[dict[str, object]] = []
    guarded: list[str] = []
    for index, command in enumerate(assertions):
        selector = f"arith_{index:04d}"
        if index < first_kalmanson:
            metadata: dict[str, object] = {
                "selector": selector,
                "kind": "row-equality",
                "assertion": command,
            }
        else:
            metadata = {
                "selector": selector,
                "kind": "strict-kalmanson",
                "form": kalmanson[index - first_kalmanson]["form"],
                "assertion": command,
            }
        selector_map.append(metadata)
        guarded.append(f"(assert (=> {selector} {assertion_body(command)}))")

    bank = base.conflict_bank(order)
    conflict_commands = tuple(
        f"(assert {base.disjunction(f'(not {atom})' for atom in record['atoms'])})"
        for record in bank
    )
    commands = (
        source[0],
        *source[1:],
        *declarations,
        *(f"(declare-const {entry['selector']} Bool)" for entry in selector_map),
        *guarded,
        *conflict_commands,
        *pin_commands(roles, rows),
    )
    return commands, tuple(selector_map), bank


def run_piqd_core(
    path: Path,
    commands: tuple[str, ...],
    selectors: tuple[str, ...],
    solver: str,
    timeout_ms: int,
) -> dict[str, Any]:
    """Run one assumption-core query in an authenticated PIQD session."""
    created = core._run_json(
        [
            "session",
            "new",
            "--solver",
            solver,
            "--lane",
            "smt",
            "--label",
            "cardge13-exact13-global-source-arithmetic-core",
        ]
    )
    session_id = created.get("id")
    if type(session_id) is not str or not session_id:
        raise core.AuditError("piqd did not return an SMT session id")
    record: dict[str, Any] = {"solver": solver, "created": created}
    try:
        assertions: list[dict[str, Any]] = []
        expected_commands = 0
        for index, chunk in enumerate(base.command_chunks(commands)):
            chunk_path = path.parent.parent / "tmp" / f"{path.stem}-{solver}-{index:03d}.smt2"
            chunk_path.parent.mkdir(parents=True, exist_ok=True)
            chunk_path.write_bytes(("\n".join(chunk) + "\n").encode("ascii"))
            asserted = core._run_json(
                [
                    "session",
                    "assert",
                    session_id,
                    "--expect-commands",
                    str(expected_commands),
                    "--file",
                    str(chunk_path),
                ]
            )
            expected_commands += len(chunk)
            if asserted.get("commands") != expected_commands:
                raise core.AuditError("piqd assertion count drifted")
            assertions.append({"commands": expected_commands, "added": len(chunk)})
        solve_args = [
            "session",
            "solve",
            session_id,
            "--timeout-ms",
            str(timeout_ms),
            "--no-model",
        ]
        for selector in selectors:
            solve_args.extend(("--assume", selector))
        solved = core._run_json(
            solve_args, transport_timeout=max(180.0, timeout_ms / 1000 + 60.0)
        )
        record.update(
            assertions=assertions,
            solved=solved,
            receipts=core._run_json(["session", "receipts", session_id]),
        )
    finally:
        record["closed"] = core._run_json(["session", "close", session_id])
    return record


def core_records(
    selector_map: tuple[dict[str, object], ...], solved: dict[str, Any]
) -> tuple[dict[str, object], ...]:
    """Map the PIQD failed-assumption core back to arithmetic assertions."""
    if solved.get("status") != "UNSAT":
        return ()
    raw_core = solved.get("core")
    if not isinstance(raw_core, list) or not all(isinstance(item, str) for item in raw_core):
        raise core.AuditError("PIQD UNSAT response did not contain a string core")
    by_selector = {str(entry["selector"]): entry for entry in selector_map}
    unknown = sorted(set(raw_core) - set(by_selector))
    if unknown:
        raise core.AuditError(f"PIQD returned unknown core selectors: {unknown[:5]}")
    return tuple(by_selector[item] for item in raw_core)


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8") + b"\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--pin-role", action="append", type=sliced.parse_role_pin, default=[])
    parser.add_argument("--pin-row", action="append", type=sliced.parse_row_pin, default=[])
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", choices=("z3", "cvc5"), default="z3")
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    args = parser.parse_args()

    roles, rows = sliced.normalize_pins(tuple(args.pin_role), tuple(args.pin_row))
    order = base.DIRECT_ORDER if args.orientation == "direct" else base.MIRROR_ORDER
    commands, selector_map, bank = guarded_arithmetic_commands(order, roles, rows)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    selectors = tuple(str(entry["selector"]) for entry in selector_map)
    solve = run_piqd_core(args.out, commands, selectors, args.solver, args.timeout_ms)
    selected = core_records(selector_map, solve["solved"])
    report = {
        "schema": SCHEMA,
        "claim_boundary": "one pinned exact-13 source cell; arithmetic-core discovery only",
        "orientation": args.orientation,
        "role_pins": roles,
        "row_pins": {name: list(support) for name, support in rows.items()},
        "order": list(order),
        "command_count": len(commands),
        "selector_count": len(selector_map),
        "conflict_count": len(bank),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "solve": solve,
        "core_size": len(selected),
        "core_records": selected,
    }
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_bytes(canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "status": solve["solved"].get("status"),
                "selectors": len(selector_map),
                "core_size": len(selected),
                "journal_sha256": report["journal_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
