"""Summarize cells.jsonl for REPORT.md (coverage, verdicts, distributions).

Usage: uv run python analyze_cells.py
"""

from __future__ import annotations

import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import run_main as M

HERE = Path(__file__).resolve().parent

recs = []
with (HERE / "cells.jsonl").open() as fh:
    for line in fh:
        line = line.strip()
        if line:
            recs.append(json.loads(line))

specs = M.enumerate_specs(["P4U", "P4S", "P2"])
total = len(specs)
seen = Counter(M.key_of(r) for r in recs)
dupes = {k: n for k, n in seen.items() if n > 1}
print(f"records: {len(recs)}  distinct: {len(seen)}  domain: {total}")
if dupes:
    print(f"WARNING duplicate keys: {len(dupes)}")
missing = [s for s in specs if M.key_of(s) not in seen]
print(f"coverage: {len(seen)}/{total} ({len(missing)} missing)")

by_family_verdict = Counter((r["family"], r["verdict"]) for r in recs)
print("\nverdicts by family:")
for (fam, v), n in sorted(by_family_verdict.items()):
    print(f"  {fam:4s} {v:10s} {n}")

survivors = [r for r in recs if r["verdict"] == "survived"]
capped = [r for r in recs if r["verdict"] == "capped"]
gate_false = [r for r in recs if r["verdict"] == "gate_false"]
print(f"\nsurvived: {len(survivors)}  capped: {len(capped)}  gate_false: {len(gate_false)}")
for r in survivors:
    print("  SURVIVOR:", M.key_of(r), "support", r["support"], "sig", r.get("sig"))
for r in capped:
    print("  CAPPED:", M.key_of(r), "nodes", r["nodes"])

killed = [r for r in recs if r["verdict"] == "killed"]
if killed:
    nodes = sorted(r["nodes"] for r in killed)
    secs = sorted(r["secs"] for r in killed)

    def pct(xs, p):
        return xs[min(len(xs) - 1, int(p * len(xs)))]

    print(
        f"\nnodes per killed search: min {nodes[0]}  median {pct(nodes, .5)}  "
        f"p90 {pct(nodes, .9)}  p99 {pct(nodes, .99)}  max {nodes[-1]}  "
        f"total {sum(nodes)}"
    )
    print(
        f"secs per killed search:  min {secs[0]}  median {pct(secs, .5)}  "
        f"p90 {pct(secs, .9)}  max {secs[-1]}  total {sum(secs):.0f}"
    )

    det = Counter()
    depth = Counter()
    prunes = 0
    for r in killed:
        for k, v in r["kills_by_detector"].items():
            det[k] += v
        for k, v in r["kills_by_depth"].items():
            depth[int(k)] += v
        prunes += r["empty_prunes"]
    tot_kills = sum(det.values())
    print(f"\ndetector kills across all killed searches (total {tot_kills}):")
    for k, v in det.most_common():
        print(f"  {k:10s} {v}  ({100*v/tot_kills:.1f}%)")
    print(f"empty-domain prunes: {prunes}")
    print("prefix-kill depth histogram (depth = assigned rows incl. seed):")
    for d in sorted(depth):
        print(f"  depth {d:2d}: {depth[d]}")

    md = Counter(r["max_depth"] for r in killed)
    print("max search depth per killed search:")
    for d in sorted(md):
        print(f"  depth {d:2d}: {md[d]}")

    # per-family node medians
    print("\nper-family killed-search node counts:")
    fams = defaultdict(list)
    for r in killed:
        fams[(r["family"], r["c0"])].append(r["nodes"])
    for k in sorted(fams):
        xs = sorted(fams[k])
        print(
            f"  {k[0]:4s} c0={k[1]:2d}: n={len(xs)} median {pct(xs, .5)} "
            f"p99 {pct(xs, .99)} max {xs[-1]}"
        )
