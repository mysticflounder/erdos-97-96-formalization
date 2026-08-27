/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18CrossedIncidenceProjection

/-!
# Exact-card-eighteen Rigid221 labeled enrichment

This off-spine module adds the remaining source-derived finite facts requested before the pure
`Rigid221Card18AbstractPacket` boundary.  It labels the selected `xv` row, the physical five-class,
the row selected at the deleted center, and the two actual blockers in the bi-survival arm.

The module deliberately does not define a serializer, a solver encoding, a certificate, or a
source-equivalence claim.  Its only conversion starts from the already retained source alternative.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18LabeledEnrichment

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Rigid221Card18FiniteDataExport
open Rigid221Card18LabeledProjection
open Rigid221Card18CrossedIncidenceProjection

private theorem selectedCenter_mem_carrier {D : CounterexampleData}
    (system : CriticalShellSystem D.A) (point : CarrierVertex D.A) :
    system.centerAt point.1 point.2 ∈ D.A :=
  Finset.mem_of_mem_erase
    (system.selectedAt point.1 point.2).toCriticalFourShell.center_mem

private theorem pointOf_injective {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) :
    Function.Injective (pointOf carrier) := by
  intro left right hpoint
  apply carrier.labeling.symm.injective
  exact Subtype.ext hpoint

/-- The exact selected row whose source is `xv`. -/
noncomputable def selectedXvSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Finset ℝ² :=
  ((lateFirstApexSystem R).selectedAt
    source.packet.xv source.Q.hxvA).toCriticalFourShell.support

/-- The physical exact-five selected class retained by the rigid source. -/
noncomputable def physicalFiveSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Finset ℝ² :=
  SelectedClass D.A S.oppApex2 source.P.rho

/-- The deleted-center role as a carrier vertex, used to select its next row. -/
noncomputable def deletedCenterVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : CarrierVertex D.A :=
  ⟨(lateFirstApexSystem R).centerAt source.P.jointDeletion.deleted.1
      source.P.jointDeletion.deleted.2,
    selectedCenter_mem_carrier
      (lateFirstApexSystem R) source.P.jointDeletion.deleted⟩

/-- The exact selected row at the deleted-center role. -/
noncomputable def deletedCenterSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Finset ℝ² :=
  ((lateFirstApexSystem R).selectedAt
    (deletedCenterVertex source).1
    (deletedCenterVertex source).2).toCriticalFourShell.support

private theorem physicalFiveSupport_subset_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) :
    physicalFiveSupport source ⊆ D.A := by
  intro point hpoint
  exact (mem_selectedClass.mp (by
    simpa [physicalFiveSupport] using hpoint)).1

private noncomputable def selectedXvLabeledSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) :
    LabeledFourSupport source.carrier (selectedXvSupport source) :=
  labeledFourSupport source.carrier _
    ((lateFirstApexSystem R).selectedAt
      source.packet.xv source.Q.hxvA).toCriticalFourShell.support_subset_A
    ((lateFirstApexSystem R).selectedAt
      source.packet.xv source.Q.hxvA).toCriticalFourShell.support_card

private noncomputable def deletedCenterLabeledSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) :
    LabeledFourSupport source.carrier (deletedCenterSupport source) :=
  labeledFourSupport source.carrier _
    ((lateFirstApexSystem R).selectedAt
      (deletedCenterVertex source).1
      (deletedCenterVertex source).2).toCriticalFourShell.support_subset_A
    ((lateFirstApexSystem R).selectedAt
      (deletedCenterVertex source).1
      (deletedCenterVertex source).2).toCriticalFourShell.support_card

/-- Common finite facts available in all three exact-card-eighteen arms. -/
structure Rigid221CommonLabeledEnrichment
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R)
    (roles : Rigid221RoleLabels source) : Type where
  selectedXvRow : LabeledFourSupport source.carrier (selectedXvSupport source)
  physicalFive : Finset Label
  physicalFive_eq : physicalFive = labelsOf source.carrier (physicalFiveSupport source)
  physicalFive_card_eq_five : physicalFive.card = 5
  physicalFive_eq_roles :
    physicalFive = {roles.deleted, roles.u, roles.xu, roles.v, roles.xv}
  deletedCenterRow : LabeledFourSupport source.carrier (deletedCenterSupport source)
  xv_mem_selectedXvRow : roles.xv ∈ selectedXvRow.labels
  u_mem_selectedXvRow : roles.u ∈ selectedXvRow.labels
  source1_not_mem_selectedXvRow : roles.source1 ∉ selectedXvRow.labels
  source2_not_mem_selectedXvRow : roles.source2 ∉ selectedXvRow.labels
  deletedCenter_mem_deletedCenterRow : roles.deletedCenter ∈ deletedCenterRow.labels
  deletedCenter_not_mem_physicalFive : roles.deletedCenter ∉ physicalFive
  deletedCenterRow_physicalFive_inter_le_one :
    (deletedCenterRow.labels ∩ physicalFive).card ≤ 1

/-- Relabel the common source facts without adding a geometric assumption. -/
noncomputable def rigid221CommonLabeledEnrichment
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R)
    (roles : Rigid221RoleLabels source) :
    Rigid221CommonLabeledEnrichment source roles := by
  let selectedXvRow := selectedXvLabeledSupport source
  let physicalFive := labelsOf source.carrier (physicalFiveSupport source)
  let deletedCenterRow := deletedCenterLabeledSupport source
  refine
    { selectedXvRow := selectedXvRow
      physicalFive := physicalFive
      physicalFive_eq := rfl
      physicalFive_card_eq_five := ?_
      physicalFive_eq_roles := ?_
      deletedCenterRow := deletedCenterRow
      xv_mem_selectedXvRow := ?_
      u_mem_selectedXvRow := ?_
      source1_not_mem_selectedXvRow := ?_
      source2_not_mem_selectedXvRow := ?_
      deletedCenter_mem_deletedCenterRow := ?_
      deletedCenter_not_mem_physicalFive := ?_
      deletedCenterRow_physicalFive_inter_le_one := ?_ }
  · calc
      physicalFive.card = (physicalFiveSupport source).card := by
        simpa [physicalFive] using
          labelsOf_card_eq source.carrier
            (physicalFiveSupport_subset_carrier source)
      _ = 5 := by
        simpa [physicalFiveSupport] using source.P.hclassFive
  · ext label
    have hdeleted :
        pointOf source.carrier label = source.P.jointDeletion.deleted.1 ↔
          label = roles.deleted := by
      rw [← roles.deleted_point]
      exact (pointOf_injective source.carrier).eq_iff
    have hu : pointOf source.carrier label = source.P.u.1 ↔ label = roles.u := by
      rw [← roles.u_point]
      exact (pointOf_injective source.carrier).eq_iff
    have hxu :
        pointOf source.carrier label = source.packet.xu ↔ label = roles.xu := by
      rw [← roles.xu_point]
      exact (pointOf_injective source.carrier).eq_iff
    have hv : pointOf source.carrier label = source.P.v.1 ↔ label = roles.v := by
      rw [← roles.v_point]
      exact (pointOf_injective source.carrier).eq_iff
    have hxv :
        pointOf source.carrier label = source.packet.xv ↔ label = roles.xv := by
      rw [← roles.xv_point]
      exact (pointOf_injective source.carrier).eq_iff
    simp only [physicalFive, mem_labelsOf_iff, physicalFiveSupport,
      source.packet.physical_class, Finset.mem_insert, Finset.mem_union,
      Finset.mem_singleton, hdeleted, hu, hxu, hv, hxv]
    tauto
  · apply (selectedXvRow.mem_labels_iff roles.xv).mpr
    simpa [selectedXvSupport, roles.xv_point] using
      ((lateFirstApexSystem R).selectedAt
        source.packet.xv source.Q.hxvA).toCriticalFourShell.q_mem_support
  · apply (selectedXvRow.mem_labels_iff roles.u).mpr
    simpa [selectedXvSupport, roles.u_point] using source.Q.huXvRow
  · intro hsource
    apply source.source₁Outside
    have hpoint := (selectedXvRow.mem_labels_iff roles.source1).mp hsource
    simpa [selectedXvSupport, roles.source1_point] using hpoint
  · intro hsource
    apply source.source₂Outside
    have hpoint := (selectedXvRow.mem_labels_iff roles.source2).mp hsource
    simpa [selectedXvSupport, roles.source2_point] using hpoint
  · apply (deletedCenterRow.mem_labels_iff roles.deletedCenter).mpr
    simpa [deletedCenterSupport, roles.deletedCenter_point] using
      ((lateFirstApexSystem R).selectedAt
        (deletedCenterVertex source).1
        (deletedCenterVertex source).2).toCriticalFourShell.q_mem_support
  · intro hcenter
    apply source.hcenterDeletedOffClass
    have hpoint :
        pointOf source.carrier roles.deletedCenter ∈ physicalFiveSupport source :=
      (mem_labelsOf_iff source.carrier (physicalFiveSupport source)
        roles.deletedCenter).mp (by simpa [physicalFive] using hcenter)
    simpa [physicalFiveSupport, roles.deletedCenter_point] using hpoint
  · rw [deletedCenterRow.labels_eq_source]
    change
      (labelsOf source.carrier (deletedCenterSupport source) ∩
          labelsOf source.carrier (physicalFiveSupport source)).card ≤ 1
    rw [labelsOf_inter_eq]
    calc
      (labelsOf source.carrier
          (deletedCenterSupport source ∩ physicalFiveSupport source)).card =
          (deletedCenterSupport source ∩ physicalFiveSupport source).card :=
        labelsOf_card_eq source.carrier (by
          intro point hpoint
          exact ((lateFirstApexSystem R).selectedAt
            (deletedCenterVertex source).1
            (deletedCenterVertex source).2).toCriticalFourShell.support_subset_A
              (Finset.mem_inter.mp hpoint).1)
      _ ≤ 1 := by
        simpa [deletedCenterSupport, deletedCenterVertex, physicalFiveSupport] using
          source.hnextRowPhysicalHits

/-- The bi-survival arm with its common facts and source-identified blocker labels. -/
structure Rigid221BothDeletionsLabeledEnrichment
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  original : Rigid221BothDeletionsLabeledData source
  common : Rigid221CommonLabeledEnrichment source original.roles
  uActualBlocker : Label
  xvActualBlocker : Label
  uActualBlocker_eq_xv : uActualBlocker = original.roles.xv
  xvActualBlocker_eq_v : xvActualBlocker = original.roles.v
  uActualBlocker_point :
    pointOf source.carrier uActualBlocker =
      (lateFirstApexSystem R).centerAt source.P.u.1 source.P.u.2
  xvActualBlocker_point :
    pointOf source.carrier xvActualBlocker =
      (lateFirstApexSystem R).centerAt source.packet.xv source.Q.hxvA
  uActualBlocker_ne_actualCenter1 : uActualBlocker ≠ original.roles.actualCenter1
  uActualBlocker_ne_actualCenter2 : uActualBlocker ≠ original.roles.actualCenter2
  xvActualBlocker_ne_actualCenter1 : xvActualBlocker ≠ original.roles.actualCenter1
  xvActualBlocker_ne_actualCenter2 : xvActualBlocker ≠ original.roles.actualCenter2

/-- Attach the two source-identified blocker labels to an existing bi-survival payload. -/
noncomputable def rigid221BothDeletionsLabeledEnrichment
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R)
    (data : Rigid221BothDeletionsLabeledData source) :
    Rigid221BothDeletionsLabeledEnrichment source := by
  have huBlockerPoint :
      pointOf source.carrier data.roles.xv =
        (lateFirstApexSystem R).centerAt source.P.u.1 source.P.u.2 := by
    rw [data.roles.xv_point]
    simpa only [source.P.huSource] using source.packet.blocker_eq_xv.symm
  have hxvBlockerPoint :
      pointOf source.carrier data.roles.v =
        (lateFirstApexSystem R).centerAt source.packet.xv source.Q.hxvA := by
    rw [data.roles.v_point]
    exact source.Q.hblockerEqV.symm
  have huNe1 : data.roles.xv ≠ data.roles.actualCenter1 := by
    intro heq
    apply data.original.commonDeletionU.actual_blocker_ne_center₁
    calc
      (lateFirstApexSystem R).centerAt source.P.u.1 source.P.u.2 =
          pointOf source.carrier data.roles.xv := huBlockerPoint.symm
      _ = pointOf source.carrier data.roles.actualCenter1 := congrArg _ heq
      _ = (lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2 :=
        data.roles.actualCenter1_point
  have huNe2 : data.roles.xv ≠ data.roles.actualCenter2 := by
    intro heq
    apply data.original.commonDeletionU.actual_blocker_ne_center₂
    calc
      (lateFirstApexSystem R).centerAt source.P.u.1 source.P.u.2 =
          pointOf source.carrier data.roles.xv := huBlockerPoint.symm
      _ = pointOf source.carrier data.roles.actualCenter2 := congrArg _ heq
      _ = (lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2 :=
        data.roles.actualCenter2_point
  have hxvNe1 : data.roles.v ≠ data.roles.actualCenter1 := by
    intro heq
    apply data.original.commonDeletionXv.actual_blocker_ne_center₁
    calc
      (lateFirstApexSystem R).centerAt source.packet.xv source.Q.hxvA =
          pointOf source.carrier data.roles.v := hxvBlockerPoint.symm
      _ = pointOf source.carrier data.roles.actualCenter1 := congrArg _ heq
      _ = (lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2 :=
        data.roles.actualCenter1_point
  have hxvNe2 : data.roles.v ≠ data.roles.actualCenter2 := by
    intro heq
    apply data.original.commonDeletionXv.actual_blocker_ne_center₂
    calc
      (lateFirstApexSystem R).centerAt source.packet.xv source.Q.hxvA =
          pointOf source.carrier data.roles.v := hxvBlockerPoint.symm
      _ = pointOf source.carrier data.roles.actualCenter2 := congrArg _ heq
      _ = (lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2 :=
        data.roles.actualCenter2_point
  exact
    { original := data
      common := rigid221CommonLabeledEnrichment source data.roles
      uActualBlocker := data.roles.xv
      xvActualBlocker := data.roles.v
      uActualBlocker_eq_xv := rfl
      xvActualBlocker_eq_v := rfl
      uActualBlocker_point := huBlockerPoint
      xvActualBlocker_point := hxvBlockerPoint
      uActualBlocker_ne_actualCenter1 := huNe1
      uActualBlocker_ne_actualCenter2 := huNe2
      xvActualBlocker_ne_actualCenter1 := hxvNe1
      xvActualBlocker_ne_actualCenter2 := hxvNe2 }

/-- All three exact-card-eighteen arms after the bounded labeled enrichment pass. -/
inductive Rigid221ExactCardEighteenEnrichedAlternative
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A)
    (F : CriticalPairFrontier D S radius H)
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) : Type where
  | bi
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221BothDeletionsLabeledEnrichment source)
  | u
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221UDeletionIncidenceProjection source)
      (common : Rigid221CommonLabeledEnrichment source data.original.roles)
  | xv
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221XvDeletionIncidenceProjection source)
      (common : Rigid221CommonLabeledEnrichment source data.original.roles)

/-- Enrich an existing incidence alternative without invoking the source existence theorem. -/
noncomputable def rigid221ExactCardEighteenIncidenceAlternativeToEnriched
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenIncidenceAlternative D S radius H F R) :
    Rigid221ExactCardEighteenEnrichedAlternative D S radius H F R :=
  match alternative with
  | .bi source data =>
      .bi source (rigid221BothDeletionsLabeledEnrichment source data)
  | .u source data =>
      .u source data (rigid221CommonLabeledEnrichment source data.original.roles)
  | .xv source data =>
      .xv source data (rigid221CommonLabeledEnrichment source data.original.roles)

#print axioms rigid221CommonLabeledEnrichment
#print axioms rigid221BothDeletionsLabeledEnrichment
#print axioms rigid221ExactCardEighteenIncidenceAlternativeToEnriched

end Rigid221Card18LabeledEnrichment
end ATailFrontierLiveClosure
end Problem97
