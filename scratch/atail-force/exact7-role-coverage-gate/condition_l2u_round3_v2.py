#!/usr/bin/env python3
"""Compound-placement conditioning for the 22 single-predicate-unsolved laws.

For each still-conditional pattern (u, uc, m), tabulate the verdict against
the full bag-placement tuple (bag(u), bag(uc), bag(m)) and test whether the
kill is a FUNCTION of that tuple (every base with the same placement tuple
has the same verdict).  If so, the law is a pure placement law and we print
its truth table; otherwise report residual mixing (a deeper coupling).
"""

import gzip
import json
from collections import defaultdict

from condition_l2u_round3 import load_verdicts, bag_of


def main():
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    denom = json.load(open("l2u_round3_denominators.json"))
    by_pat = load_verdicts()

    conditional = []
    for key, d in denom.items():
        pat = tuple(key.split(","))
        verds = by_pat.get(pat, {})
        nk = sum(1 for v in verds.values() if v == "unsat")
        if 0 < nk < d:
            conditional.append((key, pat, d, nk))
    conditional.sort()

    pure, mixed = [], []
    for key, pat, d, nk in conditional:
        u, uc, m = pat
        verds = by_pat[pat]
        table = defaultdict(lambda: [0, 0])  # tuple -> [kill, sat]
        for base, v in verds.items():
            sch = schemas[base]
            t = (bag_of(sch, u), bag_of(sch, uc), bag_of(sch, m))
            table[t][0 if v == "unsat" else 1] += 1
        is_pure = all(k == 0 or s == 0 for k, s in table.values())
        (pure if is_pure else mixed).append((key, nk, d, dict(table)))

    print(f"== PURE placement laws (verdict = f(bag(u),bag(uc),bag(m))) "
          f"[{len(pure)}] ==")
    for key, nk, d, table in pure:
        kill_tuples = sorted(t for t, (k, s) in table.items() if k > 0)
        print(f"  {key:20s} {nk:4d}/{d:<4d}  KILL when "
              f"(bag u,uc,m) in {kill_tuples}")
    print(f"\n== MIXED (placement-tuple not sufficient) [{len(mixed)}] ==")
    for key, nk, d, table in mixed:
        bad = {t: v for t, v in table.items() if v[0] and v[1]}
        print(f"  {key:20s} {nk:4d}/{d:<4d}  mixed tuples: "
              f"{ {t: f'{k}k/{s}s' for t,(k,s) in bad.items()} }")


if __name__ == "__main__":
    main()
