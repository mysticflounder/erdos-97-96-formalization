/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CriticalSystemRebase
import FrontierContinuationDispatcher

/-!
# Scratch: choice-first parent continuation surface

The existing `FrontierContinuationEliminators F` asks for branch callbacks for
every second-apex row and every pair of globally selected continuation rows at
one already-fixed critical system.  The parent needs less: it may rebase the
H-independent geometric frontier to a favorable system, select one concrete
continuation dispatch, and close the branch actually returned by that choice.

This file checks that weaker quantifier surface and its adapter to the current
direct-`False` parent contract.  It does not construct the favorable system,
dispatch, or branch callbacks.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFavorableSystemParentSurfaceScratch

open ATailCriticalPairFrontier
open ATailCriticalSystemRebaseScratch
open ATailFrontierContinuationDispatcherScratch
open ATAILParentFalseSurface
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- Content needed only for one concretely selected continuation dispatch. -/
structure ChosenContinuationEliminators
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    (P : FrontierContinuationDispatch F) : Prop where
  crossSurvival : CrossSurvivalOutput P.rows → False
  nonEquilateral : NonEquilateralOutput H P.rows → False
  equilateral : P.rows.EquilateralResidual → False

/-- The three callbacks close the branch of the one chosen dispatch. -/
theorem false_of_chosenContinuationEliminators
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    (P : FrontierContinuationDispatch F)
    (E : ChosenContinuationEliminators P) : False := by
  rcases P.branch with hcross | hnon | heq
  · exact E.crossSurvival hcross
  · exact E.nonEquilateral hnon
  · exact E.equilateral heq

set_option linter.unusedVariables false in
/-- Strictly weaker parent content surface: for the concrete H-independent
frontier, choose a favorable critical system and only one continuation
dispatch at that system. -/
abbrev FavorableSystemContinuationContent
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
          ∃ (Hfav : CriticalShellSystem D.A)
            (P : FrontierContinuationDispatch
              (rebaseCriticalPairFrontierSystem F Hfav)),
            ChosenContinuationEliminators P

/-- A favorable-system/one-dispatch producer is sufficient for the existing
parent direct-`False` surface. -/
theorem commonCriticalMapClosingProducer_of_favorableSystemContent
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
    CommonCriticalMapClosingProducer
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  intro j hjne hjfive r hr hfour F
  rcases content j hjne hjfive r hr hfour F with ⟨Hfav, P, E⟩
  exact false_of_chosenContinuationEliminators P E

#print axioms false_of_chosenContinuationEliminators
#print axioms commonCriticalMapClosingProducer_of_favorableSystemContent

end ATailFavorableSystemParentSurfaceScratch
end Problem97
