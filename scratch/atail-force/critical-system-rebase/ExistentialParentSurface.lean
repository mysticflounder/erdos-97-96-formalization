/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import LateCriticalSystemSurface

/-!
# Scratch: existential outer parent surface

The direct parent adapter chooses one second-large-cap witness and one
critical-pair frontier.  It therefore does not need branch-closing content
uniformly for every large-cap index, every K4 radius, or every frontier.

This file packages the exact existential order actually consumed by the
parent: choose one second large cap, one first-apex K4 radius and frontier,
one H-independent continuation, one late favorable critical system, and the
eliminator for the one routed branch.  This is a smaller proof-construction
interface, not a logically weaker closure hypothesis.  Once a routed branch
proof is carried, its `RoutedBranchEliminator` is propositionally equivalent
to `False`; conversely `False` constructs either this content or the universal
content by elimination.  The downstream chosen-tuple audit kernel-checks the
fixed-dispatch equivalence explicitly.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExistentialParentSurfaceScratch

open ATailCriticalPairFrontier
open ATailCriticalSystemRebaseScratch
open ATailLateCriticalSystemSurfaceScratch
open ATailNonEquilateralParentProducerScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

set_option linter.unusedVariables false in
/-- The exact chosen-data boundary used by the direct parent proof.  The
second-large-cap witness is retained so a proof of the routed eliminator may
consume its cap placement and cardinality. -/
abbrev ChosenLateCriticalSystemParentContent
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
  ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
    ∃ r : ℝ, 0 < r ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
        ∃ F : CriticalPairFrontier D S r Hinitial,
          LateCriticalSystemBranchContent F

/-- The older universal outer surface implies the exact chosen-data surface.
The proof uses the same existential witnesses already selected by the parent
adapter. -/
theorem chosenParentContent_of_universalLateContent
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
    (content : LateCriticalSystemParentContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive) :
    ChosenLateCriticalSystemParentContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  obtain ⟨j, hjne, hjfive⟩ :=
    exists_secondLargeCap_of_noM44 MT hCirc CP hM hsurplus hNoM44
  obtain ⟨r, hr, hfour, ⟨F⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D S Hinitial
  exact ⟨j, hjne, hjfive, r, hr, hfour, F,
    content j hjne hjfive r hr hfour F⟩

/-- The chosen-data surface closes the parent directly.  There is no need to
first construct a universally quantified `CommonCriticalMapClosingProducer`.
-/
theorem false_of_twoLargeCaps_of_chosenLateContent
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
    (content : ChosenLateCriticalSystemParentContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive) :
    False := by
  rcases content with ⟨_j, _hjne, _hjfive, _r, _hr, _hfour, F, C⟩
  rcases choiceFirstContent_of_lateCriticalSystemBranchContent F C with
    ⟨Hfav, hclose⟩
  exact false_of_criticalPairFrontier_of_choiceFirstContinuationContent
    (rebaseCriticalPairFrontierSystem F Hfav) hclose

#print axioms chosenParentContent_of_universalLateContent
#print axioms false_of_twoLargeCaps_of_chosenLateContent

end ATailExistentialParentSurfaceScratch
end Problem97
