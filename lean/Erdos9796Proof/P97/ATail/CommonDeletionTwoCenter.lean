/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U5GlobalIncidenceSupport

/-!
# Common-deletion two-center packet

This module packages two distinct carrier centers at which deleting one
prescribed source preserves K4.  It records exact q-deleted four-point rows at
both centers, separation from the retained critical-system blocker, and the
two-circle overlap bound.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCommonDeletionTwoCenter

attribute [local instance] Classical.propDecidable

/-- Two distinct centers at which one prescribed deletion survives, packaged
as exact q-deleted U5 rows.  The chosen critical-system blocker for the
deleted source avoids both centers, and the two exact supports overlap in at
most two points. -/
structure CommonDeletionTwoCenterPacket
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (q center₁ center₂ : ℝ²) where
  q_mem_A : q ∈ D.A
  center₁_mem_A : center₁ ∈ D.A
  center₂_mem_A : center₂ ∈ D.A
  centers_ne : center₁ ≠ center₂
  survives₁ : HasNEquidistantPointsAt 4 (D.A.erase q) center₁
  survives₂ : HasNEquidistantPointsAt 4 (D.A.erase q) center₂
  actual_blocker_ne_center₁ : H.centerAt q q_mem_A ≠ center₁
  actual_blocker_ne_center₂ : H.centerAt q q_mem_A ≠ center₂
  B₁ : Finset ℝ²
  B₂ : Finset ℝ²
  row₁ : U5QDeletedK4Class D q center₁ B₁
  row₂ : U5QDeletedK4Class D q center₂ B₂
  B₁_card : B₁.card = 4
  B₂_card : B₂.card = 4
  overlap_le_two : (B₁ ∩ B₂).card ≤ 2

/-- Constructor for `CommonDeletionTwoCenterPacket` from its two local
survival facts. -/
theorem nonempty_commonDeletionTwoCenterPacket
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {q center₁ center₂ : ℝ²}
    (hqA : q ∈ D.A)
    (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : center₁ ≠ center₂)
    (hsurvives₁ : HasNEquidistantPointsAt 4 (D.A.erase q) center₁)
    (hsurvives₂ : HasNEquidistantPointsAt 4 (D.A.erase q) center₂) :
    Nonempty (CommonDeletionTwoCenterPacket
      D H q center₁ center₂) := by
  have hsurvives₁' :
      HasNEquidistantPointsAt 4 (D.skeleton q) center₁ := by
    simpa [CounterexampleData.skeleton] using hsurvives₁
  have hsurvives₂' :
      HasNEquidistantPointsAt 4 (D.skeleton q) center₂ := by
    simpa [CounterexampleData.skeleton] using hsurvives₂
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hsurvives₁' with ⟨B₁, ⟨R₁⟩, hB₁⟩
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hsurvives₂' with ⟨B₂, ⟨R₂⟩, hB₂⟩
  exact ⟨
    { q_mem_A := hqA
      center₁_mem_A := hcenter₁A
      center₂_mem_A := hcenter₂A
      centers_ne := hcenters
      survives₁ := hsurvives₁
      survives₂ := hsurvives₂
      actual_blocker_ne_center₁ := by
        intro hcenter
        apply H.no_qfree_at q hqA
        simpa only [hcenter] using hsurvives₁
      actual_blocker_ne_center₂ := by
        intro hcenter
        apply H.no_qfree_at q hqA
        simpa only [hcenter] using hsurvives₂
      B₁ := B₁
      B₂ := B₂
      row₁ := R₁
      row₂ := R₂
      B₁_card := hB₁
      B₂_card := hB₂
      overlap_le_two :=
        U5QDeletedK4Class.inter_card_le_two R₁ R₂ hcenters }⟩

end ATailCommonDeletionTwoCenter
end Problem97
