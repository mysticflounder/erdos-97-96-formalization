/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixRawOrderIngress

/-!
# B1 card-six projected PointConfiguration

This module restricts the frozen raw role order to the alias-collapsed carrier
of the sixteen named roles.  It exports the role-index alias law, an inherited
counterclockwise boundary, and positive-row data on `Fin (roleCarrier P).card`.
The row facts are derived from the source role packet and its canonical
PointConfiguration hypotheses; no source-order ingress is modified here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixProjectedPointConfiguration

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open B1CardSixBoundaryRoleIngress
open B1CardSixLocalRolePacket
open B1CardSixPointConfigurationIngress
open B1CardSixRawOrderIngress
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The raw-order role index, exported from the projected configuration API. -/
noncomputable def roleIndex
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) (role : B1CardSixRole) :
    Fin (roleCarrier P).card :=
  B1CardSixRawOrderIngress.roleIndex P B role

/-- A role value regarded as a label of the alias-collapsed carrier. -/
noncomputable def projectedRoleLabel
    (P : B1CardSixLocalRolePacket C) (role : B1CardSixRole) :
    CarrierLabel (roleCarrier P) :=
  B1CardSixRawOrderIngress.roleLabel P role

private theorem projectedRoleLabel_val
    (P : B1CardSixLocalRolePacket C) (role : B1CardSixRole) :
    (projectedRoleLabel P role).1 = (B1CardSixRole.value P role).1 := by
  cases role <;> rfl

theorem roleIndex_alias_preserved
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (r s : B1CardSixRole) :
    roleIndex P B r = roleIndex P B s ↔
      B1CardSixRole.value P r = B1CardSixRole.value P s := by
  constructor
  · intro h
    have hambient :
        B.indexOf (ambientRoleLabel P (roleCarrier_subset P) r) =
          B.indexOf (ambientRoleLabel P (roleCarrier_subset P) s) := by
      calc
        B.indexOf (ambientRoleLabel P (roleCarrier_subset P) r) =
            roleEmbedding P B (roleIndex P B r) :=
          (roleEmbedding_roleIndex P B r).symm
        _ = roleEmbedding P B (roleIndex P B s) := congrArg (roleEmbedding P B) h
        _ = B.indexOf (ambientRoleLabel P (roleCarrier_subset P) s) :=
          roleEmbedding_roleIndex P B s
    have hlabels := B.index_injective hambient
    apply Subtype.ext
    simpa [ambientRoleLabel] using congrArg Subtype.val hlabels
  · intro h
    apply (roleEmbedding P B).injective
    change roleEmbedding P B
        (B1CardSixRawOrderIngress.roleIndex P B r) =
      roleEmbedding P B (B1CardSixRawOrderIngress.roleIndex P B s)
    rw [roleEmbedding_roleIndex P B r, roleEmbedding_roleIndex P B s]
    have hlabels :
        ambientRoleLabel P (roleCarrier_subset P) r =
          ambientRoleLabel P (roleCarrier_subset P) s := by
      apply Subtype.ext
      simpa [ambientRoleLabel] using congrArg Subtype.val h
    exact congrArg (fun label : CarrierLabel D.A => B.indexOf label) hlabels

/-- The ambient boundary restricted to the sorted alias-collapsed role carrier. -/
noncomputable def projectedBoundary
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) : Fin (roleCarrier P).card → ℝ² :=
  fun i => B.boundary (roleEmbedding P B i)

theorem projectedBoundary_image
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) :
    Finset.univ.image (projectedBoundary P B) = roleCarrier P := by
  classical
  change Finset.univ.image (fun i : Fin (roleCarrier P).card =>
    B.boundary (roleEmbedding P B i)) = roleCarrier P
  ext point
  constructor
  · intro hpoint
    rcases Finset.mem_image.mp hpoint with ⟨i, _hi, hpoint⟩
    have hi : roleEmbedding P B i ∈
        ambientRoleIndices P (roleCarrier_subset P) B := by
      exact Finset.orderEmbOfFin_mem _
        (ambientRoleIndices_card P (roleCarrier_subset P) B) i
    rcases Finset.mem_image.mp hi with ⟨label, _hlabel, hindex⟩
    rw [← hindex] at hpoint
    rw [B.point_eq (ambientCarrierLabel P (roleCarrier_subset P) label)] at hpoint
    have hpoint' : point = label.1 := by
      simpa [ambientCarrierLabel, pointOf] using hpoint.symm
    rw [hpoint']
    exact label.2
  · intro hpoint
    let label : CarrierLabel (roleCarrier P) := ⟨point, hpoint⟩
    have hi : B.indexOf (ambientCarrierLabel P (roleCarrier_subset P) label) ∈
        ambientRoleIndices P (roleCarrier_subset P) B := by
      exact ambientRoleIndex_mem P (roleCarrier_subset P) B label
    have himage :
        Finset.univ.image (roleEmbedding P B) =
          ambientRoleIndices P (roleCarrier_subset P) B := by
      simpa [roleEmbedding] using
        (orderedRoleEmbedding_image P (roleCarrier_subset P) B)
    have hi' : B.indexOf (ambientCarrierLabel P (roleCarrier_subset P) label) ∈
        Finset.univ.image (roleEmbedding P B) := by
      rw [himage]
      exact hi
    rcases Finset.mem_image.mp hi' with ⟨i, _hi, hindex⟩
    apply Finset.mem_image.mpr ⟨i, Finset.mem_univ _, ?_⟩
    calc
      B.boundary (roleEmbedding P B i) =
          B.boundary (B.indexOf (ambientCarrierLabel P
            (roleCarrier_subset P) label)) := congrArg B.boundary hindex
      _ = pointOf (ambientCarrierLabel P (roleCarrier_subset P) label) :=
        B.point_eq (ambientCarrierLabel P (roleCarrier_subset P) label)
      _ = point := by rfl

theorem projectedBoundary_injective
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) :
    Function.Injective (projectedBoundary P B) := by
  intro i j hij
  apply (roleEmbedding P B).injective
  apply B.boundary_injective
  exact hij

theorem projectedBoundary_ccw
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) :
    EuclideanGeometry.IsCcwConvexPolygon (projectedBoundary P B) := by
  change EuclideanGeometry.IsCcwConvexPolygon
    (fun i : Fin (roleCarrier P).card => B.boundary (roleEmbedding P B i))
  exact isCcwConvexPolygon_subsequence B.boundary_ccw
    (roleEmbedding P B).strictMono

theorem projectedIndex_point_eq
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (label : CarrierLabel (roleCarrier P)) :
    projectedBoundary P B
        (orderedRoleIndex P (roleCarrier_subset P) B label) = label.1 := by
  change B.boundary (roleEmbedding P B
    (orderedRoleIndex P (roleCarrier_subset P) B label)) = label.1
  change B.boundary (orderedRoleEmbedding P (roleCarrier_subset P) B
    (orderedRoleIndex P (roleCarrier_subset P) B label)) = label.1
  rw [orderedRoleEmbedding_orderedRoleIndex]
  exact B.point_eq (ambientCarrierLabel P (roleCarrier_subset P) label)

/- Boundary indexing whose order is inherited from the ambient boundary. -/
set_option maxHeartbeats 3000000 in
noncomputable def projectedBoundaryIndexing
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) : BoundaryIndexing (roleCarrier P) := by
  classical
  refine {
    n := (roleCarrier P).card
    boundary := projectedBoundary P B
    indexOf := orderedRoleIndex P (roleCarrier_subset P) B
    boundary_injective := projectedBoundary_injective P B
    boundary_image := projectedBoundary_image P B
    boundary_ccw := projectedBoundary_ccw P B
    index_injective := ?_
    point_eq := ?_ }
  · intro x y hxy
    apply Subtype.ext
    exact (projectedIndex_point_eq P B x).symm.trans
      ((congrArg (projectedBoundary P B) hxy).trans
        (projectedIndex_point_eq P B y))
  · intro label
    change projectedBoundary P B
      (orderedRoleIndex P (roleCarrier_subset P) B label) = label.1
    exact projectedIndex_point_eq P B label

noncomputable def projectedRoleIndex
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (role : B1CardSixRole) : Fin R.n :=
  R.indexOf (projectedRoleLabel P role)

theorem projectedRoleIndex_alias_preserved
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (r s : B1CardSixRole) :
    projectedRoleIndex P R r = projectedRoleIndex P R s ↔
      B1CardSixRole.value P r = B1CardSixRole.value P s := by
  constructor
  · intro h
    have hlabels := R.index_injective h
    apply Subtype.ext
    exact (projectedRoleLabel_val P r).trans
      ((congrArg Subtype.val hlabels).trans
        (projectedRoleLabel_val P s).symm)
  · intro h
    have hlabels : projectedRoleLabel P r = projectedRoleLabel P s := by
      apply Subtype.ext
      exact (projectedRoleLabel_val P r).trans
        ((congrArg Subtype.val h).trans
          (projectedRoleLabel_val P s).symm)
    exact congrArg R.indexOf hlabels

private theorem row_choice_mem_sourceRowChoices
    (P : B1CardSixLocalRolePacket C) (row : B1CardSixPositiveRow) :
    B1CardSixPositiveRow.choice P row ∈ P.sourceRowChoices := by
  cases row <;>
    simp [B1CardSixPositiveRow.choice,
      B1CardSixLocalRolePacket.sourceRowChoices]

private theorem row_support_has_role
    (P : B1CardSixLocalRolePacket C) (row : B1CardSixPositiveRow)
    {point : CarrierLabel D.A}
    (hpoint : point ∈ (B1CardSixPositiveRow.choice P row).support) :
    ∃ role : B1CardSixRole, point = B1CardSixRole.value P role := by
  cases row with
  | physical =>
      have hs : point = P.d1 ∨ point = P.d2 ∨ point = P.u0 ∨
          point = P.u1 ∨ point = P.v0 ∨ point = P.v1 := by
        simpa [B1CardSixPositiveRow.choice,
          B1CardSixLocalRolePacket.physicalRowChoice] using hpoint
      rcases hs with h | h | h | h | h | h
      · exact ⟨.d1, h⟩
      · exact ⟨.d2, h⟩
      · exact ⟨.u0, h⟩
      · exact ⟨.u1, h⟩
      · exact ⟨.v0, h⟩
      · exact ⟨.v1, h⟩
  | common =>
      have hs : point = P.d1 ∨ point = P.d2 ∨ point = P.c0 ∨
          point = P.c1 := by
        simpa [B1CardSixPositiveRow.choice,
          B1CardSixLocalRolePacket.commonRowChoice] using hpoint
      rcases hs with h | h | h | h
      · exact ⟨.d1, h⟩
      · exact ⟨.d2, h⟩
      · exact ⟨.c0, h⟩
      · exact ⟨.c1, h⟩
  | u =>
      have hs : point = P.u0 ∨ point = P.u1 ∨ point = P.uL ∨
          point = P.uR := by
        simpa [B1CardSixPositiveRow.choice,
          B1CardSixLocalRolePacket.uRowChoice] using hpoint
      rcases hs with h | h | h | h
      · exact ⟨.u0, h⟩
      · exact ⟨.u1, h⟩
      · exact ⟨.uL, h⟩
      · exact ⟨.uR, h⟩
  | v =>
      have hs : point = P.v0 ∨ point = P.v1 ∨ point = P.vL ∨
          point = P.vR := by
        simpa [B1CardSixPositiveRow.choice,
          B1CardSixLocalRolePacket.vRowChoice] using hpoint
      rcases hs with h | h | h | h
      · exact ⟨.v0, h⟩
      · exact ⟨.v1, h⟩
      · exact ⟨.vL, h⟩
      · exact ⟨.vR, h⟩

private theorem row_support_mem_roleCarrier
    (P : B1CardSixLocalRolePacket C) (row : B1CardSixPositiveRow)
    {point : CarrierLabel D.A}
    (hpoint : point ∈ (B1CardSixPositiveRow.choice P row).support) :
    point.1 ∈ roleCarrier P := by
  rcases row_support_has_role P row hpoint with ⟨role, hrole⟩
  rw [hrole]
  exact (roleLabel P role).2

private theorem row_anchor_mem_choice
    (P : B1CardSixLocalRolePacket C) (row : B1CardSixPositiveRow) :
    B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row) ∈
      (B1CardSixPositiveRow.choice P row).support := by
  cases row <;>
    simp [B1CardSixRole.value, B1CardSixPositiveRow.anchorRole,
      B1CardSixPositiveRow.choice,
      B1CardSixLocalRolePacket.physicalRowChoice,
      B1CardSixLocalRolePacket.commonRowChoice,
      B1CardSixLocalRolePacket.uRowChoice,
      B1CardSixLocalRolePacket.vRowChoice]

private theorem row_center_value_eq_choice_center
    (P : B1CardSixLocalRolePacket C) (row : B1CardSixPositiveRow) :
    B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row) =
      (B1CardSixPositiveRow.choice P row).center := by
  cases row <;> rfl

noncomputable def projectedRowMembers
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) : Finset (Fin R.n) :=
  (B1CardSixPositiveRow.choice P row).support.attach.image
    (fun point => R.indexOf ⟨point.1.1,
      row_support_mem_roleCarrier P row point.2⟩)

noncomputable def projectedRowCenter
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) : Fin R.n :=
  projectedRoleIndex P R (B1CardSixPositiveRow.centerRole row)

noncomputable def projectedRowAnchor
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) : Fin R.n :=
  projectedRoleIndex P R (B1CardSixPositiveRow.anchorRole row)

theorem projectedRowAnchor_mem
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) :
    projectedRowAnchor P R row ∈ projectedRowMembers P R row := by
  classical
  refine Finset.mem_image.mpr ⟨
    ⟨B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row),
      row_anchor_mem_choice P row⟩, ?_, ?_⟩
  · simp
  · rfl

theorem projectedRow_positive
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) (i : Fin R.n)
    (hi : i ∈ projectedRowMembers P R row) :
    dist (R.boundary (projectedRowCenter P R row)) (R.boundary i) =
      dist (R.boundary (projectedRowCenter P R row))
        (R.boundary (projectedRowAnchor P R row)) := by
  classical
  rcases Finset.mem_image.mp hi with ⟨point, _hpoint, rfl⟩
  have hchoice := positiveRowsMatch_sourceRowChoices P
    (B1CardSixPositiveRow.choice P row)
    (row_choice_mem_sourceRowChoices P row)
  have hpointMetric :=
    (mem_sourceMetricRows_iff P
      (B1CardSixPositiveRow.choice P row).center point.1).mp
      (hchoice point.2)
  have hanchorMetric :=
    (mem_sourceMetricRows_iff P
      (B1CardSixPositiveRow.choice P row).center
      (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row))).mp
      (hchoice (row_anchor_mem_choice P row))
  have hcenter := row_center_value_eq_choice_center P row
  rw [← hcenter] at hpointMetric hanchorMetric
  have hdist :
      dist (B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row)).1
          point.1.1 =
        dist (B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row)).1
          (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row)).1 :=
    hpointMetric.trans hanchorMetric.symm
  have hcenterPoint := R.point_eq
    (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))
  have hpointPoint := R.point_eq
    ⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩
  have hanchorPoint := R.point_eq
    (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row))
  change dist (R.boundary (R.indexOf
      (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))))
      (R.boundary (R.indexOf
        ⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩)) =
    dist (R.boundary (R.indexOf
      (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))))
      (R.boundary (R.indexOf
        (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row))))
  rw [hcenterPoint, hpointPoint, hanchorPoint]
  simpa [projectedRoleLabel, pointOf] using hdist

set_option maxHeartbeats 3000000 in
theorem projectedPhysicalRow_card
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    (projectedRowMembers P R .physical).card = 6 := by
  classical
  let f : ↥((B1CardSixPositiveRow.choice P .physical).support) → Fin R.n :=
    fun point =>
    R.indexOf ⟨point.1.1, row_support_mem_roleCarrier P .physical point.2⟩
  have hf : Function.Injective f := by
    intro x y hxy
    have hpoint : x.1.1 = y.1.1 :=
      congrArg (fun q : CarrierLabel (roleCarrier P) => q.1)
        (R.index_injective hxy)
    apply Subtype.ext
    exact Subtype.ext hpoint
  change ((B1CardSixPositiveRow.choice P .physical).support.attach.image f).card = 6
  calc
    ((B1CardSixPositiveRow.choice P .physical).support.attach.image f).card =
        (B1CardSixPositiveRow.choice P .physical).support.attach.card :=
      Finset.card_image_of_injective _ hf
    _ = (B1CardSixPositiveRow.choice P .physical).support.card :=
      Finset.card_attach
    _ = 6 := by
      simpa [B1CardSixPositiveRow.choice,
        B1CardSixLocalRolePacket.physicalRowChoice] using
        physicalRowChoice_support_card_eq_six P hnormal hsix

noncomputable def physicalRolePoints
    (P : B1CardSixLocalRolePacket C) : Finset ℝ² :=
  Finset.image (pointOf (A := D.A)) P.physicalRowChoice.support

private theorem physicalRolePoints_subset_roleCarrier
    (P : B1CardSixLocalRolePacket C) :
    physicalRolePoints P ⊆ roleCarrier P := by
  classical
  intro point hpoint
  rcases Finset.mem_image.mp hpoint with ⟨source, hsource, rfl⟩
  obtain ⟨role, hrole⟩ :
      ∃ role : B1CardSixRole, source = B1CardSixRole.value P role := by
    have hs : source = P.d1 ∨ source = P.d2 ∨ source = P.u0 ∨
        source = P.u1 ∨ source = P.v0 ∨ source = P.v1 := by
      simpa [B1CardSixLocalRolePacket.physicalRowChoice] using hsource
    rcases hs with h | h | h | h | h | h
    · exact ⟨.d1, h⟩
    · exact ⟨.d2, h⟩
    · exact ⟨.u0, h⟩
    · exact ⟨.u1, h⟩
    · exact ⟨.v0, h⟩
    · exact ⟨.v1, h⟩
  change source.1 ∈ roleCarrier P
  rw [hrole]
  exact (roleLabel P role).2

theorem physicalRolePoints_card_eq_six
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    (physicalRolePoints P).card = 6 := by
  classical
  change (Finset.image (fun x : CarrierLabel D.A => x.1)
    P.physicalRowChoice.support).card = 6
  rw [Finset.card_image_of_injective _ Subtype.val_injective]
  exact physicalRowChoice_support_card_eq_six P hnormal hsix

theorem roleCarrier_card_ge_six
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    6 ≤ (roleCarrier P).card := by
  calc
    6 = (physicalRolePoints P).card :=
      (physicalRolePoints_card_eq_six P hnormal hsix).symm
    _ ≤ (roleCarrier P).card :=
      Finset.card_le_card (physicalRolePoints_subset_roleCarrier P)

noncomputable def projectedLabelIndex
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (label : CarrierLabel (roleCarrier P)) : Fin (roleCarrier P).card :=
  orderedRoleIndex P (roleCarrier_subset P) B label

theorem projectedLabelIndex_injective
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) :
    Function.Injective (projectedLabelIndex P B) := by
  intro x y hxy
  apply Subtype.ext
  exact (projectedIndex_point_eq P B x).symm.trans
    ((congrArg (projectedBoundary P B) hxy).trans
      (projectedIndex_point_eq P B y))

noncomputable def projectedRowMembersOnAmbient
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (row : B1CardSixPositiveRow) : Finset (Fin (roleCarrier P).card) :=
  (B1CardSixPositiveRow.choice P row).support.attach.image
    (fun point => projectedLabelIndex P B ⟨point.1.1,
      row_support_mem_roleCarrier P row point.2⟩)

noncomputable def projectedRowCenterOnAmbient
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (row : B1CardSixPositiveRow) : Fin (roleCarrier P).card :=
  roleIndex P B (B1CardSixPositiveRow.centerRole row)

noncomputable def projectedRowAnchorOnAmbient
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (row : B1CardSixPositiveRow) : Fin (roleCarrier P).card :=
  roleIndex P B (B1CardSixPositiveRow.anchorRole row)

theorem projectedRowAnchorOnAmbient_mem
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (row : B1CardSixPositiveRow) :
    projectedRowAnchorOnAmbient P B row ∈
      projectedRowMembersOnAmbient P B row := by
  classical
  refine Finset.mem_image.mpr ⟨
    ⟨B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row),
      row_anchor_mem_choice P row⟩, ?_, ?_⟩
  · simp
  · rfl

theorem projectedRow_positive_onAmbient
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (row : B1CardSixPositiveRow) (i : Fin (roleCarrier P).card)
    (hi : i ∈ projectedRowMembersOnAmbient P B row) :
    dist (projectedBoundary P B (projectedRowCenterOnAmbient P B row))
        (projectedBoundary P B i) =
      dist (projectedBoundary P B (projectedRowCenterOnAmbient P B row))
        (projectedBoundary P B (projectedRowAnchorOnAmbient P B row)) := by
  classical
  rcases Finset.mem_image.mp hi with ⟨point, _hpoint, rfl⟩
  have hchoice := positiveRowsMatch_sourceRowChoices P
    (B1CardSixPositiveRow.choice P row)
    (row_choice_mem_sourceRowChoices P row)
  have hpointMetric :=
    (mem_sourceMetricRows_iff P
      (B1CardSixPositiveRow.choice P row).center point.1).mp
      (hchoice point.2)
  have hanchorMetric :=
    (mem_sourceMetricRows_iff P
      (B1CardSixPositiveRow.choice P row).center
      (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row))).mp
      (hchoice (row_anchor_mem_choice P row))
  have hcenter := row_center_value_eq_choice_center P row
  rw [← hcenter] at hpointMetric hanchorMetric
  have hdist :
      dist (B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row)).1
          point.1.1 =
        dist (B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row)).1
          (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row)).1 :=
    hpointMetric.trans hanchorMetric.symm
  have hcenterPoint := projectedIndex_point_eq P B
    (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))
  have hpointPoint := projectedIndex_point_eq P B
    ⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩
  have hanchorPoint := projectedIndex_point_eq P B
    (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row))
  have hcenterPoint' :
      projectedBoundary P B
          (projectedLabelIndex P B
            (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))) =
        (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row)).1 := by
    simpa only [projectedLabelIndex] using hcenterPoint
  have hpointPoint' :
      projectedBoundary P B
          (projectedLabelIndex P B
            ⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩) =
        (⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩ :
          CarrierLabel (roleCarrier P)).1 := by
    simpa only [projectedLabelIndex] using hpointPoint
  have hanchorPoint' :
      projectedBoundary P B
          (projectedLabelIndex P B
            (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row))) =
        (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row)).1 := by
    simpa only [projectedLabelIndex] using hanchorPoint
  change dist (projectedBoundary P B
      (projectedLabelIndex P B
        (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))))
      (projectedBoundary P B
        (projectedLabelIndex P B
          ⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩)) =
    dist (projectedBoundary P B
      (projectedLabelIndex P B
        (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))))
      (projectedBoundary P B
        (projectedLabelIndex P B
          (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row))))
  rw [hcenterPoint', hpointPoint', hanchorPoint']
  simpa [projectedBoundary, projectedLabelIndex, projectedRoleLabel, roleIndex,
    pointOf] using hdist

set_option maxHeartbeats 3000000 in
theorem projectedPhysicalRow_card_onAmbient
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    (projectedRowMembersOnAmbient P B .physical).card = 6 := by
  classical
  let f : ↥((B1CardSixPositiveRow.choice P .physical).support) →
      Fin (roleCarrier P).card := fun point =>
    projectedLabelIndex P B ⟨point.1.1,
      row_support_mem_roleCarrier P .physical point.2⟩
  have hf : Function.Injective f := by
    intro x y hxy
    have hpoint : x.1.1 = y.1.1 :=
      congrArg (fun q : CarrierLabel (roleCarrier P) => q.1)
        (projectedLabelIndex_injective P B hxy)
    apply Subtype.ext
    exact Subtype.ext hpoint
  change ((B1CardSixPositiveRow.choice P .physical).support.attach.image f).card = 6
  calc
    ((B1CardSixPositiveRow.choice P .physical).support.attach.image f).card =
        (B1CardSixPositiveRow.choice P .physical).support.attach.card :=
      Finset.card_image_of_injective _ hf
    _ = (B1CardSixPositiveRow.choice P .physical).support.card :=
      Finset.card_attach
    _ = 6 := by
      simpa [B1CardSixPositiveRow.choice,
        B1CardSixLocalRolePacket.physicalRowChoice] using
        physicalRowChoice_support_card_eq_six P hnormal hsix

end B1CardSixProjectedPointConfiguration
end ATailFrontierLiveClosure
end Problem97
