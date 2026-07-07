#!/usr/bin/env python3
"""Full minimal-core CLASS census for |A|=12 dead cubes.

For the first M cubes (deterministic seed=7) per profile: find stage-2 minimal
core(s) (EXHAUSTIVE, char-0 [-1] oracle, 2.5s timeout -- dead resolves <0.3s so
this cannot miss a dead core), canonicalize the directed CONSTRAINT graph, tally
distinct classes + accumulation curve.  Per-class Singular confirmation + mode
label (C-empty vs no-distinct-real).  Each cube labeled u1-hit/miss.

Usage: run_full.py <profile:654|555> <M>
"""
import json
import sys
import time
from collections import Counter

import mine

TC = mine.TC


def _load(n, p):
    import importlib.util
    s = importlib.util.spec_from_file_location(n, p)
    m = importlib.util.module_from_spec(s)
    s.loader.exec_module(m)
    return m


PAT = _load("pat", f"{TC}/_u12_pattern_cover.py")


def main(profile, M):
    cubes, att = mine.CEN.sample_cubes(mine.CEN.PROFILES[profile], 2000, 7)
    dead_keys = set()
    with open(f"{TC}/_u12_dead_{profile}.jsonl") as f:
        for ln in f:
            d = json.loads(ln)
            cb = {int(kk): v for kk, v in d.items()}
            dead_keys.add(tuple(tuple(cb[p]) for p in range(12)))

    u1c = mine.u1_canonical()
    sample = cubes[:M]
    n_ce = sum(1 for cb in sample
               if tuple(tuple(cb[p]) for p in range(12)) in dead_keys)
    print(f"# profile {profile}: mining {len(sample)} cubes "
          f"({n_ce} C-empty, {len(sample)-n_ce} C-alive); u1c nv=5", flush=True)

    registry = {}     # canon -> info (with a representative (cube_idx,P))
    accum = []
    kdist = Counter()
    percube = []
    u1hit_classes = Counter()
    u1miss_classes = Counter()
    n_unresolved = 0
    t0 = time.time()
    for i, cube in enumerate(sample):
        is_ce = tuple(tuple(cube[p]) for p in range(12)) in dead_keys
        r = mine.min_support(cube, kmax=7, workers=16, search_to=1.0)
        k = r["k"]
        kdist[k] += 1
        if k is None:
            n_unresolved += 1
        cube_classes = set()
        core_recs = []
        for c in r["cores"]:
            cf, nv, ne, sig = mine.canon_stats(c["edges"])
            cube_classes.add(cf)
            info = registry.setdefault(cf, {
                "nv": nv, "ne": ne, "sig": [list(t) for t in sig],
                "is_u1": cf == u1c, "n_cores": 0, "n_cubes": 0,
                "adj": mine.readable(cf), "rep_cube": i, "rep_P": c["P"],
                "rep_edges": c["edges"]})
            info["n_cores"] += 1
            core_recs.append({"P": c["P"], "class": str(cf), "nv": nv, "ne": ne})
        for cf in cube_classes:
            registry[cf]["n_cubes"] += 1
        u1hit = PAT.contains_pattern(cube) is not None
        for cf in cube_classes:
            (u1hit_classes if u1hit else u1miss_classes)[cf] += 1
        accum.append((i + 1, len(registry)))
        percube.append({"idx": i, "Cempty": is_ce, "k": k,
                        "n_cores": len(r["cores"]),
                        "classes": [str(cf) for cf in cube_classes],
                        "u1hit": u1hit,
                        "resid_to": r.get("residual_timeout_below_kstar", 0)})
        if (i + 1) % 10 == 0 or i + 1 == len(sample):
            print(f"  {i+1}/{len(sample)}: classes={len(registry)} "
                  f"k*={dict(sorted((kk if kk else -1, v) for kk, v in kdist.items()))} "
                  f"({time.time()-t0:.0f}s)", flush=True)
            # incremental save (partial)
            _save(profile, sample, att, n_ce, registry, accum, kdist, percube,
                  u1hit_classes, u1miss_classes, u1c, n_unresolved, t0,
                  confirmed=False)

    # per-CLASS Singular confirmation + mode (mode is a class invariant)
    print("# per-class Singular confirmation + mode ...", flush=True)
    for cf, info in registry.items():
        cube = sample[info["rep_cube"]]
        mode, sb, ss = mine.confirm_class(cube, info["rep_P"])
        info["mode"] = mode
        info["sing_base_empty"] = sb
        info["sing_sat_empty"] = ss

    _save(profile, sample, att, n_ce, registry, accum, kdist, percube,
          u1hit_classes, u1miss_classes, u1c, n_unresolved, t0, confirmed=True)

    print(f"\n=== SUMMARY profile {profile} (M={len(sample)}) ===", flush=True)
    print(f"distinct classes = {len(registry)}; k* dist = "
          f"{dict(sorted((kk if kk else -1, v) for kk, v in kdist.items()))}; "
          f"unresolved = {n_unresolved}", flush=True)
    print(f"accumulation (every 10): "
          f"{[a for a in accum if a[0] % 10 == 0]}", flush=True)
    print("classes (by #cubes):", flush=True)
    for cf, info in sorted(registry.items(), key=lambda kv: -kv[1]["n_cubes"]):
        print(f"  nv={info['nv']} ne={info['ne']} n_cubes={info['n_cubes']} "
              f"n_cores={info['n_cores']} is_u1={info['is_u1']} "
              f"mode={info.get('mode')} sing_sat={info.get('sing_sat_empty')} "
              f"adj={info['adj']}", flush=True)
    hit_nv = Counter(registry[cf]["nv"] for cf in u1hit_classes)
    miss_nv = Counter(registry[cf]["nv"] for cf in u1miss_classes)
    print(f"\nu1-hit cubes: {sum(u1hit_classes.values())} class-incidences over "
          f"{len(u1hit_classes)} classes (by core nv: {dict(hit_nv)})", flush=True)
    print(f"u1-miss cubes: {sum(u1miss_classes.values())} class-incidences over "
          f"{len(u1miss_classes)} classes (by core nv: {dict(miss_nv)})", flush=True)


def _save(profile, sample, att, n_ce, registry, accum, kdist, percube,
          u1hit_classes, u1miss_classes, u1c, n_unresolved, t0, confirmed):
    reg_out = {}
    for cf, info in registry.items():
        reg_out[str(cf)] = {k: v for k, v in info.items()}
    out = {
        "profile": profile, "M": len(sample), "attempts": att,
        "n_Cempty": n_ce, "n_Calive": len(sample) - n_ce,
        "n_unresolved": n_unresolved, "confirmed": confirmed,
        "n_distinct_classes": len(registry),
        "kstar_distribution": dict(sorted((kk if kk else -1, v)
                                          for kk, v in kdist.items())),
        "u1_class_present": any(info["is_u1"] for info in registry.values()),
        "accumulation_curve": accum,
        "classes": reg_out,
        "u1hit_class_counts": {str(k): v for k, v in u1hit_classes.items()},
        "u1miss_class_counts": {str(k): v for k, v in u1miss_classes.items()},
        "percube": percube,
        "elapsed_s": time.time() - t0,
    }
    with open(f"result_{profile}.json", "w") as f:
        json.dump(out, f, indent=2)


if __name__ == "__main__":
    main(sys.argv[1], int(sys.argv[2]))
