/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Strict-opposite-cap classifier for a directed cross hit

Suppose a card-five first-apex class supplies two sources in the strict
interior of `oppCap1`.  If the critical shell selected at one source contains
the other source, ordered-cap uniqueness excludes the selected blocker from
both caps containing `oppApex1`: the surplus cap and `oppCap2`.  Exact cap
coverage then forces the blocker into the strict interior of `oppCap1`.

This is the strongest conclusion available from a single directed cross hit.
The selected-row cap bound is saturated, rather than contradicted: the two
sources are exactly the blocker row's two `oppCap1` points.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailStrictOppCapCrossClassifierScratch

open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem oppApex1_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C2

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

private theorem blocker_ne_oppApex1_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {z : ℝ²} (hzA : z ∈ D.A)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt z hzA ≠ S.oppApex1 := by
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase z) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le
      (x := z) (n := 4) (by omega :
        5 ≤ (SelectedClass D.A S.oppApex1 r).card)
  exact actual_blocker_ne_of_deletion_survives
    H hzA ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩

/-- Two distinct centers in one indexed ordered cap cannot both be
equidistant from the same distinct carrier pair outside that cap. -/
private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : S.oppApex1 ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ S.oppApex1)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist S.oppApex1 a = dist S.oppApex1 b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = S.oppApex1 := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

/-- Exact three-cap coverage after excluding the two caps adjacent to
`oppCap1`.  In particular, the Moser-endpoint cases are impossible: every
Moser vertex belongs to at least one of those two adjacent closed caps. -/
theorem mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A)
    (hxSurplus : x ∉ S.surplusCap)
    (hxOpp2 : x ∉ S.oppCap2) :
    x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  classical
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · have hxC1 : x ∉ S.partition.C1 := by
      simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus
    have hxC3 : x ∉ S.partition.C3 := by
      simpa [SurplusCapPacket.oppCap2, hi] using hxOpp2
    have hxMoser : x ∉ S.triangle.verts := by
      intro hxMoser
      rcases S.mem_triangle_verts_cases hxMoser with h | h | h
      · exact hxC3 (by simpa [h] using S.partition.v1_mem_C3)
      · exact hxC1 (by simpa [h] using S.partition.v2_mem_C1)
      · exact hxC1 (by simpa [h] using S.partition.v3_mem_C1)
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    have hxC2 : x ∈ S.partition.C2 := by
      by_contra hxC2
      simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr ⟨
      by simpa [SurplusCapPacket.oppCap1, hi] using hxC2,
      by simpa only [Finset.mem_union, not_or] using ⟨hxSurplus, hxOpp2⟩⟩
  · have hxC2 : x ∉ S.partition.C2 := by
      simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus
    have hxC1 : x ∉ S.partition.C1 := by
      simpa [SurplusCapPacket.oppCap2, hi] using hxOpp2
    have hxMoser : x ∉ S.triangle.verts := by
      intro hxMoser
      rcases S.mem_triangle_verts_cases hxMoser with h | h | h
      · exact hxC2 (by simpa [h] using S.partition.v1_mem_C2)
      · exact hxC1 (by simpa [h] using S.partition.v2_mem_C1)
      · exact hxC2 (by simpa [h] using S.partition.v3_mem_C2)
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    have hxC3 : x ∈ S.partition.C3 := by
      by_contra hxC3
      simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr ⟨
      by simpa [SurplusCapPacket.oppCap1, hi] using hxC3,
      by simpa only [Finset.mem_union, not_or] using ⟨hxSurplus, hxOpp2⟩⟩
  · have hxC3 : x ∉ S.partition.C3 := by
      simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus
    have hxC2 : x ∉ S.partition.C2 := by
      simpa [SurplusCapPacket.oppCap2, hi] using hxOpp2
    have hxMoser : x ∉ S.triangle.verts := by
      intro hxMoser
      rcases S.mem_triangle_verts_cases hxMoser with h | h | h
      · exact hxC2 (by simpa [h] using S.partition.v1_mem_C2)
      · exact hxC3 (by simpa [h] using S.partition.v2_mem_C3)
      · exact hxC2 (by simpa [h] using S.partition.v3_mem_C2)
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    have hxC1 : x ∈ S.partition.C1 := by
      by_contra hxC1
      simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr ⟨
      by simpa [SurplusCapPacket.oppCap1, hi] using hxC1,
      by simpa only [Finset.mem_union, not_or] using ⟨hxSurplus, hxOpp2⟩⟩

/-- A forward directed cross hit between two strict-`oppCap1` card-five
sources forces the actual source blocker into strict `oppCap1`. -/
theorem forward_cross_blocker_mem_strictOppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqStrict : P.q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hwStrict : P.w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    H.centerAt P.q P.q_mem_A ∈
      S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  let c := H.centerAt P.q P.q_mem_A
  have hcA : c ∈ D.A := by
    simpa [c] using blocker_mem_A H P.q_mem_A
  have hcNe : c ≠ S.oppApex1 := by
    simpa [c] using blocker_ne_oppApex1_of_card_five
      P.q_mem_A hr hcard
  have hqOffSurplus : P.q ∉ S.surplusCap :=
    fun h => (Finset.mem_sdiff.mp hqStrict).2
      (Finset.mem_union.mpr (Or.inl h))
  have hwOffSurplus : P.w ∉ S.surplusCap :=
    fun h => (Finset.mem_sdiff.mp hwStrict).2
      (Finset.mem_union.mpr (Or.inl h))
  have hqOffOpp2 : P.q ∉ S.oppCap2 :=
    fun h => (Finset.mem_sdiff.mp hqStrict).2
      (Finset.mem_union.mpr (Or.inr h))
  have hwOffOpp2 : P.w ∉ S.oppCap2 :=
    fun h => (Finset.mem_sdiff.mp hwStrict).2
      (Finset.mem_union.mpr (Or.inr h))
  have hcEq : dist c P.q = dist c P.w := by
    exact
      ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.q
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwShell).symm
  have hapexEq :
      dist S.oppApex1 P.q = dist S.oppApex1 P.w := by
    have hqRadius :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
    have hwRadius :=
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
    simpa only [dist_comm] using hqRadius.trans hwRadius.symm
  have hcNotSurplus : c ∉ S.surplusCap := by
    intro hcSurplus
    have hcapEq := capByIndex_surplusIdx_eq_surplusCap S
    exact false_of_two_cap_centers_equidistant_outside_pair
      S S.surplusIdx
      (by simpa only [hcapEq] using hcSurplus)
      (by simpa only [hcapEq] using oppApex1_mem_surplusCap S)
      hcNe P.q_mem_A P.w_mem_A P.q_ne_w
      (by simpa only [hcapEq] using hqOffSurplus)
      (by simpa only [hcapEq] using hwOffSurplus)
      hcEq hapexEq
  have hcNotOpp2 : c ∉ S.oppCap2 := by
    intro hcOpp2
    have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
    exact false_of_two_cap_centers_equidistant_outside_pair
      S S.oppIndex2
      (by simpa only [hcapEq] using hcOpp2)
      (by simpa only [hcapEq] using oppApex1_mem_oppCap2 S)
      hcNe P.q_mem_A P.w_mem_A P.q_ne_w
      (by simpa only [hcapEq] using hqOffOpp2)
      (by simpa only [hcapEq] using hwOffOpp2)
      hcEq hapexEq
  exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps
    S hcA hcNotSurplus hcNotOpp2

/-- The reciprocal directed cross hit has the symmetric classifier. -/
theorem reverse_cross_blocker_mem_strictOppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqStrict : P.q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hwStrict : P.w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hqShell :
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support) :
    H.centerAt P.w P.w_mem_A ∈
      S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  let Pswap : SurvivorPairRelocationPacket D S r H :=
    { q := P.w
      w := P.q
      q_mem_A := P.w_mem_A
      w_mem_A := P.q_mem_A
      q_mem_marginal := P.w_mem_marginal
      w_mem_marginal := P.q_mem_marginal
      q_ne_w := P.q_ne_w.symm
      q_survives := P.w_survives
      w_survives := P.q_survives
      q_blocker_ne_oppApex2 := P.w_blocker_ne_oppApex2
      w_blocker_ne_oppApex2 := P.q_blocker_ne_oppApex2 }
  simpa [Pswap] using forward_cross_blocker_mem_strictOppCap1
    Pswap hwStrict hqStrict hr hcard hqShell

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {p : ℝ²}
    (hAB : A ⊆ B)
    (hA : HasNEquidistantPointsAt n A p) :
    HasNEquidistantPointsAt n B p := by
  rcases hA with ⟨rho, hrho, hcard⟩
  refine ⟨rho, hrho, le_trans hcard (Finset.card_le_card ?_)⟩
  intro x hx
  rcases Finset.mem_filter.mp hx with ⟨hxA, hxdist⟩
  exact Finset.mem_filter.mpr ⟨hAB hxA, hxdist⟩

/-- Direct composition interface for
`exists_strictOppCap1_pair_double_deletion_survives_secondApex_of_card_five`.

The hypothesis is exactly that extractor's existential conclusion.  It is
converted into an actual `SurvivorPairRelocationPacket`; either directed
cross hit then has a strict-`oppCap1` blocker. -/
theorem exists_relocationPair_with_strict_cross_classifiers
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hextract :
      ∃ q w : ℝ²,
        q ∈ SelectedClass D.A S.oppApex1 r ∧
        w ∈ SelectedClass D.A S.oppApex1 r ∧
        q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
        w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
        q ≠ w ∧
        HasNEquidistantPointsAt 4
          ((D.A.erase q).erase w) S.oppApex2) :
    ∃ P : SurvivorPairRelocationPacket D S r H,
      P.q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      P.w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase P.q).erase P.w) S.oppApex2 ∧
      (P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support →
        H.centerAt P.q P.q_mem_A ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) ∧
      (P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support →
        H.centerAt P.w P.w_mem_A ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) := by
  rcases hextract with
    ⟨q, w, hqClass, hwClass, hqStrict, hwStrict, hqw, hdouble⟩
  have hqA : q ∈ D.A := (mem_selectedClass.mp hqClass).1
  have hwA : w ∈ D.A := (mem_selectedClass.mp hwClass).1
  have hqMarginal :
      q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap := by
    exact Finset.mem_sdiff.mpr ⟨
      Finset.mem_filter.mpr ⟨hqA, by
        simpa only [dist_comm] using (mem_selectedClass.mp hqClass).2⟩,
      fun h => (Finset.mem_sdiff.mp hqStrict).2
        (Finset.mem_union.mpr (Or.inl h))⟩
  have hwMarginal :
      w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap := by
    exact Finset.mem_sdiff.mpr ⟨
      Finset.mem_filter.mpr ⟨hwA, by
        simpa only [dist_comm] using (mem_selectedClass.mp hwClass).2⟩,
      fun h => (Finset.mem_sdiff.mp hwStrict).2
        (Finset.mem_union.mpr (Or.inl h))⟩
  have hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 :=
    equidistant_mono (by
      intro x hx
      exact (Finset.mem_erase.mp hx).2) hdouble
  have hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2 :=
    equidistant_mono (by
      intro x hx
      rcases Finset.mem_erase.mp hx with ⟨hxw, hxEraseQ⟩
      exact Finset.mem_erase.mpr
        ⟨hxw, (Finset.mem_erase.mp hxEraseQ).2⟩) hdouble
  let P : SurvivorPairRelocationPacket D S r H :=
    { q := q
      w := w
      q_mem_A := hqA
      w_mem_A := hwA
      q_mem_marginal := hqMarginal
      w_mem_marginal := hwMarginal
      q_ne_w := hqw
      q_survives := hqSurvives
      w_survives := hwSurvives
      q_blocker_ne_oppApex2 :=
        actual_blocker_ne_of_deletion_survives H hqA hqSurvives
      w_blocker_ne_oppApex2 :=
        actual_blocker_ne_of_deletion_survives H hwA hwSurvives }
  have hqStrictP :
      P.q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
    change q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
    exact hqStrict
  have hwStrictP :
      P.w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
    change w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
    exact hwStrict
  have hdoubleP :
      HasNEquidistantPointsAt 4
        ((D.A.erase P.q).erase P.w) S.oppApex2 := by
    change HasNEquidistantPointsAt 4
      ((D.A.erase q).erase w) S.oppApex2
    exact hdouble
  refine ⟨P, hqStrictP, hwStrictP, hdoubleP, ?_, ?_⟩
  · intro hwShell
    exact forward_cross_blocker_mem_strictOppCap1
      P hqStrictP hwStrictP hr hcard hwShell
  · intro hqShell
    exact reverse_cross_blocker_mem_strictOppCap1
      P hqStrictP hwStrictP hr hcard hqShell

/-- Once the forward blocker is localized, selected-row cap multiplicity is
exactly saturated: `q,w` are precisely its two support points in `oppCap1`.
Thus the cap bound does not by itself close the directed-cross branch. -/
theorem forward_cross_selected_support_inter_oppCap1_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqStrict : P.q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hwStrict : P.w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∩
        S.oppCap1 = ({P.q, P.w} : Finset ℝ²) := by
  classical
  let K := (H.selectedAt P.q P.q_mem_A).toSelectedFourClass
  have hcStrict := forward_cross_blocker_mem_strictOppCap1
    P hqStrict hwStrict hr hcard hwShell
  have hcOpp1 : H.centerAt P.q P.q_mem_A ∈ S.oppCap1 :=
    (Finset.mem_sdiff.mp hcStrict).1
  have hcapEq := capByIndex_oppIndex1_eq_oppCap1 S
  have hinterLe :
      ((K.support ∩ S.oppCap1).card ≤ 2) := by
    simpa only [hcapEq] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1 K (by simpa only [hcapEq] using hcOpp1)
  have hpairSub :
      ({P.q, P.w} : Finset ℝ²) ⊆ K.support ∩ S.oppCap1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support,
        (Finset.mem_sdiff.mp hqStrict).1⟩
    · exact Finset.mem_inter.mpr ⟨hwShell,
        (Finset.mem_sdiff.mp hwStrict).1⟩
  have hpairCard : ({P.q, P.w} : Finset ℝ²).card = 2 := by
    simp [P.q_ne_w]
  symm
  apply Finset.eq_of_subset_of_card_le
  · simpa [K, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using hpairSub
  · rw [hpairCard]
    simpa [K, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using hinterLe

/-- Consequently, the same blocker row has exactly two support points
outside `oppCap1`; this is the remaining two-point producer surface. -/
theorem forward_cross_selected_support_sdiff_oppCap1_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqStrict : P.q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hwStrict : P.w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support \
        S.oppCap1).card = 2 := by
  let T := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  have hinterEq := forward_cross_selected_support_inter_oppCap1_eq_pair
    P hqStrict hwStrict hr hcard hwShell
  have hinterCard : (T ∩ S.oppCap1).card = 2 := by
    rw [hinterEq]
    simp [P.q_ne_w]
  have hsplit :
      (T ∩ S.oppCap1).card + (T \ S.oppCap1).card = T.card :=
    Finset.card_inter_add_card_sdiff T S.oppCap1
  have hTcard : T.card = 4 := by
    simpa [T] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_card
  rw [hinterCard, hTcard] at hsplit
  have hsdiff : (T \ S.oppCap1).card = 2 := by omega
  simpa [T] using hsdiff

/-- A forward cross hit exhausts the blocker row's strict-`oppCap1`
capacity.  Hence no third strict-`oppCap1` source distinct from both endpoints
can lie in that row. -/
theorem forward_cross_excludes_third_strictOppCap1_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqStrict : P.q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hwStrict : P.w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    {z : ℝ²}
    (hzStrict : z ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hzq : z ≠ P.q) (hzw : z ≠ P.w) :
    z ∉ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
  intro hzSupport
  have hzInter :
      z ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∩
        S.oppCap1 :=
    Finset.mem_inter.mpr ⟨hzSupport, (Finset.mem_sdiff.mp hzStrict).1⟩
  rw [forward_cross_selected_support_inter_oppCap1_eq_pair
    P hqStrict hwStrict hr hcard hwShell] at hzInter
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzInter
  exact hzInter.elim hzq hzw

#print axioms mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps
#print axioms forward_cross_blocker_mem_strictOppCap1
#print axioms reverse_cross_blocker_mem_strictOppCap1
#print axioms exists_relocationPair_with_strict_cross_classifiers
#print axioms forward_cross_selected_support_inter_oppCap1_eq_pair
#print axioms forward_cross_selected_support_sdiff_oppCap1_card_eq_two
#print axioms forward_cross_excludes_third_strictOppCap1_source

end ATailStrictOppCapCrossClassifierScratch
end Problem97
