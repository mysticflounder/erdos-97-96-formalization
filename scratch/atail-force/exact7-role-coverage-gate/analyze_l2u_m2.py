#!/usr/bin/env python3
"""Compatibility-graph closure analysis of the |M|=2 joint co-radiality census.

Per (base, u, uc):
  nodes = |M|=1-SAT members (l2u_probe_ledger; individually co-radial with u),
  edges = |M|=2-SAT pairs (l2u_m2_probe_ledger; jointly co-radial with u).
The forced unused critical row is a full 4-class (u + 3 co-radial members),
so it needs 3 pairwise-co-radial members = a TRIANGLE in this graph.

Soundness (one-sided): a triangle-free (u, uc) is ROW-DEAD (no 3 members can
even pairwise coexist, a fortiori no 4-class row).  A base whose every (u, uc)
group is triangle-free (or has < 3 nodes) is CLOSED.  A triangle only means a
candidate row survives the |M|=2 layer — the triple still needs |M|=3 (joint)
+ exclusion + no_qfree, so triangles are inconclusive, not closures.

Outputs l2u_m2_kills.json (per-pair kills + minimal cores) and prints the
triangle census: dead groups, surviving triangle counts, and any closed base.
"""

import glob
import json
from collections import defaultdict


def load_m1_nodes():
    nodes = defaultdict(set)
    for f in glob.glob("l2u_probe_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            head, tail = r["schema_id"].split(".U.")
            base = head[len("l2u."):]
            u, _, uc, _, m = tail.split(".")
            if r["verdict"] == "sat":
                nodes[(base, u, uc)].add(m)
    return nodes


def load_m2_edges():
    edges = defaultdict(dict)   # (base,u,uc) -> {frozenset({m1,m2}): verdict}
    kills = []
    for f in glob.glob("l2u_m2_probe_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            head, tail = r["schema_id"].split(".U.")
            base = head[len("l2m2."):]
            u, _, uc, _, pair = tail.split(".")
            m1, m2 = pair.split("-")
            edges[(base, u, uc)][frozenset((m1, m2))] = r["verdict"]
            if r["verdict"] == "unsat":
                kills.append({"base": base, "u": u, "uc": uc,
                              "pair": [m1, m2], "core": r.get("core", []),
                              "core_size": r.get("core_size")})
    return edges, kills


def triangles(nodes, edge_ok):
    """Count triangles in the graph on `nodes` with adjacency `edge_ok(a,b)`."""
    ns = sorted(nodes)
    tri = 0
    examples = []
    for i in range(len(ns)):
        for j in range(i + 1, len(ns)):
            if not edge_ok(ns[i], ns[j]):
                continue
            for k in range(j + 1, len(ns)):
                if edge_ok(ns[i], ns[k]) and edge_ok(ns[j], ns[k]):
                    tri += 1
                    if len(examples) < 3:
                        examples.append((ns[i], ns[j], ns[k]))
    return tri, examples


def main():
    nodes = load_m1_nodes()
    edges, kills = load_m2_edges()
    json.dump(kills, open("l2u_m2_kills.json", "w"))

    total_pairs = sum(len(v) for v in edges.values())
    n_kill = len(kills)
    print(f"|M|=2 pairs censused: {total_pairs}  kills: {n_kill} "
          f"({100*n_kill/total_pairs:.1f}%)\n")

    per_base = defaultdict(list)   # base -> [(u,uc,ntri,nodecount)]
    dead_groups = 0
    for key, mem in nodes.items():
        base, u, uc = key
        eg = edges.get(key, {})

        def ok(a, b):
            return eg.get(frozenset((a, b)), "sat") == "sat"

        if len(mem) < 3:
            ntri, ex = 0, []
        else:
            ntri, ex = triangles(mem, ok)
        per_base[base].append((u, uc, ntri, len(mem)))
        if ntri == 0:
            dead_groups += 1

    total_groups = sum(len(v) for v in per_base.values())
    print(f"(base,u,uc) groups: {total_groups}  triangle-free (row-dead): "
          f"{dead_groups}\n")

    closed = [b for b, gs in per_base.items() if all(t == 0 for _, _, t, _ in gs)]
    print(f"CLOSED bases (every group triangle-free): {len(closed)}")
    for b in closed:
        print(f"  {b}")

    # per-base surviving-group summary
    print("\nper base: triangle-free groups / total groups  (min surviving tri)")
    for b in sorted(per_base):
        gs = per_base[b]
        dead = sum(1 for _, _, t, _ in gs if t == 0)
        surviving = [t for _, _, t, _ in gs if t > 0]
        mn = min(surviving) if surviving else 0
        print(f"  {b:44s} {dead:3d}/{len(gs):<3d}  min_surv_tri={mn}")

    json.dump(
        {"total_pairs": total_pairs, "kills": n_kill,
         "groups": total_groups, "dead_groups": dead_groups,
         "closed_bases": closed,
         "per_base": {b: [{"u": u, "uc": uc, "triangles": t, "nodes": n}
                          for (u, uc, t, n) in gs]
                      for b, gs in per_base.items()}},
        open("l2u_m2_closure.json", "w"), indent=0)


if __name__ == "__main__":
    main()
