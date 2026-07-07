#!/usr/bin/env python3
"""Spot-confirm a sample of found classes with Singular (base + saturated), and
compute structural regularity: relation-count R vs intrinsic DOF (2k-4), i.e.
over-determination, per class.  Reads result_654.json."""
import json
import random

import mine

TC = mine.TC


def main():
    with open("result_654.json") as f:
        R = json.load(f)
    cubes, _ = mine.CEN.sample_cubes(mine.CEN.PROFILES["654"], 2000, 7)
    classes = R["classes"]

    # over-determination distribution over ALL classes (structural regularity)
    print("=== structural regularity (all found classes) ===", flush=True)
    from collections import Counter
    overdet = Counter()
    relcount = Counter()
    for cf, info in classes.items():
        edges = info["rep_edges"]
        # relations R = sum over active centers (outdeg-1)
        out = {}
        for u, v in edges:
            out.setdefault(u, set()).add(v)
        Rrel = sum(len(s) - 1 for s in out.values() if len(s) >= 2)
        k = info["nv"]
        dof = 2 * k - 4
        overdet[Rrel - dof] += 1
        relcount[(k, Rrel)] += 1
    print(f"over-determination (R - (2k-4)) distribution: "
          f"{dict(sorted(overdet.items()))}", flush=True)
    print(f"  (>=1 means R >= 2k-3, i.e. more equidistance relations than the "
          f"rigidity DOF 2k-4)", flush=True)
    print(f"(nv, R) pairs: {dict(sorted(relcount.items()))}", flush=True)

    # sample classes to Singular-confirm: 5 four-vertex + 8 five-vertex + 4 six
    by_nv = {4: [], 5: [], 6: []}
    for cf, info in classes.items():
        by_nv.setdefault(info["nv"], []).append((cf, info))
    rng = random.Random(11)
    sample = []
    for nv, n in ((4, 5), (5, 10), (6, 5)):
        grp = by_nv.get(nv, [])
        sample += rng.sample(grp, min(n, len(grp)))
    print(f"\n=== Singular spot-confirm {len(sample)} classes ===", flush=True)
    ok = 0
    bad = 0
    to = 0
    for cf, info in sample:
        cube = cubes[info["rep_cube"]]
        P = info["rep_P"]
        mode, sb, ss = mine.confirm_class(cube, P)
        tag = "OK" if ss is True else ("TIMEOUT" if ss is None else "DISAGREE")
        if ss is True:
            ok += 1
        elif ss is None:
            to += 1
        else:
            bad += 1
        print(f"  nv={info['nv']} ne={info['ne']} mode={mode} "
              f"sing_base_empty={sb} sing_sat_empty={ss} [{tag}]", flush=True)
    print(f"\nSpot-confirm: {ok} confirmed dead, {to} Singular-timeout, "
          f"{bad} DISAGREE (must be 0)", flush=True)


if __name__ == "__main__":
    main()
