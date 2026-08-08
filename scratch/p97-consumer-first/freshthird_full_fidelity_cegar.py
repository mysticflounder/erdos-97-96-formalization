#!/usr/bin/env python3
"""Source-strengthened two-level CEGAR for the FreshThird off-endpoint arm.

This round repairs concrete omissions in ``freshthird_two_level_cegar``.  It
adds the exact four-row geometry for every named row, closes those rows against
all represented carrier roles, preserves cap membership across physical
aliases, and applies the proved cap-local row bounds.  It also identifies
canonical rows at coincident blocker centres, gives each critical shell three
anonymous carrier slots (the source point is the fourth), bounds every blocker
shell by exactly four carriers, and enforces uniqueness of the common point of
two distinct indexed closed caps.

The model remains a theorem-discovery abstraction: SAT and UNSAT results do
not close a universal Lean obligation without a source-level finite-to-concrete
lift.
"""

from __future__ import annotations

from itertools import combinations, product
from pathlib import Path
from time import monotonic

from z3 import And, Bool, If, Int, Not, Or, Real, SolverFor, Sum, is_true, sat, unknown

from freshthird_rank_kalmanson_probe import DROW, ORDER_ARMS, ROLES, ROW, SEED
from freshthird_two_level_cegar import (
    MAX_STRUCTURES,
    METRIC_TIMEOUT_MS,
    STRUCTURAL_TIMEOUT_MS,
    _bool_value,
    _occupied_representatives,
    _signature_block,
    structural_signature,
)

# The pure LIA phase is deliberately given a short per-check budget: one
# cyclic arm can otherwise make Z3 spend many minutes in a single blocked
# alias search.  Unknown/timeout remains explicit in each report row.
STRUCTURAL_TIMEOUT_MS = 1000


SOURCE_SHELL = ("qOutside", "qBetween", "canonicalSource", "c2")
FRESH_SHELL = ("qOutside", "qBetween", "f1", "f2")
FIRST_CAP = 0
# A deleted source already occupies one point of its canonical four-shell.
# Three further slots per blocker are therefore sufficient; slots may alias
# named carrier roles or slots from another blocker shell.
ANON_ROLES = tuple(f"a{z}_{t}" for z in range(4) for t in range(3))
# The anchor proves every named role below lies in A (including shell centres
# and blockers via their centre_mem hypotheses), so all 22 are carriers.
CARRIER_BASE = ROLES


def _alias(context, a: str, b: str):
    return context["ranks"][a] == context["ranks"][b]


def build_pure_arm(order: tuple[str, ...], timeout_ms: int):
    """Build only alias/incidence/cap/order constraints (no metric terms)."""
    solver = SolverFor("QF_LIA")
    solver.set(timeout=timeout_ms)
    base_roles = tuple(ROLES)
    all_roles = (*base_roles, *ANON_ROLES)
    ranks = {role: Int(f"pure_rank_{role}") for role in all_roles}
    rank_bound = len(all_roles)
    for rank in ranks.values():
        solver.add(0 <= rank, rank < rank_bound)

    # Source-faithful exact-four shell labels are pairwise distinct.  The two
    # shells share only their prescribed endpoint pair; all other labels are
    # disjoint (the live overlap_eq hypothesis).  Without these finite alias
    # clauses a model can collapse canonicalSource=f1, which is not a valid
    # exact-four source/fresh configuration.
    for shell in (SOURCE_SHELL, FRESH_SHELL):
        for a, b in combinations(shell, 2):
            solver.add(ranks[a] != ranks[b])
    for a in SOURCE_SHELL[2:]:
        for b in FRESH_SHELL[2:]:
            solver.add(ranks[a] != ranks[b])
    # The selected canonical and D-row classes are exact four-supports as
    # well; their named support labels cannot alias one another.
    for support in (ROW, DROW):
        for a, b in combinations(support, 2):
            solver.add(ranks[a] != ranks[b])

    # Pinned centre and boundary centre incidence, plus row alias budget.
    solver.add(Sum([If(_alias({"ranks": ranks}, "pinnedCenter", seed), 1, 0)
                    for seed in SEED]) == 1)
    for point in ROW:
        solver.add(ranks["pinnedCenter"] != ranks[point])
    solver.add(ranks["pinnedCenter"] != ranks["sourceCenter"])
    solver.add(ranks["pinnedCenter"] != ranks["freshCenter"])
    solver.add(Sum([If(ranks["drowCenter"] == ranks[seed], 1, 0)
                    for seed in ("qOutside", "qBetween")]) == 1)
    # The source packet records the endpoint id in each cyclic-order arm:
    # arms 1/3 select qBetween, while arms 2/4 select qOutside.  Enforce that
    # equality here instead of allowing the finite encoder to silently choose
    # the other endpoint (the prior first-arm representative had the wrong
    # drowCenter=qOutside assignment).
    drow_endpoint = (
        "qBetween"
        if order in (
            ORDER_ARMS["outside_fresh_between_source_canonical"],
            ORDER_ARMS["canonical_source_between_fresh_outside"],
        )
        else "qOutside"
    )
    solver.add(ranks["drowCenter"] == ranks[drow_endpoint])
    for seed in SEED:
        if seed not in ("qOutside", "qBetween"):
            solver.add(ranks["drowCenter"] != ranks[seed])
    for point in DROW:
        solver.add(ranks["drowCenter"] != ranks[point])

    # The normalized terminal supplies one point of each selected row outside
    # the six-point seed.  Preserve that source fact in the pure rank model;
    # the older eager metric encoder enforced it only indirectly through
    # positive distances, so the structural abstraction could admit aliases
    # such as w0 = a seed point.
    for outside in ("w0", "e0"):
        for seed in SEED:
            solver.add(ranks[outside] != ranks[seed])

    for prefix in ("w", "e"):
        aliases = {(i, seed): ranks[f"{prefix}{i}"] == ranks[seed]
                   for i in range(1, 4) for seed in SEED}
        for i in range(1, 4):
            solver.add(Sum([If(aliases[i, seed], 1, 0) for seed in SEED]) <= 1)
        solver.add(Sum([If(aliases[i, seed], 1, 0)
                        for i in range(1, 4) for seed in SEED]) <= 3)
        for seed in SEED:
            solver.add(Sum([If(aliases[i, seed], 1, 0) for i in range(1, 4)]) <= 1)

    for a, b in zip(order, order[1:]):
        solver.add(ranks[a] < ranks[b])

    # Every blocker has its deleted source plus three distinct shell slots.
    contains = {(z, j): Bool(f"shell_{z}_contains_w{j}")
                for z in range(4) for j in range(4)}
    for z in range(4):
        solver.add(contains[z, z])
        for t in range(3):
            slot = f"a{z}_{t}"
            solver.add(ranks[slot] != ranks[f"w{z}"])
            # A positive-radius critical shell never contains its own centre
            # (`CriticalFourShell.center_not_mem_support`).
            solver.add(ranks[slot] != ranks[f"b{z}"])
            for u in range(t):
                solver.add(ranks[slot] != ranks[f"a{z}_{u}"])
        solver.add(ranks[f"b{z}"] != ranks[f"w{z}"])
        for j, point in enumerate(ROW):
            shell_alias = Or(ranks[point] == ranks[f"w{z}"],
                             *[ranks[point] == ranks[f"a{z}_{t}"] for t in range(3)])
            solver.add(contains[z, j] == shell_alias)
        collision = ranks[f"b{z}"] == ranks["pinnedCenter"]
        solver.add(Or(Not(collision), And(*[contains[z, j] for j in range(4)])))
        solver.add(Or(collision, Sum([If(contains[z, j], 1, 0) for j in range(4)]) <= 2))
        solver.add(Or(ranks[f"b{z}"] != ranks["pinnedCenter"], contains[z, z]))
        solver.add(Or(ranks[f"b{z}"] != ranks["drowCenter"], contains[z, z]))
    for z, w in combinations(range(4), 2):
        equal_nonpinned = And(ranks[f"b{z}"] == ranks[f"b{w}"],
                              ranks[f"b{z}"] != ranks["pinnedCenter"])
        solver.add(Or(Not(equal_nonpinned), And(contains[z, w], contains[w, z])))

    blocker_cap = {(z, k): Bool(f"blocker{z}_interior_cap{k}")
                   for z in range(4) for k in range(3)}
    source_cap = {(z, k): Bool(f"w{z}_in_closed_cap{k}")
                  for z in range(4) for k in range(3)}
    for z in range(4):
        solver.add(Sum([If(blocker_cap[z, k], 1, 0) for k in range(3)]) == 1)
        count = Sum([If(source_cap[z, k], 1, 0) for k in range(3)])
        solver.add(1 <= count, count <= 2)
    for z, w in combinations(range(4), 2):
        for k in range(3):
            # `hfan` chooses a strict-cap witness independently for each
            # source.  Do not identify those witnesses merely because the
            # blockers are distinct (the previous implication had exactly
            # that backwards polarity).  Equal physical blockers may have a
            # unique cap witness, but that uniqueness is not part of the
            # current finite ingress contract, so omitting the implication is
            # the source-faithful weakening.
            solver.add(Or(ranks[f"b{z}"] == ranks[f"b{w}"],
                          Not(blocker_cap[z, k]), Not(blocker_cap[w, k]),
                          source_cap[z, k], source_cap[w, k],
                          Not(contains[z, w]), Not(contains[w, z])))

    context = {
        "ranks": ranks, "contains": contains, "blocker_cap": blocker_cap,
        "source_cap": source_cap, "all_roles": all_roles,
        "carrier_roles": all_roles, "rank_bound": rank_bound,
    }
    return solver, {
        "roles": len(all_roles), "rank_vars": len(ranks),
        "distance_cells": 0, "metric_assertions": 0,
        "assertions": len(solver.assertions()),
    }, context


def add_full_fidelity_constraints(
    solver, context, fresh_cap: int, row_cap: int, *,
    enforce_equal_shell_slots_in_row: bool = False,
):
    ranks = context["ranks"]
    all_roles = context["all_roles"]
    carrier_roles = context["carrier_roles"]
    contains = context["contains"]
    blocker_cap = context["blocker_cap"]
    source_cap = context["source_cap"]

    known_rows = (
        ("sourceCenter", SOURCE_SHELL),
        ("freshCenter", FRESH_SHELL),
        ("pinnedCenter", ROW),
        ("drowCenter", DROW),
    )
    # Equal canonical blocker centres select the same unique four-class.
    for z, w in combinations(range(4), 2):
        equal_center = _alias(context, f"b{z}", f"b{w}")
        for j in range(4):
            solver.add(Or(Not(equal_center), contains[z, j] == contains[w, j]))

    # If a blocker is one of the four named row centres, its canonical support
    # is exactly that named SelectedFourClass.
    for z in range(4):
        for center, support in known_rows:
            same_center = _alias(context, f"b{z}", center)
            for j, point in enumerate(ROW):
                in_named_support = Or(*[_alias(context, point, q) for q in support])
                solver.add(Or(Not(same_center), contains[z, j] == in_named_support))

    # A canonical critical shell has exactly four physical representatives:
    # the source w_z plus three pairwise-distinct anonymous slots.
    represented = []
    for index, role in enumerate(carrier_roles):
        is_representative = And(*[ranks[role] != ranks[earlier] for earlier in carrier_roles[:index]])
        represented.append((role, is_representative))
    # SourceFaithfulSelectedFourDeletionFan for the pinned FreshThird row:
    # equal centre means the whole selected Row is the blocker shell; distinct
    # centre means at most two Row points survive in that shell.  The own-slot
    # clauses above are the finite witness for the deleted source w_z.
    for z in range(4):
        same_center = _alias(context, "pinnedCenter", f"b{z}")
        solver.add(Or(Not(same_center), And(*[contains[z, j] for j in range(4)])))
        solver.add(Or(same_center, Sum([If(contains[z, j], 1, 0) for j in range(4)]) <= 2))
        if enforce_equal_shell_slots_in_row:
            # In the source equal-centre branch, the fan packet proves exact
            # support equality `Row.support = blockerShell.support`.  Since
            # `w_z` is already a row point and the three slots are pairwise
            # distinct from it and each other, every anonymous shell slot must
            # alias one of the four named row points.  Without this lift the
            # finite encoder can place an extra slot outside the row (the
            # spurious three-assertion metric core audited separately).
            for t in range(3):
                slot = f"a{z}_{t}"
                solver.add(Or(
                    Not(same_center),
                    Or(*[ranks[slot] == ranks[point] for point in ROW]),
                ))

    # Closed-cap membership for every represented carrier role.  Existing W
    # booleans are reused so the cross-deletion clauses see the same facts.
    role_cap = {}
    for role in all_roles:
        for k in range(3):
            role_cap[role, k] = (
                source_cap[int(role[1:]), k]
                if role.startswith("w") and role[1:].isdigit()
                else Bool(f"{role}_in_closed_cap{k}")
            )
        count = Sum([If(role_cap[role, k], 1, 0) for k in range(3)])
        solver.add(1 <= count, count <= 2)

    for a, b in combinations(all_roles, 2):
        same_point = _alias(context, a, b)
        for k in range(3):
            solver.add(Or(Not(same_point), role_cap[a, k] == role_cap[b, k]))
        # `SurplusCapPacket.eq_of_mem_capByIndex_of_mem_capByIndex_of_ne`:
        # two distinct closed caps have at most one common physical point.
        for i, j in combinations(range(3), 2):
            solver.add(Or(
                Not(And(
                    role_cap[a, i], role_cap[a, j],
                    role_cap[b, i], role_cap[b, j],
                )),
                same_point,
            ))

    def force_strict_cap(role: str, cap: int):
        for k in range(3):
            solver.add(role_cap[role, k] == (k == cap))

    force_strict_cap("sourceCenter", FIRST_CAP)
    force_strict_cap("freshCenter", fresh_cap)
    for z in range(4):
        for k in range(3):
            solver.add(role_cap[f"b{z}", k] == blocker_cap[z, k])
    solver.add(Not(role_cap["qOutside", FIRST_CAP]))
    solver.add(Not(role_cap["qBetween", FIRST_CAP]))
    solver.add(role_cap["drowCenter", row_cap])

    # Preserve the exact deletion-avoidance disjunction carried by
    # EndpointDeletionPairCapSplitSurvivingRow.  The selected endpoint row is
    # centred at qBetween or qOutside and avoids either canonicalSource or the
    # other endpoint.  The current Lean extraction drops this witness.
    def avoids(point: str):
        return Not(Or(*[_alias(context, point, support_point) for support_point in DROW]))

    solver.add(Or(
        And(
            _alias(context, "drowCenter", "qBetween"),
            Or(avoids("canonicalSource"), avoids("qOutside")),
        ),
        And(
            _alias(context, "drowCenter", "qOutside"),
            Or(avoids("canonicalSource"), avoids("qBetween")),
        ),
    ))

    # Proved generic cap-local bound: a four-row has at most two points in
    # every indexed cap containing its centre.
    def row_cap_bound(center: str, support: tuple[str, ...], k: int):
        inside = Sum([If(role_cap[point, k], 1, 0) for point in support])
        solver.add(Or(Not(role_cap[center, k]), inside <= 2))

    for center, support in known_rows:
        for k in range(3):
            row_cap_bound(center, support, k)
    solver.add(Sum([If(role_cap[point, row_cap], 1, 0) for point in DROW]) <= 2)
    solver.add(Sum([If(Not(role_cap[point, row_cap]), 1, 0) for point in DROW]) >= 2)
    def shell_member(z: int, role: str):
        return Or(ranks[role] == ranks[f"w{z}"],
                  *[ranks[role] == ranks[f"a{z}_{t}"] for t in range(3)])

    for z in range(4):
        for k in range(3):
            represented_inside = Sum([
                If(And(is_rep, shell_member(z, role), role_cap[role, k]), 1, 0)
                for role, is_rep in represented
            ])
            solver.add(Or(Not(blocker_cap[z, k]), represented_inside <= 2))

    # Distinct selected rows centred in one ordered cap share at most one
    # support point outside it.  Apply it to all four named rows and to the
    # represented part of each canonical blocker row.
    def named_outside_overlap(
        center_a: str, support_a: tuple[str, ...],
        center_b: str, support_b: tuple[str, ...], k: int,
    ):
        shared_outside = Sum([
            If(
                And(
                    Not(role_cap[a, k]),
                    Or(*[_alias(context, a, b) for b in support_b]),
                ),
                1,
                0,
            )
            for a in support_a
        ])
        premise = And(
            role_cap[center_a, k], role_cap[center_b, k],
            Not(_alias(context, center_a, center_b)),
        )
        solver.add(Or(Not(premise), shared_outside <= 1))

    for (center_a, support_a), (center_b, support_b) in combinations(known_rows, 2):
        for k in range(3):
            named_outside_overlap(center_a, support_a, center_b, support_b, k)

    for z in range(4):
        for center, support in known_rows:
            for k in range(3):
                shared_outside = Sum([
                    If(
                        And(
                            is_rep,
                            shell_member(z, role),
                            Not(role_cap[role, k]),
                            Or(*[_alias(context, role, q) for q in support]),
                        ),
                        1,
                        0,
                    )
                    for role, is_rep in represented
                ])
                premise = And(
                    blocker_cap[z, k], role_cap[center, k],
                    Not(_alias(context, f"b{z}", center)),
                )
                solver.add(Or(Not(premise), shared_outside <= 1))

    context["role_cap"] = role_cap
    # Expose the exact selected-row membership atoms to successor rounds.
    # These are the source `selectedAt` shell supports, not fresh anonymous
    # survivor witnesses, and let mutual cross-deletion producers retain both
    # actual-row omissions.
    context["contains"] = contains
    return {
        "fresh_cap": fresh_cap,
        "row_cap": row_cap,
        "full_fidelity_assertions": len(solver.assertions()),
    }


def add_chained_three_bisector_cut(solver, context):
    """Add the one source-faithful seven-point chained-bisector cut.

    The selected representative is
    ``c2 < w_i < qOutside < freshCenter < b_i < qBetween < sourceCenter``
    with ``drowCenter = qOutside``, both ``w_i`` and ``qBetween`` represented
    in the D-row, and ``qOutside`` in blocker ``b_i``'s exact shell.  The shell
    already contains its deleted source ``w_i`` by construction; only the
    second membership is existentially witnessed through the three anonymous
    shell slots.  No reflected/rotated order is added here.
    """
    ranks = context["ranks"]
    contains = context["contains"]

    def shell_member(z: int, role: str):
        return Or(
            ranks[role] == ranks[f"w{z}"],
            *[ranks[role] == ranks[f"a{z}_{t}"] for t in range(3)],
        )

    witnesses = []
    for i in range(4):
        wi = ranks[f"w{i}"]
        in_drow = Or(*[wi == ranks[e] for e in DROW])
        between_in_drow = Or(*[ranks["qBetween"] == ranks[e] for e in DROW])
        # contains[i,i] is the source-guaranteed self membership; qOutside
        # membership is the only additional exact-shell witness required.
        witness = And(
            ranks["c2"] < wi,
            wi < ranks["qOutside"],
            ranks["qOutside"] < ranks["freshCenter"],
            ranks["freshCenter"] < ranks[f"b{i}"],
            ranks[f"b{i}"] < ranks["qBetween"],
            ranks["qBetween"] < ranks["sourceCenter"],
            ranks["drowCenter"] == ranks["qOutside"],
            in_drow,
            between_in_drow,
            shell_member(i, "qOutside"),
            contains[i, i],
        )
        witnesses.append(witness)
    cut = Not(Or(*witnesses))
    solver.add(cut)
    return witnesses


def exact_metric_check(model, context, timeout_ms: int):
    representatives, rank_of = _occupied_representatives(model, context)
    occupied_ranks = sorted({rank_of[role] for role in rank_of})
    rank_position = {rank: i for i, rank in enumerate(occupied_ranks)}
    role_index = {role: rank_position[rank] for role, rank in rank_of.items()}
    solver = SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms)
    distances = {
        (i, j): Real(f"full_fixed_d_{i}_{j}")
        for i, j in combinations(range(len(representatives)), 2)
    }

    def d(a: str, b: str):
        ia, ib = role_index[a], role_index[b]
        if ia == ib:
            return 0
        return distances[(ia, ib) if ia < ib else (ib, ia)]

    for variable in distances.values():
        solver.add(variable > 0)

    known_rows = (
        ("sourceCenter", SOURCE_SHELL),
        ("freshCenter", FRESH_SHELL),
        ("pinnedCenter", ROW),
        ("drowCenter", DROW),
    )
    for center, support in known_rows:
        radius = d(center, support[0])
        solver.add(radius > 0)
        for point in support[1:]:
            solver.add(d(center, point) == radius)
        support_ranks = {rank_of[point] for point in support}
        for representative in representatives:
            if rank_of[representative] not in support_ranks:
                solver.add(d(center, representative) != radius)

    radii = [Real(f"full_fixed_blocker_radius_{z}") for z in range(4)]
    for z, radius in enumerate(radii):
        solver.add(radius > 0)
        for j, point in enumerate(ROW):
            member = _bool_value(model, f"shell_{z}_contains_w{j}")
            solver.add(d(f"b{z}", point) == radius if member else d(f"b{z}", point) != radius)
        for t in range(3):
            solver.add(d(f"b{z}", f"a{z}_{t}") == radius)
        # The structural model fixes this exact shell to the four distinct
        # ranks w_z,a_z_0,a_z_1,a_z_2.  Direct complementary exclusions are
        # equivalent to the cardinality ITE and avoid a large Boolean search
        # inside the exact-rational metric phase.
        shell_ranks = {
            rank_of[f"w{z}"],
            *[rank_of[f"a{z}_{t}"] for t in range(3)],
        }
        assert len(shell_ranks) == 4
        for representative in representatives:
            if rank_of[representative] not in shell_ranks:
                solver.add(d(f"b{z}", representative) != radius)
        same_center = rank_of["pinnedCenter"] == rank_of[f"b{z}"]
        if same_center:
            for point in ROW:
                solver.add(d(f"b{z}", point) == radius)
    for z, w in combinations(range(4), 2):
        if rank_of[f"b{z}"] == rank_of[f"b{w}"]:
            solver.add(radii[z] == radii[w])

    triangle_count = 0
    for a, b, c in combinations(representatives, 3):
        dab, dac, dbc = d(a, b), d(a, c), d(b, c)
        solver.add(dab + dbc > dac, dab + dac > dbc, dac + dbc > dab)
        triangle_count += 3

    kalmanson_count = 0
    for a, b, c, e in combinations(representatives, 4):
        rhs = d(a, c) + d(b, e)
        solver.add(d(b, c) + d(a, e) < rhs)
        solver.add(d(a, b) + d(c, e) < rhs)
        kalmanson_count += 2

    result = solver.check()
    return result, {
        "occupied": len(representatives),
        "triangle_inequalities": triangle_count,
        "kalmanson_inequalities": kalmanson_count,
        "metric_assertions": len(solver.assertions()),
    }


def model_summary(model, context):
    ranks = context["ranks"]
    classes = {}
    for role in ROLES:
        classes.setdefault(model.eval(ranks[role]).as_long(), []).append(role)
    alias_classes = ["/".join(roles) for _, roles in sorted(classes.items()) if len(roles) > 1]
    blocker_caps = [
        next(k for k in range(3)
             if is_true(model.eval(context["blocker_cap"][z, k], model_completion=True)))
        for z in range(4)
    ]
    blocker_rows = [
        "".join("1" if _bool_value(model, f"shell_{z}_contains_w{j}") else "0" for j in range(4))
        for z in range(4)
    ]
    role_cap = context["role_cap"]
    cap_profiles = {
        role: "".join(
            "1" if is_true(model.eval(role_cap[role, k], model_completion=True)) else "0"
            for k in range(3)
        )
        for role in ("pinnedCenter", "drowCenter", *ROW, *DROW)
    }
    return {
        "alias_classes": ",".join(alias_classes),
        "blocker_caps": "".join(str(k) for k in blocker_caps),
        "blocker_rows": ",".join(blocker_rows),
        "cap_profiles": ",".join(f"{role}:{profile}" for role, profile in cap_profiles.items()),
    }


def run_configuration(order_name: str, fresh_cap: int, row_cap: int, deadline_seconds: float = 55.0):
    started = monotonic()
    structural, base_stats, context = build_pure_arm(
        ORDER_ARMS[order_name], timeout_ms=STRUCTURAL_TIMEOUT_MS
    )
    added_stats = add_full_fidelity_constraints(structural, context, fresh_cap, row_cap)
    structures = 0
    blocked = 0
    trace = []
    status = "timeout"
    metric_stats = {}
    survivor = {}
    while structures < MAX_STRUCTURES and monotonic() - started < deadline_seconds:
        structural_result = structural.check()
        if structural_result == unknown:
            status = "structural_unknown"
            trace.append(f"s{structures + 1}:structural-unknown")
            break
        if structural_result != sat:
            status = "structural-unsat"
            break
        structures += 1
        model = structural.model()
        metric_result, metric_stats = exact_metric_check(model, context, METRIC_TIMEOUT_MS)
        if metric_result == sat:
            status = "sat_valid_survivor"
            survivor = model_summary(model, context)
            trace.append(f"s{structures}:metric-sat/occupied={metric_stats['occupied']}")
            break
        if metric_result == unknown:
            status = "metric_unknown"
            trace.append(f"s{structures}:metric-unknown")
            break
        blocked += 1
        structural.add(_signature_block(structural_signature(model, context), context))
        trace.append(f"s{structures}:fixed-structure-unsat/blocked={blocked}")
    else:
        status = "bounded_exhaustion" if structures == MAX_STRUCTURES else "timeout"
    return {
        "order_arm": order_name,
        "fresh_cap": fresh_cap,
        "row_cap": row_cap,
        "status": status,
        "structures_checked": structures,
        "structures_blocked": blocked,
        "elapsed_seconds": round(monotonic() - started, 3),
        "structural_timeout_ms": STRUCTURAL_TIMEOUT_MS,
        "metric_timeout_ms": METRIC_TIMEOUT_MS,
        "named_roles": len(ROLES),
        "anonymous_roles": len(ANON_ROLES),
        "rank_vars": len(context["ranks"]),
        "base_assertions": base_stats["assertions"],
        **added_stats,
        "last_metric": metric_stats,
        "survivor": survivor,
        "trace": ";".join(trace),
    }


def main():
    lines = [
        "campaign=freshthird_full_fidelity_cegar_v3",
        "scope=offEndpoint; all four cyclic-order arms; all four nonfirst fresh/row cap-label pairs",
        "trust=diagnostic exact-rational SMT only; no Lean closure or universal lift",
        "encoding=22 named carriers plus 12 anonymous carrier slots; exact four-point blocker shells; pinned-row source-faithful fan",
        "remaining_omissions=universal finite-to-concrete lift; full cyclic-cap realization; bounded CEGAR is not closure",
    ]
    results_path = Path(__file__).with_suffix(".results.txt")
    results_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    for order_name in ORDER_ARMS:
        for fresh_cap, row_cap in product((1, 2), repeat=2):
            report = run_configuration(order_name, fresh_cap, row_cap)
            line = " ".join(f"{key}={value}" for key, value in report.items())
            lines.append(line)
            with results_path.open("a", encoding="utf-8") as handle:
                handle.write(line + "\n")
            print(line, flush=True)


if __name__ == "__main__":
    main()
