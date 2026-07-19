/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Coupled alternating shared-pair contradiction

This scratch theorem is the exact six-role consumer isolated as schema 204 in
the round-two whole-carrier Kalmanson bank.  Each of the two shared pairs is
individually alternation-compatible.  Coupling them forces opposite strict
comparisons by two Kalmanson inequalities.

This file was drafted while the user-owned `ShellCurvature` refactor was
active and therefore has not yet been elaborated or axiom-audited.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SchemaShapeAuditScratch

open CapCrossingKalmansonBridge

/-- Suppose six points occur in boundary order `A < B < X < C < D < Y`.
Rows at `A,C` share the pair `X,Y`, while rows at `B,D` share the pair `A,C`.
The first Kalmanson inequality gives `CX < AX`; the second gives `AY < CY`,
contradicting the two remaining row equalities. -/
theorem false_of_coupled_alternating_shared_pairs
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {iA iB iX iC iD iY : Fin carrier.card}
    (hAB : iA < iB) (hBX : iB < iX) (hXC : iX < iC)
    (hCD : iC < iD) (hDY : iD < iY)
    (ARow : SelectedFourClass carrier (boundary iA))
    (BRow : SelectedFourClass carrier (boundary iB))
    (CRow : SelectedFourClass carrier (boundary iC))
    (DRow : SelectedFourClass carrier (boundary iD))
    (hX_mem_ARow : boundary iX ∈ ARow.support)
    (hY_mem_ARow : boundary iY ∈ ARow.support)
    (hA_mem_BRow : boundary iA ∈ BRow.support)
    (hC_mem_BRow : boundary iC ∈ BRow.support)
    (hX_mem_CRow : boundary iX ∈ CRow.support)
    (hY_mem_CRow : boundary iY ∈ CRow.support)
    (hA_mem_DRow : boundary iA ∈ DRow.support)
    (hC_mem_DRow : boundary iC ∈ DRow.support) :
    False := by
  have hAX_eq_AY :
      dist (boundary iA) (boundary iX) =
        dist (boundary iA) (boundary iY) :=
    (ARow.support_eq_radius _ hX_mem_ARow).trans
      (ARow.support_eq_radius _ hY_mem_ARow).symm
  have hAB_eq_BC :
      dist (boundary iA) (boundary iB) =
        dist (boundary iB) (boundary iC) := by
    rw [dist_comm (boundary iA) (boundary iB)]
    exact
      (BRow.support_eq_radius _ hA_mem_BRow).trans
        (BRow.support_eq_radius _ hC_mem_BRow).symm
  have hCX_eq_CY :
      dist (boundary iC) (boundary iX) =
        dist (boundary iC) (boundary iY) :=
    (CRow.support_eq_radius _ hX_mem_CRow).trans
      (CRow.support_eq_radius _ hY_mem_CRow).symm
  have hAD_eq_CD :
      dist (boundary iA) (boundary iD) =
        dist (boundary iC) (boundary iD) := by
    rw [dist_comm (boundary iA) (boundary iD),
      dist_comm (boundary iC) (boundary iD)]
    exact
      (DRow.support_eq_radius _ hA_mem_DRow).trans
        (DRow.support_eq_radius _ hC_mem_DRow).symm
  have hK1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundary_injective hboundary_image hboundary_ccw hAB hBX hXC
  have hCX_lt_AX :
      dist (boundary iC) (boundary iX) <
        dist (boundary iA) (boundary iX) := by
    rw [dist_comm (boundary iC) (boundary iX)]
    linarith
  have hK2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
      hboundary_image hboundary_ccw (hAB.trans (hBX.trans hXC)) hCD hDY
  have hAY_lt_CY :
      dist (boundary iA) (boundary iY) <
        dist (boundary iC) (boundary iY) := by
    linarith
  linarith

#print axioms false_of_coupled_alternating_shared_pairs

end SchemaShapeAuditScratch
end Problem97
