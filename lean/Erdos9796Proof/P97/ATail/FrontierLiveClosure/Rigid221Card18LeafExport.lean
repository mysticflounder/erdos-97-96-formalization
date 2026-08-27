/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

/-!
# Exact-card-eighteen Rigid221 source alternatives

This module exposes the three source-entitled alternatives below the Rigid221
source-heavy residual when the carrier has exactly eighteen points.  It keeps
the complete geometric contexts and the exact witnesses produced by Lean.

This is a Lean source boundary.  It is not a finite serialization, a CNF
encoding, a solver certificate, or a lift from the exact-cardinality slice to
the unbounded residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- An exact-card-eighteen carrier together with a finite labeling.

The constructor below obtains the labeling from the explicit equality.  In
particular, the live lower bound `18 ≤ D.A.card` is not used to manufacture
this exact-cardinality datum. -/
structure Rigid221ExactCardEighteenCarrier (D : CounterexampleData) : Type where
  card_eq : D.A.card = 18
  labeling : CarrierVertex D.A ≃ Fin 18

/-- Construct the exact-card-eighteen carrier labeling from the stated
cardinality equality. -/
noncomputable def rigid221ExactCardEighteenCarrier
    (D : CounterexampleData) (hcard : D.A.card = 18) :
    Rigid221ExactCardEighteenCarrier D where
  card_eq := hcard
  labeling := Finset.equivFinOfCardEq hcard

/-- Data common to all three exact-card-eighteen source alternatives.  The
nested contexts retain the complete geometric source; the two chosen sources
retain their neutral-producer origin outside the `xv` row. -/
structure Rigid221ExactCardEighteenSource
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A)
    (F : CriticalPairFrontier D S radius H)
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) : Type where
  P : ExactFourRigid221PhysicalApexSourceEqUContext R
  packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P
  Q : ExactFourRigid221PentagonBlockerVResidual P packet
  hcenterV :
    (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
      P.jointDeletion.deleted.1
  hcenterDeletedInterior :
    (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2 ∈
      S.capInteriorByIndex S.oppIndex2
  hcenterDeletedOffClass :
    (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2 ∉
      SelectedClass D.A S.oppApex2 P.rho
  hnextRowPhysicalHits :
    let Hlate := lateFirstApexSystem R
    let c := Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
    let hcA : c ∈ D.A := Finset.mem_of_mem_erase
      (Hlate.selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
    (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho).card ≤ 1)
  carrier : Rigid221ExactCardEighteenCarrier D
  source₁ : CarrierVertex D.A
  source₂ : CarrierVertex D.A
  source₁Outside :
    source₁.1 ∉
      ((lateFirstApexSystem R).selectedAt
        packet.xv Q.hxvA).toCriticalFourShell.support
  source₂Outside :
    source₂.1 ∉
      ((lateFirstApexSystem R).selectedAt
        packet.xv Q.hxvA).toCriticalFourShell.support
  centers_ne :
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2

/-- The crossed alternative in which deleting `u` destroys both selected
rows and deleting `xv` preserves both.  The three exact q-deleted classes are
retained together with the negated five-incidence condition. -/
structure Rigid221XvDeletionMissingIncidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  notSurvivesU₁ :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source.P.u.1)
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
  notSurvivesU₂ :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source.P.u.1)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)
  survivesXv₁ :
    HasNEquidistantPointsAt 4 (D.A.erase source.packet.xv)
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
  survivesXv₂ :
    HasNEquidistantPointsAt 4 (D.A.erase source.packet.xv)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)
  rows :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1
      source.source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source.source₂.1
      source.source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase source.packet.xv)
      S.oppApex2 source.P.rho
    ∃ _C₁ : U5QDeletedK4Class D source.packet.xv
        (Hlate.centerAt source.source₁.1 source.source₁.2) K₁.support,
      ∃ _C₂ : U5QDeletedK4Class D source.packet.xv
          (Hlate.centerAt source.source₂.1 source.source₂.2) K₂.support,
        ∃ _CO : U5QDeletedK4Class D source.packet.xv S.oppApex2 BO,
          source.P.u.1 ∈ K₁.support ∧
          source.P.u.1 ∈ K₂.support ∧
          source.P.u.1 ∈ BO ∧
          BO.card = 4 ∧
          source.source₁.1 ∈ K₁.support ∧
          source.source₂.1 ∈ K₂.support
  missingIncidence :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1
      source.source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source.source₂.1
      source.source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase source.packet.xv)
      S.oppApex2 source.P.rho
    ¬ (Hlate.centerAt source.source₁.1 source.source₁.2 ∈ BO ∧
      S.oppApex2 ∈ K₁.support ∧
      Hlate.centerAt source.source₂.1 source.source₂.2 ∈ K₁.support ∧
      S.oppApex2 ∈ K₂.support ∧
      Hlate.centerAt source.source₁.1 source.source₁.2 ∈ K₂.support)

/-- The symmetric crossed alternative in which deleting `u` preserves both
selected rows and deleting `xv` destroys both. -/
structure Rigid221UDeletionMissingIncidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  survivesU₁ :
    HasNEquidistantPointsAt 4 (D.A.erase source.P.u.1)
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
  survivesU₂ :
    HasNEquidistantPointsAt 4 (D.A.erase source.P.u.1)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)
  notSurvivesXv₁ :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source.packet.xv)
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
  notSurvivesXv₂ :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source.packet.xv)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)
  rows :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1
      source.source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source.source₂.1
      source.source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase source.P.u.1)
      S.oppApex2 source.P.rho
    ∃ _C₁ : U5QDeletedK4Class D source.P.u.1
        (Hlate.centerAt source.source₁.1 source.source₁.2) K₁.support,
      ∃ _C₂ : U5QDeletedK4Class D source.P.u.1
          (Hlate.centerAt source.source₂.1 source.source₂.2) K₂.support,
        ∃ _CO : U5QDeletedK4Class D source.P.u.1 S.oppApex2 BO,
          source.packet.xv ∈ K₁.support ∧
          source.packet.xv ∈ K₂.support ∧
          source.packet.xv ∈ BO ∧
          BO.card = 4 ∧
          source.source₁.1 ∈ K₁.support ∧
          source.source₂.1 ∈ K₂.support
  missingIncidence :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source.source₁.1
      source.source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source.source₂.1
      source.source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase source.P.u.1)
      S.oppApex2 source.P.rho
    ¬ (Hlate.centerAt source.source₁.1 source.source₁.2 ∈ BO ∧
      S.oppApex2 ∈ K₁.support ∧
      Hlate.centerAt source.source₂.1 source.source₂.2 ∈ K₁.support ∧
      S.oppApex2 ∈ K₂.support ∧
      Hlate.centerAt source.source₁.1 source.source₁.2 ∈ K₂.support)

/-- The alternative in which both endpoint deletions preserve both selected
rows.  Both source-exact common-deletion objects are retained. -/
structure Rigid221BothDeletionsSurvive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (source : Rigid221ExactCardEighteenSource D S radius H F R) : Type where
  survivesU₁ :
    HasNEquidistantPointsAt 4 (D.A.erase source.P.u.1)
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
  survivesU₂ :
    HasNEquidistantPointsAt 4 (D.A.erase source.P.u.1)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)
  survivesXv₁ :
    HasNEquidistantPointsAt 4 (D.A.erase source.packet.xv)
      ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
  survivesXv₂ :
    HasNEquidistantPointsAt 4 (D.A.erase source.packet.xv)
      ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)
  commonDeletion :
    Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        source.P.u.1
        ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
        ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2)) ∧
      Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        source.packet.xv
        ((lateFirstApexSystem R).centerAt source.source₁.1 source.source₁.2)
        ((lateFirstApexSystem R).centerAt source.source₂.1 source.source₂.2))

/-- The three exact-card-eighteen alternatives produced by the source-heavy
residual.  Each constructor retains the common source data and its distinct
mathematical alternative. -/
inductive Rigid221ExactCardEighteenAlternative
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A)
    (F : CriticalPairFrontier D S radius H)
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) : Type where
  | xvDeletion
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (alternative : Rigid221XvDeletionMissingIncidence source)
  | uDeletion
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (alternative : Rigid221UDeletionMissingIncidence source)
  | bothDeletions
      (source : Rigid221ExactCardEighteenSource D S radius H F R)
      (alternative : Rigid221BothDeletionsSurvive source)

/-- At exact carrier cardinality eighteen, the source-heavy residual produces
one of the two crossed missing-incidence alternatives or the bi-survival
common-deletion alternative.

The all-five-incidences subcases are eliminated by the checked tetrahedron
terminals.  This proof does not use the three open contradiction leaves. -/
theorem exists_rigid221ExactCardEighteenAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 18)
    (hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1)) :
    Nonempty (Rigid221ExactCardEighteenAlternative D S radius H F R) := by
  have hlarge : 17 ≤ D.A.card := by omega
  rcases pentagonOffClassBlocker_largeCard_threeColor_pair_neutral
      (P := P) (packet := packet) Q.hxvA Q.huXvRow hlarge with
    ⟨source₁, source₂, hsource₁Outside, hsource₂Outside,
      hcenters, hprofile⟩
  let source : Rigid221ExactCardEighteenSource D S radius H F R :=
    { P := P
      packet := packet
      Q := Q
      hcenterV := hcenterV
      hcenterDeletedInterior := hcenterDeletedInterior
      hcenterDeletedOffClass := hcenterDeletedOffClass
      hnextRowPhysicalHits := hnextRowPhysicalHits
      carrier := rigid221ExactCardEighteenCarrier D hcard
      source₁ := source₁
      source₂ := source₂
      source₁Outside := hsource₁Outside
      source₂Outside := hsource₂Outside
      centers_ne := hcenters }
  rcases hprofile with hprofileXv | hprofileU | hprofileBoth
  · rcases hprofileXv with
      ⟨hnotSurvivesU₁, hnotSurvivesU₂, hsurvivesXv₁, hsurvivesXv₂⟩
    have hrows :=
      pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u_neutral
        (P := P) (packet := packet) Q.hxvA source₁ source₂
          hsource₁Outside hsource₂Outside hnotSurvivesU₁ hnotSurvivesU₂
          hsurvivesXv₁ hsurvivesXv₂
    by_cases hincidences :
        let Hlate := lateFirstApexSystem R
        let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
        let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
        let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
        Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
          S.oppApex2 ∈ K₁.support ∧
          Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
          S.oppApex2 ∈ K₂.support ∧
          Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support
    · exact
        (pentagonOffClassBlocker_xvDeletion_false_of_tetrahedron_incidences_neutral
          (P := P) (packet := packet) Q.hxvA source₁ source₂
            hsource₁Outside hsource₂Outside hnotSurvivesU₁ hnotSurvivesU₂
            hsurvivesXv₁ hsurvivesXv₂ hincidences).elim
    · refine ⟨.xvDeletion source ?_⟩
      exact
        { notSurvivesU₁ := hnotSurvivesU₁
          notSurvivesU₂ := hnotSurvivesU₂
          survivesXv₁ := hsurvivesXv₁
          survivesXv₂ := hsurvivesXv₂
          rows := hrows
          missingIncidence := hincidences }
  · rcases hprofileU with
      ⟨hsurvivesU₁, hsurvivesU₂, hnotSurvivesXv₁, hnotSurvivesXv₂⟩
    have hrows :=
      pentagonOffClassBlocker_uDeletion_threeExactRows_common_xv_neutral
        (P := P) (packet := packet) Q.hxvA source₁ source₂
          hsource₁Outside hsource₂Outside hsurvivesU₁ hsurvivesU₂
          hnotSurvivesXv₁ hnotSurvivesXv₂
    by_cases hincidences :
        let Hlate := lateFirstApexSystem R
        let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
        let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
        let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
        Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
          S.oppApex2 ∈ K₁.support ∧
          Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
          S.oppApex2 ∈ K₂.support ∧
          Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support
    · exact
        (pentagonOffClassBlocker_uDeletion_false_of_tetrahedron_incidences_neutral
          (P := P) (packet := packet) Q.hxvA source₁ source₂
            hsource₁Outside hsource₂Outside hsurvivesU₁ hsurvivesU₂
            hnotSurvivesXv₁ hnotSurvivesXv₂ hincidences).elim
    · refine ⟨.uDeletion source ?_⟩
      exact
        { survivesU₁ := hsurvivesU₁
          survivesU₂ := hsurvivesU₂
          notSurvivesXv₁ := hnotSurvivesXv₁
          notSurvivesXv₂ := hnotSurvivesXv₂
          rows := hrows
          missingIncidence := hincidences }
  · rcases hprofileBoth with
      ⟨hsurvivesU₁, hsurvivesU₂, hsurvivesXv₁, hsurvivesXv₂⟩
    have hcommonDeletion :=
      pentagonOffClassBlocker_biSurvival_commonDeletionRectangle_neutral
        (P := P) (packet := packet) Q.hxvA source₁ source₂ hcenters
          hsurvivesU₁ hsurvivesU₂ hsurvivesXv₁ hsurvivesXv₂
    refine ⟨.bothDeletions source ?_⟩
    exact
      { survivesU₁ := hsurvivesU₁
        survivesU₂ := hsurvivesU₂
        survivesXv₁ := hsurvivesXv₁
        survivesXv₂ := hsurvivesXv₂
        commonDeletion := hcommonDeletion }

end ATailFrontierLiveClosure
end Problem97
