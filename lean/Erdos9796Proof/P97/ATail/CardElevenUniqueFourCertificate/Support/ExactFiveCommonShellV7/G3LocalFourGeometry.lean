/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.FullRadiusSemantics
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Geometric realization of exact-five G3 local-four atoms

The full-radius decoder represents a local four-class by four carrier labels
and a center label.  This file checks the finite shape of those rows and turns
their semantic valuation into the geometric witness types used by the U5
incidence kernels.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554

attribute [local instance] Classical.propDecidable

set_option linter.style.nativeDecide false in
/-- Every decoded local-four row consists of four distinct non-center labels. -/
theorem encoderLocalFourRows_support_shape :
    ∀ row ∈ encoderLocalFourRows,
      row.support.length = 4 ∧
      row.support.Nodup ∧
      row.center ∉ row.support ∧
      row.support.toFinset.card = 4 := by
  native_decide

/-- A decoded local-four support has length four. -/
theorem encoderLocalFourRows_support_length
    {row : LocalFourRow} (hrow : row ∈ encoderLocalFourRows) :
    row.support.length = 4 :=
  (encoderLocalFourRows_support_shape row hrow).1

/-- A decoded local-four support has no repeated labels. -/
theorem encoderLocalFourRows_support_nodup
    {row : LocalFourRow} (hrow : row ∈ encoderLocalFourRows) :
    row.support.Nodup :=
  (encoderLocalFourRows_support_shape row hrow).2.1

/-- The center label is absent from every decoded local-four support. -/
theorem encoderLocalFourRows_center_not_mem_support
    {row : LocalFourRow} (hrow : row ∈ encoderLocalFourRows) :
    row.center ∉ row.support :=
  (encoderLocalFourRows_support_shape row hrow).2.2.1

/-- The finite-set support of a decoded local-four row has cardinality four. -/
theorem encoderLocalFourRows_support_toFinset_card
    {row : LocalFourRow} (hrow : row ∈ encoderLocalFourRows) :
    row.support.toFinset.card = 4 :=
  (encoderLocalFourRows_support_shape row hrow).2.2.2

/-- A true local-four atom survives deletion of any label outside its support. -/
theorem CanonicalPacket.localFourHolds_to_hasNEquidistantPointsAt_erase
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalFourRow) (deleted : Label)
    (hrow : row ∈ encoderLocalFourRows)
    (hdeleted : deleted ∉ row.support)
    (hlocal : P.localFourHolds row) :
    HasNEquidistantPointsAt 4 (A.erase (L.pointOf deleted))
      (L.pointOf row.center) := by
  let radius :=
    dist (L.pointOf row.center) (L.pointOf (row.support.getD 0 0))
  let B : Finset ℝ² := row.support.toFinset.image L.pointOf
  have hanchor_mem : row.support.getD 0 0 ∈ row.support := by
    cases hsupport : row.support with
    | nil =>
        have hlength := encoderLocalFourRows_support_length hrow
        simp [hsupport] at hlength
    | cons first rest =>
        simp [hsupport]
  have hcenter_ne_anchor : row.center ≠ row.support.getD 0 0 := by
    intro heq
    exact encoderLocalFourRows_center_not_mem_support hrow
      (by simpa [heq] using hanchor_mem)
  have hradius_pos : 0 < radius := by
    exact dist_pos.mpr (L.injective.ne hcenter_ne_anchor)
  refine ⟨radius, hradius_pos, ?_⟩
  calc
    4 = B.card := by
      rw [Finset.card_image_of_injective _ L.injective]
      exact (encoderLocalFourRows_support_toFinset_card hrow).symm
    _ ≤ ((A.erase (L.pointOf deleted)).filter fun y =>
        dist (L.pointOf row.center) y = radius).card := by
      apply Finset.card_le_card
      intro y hy
      rcases Finset.mem_image.mp hy with ⟨label, hlabel, rfl⟩
      have hlabel_support : label ∈ row.support := by
        simpa using hlabel
      have hlabel_ne_deleted : label ≠ deleted := by
        intro heq
        exact hdeleted (by simpa [heq] using hlabel_support)
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨L.injective.ne hlabel_ne_deleted, L.mem_carrier label⟩,
          (hlocal label hlabel_support).symm⟩

/-- A true local-four atom gives the exact q-deleted class shape used by the U5
incidence kernels, while retaining every named support point. -/
theorem CanonicalPacket.localFourHolds_to_u5QDeletedK4Class
    {D : CounterexampleData} {M : MoserTriangle D.A} {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalFourRow) (deleted : Label)
    (hrow : row ∈ encoderLocalFourRows)
    (hdeleted : deleted ∉ row.support)
    (hlocal : P.localFourHolds row) :
    ∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D
        (L.pointOf deleted) (L.pointOf row.center) B) ∧
      ∀ label ∈ row.support, L.pointOf label ∈ B := by
  let radius :=
    dist (L.pointOf row.center) (L.pointOf (row.support.getD 0 0))
  let B : Finset ℝ² := row.support.toFinset.image L.pointOf
  have hanchor_mem : row.support.getD 0 0 ∈ row.support := by
    cases hsupport : row.support with
    | nil =>
        have hlength := encoderLocalFourRows_support_length hrow
        simp [hsupport] at hlength
    | cons first rest =>
        simp [hsupport]
  have hcenter_not_mem :=
    encoderLocalFourRows_center_not_mem_support hrow
  have hcenter_ne_anchor : row.center ≠ row.support.getD 0 0 := by
    intro heq
    exact hcenter_not_mem (by simpa [heq] using hanchor_mem)
  have hBcard : B.card = 4 := by
    rw [Finset.card_image_of_injective _ L.injective]
    exact encoderLocalFourRows_support_toFinset_card hrow
  refine ⟨B, ⟨?_, ?_⟩⟩
  · refine ⟨
      { subset := ?_
        card_four := by omega
        q_not_mem := ?_
        radius := radius
        radius_pos := dist_pos.mpr (L.injective.ne hcenter_ne_anchor)
        same_radius := ?_ }⟩
    · intro y hy
      rcases Finset.mem_image.mp hy with ⟨label, hlabel, rfl⟩
      have hlabel_support : label ∈ row.support := by
        simpa using hlabel
      have hlabel_ne_center : label ≠ row.center := by
        intro heq
        exact hcenter_not_mem (by simpa [heq] using hlabel_support)
      have hlabel_ne_deleted : label ≠ deleted := by
        intro heq
        exact hdeleted (by simpa [heq] using hlabel_support)
      refine Finset.mem_erase.mpr ⟨L.injective.ne hlabel_ne_center, ?_⟩
      simpa [CounterexampleData.skeleton] using
        (Finset.mem_erase.mpr
          ⟨L.injective.ne hlabel_ne_deleted, L.mem_carrier label⟩)
    · intro hdeletedB
      rcases Finset.mem_image.mp hdeletedB with
        ⟨label, hlabel, hpoint⟩
      have hlabel_support : label ∈ row.support := by
        simpa using hlabel
      have hlabel_eq_deleted : label = deleted :=
        L.injective hpoint
      exact hdeleted (by simpa [hlabel_eq_deleted] using hlabel_support)
    · intro y hy
      rcases Finset.mem_image.mp hy with ⟨label, hlabel, rfl⟩
      exact (hlocal label (by simpa using hlabel)).symm
  · intro label hlabel
    exact Finset.mem_image.mpr
      ⟨label, by simpa using hlabel, rfl⟩

/-- Row-generic q-deleted atoms export two named points in a U5 class. -/
theorem CanonicalPacket.qDeletedPairHolds_to_u5QDeletedK4Class_row
    {D : CounterexampleData} {M : MoserTriangle D.A} {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : QDeletedPairRow)
    (h : P.qDeletedPairHolds row) :
    ∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D
        (L.pointOf row.deleted) (L.pointOf row.center) B) ∧
      L.pointOf row.first ∈ B ∧
      L.pointOf row.second ∈ B := by
  rcases h with
    ⟨candidate, hcandidate, hcenter, hdeleted, hfirst, hsecond, hlocal⟩
  rcases P.localFourHolds_to_u5QDeletedK4Class
      candidate row.deleted hcandidate hdeleted hlocal with
    ⟨B, hclass, hmem⟩
  refine ⟨B, ?_, hmem row.first hfirst, hmem row.second hsecond⟩
  simpa [hcenter] using hclass

/-- Each indexed q-deleted-pair atom has precisely the witness shape needed by
`u5_nontriple_equilateral_on_p_circle_incompatibility`. -/
theorem CanonicalPacket.qDeletedPairHolds_to_u5QDeletedK4Class
    {D : CounterexampleData} {M : MoserTriangle D.A} {CP : CapTriple D.A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (i : Fin 3960)
    (h : P.qDeletedPairHolds (qDeletedPairRow i)) :
    ∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D
        (L.pointOf (qDeletedPairRow i).deleted)
        (L.pointOf (qDeletedPairRow i).center) B) ∧
      L.pointOf (qDeletedPairRow i).first ∈ B ∧
      L.pointOf (qDeletedPairRow i).second ∈ B :=
  P.qDeletedPairHolds_to_u5QDeletedK4Class_row (qDeletedPairRow i) h

end ExactFiveCommonShellV7
end Problem97
