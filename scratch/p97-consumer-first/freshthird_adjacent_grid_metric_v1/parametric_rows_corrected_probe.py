#!/usr/bin/env python3
"""Corrected source-row replay for the exact-17 FreshThird diagnostic.

This is deliberately a new diagnostic artifact.  ``q_source``/``q_other``
are the Q first-collision row B1, while C's two sources are the deleted point
0 and ``source5``.  Their circle centers are the actual blockers
``b_at(0)`` and ``b_at(source5)``; the source labels are not centers.
"""

from __future__ import annotations

import importlib.util
import json
import subprocess
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
PARAMETRIC = HERE / "parametric_results.json"
OUT = HERE / "parametric_rows_corrected_results.json"
REPORT = HERE / "parametric_rows_corrected_RESULTS.md"
sys.path.insert(0, str(HERE))
import freshthird_adjacent_grid_metric_v1 as core  # noqa: E402


def load_exact_witness() -> dict[int, tuple[Fraction, Fraction]]:
    raw = json.loads(PARAMETRIC.read_text())
    coords = raw["full_geometry_grid_members"]["exact_witness"]["derived_coordinates"]
    return {int(p): (Fraction(v[0]), Fraction(v[1])) for p, v in coords.items()}


def cvc5_status(smt2: str, timeout_ms: int = 8_000) -> str:
    try:
        p = subprocess.run(
            ["cvc5", "--lang", "smt2", "--produce-models", f"--tlimit-per={timeout_ms}"],
            input=smt2 + "\n(check-sat)\n", text=True, capture_output=True,
            timeout=timeout_ms / 1000 + 3,
        )
    except FileNotFoundError:
        return "unavailable"
    except subprocess.TimeoutExpired:
        return "timeout"
    answers = [x.strip() for x in p.stdout.splitlines() if x.strip() in {"sat", "unsat", "unknown"}]
    return answers[-1] if answers else f"error:{p.returncode}:{p.stderr[:100]}"


def pinned(replay: core.MetricReplay, stage: str, pts: dict[int, tuple[Fraction, Fraction]]) -> dict[str, str]:
    s = replay.solver(stage)
    for p, (x, y) in pts.items():
        s.add(replay.x[p] == z3.RealVal(f"{x.numerator}/{x.denominator}"))
        s.add(replay.y[p] == z3.RealVal(f"{y.numerator}/{y.denominator}"))
    return {"z3": core.status(s.check(), s), "cvc5": cvc5_status(s.to_smt2()),
            "meaning": "diagnostic only; pinned failure is not unpinned UNSAT"}


def role_pinned_source_rows(sig: core.Signature) -> dict[str, Any]:
    """Reconstruct source rows from the v2 incidence model at this signature."""
    canary = core.V2.BoundaryCanary("direct")
    solver, _ = core.corrected_joint_solver(canary, "direct", 0)
    for name, value in sig.roles.items():
        solver.add(canary.base.role[name] == value)
    if solver.check() != z3.sat:
        raise RuntimeError("role-pinned v2 incidence model is unexpectedly UNSAT")
    model = solver.model()
    def b(q: int) -> int:
        return model.eval(canary.base.b_at(q), model_completion=True).as_long()
    def shell(q: int) -> tuple[int, ...]:
        return tuple(p for p in range(core.N) if core.zbool(model, canary.base.shell[q][p]))
    deleted = 0
    source5 = sig.roles["source5"]
    q_source = sig.roles["q_source"]
    return {
        "roles": sig.roles,
        "blockers": {"deleted": b(deleted), "source5": b(source5), "q_source": b(q_source)},
        "rows": {
            "Q.B1": {"center": b(q_source), "support": sorted({sig.roles[x] for x in ("p1", "p2", "q_source", "q_other")})},
            "C.firstSource_deleted0": {"center": b(deleted), "support": list(shell(deleted))},
            "C.secondSource_source5": {"center": b(source5), "support": list(shell(source5))},
        },
        "source_center_audit": {
            "deleted_label": deleted,
            "source5_label": source5,
            "deleted_is_circle_center": False,
            "actual_deleted_blocker": b(deleted),
            "actual_source5_blocker": b(source5),
            "q_b1_center": b(q_source),
            "conclusion": "source labels are members on their blocker-centered rows; they are not row centers",
        },
    }


def add_corrected_rows(replay: core.MetricReplay, specs: dict[str, Any]) -> None:
    replay.groups["rows"] = []
    for index, (name, row) in enumerate(specs["rows"].items()):
        radius = z3.Real(f"corrected_{index}_row_sq")
        replay.groups["rows"].append(radius > 0)
        center = int(row["center"])
        support = set(row["support"])
        for p in range(core.N):
            eq = core.d2_expr(replay.x, replay.y, center, p) == radius
            replay.groups["rows"].append(eq if p in support else z3.Not(eq))


def malformed_geometry_control(replay: core.MetricReplay, pts: dict[int, tuple[Fraction, Fraction]]) -> dict[str, str]:
    """Pinned degenerate-coordinate control; both solvers must reject it."""
    s = replay.solver("geometry")
    for p, (x, y) in pts.items():
        s.add(replay.x[p] == z3.RealVal(f"{x.numerator}/{x.denominator}"))
        s.add(replay.y[p] == z3.RealVal(f"{y.numerator}/{y.denominator}"))
    s.add(replay.x[0] == replay.x[1])
    return {"z3": core.status(s.check(), s), "cvc5": cvc5_status(s.to_smt2())}


def main() -> int:
    raw = json.loads((HERE / "results.json").read_text())
    entry = next(x for x in raw["signatures"] if x.get("structural") == "sat" and
                 x["signature"]["orientation"] == "direct" and x["signature"]["radial_branch"] == 0)
    data = dict(entry["signature"])
    data["blockers"] = tuple(data["blockers"]); data["positions"] = tuple(data["positions"])
    for k in ("caps", "rows", "radius_supports", "grid_hits"):
        data[k] = tuple(tuple(v) for v in data[k])
    sig = core.Signature(**data)
    source = role_pinned_source_rows(sig)
    replay = core.MetricReplay(sig, timeout_ms=12_000)
    add_corrected_rows(replay, source)
    pts = load_exact_witness()
    control = malformed_geometry_control(replay, pts)
    stages: list[dict[str, Any]] = []
    for stage in core.MetricReplay.STAGES:
        s = replay.solver(stage); started = time.monotonic(); result = s.check()
        item: dict[str, Any] = {"stage": stage, "z3": core.status(result, s),
                                "seconds": round(time.monotonic() - started, 3),
                                "cvc5": cvc5_status(s.to_smt2()),
                                "pinned_exact_witness": pinned(replay, stage, pts)}
        item["exact_fraction_validation"] = "not-applicable (no SAT model)" if result != z3.sat else "solver model satisfies all encoded exact equalities"
        stages.append(item)
    report = {
        "classification": "bounded exact-17 corrected source-faithful diagnostic; not universal closure",
        "signature": {"orientation": sig.orientation, "radial_branch": sig.radial_branch, "roles": sig.roles},
        "source_rows": source,
        "stages": stages,
        "malformed_geometry_control": control,
        "encoded": ["Q.B1={p1,p2,q_source,q_other}", "C first source=deleted point 0 with center b_at(0)",
                    "C second source=source5 with center b_at(source5)", "all member and nonmember circle equalities",
                    "existing grid, singleton-slice, and strict Kalmanson stages"],
        "omitted": ["source-level producer/lift", "general-n lift", "P97 universal conclusion"],
    }
    OUT.write_text(json.dumps(report, indent=2) + "\n")
    lines = ["# Corrected FreshThird source-row replay", "",
             "Bounded exact-17 diagnostic only; pinned failure is not unpinned UNSAT.", "",
             "Role audit: C.firstSource=deleted 0 and C.secondSource=source5 are source labels, not circle centers.",
             f"Actual centers: b_at(0)={source['blockers']['deleted']}, b_at(source5)={source['blockers']['source5']}; Q.B1 center={source['blockers']['q_source']}.", "", "Stages:"]
    for x in stages:
        lines.append(f"- {x['stage']}: z3={x['z3']}, cvc5={x['cvc5']}; pinned={x['pinned_exact_witness']['z3']}/{x['pinned_exact_witness']['cvc5']}")
    first = next((x["stage"] for x in stages if x["z3"] not in {"sat"}), "none")
    lines += ["", f"First unpinned z3 non-SAT/unknown stage: {first}",
              f"Pinned malformed-geometry control: z3={control['z3']}, cvc5={control['cvc5']}.",
              "The three rows are encoded with exact member equalities and nonmember disequalities.",
              "No finite result here is promoted to a Lean producer or a universal theorem."]
    REPORT.write_text("\n".join(lines) + "\n")
    print("\n".join(lines))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
