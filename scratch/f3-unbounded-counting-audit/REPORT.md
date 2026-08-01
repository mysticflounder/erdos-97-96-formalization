# F3 unbounded-counting audit

## Scope and verdict

Live leaf:

```lean
Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.
  false_of_capSource_firstFiber_collisionFiveCenterDeletion
```

The scalar/cardinality and abstract-incidence consequences currently exposed
by this leaf do **not** force either checked first-fiber terminal.  They admit
an unbounded family obtained by adjoining independent four-point canonical
blocks.  This is not a Euclidean `CounterexampleData` model and therefore is
not a counterexample to the Lean theorem.  It isolates the missing ingredient
as positive metric/incidence geometry, rather than more use of `capSum`,
`notRobustCover_card`, `noM44`, or the deletion residual.

The deletion hypothesis is not new ammunition.  The kernel-checked scratch
theorem

```lean
Problem97.F3cRedundancyBank.f3c_joint_sharp
```

in `lean/scratch/f3c-redundancy-bank/F3cRedundancy.lean` derives two sharp
five-center survivals from `FirstFiberCapSourceWitness` and the already
available robust-apex/disjoint-pair data.  Thus the unresolved core is
`Γ + FreshOutsideFirstBlockerFiber + FirstFiberCapSourceWitness`.

## Why the available counts are one-way

Write `n = |A|`.  The exact cap identity is

```text
|surplusCap| + |oppCap1| + |oppCap2| = n + 3.
```

The live bounds `8,6,6` imply only `n >= 17`.  They provide no upper bound.
The minimality consequence

```text
n <= 4 * |notRobustCenters|
```

is likewise a lower bound on the number of nonrobust centers.  It is
compatible with arbitrarily many independent unique-four blocks.  The
`noM44` consequence used on this route only excludes the simultaneous
opposite-cap `(4,4)` profile; it supplies no converse upper bound once the
caps are already at least six.

The exact selected rows and distinct-circle lemmas provide upper bounds on
row intersections (`<= 2`, and `<= 1` for two outside parts in one ordered
cap).  No current hypothesis supplies a positive lower bound for the
intersection of the cap-source row with

```text
E = {s1, s2, e, o} = K(s1).
```

## A cardinal-minimal 17-point incidence-shadow seed

This is a finite-set shadow, not a Euclidean realization.  Take the seventeen
points

```text
{a1,a2,a3,s1,s2,t1,t2,g,b,e,o,u,v,d,z1,z2,w1}.
```

Use five nonrobust centers and their canonical exact-four rows:

```text
center b:   E = {s1,s2,e,o}
center g:   J = {t1,t2,u,v}
center d:   G = {g,a3,z1,z2}
center w1:  U = {a1,a2,b,d}
center o:   V = {w1,s1,t1,z1}.
```

Every carrier point occurs in at least one displayed row, and every center is
outside its own row.  Choose the critical-shell blocker of each source from a
displayed row containing it; in particular

```text
c(s1)=c(s2)=c(e)=b,  c(t1)=c(t2)=g,  c(g)=d.
```

Use the first closed cap

```text
C1 = {s1,s2,t1,t2,g,b,a2,a3}.
```

Its strict interior is `{s1,s2,t1,t2,g,b}` and its endpoints are `a2,a3`.
Split the remaining eight non-apex points into strict interiors of size four
for each other cap.  The cap sizes are `(8,6,6)`, so

```text
8 + 6 + 6 = 17 + 3.
```

This is cardinal-minimal for any shadow satisfying the live cap bounds,
because `capSum` and `(8,6,6)` force `n >= 17`.

The named data have the required shadow:

```text
K(s1)=E={s1,s2,e,o},       K(t1)=J={t1,t2,u,v},
g in C1 interior,          K(g)=G={g,a3,z1,z2},
c(g)=d != b,g,a1,a2,       K(g) misses both collision pairs.
```

Thus `e` is the fresh source in the first blocker fiber and `o` is its other
outside point.  The cap-source shell has

```text
K(g) ∩ {s1,s2,e,o} = empty,
```

so the three-overlap terminal fails; `e,o` are not in `K(g)` and `d` is
outside `C1`, so the two-outside-hits/cap-center terminal also fails.

At `a1`, take two disjoint exact-four rows

```text
R10={s1,s2,z1,z2},  R11={t1,t2,d,w1}.
```

These give the two exact first-apex radii with the required strict-cap
intersections and make deletion at `a1` robust.  For the other two apices use

```text
R20={s1,t1,e,u},  R21={s2,t2,o,v},
R30={s1,t2,e,v},  R31={s2,t1,o,u}.
```

Each pair is disjoint, all intersections between rows at distinct centers
have size at most two, and no row contains all three apices.  Deleting `s1`
still leaves a four-row at `d`, `a1`, `b'`, `a2`, and `a3`, so the first
five-center arm also holds in the incidence shadow.

Taking the five canonical centers `{b,g,d,w1,o}` as nonrobust gives

```text
17 <= 4 * 5.
```

The shadow therefore satisfies the full scalar/cardinality package and the
named finite-set row/deletion consequences while both checked positive
terminals fail.

For an unbounded family, adjoin any number of independent four-point blocks
to the third cap interior, give each a fresh unique-four center outside its
own block, and extend the blocker assignment by a deranged cycle among the
new and unused center points.  Each extension increases both `n` and the
third cap size by four, so `capSum` persists; the fixed named rows, all
low-intersection bounds, the cover inequality, and the zero alignment with
`E` persist.

## Exact missing geometric bridge

The smallest direct bridge found is one metric equality:

```lean
theorem secondBlocker_bisects_firstFiberOutsidePair_of_F3
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hdeletion :
      FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 =
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        Q.otherOutsidePoint
```

Here `P`, `Pρ`, and the live section hypotheses (especially
`hblockersNe`) are ambient.  The first blocker already bisects this outside pair because
`K(s1)={s1,s2,e,o}`.  Both blockers are distinct points of the first ordered
cap, while `e,o` are distinct carrier points outside it.  Therefore the
displayed equality immediately contradicts
`CapSelectedRowCounting.outsidePair_unique_capCenter`; the exact scratch
consumer is

```lean
false_of_firstFiber_secondBlocker_bisects_outsidePair_probe
```

in `scratch/SecondCapOutsidePairBridgeProbe.lean`.

An incidence-form strengthening is

```text
{e,o} subset K(t1),
```

or equivalently (using the exact two-point outside parts) that the two
collision rows have outside intersection of cardinality two.  Current
counting gives the opposite-direction upper bound `<= 1`; deriving this
positive coincidence must use genuinely new global geometry (for example a
minimal-deletion/ordinal argument), not the present cover or cap counts.
