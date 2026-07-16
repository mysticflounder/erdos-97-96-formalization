import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Robust four-center scratch boundary

This file isolates two facts needed by the live robust branch:

* the transferable counting mechanism behind the sibling `p97-rvol`
  two-hit theorem; and
* the direct three-bisector-center contradiction obtained if global rows at
  distinct support points of both actual blocker shells contain the frontier
  pair.

No production module imports this file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace RobustFourCenter

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy

/-- The exact counting mechanism behind the sibling-bank two-hit theorem.

A selected four-row can spend at most two points on a selected four-row at a
different center.  If all remaining support is confined to `anchors`, at
least two selected points lie in `anchors`.
-/
theorem two_le_selected_inter_anchors_of_support_confinement
    {A : Finset ℝ²} {baseCenter rowCenter : ℝ²}
    (Kbase : SelectedFourClass A baseCenter)
    (Krow : SelectedFourClass A rowCenter)
    (hcenters : rowCenter ≠ baseCenter)
    (anchors : Finset ℝ²)
    (hconfined : Krow.support ⊆ Kbase.support ∪ anchors) :
    2 ≤ (Krow.support ∩ anchors).card := by
  classical
  let B := Krow.support
  let R := Kbase.support
  have hle : (B ∩ R).card ≤ 2 := by
    simpa [B, R] using
      SelectedFourClass.inter_card_le_two Krow Kbase hcenters
  have hsplit : (B ∩ R).card + (B \ R).card = B.card :=
    Finset.card_inter_add_card_sdiff B R
  have hBcard : B.card = 4 := by
    simpa [B] using Krow.support_card
  have htwoOff : 2 ≤ (B \ R).card := by
    omega
  have hOffSub : B \ R ⊆ B ∩ anchors := by
    intro z hz
    have hzB : z ∈ B := (Finset.mem_sdiff.mp hz).1
    have hzNotR : z ∉ R := (Finset.mem_sdiff.mp hz).2
    have hzUnion : z ∈ Kbase.support ∪ anchors :=
      hconfined (by simpa [B] using hzB)
    have hzAnchor : z ∈ anchors := by
      rcases Finset.mem_union.mp hzUnion with hzBase | hzAnchor
      · exact False.elim (hzNotR (by simpa [R] using hzBase))
      · exact hzAnchor
    exact Finset.mem_inter.mpr ⟨hzB, hzAnchor⟩
  exact le_trans htwoOff (Finset.card_le_card hOffSub)

/-- Global K4 really does supply rows at support points of both actual blocker
shells.  It supplies no prescribed membership in those rows.
-/
theorem exists_global_rows_at_two_blocker_support_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {zq zw : ℝ²}
    (hzq :
      zq ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hzw :
      zw ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support) :
    Nonempty (SelectedFourClass D.A zq) ∧
      Nonempty (SelectedFourClass D.A zw) := by
  have hzqA : zq ∈ D.A :=
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_subset_A hzq
  have hzwA : zw ∈ D.A :=
    (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_subset_A hzw
  exact
    ⟨exists_selectedFourClass_of_globalK4 D.K4 hzqA,
      exists_selectedFourClass_of_globalK4 D.K4 hzwA⟩

/-- The exact positive output that would close the robust branch by the
perpendicular-bisector bound: one global row at a support point of each actual
blocker shell, both containing the frontier pair, with the two row centers
distinct and different from the first apex.
-/
structure TwoBlockerGlobalPairRows
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
  zqRow : SelectedFourClass D.A zq
  zwRow : SelectedFourClass D.A zw
  q_mem_zqRow : P.q ∈ zqRow.support
  w_mem_zqRow : P.w ∈ zqRow.support
  q_mem_zwRow : P.q ∈ zwRow.support
  w_mem_zwRow : P.w ∈ zwRow.support

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Two such off-first-apex global pair rows, together with the first apex,
are three distinct carrier centers on the perpendicular bisector of the
frontier pair, contradicting convex independence.
-/
theorem false_of_twoBlockerGlobalPairRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (R : TwoBlockerGlobalPairRows P) : False := by
  classical
  let o := S.oppApex1
  have hoA : o ∈ D.A := by
    simpa [o] using oppApex1_mem_A S
  have hzqA : R.zq ∈ D.A :=
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_subset_A
      R.zq_mem_qShell
  have hzwA : R.zw ∈ D.A :=
    (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_subset_A
      R.zw_mem_wShell
  have hoEq : dist o P.q = dist o P.w := by
    have hq : dist P.q S.oppApex1 = r :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
    have hw : dist P.w S.oppApex1 = r :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
    calc
      dist o P.q = r := by simpa [o, dist_comm] using hq
      _ = dist o P.w := by simpa [o, dist_comm] using hw.symm
  have hzqEq : dist R.zq P.q = dist R.zq P.w :=
    (R.zqRow.support_eq_radius P.q R.q_mem_zqRow).trans
      (R.zqRow.support_eq_radius P.w R.w_mem_zqRow).symm
  have hzwEq : dist R.zw P.q = dist R.zw P.w :=
    (R.zwRow.support_eq_radius P.q R.q_mem_zwRow).trans
      (R.zwRow.support_eq_radius P.w R.w_mem_zwRow).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    P.q_mem_A P.w_mem_A P.q_ne_w
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z P.q = dist z P.w) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hzqFilter :
      R.zq ∈ D.A.filter (fun z => dist z P.q = dist z P.w) :=
    Finset.mem_filter.mpr ⟨hzqA, hzqEq⟩
  have hzwFilter :
      R.zw ∈ D.A.filter (fun z => dist z P.q = dist z P.w) :=
    Finset.mem_filter.mpr ⟨hzwA, hzwEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z P.q = dist z P.w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, R.zq, hzqFilter, R.zw, hzwFilter,
      R.zq_ne_firstApex.symm, R.zw_ne_firstApex.symm, R.zq_ne_zw⟩
  omega

#print axioms two_le_selected_inter_anchors_of_support_confinement
#print axioms exists_global_rows_at_two_blocker_support_points
#print axioms false_of_twoBlockerGlobalPairRows

end RobustFourCenter
end ATailForce
end Problem97
