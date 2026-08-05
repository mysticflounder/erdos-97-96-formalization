/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DoubleSurvivalBranchProducer
import CaptureIncidenceInterface

/-!
# Realization: the abstract interface is faithful to the live frontier

Instantiates `CaptureFrontierInterface ℝ² ℝ` from the live R-branch data —
`D`, `S`, `H`, a `CriticalPairFrontier` `F`, and a
`DoubleSurvivalBranchNormalForm N` — proving every abstract interface field
from its named real source.  This certifies that the abstract signature
contains no axiom that is not a reachable fact at the frontier.

`abstractCapture_of_capture` additionally maps the real capture packet
`StrictSurplusRowCapturesErasedPair N` to the abstract capture packet on the
realized model, so the abstract target faithfully contains the real one; the
composite with `false_of_abstractCapture` reproves the production sink as a
consistency crosscheck.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace CaptureInsufficiency

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open DoubleSurvivalBranchProducer

attribute [local instance] Classical.propDecidable

/-- `SelectedClass` is the center-first filter used by the abstract
interface (also bridges `Decidable` instances). -/
private theorem selectedClass_eq (A : Finset ℝ²) (s : ℝ²) (ρ : ℝ) :
    SelectedClass A s ρ = A.filter fun x => dist s x = ρ := by
  ext x
  simp [SelectedClass, Finset.mem_filter]

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

/-- The realized interface: every field is proved from its named real
source (see the dictionary on `CaptureFrontierInterface`). -/
noncomputable def realize
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (N : DoubleSurvivalBranchNormalForm F) :
    CaptureFrontierInterface ℝ² ℝ where
  rpos ρ := 0 < ρ
  A := D.A
  d := dist
  o1 := S.oppApex1
  o2 := S.oppApex2
  cap := S.surplusCap
  interior := S.capInteriorByIndex S.surplusIdx
  p1 := F.pair.q
  p2 := F.pair.w
  q := N.terminal.q
  w := N.terminal.w
  rP := r
  rT := N.terminal.radius
  rho2 := N.second_radius
  carrier := N.terminal.carrier
  shellCenter x := if hx : x ∈ D.A then H.centerAt x hx else x
  shellRadius x :=
    if hx : x ∈ D.A then (H.selectedAt x hx).toCriticalFourShell.radius
    else 1
  symm := dist_comm
  escape := by
    intro x y hxA hyA hxc hyc hne h1 h2
    exact U2NonSurplusSqueeze.oppCap2_escape_gen D S hxA hyA hxc hyc hne
      (r := dist x S.oppApex1) rfl (by simpa [dist_comm] using h1.symm)
      (ρ := dist x S.oppApex2) rfl (by simpa [dist_comm] using h2.symm)
  one_hit := by
    intro ρ
    have h := U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit
      { A := D.A
        nonempty := D.nonempty
        convex := D.convex
        K4 := D.K4
        packet := S } ρ
    refine le_trans (le_of_eq ?_) h
    congr 1
    ext u
    simp [Finset.mem_inter, Finset.mem_filter, dist_comm]
  sink := by
    intro z x y hz hxA hyA hxc hyc hne h1 h2
    exact RobustLiveBankAdapter.false_of_surplusInterior_bisects_marginalPair
      S hz
      (r := dist x S.oppApex1)
      (Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hxA, rfl⟩, hxc⟩)
      (Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr
        ⟨hyA, by simpa [dist_comm] using h1.symm⟩, hyc⟩)
      hne h2
  k4 := by
    intro p hp
    rcases D.K4 p hp with ⟨ρ, hρ, hcard⟩
    exact ⟨ρ, hρ, hcard⟩
  o1_mem_cap := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  interior_subset_cap := by
    intro z hz
    have h := S.capInteriorByIndex_subset_capByIndex S.surplusIdx hz
    rwa [capByIndex_surplusIdx_eq_surplusCap S] at h
  o1_not_mem_interior := by
    intro hzI
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capInteriorByIndex,
        SurplusCapPacket.oppApex1, hi] at hzI
  cap_subset_A :=
    CounterexampleData.surplusCap_subset_A
      { A := D.A
        nonempty := D.nonempty
        convex := D.convex
        K4 := D.K4
        packet := S }
  four_lt_cap_card := S.surplus_card_gt_four
  shell_center_mem := by
    intro x hx
    simp only [dif_pos hx]
    exact (H.selectedAt x hx).toCriticalFourShell.center_mem
  shell_radius_pos := by
    intro x hx
    simp only [dif_pos hx]
    exact (H.selectedAt x hx).toCriticalFourShell.radius_pos
  shell_card := by
    intro x hx
    simp only [dif_pos hx]
    have h := (H.selectedAt x hx).toCriticalFourShell.support_card
    rw [(H.selectedAt x hx).toCriticalFourShell.support_eq] at h
    exact h
  shell_source_mem := by
    intro x hx
    simp only [dif_pos hx]
    exact (H.selectedAt x hx).toCriticalFourShell.support_eq_radius x
      (H.selectedAt x hx).toCriticalFourShell.q_mem_support
  shell_critical := by
    intro x hx ρ hρ
    simp only [dif_pos hx]
    by_contra hbig
    push_neg at hbig
    have hbig' : 4 ≤
        ((D.A.erase x).filter fun y =>
          dist (H.centerAt x hx) y = ρ).card := by omega
    exact H.no_qfree x hx ⟨ρ, hρ, hbig'⟩
  p1_blocker_ne_o2 := by
    simp only [dif_pos F.pair.q_mem_A]
    exact F.pair.q_blocker_ne_oppApex2
  p2_blocker_ne_o2 := by
    simp only [dif_pos F.pair.w_mem_A]
    exact F.pair.w_blocker_ne_oppApex2
  p1_mem_marginal := by
    rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hf, hoff⟩
    rcases Finset.mem_filter.mp hf with ⟨hA, hd⟩
    exact Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr
      ⟨hA, by simpa [dist_comm] using hd⟩, hoff⟩
  p2_mem_marginal := by
    rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hf, hoff⟩
    rcases Finset.mem_filter.mp hf with ⟨hA, hd⟩
    exact Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr
      ⟨hA, by simpa [dist_comm] using hd⟩, hoff⟩
  p1_ne_p2 := F.pair.q_ne_w
  rP_pos := F.radius_pos
  p1_survives := by
    rcases F.pair.q_survives with ⟨ρ, hρ, hcard⟩
    exact ⟨ρ, hρ, hcard⟩
  p2_survives := by
    rcases F.pair.w_survives with ⟨ρ, hρ, hcard⟩
    exact ⟨ρ, hρ, hcard⟩
  first_apex_double := by
    rcases N.firstApex_double with ⟨ρ, hρ, hcard⟩
    exact ⟨ρ, hρ, hcard⟩
  second_apex_double := by
    rcases F.secondApexDouble with ⟨ρ, hρ, hcard⟩
    exact ⟨ρ, hρ, hcard⟩
  carrier_subset := N.terminal.history.terminal_subset
  erased_off_cap := fun _ hx => N.ambient_history.erased_off_surplus hx
  erased_mate := by
    intro x hx
    rcases N.ambient_history.erased_has_coradial_mate hx with
      ⟨y, hy, hne, hd⟩
    exact ⟨y, hy, hne, by simpa [dist_comm] using hd⟩
  erased_mate_B0 := by
    intro x hx
    rcases N.terminal.history.erased_has_coradial_mate hx with
      ⟨y, hy, hne, hd⟩
    exact ⟨y, hy, hne, by simpa [dist_comm] using hd⟩
  rT_pos := N.terminal.radius_pos
  terminal_card := by
    rw [← selectedClass_eq]
    exact N.terminal.terminal_card
  terminal_unique := by
    intro ρ hρ h
    exact N.terminal.terminal_unique ρ hρ (by rwa [selectedClass_eq])
  q_mem_marginal := by
    rcases Finset.mem_sdiff.mp N.terminal.q_mem_marginal with ⟨hf, hoff⟩
    rcases Finset.mem_filter.mp hf with ⟨hC, hd⟩
    exact Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr
      ⟨hC, by simpa [dist_comm] using hd⟩, hoff⟩
  w_mem_marginal := by
    rcases Finset.mem_sdiff.mp N.terminal.w_mem_marginal with ⟨hf, hoff⟩
    rcases Finset.mem_filter.mp hf with ⟨hC, hd⟩
    exact Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr
      ⟨hC, by simpa [dist_comm] using hd⟩, hoff⟩
  q_ne_w := N.terminal.q_ne_w
  rho2_pos := N.terminal.second_radius_pos
  second_row_four := by
    rw [← selectedClass_eq]
    exact N.terminal.second_row_four
  second_row_eq_ambient := by
    rw [← selectedClass_eq, ← selectedClass_eq]
    exact N.terminal.second_row_eq_ambient
  second_row_survives := by
    rw [← selectedClass_eq]
    exact N.terminal.second_row_survives_terminal_pair

/-- Every abstract interface fact is realized at the live frontier. -/
theorem realize_nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (N : DoubleSurvivalBranchNormalForm F) :
    Nonempty (CaptureFrontierInterface ℝ² ℝ) :=
  ⟨realize F N⟩

/-- The real capture packet maps onto the abstract one: the abstract target
faithfully contains the real target. -/
noncomputable def abstractCapture_of_capture
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    {N : DoubleSurvivalBranchNormalForm F}
    (L : StrictSurplusRowCapturesErasedPair N) :
    AbstractCapture (realize F N) where
  x := L.pair.x
  y := L.pair.y
  x_mem_erased := L.pair.x_mem_erased
  y_mem_erased := L.pair.y_mem_erased
  x_ne_y := L.pair.x_ne_y
  same_radius := by
    show dist S.oppApex1 L.pair.x = dist S.oppApex1 L.pair.y
    simpa [dist_comm] using L.pair.same_radius
  z := L.z
  z_mem_interior := L.z_mem_surplusInterior
  support := L.row.support
  support_subset_A := L.row.support_subset_A
  support_card := L.row.support_card
  radius := L.row.radius
  radius_pos := L.row.radius_pos
  support_eq_radius := L.row.support_eq_radius
  center_not_mem := L.row.center_not_mem
  x_mem_support := L.x_mem_row
  y_mem_support := L.y_mem_row

/-- Consistency crosscheck: the abstract refutation reproves the production
sink through the realization. -/
theorem false_of_capture_via_abstract
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r H}
    {N : DoubleSurvivalBranchNormalForm F}
    (L : StrictSurplusRowCapturesErasedPair N) : False :=
  false_of_abstractCapture (realize F N) (abstractCapture_of_capture L)

#print axioms realize_nonempty
#print axioms false_of_capture_via_abstract

end CaptureInsufficiency
end ATailForce
end Problem97
