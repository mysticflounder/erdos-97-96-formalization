#!/usr/bin/env python3
"""One fail-closed cvc5 comparison for the corrected arm-1 endpoint packet.

This owns all output names (the ``20260807`` suffix is intentional).  It builds
the endpoint support relabeling directly, freezes the first corrected
structural model, emits the complete tracked_metric QF_LRA packet, and invokes
cvc5 with its 120-second internal limit.  A timeout/unknown is never reported
as UNSAT or SAT closure.
"""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path
from time import monotonic

from z3 import sat
from z3.z3util import get_vars

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_metric_core import tracked_metric  # noqa: E402


STEM = HERE / "freshthird_endpoint_qflra_cvc5_20260807"
SMT2_PATH = STEM.with_suffix(".smt2")
RESULT_PATH = STEM.with_suffix(".results.txt")
CVC5_OUT = STEM.with_suffix(".cvc5.out")
CVC5_ERR = STEM.with_suffix(".cvc5.err")


def _endpoint_packet():
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
    structural_result = solver.check()
    if structural_result != sat:
        raise RuntimeError(f"endpoint structural model is {structural_result}")
    packet = tracked_metric(solver.model(), context, solve_core=False)
    return packet, base_stats, added_stats


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
    packet, base_stats, added_stats = _endpoint_packet()
    records = packet["records"]
    normalization_pair, normalization_distance = next(iter(packet["metric_distances"].items()))
    normalization = normalization_distance == 1
    SMT2_PATH.write_text(_smt2(records, normalization), encoding="utf-8")

    cvc5_started = monotonic()
    try:
        completed = subprocess.run(
            [
                "/Users/adam/bin/cvc5", "--lang", "smt2", "--tlimit", "120000",
                "--produce-unsat-cores", str(SMT2_PATH),
            ],
            capture_output=True,
            text=True,
            timeout=130,
            check=False,
        )
        cvc5_status = "completed"
        cvc5_rc = completed.returncode
        cvc5_stdout = completed.stdout
        cvc5_stderr = completed.stderr
    except subprocess.TimeoutExpired as exc:
        cvc5_status = "outer_timeout_fail_closed"
        cvc5_rc = None
        cvc5_stdout = (exc.stdout or "") if isinstance(exc.stdout, str) else ""
        cvc5_stderr = (exc.stderr or "") if isinstance(exc.stderr, str) else ""

    CVC5_OUT.write_text(cvc5_stdout, encoding="utf-8")
    CVC5_ERR.write_text(cvc5_stderr, encoding="utf-8")
    first_line = cvc5_stdout.splitlines()[0] if cvc5_stdout.splitlines() else ""
    verdict = first_line if first_line in {"sat", "unsat", "unknown"} else "no-verdict"
    if cvc5_status != "completed" or verdict != "unsat":
        interpretation = "fail-closed: no UNSAT closure"
    else:
        interpretation = "cvc5-unsat for this exact normalized QF_LRA packet; diagnostic only"

    lines = [
        "campaign=freshthird_endpoint_qflra_cvc5_20260807",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 terminal=endpoint",
        "endpoint_encoding=pinnedCenter=drowCenter; ROW[i]=DROW[i] support relabeling",
        f"structural_base_assertions={base_stats['assertions']}",
        f"structural_added_assertions={added_stats['full_fidelity_assertions']}",
        f"metric_assertions={len(records)}",
        f"qflra_assertions_including_normalization={len(records) + 1}",
        f"representatives={len(packet['representatives'])}",
        f"normalization=distance_pair_{normalization_pair}=1",
        f"smt2_path={SMT2_PATH}",
        f"cvc5_status={cvc5_status}",
        f"cvc5_returncode={cvc5_rc}",
        f"cvc5_verdict={verdict}",
        f"cvc5_elapsed_seconds={monotonic() - cvc5_started:.3f}",
        f"cvc5_stdout_path={CVC5_OUT}",
        f"cvc5_stderr_path={CVC5_ERR}",
        f"elapsed_seconds={monotonic() - started:.3f}",
        f"interpretation={interpretation}",
    ]
    RESULT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"results_path={RESULT_PATH}")
    print(f"metric_assertions={len(records)} cvc5_status={cvc5_status} verdict={verdict}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
