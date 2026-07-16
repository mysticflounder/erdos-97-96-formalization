/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GenericMarginalPairCountCountermodel

/-!
# Two-endpoint finite shadow for the fresh second-cap frontier

This is not a Euclidean or K-A-PAIR countermodel.  It strengthens the existing
card-12 pair-count shadows by retaining, simultaneously:

* an abstract selected four-row at all twelve carrier centers;
* first- and second-endpoint off-cap marginals of cardinality at least three;
* marginal intersection of cardinality one;
* an old source pair whose deletion preserves the second-endpoint row;
* a genuinely fresh second source pair whose deletion preserves the
  first-endpoint row; and
* exactly one incidence from each marginal in every strict cap-center row.

Thus the all-center incidence projection plus both local frontier directions
does not force two points of either marginal into one strict row.
-/

namespace Problem97
namespace ATailSecondCapPairCountCountermodel

open ATailGenericMarginalPairCountCountermodel

/-- Finite projection of two endpoint marginals and the two opposite-apex
double-deletion source pairs, layered over the ordered-cap pair-count
surface. -/
structure TwoEndpointSurface
    (firstClass firstMarginal secondClass secondMarginal : Finset Label)
    (oldPair freshPair : Finset Label)
    (row : CapIndex → Finset Label)
    (globalRow : Label → Finset Label) : Prop where
  firstSurface : PairCountSurface firstClass firstMarginal row
  secondClass_card_four_or_five :
    secondClass.card = 4 ∨ secondClass.card = 5
  secondClass_omits_center : capPoint 5 ∉ secondClass
  secondRow_sub_secondClass : row 5 ⊆ secondClass
  secondClass_offcap : secondClass \ cap = secondMarginal
  secondMarginal_card_ge_three : 3 ≤ secondMarginal.card
  marginal_inter_card_le_one :
    (firstMarginal ∩ secondMarginal).card ≤ 1
  oldPair_card_two : oldPair.card = 2
  oldPair_mem_firstMarginal : oldPair ⊆ firstMarginal
  oldPair_avoids_secondRow : Disjoint oldPair (row 5)
  oldPair_deletion_preserves_secondRow :
    ((row 5) \ oldPair).card = 4
  freshPair_card_two : freshPair.card = 2
  freshPair_mem_secondMarginal : freshPair ⊆ secondMarginal
  freshPair_avoids_firstRow : Disjoint freshPair (row 0)
  freshPair_deletion_preserves_firstRow :
    ((row 0) \ freshPair).card = 4
  strict_rows_hit_secondMarginal_once : ∀ i ∈ strictCenters,
    (row i ∩ secondMarginal).card = 1
  global_row_card_four : ∀ center, (globalRow center).card = 4
  global_row_omits_center : ∀ center, center ∉ globalRow center
  global_row_inter_card_le_two : ∀ left right, left ≠ right →
    ((globalRow left) ∩ (globalRow right)).card ≤ 2
  global_row_restricts_to_cap : ∀ i,
    globalRow (capPoint i) = row i

/-! ## Card-four first-endpoint arm -/

def secondClassFour : Finset Label := {0, 6, 9, 10}

def secondMarginalFour : Finset Label := {6, 9, 10}

def oldPairFour : Finset Label := {7, 8}

def freshPairFour : Finset Label := {9, 10}

def cardFourTwoEndpointSurface :
    TwoEndpointSurface
      firstClassFour marginalFour secondClassFour secondMarginalFour
      oldPairFour freshPairFour rowFour globalRowFour where
  firstSurface := cardFourSurface
  secondClass_card_four_or_five := by decide
  secondClass_omits_center := by decide
  secondRow_sub_secondClass := by decide
  secondClass_offcap := by decide
  secondMarginal_card_ge_three := by decide
  marginal_inter_card_le_one := by decide
  oldPair_card_two := by decide
  oldPair_mem_firstMarginal := by decide
  oldPair_avoids_secondRow := by decide
  oldPair_deletion_preserves_secondRow := by decide
  freshPair_card_two := by decide
  freshPair_mem_secondMarginal := by decide
  freshPair_avoids_firstRow := by decide
  freshPair_deletion_preserves_firstRow := by decide
  strict_rows_hit_secondMarginal_once := by decide
  global_row_card_four := by decide
  global_row_omits_center := by decide
  global_row_inter_card_le_two := by decide
  global_row_restricts_to_cap := by decide

theorem cardFour_no_strict_pair_from_either_marginal :
    (¬ ∃ i : CapIndex, i ∈ strictCenters ∧
      2 ≤ (rowFour i ∩ marginalFour).card) ∧
    (¬ ∃ i : CapIndex, i ∈ strictCenters ∧
      2 ≤ (rowFour i ∩ secondMarginalFour).card) := by
  decide

/-! ## Card-five first-endpoint arm -/

def secondClassFive : Finset Label := {0, 9, 10, 11}

def secondMarginalFive : Finset Label := {9, 10, 11}

def oldPairFive : Finset Label := {6, 7}

def freshPairFive : Finset Label := {10, 11}

def cardFiveTwoEndpointSurface :
    TwoEndpointSurface
      firstClassFive marginalFive secondClassFive secondMarginalFive
      oldPairFive freshPairFive rowFive globalRowFive where
  firstSurface := cardFiveSurface
  secondClass_card_four_or_five := by decide
  secondClass_omits_center := by decide
  secondRow_sub_secondClass := by decide
  secondClass_offcap := by decide
  secondMarginal_card_ge_three := by decide
  marginal_inter_card_le_one := by decide
  oldPair_card_two := by decide
  oldPair_mem_firstMarginal := by decide
  oldPair_avoids_secondRow := by decide
  oldPair_deletion_preserves_secondRow := by decide
  freshPair_card_two := by decide
  freshPair_mem_secondMarginal := by decide
  freshPair_avoids_firstRow := by decide
  freshPair_deletion_preserves_firstRow := by decide
  strict_rows_hit_secondMarginal_once := by decide
  global_row_card_four := by decide
  global_row_omits_center := by decide
  global_row_inter_card_le_two := by decide
  global_row_restricts_to_cap := by decide

theorem cardFive_no_strict_pair_from_either_marginal :
    (¬ ∃ i : CapIndex, i ∈ strictCenters ∧
      2 ≤ (rowFive i ∩ marginalFive).card) ∧
    (¬ ∃ i : CapIndex, i ∈ strictCenters ∧
      2 ≤ (rowFive i ∩ secondMarginalFive).card) := by
  decide

/-- Both endpoint marginals remain exactly at the one-hit-per-strict-center
aggregate threshold in both arms. -/
theorem both_marginal_aggregates_at_threshold :
    (∑ i ∈ strictCenters, (rowFour i ∩ marginalFour).card) =
        strictCenters.card ∧
    (∑ i ∈ strictCenters, (rowFour i ∩ secondMarginalFour).card) =
        strictCenters.card ∧
    (∑ i ∈ strictCenters, (rowFive i ∩ marginalFive).card) =
        strictCenters.card ∧
    (∑ i ∈ strictCenters, (rowFive i ∩ secondMarginalFive).card) =
        strictCenters.card := by
  decide

#print axioms cardFourTwoEndpointSurface
#print axioms cardFour_no_strict_pair_from_either_marginal
#print axioms cardFiveTwoEndpointSurface
#print axioms cardFive_no_strict_pair_from_either_marginal
#print axioms both_marginal_aggregates_at_threshold

end ATailSecondCapPairCountCountermodel
end Problem97
