/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ParentFalseSurface
import ContinuationGeometryClassifier
import ContinuationBankMatch
import JointTransitionCore

/-!
# Scratch: critical-frontier continuation dispatcher

This file closes the bookkeeping gap between the concrete
`CriticalPairFrontier` retained by the parent and the continuation-geometry
classifier.  It does not close any of the three resulting mathematical arms.

The frontier's twice-erased second-apex witness is trimmed to a selected
four-class on the original carrier which avoids both frontier sources.  That
specific row, rather than an unrelated global-K4 choice, seeds two continuation
rows.  Their classifier is routed to existing exact packet interfaces:

* cross-deletion survival gives an exact q-deleted four-row;
* the non-equilateral residual gives two exact rows with one common deletion;
* the equilateral residual is handed to the joint-transition core.

The final parent adapter therefore takes three explicit eliminators.  They are
open `Prop` fields, not assumed theorems or axioms.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierContinuationDispatcherScratch

open ATailCriticalPairFrontier
open ATailContinuationGeometryClassifier
open ATailContinuationBankMatchScratch
open ATailJointTransitionCoreScratch
open ATAILParentFalseSurface
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- A selected second-apex class extracted from the frontier's twice-erased
witness.  Its support remains on the original carrier and avoids both retained
frontier sources. -/
structure FrontierSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) where
  row : SelectedFourClass D.A S.oppApex2
  q_not_mem : F.pair.q ∉ row.support
  w_not_mem : F.pair.w ∉ row.support

/-- Trim the frontier's twice-erased second-apex witness to an exact selected
four-class, then lift its support inclusion back to `D.A`. -/
theorem nonempty_frontierSecondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) :
    Nonempty (FrontierSecondApexRow F) := by
  rcases F.secondApexDouble with ⟨rho, hrho, hcard⟩
  let C : Finset ℝ² :=
    ((D.A.erase F.pair.q).erase F.pair.w).filter
      (fun x => dist S.oppApex2 x = rho)
  have hCcard : 4 ≤ C.card := by
    simpa [C] using hcard
  obtain ⟨T, hTC, hTcard⟩ := Finset.exists_subset_card_eq hCcard
  let K : SelectedFourClass D.A S.oppApex2 :=
    { support := T
      support_subset_A := by
        intro x hx
        have hxCarrier := (Finset.mem_filter.mp (hTC hx)).1
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxCarrier).2).2
      support_card := hTcard
      radius := rho
      radius_pos := hrho
      support_eq_radius := by
        intro x hx
        exact (Finset.mem_filter.mp (hTC hx)).2
      center_not_mem := by
        intro hcenter
        have hdist := (Finset.mem_filter.mp (hTC hcenter)).2
        have hzero : (0 : ℝ) = rho := by simpa using hdist
        linarith }
  have hqNot : F.pair.q ∉ K.support := by
    intro hq
    have hqCarrier := (Finset.mem_filter.mp (hTC hq)).1
    exact
      (Finset.mem_erase.mp (Finset.mem_erase.mp hqCarrier).2).1 rfl
  have hwNot : F.pair.w ∉ K.support := by
    intro hw
    have hwCarrier := (Finset.mem_filter.mp (hTC hw)).1
    exact (Finset.mem_erase.mp hwCarrier).1 rfl
  exact ⟨{ row := K, q_not_mem := hqNot, w_not_mem := hwNot }⟩

/-- Exact four-row form accepted by the q-deleted U5 interfaces. -/
structure QDeletedFourRow
    (D : CounterexampleData) (deleted center : ℝ²) where
  support : Finset ℝ²
  row : U5QDeletedK4Class D deleted center support
  support_card : support.card = 4

/-- Package one deletion-survival fact as an exact q-deleted row. -/
theorem nonempty_qDeletedFourRow_of_survival
    {D : CounterexampleData} {deleted center : ℝ²}
    (h : HasNEquidistantPointsAt 4 (D.A.erase deleted) center) :
    Nonempty (QDeletedFourRow D deleted center) := by
  have hskeleton :
      HasNEquidistantPointsAt 4 (D.skeleton deleted) center := by
    simpa [CounterexampleData.skeleton] using h
  rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
      hskeleton with ⟨B, ⟨R⟩, hB⟩
  exact ⟨{ support := B, row := R, support_card := hB }⟩

/-- The non-equilateral half of `TwoContinuationRows.MetricResidual`. -/
def NonEquilateralResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  let d := dist P.z₁ P.z₂
  d ≠ K.radius ∧
    P.z₂ ∈ P.row₁.support ∧
    P.z₁ ∈ P.row₂.support ∧
    P.row₁.radius = d ∧
    P.row₂.radius = d ∧
    S.oppApex2 ∉ P.row₁.support ∧
    S.oppApex2 ∉ P.row₂.support

/-- A cross-survival branch together with its already-available q-deleted-row
packaging.  This is not a contradiction packet. -/
def CrossSurvivalOutput
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  (HasNEquidistantPointsAt 4 (D.A.erase P.z₂) P.z₁ ∧
      Nonempty
        (QDeletedFourRow (rebasePacket D S) P.z₂ P.z₁)) ∨
    (HasNEquidistantPointsAt 4 (D.A.erase P.z₁) P.z₂ ∧
      Nonempty
        (QDeletedFourRow (rebasePacket D S) P.z₁ P.z₂))

/-- The non-equilateral residual retains its metric data and is additionally
packaged as two exact rows with the common deletion `S.oppApex2`. -/
structure NonEquilateralOutput
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop where
  residual : NonEquilateralResidual P
  commonDeletion :
    Nonempty (CommonDeletionTwoCenterPacket
      (rebasePacket D S) H S.oppApex2 P.z₁ P.z₂)

/-- Branch-complete output after routing the two non-equilateral classifier
arms to their current exact-row packet interfaces. -/
def RoutedContinuationBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  CrossSurvivalOutput P ∨
    NonEquilateralOutput H P ∨
    P.EquilateralResidual

private theorem survives_erase_of_not_mem_support
    {A : Finset ℝ²} {center deleted : ℝ²}
    (R : SelectedFourClass A center)
    (hdeleted : deleted ∉ R.support) :
    HasNEquidistantPointsAt 4 (A.erase deleted) center := by
  refine ⟨R.radius, R.radius_pos, ?_⟩
  calc
    4 = R.support.card := R.support_card.symm
    _ ≤ ((A.erase deleted).filter
        fun x => dist center x = R.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun h => hdeleted (h ▸ hx), R.support_subset_A hx⟩,
          R.support_eq_radius x hx⟩

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Refine the continuation classifier to the three routed outputs. -/
theorem routedContinuationBranch
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) :
    RoutedContinuationBranch H P := by
  rcases P.cross_survival_or_metricResidual with hleft | hright | hmetric
  · exact Or.inl (Or.inl ⟨hleft,
      nonempty_qDeletedFourRow_of_survival
        (D := rebasePacket D S) hleft⟩)
  · exact Or.inl (Or.inr ⟨hright,
      nonempty_qDeletedFourRow_of_survival
        (D := rebasePacket D S) hright⟩)
  · rcases hmetric with hnon | heq
    · rcases hnon with
        ⟨hd, hz₂row₁, hz₁row₂, hradius₁, hradius₂,
          hapex₁, hapex₂⟩
      have hsurvives₁ :
          HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) P.z₁ :=
        survives_erase_of_not_mem_support P.row₁ hapex₁
      have hsurvives₂ :
          HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) P.z₂ :=
        survives_erase_of_not_mem_support P.row₂ hapex₂
      have hz₁A : P.z₁ ∈ D.A :=
        K.support_subset_A (Finset.mem_inter.mp P.z₁_mem).1
      have hz₂A : P.z₂ ∈ D.A :=
        K.support_subset_A (Finset.mem_inter.mp P.z₂_mem).1
      refine Or.inr (Or.inl
        { residual := ⟨hd, hz₂row₁, hz₁row₂,
            hradius₁, hradius₂, hapex₁, hapex₂⟩
          commonDeletion := ?_ })
      exact nonempty_commonDeletionTwoCenterPacket
        (D := rebasePacket D S) H (oppApex2_mem_A S)
        hz₁A hz₂A P.z₁_ne_z₂ hsurvives₁ hsurvives₂
    · exact Or.inr (Or.inr heq)

/-- The strongest checked frontier-to-continuation handoff.  In addition to
the routed branch, it records that both strict-cap continuation centers differ
from both retained frontier sources. -/
structure FrontierContinuationDispatch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) where
  secondApex : FrontierSecondApexRow F
  rows : TwoContinuationRows (rebasePacket D S) secondApex.row
  branch : RoutedContinuationBranch H rows
  z₁_ne_q : rows.z₁ ≠ F.pair.q
  z₁_ne_w : rows.z₁ ≠ F.pair.w
  z₂_ne_q : rows.z₂ ≠ F.pair.q
  z₂_ne_w : rows.z₂ ≠ F.pair.w

/-- Construct the full routed continuation dispatch from the concrete
frontier. -/
theorem nonempty_frontierContinuationDispatch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) :
    Nonempty (FrontierContinuationDispatch F) := by
  rcases nonempty_frontierSecondApexRow F with ⟨K⟩
  rcases nonempty_twoContinuationRows
      (rebasePacket D S) K.row with ⟨P⟩
  have hz₁K : P.z₁ ∈ K.row.support :=
    (Finset.mem_inter.mp P.z₁_mem).1
  have hz₂K : P.z₂ ∈ K.row.support :=
    (Finset.mem_inter.mp P.z₂_mem).1
  exact ⟨
    { secondApex := K
      rows := P
      branch := routedContinuationBranch D S H P
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

/-- The three content-bearing inputs still absent after the checked dispatch.
The equilateral field deliberately uses the joint-transition eliminator
already isolated in `JointTransitionCore.lean`. -/
structure FrontierContinuationEliminators
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) : Prop where
  crossSurvival :
    ∀ (K : FrontierSecondApexRow F)
      (P : TwoContinuationRows (rebasePacket D S) K.row),
      CrossSurvivalOutput P → False
  nonEquilateral :
    ∀ (K : FrontierSecondApexRow F)
      (P : TwoContinuationRows (rebasePacket D S) K.row),
      NonEquilateralOutput H P → False
  equilateralJoint : JointTransitionCoreEliminator D S H

/-- Once the three honest content fields are supplied, the concrete frontier
closes. -/
theorem false_of_criticalPairFrontier_of_continuationEliminators
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (E : FrontierContinuationEliminators F) : False := by
  rcases nonempty_frontierContinuationDispatch F with ⟨P⟩
  rcases P.branch with hcross | hnon | heq
  · exact E.crossSurvival P.secondApex P.rows hcross
  · exact E.nonEquilateral P.secondApex P.rows hnon
  · exact false_of_equilateralResidual_of_jointTransitionCoreEliminator
      D S H E.equilateralJoint P.rows heq

set_option linter.unusedVariables false in
/-- Parent-level content contract with exactly the same quantifier order as
`CommonCriticalMapClosingProducer`, but returning the three branch
eliminators instead of silently assuming `False`. -/
abbrev CommonCriticalMapContinuationContent
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
          FrontierContinuationEliminators F

/-- Parent adapter from the explicit three-eliminator content
contract to the existing direct-false producer surface. -/
theorem commonCriticalMapClosingProducer_of_continuationContent
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
    (content : CommonCriticalMapContinuationContent
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H) :
    CommonCriticalMapClosingProducer
      MT hCirc CP i hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem Hcritical hlocalNoQFree hfixed hbase H := by
  intro j hjne hjfive r hr hfour F
  exact false_of_criticalPairFrontier_of_continuationEliminators F
    (content j hjne hjfive r hr hfour F)

#print axioms nonempty_frontierSecondApexRow
#print axioms nonempty_qDeletedFourRow_of_survival
#print axioms routedContinuationBranch
#print axioms nonempty_frontierContinuationDispatch
#print axioms false_of_criticalPairFrontier_of_continuationEliminators
#print axioms commonCriticalMapClosingProducer_of_continuationContent

end ATailFrontierContinuationDispatcherScratch
end Problem97
