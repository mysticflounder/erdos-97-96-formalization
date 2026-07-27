# MEC / `IsM44` route audit for the two-row collision leaf

## Verdict

The hypotheses of
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
do **not currently provide a route to an alternative `IsM44` packet**.
Every packet obtainable by merely changing the surplus designation, rebuilding
the cap proof for the same ordered Moser triangle, or permuting the three
vertices of the existing triangle has the same three cap sets up to
permutation.  On the live all-large residual all three sets have cardinality at
least six, whereas `IsM44` requires two of them to have cardinality exactly
four.

Consequently an `R.noM44` contradiction here would require a genuinely
different MEC-boundary triangle (different vertex set), together with a proof
that its induced closed-cap partition has two four-caps.  None of the collision,
critical-shell, deletion, or tri-apex hypotheses supplies either the needed new
MEC-boundary vertices or the two cap-cardinality equalities.

This does not prove that no indirect geometric argument can eventually derive
such a triangle.  It identifies the exact new theorem that such a route would
have to establish; it is not available from the current API or theorem banks.

## Checked obstruction

`SurplusCapPacket.IsM44` is definitionally

```lean
S.oppCap1.card = 4 ∧ S.oppCap2.card = 4
```

(`PartitionFromMEC.lean:440-444`).  The live residual gives

- `6 ≤ S.oppCap1.card`,
- `6 ≤ S.oppCap2.card`
  (`LargeOppositeCapsBiApexSurface.lean:38-45`), and
- `6 ≤ S.surplusCap.card`
  (`FrontierLiveClosure.lean:6370-6382`).

These are exactly the three raw caps, in an order determined by
`S.surplusIdx` (`PartitionFromMEC.lean:367-392`).  Hence any new choice of
`surplusIdx` leaves both newly opposite caps at least six.  The production
redesignations visibly keep `triangleNonObtuse`, `hCirc`, and `partition`
unchanged (`FrontierLiveClosure.lean:6233-6249`,
`:6297-6318`, and `:6400-6419`).

The scratch theorem

```lean
no_isM44_of_all_large_role_bounds_same_partition_relabelling
```

formalizes this for **every** `i : Fin 3`, not just the two named production
rotations.  It kernel-checks source-clean in
`scratch/mec-m44-route/SamePartitionRelabelling.lean`.

Changing only the `CapTriple` proof object cannot help either.
`CapTriple.arc_membership` identifies each `Ci` extensionally with a fixed
`OnArcOpposite` predicate (`Cap/Structure.lean:195-204`).  The scratch theorem

```lean
capTriple_caps_eq_of_same_triangle
```

proves that two cap triples over the same ordered triangle have identical
`C1`, `C2`, and `C3`.

Permuting the vertices of the existing triangle also only permutes the same
three cap sets.  The repository already implements all three transpositions:

- swap 2/3 uses `(C1,C3,C2)` (`U2NonSurplusOneHit.lean:1543-1548`);
- swap 1/3 uses `(C3,C2,C1)` (`:1581-1586`);
- swap 1/2 uses `(C2,C1,C3)` (`:1619-1624`).

Thus all six vertex orderings retain the all-large cap multiset.

## What a real alternative packet needs

The existing packaging theorem
`isM44Packet_of_capTriple_C1_surplus`
(`U1TwoShortCapReduction.lean:464-495`; with analogous C2/C3 variants)
shows the exact sufficient payload:

```lean
MT'    : MEC.NonObtuseCircumscribedMoserTriangle D.A hA hncol
hCirc' : ∃ h12 h23 h13,
  MT'.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩
CP'    : CapTriple D.A
  (MT'.toMoserTriangle.toStructural hCirc')
hLong  : 4 < CP'.C1.card
hFour2 : CP'.C2.card = 4
hFour3 : CP'.C3.card = 4
```

From these, the existing theorem produces
`∃ T' : SurplusCapPacket D.A, T'.IsM44`, and `R.noM44` immediately gives
`False`.

The generic MEC constructor
`MEC.nonempty_nonobtuseCircumscribedMoserTriangle`
only assumes that at least three carrier points lie on the MEC boundary and
returns some non-obtuse boundary triple
(`Moser/TriangleNonObtuse.lean:729-748`).  It neither makes that triple
different from `S.triangle` nor controls any induced cap cardinality.
Likewise `cap_partition_from_moser_circumscribed` defines the caps from the
chosen triangle's three `OnArcOpposite` predicates
(`Cap/PartitionFromMEC.lean:152-185`); it does not prove two caps have size
four.

So the missing mathematical producer can be stated cleanly as:

```lean
theorem exists_alternative_m44_capTriple_of_two_sourceExactCollisionRows
    (all the current two-row leaf hypotheses) :
    ∃ (MT' : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty S.hncol)
      (hCirc' : ∃ h12 h23 h13,
        MT'.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
      (CP' : CapTriple D.A
        (MT'.toMoserTriangle.toStructural hCirc')),
      (4 < CP'.C1.card ∧ CP'.C2.card = 4 ∧ CP'.C3.card = 4) ∨
      (4 < CP'.C2.card ∧ CP'.C1.card = 4 ∧ CP'.C3.card = 4) ∨
      (4 < CP'.C3.card ∧ CP'.C1.card = 4 ∧ CP'.C2.card = 4)
```

For this to be genuinely new rather than a disguised permutation, one also
needs that the unordered vertex set of `MT'` differs from that of
`S.triangle`.  `MoserTriangle` requires all three vertices to be carrier
points on the MEC boundary (`Moser/Triangle.lean:59-86`).

## Why the current leaf does not supply that producer

The leaf's source data says the four sources belong to selected distance
classes around `S.oppApex1` and to one existing cap interior; its further data
concerns exact critical shells, blocker-center equalities/inequalities,
mutual omissions, deletion packets, and a cap-eight-or-cross split
(`FrontierLiveClosure.lean:7374-7443`).

In particular:

- `RetainedInteriorBlockerCollision` provides carrier, selected-class, and
  cap-interior membership, but no MEC-boundary equality
  (`RetainedStrictInteriorPairSelector.lean:94-115`);
- `LocalizedCollisionCommonDeletion` adds a fresh cap-interior point and a
  deletion packet, again with no MEC-boundary equality (`:448-463`);
- `LocalizedCollisionMutualOmissionCycle` adds shell nonmembership and
  blocker/deletion relations, not MEC-boundary membership
  (`LocalizedCollisionMutualOmissionCycle.lean:124-163`);
- the tri-apex residual adds rich-class structures and robustness/covering
  statements at the existing three Moser apices
  (`FrontierLiveClosure.lean:6471-6498`).

There is therefore no candidate fourth MEC-boundary point from which the
existing constructors could obtain a different vertex set, and no theorem
converting the shell/collision relations into the two exact cap counts.

## Validation

Run from `lean/`:

```text
lake env lean ../scratch/mec-m44-route/SamePartitionRelabelling.lean
```

Result: exit code 0, no warnings or errors from Lean.

