#!/usr/bin/env python3
"""D2 sweep: compute invariants for all mined dead cores and all alive controls.

Dead cores:   mined_cores_{profile}.jsonl (from mine_cores.py; msolve+Singular)
Alive ctrls:  alive_2000_{profile}.jsonl (validated derivation, see
              validate_schema.py); every induced subframework of a stage-1
              C-ALIVE cube is C-feasible in gauge by restriction of the cube's
              solution, hence a sound feasible control.

Control eligibility: |S| in K_RANGE, R(S) >= 1, no idle point (every point of
S occurs in an induced constraint).  Full invariant records are written for
controls with delta >= FULL_RECORD_MIN_DELTA; for ALL eligible controls the
per-invariant value counters are accumulated (so separation tests run against
the complete control universe, not a subsample).

Outputs (in this dir):
  per_core_invariants.jsonl          one record per mined dead core
  controls_invariants_{prof}.jsonl.gz  full records, controls delta >= -1
  control_value_counters.json        complete-universe value counters
  sweep_summary.json                 counts, validation flags

Validations performed during the sweep:
  - every dead core P contains both gauge points {0,1} (must, by the
    all-points-collapse argument: any induced system missing 0 or 1 has a
    trivial solution, so it cannot be C-infeasible)
  - miner signature (sorted |K_c cap P| multiset) recomputed independently
    and compared per core
  - n_gens recorded by the miner == R of the induced framework
  - coordinated-count identity E - (2k - 3 + L) == delta - 1 per framework
"""
import gzip
import json
import os
import sys
from collections import Counter
from itertools import combinations

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from invariants import cube_gen_map, induced_constraints, framework_invariants  # noqa: E402

K_RANGE = (4, 5, 6, 7, 8)
FULL_RECORD_MIN_DELTA = -1
# complete-universe value counters: all delta at k in {4,5,6}; delta >= K78_MIN_DELTA
# at k in {7,8} (tractability cut, 2 notches below the observed dead range;
# every separation claim in the report states this coverage boundary).
K78_MIN_DELTA = -3

SCALARS = ["k", "R", "delta", "max_sub_delta_all", "max_sub_delta_proper",
           "n_sub_tight", "n_sub_over", "n_circles", "max_circle_degree",
           "E_star_edges", "min_L_at_max_delta", "max_contract_delta",
           "max_contract_delta_z0", "n_pairs_contract_over", "n_pairs_z_pos"]
PROFILES_KEYS = ["circle_degree_profile", "class_size_profile",
                 "member_degree_profile", "sub_delta_hist", "contraction_profile",
                 "argmax_sizes"]


def read_jsonl(path):
    out = []
    with open(path) as f:
        for ln in f:
            ln = ln.strip()
            if ln:
                out.append(json.loads(ln))
    return out


def derived_scalars(inv):
    """Extra derived scalar invariants."""
    d = {}
    d["E_minus_2k"] = inv["E_star_edges"] - 2 * inv["k"]
    d["max_member_degree"] = inv["member_degree_profile"][0] if inv["member_degree_profile"] else 0
    d["min_member_degree"] = inv["member_degree_profile"][-1] if inv["member_degree_profile"] else 0
    gc = inv["gauge_pair_contract"]
    d["gauge_contract_delta"] = gc[0] if gc is not None else None
    d["gauge_contract_z"] = gc[1] if gc is not None else None
    d["min_circle_degree"] = (inv["circle_degree_profile"][-1]
                              if inv["circle_degree_profile"] else 0)
    return d


def counter_key(inv, name):
    v = inv[name]
    if isinstance(v, list):
        return json.dumps(v)
    return v


ALL_INV_NAMES = None  # filled at first use


def sweep_dead(profile, counters, summary, path=None):
    import glob as _glob
    if path:
        paths = [path]
    else:
        paths = sorted(_glob.glob(f"{HERE}/mined_cores_v2_{profile}*.jsonl")) \
            or [f"{HERE}/mined_cores_{profile}.jsonl"]
    recs, seen = [], set()
    for pth in paths:
        for r in read_jsonl(pth):
            if r["cube_idx"] not in seen:
                seen.add(r["cube_idx"])
                recs.append(r)
    recs.sort(key=lambda r: r["cube_idx"])
    out = []
    n_sing_timeout = 0
    ms_hist = Counter()
    for rec in recs:
        cube = {int(k): v for k, v in rec["cube"].items()}
        gm = cube_gen_map(cube)
        ms_hist[rec["min_support"]] += 1
        for ci, core in enumerate(rec["cores"]):
            P = sorted(core["P"])
            # gauge-pair containment check (must hold; see module docstring)
            assert 0 in P and 1 in P, f"core without gauge pair: {profile} cube {rec['cube_idx']} {P}"
            C = induced_constraints(gm, P)
            assert len(C) == core["n_gens"], \
                f"n_gens mismatch {profile}/{rec['cube_idx']}/{ci}: {len(C)} vs {core['n_gens']}"
            # recompute miner signature independently
            sig = sorted(len(set(cube[c]) & set(P)) for c in P)
            assert sig == sorted(core["signature"]), \
                f"signature mismatch {profile}/{rec['cube_idx']}/{ci}"
            inv = framework_invariants(P, C)
            # coordinated identity
            assert inv["E_star_edges"] - (2 * inv["k"] - 3 + inv["n_circles"]) == inv["delta"] - 1
            inv.update(derived_scalars(inv))
            singular_timeout = core.get("singular") == "TIMEOUT"
            if singular_timeout:
                n_sing_timeout += 1
            row = {"label": "dead", "profile": profile,
                   "cube_idx": rec["cube_idx"], "core_idx": ci, "P": P,
                   "singular_confirmed": not singular_timeout,
                   "miner_signature": sorted(core["signature"]),
                   "miner_full_4stars": core["n_full_4stars"],
                   **inv}
            out.append(row)
            if not singular_timeout:
                key = (profile, inv["k"], inv["delta"])
                for name in list(inv.keys()):
                    counters["dead"].setdefault(name, {}).setdefault(str(key), Counter())[
                        str(counter_key(inv, name))] += 1
    summary[f"dead_{profile}"] = {
        "n_cube_records": len(recs),
        "min_support_hist": {str(k): v for k, v in sorted(ms_hist.items(), key=lambda x: (x[0] is None, x[0]))},
        "n_cores": len(out),
        "n_singular_timeout_cores": n_sing_timeout,
    }
    return out


def sweep_controls(profile, counters, summary):
    """Write EVERY eligible control's full invariant record to gz jsonl.

    Coverage: k in {4,5,6} all delta; k in {7,8} delta >= K78_MIN_DELTA
    (uncounted remainder tallied in cell_counts with an 'uncounted' marker).
    Analysis is a separate streaming pass (analyze.py), so no in-memory
    aggregation is needed here."""
    cubes = [{int(k): v for k, v in d.items()}
             for d in read_jsonl(f"{HERE}/alive_2000_{profile}.jsonl")]
    gz = gzip.open(f"{HERE}/controls_all_{profile}.jsonl.gz", "wt")
    n_total = 0
    cell_counts = Counter()
    for cube_i, cube in enumerate(cubes):
        gm = cube_gen_map(cube)
        trips = [set(g) for g in gm]
        for k in K_RANGE:
            for S in combinations(range(12), k):
                Ss = set(S)
                C = [g for g, t in zip(gm, trips) if t <= Ss]
                if not C:
                    continue
                if k >= 7 and len(C) - (2 * k - 4) < K78_MIN_DELTA:
                    cell_counts[(k, len(C) - (2 * k - 4), "uncounted")] += 1
                    continue
                used = set()
                for (c, a, b) in C:
                    used.update((c, a, b))
                if used != Ss:
                    continue  # idle point present
                inv = framework_invariants(S, C)
                assert inv["E_star_edges"] - (2 * inv["k"] - 3 + inv["n_circles"]) == inv["delta"] - 1
                inv.update(derived_scalars(inv))
                n_total += 1
                cell_counts[(k, inv["delta"])] += 1
                gz.write(json.dumps({"label": "alive", "profile": profile,
                                     "cube_idx": cube_i, "P": list(S), **inv}) + "\n")
        if (cube_i + 1) % 100 == 0:
            print(f"  [{profile}] controls: {cube_i + 1}/{len(cubes)} cubes, "
                  f"{n_total} eligible so far", flush=True)
    gz.close()
    summary[f"controls_{profile}"] = {
        "n_cubes": len(cubes),
        "n_eligible_controls": n_total,
        "cell_counts": {str(k): v for k, v in sorted(cell_counts.items())},
    }
    print(f"[{profile}] controls done: {n_total} eligible records", flush=True)


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--mode", choices=["dead", "controls", "both"], default="both")
    ap.add_argument("profiles", nargs="*", default=["654", "555"])
    args = ap.parse_args()
    profiles = args.profiles or ["654", "555"]

    counters = {"dead": {}, "alive": {}}
    summary = {}
    if args.mode in ("dead", "both"):
        dead_rows = []
        for p in profiles:
            # v2 (gauge-pair pruned, validated-identical) mining outputs, merged
            dead_rows += sweep_dead(p, counters, summary)
            print(f"[{p}] dead cores swept: {summary[f'dead_{p}']}", flush=True)
        with open(f"{HERE}/per_core_invariants.jsonl", "w") as f:
            for row in dead_rows:
                f.write(json.dumps(row) + "\n")
        with open(f"{HERE}/sweep_summary_dead.json", "w") as f:
            json.dump(summary, f, indent=2)
    if args.mode in ("controls", "both"):
        for p in profiles:
            sweep_controls(p, counters, summary)
        with open(f"{HERE}/sweep_summary_controls.json", "w") as f:
            json.dump({k: v for k, v in summary.items() if k.startswith("controls")},
                      f, indent=2)
    print(json.dumps(summary, indent=2)[:3000], flush=True)


if __name__ == "__main__":
    main()
