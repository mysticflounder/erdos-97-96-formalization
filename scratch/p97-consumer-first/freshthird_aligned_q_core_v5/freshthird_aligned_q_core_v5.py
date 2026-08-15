#!/usr/bin/env python3
"""FreshThird aligned-Q structural diagnostic, v5.

This is a scratch-only extension of ``freshthird_aligned_q_core_v3``.  The
v3 source controls are retained verbatim through its builder; v5 adds only
source-entitled finite clauses and checks them with both Z3 and cvc5.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import subprocess
import sys
from pathlib import Path

from z3 import And, Bool, BoolVal, Implies, Int, Not, Solver, sat, unknown


ROOT = Path(__file__).resolve().parent
V3_DIR = ROOT.parent / "freshthird_aligned_q_core_v3"
spec = importlib.util.spec_from_file_location("freshthird_v3", V3_DIR / "freshthird_aligned_q_core_v3.py")
assert spec is not None and spec.loader is not None
V3 = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = V3
spec.loader.exec_module(V3)

POINTS = V3.POINTS


def intersection_le_two(left: dict[str, object], right: dict[str, object]):
    return V3.bsum(And(left[p], right[p]) for p in POINTS) <= 2


def build_schema_v5(
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
) -> Solver:
    solver, context = V3.build_schema(
        fixed_arm=fixed_arm,
        overfull_source=overfull_source,
        overfull_q=overfull_q,
        force_shell_overlap=force_shell_overlap,
    )
    rows = context["rows"]
    q_row = context["q_row"]
    shells = context["shells"]
    choices = {
        row: {side: Int(f"row{row}_{side}Choice") for side in ("x", "y")}
        for row in range(2)
    }

    # Source-faithful mode split: equal actual blockers identify their exact
    # selected supports; distinct blockers invoke the two-circle ≤2 bound.
    blockers_equal = Bool("blockersEqual")
    solver.add(blockers_equal == BoolVal(equal_blockers))
    for point in POINTS:
        if equal_blockers:
            solver.add(rows[0][point] == rows[1][point])
    solver.add(
        Implies(
            Not(blockers_equal),
            V3.bsum(And(rows[0][p], rows[1][p]) for p in POINTS) <= 2,
        )
    )

    # The kernel-checked fixedDeletionCore theorem identifies every x-shell
    # with the P-radius class and every y-shell with the Pρ-radius class.
    # Synchronization across the two overlapping cores is therefore
    # unconditional; it does not depend on the literal existential deletion
    # witnesses chosen by the source packet.
    for side in ("x", "y"):
        required_endpoints = V3.PAIR_X if side == "x" else V3.PAIR_Y
        for point in POINTS:
            solver.add(shells[0][side][point] == shells[1][side][point])
        # Exact shell equality with the selected radius class implies both
        # retained endpoints lie on every corresponding core shell, not only
        # the endpoint named by an existential deletion witness.
        for row in range(2):
            for endpoint in required_endpoints:
                solver.add(shells[row][side][endpoint])

        # The kernel-checked criticalShell_inter_selectedClass_card_le_two_of_
        # apexRich theorem gives these bounds for every canonical source row,
        # without a blocker-mode guard.
        for row in range(2):
            solver.add(intersection_le_two(rows[row], shells[0][side]))
            solver.add(intersection_le_two(rows[row], shells[1][side]))

        # Q's canonical row is also covered unconditionally by the same
        # critical-shell/two-circle theorem at T.oppApex1_rich.
        solver.add(intersection_le_two(q_row, shells[0][side]))
        solver.add(intersection_le_two(q_row, shells[1][side]))

    # Clause-specific negative controls.  They are not part of the positive
    # campaign and exist only to prove that each new guard is active.
    if force_sync_mismatch:
        solver.add(shells[0]["x"]["shellOverlap"] != shells[1]["x"]["shellOverlap"])
    if force_source_overlap:
        for point in ("source0", "source1", "qFresh"):
            solver.add(rows[0][point], shells[0]["x"][point])
    if force_q_overlap:
        for point in ("x0", "x1", "qFresh"):
            solver.add(shells[0]["x"][point])
    if force_mode_mismatch:
        solver.add(blockers_equal)
        solver.add(rows[0]["qFresh"], Not(rows[1]["qFresh"]))
    if force_shell_membership_failure:
        solver.add(Not(shells[0]["x"]["x1"]))
    return solver


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


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--results", type=Path, default=ROOT / "results.txt")
    args = parser.parse_args()
    lines = [
        "campaign=freshthird_aligned_q_core_v5",
        "claim_scope=bounded structural diagnostic only; no geometry, universal lift, or Lean closure",
        "schema_origin=TwoSourceFreshThirdRetainedProducer.lean:FreshThirdAlignedCommonDeletionCorePairPacket",
        "v3_controls=positive_exact4_q_and_three_negative_controls_preserved",
        "new_clauses=unconditional_cross_core_x_y_shell_sync; both_x_endpoints_and_both_y_endpoints_on_every_core_shell; unconditional_source_row_apex_shell_le2; unconditional_Q_row_apex_shell_le2; equal-blocker_row_equality_or_distinct-blocker_row_overlap_le2",
        "source_basis=FreshThirdAlignedCoreGeometry.fixedDeletionCore_exactRetainedShells_and_rowBounds; shell synchronization and row/apex plus Q/apex bounds are unconditional",
        "unknown_policy=fail-closed",
    ]
    try:
        for mode in (False, True):
            label = f"positive_{'equal' if mode else 'distinct'}_blockers"
            status, independent = check_case(label, build_schema_v5(equal_blockers=mode), ROOT / f"{label}.smt2", "sat")
            lines.append(f"{label}=z3:{status} cvc5:{independent}")

        for label, kwargs in (
            ("negative_overfull_source0", {"overfull_source": 0}),
            ("negative_overfull_q", {"overfull_q": True}),
            ("negative_shell_overlap_core0", {"force_shell_overlap": True}),
            ("negative_sync_mismatch", {"fixed_arm": (0, 0, 0, 0), "force_sync_mismatch": True}),
            ("negative_source_shell_overlap", {"fixed_arm": (0, 0, 0, 0), "force_source_overlap": True}),
            ("negative_q_shell_overlap", {"fixed_arm": (0, 0, 0, 0), "force_q_overlap": True}),
            ("negative_equal_mode_row_mismatch", {"fixed_arm": (0, 0, 0, 0), "equal_blockers": True, "force_mode_mismatch": True}),
            ("negative_shell_endpoint_membership", {"force_shell_membership_failure": True}),
        ):
            status, independent = check_case(label, build_schema_v5(**kwargs), ROOT / f"{label}.smt2", "unsat")
            lines.append(f"{label}=z3:{status} cvc5:{independent}")

        arms = V3.joint_arms()
        lines.append(f"joint_arm_count={len(arms)}")
        arm_statuses: list[str] = []
        for index, arm in enumerate(arms):
            label = f"arm{index:02d}_{V3.arm_name(arm)}"
            for mode in (False, True):
                mode_name = "distinct" if not mode else "equal"
                case_label = f"{label}_{mode_name}"
                status, independent = check_case(
                    case_label,
                    build_schema_v5(fixed_arm=arm, equal_blockers=mode),
                    ROOT / f"{case_label}.smt2",
                    "sat",
                )
                arm_statuses.append(status)
                common_side = "x+y" if arm[0] == arm[2] and arm[1] == arm[3] else ("x" if arm[0] == arm[2] else "y")
                lines.append(f"{case_label}=z3:{status} cvc5:{independent} common={common_side}")
        lines.extend([
            f"arm_query_count={len(arm_statuses)}",
            f"arm_sat_count={arm_statuses.count('sat')}",
            f"arm_unsat_count={arm_statuses.count('unsat')}",
            "questionable_clause=none in the revised source clauses; only the mode-specific source-row equality/overlap relation remains an explicit finite branch",
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
