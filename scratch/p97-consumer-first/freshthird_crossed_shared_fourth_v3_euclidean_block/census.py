#!/usr/bin/env python3
"""Exact planar follow-up for the six cap-block survivors of v2.

This is theorem-discovery scratch work.  It deliberately treats UNKNOWN,
timeouts, and solver disagreement as non-results.
"""

from __future__ import annotations

import itertools
import json
import os
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path


ROOT = Path(__file__).resolve().parent
V2 = ROOT.parent / "freshthird_crossed_shared_fourth_v2_cross_inequalities"
V2_RESULTS = V2 / "results" / "census.json"
ARTIFACTS = ROOT / "artifacts"
RESULTS = ROOT / "results"

CENTERS = {"firstCenter", "commonCenter", "oppositeCenter"}
ROLES = [
    "firstCenter",
    "commonCenter",
    "oppositeCenter",
    "commonOutside",
    "oppositeOutside",
    "sharedFourth",
]


def centers_form_one_cyclic_block(order: list[str]) -> bool:
    flags = [role in CENTERS for role in order]
    changes = sum(
        flags[i] != flags[(i + 1) % len(flags)] for i in range(len(flags))
    )
    return changes == 2


def q(value: int) -> str:
    return str(value) if value >= 0 else f"(- {-value})"


def sub(a: str, b: str) -> str:
    return f"(- {a} {b})"


def mul(a: str, b: str) -> str:
    return f"(* {a} {b})"


def sq(a: str) -> str:
    return mul(a, a)


def d2(a: str, b: str) -> str:
    return f"(+ {sq(sub(f'x_{a}', f'x_{b}'))} {sq(sub(f'y_{a}', f'y_{b}'))})"


def orient(a: str, b: str, c: str) -> str:
    return (
        f"(- {mul(sub(f'x_{b}', f'x_{a}'), sub(f'y_{c}', f'y_{a}'))} "
        f"{mul(sub(f'y_{b}', f'y_{a}'), sub(f'x_{c}', f'x_{a}'))})"
    )


def prelude() -> list[str]:
    lines = ["(set-logic QF_NRA)", "(set-option :produce-models true)"]
    for role in ROLES:
        lines.append(f"(declare-fun x_{role} () Real)")
        lines.append(f"(declare-fun y_{role} () Real)")
    return lines


def normalized_convex_order(order: list[str]) -> list[str]:
    lines = prelude()
    first, second = order[0], order[1]
    lines += [
        f"(assert (= x_{first} 0))",
        f"(assert (= y_{first} 0))",
        f"(assert (= x_{second} 1))",
        f"(assert (= y_{second} 0))",
    ]
    for i, j, k in itertools.combinations(range(6), 3):
        lines.append(f"(assert (> {orient(order[i], order[j], order[k])} 0))")
    return lines


def arm_smt(order: list[str], signs: str) -> str:
    lines = normalized_convex_order(order)
    lines += [
        f"(assert (= {d2('firstCenter', 'commonOutside')} {d2('firstCenter', 'oppositeOutside')}))",
        f"(assert (= {d2('commonCenter', 'commonOutside')} {d2('commonCenter', 'sharedFourth')}))",
        f"(assert (= {d2('oppositeCenter', 'oppositeOutside')} {d2('oppositeCenter', 'sharedFourth')}))",
    ]
    rel0 = "<" if signs[0] == "0" else ">"
    rel1 = "<" if signs[1] == "0" else ">"
    lines += [
        f"(assert ({rel0} {d2('commonCenter', 'oppositeOutside')} {d2('commonCenter', 'commonOutside')}))",
        f"(assert ({rel1} {d2('oppositeCenter', 'commonOutside')} {d2('oppositeCenter', 'oppositeOutside')}))",
        "(check-sat)",
        "(get-model)",
    ]
    return "\n".join(lines) + "\n"


def sat_control_smt() -> str:
    order = ROLES
    coords = [(0, 0), (1, 0), (2, 1), (2, 2), (1, 3), (0, 2)]
    lines = normalized_convex_order(order)
    for role, (x, y) in zip(order, coords, strict=True):
        lines.append(f"(assert (= x_{role} {q(x)}))")
        lines.append(f"(assert (= y_{role} {q(y)}))")
    lines += ["(check-sat)", "(get-model)"]
    return "\n".join(lines) + "\n"


def unsat_control_smt() -> str:
    return "\n".join(
        [
            "(set-logic QF_NRA)",
            "(declare-fun x () Real)",
            "(assert (> x 0))",
            "(assert (< x 0))",
            "(check-sat)",
        ]
    ) + "\n"


def status(stdout: str) -> str:
    for line in stdout.splitlines():
        token = line.strip().lower()
        if token in {"sat", "unsat", "unknown"}:
            return token
    return "error"


def run_solver(solver: str, path: Path, timeout_s: int) -> dict[str, object]:
    if solver == "z3":
        cmd = ["z3", f"-T:{timeout_s}", str(path)]
    else:
        cmd = ["cvc5", "--lang=smt2", f"--tlimit={timeout_s * 1000}", str(path)]
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout_s + 10)
        out = proc.stdout
        return {
            "status": status(out),
            "exit_code": proc.returncode,
            "stdout": out,
            "stderr": proc.stderr,
        }
    except subprocess.TimeoutExpired as exc:
        return {
            "status": "timeout",
            "exit_code": None,
            "stdout": exc.stdout or "",
            "stderr": exc.stderr or "",
        }


def main() -> None:
    ARTIFACTS.mkdir(parents=True, exist_ok=True)
    RESULTS.mkdir(parents=True, exist_ok=True)
    with V2_RESULTS.open() as handle:
        v2 = json.load(handle)
    survivors = [
        row
        for row in v2["rows"]
        if row.get("z3") == "sat" and centers_form_one_cyclic_block(row["order"])
    ]
    assert len(survivors) == 6

    jobs: list[dict[str, object]] = []
    for row in survivors:
        stem = f"arm_{row['order_index']:03d}_{row['signs']}"
        path = ARTIFACTS / f"{stem}.smt2"
        path.write_text(arm_smt(row["order"], row["signs"]))
        jobs.append({
            "kind": "arm",
            "name": stem,
            "path": path,
            "order_index": row["order_index"],
            "order": row["order"],
            "signs": row["signs"],
        })

    controls = [
        ("control_sat_convex_hexagon", sat_control_smt(), "sat"),
        ("control_unsat", unsat_control_smt(), "unsat"),
    ]
    for name, text, expected in controls:
        path = ARTIFACTS / f"{name}.smt2"
        path.write_text(text)
        jobs.append({"kind": "control", "name": name, "path": path, "expected": expected})

    timeout_s = int(os.environ.get("FRESHTHIRD_NRA_TIMEOUT", "300"))
    futures = {}
    with ThreadPoolExecutor(max_workers=min(12, len(jobs) * 2)) as pool:
        for job in jobs:
            for solver in ("z3", "cvc5"):
                future = pool.submit(run_solver, solver, job["path"], timeout_s)
                futures[future] = (job, solver)
        for future in as_completed(futures):
            job, solver = futures[future]
            job[solver] = future.result()

    rows = []
    for job in jobs:
        z3 = job["z3"]
        cvc5 = job["cvc5"]
        exact_match = z3["status"] == cvc5["status"] and z3["status"] in {"sat", "unsat"}
        row = {k: v for k, v in job.items() if k not in {"path", "z3", "cvc5"}}
        row.update({
            "artifact": str(Path("artifacts") / job["path"].name),
            "z3": z3,
            "cvc5": cvc5,
            "exact_match": exact_match,
        })
        rows.append(row)

    with (RESULTS / "census.json").open("w") as handle:
        json.dump({"timeout_seconds": timeout_s, "rows": rows}, handle, indent=2)

    arms = [row for row in rows if row["kind"] == "arm"]
    summary = {
        "arm_count": len(arms),
        "z3_statuses": {s: sum(row["z3"]["status"] == s for row in arms) for s in ("sat", "unsat", "unknown", "timeout", "error")},
        "cvc5_statuses": {s: sum(row["cvc5"]["status"] == s for row in arms) for s in ("sat", "unsat", "unknown", "timeout", "error")},
        "exact_matches": sum(row["exact_match"] for row in arms),
        "controls": [
            {
                "name": row["name"],
                "expected": row["expected"],
                "z3": row["z3"]["status"],
                "cvc5": row["cvc5"]["status"],
                "exact_match": row["exact_match"],
            }
            for row in rows if row["kind"] == "control"
        ],
    }
    with (RESULTS / "summary.json").open("w") as handle:
        json.dump(summary, handle, indent=2)
    print(json.dumps(summary, separators=(",", ":")))


if __name__ == "__main__":
    main()
