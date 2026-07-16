/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import card_five_cross_blocker_localization

/-!
# Exact-card-five strict-interior critical frontier

The production `CriticalPairFrontier` pair is normally selected from the
whole off-surplus first-apex marginal.  Exact card five supplies three points
in the strict interior of the first non-surplus cap.  The same second-apex
one-hit argument used by the production selector therefore chooses the
double-deletion pair inside that strict interior.

This bridge makes the checked cross-blocker localization theorems applicable
to the actual frontier pair.  It does not produce a directed cross incidence
or close the remaining coincident-blocker branch.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem interior_oppIndex1_not_mem_surplusCap_for_frontier
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex1.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

private theorem oppApex2_mem_A_for_interior_frontier
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem equidistant_mono_for_interior_frontier
    {n : ℕ} {S T : Finset ℝ²} {p : ℝ²}
    (hsub : S ⊆ T)
    (h : HasNEquidistantPointsAt n S p) :
    HasNEquidistantPointsAt n T p := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzS, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzS, hzdist⟩

/-- A strict-interior pair whose simultaneous deletion preserves a K4 row at
the second opposite apex. -/
structure CardFiveInteriorDoubleDeletionPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ) where
  q : ℝ²
  w : ℝ²
  q_mem : q ∈ SelectedClass D.A S.oppApex1 r ∩
    S.capInteriorByIndex S.oppIndex1
  w_mem : w ∈ SelectedClass D.A S.oppApex1 r ∩
    S.capInteriorByIndex S.oppIndex1
  q_ne_w : q ≠ w
  secondApexDouble :
    HasNEquidistantPointsAt 4 ((D.A.erase q).erase w) S.oppApex2

/-- Exact card five permits the second-apex double-deletion pair to be chosen
inside the first non-surplus cap's strict interior. -/
theorem exists_cardFiveInteriorDoubleDeletionPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    Nonempty (CardFiveInteriorDoubleDeletionPair D S r) := by
  classical
  let I : Finset ℝ² :=
    SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1
  let T : Finset ℝ² :=
    (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  have hthreeI : 3 ≤ I.card := by
    simpa [I] using firstApex_cardFive_interior_card_ge_three D S hr hcard
  have hIT : I ⊆ T := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxClass, hxInterior⟩
    rcases mem_selectedClass.mp hxClass with ⟨hxA, hxRadius⟩
    exact Finset.mem_sdiff.mpr ⟨
      Finset.mem_filter.mpr ⟨hxA, by simpa [dist_comm] using hxRadius⟩,
      interior_oppIndex1_not_mem_surplusCap_for_frontier S hxInterior⟩
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem_A_for_interior_frontier S)) with
    ⟨rho, hrho, hfour⟩
  let hit : ℝ² → Prop := fun x =>
    x ∈ SelectedClass D.A S.oppApex2 rho
  have hhitT : (T.filter hit).card ≤ 1 := by
    simpa [T, hit] using
      firstApex_marginal_inter_secondClass_card_le_one D S r rho
  have hhitI : (I.filter hit).card ≤ 1 := by
    apply le_trans (Finset.card_le_card ?_) hhitT
    intro x hx
    rcases Finset.mem_filter.mp hx with ⟨hxI, hxHit⟩
    exact Finset.mem_filter.mpr ⟨hIT hxI, hxHit⟩
  have hsplit := Finset.card_filter_add_card_filter_not (s := I) hit
  have htwo : 2 ≤ (I.filter fun x => ¬ hit x).card := by omega
  have hone : 1 < (I.filter fun x => ¬ hit x).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨q, hq, w, hw, hqw⟩
  rcases Finset.mem_filter.mp hq with ⟨hqI, hqNot⟩
  rcases Finset.mem_filter.mp hw with ⟨hwI, hwNot⟩
  have hqNotClass : q ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [hit] using hqNot
  have hwNotClass : w ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [hit] using hwNot
  have hqCard :
      (SelectedClass (D.A.erase q) S.oppApex2 rho).card =
        (SelectedClass D.A S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hqNotClass
  have hwNotErase :
      w ∉ SelectedClass (D.A.erase q) S.oppApex2 rho := by
    intro hwErase
    exact hwNotClass (mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp (mem_selectedClass.mp hwErase).1).2,
        (mem_selectedClass.mp hwErase).2⟩)
  have hwCard :
      (SelectedClass ((D.A.erase q).erase w) S.oppApex2 rho).card =
        (SelectedClass (D.A.erase q) S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hwNotErase
  have hfourDouble :
      4 ≤ (SelectedClass ((D.A.erase q).erase w)
        S.oppApex2 rho).card := by
    rw [hwCard, hqCard]
    exact hfour
  exact ⟨{
    q := q
    w := w
    q_mem := by simpa [I] using hqI
    w_mem := by simpa [I] using hwI
    q_ne_w := hqw
    secondApexDouble := ⟨rho, hrho, by
      simpa [SelectedClass] using hfourDouble⟩ }⟩

/-- Forget the simultaneous-deletion strengthening while retaining the
strict-interior pair used by the localization theorems. -/
def CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : CardFiveInteriorDoubleDeletionPair D S r) :
    CardFiveInteriorSurvivorPair D S r := by
  have hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex2 := by
    apply equidistant_mono_for_interior_frontier
      (T := D.A.erase P.q) _ P.secondApexDouble
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hdoubleSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase P.w).erase P.q) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using P.secondApexDouble
  have hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex2 := by
    apply equidistant_mono_for_interior_frontier
      (T := D.A.erase P.w) _ hdoubleSym
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  exact {
    q := P.q
    w := P.w
    q_mem := P.q_mem
    w_mem := P.w_mem
    q_ne_w := P.q_ne_w
    q_survives := hqSurvives
    w_survives := hwSurvives }

/-- The strict-interior double-deletion pair supplies the production
relocation packet without losing its chosen endpoints. -/
def CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : CardFiveInteriorDoubleDeletionPair D S r)
    (H : CriticalShellSystem D.A) :
    SurvivorPairRelocationPacket D S r H :=
  P.toInteriorSurvivorPair.toSurvivorPairRelocationPacket H

/-- The strict-interior pair carries the complete production frontier. -/
def CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : CardFiveInteriorDoubleDeletionPair D S r)
    (H : CriticalShellSystem D.A) :
    CriticalPairFrontier D S r H := by
  let Q := P.toSurvivorPairRelocationPacket H
  have hqSelected : Q.q ∈ SelectedClass D.A S.oppApex1 r := by
    simpa [Q, CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
      CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
      (Finset.mem_inter.mp P.q_mem).1
  have hwSelected : Q.w ∈ SelectedClass D.A S.oppApex1 r := by
    simpa [Q, CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
      CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
      (Finset.mem_inter.mp P.w_mem).1
  have hne : Q.q ≠ Q.w := by
    simpa [Q, CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
      CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
      P.q_ne_w
  have hfirst : FirstApexSplit Q :=
    ATAILSameRadiusDoubleErase.sameRadius_double_erase_survives_or_unique_class_card_four_or_five
      (D.K4 S.oppApex1 (by
        rcases hi : S.surplusIdx with ⟨i, hi3⟩
        interval_cases i
        · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
        · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
        · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem))
      hqSelected hwSelected hne
  have hsecond :
      HasNEquidistantPointsAt 4
        ((D.A.erase Q.q).erase Q.w) S.oppApex2 := by
    simpa [Q, CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
      CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
      P.secondApexDouble
  exact {
    pair := Q
    firstApexSplit := hfirst
    secondApexDouble := hsecond
    secondApexSplit := Or.inl hsecond }

/-- A frontier packet that retains the strict-interior pair from which its
production frontier is definitionally constructed. -/
structure CardFiveInteriorCriticalPairFrontierPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A) where
  interiorPair : CardFiveInteriorDoubleDeletionPair D S r

/-- The production frontier carried by an exact-card-five strict-interior
packet.  Its pair is definitionally the relocation of `interiorPair`. -/
def CardFiveInteriorCriticalPairFrontierPacket.frontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : CardFiveInteriorCriticalPairFrontierPacket D S r H) :
    CriticalPairFrontier D S r H :=
  P.interiorPair.toCriticalPairFrontier H

/-- The production pair retained by the packet is exactly the relocation of
its strict-interior double-deletion pair. -/
@[simp] theorem CardFiveInteriorCriticalPairFrontierPacket.frontier_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : CardFiveInteriorCriticalPairFrontierPacket D S r H) :
    P.frontier.pair =
      P.interiorPair.toSurvivorPairRelocationPacket H := rfl

/-- Parent-facing existence of a frontier packet whose chosen pair is
retained in the strict interior. -/
theorem exists_cardFiveInteriorCriticalPairFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    Nonempty (CardFiveInteriorCriticalPairFrontierPacket D S r H) := by
  rcases exists_cardFiveInteriorDoubleDeletionPair D S hr hcard with ⟨P⟩
  exact ⟨⟨P⟩⟩

#print axioms exists_cardFiveInteriorDoubleDeletionPair
#print axioms CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier
#print axioms exists_cardFiveInteriorCriticalPairFrontier

end ATailUniqueRowProducerScratch
end Problem97
