/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LeafExport

/-!
# Exact-card-eighteen Rigid221 finite data export

This module unwraps the three source alternatives into `Type`-valued data while preserving the
exact-cardinality carrier labeling and the source-exact dependent witness types.  It does not
define an external serializer, a solver encoding, a certificate, or a general-cardinality lift.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18FiniteDataExport

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch

/-- Frozen finite label type for the exact-card-eighteen source slice. -/
abbrev Label := Fin 18

/-- Interpret a finite label using the equivalence stored with the explicit card-eighteen source. -/
noncomputable def pointOf {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (label : Label) : ℝ² :=
  (carrier.labeling.symm label).1

/-- Every finite label denotes a point of the original carrier. -/
@[simp] theorem pointOf_mem_carrier {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (label : Label) :
    pointOf carrier label ∈ D.A := by
  exact (carrier.labeling.symm label).2

/-- The source carrier still has exactly eighteen points; no lower-bound inference is used. -/
@[simp] theorem carrier_card_eq {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) : D.A.card = 18 :=
  carrier.card_eq

/-- Labels whose carrier points lie in a specified geometric subset. -/
noncomputable def labelsOf {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (S : Finset ℝ²) : Finset Label :=
  Finset.univ.filter fun label => pointOf carrier label ∈ S

@[simp] theorem mem_labelsOf_iff {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) (S : Finset ℝ²) (label : Label) :
    label ∈ labelsOf carrier S ↔ pointOf carrier label ∈ S := by
  simp [labelsOf]

/-- Relabeling preserves the cardinality of every subset of the exact-eighteen carrier. -/
theorem labelsOf_card_eq {D : CounterexampleData}
    (carrier : Rigid221ExactCardEighteenCarrier D) {S : Finset ℝ²} (hS : S ⊆ D.A) :
    (labelsOf carrier S).card = S.card := by
  classical
  let point : Label → ℝ² := pointOf carrier
  have hinjective : Function.Injective point := by
    intro left right hpoint
    apply carrier.labeling.symm.injective
    exact Subtype.ext hpoint
  have himage : (labelsOf carrier S).image point = S := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨label, hlabel, rfl⟩
      exact (mem_labelsOf_iff carrier S label).mp hlabel
    · intro hx
      let source : CarrierVertex D.A := ⟨x, hS hx⟩
      let label : Label := carrier.labeling source
      refine Finset.mem_image.mpr ⟨label, ?_, ?_⟩
      · apply (mem_labelsOf_iff carrier S label).mpr
        simpa [pointOf, label, source] using hx
      · simp [point, pointOf, label, source]
  calc
    (labelsOf carrier S).card = ((labelsOf carrier S).image point).card :=
      (Finset.card_image_of_injective _ hinjective).symm
    _ = S.card := congrArg Finset.card himage

/-- Direct witnesses for the crossed arm in which deletion of `xv` preserves both rows. -/
structure Rigid221XvDeletionFiniteData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  profile : Rigid221XvDeletionMissingIncidence source
  C₁ :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1 source.source₁.2).toCriticalFourShell
    U5QDeletedK4Class D source.packet.xv
      (Hlate.centerAt source.source₁.1 source.source₁.2) K₁.support
  C₂ :
    let Hlate := lateFirstApexSystem R
    let K₂ := (Hlate.selectedAt source.source₂.1 source.source₂.2).toCriticalFourShell
    U5QDeletedK4Class D source.packet.xv
      (Hlate.centerAt source.source₂.1 source.source₂.2) K₂.support
  CO :
    let BO := SelectedClass (D.A.erase source.packet.xv) S.oppApex2 source.P.rho
    U5QDeletedK4Class D source.packet.xv S.oppApex2 BO
  rowFacts :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1 source.source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source.source₂.1 source.source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase source.packet.xv) S.oppApex2 source.P.rho
    source.P.u.1 ∈ K₁.support ∧
      source.P.u.1 ∈ K₂.support ∧
      source.P.u.1 ∈ BO ∧
      BO.card = 4 ∧
      source.source₁.1 ∈ K₁.support ∧
      source.source₂.1 ∈ K₂.support

/-- Direct witnesses for the crossed arm in which deletion of `u` preserves both rows. -/
structure Rigid221UDeletionFiniteData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  profile : Rigid221UDeletionMissingIncidence source
  C₁ :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1 source.source₁.2).toCriticalFourShell
    U5QDeletedK4Class D source.P.u.1
      (Hlate.centerAt source.source₁.1 source.source₁.2) K₁.support
  C₂ :
    let Hlate := lateFirstApexSystem R
    let K₂ := (Hlate.selectedAt source.source₂.1 source.source₂.2).toCriticalFourShell
    U5QDeletedK4Class D source.P.u.1
      (Hlate.centerAt source.source₂.1 source.source₂.2) K₂.support
  CO :
    let BO := SelectedClass (D.A.erase source.P.u.1) S.oppApex2 source.P.rho
    U5QDeletedK4Class D source.P.u.1 S.oppApex2 BO
  rowFacts :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1 source.source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source.source₂.1 source.source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase source.P.u.1) S.oppApex2 source.P.rho
    source.packet.xv ∈ K₁.support ∧
      source.packet.xv ∈ K₂.support ∧
      source.packet.xv ∈ BO ∧
      BO.card = 4 ∧
      source.source₁.1 ∈ K₁.support ∧
      source.source₂.1 ∈ K₂.support

/-- Direct packets for the arm in which both endpoint deletions preserve both rows. -/
structure Rigid221BothDeletionsFiniteData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  profile : Rigid221BothDeletionsSurvive source
  commonDeletionU :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) source.P.u.1
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)
  commonDeletionXv :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) source.packet.xv
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)

/-- The three exact-card-eighteen alternatives with all proof-erased witnesses exposed as data. -/
inductive Rigid221ExactCardEighteenDataAlternative
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A)
    (F : CriticalPairFrontier D S radius H)
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) : Type where
  | xvDeletion
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221XvDeletionFiniteData source)
  | uDeletion
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221UDeletionFiniteData source)
  | bothDeletions
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (data : Rigid221BothDeletionsFiniteData source)

/-- Unwrap only the witnesses already carried by a source alternative.

This conversion does not invoke the source existence theorem or any open contradiction leaf. -/
noncomputable def rigid221ExactCardEighteenAlternativeToData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (alternative : Rigid221ExactCardEighteenAlternative D S radius H F R) :
    Rigid221ExactCardEighteenDataAlternative D S radius H F R :=
  match alternative with
  | .xvDeletion source profile =>
      let C₁ := Classical.choose profile.rows
      let afterC₁ := Classical.choose_spec profile.rows
      let C₂ := Classical.choose afterC₁
      let afterC₂ := Classical.choose_spec afterC₁
      let CO := Classical.choose afterC₂
      let rowFacts := Classical.choose_spec afterC₂
      .xvDeletion source {
        profile := profile
        C₁ := C₁
        C₂ := C₂
        CO := CO
        rowFacts := rowFacts }
  | .uDeletion source profile =>
      let C₁ := Classical.choose profile.rows
      let afterC₁ := Classical.choose_spec profile.rows
      let C₂ := Classical.choose afterC₁
      let afterC₂ := Classical.choose_spec afterC₁
      let CO := Classical.choose afterC₂
      let rowFacts := Classical.choose_spec afterC₂
      .uDeletion source {
        profile := profile
        C₁ := C₁
        C₂ := C₂
        CO := CO
        rowFacts := rowFacts }
  | .bothDeletions source profile =>
      .bothDeletions source {
        profile := profile
        commonDeletionU := Classical.choice profile.commonDeletion.1
        commonDeletionXv := Classical.choice profile.commonDeletion.2 }

#print axioms rigid221ExactCardEighteenAlternativeToData

end Rigid221Card18FiniteDataExport
end ATailFrontierLiveClosure
end Problem97
