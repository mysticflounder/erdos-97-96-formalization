/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixPointConfigurationIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LiveSharedPairNonalternationIngress

/-!
# B1 card-six role projection ingress

The native adapter consumes only the image of the sixteen named role values.
This module supplies the finite carrier, its inherited source geometry, a
boundary indexing, positive row transport, and an explicit orientation-safe
coordinate-reflection chart.  Role aliases remain allowed; only source-proved distinctions
are used.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixRoleProjectionIngress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open B1CardSixBoundaryRoleIngress
open B1CardSixLocalRolePacket
open B1CardSixPointConfigurationIngress
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The explicit finite universe of role tags. -/
def roleUniverse : Finset B1CardSixRole :=
  {.physicalApex, .d1, .d2, .u0, .u1, .v0, .v1,
    .Bc, .Bu, .Bv, .c0, .c1, .uL, .uR, .vL, .vR}

/-- The projected carrier is the image of the sixteen named role values. -/
noncomputable def roleCarrier (P : B1CardSixLocalRolePacket C) : Finset ℝ² :=
  roleUniverse.image (fun role => (B1CardSixRole.value P role).1)

theorem roleUniverse_card : roleUniverse.card = 16 := by
  classical
  decide

theorem roleCarrier_mem (P : B1CardSixLocalRolePacket C)
    (role : B1CardSixRole) :
    (B1CardSixRole.value P role).1 ∈ roleCarrier P := by
  classical
  cases role <;>
    exact Finset.mem_image.mpr ⟨_, by simp [roleUniverse], rfl⟩

theorem roleCarrier_subset_A (P : B1CardSixLocalRolePacket C) :
    roleCarrier P ⊆ D.A := by
  classical
  intro point hpoint
  rcases Finset.mem_image.mp hpoint with ⟨role, _hrole, hvalue⟩
  rw [← hvalue]
  exact (B1CardSixRole.value P role).2

theorem roleCarrier_card_le_sixteen (P : B1CardSixLocalRolePacket C) :
    (roleCarrier P).card ≤ 16 := by
  classical
  calc
    (roleCarrier P).card ≤ roleUniverse.card := Finset.card_image_le
    _ = 16 := roleUniverse_card

theorem roleCarrier_convexIndep (P : B1CardSixLocalRolePacket C) :
    ConvexIndep (roleCarrier P) :=
  ConvexIndep.mono (roleCarrier_subset_A P) D.convex

/-- The six physical support values are retained in the role projection. -/
noncomputable def physicalRolePoints
    (P : B1CardSixLocalRolePacket C) : Finset ℝ² :=
  Finset.image (pointOf (A := D.A)) P.physicalRowChoice.support

private theorem physicalRolePoints_subset_roleCarrier
    (P : B1CardSixLocalRolePacket C) :
    physicalRolePoints P ⊆ roleCarrier P := by
  classical
  intro point hpoint
  rcases Finset.mem_image.mp hpoint with ⟨source, hsource, rfl⟩
  obtain ⟨role, hrole⟩ :=
    (show ∃ role : B1CardSixRole,
      source = B1CardSixRole.value P role from by
        have hs : source = P.d1 ∨ source = P.d2 ∨ source = P.u0 ∨
            source = P.u1 ∨ source = P.v0 ∨ source = P.v1 := by
          simpa [B1CardSixLocalRolePacket.physicalRowChoice] using hsource
        rcases hs with h | h | h | h | h | h
        · exact ⟨.d1, h⟩
        · exact ⟨.d2, h⟩
        · exact ⟨.u0, h⟩
        · exact ⟨.u1, h⟩
        · exact ⟨.v0, h⟩
        · exact ⟨.v1, h⟩)
  have hrole' := congrArg Subtype.val hrole
  change source.1 ∈ roleCarrier P
  rw [hrole']
  exact roleCarrier_mem P role

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

theorem roleCarrier_not_collinear
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    ¬ Collinear ℝ ((roleCarrier P : Finset ℝ²) : Set ℝ²) := by
  have hthree : 3 ≤ (roleCarrier P).card := by
    exact le_trans (by decide) (roleCarrier_card_ge_six P hnormal hsix)
  exact ConvexIndep.not_collinear_of_card_ge_three
    (roleCarrier_convexIndep P) hthree

/-- A boundary indexing supplied by the projected carrier bridge. -/
noncomputable def projectedBoundaryIndexing
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    Nonempty (BoundaryIndexing (roleCarrier P)) :=
  exists_boundaryIndexing
    (roleCarrier_convexIndep P)
    (roleCarrier_not_collinear P hnormal hsix)

noncomputable def projectedRoleLabel
    (P : B1CardSixLocalRolePacket C) (role : B1CardSixRole) :
    CarrierLabel (roleCarrier P) :=
  ⟨(B1CardSixRole.value P role).1, roleCarrier_mem P role⟩

noncomputable def projectedRoleIndex
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing (roleCarrier P))
    (role : B1CardSixRole) : Fin B.n :=
  B.indexOf (projectedRoleLabel P role)

theorem projectedRoleIndex_alias_preserved
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing (roleCarrier P))
    (r s : B1CardSixRole) :
    projectedRoleIndex P B r = projectedRoleIndex P B s ↔
      B1CardSixRole.value P r = B1CardSixRole.value P s := by
  constructor
  · intro h
    have hlabels : projectedRoleLabel P r = projectedRoleLabel P s :=
      B.index_injective h
    apply Subtype.ext
    simpa [projectedRoleLabel] using congrArg Subtype.val hlabels
  · intro h
    apply congrArg B.indexOf
    apply Subtype.ext
    simpa [projectedRoleLabel] using congrArg Subtype.val h

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
  rw [congrArg Subtype.val hrole]
  exact roleCarrier_mem P role

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
    (B : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) : Finset (Fin B.n) :=
  (B1CardSixPositiveRow.choice P row).support.attach.image
    (fun point => B.indexOf ⟨point.1.1,
      row_support_mem_roleCarrier P row point.2⟩)

noncomputable def projectedRowCenter
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) : Fin B.n :=
  projectedRoleIndex P B (B1CardSixPositiveRow.centerRole row)

noncomputable def projectedRowAnchor
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) : Fin B.n :=
  projectedRoleIndex P B (B1CardSixPositiveRow.anchorRole row)

theorem projectedRowAnchor_mem
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) :
    projectedRowAnchor P B row ∈ projectedRowMembers P B row := by
  classical
  refine Finset.mem_image.mpr ⟨
    ⟨B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row),
      row_anchor_mem_choice P row⟩, ?_, ?_⟩
  · simp
  · rfl

theorem projectedRow_positive
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing (roleCarrier P))
    (row : B1CardSixPositiveRow) (i : Fin B.n)
    (hi : i ∈ projectedRowMembers P B row) :
    dist (B.boundary (projectedRowCenter P B row)) (B.boundary i) =
      dist (B.boundary (projectedRowCenter P B row))
        (B.boundary (projectedRowAnchor P B row)) := by
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
  have hcenterPoint := B.point_eq
    (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))
  have hpointPoint := B.point_eq
    ⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩
  have hanchorPoint := B.point_eq
    (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row))
  change dist (B.boundary (B.indexOf
      (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))))
      (B.boundary (B.indexOf
        ⟨point.1.1, row_support_mem_roleCarrier P row point.2⟩)) =
    dist (B.boundary (B.indexOf
      (projectedRoleLabel P (B1CardSixPositiveRow.centerRole row))))
      (B.boundary (B.indexOf
        (projectedRoleLabel P (B1CardSixPositiveRow.anchorRole row))))
  rw [hcenterPoint, hpointPoint, hanchorPoint]
  simpa [projectedRoleLabel, pointOf] using hdist

/-- The reflected carrier used for the native adapter's positive orientation. -/
noncomputable def reflectedCarrier (A : Finset ℝ²) : Finset ℝ² :=
  A.image reflectXAxis

/-- A reflected chart keeps all boundary indices and reverses signed area. -/
structure ReflectedBoundaryChart (A : Finset ℝ²) where
  n : ℕ
  boundary : Fin n → ℝ²
  indexOf : CarrierLabel A → Fin n
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = reflectedCarrier A
  index_injective : Function.Injective indexOf
  point_eq : ∀ label,
    boundary (indexOf label) = reflectXAxis (pointOf label)
  positive_triple : ∀ {i j k : Fin n}, i < j → j < k →
    0 < signedArea2 (boundary i) (boundary j) (boundary k)

noncomputable def reflectedBoundaryChart
    {A : Finset ℝ²} (B : BoundaryIndexing A) :
    ReflectedBoundaryChart A := by
  classical
  refine {
    n := B.n
    boundary := fun i => reflectXAxis (B.boundary i)
    indexOf := B.indexOf
    boundary_injective := ?_
    boundary_image := ?_
    index_injective := ?_
    point_eq := ?_
    positive_triple := ?_ }
  · intro i j h
    exact B.boundary_injective (reflectXAxis_injective h)
  · ext point
    constructor
    · intro hpoint
      rcases Finset.mem_image.mp hpoint with ⟨i, _hi, hvalue⟩
      apply Finset.mem_image.mpr
      have hmem : B.boundary i ∈ A := by
        have hmem' : B.boundary i ∈ Finset.univ.image B.boundary :=
          Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
        rw [B.boundary_image] at hmem'
        exact hmem'
      exact ⟨B.boundary i, hmem, hvalue⟩
    · intro hpoint
      rcases Finset.mem_image.mp hpoint with ⟨a, ha, hvalue⟩
      have hpoint' : a ∈ Finset.univ.image B.boundary := by
        rw [B.boundary_image]
        exact ha
      rcases Finset.mem_image.mp hpoint' with ⟨i, _hi, hboundary⟩
      apply Finset.mem_image.mpr
      refine ⟨i, Finset.mem_univ _, ?_⟩
      simpa [hboundary] using hvalue
  · intro a b h
    exact B.index_injective h
  · intro label
    rw [B.point_eq label]
  · intro i j k hij hjk
    have hneg :
        signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 :=
      hneg_of_ccw B.boundary_injective B.boundary_ccw hij hjk
    change 0 < signedArea2 (reflectXAxis (B.boundary i))
      (reflectXAxis (B.boundary j)) (reflectXAxis (B.boundary k))
    rw [signedArea2_reflectXAxis]
    linarith

/-- Reflection leaves the linear-cut `btw` indices unchanged. -/
def B1SliceSameBoundaryArcReflected {A : Finset ℝ²}
    (B : BoundaryIndexing A) (apex source : CarrierLabel A)
    (slice : Finset ℝ²) :
    Prop :=
  ∀ ix iy : Fin B.n,
    reflectXAxis (B.boundary ix) ∈
        slice.image reflectXAxis →
    reflectXAxis (B.boundary iy) ∈
        slice.image reflectXAxis →
    ix ≠ iy →
    (SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf source) ix ↔
      SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf source) iy)

theorem sameBoundaryArc_reflected_iff {A : Finset ℝ²}
    (B : BoundaryIndexing A) (apex source : CarrierLabel A)
    (slice : Finset ℝ²) :
    B1SliceSameBoundaryArc B apex source slice ↔
      B1SliceSameBoundaryArcReflected B apex source slice := by
  constructor
  · intro h ix iy hix hiy hne
    exact h ix iy
      (by rcases Finset.mem_image.mp hix with ⟨p, hp, hreflect⟩
          exact (reflectXAxis_injective hreflect).symm ▸ hp)
      (by rcases Finset.mem_image.mp hiy with ⟨p, hp, hreflect⟩
          exact (reflectXAxis_injective hreflect).symm ▸ hp)
      hne
  · intro h ix iy hix hiy hne
    apply h ix iy
    · exact Finset.mem_image.mpr ⟨B.boundary ix, hix, rfl⟩
    · exact Finset.mem_image.mpr ⟨B.boundary iy, hiy, rfl⟩
    · exact hne

noncomputable def ambientRoleLabel
    (P : B1CardSixLocalRolePacket C) (role : B1CardSixRole) :
    CarrierLabel D.A :=
  B1CardSixRole.value P role

private theorem btw_map_iff {n m : ℕ} (e : Fin n → Fin m)
    (horder : ∀ {i j}, e i < e j ↔ i < j)
    (i j k : Fin n) :
    SurplusCOMPGBank.btw (e i) (e j) (e k) ↔
      SurplusCOMPGBank.btw i j k := by
  unfold SurplusCOMPGBank.btw
  simp only [horder]

noncomputable def roleLabelToAmbientLabel
    (P : B1CardSixLocalRolePacket C) :
    CarrierLabel (roleCarrier P) → CarrierLabel D.A :=
  fun label => ⟨label.1, roleCarrier_subset_A P label.2⟩

noncomputable def ambientRoleIndices
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Finset (Fin B.n) :=
  (roleCarrier P).attach.image
    (fun label => B.indexOf (roleLabelToAmbientLabel P label))

private theorem ambientRoleIndex_injective
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Function.Injective
      (fun label : CarrierLabel (roleCarrier P) =>
        B.indexOf (roleLabelToAmbientLabel P label)) := by
  intro x y hxy
  apply Subtype.ext
  calc
    x.1 = B.boundary (B.indexOf (roleLabelToAmbientLabel P x)) := by
      simpa [roleLabelToAmbientLabel, pointOf] using
        (B.point_eq (roleLabelToAmbientLabel P x)).symm
    _ = B.boundary (B.indexOf (roleLabelToAmbientLabel P y)) :=
      congrArg B.boundary hxy
    _ = y.1 := by
      simpa [roleLabelToAmbientLabel, pointOf] using
        B.point_eq (roleLabelToAmbientLabel P y)

theorem ambientRoleIndices_card
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    (ambientRoleIndices P B).card = (roleCarrier P).card := by
  calc
    (ambientRoleIndices P B).card =
        (roleCarrier P).attach.card := by
      unfold ambientRoleIndices
      exact Finset.card_image_of_injective _ (ambientRoleIndex_injective P B)
    _ = (roleCarrier P).card := Finset.card_attach

noncomputable def orderedRoleEmbedding
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Fin (roleCarrier P).card ↪o Fin B.n :=
  (ambientRoleIndices P B).orderEmbOfFin (ambientRoleIndices_card P B)

private theorem orderedRoleBoundary_image
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Finset.univ.image (fun i : Fin (roleCarrier P).card =>
      B.boundary (orderedRoleEmbedding P B i)) = roleCarrier P := by
  ext point
  constructor
  · intro hpoint
    rcases Finset.mem_image.mp hpoint with ⟨i, _hi, hpoint⟩
    have hi : orderedRoleEmbedding P B i ∈ ambientRoleIndices P B :=
      Finset.orderEmbOfFin_mem _ (ambientRoleIndices_card P B) i
    rcases Finset.mem_image.mp hi with ⟨label, _hlabel, hindex⟩
    rw [← hindex] at hpoint
    rw [B.point_eq (roleLabelToAmbientLabel P label)] at hpoint
    have hpoint' : point = label.1 := by
      simpa [roleLabelToAmbientLabel, pointOf] using hpoint.symm
    rw [hpoint']
    exact label.2
  · intro hpoint
    let label : CarrierLabel (roleCarrier P) := ⟨point, hpoint⟩
    have hi : B.indexOf (roleLabelToAmbientLabel P label) ∈
        ambientRoleIndices P B := by
      exact Finset.mem_image.mpr
        ⟨label, Finset.mem_attach (roleCarrier P) label, rfl⟩
    have himage :
        Finset.univ.image (orderedRoleEmbedding P B) =
          ambientRoleIndices P B := by
      simpa [orderedRoleEmbedding] using
        (Finset.image_orderEmbOfFin_univ
          (ambientRoleIndices P B) (ambientRoleIndices_card P B))
    have hi' : B.indexOf (roleLabelToAmbientLabel P label) ∈
        Finset.univ.image (orderedRoleEmbedding P B) := by
      rw [himage]
      exact hi
    rcases Finset.mem_image.mp hi' with ⟨i, _hi, hindex⟩
    apply Finset.mem_image.mpr ⟨i, Finset.mem_univ _, ?_⟩
    calc
      B.boundary (orderedRoleEmbedding P B i) =
          B.boundary (B.indexOf (roleLabelToAmbientLabel P label)) :=
        congrArg B.boundary hindex
      _ = pointOf (roleLabelToAmbientLabel P label) :=
        B.point_eq (roleLabelToAmbientLabel P label)
      _ = point := by rfl

structure OrderedBoundarySubsequence
    {A : Finset ℝ²} (K : Finset ℝ²) (B : BoundaryIndexing A) where
  boundaryIndexing : BoundaryIndexing K
  embedding : Fin boundaryIndexing.n ↪o Fin B.n
  boundary_eq : ∀ i,
    boundaryIndexing.boundary i = B.boundary (embedding i)

abbrev OrderedRoleProjection
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :=
  OrderedBoundarySubsequence (roleCarrier P) B

structure OrderedRoleProjectionData
    {A K : Finset ℝ²} (B : BoundaryIndexing A) where
  boundary : Fin K.card → ℝ²
  indexOf : CarrierLabel K → Fin K.card
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = K
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  index_injective : Function.Injective indexOf
  point_eq : ∀ label, boundary (indexOf label) = pointOf label
  embedding : Fin K.card ↪o Fin B.n
  boundary_eq : ∀ i, boundary i = B.boundary (embedding i)

noncomputable def OrderedRoleProjectionData.toBoundaryIndexing
    {A K : Finset ℝ²} {B : BoundaryIndexing A}
    (Q : OrderedRoleProjectionData (K := K) B) : BoundaryIndexing K :=
  { n := K.card
    boundary := Q.boundary
    indexOf := Q.indexOf
    boundary_injective := Q.boundary_injective
    boundary_image := Q.boundary_image
    boundary_ccw := Q.boundary_ccw
    index_injective := Q.index_injective
    point_eq := Q.point_eq }

set_option maxHeartbeats 3000000 in
noncomputable def orderedRoleProjection
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    OrderedRoleProjectionData (K := roleCarrier P) B := by
  classical
  let boundary : Fin (roleCarrier P).card → ℝ² :=
    fun i => B.boundary (orderedRoleEmbedding P B i)
  have hboundary_image : Finset.univ.image boundary = roleCarrier P := by
    change Finset.univ.image (fun i : Fin (roleCarrier P).card =>
      B.boundary (orderedRoleEmbedding P B i)) = roleCarrier P
    exact orderedRoleBoundary_image P B
  have hboundary_injective : Function.Injective boundary := by
    intro i j hij
    apply (orderedRoleEmbedding P B).injective
    apply B.boundary_injective
    exact hij
  have hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
    change EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin (roleCarrier P).card =>
        B.boundary (orderedRoleEmbedding P B i))
    exact isCcwConvexPolygon_subsequence B.boundary_ccw
      (orderedRoleEmbedding P B).strictMono
  have hex (label : CarrierLabel (roleCarrier P)) :
      ∃ i : Fin (roleCarrier P).card, boundary i = label.1 := by
    have hmem : label.1 ∈ Finset.univ.image boundary := by
      rw [hboundary_image]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let indexOf : CarrierLabel (roleCarrier P) →
      Fin (roleCarrier P).card :=
    fun label => Classical.choose (hex label)
  have hpoint : ∀ label, boundary (indexOf label) = pointOf label := by
    intro label
    exact Classical.choose_spec (hex label)
  have hindex_injective : Function.Injective indexOf := by
    intro x y hxy
    apply Subtype.ext
    calc
      x.1 = boundary (indexOf x) := (hpoint x).symm
      _ = boundary (indexOf y) := congrArg boundary hxy
      _ = y.1 := hpoint y
  exact {
    boundary := boundary
    indexOf := indexOf
    boundary_injective := hboundary_injective
    boundary_image := hboundary_image
    boundary_ccw := hboundary_ccw
    index_injective := hindex_injective
    point_eq := hpoint
    embedding := orderedRoleEmbedding P B
    boundary_eq := by
      intro i
      rfl }

noncomputable def orderedProjectedBoundaryIndexing
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    BoundaryIndexing (roleCarrier P) :=
  (orderedRoleProjection P B).toBoundaryIndexing

set_option maxHeartbeats 3000000 in
theorem orderedProjectedBoundaryIndexing_boundary
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (i : Fin (roleCarrier P).card) :
    (orderedProjectedBoundaryIndexing P B).boundary i =
      B.boundary (orderedRoleEmbedding P B i) := by
  change B.boundary (orderedRoleEmbedding P B i) =
    B.boundary (orderedRoleEmbedding P B i)
  rfl

/- The exact order-embedding datum needed to restrict an ambient boundary to
the projected role carrier.  The source does not currently produce an
instance of this structure for a chosen ambient boundary and projected
boundary, so the downstream target transport is stated conditionally. -/
def RoleBoundaryRestriction
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (B : BoundaryIndexing D.A) : Prop :=
  ∃ toAmbient : Fin R.n → Fin B.n,
    (∀ {i j}, toAmbient i < toAmbient j ↔ i < j) ∧
    (∀ i, B.boundary (toAmbient i) = R.boundary i) ∧
    (∀ role,
      toAmbient (R.indexOf (projectedRoleLabel P role)) =
        B.indexOf (ambientRoleLabel P role))

/-- A same-arc witness on the projected boundary transports to the ambient
boundary whenever the source-backed restriction datum is supplied. -/
theorem sameBoundaryArc_of_roleBoundaryRestriction
    (P : B1CardSixLocalRolePacket C)
    (R : BoundaryIndexing (roleCarrier P))
    (B : BoundaryIndexing D.A)
    (restriction : RoleBoundaryRestriction P R B)
    (apex source : B1CardSixRole) (slice : Finset ℝ²)
    (hslice : slice ⊆ roleCarrier P)
    (hR : B1SliceSameBoundaryArc R
      (projectedRoleLabel P apex) (projectedRoleLabel P source) slice) :
    B1SliceSameBoundaryArc B
      (ambientRoleLabel P apex) (ambientRoleLabel P source) slice := by
  rcases restriction with ⟨toAmbient, horder, hpoint_eq, hrole_index⟩
  intro ix iy hix hiy hne
  let x : CarrierLabel (roleCarrier P) :=
    ⟨B.boundary ix, hslice hix⟩
  let y : CarrierLabel (roleCarrier P) :=
    ⟨B.boundary iy, hslice hiy⟩
  let rx := R.indexOf x
  let ry := R.indexOf y
  have hxe : toAmbient rx = ix := by
    apply B.boundary_injective
    calc
      B.boundary (toAmbient rx) = R.boundary rx := hpoint_eq rx
      _ = pointOf x := R.point_eq x
      _ = B.boundary ix := rfl
  have hye : toAmbient ry = iy := by
    apply B.boundary_injective
    calc
      B.boundary (toAmbient ry) = R.boundary ry := hpoint_eq ry
      _ = pointOf y := R.point_eq y
      _ = B.boundary iy := rfl
  have hrxy : rx ≠ ry := by
    intro hxy
    apply hne
    calc
      ix = toAmbient rx := hxe.symm
      _ = toAmbient ry := congrArg toAmbient hxy
      _ = iy := hye
  have hrx : R.boundary rx ∈ slice := by
    rw [R.point_eq x]
    simpa [x, pointOf] using hix
  have hry : R.boundary ry ∈ slice := by
    rw [R.point_eq y]
    simpa [y, pointOf] using hiy
  have hsame := hR rx ry hrx hry hrxy
  have hmapx :
      SurplusCOMPGBank.btw (B.indexOf (ambientRoleLabel P apex))
          (B.indexOf (ambientRoleLabel P source)) ix ↔
        SurplusCOMPGBank.btw
          (R.indexOf (projectedRoleLabel P apex))
          (R.indexOf (projectedRoleLabel P source)) rx := by
    have hmap := btw_map_iff toAmbient horder
      (R.indexOf (projectedRoleLabel P apex))
      (R.indexOf (projectedRoleLabel P source)) rx
    rw [hrole_index apex, hrole_index source, hxe] at hmap
    exact hmap
  have hmapy :
      SurplusCOMPGBank.btw (B.indexOf (ambientRoleLabel P apex))
          (B.indexOf (ambientRoleLabel P source)) iy ↔
        SurplusCOMPGBank.btw
          (R.indexOf (projectedRoleLabel P apex))
          (R.indexOf (projectedRoleLabel P source)) ry := by
    have hmap := btw_map_iff toAmbient horder
      (R.indexOf (projectedRoleLabel P apex))
      (R.indexOf (projectedRoleLabel P source)) ry
    rw [hrole_index apex, hrole_index source, hye] at hmap
    exact hmap
  exact hmapx.trans (hsame.trans hmapy.symm)

/-- Public orientation lemma for the normalization used by the native gauge. -/
theorem normSim_signedArea_pos
    {a b x y z : ℝ²} (hab : a ≠ b)
    (h : 0 < signedArea2 x y z) :
    0 < signedArea2 (normSim a b x) (normSim a b y) (normSim a b z) := by
  rw [signedArea2_normSim a b hab]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord b a]
  exact sq_pos_of_pos (dist_pos.mpr hab.symm)

/-- Apply the positive-gauge similarity after the coordinate reflection. -/
noncomputable def normalizedReflectedBoundary
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (a b : ℝ²) : Fin B.n → ℝ² :=
  fun i => normSim a b ((reflectedBoundaryChart B).boundary i)

theorem normalizedReflectedBoundary_positive
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {a b : ℝ²} (hab : a ≠ b)
    {i j k : Fin B.n} (hij : i < j) (hjk : j < k) :
    0 < signedArea2 (normalizedReflectedBoundary B a b i)
      (normalizedReflectedBoundary B a b j)
      (normalizedReflectedBoundary B a b k) := by
  apply normSim_signedArea_pos hab
  exact (reflectedBoundaryChart B).positive_triple hij hjk

theorem normalizedReflectedBoundary_at_index
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (a b : ℝ²) (label : CarrierLabel A) :
    normalizedReflectedBoundary B a b (B.indexOf label) =
      normSim a b (reflectXAxis (pointOf label)) := by
  simpa [normalizedReflectedBoundary,
    reflectedBoundaryChart, pointOf] using
    congrArg (normSim a b)
      ((reflectedBoundaryChart B).point_eq label)

/-- The `u` same-arc alternative in the source target cell. -/
def cardSixUSameBoundaryArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) (B : BoundaryIndexing D.A) : Prop :=
  let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
  let Hlate := lateFirstApexSystem C.R
  let uBlocker := blockerLabel Hlate C.u.1 C.u.2
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩
      physicalClass
  (uSlice.card = 2 → B1SliceSameBoundaryArc B apex uBlocker uSlice)

/-- The `v` same-arc alternative in the source target cell. -/
def cardSixVSameBoundaryArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) (B : BoundaryIndexing D.A) : Prop :=
  let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
  let Hlate := lateFirstApexSystem C.R
  let vBlocker := blockerLabel Hlate C.v.1 C.v.2
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let vSlice :=
    (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩
      physicalClass
  (vSlice.card = 2 → B1SliceSameBoundaryArc B apex vBlocker vSlice)

/-- The card-six target cell is the explicit failure of the conjunction of
the two same-arc alternatives.  No separate failure of either alternative is
asserted. -/
def cardSixBadTargetCell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  ∀ B : BoundaryIndexing D.A,
    ¬ (cardSixUSameBoundaryArc C B ∧ cardSixVSameBoundaryArc C B)

theorem cardSix_badTargetCell
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    cardSixBadTargetCell C := by
  intro B hboth
  rcases hboth with ⟨hu, hv⟩
  apply false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc
    C hnormal
  refine ⟨B, ?_⟩
  dsimp [cardSixUSameBoundaryArc, cardSixVSameBoundaryArc] at hu hv ⊢
  exact ⟨hu, hv⟩

end B1CardSixRoleProjectionIngress
end ATailFrontierLiveClosure
end Problem97
