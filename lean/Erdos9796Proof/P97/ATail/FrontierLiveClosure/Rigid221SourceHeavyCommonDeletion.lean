/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy
import Erdos9796Proof.P97.ATail.RobustApexCommonDeletion

/-!
# Rigid 221 source-heavy common-deletion producers

This downstream module keeps general-cardinality producer work out of the
authenticated import closure of the exact-12 certificate families.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailFiveCenterDeletionBoundary
open ATailRobustApexCommonDeletion
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- If the first blocker center is omitted from the physical-apex row after
deleting `xv`, then deleting that blocker center preserves exact four-point
rows both at the blocker center itself and at the physical second apex.

This is a source-clean producer, not a contradiction: the first center equals
the deleted point, so a later lift must still produce a distinct retained
center before the common-deletion terminal can apply. -/
theorem xvDeletion_c1_not_mem_BO_yields_self_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source₁ source₂ : CarrierVertex D.A)
    (hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hcenter₁NeO :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠ S.oppApex2)
    (hnotSurvivesU₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hnotSurvivesU₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hsurvivesXv₁ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hsurvivesXv₂ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hc₁NotBO :
      let Hlate := lateFirstApexSystem R
      let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
      Hlate.centerAt source₁.1 source₁.2 ∉ BO) :
    let Hlate := lateFirstApexSystem R
    let c₁ := Hlate.centerAt source₁.1 source₁.2
    Nonempty (CommonDeletionTwoCenterPacket D Hlate c₁ c₁ S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
  let c₁ := Hlate.centerAt source₁.1 source₁.2
  let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
  change c₁ ∉ BO at hc₁NotBO
  change Nonempty (CommonDeletionTwoCenterPacket D Hlate c₁ c₁ S.oppApex2)
  rcases pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u
      Q source₁ source₂ hsource₁Outside hsource₂Outside
      hnotSurvivesU₁ hnotSurvivesU₂ hsurvivesXv₁ hsurvivesXv₂ with
    ⟨C₁, _C₂, CO, _huK₁, _huK₂, _huBO, hBOCard,
      _hsource₁K₁, _hsource₂K₂⟩
  have hc₁A : c₁ ∈ D.A := by
    exact (Finset.mem_erase.mp K₁.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  let Kc₁ : SelectedFourClass D.A c₁ :=
    qDeletedK4ClassToSelectedFourClass C₁ K₁.support_card
  let KO : SelectedFourClass D.A S.oppApex2 :=
    qDeletedK4ClassToSelectedFourClass CO hBOCard
  have hsurvivesC₁ :
      HasNEquidistantPointsAt 4 (D.A.erase c₁) c₁ :=
    selectedFourClass_survives_erase_of_not_mem Kc₁ Kc₁.center_not_mem
  have hsurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase c₁) S.oppApex2 :=
    selectedFourClass_survives_erase_of_not_mem KO (by
      simpa only [KO, qDeletedK4ClassToSelectedFourClass] using hc₁NotBO)
  exact nonempty_commonDeletionTwoCenterPacket Hlate hc₁A hc₁A hOA
    hcenter₁NeO hsurvivesC₁ hsurvivesO

/-- The fixed physical source pair in the `u`-deletion arm supplies the exact
five-way robust-apex continuation surface.  This theorem performs only the
canonical CD7 reduction; excluding the resulting continuation packet remains
the unbounded A7 geometric terminal. -/
theorem nonempty_fixedPhysicalPair_uDeletion_fiveIncidenceContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
    let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
    let Kxu :=
      (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
    let Kdeleted :=
      (Hlate.selectedAt sourceDeleted.1 sourceDeleted.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
    let c₁ := Hlate.centerAt sourceXu.1 sourceXu.2
    let c₂ := Hlate.centerAt sourceDeleted.1 sourceDeleted.2
    Nonempty
      (RobustApexFiveIncidenceContinuationPacket
        D Hlate S.oppApex2 c₁ c₂ sourceDeleted.1
          BO Kxu.support Kdeleted.support) := by
  exact
    pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_fiveIncidenceContinuation
      Q

/-- The failed-after-`u`, surviving-after-`xv` source pair supplies the exact
five-way robust-apex continuation surface.  The packet retains the canonical
late-row supports and their common point `u`; excluding its five continuation
arms is the cap-sensitive A8 terminal. -/
theorem nonempty_xvDeletion_fiveIncidenceContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source₁ source₂ : CarrierVertex D.A)
    (hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hcenters :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
        (lateFirstApexSystem R).centerAt source₂.1 source₂.2)
    (hcenter₁NeO :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠ S.oppApex2)
    (hcenter₂NeO :
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠ S.oppApex2)
    (hnotSurvivesU₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hnotSurvivesU₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hsurvivesXv₁ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hsurvivesXv₂ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
    let c₁ := Hlate.centerAt source₁.1 source₁.2
    let c₂ := Hlate.centerAt source₂.1 source₂.2
    Nonempty
      (RobustApexFiveIncidenceContinuationPacket
        D Hlate S.oppApex2 c₁ c₂ P.u.1 BO K₁.support K₂.support) := by
  classical
  let Hlate := lateFirstApexSystem R
  let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
  let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
  let c₁ := Hlate.centerAt source₁.1 source₁.2
  let c₂ := Hlate.centerAt source₂.1 source₂.2
  change
    Nonempty
      (RobustApexFiveIncidenceContinuationPacket
        D Hlate S.oppApex2 c₁ c₂ P.u.1 BO K₁.support K₂.support)
  rcases pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u
      Q source₁ source₂ hsource₁Outside hsource₂Outside
      hnotSurvivesU₁ hnotSurvivesU₂ hsurvivesXv₁ hsurvivesXv₂ with
    ⟨C₁, C₂, CO, huK₁, huK₂, huBO, hBOCard,
      _hsource₁K₁, _hsource₂K₂⟩
  have hc₁A : c₁ ∈ D.A := by
    exact (Finset.mem_erase.mp K₁.center_mem).2
  have hc₂A : c₂ ∈ D.A := by
    exact (Finset.mem_erase.mp K₂.center_mem).2
  let KO : SelectedFourClass D.A S.oppApex2 :=
    qDeletedK4ClassToSelectedFourClass CO hBOCard
  let Kc₁ : SelectedFourClass D.A c₁ :=
    qDeletedK4ClassToSelectedFourClass C₁ K₁.support_card
  let Kc₂ : SelectedFourClass D.A c₂ :=
    qDeletedK4ClassToSelectedFourClass C₂ K₂.support_card
  let surface : RobustApexThreeRowSurface D S.oppApex2 c₁ c₂ P.u.1 :=
    { O_mem_A := P.surface.ingress.packet.center₂_mem_A
      c₁_mem_A := hc₁A
      c₂_mem_A := hc₂A
      O_ne_c₁ := hcenter₁NeO.symm
      O_ne_c₂ := hcenter₂NeO.symm
      c₁_ne_c₂ := hcenters
      robustO := P.surface.secondApex_robust
      row₀ := KO
      row₁ := Kc₁
      row₂ := Kc₂
      a_mem_row₀ := by
        simpa only [KO, qDeletedK4ClassToSelectedFourClass] using huBO }
  have huKc₁ : P.u.1 ∈ Kc₁.support := by
    simpa only [Kc₁, qDeletedK4ClassToSelectedFourClass] using huK₁
  have huKc₂ : P.u.1 ∈ Kc₂.support := by
    simpa only [Kc₂, qDeletedK4ClassToSelectedFourClass] using huK₂
  rcases
      nonempty_robustApexFiveIncidenceContinuation_of_commonPoint
        Hlate surface huKc₁ huKc₂ with
    ⟨continuation⟩
  exact ⟨
    { surface := surface
      row₀_support_eq := rfl
      row₁_support_eq := rfl
      row₂_support_eq := rfl
      a_mem_row₁ := huKc₁
      a_mem_row₂ := huKc₂
      continuation := continuation }⟩

end ATailFrontierLiveClosure
end Problem97
