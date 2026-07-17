/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Actual-role five-point Kalmanson packet

This scratch module records a source-faithful instantiation of the production
five-point Kalmanson consumer.  The five geometric roles are fixed to the
actual critical-pair frontier:

* `O = S.oppApex1`;
* `A = S.oppApex2`;
* `Y = H.centerAt F.pair.q F.pair.q_mem_A`;
* `E = F.pair.q`;
* `C = S.surplusApex`.

The three rows are not anonymous K4 witnesses.  They are the exact rows of
the shared critical map sourced at `E`, `C`, and `O`.  Consequently three of
the six terminal memberships are automatic source memberships.  The packet
exposes only the other three cross-incidences, the two remaining blocker-map
equalities, and the actual shared boundary order.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailActualFivePointKalmansonPacketScratch

open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem surplusApex_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v3_mem

/-- Re-center the selected-row API along a proved equality while leaving the
underlying exact support definitionally unchanged. -/
private def CriticalFourShell.toSelectedFourClassAt_eq
    {A : Finset ℝ²} {source center center' : ℝ²}
    (K : CriticalFourShell A source center) (hcenter : center' = center) :
    SelectedFourClass A center' where
  support := K.support
  support_subset_A := K.support_subset_A
  support_card := K.support_card
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := by
    intro x hx
    rw [hcenter]
    exact K.support_eq_radius x hx
  center_not_mem := by
    rw [hcenter]
    exact K.center_not_mem_support

/-- Complete actual-role antecedent for the production five-point Kalmanson
terminal.  All three rows come from the same `CriticalShellSystem H` at the
displayed actual sources; no row or support is selected independently. -/
structure ActualFrontierFivePointKalmansonPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {radius : ℝ}
    (H : CriticalShellSystem D.A)
    (F : CriticalPairFrontier D S radius H) : Type where
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iA : Fin D.A.card
  iY : Fin D.A.card
  iE : Fin D.A.card
  iC : Fin D.A.card
  O_eq : boundary iO = S.oppApex1
  A_eq : boundary iA = S.oppApex2
  Y_eq : boundary iY = H.centerAt F.pair.q F.pair.q_mem_A
  E_eq : boundary iE = F.pair.q
  C_eq : boundary iC = S.surplusApex
  O_lt_A : iO < iA
  A_lt_Y : iA < iY
  Y_lt_E : iY < iE
  E_lt_C : iE < iC
  surplusApex_blocker_eq_oppApex1 :
    H.centerAt S.surplusApex (surplusApex_mem_A S) = S.oppApex1
  oppApex1_blocker_eq_oppApex2 :
    H.centerAt S.oppApex1 (oppApex1_mem_A S) = S.oppApex2
  oppApex1_mem_frontierQRow :
    S.oppApex1 ∈
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
  frontierQ_mem_surplusApexRow :
    F.pair.q ∈
      (H.selectedAt S.surplusApex
        (surplusApex_mem_A S)).toCriticalFourShell.support
  surplusApex_mem_oppApex1Row :
    S.surplusApex ∈
      (H.selectedAt S.oppApex1
        (oppApex1_mem_A S)).toCriticalFourShell.support

/-- The complete actual-role packet closes immediately through the production
five-point Kalmanson consumer.

The other three support facts required by that consumer are supplied by
`CriticalFourShell.q_mem_support`, because `E`, `C`, and `O` are the actual
sources of the rows centered at `Y`, `O`, and `A`, respectively. -/
theorem false_of_actualFrontierFivePointKalmansonPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (P : ActualFrontierFivePointKalmansonPacket D S H F) : False := by
  let YRow : SelectedFourClass D.A (P.boundary P.iY) :=
    CriticalFourShell.toSelectedFourClassAt_eq
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell P.Y_eq
  let ORow : SelectedFourClass D.A (P.boundary P.iO) :=
    CriticalFourShell.toSelectedFourClassAt_eq
      (H.selectedAt S.surplusApex
        (surplusApex_mem_A S)).toCriticalFourShell
      (P.O_eq.trans P.surplusApex_blocker_eq_oppApex1.symm)
  let ARow : SelectedFourClass D.A (P.boundary P.iA) :=
    CriticalFourShell.toSelectedFourClassAt_eq
      (H.selectedAt S.oppApex1
        (oppApex1_mem_A S)).toCriticalFourShell
      (P.A_eq.trans P.oppApex1_blocker_eq_oppApex2.symm)
  apply
    CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order
      D.convex P.boundary_injective P.boundary_image P.boundary_ccw
      P.O_lt_A P.A_lt_Y P.Y_lt_E P.E_lt_C ORow ARow YRow
  · simpa [YRow, P.O_eq] using P.oppApex1_mem_frontierQRow
  · simpa [YRow, P.E_eq] using
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.q_mem_support
  · simpa [ORow, P.E_eq] using P.frontierQ_mem_surplusApexRow
  · simpa [ORow, P.C_eq] using
      (H.selectedAt S.surplusApex
        (surplusApex_mem_A S)).toCriticalFourShell.q_mem_support
  · simpa [ARow, P.C_eq] using P.surplusApex_mem_oppApex1Row
  · simpa [ARow, P.O_eq] using
      (H.selectedAt S.oppApex1
        (oppApex1_mem_A S)).toCriticalFourShell.q_mem_support

#print axioms false_of_actualFrontierFivePointKalmansonPacket

end ATailActualFivePointKalmansonPacketScratch
end Problem97
