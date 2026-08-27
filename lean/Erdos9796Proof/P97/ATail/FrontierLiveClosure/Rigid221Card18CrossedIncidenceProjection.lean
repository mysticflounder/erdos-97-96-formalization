/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection

/-!
# Exact-card-eighteen Rigid221 crossed-incidence projection

This module computes the five incidences from each crossed arm's source-exact `Fin 18` labels and
supports.  It retains the complete labeled source data and proves that the computed conjunction has
a false cell using the stored geometric missing-incidence theorem.  It does not provide external
bytes, a solver encoding, or an existence claim.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18CrossedIncidenceProjection

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Rigid221Card18FiniteDataExport
open Rigid221Card18LabeledProjection

/-- The five memberships in the exact order expected by the crossed-row consumer. -/
structure Rigid221FiveIncidenceProfile where
  actualCenter1InBO : Bool
  oppApex2InK1 : Bool
  actualCenter2InK1 : Bool
  oppApex2InK2 : Bool
  actualCenter1InK2 : Bool
  deriving DecidableEq, Repr

/-- Whether every one of the five crossed-row incidences holds. -/
def Rigid221FiveIncidenceProfile.allFive
    (profile : Rigid221FiveIncidenceProfile) : Bool :=
  profile.actualCenter1InBO &&
    profile.oppApex2InK1 &&
    profile.actualCenter2InK1 &&
    profile.oppApex2InK2 &&
    profile.actualCenter1InK2

/-- The candidate-facing derived flag that the five-incidence conjunction has a false cell. -/
def Rigid221FiveIncidenceProfile.conjunctionHasFalse
    (profile : Rigid221FiveIncidenceProfile) : Bool :=
  !profile.allFive

/-- Compute all five incidences for the arm whose exact deletion point is `xv`. -/
def xvDeletionFiveIncidenceProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    Rigid221FiveIncidenceProfile where
  actualCenter1InBO := decide (data.roles.actualCenter1 ∈ data.BO.labels)
  oppApex2InK1 := decide (data.roles.oppApex2 ∈ data.K1.labels)
  actualCenter2InK1 := decide (data.roles.actualCenter2 ∈ data.K1.labels)
  oppApex2InK2 := decide (data.roles.oppApex2 ∈ data.K2.labels)
  actualCenter1InK2 := decide (data.roles.actualCenter1 ∈ data.K2.labels)

/-- Compute all five incidences for the arm whose exact deletion point is `u`. -/
def uDeletionFiveIncidenceProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    Rigid221FiveIncidenceProfile where
  actualCenter1InBO := decide (data.roles.actualCenter1 ∈ data.BO.labels)
  oppApex2InK1 := decide (data.roles.oppApex2 ∈ data.K1.labels)
  actualCenter2InK1 := decide (data.roles.actualCenter2 ∈ data.K1.labels)
  oppApex2InK2 := decide (data.roles.oppApex2 ∈ data.K2.labels)
  actualCenter1InK2 := decide (data.roles.actualCenter1 ∈ data.K2.labels)

/-- The first `xv`-arm bit is exactly actual center one's geometric membership in `BO`. -/
@[simp] theorem xvDeletionFiveIncidenceProfile_actualCenter1InBO_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    (xvDeletionFiveIncidenceProfile data).actualCenter1InBO = true ↔
      (lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2 ∈
        SelectedClass (D.A.erase source.packet.xv) S.oppApex2 source.P.rho := by
  simp only [xvDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.actualCenter1_point] using
    data.BO.mem_labels_iff data.roles.actualCenter1

/-- The second `xv`-arm bit is exactly the opposite apex's membership in `K₁`. -/
@[simp] theorem xvDeletionFiveIncidenceProfile_oppApex2InK1_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    (xvDeletionFiveIncidenceProfile data).oppApex2InK1 = true ↔
      S.oppApex2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₁.1
          source.source₁.2).toCriticalFourShell.support := by
  simp only [xvDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.oppApex2_point] using
    data.K1.mem_labels_iff data.roles.oppApex2

/-- The third `xv`-arm bit is exactly actual center two's membership in `K₁`. -/
@[simp] theorem xvDeletionFiveIncidenceProfile_actualCenter2InK1_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    (xvDeletionFiveIncidenceProfile data).actualCenter2InK1 = true ↔
      (lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₁.1
          source.source₁.2).toCriticalFourShell.support := by
  simp only [xvDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.actualCenter2_point] using
    data.K1.mem_labels_iff data.roles.actualCenter2

/-- The fourth `xv`-arm bit is exactly the opposite apex's membership in `K₂`. -/
@[simp] theorem xvDeletionFiveIncidenceProfile_oppApex2InK2_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    (xvDeletionFiveIncidenceProfile data).oppApex2InK2 = true ↔
      S.oppApex2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₂.1
          source.source₂.2).toCriticalFourShell.support := by
  simp only [xvDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.oppApex2_point] using
    data.K2.mem_labels_iff data.roles.oppApex2

/-- The fifth `xv`-arm bit is exactly actual center one's membership in `K₂`. -/
@[simp] theorem xvDeletionFiveIncidenceProfile_actualCenter1InK2_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    (xvDeletionFiveIncidenceProfile data).actualCenter1InK2 = true ↔
      (lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₂.1
          source.source₂.2).toCriticalFourShell.support := by
  simp only [xvDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.actualCenter1_point] using
    data.K2.mem_labels_iff data.roles.actualCenter1

/-- The first `u`-arm bit is exactly actual center one's geometric membership in `BO`. -/
@[simp] theorem uDeletionFiveIncidenceProfile_actualCenter1InBO_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    (uDeletionFiveIncidenceProfile data).actualCenter1InBO = true ↔
      (lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2 ∈
        SelectedClass (D.A.erase source.P.u.1) S.oppApex2 source.P.rho := by
  simp only [uDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.actualCenter1_point] using
    data.BO.mem_labels_iff data.roles.actualCenter1

/-- The second `u`-arm bit is exactly the opposite apex's membership in `K₁`. -/
@[simp] theorem uDeletionFiveIncidenceProfile_oppApex2InK1_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    (uDeletionFiveIncidenceProfile data).oppApex2InK1 = true ↔
      S.oppApex2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₁.1
          source.source₁.2).toCriticalFourShell.support := by
  simp only [uDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.oppApex2_point] using
    data.K1.mem_labels_iff data.roles.oppApex2

/-- The third `u`-arm bit is exactly actual center two's membership in `K₁`. -/
@[simp] theorem uDeletionFiveIncidenceProfile_actualCenter2InK1_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    (uDeletionFiveIncidenceProfile data).actualCenter2InK1 = true ↔
      (lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₁.1
          source.source₁.2).toCriticalFourShell.support := by
  simp only [uDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.actualCenter2_point] using
    data.K1.mem_labels_iff data.roles.actualCenter2

/-- The fourth `u`-arm bit is exactly the opposite apex's membership in `K₂`. -/
@[simp] theorem uDeletionFiveIncidenceProfile_oppApex2InK2_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    (uDeletionFiveIncidenceProfile data).oppApex2InK2 = true ↔
      S.oppApex2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₂.1
          source.source₂.2).toCriticalFourShell.support := by
  simp only [uDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.oppApex2_point] using
    data.K2.mem_labels_iff data.roles.oppApex2

/-- The fifth `u`-arm bit is exactly actual center one's membership in `K₂`. -/
@[simp] theorem uDeletionFiveIncidenceProfile_actualCenter1InK2_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    (uDeletionFiveIncidenceProfile data).actualCenter1InK2 = true ↔
      (lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2 ∈
        ((lateFirstApexSystem R).selectedAt source.source₂.1
          source.source₂.2).toCriticalFourShell.support := by
  simp only [uDeletionFiveIncidenceProfile, decide_eq_true_eq]
  simpa only [data.roles.actualCenter1_point] using
    data.K2.mem_labels_iff data.roles.actualCenter1

/-- The source `xv`-arm negation proves that the computed conjunction has a false cell. -/
theorem xvDeletionFiveIncidenceProfile_conjunctionHasFalse
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    (xvDeletionFiveIncidenceProfile data).conjunctionHasFalse = true := by
  have hallFalse : (xvDeletionFiveIncidenceProfile data).allFive = false := by
    apply Bool.eq_false_of_not_eq_true
    intro hall
    simp only [Rigid221FiveIncidenceProfile.allFive, Bool.and_eq_true] at hall
    apply data.original.profile.missingIncidence
    exact ⟨
      (xvDeletionFiveIncidenceProfile_actualCenter1InBO_iff data).mp
        hall.1.1.1.1,
      (xvDeletionFiveIncidenceProfile_oppApex2InK1_iff data).mp
        hall.1.1.1.2,
      (xvDeletionFiveIncidenceProfile_actualCenter2InK1_iff data).mp
        hall.1.1.2,
      (xvDeletionFiveIncidenceProfile_oppApex2InK2_iff data).mp hall.1.2,
      (xvDeletionFiveIncidenceProfile_actualCenter1InK2_iff data).mp
        hall.2⟩
  simp [Rigid221FiveIncidenceProfile.conjunctionHasFalse, hallFalse]

/-- The source `u`-arm negation proves that the computed conjunction has a false cell. -/
theorem uDeletionFiveIncidenceProfile_conjunctionHasFalse
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    (uDeletionFiveIncidenceProfile data).conjunctionHasFalse = true := by
  have hallFalse : (uDeletionFiveIncidenceProfile data).allFive = false := by
    apply Bool.eq_false_of_not_eq_true
    intro hall
    simp only [Rigid221FiveIncidenceProfile.allFive, Bool.and_eq_true] at hall
    apply data.original.profile.missingIncidence
    exact ⟨
      (uDeletionFiveIncidenceProfile_actualCenter1InBO_iff data).mp
        hall.1.1.1.1,
      (uDeletionFiveIncidenceProfile_oppApex2InK1_iff data).mp
        hall.1.1.1.2,
      (uDeletionFiveIncidenceProfile_actualCenter2InK1_iff data).mp
        hall.1.1.2,
      (uDeletionFiveIncidenceProfile_oppApex2InK2_iff data).mp hall.1.2,
      (uDeletionFiveIncidenceProfile_actualCenter1InK2_iff data).mp hall.2⟩
  simp [Rigid221FiveIncidenceProfile.conjunctionHasFalse, hallFalse]

/-- The `xv` crossed arm with its complete labeled source and computed incidence profile. -/
structure Rigid221XvDeletionIncidenceProjection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  original : Rigid221XvDeletionLabeledData source
  profile : Rigid221FiveIncidenceProfile
  profile_eq : profile = xvDeletionFiveIncidenceProfile original
  hasMissing : profile.conjunctionHasFalse = true

/-- The `u` crossed arm with its complete labeled source and computed incidence profile. -/
structure Rigid221UDeletionIncidenceProjection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  original : Rigid221UDeletionLabeledData source
  profile : Rigid221FiveIncidenceProfile
  profile_eq : profile = uDeletionFiveIncidenceProfile original
  hasMissing : profile.conjunctionHasFalse = true

/-- Attach the source-computed five-incidence profile to an `xv` crossed arm. -/
def rigid221XvDeletionIncidenceProjection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221XvDeletionLabeledData source) :
    Rigid221XvDeletionIncidenceProjection source where
  original := data
  profile := xvDeletionFiveIncidenceProfile data
  profile_eq := rfl
  hasMissing := xvDeletionFiveIncidenceProfile_conjunctionHasFalse data

/-- Attach the source-computed five-incidence profile to a `u` crossed arm. -/
def rigid221UDeletionIncidenceProjection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : Rigid221ExactCardEighteenSource D S radius H F R}
    (data : Rigid221UDeletionLabeledData source) :
    Rigid221UDeletionIncidenceProjection source where
  original := data
  profile := uDeletionFiveIncidenceProfile data
  profile_eq := rfl
  hasMissing := uDeletionFiveIncidenceProfile_conjunctionHasFalse data

/-- The canonical BI/U/XV alternative with crossed incidences attached to their source data. -/
inductive Rigid221ExactCardEighteenIncidenceAlternative
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A)
    (F : CriticalPairFrontier D S radius H)
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) : Type where
  | bi
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221BothDeletionsLabeledData source)
  | u
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221UDeletionIncidenceProjection source)
  | xv
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221XvDeletionIncidenceProjection source)

/-- Enrich an existing labeled alternative without invoking an existence theorem or open leaf. -/
def rigid221ExactCardEighteenLabeledAlternativeToIncidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenLabeledAlternative D S radius H F R) :
    Rigid221ExactCardEighteenIncidenceAlternative D S radius H F R :=
  match alternative with
  | .bothDeletions source data => .bi source data
  | .uDeletion source data => .u source (rigid221UDeletionIncidenceProjection data)
  | .xvDeletion source data => .xv source (rigid221XvDeletionIncidenceProjection data)

#print axioms xvDeletionFiveIncidenceProfile_conjunctionHasFalse
#print axioms uDeletionFiveIncidenceProfile_conjunctionHasFalse
#print axioms rigid221ExactCardEighteenLabeledAlternativeToIncidence

end Rigid221Card18CrossedIncidenceProjection
end ATailFrontierLiveClosure
end Problem97
