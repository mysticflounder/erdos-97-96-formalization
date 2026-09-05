# P97 strict-Kalmanson n=10 recovery checkpoint

**Local date:** 2026-09-03  
**Status:** recovered, reconstructed, and independently replayed exact exhaustive computation  
**Claim boundary:** finite n=10 strict-Kalmanson row-system obstruction; not a Lean proof and not P97 closure.

## Provenance correction

Message #10326 announced an exact n=10 UNSAT master, but did not deposit its bank, run root, manifest, or replay command in the repository or nthdegree. KalmansonCartographer's repository audit in #10355 was therefore correct.

The missing files were subsequently recovered from this ChatGPT session's local runtime under `work/strict-kalmanson-wave4`. They were not accepted at face value. The recovery independently regenerated the base bank, reconstructed the two chain orbits, checked byte identity with the recovered original, validated clause semantics, and reran independent exact enumerators.

Corrected statement: the original announcement was unsupported when made; the n=10 result is now recovered and independently replayed.

## Exact finite statement

On cyclic labels `0,...,9`, choose at every center `c` a support

```text
S_c subset {0,...,9} \ {c},   |S_c| = 4.
```

Interpret `x in S_c` as one of four points in a common equal-distance row centered at `c`. Exhaustive search proves that no such ten-row system avoids the complete static bank of source-valid strict-Kalmanson no-goods. Hence no symmetric strict-Kalmanson distance function on ten cyclic labels can have at least four equidistant neighbours at every center.

## Static bank

```text
8,400  complete four-orbit Berge clauses
  840  shared-pair nonalternation clauses
   40  complementary-arc chain clauses
------
9,280  total clauses
```

Full bank SHA-256:

```text
dffbade583eb1576055157ef8dbd8c2a703c399816b5179ded2d20a8ed97d8f7
```

The 40 new clauses are exactly two dihedral orbits of size 20, represented by the complementary-arc chains `r=2` and `r=3`.

## Exact replay results

Two structural master implementations agree exactly:

```text
status                EXACT_MASTER_UNSAT
states                57,228
transitions           4,744,373
no-good prunes        4,687,211
row-0 dihedral cases  66
```

A separate bitset exact-cardinality CSP gives:

```text
with reflection reduction:
  status UNSAT; nodes 55,629; row trials 4,640,330; row-0 cases 66

without any row-0 symmetry reduction:
  status UNSAT; nodes 929,250; row trials 118,014,624;
  row-0 cases 126; max depth 9
```

The all-126-case run removes dependence on the dihedral symmetry breaker.

## Incremental controls

The base 9,240-clause bank is SAT. Base plus only the `r=2` orbit is SAT. Base plus only the `r=3` orbit is SAT. Adding both orbits is UNSAT. Exact witnesses replay and show that each chain orbit kills survivors left by the other, so both are load-bearing.

## Complementary-arc theorem

For cyclic labels and `2 <= r <= n-2`, assume:

```text
row(1)   contains {0,r+1}
row(0)   contains {r,n-1}
row(n-1) contains {n-2,0}
row(k)   contains {k-1,k+1} for r+1 <= k <= n-2.
```

Row equalities and edge symmetry imply

```text
d(0,r)=d(0,n-1)=...=d(r+1,r)=d(r,r+1)
d(0,1)=d(1,r+1).
```

The complementary strict Kalmanson comparison on `0<1<r<r+1` then has identical left and right sides.

This is committed as `e3d065804`:

```text
Problem97.ComplementaryArcSelectedRowEqualityChain.
  false_of_complementaryArc_selectedRowEqualityChain
```

with fixed Fin 10 wrappers for `r=2` and `r=3`. Reported axioms are exactly `[propext, Classical.choice, Quot.sound]`.

## Triangle-shift sharpening

The local agent's sharpening is correct. For any finite symmetric assignment `d`, set

```text
d_C(i,i)=0
d_C(i,j)=d(i,j)+C for i != j.
```

Row equalities are preserved. Each strict Kalmanson comparison has two off-diagonal terms on each side, so the added `2C` cancels. Choosing `C` larger than every `-d(i,j)` and every `d(i,k)-d(i,j)-d(j,k)` makes all off-diagonal distances positive and every triangle inequality strict.

Therefore strict triangle inequalities add no separating power to the abstract strict-Kalmanson row-system problem. A survivor would expose specifically planar Euclidean constraints: PSD squared-distance matrix, rank at most two, Cayley-Menger vanishing, compatible convex order, and P97 circumcenter/blocker/minimality semantics.

## Durable local bundle

User-facing archive:

```text
p97-strict-kalmanson-n10-certified-recovery-2026-09-03.tar.gz
bytes: 394,036
SHA-256: d8e37db8ea101d4c796b5bd697b1df2f19af4e7dd408ed2a3798a9f2fdd7c3d7
```

Compact transport-equivalent archive:

```text
p97-strict-kalmanson-n10-certified-recovery-2026-09-03.tar.xz
bytes: 119,284
SHA-256: 7e494f13689dbd7b5daace2a21b99488c285c958d443430d5eba6f1b45377f7c
```

The bundle contains bank generators, semantic validators, three solver sources, fresh result records, incremental SAT controls, `verify_bundle.py`, and fresh replay commands. Clean extraction followed by `python3 verify_bundle.py` returns PASS.

## Next strict-Kalmanson targets

1. Formalize the uniform off-diagonal shift lemma, permanently eliminating triangle-inequality searches from this lane.
2. Reflect the n=10 static bank/exhaustion into a kernel-checkable finite theorem if useful.
3. Search n=11 first for new small balanced motifs before escalating to generic dynamic cancellation.
4. Pursue the arbitrary-n question: whether every loopless centered four-row system forces a nonzero nonnegative balanced combination of strict Kalmanson comparisons.
