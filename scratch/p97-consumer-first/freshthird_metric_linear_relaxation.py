#!/usr/bin/env python3
"""Sound linear relaxation of the corrected FreshThird metric packet.

The exact-support nonmembership assertions are deliberately omitted.  They
are all disequalities and are not needed for a sound UNSAT implication:
removing them weakens the source-faithful packet, so UNSAT of this relaxation
still implies UNSAT of the full packet.  SAT is only ``SAT-relaxation`` and is
not evidence of a geometric realization.

Unlike the lazy checker, this runner asserts the complete finite Kalmanson
family in one QF_LRA solve.  Its purpose is to test whether disequality case
splitting, rather than the positive/equality/order core, caused the previous
256-cut timeout.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from pathlib import Path
from time import monotonic

from z3 import SolverFor, sat
from z3.z3util import get_vars

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_metric_core import tracked_metric  # noqa: E402


def _is_exact_support_disequality(family: str, detail: str) -> bool:
    return (
        family in {"known_row_exclusion", "blocker_shell_exclusion"}
        or (family == "blocker_row_membership" and "member=False" in detail)
    )


def _named_smt2(records, normalization) -> str:
    """Emit a cvc5-compatible named QF_LRA query for core extraction."""
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
    lines.append(
        f"(assert (! {normalization.sexpr()} :named scale_normalization))"
    )
    lines.extend(["(check-sat)", "(get-unsat-core)", ""])
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument(
        "--emit-smt2",
        type=Path,
        help="write the normalized QF_LRA packet before solving",
    )
    parser.add_argument(
        "--emit-only",
        action="store_true",
        help="build and emit the packet without invoking Z3",
    )
    parser.add_argument(
        "--omit-family",
        action="append",
        default=[],
        help="diagnostic family ablation; repeat to omit multiple families",
    )
    parser.add_argument(
        "--keep-family",
        action="append",
        default=[],
        help="diagnostic family restriction; repeat to retain only these families",
    )
    parser.add_argument(
        "--emit-ablation-dir",
        type=Path,
        help="emit one named SMT2 query with each retained family omitted",
    )
    parser.add_argument(
        "--emit-dual-input",
        type=Path,
        help="emit the selected positive rows for exact_fixed_rows_dual.py",
    )
    parser.add_argument(
        "--dual-center-role",
        action="append",
        default=[],
        help="when emitting dual input, retain only selected rows at these role names",
    )
    parser.add_argument(
        "--dual-core-from",
        type=Path,
        help="restrict emitted row equalities to row_* multipliers in an exact dual JSON",
    )
    parser.add_argument(
        "--four-row-motif-cut",
        action="store_true",
        help="exclude the replay-checked four-row survivor motif before selecting the structural model",
    )
    args = parser.parse_args(argv)
    if args.omit_family and args.keep_family:
        parser.error("--omit-family and --keep-family are mutually exclusive")

    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = F.build_pure_arm(
        F.ORDER_ARMS[order_name], max(F.STRUCTURAL_TIMEOUT_MS, 5_000)
    )
    F.add_full_fidelity_constraints(
        structural,
        context,
        fresh_cap=1,
        row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    row_cut_count = RowCuts.add_all_named_row_shared_pair_cuts(structural, context)
    pair_cut_count = PairCuts.add_all_named_row_pair_cuts(structural, context)
    motif_cut_count = 0
    if args.four_row_motif_cut:
        import freshthird_four_row_motif_cut_round as Motif

        motif_cut_count = Motif.add_four_row_motif_cut(structural, context)

    structural_result = structural.check()
    if structural_result != sat:
        raise SystemExit(
            f"corrected structural model was {structural_result}, not sat"
        )

    structural_model = structural.model()
    packet = tracked_metric(structural_model, context, solve_core=False)
    records = packet["records"]
    retained = [
        record
        for record in records
        if not _is_exact_support_disequality(record[1], record[2])
        and record[1] not in args.omit_family
        and (not args.keep_family or record[1] in args.keep_family)
    ]
    omitted = [record for record in records if record not in retained]

    solver = SolverFor("QF_LRA")
    solver.set(timeout=max(1, args.timeout_ms))
    solver.add(*[expr for _label, _family, _detail, expr in retained])
    # Every retained assertion is homogeneous in distances and radii, and all
    # distance variables are strictly positive.  Positive rescaling therefore
    # makes this normalization equisatisfiable with the unnormalized packet.
    normalization_pair, normalization_distance = next(
        iter(packet["metric_distances"].items())
    )
    normalization = normalization_distance == 1
    solver.add(normalization)

    print("campaign=freshthird_metric_linear_relaxation_v2", flush=True)
    print(f"configuration={order_name} fresh_cap=1 row_cap=1", flush=True)
    print("verdict_scope=exact-support-disequalities-omitted", flush=True)
    print(f"diagnostic_omitted_families={sorted(args.omit_family)}", flush=True)
    print(f"diagnostic_retained_families={sorted(args.keep_family)}", flush=True)
    print(f"row_blocker_shared_pair_cuts={row_cut_count}", flush=True)
    print(f"named_row_pair_shared_pair_cuts={pair_cut_count}", flush=True)
    print(f"four_row_motif_witnesses={motif_cut_count}", flush=True)
    print(f"representatives={len(packet['representatives'])}", flush=True)
    print(f"structural_model={F.model_summary(structural_model, context)}", flush=True)
    print(f"assertions_full={len(records)}", flush=True)
    print(f"assertions_retained={len(retained)}", flush=True)
    print(
        f"retained_families={dict(sorted(Counter(r[1] for r in retained).items()))}",
        flush=True,
    )
    print(f"assertions_omitted={len(omitted)}", flush=True)
    print(
        f"omitted_families={dict(sorted(Counter(r[1] for r in omitted).items()))}",
        flush=True,
    )
    print(f"scale_normalization=distance{normalization_pair}=1", flush=True)

    if args.emit_smt2 is not None:
        args.emit_smt2.parent.mkdir(parents=True, exist_ok=True)
        smt2 = _named_smt2(retained, normalization)
        args.emit_smt2.write_text(smt2)
        print(f"smt2_path={args.emit_smt2}", flush=True)

    if args.emit_ablation_dir is not None:
        args.emit_ablation_dir.mkdir(parents=True, exist_ok=True)
        for family in sorted({record[1] for record in retained}):
            ablated = [record for record in retained if record[1] != family]
            path = args.emit_ablation_dir / f"without_{family}.smt2"
            path.write_text(_named_smt2(ablated, normalization))
        print(f"ablation_dir={args.emit_ablation_dir}", flush=True)

    if args.emit_dual_input is not None:
        role_index = packet["metric_role_index"]
        selected_roles = [
            ("sourceCenter", F.SOURCE_SHELL),
            ("freshCenter", F.FRESH_SHELL),
            ("pinnedCenter", F.ROW),
            ("drowCenter", F.DROW),
            *[(f"b{z}", (f"w{z}", *(f"a{z}_{t}" for t in range(3))))
              for z in range(4)],
        ]
        if args.dual_center_role:
            requested = set(args.dual_center_role)
            available = {center for center, _support in selected_roles}
            if not requested <= available:
                raise ValueError(
                    f"unknown dual center roles: {sorted(requested - available)}"
                )
            selected_roles = [
                row for row in selected_roles if row[0] in requested
            ]
        selected_rows = {}
        provenance = []
        for center_role, support_roles in selected_roles:
            center = role_index[center_role]
            support = tuple(sorted({role_index[role] for role in support_roles}))
            if len(support) != 4 or center in support:
                raise AssertionError(
                    f"invalid selected row {center_role}: center={center}, support={support}"
                )
            previous = selected_rows.setdefault(center, support)
            if previous != support:
                raise AssertionError(f"incompatible rows at center {center}")
            provenance.append({
                "center_role": center_role,
                "center": center,
                "support_roles": list(support_roles),
                "support": list(support),
            })
        n = len(packet["representatives"])
        rows = {}
        for center in range(n):
            support = selected_rows.get(
                center, tuple(point for point in range(n) if point != center)[:4]
            )
            rows[str(center)] = list(support)
        core = [
            [center, support[0], point]
            for center, support in sorted(selected_rows.items())
            for point in support[1:]
        ]
        if args.dual_core_from is not None:
            prior = json.loads(args.dual_core_from.read_text())
            requested_equalities = {
                tuple(map(int, name.split("_")[1:]))
                for name in prior["multipliers"]
                if name.startswith("row_")
            }
            available_equalities = {tuple(item) for item in core}
            if not requested_equalities <= available_equalities:
                raise ValueError("prior dual requests unavailable row equalities")
            core = [item for item in core if tuple(item) in requested_equalities]
        payload = {
            "n": n,
            "rows": rows,
            "core": core,
            "selected_rows": provenance,
            "representatives": packet["representatives"],
            "role_index": role_index,
            "scope": "one corrected fixed FreshThird structural survivor",
        }
        args.emit_dual_input.parent.mkdir(parents=True, exist_ok=True)
        args.emit_dual_input.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
        print(f"dual_input_path={args.emit_dual_input}", flush=True)

    if args.emit_only:
        if (args.emit_smt2 is None and args.emit_ablation_dir is None
                and args.emit_dual_input is None):
            parser.error("--emit-only requires an emit destination")
        print("result=not-run", flush=True)
        return 0

    started = monotonic()
    result = solver.check()
    elapsed = monotonic() - started

    print(f"result={result}")
    if result != sat:
        print(f"reason_unknown={solver.reason_unknown()}")
    print(f"runtime_seconds={elapsed:.3f}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
