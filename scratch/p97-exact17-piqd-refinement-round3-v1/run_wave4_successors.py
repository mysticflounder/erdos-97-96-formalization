#!/usr/bin/env python3
"""Run a bounded source-checked exact-17 PIQD wave-4 successor batch."""

from __future__ import annotations

import json
import os
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
LANE = ROOT / "scratch/rigid221-blockerv-exact17-20260806"
SESSION_ID = "4876f14c-554d-4cce-9f1a-fb9a15f5dc53"
ROOT_CNF = HERE / "postwave-wave3-base.cnf"
ROOT_SHA256 = "2014454229278675eed61af89c3a4c6cad1b02829c8070f2ab66b549cbf8c1a8"
ROOT_CLAUSES = 4_267_673
VARIABLES = 74_813
WAVE_SIZE = 8


def run(script: Path, *arguments: str) -> dict:
    environment = os.environ.copy()
    environment["PYTHONPATH"] = str(ROOT)
    completed = subprocess.run(
        [sys.executable, str(script), *arguments],
        cwd=ROOT,
        env=environment,
        check=True,
        capture_output=True,
        text=True,
    )
    lines = [line for line in completed.stdout.splitlines() if line.strip()]
    if not lines:
        raise RuntimeError(f"{script.name} emitted no result")
    return json.loads(lines[-1])


def cut_receipts(index: int) -> list[Path]:
    return [HERE / f"wave4-cut-{prior}.json" for prior in range(1, index)]


def expected_clauses(index: int) -> int:
    if index == 1:
        return ROOT_CLAUSES
    payload = json.loads((HERE / f"wave4-cut-{index - 1}.json").read_text())
    return int(payload["session_after"]["clauses"])


def main() -> int:
    solve_script = LANE / "solve_piqd_sat_session_to_cadical_log.py"
    analyze_script = LANE / "analyze_source_faithful_piqd_model.py"
    cut_script = LANE / "append_piqd_two_kalmanson_label_cuts_v2.py"

    for index in range(1, WAVE_SIZE + 1):
        model_log = HERE / f"wave4-model-{index}.log"
        solve_receipt = HERE / f"wave4-solve-{index}.json"
        analysis = HERE / f"wave4-analysis-{index}.json"
        cut_receipt = HERE / f"wave4-cut-{index}.json"
        outputs = (model_log, solve_receipt, analysis, cut_receipt)
        if any(path.exists() for path in outputs):
            raise FileExistsError(f"wave4 index {index} already has output")

        clauses = expected_clauses(index)
        solve = run(
            solve_script,
            "--session-id",
            SESSION_ID,
            "--expected-clauses",
            str(clauses),
            "--expected-max-var",
            str(VARIABLES),
            "--model-log",
            str(model_log),
            "--receipt",
            str(solve_receipt),
            "--timeout-seconds",
            "600",
        )
        if solve.get("status") != "SAT":
            print(json.dumps({"index": index, "solve": solve}, sort_keys=True))
            return 0

        receipt_arguments = [
            item
            for receipt in cut_receipts(index)
            for item in ("--cut-receipt", str(receipt))
        ]
        checked = run(
            analyze_script,
            "--order",
            "0",
            "--positions",
            "0,1",
            "--root-cnf",
            str(ROOT_CNF),
            "--root-cnf-sha256",
            ROOT_SHA256,
            "--root-clauses",
            str(ROOT_CLAUSES),
            "--variables",
            str(VARIABLES),
            *receipt_arguments,
            "--session-id",
            SESSION_ID,
            "--solve-receipt",
            str(solve_receipt),
            "--model-log",
            str(model_log),
            "--linear-timeout-ms",
            "600000",
            "--always-linear-replay",
            "--minimize-first-bank-witness",
            "--output",
            str(analysis),
        )
        if checked.get("status") != "PASS" or not checked.get("source_verified"):
            raise RuntimeError(f"wave4 index {index} failed source verification")

        admitted = run(
            cut_script,
            "--session-id",
            SESSION_ID,
            "--order",
            "0",
            "--positions",
            "0",
            "1",
            "--root-cnf",
            str(ROOT_CNF),
            "--root-cnf-sha256",
            ROOT_SHA256,
            "--root-clauses",
            str(ROOT_CLAUSES),
            "--variables",
            str(VARIABLES),
            *receipt_arguments,
            "--solve-receipt",
            str(solve_receipt),
            "--model-log",
            str(model_log),
            "--analysis",
            str(analysis),
            "--receipt",
            str(cut_receipt),
            "--timeout-seconds",
            "120",
        )
        print(
            json.dumps(
                {
                    "index": index,
                    "solve_ms": solve["solve_ms"],
                    "bank_hit_count": checked["bank_hit_count"],
                    "linear_status": checked["linear_status"],
                    "appended_clauses": admitted["appended_clauses"],
                    "after_clauses": admitted["after_clauses"],
                },
                sort_keys=True,
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
