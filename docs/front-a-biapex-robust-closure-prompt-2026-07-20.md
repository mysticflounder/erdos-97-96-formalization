# Exact-five global-cover-star closure

Prove the current live theorem:

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (outcome : ExactFiveGlobalCoverStarOutcome Q profile) :
    False
```

## Exact checked reduction

The fixed `H`, full `F/R/B/Q/profile`, global K4, minimality, no-`IsM44`,
bi-apex deletion robustness, and retained parent rows are available.  The
strict physical second-cap set has exactly three points.

`ATail/ExactFiveGlobalCrossDeletionPair.lean` proves that the global-cover
graph on the three physical vertices has at least two incident edges.  The
live `outcome` has exactly these constructors:

```lean
ExactFiveGlobalCoverStarOutcome.allRowsOneHit star hall
ExactFiveGlobalCoverStarOutcome.spoke₁TwoHit star normal
ExactFiveGlobalCoverStarOutcome.spoke₂TwoHit star normal
```

The star consists of a hub and two spokes.  Each hub-spoke pair has a
carrier-wide singleton-deletion K4 cover.  The hub's actual critical support
meets the physical set only at the hub.  In either two-hit constructor,
`normal` is `SourceTwoHitNormalForm` for the globally covered spoke-hub pair;
the cover is not lost through reorientation.

Thus there are exactly two mathematical outcomes:

1. **Asymmetric.** A mutual pair has a two-hit row.  Its blocker is the other
   endpoint; its physical-cap intersection is exactly the source and the
   third physical point; and its remaining support is a named two-point pair
   outside the closed physical cap.  If that outside pair is co-radial from
   `S.oppApex1`, the existing theorem
   `SourceTwoHitNormalForm.false_of_firstApex_coRadial` gives `False`.
2. **Fully symmetric.** The complete `star` and
   `AllPhysicalActualCriticalRowsOneHit H profile` are retained:
   every physical actual-critical row meets the physical set only at its own
   source.  Hence every two distinct physical sources mutually omit one
   another, their three actual blocker centers are pairwise distinct, and
   each exact shell has exactly three support points outside the physical
   three-set.

The cap-six `LargeCapUniqueFiveLowHit` / common-deletion normal form is not
available: it requires `6 ≤ S.oppCap2.card`, while this branch has
`S.oppCap2.card = 5`.

## Required result

Derive `False` from exactly the theorem inputs above.  It is enough to prove
both of the following source-level implications:

```text
asymmetric normal form
  + its aligned global-cover star and the full F/R/B/Q/profile parent
  -> its named outside pair is co-radial from S.oppApex1
     OR a genuine alternative IsM44 SurplusCapPacket;

AllPhysicalActualCriticalRowsOneHit H profile
  + the retained two-edge star and the full F/R/B/Q/profile parent
  -> Nonempty (CriticalFiberClosingCore R)
     OR a genuine alternative IsM44 SurplusCapPacket.
```

The first co-radial output feeds
`SourceTwoHitNormalForm.false_of_firstApex_coRadial`.  The closing-core output
feeds `false_of_criticalFiberClosingCore`.  Either packet output contradicts
`R.noM44`.

The star is not terminal: each covered edge gives only negative support
incidence.  An exact 13-vertex critical-hypergraph model satisfies criticality,
strong connectivity, all-one-hit, and a global-cover star while having no
nontrivial blocker fiber.  It is not Euclidean/MEC data.  A successful proof
must therefore make the convex/MEC packet or `R.noM44` load-bearing; do not
attempt another pure incidence or connectivity conversion.

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
