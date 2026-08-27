/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18FiniteDataExport

/-!
# Exact-card-eighteen Rigid221 labeled projection

This module projects the source-exact roles and four-point supports from
`Rigid221Card18FiniteDataExport` through the stored `Fin 18` carrier equivalence.  It remains a
noncomputable Lean value: it does not provide external bytes, a solver encoding, or an existence
claim.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18LabeledProjection

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Rigid221Card18FiniteDataExport

/-- Label a carrier vertex with the equivalence stored in the exact-card-eighteen source.

The domain is explicit: callers must supply a `CarrierVertex D.A`, not an unbound finite name. -/
noncomputable def roleLabel {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (point : CarrierVertex D.A) : Label :=
  carrier.labeling point

/-- Interpreting a role label recovers the point of the supplied carrier vertex. -/
@[simp] theorem pointOf_roleLabel {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (point : CarrierVertex D.A) :
    pointOf carrier (roleLabel carrier point) = point.1 := by
  simp [pointOf, roleLabel]

private theorem roleLabel_ne_of_value_ne {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) {left right : CarrierVertex D.A}
    (hne : left.1 ≠ right.1) :
    roleLabel carrier left ≠ roleLabel carrier right := by
  intro heq
  apply hne
  exact congrArg Subtype.val (carrier.labeling.injective heq)

private theorem selectedCenter_mem_carrier {D : CounterexampleData}
    (system : CriticalShellSystem D.A) (point : CarrierVertex D.A) :
    system.centerAt point.1 point.2 ∈ D.A :=
  Finset.mem_of_mem_erase
    (system.selectedAt point.1 point.2).toCriticalFourShell.center_mem

/-- Local provenance for the second opposite apex.

The corresponding helper is not part of the finite-data API, so the carrier proof is reconstructed
from the three cases of the stored surplus index. -/
private theorem oppApex2_mem_carrier {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- The eleven source-entitled roles projected into the stored `Fin 18` carrier labeling. -/
structure Rigid221RoleLabels
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  u : Label
  v : Label
  xu : Label
  xv : Label
  deleted : Label
  oppApex2 : Label
  source1 : Label
  source2 : Label
  deletedCenter : Label
  actualCenter1 : Label
  actualCenter2 : Label
  u_point : pointOf source.carrier u = source.P.u.1
  v_point : pointOf source.carrier v = source.P.v.1
  xu_point : pointOf source.carrier xu = source.packet.xu
  xv_point : pointOf source.carrier xv = source.packet.xv
  deleted_point : pointOf source.carrier deleted = source.P.jointDeletion.deleted.1
  oppApex2_point : pointOf source.carrier oppApex2 = S.oppApex2
  source1_point : pointOf source.carrier source1 = source.source₁.1
  source2_point : pointOf source.carrier source2 = source.source₂.1
  deletedCenter_point :
    pointOf source.carrier deletedCenter =
      (lateFirstApexSystem R).centerAt source.P.jointDeletion.deleted.1
        source.P.jointDeletion.deleted.2
  actualCenter1_point :
    pointOf source.carrier actualCenter1 =
      (lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2
  actualCenter2_point :
    pointOf source.carrier actualCenter2 =
      (lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2
  u_ne_v : u ≠ v
  xu_ne_u : xu ≠ u
  xv_ne_v : xv ≠ v
  u_ne_xv : u ≠ xv
  source1_ne_source2 : source1 ≠ source2
  actualCenter1_ne_actualCenter2 : actualCenter1 ≠ actualCenter2

/-- Construct all eleven labels from carrier members already present in the source. -/
noncomputable def rigid221RoleLabels
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) :
    Rigid221RoleLabels source := by
  let xu : CarrierVertex D.A := ⟨source.packet.xu, source.Q.hxuA⟩
  let xv : CarrierVertex D.A := ⟨source.packet.xv, source.Q.hxvA⟩
  let oppApex2 : CarrierVertex D.A := ⟨S.oppApex2, oppApex2_mem_carrier S⟩
  let deletedCenter : CarrierVertex D.A :=
    ⟨(lateFirstApexSystem R).centerAt source.P.jointDeletion.deleted.1
        source.P.jointDeletion.deleted.2,
      selectedCenter_mem_carrier
        (lateFirstApexSystem R) source.P.jointDeletion.deleted⟩
  let actualCenter1 : CarrierVertex D.A :=
    ⟨(lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2,
      selectedCenter_mem_carrier (lateFirstApexSystem R) source.source₁⟩
  let actualCenter2 : CarrierVertex D.A :=
    ⟨(lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2,
      selectedCenter_mem_carrier (lateFirstApexSystem R) source.source₂⟩
  refine
    { u := roleLabel source.carrier source.P.u
      v := roleLabel source.carrier source.P.v
      xu := roleLabel source.carrier xu
      xv := roleLabel source.carrier xv
      deleted := roleLabel source.carrier source.P.jointDeletion.deleted
      oppApex2 := roleLabel source.carrier oppApex2
      source1 := roleLabel source.carrier source.source₁
      source2 := roleLabel source.carrier source.source₂
      deletedCenter := roleLabel source.carrier deletedCenter
      actualCenter1 := roleLabel source.carrier actualCenter1
      actualCenter2 := roleLabel source.carrier actualCenter2
      u_point := pointOf_roleLabel _ _
      v_point := pointOf_roleLabel _ _
      xu_point := pointOf_roleLabel _ _
      xv_point := pointOf_roleLabel _ _
      deleted_point := pointOf_roleLabel _ _
      oppApex2_point := pointOf_roleLabel _ _
      source1_point := pointOf_roleLabel _ _
      source2_point := pointOf_roleLabel _ _
      deletedCenter_point := pointOf_roleLabel _ _
      actualCenter1_point := pointOf_roleLabel _ _
      actualCenter2_point := pointOf_roleLabel _ _
      u_ne_v := roleLabel_ne_of_value_ne _ (fun h => source.P.huNeV (Subtype.ext h))
      xu_ne_u := roleLabel_ne_of_value_ne _ source.packet.xu_ne_u
      xv_ne_v := roleLabel_ne_of_value_ne _ source.packet.xv_ne_v
      u_ne_xv := roleLabel_ne_of_value_ne _
        (pentagonOffClassBlocker_u_ne_xv source.P source.packet)
      source1_ne_source2 := roleLabel_ne_of_value_ne _ (by
        intro hpoints
        apply source.centers_ne
        simp only [hpoints])
      actualCenter1_ne_actualCenter2 :=
        roleLabel_ne_of_value_ne _ source.centers_ne }

/-- A labeled exact-four support together with its exact geometric origin. -/
structure LabeledFourSupport {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (sourceSupport : Finset ℝ²) : Type where
  geometricSupport : Finset ℝ²
  geometricSupport_eq_source : geometricSupport = sourceSupport
  geometricSupport_subset_carrier : geometricSupport ⊆ D.A
  labels : Finset Label
  labels_eq : labels = labelsOf carrier geometricSupport
  labels_card_eq_four : labels.card = 4

/-- The stored label set is exactly the labeling of the source support. -/
theorem LabeledFourSupport.labels_eq_source {D : CounterexampleData}
    {carrier : Rigid221ExactCardEighteenCarrier D} {sourceSupport : Finset ℝ²}
    (support : LabeledFourSupport carrier sourceSupport) :
    support.labels = labelsOf carrier sourceSupport := by
  rw [support.labels_eq, support.geometricSupport_eq_source]

/-- Membership transports back to the exact geometric source support. -/
@[simp] theorem LabeledFourSupport.mem_labels_iff {D : CounterexampleData}
    {carrier : Rigid221ExactCardEighteenCarrier D} {sourceSupport : Finset ℝ²}
    (support : LabeledFourSupport carrier sourceSupport) (label : Label) :
    label ∈ support.labels ↔ pointOf carrier label ∈ sourceSupport := by
  rw [support.labels_eq_source, Rigid221Card18FiniteDataExport.mem_labelsOf_iff]

/-- Membership of a carrier vertex transports directly through its stored role label. -/
@[simp] theorem LabeledFourSupport.roleLabel_mem_iff {D : CounterexampleData}
    {carrier : Rigid221ExactCardEighteenCarrier D} {sourceSupport : Finset ℝ²}
    (support : LabeledFourSupport carrier sourceSupport) (point : CarrierVertex D.A) :
    roleLabel carrier point ∈ support.labels ↔ point.1 ∈ sourceSupport := by
  rw [support.mem_labels_iff, pointOf_roleLabel]

/-- Build a labeled support from an exact four-point subset of the carrier. -/
noncomputable def labeledFourSupport {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (sourceSupport : Finset ℝ²)
    (hsubset : sourceSupport ⊆ D.A) (hcard : sourceSupport.card = 4) :
    LabeledFourSupport carrier sourceSupport where
  geometricSupport := sourceSupport
  geometricSupport_eq_source := rfl
  geometricSupport_subset_carrier := hsubset
  labels := labelsOf carrier sourceSupport
  labels_eq := rfl
  labels_card_eq_four := (labelsOf_card_eq carrier hsubset).trans hcard

/-- Labeling commutes exactly with intersection for carrier subsets. -/
theorem labelsOf_inter_eq {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (left right : Finset ℝ²) :
    labelsOf carrier left ∩ labelsOf carrier right = labelsOf carrier (left ∩ right) := by
  ext label
  simp only [Finset.mem_inter, mem_labelsOf_iff]

private theorem qDeletedSupport_subset_carrier
    {D : CounterexampleData} {q center : ℝ²} {support : Finset ℝ²}
    (row : U5QDeletedK4Class D q center support) : support ⊆ D.A := by
  intro point hpoint
  have hcenter := row.subset hpoint
  have hskeleton : point ∈ D.skeleton q := (Finset.mem_erase.mp hcenter).2
  exact (Finset.mem_erase.mp hskeleton).2

private noncomputable def sourceSupport1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Finset ℝ² :=
  ((lateFirstApexSystem R).selectedAt
    source.source₁.1 source.source₁.2).toCriticalFourShell.support

private noncomputable def sourceSupport2
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Finset ℝ² :=
  ((lateFirstApexSystem R).selectedAt
    source.source₂.1 source.source₂.2).toCriticalFourShell.support

private noncomputable def xvOppositeSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Finset ℝ² :=
  SelectedClass (D.A.erase source.packet.xv) S.oppApex2 source.P.rho

private noncomputable def uOppositeSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Finset ℝ² :=
  SelectedClass (D.A.erase source.P.u.1) S.oppApex2 source.P.rho

private noncomputable def firstSourceLabeledSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) :
    LabeledFourSupport source.carrier (sourceSupport1 source) :=
  labeledFourSupport source.carrier _
    ((lateFirstApexSystem R).selectedAt
      source.source₁.1 source.source₁.2).toCriticalFourShell.support_subset_A
    ((lateFirstApexSystem R).selectedAt
      source.source₁.1 source.source₁.2).toCriticalFourShell.support_card

private noncomputable def secondSourceLabeledSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) :
    LabeledFourSupport source.carrier (sourceSupport2 source) :=
  labeledFourSupport source.carrier _
    ((lateFirstApexSystem R).selectedAt
      source.source₂.1 source.source₂.2).toCriticalFourShell.support_subset_A
    ((lateFirstApexSystem R).selectedAt
      source.source₂.1 source.source₂.2).toCriticalFourShell.support_card

/-- Labeled supports and exact transported facts for the `xv`-deletion crossed arm. -/
structure Rigid221XvDeletionLabeledData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  original : Rigid221XvDeletionFiniteData source
  roles : Rigid221RoleLabels source
  K1 : LabeledFourSupport source.carrier (sourceSupport1 source)
  K2 : LabeledFourSupport source.carrier (sourceSupport2 source)
  BO : LabeledFourSupport source.carrier (xvOppositeSupport source)
  xv_not_mem_K1 : roles.xv ∉ K1.labels
  xv_not_mem_K2 : roles.xv ∉ K2.labels
  xv_not_mem_BO : roles.xv ∉ BO.labels
  u_mem_K1 : roles.u ∈ K1.labels
  u_mem_K2 : roles.u ∈ K2.labels
  u_mem_BO : roles.u ∈ BO.labels
  source1_mem_K1 : roles.source1 ∈ K1.labels
  source2_mem_K2 : roles.source2 ∈ K2.labels

/-- Labeled supports and exact transported facts for the `u`-deletion crossed arm. -/
structure Rigid221UDeletionLabeledData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  original : Rigid221UDeletionFiniteData source
  roles : Rigid221RoleLabels source
  K1 : LabeledFourSupport source.carrier (sourceSupport1 source)
  K2 : LabeledFourSupport source.carrier (sourceSupport2 source)
  BO : LabeledFourSupport source.carrier (uOppositeSupport source)
  u_not_mem_K1 : roles.u ∉ K1.labels
  u_not_mem_K2 : roles.u ∉ K2.labels
  u_not_mem_BO : roles.u ∉ BO.labels
  xv_mem_K1 : roles.xv ∈ K1.labels
  xv_mem_K2 : roles.xv ∈ K2.labels
  xv_mem_BO : roles.xv ∈ BO.labels
  source1_mem_K1 : roles.source1 ∈ K1.labels
  source2_mem_K2 : roles.source2 ∈ K2.labels

/-- Relabel the exact `xv`-deletion crossed data without adding any witness. -/
noncomputable def rigid221XvDeletionLabeledData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R)
    (data : Rigid221XvDeletionFiniteData source) :
    Rigid221XvDeletionLabeledData source := by
  let roles := rigid221RoleLabels source
  let K1 := firstSourceLabeledSupport source
  let K2 := secondSourceLabeledSupport source
  let BO := labeledFourSupport source.carrier (xvOppositeSupport source)
    (qDeletedSupport_subset_carrier data.CO) data.rowFacts.2.2.2.1
  refine
    { original := data
      roles := roles
      K1 := K1
      K2 := K2
      BO := BO
      xv_not_mem_K1 := ?_
      xv_not_mem_K2 := ?_
      xv_not_mem_BO := ?_
      u_mem_K1 := ?_
      u_mem_K2 := ?_
      u_mem_BO := ?_
      source1_mem_K1 := ?_
      source2_mem_K2 := ?_ }
  · intro h
    apply data.C₁.q_not_mem
    have hpoint := (K1.mem_labels_iff roles.xv).mp h
    rw [roles.xv_point] at hpoint
    exact hpoint
  · intro h
    apply data.C₂.q_not_mem
    have hpoint := (K2.mem_labels_iff roles.xv).mp h
    rw [roles.xv_point] at hpoint
    exact hpoint
  · intro h
    apply data.CO.q_not_mem
    have hpoint := (BO.mem_labels_iff roles.xv).mp h
    rw [roles.xv_point] at hpoint
    exact hpoint
  · apply (K1.mem_labels_iff roles.u).mpr
    simpa [roles.u_point] using data.rowFacts.1
  · apply (K2.mem_labels_iff roles.u).mpr
    simpa [roles.u_point] using data.rowFacts.2.1
  · apply (BO.mem_labels_iff roles.u).mpr
    simpa only [roles.u_point, xvOppositeSupport] using data.rowFacts.2.2.1
  · apply (K1.mem_labels_iff roles.source1).mpr
    simpa [roles.source1_point] using data.rowFacts.2.2.2.2.1
  · apply (K2.mem_labels_iff roles.source2).mpr
    simpa [roles.source2_point] using data.rowFacts.2.2.2.2.2

/-- Relabel the exact `u`-deletion crossed data without adding any witness. -/
noncomputable def rigid221UDeletionLabeledData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R)
    (data : Rigid221UDeletionFiniteData source) :
    Rigid221UDeletionLabeledData source := by
  let roles := rigid221RoleLabels source
  let K1 := firstSourceLabeledSupport source
  let K2 := secondSourceLabeledSupport source
  let BO := labeledFourSupport source.carrier (uOppositeSupport source)
    (qDeletedSupport_subset_carrier data.CO) data.rowFacts.2.2.2.1
  refine
    { original := data
      roles := roles
      K1 := K1
      K2 := K2
      BO := BO
      u_not_mem_K1 := ?_
      u_not_mem_K2 := ?_
      u_not_mem_BO := ?_
      xv_mem_K1 := ?_
      xv_mem_K2 := ?_
      xv_mem_BO := ?_
      source1_mem_K1 := ?_
      source2_mem_K2 := ?_ }
  · intro h
    apply data.C₁.q_not_mem
    have hpoint := (K1.mem_labels_iff roles.u).mp h
    rw [roles.u_point] at hpoint
    exact hpoint
  · intro h
    apply data.C₂.q_not_mem
    have hpoint := (K2.mem_labels_iff roles.u).mp h
    rw [roles.u_point] at hpoint
    exact hpoint
  · intro h
    apply data.CO.q_not_mem
    have hpoint := (BO.mem_labels_iff roles.u).mp h
    rw [roles.u_point] at hpoint
    exact hpoint
  · apply (K1.mem_labels_iff roles.xv).mpr
    simpa [roles.xv_point] using data.rowFacts.1
  · apply (K2.mem_labels_iff roles.xv).mpr
    simpa [roles.xv_point] using data.rowFacts.2.1
  · apply (BO.mem_labels_iff roles.xv).mpr
    simpa only [roles.xv_point, uOppositeSupport] using data.rowFacts.2.2.1
  · apply (K1.mem_labels_iff roles.source1).mpr
    simpa [roles.source1_point] using data.rowFacts.2.2.2.2.1
  · apply (K2.mem_labels_iff roles.source2).mpr
    simpa [roles.source2_point] using data.rowFacts.2.2.2.2.2

/-- The four labeled supports from the bi-survival arm, with exact overlap transport. -/
structure Rigid221BothDeletionsLabeledData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  original : Rigid221BothDeletionsFiniteData source
  roles : Rigid221RoleLabels source
  uB1 : LabeledFourSupport source.carrier original.commonDeletionU.B₁
  uB2 : LabeledFourSupport source.carrier original.commonDeletionU.B₂
  xvB1 : LabeledFourSupport source.carrier original.commonDeletionXv.B₁
  xvB2 : LabeledFourSupport source.carrier original.commonDeletionXv.B₂
  u_not_mem_B1 : roles.u ∉ uB1.labels
  u_not_mem_B2 : roles.u ∉ uB2.labels
  xv_not_mem_B1 : roles.xv ∉ xvB1.labels
  xv_not_mem_B2 : roles.xv ∉ xvB2.labels
  u_labels_inter_eq :
    labelsOf source.carrier original.commonDeletionU.B₁ ∩
        labelsOf source.carrier original.commonDeletionU.B₂ =
      labelsOf source.carrier
        (original.commonDeletionU.B₁ ∩ original.commonDeletionU.B₂)
  xv_labels_inter_eq :
    labelsOf source.carrier original.commonDeletionXv.B₁ ∩
        labelsOf source.carrier original.commonDeletionXv.B₂ =
      labelsOf source.carrier
        (original.commonDeletionXv.B₁ ∩ original.commonDeletionXv.B₂)
  u_overlap_le_two : (uB1.labels ∩ uB2.labels).card ≤ 2
  xv_overlap_le_two : (xvB1.labels ∩ xvB2.labels).card ≤ 2

/-- Relabel both common-deletion packets and transport their overlap bounds through intersection. -/
noncomputable def rigid221BothDeletionsLabeledData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R)
    (data : Rigid221BothDeletionsFiniteData source) :
    Rigid221BothDeletionsLabeledData source := by
  let roles := rigid221RoleLabels source
  let uB1 := labeledFourSupport source.carrier data.commonDeletionU.B₁
    (qDeletedSupport_subset_carrier data.commonDeletionU.row₁)
    data.commonDeletionU.B₁_card
  let uB2 := labeledFourSupport source.carrier data.commonDeletionU.B₂
    (qDeletedSupport_subset_carrier data.commonDeletionU.row₂)
    data.commonDeletionU.B₂_card
  let xvB1 := labeledFourSupport source.carrier data.commonDeletionXv.B₁
    (qDeletedSupport_subset_carrier data.commonDeletionXv.row₁)
    data.commonDeletionXv.B₁_card
  let xvB2 := labeledFourSupport source.carrier data.commonDeletionXv.B₂
    (qDeletedSupport_subset_carrier data.commonDeletionXv.row₂)
    data.commonDeletionXv.B₂_card
  refine
    { original := data
      roles := roles
      uB1 := uB1
      uB2 := uB2
      xvB1 := xvB1
      xvB2 := xvB2
      u_not_mem_B1 := ?_
      u_not_mem_B2 := ?_
      xv_not_mem_B1 := ?_
      xv_not_mem_B2 := ?_
      u_labels_inter_eq := labelsOf_inter_eq _ _ _
      xv_labels_inter_eq := labelsOf_inter_eq _ _ _
      u_overlap_le_two := ?_
      xv_overlap_le_two := ?_ }
  · intro h
    apply data.commonDeletionU.row₁.q_not_mem
    have hpoint := (uB1.mem_labels_iff roles.u).mp h
    rw [roles.u_point] at hpoint
    exact hpoint
  · intro h
    apply data.commonDeletionU.row₂.q_not_mem
    have hpoint := (uB2.mem_labels_iff roles.u).mp h
    rw [roles.u_point] at hpoint
    exact hpoint
  · intro h
    apply data.commonDeletionXv.row₁.q_not_mem
    have hpoint := (xvB1.mem_labels_iff roles.xv).mp h
    rw [roles.xv_point] at hpoint
    exact hpoint
  · intro h
    apply data.commonDeletionXv.row₂.q_not_mem
    have hpoint := (xvB2.mem_labels_iff roles.xv).mp h
    rw [roles.xv_point] at hpoint
    exact hpoint
  · rw [uB1.labels_eq_source, uB2.labels_eq_source, labelsOf_inter_eq]
    calc
      (labelsOf source.carrier
          (data.commonDeletionU.B₁ ∩ data.commonDeletionU.B₂)).card =
          (data.commonDeletionU.B₁ ∩ data.commonDeletionU.B₂).card :=
        labelsOf_card_eq source.carrier (by
          intro point hpoint
          exact qDeletedSupport_subset_carrier data.commonDeletionU.row₁
            (Finset.mem_inter.mp hpoint).1)
      _ ≤ 2 := data.commonDeletionU.overlap_le_two
  · rw [xvB1.labels_eq_source, xvB2.labels_eq_source, labelsOf_inter_eq]
    calc
      (labelsOf source.carrier
          (data.commonDeletionXv.B₁ ∩ data.commonDeletionXv.B₂)).card =
          (data.commonDeletionXv.B₁ ∩ data.commonDeletionXv.B₂).card :=
        labelsOf_card_eq source.carrier (by
          intro point hpoint
          exact qDeletedSupport_subset_carrier data.commonDeletionXv.row₁
            (Finset.mem_inter.mp hpoint).1)
      _ ≤ 2 := data.commonDeletionXv.overlap_le_two

/-- The constructor-level arm of an exact-card-eighteen finite-data alternative. -/
inductive Rigid221Arm where
  | xvDeletion
  | uDeletion
  | bothDeletions
  deriving DecidableEq, Repr

/-- Closed status type for one deletion/actual-center profile cell. -/
inductive DeletionOutcome where
  | survives
  | fails
  deriving DecidableEq, Repr

/-- The four endpoint-deletion cells at the two actual source centers. -/
structure Rigid221FourCellProfile where
  uActualCenter1 : DeletionOutcome
  uActualCenter2 : DeletionOutcome
  xvActualCenter1 : DeletionOutcome
  xvActualCenter2 : DeletionOutcome
  deriving DecidableEq, Repr

/-- Read the arm only from the constructor of the source finite-data alternative. -/
def armOfDataAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenDataAlternative D S radius H F R) : Rigid221Arm :=
  match alternative with
  | .xvDeletion _ _ => .xvDeletion
  | .uDeletion _ _ => .uDeletion
  | .bothDeletions _ _ => .bothDeletions

/-- Derive all four statuses solely by matching the source finite-data constructor. -/
def profileOfDataAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenDataAlternative D S radius H F R) :
    Rigid221FourCellProfile :=
  match alternative with
  | .xvDeletion _ _ =>
      { uActualCenter1 := .fails
        uActualCenter2 := .fails
        xvActualCenter1 := .survives
        xvActualCenter2 := .survives }
  | .uDeletion _ _ =>
      { uActualCenter1 := .survives
        uActualCenter2 := .survives
        xvActualCenter1 := .fails
        xvActualCenter2 := .fails }
  | .bothDeletions _ _ =>
      { uActualCenter1 := .survives
        uActualCenter2 := .survives
        xvActualCenter1 := .survives
        xvActualCenter2 := .survives }

/-- The three exact-card-eighteen alternatives with their labeled source data attached. -/
inductive Rigid221ExactCardEighteenLabeledAlternative
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A)
    (F : CriticalPairFrontier D S radius H)
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) : Type where
  | xvDeletion
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221XvDeletionLabeledData source)
  | uDeletion
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221UDeletionLabeledData source)
  | bothDeletions
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221BothDeletionsLabeledData source)

/-- Relabel an existing finite-data alternative without invoking the source existence theorem. -/
noncomputable def rigid221ExactCardEighteenDataAlternativeToLabeled
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenDataAlternative D S radius H F R) :
    Rigid221ExactCardEighteenLabeledAlternative D S radius H F R :=
  match alternative with
  | .xvDeletion source data =>
      .xvDeletion source (rigid221XvDeletionLabeledData source data)
  | .uDeletion source data =>
      .uDeletion source (rigid221UDeletionLabeledData source data)
  | .bothDeletions source data =>
      .bothDeletions source (rigid221BothDeletionsLabeledData source data)

#print axioms rigid221ExactCardEighteenDataAlternativeToLabeled

end Rigid221Card18LabeledProjection
end ATailFrontierLiveClosure
end Problem97
