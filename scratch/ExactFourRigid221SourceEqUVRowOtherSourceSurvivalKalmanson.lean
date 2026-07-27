/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherMain

/-!
# Source-survival residual for the source-equals-u cross-row blocker leaf

The source context supplies a surviving critical four-row after erasing one
of the two named first-apex interior points.  Survival is equivalent to
omission from the source row.  This file records the exact four possibilities:
which deletion survives, and whether the other named interior point is
incident to the source row.

The first-apex rows through the two named interior points contain each other.
Those crossed incidences are retained explicitly so that a later Kalmanson
consumer sees the full available two-center input.  The present hypotheses
provide no joint cyclic-order placement of these two points against the
source-row pair; moreover, survival removes at least one of them from the
source row.  Thus the available CCW Kalmanson interfaces do not close this
leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The exact survival/other-incidence split at the source row.  Each
constructor includes both the original survival witness and the resulting
canonical erased-carrier support equality. -/
inductive ExactFourRigid221SourceEqUVRowOtherSurvivalCase
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop
  | eraseQ_bothOmitted
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt P.source.1 P.source.2))
      (exact_erased_support :
        SelectedClass (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            (((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius) =
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (unique_erased_radius :
        ∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            rho).card →
          rho =
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius)
      (q_omitted :
        R.interior_q ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (w_omitted :
        R.interior_w ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
  | eraseQ_wIncident
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt P.source.1 P.source.2))
      (exact_erased_support :
        SelectedClass (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            (((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius) =
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (unique_erased_radius :
        ∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            rho).card →
          rho =
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius)
      (q_omitted :
        R.interior_q ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (w_incident :
        R.interior_w ∈
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
  | eraseW_bothOmitted
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt P.source.1 P.source.2))
      (exact_erased_support :
        SelectedClass (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            (((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius) =
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (unique_erased_radius :
        ∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            rho).card →
          rho =
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius)
      (w_omitted :
        R.interior_w ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (q_omitted :
        R.interior_q ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
  | eraseW_qIncident
      (survives :
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt P.source.1 P.source.2))
      (exact_erased_support :
        SelectedClass (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            (((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius) =
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (unique_erased_radius :
        ∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
            rho).card →
          rho =
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius)
      (w_omitted :
        R.interior_w ∉
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (q_incident :
        R.interior_q ∈
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)

/-- Source-clean residual retaining the rigid-row terminal, the actual blocker
identity, both source-row named incidences, the crossed first-apex incidences,
and the exact source-survival case. -/
inductive ExactFourRigid221SourceEqUVRowOtherSourceSurvivalKalmansonResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop
  | mk
      (xu xv : ℝ²)
      (terminal :
        ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion P.globalDeletion xu xv)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
      (source_incident :
        P.source.1 ∈
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (xu_incident :
        xu ∈
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support)
      (w_incident_to_q_firstRow :
        R.interior_w ∈
          ((lateFirstApexSystem R).selectedAt
            R.interior_q (mem_selectedClass.mp
              (Finset.mem_inter.mp R.interior_q_mem).1).1).toCriticalFourShell.support)
      (q_incident_to_w_firstRow :
        R.interior_q ∈
          ((lateFirstApexSystem R).selectedAt
            R.interior_w (mem_selectedClass.mp
              (Finset.mem_inter.mp R.interior_w_mem).1).1).toCriticalFourShell.support)
      (survival_case : ExactFourRigid221SourceEqUVRowOtherSurvivalCase P)

/-- The live `sourceEqU_blockerVRowOther` leaf implies the exact four-way
source-survival residual. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_sourceSurvivalKalmansonResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    ExactFourRigid221SourceEqUVRowOtherSourceSurvivalKalmansonResidual P := by
  classical
  let Hlate := lateFirstApexSystem R
  obtain ⟨xu, xv, terminal, blocker_eq⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_packet
      P hblockerVRow hblockerNeV
  have hsource :
      P.source.1 ∈
        (Hlate.selectedAt
          P.source.1 P.source.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      P.source.1 P.source.2).toCriticalFourShell.q_mem_support
  have hxuU :
      xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    have hxuPair : xu ∈ ({P.u.1, xu} : Finset ℝ²) := by simp
    rw [← terminal.named_rows.u_row_trace] at hxuPair
    exact (Finset.mem_inter.mp hxuPair).1
  have hxu :
      xu ∈
        (Hlate.selectedAt
          P.source.1 P.source.2).toCriticalFourShell.support := by
    exact P.huSource ▸ hxuU
  have hqClass :
      R.interior_q ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp R.interior_q_mem).1
  have hwClass :
      R.interior_w ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp R.interior_w_mem).1
  have hqA : R.interior_q ∈ D.A := (mem_selectedClass.mp hqClass).1
  have hwA : R.interior_w ∈ D.A := (mem_selectedClass.mp hwClass).1
  have hwq :
      R.interior_w ∈
        (Hlate.selectedAt
          R.interior_q hqA).toCriticalFourShell.support := by
    rw [lateFirstApexSystem_support_eq_class R hqA hqClass]
    exact hwClass
  have hqw :
      R.interior_q ∈
        (Hlate.selectedAt
          R.interior_w hwA).toCriticalFourShell.support := by
    rw [lateFirstApexSystem_support_eq_class R hwA hwClass]
    exact hqClass
  apply ExactFourRigid221SourceEqUVRowOtherSourceSurvivalKalmansonResidual.mk
    xu xv terminal blocker_eq hsource hxu hwq hqw
  rcases P.context.source_survives_q_or_w with hsurvivesQ | hsurvivesW
  · have hqOmitted :
        R.interior_q ∉
          (Hlate.selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support :=
      (cross_deletion_survives_iff_not_mem_selected_support
        Hlate P.source.2).mp hsurvivesQ
    obtain ⟨hqExact, hqUnique⟩ :=
      cross_survival_unique_radius_and_exact_support
        Hlate P.source.2 hsurvivesQ
    by_cases hwIncident :
        R.interior_w ∈
          (Hlate.selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support
    · exact
        .eraseQ_wIncident
          hsurvivesQ hqExact hqUnique hqOmitted hwIncident
    · exact
        .eraseQ_bothOmitted
          hsurvivesQ hqExact hqUnique hqOmitted hwIncident
  · have hwOmitted :
        R.interior_w ∉
          (Hlate.selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support :=
      (cross_deletion_survives_iff_not_mem_selected_support
        Hlate P.source.2).mp hsurvivesW
    obtain ⟨hwExact, hwUnique⟩ :=
      cross_survival_unique_radius_and_exact_support
        Hlate P.source.2 hsurvivesW
    by_cases hqIncident :
        R.interior_q ∈
          (Hlate.selectedAt
            P.source.1 P.source.2).toCriticalFourShell.support
    · exact
        .eraseW_qIncident
          hsurvivesW hwExact hwUnique hwOmitted hqIncident
    · exact
        .eraseW_bothOmitted
          hsurvivesW hwExact hwUnique hwOmitted hqIncident

end ATailFrontierLiveClosure
end Problem97
