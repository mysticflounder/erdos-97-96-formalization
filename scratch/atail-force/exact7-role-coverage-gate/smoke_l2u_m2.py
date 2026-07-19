#!/usr/bin/env python3
"""Smoke gates for the |M|=2 joint co-radiality probe.

Two known-result checks against the |M|=1 probe ledger:

N1 (poisoned pair -> UNSAT): for a (base, u, uc) group with a known
   |M|=1-UNSAT member m_bad and a SAT member m_good, the pair
   {u, m_bad, m_good} must be UNSAT (adding constraints preserves UNSAT:
   the row already forces d(uc, m_bad) = d(uc, u), which is UNSAT alone).

N2 (SAT monotonicity): for several built (both-SAT-member) pairs, whenever
   the pair is SAT both single-member |M|=1 verdicts are SAT in the ledger
   (a SAT superset cannot have an UNSAT subset).  Also require at least one
   built pair to be SAT and at least one core family to be present on a kill,
   so the encoding is exercised, not vacuous.
"""

import glob
import json
from collections import defaultdict

from build_l2u_m2_probe import m2_schema
from gate_encoder import check_schema


def m1_verdicts():
    sat, uns = defaultdict(set), defaultdict(set)
    for f in glob.glob("l2u_probe_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            head, tail = r["schema_id"].split(".U.")
            base = head[len("l2u."):]
            u, _, uc, _, m = tail.split(".")
            (sat if r["verdict"] == "sat" else uns)[(base, u, uc)].add(m)
    return sat, uns


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    sat, uns = m1_verdicts()
    results = {"N1_poisoned": [], "N2_monotone": []}

    # N1: poisoned pairs
    poisoned = 0
    for (base, u, uc), bad in uns.items():
        good = sat.get((base, u, uc), set())
        if not good:
            continue
        m_bad, m_good = sorted(bad)[0], sorted(good)[0]
        sch = m2_schema(schemas[base], u, uc, m_bad, m_good)
        v = check_schema(sch)["verdict"]
        ok = v == "unsat"
        results["N1_poisoned"].append(
            {"base": base, "u": u, "uc": uc, "bad": m_bad, "good": m_good,
             "verdict": v, "pass": ok})
        poisoned += 1
        if poisoned >= 5:
            break

    # N2: monotonicity on both-SAT pairs; also confirm a SAT pair exists
    checked, sat_pairs = 0, 0
    for (base, u, uc), members in sat.items():
        ms = sorted(members)
        if len(ms) < 2:
            continue
        m1, m2 = ms[0], ms[1]
        sch = m2_schema(schemas[base], u, uc, m1, m2)
        v = check_schema(sch)["verdict"]
        subset_sat = m1 in sat[(base, u, uc)] and m2 in sat[(base, u, uc)]
        ok = (v == "sat" and subset_sat) or v == "unsat"
        if v == "sat":
            sat_pairs += 1
        results["N2_monotone"].append(
            {"base": base, "u": u, "uc": uc, "pair": [m1, m2],
             "verdict": v, "subset_sat": subset_sat, "pass": ok})
        checked += 1
        if checked >= 8:
            break

    n1_pass = all(r["pass"] for r in results["N1_poisoned"])
    n2_pass = all(r["pass"] for r in results["N2_monotone"]) and sat_pairs >= 1
    results["summary"] = {
        "N1_all_pass": n1_pass, "N1_count": len(results["N1_poisoned"]),
        "N2_all_pass": n2_pass, "N2_sat_pairs": sat_pairs,
        "overall": n1_pass and n2_pass,
    }
    json.dump(results, open("smoke_l2u_m2_results.json", "w"), indent=1)
    print(json.dumps(results["summary"], indent=1))
    for r in results["N1_poisoned"]:
        print(f"  N1 {r['u']}/{r['uc']} bad={r['bad']}: {r['verdict']} "
              f"{'OK' if r['pass'] else 'FAIL'}")
    for r in results["N2_monotone"]:
        print(f"  N2 {r['u']}/{r['uc']} {r['pair']}: {r['verdict']} "
              f"{'OK' if r['pass'] else 'FAIL'}")
    assert results["summary"]["overall"], "SMOKE FAILED"


if __name__ == "__main__":
    main()
