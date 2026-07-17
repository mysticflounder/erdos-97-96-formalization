/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Ordinal Kalmanson strict-cycle consumer

This module turns selected-row equalities on one strictly convex boundary
into directed strict comparisons between named distance terms. A transitive
path strictly increases its term value, so a directed cycle is impossible.

The term names and their real values remain parameters. Each comparison
records the endpoint identifications needed to normalize distance symmetry or
reuse a term in a later step, without hard-coding one finite row census.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOrdinalKalmansonCycle

open CapCrossingKalmansonBridge

/-- One source-valid selected-row Kalmanson comparison between two named
distance terms. -/
inductive SelectedRowOrdinalComparison
    {carrier : Finset ℝ²} (boundary : Fin carrier.card → ℝ²)
    {κ : Type*} (value : κ → ℝ) : κ → κ → Prop where
  | diagonalEqSide
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ia))
      (hic_mem : boundary ic ∈ row.support)
      (hid_mem : boundary id ∈ row.support)
      (hleft : value left = dist (boundary ib) (boundary ic))
      (hright : value right = dist (boundary ib) (boundary id)) :
      SelectedRowOrdinalComparison boundary value left right
  | diagonalEqLastSide
      {left right : κ} {ia ib ic id : Fin carrier.card}
      (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
      (row : SelectedFourClass carrier (boundary ic))
      (hia_mem : boundary ia ∈ row.support)
      (hid_mem : boundary id ∈ row.support)
      (hleft : value left = dist (boundary ia) (boundary ib))
      (hright : value right = dist (boundary ib) (boundary id)) :
      SelectedRowOrdinalComparison boundary value left right

/-- Every certified selected-row step strictly increases its named distance
value. -/
theorem SelectedRowOrdinalComparison.value_lt
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {κ : Type*} {value : κ → ℝ} {left right : κ}
    (step : SelectedRowOrdinalComparison boundary value left right) :
    value left < value right := by
  cases step with
  | diagonalEqSide hiab hibc hicd row hic_mem hid_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ia) (boundary ic) =
            dist (boundary ia) (boundary id) :=
        (row.support_eq_radius _ hic_mem).trans
          (row.support_eq_radius _ hid_mem).symm
      have hstrict :=
        dist_lt_of_ccw_of_dist_diagonal_eq_side hcarrier
          hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd heq
      simpa only [hleft, hright] using hstrict
  | diagonalEqLastSide hiab hibc hicd row hia_mem hid_mem hleft hright =>
      rename_i ia ib ic id
      have heq :
          dist (boundary ia) (boundary ic) =
            dist (boundary ic) (boundary id) := by
        rw [dist_comm (boundary ia) (boundary ic)]
        exact
          (row.support_eq_radius _ hia_mem).trans
            (row.support_eq_radius _ hid_mem).symm
      have hstrict :=
        dist_first_side_lt_second_diagonal_of_ccw_of_dist_diagonal_eq_last_side
          hcarrier hboundary_injective hboundary_image hboundary_ccw
          hiab hibc hicd heq
      simpa only [hleft, hright] using hstrict

/-- A nonempty transitive path of selected-row Kalmanson steps strictly
increases the named distance value. -/
theorem value_lt_of_transGen
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {κ : Type*} {value : κ → ℝ} {first last : κ}
    (path : Relation.TransGen
      (SelectedRowOrdinalComparison boundary value) first last) :
    value first < value last := by
  induction path using Relation.TransGen.trans_induction_on with
  | single step =>
      exact step.value_lt hcarrier hboundary_injective
        hboundary_image hboundary_ccw
  | trans _ _ first_lt_middle middle_lt_last =>
      exact lt_trans first_lt_middle middle_lt_last

/-- A directed cycle of selected-row ordinal Kalmanson comparisons is
impossible. -/
theorem false_of_transGen_cycle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {κ : Type*} {value : κ → ℝ} {start : κ}
    (cycle : Relation.TransGen
      (SelectedRowOrdinalComparison boundary value) start start) :
    False := by
  exact lt_irrefl (value start)
    (value_lt_of_transGen hcarrier hboundary_injective
      hboundary_image hboundary_ccw cycle)

/-- The common two-edge certificate is an immediate specialization of the
generic path consumer. -/
theorem false_of_two_cycle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {κ : Type*} {value : κ → ℝ} {left right : κ}
    (forward : SelectedRowOrdinalComparison boundary value left right)
    (backward : SelectedRowOrdinalComparison boundary value right left) :
    False := by
  exact lt_irrefl (value left)
    (lt_trans
      (forward.value_lt hcarrier hboundary_injective
        hboundary_image hboundary_ccw)
      (backward.value_lt hcarrier hboundary_injective
        hboundary_image hboundary_ccw))

end ATailOrdinalKalmansonCycle
end Problem97
