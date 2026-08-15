#!/usr/bin/env python3
"""One source-certified FreshThird motif-cut CEGAR round.

Arm 1, caps (1,1), endpoint branch is rebuilt from the corrected structural
encoder.  The cut is the negation of exactly the first four-row motif matched
to ``false_of_four_selected_rows_chained_late_pair``.  If the residual model
is SAT, its complete ``tracked_metric(..., solve_core=False)`` packet is
compared by cvc5 and Z3.  All outcomes remain diagnostic, not closure.
"""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path
from time import monotonic

from z3 import And, Not, SolverFor, sat
from z3.z3util import get_vars

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_metric_core import tracked_metric  # noqa: E402


STEM = HERE / "freshthird_endpoint_qflra_cegar_cut1_20260807"
SMT2_PATH = STEM.with_suffix(".smt2")
RESULT_PATH = STEM.with_suffix(".results.txt")
CVC5_OUT = STEM.with_suffix(".cvc5.out")
CVC5_ERR = STEM.with_suffix(".cvc5.err")
Z3_PATH = STEM.with_suffix(".z3.txt")


def _build_cut_model():
    solver, base_stats, context = F.build_pure_arm(
        F.ORDER_ARMS["outside_fresh_between_source_canonical"],
        max(F.STRUCTURAL_TIMEOUT_MS, 5_000),
    )
    ranks = context["ranks"]
    solver.add(ranks["pinnedCenter"] == ranks["drowCenter"])
    for row_point, drow_point in zip(F.ROW, F.DROW):
        solver.add(ranks[row_point] == ranks[drow_point])
    added_stats = F.add_full_fidelity_constraints(
        solver, context, fresh_cap=1, row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )

    # Exact source-certified first motif.  The final contains[1,1] atom is
    # already forced by the deleted-source shell (w1 is blocker b1's own
    # source), but is retained in the formula so the theorem membership map is
    # explicit rather than hidden in the base encoder.
    contains = context["contains"]
    motif_atoms = [
        ranks["pinnedCenter"] == ranks["qBetween"],
        ranks["freshCenter"] == ranks["w0"],
        ranks["b1"] == ranks["qOutside"],
        ranks["qOutside"] < ranks["qBetween"],
        ranks["qBetween"] < ranks["w1"],
        ranks["w1"] < ranks["sourceCenter"],
        contains[1, 0],  # shell_1_contains_w0
        contains[1, 1],  # shell_1_contains_w1 (own-source membership)
    ]
    motif = And(*motif_atoms)
    solver.add(Not(motif))
    structural_result = solver.check()
    return solver, context, base_stats, added_stats, structural_result, motif


def _smt2(records, normalization) -> str:
    variables = {}
    for _label, _family, _detail, expr in records:
        for variable in get_vars(expr):
            variables[str(variable)] = variable
    for variable in get_vars(normalization):
        variables[str(variable)] = variable
    lines = ["(set-logic QF_LRA)"]
    for name, variable in sorted(variables.items()):
        lines.append(f"(declare-fun {name} () {variable.sort().sexpr()})")
    for label, _family, _detail, expr in records:
        lines.append(f"(assert (! {expr.sexpr()} :named {label}))")
    lines.append(f"(assert (! {normalization.sexpr()} :named scale_normalization))")
    lines.extend(["(check-sat)", "(get-unsat-core)", ""])
    return "\n".join(lines)


def main() -> int:
    started = monotonic()
    solver, context, base_stats, added_stats, structural_result, _motif = _build_cut_model()
    lines = [
        "campaign=freshthird_endpoint_qflra_cegar_cut1_20260807",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 terminal=endpoint",
        "endpoint_encoding=pinnedCenter=drowCenter; ROW[i]=DROW[i] support relabeling",
        "cut=Not(pinnedCenter=qBetween AND freshCenter=w0 AND b1=qOutside AND qOutside<qBetween<w1<sourceCenter AND shell_1_contains_w0 AND shell_1_contains_w1)",
        "theorem_map=ia=qOutside, ib=qBetween, ic=w1, id=sourceCenter, bridge=w0",
        "theorem_rows=BridgeRow=freshCenter-row; EarlyRow=blocker-shell-1; MiddleRow=pinnedCenter-row; LateRow=sourceCenter-row",
        "theorem_memberships=base source/fresh/pinned shells provide ia/ib/bridge/ic memberships; shell_1_contains_w0 and shell_1_contains_w1 provide EarlyRow bridge/ic",
        "source_assumptions=ConvexIndep/injective/image/ccw producer obligations are not encoded; no universal lift",
        f"structural_base_assertions={base_stats['assertions']}",
        f"structural_added_assertions={added_stats['full_fidelity_assertions']}",
        f"structural_result={structural_result}",
    ]
    if structural_result != sat:
        lines.append("interpretation=structural residual is not SAT; no metric packet emitted")
        RESULT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
        print(f"results_path={RESULT_PATH}")
        return 0

    packet = tracked_metric(solver.model(), context, solve_core=False)
    records = packet["records"]
    normalization_pair, normalization_distance = next(iter(packet["metric_distances"].items()))
    normalization = normalization_distance == 1
    SMT2_PATH.write_text(_smt2(records, normalization), encoding="utf-8")
    qflra_exprs = [expr for _label, _family, _detail, expr in records] + [normalization]

    z3_solver = SolverFor("QF_LRA")
    z3_solver.set(timeout=120_000)
    z3_solver.add(*qflra_exprs)
    z3_started = monotonic()
    z3_result = z3_solver.check()
    z3_elapsed = monotonic() - z3_started
    Z3_PATH.write_text(
        "\n".join([
            "solver=z3",
            f"result={z3_result}",
            f"assertions={len(qflra_exprs)}",
            f"elapsed_seconds={z3_elapsed:.3f}",
        ]) + "\n",
        encoding="utf-8",
    )

    cvc5_started = monotonic()
    try:
        completed = subprocess.run(
            [
                "/Users/adam/bin/cvc5", "--lang", "smt2", "--tlimit", "120000",
                "--produce-unsat-cores", str(SMT2_PATH),
            ],
            capture_output=True, text=True, timeout=130, check=False,
        )
        cvc5_status = "completed"
        cvc5_rc = completed.returncode
        cvc5_stdout, cvc5_stderr = completed.stdout, completed.stderr
    except subprocess.TimeoutExpired as exc:
        cvc5_status, cvc5_rc = "outer_timeout_fail_closed", None
        cvc5_stdout = exc.stdout if isinstance(exc.stdout, str) else ""
        cvc5_stderr = exc.stderr if isinstance(exc.stderr, str) else ""
    CVC5_OUT.write_text(cvc5_stdout, encoding="utf-8")
    CVC5_ERR.write_text(cvc5_stderr, encoding="utf-8")
    first_line = cvc5_stdout.splitlines()[0] if cvc5_stdout.splitlines() else ""
    cvc5_verdict = first_line if first_line in {"sat", "unsat", "unknown"} else "no-verdict"
    interpretation = "fail-closed: no universal closure"
    if cvc5_verdict == "unsat" and str(z3_result) == "unsat":
        interpretation = "cvc5 and Z3 both UNSAT for residual packet; diagnostic only"
    lines.extend([
        f"metric_assertions={len(records)}",
        f"qflra_assertions_including_normalization={len(qflra_exprs)}",
        f"representatives={len(packet['representatives'])}",
        f"normalization=distance_pair_{normalization_pair}=1",
        f"smt2_path={SMT2_PATH}",
        f"z3_result={z3_result}",
        f"z3_elapsed_seconds={z3_elapsed:.3f}",
        f"z3_path={Z3_PATH}",
        f"cvc5_status={cvc5_status}",
        f"cvc5_returncode={cvc5_rc}",
        f"cvc5_verdict={cvc5_verdict}",
        f"cvc5_elapsed_seconds={monotonic() - cvc5_started:.3f}",
        f"cvc5_stdout_path={CVC5_OUT}",
        f"cvc5_stderr_path={CVC5_ERR}",
        f"elapsed_seconds={monotonic() - started:.3f}",
        f"interpretation={interpretation}",
    ])
    RESULT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"results_path={RESULT_PATH}")
    print(f"structural={structural_result} metric_assertions={len(records)} cvc5={cvc5_verdict} z3={z3_result}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
