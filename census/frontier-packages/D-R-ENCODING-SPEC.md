# D-R Layer-1 encoding specification (2026-07-28, v1.0)

This is the Session-3 named-local incidence package for the two live D-R
leaves:

- `false_of_exactFourPostCardElevenTwoRadiusBranch`
  (`FrontierLiveClosure.lean:5976-5992`);
- `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`
  (`FrontierLiveClosure.lean:6041-6051`).

The implementation is `census/frontier-packages/dr_core/`.  This specification
inherits the soundness discipline of `A-CORE-ENCODING-SPEC.md`: labels name
only the witnesses supplied by the hypotheses, equality atoms retain every
otherwise-ambiguous coincidence, and no clause treats the labels as an
enumeration of the finite carrier or of all distance rows.  Thus UNSAT would
only kill the encoded incidence shadow after an encoding audit; SAT is only a
locally consistent incidence shadow.

## 1. Named-local universe

Point labels are

```
a0 a1 a2 a0p source c1
U0..U3 B10..B13 B20..B23 X0..X3 Y0..Y3 V0..V3
```

`U` is the original exact first-apex class; `B1,B2` are the ingress
common-deletion witnesses; `X,Y` are D1's two selected second-apex classes;
`V` is D2's swapped exact class.  `a0p` is deliberately independent of `a0`:
the swapped packet hypotheses do not identify their third Moser vertices.

There is an `eq(p,q)` atom for every pair of labels.  Equivalence clauses are
structural.  Hypotheses add disequalities only for the original Moser triple,
within each asserted four-set, and where explicitly stated below.

Named selectors `qF,wF,p,p'` choose slots of `U`; `qP,wP` choose slots of `V`.
This records membership without inventing extra point labels.  `deltaQ` and
`deltaW` choose `delta=qF` or `delta=wF`.

## 2. Common clauses (`dr-common`)

- **EQ:** equality is an equivalence relation on the named labels.
- **R-MOSER/R-U:** `a0,a1,a2` are pairwise distinct; `U` is a four-element
  support.  Each selector is exactly one slot, with `qF!=wF` and `p!=p'`.
- **I-DEL:** exactly one of `deltaQ,deltaW`; the selected deletion differs
  from `c1` and `a2`; `c1!=a2`.
- **I-B1/I-B2:** each ingress witness is a four-element support; `B1` avoids
  `c1` and the selected deletion, while `B2` avoids `a2` and the deletion.
- **I-OVERLAP:** at most two named points lie in both `B1` and `B2`.

The blocker-map, K4-survival, exact radii, and global cap-count data have no
faithful Boolean consequence beyond these named incidences in v1.0 and are
not guessed.

## 3. D1 delta (`dr-d1`)

- **D1-ROW:** `X` and `Y` are four-element supports.
- **D1-DISJ:** all 16 cross equalities `eq(Xi,Yj)` are false, directly from
  `_hdisjoint`.
- **D1-CAP:** Boolean atoms `g2(Zi)` mean membership in the strict second cap.
  At least two slots of each of `X,Y` satisfy `g2`; at most two slots of `U`
  do.  These are the producer's two interior-hit bounds and the robust-cap
  intersection bound.

The unequal radii and `_hnoFive` justify exactness/disjointness of the supplied
rows but do not enumerate all positive radii.  No finite universal no-five
clause is emitted.

## 4. D2 delta (`dr-d2`)

- **D2-ROW:** `V` is a four-element support; `qP,wP` select distinct slots.
- **D2-SEPARATION:** `qF,wF` are outside `V`, and `qP,wP` are outside `U`.
- **D2-INGRESS:** by swapped uniqueness the ingress second-center witness is
  `V`; since slots are unordered, `eq(B2i,Vi)` is a sound WLOG reindexing.
  The common `I-OVERLAP` clauses then give `|B1 intersect V|<=2`.
- **D2-SWAP:** five atoms assert only the proved aliases
  `firstApex'=a2`, `secondApex'=a1`, `firstCap'=cap2`,
  `secondCap'=cap1`, `surplusCap'=surplusCap`.

The swap smoke gate checks that this five-entry role/cap renaming is an
involution under syntactic double application.  It never asserts packet
identity or `S''=S`.

## 5. Runs and gates

Official 60-second runs are exactly `dr-common`, `dr-d1`, and `dr-d2`.
Before them, `smoke.py` requires:

1. hand-built total SAT witnesses for all three packages;
2. 16 DRAT-verified probes forcing one forbidden `X/Y` equality;
3. a SAT two-overlap witness and a DRAT-verified three-overlap probe;
4. direct double-renaming verification plus five DRAT-verified probes
   negating the five swap aliases;
5. DRAT-verified selector/deletion contradiction probes.

Every UNSAT smoke result must have `proof_verified=true`.  Any official SAT
verdict is reported only as incidence-shadow evidence.
