/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Exact-five first-apex interior critical pair

An exact five-point class at the first opposite apex contains three points in
the strict interior of the corresponding non-surplus cap. Two of these points
can be chosen so that their simultaneous deletion preserves four equidistant
points at the second opposite apex.

The resulting pair determines a `CriticalPairFrontier` while retaining the
strict-interior membership facts for its two points.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstApexExactFiveInteriorFrontier

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem selectedClass_capInterior_card_ge_three_of_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard : (SelectedClass A (S.oppositeVertexByIndex i) radius).card = 5) :
    3 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.capInteriorByIndex i).card := by
  classical
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have houtside :
      (T \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (T \ S.capInteriorByIndex i).card
          ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
              (T ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ S.capInteriorByIndex i).card +
          (T ∩ S.capInteriorByIndex i).card = T.card := by
    simp [T, Finset.card_sdiff_add_card_inter]
  have hcardT : T.card = 5 := by
    simpa [T] using hcard
  change 3 ≤ (T ∩ S.capInteriorByIndex i).card
  omega

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem firstApex_interior_card_ge_three_of_card_eq_five
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    3 ≤ (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1).card := by
  rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1 S] at hcard ⊢
  exact selectedClass_capInterior_card_ge_three_of_card_eq_five
    S D.convex S.oppIndex1 hr hcard

private structure SurvivingPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ) where
  q : ℝ²
  w : ℝ²
  q_mem : q ∈ SelectedClass D.A S.oppApex1 r ∩
    S.capInteriorByIndex S.oppIndex1
  w_mem : w ∈ SelectedClass D.A S.oppApex1 r ∩
    S.capInteriorByIndex S.oppIndex1
  q_ne_w : q ≠ w
  q_survives : HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2
  w_survives : HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2

private theorem interior_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex1.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

private def SurvivingPair.toRelocation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : SurvivingPair D S r)
    (H : CriticalShellSystem D.A) :
    SurvivorPairRelocationPacket D S r H := by
  have hqClass := (Finset.mem_inter.mp P.q_mem).1
  have hwClass := (Finset.mem_inter.mp P.w_mem).1
  have hqInterior := (Finset.mem_inter.mp P.q_mem).2
  have hwInterior := (Finset.mem_inter.mp P.w_mem).2
  have hqA := (mem_selectedClass.mp hqClass).1
  have hwA := (mem_selectedClass.mp hwClass).1
  have hqMarginal :
      P.q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hqA, ?_⟩, ?_⟩
    · simpa [dist_comm] using (mem_selectedClass.mp hqClass).2
    · exact interior_not_mem_surplusCap S hqInterior
  have hwMarginal :
      P.w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hwA, ?_⟩, ?_⟩
    · simpa [dist_comm] using (mem_selectedClass.mp hwClass).2
    · exact interior_not_mem_surplusCap S hwInterior
  exact {
    q := P.q
    w := P.w
    q_mem_A := hqA
    w_mem_A := hwA
    q_mem_marginal := hqMarginal
    w_mem_marginal := hwMarginal
    q_ne_w := P.q_ne_w
    q_survives := P.q_survives
    w_survives := P.w_survives
    q_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives H hqA P.q_survives
    w_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives H hwA P.w_survives }

private theorem oppApex2_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem equidistant_mono
    {n : ℕ} {S T : Finset ℝ²} {p : ℝ²}
    (hsub : S ⊆ T)
    (h : HasNEquidistantPointsAt n S p) :
    HasNEquidistantPointsAt n T p := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzS, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzS, hzdist⟩

private structure Witness
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

private theorem nonempty_witness
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    Nonempty (Witness D S r) := by
  classical
  let I : Finset ℝ² :=
    SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1
  let T : Finset ℝ² :=
    (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  have hthreeI : 3 ≤ I.card := by
    simpa [I] using
      firstApex_interior_card_ge_three_of_card_eq_five D S hr hcard
  have hIT : I ⊆ T := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxClass, hxInterior⟩
    rcases mem_selectedClass.mp hxClass with ⟨hxA, hxRadius⟩
    exact Finset.mem_sdiff.mpr ⟨
      Finset.mem_filter.mpr ⟨hxA, by simpa [dist_comm] using hxRadius⟩,
      interior_not_mem_surplusCap S hxInterior⟩
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem S)) with
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

private def Witness.toSurvivingPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : Witness D S r) :
    SurvivingPair D S r := by
  have hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex2 := by
    apply equidistant_mono (T := D.A.erase P.q) _ P.secondApexDouble
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hdoubleSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase P.w).erase P.q) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using P.secondApexDouble
  have hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex2 := by
    apply equidistant_mono (T := D.A.erase P.w) _ hdoubleSym
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

private def Witness.toRelocation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : Witness D S r)
    (H : CriticalShellSystem D.A) :
    SurvivorPairRelocationPacket D S r H :=
  P.toSurvivingPair.toRelocation H

private theorem oppApex1_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private def Witness.toCriticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : Witness D S r)
    (H : CriticalShellSystem D.A) :
    CriticalPairFrontier D S r H := by
  let Q := P.toRelocation H
  have hqSelected : Q.q ∈ SelectedClass D.A S.oppApex1 r := by
    simpa [Q, Witness.toRelocation, Witness.toSurvivingPair,
      SurvivingPair.toRelocation] using
      (Finset.mem_inter.mp P.q_mem).1
  have hwSelected : Q.w ∈ SelectedClass D.A S.oppApex1 r := by
    simpa [Q, Witness.toRelocation, Witness.toSurvivingPair,
      SurvivingPair.toRelocation] using
      (Finset.mem_inter.mp P.w_mem).1
  have hne : Q.q ≠ Q.w := by
    simpa [Q, Witness.toRelocation, Witness.toSurvivingPair,
      SurvivingPair.toRelocation] using P.q_ne_w
  have hfirst : FirstApexSplit Q :=
    ATAILSameRadiusDoubleErase.sameRadius_double_erase_survives_or_unique_class_card_four_or_five
      (D.K4 S.oppApex1 (oppApex1_mem S))
      hqSelected hwSelected hne
  have hsecond :
      HasNEquidistantPointsAt 4
        ((D.A.erase Q.q).erase Q.w) S.oppApex2 := by
    simpa [Q, Witness.toRelocation, Witness.toSurvivingPair,
      SurvivingPair.toRelocation] using P.secondApexDouble
  exact {
    pair := Q
    firstApexSplit := hfirst
    secondApexDouble := hsecond
    secondApexSplit := Or.inl hsecond }

/-- A critical pair arising from two strict-interior points of an exact
five-point first-apex class. -/
structure ExactFiveInteriorCriticalPairFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A) where
  interiorPair : Witness D S r

/-- The production critical-pair frontier determined by the interior pair. -/
def ExactFiveInteriorCriticalPairFrontier.frontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : ExactFiveInteriorCriticalPairFrontier D S r H) :
    CriticalPairFrontier D S r H :=
  P.interiorPair.toCriticalPairFrontier H

/-- The first endpoint of the production pair lies in the strict-interior
part of the exact five-point first-apex class. -/
theorem ExactFiveInteriorCriticalPairFrontier.q_mem_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : ExactFiveInteriorCriticalPairFrontier D S r H) :
    P.frontier.pair.q ∈
      SelectedClass D.A S.oppApex1 r ∩
        S.capInteriorByIndex S.oppIndex1 :=
  P.interiorPair.q_mem

/-- The second endpoint of the production pair lies in the strict-interior
part of the exact five-point first-apex class. -/
theorem ExactFiveInteriorCriticalPairFrontier.w_mem_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : ExactFiveInteriorCriticalPairFrontier D S r H) :
    P.frontier.pair.w ∈
      SelectedClass D.A S.oppApex1 r ∩
        S.capInteriorByIndex S.oppIndex1 :=
  P.interiorPair.w_mem

/-- An exact five-point first-apex class determines a strict-interior critical
pair with simultaneous second-apex deletion. -/
theorem nonempty_exactFiveInteriorCriticalPairFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    Nonempty (ExactFiveInteriorCriticalPairFrontier D S r H) := by
  rcases nonempty_witness D S hr hcard with ⟨P⟩
  exact ⟨⟨P⟩⟩

end FirstApexExactFiveInteriorFrontier
end Problem97
