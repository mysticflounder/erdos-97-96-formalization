# Exact-five mutual-parent closure

Prove the current live theorem:

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveMutualParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : FrontierBiApexRobustExactFiveMutualParentResidual Q profile) :
    False
```

## Available source-faithful data

`M.pair` is an arbitrary pair of distinct strict physical second-cap points
whose actual `H.selectedAt` supports omit one another.  The physical set has
exactly three points.  The fixed `H`, full frontier `F`, minimality and
`noM44` in `R`, bi-apex deletion robustness in `B`, exact-five cap data in
`Q`, and both retained parent rows remain available.

The retained-row coupling is already proved and stored in `M`:

```text
exists x, x is physical and x in B2 and x notin B1
pair.source in B2 or pair.target in B2
pair.source notin B1 or pair.target notin B1
```

`M.endpointRowDichotomy` sharpens this to either one mutual endpoint in
`B2 \ B1`, or one endpoint in `B1 ∩ B2` while the other is outside both
retained rows.

`M.oneHit` is also kernel-checked: at least one of the two actual critical
supports meets the three-point physical set in exactly one point.  Production
module `ATail/ExactFiveMutualOneHitGeometry.lean` now gives the exhaustive
geometric split.  In either asymmetric case, the two-hit row is centered at
the other mutual endpoint, meets the physical cap in exactly two points, and
has an exact two-point support complement outside that cap.  The existing
ordered-cap terminal immediately refutes that arm if the outside pair is
co-radial from the first physical apex.

The unresolved cases are therefore:

1. both mutual rows are one-hit; or
2. one asymmetric row supplies the named outside pair, but no source-level
   theorem yet makes that pair co-radial at the first apex or places it in a
   distinct actual row centered in the same cap.

Pure one-row cap geometry and bare total criticality admit regressions.  A
closing proof must visibly use convex/MEC geometry together with global K4,
`R.minimal`, or construct a complete alternative `IsM44` packet contradicted
by `R.noM44`.

## Required result

Derive `False` from exactly the theorem inputs above.  The first missing
source-level implication is an occurrence theorem with this terminal shape:

```text
same-cap distinct fixed-H centers sharing two shell points outside that cap
  OR
a genuine alternative non-obtuse MEC support packet with IsM44.
```

On an asymmetric arm, it is enough to prove that the normalized outside pair
is co-radial from `S.oppApex1`.  On the both-one-hit arm, choose a cap
containing a one-hit blocker; the cap row bound supplies two points of its
exact shell outside that cap, and the missing step is a distinct fixed-`H`
center in the same cap whose actual shell contains those same two points.
The first output feeds `outsidePair_unique_capCenter`; the second contradicts
`R.noM44`.

Do not re-prove the parent-row bridge, the all-reverse split, or the
double-two-hit classifier: all are already kernel-checked in
`ATail/ParentExactFiveSecondCap.lean`, and the all-reverse arm is impossible.

## Rigor requirements

- Use the fixed `H`; do not reassign blockers.
- Keep complete radius classes distinct from selected four-point supports.
- Do not assume genericity, distinct radii, distinct blockers, or unproved
  MEC-boundary membership.
- Every constructed row or packet must be the exact antecedent of a named
  existing consumer, or be consumed immediately.
- Label claims `PROVEN`, `EMPIRICALLY VERIFIED`, `CONJECTURED`, or
  `HEURISTIC`.
- If closure fails, report only the first missing source-level implication,
  the exact parent fields it uses, and the named terminal it would feed.
