/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FavorableRoutedBranchSurface

/-!
# Scratch: choose continuation geometry before the critical system

The trimmed second-apex row, its two strict-cap continuation centers, and the
two global continuation rows do not depend on `CriticalShellSystem`.  This
file makes that dependency order explicit.  A geometric continuation is
chosen at the original frontier; only then is a favorable critical system
chosen and the routed branch constructed.

The late-system surface is equivalent in strength to the already checked
favorable-system/one-routed-branch surface.  Its purpose is theorem discovery:
sourcewise shell overrides may depend on the concrete continuation labels.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLateCriticalSystemSurfaceScratch

open ATailCriticalPairFrontier
open ATailCriticalSystemRebaseScratch
open ATailContinuationGeometryClassifier
open ATailFavorableRoutedBranchSurfaceScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralParentProducerScratch
open ATAILParentFalseSurface
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- H-independent continuation geometry at a fixed frontier. -/
structure GeometricFrontierContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial) where
  secondApex : FrontierSecondApexRow F
  rows : TwoContinuationRows (rebasePacket D S) secondApex.row
  z₁_ne_q : rows.z₁ ≠ F.pair.q
  z₁_ne_w : rows.z₁ ≠ F.pair.w
  z₂_ne_q : rows.z₂ ≠ F.pair.q
  z₂_ne_w : rows.z₂ ≠ F.pair.w

/-- Reinterpret the same trimmed second-apex row after changing the critical
system. -/
def rebaseFrontierSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (K : FrontierSecondApexRow F)
    (Hfav : CriticalShellSystem D.A) :
    FrontierSecondApexRow (rebaseCriticalPairFrontierSystem F Hfav) where
  row := K.row
  q_not_mem := by simpa using K.q_not_mem
  w_not_mem := by simpa using K.w_not_mem

/-- Add a late-chosen critical system and route the already selected
continuation geometry. -/
def GeometricFrontierContinuation.toDispatch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (G : GeometricFrontierContinuation F)
    (Hfav : CriticalShellSystem D.A) :
    FrontierContinuationDispatch
      (rebaseCriticalPairFrontierSystem F Hfav) where
  secondApex := rebaseFrontierSecondApexRow G.secondApex Hfav
  rows := G.rows
  branch := routedContinuationBranch D S Hfav G.rows
  z₁_ne_q := by simpa using G.z₁_ne_q
  z₁_ne_w := by simpa using G.z₁_ne_w
  z₂_ne_q := by simpa using G.z₂_ne_q
  z₂_ne_w := by simpa using G.z₂_ne_w

/-- The frontier always supplies H-independent continuation geometry. -/
theorem nonempty_geometricFrontierContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial) :
    Nonempty (GeometricFrontierContinuation F) := by
  rcases nonempty_frontierSecondApexRow F with ⟨K⟩
  rcases nonempty_twoContinuationRows (rebasePacket D S) K.row with ⟨P⟩
  have hz₁K : P.z₁ ∈ K.row.support :=
    (Finset.mem_inter.mp P.z₁_mem).1
  have hz₂K : P.z₂ ∈ K.row.support :=
    (Finset.mem_inter.mp P.z₂_mem).1
  exact ⟨
    { secondApex := K
      rows := P
      z₁_ne_q := by
        intro h
        apply K.q_not_mem
        simpa [h] using hz₁K
      z₁_ne_w := by
        intro h
        apply K.w_not_mem
        simpa [h] using hz₁K
      z₂_ne_q := by
        intro h
        apply K.q_not_mem
        simpa [h] using hz₂K
      z₂_ne_w := by
        intro h
        apply K.w_not_mem
        simpa [h] using hz₂K }⟩

/-- Exact one-frontier content with the favorable system chosen after the
continuation rows and labels. -/
def LateCriticalSystemBranchContent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial) : Prop :=
  ∃ G : GeometricFrontierContinuation F,
    ∃ Hfav : CriticalShellSystem D.A,
      RoutedBranchEliminator (G.toDispatch Hfav).branch

/-- Late-system content implies the favorable-system choice-first content. -/
theorem choiceFirstContent_of_lateCriticalSystemBranchContent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial)
    (C : LateCriticalSystemBranchContent F) :
    ∃ Hfav : CriticalShellSystem D.A,
      ChoiceFirstFrontierContinuationContent
        (rebaseCriticalPairFrontierSystem F Hfav) := by
  rcases C with ⟨G, Hfav, E⟩
  exact ⟨Hfav, G.toDispatch Hfav, E⟩

/-- Conversely, a favorable-system choice-first witness can be read as
H-independent geometry followed by the same late system.  The routed payload
does not depend on which proof term of the routed disjunction was stored in
the dispatch. -/
theorem lateCriticalSystemBranchContent_of_choiceFirstContent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial)
    (C : ∃ Hfav : CriticalShellSystem D.A,
      ChoiceFirstFrontierContinuationContent
        (rebaseCriticalPairFrontierSystem F Hfav)) :
    LateCriticalSystemBranchContent F := by
  rcases C with ⟨Hfav, P, E⟩
  let K : FrontierSecondApexRow F :=
    { row := P.secondApex.row
      q_not_mem := by simpa using P.secondApex.q_not_mem
      w_not_mem := by simpa using P.secondApex.w_not_mem }
  let G : GeometricFrontierContinuation F :=
    { secondApex := K
      rows := P.rows
      z₁_ne_q := by simpa using P.z₁_ne_q
      z₁_ne_w := by simpa using P.z₁_ne_w
      z₂_ne_q := by simpa using P.z₂_ne_q
      z₂_ne_w := by simpa using P.z₂_ne_w }
  refine ⟨G, Hfav, ?_⟩
  exact E

set_option linter.unusedVariables false in
/-- Full parent content with the operationally useful choice order: frontier,
continuation geometry, favorable critical system, routed consumer. -/
abbrev LateCriticalSystemParentContent
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
          LateCriticalSystemBranchContent F

/-- The late-system parent content reaches the existing direct-`False`
producer. -/
theorem commonCriticalMapClosingProducer_of_lateCriticalSystemParentContent
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
    CommonCriticalMapClosingProducer
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive := by
  apply commonCriticalMapClosingProducer_of_favorableRoutedBranchContent
    MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hinitial hlocalNoQFree hfixed hbase Hlive
  intro j hjne hjfive r hr hfour F
  exact choiceFirstContent_of_lateCriticalSystemBranchContent F
    (content j hjne hjfive r hr hfour F)

#print axioms rebaseFrontierSecondApexRow
#print axioms GeometricFrontierContinuation.toDispatch
#print axioms nonempty_geometricFrontierContinuation
#print axioms choiceFirstContent_of_lateCriticalSystemBranchContent
#print axioms lateCriticalSystemBranchContent_of_choiceFirstContent
#print axioms commonCriticalMapClosingProducer_of_lateCriticalSystemParentContent

end ATailLateCriticalSystemSurfaceScratch
end Problem97
