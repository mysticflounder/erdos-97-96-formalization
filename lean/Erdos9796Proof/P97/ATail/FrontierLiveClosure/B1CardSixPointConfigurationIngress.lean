/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixBoundaryRoleIngress

/-!
# B1 card-six positive PointConfiguration ingress

This module is the source-facing typed payload for the positive-only
`PointConfiguration/v1` emitter.  The boundary is the complete carrier from
`B1EscapeRowProvenanceStar`; the role map deliberately permits aliases; and
the four rows are the four public positive row choices from the local packet.
No exact-row claim, fixed quotient order, numeric coordinate, or unsupported
cross-role distinction is introduced here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixPointConfigurationIngress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open B1CardSixBoundaryRoleIngress
open B1CardSixLocalRolePacket
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The sixteen source role names retained by the B1 card-six payload. -/
inductive B1CardSixRole : Type
  | physicalApex | d1 | d2 | u0 | u1 | v0 | v1
  | Bc | Bu | Bv | c0 | c1 | uL | uR | vL | vR
  deriving DecidableEq

/-- The four positive row choices exported by the local role packet. -/
inductive B1CardSixPositiveRow : Type
  | physical | common | u | v
  deriving DecidableEq

namespace B1CardSixRole

/-- Source value of each role.  No injectivity is built into this map. -/
noncomputable def value (P : B1CardSixLocalRolePacket C) :
    B1CardSixRole → CarrierVertex D.A
  | .physicalApex => P.physicalApex
  | .d1 => P.d1
  | .d2 => P.d2
  | .u0 => P.u0
  | .u1 => P.u1
  | .v0 => P.v0
  | .v1 => P.v1
  | .Bc => P.Bc
  | .Bu => P.Bu
  | .Bv => P.Bv
  | .c0 => P.c0
  | .c1 => P.c1
  | .uL => P.uL
  | .uR => P.uR
  | .vL => P.vL
  | .vR => P.vR

end B1CardSixRole

namespace B1CardSixPositiveRow

/-- The source row choice selected by a row tag. -/
noncomputable def choice (P : B1CardSixLocalRolePacket C) :
    B1CardSixPositiveRow → RowChoice (CarrierLabel D.A)
  | .physical => P.physicalRowChoice
  | .common => P.commonRowChoice
  | .u => P.uRowChoice
  | .v => P.vRowChoice

/-- The role used as the metric center of each positive row. -/
def centerRole : B1CardSixPositiveRow → B1CardSixRole
  | .physical => .physicalApex
  | .common => .Bc
  | .u => .Bu
  | .v => .Bv

/-- One listed member is retained as the positive-radius anchor. -/
def anchorRole : B1CardSixPositiveRow → B1CardSixRole
  | .physical => .d1
  | .common => .d1
  | .u => .u0
  | .v => .v0

end B1CardSixPositiveRow

namespace B1CardSixPointConfigurationPayload

noncomputable def roleIndex
    (P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C)
    (role : B1CardSixRole) : Fin E.boundary.n :=
  E.boundary.indexOf (B1CardSixRole.value P role)

noncomputable def rowCenter
    (P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C)
    (row : B1CardSixPositiveRow) : Fin E.boundary.n :=
  roleIndex P E (B1CardSixPositiveRow.centerRole row)

noncomputable def rowMembers
    (P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C)
    (row : B1CardSixPositiveRow) : Finset (Fin E.boundary.n) :=
  Finset.image E.boundary.indexOf
    (B1CardSixPositiveRow.choice P row).support

noncomputable def rowAnchor
    (P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C)
    (row : B1CardSixPositiveRow) : Fin E.boundary.n :=
  roleIndex P E (B1CardSixPositiveRow.anchorRole row)

/-
The structure below is the Lean-side typed core of a native
`PointConfiguration/v1` input.  `E.boundary` is the complete boundary carrier;
`roleIndex` is the role-binding map; and `rowMembers` are the support lists
that become positive `common_radius` constraints.  The branch fields are
copied from the source escape record and add no metric assertions.
-/
structure Payload
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (E : B1EscapeRowProvenanceStar C) where
  boundary_nonempty : 0 < E.boundary.n
  boundary_complete : Finset.univ.image E.boundary.boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon E.boundary.boundary
  roleIndex : B1CardSixRole → Fin E.boundary.n
  rowCenter : B1CardSixPositiveRow → Fin E.boundary.n
  rowMembers : B1CardSixPositiveRow → Finset (Fin E.boundary.n)
  rowAnchor : B1CardSixPositiveRow → Fin E.boundary.n
  roleIndex_alias_preserved :
    ∀ r s, roleIndex r = roleIndex s ↔
      B1CardSixRole.value P r = B1CardSixRole.value P s
  rowCenter_source :
    ∀ row, rowCenter row =
      roleIndex (B1CardSixPositiveRow.centerRole row)
  rowMembers_source :
    ∀ row, rowMembers row =
      Finset.image E.boundary.indexOf
        (B1CardSixPositiveRow.choice P row).support
  rowAnchor_source :
    ∀ row, rowAnchor row =
      roleIndex (B1CardSixPositiveRow.anchorRole row)
  rowAnchor_mem :
    ∀ row, rowAnchor row ∈ rowMembers row
  row_positive :
    ∀ row i, i ∈ rowMembers row →
      dist (E.boundary.boundary (rowCenter row))
          (E.boundary.boundary i) =
        dist (E.boundary.boundary (rowCenter row))
          (E.boundary.boundary (rowAnchor row))
  physical_row_card : (rowMembers .physical).card = 6
  source_u0_ne_u1 : roleIndex .u0 ≠ roleIndex .u1
  source_v0_ne_v1 : roleIndex .v0 ≠ roleIndex .v1
  source_c0_ne_c1 : roleIndex .c0 ≠ roleIndex .c1
  source_uL_ne_uR : roleIndex .uL ≠ roleIndex .uR
  source_vL_ne_vR : roleIndex .vL ≠ roleIndex .vR
  boundary_index_injective : Function.Injective E.boundary.indexOf
  boundary_coordinate_injective : Function.Injective E.boundary.boundary
  winning_slice_card :
    (b1USlice C).card = 2 ∨ (b1VSlice C).card = 2
  escape_mem_live_slice :
    E.escape.source.1 ∈ b1USlice C ∨ E.escape.source.1 ∈ b1VSlice C
  cross_omission :
    C.first.deleted.1 ∉ b1EscapeRow C E.escape.source ∨
      C.second.deleted.1 ∉ b1EscapeRow C E.escape.source

private theorem choice_mem_sourceRowChoices
    (P : B1CardSixLocalRolePacket C) (row : B1CardSixPositiveRow) :
    B1CardSixPositiveRow.choice P row ∈ P.sourceRowChoices := by
  cases row <;>
    simp [B1CardSixPositiveRow.choice,
      B1CardSixLocalRolePacket.sourceRowChoices]

private theorem anchor_mem_choice
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

private theorem center_value_eq_choice_center
    (P : B1CardSixLocalRolePacket C) (row : B1CardSixPositiveRow) :
    B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row) =
      (B1CardSixPositiveRow.choice P row).center := by
  cases row <;> rfl

/-- Build the typed positive payload directly while all source hypotheses are
in scope.  The anchor proof works from row membership rather than choosing an
arbitrary support element. -/
noncomputable def ofSource
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (E : B1EscapeRowProvenanceStar C) :
    Payload P hnormal hsix E := by
  classical
  refine {
    boundary_nonempty := E.boundary_nonempty
    boundary_complete := E.boundary.boundary_image
    boundary_ccw := E.boundary.boundary_ccw
    roleIndex := roleIndex P E
    rowCenter := rowCenter P E
    rowMembers := rowMembers P E
    rowAnchor := rowAnchor P E
    roleIndex_alias_preserved := ?_
    rowCenter_source := ?_
    rowMembers_source := ?_
    rowAnchor_source := ?_
    rowAnchor_mem := ?_
    row_positive := ?_
    physical_row_card := ?_
    source_u0_ne_u1 := ?_
    source_v0_ne_v1 := ?_
    source_c0_ne_c1 := ?_
    source_uL_ne_uR := ?_
    source_vL_ne_vR := ?_
    boundary_index_injective := E.boundary.index_injective
    boundary_coordinate_injective := E.boundary.boundary_injective
    winning_slice_card := E.winning_slice_card
    escape_mem_live_slice := E.escape_mem_live_slice
    cross_omission := E.cross_omission }
  · intro r s
    constructor
    · intro h
      apply E.boundary.index_injective
      simpa [roleIndex] using h
    · intro h
      simpa [roleIndex] using congrArg E.boundary.indexOf h
  · intro row
    rfl
  · intro row
    rfl
  · intro row
    rfl
  · intro row
    change E.boundary.indexOf
        (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row)) ∈
      Finset.image E.boundary.indexOf
        (B1CardSixPositiveRow.choice P row).support
    exact Finset.mem_image.mpr ⟨_, anchor_mem_choice P row, rfl⟩
  · intro row i hi
    have hi' : i ∈ Finset.image E.boundary.indexOf
        (B1CardSixPositiveRow.choice P row).support := by
      simpa [rowMembers] using hi
    rcases Finset.mem_image.mp hi' with ⟨point, hpoint, rfl⟩
    have hchoice := positiveRowsMatch_sourceRowChoices P
      (B1CardSixPositiveRow.choice P row) (choice_mem_sourceRowChoices P row)
    have hpointMetric :=
      (mem_sourceMetricRows_iff P
        (B1CardSixPositiveRow.choice P row).center point).mp
        (hchoice hpoint)
    have hanchorMetric :=
      (mem_sourceMetricRows_iff P
        (B1CardSixPositiveRow.choice P row).center
        (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row))).mp
        (hchoice (anchor_mem_choice P row))
    have hcenter := center_value_eq_choice_center P row
    rw [← hcenter] at hpointMetric hanchorMetric
    have hdist :
        dist (B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row)).1 point.1 =
          dist (B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row)).1
            (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row)).1 :=
      hpointMetric.trans hanchorMetric.symm
    have hcenterPoint := E.boundary.point_eq
      (B1CardSixRole.value P (B1CardSixPositiveRow.centerRole row))
    have hpointPoint := E.boundary.point_eq point
    have hanchorPoint := E.boundary.point_eq
      (B1CardSixRole.value P (B1CardSixPositiveRow.anchorRole row))
    simpa [rowCenter, rowAnchor, roleIndex, pointOf, hcenterPoint,
      hpointPoint, hanchorPoint] using hdist
  · rw [rowMembers, Finset.card_image_of_injective _ E.boundary.index_injective]
    exact physicalRowChoice_support_card_eq_six P hnormal hsix
  · intro h
    apply P.uPhysical.source_ne_other
    apply E.boundary.index_injective
    simpa [roleIndex, B1CardSixRole.value] using h
  · intro h
    apply P.vPhysical.source_ne_other
    apply E.boundary.index_injective
    simpa [roleIndex, B1CardSixRole.value] using h
  · intro h
    apply P.commonCompletion.first_ne_second
    apply E.boundary.index_injective
    simpa [roleIndex, B1CardSixRole.value] using h
  · intro h
    apply P.uCompletion.first_ne_second
    apply E.boundary.index_injective
    simpa [roleIndex, B1CardSixRole.value] using h
  · intro h
    apply P.vCompletion.first_ne_second
    apply E.boundary.index_injective
    simpa [roleIndex, B1CardSixRole.value] using h

end B1CardSixPointConfigurationPayload
end B1CardSixPointConfigurationIngress
end ATailFrontierLiveClosure
end Problem97
