#!/usr/bin/env python3
"""Incremental source-faithful rows/slices/Kalmanson replay.

This probe starts from the exact direct-0 rational witness recorded by the
parameterized geometry probe.  A pinned replay is diagnostic only: failure of
the pin does not imply infeasibility.  The unpinned replay then adds the
existing frozen rows, singleton slices, and strict Kalmanson stages in order.
All solver verdicts remain bounded exact-17 evidence, not a universal claim.
"""

from __future__ import annotations

import json
import subprocess
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
RESULTS = HERE / "results.json"
PARAMETRIC = HERE / "parametric_results.json"
OUT = HERE / "parametric_rows_results.json"
REPORT = HERE / "parametric_rows_RESULTS.md"
sys.path.insert(0, str(HERE))
import freshthird_adjacent_grid_metric_v1 as core  # noqa: E402


def frac(value: str) -> Fraction:
    return Fraction(value)


def cvc5_status(smt2: str, timeout_ms: int = 30_000) -> str:
    try:
        proc = subprocess.run(
            ["cvc5", "--lang", "smt2", "--produce-models", f"--tlimit-per={timeout_ms}"],
            input=smt2 + "\n(check-sat)\n", text=True,
            capture_output=True, timeout=timeout_ms / 1000 + 3,
        )
    except FileNotFoundError:
        return "unavailable"
    except subprocess.TimeoutExpired:
        return "timeout"
    answers = [line.strip() for line in proc.stdout.splitlines()
               if line.strip() in {"sat", "unsat", "unknown"}]
    return answers[-1] if answers else f"error:{proc.returncode}:{proc.stderr[:120]}"


def load_signatures() -> list[core.Signature]:
    data = json.loads(RESULTS.read_text(encoding="utf-8"))
    signatures: list[core.Signature] = []
    for entry in data["signatures"]:
        if entry.get("structural") != "sat":
            continue
        raw = dict(entry["signature"])
        for key in ("blockers", "positions"):
            raw[key] = tuple(raw[key])
        for key in ("caps", "rows", "radius_supports", "grid_hits"):
            raw[key] = tuple(tuple(group) for group in raw[key])
        signatures.append(core.Signature(**raw))
    if not signatures:
        raise RuntimeError("no structural signatures found")
    return signatures


def row_obstruction(sig: core.Signature) -> dict[str, Any]:
    """A source-faithful finite obstruction before nonlinear replay.

    If two distinct blocker centers have exact rows containing the same three
    non-collinear points, both centers are the unique circumcenter of that
    triple.  Strict boundary geometry supplies non-collinearity; the test is
    deliberately recorded as a finite signature cut, not a universal theorem.
    """
    common = sorted(set(sig.rows[0]) & set(sig.rows[1]))
    centers_distinct = sig.blockers[0] != sig.blockers[1]
    return {
        "common_row_support": common,
        "common_support_card": len(common),
        "three_common_noncollinear_points": len(common) >= 3,
        "distinct_blocker_centers": centers_distinct,
        "structural_rows_unsat": len(common) >= 3 and centers_distinct,
        "reason": "two distinct circles cannot share three non-collinear points"
        if len(common) >= 3 and centers_distinct else "no finite duplicate-three cut",
    }


def exact_witness() -> dict[int, tuple[Fraction, Fraction]]:
    raw = json.loads(PARAMETRIC.read_text(encoding="utf-8"))
    coords = raw["full_geometry_grid_members"]["exact_witness"]["derived_coordinates"]
    return {int(point): (frac(values[0]), frac(values[1])) for point, values in coords.items()}


def pinned(replay: core.MetricReplay, through: str, points: dict[int, tuple[Fraction, Fraction]]) -> dict[str, Any]:
    solver = replay.solver(through)
    for point, (x, y) in points.items():
        solver.add(replay.x[point] == z3.RealVal(f"{x.numerator}/{x.denominator}"))
        solver.add(replay.y[point] == z3.RealVal(f"{y.numerator}/{y.denominator}"))
    result = solver.check()
    return {
        "z3": core.status(result, solver),
        "cvc5": cvc5_status(solver.to_smt2()),
        "interpretation": "pinned failure is diagnostic only; it is not UNSAT for the stage",
    }


def malformed_control(replay: core.MetricReplay, through: str,
                      points: dict[int, tuple[Fraction, Fraction]]) -> dict[str, str]:
    solver = replay.solver(through)
    for point, (x, y) in points.items():
        solver.add(replay.x[point] == z3.RealVal(f"{x.numerator}/{x.denominator}"))
        solver.add(replay.y[point] == z3.RealVal(f"{y.numerator}/{y.denominator}"))
    solver.add(replay.x[0] == replay.x[1])
    return {"z3": core.status(solver.check(), solver), "cvc5": cvc5_status(solver.to_smt2())}


def main() -> int:
    report_only = "--report-only" in sys.argv[1:]
    signatures = load_signatures()
    sig = next(item for item in signatures
               if (item.orientation, item.radial_branch) == ("direct", 0))
    points = exact_witness()
    replay = core.MetricReplay(sig, timeout_ms=120_000)
    if report_only and OUT.exists():
        prior = json.loads(OUT.read_text(encoding="utf-8"))
        stages = prior["stages"]
        first_non_sat = prior.get("first_solver_non_sat_or_unknown")
        if first_non_sat is None or str(first_non_sat).startswith("none"):
            first_non_sat = prior.get("first_source_faithful_non_sat_or_unknown")
        if first_non_sat is None or str(first_non_sat).startswith("none"):
            first_non_sat = next((item["stage"] for item in stages
                                  if not item["z3"].startswith("sat")), None)
    else:
        stages = []
        first_non_sat: str | None = None
        for stage in core.MetricReplay.STAGES:
            solver = replay.solver(stage)
            start = time.monotonic()
            result = solver.check()
            elapsed = round(time.monotonic() - start, 3)
            status = core.status(result, solver)
            item: dict[str, Any] = {
                "stage": stage, "z3": status, "seconds": elapsed,
                "cvc5": cvc5_status(solver.to_smt2()),
            }
            if result == z3.sat:
                errors = replay.validate(stage, solver.model())
                item["independent_validation"] = "pass" if not errors else errors
            else:
                first_non_sat = first_non_sat or stage
                item["independent_validation"] = "not applicable"
            item["pinned_exact_witness"] = pinned(replay, stage, points)
            stages.append(item)
    row_cuts = [
        {"orientation": item.orientation, "radial_branch": item.radial_branch,
         "obstruction": row_obstruction(item)}
        for item in signatures
    ]
    control = malformed_control(replay, "geometry", points)
    report = {
        "classification": "bounded exact-17 source-faithful diagnostic; not P97 closure",
        "signature": {"orientation": sig.orientation, "radial_branch": sig.radial_branch},
        "stages": stages,
        "first_solver_non_sat_or_unknown": first_non_sat or "none through kalmanson",
        "row_signature_cuts": row_cuts,
        "first_source_faithful_obstruction": [
            {"orientation": item["orientation"], "radial_branch": item["radial_branch"]}
            for item in row_cuts if item["obstruction"]["structural_rows_unsat"]
        ],
        "malformed_geometry_control": control,
        "encoded": [
            "frozen direct-0 exact-17 signature", "both exact blocker-centered rows",
            "both FreshThird singleton own-cap slices", "existing strict Kalmanson inequality",
        ],
        "omitted": ["source-level producer/lift", "general-n lift", "P97 headline conclusion"],
    }
    OUT.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    lines = [
        "# Parameterized FreshThird rows-stage replay", "",
        "Classification: bounded exact-17 diagnostic; SAT is not a P97 counterexample, and UNKNOWN is not UNSAT.",
        "", "Stages:",
    ]
    for item in stages:
        lines.append(f"- {item['stage']}: z3={item['z3']}, cvc5={item['cvc5']}, "
                     f"validation={item['independent_validation']}; pinned={item['pinned_exact_witness']['z3']}/"
                     f"{item['pinned_exact_witness']['cvc5']}")
    lines += [
        "", f"First solver non-SAT/unknown stage: {report['first_solver_non_sat_or_unknown']}",
        f"First source-faithful finite obstruction(s): {report['first_source_faithful_obstruction']}",
        f"Malformed geometry control: z3={control['z3']}, cvc5={control['cvc5']}",
        "", "The pinned exact witness is only a diagnostic seed; a pinned failure does not classify the unpinned stage.",
        "Rows, singleton slices, and Kalmanson are source-faithful finite stages; no general-n lift or universal producer is encoded.",
        "Row cut: direct-0 has three (in fact four) common row points and distinct blocker centers, so its exact rows are impossible under strict boundary geometry; the other frozen arms have no duplicate-three row cut.",
    ]
    REPORT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("\n".join(lines))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
