/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion

/-!
# Canonical rows for two surviving deletions

Two common-deletion packets at the same pair of critical-system centers initially store four
chosen deleted-carrier rows. This module identifies both rows at each fixed center with the one
canonical ambient critical shell and records that both deleted endpoints avoid both shells.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiSurvivalCanonicalRows

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailPhysicalSecondApexCommonDeletion

/-- Two deletion views at the same pair of source blockers, with their chosen rows identified with
the same two canonical ambient critical shells. -/
structure BiSurvivalCanonicalRows
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (u xv : ℝ²) (source₁ source₂ : {q : ℝ² // q ∈ D.A}) where
  uPacket :
    CommonDeletionTwoCenterPacket D H u
      (H.centerAt source₁.1 source₁.2) (H.centerAt source₂.1 source₂.2)
  xvPacket :
    CommonDeletionTwoCenterPacket D H xv
      (H.centerAt source₁.1 source₁.2) (H.centerAt source₂.1 source₂.2)
  u_first_support_eq :
    uPacket.B₁ = (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  u_second_support_eq :
    uPacket.B₂ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  xv_first_support_eq :
    xvPacket.B₁ = (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  xv_second_support_eq :
    xvPacket.B₂ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  first_support_eq : uPacket.B₁ = xvPacket.B₁
  second_support_eq : uPacket.B₂ = xvPacket.B₂
  u_not_mem_first :
    u ∉ (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  u_not_mem_second :
    u ∉ (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  xv_not_mem_first :
    xv ∉ (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  xv_not_mem_second :
    xv ∉ (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support

/-- Two common-deletion packets at the same source blockers determine source-coherent canonical
rows for both deletion views. -/
theorem nonempty_biSurvivalCanonicalRows
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {u xv : ℝ²} (source₁ source₂ : {q : ℝ² // q ∈ D.A})
    (hrectangle :
      Nonempty (CommonDeletionTwoCenterPacket D H u
        (H.centerAt source₁.1 source₁.2) (H.centerAt source₂.1 source₂.2)) ∧
      Nonempty (CommonDeletionTwoCenterPacket D H xv
        (H.centerAt source₁.1 source₁.2) (H.centerAt source₂.1 source₂.2))) :
    Nonempty (BiSurvivalCanonicalRows D H u xv source₁ source₂) := by
  rcases hrectangle with ⟨⟨uPacket⟩, ⟨xvPacket⟩⟩
  have huFirst :=
    firstRow_support_eq_criticalShell_of_center_eq uPacket source₁.2 rfl
  have huSecond :=
    secondRow_support_eq_criticalShell_of_center_eq uPacket source₂.2 rfl
  have hxvFirst :=
    firstRow_support_eq_criticalShell_of_center_eq xvPacket source₁.2 rfl
  have hxvSecond :=
    secondRow_support_eq_criticalShell_of_center_eq xvPacket source₂.2 rfl
  exact ⟨{
    uPacket := uPacket
    xvPacket := xvPacket
    u_first_support_eq := huFirst
    u_second_support_eq := huSecond
    xv_first_support_eq := hxvFirst
    xv_second_support_eq := hxvSecond
    first_support_eq := huFirst.trans hxvFirst.symm
    second_support_eq := huSecond.trans hxvSecond.symm
    u_not_mem_first :=
      (cross_deletion_survives_iff_not_mem_selected_support H source₁.2).mp
        uPacket.survives₁
    u_not_mem_second :=
      (cross_deletion_survives_iff_not_mem_selected_support H source₂.2).mp
        uPacket.survives₂
    xv_not_mem_first :=
      (cross_deletion_survives_iff_not_mem_selected_support H source₁.2).mp
        xvPacket.survives₁
    xv_not_mem_second :=
      (cross_deletion_survives_iff_not_mem_selected_support H source₂.2).mp
        xvPacket.survives₂ }⟩

end ATailBiSurvivalCanonicalRows
end Problem97
