#!/usr/bin/env python3
"""Analyze result_<profile>.json: total classes, accumulation, class-size dist,
COVERAGE (greedy set-cover: min classes so every dead cube has a core in the
bank), per-class cube counts, u1 relationship.

Usage: analyze.py <profile>
"""
import json
import sys
from collections import Counter


def main(profile):
    with open(f"result_{profile}.json") as f:
        R = json.load(f)
    percube = R["percube"]
    classes = R["classes"]
    M = len(percube)
    print(f"=== profile {profile}: {M} cubes "
          f"({R['n_Cempty']} Ce / {R['n_Calive']} Ca), "
          f"confirmed={R['confirmed']} ===", flush=True)
    print(f"total distinct classes = {R['n_distinct_classes']}; "
          f"k* dist = {R['kstar_distribution']}; unresolved = {R['n_unresolved']}",
          flush=True)

    # accumulation curve (subsample)
    acc = R["accumulation_curve"]
    pts = [acc[i] for i in range(0, len(acc), max(1, len(acc) // 20))]
    print(f"accumulation curve (cubes, #classes): {pts}", flush=True)
    if len(acc) >= 20:
        last10 = acc[-1][1] - acc[-11][1]
        print(f"  new classes in last 10 cubes: {last10}", flush=True)

    # class-size distribution (nv)
    nv_dist = Counter(info["nv"] for info in classes.values())
    print(f"class nv distribution: {dict(sorted(nv_dist.items()))}", flush=True)
    mode_dist = Counter(info.get("mode") for info in classes.values())
    print(f"class death-mode distribution: {dict(mode_dist)}", flush=True)

    # cube -> set of classes; class -> set of cube idxs
    cube_classes = {pc["idx"]: set(pc["classes"]) for pc in percube}
    class_cubes = {}
    for pc in percube:
        for c in pc["classes"]:
            class_cubes.setdefault(c, set()).add(pc["idx"])
    covered_cubes = set(pc["idx"] for pc in percube if pc["classes"])
    print(f"cubes with >=1 core found: {len(covered_cubes)}/{M} "
          f"(unresolved/no-core: {M - len(covered_cubes)})", flush=True)

    # GREEDY SET COVER: min classes to cover all covered cubes
    remaining = set(covered_cubes)
    cover = []
    while remaining:
        best = max(class_cubes, key=lambda c: len(class_cubes[c] & remaining))
        gain = class_cubes[best] & remaining
        cover.append((best, len(gain), classes[best]["nv"], classes[best]["ne"]))
        remaining -= gain
        if len(class_cubes[best] & remaining) == 0 and not (
                class_cubes[best] & remaining):
            pass
    print(f"\nGREEDY SET-COVER: {len(cover)} classes cover all "
          f"{len(covered_cubes)} cubes", flush=True)
    cum = 0
    for i, (c, g, nv, ne) in enumerate(cover):
        cum += g
        print(f"  #{i+1}: nv={nv} ne={ne} covers +{g} (cum {cum}/{len(covered_cubes)}"
              f" = {100*cum/len(covered_cubes):.0f}%) mode={classes[c].get('mode')} "
              f"adj={classes[c]['adj']}", flush=True)
        if cum >= len(covered_cubes):
            break
        if i >= 24:
            print(f"  ... ({len(cover)-25} more cover classes)", flush=True)
            break

    # coverage by top-N classes
    top = sorted(class_cubes, key=lambda c: -len(class_cubes[c]))
    for N in (1, 3, 5, 10, 20):
        if N <= len(top):
            covd = set()
            for c in top[:N]:
                covd |= class_cubes[c]
            print(f"top-{N} most-common classes cover {len(covd)}/"
                  f"{len(covered_cubes)} cubes ({100*len(covd)/len(covered_cubes):.0f}%)",
                  flush=True)

    # most common classes
    print("\nmost common classes (by #cubes):", flush=True)
    for c in top[:12]:
        info = classes[c]
        print(f"  nv={info['nv']} ne={info['ne']} n_cubes={len(class_cubes[c])} "
              f"is_u1={info['is_u1']} mode={info.get('mode')} "
              f"sing_sat={info.get('sing_sat_empty')} adj={info['adj']}", flush=True)

    # u1 relationship
    print(f"\nu1_class_present (as a minimal core) = {R['u1_class_present']}",
          flush=True)
    hit = R["u1hit_class_counts"]
    miss = R["u1miss_class_counts"]
    n_hit_cubes = sum(1 for pc in percube if pc["u1hit"])
    print(f"u1-hit cubes: {n_hit_cubes}/{M}; their core classes span "
          f"{len(hit)} distinct classes", flush=True)
    print(f"u1-miss cubes: {M-n_hit_cubes}/{M}; their core classes span "
          f"{len(miss)} distinct classes", flush=True)
    # do hit and miss share classes?
    shared = set(hit) & set(miss)
    print(f"classes shared by hit AND miss cubes: {len(shared)} "
          f"(hit-only {len(set(hit)-set(miss))}, miss-only {len(set(miss)-set(hit))})",
          flush=True)


if __name__ == "__main__":
    main(sys.argv[1])
