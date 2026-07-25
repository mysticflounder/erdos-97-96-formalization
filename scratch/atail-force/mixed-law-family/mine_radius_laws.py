#!/usr/bin/env python3
r"""Lean-proven laws that are pure equality-atom laws once `r` is eliminated.

`mine_support6.py` found exactly one pure equality-atom law in 2930 mined
declarations, at support 5.  That filter was too strict on two counts, both of
which are Lean elaboration details rather than mathematical content:

  1. It required EXPLICIT point binders.  `{p q a b c u x y : ℝ²}` is the same
     law as `(p q a b c u x y : ℝ²)`; implicit-vs-explicit changes nothing about
     what the hypotheses say.

  2. It required every equation to be `dist = dist`.  The large families in the
     `p97-rvol` bank instead bind a scalar `{r : ℝ} (hr : 0 < r)` and write

         (hpq : dist p q = r) (hpa : dist p a = r) (hpb : dist p b = r)

     which says exactly that q, a, b are equidistant from p -- three radius
     atoms centered at p, with r a witness that transitivity eliminates.

`r` is eliminable IF AND ONLY IF the `= r` edges share a common vertex, i.e.
form a star.  A star at p gives center atoms (p, q, a), (p, q, b), ... .  If the
`= r` edges do NOT form a star -- say `dist p q = r` and `dist t1 t2 = r` on
disjoint pairs -- then r asserts a UNIT-DISTANCE equality between two edges with
no shared endpoint.  The probe layer's variables are `eq_{center}_{left}_{right}`
and cannot express that, so such a law is reported separately and NOT emitted.

Emitted laws are in exactly the shape `avoid_probe.build` consumes, so a
support->=6 hit is the content the covering-route measurement showed is required,
arriving as a Lean THEOREM rather than as relaxation mining.
"""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent

from mine_support6 import PLANAR, binders, dist_pair, harvest  # noqa: E402

SCALAR = ("ℝ",)


def star_center(edges):
    """The common vertex of a set of unordered pairs, or None if not a star."""
    if not edges:
        return None
    common = set(edges[0])
    for e in edges[1:]:
        common &= set(e)
    if len(common) == 1:
        return common.pop()
    return None


def classify(stmt):
    """-> dict(points, atoms, distinct) | ('nonstar', name) | None."""
    if not stmt.rstrip().endswith("False"):
        return None
    points, scalars = [], set()
    atoms, distinct = [], []
    radius_edges = defaultdict(list)      # scalar -> [(u, v), ...]
    for _explicit, names, body in binders(stmt):
        b = body.strip()
        if any(b == p for p in PLANAR):
            points.extend(names)
            continue
        if any(b == s for s in SCALAR):
            scalars.update(names)
            continue
        if "≠" in body or "!=" in body:
            sep = "≠" if "≠" in body else "!="
            lhs, rhs = body.split(sep, 1)
            distinct.append((lhs.strip(), rhs.strip()))
            continue
        tokens = b.split()
        # `0 < r` positivity on a bound scalar: carried by the probe layer's
        # own positivity axiom, so it is not extra content.
        if len(tokens) == 3 and tokens[1] == "<" and tokens[2] in scalars:
            continue
        if "=" not in body:
            return None
        lhs, rhs = body.split("=", 1)
        dl, dr = dist_pair(lhs), dist_pair(rhs)
        if dl is not None and dr is not None:
            shared = set(dl) & set(dr)
            if len(shared) != 1:
                return None           # dist a b = dist c d, no shared center
            y = shared.pop()
            atoms.append((y, (set(dl) - {y}).pop(), (set(dr) - {y}).pop()))
            continue
        if dl is not None and rhs.strip() in scalars:
            radius_edges[rhs.strip()].append(dl)
            continue
        if dr is not None and lhs.strip() in scalars:
            radius_edges[lhs.strip()].append(dr)
            continue
        return None

    nonstar = False
    for scalar, edges in radius_edges.items():
        centre = star_center(edges)
        if centre is None:
            nonstar = True
            continue
        rim = [(set(e) - {centre}).pop() for e in edges]
        for other in rim[1:]:
            atoms.append((centre, rim[0], other))
    if nonstar:
        return "nonstar"
    if not points or not atoms:
        return None
    named = set(points)
    for y, u, v in atoms:
        if not {y, u, v} <= named or len({y, u, v}) != 3:
            return None
    for a, b in distinct:
        if not {a, b} <= named:
            return None
    return dict(points=points, atoms=atoms, distinct=distinct)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--laws", type=Path, nargs="+", required=True)
    ap.add_argument("--min-support", type=int, default=6)
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

    hits, nonstar = [], 0
    for rec in unique:
        got = classify(rec["stmt"])
        if got == "nonstar":
            nonstar += 1
            continue
        if not isinstance(got, dict):
            continue
        idx = {p: i for i, p in enumerate(got["points"])}
        atoms = sorted({(idx[y], min(idx[u], idx[v]), max(idx[u], idx[v]))
                        for y, u, v in got["atoms"]})
        hits.append(dict(
            name=rec["name"], file=rec["file"],
            support=len(got["points"]), points=got["points"],
            atoms=[list(a) for a in atoms],
            distinct=[[idx[a], idx[b]] for a, b in got["distinct"]],
            n_atoms=len(atoms)))

    hits.sort(key=lambda h: (-h["support"], -h["n_atoms"]))
    by_support = defaultdict(int)
    for h in hits:
        by_support[h["support"]] += 1
    print(f"{len(unique)} declarations scanned", flush=True)
    print(f"  pure equality-atom after r-elimination: {len(hits)}", flush=True)
    print(f"  rejected: non-star radius family (unit-distance, "
          f"not center-expressible): {nonstar}", flush=True)
    for k in sorted(by_support, reverse=True):
        print(f"    support {k}: {by_support[k]}", flush=True)
    print(f"\nsupport >= {args.min_support}:", flush=True)
    for h in hits:
        if h["support"] >= args.min_support:
            print(f"  [k={h['support']}] {h['n_atoms']} atoms, "
                  f"{len(h['distinct'])} distinctness  {h['name']}",
                  flush=True)
    if args.out:
        args.out.write_text(json.dumps(dict(laws=hits), indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
