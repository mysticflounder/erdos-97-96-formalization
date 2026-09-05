# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Resume exact-13 PIQD CEGAR from prior incidence-path cut events."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import cardge13_exact13_global_source_cell_boolean_path_pair_cegar_piqd as learner
import cardge13_exact13_global_source_cell_boolean_slice_piqd as boolean
import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_exact13_global_source_cell_slice_piqd as sliced

SCHEMA = "cardge13-exact13-global-source-cell-boolean-path-pair-resume-piqd/v1"


def iteration_cuts(iteration: dict[str, object], path: Path) -> tuple[str, ...]:
    """Read legacy one-cut and iterative batched-cut records uniformly."""
    candidates: list[object] = []
    direct = iteration.get("cut")
    if direct is not None:
        candidates.append(direct)
    batch = iteration.get("new_conflicts")
    if batch is not None:
        if not isinstance(batch, list):
            raise TypeError(f"seed event has malformed conflict batch: {path}")
        for entry in batch:
            if not isinstance(entry, dict):
                raise TypeError(f"seed event has malformed batched conflict: {path}")
            candidates.append(entry.get("cut"))
    cuts: list[str] = []
    for cut in candidates:
        if not isinstance(cut, str) or not cut.startswith("(assert (or "):
            raise ValueError(f"seed event has malformed learned cut: {path}")
        cuts.append(cut)
    return tuple(cuts)


def seed_cuts(paths: tuple[Path, ...]) -> tuple[tuple[str, ...], tuple[dict[str, object], ...]]:
    """Load unique learned clauses and bind each seed event by SHA-256."""
    seen: set[str] = set()
    cuts: list[str] = []
    sources: list[dict[str, object]] = []
    for path in paths:
        payload = path.read_bytes()
        value = json.loads(payload)
        solves = value.get("solves")
        if not isinstance(solves, list):
            raise TypeError(f"seed event has no solves array: {path}")
        source_count = 0
        for solve in solves:
            if not isinstance(solve, dict):
                raise TypeError(f"seed event has malformed solve: {path}")
            iterations = solve.get("iterations")
            if iterations is None and solve.get("cut") is not None:
                iterations = [solve]
            if not isinstance(iterations, list):
                raise TypeError(f"seed event has no iterations array: {path}")
            for iteration in iterations:
                if not isinstance(iteration, dict):
                    raise TypeError(f"seed event has malformed iteration: {path}")
                for cut in iteration_cuts(iteration, path):
                    source_count += 1
                    if cut not in seen:
                        seen.add(cut)
                        cuts.append(cut)
        sources.append(
            {
                "path": str(path),
                "sha256": hashlib.sha256(payload).hexdigest(),
                "cut_occurrences": source_count,
            }
        )
    return tuple(cuts), tuple(sources)


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seed-event", action="append", type=Path, required=True)
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--pin-role", action="append", type=sliced.parse_role_pin, default=[])
    parser.add_argument("--pin-row", action="append", type=sliced.parse_row_pin, default=[])
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-refinements", type=int, default=1000)
    args = parser.parse_args()

    role_pins, row_pins = sliced.normalize_pins(tuple(args.pin_role), tuple(args.pin_row))
    order = base.DIRECT_ORDER if args.orientation == "direct" else base.MIRROR_ORDER
    base_commands, bank = boolean.build_commands(
        order, tuple(role_pins.items()), tuple(row_pins.items())
    )
    cuts, seed_sources = seed_cuts(tuple(args.seed_event))
    commands = (*base_commands, *cuts)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)

    original_learner = base.minimal_linear_conflict
    base.minimal_linear_conflict = learner.minimal_incidence_linear_conflict
    try:
        solves = (
            base.run_piqd_chunked(
                args.out,
                commands,
                tuple(args.solver or ()),
                args.timeout_ms,
                label=f"cardge13-exact13-boolean-path-pair-resume-{args.orientation}",
                order=order,
                max_refinements=args.max_refinements,
            )
            if args.solver
            else []
        )
    finally:
        base.minimal_linear_conflict = original_learner

    report = {
        "schema": SCHEMA,
        "claim_boundary": (
            "one pinned source-combinatorial slice with cumulative one- and two-form "
            "incidence-path cuts; no free distance variables"
        ),
        "orientation": args.orientation,
        "role_pins": role_pins,
        "row_pins": {name: list(support) for name, support in row_pins.items()},
        "order": list(order),
        "base_command_count": len(base_commands),
        "base_conflict_count": len(bank),
        "seed_cut_count": len(cuts),
        "seed_sources": seed_sources,
        "command_count": len(commands),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "solves": solves,
        "cegar_statuses": [solve.get("cegar_status") for solve in solves],
    }
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_bytes(canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "seed_cuts": len(cuts),
                "commands": len(commands),
                "journal_sha256": report["journal_sha256"],
                "statuses": [row.get("solved", {}).get("status") for row in solves],
                "cegar_statuses": [row.get("cegar_status") for row in solves],
                "iterations": [len(row.get("iterations", ())) for row in solves],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
