/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FavorableSystemParentSurface
import NonEquilateralParentProducer

/-!
# Scratch: favorable-system, one-routed-branch parent surface

`FavorableSystemContinuationContent` already chooses one critical system and
one continuation dispatch, but its payload still supplies callbacks for all
three mutually exclusive routed propositions.  The parent only needs the
consumer selected by the branch carried by that dispatch.

This file combines critical-system rebase with the branch-only payload from
`NonEquilateralParentProducer.lean`.  It proves the resulting contract is
sufficient for the current direct-`False` parent boundary.  It does not
construct a favorable system, dispatch, or branch consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFavorableRoutedBranchSurfaceScratch

open ATailCriticalPairFrontier
open ATailCriticalSystemRebaseScratch
open ATailFavorableSystemParentSurfaceScratch
open ATailFrontierContinuationDispatcherScratch
open ATailNonEquilateralParentProducerScratch
open ATAILParentFalseSurface
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

set_option linter.unusedVariables false in
/-- Minimal choice-correct parent content: after the H-independent frontier is
fixed, choose one favorable critical system and one concrete dispatch, then
provide only the eliminator selected by that dispatch's routed branch. -/
abbrev FavorableRoutedBranchContent
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
    (Hinitial : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) : Prop :=
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  ∀ (j : Fin 3), j ≠ i → 5 ≤ (CP.capAt j).card →
    ∀ (r : ℝ), 0 < r →
      4 ≤ (SelectedClass D.A S.oppApex1 r).card →
        ∀ F : CriticalPairFrontier D S r Hinitial,
          ∃ Hfav : CriticalShellSystem D.A,
            ChoiceFirstFrontierContinuationContent
              (rebaseCriticalPairFrontierSystem F Hfav)

/-- The favorable-system, one-routed-branch contract reaches the existing
parent direct-`False` producer surface. -/
theorem commonCriticalMapClosingProducer_of_favorableRoutedBranchContent
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
    (Hinitial : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (content : FavorableRoutedBranchContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive) :
    CommonCriticalMapClosingProducer
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  intro j hjne hjfive r hr hfour F
  rcases content j hjne hjfive r hr hfour F with ⟨Hfav, C⟩
  exact false_of_criticalPairFrontier_of_choiceFirstContinuationContent
    (rebaseCriticalPairFrontierSystem F Hfav) C

/-- The earlier three-callback chosen-dispatch surface implies the routed-
branch-only contract.  No converse is asserted. -/
theorem favorableRoutedBranchContent_of_favorableSystemContent
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
    (Hinitial : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (content : FavorableSystemContinuationContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive) :
    FavorableRoutedBranchContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  intro j hjne hjfive r hr hfour F
  rcases content j hjne hjfive r hr hfour F with ⟨Hfav, P, E⟩
  refine ⟨Hfav, P, ?_⟩
  exact routedBranchEliminator_of_callbacks P.branch
    E.crossSurvival E.nonEquilateral E.equilateral

#print axioms commonCriticalMapClosingProducer_of_favorableRoutedBranchContent
#print axioms favorableRoutedBranchContent_of_favorableSystemContent

end ATailFavorableRoutedBranchSurfaceScratch
end Problem97
