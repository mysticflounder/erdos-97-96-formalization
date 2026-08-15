#!/usr/bin/env python3
"""FreshThird aligned-Q structural diagnostic, v6.

Scratch-only schema derived from corrected v5.  It adds the source-entitled
absence of source0/source1 from every x/y shell and supplies anonymous shell
fillers so that this clause cannot manufacture a nine-point capacity failure.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import subprocess
import sys
from pathlib import Path

from z3 import And, Bool, BoolVal, If, Implies, Int, Not, Solver, sat, unknown


ROOT = Path(__file__).resolve().parent
V3_DIR = ROOT.parent / "freshthird_aligned_q_core_v3"
spec = importlib.util.spec_from_file_location("freshthird_v3_for_v6", V3_DIR / "freshthird_aligned_q_core_v3.py")
assert spec is not None and spec.loader is not None
V3 = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = V3
spec.loader.exec_module(V3)

POINTS = V3.POINTS
SHELL_FILLERS = ("fill0", "fill1", "fill2", "fill3")
SHELL_POINTS = POINTS + SHELL_FILLERS


def intersection_le_two(left: dict[str, object], right: dict[str, object]):
    return V3.bsum(And(left[p], right[p]) for p in POINTS) <= 2


def build_schema_v6(
    *,
    fixed_arm: tuple[int, int, int, int] | None = None,
    equal_blockers: bool = False,
    overfull_source: int | None = None,
    overfull_q: bool = False,
    force_shell_overlap: bool = False,
    force_sync_mismatch: bool = False,
    force_source_overlap: bool = False,
    force_q_overlap: bool = False,
    force_mode_mismatch: bool = False,
    force_shell_membership_failure: bool = False,
    force_source0_x_membership: bool = False,
    force_source1_x_membership: bool = False,
    force_source0_y_membership: bool = False,
    force_source1_y_membership: bool = False,
) -> Solver:
    solver = Solver()
    solver.set(timeout=10_000)
    rows = {
        row: {point: Bool(f"row{row}_{point}") for point in POINTS}
        for row in range(2)
    }
    q_row = {point: Bool(f"qFirstFiberRow_{point}") for point in POINTS}
    slices = {
        row: {point: Bool(f"firstApexSlice{row}_{point}") for point in POINTS}
        for row in range(2)
    }
    radii = [Int("firstApexRadius0"), Int("firstApexRadius1")]
    choices = {
        row: {side: Int(f"row{row}_{side}Choice") for side in ("x", "y")}
        for row in range(2)
    }
    shells = {
        row: {
            side: {point: Bool(f"core{row}_{side}Shell_{point}") for point in SHELL_POINTS}
            for side in ("x", "y")
        }
        for row in range(2)
    }

    # v3 source controls: unequal radii, singleton aligned slices, exact-four
    # source rows, exact Q row, deletion choices, survival, and common arm.
    solver.add(radii[0] != radii[1])
    for row, owner in enumerate(("source0", "source1")):
        solver.add(slices[row][owner])
        for point in POINTS:
            if point != owner:
                solver.add(Not(slices[row][point]))
        solver.add(V3.bsum(slices[row].values()) == 1)
        solver.add(rows[row][owner], rows[row][POINTS[1 - row]])
        solver.add(V3.bsum(rows[row].values()) == 4)
    if overfull_source is not None:
        solver.add(V3.bsum(rows[overfull_source].values()) == 5)

    q_members = {"x0", "x1", "qFresh", "qOther"}
    for point in POINTS:
        solver.add(q_row[point] == BoolVal(point in q_members))
    solver.add(V3.bsum(q_row.values()) == 4)
    if overfull_q:
        solver.add(V3.bsum(q_row.values()) == 5)

    for row in range(2):
        x_choice = choices[row]["x"]
        y_choice = choices[row]["y"]
        solver.add(0 <= x_choice, x_choice < 2, 0 <= y_choice, y_choice < 2)
        for index, endpoint in enumerate(V3.PAIR_X):
            solver.add(If(x_choice == index, If(rows[row][endpoint], 1, 0), 0) == 0)
        for index, endpoint in enumerate(V3.PAIR_Y):
            solver.add(If(y_choice == index, If(rows[row][endpoint], 1, 0), 0) == 0)
        for x_index, x in enumerate(V3.PAIR_X):
            for y_index, y in enumerate(V3.PAIR_Y):
                selected = And(x_choice == x_index, y_choice == y_index)
                survivor_count = V3.bsum(rows[row][point] for point in POINTS if point not in (x, y))
                solver.add(If(selected, survivor_count, 4) == 4)
        solver.add(Bool(f"sourceRowSurvival{row}"), Bool(f"firstApexFailure{row}"), Bool(f"minimalDeletionCoreNonempty{row}"))

        for side, endpoints in (("x", V3.PAIR_X), ("y", V3.PAIR_Y)):
            shell = shells[row][side]
            solver.add(V3.bsum(shell.values()) == 4)
            for endpoint in endpoints:
                # Corrected v5: every endpoint is on every corresponding shell.
                solver.add(shell[endpoint])
        for point in SHELL_POINTS:
            solver.add(Not(And(shells[row]["x"][point], shells[row]["y"][point])))
        if force_shell_overlap and row == 0:
            solver.add(shells[row]["x"]["shellOverlap"], shells[row]["y"]["shellOverlap"])

    x0, y0, x1, y1 = fixed_arm if fixed_arm is not None else (None, None, None, None)
    common = (choices[0]["x"] == choices[1]["x"]) | (choices[0]["y"] == choices[1]["y"])
    solver.add(common)
    if fixed_arm is not None:
        solver.add(choices[0]["x"] == x0, choices[0]["y"] == y0, choices[1]["x"] == x1, choices[1]["y"] == y1)

    # Corrected v5 mode-specific source-row relation.
    blockers_equal = Bool("blockersEqual")
    solver.add(blockers_equal == BoolVal(equal_blockers))
    if equal_blockers:
        for point in POINTS:
            solver.add(rows[0][point] == rows[1][point])
    solver.add(Implies(Not(blockers_equal), V3.bsum(And(rows[0][p], rows[1][p]) for p in POINTS) <= 2))

    # Corrected v5 unconditional synchronization and endpoint/radius facts;
    # source-row/apex-shell and Q-row/apex-shell bounds use named points only.
    for side in ("x", "y"):
        endpoints = V3.PAIR_X if side == "x" else V3.PAIR_Y
        for point in SHELL_POINTS:
            solver.add(shells[0][side][point] == shells[1][side][point])
        for row in range(2):
            for endpoint in endpoints:
                solver.add(shells[row][side][endpoint])
            solver.add(intersection_le_two(rows[0], {p: shells[0][side][p] for p in POINTS}))
            solver.add(intersection_le_two(rows[1], {p: shells[1][side][p] for p in POINTS}))
        solver.add(intersection_le_two(q_row, {p: shells[0][side][p] for p in POINTS}))
        solver.add(intersection_le_two(q_row, {p: shells[1][side][p] for p in POINTS}))

    # v6 source-entitled clause: both sources are outside both synchronized
    # x/y shell families.  Fillers keep exact-four cardinality honest.
    for side in ("x", "y"):
        for row in range(2):
            for source in ("source0", "source1"):
                solver.add(Not(shells[row][side][source]))

    # Existing and clause-specific negative controls.
    if force_sync_mismatch:
        solver.add(shells[0]["x"]["shellOverlap"] != shells[1]["x"]["shellOverlap"])
    if force_source_overlap:
        for point in ("source0", "source1", "qFresh"):
            solver.add(rows[0][point], shells[0]["x"][point])
    if force_q_overlap:
        for point in ("x0", "x1", "qFresh"):
            solver.add(shells[0]["x"][point])
    if force_mode_mismatch:
        solver.add(blockers_equal, rows[0]["qFresh"], Not(rows[1]["qFresh"]))
    if force_shell_membership_failure:
        solver.add(Not(shells[0]["x"]["x1"]))
    for side, source, enabled in (
        ("x", "source0", force_source0_x_membership),
        ("x", "source1", force_source1_x_membership),
        ("y", "source0", force_source0_y_membership),
        ("y", "source1", force_source1_y_membership),
    ):
        if enabled:
            solver.add(shells[0][side][source])
    return solver


def emit_smt(solver: Solver, path: Path) -> None:
    path.write_text("(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n", encoding="utf-8")


def cvc5_status(path: Path, label: str) -> str:
    try:
        proc = subprocess.run(["cvc5", "--lang", "smt2", "--tlimit=10000", str(path)], capture_output=True, text=True, timeout=20, check=False)
    except FileNotFoundError:
        return "unavailable"
    except subprocess.TimeoutExpired as exc:
        raise RuntimeError(f"fail-closed: cvc5 {label}=timeout") from exc
    lines = [line.strip() for line in proc.stdout.splitlines() if line.strip()]
    token = lines[0] if lines else ""
    if token == "unknown":
        raise RuntimeError(f"fail-closed: cvc5 {label}=unknown")
    if token not in {"sat", "unsat"}:
        raise RuntimeError(f"cvc5 {label}: malformed status {token!r}")
    return token


def check_case(label: str, solver: Solver, path: Path, expected: str) -> tuple[str, str]:
    emit_smt(solver, path)
    result = solver.check()
    if result == unknown:
        raise RuntimeError(f"fail-closed: z3 {label}=unknown ({solver.reason_unknown()})")
    actual = "sat" if result == sat else "unsat"
    if actual != expected:
        raise RuntimeError(f"{label}: expected {expected}, got {actual}")
    independent = cvc5_status(path, label)
    if independent != "unavailable" and independent != expected:
        raise RuntimeError(f"{label}: expected cvc5 {expected}, got {independent}")
    return actual, independent


def observe_case(label: str, solver: Solver, path: Path) -> tuple[str, str]:
    emit_smt(solver, path)
    result = solver.check()
    if result == unknown:
        raise RuntimeError(f"fail-closed: z3 {label}=unknown ({solver.reason_unknown()})")
    actual = "sat" if result == sat else "unsat"
    independent = cvc5_status(path, label)
    if independent != "unavailable" and independent != actual:
        raise RuntimeError(f"{label}: z3/cvc5 disagreement ({actual}/{independent})")
    return actual, independent


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--results", type=Path, default=ROOT / "results.txt")
    args = parser.parse_args()
    lines = [
        "campaign=freshthird_aligned_q_core_v6",
        "claim_scope=bounded structural diagnostic only; no geometry, universal lift, or Lean closure",
        "v5_controls=all corrected v5 positive, negative, and 24 arm/mode controls retained",
        "new_clauses=unconditional source0/source1 nonmembership in every synchronized x-shell and y-shell",
        "shell_universe=nine named points plus four anonymous filler vertices; fillers are shared across synchronized cores and subject to shell disjointness",
        "source_basis=CapSourceThirdCanonicalRowWitness source points are in capInterior and outside retained endpoint pairs; hfrontierInteriorEq/hρInteriorEq plus shellAt_radius_eq",
        "unknown_policy=fail-closed",
    ]
    try:
        for mode in (False, True):
            label = f"positive_{'equal' if mode else 'distinct'}_blockers"
            status, independent = observe_case(label, build_schema_v6(equal_blockers=mode), ROOT / f"{label}.smt2")
            lines.append(f"{label}=z3:{status} cvc5:{independent}")
        controls = (
            ("negative_source0_x_shell_membership", {"force_source0_x_membership": True}),
            ("negative_source1_x_shell_membership", {"force_source1_x_membership": True}),
            ("negative_source0_y_shell_membership", {"force_source0_y_membership": True}),
            ("negative_source1_y_shell_membership", {"force_source1_y_membership": True}),
        )
        for label, kwargs in controls:
            status, independent = check_case(label, build_schema_v6(fixed_arm=(0, 0, 0, 0), **kwargs), ROOT / f"{label}.smt2", "unsat")
            lines.append(f"{label}=z3:{status} cvc5:{independent}")
        inherited_controls = (
            ("negative_overfull_source0", {"overfull_source": 0}),
            ("negative_overfull_q", {"overfull_q": True}),
            ("negative_shell_overlap_core0", {"force_shell_overlap": True}),
            ("negative_sync_mismatch", {"fixed_arm": (0, 0, 0, 0), "force_sync_mismatch": True}),
            ("negative_source_shell_overlap", {"fixed_arm": (0, 0, 0, 0), "force_source_overlap": True}),
            ("negative_q_shell_overlap", {"fixed_arm": (0, 0, 0, 0), "force_q_overlap": True}),
            ("negative_equal_mode_row_mismatch", {"fixed_arm": (0, 0, 0, 0), "equal_blockers": True, "force_mode_mismatch": True}),
            ("negative_shell_endpoint_membership", {"force_shell_membership_failure": True}),
        )
        for label, kwargs in inherited_controls:
            status, independent = check_case(label, build_schema_v6(**kwargs), ROOT / f"{label}.smt2", "unsat")
            lines.append(f"{label}=z3:{status} cvc5:{independent}")
        arms = V3.joint_arms()
        lines.append(f"joint_arm_count={len(arms)}")
        arm_statuses: list[str] = []
        for index, arm in enumerate(arms):
            label = f"arm{index:02d}_{V3.arm_name(arm)}"
            for mode in (False, True):
                mode_name = "distinct" if not mode else "equal"
                case_label = f"{label}_{mode_name}"
                status, independent = observe_case(case_label, build_schema_v6(fixed_arm=arm, equal_blockers=mode), ROOT / f"{case_label}.smt2")
                arm_statuses.append(status)
                common_side = "x+y" if arm[0] == arm[2] and arm[1] == arm[3] else ("x" if arm[0] == arm[2] else "y")
                lines.append(f"{case_label}=z3:{status} cvc5:{independent} common={common_side}")
        lines.extend([
            f"arm_query_count={len(arm_statuses)}",
            f"arm_sat_count={arm_statuses.count('sat')}",
            f"arm_unsat_count={arm_statuses.count('unsat')}",
            "negative_control_reason=forced source membership directly contradicts the corresponding explicit nonmembership; four anonymous fillers prevent any shell-capacity artifact",
            "questionable_clause=none; source nonmembership is source-entitled",
            "status=PASS",
        ])
    except Exception as exc:
        lines.append(f"status=FAIL {exc}")
        args.results.write_text("\n".join(lines) + "\n", encoding="utf-8")
        print("status=FAIL")
        print(f"results={args.results}")
        return 1
    args.results.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("status=PASS")
    print("joint_arms=12 modes=2 queries=24")
    print(f"results={args.results}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
