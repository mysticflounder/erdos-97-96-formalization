#!/usr/bin/env python3
r"""What the pure equality-atom filter rejects, and why.

`mine_support6.py` found exactly ONE pure equality-atom law in 2930 mined
declarations, at support 5.  That filter is strict: it rejects any law carrying
a hypothesis that is not an explicit R^2 point, a `!=`, or a `dist y u = dist y
v` radius atom.

Some of those rejections are recoverable.  The probe layer already places every
schema ORDER-PRESERVINGLY -- `avoid_probe.build` maps a support-k law onto the
`C(n,k)*2k` cyclic images -- precisely because the strict Kalmanson inequalities
presume the support sits in convex position in that cyclic order.  So a law
whose only non-atom hypothesis is a convexity or cyclic-order hypothesis is
consumable at that placement without weakening anything.

A law carrying a cardinality, membership, packet, or coordinate hypothesis is
NOT consumable: the probe layer is cardinality-free and has no such predicates.

This reports, for every False-concluding candidate with at least two radius
atoms, the head token of each rejected hypothesis, so the recoverable class is
measured rather than assumed.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path

HERE = Path(__file__).resolve().parent

from mine_support6 import PLANAR, binders, dist_pair, harvest  # noqa: E402

# Hypotheses the order-preserving placement already encodes.
ORDER_HEADS = {"ConvexIndep", "ConvexPosition", "Convex", "InGeneralPosition",
               "CyclicOrder", "Sbtw", "Wbtw", "convexIndep"}


def head(body):
    tokens = body.replace("(", " ").replace(")", " ").split()
    return tokens[0] if tokens else "?"


def profile(stmt):
    """(support, n_atoms, rejected_heads) for a False-concluding statement."""
    if not stmt.rstrip().endswith("False"):
        return None
    points, atoms, rejected = [], 0, []
    for explicit, names, body in binders(stmt):
        if any(body.strip() == p for p in PLANAR):
            if explicit:
                points.extend(names)
            else:
                rejected.append("implicit-point")
            continue
        if "≠" in body or "!=" in body:
            continue
        if "=" in body:
            lhs, rhs = body.split("=", 1)
            if dist_pair(lhs) is not None and dist_pair(rhs) is not None:
                dl, dr = dist_pair(lhs), dist_pair(rhs)
                if len(set(dl) & set(dr)) == 1:
                    atoms += 1
                    continue
        rejected.append(head(body))
    return len(points), atoms, rejected


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--laws", type=Path, nargs="+", required=True)
    ap.add_argument("--min-atoms", type=int, default=2)
    ap.add_argument("--out", type=Path)
    args = ap.parse_args()

    records = []
    for path in args.laws:
        harvest(json.loads(path.read_text(encoding="utf-8")), records)
    seen, unique = set(), []
    for rec in records:
        key = (rec["name"], rec["stmt"])
        if key not in seen:
            seen.add(key)
            unique.append(rec)

    heads = Counter()
    recoverable, blocked = [], 0
    with_atoms = 0
    for rec in unique:
        got = profile(rec["stmt"])
        if got is None:
            continue
        support, atoms, rejected = got
        if atoms < args.min_atoms or support == 0:
            continue
        with_atoms += 1
        for h in rejected:
            heads[h] += 1
        if all(h in ORDER_HEADS for h in rejected):
            recoverable.append(dict(name=rec["name"], file=rec["file"],
                                    support=support, n_atoms=atoms,
                                    order_hyps=sorted(set(rejected))))
        else:
            blocked += 1

    print(f"{len(unique)} declarations; {with_atoms} False-concluding with "
          f">= {args.min_atoms} radius atoms", flush=True)
    print(f"  order-placeable (only convexity/order hypotheses): "
          f"{len(recoverable)}", flush=True)
    print(f"  blocked (cardinality / membership / packet / coords): "
          f"{blocked}", flush=True)
    print("\nrejected hypothesis heads, most common first:", flush=True)
    for h, c in heads.most_common(30):
        mark = "  <-- order-placeable" if h in ORDER_HEADS else ""
        print(f"  {c:5d}  {h}{mark}", flush=True)
    if recoverable:
        print("\nrecoverable laws:", flush=True)
        for r in sorted(recoverable, key=lambda r: -r["support"]):
            print(f"  [k={r['support']}] {r['n_atoms']} atoms  {r['name']}  "
                  f"{r['order_hyps']}  {r['file']}", flush=True)
    if args.out:
        args.out.write_text(json.dumps(
            dict(recoverable=recoverable, heads=heads.most_common()),
            indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
