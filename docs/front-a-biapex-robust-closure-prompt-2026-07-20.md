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

## Exact checked reduction

The fixed `H`, full `F/R/B/Q/profile/M`, global K4, minimality, no-`IsM44`,
bi-apex deletion robustness, and retained parent rows are available.  The
strict physical second-cap set has exactly three points.

`ATail/ExactFiveMutualOneHitGeometry.lean` reduces the theorem to exactly two
source-faithful outcomes:

1. **Asymmetric.** A mutual pair has a two-hit row.  Its blocker is the other
   endpoint; its physical-cap intersection is exactly the source and the
   third physical point; and its remaining support is a named two-point pair
   outside the closed physical cap.  If that outside pair is co-radial from
   `S.oppApex1`, the existing theorem
   `SourceTwoHitNormalForm.false_of_firstApex_coRadial` gives `False`.
2. **Fully symmetric.** `AllPhysicalActualCriticalRowsOneHit H profile`:
   every physical actual-critical row meets the physical set only at its own
   source.  Hence every two distinct physical sources mutually omit one
   another, and their three actual blocker centers are pairwise distinct.

The cap-six `LargeCapUniqueFiveLowHit` / common-deletion normal form is not
available: it requires `6 ≤ S.oppCap2.card`, while this branch has
`S.oppCap2.card = 5`.  `M.endpointRowDichotomy` concerns the original mutual
endpoints in the two retained rows; it supplies no incidence or first-apex
equality for an asymmetric normal form's outside pair.

## Required result

Derive `False` from exactly the theorem inputs above.  It is enough to prove
both of the following source-level implications:

```text
asymmetric normal form
  -> its named outside pair is co-radial from S.oppApex1
     OR a genuine alternative IsM44 SurplusCapPacket;

AllPhysicalActualCriticalRowsOneHit H profile
  -> Nonempty (CriticalFiberClosingCore R)
     OR a genuine alternative IsM44 SurplusCapPacket.
```

The first co-radial output feeds
`SourceTwoHitNormalForm.false_of_firstApex_coRadial`.  The closing-core output
feeds `false_of_criticalFiberClosingCore`.  Either packet output contradicts
`R.noM44`.

Pure one-row geometry, pairwise omission, and distinct physical blocker
centers are not terminal.  A successful proof must visibly use global K4 or
`R.minimal` coupled to convex/MEC geometry, or construct the complete
alternative packet needed by `R.noM44`.

Do not re-prove the parent-row bridge, the all-reverse split, or the
double-two-hit classifier: all are already kernel-checked in
`ATail/ParentExactFiveSecondCap.lean`, and the all-reverse arm is impossible.

## Rigor requirements

- Use the fixed `H`; do not silently reassign blockers.  If a different
  critical system is chosen, justify the quantifier change and transport the
  complete `F/R/B/Q` parent contract.
- Keep complete radius classes distinct from selected four-point supports.
- Do not assume genericity, distinct radii, distinct blockers, or unproved
  MEC-boundary membership.
- Every constructed row or packet must be the exact antecedent of a named
  existing consumer, or be consumed immediately.
- Label claims `PROVEN`, `EMPIRICALLY VERIFIED`, `CONJECTURED`, or
  `HEURISTIC`.
- If closure fails, report only the first missing source-level implication,
  the exact parent fields it uses, and the named terminal it would feed.
