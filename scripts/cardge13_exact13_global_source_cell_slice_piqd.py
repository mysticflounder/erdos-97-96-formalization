# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Progressively pin source roles and retained rows in the exact-13 PIQD cell."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_global_source_cell_csp_piqd as base

SCHEMA = "cardge13-exact13-global-source-cell-slice-piqd/v1"


def parse_role_pin(value: str) -> tuple[str, int]:
    """Parse ``role=label`` and reject labels outside the raw carrier."""
    try:
        name, raw_label = value.split("=", 1)
        label = int(raw_label)
    except (ValueError, TypeError) as exc:
        raise argparse.ArgumentTypeError("role pin must be NAME=LABEL") from exc
    if name not in base.ROLES:
        raise argparse.ArgumentTypeError(f"role name must lie in {base.ROLES}")
    if label not in base.LABELS:
        raise argparse.ArgumentTypeError(f"role label must lie in {base.LABELS}")
    return name, label


def parse_row_pin(value: str) -> tuple[str, tuple[int, ...]]:
    """Parse ``row=p0,p1,p2,p3`` for one retained four-point row."""
    try:
        name, raw_support = value.split("=", 1)
        support = tuple(sorted(int(point) for point in raw_support.split(",")))
    except (ValueError, TypeError) as exc:
        raise argparse.ArgumentTypeError("row pin must be NAME=p0,p1,p2,p3") from exc
    if name not in base.BASE_ROWS:
        raise argparse.ArgumentTypeError(f"row name must lie in {base.BASE_ROWS}")
    if len(support) != 4 or len(set(support)) != 4:
        raise argparse.ArgumentTypeError("row support must contain four distinct labels")
    if any(point not in base.LABELS for point in support):
        raise argparse.ArgumentTypeError(f"row labels must lie in {base.LABELS}")
    return name, support


def normalize_pins(
    role_pins: tuple[tuple[str, int], ...],
    row_pins: tuple[tuple[str, tuple[int, ...]], ...],
) -> tuple[dict[str, int], dict[str, tuple[int, ...]]]:
    """Reject duplicate keys and obvious source-role incompatibilities."""
    roles: dict[str, int] = {}
    for name, label in role_pins:
        if name in roles:
            raise ValueError(f"duplicate role pin: {name}")
        roles[name] = label
    rows: dict[str, tuple[int, ...]] = {}
    for name, support in row_pins:
        if name in rows:
            raise ValueError(f"duplicate row pin: {name}")
        rows[name] = support
    for blocker in ("b0", "b1"):
        if roles.get(blocker) in (base.SECOND_APEX, base.FIRST_APEX):
            raise ValueError("a blocker label cannot be an apex label")
    if "b0" in roles and roles.get("b1") == roles["b0"]:
        raise ValueError("the two blocker labels must be distinct")
    if "s0" in roles and roles.get("s1") == roles["s0"]:
        raise ValueError("the two source labels must be distinct")
    return roles, rows


def build_commands(
    order: tuple[int, ...],
    role_pins: tuple[tuple[str, int], ...] = (),
    row_pins: tuple[tuple[str, tuple[int, ...]], ...] = (),
    linear_mode: str = "strict",
) -> tuple[tuple[str, ...], tuple[dict[str, object], ...]]:
    """Append one deterministic source/row slice to the global formula."""
    roles, rows = normalize_pins(role_pins, row_pins)
    commands, bank = base.build_commands(order, linear_mode)
    extra = [
        f"(assert {base.role(name, roles[name])})" for name in sorted(roles)
    ]
    for row in base.BASE_ROWS:
        if row in rows:
            extra.extend(f"(assert {base.member(row, point)})" for point in rows[row])
    return (*commands, *extra), bank


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--linear-mode", choices=("equality", "strict"), default="strict")
    parser.add_argument("--pin-role", action="append", type=parse_role_pin, default=[])
    parser.add_argument("--pin-row", action="append", type=parse_row_pin, default=[])
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--max-refinements", type=int, default=25)
    args = parser.parse_args()

    role_pins, row_pins = normalize_pins(tuple(args.pin_role), tuple(args.pin_row))
    order = base.DIRECT_ORDER if args.orientation == "direct" else base.MIRROR_ORDER
    commands, bank = build_commands(
        order, tuple(role_pins.items()), tuple(row_pins.items()), args.linear_mode
    )
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    label_suffix = "-".join(f"{name}-{label}" for name, label in sorted(role_pins.items()))
    solves = (
        base.run_piqd_chunked(
            args.out,
            commands,
            tuple(args.solver or ()),
            args.timeout_ms,
            label=f"cardge13-exact13-global-slice-{args.orientation}-{label_suffix}",
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
            "one explicitly pinned source-role/retained-row slice of the global "
            "exact-13 cell; formula-scoped diagnostic"
        ),
        "orientation": args.orientation,
        "linear_mode": args.linear_mode,
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
                "role_pins": role_pins,
                "row_pins": row_pins,
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
