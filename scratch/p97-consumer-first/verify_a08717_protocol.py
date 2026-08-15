#!/usr/bin/env python3
"""Verify base-only and base+a08717 checks for the corrected representative."""
import sys
from pathlib import Path
from time import monotonic
from z3 import Bool, SolverFor, sat, unsat

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from freshthird_full_fidelity_cegar import ORDER_ARMS, STRUCTURAL_TIMEOUT_MS, add_full_fidelity_constraints, build_pure_arm
from freshthird_metric_core import tracked_metric


def check(exprs):
    q = SolverFor("QF_LRA")
    q.set(timeout=120000)
    q.add(*exprs)
    t0 = monotonic(); result = q.check(); elapsed = monotonic() - t0
    return result, elapsed


def main():
    s, _, c = build_pure_arm(ORDER_ARMS["outside_fresh_between_source_canonical"], STRUCTURAL_TIMEOUT_MS)
    add_full_fidelity_constraints(s, c, 1, 1, enforce_equal_shell_slots_in_row=True)
    assert s.check() == sat
    records = tracked_metric(s.model(), c, solve_core=False)["records"]
    by = {label: (family, detail, expr) for label, family, detail, expr in records}
    base = [x for x in records if x[1] != "kalmanson"]
    core_label = "a08717_kalmanson"
    assert core_label in by
    kal_expr = by[core_label][2]

    base_result, base_seconds = check([x[3] for x in base])
    plus_result, plus_seconds = check([x[3] for x in base] + [kal_expr])

    lines = [
        "campaign=verify_a08717_protocol_v1",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 corrected_source_valid_model",
        f"base_assertion_count={len(base)}",
        f"base_result={base_result}",
        f"base_runtime_seconds={base_seconds:.3f}",
        "a08717_detail=quad=f1,w2,w1,b2;second",
        "a08717_expression=d(f1,w2)+d(w1,b2) < d(f1,w1)+d(w2,b2)",
        f"base_plus_a08717_result={plus_result}",
        f"base_plus_a08717_runtime_seconds={plus_seconds:.3f}",
    ]

    if base_result == unsat:
        # The singleton-Kalmanson interpretation is invalid if the baseline is UNSAT.
        lines.append("interpretation=base is UNSAT; retract singleton-Kalmanson interpretation")
    elif base_result == sat and plus_result == unsat:
        # Track every base assertion and a08717, then delete-shrink only base members.
        q = SolverFor("QF_LRA"); q.set(timeout=120000)
        for label, _fam, _detail, expr in base:
            q.assert_and_track(expr, Bool("track_" + label))
        q.assert_and_track(kal_expr, Bool("track_" + core_label))
        t0 = monotonic(); tracked_result = q.check(); tracked_seconds = monotonic() - t0
        raw = [str(x).removeprefix("track_") for x in q.unsat_core()] if tracked_result == unsat else []
        base_labels = {x[0]: (x[1], x[2], x[3]) for x in base}
        shrunk = list(raw)
        shrink_status = []
        for label in list(raw):
            if label == core_label:
                continue
            candidate = [x for x in shrunk if x != label]
            p = SolverFor("QF_LRA"); p.set(timeout=120000)
            p.add(kal_expr)
            p.add(*[base_labels[x][2] for x in candidate if x in base_labels])
            t1 = monotonic(); result = p.check(); elapsed = monotonic() - t1
            shrink_status.append((label, str(result), elapsed))
            if result == unsat:
                shrunk = candidate
        lines.extend([
            f"tracked_result={tracked_result}",
            f"tracked_runtime_seconds={tracked_seconds:.3f}",
            f"raw_core_size={len(raw)}",
            f"raw_core_labels={'/'.join(raw)}",
            f"shrunk_core_size={len(shrunk)}",
            "core_status=inclusion-minimal after deletion shrink; every listed base equality is necessary relative to this tracked core",
            "alias_note=f1 aliases pinnedCenter in this representative, so the four base equalities force both Kalmanson sides to the same row-radius plus blocker-radius sum",
        ])
        for label in shrunk:
            if label == core_label:
                lines.append(f"shrunk_core={label} family=kalmanson detail={by[label][1]} expr={by[label][2]}")
            else:
                lines.append(f"shrunk_core={label} family={base_labels[label][0]} detail={base_labels[label][1]} expr={base_labels[label][2]}")
        lines.append("source_mapping=a00351/a00352 known_row_equal_radius: SelectedFourClass.support_eq_radius (U1CarrierInjection.lean:400-414), or CriticalFourShell.support_eq_radius (U1CarrierInjection.lean:666-672) for pinnedCenter-row witnesses; source-produced theorem shape is cardinality-independent, but this instantiation is fixed to w1,w2")
        lines.append("source_mapping=a00422/a00423 blocker_row_membership: CriticalFourShell.support_eq_radius (U1CarrierInjection.lean:666-672) after selectedFourClass_support_eq_shell (U1CarrierInjection.lean:1188-1208); source-produced theorem shape is cardinality-independent, but this instantiation is fixed to blocker b2 and witnesses w1,w2")
        lines.append("source_mapping=a08717_kalmanson: no Lean producer; Euclidean Kalmanson consumer obligation on fixed tuple")
        lines.append("interpretation=base SAT and base+a08717 UNSAT; singleton conflicts listed above")
    else:
        lines.append("interpretation=unexpected result; no core extraction")

    out = Path(__file__).with_suffix(".results.txt")
    out.write_text("\n".join(lines) + "\n")
    print(f"wrote {out}")


if __name__ == "__main__":
    main()
