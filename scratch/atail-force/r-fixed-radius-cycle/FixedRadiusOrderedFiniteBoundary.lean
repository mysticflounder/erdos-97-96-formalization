/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Fixed-radius blocker cycle with an ordered cap boundary

This is an exact finite radius-class/incidence/order countermodel, not a
Euclidean counterexample. It strengthens the existing blocker-cycle boundary
by exhibiting a literal cyclic boundary permutation whose three five-point
caps are contiguous cyclic intervals. The two blocker-cycle vertices are
consecutive interior vertices of the first opposite cap, lie on one fixed
first-apex radius row, and their blockers lie on that same row.

Consequently, fixed single-radius membership plus cyclic cap order and the
current total critical-row interface do not by themselves force an endpoint
hit, a rank drop, or a terminal third common point.
-/

namespace Problem97
namespace ATailRFixedRadiusCycleFiniteBoundary

abbrev Label := Fin 12
abbrev Point := EuclideanSpace ℝ (Fin 2)

noncomputable def point (x y : ℝ) : Point := !₂[x, y]

private theorem dist_sq_coord (x y : Point) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

def surplusCap : Finset Label := {1, 2, 3, 4, 5}
def oppositeCap1 : Finset Label := {0, 2, 6, 7, 8}
def oppositeCap2 : Finset Label := {0, 1, 9, 10, 11}

/-- A cyclic boundary order. The three caps are respectively the cyclic
intervals `0..4`, `4..8`, and `8..11,0` in this order. -/
def boundary : Label → Label :=
  ![1, 3, 4, 5, 2, 6, 7, 8, 0, 9, 10, 11]

def surplusArcIndices : Finset Label := {0, 1, 2, 3, 4}
def oppositeArc1Indices : Finset Label := {4, 5, 6, 7, 8}
def oppositeArc2Indices : Finset Label := {8, 9, 10, 11, 0}

def firstApex : Label := 1
def historyLeft : Label := 6
def historyRight : Label := 7

/-- The fixed first-apex radius class containing both cycle vertices. -/
def fixedRadiusClass : Finset Label := {0, 2, 6, 7}

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {0, 1, 9, 10},
    {1, 4, 7, 11},
    {3, 5, 6, 10},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 4, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

/-- The boundary is a permutation, and all three caps are contiguous cyclic
five-point intervals in the displayed order. The cycle vertices are adjacent
interior vertices of `oppositeCap1`. -/
theorem boundary_and_caps_checked :
    Function.Bijective boundary ∧
    surplusArcIndices.image boundary = surplusCap ∧
    oppositeArc1Indices.image boundary = oppositeCap1 ∧
    oppositeArc2Indices.image boundary = oppositeCap2 ∧
    boundary 5 = historyLeft ∧
    boundary 6 = historyRight := by
  decide

/-- Both sources and both blockers of the genuine two-cycle lie in one fixed
first-apex radius class, while remaining strictly inside the first opposite
cap and outside the other two caps. -/
theorem fixed_radius_two_cycle_checked :
    historyLeft ∈ fixedRadiusClass ∧
    historyRight ∈ fixedRadiusClass ∧
    blocker historyLeft = historyRight ∧
    blocker historyRight = historyLeft ∧
    blocker historyLeft ∈ fixedRadiusClass ∧
    blocker historyRight ∈ fixedRadiusClass ∧
    historyLeft ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) ∧
    historyRight ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) := by
  decide

/-- An exact Euclidean witness that one carrier-circle radius does not force
successive blocker edges to be equal chords. This is the missing implication
needed to turn the next blocker into a point of the current critical shell via
`secondBlocker_mem_sourceShell_iff_edgeLengths_eq`. -/
theorem common_radius_does_not_force_equal_blocker_edges :
    ∃ O q b c : Point,
      dist O q = 1 ∧
      dist O b = 1 ∧
      dist O c = 1 ∧
      dist b c ≠ dist b q := by
  let O : Point := point 0 0
  let q : Point := point 1 0
  let b : Point := point 0 1
  let c : Point := point (-(3 / 5)) (4 / 5)
  refine ⟨O, q, b, c, ?_, ?_, ?_, ?_⟩
  · have hsq : dist O q ^ 2 = 1 := by
      rw [dist_sq_coord]
      norm_num [O, q, point]
    have hnonneg : 0 ≤ dist O q := dist_nonneg
    nlinarith
  · have hsq : dist O b ^ 2 = 1 := by
      rw [dist_sq_coord]
      norm_num [O, b, point]
    have hnonneg : 0 ≤ dist O b := dist_nonneg
    nlinarith
  · have hsq : dist O c ^ 2 = 1 := by
      rw [dist_sq_coord]
      norm_num [O, c, point]
    have hnonneg : 0 ≤ dist O c := dist_nonneg
    nlinarith
  · intro h
    have hsq : dist b c ^ 2 = dist b q ^ 2 := by rw [h]
    rw [dist_sq_coord, dist_sq_coord] at hsq
    norm_num [b, c, q, point] at hsq

/-- The exact total four-row interface still permits the fixed-radius cycle:
every source belongs to its selected row, there are no fixed blockers, both
directed cross incidences are omitted, and no non-apex recorded center captures
the two cycle vertices together. -/
theorem total_rows_and_no_capture_checked :
    (∀ center, (globalRow center).card = 4) ∧
    (∀ source, source ∈ criticalSupport source) ∧
    (∀ source, blocker source ≠ source) ∧
    historyRight ∉ criticalSupport historyLeft ∧
    historyLeft ∉ criticalSupport historyRight ∧
    ¬ ∃ center, center ≠ firstApex ∧
      historyLeft ∈ globalRow center ∧
      historyRight ∈ globalRow center := by
  decide

#print axioms boundary_and_caps_checked
#print axioms fixed_radius_two_cycle_checked
#print axioms common_radius_does_not_force_equal_blocker_edges
#print axioms total_rows_and_no_capture_checked

end ATailRFixedRadiusCycleFiniteBoundary
end Problem97
