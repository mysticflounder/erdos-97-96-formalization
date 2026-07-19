#!/usr/bin/env python3
"""Find the conditioning predicate of the 53 non-universal round-3 laws.

Finding 14b showed the round-2 (p2a,p2b,s1) law kills iff the two p-points
share a bag.  These 53 patterns are the round-3 analogues (mostly p-p cross
rows).  For each conditional pattern, cross-tab kill/SAT over every
buildable base against candidate structural predicates and report any that
separates perfectly.

Bag of a point = the block it sits in: S-bag (block 1) or O1-bag (block 3);
a p-point merged with O is 'mrg' (absent from both bags, decoration r2*-O
etc.).  Predicates tried, in order, for pattern (u, uc, m):
  same_bag(u, uc), same_bag(u, m), same_bag(uc, m),
  bag(u), bag(uc), bag(m), and the pair placements.
"""

import gzip
import json
from collections import defaultdict


def load_verdicts():
    """(u,uc,m) -> {base_id: verdict} over every built base."""
    by_pat = defaultdict(dict)
    with gzip.open("l2u_round3_scale_ledger.jsonl.gz", "rt") as fh:
        for line in fh:
            row = json.loads(line)
            sid = row["schema_id"]
            head, tail = sid.split(".U.")
            base = head[len("l2u."):]
            u, _, uc, _, m = tail.split(".")
            by_pat[(u, uc, m)][base] = row["verdict"]
    return by_pat


def bag_of(schema, pt):
    for bi, blk in enumerate(schema["blocks"]):
        if pt in blk["points"]:
            return {1: "S", 3: "O1"}.get(bi, f"blk{bi}")
    return "mrg"  # absent (merged with O)


def predicates(schema, u, uc, m):
    bu, buc, bm = bag_of(schema, u), bag_of(schema, uc), bag_of(schema, m)
    return {
        "same_bag(u,uc)": bu == buc and bu != "mrg",
        "same_bag(u,m)": bu == bm and bu != "mrg",
        "same_bag(uc,m)": buc == bm and buc != "mrg",
        "bag(u)=S": bu == "S",
        "bag(uc)=S": buc == "S",
        "bag(m)=S": bm == "S",
        "bag(u)=O1": bu == "O1",
        "bag(uc)=O1": buc == "O1",
        "u_mrg": bu == "mrg",
        "uc_mrg": buc == "mrg",
        "m_mrg": bm == "mrg",
    }


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

    print(f"{len(conditional)} conditional patterns\n")
    solved, unsolved = [], []
    for key, pat, d, nk in conditional:
        u, uc, m = pat
        verds = by_pat[pat]
        # collect per-predicate 2x2 (pred True/False) x (kill/sat)
        pred_score = {}
        for base, v in verds.items():
            sch = schemas[base]
            preds = predicates(sch, u, uc, m)
            for pname, pval in preds.items():
                s = pred_score.setdefault(pname, [[0, 0], [0, 0]])
                s[0 if pval else 1][0 if v == "unsat" else 1] += 1
        # a predicate separates perfectly if kills all on one side, sat all other
        best = None
        for pname, ((tk, ts), (fk, fs)) in pred_score.items():
            # pred == kill  (True->all kill, False->all sat)
            if ts == 0 and fk == 0 and tk > 0 and fs > 0:
                best = (pname, "kill iff TRUE"); break
            # pred == sat
            if tk == 0 and fs == 0 and ts > 0 and fk > 0:
                best = ("NOT " + pname, "kill iff FALSE"); break
        if best:
            solved.append((key, nk, d, best[0]))
        else:
            unsolved.append((key, nk, d, pred_score))

    print(f"== SOLVED by a single predicate [{len(solved)}] ==")
    for key, nk, d, pred in solved:
        print(f"  {key:22s} {nk:4d}/{d:<4d}  kill iff  {pred}")
    print(f"\n== UNSOLVED by single predicate [{len(unsolved)}] ==")
    for key, nk, d, ps in unsolved:
        # show the best near-miss predicate (min misclassified)
        near = min(
            ps.items(),
            key=lambda kv: min(kv[1][0][1] + kv[1][1][0],
                               kv[1][0][0] + kv[1][1][1]),
        )
        pn, ((tk, ts), (fk, fs)) = near
        print(f"  {key:22s} {nk:4d}/{d:<4d}  near:{pn} "
              f"[T:{tk}k/{ts}s F:{fk}k/{fs}s]")


if __name__ == "__main__":
    main()
