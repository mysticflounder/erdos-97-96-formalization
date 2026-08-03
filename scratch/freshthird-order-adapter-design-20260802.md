# FreshThird order-adapter audit (2026-08-02)

## Result

The normalized FreshThird residual does **not** expose a source-faithful
boundary/order region hypothesis.  `Problem97.freshThird_pair_order_partition`
is only a finite-order lemma; its hypotheses are not derivable from the live
`FreshThirdBlockerFiber`, `TwoCapSourceThirdCanonicalRowSurface`, or residual
constructors.  Consequently there is no honest one-theorem adapter that
closes the residual today.

## Targeted Lean checks

Run from `lean/` (the Lake root):

```text
lake env lean Erdos9796Proof/P97/ATail/FreshThirdOrderPartition.lean
lake env lean Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean
lake env lean Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean
```

All three exited 0.  The partition declaration is at
`ATail/FreshThirdOrderPartition.lean:23`:

```lean
theorem freshThird_pair_order_partition
    {n : Nat} {cL cH i j : Fin n}
    (hcenters : cL < cH) (hij : i < j)
    (hregion :
      (cL < i ∧ i < cH ∧ cL < j ∧ j < cH) ∨
        ((i < cL ∨ cH < i) ∧ (j < cL ∨ cH < j))) :
    (i < j ∧ j < cL) ∨
      (cH < i ∧ i < j) ∨
      (i < cL ∧ cH < j) ∨
      (cL < i ∧ j < cH)
```

It is proved by `omega`; no geometry, boundary map, or FreshThird import is
used.

## Missing data in the live packet

* `FreshThirdBlockerFiber` (`ATail/BlockerMultiplicityGeometry.lean:70`)
  supplies two source vertices, equal blocker vertices, non-equalities, and
  shell-membership facts.  It has no boundary enumeration, `Fin` indices,
  center-in-`D.A` facts, or cyclic interval/region information.
* `TwoCapSourceThirdCanonicalRowSurface` and its witnesses contain cap/source
  support and omission data, but do not identify `H.centerAt source` with a
  point of `D.A`.  `centerAt` is an arbitrary `ℝ²` value of the shell system;
  therefore `ShellBoundaryIndexing.indexOf` cannot even be applied without new
  carrier-membership hypotheses.
* The residual (`FrontierLiveClosure.lean:9203`) has exactly
  `firstNonHit`, `secondNonHit`, and `equalCrossRowCenters` arms.  The first two
  reduce to `sameBlocker`/`sourceRowOmission`; the equal-center arm explicitly
  identifies the two centers.  None gives strict center/end-point index order.
* The open terminal remains
  `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
  (`FrontierLiveClosure.lean:9806`), with a load-bearing `sorry`.

## Existing order/Kalmanson interfaces

`ShellBoundaryIndexing` (`ConvexCyclicOrder/ShellCurvatureRows.lean:32`)
provides `boundary`, `indexOf`, injectivity, image, CCW orientation, and
`point_eq`; it can index only carrier labels.  `CriticalFourShell` can be
converted by `.toSelectedFourClass` and then yields `support_eq_radius`.
The parity consumers (`ATail/TwoCenterBisectorParity.lean:53,74,112,134`)
and six-index Kalmanson consumers (`ATail/KalmansonThreeEqualitySchemas.lean:32`)
still require explicit strict `Fin` order, boundary equalities, and row/support
memberships.  These are not inferred by coercion from FreshThird fields.

## Smallest explicit adapter contract

The useful next obligation is a *three-part* adapter, not a closer:

1. **Carrier/index extraction.**  Add a global boundary
   `φ : Fin D.A.card → ℝ²` (or a `ShellBoundaryIndexing D.A`) and explicit
   labels/indices for the two centers and the two FreshThird endpoints.  The
   center labels require new hypotheses
   `H.centerAt C.firstSource.1 C.firstSource.2 ∈ D.A` and
   `H.centerAt C.secondSource.1 C.secondSource.2 ∈ D.A` (or the analogous
   blocker center), followed by boundary equalities.
2. **Finite region producer.**  Prove the actual missing source theorem,
   with `cL cH i j : Fin D.A.card`:

   ```lean
   /- Declared inside `TwoSourceExactCollisionRowsTerminal`, with the
      following full dependency context. -/
   theorem freshThird_region_adapter
       {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
       {H : CriticalShellSystem D.A}
       {F : CriticalPairFrontier D S radius H}
       {R : FrontierCommonDeletionParentResidual F}
       (P : RetainedInteriorBlockerCollision R)
       {Fρ : CriticalPairFrontier D S ρ H}
       {Rρ : FrontierCommonDeletionParentResidual Fρ}
       (Pρ : RetainedInteriorBlockerCollision Rρ)
       (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
       (Q : FreshThirdBlockerFiber P Pρ)
       (φ : Fin D.A.card → ℝ²)
       (hφ_injective : Function.Injective φ)
       (hφ_image : Finset.univ.image φ = D.A)
       (hφ_ccw : EuclideanGeometry.IsCcwConvexPolygon φ)
       {cL cH i j : Fin D.A.card}
       (hcL : φ cL = H.centerAt C.firstSource.1 C.firstSource.2)
       (hcH : φ cH = H.centerAt C.secondSource.1 C.secondSource.2)
       (hi : φ i = Q.source₁.1) (hj : φ j = Q.source₂.1)
       (hcenters : cL < cH) (hij : i < j) :
       ((cL < i ∧ i < cH ∧ cL < j ∧ j < cH) ∨
         ((i < cL ∨ cH < i) ∧ (j < cL ∨ cH < j))) := by
     -- This is the missing geometric/order producer; no current packet proves it.
     sorry
   ```

   Once this producer exists, invoke `freshThird_pair_order_partition` to
   obtain the four disjuncts.  The four disjuncts alone still do not close the
   residual: each Kalmanson call also needs explicit row objects and support
   memberships.
3. **Support/radius transfer.**  For each hit source, construct
   `(H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass`
   and rewrite endpoint memberships using the boundary `point_eq`; then use
   `support_eq_radius` to manufacture the equal-distance hypotheses expected by
   the parity/Kalmanson terminal.

This is the smallest honest interface: the region theorem must be a new,
explicit producer with the carrier/order hypotheses above.  Treating
`hregion` as a field silently assumed by the packet, or treating a source-clean
wrapper around the existing `sorry` terminal as closure, would be circular.

## Status

No production files were changed.  The normalized FreshThird terminal remains
open; this report records the exact first missing bridge and the hypotheses a
future producer must export.
