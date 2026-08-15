#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Minimal structural replay for the common_sameblocker source-fidelity defect."""

from __future__ import annotations

import hashlib
import itertools
import json
import subprocess
import time
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[2]
OUT = ROOT / "source_fidelity_audit"
SOURCE = (
    REPO
    / "scratch/p97-consumer-first/freshthird_firstnonhit_sevenrow_cut_v1"
    / "base_common_sameblocker.smt2"
)
PRIOR_RESULTS = ROOT / "results.json"
TOTAL_WAVE_CAP_SECONDS = 290.0
AUDIT_SOLVER_CAP_SECONDS = 60.0
PER_CALL_TIMEOUT_SECONDS = 10.0

SIX_POINTS = ("v_q0", "v_q1", "v_q2", "v_q3", "v_first", "v_second")
FIVE_SOURCES = ("v_q0", "v_q1", "v_q2", "v_first", "v_second")
FIVE_BLOCKERS = ("b0", "b1", "b2", "blk_first", "blk_second")
SIX_MEMBERSHIPS = tuple(
    f"M_q0__S_{name}" for name in ("q0", "q1", "q2", "q3", "first", "second")
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_new(path: Path, data: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8") as handle:
        handle.write(data)


def equal_pair_disjunction(names: tuple[str, ...]) -> str:
    pairs = [f"(= {a} {b})" for a, b in itertools.combinations(names, 2)]
    return "(or " + " ".join(pairs) + ")"


def same_value_conjunction(names: tuple[str, ...]) -> str:
    return "(and " + " ".join(f"(= {names[0]} {name})" for name in names[1:]) + ")"


def source_cuts() -> list[str]:
    cuts = [
        "; Source theorem: TwoCapSourceThirdCanonicalRowSurface.sources_ne",
        "(assert (distinct v_first v_second))",
        "; Source theorem: actualBlockerFiber_card_le_four",
        "(assert (=> "
        + same_value_conjunction(FIVE_BLOCKERS)
        + " "
        + equal_pair_disjunction(FIVE_SOURCES)
        + "))",
        "; Source theorem: CriticalFourShell.support_card = 4",
    ]
    # If any five of the six named cells are selected, those five values cannot
    # all be distinct. Six such clauses are the targeted at-most-four cut.
    for indices in itertools.combinations(range(6), 5):
        memberships = tuple(SIX_MEMBERSHIPS[index] for index in indices)
        points = tuple(SIX_POINTS[index] for index in indices)
        cuts.append(
            "(assert (=> (and "
            + " ".join(memberships)
            + ") "
            + equal_pair_disjunction(points)
            + "))"
        )
    return cuts


def corrected_query() -> str:
    base = SOURCE.read_text().rstrip()
    query = [base, "", "; Minimal source-fidelity amendment", *source_cuts()]
    query += [
        "(check-sat)",
        "(get-value (v_q0 v_q1 v_q2 v_q3 v_first v_second "
        "b0 b1 b2 blk_first blk_second "
        + " ".join(SIX_MEMBERSHIPS)
        + "))",
        "",
    ]
    return "\n".join(query)


def control_query(aliasing: bool) -> str:
    names = SIX_POINTS + FIVE_BLOCKERS + SIX_MEMBERSHIPS
    lines = ["(set-logic QF_LIA)", "(set-option :produce-models true)"]
    for name in names:
        sort = "Bool" if name.startswith("M_") else "Int"
        lines.append(f"(declare-const {name} {sort})")
    lines += [f"(assert {name})" for name in SIX_MEMBERSHIPS]
    lines += [
        "(assert " + same_value_conjunction(FIVE_BLOCKERS) + ")",
        "(assert (distinct v_q0 v_q1 v_q2 v_q3))",
    ]
    if aliasing:
        lines += [
            "(assert (= v_first v_q0))",
            "(assert (= v_second v_q1))",
        ]
    else:
        lines.append("(assert (distinct v_q0 v_q1 v_q2 v_q3 v_first v_second))")
    lines += source_cuts()
    lines.append("(check-sat)")
    if aliasing:
        lines.append("(get-value (v_q0 v_q1 v_q2 v_q3 v_first v_second))")
    lines.append("")
    return "\n".join(lines)


class Budget:
    def __init__(self, available: float) -> None:
        self.available = available
        self.used = 0.0
        self.calls = 0

    def timeout(self) -> float | None:
        remaining = self.available - self.used
        if remaining < 0.25:
            return None
        return min(PER_CALL_TIMEOUT_SECONDS, remaining - 0.1)


def verdict(text: str) -> str:
    first = text.strip().splitlines()[0] if text.strip() else ""
    return first if first in {"sat", "unsat", "unknown"} else "parse-error"


def run_engine(name: str, engine: str, input_path: Path, budget: Budget) -> dict[str, Any]:
    timeout = budget.timeout()
    if engine == "z3":
        command = ["z3", "-smt2", f"-T:{int(PER_CALL_TIMEOUT_SECONDS)}", str(input_path)]
    else:
        command = [
            "cvc5", "--lang", "smt2", "--produce-models",
            "--tlimit", str(int(PER_CALL_TIMEOUT_SECONDS * 1000)), str(input_path),
        ]
    if timeout is None:
        return {"verdict": "unknown", "reason": "audit-budget", "command": command}
    started = time.monotonic()
    try:
        proc = subprocess.run(command, capture_output=True, text=True, timeout=timeout, check=False)
        elapsed = time.monotonic() - started
        budget.used += elapsed
        budget.calls += 1
    except subprocess.TimeoutExpired as exc:
        elapsed = time.monotonic() - started
        budget.used += elapsed
        budget.calls += 1
        write_new(OUT / f"{name}.{engine}.out", (exc.stdout or "") if isinstance(exc.stdout, str) else (exc.stdout or b"").decode(errors="replace"))
        write_new(OUT / f"{name}.{engine}.err", (exc.stderr or "") if isinstance(exc.stderr, str) else (exc.stderr or b"").decode(errors="replace"))
        return {"verdict": "unknown", "reason": "timeout", "wall_seconds": elapsed, "command": command}
    write_new(OUT / f"{name}.{engine}.out", proc.stdout)
    write_new(OUT / f"{name}.{engine}.err", proc.stderr)
    return {
        "verdict": verdict(proc.stdout),
        "returncode": proc.returncode,
        "wall_seconds": elapsed,
        "command": command,
    }


def main() -> int:
    if OUT.exists():
        raise SystemExit("no-overwrite refusal: source_fidelity_audit already exists")
    prior = json.loads(PRIOR_RESULTS.read_text())
    prior_used = float(prior["solver_budget"]["used_seconds"])
    available = min(AUDIT_SOLVER_CAP_SECONDS, TOTAL_WAVE_CAP_SECONDS - prior_used)
    if available <= 0:
        raise RuntimeError("no solver budget remains")
    budget = Budget(available)

    inputs = {
        "control_impossible": control_query(aliasing=False),
        "control_alias": control_query(aliasing=True),
        "corrected_common_sameblocker": corrected_query(),
    }
    paths: dict[str, Path] = {}
    for name, text in inputs.items():
        path = OUT / f"{name}.smt2"
        write_new(path, text)
        paths[name] = path

    expected = {
        "control_impossible": "unsat",
        "control_alias": "sat",
        "corrected_common_sameblocker": None,
    }
    records: dict[str, Any] = {}
    for name in inputs:
        engines = {
            engine: run_engine(name, engine, paths[name], budget)
            for engine in ("z3", "cvc5")
        }
        verdicts = [record["verdict"] for record in engines.values()]
        consensus = verdicts[0] if len(set(verdicts)) == 1 else "unknown"
        records[name] = {
            "engines": engines,
            "consensus": consensus,
            "expected": expected[name],
            "passed": expected[name] is None or consensus == expected[name],
        }

    status = "PASS" if all(record["passed"] and record["consensus"] != "unknown" for record in records.values()) else "FAIL_CLOSED"
    result = {
        "schema": "freshthird-firstnonhit-common-sameblocker-source-fidelity-audit-v1",
        "status": status,
        "source_base": str(SOURCE.relative_to(REPO)),
        "source_base_sha256": sha256(SOURCE),
        "source_theorems": {
            "actualBlockerFiber_card_le_four": sha256(REPO / "lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean"),
            "CriticalFourShell.support_card": sha256(REPO / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean"),
            "TwoCapSourceThirdCanonicalRowSurface.sources_ne": sha256(REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean"),
        },
        "cut_ledger": [
            "firstSource != secondSource",
            "five named actual sources with one blocker imply a source alias (fiber card <= 4)",
            "each five-subset of the six selected q0-row labels implies a point alias (support card = 4)",
        ],
        "records": records,
        "solver_budget": {
            "prior_algebra_wall_seconds": prior_used,
            "audit_wall_seconds": budget.used,
            "aggregate_wall_seconds": prior_used + budget.used,
            "total_wave_cap_seconds": TOTAL_WAVE_CAP_SECONDS,
            "calls": budget.calls,
            "timeout_escalation": False,
        },
        "classification": (
            "The original common_sameblocker terminal readback is source-malformed. "
            "Its algebra NONUNIT output is retained only as a computation on that malformed packet."
        ),
    }
    write_new(OUT / "AUDIT.json", json.dumps(result, indent=2, sort_keys=True) + "\n")
    artifacts = sorted(path for path in OUT.iterdir() if path.is_file() and path.name != "SHA256SUMS")
    write_new(OUT / "SHA256SUMS", "".join(f"{sha256(path)}  {path.name}\n" for path in artifacts))
    print(json.dumps({"status": status, "records": {name: record["consensus"] for name, record in records.items()}, "audit_wall_seconds": budget.used}, sort_keys=True))
    return 0 if status == "PASS" else 3


if __name__ == "__main__":
    raise SystemExit(main())
