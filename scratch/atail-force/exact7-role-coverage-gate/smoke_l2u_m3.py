#!/usr/bin/env python3
"""Smoke gates for the |M|=3 4-co-radial census.

N1 (poisoned triple -> UNSAT): a triple containing a known |M|=2-UNSAT pair
   must be UNSAT (adding the third member only tightens; the killed pair
   already forces UNSAT).

N2 (monotonicity): for several real triangles, whenever the |M|=3 verdict is
   SAT, all three sub-pairs are |M|=2-SAT (a SAT superset has no UNSAT
   subset).  A verdict of UNSAT is always consistent.
"""

import glob
import json
from collections import defaultdict

from build_l2u_m3 import m3_schema, all_triangles
from build_l2u_m2_probe import m2_schema
from gate_encoder import check_schema


def m2_verdicts():
    v = {}
    for f in glob.glob("l2u_m2_probe_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            head, tail = r["schema_id"].split(".U.")
            base = head[len("l2m2."):]
            u, _, uc, _, pair = tail.split(".")
            m1, m2 = pair.split("-")
            v[(base, u, uc, frozenset((m1, m2)))] = r["verdict"]
    return v


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    m2v = m2_verdicts()

    # group |M|=2-SAT members and killed pairs per (base,u,uc)
    sat_mem = defaultdict(set)
    killed_pairs = defaultdict(list)
    for (base, u, uc, pair), verd in m2v.items():
        a, b = tuple(pair)
        sat_mem[(base, u, uc)].update((a, b))
        if verd == "unsat":
            killed_pairs[(base, u, uc)].append((a, b))

    results = {"N1": [], "N2": []}

    # N1: poisoned triples — killed pair + a third SAT member
    n1 = 0
    for key, kps in killed_pairs.items():
        base, u, uc = key
        others = sat_mem[key] - set(kps[0])
        if not others:
            continue
        a, b = kps[0]
        c = sorted(others)[0]
        tri = tuple(sorted((a, b, c)))
        v = check_schema(m3_schema(schemas[base], u, uc, tri))["verdict"]
        results["N1"].append({"key": [base, u, uc], "tri": list(tri),
                              "killed_pair": [a, b], "verdict": v,
                              "pass": v == "unsat"})
        n1 += 1
        if n1 >= 5:
            break

    # N2: real triangles — monotonicity
    n2, sat_count = 0, 0
    for base_id, u, uc, tri in all_triangles():
        v = check_schema(m3_schema(schemas[base_id], u, uc, tri))["verdict"]
        subs_sat = all(
            m2v.get((base_id, u, uc, frozenset(p)), "sat") == "sat"
            for p in ((tri[0], tri[1]), (tri[0], tri[2]), (tri[1], tri[2]))
        )
        ok = (v == "unsat") or subs_sat
        if v == "sat":
            sat_count += 1
        results["N2"].append({"key": [base_id, u, uc], "tri": list(tri),
                              "verdict": v, "subs_sat": subs_sat, "pass": ok})
        n2 += 1
        if n2 >= 10:
            break

    n1_pass = all(r["pass"] for r in results["N1"]) and results["N1"]
    n2_pass = all(r["pass"] for r in results["N2"])
    results["summary"] = {"N1_pass": bool(n1_pass), "N1_count": len(results["N1"]),
                          "N2_pass": n2_pass, "N2_sat_triples": sat_count,
                          "overall": bool(n1_pass) and n2_pass}
    json.dump(results, open("smoke_l2u_m3_results.json", "w"), indent=1)
    print(json.dumps(results["summary"], indent=1))
    for r in results["N1"]:
        print(f"  N1 {r['key'][1]}/{r['key'][2]} kp={r['killed_pair']}: "
              f"{r['verdict']} {'OK' if r['pass'] else 'FAIL'}")
    for r in results["N2"]:
        print(f"  N2 {r['key'][1]}/{r['key'][2]} {r['tri']}: "
              f"{r['verdict']} {'OK' if r['pass'] else 'FAIL'}")
    assert results["summary"]["overall"], "SMOKE FAILED"


if __name__ == "__main__":
    main()
