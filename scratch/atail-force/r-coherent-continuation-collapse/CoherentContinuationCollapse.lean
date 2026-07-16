/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReciprocalSwapIntegration
import AnchoredTwoRowCoverConsumer

/-!
# Collapse of the coherent R continuation

The coherent fixed-radius normal form retains several provenance-sensitive
downstream obligations:

* a terminal-hit anchored transition;
* a minimal-cycle anchored transition;
* a reciprocal common deletion;
* a reciprocal critical row; and
* the radius-spent-at-entry common deletion.

The anchored two-row-cover consumer maps every anchored transition to a fresh
`CommonDeletionTwoCenterPacket`.  The reciprocal critical row is a swapped
`FA-UNIQ4` frontier, and the spent-at-entry arm also maps to a common-deletion
packet.

This file records the resulting coarse logical projection:

1. the protected first-apex unique-card-four/five branch;
2. a generic two-center common-deletion packet; or
3. a swapped first-apex unique-card-four branch.

The projection forgets which common-deletion branch produced the packet.  It
is therefore an audit surface, not a replacement for the provenance-bearing
resolved coordinator on the closure path.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRCoherentContinuationCollapseScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRAnchoredTwoRowCoverConsumerScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapIntegrationScratch
open ATailRReciprocalSwapIntegrationScratch.CriticalPairFrontier
open ATailRReciprocalSwapReductionScratch
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- Project every resolved coherent continuation to either a generic common
deletion or the protected swapped `FA-UNIQ4` dependency.

The anchored arm is consumed by the already-checked two-row-cover theorem;
the conclusion intentionally forgets its terminal-hit versus minimal-cycle
provenance. -/
theorem resolvedCoherentContinuation_commonDeletion_or_swappedFirstApexUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hcritical}
    (h : ResolvedCoherentFixedSingleRadiusContinuation F) :
    (∃ deleted center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D Hcritical deleted center₁ S.oppApex2)) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S Hcritical) := by
  rcases h with
    ⟨T, P, _hsource, hanchored | hcommon | hswapped⟩
  · rcases hanchored with ⟨R, ⟨A⟩⟩
    rcases exists_offSurplus_sharedRowSource A with ⟨X, _hXOff⟩
    exact Or.inl
      ⟨X.point, R.firstCenter, ⟨X.toSharedRowCommonDeletionPacket⟩⟩
  · rcases hcommon with ⟨R, deleted, hpacket⟩
    exact Or.inl ⟨deleted, R.firstCenter, hpacket⟩
  · exact Or.inr hswapped

/-- A coarse projection of the current first-apex normal form.

The first arm is the protected `FA-UNIQ4`/`FA-UNIQ5` surface.  The second is
the generic common-deletion image.  The third is the same protected
`FA-UNIQ4` surface after swapping the two non-surplus roles.  The second arm
does not assert that the generic packet is terminal or uniformly
eliminable. -/
def CollapsedCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (_F : CriticalPairFrontier D S radius Hcritical) : Prop :=
  (((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) ∨
    (∃ deleted center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D Hcritical deleted center₁ S.oppApex2)) ∨
    Nonempty (SwappedFirstApexUniqueFourFrontier D S Hcritical)

/-- Project the source-current resolved coordinator to three coarse outputs. -/
theorem collapseResolvedCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hcritical}
    (h : ResolvedCurrentFirstApexFixedRadiusNormalForm F) :
    CollapsedCurrentFirstApexFixedRadiusNormalForm F := by
  rcases h with hunique | hcoherent | hspent
  · exact Or.inl hunique
  · rcases
      resolvedCoherentContinuation_commonDeletion_or_swappedFirstApexUniqueFour
        hcoherent with
      hcommon | hswapped
    · exact Or.inr (Or.inl hcommon)
    · exact Or.inr (Or.inr hswapped)
  · exact Or.inr (Or.inl hspent)

/-- Every chosen frontier reaches the coarse projected normal form. -/
theorem CriticalPairFrontier.collapsedCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    CollapsedCurrentFirstApexFixedRadiusNormalForm F :=
  collapseResolvedCurrentFirstApexFixedRadiusNormalForm
    (resolvedCurrentFirstApexFixedRadiusNormalForm F hradius hfour)

set_option linter.unusedVariables false in
/-- Parent-facing audit connector projecting every coherent R arm to the
unique-row dependency or one generic common-deletion packet.  The
provenance-bearing resolved connector remains the load-bearing interface. -/
theorem fullParent_extracts_dangerousRetainingCollapsedNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
      ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
        q ∈ S.surplusCap ∧
          ∃ radius : ℝ, 0 < radius ∧
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
              ∃ F : CriticalPairFrontier D S radius W.H,
                CollapsedCurrentFirstApexFixedRadiusNormalForm F := by
  rcases
      fullParent_extracts_dangerousRetainingResolvedNormalForm
        MT hCirc CP i rows hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem hcritical hlocalNoQFree hfixed hbase Hlive
        hcenter hsupport with
    ⟨j, hjne, hj5, W, hqSurplus, radius, hradius, hfour, F, hresolved⟩
  exact ⟨j, hjne, hj5, W, hqSurplus, radius, hradius, hfour, F,
    collapseResolvedCurrentFirstApexFixedRadiusNormalForm hresolved⟩

#print axioms
  resolvedCoherentContinuation_commonDeletion_or_swappedFirstApexUniqueFour
#print axioms collapseResolvedCurrentFirstApexFixedRadiusNormalForm
#print axioms
  CriticalPairFrontier.collapsedCurrentFirstApexFixedRadiusNormalForm
#print axioms fullParent_extracts_dangerousRetainingCollapsedNormalForm

end ATailRCoherentContinuationCollapseScratch
end Problem97
