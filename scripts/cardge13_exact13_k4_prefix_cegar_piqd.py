# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Incrementally add source-faithful global-K4 rows to the exact-13 PIQD cell.

The earlier monolithic all-center query timed out.  This driver keeps one PIQD
SMT session per solver and adds one carrier-center K4 existential at a time,
recording the first prefix at which the retained exact-13 abstraction becomes
inconsistent or solver-intractable.  Prefix SAT models are diagnostic only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Iterable
from pathlib import Path
from typing import Any

import cardge13_exact13_retained_first_row_lra_piqd as retained

core = retained.base

SCHEMA = "cardge13-exact13-k4-prefix-cegar-piqd/v3"
FULL_ORDER = (0, 1, 8, 9, 10, 11, 12, 2, 3, 4, 5, 6, 7)
COMPACT_ORDER = tuple(center for center in FULL_ORDER if center not in (0, 1))
DEFAULT_ORDER = FULL_ORDER
CLAIM_BOUNDARY = (
    "incremental source-necessary global-K4 prefixes over the retained direct-profile "
    "exact-13 abstract Kalmanson cell; SAT is an abstract survivor and UNSAT is "
    "formula-scoped until source/encoding and Lean-ingress gates are checked"
)


class PrefixAuditError(RuntimeError):
    """An emitted prefix or PIQD custody response failed validation."""


def _member(center: int, point: int) -> str:
    return f"m_G{center}_{point}"


def validate_order(centers: Iterable[int]) -> tuple[int, ...]:
    """Validate and normalize a duplicate-free raw-center order."""
    result = tuple(centers)
    if len(set(result)) != len(result):
        raise ValueError("center order contains a duplicate")
    invalid = tuple(center for center in result if center not in core.LABELS)
    if invalid:
        raise ValueError(f"raw centers must lie in {core.LABELS}: {invalid}")
    return result


def k4_delta_commands(center: int) -> tuple[str, ...]:
    """Commands for one existential four-support row at ``center``."""
    validate_order((center,))
    members = tuple(_member(center, point) for point in core.LABELS)
    commands = [f"(declare-const {member} Bool)" for member in members]
    commands.extend(
        (
            f"(declare-const r_G{center} Real)",
            f"(assert {core._exactly(members, 4)})",
            f"(assert (>= r_G{center} 1))",
            f"(assert (not {_member(center, center)}))",
        )
    )
    for point in core.LABELS:
        if point == center:
            continue
        commands.append(
            f"(assert (=> {_member(center, point)} "
            f"(= {core._distance(center, point)} r_G{center})))"
        )
    return tuple(commands)


def _uncovered_by_known_rows(center: int) -> str:
    """Guard saying neither variable blocker row is centered at ``center``."""
    return (
        f"(and (not {core._role('b0', center)}) "
        f"(not {core._role('b1', center)}))"
    )


def guarded_k4_delta_commands(center: int) -> tuple[str, ...]:
    """K4 row needed only away from the four already represented centers.

    The retained base already supplies K/L at raw center 0, T at raw center 1,
    C0 at the center selected by ``b0``, and C1 at the center selected by
    ``b1``.  For every other raw center, global K4 supplies one four-point
    equidistant support.  Centers 0 and 1 are therefore excluded from the
    compact prefix, while the remaining rows are guarded against b0/b1.
    """
    validate_order((center,))
    if center in (0, 1):
        raise ValueError("raw centers 0 and 1 already have retained K4 witnesses")
    guard = _uncovered_by_known_rows(center)
    members = tuple(_member(center, point) for point in core.LABELS)
    commands = [f"(declare-const {member} Bool)" for member in members]
    commands.extend(
        (
            f"(declare-const r_G{center} Real)",
            f"(assert (=> {guard} {core._exactly(members, 4)}))",
            f"(assert (=> {guard} (>= r_G{center} 1)))",
            f"(assert (=> {guard} (not {_member(center, center)})))",
        )
    )
    for point in core.LABELS:
        if point == center:
            continue
        commands.append(
            f"(assert (=> (and {guard} {_member(center, point)}) "
            f"(= {core._distance(center, point)} r_G{center})))"
        )
    return tuple(commands)


def build_commands(centers: Iterable[int]) -> tuple[str, ...]:
    """Return the retained base followed by the requested K4 prefix."""
    order = validate_order(centers)
    commands = list(retained.build_commands())
    for center in order:
        commands.extend(k4_delta_commands(center))
    return tuple(commands)


def build_guarded_commands(centers: Iterable[int]) -> tuple[str, ...]:
    """Return the retained base followed by guarded nonredundant K4 rows."""
    order = validate_order(centers)
    commands = list(retained.build_commands())
    for center in order:
        commands.extend(guarded_k4_delta_commands(center))
    return tuple(commands)


def validate_blocker_pair(b0: int, b1: int) -> tuple[int, int]:
    """Validate an ordered pair allowed by the retained source abstraction."""
    validate_order((b0, b1))
    if 0 in (b0, b1):
        raise ValueError("blocker centers cannot equal raw second-apex center 0")
    return b0, b1


def pinned_center_order(b0: int, b1: int) -> tuple[int, ...]:
    """Raw centers still needing a fresh K4 row after role pinning."""
    validate_blocker_pair(b0, b1)
    represented = {0, 1, b0, b1}
    return tuple(center for center in FULL_ORDER if center not in represented)


def pinned_base_commands(b0: int, b1: int) -> tuple[str, ...]:
    """Retained exact-13 base with one ordered blocker pair selected."""
    validate_blocker_pair(b0, b1)
    return (
        *retained.build_commands(),
        f"(assert {core._role('b0', b0)})",
        f"(assert {core._role('b1', b1)})",
    )


def source_witness_commands() -> tuple[str, ...]:
    """Source-necessary raw labels for the two good sources and deletion.

    These constraints are a diagnostic strengthening, not an admitted
    semantic refinement.  Their Lean producer is the exact-13 raw ingress:
    the W source rows contain their named sources; good outside sources miss
    the first-apex row; the common deletion lies in that row, misses C0/C1,
    and the tight cover puts it at z or in K.
    """
    commands: list[str] = []
    for role in ("b0", "b1"):
        commands.append(
            f"(assert (not {core._role(role, retained.FIRST_APEX)}))"
        )
    for role in ("s0", "s1", "d"):
        for point in core.LABELS:
            commands.append(f"(declare-const {core._role(role, point)} Bool)")
        commands.append(
            f"(assert {core._exactly_one(core._role(role, point) for point in core.LABELS)})"
        )
    for point in core.LABELS:
        s0 = core._role("s0", point)
        s1 = core._role("s1", point)
        deleted = core._role("d", point)
        commands.extend(
            (
                f"(assert (not (and {s0} {s1})))",
                f"(assert (=> {s0} {core._member('C0', point)}))",
                f"(assert (=> {s1} {core._member('C1', point)}))",
                f"(assert (=> {s0} (not m_T_{point})))",
                f"(assert (=> {s1} (not m_T_{point})))",
                f"(assert (=> {deleted} m_T_{point}))",
                f"(assert (=> {deleted} (not {core._member('C0', point)})))",
                f"(assert (=> {deleted} (not {core._member('C1', point)})))",
                (
                    f"(assert (=> {deleted} (or {core._role('z', point)} "
                    f"{core._member('K', point)})))"
                ),
            )
        )
    return tuple(commands)


def build_pinned_commands(b0: int, b1: int, centers: Iterable[int]) -> tuple[str, ...]:
    """Return a pinned base followed by unguarded rows at uncovered centers."""
    order = validate_order(centers)
    allowed = set(pinned_center_order(b0, b1))
    if not set(order) <= allowed:
        raise ValueError("pinned K4 prefix contains an already represented center")
    commands = list(pinned_base_commands(b0, b1))
    for center in order:
        commands.extend(k4_delta_commands(center))
    return tuple(commands)


def journal_bytes(commands: Iterable[str]) -> bytes:
    return ("\n".join(commands) + "\n").encode("ascii")


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _write_journal(path: Path, commands: tuple[str, ...]) -> dict[str, Any]:
    payload = journal_bytes(commands)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)
    return {
        "path": str(path),
        "sha256": _sha256(payload),
        "commands": len(commands),
    }


def _validate_solve(solver: str, prefix: tuple[int, ...], solved: Any) -> dict[str, Any]:
    if not isinstance(solved, dict):
        raise PrefixAuditError(f"{solver} prefix {prefix}: malformed solve response")
    status = solved.get("status")
    if status not in ("SAT", "UNSAT", "UNKNOWN"):
        raise PrefixAuditError(f"{solver} prefix {prefix}: invalid status {status!r}")
    replay = solved.get("model_replay")
    if status == "SAT" and (
        not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED"
    ):
        raise PrefixAuditError(f"{solver} prefix {prefix}: SAT model was not replayed")
    return {
        "status": status,
        "solve_ms": solved.get("solve_ms"),
        "result_sha256": solved.get("result_sha256"),
        "model_replay": replay if status == "SAT" else None,
        "model": solved.get("model") if status == "SAT" else None,
    }


def run_incremental(
    *,
    out_dir: Path,
    order: tuple[int, ...],
    solvers: tuple[str, ...],
    timeout_ms: int,
    coverage_mode: str = "full",
    pin_b0: int | None = None,
    pin_b1: int | None = None,
    solve_base: bool = False,
) -> list[dict[str, Any]]:
    """Run one warm incremental PIQD session for each requested solver."""
    if coverage_mode not in ("full", "guarded", "pinned", "pinned-source"):
        raise ValueError(f"unsupported coverage mode: {coverage_mode}")
    if coverage_mode in ("pinned", "pinned-source"):
        if pin_b0 is None or pin_b1 is None:
            raise ValueError("pinned coverage requires both blocker centers")
        base_commands = pinned_base_commands(pin_b0, pin_b1)
        if coverage_mode == "pinned-source":
            base_commands = (*base_commands, *source_witness_commands())
        delta_builder = k4_delta_commands
    else:
        if pin_b0 is not None or pin_b1 is not None:
            raise ValueError("blocker pins require pinned coverage mode")
        base_commands = retained.build_commands()
        delta_builder = (
            k4_delta_commands if coverage_mode == "full" else guarded_k4_delta_commands
        )
    base = _write_journal(out_dir / "base.smt2", base_commands)
    reports: list[dict[str, Any]] = []
    for solver in solvers:
        created = core._run_json(
            ["session", "new", "--solver", solver, "--lane", "smt", "--label",
             f"cardge13-exact13-k4-prefix-cegar-{coverage_mode}"]
        )
        session_id = created.get("id")
        if not isinstance(session_id, str) or not session_id:
            raise PrefixAuditError(f"{solver}: PIQD returned no session id")
        solver_report: dict[str, Any] = {
            "solver": solver,
            "created": created,
            "base": base,
            "base_solve": None,
            "prefixes": [],
        }
        command_count = 0
        try:
            asserted = core._run_json(
                ["session", "assert", session_id, "--expect-commands", "0", "--file",
                 str(base["path"])]
            )
            command_count = len(base_commands)
            if asserted.get("commands") != command_count:
                raise PrefixAuditError(f"{solver}: base command count drifted")
            if solve_base:
                solved = core._run_json(
                    ["session", "solve", session_id, "--timeout-ms", str(timeout_ms)],
                    transport_timeout=max(180.0, timeout_ms / 1000 + 60.0),
                )
                solver_report["base_solve"] = _validate_solve(solver, (), solved)
                if solver_report["base_solve"]["status"] == "UNSAT":
                    solver_report["receipts"] = core._run_json(
                        ["session", "receipts", session_id]
                    )
                    reports.append(solver_report)
                    continue
            for step, center in enumerate(order, start=1):
                delta_commands = delta_builder(center)
                delta = _write_journal(
                    out_dir / f"prefix-{step:02d}-center-{center:02d}.smt2",
                    delta_commands,
                )
                asserted = core._run_json(
                    ["session", "assert", session_id, "--expect-commands",
                     str(command_count), "--file", str(delta["path"])]
                )
                command_count += len(delta_commands)
                if asserted.get("commands") != command_count:
                    raise PrefixAuditError(
                        f"{solver} prefix {order[:step]}: command count drifted"
                    )
                solved = core._run_json(
                    ["session", "solve", session_id, "--timeout-ms", str(timeout_ms)],
                    transport_timeout=max(180.0, timeout_ms / 1000 + 60.0),
                )
                summary = _validate_solve(solver, order[:step], solved)
                solver_report["prefixes"].append(
                    {
                        "step": step,
                        "added_center": center,
                        "centers": list(order[:step]),
                        "delta": delta,
                        "session_commands": command_count,
                        "solve": summary,
                    }
                )
                if summary["status"] == "UNSAT":
                    break
            solver_report["receipts"] = core._run_json(
                ["session", "receipts", session_id]
            )
        finally:
            solver_report["closed"] = core._run_json(
                ["session", "close", session_id]
            )
        reports.append(solver_report)
    return reports


def canonical_json_bytes(value: object) -> bytes:
    return (
        json.dumps(value, ensure_ascii=True, sort_keys=True, indent=2).encode("utf-8")
        + b"\n"
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument(
        "--coverage-mode",
        choices=("full", "guarded", "pinned", "pinned-source"),
        default="full",
    )
    parser.add_argument("--pin-b0", type=int)
    parser.add_argument("--pin-b1", type=int)
    parser.add_argument("--max-prefix", type=int)
    parser.add_argument("--solve-base", action="store_true")
    args = parser.parse_args()
    if args.coverage_mode in ("pinned", "pinned-source"):
        if args.pin_b0 is None or args.pin_b1 is None:
            parser.error("--coverage-mode pinned requires --pin-b0 and --pin-b1")
        try:
            complete_order = pinned_center_order(args.pin_b0, args.pin_b1)
        except ValueError as error:
            parser.error(str(error))
    else:
        if args.pin_b0 is not None or args.pin_b1 is not None:
            parser.error("--pin-b0/--pin-b1 require --coverage-mode pinned")
        complete_order = FULL_ORDER if args.coverage_mode == "full" else COMPACT_ORDER
    max_prefix = len(complete_order) if args.max_prefix is None else args.max_prefix
    if not 0 <= max_prefix <= len(complete_order):
        parser.error(f"--max-prefix must lie in 0..{len(complete_order)}")
    order = complete_order[:max_prefix]
    args.out_dir.mkdir(parents=True, exist_ok=True)
    args.event.parent.mkdir(parents=True, exist_ok=True)
    report: dict[str, Any] = {
        "schema": SCHEMA,
        "created_utc": core._utc_now(),
        "claim_boundary": CLAIM_BOUNDARY,
        "coverage_mode": args.coverage_mode,
        "blocker_pins": (
            {"b0": args.pin_b0, "b1": args.pin_b1}
            if args.coverage_mode in ("pinned", "pinned-source")
            else None
        ),
        "center_order": list(order),
        "timeout_ms": args.timeout_ms,
        "base_commands": (
            len(pinned_base_commands(args.pin_b0, args.pin_b1))
            + (len(source_witness_commands()) if args.coverage_mode == "pinned-source" else 0)
            if args.coverage_mode in ("pinned", "pinned-source")
            else len(retained.build_commands())
        ),
        "piqd": core._run_json(["version"]) if args.solver else None,
        "solvers": run_incremental(
            out_dir=args.out_dir,
            order=order,
            solvers=tuple(args.solver or ()),
            timeout_ms=args.timeout_ms,
            coverage_mode=args.coverage_mode,
            pin_b0=args.pin_b0,
            pin_b1=args.pin_b1,
            solve_base=args.solve_base,
        ),
    }
    payload = canonical_json_bytes(report)
    args.event.write_bytes(payload)
    print(
        json.dumps(
            {
                "event": str(args.event),
                "event_sha256": _sha256(payload),
                "statuses": {
                    row["solver"]: [
                        item["solve"]["status"] for item in row["prefixes"]
                    ]
                    for row in report["solvers"]
                },
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
