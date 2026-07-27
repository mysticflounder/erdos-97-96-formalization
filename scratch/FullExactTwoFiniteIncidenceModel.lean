import Mathlib

/-!
A finite incidence model for the information carried by the two exact-two
collision rows and their two cross-identified localized omission cycles.

This deliberately models only the named rows, radius classes, cap, and
q-deleted packet rows.  It is not a `CounterexampleData` or a Euclidean model.
-/

namespace FullExactTwoFiniteIncidenceModel

inductive Point
  | apex | a | b | c | d | p | q | g | h
  | u | v | s | t | x | y | z | w
  deriving DecidableEq, Fintype, Repr

open Point

def carrier : Finset Point := Finset.univ
def cap : Finset Point := {a, b, c, d, p, q, g, h}
def capInterior : Finset Point := {a, b, c, d, p, q}
def secondCap : Finset Point := {apex, h, u, v, s, t}
def surplusCap : Finset Point := {apex, g, x, y, z, w}

-- The two exact-four first-apex radius classes.
def radiusP : Finset Point := {a, b, u, v}
def radiusQ : Finset Point := {c, d, s, t}

-- The two canonical collision rows.  Their outside parts overlap once.
def rowP : Finset Point := {a, b, x, y}
def rowQ : Finset Point := {c, d, x, z}

-- Packet rows after deleting the cross-identified fresh points.
def apexRowAfterC : Finset Point := radiusP
def blockerRowAfterC : Finset Point := rowP
def apexRowAfterA : Finset Point := radiusQ
def blockerRowAfterA : Finset Point := rowQ

theorem sourcePairs_disjoint :
    Disjoint ({a, b} : Finset Point) {c, d} := by
  simp

theorem cap_profile :
    carrier.card = 17 ∧
    cap.card = 8 ∧ secondCap.card = 6 ∧ surplusCap.card = 6 ∧
    cap.card + secondCap.card + surplusCap.card = carrier.card + 3 ∧
    cap ∪ secondCap ∪ surplusCap = carrier ∧
    cap ∩ secondCap = {h} ∧
    cap ∩ surplusCap = {g} ∧
    secondCap ∩ surplusCap = {apex} := by
  decide

theorem radius_profile :
    radiusP.card = 4 ∧ radiusQ.card = 4 ∧
    radiusP ∩ capInterior = {a, b} ∧
    radiusQ ∩ capInterior = {c, d} ∧
    ({a, b} : Finset Point) ∩ {c, d} = ∅ ∧
    p ≠ q := by
  decide

theorem collision_rows :
    rowP.card = 4 ∧ rowQ.card = 4 ∧
    rowP ∩ cap = {a, b} ∧
    rowQ ∩ cap = {c, d} ∧
    c ∉ rowP ∧ d ∉ rowP ∧ a ∉ rowQ ∧ b ∉ rowQ ∧
    p ∉ rowP ∧ q ∉ rowQ ∧
    (rowP \ cap).card = 2 ∧ (rowQ \ cap).card = 2 ∧
    ((rowP \ cap) ∩ (rowQ \ cap)).card = 1 := by
  decide

-- Choose the two cycle collision sources to be a and c.
theorem cycle_omissions :
    c ≠ a ∧ c ∉ rowP ∧ a ∉ rowQ ∧
    a ≠ c ∧ a ∉ rowQ ∧ c ∉ rowP := by
  decide

-- Each common-deletion packet has two four-point rows, avoids its
-- deleted point and its two centers, and has overlap exactly two.
theorem packet_rows_after_c :
    apexRowAfterC.card = 4 ∧ blockerRowAfterC.card = 4 ∧
    apexRowAfterC ⊆ (carrier.erase c).erase apex ∧
    blockerRowAfterC ⊆ (carrier.erase c).erase p ∧
    c ∉ apexRowAfterC ∧ c ∉ blockerRowAfterC ∧
    apex ∉ apexRowAfterC ∧ p ∉ blockerRowAfterC ∧
    (apexRowAfterC ∩ blockerRowAfterC).card = 2 := by
  decide

theorem packet_rows_after_a :
    apexRowAfterA.card = 4 ∧ blockerRowAfterA.card = 4 ∧
    apexRowAfterA ⊆ (carrier.erase a).erase apex ∧
    blockerRowAfterA ⊆ (carrier.erase a).erase q ∧
    a ∉ apexRowAfterA ∧ a ∉ blockerRowAfterA ∧
    apex ∉ apexRowAfterA ∧ q ∉ blockerRowAfterA ∧
    (apexRowAfterA ∩ blockerRowAfterA).card = 2 := by
  decide

theorem exact_named_incidence_is_consistent :
    (carrier.card = 17 ∧
      cap.card = 8 ∧ secondCap.card = 6 ∧ surplusCap.card = 6 ∧
      cap.card + secondCap.card + surplusCap.card = carrier.card + 3 ∧
      cap ∪ secondCap ∪ surplusCap = carrier ∧
      cap ∩ secondCap = {h} ∧
      cap ∩ surplusCap = {g} ∧
      secondCap ∩ surplusCap = {apex}) ∧
    (radiusP.card = 4 ∧ radiusQ.card = 4 ∧
      radiusP ∩ capInterior = {a, b} ∧
      radiusQ ∩ capInterior = {c, d} ∧
      ({a, b} : Finset Point) ∩ {c, d} = ∅ ∧ p ≠ q) ∧
    (rowP.card = 4 ∧ rowQ.card = 4 ∧
      rowP ∩ cap = {a, b} ∧ rowQ ∩ cap = {c, d} ∧
      c ∉ rowP ∧ d ∉ rowP ∧ a ∉ rowQ ∧ b ∉ rowQ ∧
      p ∉ rowP ∧ q ∉ rowQ ∧
      (rowP \ cap).card = 2 ∧ (rowQ \ cap).card = 2 ∧
      ((rowP \ cap) ∩ (rowQ \ cap)).card = 1) ∧
    (c ≠ a ∧ c ∉ rowP ∧ a ∉ rowQ ∧
      a ≠ c ∧ a ∉ rowQ ∧ c ∉ rowP) ∧
    (apexRowAfterC.card = 4 ∧ blockerRowAfterC.card = 4 ∧
      apexRowAfterC ⊆ (carrier.erase c).erase apex ∧
      blockerRowAfterC ⊆ (carrier.erase c).erase p ∧
      c ∉ apexRowAfterC ∧ c ∉ blockerRowAfterC ∧
      apex ∉ apexRowAfterC ∧ p ∉ blockerRowAfterC ∧
      (apexRowAfterC ∩ blockerRowAfterC).card = 2) ∧
    (apexRowAfterA.card = 4 ∧ blockerRowAfterA.card = 4 ∧
      apexRowAfterA ⊆ (carrier.erase a).erase apex ∧
      blockerRowAfterA ⊆ (carrier.erase a).erase q ∧
      a ∉ apexRowAfterA ∧ a ∉ blockerRowAfterA ∧
      apex ∉ apexRowAfterA ∧ q ∉ blockerRowAfterA ∧
      (apexRowAfterA ∩ blockerRowAfterA).card = 2) :=
  ⟨cap_profile, radius_profile, collision_rows, cycle_omissions,
    packet_rows_after_c, packet_rows_after_a⟩

#print axioms exact_named_incidence_is_consistent

end FullExactTwoFiniteIncidenceModel
