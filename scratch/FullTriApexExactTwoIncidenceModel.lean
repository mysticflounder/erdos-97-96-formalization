import Mathlib

/-!
This finite model isolates the complete incidence/cardinality shadow of
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`.

It is deliberately not a Euclidean `CounterexampleData`.  Its purpose is to
check whether the proposed cardinality/cover argument can close that leaf
without using further planar, minimality, or `noM44` information.

The model has:

* a 17-point carrier and caps of sizes `8, 6, 6`, with the three prescribed
  singleton overlaps;
* three robust apices and fourteen non-robust centers;
* a fixed-point-free blocker map into the non-robust centers;
* a unique canonical four-row at every center, with distinct rows meeting in
  at most one point;
* two disjoint exact-two collision pairs with distinct blockers and the full
  cross-omission rectangle;
* two disjoint exact-four rich classes at each robust apex, each hitting its
  opposite strict cap in exactly two points; and
* every canonical row meeting every rich class in at most two points.

Consequently neither a three-hit arm nor a collision cross-hit arm follows
from this shadow.  Any proof of the production leaf must use genuinely
additional geometric data.
-/

namespace FullTriApexExactTwoIncidenceModel

abbrev Point := Fin 17

def carrier : Finset Point := Finset.univ

def firstCap : Finset Point := {0, 1, 2, 3, 5, 7, 15, 16}
def secondCap : Finset Point := {4, 6, 8, 9, 14, 16}
def surplusCap : Finset Point := {10, 11, 12, 13, 14, 15}

def firstInterior : Finset Point := {0, 1, 2, 3, 5, 7}
def secondInterior : Finset Point := {4, 6, 8, 9}
def surplusInterior : Finset Point := {10, 11, 12, 13}

def robustApices : Finset Point := {14, 15, 16}
def notRobust : Finset Point := carrier \ robustApices

def offsets : Finset Nat := {1, 2, 4, 8}

/-- A cyclic Sidon four-row at every center. -/
def canonicalRow (center : Point) : Finset Point :=
  Finset.univ.filter fun x =>
    ((x.val + 17 - center.val) % 17) ∈ offsets

/-- A fixed-point-free selected blocker.  Its image avoids all robust apices. -/
def blocker : Point → Point :=
  ![13, 0, 0, 2, 3, 3, 5, 3, 7, 8, 9, 10, 11, 12, 13, 13, 12]

def blockerImage : Finset Point := carrier.image blocker
def canonicalCover : Finset Point := blockerImage.biUnion canonicalRow

def firstRadius : Finset Point := {1, 2, 6, 9}
def secondRadius : Finset Point := {5, 7, 10, 12}

def oppositeInterior (apex : Point) : Finset Point :=
  if apex = 14 then firstInterior
  else if apex = 15 then secondInterior
  else if apex = 16 then surplusInterior
  else ∅

def richRow₁ (apex : Point) : Finset Point :=
  if apex = 14 then firstRadius
  else if apex = 15 then {0, 1, 4, 6}
  else if apex = 16 then {0, 1, 10, 12}
  else ∅

def richRow₂ (apex : Point) : Finset Point :=
  if apex = 14 then secondRadius
  else if apex = 15 then {2, 7, 8, 9}
  else if apex = 16 then {2, 3, 11, 13}
  else ∅

theorem cap_partition_profile :
    carrier.card = 17 ∧
      firstCap.card = 8 ∧
      secondCap.card = 6 ∧
      surplusCap.card = 6 ∧
      firstCap.card + secondCap.card + surplusCap.card =
        carrier.card + 3 ∧
      firstCap ∪ secondCap ∪ surplusCap = carrier ∧
      firstCap ∩ secondCap = {16} ∧
      firstCap ∩ surplusCap = {15} ∧
      secondCap ∩ surplusCap = {14} := by
  decide

theorem blocker_cover_profile :
    robustApices.card = 3 ∧
      notRobust.card = 14 ∧
      Disjoint robustApices notRobust ∧
      robustApices ∪ notRobust = carrier ∧
      blockerImage ⊆ notRobust ∧
      (∀ source ∈ carrier, blocker source ≠ source) ∧
      (∀ source ∈ carrier, source ∈ canonicalRow (blocker source)) ∧
      canonicalCover = carrier ∧
      carrier.card ≤ 4 * notRobust.card := by
  decide

theorem canonical_four_row_profile :
    (∀ center : Point,
      (canonicalRow center).card = 4 ∧ center ∉ canonicalRow center) ∧
      (∀ center₁ center₂ : Point, center₁ ≠ center₂ →
        (canonicalRow center₁ ∩ canonicalRow center₂).card ≤ 1) ∧
      (∀ center : Point, ¬ robustApices ⊆ canonicalRow center) := by
  decide

theorem exact_two_collision_profile :
    blocker 1 = blocker 2 ∧
      blocker 5 = blocker 7 ∧
      blocker 1 ≠ blocker 5 ∧
      Disjoint ({1, 2} : Finset Point) {5, 7} ∧
      firstRadius.card = 4 ∧
      secondRadius.card = 4 ∧
      Disjoint firstRadius secondRadius ∧
      firstRadius ∩ firstInterior = {1, 2} ∧
      secondRadius ∩ firstInterior = {5, 7} ∧
      canonicalRow (blocker 1) ∩ firstCap = {1, 2} ∧
      canonicalRow (blocker 5) ∩ firstCap = {5, 7} ∧
      5 ∉ canonicalRow (blocker 1) ∧
      7 ∉ canonicalRow (blocker 1) ∧
      1 ∉ canonicalRow (blocker 5) ∧
      2 ∉ canonicalRow (blocker 5) := by
  decide

theorem tri_apex_rich_profile :
    ∀ apex ∈ robustApices,
      (richRow₁ apex).card = 4 ∧
        (richRow₂ apex).card = 4 ∧
        Disjoint (richRow₁ apex) (richRow₂ apex) ∧
        apex ∉ richRow₁ apex ∧
        apex ∉ richRow₂ apex ∧
        (richRow₁ apex ∩ oppositeInterior apex).card = 2 ∧
        (richRow₂ apex ∩ oppositeInterior apex).card = 2 := by
  decide

theorem planar_circle_intersection_shadow :
    (∀ center apex : Point, apex ∈ robustApices →
      (canonicalRow center ∩ richRow₁ apex).card ≤ 2 ∧
        (canonicalRow center ∩ richRow₂ apex).card ≤ 2) ∧
      (∀ apex₁ ∈ robustApices, ∀ apex₂ ∈ robustApices,
        apex₁ ≠ apex₂ →
          (richRow₁ apex₁ ∩ richRow₁ apex₂).card ≤ 2 ∧
          (richRow₁ apex₁ ∩ richRow₂ apex₂).card ≤ 2 ∧
          (richRow₂ apex₁ ∩ richRow₁ apex₂).card ≤ 2 ∧
          (richRow₂ apex₁ ∩ richRow₂ apex₂).card ≤ 2) := by
  decide

/-- Every canonical row stays below the desired three-hit threshold. -/
theorem all_low_hit_profile :
    ∀ center apex : Point, apex ∈ robustApices →
      (canonicalRow center ∩
          (richRow₁ apex ∩ oppositeInterior apex)).card ≤ 2 ∧
        (canonicalRow center ∩
          (richRow₂ apex ∩ oppositeInterior apex)).card ≤ 2 := by
  decide

/-- The exact production conclusion fails for the two collision rows. -/
theorem collision_leaf_conclusion_fails :
    (¬ ∃ center apex : Point, apex ∈ robustApices ∧
      (3 ≤ (canonicalRow center ∩
        (richRow₁ apex ∩ oppositeInterior apex)).card ∨
       3 ≤ (canonicalRow center ∩
        (richRow₂ apex ∩ oppositeInterior apex)).card)) ∧
      5 ∉ canonicalRow (blocker 1) ∧
      7 ∉ canonicalRow (blocker 1) ∧
      1 ∉ canonicalRow (blocker 5) ∧
      2 ∉ canonicalRow (blocker 5) := by
  decide

#print axioms cap_partition_profile
#print axioms blocker_cover_profile
#print axioms canonical_four_row_profile
#print axioms exact_two_collision_profile
#print axioms tri_apex_rich_profile
#print axioms planar_circle_intersection_shadow
#print axioms all_low_hit_profile
#print axioms collision_leaf_conclusion_fails

end FullTriApexExactTwoIncidenceModel
