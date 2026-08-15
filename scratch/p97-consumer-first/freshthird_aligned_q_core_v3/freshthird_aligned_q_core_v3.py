#!/usr/bin/env python3
"""Fresh v3 structural canary for the aligned mutual FreshThird packet.

The schema is independent of the v2 script and every earlier metric/cut
encoder.  It adds the exact Q first-fiber row and expands each row's
MinimalDeletionCore into two exact ambient four-shells.
"""

from __future__ import annotations

import argparse
import itertools
import subprocess
from pathlib import Path

from z3 import And, Bool, BoolVal, If, Implies, Int, Not, Solver, Sum, sat, unknown


ROOT = Path(__file__).resolve().parent
POINTS = (
    "source0", "source1", "x0", "x1", "y0", "y1",
    "qFresh", "qOther", "shellOverlap",
)
PAIR_X = ("x0", "x1")
PAIR_Y = ("y0", "y1")


def bsum(items):
    return Sum([If(item, 1, 0) for item in items])


def joint_arms() -> tuple[tuple[int, int, int, int], ...]:
    arms = tuple(
        arm for arm in itertools.product(range(2), repeat=4)
        if arm[0] == arm[2] or arm[1] == arm[3]
    )
    assert len(arms) == 12
    return arms


def arm_name(arm: tuple[int, int, int, int]) -> str:
    x0, y0, x1, y1 = arm
    return f"x{x0}y{y0}_x{x1}y{y1}"


def build_schema(
    *,
    fixed_arm: tuple[int, int, int, int] | None = None,
    overfull_source: int | None = None,
    overfull_q: bool = False,
    force_shell_overlap: bool = False,
) -> tuple[Solver, dict[str, object]]:
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
    choice = {
        row: {"x": Int(f"row{row}_xChoice"), "y": Int(f"row{row}_yChoice")}
        for row in range(2)
    }
    source_survival = [Bool(f"sourceRowSurvival{row}") for row in range(2)]
    first_failure = [Bool(f"firstApexFailure{row}") for row in range(2)]
    core_nonempty = [Bool(f"minimalDeletionCoreNonempty{row}") for row in range(2)]
    shells = {
        row: {
            side: {point: Bool(f"core{row}_{side}Shell_{point}") for point in POINTS}
            for side in ("x", "y")
        }
        for row in range(2)
    }

    # Existing v2 source constraints: unequal radii and singleton aligned
    # first-apex slices.
    solver.add(radii[0] != radii[1])
    for row, owner in enumerate(("source0", "source1")):
        solver.add(slices[row][owner])
        for point in POINTS:
            if point != owner:
                solver.add(slices[row][point] == BoolVal(False))
        solver.add(bsum(slices[row].values()) == 1)

    # Existing v2 exact-four mutually incident source rows.
    for row, owner in enumerate(("source0", "source1")):
        solver.add(rows[row][owner], rows[row][POINTS[1 - row]])
        solver.add(bsum(rows[row].values()) == 4)
    if overfull_source is not None:
        solver.add(bsum(rows[overfull_source].values()) == 5)

    # New source clause: Q's first-fiber ambient row is exactly
    # {P1,P2,qFresh,qOther}, represented as {x0,x1,qFresh,qOther}.
    q_members = {"x0", "x1", "qFresh", "qOther"}
    for point in POINTS:
        solver.add(q_row[point] == BoolVal(point in q_members))
    solver.add(bsum(q_row.values()) == 4)
    if overfull_q:
        solver.add(bsum(q_row.values()) == 5)

    for row in range(2):
        x_choice = choice[row]["x"]
        y_choice = choice[row]["y"]
        solver.add(0 <= x_choice, x_choice < 2, 0 <= y_choice, y_choice < 2)
        for index, endpoint in enumerate(PAIR_X):
            solver.add(If(x_choice == index, If(rows[row][endpoint], 1, 0), 0) == 0)
        for index, endpoint in enumerate(PAIR_Y):
            solver.add(If(y_choice == index, If(rows[row][endpoint], 1, 0), 0) == 0)

        # Existing v2 source-row survival, first-apex failure, and nonempty
        # minimal-core fields remain explicit source facts.
        for x_index, x in enumerate(PAIR_X):
            for y_index, y in enumerate(PAIR_Y):
                selected = And(x_choice == x_index, y_choice == y_index)
                survivor_count = bsum(rows[row][point] for point in POINTS if point not in (x, y))
                solver.add(If(selected, survivor_count, 4) == 4)
        solver.add(source_survival[row], first_failure[row], core_nonempty[row])

        # New source clause: MinimalDeletionCore for U={x,y} has two exact
        # ambient four-shells, one indexed by each deleted source.  The shell
        # must contain its indexed source and the two supports are disjoint.
        x_shell = shells[row]["x"]
        y_shell = shells[row]["y"]
        solver.add(bsum(x_shell.values()) == 4, bsum(y_shell.values()) == 4)
        for index, endpoint in enumerate(PAIR_X):
            solver.add(Implies(x_choice == index, x_shell[endpoint]))
        for index, endpoint in enumerate(PAIR_Y):
            solver.add(Implies(y_choice == index, y_shell[endpoint]))
        for point in POINTS:
            solver.add(Not(And(x_shell[point], y_shell[point])))
        if force_shell_overlap and row == 0:
            solver.add(x_shell["shellOverlap"], y_shell["shellOverlap"])

    # Common omitted endpoint: x0=x1 or y0=y1.  Fixed arms are the 12 unique
    # tuples satisfying this disjunction.
    common = OrChoice(choice[0]["x"] == choice[1]["x"], choice[0]["y"] == choice[1]["y"])
    solver.add(common)
    if fixed_arm is not None:
        x0, y0, x1, y1 = fixed_arm
        solver.add(choice[0]["x"] == x0, choice[0]["y"] == y0)
        solver.add(choice[1]["x"] == x1, choice[1]["y"] == y1)
    return solver, {"rows": rows, "q_row": q_row, "shells": shells}


def OrChoice(*items):
    # Kept as a tiny local helper so the schema's disjunction is explicit
    # without importing any prior canary namespace.
    return items[0] if len(items) == 1 else (items[0] | items[1])


def emit_smt(solver: Solver, path: Path) -> None:
    path.write_text("(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n", encoding="utf-8")


def cvc5_status(path: Path, label: str) -> str:
    try:
        proc = subprocess.run(
            ["cvc5", "--lang", "smt2", "--tlimit=10000", str(path)],
            capture_output=True, text=True, timeout=20, check=False,
        )
    except FileNotFoundError:
        return "unavailable"
    except subprocess.TimeoutExpired as exc:
        raise RuntimeError(f"fail-closed: cvc5 {label}=timeout") from exc
    output = proc.stdout.strip().splitlines()
    token = output[0].strip() if output else ""
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


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--results", type=Path, default=ROOT / "results.txt")
    args = parser.parse_args()
    lines = [
        "campaign=freshthird_aligned_q_core_v3",
        "claim_scope=bounded structural diagnostic only; no geometry, universal lift, or Lean closure",
        "schema_origin=TwoSourceFreshThirdRetainedProducer.lean:FreshThirdAlignedCommonDeletionCorePairPacket",
        "stale_imports=none; v3 is self-contained",
        "unknown_policy=fail-closed",
    ]
    try:
        positive, positive_cvc5 = check_case(
            "positive", build_schema()[0], ROOT / "positive.smt2", "sat")
        lines.append(f"smoke_positive=z3:{positive} cvc5:{positive_cvc5}")
        for label, kwargs in (
            ("negative_overfull_source0", {"overfull_source": 0}),
            ("negative_overfull_q", {"overfull_q": True}),
            ("negative_shell_overlap_core0", {"force_shell_overlap": True}),
        ):
            status, independent = check_case(
                label, build_schema(**kwargs)[0], ROOT / f"{label}.smt2", "unsat")
            lines.append(f"{label}=z3:{status} cvc5:{independent}")

        arms = joint_arms()
        lines.append(f"joint_arm_count={len(arms)}")
        for index, arm in enumerate(arms):
            label = f"arm{index:02d}_{arm_name(arm)}"
            status, independent = check_case(
                label, build_schema(fixed_arm=arm)[0], ROOT / f"{label}.smt2", "sat")
            common_side = "x+y" if arm[0] == arm[2] and arm[1] == arm[3] else (
                "x" if arm[0] == arm[2] else "y")
            lines.append(f"{label}=z3:{status} cvc5:{independent} common={common_side}")
        lines.extend([
            "arm_unsat_count=0",
            "new_clause_effect=q_exact4_and_two_disjoint_core_shells_preserve_sat_on_all_12_arms",
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
    print("joint_arms=12")
    print(f"results={args.results}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
