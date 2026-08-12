# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact-oracle mining of the pinned Rigid221 pentagon.

Reproduces every oracle claim in
``docs/rigid221-pentagon-bisector-direction-plan-2026-08-05.md`` §8.

The pentagon is the residual configuration of the Rigid221 source-heavy
large-cap arm: five physical class points at a common distance ``rho`` from the
second apex ``A = S.oppApex2``, carrying the row-trace five-cycle

    u -> {u, xu}   xu -> {xu, deleted}   deleted -> {deleted, v}
    v -> {v, xv}   xv -> {xv, u}

with ``centerAt u = xv`` proved.  Labels used throughout::

    0 = u   1 = xu   2 = deleted   3 = v   4 = xv   5 = A

Every system is handed to
``census.endpoint_confinement.metric_realizability_probe`` -- an exact QF_NRA
(Z3) realizability oracle that asserts strict convex position in a given cyclic
order, pairwise distinctness, per-row equidistance, and per-row exactness.

Semantics, stated once.  UNSAT says the exact encoded conjunction has no model;
it excludes a Lean branch only when every asserted atom is a consequence of
that branch.  SAT supplies a model only of the exact encoded conjunction.  It
is neither a Problem 97 counterexample nor full-leaf realizability, and it does
not rule out richer arguments using omitted facts.  UNKNOWN is a solver timeout
and is decisive for nothing; the reports below count UNKNOWN separately and
never fold it into UNSAT.  Z3 verdicts are trusted computations, not
kernel-checked certificates.

Run::

    PYTHONPATH=. uv run python census/rigid221_pentagon_oracle.py
"""

from __future__ import annotations

import argparse
from concurrent.futures import ProcessPoolExecutor, as_completed
from itertools import permutations
from pathlib import Path

from census.endpoint_confinement.metric_realizability_probe import (
    MetricRow,
)

NAME = {0: "u", 1: "xu", 2: "deleted", 3: "v", 4: "xv", 5: "A", 6: "w"}

#: class trace of each row, as an edge of the five-cycle
EDGE = {"u": (0, 1), "xu": (1, 2), "deleted": (2, 3), "v": (3, 4), "xv": (4, 0)}

#: the physical class is exactly the five points, so exact=True here is proved:
#: no further carrier point sits at distance rho from the apex.
ROW_APEX = MetricRow(5, (0, 1, 2, 3, 4), True).as_dict()

#: centerAt u = xv (packet.blocker_eq_xv)
ROW_U = MetricRow(4, EDGE["u"], False).as_dict()

#: the three leaves of the live blocker-identity split
XV_CENTER = {"BlockerDeleted": 2, "BlockerV": 3}


def cyclic_orders(n: int) -> list[tuple[int, ...]]:
    """All cyclic orders of ``n`` labels, deduplicated by reflection.

    Labels 0 and 1 are gauge-fixed to (0,0) and (1,0) by the probe and the
    convexity test is a strict counter-clockwise cross product, so an order and
    its reflection are mirror images and equisatisfiable.
    """
    seen: set[tuple[int, ...]] = set()
    out: list[tuple[int, ...]] = []
    for tail in permutations(range(1, n)):
        order = (0,) + tail
        if (0,) + tuple(reversed(tail)) in seen:
            continue
        seen.add(order)
        out.append(order)
    return out


def _run(system: dict, timeout_s: float) -> dict:
    # The private local probe is retained only behind the explicit legacy CLI
    # route.  The production/default route never imports this symbol.
    from census.endpoint_confinement.metric_realizability_probe import _probe_system

    return _probe_system(system, timeout_s)


def _sys(
    system_id: str,
    n: int,
    order,
    rows,
) -> dict:
    return {
        "system_id": system_id,
        "n": n,
        "profile": [0, 0, 0],
        "order": list(order),
        "rows": rows,
    }


def _tally(results) -> dict[str, int]:
    out: dict[str, int] = {}
    for status in results:
        out[status] = out.get(status, 0) + 1
    return out


# --------------------------------------------------------------------------
# Stage 0 -- validate the encoding against the probe's known SAT/UNSAT pair.
# --------------------------------------------------------------------------


def stage_smoke(timeout_s: float = 20.0) -> bool:
    from census.endpoint_confinement.metric_realizability_probe import run_smoke

    result = run_smoke(timeout_s)
    print("stage 0: encoding smoke test")
    print(
        f"  known-SAT   -> {result['sat']['status']} "
        f"(model verified: {result['sat'].get('verification', {}).get('all_z3_assertions_true')})"
    )
    print(
        f"  known-UNSAT -> {result['unsat']['status']} "
        f"({result['unsat'].get('decisive_stage')})"
    )
    print(f"  passed: {result['passed']}")
    return bool(result["passed"])


# --------------------------------------------------------------------------
# Stage 1 -- how much convex-position freedom each leaf retains.
# --------------------------------------------------------------------------


def stage_leaf_orders(timeout_s: float = 20.0) -> dict[str, list[tuple[int, ...]]]:
    print("\nstage 1: surviving convex orders per leaf (n = 6)")
    orders = cyclic_orders(6)
    print(f"  cyclic orders swept: {len(orders)}")
    configs = {"baseline (no leaf)": [ROW_APEX, ROW_U]}
    for leaf, center in XV_CENTER.items():
        configs[leaf] = [
            ROW_APEX,
            ROW_U,
            MetricRow(center, EDGE["xv"], False).as_dict(),
        ]
    survivors: dict[str, list[tuple[int, ...]]] = {}
    for name, rows in configs.items():
        statuses, sat = [], []
        for order in orders:
            res = _run(_sys(f"{name}-{order}", 6, order, rows), timeout_s)
            statuses.append(res["status"])
            if res["status"] == "SAT":
                sat.append(order)
        survivors[name] = sat
        print(f"  {name:20s} {_tally(statuses)}")
        for order in sat:
            print("      " + " ".join(NAME[p] for p in order))
    return survivors


# --------------------------------------------------------------------------
# Stage 2 -- fan-out of the next split: which on-class values of the remaining
# row centres survive, per leaf.
# --------------------------------------------------------------------------


def _fanout_job(job):
    leaf, rowname, cand, order, timeout_s = job
    rows = [
        ROW_APEX,
        ROW_U,
        MetricRow(XV_CENTER[leaf], EDGE["xv"], False).as_dict(),
        MetricRow(cand, EDGE[rowname], False).as_dict(),
    ]
    res = _run(_sys(f"{leaf}-{rowname}-{cand}", 6, order, rows), timeout_s)
    return leaf, rowname, cand, res["status"]


def stage_fanout(survivors, timeout_s: float = 15.0, workers: int = 4) -> None:
    print("\nstage 2: next-split fan-out (n = 6, over each leaf's surviving orders)")
    rows_to_probe = ("xu", "deleted", "v")
    jobs = [
        (leaf, rowname, cand, order, timeout_s)
        for leaf in XV_CENTER
        for rowname in rows_to_probe
        for cand in range(6)
        if cand not in EDGE[rowname]
        for order in survivors[leaf]
    ]
    agg: dict[tuple[str, str, int], list[str]] = {}
    with ProcessPoolExecutor(max_workers=workers) as pool:
        for future in as_completed([pool.submit(_fanout_job, j) for j in jobs]):
            leaf, rowname, cand, status = future.result()
            agg.setdefault((leaf, rowname, cand), []).append(status)
    for leaf in XV_CENTER:
        print(f"  leaf {leaf} (centerAt xv = {NAME[XV_CENTER[leaf]]})")
        for rowname in rows_to_probe:
            cells = []
            for cand in range(6):
                if cand in EDGE[rowname]:
                    continue
                statuses = agg[(leaf, rowname, cand)]
                unknown = statuses.count("UNKNOWN")
                cell = f"{NAME[cand]}:{statuses.count('SAT')}/{len(statuses)}"
                if unknown:
                    cell += f"(?{unknown})"
                cells.append(cell)
            print(f"    centerAt {rowname:8s} -> " + "  ".join(cells))
    print("    (SAT_count/total; (?n) = n timeouts, so that cell is NOT decisive)")


# --------------------------------------------------------------------------
# Stage 3 -- the duplicate-centre kernel, leaf-independent.
# --------------------------------------------------------------------------


def _dup_job(job):
    rowname, order, timeout_s = job
    rows = [ROW_APEX, ROW_U, MetricRow(4, EDGE[rowname], False).as_dict()]
    res = _run(_sys(f"dup-{rowname}-{order}", 6, order, rows), timeout_s)
    return rowname, res["status"], res.get("decisive_stage")


def stage_duplicate_centre(timeout_s: float = 25.0, workers: int = 6) -> None:
    print("\nstage 3: can xv centre a second row?  (leaf-independent, all 60 orders)")
    # Rows v and xv contain xv in their own class trace, so xv centring them is
    # already excluded by centerAt_ne_source; only xu and deleted are live.
    candidates = [r for r in ("xu", "deleted")]
    orders = cyclic_orders(6)
    jobs = [(r, o, timeout_s) for r in candidates for o in orders]
    agg: dict[str, list[str]] = {}
    stages: dict[str, set[str]] = {}
    with ProcessPoolExecutor(max_workers=workers) as pool:
        for future in as_completed([pool.submit(_dup_job, j) for j in jobs]):
            rowname, status, stage = future.result()
            agg.setdefault(rowname, []).append(status)
            if stage:
                stages.setdefault(rowname, set()).add(stage)
    for rowname in candidates:
        statuses = agg[rowname]
        print(
            f"  centerAt {rowname:8s} = xv : UNSAT {statuses.count('UNSAT')} "
            f" SAT {statuses.count('SAT')}  UNKNOWN {statuses.count('UNKNOWN')}"
            f"   stages={sorted(stages.get(rowname, []))}"
        )
    print("    rows u and xu share the class point xu, so a common centre forces a")
    print("    single radius and an equidistant class triple; rows u and deleted have")
    print("    disjoint traces and may share a centre at two different radii.")


# --------------------------------------------------------------------------
# Stage 4 -- the off-class-blocker leaf itself, with w = centerAt xv as label 6.
# --------------------------------------------------------------------------

#: variants differ only in how much is asserted about rows u and xv
_OFFCLASS_VARIANTS = {
    "all-exact": (True, True),  # primary model diagnoses this exact subsystem
    "rows-open": (False, False),
    "u-open": (False, True),
}


def _offclass_rows(u_exact: bool, xv_exact: bool) -> list[dict]:
    return [
        # exact is NON-vacuous at n = 7: it forces w off the class circle,
        # which is exactly this leaf's off-class hypothesis.
        ROW_APEX,
        MetricRow(4, EDGE["u"], u_exact).as_dict(),
        MetricRow(6, EDGE["xv"], xv_exact).as_dict(),
    ]


def _offclass_job(job):
    vname, order, timeout_s = job
    rows = _offclass_rows(*_OFFCLASS_VARIANTS[vname])
    res = _run(_sys(f"offclass-{vname}", 7, order, rows), timeout_s)
    return (
        vname,
        res["status"],
        res.get("verification", {}).get("all_z3_assertions_true"),
    )


def stage_offclass_blocker(timeout_s: float = 15.0, workers: int = 6) -> None:
    """Does the exact encoded off-class-blocker subsystem have a model?

    SAT of the primary all-exact variant witnesses consistency only of the
    atoms actually encoded. Because that variant strengthens some encoded row
    constraints, its model also models the weaker encoded subsystem; it does
    not model omitted hypotheses of the full Lean leaf. The weaker variants
    diagnose which encoded atoms drive an UNSAT result.

    NOT encoded, and the verdict does not cover it: `w` lies in the strict
    second-cap interior, and each shell carries two further off-class support
    points. SAT here is DIAGNOSTIC-ONLY: it is neither full-leaf realizability
    nor an impossibility result for richer incidence/metric arguments.
    """
    print("\nstage 4: off-class-blocker leaf (n = 7, w = centerAt xv as label 6)")
    orders = cyclic_orders(7)
    print(f"  cyclic orders swept: {len(orders)}")
    jobs = [(v, o, timeout_s) for v in _OFFCLASS_VARIANTS for o in orders]
    agg: dict[str, list[str]] = {}
    verified: dict[str, int] = {}
    with ProcessPoolExecutor(max_workers=workers) as pool:
        for future in as_completed([pool.submit(_offclass_job, j) for j in jobs]):
            vname, status, ok = future.result()
            agg.setdefault(vname, []).append(status)
            if status == "SAT" and ok:
                verified[vname] = verified.get(vname, 0) + 1
    for vname in _OFFCLASS_VARIANTS:
        statuses = agg[vname]
        print(
            f"  {vname:11s} SAT {statuses.count('SAT'):3d} "
            f"(Z3 assertions true {verified.get(vname, 0):3d})  "
            f"UNSAT {statuses.count('UNSAT'):3d}  "
            f"UNKNOWN {statuses.count('UNKNOWN'):3d}"
        )
    print("    primary all-exact SAT count models only the encoded subsystem.")


# --------------------------------------------------------------------------
# Stage 5 -- the cap layer: a proved-consequence base plus one separating
# chord.  An UNSAT result can become closing evidence only if every asserted
# atom has source ingress and the contradiction is independently replayed;
# see `_CAP_LAYER_LEDGER`.  This external probe remains DIAGNOSTIC-ONLY.
# --------------------------------------------------------------------------

#: Labels proved to lie in ``S.capInteriorByIndex S.oppIndex2``:
#: ``u``, ``xu`` by ``packet.source_pair_interior``; ``xv`` by ``_hxvInterior``;
#: ``w = centerAt xv`` by ``_hblockerInterior``.
CAP_SIDE = (0, 1, 4, 6)

#: ``A = S.oppApex2`` is the vertex opposite that cap.
CAP_OPPOSITE = 5

#: The five physical class points.  A carrier point at a row's radius is in
#: that row's support (``CriticalFourShell.support_eq``: the support is the
#: whole radius class, not a selected subset), so a class point outside the
#: row's *proved* class trace is proved off the row circle.  The non-class
#: labels ``A`` and ``w`` carry no such exclusion -- they may be the row's two
#: unnamed support points -- so no row circle excludes them here.
CLASS_LABELS = (0, 1, 2, 3, 4)

#: Per-row circle exclusions that are consequences of the leaf hypotheses.
#: Row ``u`` has centre ``xv`` (``packet.blocker_eq_xv`` with ``P.huSource``)
#: and the *equality* trace ``support ∩ class = {u, xu}``
#: (``packet.source_row_trace``).  Row ``xv`` has centre ``w`` by definition of
#: label 6 and the equality trace ``support ∩ class = {xv, u}``
#: (``_htraceBound`` for ``⊆``, ``q_mem_support`` and ``_huXvRow`` for ``⊇``).
_ROW_U = (4, EDGE["u"])
_ROW_XV = (6, EDGE["xv"])

_CAP_LAYER_LEDGER = (
    (
        "ambient-distinct",
        "PROVED",
        (
            "5 class points distinct (P.hclassFive card = 5); A off the class "
            "(rho > 0); w off the class (_hblockerNotClass); w != A (centerAt_ne)"
        ),
    ),
    (
        "convex-position",
        "PROVED",
        "D.convex, swept over every cyclic order so the true one is covered",
    ),
    (
        "apex-circle",
        "PROVED",
        "all five class points are at distance rho from A = S.oppApex2",
    ),
    (
        "apex-exact-w-off-class",
        "PROVED",
        "_hblockerNotClass with w in the carrier via the cap interior",
    ),
    (
        "row-u-equidistance",
        "PROVED",
        "centerAt u = xv and {u, xu} in that row's support",
    ),
    (
        "row-xv-equidistance",
        "PROVED",
        "w = centerAt xv and {xv, u} in that row's support",
    ),
    (
        "row-u-class-exact",
        "PROVED",
        "support_eq + the equality trace: deleted, v are off the row-u circle",
    ),
    (
        "row-xv-class-exact",
        "PROVED",
        "support_eq + the equality trace: xu, deleted, v are off the row-xv circle",
    ),
    (
        "chord-*",
        "PROVED",
        (
            "u, xu, xv, w in capInteriorByIndex oppIndex2 with A its opposite "
            "vertex; the arc chord strictly separates them"
        ),
    ),
    (
        "row-u-exact vs A, w",
        "DROPPED (EXTRA)",
        (
            "nothing places A or w off the row-u circle; either may be one of that "
            "row's two unnamed support points"
        ),
    ),
    ("row-xv-exact vs A", "DROPPED (EXTRA)", "same, for the row-xv circle"),
)


def _cap_layer_groups(order, *, class_exact: bool, chord: bool, apex_same_side: bool):
    """Tagged constraint groups for one cap-layer system at ``n = 7``.

    Every returned atom is a consequence of the leaf hypotheses; see
    ``_CAP_LAYER_LEDGER``.  ``apex_same_side`` is the deliberately
    contradictory sanity variant and is *not* proved.
    """
    import z3

    n = 7
    points = {0: (z3.RealVal(0), z3.RealVal(0)), 1: (z3.RealVal(1), z3.RealVal(0))}
    for point in range(2, n):
        points[point] = z3.Reals(f"x_{point} y_{point}")

    def d2(left: int, right: int):
        lx, ly = points[left]
        rx, ry = points[right]
        return (lx - rx) ** 2 + (ly - ry) ** 2

    def cross(a: int, b: int, c: int):
        ax, ay = points[a]
        bx, by = points[b]
        cx, cy = points[c]
        return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

    def off_circle(center: int, point: int, reference: int):
        delta = d2(center, point) - d2(center, reference)
        return delta * delta > 0

    groups: list[tuple[str, list]] = []
    groups.append(
        (
            "ambient-distinct",
            [d2(left, right) > 0 for left in range(n) for right in range(left + 1, n)],
        )
    )
    convexity = []
    for index, left in enumerate(order):
        right = order[(index + 1) % n]
        convexity.extend(
            cross(left, right, point) > 0
            for point in order
            if point != left and point != right
        )
    groups.append(("convex-position", convexity))
    groups.append(
        ("apex-circle", [d2(5, point) == d2(5, 0) for point in CLASS_LABELS[1:]])
    )
    groups.append(("apex-exact-w-off-class", [off_circle(5, 6, 0)]))

    for tag, (center, support) in (("u", _ROW_U), ("xv", _ROW_XV)):
        reference = support[0]
        groups.append(
            (
                f"row-{tag}-equidistance",
                [d2(center, point) == d2(center, reference) for point in support[1:]],
            )
        )
        if class_exact:
            groups.append(
                (
                    f"row-{tag}-class-exact",
                    [
                        off_circle(center, point, reference)
                        for point in CLASS_LABELS
                        if point != center and point not in support
                    ],
                )
            )

    if chord:
        a, b, c = z3.Reals("chord_a chord_b chord_c")

        def side(point: int):
            px, py = points[point]
            return a * px + b * py + c

        groups.append(("chord-nondegenerate", [a * a + b * b > 0]))
        for point in CAP_SIDE:
            groups.append((f"chord-interior-{NAME[point]}", [side(point) > 0]))
        groups.append(
            (f"chord-opposite-{NAME[CAP_OPPOSITE]}", [side(CAP_OPPOSITE) < 0])
        )
        if apex_same_side:
            groups.append(
                (
                    f"chord-sanity-{NAME[CAP_OPPOSITE]}-same-side",
                    [side(CAP_OPPOSITE) > 0],
                )
            )
    return groups


def _cap_layer_solve(
    order,
    timeout_s: float,
    *,
    class_exact: bool = True,
    chord: bool = True,
    apex_same_side: bool = False,
) -> dict:
    """Single QF_NRA check of one cap-layer system, with model re-substitution."""
    import z3

    groups = _cap_layer_groups(
        order,
        class_exact=class_exact,
        chord=chord,
        apex_same_side=apex_same_side,
    )
    atoms = [atom for _tag, group in groups for atom in group]
    solver = z3.Tactic("qfnra-nlsat").solver()
    solver.set("timeout", max(1, int(timeout_s * 1000)))
    solver.add(*atoms)
    verdict = solver.check()
    if verdict == z3.unsat:
        return {"status": "UNSAT", "atoms": len(atoms)}
    if verdict != z3.sat:
        return {
            "status": "UNKNOWN",
            "atoms": len(atoms),
            "reason": solver.reason_unknown(),
        }
    model = solver.model()
    bad = [
        str(atom)
        for atom in atoms
        if not z3.is_true(z3.simplify(model.eval(atom, model_completion=True)))
    ]
    return {
        "status": "SAT",
        "atoms": len(atoms),
        "verified": not bad,
        "bad_assertions": bad[:4],
    }


def _cap_layer_core(order, timeout_s: float, *, class_exact: bool = True) -> dict:
    """Tracked group-level unsat core for one cap-layer system."""
    import z3

    groups = _cap_layer_groups(
        order,
        class_exact=class_exact,
        chord=True,
        apex_same_side=False,
    )
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", max(1, int(timeout_s * 1000)))
    solver.set("unsat_core", True)
    for tag, group in groups:
        solver.assert_and_track(z3.And(*group), z3.Bool(tag))
    verdict = solver.check()
    if verdict == z3.unsat:
        return {
            "status": "UNSAT",
            "core": sorted(str(item) for item in solver.unsat_core()),
            "groups": [tag for tag, _group in groups],
        }
    if verdict == z3.sat:
        return {"status": "SAT"}
    return {"status": "UNKNOWN", "reason": solver.reason_unknown()}


def _chord_semantics_smoke(timeout_s: float = 10.0) -> dict:
    """Fixed-coordinate check that the chord encoding means strict separation.

    Four corners of a unit square stand in for the cap interior.  An apex at
    the centre is inside their hull, so no strict separating line exists and
    the encoding must report UNSAT; an apex far outside must report SAT.
    """
    import z3

    corners = ((0, 0), (1, 0), (0, 1), (1, 1))
    out = {}
    for label, apex in (
        ("apex-inside-hull", (z3.RealVal(1) / 2, z3.RealVal(1) / 2)),
        ("apex-outside-hull", (z3.RealVal(5), z3.RealVal(5))),
    ):
        a, b, c = z3.Reals("smoke_a smoke_b smoke_c")
        solver = z3.Tactic("qfnra-nlsat").solver()
        solver.set("timeout", max(1, int(timeout_s * 1000)))
        solver.add(a * a + b * b > 0)
        for cx, cy in corners:
            solver.add(a * cx + b * cy + c > 0)
        solver.add(a * apex[0] + b * apex[1] + c < 0)
        verdict = solver.check()
        out[label] = (
            "SAT"
            if verdict == z3.sat
            else "UNSAT"
            if verdict == z3.unsat
            else "UNKNOWN"
        )
    out["passed"] = (
        out["apex-inside-hull"] == "UNSAT" and out["apex-outside-hull"] == "SAT"
    )
    return out


#: variants swept in stage 5.  Keys are (class_exact, chord, apex_same_side).
_CAP_LAYER_VARIANTS = {
    "base+chord": (True, True, False),  # primary
    "base-only": (True, False, False),  # control: what the chord adds
    "weak-base+chord": (False, True, False),  # drops the row class-exactness
    "SANITY same-side": (True, True, True),  # must be UNSAT everywhere
}


def _cap_layer_job(job):
    vname, order, timeout_s = job
    class_exact, chord, apex_same_side = _CAP_LAYER_VARIANTS[vname]
    res = _cap_layer_solve(
        order,
        timeout_s,
        class_exact=class_exact,
        chord=chord,
        apex_same_side=apex_same_side,
    )
    return vname, order, res["status"], bool(res.get("verified"))


def stage_cap_layer(timeout_s: float = 30.0, workers: int = 8) -> None:
    """Probe the encoded cap-layer consequences of the off-class leaf.

    A verdict of UNSAT is a candidate for a closing proof only if *every*
    asserted atom is a consequence of the leaf hypotheses and the resulting
    contradiction is replayed inside the accepted trust boundary.  This stage
    drops the stage-4 ``exact`` atoms that are not proved
    (``_CAP_LAYER_LEDGER``) and adds the separating chord, itself a consequence
    of the proved cap memberships.  SAT here says only that this exact encoded
    consequence set is consistent; it neither realizes the full configuration
    nor rules out another cap-layer argument.
    """
    print("\nstage 5: cap layer (n = 7, proved-consequence base + separating chord)")
    print("  constraint ledger")
    for tag, verdict, reason in _CAP_LAYER_LEDGER:
        print(f"    {tag:26s} {verdict:16s} {reason}")

    chord_smoke = _chord_semantics_smoke(min(timeout_s, 10.0))
    print("  chord-encoding sanity (fixed coordinates)")
    print(f"    apex inside hull  -> {chord_smoke['apex-inside-hull']} (want UNSAT)")
    print(f"    apex outside hull -> {chord_smoke['apex-outside-hull']} (want SAT)")
    if not chord_smoke["passed"]:
        print("    CHORD ENCODING BROKEN -- no stage 5 number below is meaningful.")
        return

    orders = cyclic_orders(7)
    print(f"  cyclic orders swept: {len(orders)}")
    jobs = [(v, o, timeout_s) for v in _CAP_LAYER_VARIANTS for o in orders]
    agg: dict[str, list[str]] = {}
    verified: dict[str, int] = {}
    sat_orders: dict[str, list[tuple[int, ...]]] = {}
    with ProcessPoolExecutor(max_workers=workers) as pool:
        for future in as_completed([pool.submit(_cap_layer_job, j) for j in jobs]):
            vname, order, status, ok = future.result()
            agg.setdefault(vname, []).append(status)
            if status == "SAT":
                sat_orders.setdefault(vname, []).append(order)
                if ok:
                    verified[vname] = verified.get(vname, 0) + 1
    for vname in _CAP_LAYER_VARIANTS:
        statuses = agg[vname]
        print(
            f"  {vname:17s} SAT {statuses.count('SAT'):3d} "
            f"(Z3 assertions true {verified.get(vname, 0):3d})  "
            f"UNSAT {statuses.count('UNSAT'):3d}  "
            f"UNKNOWN {statuses.count('UNKNOWN'):3d}"
        )
    sanity = agg["SANITY same-side"]
    if sanity.count("UNSAT") != len(orders):
        print("    SANITY VARIANT DID NOT COME BACK ALL-UNSAT -- the chord is not")
        print("    wired to the apex coordinates and no number above is meaningful.")
        return

    for order in sorted(sat_orders.get("base+chord", []))[:6]:
        print("    SAT order: " + " ".join(NAME[p] for p in order))
    if not sat_orders.get("base+chord"):
        print("    DECISIVE: no convex order admits the proved-consequence base")
        print("    together with the separating chord.")
        for order in orders[:3]:
            core = _cap_layer_core(order, timeout_s)
            label = " ".join(NAME[p] for p in order)
            if core["status"] == "UNSAT":
                print(f"    core [{label}]: {', '.join(core['core'])}")
            else:
                print(f"    core [{label}]: {core['status']}")
    else:
        print("    SAT: this exact encoded consequence set is consistent.")
        print("    No full-leaf realizability or route-exclusion claim follows.")


def _legacy_main(timeout_s: float) -> int:
    if not stage_smoke(timeout_s):
        print("\nENCODING SMOKE TEST FAILED -- no downstream result is trustworthy.")
        return 1
    survivors = stage_leaf_orders(timeout_s)
    stage_fanout(survivors, min(timeout_s, 15.0))
    stage_duplicate_centre(timeout_s)
    stage_offclass_blocker(min(timeout_s, 15.0))
    stage_cap_layer(max(timeout_s, 30.0))
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--backend",
        choices=("piqd", "legacy-local-z3"),
        default="piqd",
        help="PIQD is the production default; local Z3 is explicit legacy only",
    )
    parser.add_argument("--timeout", type=float, default=20.0)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", type=Path)
    args = parser.parse_args(argv)
    if args.check is not None:
        if args.backend != "piqd" or args.output is not None:
            parser.error("--check is standalone and accepts neither backend nor output")
        from census.rigid221_pentagon_piqd import validate_published_output

        validate_published_output(args.check)
        return 0
    if args.backend == "legacy-local-z3":
        if args.output is not None:
            parser.error("legacy local Z3 does not accept --output")
        return _legacy_main(args.timeout)
    if args.output is None:
        parser.error("the PIQD route requires an exact create-once --output Path")
    from census.rigid221_pentagon_piqd import run_campaign

    run_campaign(
        output_directory=args.output,
        timeout_s=args.timeout,
        server=args.server,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
