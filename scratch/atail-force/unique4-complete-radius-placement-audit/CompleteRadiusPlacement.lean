/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.MutualShellPairSharedMember

/-!
# Complete-radius closure for a three-center selected-row triangle

Two mutual selected-row links identify three row radii.  If the last row is a
complete critical shell, exactness turns the remaining one-way incidence into
the reverse membership.  This is the positive positional form of the equality
chain used by `false_of_mutualClassPair_sharedMember_thirdClassExcludes`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourCompleteRadiusPlacementAuditScratch

/-- A two-step mutual selected-row chain ending at a complete critical shell
forces the missing reverse membership in that shell. -/
theorem mem_criticalShell_of_twoStep_mutualTriangle
    {A : Finset ℝ²} {source anchor middle blocker : ℝ²}
    (Kblocker : CriticalFourShell A source blocker)
    (Kanchor : SelectedFourClass A anchor)
    (Kmiddle : SelectedFourClass A middle)
    (hanchorA : anchor ∈ A)
    (hmiddle_anchor : middle ∈ Kanchor.support)
    (hblocker_anchor : blocker ∈ Kanchor.support)
    (hanchor_middle : anchor ∈ Kmiddle.support)
    (hblocker_middle : blocker ∈ Kmiddle.support)
    (hmiddle_blocker : middle ∈ Kblocker.support) :
    anchor ∈ Kblocker.support := by
  apply Kblocker.off_row_named_label_forbidden hanchorA
  calc
    dist blocker anchor = dist anchor blocker := dist_comm blocker anchor
    _ = Kanchor.radius := Kanchor.support_eq_radius blocker hblocker_anchor
    _ = dist anchor middle :=
      (Kanchor.support_eq_radius middle hmiddle_anchor).symm
    _ = dist middle anchor := dist_comm anchor middle
    _ = Kmiddle.radius := Kmiddle.support_eq_radius anchor hanchor_middle
    _ = dist middle blocker :=
      (Kmiddle.support_eq_radius blocker hblocker_middle).symm
    _ = dist blocker middle := dist_comm middle blocker
    _ = Kblocker.radius :=
      Kblocker.support_eq_radius middle hmiddle_blocker

/-- At a center in the image of a fixed critical system, deletion criticality
locks every selected K4 row to the complete critical shell.  Hence the same
two-step mutual triangle forces the missing membership in the actual selected
row used by a curvature occurrence. -/
theorem mem_blockerImageSelectedRow_of_twoStep_mutualTriangle
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source anchor middle : ℝ²} (hsourceA : source ∈ A)
    (Kanchor : SelectedFourClass A anchor)
    (Kmiddle : SelectedFourClass A middle)
    (Kblocker : SelectedFourClass A (H.centerAt source hsourceA))
    (hanchorA : anchor ∈ A)
    (hmiddle_anchor : middle ∈ Kanchor.support)
    (hblocker_anchor : H.centerAt source hsourceA ∈ Kanchor.support)
    (hanchor_middle : anchor ∈ Kmiddle.support)
    (hblocker_middle : H.centerAt source hsourceA ∈ Kmiddle.support)
    (hmiddle_blocker : middle ∈ Kblocker.support) :
    anchor ∈ Kblocker.support := by
  let C := (H.selectedAt source hsourceA).toCriticalFourShell
  have hsupport : Kblocker.support = C.support :=
    H.selectedFourClass_support_eq_shell source hsourceA Kblocker
  have hmiddleC : middle ∈ C.support := by
    rw [← hsupport]
    exact hmiddle_blocker
  rw [hsupport]
  exact mem_criticalShell_of_twoStep_mutualTriangle C Kanchor Kmiddle
    hanchorA hmiddle_anchor hblocker_anchor hanchor_middle
      hblocker_middle hmiddleC

#print axioms mem_criticalShell_of_twoStep_mutualTriangle
#print axioms mem_blockerImageSelectedRow_of_twoStep_mutualTriangle

end ATailUniqueFourCompleteRadiusPlacementAuditScratch
end Problem97
