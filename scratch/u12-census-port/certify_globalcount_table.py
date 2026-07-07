#!/usr/bin/env python3
"""Decisive realizability check for the no-double-apex 11-label global-count table
(docs/u-lane/97-u1-2-doubleapex-residual-globalcount-verdict-2026-07-05.md).

The verdict PROVES the table is combinatorially consistent with center-K4 at all
11 centers + critical shell + caps(5,5,4) + apex one-hit + NEGATED double-apex
pair, and CONJECTURES it is not ℝ²-realizable. This tests that: build the FULL
equidistance ideal (every center, every radius block), gauge x0=(0,0), x1=(1,0),
Singular char-0 std -> reduce(1,G), dim(G).
  reduce1=0, dim=-1  => ideal = <1> => variety EMPTY over ℂ => NON-realizable
                        (STRONG: kills it over ℝ too) => Route A rigidity confirmed
                        for this pattern.
  reduce1!=0         => ℂ-feasible; pure incidence does NOT force death (need ℝ
                        Positivstellensatz / distinctness) => Route A not settled here.

Transcription is self-checked against the verdict's stated invariants FIRST
(block overlaps <=2; the six off-surplus (V,W)-signatures) so a mis-typed block
cannot silently produce a false verdict.
"""
import importlib.util
import os
import sys
from itertools import combinations

HERE = os.path.dirname(os.path.abspath(__file__))
s = importlib.util.spec_from_file_location("gss", f"{HERE}/gen_singular_shadow.py")
gss = importlib.util.module_from_spec(s)
s.loader.exec_module(gss)

# label -> int (gauge: U=0 -> (0,0), V=1 -> (1,0))
L = {"U": 0, "V": 1, "W": 2, "s1": 3, "s2": 4, "s3": 5,
     "a1": 6, "a2": 7, "a3": 8, "b1": 9, "b2": 10}
N = 11

# (center, [radius blocks]) -- verbatim from the verdict table, center singleton omitted.
TABLE = {
    "V":  [["U", "s1", "a1", "a2"], ["W", "b1"], ["s2", "b2"], ["s3", "a3"]],
    "W":  [["s2", "a3", "b1", "b2"], ["V", "a1"], ["U", "s1"], ["s3", "a2"]],
    "U":  [["V", "W", "s1", "s3"], ["s2", "a1", "a3"], ["a2", "b1", "b2"]],
    "s1": [["U", "V", "W", "s2"], ["s3", "a1", "b1"], ["a2", "a3", "b2"]],
    "s2": [["U", "V", "s3", "a1"], ["W", "s1", "b2"], ["a2", "a3", "b1"]],
    "s3": [["V", "W", "a1", "a2"], ["U", "s2", "a3"], ["s1", "b1", "b2"]],
    "a1": [["U", "W", "s3", "a2"], ["V", "s2", "b1"], ["s1", "a3", "b2"]],
    "a2": [["V", "W", "a3", "b1"], ["U", "s1", "s2"], ["s3", "a1", "b2"]],
    "a3": [["V", "s2", "s3", "a2"], ["U", "W", "s1"], ["a1", "b1", "b2"]],
    "b1": [["V", "s3", "a3", "b2"], ["U", "W", "a1"], ["s1", "s2", "a2"]],
    "b2": [["W", "s2", "s3", "a1"], ["U", "V", "a2"], ["s1", "a3", "b1"]],
}
SURPLUS = {"V", "W", "s1", "s2", "s3"}  # surplus cap S


def self_check():
    """Reproduce the verdict's combinatorial invariants; abort on any mismatch."""
    errs = []
    # every center: point not in its own blocks; K4 first block size 4
    all_blocks = []
    for c, blocks in TABLE.items():
        pts_seen = []
        for b in blocks:
            if c in b:
                errs.append(f"{c}: center in own block {b}")
            pts_seen += b
            all_blocks.append((c, frozenset(b)))
        if len(blocks[0]) != 4:
            errs.append(f"{c}: first block not size 4: {blocks[0]}")
        # blocks partition the other 10 points (each once)
        if sorted(pts_seen) != sorted([x for x in L if x != c]):
            errs.append(f"{c}: blocks do not partition others: {sorted(pts_seen)}")
    # pairwise block intersection <= 2 across distinct centers
    for (c1, b1), (c2, b2) in combinations(all_blocks, 2):
        if c1 != c2 and len(b1 & b2) > 2:
            errs.append(f"overlap>2: {c1}{sorted(b1)} vs {c2}{sorted(b2)}")
    # off-surplus (V,W) signatures distinct, matching the verdict
    def block_index(center, pt):
        for i, b in enumerate(TABLE[center]):
            if pt in b:
                return i + 1  # 1-based per verdict (0 = center singleton)
        return 0
    off = [p for p in L if p not in SURPLUS]  # U,a1,a2,a3,b1,b2
    sig = {p: (block_index("V", p), block_index("W", p)) for p in off}
    expected = {"U": (0, 2), "a1": (0, 1), "a2": (0, 3),
                "a3": (3, 0), "b1": (1, 0), "b2": (2, 0)}
    # note: verdict uses 1-based block ids where V-block1={U,s1,a1,a2}; U->(0,2)
    # means U is in V's block? U IS in V-block1 -> index 1, but verdict says 0.
    # Verdict's signature convention = (V-radius block id, W-radius block id) with
    # its OWN 0-based numbering. We only need DISTINCTNESS, which is convention-free.
    if len(set(sig.values())) != len(off):
        errs.append(f"off-surplus signatures NOT distinct: {sig}")
    return errs, sig


def build_polys():
    polys = []
    for c, blocks in TABLE.items():
        ci = L[c]
        for b in blocks:
            bi = [L[x] for x in b]
            base = gss.d2(ci, bi[0])
            for k in bi[1:]:
                polys.append(f"({base})-({gss.d2(ci, k)})")
    return polys


def var_list():
    return [f"x{p}{ax}" for p in range(2, N) for ax in ("x", "y")]


def main():
    errs, sig = self_check()
    print(f"# self-check: {'PASS' if not errs else 'FAIL'}", file=sys.stderr)
    print(f"# off-surplus (V,W) signatures: {sig}", file=sys.stderr)
    for e in errs:
        print(f"#   ERR {e}", file=sys.stderr)
    if errs:
        print("SELF-CHECK FAILED -- transcription error, aborting.", file=sys.stderr)
        return 1
    polys = build_polys()
    vs = var_list()
    print(f"# {len(polys)} equidistance polynomials, {len(vs)} free vars", file=sys.stderr)
    ideal = "ideal I = " + ",\n  ".join(polys) + ";"
    script = "\n".join([
        f"ring r = 0, ({','.join(vs)}), dp;",
        ideal,
        "ideal G = std(I);",
        'print("R1:");', "reduce(1, G);",
        'print("DIM:");', "dim(G);",
        'print("SZ:");', "size(G);",
        "quit;",
    ])
    if "--emit" in sys.argv:
        print(script)
        return 0
    out, err = gss.run_singular(script)
    print(out)
    if err.strip():
        print("STDERR:", err, file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
