/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RTransitionLiveSurface
import blocker_cap_location
import RobustPairBlockerNormalForm

/-!
# R actual-blocker cap/metric classifier

This scratch module packages the strongest source-complete one-step statement
currently available for an ambient robust-history pair. It deliberately stops
before asserting an endpoint role, a rank decrease, a lap advance, or a
successor robust pair: none of those fields is produced by the current source.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open ATailRTransitionLiveSurfaceScratch
open ATailBlockerCapGeometryScratch

attribute [local instance] Classical.propDecidable

private theorem actualBlocker_mem_carrier
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {x : ℝ²} (hx : x ∈ A) :
    H.centerAt x hx ∈ A := by
  exact (Finset.mem_erase.mp
    (H.selectedAt x hx).toCriticalFourShell.center_mem).2

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

/-- The exact source-level outcome at the actual blocker. This proposition is
intentionally missing every endpoint, rank, lap, and successor field whose
production remains open. -/
def ActualBlockerCapMetricOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) : Prop :=
  let hxA := (mem_selectedClass.mp P.x_mem_class).1
  let b := H.centerAt P.x hxA
  let K := (H.selectedAt P.x hxA).toCriticalFourShell
  b ∈ D.A ∧
    b ≠ S.oppApex1 ∧
    b ≠ S.oppApex2 ∧
    (b = S.surplusApex ∨
      ∃ i : Fin 3, b ∈ S.capInteriorByIndex i) ∧
    ((P.y ∈ K.support ∧
        b ∉ S.surplusCap ∧
        (b = S.surplusApex ∨
          ∃ i : Fin 3,
            i ≠ S.surplusIdx ∧ b ∈ S.capInteriorByIndex i) ∧
        dist b P.x = dist b P.y ∧
        signedArea2 P.y S.oppApex1 b *
          signedArea2 P.x S.oppApex1 b < 0) ∨
      (P.y ∉ K.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.y) b ∧
        dist b P.y ≠ dist b P.x))

/-- Exact cap and metric classifier at the actual blocker of the directed
source `P.x`.

The HIT arm supplies equality for the current mate only. The OMISSION arm
supplies the opposite metric polarity. Neither arm constructs a named cap
endpoint or a successor robust-history pair. -/
theorem AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    ActualBlockerCapMetricOutcome P H := by
  let hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  let b := H.centerAt P.x hxA
  let K := (H.selectedAt P.x hxA).toCriticalFourShell
  change b ∈ D.A ∧
    b ≠ S.oppApex1 ∧
    b ≠ S.oppApex2 ∧
    (b = S.surplusApex ∨
      ∃ i : Fin 3, b ∈ S.capInteriorByIndex i) ∧
    ((P.y ∈ K.support ∧
        b ∉ S.surplusCap ∧
        (b = S.surplusApex ∨
          ∃ i : Fin 3,
            i ≠ S.surplusIdx ∧ b ∈ S.capInteriorByIndex i) ∧
        dist b P.x = dist b P.y ∧
        signedArea2 P.y S.oppApex1 b *
          signedArea2 P.x S.oppApex1 b < 0) ∨
      (P.y ∉ K.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.y) b ∧
        dist b P.y ≠ dist b P.x))
  have hb1 : b ≠ S.oppApex1 := by
    simpa [b, hxA] using
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 P H
  have hb2 : b ≠ S.oppApex2 := by
    simpa [b, hxA] using
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 P H
  have hbA : b ∈ D.A := by
    simpa [b, hxA] using actualBlocker_mem_carrier H hxA
  have hlocation :
      b = S.surplusApex ∨
        ∃ i : Fin 3, b ∈ S.capInteriorByIndex i :=
    surplusApex_or_exists_capInterior_of_ne_oppositeApices
      S hbA hb1 hb2
  refine ⟨hbA, hb1, hb2, hlocation, ?_⟩
  rcases AmbientRobustHistoryPair.sourceTransition_exact_split P H with
    hhit | homission
  · left
    have hxRadius : dist b P.x = K.radius := by
      simpa [b, K, hxA] using
        (H.selectedAt P.x hxA).toCriticalFourShell.support_eq_radius
          P.x
          (H.selectedAt P.x hxA).toCriticalFourShell.q_mem_support
    have hyRadius : dist b P.y = K.radius := by
      simpa [b, K, hxA] using
        (H.selectedAt P.x hxA).toCriticalFourShell.support_eq_radius
          P.y hhit.1
    have hnonSurplusLocation :
        b = S.surplusApex ∨
          ∃ i : Fin 3,
            i ≠ S.surplusIdx ∧ b ∈ S.capInteriorByIndex i := by
      rcases hlocation with hsurplusApex | ⟨i, hi⟩
      · exact Or.inl hsurplusApex
      · right
        refine ⟨i, ?_, hi⟩
        intro hieq
        apply hhit.2
        have hbCap : b ∈ S.capByIndex i :=
          S.capInteriorByIndex_subset_capByIndex i hi
        rw [hieq, capByIndex_surplusIdx_eq_surplusCap S] at hbCap
        exact hbCap
    let R :=
      ATailRComplementBlockerMapScratch.robustPairToSurvivorPairRelocationPacket
        P H
    have hyR :
        R.w ∈
          (H.selectedAt R.q R.q_mem_A).toCriticalFourShell.support := by
      simpa [R,
        ATailRComplementBlockerMapScratch.robustPairToSurvivorPairRelocationPacket,
        hxA] using hhit.1
    have hb1R : H.centerAt R.q R.q_mem_A ≠ S.oppApex1 := by
      simpa [R,
        ATailRComplementBlockerMapScratch.robustPairToSurvivorPairRelocationPacket,
        b, hxA] using hb1
    have hsign :
        signedArea2 P.y S.oppApex1 b *
          signedArea2 P.x S.oppApex1 b < 0 := by
      simpa [R,
        ATailRComplementBlockerMapScratch.robustPairToSurvivorPairRelocationPacket,
        b, hxA] using
        signedArea_product_neg_of_cross_membership R hyR hb1R
    exact ⟨by simpa [K, hxA] using hhit.1,
      by simpa [b, hxA] using hhit.2,
      hnonSurplusLocation,
      hxRadius.trans hyRadius.symm, hsign⟩
  · right
    have hdist : dist b P.y ≠ dist b P.x := by
      intro heq
      apply homission.1
      apply (H.selectedAt P.x hxA).toCriticalFourShell.off_row_named_label_forbidden
        (mem_selectedClass.mp P.y_mem_class).1
      have heq' :
          dist (H.centerAt P.x hxA) P.y =
            dist (H.centerAt P.x hxA) P.x := by
        simpa [b, hxA] using heq
      exact heq'.trans
        ((H.selectedAt P.x hxA).toCriticalFourShell.support_eq_radius
          P.x
          (H.selectedAt P.x hxA).toCriticalFourShell.q_mem_support)
    exact ⟨by simpa [K, hxA] using homission.1,
      by simpa [b, hxA] using homission.2,
      hdist⟩

/-- Orient the robust pair so that the routed source is strict `oppCap1`, then
apply the exact actual-blocker classifier. The orientation provenance prevents
the classifier from silently changing to an unrelated pair. -/
theorem AmbientRobustHistoryPair.exists_strictSource_actualBlocker_capMetricClassifier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    ∃ Q : AmbientRobustHistoryPair D S C rho,
      Q.x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (Q = P ∨
        Q = ATailRTransitionLiveSurfaceScratch.swapAmbientRobustHistoryPair P) ∧
      ActualBlockerCapMetricOutcome Q H := by
  rcases exists_orientation_with_strict_source P with
    ⟨Q, hQstrict, hQorientation⟩
  exact ⟨Q, hQstrict, hQorientation,
    AmbientRobustHistoryPair.actualBlocker_capMetricClassifier Q H⟩

#print axioms AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
#print axioms AmbientRobustHistoryPair.exists_strictSource_actualBlocker_capMetricClassifier

end ATailRActualBlockerTransitionScratch
end Problem97
