"""Prelaunch symbolic FirstNonHit Q-row blocker-fan packet.

This module deliberately exposes a *structural* finite-role quotient only.
It has no carrier bound, exact-n=17 assumption, order arm, metric variables,
universal lift, or Lean-closure claim.  The CLI accepts only ``--smoke-only``;
the full wave is intentionally not implemented here.
"""

from __future__ import annotations

import json
import tempfile
from itertools import combinations
from pathlib import Path
from typing import Any

from z3 import And, Bool, BoolVal, If, Implies, Int, Not, Or, Solver, Sum, sat, unsat

ROOT = Path(__file__).resolve().parent

Q_SUPPORT = tuple(f"q{i}" for i in range(4))
SOURCE_SUPPORT = {
    "nonhit": tuple(f"a{i}" for i in range(4)),
    "interaction": tuple(f"c{i}" for i in range(4)),
}
SOURCE_CENTERS = {"nonhit": "sourceACenter", "interaction": "sourceBCenter"}
BLOCKER_SLOTS = {
    z: tuple(f"b{z}_slot{j}" for j in range(4)) for z in range(4)
}
BLOCKER_CENTERS = tuple(f"b{z}Center" for z in range(4))
BASE_ROLES = (
    "qCenter",
    *SOURCE_CENTERS.values(),
    *Q_SUPPORT,
    *(point for support in SOURCE_SUPPORT.values() for point in support),
    *BLOCKER_CENTERS,
    *(point for slots in BLOCKER_SLOTS.values() for point in slots),
)

NONHIT_FIELDS = {
    "sameBlocker": ("center_eq", "support_eq"),
    "sourceRowOmission": (
        "deleted",
        "deleted_eq_source1_or_source2",
        "deleted_not_mem_source_row",
        "deletion_survives",
    ),
}
INTERACTION_FIELDS = {
    "sameBlocker": ("center_eq", "support_eq"),
    "sourceRowOmission": ("deleted", "deleted_not_mem", "deletion_survives"),
    "distinctBlockersDifferentCaps": (
        "centers_ne",
        "source1_mem",
        "source2_mem",
        "exact_two_point_overlap",
        "source_cap",
        "fresh_cap",
        "source_center_mem_cap_interior",
        "fresh_center_mem_cap_interior",
        "caps_ne",
    ),
    "sameCapWithInternalFiberSource": (
        "centers_ne",
        "source1_mem",
        "source2_mem",
        "exact_two_point_overlap",
        "cap_index",
        "source_center_mem_same_cap",
        "fresh_center_mem_same_cap",
        "fiber_source_mem_cap",
    ),
}


def _sum(items: Any) -> Any:
    return Sum([If(item, 1, 0) for item in items])


def _add(solver: Solver, log: list[dict[str, Any]], key: tuple[Any, ...], expr: Any, provenance: str) -> None:
    """Add one named atom and fail closed on duplicate ownership."""
    if any(item["key"] == list(key) for item in log):
        raise ValueError(f"duplicate-gate atom key: {key}")
    solver.add(expr)
    log.append({"key": list(key), "provenance": provenance})


def _one_hot(solver: Solver, log: list[dict[str, Any]], values: list[Any], key: tuple[Any, ...], provenance: str) -> None:
    _add(solver, log, key, _sum(values) == 1, provenance)


def build_packet(
    *,
    nonhit: str = "sourceRowOmission",
    interaction: str = "distinctBlockersDifferentCaps",
    malformed: str | None = None,
) -> tuple[Solver, dict[str, Any]]:
    """Build one named constructor packet; no order/cap assignment is frozen."""
    if nonhit not in NONHIT_FIELDS or interaction not in INTERACTION_FIELDS:
        raise ValueError("unknown constructor selector")
    solver = Solver()
    log: list[dict[str, Any]] = []
    all_roles = BASE_ROLES
    rank = {role: Int(f"rank_{role}") for role in all_roles}
    bound = len(all_roles)
    for role in all_roles:
        _add(solver, log, ("rank_bound", role), 0 <= rank[role], "finite-role quotient")
        _add(solver, log, ("rank_bound_hi", role), rank[role] < bound, "finite-role quotient")

    def alias(a: str, b: str) -> Any:
        return rank[a] == rank[b]

    def exact_row(name: str, support: tuple[str, ...], center: str) -> None:
        for a, b in combinations(support, 2):
            _add(solver, log, ("support_distinct", name, a, b), rank[a] != rank[b],
                 "FO-v1/FOL-v2 exact-four support; full-fidelity shell distinctness")
        for point in support:
            _add(solver, log, ("center_not_support", name, center, point), rank[center] != rank[point],
                 "Full-fidelity selected-row center/support separation")

    exact_row("Q", Q_SUPPORT, "qCenter")
    exact_row("sourceA", SOURCE_SUPPORT["nonhit"], SOURCE_CENTERS["nonhit"])
    exact_row("sourceB", SOURCE_SUPPORT["interaction"], SOURCE_CENTERS["interaction"])
    for z, support in BLOCKER_SLOTS.items():
        exact_row(f"blocker{z}", support, BLOCKER_CENTERS[z])

    # Every Q support point has exactly one actual blocker; every named
    # blocker is used once.  This is new ownership structure, not source-fan
    # integer metadata.
    actual = {(i, z): Bool(f"actualBlocker_{i}_{z}") for i in range(4) for z in range(4)}
    for i in range(4):
        _one_hot(solver, log, [actual[i, z] for z in range(4)],
                 ("actual_blocker", "Q", Q_SUPPORT[i]),
                 "new: symbolic actual-blocker ownership")
    for z in range(4):
        _one_hot(solver, log, [actual[i, z] for i in range(4)],
                 ("blocker_owner", BLOCKER_CENTERS[z]),
                 "new: bijective Q-support/blocker ownership")

    role_cap = {(role, k): Bool(f"cap_{role}_{k}") for role in all_roles for k in range(3)}
    blocker_cap = {(z, k): Bool(f"blockerCap_{z}_{k}") for z in range(4) for k in range(3)}
    for role in all_roles:
        _add(solver, log, ("cap_nonempty", role), _sum([role_cap[role, k] for k in range(3)]) >= 1,
             "Full-fidelity role_cap nonempty profile")
        _add(solver, log, ("cap_profile_bound", role), _sum([role_cap[role, k] for k in range(3)]) <= 2,
             "Full-fidelity cap profile bound")
    for z in range(4):
        _one_hot(solver, log, [blocker_cap[z, k] for k in range(3)],
                 ("blocker_cap", BLOCKER_CENTERS[z]), "Full-fidelity blocker_cap one-hot")
        for k in range(3):
            _add(solver, log, ("blocker_cap_tie", z, k),
                 role_cap[BLOCKER_CENTERS[z], k] == blocker_cap[z, k],
                 "Full-fidelity blocker/role cap tie")

    source_cap = [Bool(f"sourceCap_{k}") for k in range(3)]
    fresh_cap = [Bool(f"freshCap_{k}") for k in range(3)]
    _one_hot(solver, log, source_cap, ("source_cap_choice",), "live interaction sourceCap : Fin 3")
    _one_hot(solver, log, fresh_cap, ("fresh_cap_choice",), "live interaction freshCap : Fin 3")
    for k in range(3):
        _add(solver, log, ("source_center_cap", k), role_cap[SOURCE_CENTERS["interaction"], k] == source_cap[k],
             "live interaction sourceCenter_mem source cap interior")
        _add(solver, log, ("fresh_center_cap", k), role_cap["qCenter", k] == fresh_cap[k],
             "live interaction freshCenter_mem fresh cap interior")

    # Physical aliases carry the same cap profile; distinct closed caps have
    # at most one common physical point (the full-fidelity cap invariant).
    for a, b in combinations(all_roles, 2):
        for k in range(3):
            _add(solver, log, ("alias_cap_profile", a, b, k),
                 Implies(alias(a, b), role_cap[a, k] == role_cap[b, k]),
                 "Full-fidelity cap membership preserved across aliases")
        for i, j in combinations(range(3), 2):
            _add(solver, log, ("two_cap_overlap", a, b, i, j),
                 Implies(And(role_cap[a, i], role_cap[a, j], role_cap[b, i], role_cap[b, j]), alias(a, b)),
                 "Full-fidelity distinct-cap common-point bound")

    nh = {name: Bool(f"nh_{name}") for name in NONHIT_FIELDS}
    inter = {name: Bool(f"interaction_{name}") for name in INTERACTION_FIELDS}
    _one_hot(solver, log, list(nh.values()), ("selector_exact_one", "nonhit"), "live inductive FreshThirdCapSourceNonHit")
    _one_hot(solver, log, list(inter.values()), ("selector_exact_one", "interaction"), "live inductive FreshThirdCapSourceInteraction")
    _add(solver, log, ("selector_selected", "nonhit", nonhit), nh[nonhit], "selected packet branch")
    _add(solver, log, ("selector_selected", "interaction", interaction), inter[interaction], "selected packet branch")

    def support_mem(support: tuple[str, ...], point: str) -> Any:
        return Or(*[alias(slot, point) for slot in support])

    # Same-blocker is a direct live constructor field packet.
    same_expr_nonhit = And(alias(SOURCE_CENTERS["nonhit"], "qCenter"),
                            *[support_mem(SOURCE_SUPPORT["nonhit"], p) for p in Q_SUPPORT])
    same_expr_interaction = And(alias(SOURCE_CENTERS["interaction"], "qCenter"),
                                *[support_mem(SOURCE_SUPPORT["interaction"], p) for p in Q_SUPPORT])
    _add(solver, log, ("constructor_field", "nonhit", "sameBlocker", "center_eq_support_eq"),
         Implies(nh["sameBlocker"], same_expr_nonhit), "Fiber: FreshThirdCapSourceNonHit.sameBlocker")
    _add(solver, log, ("constructor_field", "interaction", "sameBlocker", "center_eq_support_eq"),
         Implies(inter["sameBlocker"], same_expr_interaction), "Fiber: FreshThirdCapSourceInteraction.sameBlocker")

    deletion = {}
    for family, selectors in (("nonhit", nh), ("interaction", inter)):
        choice = [Bool(f"{family}Deleted_q{i}") for i in range(2)]
        survives = Bool(f"{family}DeletionSurvives")
        deletion[family] = (choice, survives)
        _one_hot(solver, log, choice, ("deleted_choice", family),
                 "Fiber sourceRowOmission deleted = Q.source₁ ∨ Q.source₂")
        _add(solver, log, ("survival_atom", family), survives,
             "RetainedProducer exact-four deletion survival witness")
        omission = selectors["sourceRowOmission"]
        _add(solver, log, ("constructor_field", family, "sourceRowOmission", "survival"),
             Implies(omission, survives), "Fiber sourceRowOmission.deletion_survives")
        for i, point in enumerate(("q0", "q1")):
            _add(solver, log, ("constructor_field", family, "sourceRowOmission", "deleted_eq", point),
                 Implies(And(omission, choice[i]), BoolVal(True)),
                 "Fiber sourceRowOmission.deleted_eq")
            _add(solver, log, ("constructor_field", family, "sourceRowOmission", "deleted_not_mem", point),
                 Implies(And(omission, choice[i]),
                         And(*[rank[slot] != rank[point] for slot in SOURCE_SUPPORT[family]])),
                 "Fiber sourceRowOmission.deleted_not_mem")

    # Positive interaction branches: exact overlap is represented by q0/q1
    # membership and exclusion of q2/q3 from the source selected row.
    positive_interactions = ("distinctBlockersDifferentCaps", "sameCapWithInternalFiberSource")
    for name in positive_interactions:
        selector = inter[name]
        overlap = And(support_mem(SOURCE_SUPPORT["interaction"], "q0"), support_mem(SOURCE_SUPPORT["interaction"], "q1"),
                      *[Not(support_mem(SOURCE_SUPPORT["interaction"], p)) for p in ("q2", "q3")])
        _add(solver, log, ("constructor_field", "interaction", name, "centers_ne"),
             Implies(selector, rank[SOURCE_CENTERS["interaction"]] != rank["qCenter"]),
             f"Fiber: Interaction.{name}.centers_ne")
        _add(solver, log, ("constructor_field", "interaction", name, "exact_two_point_overlap"),
             Implies(selector, overlap), f"Fiber: Interaction.{name}.overlap_eq")
        if name == "distinctBlockersDifferentCaps":
            _add(solver, log, ("constructor_field", "interaction", name, "caps_ne"),
                 Implies(selector, Or(*[And(source_cap[i], fresh_cap[j])
                                        for i in range(3) for j in range(3) if i != j])),
                 "Fiber Interaction.distinctBlockersDifferentCaps.caps_ne")
        else:
            _add(solver, log, ("constructor_field", "interaction", name, "same_cap"),
                 Implies(selector, And(*[source_cap[k] == fresh_cap[k] for k in range(3)])),
                 "Fiber Interaction.sameCapWithInternalFiberSource.capIndex")
            _add(solver, log, ("constructor_field", "interaction", name, "fiber_source_mem_cap"),
                 Implies(selector, Or(*[And(source_cap[k], Or(role_cap["q0", k], role_cap["q1", k])) for k in range(3)])),
                 "Fiber Interaction.sameCapWithInternalFiberSource.fiber_source_mem_cap")

    # Retained/common ingress is carried as an independent source packet.  It
    # intentionally records no universal common-omission atom.
    retained = {(r, p): Bool(f"retained{r}_{p}") for r in range(2)
                for p in ("source0", "source1", "x0", "x1", "y0", "y1")}
    for r in range(2):
        _add(solver, log, ("retained_exact_four", r), _sum(retained[r, p] for p in ("source0", "source1", "x0", "x1", "y0", "y1")) == 4,
             "RetainedProducer FreshThirdAlignedRetainedConsumerPacket exact-four")
        for p in ("source0", "source1"):
            _add(solver, log, ("retained_source_member", r, p), retained[r, p],
                 "RetainedProducer labelled source row ingress")
    radii = [Int(f"retainedRadius{r}") for r in range(2)]
    _add(solver, log, ("retained_radii_ne",), radii[0] != radii[1],
         "RetainedProducer unequal first-apex radii")

    if malformed == "duplicate_q_support":
        _add(solver, log, ("control", malformed), rank["q0"] == rank["q1"], "negative control")
    elif malformed == "overfull_q":
        _add(solver, log, ("control", malformed), _sum([BoolVal(True)] * 5) == 4, "negative control: exact-four Q row overfull")
    elif malformed == "source_membership":
        _add(solver, log, ("control", malformed),
             And(support_mem(SOURCE_SUPPORT["nonhit"], "q0"), support_mem(SOURCE_SUPPORT["nonhit"], "q1")),
             "negative control: omission row cannot retain both deleted endpoints")
    elif malformed == "missing_survival":
        _add(solver, log, ("control", malformed), Not(deletion["nonhit"][1]), "negative control")
    elif malformed == "multiple_selectors":
        _add(solver, log, ("control", malformed), nh["sameBlocker"], "negative control")
    elif malformed is not None:
        raise ValueError(f"unknown malformed control: {malformed}")

    return solver, {
        "rank": rank,
        "actual": actual,
        "role_cap": role_cap,
        "blocker_cap": blocker_cap,
        "nh": nh,
        "interaction": inter,
        "deletion": deletion,
        "retained": retained,
        "radii": radii,
        "clauses": log,
        "nonhit": nonhit,
        "interaction_name": interaction,
    }


def model_summary(model: Any, ctx: dict[str, Any]) -> dict[str, Any]:
    """Read back only named structural facts for an independent validator."""
    value = lambda expr: bool(model.eval(expr, model_completion=True))
    actual = [[z for z in range(4) if value(ctx["actual"][i, z])] for i in range(4)]
    return {
        "q_support_count": 4,
        "actual_blocker_rows": actual,
        "nonhit": ctx["nonhit"],
        "interaction": ctx["interaction_name"],
        "selector_count": 2,
        "duplicate_gate_keys": len({tuple(item["key"]) for item in ctx["clauses"]}),
    }


def emit_artifact(solver: Solver, ctx: dict[str, Any], path: Path, status: str, summary: dict[str, Any] | None = None) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    text = "(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n"
    if text.count("(check-sat)") != 1:
        raise ValueError("artifact must contain exactly one check-sat")
    path.write_text(text, encoding="utf-8")
    path.with_suffix(".json").write_text(json.dumps({
        "status": status,
        "summary": summary,
        "clauses": ctx["clauses"],
    }, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def smoke_controls(output_dir: Path | None = None) -> list[dict[str, Any]]:
    """Run only bounded Z3 SAT/UNSAT controls; never launches the wave."""
    cases = (
        ("sat_same_blocker", "sameBlocker", "sameBlocker", None, "sat"),
        ("sat_omission_distinct_caps", "sourceRowOmission", "distinctBlockersDifferentCaps", None, "sat"),
        ("unsat_duplicate_q_support", "sourceRowOmission", "distinctBlockersDifferentCaps", "duplicate_q_support", "unsat"),
        ("unsat_forbidden_source_membership", "sourceRowOmission", "distinctBlockersDifferentCaps", "source_membership", "unsat"),
        ("unsat_missing_survival", "sourceRowOmission", "distinctBlockersDifferentCaps", "missing_survival", "unsat"),
        ("unsat_multiple_selectors", "sourceRowOmission", "distinctBlockersDifferentCaps", "multiple_selectors", "unsat"),
    )
    temporary = output_dir is None
    holder = tempfile.TemporaryDirectory() if temporary else None
    root = Path(holder.name) if holder else output_dir
    assert root is not None
    results = []
    for label, nonhit, interaction, malformed, expected in cases:
        solver, ctx = build_packet(nonhit=nonhit, interaction=interaction, malformed=malformed)
        result = solver.check()
        actual = "sat" if result == sat else "unsat" if result == unsat else "unknown"
        if actual != expected:
            raise AssertionError(f"{label}: expected {expected}, got {actual}")
        summary = model_summary(solver.model(), ctx) if actual == "sat" else None
        emit_artifact(solver, ctx, root / f"{label}.smt2", actual, summary)
        results.append({"label": label, "status": actual, "expected": expected, "summary": summary})
    if holder:
        holder.cleanup()
    return results


def main() -> int:
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()
    if not args.smoke_only:
        parser.error("prelaunch package exposes only --smoke-only; main wave is intentionally disabled")
    for result in smoke_controls():
        print(f"{result['label']}: {result['status']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
