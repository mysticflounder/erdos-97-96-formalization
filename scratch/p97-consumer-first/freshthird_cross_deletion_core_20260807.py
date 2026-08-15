#!/usr/bin/env python3
"""Tracked exact replay of the first FreshThird cross-deletion survivor.

This freezes the first structural branch recorded by
``freshthird_cross_deletion_cegar_20260807`` and tracks every QF_LRA premise.
The result is a fixed-structure diagnostic core, not Lean closure.
"""

from __future__ import annotations

import shutil
import subprocess
import sys
from itertools import combinations
from pathlib import Path

from z3 import Bool, Real, SolverFor, is_true, sat, unsat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
import freshthird_cross_deletion_cegar_20260807 as Campaign  # noqa: E402
import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_rank_kalmanson_probe import ORDER_ARMS, DROW, ROW  # noqa: E402
from freshthird_two_level_cegar import _bool_value, _occupied_representatives  # noqa: E402


OUT = HERE / "freshthird_cross_deletion_core_20260807.results.md"
SMT2 = HERE / "freshthird_cross_deletion_core_20260807.smt2"
TIMEOUT_MS = 120_000
SHRINK_TIMEOUT_MS = 5_000


def freeze_first_survivor():
    order_name = "outside_fresh_between_source_canonical"
    structural, _, context = F.build_pure_arm(ORDER_ARMS[order_name], 4_000)
    F.add_full_fidelity_constraints(
        structural, context, fresh_cap=1, row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    RowCuts.add_all_named_row_shared_pair_cuts(structural, context)
    PairCuts.add_all_named_row_pair_cuts(structural, context)
    Campaign.add_cross_survivor_layer(structural, context)
    pair = (0, 1)
    # Keep the incremental branch shape used by the campaign: adding the
    # active-pair literals under a push avoids a timeout in the non-incremental
    # recheck while producing the identical first model.
    structural.push()
    for other in Campaign.PAIR_LIST:
        structural.add(context["cross_active"][other] == (other == pair))
        structural.add(context["mutual_active"][other] == (other == pair))
    if structural.check() != sat:
        raise RuntimeError("first structural survivor is not SAT")
    return structural.model(), context


def tracked_packet(model, context):
    representatives, rank_of = _occupied_representatives(model, context)
    occupied = sorted(set(rank_of.values()))
    pos = {rank: i for i, rank in enumerate(occupied)}
    role_index = {role: pos[rank] for role, rank in rank_of.items()}
    distances = {
        (i, j): Real(f"core22_d_{i}_{j}")
        for i, j in combinations(range(len(representatives)), 2)
    }

    def d(a, b):
        ia, ib = role_index[a], role_index[b]
        if ia == ib:
            return 0
        return distances[(ia, ib) if ia < ib else (ib, ia)]

    records = []

    def add(family, detail, expr, provenance):
        label = f"p{len(records):05d}_{family}"
        records.append((label, family, detail, provenance, expr))

    for pair, variable in distances.items():
        add("distance_positive", f"occupied_pair={pair}", variable > 0,
            "positive distance between distinct occupied carrier ranks")

    known_rows = (
        ("sourceCenter", F.SOURCE_SHELL),
        ("freshCenter", F.FRESH_SHELL),
        ("pinnedCenter", ROW),
        ("drowCenter", DROW),
    )
    for center, support in known_rows:
        radius = d(center, support[0])
        add("known_row_radius_positive", f"center={center}", radius > 0,
            "SelectedFourClass/CriticalFourShell.radius_pos")
        for point in support[1:]:
            add("known_row_equal_radius", f"center={center},point={point}",
                d(center, point) == radius,
                "SelectedFourClass.support_eq_radius or CriticalFourShell.support_eq_radius")
        support_ranks = {rank_of[point] for point in support}
        for representative in representatives:
            if rank_of[representative] not in support_ranks:
                add("known_row_exclusion", f"center={center},point={representative}",
                    d(center, representative) != radius,
                    "exact selected/full radius class (support_eq) exclusion")

    radii = [Real(f"core22_blocker_radius_{z}") for z in range(4)]
    for z, radius in enumerate(radii):
        add("blocker_radius_positive", f"blocker=b{z}", radius > 0,
            "CriticalFourShell.radius_pos")
        for j, point in enumerate(ROW):
            member = _bool_value(model, f"shell_{z}_contains_w{j}")
            relation = d(f"b{z}", point) == radius if member else d(f"b{z}", point) != radius
            add("blocker_row_membership",
                f"blocker=b{z},point={point},member={member}", relation,
                "selectedAt(...).toCriticalFourShell.support_eq_radius")
        for t in range(3):
            add("blocker_slot_shell", f"blocker=b{z},slot=a{z}_{t}",
                d(f"b{z}", f"a{z}_{t}") == radius,
                "CriticalFourShell.support_eq_radius on exact four-shell slot")
        shell_ranks = {rank_of[f"w{z}"], *[rank_of[f"a{z}_{t}"] for t in range(3)]}
        assert len(shell_ranks) == 4
        for representative in representatives:
            if rank_of[representative] not in shell_ranks:
                add("blocker_shell_exclusion", f"blocker=b{z},point={representative}",
                    d(f"b{z}", representative) != radius,
                    "CriticalFourShell.support_eq plus support_card=4")
        if rank_of["pinnedCenter"] == rank_of[f"b{z}"]:
            for point in ROW:
                add("pinned_blocker_full_row_shell", f"blocker=b{z},point={point}",
                    d(f"b{z}", point) == radius,
                    "selected-row equality at common pinned/blocker center")

    for z, w in combinations(range(4), 2):
        if rank_of[f"b{z}"] == rank_of[f"b{w}"]:
            add("equal_blocker_radius", f"blockers=b{z},b{w}", radii[z] == radii[w],
                "same selectedAt center gives same critical radius")

    for a, b, c in combinations(representatives, 3):
        dab, dac, dbc = d(a, b), d(a, c), d(b, c)
        add("triangle", f"triple={a},{b},{c};side=bc+ab>ac", dab + dbc > dac,
            "strict triangle inequality in Euclidean metric")
        add("triangle", f"triple={a},{b},{c};side=ac+ab>bc", dab + dac > dbc,
            "strict triangle inequality in Euclidean metric")
        add("triangle", f"triple={a},{b},{c};side=ac+bc>ab", dac + dbc > dab,
            "strict triangle inequality in Euclidean metric")

    for a, b, c, e in combinations(representatives, 4):
        rhs = d(a, c) + d(b, e)
        add("kalmanson", f"quad={a},{b},{c},{e};first",
            d(b, c) + d(a, e) < rhs,
            "strict Kalmanson inequality for occupied cyclic order")
        add("kalmanson", f"quad={a},{b},{c},{e};second",
            d(a, b) + d(c, e) < rhs,
            "strict Kalmanson inequality for occupied cyclic order")

    # Exact selected survivor rows from the frozen structural model.  The
    # slots are rank-backed aliases, so these are the same four-point supports
    # used by cross_metric_check, not existential fresh witnesses.
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
                slot_roles = [rank_role[model.eval(slots[a, b, t]).as_long()] for t in range(4)]
                radius = Real(f"core22_{family}_radius_{a}_{b}")
                add(f"{family}_survivor_radius_positive", f"{a}->{b}", radius > 0,
                    "crossDeletion_survives iff omitted from selectedAt row; survivor radius_pos")
                for i, point in enumerate(slot_roles):
                    add(f"{family}_survivor_equal_radius", f"{a}->{b},slot={i},point={point}",
                        d(f"b{a}", point) == radius,
                        "survivor selectedAt(...).toCriticalFourShell.support_eq_radius")
                    add(f"{family}_survivor_point_positive", f"{a}->{b},slot={i},point={point}",
                        d(f"b{a}", point) > 0,
                        "positive radius survivor point in CriticalFourShell")
    return records, representatives, rank_of, active_dirs


def solve_tracked(records, timeout_ms=TIMEOUT_MS):
    solver = SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms)
    literals = {}
    for label, _family, _detail, _prov, expr in records:
        literal = Bool("track_" + label)
        literals[label] = literal
        solver.assert_and_track(expr, literal)
    result = solver.check()
    raw = [str(lit).removeprefix("track_") for lit in solver.unsat_core()] if result == unsat else []
    return result, raw, solver


def shrink(records, raw):
    by_label = {row[0]: row for row in records}
    current = list(raw)
    statuses = []
    for label in list(raw):
        candidate = [x for x in current if x != label]
        probe = SolverFor("QF_LRA")
        probe.set(timeout=SHRINK_TIMEOUT_MS)
        probe.add(*[by_label[x][4] for x in candidate])
        result = probe.check()
        statuses.append((label, str(result)))
        if result == unsat:
            current = candidate
    return current, statuses


def cvc5_check(records, labels):
    by_label = {row[0]: row for row in records}
    solver = SolverFor("QF_LRA")
    solver.add(*[by_label[x][4] for x in labels])
    text = solver.to_smt2()
    SMT2.write_text(text, encoding="utf-8")
    binary = shutil.which("cvc5")
    if not binary:
        return "unavailable"
    try:
        proc = subprocess.run([binary, "--lang=smt2"], input=text, text=True,
                              capture_output=True, timeout=30, check=False)
        return (proc.stdout.strip() or proc.stderr.strip() or "empty")
    except subprocess.TimeoutExpired:
        return "timeout"


def render(records, reps, rank_of, active_dirs, result, raw, shrunk, statuses, cvc5):
    by_label = {row[0]: row for row in records}
    rank_lines = []
    for rank in sorted(set(rank_of.values())):
        roles = [r for r, value in rank_of.items() if value == rank]
        rank_lines.append(f"{rank}:" + "/".join(roles))
    lines = [
        "# FreshThird cross-deletion tracked core (2026-08-07)",
        "",
        "`trust`: fixed-structure exact-rational QF_LRA diagnostic; no Lean closure.",
        "`configuration`: order `qOutside < freshCenter < qBetween < sourceCenter < canonicalSource`; fresh_cap=1, row_cap=1; cap pair 0-1; independent mutual pair 0-1.",
        f"`metric_result`: {result}; occupied={len(reps)}; assertions={len(records)}; active={','.join(active_dirs)}.",
        f"`raw_core_size`: {len(raw)}; `shrunk_core_size`: {len(shrunk)}; `cvc5_shrunk_result`: {cvc5}.",
        "",
        "## Frozen carrier/rank map",
        "",
        "Roles are listed by structural rank (aliases are slash-separated); this is the cyclic order used by every Kalmanson premise:",
        "`" + ", ".join(rank_lines) + "`",
        "",
        "The survivor supports are rank-backed: `cross 1→0` and `mutual 0→1`, `mutual 1→0`; each has four distinct slots and omits the opposite deleted source and blocker center.",
        "",
        "## Shrunken tracked core",
        "",
    ]
    for label in shrunk:
        _, family, detail, provenance, _ = by_label[label]
        rank_note = ""
        if family == "blocker_slot_shell":
            blocker, slot = detail.split(",")
            b = blocker.split("=")[1]
            s = slot.split("=")[1]
            rank_note = f" ranks: {b}={rank_of[b]}, {s}={rank_of[s]}"
        elif family == "kalmanson":
            quad = detail.split("quad=", 1)[1].split(";", 1)[0].split(",")
            rank_note = " ranks: " + ", ".join(f"{r}={rank_of[r]}" for r in quad)
        lines.append(f"- `{label}` `{family}` — {detail}.{rank_note} Source/provenance: {provenance}.")
    lines += [
        "",
        "No `known_row_equal_radius` assertion survives shrinking: the replay includes sourceCenter `(qOutside,qBetween,canonicalSource,c2)`, freshCenter `(qOutside,qBetween,f1,f2)`, pinnedCenter `ROW`, and drowCenter `DROW`, but the five-premise core only needs the two exact blocker-shell slot equalities at ranks `(17,6,8)` and `(0,8,6)` plus the strict Kalmanson quadrilateral at ranks `0<6<8<17`.",
        "",
        "## Consumer/producers boundary",
        "",
        "The core is not an existing Lean consumer: it combines fixed rank aliases, all named-row equalities/exclusions, three exact survivor rows, and strict Kalmanson/triangle constraints in one finite replay. Existing consumers (`false_of_freshThird_four_order_arms` and the generic `CapCrossingKalmanson` schemas) need a universal CCW boundary-index adapter and source-produced equal-radius equations; they do not consume this independent-pair packet.",
        "",
        "First missing source-level producer premise: a universal lift from the cross-deletion disjunction plus an independent mutual-cross pair to the *same* injective CCW carrier, assigning every survivor slot to a named physical point and exporting the two Kalmanson-ready equal-radius equations. The current Lean fields (`directed_crossDeletion_survival`, `mutual_cross_membership`) are residual/same-pair statements and do not provide that independent-pair lift.",
        "",
        f"Shrink probe statuses (label:result): {statuses}",
    ]
    return "\n".join(lines) + "\n"


if __name__ == "__main__":
    model, context = freeze_first_survivor()
    records, reps, rank_of, active = tracked_packet(model, context)
    result, raw, _ = solve_tracked(records)
    if result != unsat:
        raise SystemExit(f"tracked replay result={result}, expected unsat")
    shrunk, statuses = shrink(records, raw)
    cvc5 = cvc5_check(records, shrunk)
    OUT.write_text(render(records, reps, rank_of, active, result, raw, shrunk, statuses, cvc5), encoding="utf-8")
    print(f"wrote={OUT} metric={result} assertions={len(records)} raw={len(raw)} shrunk={len(shrunk)} cvc5={cvc5}")
