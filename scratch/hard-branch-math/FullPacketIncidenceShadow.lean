import Mathlib

/-!
This finite model strengthens the incidence shadow in
`scratch/FullTriApexExactTwoIncidenceModel.lean` by explicitly supplying the
two q-deleted two-center packets used by the two localized mutual-omission
cycles in both orientations.

It is deliberately not a Euclidean `CounterexampleData`: in particular it
does not model `CounterexampleData.Minimal`.  It does show that the complete
finite-set content of the two exact selected rows, the LP/MP packet rows,
the all-large/no-M44 cap profile, and the canonical-cover cardinality
inequality is consistent while the production conclusion fails.
-/

namespace HardBranchFullPacketIncidenceShadow

abbrev Point := Fin 17

def carrier : Finset Point := Finset.univ

def firstCap : Finset Point := {0, 1, 2, 3, 5, 7, 15, 16}
def secondCap : Finset Point := {4, 6, 8, 9, 14, 16}
def surplusCap : Finset Point := {10, 11, 12, 13, 14, 15}

def firstInterior : Finset Point := {0, 1, 2, 3, 5, 7}
def robustApices : Finset Point := {14, 15, 16}
def notRobust : Finset Point := carrier \ robustApices

def offsets : Finset Nat := {1, 2, 4, 8}

def canonicalRow (center : Point) : Finset Point :=
  Finset.univ.filter fun x =>
    ((x.val + 17 - center.val) % 17) ∈ offsets

def blocker : Point → Point :=
  ![13, 0, 0, 2, 3, 3, 5, 3, 7, 8, 9, 10, 11, 12, 13, 13, 12]

def blockerImage : Finset Point := carrier.image blocker
def canonicalCover : Finset Point := blockerImage.biUnion canonicalRow

def firstRadius : Finset Point := {1, 2, 6, 9}
def secondRadius : Finset Point := {5, 7, 10, 12}

def oppositeInterior (apex : Point) : Finset Point :=
  if apex = 14 then firstInterior
  else if apex = 15 then {4, 6, 8, 9}
  else if apex = 16 then {10, 11, 12, 13}
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

/-- The finite-set content of a `CommonDeletionTwoCenterPacket`. -/
structure DeletedTwoCenterPacketShadow
    (q center₁ center₂ actualBlocker : Point) where
  centers_ne : center₁ ≠ center₂
  actualBlocker_ne_center₁ : actualBlocker ≠ center₁
  actualBlocker_ne_center₂ : actualBlocker ≠ center₂
  row₁ : Finset Point
  row₂ : Finset Point
  row₁_card : row₁.card = 4
  row₂_card : row₂.card = 4
  row₁_subset : row₁ ⊆ carrier
  row₂_subset : row₂ ⊆ carrier
  q_not_mem_row₁ : q ∉ row₁
  q_not_mem_row₂ : q ∉ row₂
  center₁_not_mem_row₁ : center₁ ∉ row₁
  center₂_not_mem_row₂ : center₂ ∉ row₂
  overlap_le_two : (row₁ ∩ row₂).card ≤ 2

/-- Delete the second-radius source `5`; survive at apex `14` on the first
radius and at the first collision blocker `0` on its canonical row. -/
def deleteFivePacket :
    DeletedTwoCenterPacketShadow 5 14 0 (blocker 5) where
  row₁ := firstRadius
  row₂ := canonicalRow (blocker 1)
  centers_ne := by decide
  actualBlocker_ne_center₁ := by decide
  actualBlocker_ne_center₂ := by decide
  row₁_card := by decide
  row₂_card := by decide
  row₁_subset := by decide
  row₂_subset := by decide
  q_not_mem_row₁ := by decide
  q_not_mem_row₂ := by decide
  center₁_not_mem_row₁ := by decide
  center₂_not_mem_row₂ := by decide
  overlap_le_two := by decide

/-- Delete the first-radius source `1`; survive at apex `14` on the second
radius and at the second collision blocker `3` on its canonical row. -/
def deleteOnePacket :
    DeletedTwoCenterPacketShadow 1 14 3 (blocker 1) where
  row₁ := secondRadius
  row₂ := canonicalRow (blocker 5)
  centers_ne := by decide
  actualBlocker_ne_center₁ := by decide
  actualBlocker_ne_center₂ := by decide
  row₁_card := by decide
  row₂_card := by decide
  row₁_subset := by decide
  row₂_subset := by decide
  q_not_mem_row₁ := by decide
  q_not_mem_row₂ := by decide
  center₁_not_mem_row₁ := by decide
  center₂_not_mem_row₂ := by decide
  overlap_le_two := by decide

/-- All finite-set hypotheses visible in the production leaf and its two LP/MP
cycles hold, including the blocker-side packet-row normalization.  The two
off-cap supports have size two and meet in exactly one point, so the ordered
cap bound is sharp and supplies no contradiction. -/
theorem full_packet_shadow_and_failed_conclusion :
    carrier.card = 17 ∧
      firstCap.card = 8 ∧
      secondCap.card = 6 ∧
      surplusCap.card = 6 ∧
      secondCap.card ≠ 4 ∧
      surplusCap.card ≠ 4 ∧
      ({0, 1, 2, 3, 5, 7} : Finset Point) ⊆ firstInterior ∧
      blocker 1 = blocker 2 ∧
      blocker 5 = blocker 7 ∧
      blocker 1 ≠ blocker 5 ∧
      Disjoint ({1, 2} : Finset Point) {5, 7} ∧
      firstRadius.card = 4 ∧
      secondRadius.card = 4 ∧
      firstRadius ∩ firstInterior = {1, 2} ∧
      secondRadius ∩ firstInterior = {5, 7} ∧
      canonicalRow (blocker 1) ∩ firstCap = {1, 2} ∧
      canonicalRow (blocker 5) ∩ firstCap = {5, 7} ∧
      (canonicalRow (blocker 1) \ firstCap).card = 2 ∧
      (canonicalRow (blocker 5) \ firstCap).card = 2 ∧
      ((canonicalRow (blocker 1) \ firstCap) ∩
        (canonicalRow (blocker 5) \ firstCap)).card = 1 ∧
      deleteFivePacket.row₁ = firstRadius ∧
      deleteFivePacket.row₂ = canonicalRow (blocker 1) ∧
      deleteOnePacket.row₁ = secondRadius ∧
      deleteOnePacket.row₂ = canonicalRow (blocker 5) ∧
      5 ∉ canonicalRow (blocker 1) ∧
      7 ∉ canonicalRow (blocker 1) ∧
      1 ∉ canonicalRow (blocker 5) ∧
      2 ∉ canonicalRow (blocker 5) ∧
      canonicalCover = carrier ∧
      carrier.card ≤ 4 * notRobust.card ∧
      (∀ center apex : Point, apex ∈ robustApices →
        (canonicalRow center ∩
          (richRow₁ apex ∩ oppositeInterior apex)).card ≤ 2 ∧
        (canonicalRow center ∩
          (richRow₂ apex ∩ oppositeInterior apex)).card ≤ 2) ∧
      ¬ ∃ center apex : Point, apex ∈ robustApices ∧
        (3 ≤ (canonicalRow center ∩
          (richRow₁ apex ∩ oppositeInterior apex)).card ∨
         3 ≤ (canonicalRow center ∩
          (richRow₂ apex ∩ oppositeInterior apex)).card) := by
  decide

#print axioms full_packet_shadow_and_failed_conclusion

end HardBranchFullPacketIncidenceShadow
