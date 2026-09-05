/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LiveSharedPairNonalternationIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LocalRolePacket
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# B1 apex-to-u-blocker cell

This module records the smallest source-facing test of the four-center square
arm in which the erased point is the physical second apex and its actual
blocker is the named `u` blocker.  In the exact card-six role packet the cell
forces the apex to be one of the two named completion roles of the `u` row.

The conditional source reduction forces the two points shared by the physical
row and the `u` row onto opposite open arcs between their centers.  A separate
exact rational witness below shows that the corresponding local incidence,
distance, deletion, and convex-order projection is consistent.  This local
witness does not construct a `CounterexampleData` value.
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
  reverse_u_mem_apex_selectedSupport :
    C.u.1 ∈
      ((lateFirstApexSystem C.R).selectedAt
        S.oppApex2 (b1_oppApex2_mem_A S)).toCriticalFourShell.support
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

private theorem u_mem_apex_selectedSupport_of_cell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (hcell : B1ApexUBlockerCell C) :
    C.u.1 ∈
      ((lateFirstApexSystem C.R).selectedAt
        S.oppApex2 (b1_oppApex2_mem_A S)).toCriticalFourShell.support := by
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq
      (lateFirstApexSystem C.R) (b1_oppApex2_mem_A S) C.u.2 hcell.2
  rw [hsupports]
  exact ((lateFirstApexSystem C.R).selectedAt
    C.u.1 C.u.2).toCriticalFourShell.q_mem_support

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

/-- Conditional consequences of the `X = apex`, `centerAt apex = bu`
card-six cell.  This theorem assumes the cell and does not decide whether that
assumption is consistent. -/
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
  reverse_u_mem_apex_selectedSupport := u_mem_apex_selectedSupport_of_cell hcell
  apex_completion_alias := apex_completion_alias_of_cell P hcell
  alternating_boundary := exists_alternating_uSlice_boundary P

/- ## Exact rational abstract local pattern

This namespace supplies an independent consistency test for the finite facts
used by this lane: the six-point physical circle, the four-point `u` row, the
four-point common row, survival of the common row after deleting the apex, and
a CCW convex-boundary order in which the two physical/`u` intersection points
alternate between the two centers.  The certificate is not parameterized by
the source structures and intentionally makes no global
`HasNEquidistantProperty` claim. -/

namespace B1ApexUBlockerRationalTest

noncomputable section

def point (x y : ℝ) : ℝ² :=
  (EuclideanSpace.equiv (Fin 2) ℝ).symm ![x, y]

@[simp] theorem point_apply_zero (x y : ℝ) : point x y 0 = x := by
  simp [point]

@[simp] theorem point_apply_one (x y : ℝ) : point x y 1 = y := by
  simp [point]

def apex : ℝ² := point 0 0
def uLow : ℝ² := point (3 / 5) (-(4 / 5))
def deleted : ℝ² := point (21 / 29) (-(20 / 29))
def vLow : ℝ² := point (4 / 5) (-(3 / 5))
def uBlocker : ℝ² := point (5 / 6) 0
def vHigh : ℝ² := point (4 / 5) (3 / 5)
def dHigh : ℝ² := point (21 / 29) (20 / 29)
def u : ℝ² := point (3 / 5) (4 / 5)
def uRight : ℝ² := point (1 / 3) (2 / 3)
def commonBlocker : ℝ² := point (1 / 4) (-(21 / 20))
def common0 : ℝ² := point (-(234 / 725)) (-(643 / 725))
def common1 : ℝ² := point (-(501 / 1450)) (-(764 / 725))
def common2 : ℝ² := point (-(49 / 145)) (-(166 / 145))

/-- The orientation expected by the project's `IsCcwConvexPolygon` API. -/
def boundary : Fin 13 → ℝ² :=
  ![common0, apex, uRight, u, dHigh, vHigh, uBlocker,
    vLow, deleted, uLow, commonBlocker, common2, common1]

def rationalBoundary : Fin 13 → ℚ × ℚ :=
  ![(-(234 / 725), -(643 / 725)), (0, 0), (1 / 3, 2 / 3),
    (3 / 5, 4 / 5), (21 / 29, 20 / 29), (4 / 5, 3 / 5), (5 / 6, 0),
    (4 / 5, -(3 / 5)), (21 / 29, -(20 / 29)), (3 / 5, -(4 / 5)),
    (1 / 4, -(21 / 20)), (-(49 / 145), -(166 / 145)),
    (-(501 / 1450), -(764 / 725))]

def rationalSignedArea (i j k : Fin 13) : ℚ :=
  ((rationalBoundary j).1 - (rationalBoundary i).1) *
      ((rationalBoundary k).2 - (rationalBoundary i).2) -
    ((rationalBoundary k).1 - (rationalBoundary i).1) *
      ((rationalBoundary j).2 - (rationalBoundary i).2)

@[simp] theorem rationalBoundary_0 :
    rationalBoundary 0 = (-(234 / 725), -(643 / 725)) := by simp [rationalBoundary]
@[simp] theorem rationalBoundary_1 : rationalBoundary 1 = (0, 0) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_2 : rationalBoundary 2 = (1 / 3, 2 / 3) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_3 : rationalBoundary 3 = (3 / 5, 4 / 5) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_4 : rationalBoundary 4 = (21 / 29, 20 / 29) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_5 : rationalBoundary 5 = (4 / 5, 3 / 5) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_6 : rationalBoundary 6 = (5 / 6, 0) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_7 : rationalBoundary 7 = (4 / 5, -(3 / 5)) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_8 : rationalBoundary 8 = (21 / 29, -(20 / 29)) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_9 : rationalBoundary 9 = (3 / 5, -(4 / 5)) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_10 : rationalBoundary 10 = (1 / 4, -(21 / 20)) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_11 : rationalBoundary 11 = (-(49 / 145), -(166 / 145)) := by
  simp [rationalBoundary]
@[simp] theorem rationalBoundary_12 :
    rationalBoundary 12 = (-(501 / 1450), -(764 / 725)) := by simp [rationalBoundary]

def previous : Fin 13 → ℝ² :=
  ![common1, common0, apex, uRight, u, dHigh, vHigh,
    uBlocker, vLow, deleted, uLow, commonBlocker, common2]

def next : Fin 13 → ℝ² :=
  ![apex, uRight, u, dHigh, vHigh, uBlocker, vLow,
    deleted, uLow, commonBlocker, common2, common1, common0]

def carrier : Finset ℝ² := Finset.univ.image boundary

def physicalCircle : Finset ℝ² :=
  {uLow, deleted, vLow, vHigh, dHigh, u}

def uRow : Finset ℝ² := {apex, uLow, u, uRight}

def commonRow : Finset ℝ² := {deleted, common0, common1, common2}

def apexDeletedRow : Finset ℝ² := {uLow, vLow, vHigh, dHigh}

def squaredSupport (center : ℝ²) (radiusSq : ℝ) : Finset ℝ² :=
  carrier.filter fun z => dist center z ^ 2 = radiusSq

private theorem chordFunctional_linear (a b : ℝ²) :
    IsLinearMap ℝ (fun z : ℝ² =>
      (b 0 - a 0) * z 1 - (b 1 - a 1) * z 0) := by
  constructor
  · intro x y
    simp only [PiLp.add_apply]
    ring
  · intro c x
    simp only [PiLp.smul_apply, smul_eq_mul]
    ring

private theorem convexIndep_image_of_neighbor_separation
    {n : ℕ} (point prev succ : Fin n → ℝ²)
    (hself : ∀ i, 0 < signedArea2 (prev i) (succ i) (point i))
    (hother : ∀ i j, j ≠ i →
      signedArea2 (prev i) (succ i) (point j) ≤ 0) :
    ConvexIndep (Finset.univ.image point) := by
  intro x hx hxHull
  have hxImage : x ∈ Finset.univ.image point := by exact hx
  obtain ⟨i, -, rfl⟩ := Finset.mem_image.mp hxImage
  let halfPlane : Set ℝ² :=
    {z | signedArea2 (prev i) (succ i) z ≤ 0}
  have hsubset :
      ((Finset.univ.image point : Finset ℝ²) : Set ℝ²) \ {point i} ⊆
        halfPlane := by
    intro z hz
    have hzImage : z ∈ Finset.univ.image point := by exact hz.1
    obtain ⟨j, -, rfl⟩ := Finset.mem_image.mp hzImage
    exact hother i j (by
      rintro rfl
      exact hz.2 rfl)
  have hconvex : Convex ℝ halfPlane := by
    have hlinear := chordFunctional_linear (prev i) (succ i)
    have hhalf := convex_halfSpace_le hlinear
      ((succ i 0 - prev i 0) * prev i 1 -
        (succ i 1 - prev i 1) * prev i 0)
    suffices halfPlane =
        {z : ℝ² |
          (succ i 0 - prev i 0) * z 1 -
            (succ i 1 - prev i 1) * z 0 ≤
              (succ i 0 - prev i 0) * prev i 1 -
                (succ i 1 - prev i 1) * prev i 0} by
      simpa [this] using hhalf
    ext z
    simp only [halfPlane, Set.mem_setOf_eq, signedArea2]
    constructor <;> intro hz <;> nlinarith
  have hiHalf : point i ∈ halfPlane :=
    convexHull_min hsubset hconvex hxHull
  exact (not_le_of_gt (hself i)) hiHalf

set_option maxHeartbeats 1000000 in
-- The explicit `Fin 13` separation table expands to 169 arithmetic goals.
theorem boundary_neighbor_separation :
    (∀ i, 0 < signedArea2 (previous i) (next i) (boundary i)) ∧
      (∀ i j, j ≠ i →
        signedArea2 (previous i) (next i) (boundary j) ≤ 0) := by
  constructor
  · intro i
    fin_cases i <;>
      norm_num [previous, next, boundary, signedArea2, point, apex, uLow, deleted,
        vLow, uBlocker, vHigh, dHigh, u, uRight, commonBlocker, common0,
        common1, common2]
  · intro i j hij
    fin_cases i <;> fin_cases j <;>
      first
      | omega
      | norm_num [previous, next, boundary, signedArea2, point, apex, uLow,
          deleted, vLow, uBlocker, vHigh, dHigh, u, uRight, commonBlocker,
          common0, common1, common2]

theorem boundary_injective : Function.Injective boundary := by
  intro i j hij
  by_contra hne
  have hpos := boundary_neighbor_separation.1 i
  have hnonpos := boundary_neighbor_separation.2 i j (Ne.symm hne)
  rw [← hij] at hnonpos
  linarith

theorem boundary_eq_rationalPoint (i : Fin 13) :
    boundary i = point (rationalBoundary i).1 (rationalBoundary i).2 := by
  fin_cases i <;>
    norm_num [boundary, rationalBoundary, point, apex, uLow, deleted, vLow,
      uBlocker, vHigh, dHigh, u, uRight, commonBlocker, common0, common1,
      common2]

private theorem rationalBoundary_hneg_0 {j k : Fin 13}
    (hij : (0 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 0 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_1 {j k : Fin 13}
    (hij : (1 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 1 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_2 {j k : Fin 13}
    (hij : (2 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 2 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_3 {j k : Fin 13}
    (hij : (3 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 3 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_4 {j k : Fin 13}
    (hij : (4 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 4 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_5 {j k : Fin 13}
    (hij : (5 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 5 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_6 {j k : Fin 13}
    (hij : (6 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 6 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_7 {j k : Fin 13}
    (hij : (7 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 7 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_8 {j k : Fin 13}
    (hij : (8 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 8 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_9 {j k : Fin 13}
    (hij : (9 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 9 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_10 {j k : Fin 13}
    (hij : (10 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 10 j k < 0 := by
  fin_cases j <;> fin_cases k <;>
    simp at hij hjk
  all_goals simp [rationalSignedArea]
  all_goals norm_num [rationalBoundary]
private theorem rationalBoundary_hneg_11 {j k : Fin 13}
    (hij : (11 : Fin 13) < j) (hjk : j < k) : rationalSignedArea 11 j k < 0 := by
  omega
private theorem rationalBoundary_hneg_12 {j k : Fin 13}
    (hij : (12 : Fin 13) < j) (_hjk : j < k) : rationalSignedArea 12 j k < 0 := by
  omega

theorem rationalBoundary_hneg :
    ∀ {i j k : Fin 13}, i < j → j < k → rationalSignedArea i j k < 0 := by
  intro i j k hij hjk
  fin_cases i
  · exact rationalBoundary_hneg_0 hij hjk
  · exact rationalBoundary_hneg_1 hij hjk
  · exact rationalBoundary_hneg_2 hij hjk
  · exact rationalBoundary_hneg_3 hij hjk
  · exact rationalBoundary_hneg_4 hij hjk
  · exact rationalBoundary_hneg_5 hij hjk
  · exact rationalBoundary_hneg_6 hij hjk
  · exact rationalBoundary_hneg_7 hij hjk
  · exact rationalBoundary_hneg_8 hij hjk
  · exact rationalBoundary_hneg_9 hij hjk
  · exact rationalBoundary_hneg_10 hij hjk
  · exact rationalBoundary_hneg_11 hij hjk
  · exact rationalBoundary_hneg_12 hij hjk

theorem signedArea_boundary_eq_rationalSignedArea (i j k : Fin 13) :
    signedArea2 (boundary i) (boundary j) (boundary k) =
      (rationalSignedArea i j k : ℝ) := by
  rw [boundary_eq_rationalPoint, boundary_eq_rationalPoint,
    boundary_eq_rationalPoint]
  simp only [signedArea2, point_apply_zero, point_apply_one, rationalSignedArea,
    Rat.cast_sub, Rat.cast_mul]

theorem boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
  apply ccw_of_hneg boundary_injective
  intro i j k hij hjk
  rw [signedArea_boundary_eq_rationalSignedArea]
  exact_mod_cast rationalBoundary_hneg hij hjk

theorem carrier_convexIndependent : ConvexIndep carrier := by
  exact convexIndep_image_of_neighbor_separation boundary previous next
    boundary_neighbor_separation.1 boundary_neighbor_separation.2

theorem mem_carrier_iff (z : ℝ²) :
    z ∈ carrier ↔
      z = common0 ∨ z = apex ∨ z = uRight ∨ z = u ∨ z = dHigh ∨
      z = vHigh ∨ z = uBlocker ∨ z = vLow ∨ z = deleted ∨
      z = uLow ∨ z = commonBlocker ∨ z = common2 ∨ z = common1 := by
  constructor
  · intro hz
    simp only [carrier, Finset.mem_image, Finset.mem_univ, true_and] at hz
    obtain ⟨i, rfl⟩ := hz
    fin_cases i <;> simp [boundary]
  · intro hz
    simp only [carrier, Finset.mem_image, Finset.mem_univ, true_and]
    rcases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
        rfl | rfl | rfl | rfl
    · exact ⟨0, by simp [boundary]⟩
    · exact ⟨1, by simp [boundary]⟩
    · exact ⟨2, by simp [boundary]⟩
    · exact ⟨3, by simp [boundary]⟩
    · exact ⟨4, by simp [boundary]⟩
    · exact ⟨5, by simp [boundary]⟩
    · exact ⟨6, by simp [boundary]⟩
    · exact ⟨7, by simp [boundary]⟩
    · exact ⟨8, by simp [boundary]⟩
    · exact ⟨9, by simp [boundary]⟩
    · exact ⟨10, by simp [boundary]⟩
    · exact ⟨11, by simp [boundary]⟩
    · exact ⟨12, by simp [boundary]⟩

theorem physicalCircle_exact : squaredSupport apex 1 = physicalCircle := by
  ext z
  simp only [squaredSupport, Finset.mem_filter]
  rw [mem_carrier_iff]
  simp only [physicalCircle, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hz, hradius⟩
    rcases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
        rfl | rfl | rfl | rfl
    all_goals
      norm_num [dist_sq_coord, point, apex, uLow, deleted, vLow, uBlocker,
        vHigh, dHigh, u, uRight, commonBlocker, common0, common1, common2]
        at hradius
    all_goals simp
  · intro hz
    rcases hz with rfl | rfl | rfl | rfl | rfl | rfl
    all_goals
      constructor
      · aesop
      · norm_num [dist_sq_coord, point, apex, uLow, deleted, vLow, uBlocker,
          vHigh, dHigh, u, uRight, commonBlocker, common0, common1, common2]

theorem uRow_exact : squaredSupport uBlocker (25 / 36) = uRow := by
  ext z
  simp only [squaredSupport, Finset.mem_filter]
  rw [mem_carrier_iff]
  simp only [uRow, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hz, hradius⟩
    rcases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
        rfl | rfl | rfl | rfl
    all_goals
      norm_num [dist_sq_coord, point, apex, uLow, deleted, vLow, uBlocker,
        vHigh, dHigh, u, uRight, commonBlocker, common0, common1, common2]
        at hradius
    all_goals simp
  · intro hz
    rcases hz with rfl | rfl | rfl | rfl
    all_goals
      constructor
      · aesop
      · norm_num [dist_sq_coord, point, apex, uLow, deleted, vLow, uBlocker,
          vHigh, dHigh, u, uRight, commonBlocker, common0, common1, common2]

theorem commonRow_exact :
    squaredSupport commonBlocker (2057 / 5800) = commonRow := by
  ext z
  simp only [squaredSupport, Finset.mem_filter]
  rw [mem_carrier_iff]
  simp only [commonRow, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hz, hradius⟩
    rcases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
        rfl | rfl | rfl | rfl
    all_goals
      norm_num [dist_sq_coord, point, apex, uLow, deleted, vLow, uBlocker,
        vHigh, dHigh, u, uRight, commonBlocker, common0, common1, common2]
        at hradius
    all_goals simp
  · intro hz
    rcases hz with rfl | rfl | rfl | rfl
    all_goals
      constructor
      · aesop
      · norm_num [dist_sq_coord, point, apex, uLow, deleted, vLow, uBlocker,
          vHigh, dHigh, u, uRight, commonBlocker, common0, common1, common2]

private theorem dist_eq_of_sq_eq {x y : ℝ²} {center : ℝ²}
    (h : dist center x ^ 2 = dist center y ^ 2) :
    dist center x = dist center y := by
  have hx : 0 ≤ dist center x := dist_nonneg
  have hy : 0 ≤ dist center y := dist_nonneg
  nlinarith

theorem physicalCircle_sameRadius :
    ∀ z ∈ physicalCircle, dist apex z = dist apex u := by
  intro z hz
  apply dist_eq_of_sq_eq
  have hzSupport : z ∈ squaredSupport apex 1 := by
    rw [physicalCircle_exact]
    exact hz
  have huSupport : u ∈ squaredSupport apex 1 := by
    rw [physicalCircle_exact]
    simp [physicalCircle]
  exact (Finset.mem_filter.mp hzSupport).2.trans
    (Finset.mem_filter.mp huSupport).2.symm

theorem uRow_sameRadius :
    ∀ z ∈ uRow, dist uBlocker z = dist uBlocker apex := by
  intro z hz
  apply dist_eq_of_sq_eq
  have hzSupport : z ∈ squaredSupport uBlocker (25 / 36) := by
    rw [uRow_exact]
    exact hz
  have hapexSupport : apex ∈ squaredSupport uBlocker (25 / 36) := by
    rw [uRow_exact]
    simp [uRow]
  exact (Finset.mem_filter.mp hzSupport).2.trans
    (Finset.mem_filter.mp hapexSupport).2.symm

theorem commonRow_sameRadius :
    ∀ z ∈ commonRow,
      dist commonBlocker z = dist commonBlocker deleted := by
  intro z hz
  apply dist_eq_of_sq_eq
  have hzSupport : z ∈ squaredSupport commonBlocker (2057 / 5800) := by
    rw [commonRow_exact]
    exact hz
  have hdeletedSupport :
      deleted ∈ squaredSupport commonBlocker (2057 / 5800) := by
    rw [commonRow_exact]
    simp [commonRow]
  exact (Finset.mem_filter.mp hzSupport).2.trans
    (Finset.mem_filter.mp hdeletedSupport).2.symm

theorem carrier_card : carrier.card = 13 := by
  rw [carrier, Finset.card_image_of_injective _ boundary_injective]
  simp

theorem physicalCircle_card : physicalCircle.card = 6 := by
  norm_num [physicalCircle, point, apex, uLow, deleted, vLow, vHigh, dHigh, u]

theorem uRow_card : uRow.card = 4 := by
  norm_num [uRow, point, apex, uLow, u, uRight]

theorem commonRow_card : commonRow.card = 4 := by
  norm_num [commonRow, point, deleted, common0, common1, common2]

theorem apexDeletedRow_card : apexDeletedRow.card = 4 := by
  norm_num [apexDeletedRow, point, uLow, vLow, vHigh, dHigh]

theorem uRow_subset_delete : uRow ⊆ carrier.erase deleted := by
  intro z hz
  have hcarrier : z ∈ carrier := by
    rw [mem_carrier_iff]
    simp only [uRow, Finset.mem_insert, Finset.mem_singleton] at hz
    aesop
  have hne : z ≠ deleted := by
    simp only [uRow, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl <;>
      norm_num [point, apex, uLow, u, uRight, deleted]
  exact Finset.mem_erase.mpr ⟨hne, hcarrier⟩

theorem apexDeletedRow_subset_delete :
    apexDeletedRow ⊆ carrier.erase deleted := by
  intro z hz
  have hcarrier : z ∈ carrier := by
    rw [mem_carrier_iff]
    simp only [apexDeletedRow, Finset.mem_insert, Finset.mem_singleton] at hz
    aesop
  have hne : z ≠ deleted := by
    simp only [apexDeletedRow, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl <;>
      norm_num [point, uLow, vLow, vHigh, dHigh, deleted]
  exact Finset.mem_erase.mpr ⟨hne, hcarrier⟩

theorem apexDeletedRow_sameRadius :
    ∀ z ∈ apexDeletedRow, dist apex z = dist apex u := by
  intro z hz
  apply physicalCircle_sameRadius z
  simp only [apexDeletedRow, Finset.mem_insert, Finset.mem_singleton] at hz
  simp only [physicalCircle, Finset.mem_insert, Finset.mem_singleton]
  aesop

theorem commonRow_subset_apexDeletion :
    commonRow ⊆ carrier.erase apex := by
  intro z hz
  have hcarrier : z ∈ carrier := by
    rw [mem_carrier_iff]
    simp only [commonRow, Finset.mem_insert, Finset.mem_singleton] at hz
    aesop
  have hne : z ≠ apex := by
    simp only [commonRow, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl <;>
      norm_num [point, deleted, common0, common1, common2, apex]
  exact Finset.mem_erase.mpr ⟨hne, hcarrier⟩

private theorem hasFour_of_row
    {A B : Finset ℝ²} {center anchor : ℝ²}
    (hsubset : B ⊆ A) (hcard : B.card = 4)
    (hsame : ∀ z ∈ B, dist center z = dist center anchor)
    (hne : center ≠ anchor) : HasNEquidistantPointsAt 4 A center := by
  refine ⟨dist center anchor, dist_pos.mpr hne, ?_⟩
  have hfilter : B ⊆ A.filter fun z => dist center z = dist center anchor := by
    intro z hz
    exact Finset.mem_filter.mpr ⟨hsubset hz, hsame z hz⟩
  have hle := Finset.card_le_card hfilter
  omega

theorem uRow_survives_deleted :
    HasNEquidistantPointsAt 4 (carrier.erase deleted) uBlocker := by
  apply hasFour_of_row uRow_subset_delete uRow_card uRow_sameRadius
  norm_num [point, uBlocker, apex]

theorem apexDeletedRow_survives_deleted :
    HasNEquidistantPointsAt 4 (carrier.erase deleted) apex := by
  apply hasFour_of_row apexDeletedRow_subset_delete apexDeletedRow_card
    apexDeletedRow_sameRadius
  norm_num [point, apex, u]

theorem commonRow_survives_apexDeletion :
    HasNEquidistantPointsAt 4 (carrier.erase apex) commonBlocker := by
  apply hasFour_of_row commonRow_subset_apexDeletion commonRow_card
    commonRow_sameRadius
  norm_num [point, commonBlocker, deleted]

theorem uPacket_overlap_le_two :
    (uRow ∩ apexDeletedRow).card ≤ 2 := by
  norm_num [uRow, apexDeletedRow, point, apex, uLow, u, uRight, vLow, vHigh,
    dHigh]

theorem mutual_canonical_hits : apex ∈ uRow ∧ u ∈ uRow := by
  simp [uRow]

theorem alternating_boundary_positions :
    boundary 1 = apex ∧ boundary 3 = u ∧ boundary 6 = uBlocker ∧
      boundary 9 = uLow := by
  simp [boundary]

theorem physical_u_intersection :
    physicalCircle ∩ uRow = {uLow, u} := by
  ext z
  simp only [Finset.mem_inter, physicalCircle, uRow, Finset.mem_insert,
    Finset.mem_singleton]
  constructor
  · rintro ⟨hphysical, huRow⟩
    rcases huRow with rfl | rfl | rfl | rfl
    · norm_num [point, apex, uLow, deleted, vLow, vHigh, dHigh, u] at hphysical
    · aesop
    · aesop
    · norm_num [point, uRight, uLow, deleted, vLow, vHigh, dHigh, u] at hphysical
  · aesop

theorem commonRow_omits_apex : apex ∉ commonRow := by
  norm_num [commonRow, point, apex, deleted, common0, common1, common2]

theorem deleted_omitted_from_uPacketRows :
    deleted ∉ uRow ∧ deleted ∉ apexDeletedRow := by
  norm_num [uRow, apexDeletedRow, point, apex, uLow, u, uRight, deleted,
    vLow, vHigh, dHigh]

/-- Kernel-checked satisfiability certificate for an abstract local pattern
matching the tested source equations.  It is not a typed projection from a
`CounterexampleData` value. -/
structure AbstractLocalPatternCertificate : Prop where
  carrier_card_exact : carrier.card = 13
  carrier_convex_independent : ConvexIndep carrier
  boundary_injective : Function.Injective boundary
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  strict_neighbor_order :
    (∀ i, 0 < signedArea2 (previous i) (next i) (boundary i)) ∧
      (∀ i j, j ≠ i →
        signedArea2 (previous i) (next i) (boundary j) ≤ 0)
  alternating_positions :
    boundary 1 = apex ∧ boundary 3 = u ∧ boundary 6 = uBlocker ∧
      boundary 9 = uLow
  physical_support_exact : squaredSupport apex 1 = physicalCircle
  physical_support_card : physicalCircle.card = 6
  selected_u_support_exact : squaredSupport uBlocker (25 / 36) = uRow
  selected_u_support_card : uRow.card = 4
  selected_u_support_sameRadius :
    ∀ z ∈ uRow, dist uBlocker z = dist uBlocker apex
  canonical_mutual_hits : apex ∈ uRow ∧ u ∈ uRow
  physical_u_shared_pair : physicalCircle ∩ uRow = {uLow, u}
  common_support_exact :
    squaredSupport commonBlocker (2057 / 5800) = commonRow
  common_support_card : commonRow.card = 4
  common_support_sameRadius :
    ∀ z ∈ commonRow,
      dist commonBlocker z = dist commonBlocker deleted
  common_support_subset_apex_deletion : commonRow ⊆ carrier.erase apex
  common_row_survives_apex_deletion :
    HasNEquidistantPointsAt 4 (carrier.erase apex) commonBlocker
  common_support_omits_apex : apex ∉ commonRow
  uPacket_first_support_subset_deleted : uRow ⊆ carrier.erase deleted
  uPacket_second_support_subset_deleted : apexDeletedRow ⊆ carrier.erase deleted
  uPacket_first_row_survives_deleted :
    HasNEquidistantPointsAt 4 (carrier.erase deleted) uBlocker
  uPacket_second_row_survives_deleted :
    HasNEquidistantPointsAt 4 (carrier.erase deleted) apex
  uPacket_second_card : apexDeletedRow.card = 4
  uPacket_second_sameRadius :
    ∀ z ∈ apexDeletedRow, dist apex z = dist apex u
  uPacket_deleted_omitted :
    deleted ∉ uRow ∧ deleted ∉ apexDeletedRow
  uPacket_overlap_bound : (uRow ∩ apexDeletedRow).card ≤ 2

theorem rationalPattern_certificate : AbstractLocalPatternCertificate where
  carrier_card_exact := carrier_card
  carrier_convex_independent := carrier_convexIndependent
  boundary_injective := boundary_injective
  boundary_ccw := boundary_ccw
  strict_neighbor_order := boundary_neighbor_separation
  alternating_positions := alternating_boundary_positions
  physical_support_exact := physicalCircle_exact
  physical_support_card := physicalCircle_card
  selected_u_support_exact := uRow_exact
  selected_u_support_card := uRow_card
  selected_u_support_sameRadius := uRow_sameRadius
  canonical_mutual_hits := mutual_canonical_hits
  physical_u_shared_pair := physical_u_intersection
  common_support_exact := commonRow_exact
  common_support_card := commonRow_card
  common_support_sameRadius := commonRow_sameRadius
  common_support_subset_apex_deletion := commonRow_subset_apexDeletion
  common_row_survives_apex_deletion := commonRow_survives_apexDeletion
  common_support_omits_apex := commonRow_omits_apex
  uPacket_first_support_subset_deleted := uRow_subset_delete
  uPacket_second_support_subset_deleted := apexDeletedRow_subset_delete
  uPacket_first_row_survives_deleted := uRow_survives_deleted
  uPacket_second_row_survives_deleted := apexDeletedRow_survives_deleted
  uPacket_second_card := apexDeletedRow_card
  uPacket_second_sameRadius := apexDeletedRow_sameRadius
  uPacket_deleted_omitted := deleted_omitted_from_uPacketRows
  uPacket_overlap_bound := uPacket_overlap_le_two

end
end B1ApexUBlockerRationalTest

end ATailFrontierLiveClosure
end Problem97
