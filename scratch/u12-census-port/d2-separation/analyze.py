#!/usr/bin/env python3
"""D2 separation analysis (streaming): dead cores vs the full control universe.

Reads per_core_invariants.jsonl (dead cores; Singular-confirmed only) and
streams controls_all_{654,555}.jsonl.gz (every eligible control framework,
coverage: k in {4,5,6} all delta, k in {7,8} delta >= -3).

For each invariant and combo, per slice (654/555) and pooled:
  - dead value set vs alive stream: which dead values are HIT by at least one
    control (same value), how many dead cores / controls sit in the overlap
  - clean_separation = no dead value ever hit
  - matched-cell variant: same test restricted to the (profile, k, delta)
    cell of each dead core (k and delta are themselves invariants, so this is
    the fair residual-power comparison)
  - scalar ranges both sides (pooled) for context

Collision examples for the full-vector combo are recorded (dead id, control id).

Output: separation_report.json + printed summary.
"""
import gzip
import json
import os
from collections import Counter, defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))

SCALAR_INVS = ["k", "R", "delta", "max_sub_delta_all", "max_sub_delta_proper",
               "n_sub_tight", "n_sub_over", "n_circles", "max_circle_degree",
               "min_circle_degree", "E_star_edges", "E_minus_2k",
               "max_member_degree", "min_member_degree", "min_L_at_max_delta",
               "max_contract_delta", "max_contract_delta_z0",
               "gauge_contract_delta", "gauge_contract_z",
               "n_pairs_contract_over", "n_pairs_z_pos"]
PROFILE_INVS = ["circle_degree_profile", "class_size_profile",
                "member_degree_profile", "sub_delta_hist",
                "sub_size_delta_hist", "contraction_profile", "argmax_sizes"]
ALL_INVS = SCALAR_INVS + PROFILE_INVS

COMBOS = [
    ("k+delta", ["k", "delta"]),
    ("k+delta+maxsub", ["k", "delta", "max_sub_delta_all"]),
    ("k+delta+circledeg", ["k", "delta", "circle_degree_profile"]),
    ("k+delta+memberdeg", ["k", "delta", "member_degree_profile"]),
    ("k+delta+subhist", ["k", "delta", "sub_delta_hist"]),
    ("k+delta+sizesubhist", ["k", "delta", "sub_size_delta_hist"]),
    ("k+delta+contraction", ["k", "delta", "contraction_profile"]),
    ("k+delta+gaugecontract", ["k", "delta", "gauge_contract_delta", "gauge_contract_z"]),
    ("k+delta+subhist+circledeg", ["k", "delta", "sub_delta_hist", "circle_degree_profile"]),
    ("k+delta+contraction+circledeg", ["k", "delta", "contraction_profile", "circle_degree_profile"]),
    ("ALL_scalars", SCALAR_INVS),
    ("ALL_scalars+profiles", ALL_INVS),
]
FULL_COMBO = "ALL_scalars+profiles"


def norm(v):
    return repr(v) if isinstance(v, list) else v


def combo_val(rec, names):
    return repr([rec[n] for n in names])


def main():
    dead = []
    with open(f"{HERE}/per_core_invariants.jsonl") as f:
        for ln in f:
            r = json.loads(ln)
            if r["singular_confirmed"]:
                dead.append(r)
    slices = ["654", "555", "pooled"]

    # dead value sets
    dsets = {name: {sl: set() for sl in slices} for name in ALL_INVS}
    dcell = {name: defaultdict(set) for name in ALL_INVS}     # (prof,k,delta) -> set
    dcombo = {cn: {sl: set() for sl in slices} for cn, _ in COMBOS}
    dcombo_cell = {cn: defaultdict(set) for cn, _ in COMBOS}
    dead_cells = set()
    dead_kd = set()   # (k, delta) irrespective of profile — combo-eval gate
    dead_scalar_rng = {name: [None, None] for name in SCALAR_INVS}
    for r in dead:
        cell = (r["profile"], r["k"], r["delta"])
        dead_cells.add(cell)
        dead_kd.add((r["k"], r["delta"]))
        for name in ALL_INVS:
            v = norm(r[name])
            dsets[name][r["profile"]].add(v)
            dsets[name]["pooled"].add(v)
            dcell[name][cell].add(v)
        for cn, names in COMBOS:
            cv = combo_val(r, names)
            dcombo[cn][r["profile"]].add(cv)
            dcombo[cn]["pooled"].add(cv)
            dcombo_cell[cn][cell].add(cv)
        for name in SCALAR_INVS:
            v = r[name]
            if v is None:
                continue
            lo, hi = dead_scalar_rng[name]
            dead_scalar_rng[name] = [v if lo is None else min(lo, v),
                                     v if hi is None else max(hi, v)]

    # streaming alive pass
    hit = {name: {sl: set() for sl in slices} for name in ALL_INVS}
    hit_cell = {name: defaultdict(set) for name in ALL_INVS}
    alive_over = {name: {sl: 0 for sl in slices} for name in ALL_INVS}
    alive_over_cell = {name: Counter() for name in ALL_INVS}
    chit = {cn: {sl: set() for sl in slices} for cn, _ in COMBOS}
    chit_cell = {cn: defaultdict(set) for cn, _ in COMBOS}
    calive_over = {cn: {sl: 0 for sl in slices} for cn, _ in COMBOS}
    calive_over_cell = {cn: Counter() for cn, _ in COMBOS}
    alive_scalar_rng = {name: [None, None] for name in SCALAR_INVS}
    n_alive = {sl: 0 for sl in slices}
    n_alive_cell = Counter()
    full_collisions = []

    for prof in ("654", "555"):
        path = f"{HERE}/controls_all_{prof}.jsonl.gz"
        if not os.path.exists(path):
            print(f"WARNING: {path} missing, skipping")
            continue
        with gzip.open(path, "rt") as f:
            for ln in f:
                rec = json.loads(ln)
                cell = (prof, rec["k"], rec["delta"])
                n_alive[prof] += 1
                n_alive["pooled"] += 1
                n_alive_cell[cell] += 1
                in_dead_cell = cell in dead_cells
                for name in ALL_INVS:
                    v = norm(rec[name])
                    dp = dsets[name]
                    if v in dp[prof]:
                        hit[name][prof].add(v)
                        alive_over[name][prof] += 1
                    if v in dp["pooled"]:
                        hit[name]["pooled"].add(v)
                        alive_over[name]["pooled"] += 1
                    if in_dead_cell and v in dcell[name][cell]:
                        hit_cell[name][cell].add(v)
                        alive_over_cell[name][cell] += 1
                for name in SCALAR_INVS:
                    v = rec[name]
                    if v is None:
                        continue
                    lo, hi = alive_scalar_rng[name]
                    alive_scalar_rng[name] = [v if lo is None else min(lo, v),
                                              v if hi is None else max(hi, v)]
                if (rec["k"], rec["delta"]) in dead_kd:
                    # every combo includes (k, delta), so only these records
                    # can match any dead combo value (incl. cross-profile pooled)
                    for cn, names in COMBOS:
                        cv = combo_val(rec, names)
                        if cv in dcombo[cn][prof]:
                            chit[cn][prof].add(cv)
                            calive_over[cn][prof] += 1
                            if cn == FULL_COMBO and len(full_collisions) < 20:
                                full_collisions.append(
                                    {"control": {"profile": prof,
                                                 "cube_idx": rec["cube_idx"],
                                                 "P": rec["P"], "k": rec["k"],
                                                 "delta": rec["delta"]},
                                     "combo_value": cv})
                        if cv in dcombo[cn]["pooled"]:
                            chit[cn]["pooled"].add(cv)
                            calive_over[cn]["pooled"] += 1
                        if cv in dcombo_cell[cn][cell]:
                            chit_cell[cn][cell].add(cv)
                            calive_over_cell[cn][cell] += 1

    # assemble report
    def side(name, sl, dead_side, hit_side, alive_over_side):
        dv = dead_side[name][sl]
        hv = hit_side[name][sl]
        n_dead_in = sum(1 for r in dead
                        if (sl == "pooled" or r["profile"] == sl)
                        and _val(r, name) in hv)
        n_dead_tot = sum(1 for r in dead if sl == "pooled" or r["profile"] == sl)
        return {"n_dead_values": len(dv), "n_hit_values": len(hv),
                "clean_separation": len(hv) == 0,
                "n_dead_records_in_overlap": n_dead_in,
                "n_dead_records_total": n_dead_tot,
                "n_alive_records_in_overlap": alive_over_side[name][sl],
                "n_alive_records_total": n_alive[sl]}

    _combo_names = dict(COMBOS)

    def _val(r, name):
        if name in _combo_names:
            return combo_val(r, _combo_names[name])
        return norm(r[name])

    # attribute full-vector collisions to the dead cores they match
    fc_names = _combo_names[FULL_COMBO]
    for ex in full_collisions:
        cv = ex["combo_value"]
        ex["matching_dead_cores"] = [
            {"profile": r["profile"], "cube_idx": r["cube_idx"],
             "core_idx": r["core_idx"], "P": r["P"]}
            for r in dead if combo_val(r, fc_names) == cv][:5]
        ex["combo_value"] = cv[:200]

    report = {
        "n_dead_cores": len(dead),
        "dead_by_slice": dict(Counter(r["profile"] for r in dead)),
        "n_alive_controls": n_alive,
        "dead_cells": sorted(map(repr, dead_cells)),
        "scalar_ranges": {name: {"dead": dead_scalar_rng[name],
                                 "alive": alive_scalar_rng[name]}
                          for name in SCALAR_INVS},
        "invariants": {}, "combos": {}, "matched_cell": {},
        "full_combo_collision_examples": full_collisions,
    }
    for name in ALL_INVS:
        report["invariants"][name] = {sl: side(name, sl, dsets, hit, alive_over)
                                      for sl in slices}
    for cn, _ in COMBOS:
        report["combos"][cn] = {sl: side(cn, sl, dcombo, chit, calive_over)
                                for sl in slices}

    # matched-cell rollup
    for name in ALL_INVS + [cn for cn, _ in COMBOS]:
        is_combo = name in _combo_names
        hc = chit_cell[name] if is_combo else hit_cell[name]
        n_sep = 0
        cells_detail = {}
        for r in dead:
            cell = (r["profile"], r["k"], r["delta"])
            if _val(r, name) not in hc[cell]:
                n_sep += 1
        for cell in sorted(dead_cells):
            nd = sum(1 for r in dead if (r["profile"], r["k"], r["delta"]) == cell)
            ndin = sum(1 for r in dead
                       if (r["profile"], r["k"], r["delta"]) == cell
                       and _val(r, name) in hc[cell])
            cells_detail[repr(cell)] = {
                "n_dead": nd, "n_dead_in_overlap": ndin,
                "n_alive_in_cell": n_alive_cell[cell],
                "n_alive_in_overlap": (calive_over_cell[name][cell] if is_combo
                                       else alive_over_cell[name][cell]),
            }
        report["matched_cell"][name] = {
            "n_dead_cores_separated": n_sep,
            "n_dead_cores_total": len(dead),
            "all_clean": n_sep == len(dead),
            "cells": cells_detail,
        }

    with open(f"{HERE}/separation_report.json", "w") as f:
        json.dump(report, f, indent=1)

    # printed summary
    print(f"dead cores: {len(dead)} {report['dead_by_slice']}; "
          f"alive controls: {n_alive}")
    print(f"dead cells (profile,k,delta): {report['dead_cells']}\n")
    hdr = f"{'invariant':34s} {'POOLED sep?':>11s} {'hit/dead vals':>14s} {'dead-in-ovl':>12s} {'alive-in-ovl':>13s} {'cell-sep':>10s}"
    print(hdr)
    for name in ALL_INVS + [cn for cn, _ in COMBOS]:
        if name in report["invariants"]:
            st = report["invariants"][name]["pooled"]
        else:
            st = report["combos"][name]["pooled"]
        m = report["matched_cell"][name]
        print(f"{name:34s} {'YES' if st['clean_separation'] else 'no':>11s} "
              f"{st['n_hit_values']:>6d}/{st['n_dead_values']:<7d} "
              f"{st['n_dead_records_in_overlap']:>5d}/{st['n_dead_records_total']:<6d} "
              f"{st['n_alive_records_in_overlap']:>6d}/{st['n_alive_records_total']:<7d} "
              f"{m['n_dead_cores_separated']:>4d}/{m['n_dead_cores_total']:<5d}")
    print("\nscalar ranges (pooled)  dead | alive:")
    for name in SCALAR_INVS:
        sr = report["scalar_ranges"][name]
        print(f"  {name:32s} {sr['dead']} | {sr['alive']}")


if __name__ == "__main__":
    main()
