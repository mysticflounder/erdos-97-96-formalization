# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Run the exact-fixed-row existential K4 query at each raw CardGe13 center."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_center9_row_domain_piqd as center9

core = center9.core

SCHEMA = "cardge13-exact13-exactfixed-center-scan-piqd/v1"
CLAIM_BOUNDARY = (
    "thirteen isolated existential four-support queries in one fixed exact-13 "
    "abstract strict metric cell with five exact fixed rows; no planar realization, "
    "source pullback, or live-branch closure asserted"
)


class ScanError(RuntimeError):
    """The emitted query or returned PIQD evidence failed an audit check."""


def _member(center: int, point: int) -> str:
    return f"m_G{center}_{point}"


def _validate_center(center: int) -> None:
    if center not in core.LABELS:
        raise ValueError(f"raw center must be in {core.LABELS}: {center}")


def build_commands(center: int) -> tuple[str, ...]:
    """Build one exact-fixed-row query with a four-support row at ``center``."""
    _validate_center(center)
    commands = list(
        center9.build_commands(include_center9_k4=False, exact_fixed_rows=True)
    )
    points = tuple(point for point in core.LABELS if point != center)
    members = tuple(_member(center, point) for point in points)
    commands.extend(f"(declare-const {member} Bool)" for member in members)
    commands.extend(
        (
            f"(declare-const r_G{center} Real)",
            f"(assert {core._exactly(members, 4)})",
            f"(assert (>= r_G{center} 1))",
        )
    )
    for point, member in zip(points, members, strict=True):
        commands.append(
            f"(assert (=> {member} (= {core._distance(center, point)} r_G{center})))"
        )
    result = tuple(commands)
    if center == center9.CENTER:
        expected = center9.build_commands(exact_fixed_rows=True)
        if result != expected:
            raise ScanError("center-9 query drifted from the existing producer")
    return result


def journal_bytes(center: int) -> bytes:
    return ("\n".join(build_commands(center)) + "\n").encode("ascii")


def allowed_statuses(center: int, solver: str) -> frozenset[str]:
    """Return the bounded expected discovery statuses for one solver/center."""
    _validate_center(center)
    if solver == "z3":
        return frozenset(("UNSAT",)) if center == 9 else frozenset(("SAT",))
    if solver == "cvc5":
        if center == 9:
            return frozenset(("UNSAT",))
        if center in (1, 3):
            return frozenset(("SAT", "UNKNOWN"))
        return frozenset(("SAT",))
    raise ValueError(f"unsupported solver: {solver}")


def summarize_solve(
    *, center: int, journal_sha256: str, commands: int, record: dict[str, Any]
) -> dict[str, Any]:
    """Validate PIQD custody and return a compact solve summary."""
    solver = record.get("solver")
    if not isinstance(solver, str):
        raise ScanError("PIQD solve record has no solver name")
    solved = record.get("solved")
    if not isinstance(solved, dict):
        raise ScanError(f"{solver} center {center}: missing solve response")
    status = solved.get("status")
    if status not in allowed_statuses(center, solver):
        raise ScanError(f"{solver} center {center}: unexpected status {status!r}")
    asserted = record.get("asserted")
    if not isinstance(asserted, dict) or asserted.get("commands") != commands:
        raise ScanError(f"{solver} center {center}: asserted command count drifted")
    receipt_envelope = record.get("receipts")
    if not isinstance(receipt_envelope, dict):
        raise ScanError(f"{solver} center {center}: missing receipt envelope")
    receipts = receipt_envelope.get("receipts")
    if not isinstance(receipts, list) or len(receipts) != 1:
        raise ScanError(f"{solver} center {center}: expected exactly one receipt")
    receipt = receipts[0]
    if not isinstance(receipt, dict):
        raise ScanError(f"{solver} center {center}: malformed receipt")
    if receipt.get("base_sha256") != journal_sha256:
        raise ScanError(f"{solver} center {center}: receipt journal hash drifted")
    if receipt.get("base_commands") != commands or receipt.get("status") != status:
        raise ScanError(f"{solver} center {center}: receipt metadata drifted")
    if receipt.get("result_sha256") != solved.get("result_sha256"):
        raise ScanError(f"{solver} center {center}: result hash drifted")

    replay: dict[str, Any] | None = None
    if status == "SAT":
        candidate = solved.get("model_replay")
        if not isinstance(candidate, dict) or candidate.get("outcome") != "SATISFIED":
            raise ScanError(f"{solver} center {center}: SAT model was not replayed")
        replay = {
            "outcome": candidate.get("outcome"),
            "script_sha256": candidate.get("script_sha256"),
            "solver_sha256": candidate.get("solver_sha256"),
        }

    created = record.get("created")
    return {
        "solver": solver,
        "status": status,
        "session_id": created.get("id") if isinstance(created, dict) else None,
        "solver_signature": created.get("solver_signature")
        if isinstance(created, dict)
        else None,
        "solver_sha256": created.get("solver_sha256")
        if isinstance(created, dict)
        else None,
        "result_sha256": solved.get("result_sha256"),
        "solve_ms": solved.get("solve_ms"),
        "receipt_base_sha256": receipt.get("base_sha256"),
        "model_replay": replay,
    }


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
    args = parser.parse_args()

    args.out_dir.mkdir(parents=True, exist_ok=True)
    args.event.parent.mkdir(parents=True, exist_ok=True)
    report: dict[str, Any] = {
        "schema": SCHEMA,
        "created_utc": core._utc_now(),
        "claim_boundary": CLAIM_BOUNDARY,
        "fixed_rows": [
            {"center": center, "support": list(support)}
            for center, support in center9.FIXED_ROWS
        ],
        "exact_fixed_rows": True,
        "candidate_rows_exact": False,
        "timeout_ms": args.timeout_ms,
        "piqd": None,
        "centers": [],
    }
    if args.solver:
        report["piqd"] = core._run_json(["version"])

    for center in core.LABELS:
        commands = build_commands(center)
        payload = journal_bytes(center)
        path = args.out_dir / f"center-{center:02d}.smt2"
        path.write_bytes(payload)
        digest = hashlib.sha256(payload).hexdigest()
        solves: list[dict[str, Any]] = []
        if args.solver:
            solves = core.run_piqd(
                path,
                commands,
                tuple(args.solver),
                args.timeout_ms,
                label=f"cardge13-exact13-exactfixed-center-{center:02d}",
            )
        summaries = [
            summarize_solve(
                center=center,
                journal_sha256=digest,
                commands=len(commands),
                record=record,
            )
            for record in solves
        ]
        report["centers"].append(
            {
                "center": center,
                "journal": str(path),
                "journal_sha256": digest,
                "journal_commands": len(commands),
                "solves": solves,
                "solve_summaries": summaries,
            }
        )

    event_payload = canonical_json_bytes(report)
    args.event.write_bytes(event_payload)
    print(
        json.dumps(
            {
                "event": str(args.event),
                "event_sha256": hashlib.sha256(event_payload).hexdigest(),
                "center_journal_sha256": {
                    str(row["center"]): row["journal_sha256"]
                    for row in report["centers"]
                },
                "statuses": {
                    str(row["center"]): {
                        item["solver"]: item["status"]
                        for item in row["solve_summaries"]
                    }
                    for row in report["centers"]
                },
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
