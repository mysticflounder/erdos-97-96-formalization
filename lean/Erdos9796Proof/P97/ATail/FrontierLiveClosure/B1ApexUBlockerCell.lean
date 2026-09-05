/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LiveSharedPairNonalternationIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LocalRolePacket

/-!
# B1 apex-to-u-blocker cell

This module records the smallest source-facing test of the four-center square
arm in which the erased point is the physical second apex and its actual
blocker is the named `u` blocker.  In the exact card-six role packet the cell
forces the apex to be one of the two named completion roles of the `u` row.

The available convex-boundary machinery does not eliminate that alias.  It
forces the two points shared by the physical row and the `u` row onto opposite
open arcs between their centers.  A same-arc statement is therefore the first
additional order antecedent needed by this local route.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailPhysicalSecondApexCommonDeletion
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The branch-local facts for the apex square with its canonical actual
blocker identified with the `u` blocker.  The omission is retained explicitly
because it is the source provenance of survival after erasing the apex. -/
def B1ApexUBlockerCell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  let Hlate := lateFirstApexSystem C.R
  S.oppApex2 ∉
      ((Hlate.selectedAt
        C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support) ∧
    Hlate.centerAt S.oppApex2 (b1_oppApex2_mem_A S) =
      Hlate.centerAt C.u.1 C.u.2

/-- Checked output of the finite incidence and convex-boundary test. -/
structure B1ApexUBlockerCardSixTestOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1CardSixLocalRolePacket C) : Prop where
  convex_independent : ConvexIndep D.A
  commonRow_omits_apex :
    S.oppApex2 ∉
      ((lateFirstApexSystem C.R).selectedAt
        C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support
  commonBlocker_survives_apexDeletion :
    HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2)
      ((lateFirstApexSystem C.R).centerAt
        C.first.deleted.1 C.first.deleted.2)
  uPacket_firstRow_support_eq :
    C.first.uPacket.B₁ =
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.support
  uPacket_firstRow_card : C.first.uPacket.B₁.card = 4
  uPacket_secondRow_card : C.first.uPacket.B₂.card = 4
  uPacket_firstRow_equalDistances :
    ∀ z ∈ C.first.uPacket.B₁,
      dist ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2) z =
        C.first.uPacket.row₁.radius
  uPacket_secondRow_equalDistances :
    ∀ z ∈ C.first.uPacket.B₂,
      dist S.oppApex2 z = C.first.uPacket.row₂.radius
  apex_completion_alias :
    P.physicalApex = P.uL ∨ P.physicalApex = P.uR
  alternating_boundary :
    ∃ B : BoundaryIndexing D.A,
      ¬ B1SliceSameBoundaryArc B P.physicalApex P.Bu
        (((lateFirstApexSystem C.R).selectedAt
          C.u.1 C.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 C.rho)

private theorem physicalApex_ne_uBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1CardSixLocalRolePacket C) : P.physicalApex ≠ P.Bu := by
  intro h
  apply C.first.uPacket.centers_ne
  simpa [B1CardSixLocalRolePacket.physicalApex,
    B1CardSixLocalRolePacket.Bu] using (congrArg Subtype.val h).symm

private theorem apex_mem_uRow_of_cell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (hcell : B1ApexUBlockerCell C) :
    S.oppApex2 ∈
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.support := by
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq
      (lateFirstApexSystem C.R) (b1_oppApex2_mem_A S) C.u.2 hcell.2
  rw [← hsupports]
  exact ((lateFirstApexSystem C.R).selectedAt
    S.oppApex2 (b1_oppApex2_mem_A S)).toCriticalFourShell.q_mem_support

private theorem apex_completion_alias_of_cell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1CardSixLocalRolePacket C)
    (hcell : B1ApexUBlockerCell C) :
    P.physicalApex = P.uL ∨ P.physicalApex = P.uR := by
  have hapexRow := apex_mem_uRow_of_cell hcell
  have hapexNotPhysical :
      S.oppApex2 ∉ SelectedClass D.A S.oppApex2 C.rho := by
    intro hapex
    have hdist := (mem_selectedClass.mp hapex).2
    rw [dist_self] at hdist
    exact (ne_of_gt C.hrho) hdist.symm
  have hapexCompletion :
      S.oppApex2 ∈
        ((lateFirstApexSystem C.R).selectedAt
          C.u.1 C.u.2).toCriticalFourShell.support \
          SelectedClass D.A S.oppApex2 C.rho :=
    Finset.mem_sdiff.mpr ⟨hapexRow, hapexNotPhysical⟩
  rw [P.uCompletion.complement_eq] at hapexCompletion
  have halias :
      S.oppApex2 = P.uL.1 ∨ S.oppApex2 = P.uR.1 := by
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hapexCompletion
  rcases halias with hleft | hright
  · left
    apply Subtype.ext
    simpa [B1CardSixLocalRolePacket.physicalApex] using hleft
  · right
    apply Subtype.ext
    simpa [B1CardSixLocalRolePacket.physicalApex] using hright

private theorem exists_alternating_uSlice_boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1CardSixLocalRolePacket C) :
    ∃ B : BoundaryIndexing D.A,
      ¬ B1SliceSameBoundaryArc B P.physicalApex P.Bu
        (((lateFirstApexSystem C.R).selectedAt
          C.u.1 C.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 C.rho) := by
  have hthree : 3 ≤ D.A.card :=
    le_trans (by norm_num : 3 ≤ 12) C.hcard
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three hthree
  obtain ⟨B⟩ := exists_boundaryIndexing D.convex hnoncoll
  refine ⟨B, ?_⟩
  intro hsame
  let K := ((lateFirstApexSystem C.R).selectedAt
    C.u.1 C.u.2).toCriticalFourShell
  have hsliceCard :
      (K.support ∩ SelectedClass D.A S.oppApex2 C.rho).card = 2 := by
    rw [P.uPhysical.slice_eq]
    simp [P.uPhysical.source_ne_other]
  exact false_of_criticalShell_slice_card_two_of_sameBoundaryArc
    B P.physicalApex P.Bu (physicalApex_ne_uBlocker P)
      C.hrho K hsliceCard hsame

/-- The `X = apex`, `centerAt apex = bu` card-six cell remains in the
alternating cyclic branch.  The source packet reduces it to one of two named
completion aliases but supplies no same-arc contradiction. -/
theorem b1ApexUBlockerCardSix_testOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1CardSixLocalRolePacket C)
    (hcell : B1ApexUBlockerCell C) :
    B1ApexUBlockerCardSixTestOutcome P where
  convex_independent := D.convex
  commonRow_omits_apex := hcell.1
  commonBlocker_survives_apexDeletion :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem C.R) C.first.deleted.2).mpr hcell.1
  uPacket_firstRow_support_eq :=
    firstRow_support_eq_criticalShell_of_center_eq
      C.first.uPacket C.u.2 rfl
  uPacket_firstRow_card := C.first.uPacket.B₁_card
  uPacket_secondRow_card := C.first.uPacket.B₂_card
  uPacket_firstRow_equalDistances := C.first.uPacket.row₁.same_radius
  uPacket_secondRow_equalDistances := C.first.uPacket.row₂.same_radius
  apex_completion_alias := apex_completion_alias_of_cell P hcell
  alternating_boundary := exists_alternating_uSlice_boundary P

end ATailFrontierLiveClosure
end Problem97
