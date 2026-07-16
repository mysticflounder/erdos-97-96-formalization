/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Common critical-system facts at the actual U1 parent boundary

The outer Route-B parent constructs the five source rows and the additional
`f2` row from one concrete `CriticalShellSystem`.  This file records the exact
extra facts available before that provenance is weakened by the current leaf
interfaces.

The key point is a polarity result.  At a source's chosen blocker center,
deletion is critical exactly for members of the already selected exact row.
Consequently common provenance does not by itself extend that row by a new
point.  On the live `t2_t20` branch the additional `f2` row also collapses to
the original `t2` row, so it supplies no sixth support there.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CommonSystemParent

open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- At a chosen source blocker, deleting `w` destroys K4 exactly when `w`
already belongs to the chosen exact critical support.  This is the negative
form of `cross_deletion_survives_iff_not_mem_selected_support`. -/
theorem deletion_blocked_iff_mem_selected_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source w : ℝ²} (hsource : source ∈ A) :
    (¬ HasNEquidistantPointsAt 4 (A.erase w)
        (H.centerAt source hsource)) ↔
      w ∈ (H.selectedAt source hsource).toCriticalFourShell.support := by
  have hsurvives :=
    cross_deletion_survives_iff_not_mem_selected_support H hsource (w := w)
  tauto

/-- Constructor-level form of the actual parent fact: its `t2` source row is
exactly the row selected by the retained common critical system. -/
theorem parent_t2_row_eq_system_row
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    (H : CriticalShellSystem D.A)
    (hqA : q ∈ D.A) (ht1A : t1 ∈ D.A) (ht2A : t2 ∈ D.A)
    (ht3A : t3 ∈ D.A) (huA : u ∈ D.A) :
    let rows := U1Depth5.CriticalSourceRows.ofCriticalShellSystem
      H hqA ht1A ht2A ht3A huA
    (rows.rowAt U1Depth5.CriticalSource.t2).center =
        H.centerAt t2 ht2A ∧
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        (H.selectedAt t2 ht2A).toCriticalFourShell.support := by
  simp [U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
    U1Depth5.CriticalSourceRows.rowAt,
    U1Depth5.CriticalRowPacket.ofCriticalShellSystem]

/-- On the `t2_t20` collision branch, the parent-built additional `f2` row
has the same center and complete support as the original `t2` source row.
Thus the apparent sixth row is not a new row on this branch. -/
theorem parent_f2_row_collapses_to_t2_row
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    (H : CriticalShellSystem D.A)
    (hqA : q ∈ D.A) (ht1A : t1 ∈ D.A) (ht2A : t2 ∈ D.A)
    (ht3A : t3 ∈ D.A) (huA : u ∈ D.A) :
    let rows := U1Depth5.CriticalSourceRows.ofCriticalShellSystem
      H hqA ht1A ht2A ht3A huA
    let f2Row : U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) :=
      U1Depth5.CriticalRowPacket.ofCriticalShellSystem H
        (rows.pointOfChoice_mem
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
    t2 = rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 } →
      f2Row.center = (rows.rowAt U1Depth5.CriticalSource.t2).center ∧
      f2Row.selected.toCriticalFourShell.support =
        (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support := by
  dsimp only
  intro ht2
  simp only [Fin.isValue, U1Depth5.CriticalSourceRows.pointOfChoice,
    U1Depth5.CriticalSourceRows.rowAt,
    U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
    U1Depth5.CriticalRowPacket.ofCriticalShellSystem,
    U1Depth5.CriticalRowPacket.slotPoint, Matrix.cons_val_zero] at ht2 ⊢
  have hsub :
      (⟨(H.selectedAt t2 ht2A).l1,
          (H.selectedAt t2 ht2A).l1_mem_A⟩ : {x : ℝ² // x ∈ D.A}) =
        ⟨t2, ht2A⟩ := by
    exact Subtype.ext ht2.symm
  constructor
  · exact congrArg (fun x : {x : ℝ² // x ∈ D.A} =>
      H.centerAt x.1 x.2) hsub
  · exact congrArg (fun x : {x : ℝ² // x ∈ D.A} =>
      (H.selectedAt x.1 x.2).toCriticalFourShell.support) hsub

/-- With the live `p`-center and dangerous-support identifications restored to
the parent system, the complete set of deletions which block K4 at `p` is
exactly `{q,t1,t2,t3}`.  In particular, no off-dangerous source can provide a
new row-extension edge at this already-known center. -/
theorem parent_p_deletion_blocked_iff_mem_dangerous
    {D : CounterexampleData} {p q t1 t2 t3 z : ℝ²}
    (H : CriticalShellSystem D.A)
    (ht2A : t2 ∈ D.A)
    (hcenter : H.centerAt t2 ht2A = p)
    (hsupport :
      (H.selectedAt t2 ht2A).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    (¬ HasNEquidistantPointsAt 4 (D.A.erase z) p) ↔
      z ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
  simpa [hcenter, hsupport] using
    (deletion_blocked_iff_mem_selected_support H ht2A (w := z))

/-- Every dangerous-shell member is deletion-critical at `p` under the
retained parent provenance. -/
theorem parent_dangerous_member_deletion_blocked_at_p
    {D : CounterexampleData} {p q t1 t2 t3 z : ℝ²}
    (H : CriticalShellSystem D.A)
    (ht2A : t2 ∈ D.A)
    (hcenter : H.centerAt t2 ht2A = p)
    (hsupport :
      (H.selectedAt t2 ht2A).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²))
    (hz : z ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) p :=
  (parent_p_deletion_blocked_iff_mem_dangerous
    H ht2A hcenter hsupport).2 hz

/-- Conversely, deleting the selected candidate `u`, which lies outside the
dangerous four-set, preserves K4 at `p`. -/
theorem parent_u_deletion_survives_at_p
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : CriticalShellSystem D.A)
    (ht2A : t2 ∈ D.A)
    (hcenter : H.centerAt t2 ht2A = p)
    (hsupport :
      (H.selectedAt t2 ht2A).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²))
    (huOff : u ∉ ({q, t1, t2, t3} : Finset ℝ²)) :
    HasNEquidistantPointsAt 4 (D.A.erase u) p := by
  have hsurvives :=
    (cross_deletion_survives_iff_not_mem_selected_support H ht2A
      (w := u)).2 (by simpa [hsupport] using huOff)
  simpa [hcenter] using hsurvives

/-- The common system's chosen blocker for `u` is therefore a genuine second
center, distinct from `p`.  This is the strongest automatic center separation
in the actual branch; it includes no cap or Moser-apex localization. -/
theorem parent_u_blocker_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : CriticalShellSystem D.A)
    (ht2A : t2 ∈ D.A) (huA : u ∈ D.A)
    (hcenter : H.centerAt t2 ht2A = p)
    (hsupport :
      (H.selectedAt t2 ht2A).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²))
    (huOff : u ∉ ({q, t1, t2, t3} : Finset ℝ²)) :
    H.centerAt u huA ≠ p := by
  intro huCenter
  apply H.no_qfree_at u huA
  have hsurvives :=
    parent_u_deletion_survives_at_p H ht2A hcenter hsupport huOff
  simpa [huCenter] using hsurvives

/-- Exactness gives the metric form of the same negative boundary.  A carrier
point outside the dangerous support cannot be added to its `p`-radius by a new
equality with an existing support point.  Thus an h4/h5-shaped extension at
`p` would be a contradiction to the already known exact row, not an equality
which common provenance can supply. -/
theorem parent_p_dist_ne_of_mem_dangerous_of_not_mem_dangerous
    {D : CounterexampleData} {p q t1 t2 t3 anchor z : ℝ²}
    (H : CriticalShellSystem D.A)
    (ht2A : t2 ∈ D.A)
    (hcenter : H.centerAt t2 ht2A = p)
    (hsupport :
      (H.selectedAt t2 ht2A).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²))
    (hanchor : anchor ∈ ({q, t1, t2, t3} : Finset ℝ²))
    (hzA : z ∈ D.A)
    (hzOff : z ∉ ({q, t1, t2, t3} : Finset ℝ²)) :
    dist p anchor ≠ dist p z := by
  intro heq
  have hanchorSupport :
      anchor ∈ (H.selectedAt t2 ht2A).toCriticalFourShell.support := by
    simpa [hsupport] using hanchor
  have hanchorRadius :
      dist p anchor =
        (H.selectedAt t2 ht2A).toCriticalFourShell.radius := by
    simpa [hcenter] using
      (H.selectedAt t2 ht2A).toCriticalFourShell.support_eq_radius
        anchor hanchorSupport
  have hzRadius :
      dist (H.centerAt t2 ht2A) z =
        (H.selectedAt t2 ht2A).toCriticalFourShell.radius := by
    calc
      dist (H.centerAt t2 ht2A) z = dist p z :=
        congrArg (fun center => dist center z) hcenter
      _ = dist p anchor := heq.symm
      _ = (H.selectedAt t2 ht2A).toCriticalFourShell.radius :=
        hanchorRadius
  have hzNamed :=
    (H.selectedAt t2 ht2A).off_row_named_label_forbidden hzA hzRadius
  have hzSupport :
      z ∈ (H.selectedAt t2 ht2A).toCriticalFourShell.support :=
    (H.selectedAt t2 ht2A).mem_support_iff_named.mpr hzNamed
  exact hzOff (by simpa [hsupport] using hzSupport)

#print axioms deletion_blocked_iff_mem_selected_support
#print axioms parent_t2_row_eq_system_row
#print axioms parent_f2_row_collapses_to_t2_row
#print axioms parent_p_deletion_blocked_iff_mem_dangerous
#print axioms parent_dangerous_member_deletion_blocked_at_p
#print axioms parent_u_deletion_survives_at_p
#print axioms parent_u_blocker_ne_p
#print axioms parent_p_dist_ne_of_mem_dangerous_of_not_mem_dangerous

end CommonSystemParent
end Problem97
