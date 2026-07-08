#!/usr/bin/env python3
"""Smoke gates for the multi-center joint census implementation."""
from __future__ import annotations

import json
import os
import sys
from itertools import combinations

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "census", "q3_two_center"))

import multi_center_census as mc  # noqa: E402
import q3_token as q3  # noqa: E402


def s1_composition_reproduction() -> dict:
    expected = json.load(open(os.path.join(ROOT, "census", "q3_two_center",
                                           "q3_token_proven.json")))
    mismatches = []
    total_nodes = 0
    for n in range(12, 17):
        for profile in q3.profiles_for(n):
            got = mc.solve_global(profile, mc.PROVEN_ROWS, max_nodes=4_000_000)
            total_nodes += got["nodes"]
            exp_sat = expected[str(n)]["profiles"][str(profile)]["sat"]
            got_sat = got["status"] == "SAT"
            if got_sat != exp_sat:
                mismatches.append({
                    "n": n,
                    "profile": profile,
                    "expected_sat": exp_sat,
                    "got": got,
                })
    return {
        "gate": "S1",
        "pass": not mismatches,
        "profiles_checked": sum(len(q3.profiles_for(n)) for n in range(12, 17)),
        "total_nodes": total_nodes,
        "mismatches": mismatches,
    }


def s2_kill_observation() -> dict:
    frame = mc.build_frame((5, 5, 5))
    # Pair V,W has common cap S, other caps O1/O2.
    v, w = 1, 2
    kq35 = {
        v: frozenset((3, 0, 6, 7)),   # shared intS = 3
        w: frozenset((3, 0, 9, 10)),
    }
    kq31 = {
        v: frozenset((6, 9, 7, 8)),   # shared intO1 = 6, intO2 = 9
        w: frozenset((6, 9, 10, 11)),
    }

    def key_for(assign):
        moser_masks = {z: 0 for z in mc.MOSER}
        cap_counts = {cap: {} for cap in mc.CAPS}
        for z in mc.MOSER:
            mask = 0
            for c, kc in assign.items():
                if z in kc:
                    mask |= mc.bit(c)
            moser_masks[z] = mask
        by_label = {}
        for c, kc in assign.items():
            for z in kc:
                if z >= 3:
                    by_label.setdefault(z, 0)
                    by_label[z] |= mc.bit(c)
        for z, mask in by_label.items():
            cap = frame.cap_of_int[z]
            cap_counts[cap][mask] = cap_counts[cap].get(mask, 0) + 1
        return mc.canon_joint(frame.profile, (v, w), moser_masks, cap_counts, "L1")

    with_kills = mc.l1_local(frame.profile, kills=True)
    without_kills = mc.l1_local(frame.profile, kills=False)
    checks = {}
    for name, assign in (("K-Q3-5", kq35), ("K-Q3-1", kq31)):
        local_ok = all(mc.h1_moser_ok(frame, c, kc) for c, kc in assign.items())
        local_ok = local_ok and len(assign[v] & assign[w]) <= 2
        key = key_for(assign)
        checks[name] = {
            "local_preconditions": local_ok,
            "present_without_kills": key in without_kills,
            "absent_with_kills": key not in with_kills,
        }
    return {
        "gate": "S2",
        "pass": all(all(v for v in row.values()) for row in checks.values()),
        "checks": checks,
    }


def naive_l1_classes(profile: tuple[int, int, int]) -> set[tuple]:
    frame = mc.build_frame(profile)

    def candidates(center: int):
        out = []
        for combo in combinations([q for q in range(frame.n) if q != center], 4):
            fc = frozenset(combo)
            if mc.h1_moser_ok(frame, center, fc):
                out.append(fc)
        return out

    cands = {p: candidates(p) for p in mc.MOSER}
    classes = set()
    for a, b in combinations(mc.MOSER, 2):
        for ka in cands[a]:
            for kb in cands[b]:
                if len(ka & kb) > 2:
                    continue
                if not q3.joint_ok(a, ka, b, kb, frame.caps_int):
                    continue
                moser_masks = {z: 0 for z in mc.MOSER}
                cap_counts = {cap: {} for cap in mc.CAPS}
                for z in mc.MOSER:
                    if z in ka:
                        moser_masks[z] |= mc.bit(a)
                    if z in kb:
                        moser_masks[z] |= mc.bit(b)
                by_label = {}
                for c, kc in ((a, ka), (b, kb)):
                    for z in kc:
                        if z >= 3:
                            by_label.setdefault(z, 0)
                            by_label[z] |= mc.bit(c)
                for z, mask in by_label.items():
                    cap = frame.cap_of_int[z]
                    cap_counts[cap][mask] = cap_counts[cap].get(mask, 0) + 1
                classes.add(mc.canon_joint(profile, (a, b), moser_masks, cap_counts, "L1"))
    return classes


def s3_canonicalization() -> dict:
    profile = (4, 5, 6)
    direct = set(mc.l1_local(profile, kills=True))
    naive = naive_l1_classes(profile)
    return {
        "gate": "S3",
        "pass": direct == naive,
        "profile": profile,
        "direct_count": len(direct),
        "naive_count": len(naive),
        "missing_from_direct": [mc.class_key(k) for k in sorted(naive - direct)[:10]],
        "extra_in_direct": [mc.class_key(k) for k in sorted(direct - naive)[:10]],
    }


def main() -> int:
    results = [s1_composition_reproduction(), s2_kill_observation(),
               s3_canonicalization()]
    out_path = os.path.join(HERE, "smoke_results.json")
    with open(out_path, "w") as f:
        json.dump(results, f, indent=1, sort_keys=True)
        f.write("\n")
    print(json.dumps(results, indent=1, sort_keys=True))
    return 0 if all(r["pass"] for r in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
