/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CrossSurvivalEliminator
import NonEquilateralContinuation
import LowHitResidual
import MixedProfileEliminator

/-!
# Scratch: branch-indexed parent coupling for the continuation frontier

This file states the weakest current producer-facing interface obtained by
composing the checked terminal consumers for all three continuation arms.
The interface is deliberately branch-indexed: the arms do not expose one
common selection object.

No declaration below asserts that the parent hypotheses produce this
interface.  The final adapter preserves the full quantifier order of the
existing common-critical-map parent contract.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUnifiedParentCouplingScratch

open ATailCriticalPairFrontier
open ATailContinuationGeometryClassifier
open ATailCrossSurvivalEliminatorScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointProfileEliminationScratch
open ATailJointTransitionCoreScratch
open ATailMixedProfileEliminatorScratch
open ATailNonEquilateralContinuationScratch
open ATailThirdRowProfileBankScratch
open ATAILParentFalseSurface
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- Exact terminal selection for one oriented cross-survival branch.

The parent may choose either orientation supplied by `CrossSurvivalOutput`;
only one resulting survivor row with two equal first-apex-radius outside hits
is requested. -/
def CrossSurvivalClosingSelection
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Prop :=
  ∃ survivor : SurvivingContinuationRow D S H,
    ∃ radius : ℝ,
      2 ≤ (((survivor.row.support \ S.oppCap2).filter
        fun x => dist S.oppApex1 x = radius).card)

/-- The selected cross-survival terminal is contradictory by the checked
ordered-cap separation theorem. -/
theorem CrossSurvivalClosingSelection.false
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (W : CrossSurvivalClosingSelection D S H) : False := by
  rcases W with ⟨survivor, radius, two_hits⟩
  exact survivor.false_of_two_firstApexRadius_hits radius two_hits

/-- Branch-indexed closing selection for the remaining finite profiles inside
one equilateral joint-transition packet.

This is a disjunction rather than a structure of three callbacks: only one
closing branch is required, even if two profile propositions happen to hold.
The LowHit alternatives retain the exact reciprocal-critical fresh-pair
producer; the reverse-mixed alternative retains a third carrier center on one
of its two realized bisectors. -/
def JointTransitionClosingSelection
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {x y u v : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (_J : JointTransitionPacket D S H P Ku Kv) : Prop :=
  (∃ _hu : ATailJointTransitionCoreScratch.LowHit Ku x y S.oppApex2,
      ATailLowHitResidualScratch.LowHitFreshPairClosingProducer
        (x := x) (y := y) (a := S.oppApex2) D H Ku) ∨
    (∃ _hv : ATailJointTransitionCoreScratch.LowHit Kv x y S.oppApex2,
      ATailLowHitResidualScratch.LowHitFreshPairClosingProducer
        (x := x) (y := y) (a := S.oppApex2) D H Kv) ∨
    (∃ _hmixed : MixedResidualProfile D.A x y S.oppApex2 v u
        P.rowX P.rowY Kv Ku,
      ATailMixedProfileEliminatorScratch.JointTransitionPacket.HasThirdMixedPairBisectorCenter
        D x y S.oppApex2 u v)

/-- Construction guide for the weakest disjunctive selection.  A future
parent proof may provide branch callbacks, then let the checked joint-profile
classifier choose the single callback actually needed. -/
theorem jointTransitionClosingSelection_of_branchProducers
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (produceU :
      ∀ _hu : ATailJointTransitionCoreScratch.LowHit
          Ku x y S.oppApex2,
        ATailLowHitResidualScratch.LowHitFreshPairClosingProducer
          (x := x) (y := y) (a := S.oppApex2) D H Ku)
    (produceV :
      ∀ _hv : ATailJointTransitionCoreScratch.LowHit
          Kv x y S.oppApex2,
        ATailLowHitResidualScratch.LowHitFreshPairClosingProducer
          (x := x) (y := y) (a := S.oppApex2) D H Kv)
    (produceMixed :
      ∀ _hmixed : MixedResidualProfile D.A x y S.oppApex2 v u
          P.rowX P.rowY Kv Ku,
        ATailMixedProfileEliminatorScratch.JointTransitionPacket.HasThirdMixedPairBisectorCenter
          D x y S.oppApex2 u v) :
    JointTransitionClosingSelection D S H P Ku Kv J := by
  rcases ATailJointProfileEliminationScratch.ATailJointTransitionCoreScratch.JointTransitionPacket.lowHit_or_lowHit_or_mixedResidualProfile
      J with hu | hv | hmixed
  · exact Or.inl ⟨hu, produceU hu⟩
  · exact Or.inr (Or.inl ⟨hv, produceV hv⟩)
  · exact Or.inr (Or.inr ⟨hmixed, produceMixed hmixed⟩)

/-- The exact profile classifier plus the branch-indexed coupling eliminates
every joint-transition packet. -/
theorem false_of_jointTransition_of_closingSelection
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (W : JointTransitionClosingSelection D S H P Ku Kv J) : False := by
  rcases W with ⟨hu, produce⟩ | ⟨hv, produce⟩ | ⟨hmixed, hthird⟩
  · have hu' : ATailLowHitResidualScratch.LowHit
        Ku x y S.oppApex2 := by
      simpa [ATailJointTransitionCoreScratch.LowHit,
        ATailLowHitResidualScratch.LowHit] using hu
    exact ATailLowHitResidualScratch.false_of_lowHit_of_freshPairClosingProducer
      D H Ku (P.rowX.support_subset_A J.u_mem_rowX) hu' produce
  · have hv' : ATailLowHitResidualScratch.LowHit
        Kv x y S.oppApex2 := by
      simpa [ATailJointTransitionCoreScratch.LowHit,
        ATailLowHitResidualScratch.LowHit] using hv
    exact ATailLowHitResidualScratch.false_of_lowHit_of_freshPairClosingProducer
      D H Kv (P.rowY.support_subset_A J.v_mem_rowY) hv' produce
  · exact ATailMixedProfileEliminatorScratch.JointTransitionPacket.false_of_thirdMixedPairBisectorCenter
      J
      hmixed.x_mem_rowB hmixed.a_mem_rowB
      hmixed.y_mem_rowC hmixed.a_mem_rowC
      hthird

/-- Unified producer-facing content at one concrete critical-pair frontier.

This is a single interface, but its outputs remain indexed by the actual
dispatcher branch.  Replacing the three fields by one untyped point/pair
selector would require incidences not shared by the source packet types. -/
structure UnifiedFrontierParentCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) : Prop where
  crossSurvival :
    ∀ (K : FrontierSecondApexRow F)
      (P : TwoContinuationRows (rebasePacket D S) K.row),
      CrossSurvivalOutput P → CrossSurvivalClosingSelection D S H
  nonEquilateral :
    ∀ (K : FrontierSecondApexRow F)
      (P : TwoContinuationRows (rebasePacket D S) K.row),
      NonEquilateralOutput H P → StrictOppCap1CommonHit P
  equilateral :
    ∀ {K : SelectedFourClass D.A S.oppApex2}
      (C : TwoContinuationRows (rebasePacket D S) K)
      (h : C.EquilateralResidual)
      {u v : ℝ²}
      (Ku : SelectedFourClass D.A u)
      (Kv : SelectedFourClass D.A v)
      (J : JointTransitionPacket D S H
        (equilateralRowsOfResidual C h) Ku Kv),
      JointTransitionClosingSelection D S H
        (equilateralRowsOfResidual C h) Ku Kv J

/-- Adapter for the cross-survival field of
`FrontierContinuationEliminators`. -/
theorem false_of_crossSurvival_of_unifiedParentCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    (U : UnifiedFrontierParentCoupling F)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hcross : CrossSurvivalOutput P) : False :=
  (U.crossSurvival K P hcross).false

/-- Adapter for the non-equilateral field of
`FrontierContinuationEliminators`. -/
theorem false_of_nonEquilateral_of_unifiedParentCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    (U : UnifiedFrontierParentCoupling F)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hnon : NonEquilateralOutput H P) : False :=
  false_of_nonEquilateral_of_strictOppCap1CommonHit
    hnon (U.nonEquilateral K P hnon)

/-- Adapter for the equilateral joint field of
`FrontierContinuationEliminators`. -/
theorem jointTransitionCoreEliminator_of_unifiedParentCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    (U : UnifiedFrontierParentCoupling F) :
    JointTransitionCoreEliminator D S H := by
  intro K C h u v Ku Kv J
  exact false_of_jointTransition_of_closingSelection J
    (U.equilateral C h Ku Kv J)

/-- Kernel-checked map from the branch-indexed parent coupling to all three
fields of the existing continuation eliminator. -/
theorem frontierContinuationEliminators_of_unifiedParentCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (U : UnifiedFrontierParentCoupling F) :
    FrontierContinuationEliminators F where
  crossSurvival := false_of_crossSurvival_of_unifiedParentCoupling U
  nonEquilateral := false_of_nonEquilateral_of_unifiedParentCoupling U
  equilateralJoint := jointTransitionCoreEliminator_of_unifiedParentCoupling U

set_option linter.unusedVariables false in
/-- Full parent-level coupling contract, with the quantifier order copied
verbatim from `CommonCriticalMapContinuationContent` down to the concrete
`CriticalPairFrontier`.  Every preceding MEC/cap/no-M44/live-data hypothesis
therefore remains available to a future producer proof. -/
abbrev CommonCriticalMapUnifiedParentCoupling
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (Hcritical : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) : Prop :=
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  ∀ (j : Fin 3), j ≠ i → 5 ≤ (CP.capAt j).card →
    ∀ (r : ℝ), 0 < r →
      4 ≤ (SelectedClass D.A S.oppApex1 r).card →
        ∀ F : CriticalPairFrontier D S r Hcritical,
          UnifiedFrontierParentCoupling F

/-- Preserve the full parent quantifiers while converting the unified
branch-indexed contract into the dispatcher's three-field content contract. -/
theorem commonCriticalMapContinuationContent_of_unifiedParentCoupling
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (Hcritical : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (coupling : CommonCriticalMapUnifiedParentCoupling
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H) :
    CommonCriticalMapContinuationContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H := by
  intro j hjne hjfive r hr hfour F
  exact frontierContinuationEliminators_of_unifiedParentCoupling F
    (coupling j hjne hjfive r hr hfour F)

/-- Final consumer adapter.  This theorem is conditional on the parent
coupling and does not assert that the coupling exists. -/
theorem commonCriticalMapClosingProducer_of_unifiedParentCoupling
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (Hcritical : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (coupling : CommonCriticalMapUnifiedParentCoupling
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H) :
    CommonCriticalMapClosingProducer
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H := by
  exact commonCriticalMapClosingProducer_of_continuationContent
    MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
    hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H
    (commonCriticalMapContinuationContent_of_unifiedParentCoupling
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H coupling)

#print axioms CrossSurvivalClosingSelection.false
#print axioms jointTransitionClosingSelection_of_branchProducers
#print axioms false_of_jointTransition_of_closingSelection
#print axioms frontierContinuationEliminators_of_unifiedParentCoupling
#print axioms commonCriticalMapContinuationContent_of_unifiedParentCoupling
#print axioms commonCriticalMapClosingProducer_of_unifiedParentCoupling

end ATailUnifiedParentCouplingScratch
end Problem97
