# `false_of_freshCanonicalRowOverride` / FirstFiber terminal audit (2026-07-31)

## Current terminal and dependency

`FrontierLiveClosure.lean:11013` declares

```lean
theorem false_of_freshCanonicalRowOverride
    (source q : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hqFirst : q.1 ∉ (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support)
    (hqSecond : q.1 ∉ (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hqSource : q.1 ∉ (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    False
```

The body constructs `K := H.selectedAt q`, chooses a second point `v` from
`K.support`, rebases all data through `H.overrideAt`, and packages
`third : FreshThirdBlockerFiber P' Pρ'`.  Its final expression is

```lean
exact false_of_capSource_freshThirdBlockerFiber
  (P := P') (Pρ := Pρ') ... hcapSource' ⟨third⟩
```

`false_of_capSource_freshThirdBlockerFiber` (`FrontierLiveClosure.lean:7914`)
is an adapter to
`false_of_twoCapSources_freshThirdBlockerFiber`
(`FrontierLiveClosure.lean:7759`), whose body is an explicit `sorry`.  Thus
the override theorem is not syntactically recursive, but it terminates at the
open two-source fresh-third obligation.  The newer
`false_of_capSource_freshThirdBlockerFiber_core` (`:8912`) is also an explicit
`sorry`; the no-alignment adapter (`:8922`) only normalizes to that core.

## Source-clean FirstFiber candidates

All four declarations below are source-clean (`#print axioms` on the imported
FirstFiber `.olean` returned only `propext`, `Classical.choice`, `Quot.sound`):

* `FirstFiberOverlapDescent.lean:640`,
  `firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion`

  ```lean
  ... (Q : FreshOutsideFirstBlockerFiber P Pρ) (source : CarrierVertex D.A)
      (hcenters : centerAt source ≠ centerAt P.source₁)
      (homitP : P.source₁ ∉ sourceRow ∨ P.source₂ ∉ sourceRow)
      (homitPρ : Pρ.source₁ ∉ sourceRow ∨ Pρ.source₂ ∉ sourceRow)
      (LPρ : LocalizedCollisionCommonDeletion P) (hLPρ : LPρ.fresh = Pρ.source₁)
      (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
      (LP : LocalizedCollisionCommonDeletion Pρ) (hLP : LP.fresh = P.source₁)
      (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
      (R₂ R₃ : FullyDeletionRobustAt D ...) :
    FirstFiberCycleAlignedResidual ... ∨ FirstFiberCollisionFiveCenterDeletionResidual ...
  ```

  This produces a residual, not `False`, and requires
  `FreshOutsideFirstBlockerFiber`, localized cycles, and explicit omission
  hypotheses.  `false_of_freshCanonicalRowOverride` has a
  `FreshThirdBlockerFiber` (`third.source₁ = q`) and no such positive
  `FreshOutsideFirstBlockerFiber`/cycle package.

* `FirstFiberOverlapDescent.lean:772`,
  `false_of_firstFiber_explicit_overlap_card_ge_three`

  ```lean
  ... (Q : FreshOutsideFirstBlockerFiber P Pρ) (source : CarrierVertex D.A)
      (hcenters : centerAt source ≠ centerAt P.source₁)
      (hthree : 3 ≤ (sourceRow ∩ {P.source₁,P.source₂,Q.source.1,Q.otherOutsidePoint}).card) :
    False
  ```

* `FirstFiberOverlapDescent.lean:804`,
  `false_of_firstFiber_bothOutsideHits_and_firstPairHit`

  ```lean
  ... (Q : FreshOutsideFirstBlockerFiber P Pρ) (source : CarrierVertex D.A)
      (hcenters : ...)
      (hsourceHit : Q.source.1 ∈ sourceRow)
      (hotherHit : Q.otherOutsidePoint ∈ sourceRow)
      (hpairHit : P.source₁ ∈ sourceRow ∨ P.source₂ ∈ sourceRow) :
    False
  ```

* `FirstFiberOverlapDescent.lean:901`,
  `false_of_firstFiber_twoOutsideHits_of_capCenter`

  ```lean
  ... (Q : FreshOutsideFirstBlockerFiber P Pρ) (source : CarrierVertex D.A)
      (hsourceCenterCap : centerAt source ∈ S.capByIndex S.oppIndex1)
      (hcenters : ...)
      (hsourceHit : Q.source.1 ∈ sourceRow)
      (hotherHit : Q.otherOutsidePoint ∈ sourceRow) :
    False
  ```

The override hypotheses give `hqSource : q ∉ sourceRow`.  Since the packaged
fiber has `third.source₁ = q`, this is the negation of the first positive hit
needed by both two-hit terminals.  The `v = source` branch puts `source` on
the overridden row but still does not put `q` there; the `v ≠ source` branch
preserves the source row and retains `q ∉ sourceRow`.  `hcapSource'` carries
cross-pair deletion views, not the three-point overlap/cardinality hypothesis.

## Same-cap cross-row terminal

`FrontierLiveClosure.lean:7859`:

```lean
theorem false_of_freshThird_sameCapCrossRowAlignment
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (halign : FreshThirdSameCapCrossRowAlignment P Pρ Q source) : False
```

This is source-clean and needs both `Q.source₁.1` and `Q.source₂.1` in the
source row, outside one common cap, plus distinct blocker centers.  The
override construction supplies none of those: in the `v = source` branch the
source and `Q.source₁` centers coincide (violating `centers_ne`); in the
`v ≠ source` branch `hqSource` explicitly omits `Q.source₁ = q` from the
source row.

## Verdict

No existing source-clean FirstFiber contradiction can replace the final call
under the exact `false_of_freshCanonicalRowOverride` hypotheses.  A genuine
replacement needs a new source-clean producer from the override package to a
named positive interaction (a row hit/rich-slice or equivalent), or a direct
proof of the two-source fresh-third core.  Existing FirstFiber descent is a
residual/consumer interface, not that producer.
