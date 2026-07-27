import Mathlib

/-!
A finite incidence model showing that the cardinality and canonical-cover
shadow of the all-large-caps exact-two collision leaf is consistent.

This is deliberately not a `CounterexampleData`: it isolates the proposed
counting argument.  The model has:

* a 17-point carrier and three caps of sizes `8, 6, 6`, with total
  multiplicity `17 + 3`;
* three distinguished robust apices and fourteen non-robust points;
* a fixed-point-free blocker map whose image avoids all robust apices;
* four-point canonical rows covering the carrier;
* two disjoint equal-blocker source pairs with distinct blockers;
* the complete cross-omission rectangle; and
* two exact four-point radius classes whose first-cap-interior parts are
  exactly those source pairs.

Thus the inequality `|A| ≤ 4 * |notRobustCenters|`, even together with the
named cap sizes and canonical four-cover data, cannot by itself yield the
contradiction required by the production leaf.
-/

namespace TriApexCardinalityCoverModel

inductive Point
  | apex | a | b | c | d | p | q | g | h
  | u | v | s | t | x | y | z | w
  deriving DecidableEq, Fintype, Repr

open Point

def carrier : Finset Point := Finset.univ

def firstCap : Finset Point := {a, b, c, d, p, q, g, h}
def secondCap : Finset Point := {apex, h, u, v, s, t}
def surplusCap : Finset Point := {apex, g, x, y, z, w}
def firstInterior : Finset Point := {a, b, c, d, p, q}

def robustApices : Finset Point := {apex, g, h}
def notRobust : Finset Point := carrier \ robustApices

def firstRadius : Finset Point := {a, b, u, v}
def secondRadius : Finset Point := {c, d, s, t}

/-- A fixed-point-free selected critical center for every carrier point. -/
def blocker : Point → Point
  | a | b | x | y => p
  | c | d | z => q
  | p | q | g | h => u
  | u | v | apex | w => s
  | s => t
  | t => v

/-- The canonical four-row at each center in the image of `blocker`.
Values away from the image are irrelevant and are set to the empty row. -/
def row : Point → Finset Point
  | p => {a, b, x, y}
  | q => {c, d, x, z}
  | u => {p, q, g, h}
  | s => {u, v, apex, w}
  | t => {s, a, c, g}
  | v => {t, p, apex, z}
  | _ => ∅

def blockerImage : Finset Point := carrier.image blocker
def canonicalCover : Finset Point := blockerImage.biUnion row

theorem cap_partition_profile :
    carrier.card = 17 ∧
      firstCap.card = 8 ∧
      secondCap.card = 6 ∧
      surplusCap.card = 6 ∧
      firstCap.card + secondCap.card + surplusCap.card =
        carrier.card + 3 ∧
      firstCap ∪ secondCap ∪ surplusCap = carrier ∧
      firstCap ∩ secondCap = {h} ∧
      firstCap ∩ surplusCap = {g} ∧
      secondCap ∩ surplusCap = {apex} := by
  decide

theorem robustness_and_cover_count_profile :
    robustApices.card = 3 ∧
      notRobust.card = 14 ∧
      Disjoint robustApices notRobust ∧
      robustApices ∪ notRobust = carrier ∧
      blockerImage ⊆ notRobust ∧
      carrier.card ≤ 4 * notRobust.card := by
  decide

theorem canonical_row_profile :
    (∀ source ∈ carrier, blocker source ≠ source) ∧
      (∀ source ∈ carrier, source ∈ row (blocker source)) ∧
      (∀ center ∈ blockerImage,
        (row center).card = 4 ∧ center ∉ row center) ∧
      canonicalCover = carrier ∧
      (∀ center ∈ blockerImage,
        ¬ robustApices ⊆ row center) := by
  decide

theorem exact_two_collision_profile :
    blocker a = blocker b ∧
      blocker c = blocker d ∧
      blocker a ≠ blocker c ∧
      Disjoint ({a, b} : Finset Point) {c, d} ∧
      firstRadius.card = 4 ∧
      secondRadius.card = 4 ∧
      firstRadius ∩ firstInterior = {a, b} ∧
      secondRadius ∩ firstInterior = {c, d} ∧
      row (blocker a) ∩ firstCap = {a, b} ∧
      row (blocker c) ∩ firstCap = {c, d} ∧
      c ∉ row (blocker a) ∧
      d ∉ row (blocker a) ∧
      a ∉ row (blocker c) ∧
      b ∉ row (blocker c) := by
  decide

theorem full_cardinality_cover_shadow_is_consistent :
    (carrier.card = 17 ∧
      firstCap.card = 8 ∧
      secondCap.card = 6 ∧
      surplusCap.card = 6 ∧
      firstCap.card + secondCap.card + surplusCap.card =
        carrier.card + 3) ∧
    (robustApices.card = 3 ∧
      notRobust.card = 14 ∧
      blockerImage ⊆ notRobust ∧
      carrier.card ≤ 4 * notRobust.card) ∧
    ((∀ source ∈ carrier, blocker source ≠ source) ∧
      (∀ source ∈ carrier, source ∈ row (blocker source)) ∧
      (∀ center ∈ blockerImage,
        (row center).card = 4 ∧ center ∉ row center) ∧
      canonicalCover = carrier) ∧
    (blocker a = blocker b ∧
      blocker c = blocker d ∧
      blocker a ≠ blocker c ∧
      Disjoint ({a, b} : Finset Point) {c, d} ∧
      firstRadius.card = 4 ∧
      secondRadius.card = 4 ∧
      firstRadius ∩ firstInterior = {a, b} ∧
      secondRadius ∩ firstInterior = {c, d} ∧
      c ∉ row (blocker a) ∧
      d ∉ row (blocker a) ∧
      a ∉ row (blocker c) ∧
      b ∉ row (blocker c)) := by
  have hcaps := cap_partition_profile
  have hrobust := robustness_and_cover_count_profile
  have hrows := canonical_row_profile
  have hcollision := exact_two_collision_profile
  aesop

#print axioms full_cardinality_cover_shadow_is_consistent

end TriApexCardinalityCoverModel
