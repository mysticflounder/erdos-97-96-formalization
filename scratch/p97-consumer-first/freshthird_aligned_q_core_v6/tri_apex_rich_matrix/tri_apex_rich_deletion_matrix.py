#!/usr/bin/env python3
"""Small v6 extension for the three rich-apex deletion witnesses.

This is a finite SMT diagnostic.  The class supports stand for selected
radius classes on the expanded shell universe.  The optional interior tier
adds only the source-entitled post-deletion cap2/cap3 incidence variables and
lower bounds; it does not infer a metric partition or cap cardinality.
"""

from __future__ import annotations

import importlib.util
import itertools
import json
import argparse
import sys
from pathlib import Path

from z3 import And, Bool, BoolVal, Int, Not, Or, Solver, sat, unknown


ROOT = Path(__file__).resolve().parent
V6_PATH = ROOT.parent / "freshthird_aligned_q_core_v6.py"
spec = importlib.util.spec_from_file_location("freshthird_v6_for_rich_matrix", V6_PATH)
assert spec is not None and spec.loader is not None
V6 = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = V6
spec.loader.exec_module(V6)

POINTS = V6.POINTS
SHELL_POINTS = V6.SHELL_POINTS
APEXES = ("oppApex1", "oppApex2", "surplusApex")
FIXED_ARM = (0, 0, 0, 0)


def card(xs):
    return V6.V3.bsum(xs)


def build_rich_schema(
    modes: dict[str, str],
    *,
    equal_blockers: bool,
    cap_interior_pattern: bool = False,
    cap_separation_pattern: bool = False,
    bad_s6_survivor: bool = False,
    bad_d44_survivors: bool = False,
    bad_shell_hit: bool = False,
    bad_cross_apex_hit: bool = False,
    bad_common_deletion_mismatch: bool = False,
    bad_s6_interior: bool = False,
    bad_d44_interior: bool = False,
    bad_cap_overlap: bool = False,
    bad_source_in_off_first_cap: bool = False,
) -> tuple[Solver, dict[str, dict[str, object]]]:
    """Add the selected fidelity tier to the v6 schema."""
    solver = V6.build_schema_v6(fixed_arm=FIXED_ARM, equal_blockers=equal_blockers)
    rich: dict[str, dict[str, object]] = {}
    common_deleted = {p: Bool(f"common_deleted_{p}") for p in SHELL_POINTS}
    solver.add(card(common_deleted.values()) == 1)
    if bad_common_deletion_mismatch:
        solver.add(common_deleted["source0"], common_deleted["source1"])
    for apex in APEXES:
        mode = modes[apex]
        # TriApexRichDeletionPattern quantifies one common deletion for all
        # three apexes; no per-apex deletion choices are introduced.
        deleted = common_deleted
        item: dict[str, object] = {"mode": mode, "deleted": deleted}
        # The coupled cap theorem is available after the common deletion
        # only for the two off-first-cap witnesses (cap2/cap3).
        coupled_cap = cap_interior_pattern and apex in ("oppApex2", "surplusApex")
        cap_interior = None
        if coupled_cap:
            cap_interior = {p: Bool(f"{apex}_capInterior_{p}") for p in SHELL_POINTS}
            # The common deletion is from the first cap, hence outside the
            # cap2/cap3 interiors; their selected-class cap slices are
            # unchanged by erasure.
            for p in SHELL_POINTS:
                solver.add(Not(And(common_deleted[p], cap_interior[p])))
            item["capInterior"] = cap_interior
        if mode == "S6":
            radius = Int(f"{apex}_s6_radius")
            support = {p: Bool(f"{apex}_s6_class_{p}") for p in SHELL_POINTS}
            survivor = {p: Bool(f"{apex}_s6_survivor_{p}") for p in SHELL_POINTS}
            solver.add(radius > 0, card(support.values()) >= 6)
            for p in SHELL_POINTS:
                solver.add(survivor[p] == And(support[p], Not(deleted[p])))
            solver.add(card(survivor.values()) >= 5)
            if coupled_cap:
                solver.add(card(And(survivor[p], cap_interior[p]) for p in SHELL_POINTS) >= 4)
                if bad_s6_interior and apex == "oppApex2":
                    solver.add(card(And(survivor[p], cap_interior[p]) for p in SHELL_POINTS) <= 3)
            if bad_s6_survivor and apex == "oppApex1":
                solver.add(card(survivor.values()) <= 4)
            rich_hit = (support,)
            item.update(radius=radius, support=support, survivor=survivor)
        elif mode == "D44":
            radius1 = Int(f"{apex}_d44_radius1")
            radius2 = Int(f"{apex}_d44_radius2")
            support1 = {p: Bool(f"{apex}_d44_class1_{p}") for p in SHELL_POINTS}
            support2 = {p: Bool(f"{apex}_d44_class2_{p}") for p in SHELL_POINTS}
            survivor1 = {p: Bool(f"{apex}_d44_survivor1_{p}") for p in SHELL_POINTS}
            survivor2 = {p: Bool(f"{apex}_d44_survivor2_{p}") for p in SHELL_POINTS}
            solver.add(radius1 > 0, radius2 > 0, radius1 != radius2)
            solver.add(card(support1.values()) >= 4, card(support2.values()) >= 4)
            for p in SHELL_POINTS:
                solver.add(Not(And(support1[p], support2[p])))
                solver.add(survivor1[p] == And(support1[p], Not(deleted[p])))
                solver.add(survivor2[p] == And(support2[p], Not(deleted[p])))
            solver.add(Or(card(survivor1.values()) >= 4, card(survivor2.values()) >= 4))
            if coupled_cap:
                solver.add(card(And(survivor1[p], cap_interior[p]) for p in SHELL_POINTS) >= 2)
                solver.add(card(And(survivor2[p], cap_interior[p]) for p in SHELL_POINTS) >= 2)
                if bad_d44_interior and apex == "oppApex2":
                    solver.add(card(And(survivor1[p], cap_interior[p]) for p in SHELL_POINTS) <= 1)
                    solver.add(card(And(survivor2[p], cap_interior[p]) for p in SHELL_POINTS) <= 1)
            if bad_d44_survivors and apex == "oppApex1":
                solver.add(card(survivor1.values()) <= 3, card(survivor2.values()) <= 3)
            rich_hit = (support1, support2)
            item.update(radius1=radius1, radius2=radius2, support1=support1,
                        support2=support2, survivor1=survivor1, survivor2=survivor2)
        else:
            raise ValueError(f"unknown rich mode {mode!r}")

        # Source theorem: each canonical critical shell meets each selected
        # class at most twice.  v6 already supplies the row/Q shell bounds.
        for side in ("x", "y"):
            for row in range(2):
                shell = {p: Bool(f"core{row}_{side}Shell_{p}") for p in SHELL_POINTS}
                for support in rich_hit:
                    solver.add(card(And(shell[p], support[p]) for p in SHELL_POINTS) <= 2)
                    if bad_shell_hit and apex == "oppApex1" and side == "x" and row == 0:
                        solver.add(shell["fill0"])
                        solver.add(support["x0"], support["x1"], support["fill0"])
        rich[apex] = item

    if cap_separation_pattern:
        if not cap_interior_pattern:
            raise ValueError("cap separation requires the cap-interior tier")
        cap2 = rich["oppApex2"]["capInterior"]
        cap3 = rich["surplusApex"]["capInterior"]
        # Actual interiors of distinct indexed caps are disjoint.  Both
        # canonical sources lie in the first cap interior, hence in neither
        # off-first-cap interior.
        for p in SHELL_POINTS:
            solver.add(Not(And(cap2[p], cap3[p])))
        for source in ("source0", "source1"):
            solver.add(Not(cap2[source]), Not(cap3[source]))
        if bad_cap_overlap:
            solver.add(cap2["fill0"], cap3["fill0"])
        if bad_source_in_off_first_cap:
            solver.add(cap2["source0"])

    # Source-faithful circle geometry: selected positive-radius classes at
    # distinct apex centers meet in at most two points.  There are no
    # cross-apex radius-identification assumptions here.
    for left_index, left_apex in enumerate(APEXES):
        for right_apex in APEXES[left_index + 1:]:
            left_item, right_item = rich[left_apex], rich[right_apex]
            left_supports = ([left_item["support"]] if left_item["mode"] == "S6"
                             else [left_item["support1"], left_item["support2"]])
            right_supports = ([right_item["support"]] if right_item["mode"] == "S6"
                              else [right_item["support1"], right_item["support2"]])
            for left_support in left_supports:
                for right_support in right_supports:
                    solver.add(card(And(left_support[p], right_support[p])
                                    for p in SHELL_POINTS) <= 2)
                    if bad_cross_apex_hit and left_apex == "oppApex1" and right_apex == "surplusApex":
                        for p in ("source0", "source1", "qFresh"):
                            solver.add(left_support[p], right_support[p])
    return solver, rich


def emit_and_check(label: str, solver: Solver, path: Path, expected: str | None = None) -> tuple[str, str]:
    V6.emit_smt(solver, path)
    result = solver.check()
    if result == unknown:
        raise RuntimeError(f"fail-closed: z3 {label}=unknown ({solver.reason_unknown()})")
    status = "sat" if result == sat else "unsat"
    cvc5 = V6.cvc5_status(path, label)
    if cvc5 != "unavailable" and cvc5 != status:
        raise RuntimeError(f"{label}: z3/cvc5 disagreement ({status}/{cvc5})")
    if expected is not None and status != expected:
        raise RuntimeError(f"{label}: expected {expected}, got {status}")
    return status, cvc5


def value(model, expr):
    got = model.eval(expr, model_completion=True)
    return str(got)


def support_names(model, support):
    return [p for p in SHELL_POINTS if value(model, support[p]) == "True"]


def model_line(model, apex: str, item: dict[str, object]) -> str:
    deleted = support_names(model, item["deleted"])
    cap = item.get("capInterior")
    mode = item["mode"]
    if mode == "S6":
        support = support_names(model, item["support"])
        survivor = support_names(model, item["survivor"])
        cap_slice = ([p for p in survivor if value(model, cap[p]) == "True"]
                     if cap is not None else [])
        cap_text = f" capSlice={cap_slice}" if cap is not None else ""
        return f"{apex}=S6 deleted={deleted} class={support} survivor={survivor}{cap_text}"
    support1 = support_names(model, item["support1"])
    support2 = support_names(model, item["support2"])
    survivor1 = support_names(model, item["survivor1"])
    survivor2 = support_names(model, item["survivor2"])
    cap_text = ""
    if cap is not None:
        cap1 = [p for p in survivor1 if value(model, cap[p]) == "True"]
        cap2 = [p for p in survivor2 if value(model, cap[p]) == "True"]
        cap_text = f" capSlice1={cap1} capSlice2={cap2}"
    return (f"{apex}=D44 deleted={deleted} class1={support1} class2={support2} "
            f"survivor1={survivor1} survivor2={survivor2}{cap_text}")


def run_tier(
    tier: str, *, cap_interior_pattern: bool, cap_separation_pattern: bool = False
) -> dict[str, int]:
    combos = list(itertools.product(("S6", "D44"), repeat=3))
    results: list[str] = []
    models: list[str] = []
    prefix = f"tier_{tier}"
    manifest = {
        "schema": f"freshthird_aligned_q_core_v6_tri_apex_rich_deletion_{tier}",
        "tier": tier,
        "source_basis": [
            "ApexRichClassStructure (S6: positive radius and class card >= 6)",
            "ApexRichClassStructure (D44: two distinct positive radii, each class card >= 4)",
            "apexRichDeletionPattern_of_apexRichClassStructure",
            "TriApexRichDeletionPattern (one common deletion)",
            "criticalShell_inter_selectedClass_card_le_two_of_apexRich",
            "OppositeCapRichDeletionCoupledPattern (off-first-cap apexes)" if cap_interior_pattern else "cap-interior pattern not active",
            "distinct indexed cap interiors are disjoint; both canonical sources are excluded from cap2/cap3" if cap_separation_pattern else "cap separation pattern not active",
        ],
        "apexes": list(APEXES),
        "point_universe": list(SHELL_POINTS),
        "fixed_v6_arm": list(FIXED_ARM),
        "blocker_modes": ["distinct", "equal"],
        "rich_modes": ["S6", "D44"],
        "cap_interior_pattern": cap_interior_pattern,
        "cap_separation_pattern": cap_separation_pattern,
        "cap_interior_cardinality_assumption": "none",
        "clauses": [
            "one shared common_deleted vertex for all three apex witnesses",
            "S6: radius > 0, class cardinality >= 6, survivor = class minus common_deleted, survivor cardinality >= 5",
            "D44: radii > 0 and distinct, disjoint class1/class2 cardinalities >= 4, at least one survivor cardinality >= 4",
            "each rich selected class intersects every synchronized x/y shell in at most 2",
            "each rich selected class at one apex intersects each rich selected class at another apex in at most 2",
            "common deletion outside cap2/cap3 interiors; off-first-cap S6 survivor∩capInterior >= 4 and D44 survivor∩capInterior >= 2 per radius; full S6/D44 survivor clauses are coupled" if cap_interior_pattern else "no cap-interior lower bounds",
            "cap2/cap3 interiors are pointwise disjoint; source0/source1 belong to neither off-first-cap interior" if cap_separation_pattern else "no cross-cap interior separation clauses",
            "all v6 shell synchronization, endpoint, source absence, row/Q shell bounds, and blocker controls retained",
        ],
    }
    try:
        for combo in combos:
            modes = dict(zip(APEXES, combo))
            combo_name = "_".join(f"{a}-{m}" for a, m in zip(APEXES, combo))
            for equal in (False, True):
                blocker = "equal" if equal else "distinct"
                label = f"{prefix}_matrix_{combo_name}_{blocker}"
                solver, rich = build_rich_schema(modes, equal_blockers=equal,
                                                 cap_interior_pattern=cap_interior_pattern,
                                                 cap_separation_pattern=cap_separation_pattern)
                status, cvc5 = emit_and_check(label, solver, ROOT / f"{label}.smt2")
                results.append(f"{label}=z3:{status} cvc5:{cvc5}")
                if combo == ("S6", "D44", "S6"):
                    models.append(f"{label}:")
                    models.extend(model_line(solver.model(), apex, rich[apex]) for apex in APEXES)

        controls = [
            ("negative_common_deletion_cardinality", dict(modes={a: "S6" for a in APEXES}, equal_blockers=False,
                                                            cap_interior_pattern=cap_interior_pattern,
                                                            bad_common_deletion_mismatch=True), "unsat"),
            ("negative_s6_survivor_card", dict(modes={a: "S6" for a in APEXES}, equal_blockers=False,
                                                cap_interior_pattern=cap_interior_pattern,
                                                bad_s6_survivor=True), "unsat"),
            ("negative_d44_survivor_disjunction", dict(modes={a: "D44" for a in APEXES}, equal_blockers=False,
                                                        cap_interior_pattern=cap_interior_pattern,
                                                        bad_d44_survivors=True), "unsat"),
            ("negative_rich_shell_hit_three", dict(modes={a: "S6" for a in APEXES}, equal_blockers=False,
                                                     cap_interior_pattern=cap_interior_pattern,
                                                     bad_shell_hit=True), "unsat"),
            ("negative_cross_apex_rich_hit_three", dict(modes={a: "S6" for a in APEXES}, equal_blockers=False,
                                                         cap_interior_pattern=cap_interior_pattern,
                                                         bad_cross_apex_hit=True), "unsat"),
        ]
        if cap_interior_pattern:
            controls.extend([
                ("negative_s6_interior_card", dict(modes={a: "S6" for a in APEXES}, equal_blockers=False,
                                                       cap_interior_pattern=True, bad_s6_interior=True), "unsat"),
                ("negative_d44_interior_card", dict(modes={a: "D44" for a in APEXES}, equal_blockers=False,
                                                       cap_interior_pattern=True, bad_d44_interior=True), "unsat"),
            ])
        if cap_separation_pattern:
            controls.extend([
                ("negative_cap2_cap3_overlap", dict(modes={a: "S6" for a in APEXES}, equal_blockers=False,
                                                          cap_interior_pattern=True, cap_separation_pattern=True,
                                                          bad_cap_overlap=True), "unsat"),
                ("negative_source_in_off_first_cap", dict(modes={a: "S6" for a in APEXES}, equal_blockers=False,
                                                             cap_interior_pattern=True, cap_separation_pattern=True,
                                                             bad_source_in_off_first_cap=True), "unsat"),
            ])
        for label, kwargs, expected in controls:
            solver, _ = build_rich_schema(**kwargs)
            status, cvc5 = emit_and_check(f"{prefix}_{label}", solver, ROOT / f"{prefix}_{label}.smt2", expected)
            results.append(f"{prefix}_{label}=z3:{status} cvc5:{cvc5}")
        manifest["matrix_query_count"] = len(combos) * 2
        manifest["control_query_count"] = len(controls)
        manifest["generated_smt2"] = len(list(ROOT.glob(f"{prefix}_*.smt2")))
        manifest["status"] = "PASS"
        (ROOT / f"{prefix}_manifest.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
        positive = results[:16]
        (ROOT / f"{prefix}_results.txt").write_text("\n".join(results) +
            f"\npositive_sat_count={sum('z3:sat' in x for x in positive)}\n"
            f"positive_unsat_count={sum('z3:unsat' in x for x in positive)}\n"
            f"control_count={len(controls)}\nstatus=PASS\n", encoding="utf-8")
        (ROOT / f"{prefix}_run.log").write_text("command=uv run python tri_apex_rich_deletion_matrix.py --tier " + tier + "\n" +
            "solver_setup=Z3 API plus cvc5 --lang smt2 --tlimit=10000\n" +
            "unknown_policy=fail-closed\n" + "\n".join(results) + "\n", encoding="utf-8")
        (ROOT / f"{prefix}_survivor-summary.md").write_text(
            f"# Tri-apex rich deletion survivor audit: {tier}\n\n" +
            "Representative SAT model: `(S6, D44, S6)` on the common-x+y arm. "
            "The listed survivor is the post-deletion support; D44 requires only one "
            "of the two full classes to survive.\n\n```text\n" + "\n".join(models) +
            f"\n```\n\nAll 16 matrix queries are SAT in both solvers; all {len(controls)} controls are "
            "UNSAT in both. This remains a bounded diagnostic, not a closure claim.\n",
            encoding="utf-8")
        return {"sat": sum("z3:sat" in x for x in positive), "unsat": sum("z3:unsat" in x for x in positive), "controls": len(controls)}
    except Exception as exc:
        manifest["status"] = f"FAIL: {exc}"
        (ROOT / f"{prefix}_manifest.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
        raise


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--tier", choices=("common", "interior", "separated", "all"), default="all")
    args = parser.parse_args()
    tiers = ([
        ("common", False, False),
        ("interior", True, False),
        ("separated", True, True),
    ] if args.tier == "all" else [
        (args.tier, args.tier in ("interior", "separated"), args.tier == "separated")
    ])
    summaries = []
    try:
        for tier, cap_interior_pattern, cap_separation_pattern in tiers:
            counts = run_tier(tier, cap_interior_pattern=cap_interior_pattern,
                              cap_separation_pattern=cap_separation_pattern)
            summaries.append(f"{tier}:sat={counts['sat']} unsat={counts['unsat']} controls={counts['controls']}")
    except Exception as exc:
        print(f"status=FAIL {exc}")
        return 1
    print("status=PASS")
    print("; ".join(summaries))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
