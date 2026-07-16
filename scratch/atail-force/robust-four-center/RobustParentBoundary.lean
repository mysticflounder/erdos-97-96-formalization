import RobustFourCenter

/-!
# Robust parent boundary

The retained critical shells already contain enough points to choose two
distinct support centers away from the first apex: one from the blocker shell
of each frontier source.  Global K4 then supplies an arbitrary selected row at
both centers.  What it does not supply is the two metric equalities saying that
those centers bisect the frontier pair.

This file isolates those two equalities as the exact direct closing producer.
It is scratch-only and does not alter the production proof.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace RobustFourCenter

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- Two distinct support centers, one in each actual blocker shell, both away
from the first apex.  No selected-row incidence at either center is included.
-/
structure TwoBlockerSupportCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) where
  zq : ℝ²
  zw : ℝ²
  zq_mem_qShell :
    zq ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  zw_mem_wShell :
    zw ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support
  zq_ne_firstApex : zq ≠ S.oppApex1
  zw_ne_firstApex : zw ≠ S.oppApex1
  zq_ne_zw : zq ≠ zw

/-- Exact four-point shell cardinality alone lets us select the two distinct
off-first-apex support centers. -/
theorem nonempty_twoBlockerSupportCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    Nonempty (TwoBlockerSupportCenters P) := by
  classical
  let Q := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  let W := (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support
  let Qoff := Q.erase S.oppApex1
  have hQcard : Q.card = 4 := by
    simpa [Q] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_card
  have hQoff : 0 < Qoff.card := by
    by_cases ho : S.oppApex1 ∈ Q
    · rw [show Qoff = Q.erase S.oppApex1 by rfl,
        Finset.card_erase_of_mem ho, hQcard]
      omega
    · rw [show Qoff = Q.erase S.oppApex1 by rfl,
        Finset.erase_eq_self.mpr ho, hQcard]
      omega
  obtain ⟨zq, hzqOff⟩ := Finset.card_pos.mp hQoff
  let Woff := (W.erase S.oppApex1).erase zq
  have hWcard : W.card = 4 := by
    simpa [W] using
      (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_card
  have hWoff : 0 < Woff.card := by
    by_cases ho : S.oppApex1 ∈ W
    · have hfirst : (W.erase S.oppApex1).card = 3 := by
        rw [Finset.card_erase_of_mem ho, hWcard]
      by_cases hzq : zq ∈ W.erase S.oppApex1
      · rw [show Woff = (W.erase S.oppApex1).erase zq by rfl,
          Finset.card_erase_of_mem hzq, hfirst]
        omega
      · rw [show Woff = (W.erase S.oppApex1).erase zq by rfl,
          Finset.erase_eq_self.mpr hzq, hfirst]
        omega
    · have hfirst : W.erase S.oppApex1 = W :=
        Finset.erase_eq_self.mpr ho
      by_cases hzq : zq ∈ W.erase S.oppApex1
      · rw [show Woff = (W.erase S.oppApex1).erase zq by rfl,
          Finset.card_erase_of_mem hzq, hfirst, hWcard]
        omega
      · rw [show Woff = (W.erase S.oppApex1).erase zq by rfl,
          Finset.erase_eq_self.mpr hzq, hfirst, hWcard]
        omega
  obtain ⟨zw, hzwOff⟩ := Finset.card_pos.mp hWoff
  have hzq := Finset.mem_erase.mp hzqOff
  have hzwZq := Finset.mem_erase.mp hzwOff
  have hzwApex := Finset.mem_erase.mp hzwZq.2
  exact ⟨{
    zq := zq
    zw := zw
    zq_mem_qShell := by simpa [Q] using hzq.2
    zw_mem_wShell := by simpa [W] using hzwApex.2
    zq_ne_firstApex := hzq.1
    zw_ne_firstApex := hzwApex.1
    zq_ne_zw := hzwZq.1.symm }⟩

private theorem exists_mem_ne_three
    {α : Type*} [DecidableEq α]
    (T : Finset α) (hcard : T.card = 4) (a b c : α) :
    ∃ x, x ∈ T ∧ x ≠ a ∧ x ≠ b ∧ x ≠ c := by
  by_contra hnone
  have hsub : T ⊆ ({a, b, c} : Finset α) := by
    intro x hx
    by_cases hxa : x = a
    · simp [hxa]
    by_cases hxb : x = b
    · simp [hxb]
    by_cases hxc : x = c
    · simp [hxc]
    exact False.elim (hnone ⟨x, hx, hxa, hxb, hxc⟩)
  have hle := Finset.card_le_card hsub
  have hthree : ({a, b, c} : Finset α).card ≤ 3 := by
    calc
      ({a, b, c} : Finset α).card ≤ ({b, c} : Finset α).card + 1 :=
        Finset.card_insert_le a {b, c}
      _ ≤ (({c} : Finset α).card + 1) + 1 :=
        Nat.add_le_add_right (Finset.card_insert_le b {c}) 1
      _ = 3 := by simp
  rw [hcard] at hle
  omega

/-- On a reciprocal-survival arm the support centers can be chosen away from
both frontier sources as well as the first apex.  Only the displayed reverse
cross-survival hypothesis is needed for this orientation. -/
structure StrictTwoBlockerSupportCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    extends TwoBlockerSupportCenters P where
  zq_ne_q : zq ≠ P.q
  zq_ne_w : zq ≠ P.w
  zw_ne_q : zw ≠ P.q
  zw_ne_w : zw ≠ P.w

theorem nonempty_strictTwoBlockerSupportCenters_of_crossSurvival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwCross :
      HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt P.w P.w_mem_A)) :
    Nonempty (StrictTwoBlockerSupportCenters P) := by
  classical
  let Q := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  let W := (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support
  have hQcard : Q.card = 4 := by
    simpa [Q] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_card
  have hWcard : W.card = 4 := by
    simpa [W] using
      (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_card
  obtain ⟨zq, hzqQ, hzqApex, hzqQsrc, hzqWsrc⟩ :=
    exists_mem_ne_three Q hQcard S.oppApex1 P.q P.w
  obtain ⟨zw, hzwW, hzwApex, hzwWsrc, hzwZq⟩ :=
    exists_mem_ne_three W hWcard S.oppApex1 P.w zq
  have hqNotW : P.q ∉ W := by
    simpa [W] using
      (ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
        H P.w_mem_A).mp hwCross
  exact ⟨{
    zq := zq
    zw := zw
    zq_mem_qShell := by simpa [Q] using hzqQ
    zw_mem_wShell := by simpa [W] using hzwW
    zq_ne_firstApex := hzqApex
    zw_ne_firstApex := hzwApex
    zq_ne_zw := hzwZq.symm
    zq_ne_q := hzqQsrc
    zq_ne_w := hzqWsrc
    zw_ne_q := by
      intro h
      apply hqNotW
      simpa [h] using hzwW
    zw_ne_w := hzwWsrc }⟩

/-- Global K4 supplies rows at the two selected support centers.  The result
deliberately carries no assertion that either row contains the frontier pair.
-/
structure TwoBlockerSupportGlobalRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) where
  centers : TwoBlockerSupportCenters P
  zqRow : SelectedFourClass D.A centers.zq
  zwRow : SelectedFourClass D.A centers.zw

theorem nonempty_twoBlockerSupportGlobalRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    Nonempty (TwoBlockerSupportGlobalRows P) := by
  rcases nonempty_twoBlockerSupportCenters P with ⟨C⟩
  have hzqA : C.zq ∈ D.A :=
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_subset_A
      C.zq_mem_qShell
  have hzwA : C.zw ∈ D.A :=
    (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_subset_A
      C.zw_mem_wShell
  rcases exists_selectedFourClass_of_globalK4 D.K4 hzqA with ⟨Kq⟩
  rcases exists_selectedFourClass_of_globalK4 D.K4 hzwA with ⟨Kw⟩
  exact ⟨{ centers := C, zqRow := Kq, zwRow := Kw }⟩

/-- The exact direct metric completion: both selected support centers bisect
the retained frontier pair. -/
structure SupportCentersBisectFrontierPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (C : TwoBlockerSupportCenters P) : Prop where
  zq_bisects : dist C.zq P.q = dist C.zq P.w
  zw_bisects : dist C.zw P.q = dist C.zw P.w

/-- The first apex and the two selected support centers would be three
distinct carrier points on the same perpendicular bisector. -/
theorem false_of_supportCentersBisectFrontierPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (C : TwoBlockerSupportCenters P)
    (B : SupportCentersBisectFrontierPair C) : False := by
  classical
  have hoA : S.oppApex1 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem
  have hzqA : C.zq ∈ D.A :=
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_subset_A
      C.zq_mem_qShell
  have hzwA : C.zw ∈ D.A :=
    (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_subset_A
      C.zw_mem_wShell
  have hoEq : dist S.oppApex1 P.q = dist S.oppApex1 P.w := by
    have hq : dist P.q S.oppApex1 = r :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
    have hw : dist P.w S.oppApex1 = r :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
    simpa only [dist_comm] using hq.trans hw.symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    P.q_mem_A P.w_mem_A P.q_ne_w
  have hthree :
      2 < (D.A.filter (fun z => dist z P.q = dist z P.w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨S.oppApex1,
      Finset.mem_filter.mpr ⟨hoA, hoEq⟩,
      C.zq, Finset.mem_filter.mpr ⟨hzqA, B.zq_bisects⟩,
      C.zw, Finset.mem_filter.mpr ⟨hzwA, B.zw_bisects⟩,
      C.zq_ne_firstApex.symm,
      C.zw_ne_firstApex.symm,
      C.zq_ne_zw⟩
  omega

/-- Pair membership in both global rows is a sufficient, but stronger,
presentation of the two missing bisector equalities. -/
structure PairIncidenceCompletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (R : TwoBlockerSupportGlobalRows P) : Prop where
  q_mem_zqRow : P.q ∈ R.zqRow.support
  w_mem_zqRow : P.w ∈ R.zqRow.support
  q_mem_zwRow : P.q ∈ R.zwRow.support
  w_mem_zwRow : P.w ∈ R.zwRow.support

theorem false_of_pairIncidenceCompletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (R : TwoBlockerSupportGlobalRows P)
    (I : PairIncidenceCompletion R) : False := by
  apply false_of_supportCentersBisectFrontierPair P R.centers
  exact {
    zq_bisects :=
      (R.zqRow.support_eq_radius P.q I.q_mem_zqRow).trans
        (R.zqRow.support_eq_radius P.w I.w_mem_zqRow).symm
    zw_bisects :=
      (R.zwRow.support_eq_radius P.q I.q_mem_zwRow).trans
        (R.zwRow.support_eq_radius P.w I.w_mem_zwRow).symm }

#print axioms nonempty_twoBlockerSupportCenters
#print axioms nonempty_strictTwoBlockerSupportCenters_of_crossSurvival
#print axioms nonempty_twoBlockerSupportGlobalRows
#print axioms false_of_supportCentersBisectFrontierPair
#print axioms false_of_pairIncidenceCompletion

end RobustFourCenter
end ATailForce
end Problem97
