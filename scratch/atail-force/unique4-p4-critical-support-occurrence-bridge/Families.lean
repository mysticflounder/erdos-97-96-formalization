/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GeneratedData
import BridgeCore

/-!
# Semantic satisfaction of the P4 critical-support occurrence block

`GeneratedData` authenticates each compact clause against the source-core
ledger.  This module gives the five atom families their source meanings and
proves the ordinary 130 clauses satisfied.  The two cardinality clauses are
kept separate because their proof is a finite-complement argument.
-/

namespace Problem97
namespace P4CriticalSupportOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open ATailUniqueFourLateChoiceTerminalScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

abbrev clauseSat := P5OccurrenceBridgeScratch.clauseSat

theorem litSat_pos {v : Nat → Prop} {n : Nat} (h : v n) :
    P5OccurrenceBridgeScratch.litSat v (n : Int) := by
  unfold P5OccurrenceBridgeScratch.litSat
  rw [if_pos (Int.natCast_nonneg n)]
  simpa using h

theorem litSat_neg {v : Nat → Prop} {n : Nat} (hn : 1 ≤ n) (h : ¬ v n) :
    P5OccurrenceBridgeScratch.litSat v (-(n : Int)) := by
  unfold P5OccurrenceBridgeScratch.litSat
  rw [if_neg (by omega)]
  simpa using h

theorem rowVariable_pos (center point : Label) : 1 ≤ rowVariable center point := by
  simp only [rowVariable]
  split <;> omega

theorem radiusVariable_pos (center left right : Label) :
    1 ≤ radiusVariable center left right := by
  unfold radiusVariable
  omega

theorem classVariable_pos (point : Label) : 1 ≤ classVariable point := by
  unfold classVariable
  omega

theorem blockerVariable_pos (source center : Label) :
    1 ≤ blockerVariable source center := by
  fin_cases source <;> fin_cases center <;> native_decide

theorem supportVariable_pos (source point : Label) :
    1 ≤ supportVariable source point := by
  fin_cases source <;> fin_cases point <;> native_decide

/-- The source meaning of every compact atom used in this block.  The
agreement is deliberately total: the generated fallback values for unlisted
`b`/`h` atoms make one valuation usable by the later full-CNF composition. -/
structure ValAgreement (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (v : Nat → Prop) : Prop where
  row : ∀ center point : Label, center ≠ point →
    (v (rowVariable center point) ↔ rowMem Q σ center point)
  radius : ∀ center left right : Label, left < right → left ≠ center → right ≠ center →
    (v (radiusVariable center left right) ↔ radiusEq Q σ center left right)
  firstApexClass : ∀ point : Label,
    (v (classVariable point) ↔ classHit Q σ point)
  blocker : ∀ source center : Label,
    (v (blockerVariable source center) ↔ blockerVal Q σ source center)
  support : ∀ source point : Label,
    (v (supportVariable source point) ↔ criticalSupportVal Q σ source point)

theorem radiusEq_swap (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (center left right : Label) :
    radiusEq Q σ center left right ↔ radiusEq Q σ center right left := by
  unfold radiusEq
  constructor <;> intro h <;> exact h.symm

def ordinaryShape (shape : ClauseShape) : Bool := !isAtLeast shape

def ordinaryEntries : List BridgeEntry :=
  bridgeEntries.filter fun entry => ordinaryShape entry.shape

theorem ordinaryEntries_length : ordinaryEntries.length = 130 := by native_decide

theorem ordinaryShapeSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hσzero : σ 0 = 0) {v : Nat → Prop}
    (hv : ValAgreement Q σ v) (shape : ClauseShape)
    (hshape : shapeWF shape = true) (hordinary : ordinaryShape shape = true) :
    clauseSat v (shapeLits shape) := by
  cases shape with
  | pairwise left right =>
      have hpair : left < right ∧ left ≠ 0 ∧ right ≠ 0 := by
        simpa [shapeWF] using hshape
      by_cases hleft : classHit Q σ left
      · by_cases hright : classHit Q σ right
        · refine ⟨(radiusVariable 0 left right : Int), by simp [shapeLits], ?_⟩
          apply litSat_pos
          exact (hv.radius 0 left right hpair.1 hpair.2.1 hpair.2.2).mpr
            (radiusEq_zero_of_classHits Q σ hσzero hleft hright)
        · refine ⟨-(classVariable right : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (classVariable_pos right)
          exact fun h => hright ((hv.firstApexClass right).mp h)
      · refine ⟨-(classVariable left : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (classVariable_pos left)
        exact fun h => hleft ((hv.firstApexClass left).mp h)
  | blockerRow source center point =>
      have hcp : center ≠ point := by simpa [shapeWF] using hshape
      by_cases hcenter : center = 0
      · subst center
        by_cases hblocker : blockerVal Q σ source 0
        · by_cases hsupport : criticalSupportVal Q σ source point
          · refine ⟨(rowVariable 0 point : Int), by simp [shapeLits], ?_⟩
            apply litSat_pos
            exact (hv.row 0 point hcp).mpr
              (rowMem_of_blockerVal_criticalSupportVal Q σ hσzero hblocker hsupport)
          · refine ⟨-(supportVariable source point : Int), by simp [shapeLits], ?_⟩
            apply litSat_neg (supportVariable_pos source point)
            exact fun h => hsupport ((hv.support source point).mp h)
        · refine ⟨-(blockerVariable source 0 : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (blockerVariable_pos source 0)
          exact fun h => hblocker ((hv.blocker source 0).mp h)
      · refine ⟨-(blockerVariable source center : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (blockerVariable_pos source center)
        exact fun h => (blockerVal_false_of_center_ne_zero Q σ hcenter) ((hv.blocker source center).mp h)
  | supportOfRow source center point =>
      have hcp : center ≠ point := by simpa [shapeWF] using hshape
      by_cases hcenter : center = 0
      · subst center
        by_cases hblocker : blockerVal Q σ source 0
        · by_cases hrow : rowMem Q σ 0 point
          · refine ⟨(supportVariable source point : Int), by simp [shapeLits], ?_⟩
            apply litSat_pos
            exact (hv.support source point).mpr
              (criticalSupportVal_of_blockerVal_rowMem Q σ hσzero hblocker hrow)
          · refine ⟨-(rowVariable 0 point : Int), by simp [shapeLits], ?_⟩
            apply litSat_neg (rowVariable_pos 0 point)
            exact fun h => hrow ((hv.row 0 point hcp).mp h)
        · refine ⟨-(blockerVariable source 0 : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (blockerVariable_pos source 0)
          exact fun h => hblocker ((hv.blocker source 0).mp h)
      · refine ⟨-(blockerVariable source center : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (blockerVariable_pos source center)
        exact fun h => (blockerVal_false_of_center_ne_zero Q σ hcenter) ((hv.blocker source center).mp h)
  | supportOfRadius source center point left right =>
      have hdata : left < right ∧ left ≠ center ∧ right ≠ center ∧
          ((source = left ∧ point = right) ∨ (source = right ∧ point = left)) := by
        simpa [shapeWF] using hshape
      by_cases hcenter : center = 0
      · subst center
        by_cases hblocker : blockerVal Q σ source 0
        · by_cases heq : radiusEq Q σ 0 source point
          · refine ⟨(supportVariable source point : Int), by simp [shapeLits], ?_⟩
            apply litSat_pos
            exact (hv.support source point).mpr
              (criticalSupportVal_of_blockerVal_radiusEq Q σ hσzero hblocker heq)
          · refine ⟨-(radiusVariable 0 left right : Int), by simp [shapeLits], ?_⟩
            apply litSat_neg (radiusVariable_pos 0 left right)
            intro h
            have hstored : radiusEq Q σ 0 left right :=
              (hv.radius 0 left right hdata.1 hdata.2.1 hdata.2.2.1).mp h
            apply heq
            rcases hdata.2.2.2 with h | h
            · rcases h with ⟨rfl, rfl⟩
              exact hstored
            · rcases h with ⟨rfl, rfl⟩
              exact (radiusEq_swap Q σ 0 point source).mp hstored
        · refine ⟨-(blockerVariable source 0 : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (blockerVariable_pos source 0)
          exact fun h => hblocker ((hv.blocker source 0).mp h)
      · refine ⟨-(blockerVariable source center : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (blockerVariable_pos source center)
        exact fun h => (blockerVal_false_of_center_ne_zero Q σ hcenter) ((hv.blocker source center).mp h)
  | radiusOfSupport source center point left right =>
      have hdata : left < right ∧ left ≠ center ∧ right ≠ center ∧
          ((source = left ∧ point = right) ∨ (source = right ∧ point = left)) := by
        simpa [shapeWF] using hshape
      by_cases hcenter : center = 0
      · subst center
        by_cases hblocker : blockerVal Q σ source 0
        · by_cases hsupport : criticalSupportVal Q σ source point
          · have hsource : classHit Q σ source :=
              (blockerVal_zero_iff Q σ source).mp hblocker
            have hpoint : classHit Q σ point :=
              classHit_of_criticalSupportVal Q σ hsource hsupport
            refine ⟨(radiusVariable 0 left right : Int), by simp [shapeLits], ?_⟩
            apply litSat_pos
            apply (hv.radius 0 left right hdata.1 hdata.2.1 hdata.2.2.1).mpr
            rcases hdata.2.2.2 with h | h
            · rcases h with ⟨rfl, rfl⟩
              exact radiusEq_zero_of_classHits Q σ hσzero hsource hpoint
            · rcases h with ⟨rfl, rfl⟩
              exact (radiusEq_swap Q σ 0 point source).mpr
                (radiusEq_zero_of_classHits Q σ hσzero hsource hpoint)
          · refine ⟨-(supportVariable source point : Int), by simp [shapeLits], ?_⟩
            apply litSat_neg (supportVariable_pos source point)
            exact fun h => hsupport ((hv.support source point).mp h)
        · refine ⟨-(blockerVariable source 0 : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (blockerVariable_pos source 0)
          exact fun h => hblocker ((hv.blocker source 0).mp h)
      · refine ⟨-(blockerVariable source center : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (blockerVariable_pos source center)
        exact fun h => (blockerVal_false_of_center_ne_zero Q σ hcenter) ((hv.blocker source center).mp h)
  | classOfSupport source point =>
      by_cases hsource : classHit Q σ source
      · by_cases hsupport : criticalSupportVal Q σ source point
        · refine ⟨(classVariable point : Int), by simp [shapeLits], ?_⟩
          apply litSat_pos
          exact (hv.firstApexClass point).mpr
            (classHit_of_criticalSupportVal Q σ hsource hsupport)
        · refine ⟨-(supportVariable source point : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (supportVariable_pos source point)
          exact fun h => hsupport ((hv.support source point).mp h)
      · refine ⟨-(classVariable source : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (classVariable_pos source)
        exact fun h => hsource ((hv.firstApexClass source).mp h)
  | supportOfClasses source point =>
      by_cases hsource : classHit Q σ source
      · by_cases hpoint : classHit Q σ point
        · refine ⟨(supportVariable source point : Int), by simp [shapeLits], ?_⟩
          apply litSat_pos
          exact (hv.support source point).mpr
            (criticalSupportVal_of_classHits Q σ hsource hpoint)
        · refine ⟨-(classVariable point : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (classVariable_pos point)
          exact fun h => hpoint ((hv.firstApexClass point).mp h)
      · refine ⟨-(classVariable source : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (classVariable_pos source)
        exact fun h => hsource ((hv.firstApexClass source).mp h)
  | fiber source =>
      by_cases hsource : classHit Q σ source
      · refine ⟨(blockerVariable source 0 : Int), by simp [shapeLits], ?_⟩
        apply litSat_pos
        exact (hv.blocker source 0).mpr ((blockerVal_zero_iff Q σ source).mpr hsource)
      · refine ⟨-(classVariable source : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (classVariable_pos source)
        exact fun h => hsource ((hv.firstApexClass source).mp h)
  | excludes source center =>
      by_cases hcenter : center = 0
      · subst center
        by_cases hblocker : blockerVal Q σ source 0
        · refine ⟨-(supportVariable source 0 : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (supportVariable_pos source 0)
          exact fun h =>
            (not_criticalSupportVal_zero_of_blockerVal Q σ hσzero hblocker)
              ((hv.support source 0).mp h)
        · refine ⟨-(blockerVariable source 0 : Int), by simp [shapeLits], ?_⟩
          apply litSat_neg (blockerVariable_pos source 0)
          exact fun h => hblocker ((hv.blocker source 0).mp h)
      · refine ⟨-(blockerVariable source center : Int), by simp [shapeLits], ?_⟩
        apply litSat_neg (blockerVariable_pos source center)
        exact fun h => (blockerVal_false_of_center_ne_zero Q σ hcenter) ((hv.blocker source center).mp h)
  | atLeastFour _ _ =>
      simp [ordinaryShape, isAtLeast] at hordinary

theorem noSupport_of_not_atLeastFour (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : ValAgreement Q σ v)
    (source : Label) (points : List Label)
    (hnot : ¬ clauseSat v (shapeLits (.atLeastFour source points)))
    {point : Label} (hpoint : point ∈ points) :
    ¬ criticalSupportVal Q σ source point := by
  intro hsupport
  apply hnot
  refine ⟨(supportVariable source point : Int), ?_, ?_⟩
  · exact List.mem_map.mpr ⟨point, hpoint, rfl⟩
  · apply litSat_pos
    exact (hv.support source point).mpr hsupport

theorem atLeastFour_4_litsSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hσinj : Function.Injective σ)
    (hσsurj : Function.Surjective σ) {v : Nat → Prop}
    (hv : ValAgreement Q σ v) :
    clauseSat v (shapeLits (.atLeastFour 4 [10, 9, 7, 3, 8, 0, 1, 2])) := by
  by_contra hnot
  have hnot10 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 10) (by simp)
  have hnot9 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 9) (by simp)
  have hnot8 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 8) (by simp)
  have hnot7 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 7) (by simp)
  have hnot3 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 3) (by simp)
  have hnot2 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 2) (by simp)
  have hnot1 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 1) (by simp)
  have hnot0 := noSupport_of_not_atLeastFour Q σ hv 4 [10, 9, 7, 3, 8, 0, 1, 2]
    hnot (point := 0) (by simp)
  have hcover : ∀ point : Label, criticalSupportVal Q σ 4 point →
      point ∈ ({4, 5, 6} : Finset Label) := by
    intro point hpoint
    fin_cases point
    · exact (hnot0 hpoint).elim
    · exact (hnot1 hpoint).elim
    · exact (hnot2 hpoint).elim
    · exact (hnot3 hpoint).elim
    · simp
    · simp
    · simp
    · exact (hnot7 hpoint).elim
    · exact (hnot8 hpoint).elim
    · exact (hnot9 hpoint).elim
    · exact (hnot10 hpoint).elim
  have hTcard : ({4, 5, 6} : Finset Label).card < 4 := by native_decide
  exact false_of_criticalSupport_cover_card_lt_four Q σ hσinj hσsurj 4
    ({4, 5, 6} : Finset Label) hTcard hcover

theorem atLeastFour_8_litsSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hσinj : Function.Injective σ)
    (hσsurj : Function.Surjective σ) {v : Nat → Prop}
    (hv : ValAgreement Q σ v) :
    clauseSat v (shapeLits (.atLeastFour 8 [4, 2, 1, 3, 9, 7, 0, 10])) := by
  by_contra hnot
  have hnot10 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 10) (by simp)
  have hnot9 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 9) (by simp)
  have hnot7 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 7) (by simp)
  have hnot4 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 4) (by simp)
  have hnot3 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 3) (by simp)
  have hnot2 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 2) (by simp)
  have hnot1 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 1) (by simp)
  have hnot0 := noSupport_of_not_atLeastFour Q σ hv 8 [4, 2, 1, 3, 9, 7, 0, 10]
    hnot (point := 0) (by simp)
  have hcover : ∀ point : Label, criticalSupportVal Q σ 8 point →
      point ∈ ({5, 6, 8} : Finset Label) := by
    intro point hpoint
    fin_cases point
    · exact (hnot0 hpoint).elim
    · exact (hnot1 hpoint).elim
    · exact (hnot2 hpoint).elim
    · exact (hnot3 hpoint).elim
    · exact (hnot4 hpoint).elim
    · simp
    · simp
    · exact (hnot7 hpoint).elim
    · simp
    · exact (hnot9 hpoint).elim
    · exact (hnot10 hpoint).elim
  have hTcard : ({5, 6, 8} : Finset Label).card < 4 := by native_decide
  exact false_of_criticalSupport_cover_card_lt_four Q σ hσinj hσsurj 8
    ({5, 6, 8} : Finset Label) hTcard hcover

theorem atLeastEntries_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hσinj : Function.Injective σ)
    (hσsurj : Function.Surjective σ) {v : Nat → Prop}
    (hv : ValAgreement Q σ v) :
    ∀ entry ∈ atLeastEntries, clauseSat v entry.clause := by
  intro entry hentry
  simp only [atLeastEntries, List.mem_cons, List.not_mem_nil, or_false] at hentry
  rcases hentry with rfl | rfl
  · simpa [shapeLits, supportVariable] using atLeastFour_4_litsSat Q σ hσinj hσsurj hv
  · simpa [shapeLits, supportVariable] using atLeastFour_8_litsSat Q σ hσinj hσsurj hv

theorem bridgeEntrySat_of_wf (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hσzero : σ 0 = 0) {v : Nat → Prop}
    (hv : ValAgreement Q σ v) (entry : BridgeEntry)
    (hentry : entryWF entry = true) (hordinary : ordinaryShape entry.shape = true) :
    clauseSat v entry.clause := by
  have hboth : shapeWF entry.shape = true ∧
      litsSubset (shapeLits entry.shape) entry.clause = true := by
    simpa [entryWF] using hentry
  apply P5OccurrenceBridgeScratch.clauseSat_of_subset hboth.2
  exact ordinaryShapeSat Q σ hσzero hv entry.shape hboth.1 hordinary

theorem ordinaryEntries_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hσzero : σ 0 = 0) {v : Nat → Prop}
    (hv : ValAgreement Q σ v) :
    ∀ entry ∈ ordinaryEntries, clauseSat v entry.clause := by
  intro entry hentry
  rcases List.mem_filter.mp hentry with ⟨hbridge, hordinary⟩
  have hwf : entryWF entry = true :=
      List.all_eq_true.mp bridgeEntries_wf entry hbridge
  exact bridgeEntrySat_of_wf Q σ hσzero hv entry hwf hordinary

theorem bridgeEntries_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hσzero : σ 0 = 0) (hσinj : Function.Injective σ)
    (hσsurj : Function.Surjective σ) {v : Nat → Prop}
    (hv : ValAgreement Q σ v) :
    ∀ entry ∈ bridgeEntries, clauseSat v entry.clause := by
  intro entry hentry
  by_cases hordinary : ordinaryShape entry.shape = true
  · have hwf : entryWF entry = true :=
      List.all_eq_true.mp bridgeEntries_wf entry hentry
    exact bridgeEntrySat_of_wf Q σ hσzero hv entry hwf hordinary
  · have hat : isAtLeast entry.shape = true := by
      cases h : isAtLeast entry.shape with
      | false => simp [ordinaryShape, h] at hordinary
      | true => rfl
    have hmemFiltered : entry ∈ bridgeEntries.filter (fun e ↦ isAtLeast e.shape) :=
      List.mem_filter.mpr ⟨hentry, hat⟩
    have hspecial : entry ∈ atLeastEntries := by
      rw [atLeastEntries_eq_filter]
      exact hmemFiltered
    exact atLeastEntries_sat Q σ hσinj hσsurj hv entry hspecial

end P4CriticalSupportOccurrenceBridgeScratch
end Problem97
