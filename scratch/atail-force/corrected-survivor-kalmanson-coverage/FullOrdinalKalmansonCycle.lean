/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Orientation-complete ordinal Kalmanson cycle consumer

The production `ATailOrdinalKalmansonCycle.SelectedRowOrdinalComparison`
records two of the eight ways that one selected-row equality can cancel a
term across one of the two strict Kalmanson inequalities.  This scratch
module checks the orientation-complete interface used by the corrected
survivor audit.  Each constructor is a direct selected-row specialization;
no quotient or finite-search fact is assumed here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCorrectedSurvivorKalmansonCoverageScratch

open CapCrossingKalmansonBridge

/-- One strict comparison obtained by cancelling one selected-row equality
from either strict Kalmanson inequality on an increasing boundary
quadruple.  The constructors are named by the inequality and by the boundary
vertex at which the cancelling selected row is centered. -/
inductive FullSelectedRowOrdinalComparison
    {carrier : Finset ℝ²} (boundary : Fin carrier.card → ℝ²)
    {κ : Type*} (value : κ → ℝ) : κ → κ → Prop where
  | k1CancelA
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ia))
      (hib_mem : boundary ib ∈ row.support)
      (hic_mem : boundary ic ∈ row.support)
      (hleft : value left = dist (boundary ic) (boundary id))
      (hright : value right = dist (boundary ib) (boundary id)) :
      FullSelectedRowOrdinalComparison boundary value left right
  | k1CancelB
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ib))
      (hia_mem : boundary ia ∈ row.support)
      (hid_mem : boundary id ∈ row.support)
      (hleft : value left = dist (boundary ic) (boundary id))
      (hright : value right = dist (boundary ia) (boundary ic)) :
      FullSelectedRowOrdinalComparison boundary value left right
  | k1CancelC
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ic))
      (hia_mem : boundary ia ∈ row.support)
      (hid_mem : boundary id ∈ row.support)
      (hleft : value left = dist (boundary ia) (boundary ib))
      (hright : value right = dist (boundary ib) (boundary id)) :
      FullSelectedRowOrdinalComparison boundary value left right
  | k1CancelD
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary id))
      (hib_mem : boundary ib ∈ row.support)
      (hic_mem : boundary ic ∈ row.support)
      (hleft : value left = dist (boundary ia) (boundary ib))
      (hright : value right = dist (boundary ia) (boundary ic)) :
      FullSelectedRowOrdinalComparison boundary value left right
  | k2CancelA
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ia))
      (hic_mem : boundary ic ∈ row.support)
      (hid_mem : boundary id ∈ row.support)
      (hleft : value left = dist (boundary ib) (boundary ic))
      (hright : value right = dist (boundary ib) (boundary id)) :
      FullSelectedRowOrdinalComparison boundary value left right
  | k2CancelB
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ib))
      (hic_mem : boundary ic ∈ row.support)
      (hid_mem : boundary id ∈ row.support)
      (hleft : value left = dist (boundary ia) (boundary id))
      (hright : value right = dist (boundary ia) (boundary ic)) :
      FullSelectedRowOrdinalComparison boundary value left right
  | k2CancelC
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ic))
      (hia_mem : boundary ia ∈ row.support)
      (hib_mem : boundary ib ∈ row.support)
      (hleft : value left = dist (boundary ia) (boundary id))
      (hright : value right = dist (boundary ib) (boundary id)) :
      FullSelectedRowOrdinalComparison boundary value left right
  | k2CancelD
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary id))
      (hia_mem : boundary ia ∈ row.support)
      (hib_mem : boundary ib ∈ row.support)
      (hleft : value left = dist (boundary ib) (boundary ic))
      (hright : value right = dist (boundary ia) (boundary ic)) :
      FullSelectedRowOrdinalComparison boundary value left right

/-- Every orientation-complete selected-row step strictly increases its
named distance value. -/
theorem FullSelectedRowOrdinalComparison.value_lt
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {κ : Type*} {value : κ → ℝ} {left right : κ}
    (step : FullSelectedRowOrdinalComparison boundary value left right) :
    value left < value right := by
  cases step with
  | k1CancelA hiab hibc hicd row hib_mem hic_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ia) (boundary ic) =
            dist (boundary ia) (boundary ib) :=
        (row.support_eq_radius _ hic_mem).trans
          (row.support_eq_radius _ hib_mem).symm
      have hkal :=
        complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
          hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith
  | k1CancelB hiab hibc hicd row hia_mem hid_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ib) (boundary id) =
            dist (boundary ia) (boundary ib) := by
        simpa only [dist_comm (boundary ib) (boundary ia)] using
          (row.support_eq_radius _ hid_mem).trans
            (row.support_eq_radius _ hia_mem).symm
      have hkal :=
        complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
          hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith
  | k1CancelC hiab hibc hicd row hia_mem hid_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ia) (boundary ic) =
            dist (boundary ic) (boundary id) := by
        simpa only [dist_comm (boundary ic) (boundary ia)] using
          (row.support_eq_radius _ hia_mem).trans
            (row.support_eq_radius _ hid_mem).symm
      have hkal :=
        complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
          hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith
  | k1CancelD hiab hibc hicd row hib_mem hic_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ib) (boundary id) =
            dist (boundary ic) (boundary id) := by
        simpa only [dist_comm (boundary id) (boundary ib),
          dist_comm (boundary id) (boundary ic)] using
          (row.support_eq_radius _ hib_mem).trans
            (row.support_eq_radius _ hic_mem).symm
      have hkal :=
        complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
          hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith
  | k2CancelA hiab hibc hicd row hic_mem hid_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ia) (boundary ic) =
            dist (boundary ia) (boundary id) :=
        (row.support_eq_radius _ hic_mem).trans
          (row.support_eq_radius _ hid_mem).symm
      have hkal :=
        dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
          hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith
  | k2CancelB hiab hibc hicd row hic_mem hid_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ib) (boundary id) =
            dist (boundary ib) (boundary ic) :=
        (row.support_eq_radius _ hid_mem).trans
          (row.support_eq_radius _ hic_mem).symm
      have hkal :=
        dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
          hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith
  | k2CancelC hiab hibc hicd row hia_mem hib_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ia) (boundary ic) =
            dist (boundary ib) (boundary ic) := by
        simpa only [dist_comm (boundary ic) (boundary ia),
          dist_comm (boundary ic) (boundary ib)] using
          (row.support_eq_radius _ hia_mem).trans
            (row.support_eq_radius _ hib_mem).symm
      have hkal :=
        dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
          hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith
  | k2CancelD hiab hibc hicd row hia_mem hib_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ib) (boundary id) =
            dist (boundary ia) (boundary id) := by
        simpa only [dist_comm (boundary id) (boundary ib),
          dist_comm (boundary id) (boundary ia)] using
          (row.support_eq_radius _ hib_mem).trans
            (row.support_eq_radius _ hia_mem).symm
      have hkal :=
        dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundary_injective
          hboundary_image hboundary_ccw hiab hibc hicd
      rw [hleft, hright]
      linarith

/-- A directed cycle of orientation-complete selected-row Kalmanson
comparisons is impossible. -/
theorem false_of_full_transGen_cycle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {κ : Type*} {value : κ → ℝ} {start : κ}
    (cycle : Relation.TransGen
      (FullSelectedRowOrdinalComparison boundary value) start start) :
    False := by
  have value_lt_of_path : ∀ {first last : κ},
      Relation.TransGen
        (FullSelectedRowOrdinalComparison boundary value) first last →
        value first < value last := by
    intro first last path
    induction path using Relation.TransGen.trans_induction_on with
    | single step =>
        exact step.value_lt hcarrier hboundary_injective
          hboundary_image hboundary_ccw
    | trans _ _ first_lt_middle middle_lt_last =>
        exact lt_trans first_lt_middle middle_lt_last
  exact lt_irrefl (value start) (value_lt_of_path cycle)

#print axioms FullSelectedRowOrdinalComparison.value_lt
#print axioms false_of_full_transGen_cycle

end ATailCorrectedSurvivorKalmansonCoverageScratch
end Problem97
