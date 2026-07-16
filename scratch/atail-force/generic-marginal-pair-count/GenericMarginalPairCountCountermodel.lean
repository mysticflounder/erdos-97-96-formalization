/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite shadow for the generic marginal-pair count

This file is not a Euclidean counterexample.  It is a kernel-checked finite
incidence model retaining the consequences used by the ordered-cap pair count:

* a six-point ordered cap inside a twelve-point carrier;
* one four-point selected row at every cap center, omitting its center;
* exact endpoint/interior cap-hit counts `1,2,2,2,2,1`;
* pairwise row intersections of cardinality at most two;
* disjoint outside-pair ledgers at distinct cap centers; and
* a first-endpoint exact class of cardinality four or five whose off-cap
  marginal has cardinality at least three.

Both models avoid the proposed producer: every strict cap-center row contains
exactly one point of the first-endpoint marginal.  Thus the raw cap-local
pair-count interface does not force two marginal points into one strict row.
-/

namespace Problem97
namespace ATailGenericMarginalPairCountCountermodel

abbrev Label := Fin 12
abbrev CapIndex := Fin 6

/-- The six ordered cap points are labels `0,...,5`. -/
def capPoint (i : CapIndex) : Label :=
  ⟨i.1, by omega⟩

def cap : Finset Label := {0, 1, 2, 3, 4, 5}

def outside : Finset Label := Finset.univ \ cap

def strictCenters : Finset CapIndex := {1, 2, 3, 4}

/-- Outside pairs spent by the selected row at one cap center. -/
def outsidePairs (row : CapIndex → Finset Label) (i : CapIndex) :
    Finset (Finset Label) :=
  (row i \ cap).powersetCard 2

/-- Exact combinatorial projection of the cap-local facts used by
`CapSelectedRowCounting`. -/
structure PairCountSurface
    (firstClass marginal : Finset Label)
    (row : CapIndex → Finset Label) : Prop where
  cap_card : cap.card = 6
  cap_image : Finset.univ.image capPoint = cap
  outside_card : outside.card = 6
  firstClass_card_four_or_five :
    firstClass.card = 4 ∨ firstClass.card = 5
  firstClass_omits_center : capPoint 0 ∉ firstClass
  firstRow_sub_firstClass : row 0 ⊆ firstClass
  firstClass_offcap : firstClass \ cap = marginal
  marginal_card_ge_three : 3 ≤ marginal.card
  row_card_four : ∀ i, (row i).card = 4
  row_omits_center : ∀ i, capPoint i ∉ row i
  cap_hit_count : ∀ i,
    (row i ∩ cap).card = if i = 0 ∨ i = 5 then 1 else 2
  row_inter_card_le_two : ∀ i j, i ≠ j →
    ((row i) ∩ (row j)).card ≤ 2
  outside_pair_disjoint : ∀ i j, i ≠ j →
    Disjoint (outsidePairs row i) (outsidePairs row j)
  outside_pair_count_sum :
    (∑ i : CapIndex, Nat.choose (row i \ cap).card 2) = 10
  outside_pair_capacity : Nat.choose outside.card 2 = 15
  strict_rows_hit_marginal_once : ∀ i ∈ strictCenters,
    (row i ∩ marginal).card = 1

/-- Exact aggregate incidence field that would make the generic producer a
pigeonhole consequence.  The ordered-cap pair count does not supply this
inequality. -/
theorem exists_row_with_two_target_points_of_aggregate_incidence
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (centers : Finset α) (row : α → Finset β) (target : Finset β)
    (hsum : centers.card <
      ∑ center ∈ centers, (row center ∩ target).card) :
    ∃ center : α, center ∈ centers ∧
      2 ≤ (row center ∩ target).card := by
  classical
  by_contra hnone
  have hrow (center : α) (hcenter : center ∈ centers) :
      (row center ∩ target).card ≤ 1 := by
    by_contra hnot
    apply hnone
    exact ⟨center, hcenter, by omega⟩
  have hle :
      (∑ center ∈ centers, (row center ∩ target).card) ≤
        ∑ _center ∈ centers, 1 :=
    Finset.sum_le_sum fun center hcenter => hrow center hcenter
  have hones : (∑ _center ∈ centers, (1 : ℕ)) = centers.card := by
    simp
  rw [hones] at hle
  exact (Nat.not_lt_of_ge hle hsum).elim

/-! ## Exact-card-four first class -/

def firstClassFour : Finset Label := {5, 6, 7, 8}

def marginalFour : Finset Label := {6, 7, 8}

/-- The ten spent outside pairs are

`67,68,78`; `69,6A,9A`; and `79,7A,89,8A`,

where `A` denotes label `10`.  They are all distinct. -/
def rowFour : CapIndex → Finset Label :=
  ![({5, 6, 7, 8} : Finset Label),
    {0, 2, 7, 9},
    {1, 3, 7, 10},
    {2, 4, 8, 9},
    {3, 5, 8, 10},
    {0, 6, 9, 10}]

/-- Extension of the six cap rows to one abstract selected row at every one
of the twelve carrier centers. -/
def globalRowFour : Label → Finset Label :=
  ![({5, 6, 7, 8} : Finset Label),
    {0, 2, 7, 9},
    {1, 3, 7, 10},
    {2, 4, 8, 9},
    {3, 5, 8, 10},
    {0, 6, 9, 10},
    {0, 1, 2, 3},
    {0, 1, 4, 5},
    {0, 1, 6, 7},
    {0, 1, 8, 10},
    {0, 1, 9, 11},
    {0, 2, 4, 6}]

/-- The card-four construction has an all-center four-row extension.  This
is the finite incidence projection of global K4, not a metric realization. -/
theorem globalRowFour_checked :
    (∀ center : Label, (globalRowFour center).card = 4) ∧
      (∀ center : Label, center ∉ globalRowFour center) ∧
      (∀ left right : Label, left ≠ right →
        ((globalRowFour left) ∩ (globalRowFour right)).card ≤ 2) ∧
      (∀ i : CapIndex, globalRowFour (capPoint i) = rowFour i) := by
  decide

/-- The exact-card-four arm satisfies the entire pair-count surface. -/
def cardFourSurface :
    PairCountSurface firstClassFour marginalFour rowFour where
  cap_card := by decide
  cap_image := by decide
  outside_card := by decide
  firstClass_card_four_or_five := by decide
  firstClass_omits_center := by decide
  firstRow_sub_firstClass := by decide
  firstClass_offcap := by decide
  marginal_card_ge_three := by decide
  row_card_four := by decide
  row_omits_center := by decide
  cap_hit_count := by decide
  row_inter_card_le_two := by decide
  outside_pair_disjoint := by decide
  outside_pair_count_sum := by decide
  outside_pair_capacity := by decide
  strict_rows_hit_marginal_once := by decide

/-- No strict cap-center row contains two points of the card-four marginal. -/
theorem cardFour_no_strict_marginal_pair :
    ¬ ∃ i : CapIndex, i ∈ strictCenters ∧
      2 ≤ (rowFour i ∩ marginalFour).card := by
  decide

/-! ## Exact-card-five first class -/

def firstClassFive : Finset Label := {5, 6, 7, 8, 9}

def marginalFive : Finset Label := {6, 7, 8, 9}

/-- On the card-five arm the first selected four-row uses three of the four
marginal points.  The remaining rows again spend disjoint outside pairs while
every strict row has only one marginal point. -/
def rowFive : CapIndex → Finset Label :=
  ![({5, 6, 7, 8} : Finset Label),
    {0, 2, 6, 10},
    {1, 3, 7, 10},
    {2, 4, 8, 11},
    {3, 5, 6, 11},
    {0, 9, 10, 11}]

/-- All-center four-row extension for the exact-card-five surface. -/
def globalRowFive : Label → Finset Label :=
  ![({5, 6, 7, 8} : Finset Label),
    {0, 2, 6, 10},
    {1, 3, 7, 10},
    {2, 4, 8, 11},
    {3, 5, 6, 11},
    {0, 9, 10, 11},
    {0, 1, 2, 3},
    {0, 1, 4, 5},
    {0, 1, 6, 7},
    {0, 1, 8, 10},
    {0, 2, 4, 7},
    {0, 2, 5, 8}]

/-- The card-five construction also has an all-center four-row extension. -/
theorem globalRowFive_checked :
    (∀ center : Label, (globalRowFive center).card = 4) ∧
      (∀ center : Label, center ∉ globalRowFive center) ∧
      (∀ left right : Label, left ≠ right →
        ((globalRowFive left) ∩ (globalRowFive right)).card ≤ 2) ∧
      (∀ i : CapIndex, globalRowFive (capPoint i) = rowFive i) := by
  decide

/-- The exact-card-five arm satisfies the same pair-count surface. -/
def cardFiveSurface :
    PairCountSurface firstClassFive marginalFive rowFive where
  cap_card := by decide
  cap_image := by decide
  outside_card := by decide
  firstClass_card_four_or_five := by decide
  firstClass_omits_center := by decide
  firstRow_sub_firstClass := by decide
  firstClass_offcap := by decide
  marginal_card_ge_three := by decide
  row_card_four := by decide
  row_omits_center := by decide
  cap_hit_count := by decide
  row_inter_card_le_two := by decide
  outside_pair_disjoint := by decide
  outside_pair_count_sum := by decide
  outside_pair_capacity := by decide
  strict_rows_hit_marginal_once := by decide

/-- No strict cap-center row contains two points of the card-five marginal. -/
theorem cardFive_no_strict_marginal_pair :
    ¬ ∃ i : CapIndex, i ∈ strictCenters ∧
      2 ≤ (rowFive i ∩ marginalFive).card := by
  decide

/-- Both examples sit exactly one unit below the aggregate incidence
threshold: four strict centers spend four marginal incidences. -/
theorem aggregate_marginal_incidence_at_threshold :
    (∑ i ∈ strictCenters, (rowFour i ∩ marginalFour).card) =
        strictCenters.card ∧
      (∑ i ∈ strictCenters, (rowFive i ∩ marginalFive).card) =
        strictCenters.card := by
  decide

/-- In both branches the ordered-cap lower count spends exactly ten of the
fifteen available outside pairs.  The five-pair slack is the precise reason
the pigeonhole argument cannot force a marginal pair. -/
theorem five_outside_pairs_remain_unspent :
    Nat.choose outside.card 2 -
        (∑ i : CapIndex, Nat.choose (rowFour i \ cap).card 2) = 5 ∧
      Nat.choose outside.card 2 -
        (∑ i : CapIndex, Nat.choose (rowFive i \ cap).card 2) = 5 := by
  decide

#print axioms cardFourSurface
#print axioms exists_row_with_two_target_points_of_aggregate_incidence
#print axioms globalRowFour_checked
#print axioms cardFour_no_strict_marginal_pair
#print axioms cardFiveSurface
#print axioms globalRowFive_checked
#print axioms cardFive_no_strict_marginal_pair
#print axioms aggregate_marginal_incidence_at_threshold
#print axioms five_outside_pairs_remain_unspent

end ATailGenericMarginalPairCountCountermodel
end Problem97
