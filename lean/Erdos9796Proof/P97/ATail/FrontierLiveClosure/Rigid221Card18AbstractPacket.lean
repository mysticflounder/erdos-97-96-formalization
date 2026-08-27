/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledEnrichment

/-!
# Exact-card-eighteen Rigid221 pure abstract packet

This module forgets the geometric source after projecting its source-entitled finite facts into a
constructor-indexed packet over `Fin 18`.  The packet stores no real points, radii, dependent rows,
incidence mask, physical-five set, blocker aliases, serializer, or solver evidence.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Rigid221Card18FiniteDataExport
open Rigid221Card18LabeledProjection
open Rigid221Card18CrossedIncidenceProjection
open Rigid221Card18LabeledEnrichment

/-- The five roles that definitionally form the physical exact-five class. -/
structure Rigid221Card18AbstractPhysicalRoles where
  u : Label
  v : Label
  xu : Label
  xv : Label
  deleted : Label
  deriving DecidableEq, Fintype

/-- The five source and center roles used by the common finite constraints. -/
structure Rigid221Card18AbstractSourceCenterRoles where
  source1 : Label
  source2 : Label
  deletedCenter : Label
  actualCenter1 : Label
  actualCenter2 : Label
  deriving DecidableEq, Fintype

/-- The ten roles used by constraints common to all three abstract arms. -/
structure Rigid221Card18AbstractCommonRoles where
  physical : Rigid221Card18AbstractPhysicalRoles
  sourceCenters : Rigid221Card18AbstractSourceCenterRoles
  deriving DecidableEq, Fintype

def Rigid221Card18AbstractCommonRoles.u
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.physical.u

def Rigid221Card18AbstractCommonRoles.v
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.physical.v

def Rigid221Card18AbstractCommonRoles.xu
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.physical.xu

def Rigid221Card18AbstractCommonRoles.xv
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.physical.xv

def Rigid221Card18AbstractCommonRoles.deleted
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.physical.deleted

def Rigid221Card18AbstractCommonRoles.source1
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.sourceCenters.source1

def Rigid221Card18AbstractCommonRoles.source2
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.sourceCenters.source2

def Rigid221Card18AbstractCommonRoles.deletedCenter
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.sourceCenters.deletedCenter

def Rigid221Card18AbstractCommonRoles.actualCenter1
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.sourceCenters.actualCenter1

def Rigid221Card18AbstractCommonRoles.actualCenter2
    (roles : Rigid221Card18AbstractCommonRoles) : Label := roles.sourceCenters.actualCenter2

/-- The physical exact-five class is definitionally the five named physical roles. -/
def Rigid221Card18AbstractCommonRoles.physicalFive
    (roles : Rigid221Card18AbstractCommonRoles) : Finset Label :=
  {roles.deleted, roles.u, roles.xu, roles.v, roles.xv}

/-- The two four-point supports and role assignment shared by all abstract arms. -/
structure Rigid221Card18AbstractCommonData where
  roles : Rigid221Card18AbstractCommonRoles
  selectedXvRow : Finset Label
  deletedCenterRow : Finset Label
  deriving DecidableEq, Fintype

/-- The crossed-arm supports, with the crossed-only opposite-apex role. -/
structure Rigid221Card18AbstractCrossedData where
  oppApex2 : Label
  K1 : Finset Label
  K2 : Finset Label
  BO : Finset Label
  deriving DecidableEq, Fintype

/-- The four common-deletion supports in the bi-survival arm. -/
structure Rigid221Card18AbstractBiData where
  uB1 : Finset Label
  uB2 : Finset Label
  xvB1 : Finset Label
  xvB2 : Finset Label
  deriving DecidableEq, Fintype

/-- The pure finite packet, indexed by its canonical BI/U/XV constructor. -/
inductive Rigid221Card18AbstractPacket where
  | bi
      (common : Rigid221Card18AbstractCommonData)
      (data : Rigid221Card18AbstractBiData)
  | u
      (common : Rigid221Card18AbstractCommonData)
      (data : Rigid221Card18AbstractCrossedData)
  | xv
      (common : Rigid221Card18AbstractCommonData)
      (data : Rigid221Card18AbstractCrossedData)
  deriving DecidableEq, Fintype

/-- Compute the five crossed incidences directly from the finite roles and supports. -/
def Rigid221Card18AbstractCrossedData.fiveIncidenceProfile
    (data : Rigid221Card18AbstractCrossedData)
    (common : Rigid221Card18AbstractCommonData) : Rigid221FiveIncidenceProfile where
  actualCenter1InBO := decide (common.roles.actualCenter1 ∈ data.BO)
  oppApex2InK1 := decide (data.oppApex2 ∈ data.K1)
  actualCenter2InK1 := decide (common.roles.actualCenter2 ∈ data.K1)
  oppApex2InK2 := decide (data.oppApex2 ∈ data.K2)
  actualCenter1InK2 := decide (common.roles.actualCenter1 ∈ data.K2)

/-- The twelve source-entitled constraints common to every arm. -/
def Rigid221Card18AbstractCommonData.Valid
    (common : Rigid221Card18AbstractCommonData) : Prop :=
  common.roles.source1 ≠ common.roles.source2 ∧
    common.roles.actualCenter1 ≠ common.roles.actualCenter2 ∧
    common.selectedXvRow.card = 4 ∧
    common.roles.xv ∈ common.selectedXvRow ∧
    common.roles.u ∈ common.selectedXvRow ∧
    common.roles.source1 ∉ common.selectedXvRow ∧
    common.roles.source2 ∉ common.selectedXvRow ∧
    common.roles.physicalFive.card = 5 ∧
    common.deletedCenterRow.card = 4 ∧
    common.roles.deletedCenter ∈ common.deletedCenterRow ∧
    common.roles.deletedCenter ∉ common.roles.physicalFive ∧
    (common.deletedCenterRow ∩ common.roles.physicalFive).card ≤ 1

/-- The twelve extra constraints for one crossed arm. -/
def Rigid221Card18AbstractCrossedData.Valid
    (data : Rigid221Card18AbstractCrossedData)
    (common : Rigid221Card18AbstractCommonData) (deleted retained : Label) : Prop :=
  data.K1.card = 4 ∧
    data.K2.card = 4 ∧
    data.BO.card = 4 ∧
    deleted ∉ data.K1 ∧
    deleted ∉ data.K2 ∧
    deleted ∉ data.BO ∧
    retained ∈ data.K1 ∧
    retained ∈ data.K2 ∧
    retained ∈ data.BO ∧
    common.roles.source1 ∈ data.K1 ∧
    common.roles.source2 ∈ data.K2 ∧
    (data.fiveIncidenceProfile common).conjunctionHasFalse = true

/-- The fourteen extra constraints for the bi-survival arm. -/
def Rigid221Card18AbstractBiData.Valid
    (data : Rigid221Card18AbstractBiData)
    (common : Rigid221Card18AbstractCommonData) : Prop :=
  data.uB1.card = 4 ∧
    data.uB2.card = 4 ∧
    data.xvB1.card = 4 ∧
    data.xvB2.card = 4 ∧
    common.roles.u ∉ data.uB1 ∧
    common.roles.u ∉ data.uB2 ∧
    common.roles.xv ∉ data.xvB1 ∧
    common.roles.xv ∉ data.xvB2 ∧
    (data.uB1 ∩ data.uB2).card ≤ 2 ∧
    (data.xvB1 ∩ data.xvB2).card ≤ 2 ∧
    common.roles.xv ≠ common.roles.actualCenter1 ∧
    common.roles.xv ≠ common.roles.actualCenter2 ∧
    common.roles.v ≠ common.roles.actualCenter1 ∧
    common.roles.v ≠ common.roles.actualCenter2

instance instDecidableAbstractCommonDataValid
    (common : Rigid221Card18AbstractCommonData) : Decidable common.Valid := by
  unfold Rigid221Card18AbstractCommonData.Valid
  infer_instance

instance instDecidableAbstractCrossedDataValid
    (data : Rigid221Card18AbstractCrossedData)
    (common : Rigid221Card18AbstractCommonData) (deleted retained : Label) :
    Decidable (data.Valid common deleted retained) := by
  unfold Rigid221Card18AbstractCrossedData.Valid
  infer_instance

instance instDecidableAbstractBiDataValid
    (data : Rigid221Card18AbstractBiData)
    (common : Rigid221Card18AbstractCommonData) : Decidable (data.Valid common) := by
  unfold Rigid221Card18AbstractBiData.Valid
  infer_instance

namespace Rigid221Card18AbstractPacket

/-- The complete decidable validity predicate for the constructor-indexed packet. -/
def Valid : Rigid221Card18AbstractPacket → Prop
  | .bi common data => common.Valid ∧ data.Valid common
  | .u common data => common.Valid ∧ data.Valid common common.roles.u common.roles.xv
  | .xv common data => common.Valid ∧ data.Valid common common.roles.xv common.roles.u

instance instDecidableValid :
    ∀ packet : Rigid221Card18AbstractPacket, Decidable packet.Valid
  | .bi common data => by
      change Decidable (common.Valid ∧ data.Valid common)
      infer_instance
  | .u common data => by
      change Decidable (common.Valid ∧ data.Valid common common.roles.u common.roles.xv)
      infer_instance
  | .xv common data => by
      change Decidable (common.Valid ∧ data.Valid common common.roles.xv common.roles.u)
      infer_instance

/-- Executable validity check for the pure finite packet. -/
def check (packet : Rigid221Card18AbstractPacket) : Bool :=
  decide packet.Valid

/-- The executable check accepts exactly the propositionally valid packets. -/
@[simp] theorem check_eq_true_iff (packet : Rigid221Card18AbstractPacket) :
    packet.check = true ↔ packet.Valid := by
  simp [check]

/-- Read the canonical arm solely from the abstract packet constructor. -/
def arm : Rigid221Card18AbstractPacket → Rigid221Arm
  | .bi _ _ => .bothDeletions
  | .u _ _ => .uDeletion
  | .xv _ _ => .xvDeletion

/-- Derive all four deletion outcomes solely from the abstract packet constructor. -/
def deletionProfile : Rigid221Card18AbstractPacket → Rigid221FourCellProfile
  | .bi _ _ =>
      { uActualCenter1 := .survives
        uActualCenter2 := .survives
        xvActualCenter1 := .survives
        xvActualCenter2 := .survives }
  | .u _ _ =>
      { uActualCenter1 := .survives
        uActualCenter2 := .survives
        xvActualCenter1 := .fails
        xvActualCenter2 := .fails }
  | .xv _ _ =>
      { uActualCenter1 := .fails
        uActualCenter2 := .fails
        xvActualCenter1 := .survives
        xvActualCenter2 := .survives }

private def abstractCommonRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (roles : Rigid221RoleLabels source) : Rigid221Card18AbstractCommonRoles where
  physical :=
    { u := roles.u
      v := roles.v
      xu := roles.xu
      xv := roles.xv
      deleted := roles.deleted }
  sourceCenters :=
    { source1 := roles.source1
      source2 := roles.source2
      deletedCenter := roles.deletedCenter
      actualCenter1 := roles.actualCenter1
      actualCenter2 := roles.actualCenter2 }

private def abstractCommonData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (roles : Rigid221RoleLabels source)
    (common : Rigid221CommonLabeledEnrichment source roles) :
    Rigid221Card18AbstractCommonData where
  roles := abstractCommonRoles roles
  selectedXvRow := common.selectedXvRow.labels
  deletedCenterRow := common.deletedCenterRow.labels

private theorem abstractCommonData_valid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (roles : Rigid221RoleLabels source)
    (common : Rigid221CommonLabeledEnrichment source roles) :
    (abstractCommonData roles common).Valid := by
  change
    roles.source1 ≠ roles.source2 ∧
      roles.actualCenter1 ≠ roles.actualCenter2 ∧
      common.selectedXvRow.labels.card = 4 ∧
      roles.xv ∈ common.selectedXvRow.labels ∧
      roles.u ∈ common.selectedXvRow.labels ∧
      roles.source1 ∉ common.selectedXvRow.labels ∧
      roles.source2 ∉ common.selectedXvRow.labels ∧
      ({roles.deleted, roles.u, roles.xu, roles.v, roles.xv} : Finset Label).card = 5 ∧
      common.deletedCenterRow.labels.card = 4 ∧
      roles.deletedCenter ∈ common.deletedCenterRow.labels ∧
      roles.deletedCenter ∉
        ({roles.deleted, roles.u, roles.xu, roles.v, roles.xv} : Finset Label) ∧
      (common.deletedCenterRow.labels ∩
          ({roles.deleted, roles.u, roles.xu, roles.v, roles.xv} : Finset Label)).card ≤ 1
  refine
    ⟨roles.source1_ne_source2, roles.actualCenter1_ne_actualCenter2,
      common.selectedXvRow.labels_card_eq_four, common.xv_mem_selectedXvRow,
      common.u_mem_selectedXvRow, common.source1_not_mem_selectedXvRow,
      common.source2_not_mem_selectedXvRow, ?_,
      common.deletedCenterRow.labels_card_eq_four,
      common.deletedCenter_mem_deletedCenterRow, ?_, ?_⟩
  · rw [← common.physicalFive_eq_roles]
    exact common.physicalFive_card_eq_five
  · rw [← common.physicalFive_eq_roles]
    exact common.deletedCenter_not_mem_physicalFive
  · rw [← common.physicalFive_eq_roles]
    exact common.deletedCenterRow_physicalFive_inter_le_one

private def abstractUData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionIncidenceProjection source) :
    Rigid221Card18AbstractCrossedData where
  oppApex2 := data.original.roles.oppApex2
  K1 := data.original.K1.labels
  K2 := data.original.K2.labels
  BO := data.original.BO.labels

private def abstractXvData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionIncidenceProjection source) :
    Rigid221Card18AbstractCrossedData where
  oppApex2 := data.original.roles.oppApex2
  K1 := data.original.K1.labels
  K2 := data.original.K2.labels
  BO := data.original.BO.labels

private theorem abstractUData_valid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionIncidenceProjection source)
    (common : Rigid221CommonLabeledEnrichment source data.original.roles) :
    (abstractUData data).Valid (abstractCommonData data.original.roles common)
      data.original.roles.u data.original.roles.xv := by
  refine
    ⟨data.original.K1.labels_card_eq_four, data.original.K2.labels_card_eq_four,
      data.original.BO.labels_card_eq_four, data.original.u_not_mem_K1,
      data.original.u_not_mem_K2, data.original.u_not_mem_BO,
      data.original.xv_mem_K1, data.original.xv_mem_K2, data.original.xv_mem_BO,
      data.original.source1_mem_K1, data.original.source2_mem_K2, ?_⟩
  simpa [Rigid221Card18AbstractCrossedData.fiveIncidenceProfile,
    abstractUData, abstractCommonData, abstractCommonRoles,
    uDeletionFiveIncidenceProfile] using
      uDeletionFiveIncidenceProfile_conjunctionHasFalse data.original

private theorem abstractXvData_valid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionIncidenceProjection source)
    (common : Rigid221CommonLabeledEnrichment source data.original.roles) :
    (abstractXvData data).Valid (abstractCommonData data.original.roles common)
      data.original.roles.xv data.original.roles.u := by
  refine
    ⟨data.original.K1.labels_card_eq_four, data.original.K2.labels_card_eq_four,
      data.original.BO.labels_card_eq_four, data.original.xv_not_mem_K1,
      data.original.xv_not_mem_K2, data.original.xv_not_mem_BO,
      data.original.u_mem_K1, data.original.u_mem_K2, data.original.u_mem_BO,
      data.original.source1_mem_K1, data.original.source2_mem_K2, ?_⟩
  simpa [Rigid221Card18AbstractCrossedData.fiveIncidenceProfile,
    abstractXvData, abstractCommonData, abstractCommonRoles,
    xvDeletionFiveIncidenceProfile] using
      xvDeletionFiveIncidenceProfile_conjunctionHasFalse data.original

private def abstractBiData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221BothDeletionsLabeledEnrichment source) :
    Rigid221Card18AbstractBiData where
  uB1 := data.original.uB1.labels
  uB2 := data.original.uB2.labels
  xvB1 := data.original.xvB1.labels
  xvB2 := data.original.xvB2.labels

private theorem abstractBiData_valid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221BothDeletionsLabeledEnrichment source) :
    (abstractBiData data).Valid
      (abstractCommonData data.original.roles data.common) := by
  refine
    ⟨data.original.uB1.labels_card_eq_four, data.original.uB2.labels_card_eq_four,
      data.original.xvB1.labels_card_eq_four, data.original.xvB2.labels_card_eq_four,
      data.original.u_not_mem_B1, data.original.u_not_mem_B2,
      data.original.xv_not_mem_B1, data.original.xv_not_mem_B2,
      data.original.u_overlap_le_two, data.original.xv_overlap_le_two, ?_, ?_, ?_, ?_⟩
  · change data.original.roles.xv ≠ data.original.roles.actualCenter1
    rw [← data.uActualBlocker_eq_xv]
    exact data.uActualBlocker_ne_actualCenter1
  · change data.original.roles.xv ≠ data.original.roles.actualCenter2
    rw [← data.uActualBlocker_eq_xv]
    exact data.uActualBlocker_ne_actualCenter2
  · change data.original.roles.v ≠ data.original.roles.actualCenter1
    rw [← data.xvActualBlocker_eq_v]
    exact data.xvActualBlocker_ne_actualCenter1
  · change data.original.roles.v ≠ data.original.roles.actualCenter2
    rw [← data.xvActualBlocker_eq_v]
    exact data.xvActualBlocker_ne_actualCenter2

/-- Project an enriched source alternative to a valid pure finite packet. -/
def enrichedAlternativeToAbstractPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenEnrichedAlternative D S radius H F R) :
    {packet : Rigid221Card18AbstractPacket // packet.Valid} := by
  cases alternative with
  | bi source data =>
      exact
        ⟨.bi (abstractCommonData data.original.roles data.common) (abstractBiData data),
          ⟨abstractCommonData_valid data.original.roles data.common,
            abstractBiData_valid data⟩⟩
  | u source data common =>
      exact
        ⟨.u (abstractCommonData data.original.roles common) (abstractUData data),
          ⟨abstractCommonData_valid data.original.roles common,
            abstractUData_valid data common⟩⟩
  | xv source data common =>
      exact
        ⟨.xv (abstractCommonData data.original.roles common) (abstractXvData data),
          ⟨abstractCommonData_valid data.original.roles common,
            abstractXvData_valid data common⟩⟩

/-- Every exact-card-eighteen source alternative produces a valid pure finite packet. -/
theorem source_to_abstract_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenAlternative D S radius H F R) :
    Nonempty {packet : Rigid221Card18AbstractPacket // packet.Valid} := by
  exact
    ⟨enrichedAlternativeToAbstractPacket
      (rigid221ExactCardEighteenIncidenceAlternativeToEnriched
        (rigid221ExactCardEighteenLabeledAlternativeToIncidence
          (rigid221ExactCardEighteenDataAlternativeToLabeled
            (rigid221ExactCardEighteenAlternativeToData alternative))))⟩

#print axioms check_eq_true_iff
#print axioms enrichedAlternativeToAbstractPacket
#print axioms source_to_abstract_packet

end Rigid221Card18AbstractPacket
end ATailFrontierLiveClosure
end Problem97
