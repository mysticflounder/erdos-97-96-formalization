"""Emit and run the CardGe13 exact-tight-cover Kalmanson relaxation via piqd.

This is a discovery query, not a theorem certificate.  It deliberately assumes
the not-yet-formalized exact-13 tight-cover branch and leaves planar
realizability, cap predicates, and frontier provenance to later stages.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from collections.abc import Iterable
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

LABELS = tuple(range(13))
SECOND_APEX = 0
SECOND_OPPOSITE_INTERIOR = frozenset(range(8, 13))
DIRECT_ORDER = (2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7)
ROWS = ("C0", "C1", "K", "L")
CENTERS = ("b0", "b1")


class AuditError(RuntimeError):
    pass


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _distance(i: int, j: int) -> str:
    if i == j:
        raise AuditError("self-distance has no variable")
    left, right = sorted((i, j))
    return f"d_{left}_{right}"


def _member(row: str, i: int) -> str:
    return f"m_{row}_{i}"


def _role(role: str, i: int) -> str:
    return f"is_{role}_{i}"


def _sum_bools(terms: Iterable[str]) -> str:
    pieces = [f"(ite {term} 1 0)" for term in terms]
    return f"(+ {' '.join(pieces)})"


def _exactly_one(terms: Iterable[str]) -> str:
    return f"(= {_sum_bools(terms)} 1)"


def _exactly(terms: Iterable[str], value: int) -> str:
    return f"(= {_sum_bools(terms)} {value})"


def _at_most(terms: Iterable[str], value: int) -> str:
    return f"(<= {_sum_bools(terms)} {value})"


def build_commands() -> tuple[str, ...]:
    commands: list[str] = [
        "(set-logic QF_LIRA)",
    ]

    for i, j in itertools.combinations(LABELS, 2):
        commands.append(f"(declare-const {_distance(i, j)} Real)")
    for row in ROWS:
        for i in LABELS:
            commands.append(f"(declare-const {_member(row, i)} Bool)")
    for role in ("z", *CENTERS):
        for i in LABELS:
            commands.append(f"(declare-const {_role(role, i)} Bool)")
    for row in ROWS:
        commands.append(f"(declare-const r_{row} Real)")

    # Homogeneous strict inequalities are normalized to a common unit slack.
    for i, j in itertools.combinations(LABELS, 2):
        commands.append(f"(assert (>= {_distance(i, j)} 1))")

    for i, j, k in itertools.combinations(LABELS, 3):
        dij, dik, djk = _distance(i, j), _distance(i, k), _distance(j, k)
        commands.extend(
            (
                f"(assert (>= (+ {dij} {dik}) (+ {djk} 1)))",
                f"(assert (>= (+ {dij} {djk}) (+ {dik} 1)))",
                f"(assert (>= (+ {dik} {djk}) (+ {dij} 1)))",
            )
        )

    for a, b, c, d in itertools.combinations(DIRECT_ORDER, 4):
        crossing = f"(+ {_distance(a, c)} {_distance(b, d)})"
        commands.extend(
            (
                f"(assert (>= {crossing} (+ {_distance(a, b)} {_distance(c, d)} 1)))",
                f"(assert (>= {crossing} (+ {_distance(a, d)} {_distance(b, c)} 1)))",
            )
        )

    for row in ROWS:
        commands.append(f"(assert {_exactly((_member(row, i) for i in LABELS), 4)})")
        commands.append(f"(assert (>= r_{row} 1))")
    commands.append("(assert (or (>= r_K (+ r_L 1)) (>= r_L (+ r_K 1))))")

    commands.append(
        f"(assert {_exactly_one(_role('z', i) for i in SECOND_OPPOSITE_INTERIOR)})"
    )
    for i in LABELS:
        if i not in SECOND_OPPOSITE_INTERIOR:
            commands.append(f"(assert (not {_role('z', i)}))")
        commands.append(
            "(assert "
            + _exactly_one(
                (_role("z", i), _member("C0", i), _member("C1", i), _member("K", i))
            )
            + ")"
        )
        commands.append(f"(assert (=> {_role('z', i)} {_member('L', i)}))")
        commands.append(
            f"(assert (=> {_member('L', i)} (not {_member('K', i)})))"
        )

    commands.append(f"(assert (not {_member('K', SECOND_APEX)}))")
    commands.append(f"(assert (not {_member('L', SECOND_APEX)}))")
    for i in SECOND_OPPOSITE_INTERIOR:
        commands.append(
            f"(assert (or {_member('K', i)} {_member('L', i)}))"
        )
    k_interior = (_member("K", i) for i in SECOND_OPPOSITE_INTERIOR)
    commands.append(
        f"(assert (or {_exactly(k_interior, 2)} "
        f"{_exactly((_member('K', i) for i in SECOND_OPPOSITE_INTERIOR), 3)}))"
    )
    commands.append(
        f"(assert {_at_most((f'(and {_member('C0', i)} {_member('L', i)})' for i in LABELS), 2)})"
    )
    commands.append(
        f"(assert {_at_most((f'(and {_member('C1', i)} {_member('L', i)})' for i in LABELS), 2)})"
    )

    for role in CENTERS:
        commands.append(f"(assert {_exactly_one(_role(role, i) for i in LABELS)})")
        commands.append(f"(assert (not {_role(role, SECOND_APEX)}))")
    for i in LABELS:
        commands.append(
            f"(assert (not (and {_role('b0', i)} {_role('b1', i)})))"
        )
        commands.append(
            f"(assert (=> {_role('b0', i)} (not {_member('C0', i)})))"
        )
        commands.append(
            f"(assert (=> {_role('b1', i)} (not {_member('C1', i)})))"
        )

    for row in ("K", "L"):
        for i in LABELS:
            if i == SECOND_APEX:
                continue
            dij = _distance(SECOND_APEX, i)
            commands.append(f"(assert (=> {_member(row, i)} (= {dij} r_{row})))")
            commands.append(
                f"(assert (=> (not {_member(row, i)}) "
                f"(or (>= {dij} (+ r_{row} 1)) (>= r_{row} (+ {dij} 1)))))"
            )

    for row, role in (("C0", "b0"), ("C1", "b1")):
        for center in LABELS:
            for support in LABELS:
                if center == support:
                    continue
                commands.append(
                    f"(assert (=> (and {_role(role, center)} {_member(row, support)}) "
                    f"(= {_distance(center, support)} r_{row})))"
                )

    return tuple(commands)


def inventory(commands: tuple[str, ...]) -> dict[str, int]:
    return {
        "commands": len(commands),
        "distance_variables": 78,
        "triangle_strict_forms": 3 * 286,
        "kalmanson_strict_forms": 2 * 715,
        "point_labels": 13,
        "row_supports": 4,
    }


def journal_bytes() -> bytes:
    return ("\n".join(build_commands()) + "\n").encode("ascii")


def _run_json(arguments: list[str], *, transport_timeout: float = 180.0) -> dict[str, Any]:
    completed = subprocess.run(
        ["piqc", *arguments],
        check=False,
        capture_output=True,
        text=True,
        timeout=transport_timeout,
    )
    if completed.returncode != 0:
        raise AuditError(f"piqc {' '.join(arguments[:3])} failed: {completed.stderr[:1000]}")
    value = json.loads(completed.stdout)
    if type(value) is not dict:
        raise AuditError("piqc response is not a JSON object")
    return value


def run_piqd(
    path: Path,
    commands: tuple[str, ...],
    solvers: tuple[str, ...],
    timeout_ms: int,
    *,
    label: str = "cardge13-exact13-tight-lra",
) -> list[dict[str, Any]]:
    results: list[dict[str, Any]] = []
    expected_commands = len(commands)
    for solver in solvers:
        created = _run_json(
            ["session", "new", "--solver", solver, "--lane", "smt", "--label", label]
        )
        session_id = created.get("id")
        if type(session_id) is not str or not session_id:
            raise AuditError("piqd did not return a session id")
        record: dict[str, Any] = {"solver": solver, "created": created}
        try:
            asserted = _run_json(
                ["session", "assert", session_id, "--expect-commands", "0", "--file", str(path)]
            )
            if asserted.get("commands") != expected_commands:
                raise AuditError("piqd command count differs from emitted journal")
            solved = _run_json(
                ["session", "solve", session_id, "--timeout-ms", str(timeout_ms)],
                transport_timeout=max(180.0, timeout_ms / 1000 + 60.0),
            )
            receipts = _run_json(["session", "receipts", session_id])
            record.update(asserted=asserted, solved=solved, receipts=receipts)
        finally:
            record["closed"] = _run_json(["session", "close", session_id])
        results.append(record)
    return results


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()
    payload = journal_bytes()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(payload)
    report: dict[str, Any] = {
        "schema": "cardge13-exact13-tight-cover-lra-piqd/v1",
        "created_utc": _utc_now(),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(payload).hexdigest(),
        "inventory": inventory(build_commands()),
        "claim_boundary": "conditional exact-tight-cover Kalmanson-metric discovery only",
        "solves": [],
    }
    if args.solver:
        report["solves"] = run_piqd(
            args.out, build_commands(), tuple(args.solver), args.timeout_ms
        )
    if args.event:
        args.event.parent.mkdir(parents=True, exist_ok=True)
        args.event.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    summary = {
        "journal_sha256": report["journal_sha256"],
        "inventory": report["inventory"],
        "statuses": [row.get("solved", {}).get("status") for row in report["solves"]],
    }
    print(json.dumps(summary, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
