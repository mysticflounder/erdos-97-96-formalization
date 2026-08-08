#!/usr/bin/env python3
"""Two-level structural/metric CEGAR for the FreshThird cross round.

Unlike the preceding diagnostic, this never treats one model per S4 orbit as
representative.  Each branch is constrained to be motif-free, every returned
structural model is replayed in exact QF_LRA, and a cvc5 replay is required
before an exact metric-UNSAT model is blocked.  A branch is closed only when
the structural solver becomes UNSAT after those exact blocking clauses; a
metric-SAT (or inconclusive) model is retained as an explicit survivor.

This remains a theorem-discovery artifact: no result is a Lean closure without
the source-level producer and universal lift.
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
from collections import Counter
from itertools import combinations
from pathlib import Path
from time import monotonic

from z3 import And, Bool, Implies, Not, Or, Real, SolverFor, is_expr, is_true, sat, unknown, unsat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402
import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
from freshthird_cross_deletion_cegar_20260807 import (  # noqa: E402
    NONFIRST_CAPS,
    PAIR_LIST,
    add_cross_survivor_layer,
)
from freshthird_rank_kalmanson_probe import DROW, ROW  # noqa: E402
from freshthird_cross_deletion_motif_scan_20260808 import (  # noqa: E402
    motif_formulas,
    pair_relation,
    scan_model,
)
from freshthird_rank_kalmanson_probe import ORDER_ARMS  # noqa: E402


OUT = HERE / "freshthird_cross_deletion_metric_cegar_20260808.results.md"
MAX_MODELS_PER_BRANCH = int(os.environ.get("FRESHTHIRD_MAX_MODELS", "8"))
STRUCTURAL_TIMEOUT_MS = int(os.environ.get("FRESHTHIRD_STRUCTURAL_TIMEOUT_MS", "2000"))
METRIC_TIMEOUT_MS = int(os.environ.get("FRESHTHIRD_METRIC_TIMEOUT_MS", "2000"))
BRANCH_LIMIT = int(os.environ.get("FRESHTHIRD_BRANCH_LIMIT", "576"))
CORE_CACHE: dict[tuple[tuple[str, object], ...], dict] = {}


def _context_terms(obj, out: dict[str, object]) -> None:
    """Collect every zero-arity Bool/Int symbol exposed by the context."""

    if isinstance(obj, dict):
        for value in obj.values():
            _context_terms(value, out)
    elif isinstance(obj, (tuple, list, set)):
        for value in obj:
            _context_terms(value, out)
    elif is_expr(obj) and obj.num_args() == 0:
        # All structural context atoms are Bool or bounded Int ranks/slots.
        if obj.sort().is_bool() or obj.sort().is_int():
            out.setdefault(obj.decl().name(), obj)


def exact_structural_block(model, context):
    """Block the complete finite structural assignment used by metric replay."""

    terms: dict[str, object] = {}
    _context_terms(context, terms)
    disequalities = []
    for term in terms.values():
        value = model.eval(term, model_completion=True)
        disequalities.append(term != value)
    return Or(*disequalities), len(disequalities)


def _metric_core_check(model, context, timeout_ms: int) -> tuple[object, dict, list]:
    """Replay QF_LRA with assertion assumptions and source-mapped deps.

    Each metric assertion is guarded by an assumption label.  A minimized
    z3 UNSAT core is mapped back to only the context literals used by those
    assertions.  The caller may therefore block a small conjunction of
    structural literals rather than the complete model assignment.
    """

    representatives, rank_of = F._occupied_representatives(model, context)
    occupied = sorted(set(rank_of.values()))
    pos = {rank: i for i, rank in enumerate(occupied)}
    role_index = {role: pos[rank] for role, rank in rank_of.items()}
    solver = SolverFor("QF_LRA")
    # Assumption-labelled checks expose an UNSAT core without enabling the
    # heavier global unsat-core option on every metric assertion.
    solver.set(timeout=timeout_ms)
    atoms: dict[str, object] = {}
    _context_terms(context, atoms)
    labels = []
    formulas = {}
    deps_by_label: dict[str, tuple[str, ...]] = {}
    base_forms = []
    base_deps = tuple(representatives)

    def dep_names(roles=(), extras=()):
        names = []
        for role in roles:
            if role in context.get("ranks", {}):
                names.append(context["ranks"][role].decl().name())
        for term in extras:
            if is_expr(term) and term.num_args() == 0:
                names.append(term.decl().name())
        return tuple(dict.fromkeys(names))

    counter = 0

    def add_metric(formula, roles=(), extras=()):
        nonlocal counter
        label = Bool(f"metric_assumption_{counter}")
        counter += 1
        solver.assert_and_track(formula, label)
        labels.append(label)
        formulas[label.decl().name()] = formula
        deps_by_label[label.decl().name()] = dep_names(roles, extras)

    def add_untracked(formula):
        # Large triangle/Kalmanson families stay plain to preserve the fast
        # QF_LRA propagation of the prior replay; the family-wide dependency
        # set is included when projecting any tracked core.
        solver.add(formula)
        base_forms.append(formula)

    distances = {
        (i, j): Real(f"metric_fixed_d_{i}_{j}")
        for i, j in combinations(range(len(representatives)), 2)
    }

    def d(a, b):
        ia, ib = role_index[a], role_index[b]
        if ia == ib:
            return 0
        return distances[(ia, ib) if ia < ib else (ib, ia)]

    def d_roles(a, b):
        return (a, b)

    distance_forms = []
    for (i, j), variable in distances.items():
        distance_forms.append(variable > 0)
    add_metric(And(*distance_forms), representatives)

    known_rows = (
        ("sourceCenter", F.SOURCE_SHELL),
        ("freshCenter", F.FRESH_SHELL),
        ("pinnedCenter", ROW),
        ("drowCenter", DROW),
    )
    for center, support in known_rows:
        radius = d(center, support[0])
        add_metric(radius > 0, d_roles(center, support[0]))
        for point in support[1:]:
            add_metric(d(center, point) == radius, d_roles(center, point,))
        support_ranks = {rank_of[p] for p in support}
        for representative in representatives:
            if rank_of[representative] not in support_ranks:
                add_metric(
                    d(center, representative) != radius,
                    d_roles(center, representative),
                )

    radii = [Real(f"metric_blocker_radius_{z}") for z in range(4)]
    for z, radius in enumerate(radii):
        add_metric(radius > 0, (f"b{z}",))
        for j, point in enumerate(ROW):
            member = F._bool_value(model, f"shell_{z}_contains_w{j}")
            contains_atom = context["contains"][z, j]
            add_metric(
                d(f"b{z}", point) == radius if member else d(f"b{z}", point) != radius,
                d_roles(f"b{z}", point),
                (contains_atom,),
            )
        for t in range(3):
            add_metric(d(f"b{z}", f"a{z}_{t}") == radius,
                       d_roles(f"b{z}", f"a{z}_{t}"))
        shell_roles = [f"w{z}", *(f"a{z}_{t}" for t in range(3))]
        shell_ranks = {rank_of[role] for role in shell_roles}
        for representative in representatives:
            if rank_of[representative] not in shell_ranks:
                add_metric(
                    d(f"b{z}", representative) != radius,
                    (f"b{z}", representative, *shell_roles),
                )
        if rank_of["pinnedCenter"] == rank_of[f"b{z}"]:
            for point in ROW:
                add_metric(d(f"b{z}", point) == radius,
                           d_roles(f"b{z}", point),
                           tuple(context["contains"][z, j] for j in range(4)))
    for z, w in combinations(range(4), 2):
        if rank_of[f"b{z}"] == rank_of[f"b{w}"]:
            add_metric(radii[z] == radii[w], (f"b{z}", f"b{w}"))

    triangle_forms = []
    for a, b, c in combinations(representatives, 3):
        triangle_forms.extend((
            d(a, b) + d(b, c) > d(a, c),
            d(a, b) + d(a, c) > d(b, c),
            d(a, c) + d(b, c) > d(a, b),
        ))
    add_untracked(And(*triangle_forms))
    kalmanson_forms = []
    for a, b, c, e in combinations(representatives, 4):
        kalmanson_forms.extend((
            d(b, c) + d(a, e) < d(a, c) + d(b, e),
            d(a, b) + d(c, e) < d(a, c) + d(b, e),
        ))
    add_untracked(And(*kalmanson_forms))

    rank_role = {}
    for role, rank in rank_of.items():
        rank_role.setdefault(rank, role)
    active_dirs = []
    for family in ("cross", "mutual"):
        survives = context[f"{family}_survive"]
        slots = context[f"{family}_slots"]
        for (a, b), survived in survives.items():
            if is_true(model.eval(survived, model_completion=True)):
                active_dirs.append(f"{family}:{a}->{b}")
                extra = [survived]
                support = []
                for t in range(4):
                    slot = slots[a, b, t]
                    extra.append(slot)
                    support.append(rank_role[model.eval(slot).as_long()])
                radius = Real(f"metric_{family}_survivor_radius_{a}_{b}")
                add_metric(radius > 0, (f"b{a}",), extra)
                for point in support:
                    add_metric(d(f"b{a}", point) == radius,
                               (f"b{a}", point), extra)
                    add_metric(d(f"b{a}", point) > 0,
                               (f"b{a}", point), extra)

    result = solver.check()
    stats = {
        "occupied": len(representatives),
        "metric_assertions": len(labels),
        "active_directions": ",".join(active_dirs),
        "core_initial": 0,
        "core_minimized": 0,
        "cut_width": 0,
        "cut_terms": [],
        "cvc5_result": None,
        "cvc5_smt2": None,
        "core_reused": False,
    }
    if result != unsat:
        return result, stats, []

    core = list(solver.unsat_core())
    stats["core_initial"] = len(core)
    # Deletion-minimize the assumption core under a fresh implication solver.
    # `assert_and_track` assertions remain active even when their labels are
    # omitted from `check`; using the original solver here would therefore
    # report a spurious one-label core.  Rebuild the bounded trial solver so
    # that only the selected labels are enabled on top of the untracked base.
    for label in list(core):
        trial = [candidate for candidate in core if candidate is not label]
        if not trial:
            continue
        trial_solver = SolverFor("QF_LRA")
        trial_solver.set(timeout=min(timeout_ms, 5000))
        trial_solver.add(*base_forms)
        trial_solver.add(*[
            Implies(candidate, formulas[candidate.decl().name()])
            for candidate in trial
        ])
        if trial_solver.check(*trial) == unsat:
            core = trial
    stats["core_minimized"] = len(core)
    dep_names_union = set()
    for label in core:
        dep_names_union.update(deps_by_label[label.decl().name()])
    dep_names_union.update(dep_names(base_deps))
    def model_atom_value(name):
        value = model.eval(atoms[name], model_completion=True)
        # Context atoms are a mix of integer ranks and Boolean selectors.  A
        # few selector declarations have integer-looking names, so inspect
        # the evaluated value rather than the declaration sort.
        try:
            return value.as_long()
        except AttributeError:
            return is_true(value)

    cut_key = tuple(sorted(
        (name, model_atom_value(name))
        for name in dep_names_union
        if name in atoms
    ))
    stats["cut_width"] = len(cut_key)
    stats["cut_terms"] = [name for name, _value in cut_key]

    if cut_key in CORE_CACHE:
        cached = CORE_CACHE[cut_key]
        stats.update(cached)
        stats["core_reused"] = True
    else:
        # cvc5 independently replays this minimized metric core once per
        # normalized source cut, not once per repeated full structural model.
        core_solver = SolverFor("QF_LRA")
        core_solver.add(*base_forms)
        core_solver.add(*[Implies(label, formulas[label.decl().name()]) for label in core])
        core_solver.add(*core)
        smt2_path = HERE / "freshthird_cross_deletion_metric_cegar_20260808.core.smt2"
        smt2_path.write_text(core_solver.to_smt2(), encoding="utf-8")
        cvc5_result = "unavailable"
        cvc5_bin = shutil.which("cvc5")
        if cvc5_bin:
            try:
                proc = subprocess.run(
                    [cvc5_bin, "--lang=smt2"],
                    input=smt2_path.read_text(encoding="utf-8"),
                    text=True, capture_output=True,
                    timeout=timeout_ms / 1000,
                    check=False,
                )
                cvc5_result = proc.stdout.strip() or proc.stderr.strip()
            except subprocess.TimeoutExpired:
                cvc5_result = "timeout"
        cached = {"cvc5_result": cvc5_result, "cvc5_smt2": str(smt2_path)}
        CORE_CACHE[cut_key] = cached
        stats.update(cached)
    cut_terms = [atoms[name] for name, _value in cut_key if name in atoms]
    return result, stats, cut_terms


def _compact_survivor(model, context, mutual_pair):
    summary = F.model_summary(model, context)
    scan = scan_model(model, context, mutual_pair)
    return {
        "summary": summary,
        "missing": scan["missing"],
        "distinct_center_pairs": scan["distinct_center_pairs"],
        "shared_pairs": scan["shared_pairs"],
    }


def run() -> None:
    started = monotonic()
    branch_rows = []
    status_counts = Counter()
    metric_counts = Counter()
    branch_total = structural_iterations = 0
    branch_limit_hit = False
    cut_widths = []
    cut_cache_hits = 0
    cut_cache_total = 0
    bank_schema_counts = Counter()

    for order_name, order in ORDER_ARMS.items():
        for fresh_cap in NONFIRST_CAPS:
            for row_cap in NONFIRST_CAPS:
                structural, _base_stats, context = F.build_pure_arm(
                    order, STRUCTURAL_TIMEOUT_MS
                )
                F.add_full_fidelity_constraints(
                    structural, context, fresh_cap=fresh_cap, row_cap=row_cap,
                    enforce_equal_shell_slots_in_row=True,
                )
                RowCuts.add_all_named_row_shared_pair_cuts(structural, context)
                PairCuts.add_all_named_row_pair_cuts(structural, context)
                add_cross_survivor_layer(structural, context)
                motif_expr = Or(*motif_formulas(context))
                for cap_pair in PAIR_LIST:
                    for mutual_pair in PAIR_LIST:
                        if branch_total >= BRANCH_LIMIT:
                            branch_limit_hit = True
                            break
                        branch_total += 1
                        structural.push()
                        for other in PAIR_LIST:
                            structural.add(
                                context["cross_active"][other] == (other == cap_pair)
                            )
                            structural.add(
                                context["mutual_active"][other] == (other == mutual_pair)
                            )
                        # Universal motif coverage is tested separately in the
                        # preceding scan; this CEGAR loop explores its exact
                        # motif-free structural complement.
                        structural.add(Not(motif_expr))
                        row = {
                            "branch": branch_total,
                            "order": order_name,
                            "fresh_cap": fresh_cap,
                            "row_cap": row_cap,
                            "cap_pair": f"{cap_pair[0]}-{cap_pair[1]}",
                            "mutual_pair": f"{mutual_pair[0]}-{mutual_pair[1]}",
                            "models_checked": 0,
                            "metric_unsat_blocks": 0,
                            "block_widths": [],
                        }
                        while True:
                            structural.set(timeout=STRUCTURAL_TIMEOUT_MS)
                            structural_result = structural.check()
                            if structural_result == unknown:
                                row["status"] = "structural_unknown"
                                status_counts[row["status"]] += 1
                                break
                            if structural_result == unsat:
                                row["status"] = (
                                    "structural_unsat_after_exact_metric_blocks"
                                )
                                status_counts[row["status"]] += 1
                                break

                            structural_iterations += 1
                            row["models_checked"] += 1
                            model = structural.model()
                            metric_result, metric_stats, cut_terms = _metric_core_check(
                                model, context, METRIC_TIMEOUT_MS
                            )
                            metric_counts[str(metric_result)] += 1
                            row["last_metric"] = {
                                "result": str(metric_result),
                                **metric_stats,
                            }
                            if metric_result == sat:
                                row["status"] = "metric_sat_survivor"
                                row["survivor"] = _compact_survivor(
                                    model, context, mutual_pair
                                )
                                status_counts[row["status"]] += 1
                                break
                            if metric_result == unknown:
                                row["status"] = "metric_unknown_survivor"
                                row["survivor"] = _compact_survivor(
                                    model, context, mutual_pair
                                )
                                status_counts[row["status"]] += 1
                                break

                            # The old helper runs an independent cvc5 replay for
                            # z3-UNSAT.  Do not block unless both agree.
                            if metric_stats.get("cvc5_result") != "unsat":
                                row["status"] = "metric_unsat_unverified_survivor"
                                row["survivor"] = _compact_survivor(
                                    model, context, mutual_pair
                                )
                                status_counts[row["status"]] += 1
                                break
                            # Project the minimized metric core back to only
                            # the structural literals used by those assertions.
                            # Repeated normalized cuts are cached and replayed
                            # by cvc5 only once across branches.
                            cut_values = [
                                term != model.eval(term, model_completion=True)
                                for term in cut_terms
                            ]
                            block = Or(*cut_values)
                            width = len(cut_terms)
                            structural.add(block)
                            cut_cache_total += 1
                            cut_widths.append(width)
                            if metric_stats.get("core_reused"):
                                cut_cache_hits += 1
                            # Bridge/late-pair overlap is not encoded in this
                            # metric packet, so do not claim the banked
                            # CapCrossingKalmanson terminal schema.
                            bank_schema_counts["unclassified_cross_kalmanson"] += 1
                            row["metric_unsat_blocks"] += 1
                            row["block_widths"].append(width)
                            if row["metric_unsat_blocks"] >= MAX_MODELS_PER_BRANCH:
                                row["status"] = "metric_unsat_bounded_pending"
                                row["pending_model"] = _compact_survivor(
                                    model, context, mutual_pair
                                )
                                status_counts[row["status"]] += 1
                                break
                        branch_rows.append(row)
                        structural.pop()
                    if branch_limit_hit:
                        break
                if branch_limit_hit:
                    break
            if branch_limit_hit:
                break
        if branch_limit_hit:
            break

    lines = [
        "# FreshThird cross-deletion metric CEGAR (2026-08-08)",
        "",
        "trust: source-faithful structural complement plus exact QF_LRA; cvc5 agreement required before blocking",
        "closure_rule: only structural UNSAT after exact blocks is finite abstraction coverage; metric-SAT/unknown/unverified models remain survivors",
        "quotient: none; all branches enumerated (no unproved S4 symmetry assumption)",
        f"branch_limit: {BRANCH_LIMIT}",
        f"branches_examined: {branch_total}",
        f"branch_limit_hit: {branch_limit_hit}",
        f"structural_iterations: {structural_iterations}",
        f"metric_counts: {dict(metric_counts)}",
        f"status_counts: {dict(status_counts)}",
        f"max_models_per_branch: {MAX_MODELS_PER_BRANCH}",
        f"timeouts_ms: structural={STRUCTURAL_TIMEOUT_MS}, metric={METRIC_TIMEOUT_MS}",
        f"verified_cut_count: {cut_cache_total}",
        f"verified_cut_widths: {cut_widths if cut_widths else []}",
        f"cut_cache_reuse: {cut_cache_hits}/{cut_cache_total} "
        f"({(cut_cache_hits / cut_cache_total if cut_cache_total else 0):.3f})",
        f"bank_schema_counts: {dict(bank_schema_counts)}",
        "",
        "## First branch traces",
        "",
    ]
    for row in branch_rows[:40]:
        lines.append(repr(row))
    if len(branch_rows) > 40:
        lines.append(f"... {len(branch_rows) - 40} additional branches omitted")
    lines.extend(["", f"elapsed_seconds: {monotonic() - started:.3f}", ""])
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"results_path={OUT}")
    print(f"branches={branch_total} iterations={structural_iterations}")
    print(f"status_counts={dict(status_counts)}")
    print(f"metric_counts={dict(metric_counts)}")


if __name__ == "__main__":
    run()
