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

Semantics, stated once.  UNSAT is decisive: that configuration has no Euclidean
realization, so the branch is geometrically excluded.  SAT is *not* a Problem 97
counterexample -- it only says this relaxed row-level subsystem is realizable,
hence the branch cannot be closed by the facts encoded here.  UNKNOWN is a
solver timeout and is decisive for nothing; the reports below count UNKNOWN
separately and never fold it into UNSAT.  Z3 verdicts are trusted computations,
not kernel-checked certificates.

Run::

    PYTHONPATH=. uv run python census/rigid221_pentagon_oracle.py
"""
from __future__ import annotations

import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from itertools import permutations

from census.endpoint_confinement.metric_realizability_probe import (
    MetricRow,
    _probe_system,
    run_smoke,
)

NAME = {0: "u", 1: "xu", 2: "deleted", 3: "v", 4: "xv", 5: "A"}

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
    return _probe_system(system, timeout_s)


def _sys(system_id: str, n: int, order, rows, ) -> dict:
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
    result = run_smoke(timeout_s)
    print("stage 0: encoding smoke test")
    print(f"  known-SAT   -> {result['sat']['status']} "
          f"(model verified: {result['sat'].get('verification', {}).get('all_z3_assertions_true')})")
    print(f"  known-UNSAT -> {result['unsat']['status']} "
          f"({result['unsat'].get('decisive_stage')})")
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
        configs[leaf] = [ROW_APEX, ROW_U,
                         MetricRow(center, EDGE["xv"], False).as_dict()]
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
    rows = [ROW_APEX, ROW_U,
            MetricRow(XV_CENTER[leaf], EDGE["xv"], False).as_dict(),
            MetricRow(cand, EDGE[rowname], False).as_dict()]
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
    candidates = [r for r in ("xu", "deleted") ]
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
        print(f"  centerAt {rowname:8s} = xv : UNSAT {statuses.count('UNSAT')} "
              f" SAT {statuses.count('SAT')}  UNKNOWN {statuses.count('UNKNOWN')}"
              f"   stages={sorted(stages.get(rowname, []))}")
    print("    rows u and xu share the class point xu, so a common centre forces a")
    print("    single radius and an equidistant class triple; rows u and deleted have")
    print("    disjoint traces and may share a centre at two different radii.")


def main() -> int:
    timeout_s = float(sys.argv[1]) if len(sys.argv) > 1 else 20.0
    if not stage_smoke(timeout_s):
        print("\nENCODING SMOKE TEST FAILED -- no downstream result is trustworthy.")
        return 1
    survivors = stage_leaf_orders(timeout_s)
    stage_fanout(survivors, min(timeout_s, 15.0))
    stage_duplicate_centre(timeout_s)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
