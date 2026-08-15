#!/usr/bin/env python3
"""Fresh v2 finite schema for FreshThirdAlignedCommonDeletionCorePairPacket.

This file is deliberately self-contained.  It does not import the v1 canary,
any metric encoder, or any learned solver cut.  The model is only a finite
Boolean/integer abstraction of source facts from the retained producer.
"""

from __future__ import annotations

import argparse
import itertools
import subprocess
from pathlib import Path

from z3 import Bool, BoolVal, If, Int, Solver, Sum, sat, unknown


ROOT = Path(__file__).resolve().parent
POINTS = ("source0", "source1", "x0", "x1", "y0", "y1")
ENDPOINTS = ("x0", "x1", "y0", "y1")
PAIR_X = ("x0", "x1")
PAIR_Y = ("y0", "y1")


def bool_sum(items):
    return Sum([If(item, 1, 0) for item in items])


def joint_arms() -> tuple[tuple[int, int, int, int], ...]:
    """All and only the 12 tuples satisfying x0=x1 or y0=y1."""
    arms = tuple(
        arm
        for arm in itertools.product(range(2), repeat=4)
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
    overfull_row: int | None = None,
) -> tuple[Solver, dict[str, object]]:
    """Build only the source-faithful finite ingress constraints.

    `fixed_arm` chooses (x0,y0) for row 0 and (x1,y1) for row 1.  The common
    omission is the disjunction x0=x1 or y0=y1.  Endpoint omission and exact
    four-member survival are row facts; failure/core nonemptiness are explicit
    source facts and are not derived geometrically.
    """
    solver = Solver()
    solver.set(timeout=10_000)
    rows = {
        row: {point: Bool(f"row{row}_{point}") for point in POINTS}
        for row in range(2)
    }
    slices = {
        row: {point: Bool(f"firstApexSlice{row}_{point}") for point in POINTS}
        for row in range(2)
    }
    radii = [Int("firstApexRadius0"), Int("firstApexRadius1")]
    source_survival = [Bool(f"sourceRowSurvival{row}") for row in range(2)]
    first_failure = [Bool(f"firstApexFailure{row}") for row in range(2)]
    core_nonempty = [Bool(f"minimalDeletionCoreNonempty{row}") for row in range(2)]
    choice = {
        row: {
            "x": Int(f"row{row}_xChoice"),
            "y": Int(f"row{row}_yChoice"),
        }
        for row in range(2)
    }

    # Distinct first-apex radii and the two singleton aligned slices.
    solver.add(radii[0] != radii[1])
    for row, owner in enumerate(("source0", "source1")):
        solver.add(slices[row][owner])
        for point in POINTS:
            if point != owner:
                solver.add(slices[row][point] == BoolVal(False))
        solver.add(bool_sum(slices[row].values()) == 1)

    # Exact four-member mutually incident source rows.
    for row, owner in enumerate(("source0", "source1")):
        solver.add(rows[row][owner])
        solver.add(rows[row][POINTS[1 - row]])
        solver.add(bool_sum(rows[row].values()) == 4)

    if overfull_row is not None:
        solver.add(bool_sum(rows[overfull_row].values()) == 5)

    for row in range(2):
        solver.add(choice[row]["x"] >= 0, choice[row]["x"] < 2)
        solver.add(choice[row]["y"] >= 0, choice[row]["y"] < 2)
        # A selected deletion endpoint from each retained collision pair is
        # omitted by that row.  The source packet stores this as a fact.
        for endpoint_index, endpoint in enumerate(PAIR_X):
            solver.add(
                If(choice[row]["x"] == endpoint_index, If(rows[row][endpoint], 1, 0), 0)
                == 0
            )
        for endpoint_index, endpoint in enumerate(PAIR_Y):
            solver.add(
                If(choice[row]["y"] == endpoint_index, If(rows[row][endpoint], 1, 0), 0)
                == 0
            )

        # Source-row survival after the selected double erase is represented
        # by the exact surviving support count, without a distance claim.
        for x_index, x in enumerate(PAIR_X):
            for y_index, y in enumerate(PAIR_Y):
                selected = (choice[row]["x"] == x_index) & (choice[row]["y"] == y_index)
                survivors = bool_sum(rows[row][point] for point in POINTS if point not in (x, y))
                solver.add(If(selected, survivors, 4) == 4)
        solver.add(source_survival[row])

        # These are explicit fields of FreshThirdAlignedFixedDeletionCorePacket.
        # They are intentionally not inferred from the finite row abstraction.
        solver.add(first_failure[row])
        solver.add(core_nonempty[row])

    common = choice[0]["x"] == choice[1]["x"]
    common = common | (choice[0]["y"] == choice[1]["y"])
    solver.add(common)
    if fixed_arm is not None:
        x0, y0, x1, y1 = fixed_arm
        solver.add(choice[0]["x"] == x0, choice[0]["y"] == y0)
        solver.add(choice[1]["x"] == x1, choice[1]["y"] == y1)

    return solver, {
        "rows": rows,
        "slices": slices,
        "radii": radii,
        "choice": choice,
        "source_survival": source_survival,
        "first_failure": first_failure,
        "core_nonempty": core_nonempty,
    }


def emit_smt(solver: Solver, path: Path) -> None:
    path.write_text("(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n", encoding="utf-8")


def run_cvc5(path: Path, label: str) -> str:
    try:
        proc = subprocess.run(
            ["cvc5", "--lang", "smt2", "--tlimit=10000", str(path)],
            capture_output=True,
            text=True,
            timeout=20,
            check=False,
        )
    except FileNotFoundError:
        return "unavailable"
    except subprocess.TimeoutExpired as exc:
        raise RuntimeError(f"fail-closed: cvc5 {label}=timeout") from exc
    token = proc.stdout.strip().splitlines()[0].strip() if proc.stdout.strip() else ""
    if token == "unknown":
        raise RuntimeError(f"fail-closed: cvc5 {label}=unknown")
    if token not in {"sat", "unsat"}:
        raise RuntimeError(f"cvc5 {label}: malformed status {token!r}: {proc.stderr.strip()[:160]}")
    return token


def check_case(
    label: str,
    solver: Solver,
    ctx: dict[str, object],
    path: Path,
    expected: str,
) -> tuple[str, str]:
    emit_smt(solver, path)
    result = solver.check()
    if result == unknown:
        raise RuntimeError(f"fail-closed: z3 {label}=unknown ({solver.reason_unknown()})")
    actual = "sat" if result == sat else "unsat"
    if actual != expected:
        raise RuntimeError(f"{label}: expected {expected}, got {actual}")
    cvc5 = run_cvc5(path, label)
    if cvc5 != "unavailable" and cvc5 != expected:
        raise RuntimeError(f"{label}: expected cvc5 {expected}, got {cvc5}")
    return actual, cvc5


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--results", type=Path, default=ROOT / "results.txt")
    args = parser.parse_args()
    lines = [
        "campaign=freshthird_aligned_common_deletion_v2",
        "claim_scope=bounded structural diagnostic only; no geometry, universal lift, or Lean closure",
        "schema_origin=TwoSourceFreshThirdRetainedProducer.lean:FreshThirdAlignedCommonDeletionCorePairPacket",
        "stale_v1_imports=none",
        "unknown_policy=fail-closed",
    ]
    try:
        arms = joint_arms()
        positive_solver, positive_ctx = build_schema()
        positive_path = ROOT / "positive.smt2"
        positive, positive_cvc5 = check_case("positive", positive_solver, positive_ctx, positive_path, "sat")
        lines.append(f"smoke_positive=z3:{positive} cvc5:{positive_cvc5}")

        negative_solver, negative_ctx = build_schema(overfull_row=0)
        negative_path = ROOT / "negative_overfull_row0.smt2"
        negative, negative_cvc5 = check_case("negative_overfull_row0", negative_solver, negative_ctx, negative_path, "unsat")
        lines.append(f"smoke_negative_overfull_row0=z3:{negative} cvc5:{negative_cvc5}")

        # Fix a tuple with x0≠x1 and y0≠y1 while retaining the required common
        # disjunction; this is the deliberately malformed negative arm.
        no_common_solver, no_common_ctx = build_schema(fixed_arm=(0, 0, 1, 1))
        no_common_path = ROOT / "negative_no_common_arm.smt2"
        no_common, no_common_cvc5 = check_case("negative_no_common_arm", no_common_solver, no_common_ctx, no_common_path, "unsat")
        lines.append(f"smoke_negative_no_common_arm=z3:{no_common} cvc5:{no_common_cvc5}")

        lines.append(f"joint_arm_count={len(arms)}")
        for index, arm in enumerate(arms):
            label = f"arm{index:02d}_{arm_name(arm)}"
            solver, ctx = build_schema(fixed_arm=arm)
            path = ROOT / f"{label}.smt2"
            status, cvc5 = check_case(label, solver, ctx, path, "sat")
            common_side = "x" if arm[0] == arm[2] else "y"
            if arm[0] == arm[2] and arm[1] == arm[3]:
                common_side = "x+y"
            lines.append(f"{label}=z3:{status} cvc5:{cvc5} common={common_side}")
    except Exception as exc:
        lines.append(f"status=FAIL {exc}")
        args.results.write_text("\n".join(lines) + "\n", encoding="utf-8")
        print("status=FAIL")
        print(f"results={args.results}")
        return 1
    lines.append("status=PASS")
    args.results.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("status=PASS")
    print(f"joint_arms={len(arms)}")
    print(f"results={args.results}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
