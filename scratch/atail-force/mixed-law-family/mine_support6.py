#!/usr/bin/env python3
r"""Find LEAN-PROVEN laws in the pure equality-atom shape, at every support.

The covering route is closed below support 6: `pattern_family.py` decided every
complete pattern at supports 4 and 5 and found zero geometric content, and
`orderfree_probe.py` measured that the complete support-<=5 bank is still SAT at
n = 10 even placed over all k! images.  The required content is support >= 6,
and mining it from the support-local relaxation costs 29.4M clauses at n = 10.

But a support-6 law does not have to be MINED.  `proven-metric-laws.json` holds
131 planar `... : False` theorems already proven in this repo's Lean banks.  Any
one of them in the pure equality-atom shape

    (points : R^2) (distinctness) (dist y u = dist y v)... : False

is a law the probe layer can consume directly, and it enters as a THEOREM rather
than as relaxation evidence.  `u1TwoLargeCapObstruction` is the only one anyone
has checked; it is support 5.  This checks all 131.

Parsing is plain tokenization, not regex: split the binder block on `)`, keep
binders whose body is an `=` between two `dist` applications or a `!=`.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent

PLANAR = ("ℝ²", "EuclideanSpace ℝ (Fin 2)")


def binders(stmt):
    """(explicit?, names, body) for each binder group in a theorem statement."""
    out = []
    i = 0
    while i < len(stmt):
        ch = stmt[i]
        if ch not in "({":
            i += 1
            continue
        close = ")" if ch == "(" else "}"
        depth = 0
        j = i
        while j < len(stmt):
            if stmt[j] in "({":
                depth += 1
            elif stmt[j] in ")}":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        if j >= len(stmt):
            break
        inner = stmt[i + 1:j]
        if ":" in inner:
            names, body = inner.split(":", 1)
            out.append((ch == "(", names.split(), body.strip()))
        i = j + 1
    return out


def dist_pair(term):
    """('dist a b') -> ('a','b'), else None.  No regex; token split."""
    t = term.strip()
    if not t.startswith("dist "):
        return None
    parts = t[5:].split()
    if len(parts) != 2:
        return None
    if any(c in parts[0] + parts[1] for c in "()^/+*"):
        return None
    return parts[0], parts[1]


def classify(stmt):
    """Pure equality-atom law -> (points, atoms, distinct); else None."""
    if not stmt.rstrip().endswith("False"):
        return None
    points, atoms, distinct = [], [], []
    for explicit, names, body in binders(stmt):
        if any(body.strip() == p for p in PLANAR):
            if not explicit:
                return None          # implicit points: not a placeable law
            points.extend(names)
            continue
        # `≠` is one codepoint, so test it BEFORE the `=` guard.
        if "≠" in body or "!=" in body:
            sep = "≠" if "≠" in body else "!="
            lhs, rhs = body.split(sep, 1)
            distinct.append((lhs.strip(), rhs.strip()))
            continue
        if "=" not in body:
            return None              # a non-equational hypothesis
        lhs, rhs = body.split("=", 1)
        dl, dr = dist_pair(lhs), dist_pair(rhs)
        if dl is None or dr is None:
            return None              # an equation that is not dist = dist
        # dist y u = dist y v : a radius atom centered at the shared point.
        shared = set(dl) & set(dr)
        if len(shared) != 1:
            return None              # not a common-center radius atom
        y = shared.pop()
        u = (set(dl) - {y}).pop()
        v = (set(dr) - {y}).pop()
        atoms.append((y, u, v))
    if not points or not atoms:
        return None
    named = set(points)
    for y, u, v in atoms:
        if not {y, u, v} <= named:
            return None
    for a, b in distinct:
        if not {a, b} <= named:
            return None
    return points, atoms, distinct


def harvest(node, out):
    """Every {name, statement-ish, path} triple anywhere in a census JSON."""
    if isinstance(node, dict):
        stmt = node.get("statement") or node.get("stmt")
        if isinstance(stmt, str) and stmt.startswith("theorem "):
            out.append(dict(name=node.get("name") or node.get("fq_name", "?"),
                            file=node.get("path") or node.get("file", "?"),
                            stmt=stmt,
                            proof_status=node.get("proof_status", "?")))
        for value in node.values():
            harvest(value, out)
    elif isinstance(node, list):
        for value in node:
            harvest(value, out)
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--laws", type=Path, nargs="+",
                    default=[HERE / "proven-metric-laws.json"])
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
    records = unique
    hits = []
    for rec in records:
        got = classify(rec.get("stmt", ""))
        if got is None:
            continue
        points, atoms, distinct = got
        idx = {p: i for i, p in enumerate(points)}
        hits.append(dict(
            name=rec["name"], file=rec["file"],
            support=len(points), points=points,
            atoms=[[idx[y], idx[u], idx[v]] for y, u, v in atoms],
            distinct=[[idx[a], idx[b]] for a, b in distinct],
            proof_status=rec.get("proof_status", "?"),
            n_atoms=len(atoms)))

    hits.sort(key=lambda h: (-h["support"], -h["n_atoms"]))
    print(f"{len(records)} laws scanned; "
          f"{len(hits)} in pure equality-atom shape", flush=True)
    by_support = {}
    for h in hits:
        by_support.setdefault(h["support"], []).append(h)
    for k in sorted(by_support, reverse=True):
        print(f"  support {k}: {len(by_support[k])}", flush=True)
    for h in hits:
        if h["support"] >= 6:
            print(f"    [k={h['support']}] {h['name']}  "
                  f"{h['n_atoms']} atoms  {h['file']}", flush=True)
    if args.out:
        args.out.write_text(json.dumps(dict(laws=hits), indent=1) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
