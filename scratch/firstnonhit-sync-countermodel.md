# FirstNonHit synchronization: finite incidence shadow

Status: read-only audit artifact (2026-08-12).  This is a finite incidence
model of the currently source-entitled clauses; it is **not** a realization by
points in `ℝ²` and does not assert any metric facts.

## Model

Take one canonical cap interior

```
I = {p1,p2,r1,r2,c1,c2,w0,w1,w2,w3}
```

and its closed cap `I ∪ {eL,eR}` (cardinality 12).  The two retained
collision pairs are `{p1,p2}` and `{r1,r2}`.  Let `Q.source₁=q3`,
`Q.source₂=q4`, and give the fresh Q-row the exact support

```
KQ = {q1,q2,q3,q4}.
```

The two canonical cap-source rows and four outside sources have supports

```
Kc1 = {c1,a1,a2,a3}       Kc2 = {c2,b1,b2,b3}
Kwi = {wi,ui,vi,ti}        (i = 0,1,2,3).
```

All symbols displayed above are distinct except where explicitly identified;
add fresh ambient points as needed.  Every displayed row has cardinality four.
Assign distinct actual centers `d1,d2,dw0,...,dw3` to the corresponding
rows and assign the common Q center `dQ` to `q3,q4`, with all these centers
distinct.  Put all `d*` in cap 0, and put `q1,...,q4` outside the canonical
cap.  Give the four `wi` arbitrary labels in `Fin 3` (e.g. `0,1,2,0`), with
one-point fibers for each `dwi`; the Q fiber has exactly `{q3,q4}`.  Thus
every actual blocker fiber has cardinality ≤4 and every cap-filtered fiber
has cardinality ≤2.

The remaining source rows (the two retained pairs and any auxiliary sources)
are chosen disjoint from `KQ`, or with at most one Q point.  The only row
containing three or more Q points is `KQ` itself, whose source center is `dQ`.

## Source-clause checklist

* `FreshThirdBlockerFiber`: `q3,q4` are distinct, have equal blocker `dQ`,
  and both lie in `KQ`; all four named collision endpoints are different.
* `FreshThirdCapSourceNonHit C.firstSource Q`: use `sourceRowOmission` with
  deleted `q1`; `q1 ∉ Kc1` and declare
  `HasN(A.erase q1, d1)`.  For the second interaction use the same constructor
  with deleted `q2` and `HasN(A.erase q2, d2)`.
* `CapSourceThirdCanonicalRowWitness`: `c1,c2 ∈ I`, their rows have card 4,
  and both rows omit at least one endpoint of each retained pair (in fact all
  four).  Their cross-pair deletion views therefore hold as positive
  incidence labels.
* `FreshThirdAlignedRetainedConsumerPacket`: assign distinct first-apex
  radii to `c1,c2`, with singleton strict-cap slices `{c1}` and `{c2}`;
  assign the two multi-point slices `{p1,p2}` and `{r1,r2}` to the retained
  radii.  For each canonical source use the fixed deletion-core pair
  `{p1,r1}`: both endpoints are omitted from its row, the double deletion
  survives at `d1`/`d2`, and it is blocked at the first apex.  Attach a
  `MinimalDeletionCore` by two disjoint four-point auxiliary shells, one
  through `p1` and one through `r1`.
* Q-row minimality is also compatible: choose a fresh non-actual center `m`
  outside `KQ`, take `V={q1}`, declare `¬HasN(A.erase q1,m)` and
  `HasN(A,m)`.  This realizes the singleton arm of
  `exists_freshThird_qRow_minimalBlocker_singleton_or_nonactualCenter` and
  does not produce a row at a center distinct from `dQ`.
* If the common-radius outside-seed producer is included in the abstraction,
  declare `¬HasN(A.erase wi,dwi)` (and `dwi` in strict cap 0) for each `wi`.
  These are four one-point own-deletion blockers; none blocks three points of
  `KQ`, since `wi ∉ KQ`.
* `actualBlockerFiber_card_le_four`, its cap-filtered ≤2 refinement, and the
  equal-blocker/support-equality rule all hold by the fiber assignment.  The
  distinct-blocker mutual-pair theorem is vacuous: no two distinct-center rows
  contain the same pair of points.

For every distinct-center row in the model,

```
|K ∩ KQ| = 0   (for Kc1,Kc2,Kwi and retained/auxiliary rows),
```

so in particular every such overlap is ≤2.  Hence the source-entitled finite
incidence data do not force the target's `≥3` overlap, even after adding the
singleton/non-actual-center minimal-blocker split and blocker-fiber bounds.

## Exact missing producer contract

The existing consumer
`selectedRow_inter_card_ge_three_of_blocked_deletions` would close the branch
if one could source-produce a single center `d ≠ dQ` and a finite set
`B ⊆ KQ` with `card B ≥ 3` such that every deletion in `B` is blocked at `d`.
No current cap label, cyclic-order clause, Kalmanson clause, deletion-core
minimality field, or blocker-fiber bound supplies this shared-center
`B`-packet.  The model above satisfies all of those present clauses while
leaving every distinct-center row with at most two Q points.  Therefore the
smallest genuinely new theorem is precisely this shared-center three-blocked-
Q-points producer (or a direct `False` theorem for the same source packet).
