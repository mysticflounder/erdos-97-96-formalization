/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstFiberFinitePacketIngress

/-!
# Role-labelled ingress for the FirstFiber outside pair

This module selects one of the two genuine outside deletions and one of the
four collision-row deletions, then reindexes both exact-row boundaries through
an explicit `BoundaryIndexing`.  It is a positive source adapter only: the
order, profile, and five-center cardinality facts are supplied by the caller.
No carrier bound, full source coverage, metric alternative, or contradiction
is asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailFiveCenterDeletionBoundary
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open Census554.GeneralCarrierBridge
open FirstFiberFinitePacketIngress
open TwoSourceExactCollisionRowsTerminal

namespace FirstFiberRoleCoverage

attribute [local instance] Classical.propDecidable

private theorem firstFiberRole_oppApex1_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} :
    S.oppApex1 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem firstFiberRole_oppApex2_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} :
    S.oppApex2 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem firstFiberRole_surplusApex_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} :
    S.surplusApex ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v3_mem

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius radiusρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- The two exact-row branches of the live outside-pair residual. -/
abbrev FirstFiberOutsidePairExactRowsResidual
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  Nonempty
      (FiveSurvivorExactRowsBoundary
        D H Q.source.1 Q.source.2
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex) ∨
    Nonempty
      (FiveSurvivorExactRowsBoundary
        D H Q.otherOutsidePoint Q.otherOutsidePoint_mem_A
        (H.centerAt source.1 source.2)
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex)

include Pρ in
/-- Select the genuine outside deletion and one collision-row deletion.

The four center-card hypotheses correspond to the four arms of
`FirstFiberCollisionFiveCenterExactRowsResidual`; only the chosen arm is
reindexed.  Thus this theorem is a source-side coverage adapter, not a
finite-carrier or terminal-consumer theorem.
-/
noncomputable def firstFiberOutsidePairExactRows_to_roleCombinationPacket
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (houtside : FirstFiberOutsidePairExactRowsResidual P Pρ Q source)
    (hcollision :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex)
    (I : BoundaryIndexing D.A)
    (order : Fin I.n → Fin I.n) (horder : Function.Bijective order)
    (profile : List ℕ) (hprofile : profile ≠ [])
    (houtsideCenters :
      ({H.centerAt source.1 source.2,
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        S.oppApex1, S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5)
    (hfirstCenters :
      ({H.centerAt source.1 source.2, S.oppApex1,
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5)
    (hsecondCenters :
      ({H.centerAt source.1 source.2, S.oppApex1,
        H.centerAt P.source₁ P.source₁_mem_A,
        S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5)
    (hthirdCenters :
      ({H.centerAt source.1 source.2, S.oppApex1,
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5)
    (hfourthCenters :
      ({H.centerAt source.1 source.2, S.oppApex1,
        H.centerAt P.source₁ P.source₁_mem_A,
        S.oppApex2, S.surplusApex} : Finset ℝ²).card = 5) :
    Nonempty (RoleCombinationPacket I.n) := by
  classical
  have hcenter_source : H.centerAt source.1 source.2 ∈ D.A :=
    by simpa [CriticalShellSystem.blockerVertex] using (H.blockerVertex source).2
  have hcenter_P : H.centerAt P.source₁ P.source₁_mem_A ∈ D.A :=
    by
      simpa [CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  have hcenter_Pρ : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ D.A :=
    by
      simpa [CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩).2
  have hApex₁ : S.oppApex1 ∈ D.A := firstFiberRole_oppApex1_mem_A
  have hApex₂ : S.oppApex2 ∈ D.A := firstFiberRole_oppApex2_mem_A
  have hApex₃ : S.surplusApex ∈ D.A := firstFiberRole_surplusApex_mem_A
  rcases houtside with hsource | hother
  · rcases hsource with ⟨outsideBoundary⟩
    let outsidePacket :=
      FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
        outsideBoundary I hcenter_source hcenter_Pρ
        hApex₁ hApex₂ hApex₃ houtsideCenters order horder profile hprofile
    rcases hcollision with hfirst | hsecond | hthird | hfourth
    · rcases hfirst with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_Pρ
          hApex₂ hApex₃ hfirstCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .source
          collisionArm := .first
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩
    · rcases hsecond with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_P
          hApex₂ hApex₃ hsecondCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .source
          collisionArm := .second
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩
    · rcases hthird with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_Pρ
          hApex₂ hApex₃ hthirdCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .source
          collisionArm := .third
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩
    · rcases hfourth with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_P
          hApex₂ hApex₃ hfourthCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .source
          collisionArm := .fourth
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩
  · rcases hother with ⟨outsideBoundary⟩
    let outsidePacket :=
      FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
        outsideBoundary I hcenter_source hcenter_Pρ
        hApex₁ hApex₂ hApex₃ houtsideCenters order horder profile hprofile
    rcases hcollision with hfirst | hsecond | hthird | hfourth
    · rcases hfirst with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_Pρ
          hApex₂ hApex₃ hfirstCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .other
          collisionArm := .first
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩
    · rcases hsecond with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_P
          hApex₂ hApex₃ hsecondCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .other
          collisionArm := .second
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩
    · rcases hthird with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_Pρ
          hApex₂ hApex₃ hthirdCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .other
          collisionArm := .third
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩
    · rcases hfourth with ⟨collisionBoundary⟩
      let collisionPacket :=
        FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
          collisionBoundary I hcenter_source hApex₁ hcenter_P
          hApex₂ hApex₃ hfourthCenters order horder profile hprofile
      exact
        ⟨{
          outsideArm := .other
          collisionArm := .fourth
          outsidePacket := outsidePacket
          collisionPacket := collisionPacket
          combinedPacket := outsidePacket.combine collisionPacket
          combinedPacket_eq := by rfl }⟩

end
end FirstFiberRoleCoverage
end ATailFrontierLiveClosure
end Problem97
