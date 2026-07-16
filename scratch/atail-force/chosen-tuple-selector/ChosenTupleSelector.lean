/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExistentialParentSurface

/-!
# Scratch: exact selection surface for one closing continuation tuple

This file audits the existential choices in
`ChosenLateCriticalSystemParentContent`.  It separates the inert
second-large-cap witness from the geometric continuation choices, proves
that every explicit admissible second-apex row and pair of continuation rows
gives a `GeometricFrontierContinuation`, and records a direct adapter for one
chosen tuple which reaches the existing non-equilateral common-hit consumer.

It also checks an important logical boundary: once the routed disjunction is
available, `RoutedBranchEliminator` is equivalent to `False`.  Selecting a
tuple does not by itself construct that proposition.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailChosenTupleSelectorScratch

open ATailContinuationGeometryClassifier
open ATailCriticalPairFrontier
open ATailExistentialParentSurfaceScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailLateCriticalSystemSurfaceScratch
open ATailNonEquilateralContinuationScratch
open ATailNonEquilateralParentProducerScratch
open ATAILParentFalseSurface
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The second-large-cap choice carried by the parent. -/
def SecondLargeCapChoice
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) : Prop :=
  ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card

/-- The remaining chosen frontier and closing continuation, after removing
the logically independent second-large-cap witness. -/
def ChosenFrontierClosingContinuation
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (Hinitial : CriticalShellSystem D.A) : Prop :=
  ∃ r : ℝ, 0 < r ∧
    4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
      ∃ F : CriticalPairFrontier D S r Hinitial,
        LateCriticalSystemBranchContent F

/-- The chosen parent surface factors into two independent existential
choices.  In particular, the selected cap index does not constrain the
radius, frontier, continuation rows, late system, or routed eliminator. -/
theorem chosenParentContent_iff_independent_cap_and_continuation
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
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    ChosenLateCriticalSystemParentContent
        MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive ↔
      SecondLargeCapChoice CP i ∧
        ChosenFrontierClosingContinuation D
          (leafSurplusPacket MT hCirc CP i hM hsurplus) Hinitial := by
  constructor
  · rintro ⟨j, hjne, hjfive, r, hr, hfour, F, C⟩
    exact ⟨⟨j, hjne, hjfive⟩,
      ⟨r, hr, hfour, F, C⟩⟩
  · rintro ⟨⟨j, hjne, hjfive⟩,
      ⟨r, hr, hfour, F, C⟩⟩
    exact ⟨j, hjne, hjfive, r, hr, hfour, F, C⟩

/-- For fixed parent parameters, the chosen content is itself equivalent to
`False`: its forward direction is the checked direct parent closer, and the
reverse direction is ex falso. -/
theorem chosenParentContent_iff_false
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
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    ChosenLateCriticalSystemParentContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive ↔
        False := by
  constructor
  · exact false_of_twoLargeCaps_of_chosenLateContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive
  · exact False.elim

/-- The apparent reverse from chosen content to the older universal content
is available propositionally: chosen content already yields `False`, from
which every universal callback follows.  This is not a construction of those
callbacks from the selected tuple. -/
theorem universalLateContent_of_chosenParentContent
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
    LateCriticalSystemParentContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  exact (false_of_twoLargeCaps_of_chosenLateContent
    MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive
      content).elim

/-- Exact logical comparison of the old universal and new chosen parent
content.  They are equivalent propositions for fixed parent parameters,
although their direct proof-construction obligations have different
quantifier order. -/
theorem chosenParentContent_iff_universalLateContent
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
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    ChosenLateCriticalSystemParentContent
        MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive ↔
      LateCriticalSystemParentContent
        MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  constructor
  · exact universalLateContent_of_chosenParentContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive
  · exact chosenParentContent_of_universalLateContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive

/-- Every explicit admissible second-apex row and pair of continuation rows
extends to the late-system geometric continuation.  The four source
inequalities are consequences of the selected support memberships and the
two frontier omissions, not additional choices. -/
def geometricContinuationOfChoices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row) :
    GeometricFrontierContinuation F where
  secondApex := K
  rows := P
  z₁_ne_q := by
    intro h
    apply K.q_not_mem
    simpa [h] using (Finset.mem_inter.mp P.z₁_mem).1
  z₁_ne_w := by
    intro h
    apply K.w_not_mem
    simpa [h] using (Finset.mem_inter.mp P.z₁_mem).1
  z₂_ne_q := by
    intro h
    apply K.q_not_mem
    simpa [h] using (Finset.mem_inter.mp P.z₂_mem).1
  z₂_ne_w := by
    intro h
    apply K.w_not_mem
    simpa [h] using (Finset.mem_inter.mp P.z₂_mem).1

/-- Exact characterization of the H-independent continuation choice: it is
nothing more than one frontier-compatible second-apex row and one admissible
pair of global continuation rows at two of its strict-cap support points. -/
theorem nonempty_geometricContinuation_iff_explicit_row_choices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial) :
    Nonempty (GeometricFrontierContinuation F) ↔
      ∃ K : FrontierSecondApexRow F,
        Nonempty (TwoContinuationRows (rebasePacket D S) K.row) := by
  constructor
  · rintro ⟨G⟩
    exact ⟨G.secondApex, ⟨G.rows⟩⟩
  · rintro ⟨K, ⟨P⟩⟩
    exact ⟨geometricContinuationOfChoices K P⟩

/-- For any routed proof term, its branch-local eliminator is itself a
contradiction.  The routed proof is deliberately irrelevant to the
definition. -/
theorem routedBranchEliminator_iff_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (branch : RoutedContinuationBranch H P) :
    RoutedBranchEliminator branch ↔ False := by
  constructor
  · rintro (⟨hcross, close⟩ | ⟨hnon, close⟩ | ⟨heq, close⟩)
    · exact close hcross
    · exact close hnon
    · exact close heq
  · exact False.elim

/-- The three fixed-dispatch callbacks, stated without quantifying over
alternative rows or systems. -/
def AllRoutedAlternativesImpossible
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  (CrossSurvivalOutput P → False) ∧
    (NonEquilateralOutput H P → False) ∧
    (P.EquilateralResidual → False)

/-- Once the exhaustive routed disjunction is stored in a dispatch, the
branch-local eliminator and all three fixed-dispatch callbacks are
propositionally equivalent.  The branch-only presentation changes the
construction interface, but not the mathematical strength of the payload. -/
theorem routedBranchEliminator_iff_allAlternativesImpossible
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (branch : RoutedContinuationBranch H P) :
    RoutedBranchEliminator branch ↔
      AllRoutedAlternativesImpossible H P := by
  constructor
  · intro E
    exact (routedBranchEliminator_iff_false branch).mp E |>.elim
  · rintro ⟨cross, nonEquilateral, equilateral⟩
    exact routedBranchEliminator_of_callbacks branch
      cross nonEquilateral equilateral

/-- One deliberately selected non-equilateral tuple which reaches the
already checked strict-first-cap common-hit consumer. -/
structure NonEquilateralCommonHitChoice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial) where
  secondApex : FrontierSecondApexRow F
  rows : TwoContinuationRows (rebasePacket D S) secondApex.row
  system : CriticalShellSystem D.A
  output : NonEquilateralOutput system rows
  commonHit : StrictOppCap1CommonHit rows

namespace NonEquilateralCommonHitChoice

/-- The selected row data, with the frontier-source inequalities derived. -/
def geometric
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (C : NonEquilateralCommonHitChoice F) :
    GeometricFrontierContinuation F :=
  geometricContinuationOfChoices C.secondApex C.rows

/-- The existing non-equilateral terminal supplies the exact routed
eliminator for this selected tuple. -/
theorem routedEliminator
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (C : NonEquilateralCommonHitChoice F) :
    RoutedBranchEliminator
      (routedContinuationBranch D S C.system C.rows) := by
  exact Or.inr (Or.inl
    ⟨C.output, fun N =>
      false_of_nonEquilateral_of_strictOppCap1CommonHit N C.commonHit⟩)

/-- Direct adapter from the selected closed subcase to the exact late-system
frontier content. -/
theorem lateCriticalSystemBranchContent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (C : NonEquilateralCommonHitChoice F) :
    ATailLateCriticalSystemSurfaceScratch.LateCriticalSystemBranchContent F := by
  refine ⟨C.geometric, C.system, ?_⟩
  change RoutedBranchEliminator
    (routedContinuationBranch D S C.system C.rows)
  exact C.routedEliminator

end NonEquilateralCommonHitChoice

/-- Full selected-tuple hypothesis for the narrow non-equilateral terminal.
It retains the independent second-large-cap witness but does not impose any
universal condition on alternative indices, radii, frontiers, rows, or
critical systems. -/
def ChosenNonEquilateralCommonHitTuple
    {D : CounterexampleData} {M : MoserTriangle D.A}
    (CP : CapTriple D.A M) (i : Fin 3)
    (S : SurplusCapPacket D.A)
    (Hinitial : CriticalShellSystem D.A) : Prop :=
  ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
    ∃ r : ℝ, 0 < r ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
        ∃ F : CriticalPairFrontier D S r Hinitial,
          Nonempty (NonEquilateralCommonHitChoice F)

/-- The narrow chosen-tuple hypothesis constructs the exact existential
parent content. -/
theorem chosenParentContent_of_nonEquilateralCommonHitTuple
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
    (selection : ChosenNonEquilateralCommonHitTuple CP i
      (leafSurplusPacket MT hCirc CP i hM hsurplus) Hinitial) :
    ChosenLateCriticalSystemParentContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  rcases selection with
    ⟨j, hjne, hjfive, r, hr, hfour, F, ⟨C⟩⟩
  exact ⟨j, hjne, hjfive, r, hr, hfour, F,
    C.lateCriticalSystemBranchContent⟩

#print axioms chosenParentContent_iff_independent_cap_and_continuation
#print axioms chosenParentContent_iff_false
#print axioms universalLateContent_of_chosenParentContent
#print axioms chosenParentContent_iff_universalLateContent
#print axioms geometricContinuationOfChoices
#print axioms nonempty_geometricContinuation_iff_explicit_row_choices
#print axioms routedBranchEliminator_iff_false
#print axioms routedBranchEliminator_iff_allAlternativesImpossible
#print axioms NonEquilateralCommonHitChoice.lateCriticalSystemBranchContent
#print axioms chosenParentContent_of_nonEquilateralCommonHitTuple

end ATailChosenTupleSelectorScratch
end Problem97
