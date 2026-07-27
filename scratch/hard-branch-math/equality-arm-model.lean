import Mathlib

/-!
# Equality-arm local model

This file tests only the local content of the branch

`H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁`.

There are two linked certificates:

* an exact rational metric certificate on the six named points
  `apex, p, u, q, b, v`; and
* a finite incidence certificate for the two source-exact rows, both
  localized common deletions, both mutual-omission cycles, the four-point
  canonical-row cover, and failure of every three-hit/cross-hit conclusion.

The common apex is `apex`.  The first source pair is `p,q`, with common
blocker `u`.  The second source pair is `u,v`, with common blocker `b`.
Consequently, the first blocker is literally the first source of the second
row, while the two blockers remain distinct.

This is deliberately not a Euclidean `CounterexampleData`.  It omits:

* a Euclidean realization of all seventeen auxiliary incidence points and
  all q-deleted four-point rows;
* `CounterexampleData.Minimal`, the global distinct-distance hypothesis,
  general position, and the global `noM44` condition;
* actual `SurplusCapPacket`, `CriticalShellSystem`, and tri-apex structures.

Thus the result is exact and kernel checked within the displayed local
metric/incidence abstraction.  It proves compatibility of the equality arm
with all finite packet fields visible at that abstraction, not existence of
a production counterexample.
-/

namespace Problem97.EqualityArmLocalModel

/-! ## Exact rational metric certificate -/

abbrev RatPoint := ℚ × ℚ

def sqDist (a b : RatPoint) : ℚ :=
  (a.1 - b.1) ^ 2 + (a.2 - b.2) ^ 2

def orient (a b c : RatPoint) : ℚ :=
  (b.1 - a.1) * (c.2 - a.2) -
    (b.2 - a.2) * (c.1 - a.1)

def apexCoord : RatPoint := (0, 0)
def pCoord : RatPoint := (180 / 17, -96 / 17)
def uCoord : RatPoint := (11, 0)
def qCoord : RatPoint := (180 / 17, 96 / 17)
def bCoord : RatPoint := (41 / 4, 123 / 20)
def vCoord : RatPoint := (88 / 17, 165 / 17)

/-- The two apex rows have distinct exact radii; `u` is the first row's
blocker and `b` is the second row's blocker. -/
theorem rational_two_rows_with_equality_blocker :
    sqDist apexCoord pCoord = 144 ∧
      sqDist apexCoord qCoord = 144 ∧
      sqDist apexCoord uCoord = 121 ∧
      sqDist apexCoord vCoord = 121 ∧
      (144 : ℚ) ≠ 121 ∧
      sqDist uCoord pCoord = sqDist uCoord qCoord ∧
      sqDist bCoord uCoord = sqDist bCoord vCoord ∧
      uCoord ≠ bCoord := by
  norm_num [sqDist, apexCoord, pCoord, uCoord, qCoord, bCoord, vCoord]

/-- The common apex is strictly outside the displayed cap half-plane. -/
theorem rational_strict_cap_halfplane :
    apexCoord.1 < 1 ∧
      1 < pCoord.1 ∧
      1 < uCoord.1 ∧
      1 < qCoord.1 ∧
      1 < bCoord.1 ∧
      1 < vCoord.1 := by
  norm_num [apexCoord, pCoord, uCoord, qCoord, bCoord, vCoord]

/-- Every increasing triple in the cyclic order
`apex,p,u,q,b,v` is positively oriented. -/
theorem rational_strict_convex_order :
    0 < orient apexCoord pCoord uCoord ∧
      0 < orient apexCoord pCoord qCoord ∧
      0 < orient apexCoord pCoord bCoord ∧
      0 < orient apexCoord pCoord vCoord ∧
      0 < orient apexCoord uCoord qCoord ∧
      0 < orient apexCoord uCoord bCoord ∧
      0 < orient apexCoord uCoord vCoord ∧
      0 < orient apexCoord qCoord bCoord ∧
      0 < orient apexCoord qCoord vCoord ∧
      0 < orient apexCoord bCoord vCoord ∧
      0 < orient pCoord uCoord qCoord ∧
      0 < orient pCoord uCoord bCoord ∧
      0 < orient pCoord uCoord vCoord ∧
      0 < orient pCoord qCoord bCoord ∧
      0 < orient pCoord qCoord vCoord ∧
      0 < orient pCoord bCoord vCoord ∧
      0 < orient uCoord qCoord bCoord ∧
      0 < orient uCoord qCoord vCoord ∧
      0 < orient uCoord bCoord vCoord ∧
      0 < orient qCoord bCoord vCoord := by
  norm_num [orient, apexCoord, pCoord, uCoord, qCoord, bCoord, vCoord]

/-! ## Finite packet and cycle shadow -/

abbrev Point := Fin 17

def carrier : Finset Point := Finset.univ

def firstApex : Point := 14
def firstCap : Finset Point := {0, 1, 2, 3, 5, 7, 15, 16}
def firstInterior : Finset Point := {0, 1, 2, 3, 5, 7}
def secondCap : Finset Point := {4, 6, 8, 9, 14, 16}
def surplusCap : Finset Point := {10, 11, 12, 13, 14, 15}

def robustApices : Finset Point := {14, 15, 16}
def notRobust : Finset Point := carrier \ robustApices

def offsets : Finset Nat := {1, 2, 4, 8}

/-- The two special rows are the two actual blocker shells.  Every other
row is a cyclic four-set used only to complete the canonical cover shadow. -/
def canonicalRow (center : Point) : Finset Point :=
  if center = 5 then {1, 2, 4, 8}
  else if center = 3 then {4, 5, 7, 11}
  else
    Finset.univ.filter fun x =>
      ((x.val + 17 - center.val) % 17) ∈ offsets

/-- A fixed-point-free blocker assignment.  In particular,
`blocker 1 = blocker 2 = 5` and `blocker 5 = blocker 7 = 3`. -/
def blocker : Point → Point :=
  ![16, 5, 5, 2, 3, 3, 2, 3, 7, 8, 9, 10, 11, 12, 13, 14, 15]

def canonicalCover : Finset Point :=
  carrier.biUnion fun x => canonicalRow (blocker x)

def firstRadiusRow : Finset Point := {1, 2, 6, 9}
def secondRadiusRow : Finset Point := {5, 7, 10, 12}

/-- The finite-set fields of one exact source-collision row. -/
structure SourceExactCollisionRowShadow where
  source₁ : Point
  source₂ : Point
  commonBlocker : Point
  apexRow : Finset Point
  sources_ne : source₁ ≠ source₂
  source₁_mem_interior : source₁ ∈ firstInterior
  source₂_mem_interior : source₂ ∈ firstInterior
  blockers_eq₁ : blocker source₁ = commonBlocker
  blockers_eq₂ : blocker source₂ = commonBlocker
  apexRow_card : apexRow.card = 4
  apexRow_interior_eq :
    apexRow ∩ firstInterior = {source₁, source₂}
  shell_card : (canonicalRow commonBlocker).card = 4
  shell_cap_eq :
    canonicalRow commonBlocker ∩ firstCap = {source₁, source₂}

def firstCollisionRow : SourceExactCollisionRowShadow where
  source₁ := 1
  source₂ := 2
  commonBlocker := 5
  apexRow := firstRadiusRow
  sources_ne := by decide
  source₁_mem_interior := by decide
  source₂_mem_interior := by decide
  blockers_eq₁ := by decide
  blockers_eq₂ := by decide
  apexRow_card := by decide
  apexRow_interior_eq := by decide
  shell_card := by decide
  shell_cap_eq := by decide

def secondCollisionRow : SourceExactCollisionRowShadow where
  source₁ := 5
  source₂ := 7
  commonBlocker := 3
  apexRow := secondRadiusRow
  sources_ne := by decide
  source₁_mem_interior := by decide
  source₂_mem_interior := by decide
  blockers_eq₁ := by decide
  blockers_eq₂ := by decide
  apexRow_card := by decide
  apexRow_interior_eq := by decide
  shell_card := by decide
  shell_cap_eq := by decide

/-- The finite-set content of `CommonDeletionTwoCenterPacket`. -/
structure DeletedTwoCenterPacketShadow
    (q center₁ center₂ : Point) where
  centers_ne : center₁ ≠ center₂
  actualBlocker_ne_center₁ : blocker q ≠ center₁
  actualBlocker_ne_center₂ : blocker q ≠ center₂
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

/-- Delete the second row's first source `5`, while retaining rows at the
first apex and at the first row's blocker, which is also `5`. -/
def deleteSecondSourcePacket :
    DeletedTwoCenterPacketShadow 5 firstApex 5 where
  row₁ := firstRadiusRow
  row₂ := canonicalRow 5
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

/-- Delete the first row's first source `1`, while retaining rows at the
first apex and at the second row's blocker `3`. -/
def deleteFirstSourcePacket :
    DeletedTwoCenterPacketShadow 1 firstApex 3 where
  row₁ := secondRadiusRow
  row₂ := canonicalRow 3
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

/-- The source-tagged common deletion `LP`. -/
structure LocalizedCommonDeletionShadow
    (row : SourceExactCollisionRowShadow) where
  fresh : Point
  fresh_mem_interior : fresh ∈ firstInterior
  fresh_ne_source₁ : fresh ≠ row.source₁
  fresh_ne_source₂ : fresh ≠ row.source₂
  fresh_not_mem_shell : fresh ∉ canonicalRow row.commonBlocker
  packet :
    DeletedTwoCenterPacketShadow fresh firstApex row.commonBlocker
  packet_row₂_eq_shell :
    packet.row₂ = canonicalRow row.commonBlocker

def forwardLocalized :
    LocalizedCommonDeletionShadow firstCollisionRow where
  fresh := 5
  fresh_mem_interior := by decide
  fresh_ne_source₁ := by decide
  fresh_ne_source₂ := by decide
  fresh_not_mem_shell := by decide
  packet := deleteSecondSourcePacket
  packet_row₂_eq_shell := by decide

def reverseLocalized :
    LocalizedCommonDeletionShadow secondCollisionRow where
  fresh := 1
  fresh_mem_interior := by decide
  fresh_ne_source₁ := by decide
  fresh_ne_source₂ := by decide
  fresh_not_mem_shell := by decide
  packet := deleteFirstSourcePacket
  packet_row₂_eq_shell := by decide

/-- The incidence fields of `LocalizedCollisionMutualOmissionCycle`. -/
structure MutualOmissionCycleShadow
    (row : SourceExactCollisionRowShadow)
    (localized : LocalizedCommonDeletionShadow row) where
  collisionSource : Point
  collisionSource_mem_interior : collisionSource ∈ firstInterior
  collisionSource_eq :
    collisionSource = row.source₁ ∨ collisionSource = row.source₂
  collisionSource_ne_fresh : collisionSource ≠ localized.fresh
  collisionSource_blocker_eq_commonBlocker :
    blocker collisionSource = row.commonBlocker
  fresh_not_mem_collisionSource_shell :
    localized.fresh ∉ canonicalRow (blocker collisionSource)
  collisionSource_not_mem_fresh_shell :
    collisionSource ∉ canonicalRow (blocker localized.fresh)
  blockers_ne :
    blocker collisionSource ≠ blocker localized.fresh
  collisionSourcePacket :
    DeletedTwoCenterPacketShadow collisionSource firstApex
      (blocker localized.fresh)
  collisionSourcePacket_row₂_eq_fresh_shell :
    collisionSourcePacket.row₂ = canonicalRow (blocker localized.fresh)

def forwardCycle :
    MutualOmissionCycleShadow firstCollisionRow forwardLocalized where
  collisionSource := 1
  collisionSource_mem_interior := by decide
  collisionSource_eq := by decide
  collisionSource_ne_fresh := by decide
  collisionSource_blocker_eq_commonBlocker := by decide
  fresh_not_mem_collisionSource_shell := by decide
  collisionSource_not_mem_fresh_shell := by decide
  blockers_ne := by decide
  collisionSourcePacket := deleteFirstSourcePacket
  collisionSourcePacket_row₂_eq_fresh_shell := by decide

def reverseCycle :
    MutualOmissionCycleShadow secondCollisionRow reverseLocalized where
  collisionSource := 5
  collisionSource_mem_interior := by decide
  collisionSource_eq := by decide
  collisionSource_ne_fresh := by decide
  collisionSource_blocker_eq_commonBlocker := by decide
  fresh_not_mem_collisionSource_shell := by decide
  collisionSource_not_mem_fresh_shell := by decide
  blockers_ne := by decide
  collisionSourcePacket := deleteSecondSourcePacket
  collisionSourcePacket_row₂_eq_fresh_shell := by decide

def oppositeInterior (apex : Point) : Finset Point :=
  if apex = 14 then firstInterior
  else if apex = 15 then {4, 6, 8, 9}
  else if apex = 16 then {10, 11, 12, 13}
  else ∅

def richRow₁ (apex : Point) : Finset Point :=
  if apex = 14 then firstRadiusRow
  else if apex = 15 then {0, 1, 4, 6}
  else if apex = 16 then {0, 1, 10, 12}
  else ∅

def richRow₂ (apex : Point) : Finset Point :=
  if apex = 14 then secondRadiusRow
  else if apex = 15 then {2, 7, 8, 9}
  else if apex = 16 then {2, 3, 11, 13}
  else ∅

/-- The full finite packet shadow survives the equality arm while every
three-hit and cross-hit alternative remains false. -/
theorem equality_arm_packet_shadow :
    carrier.card = 17 ∧
      firstCap.card = 8 ∧
      secondCap.card = 6 ∧
      surplusCap.card = 6 ∧
      Disjoint
        ({firstCollisionRow.source₁, firstCollisionRow.source₂} :
          Finset Point)
        {secondCollisionRow.source₁, secondCollisionRow.source₂} ∧
      firstCollisionRow.commonBlocker = secondCollisionRow.source₁ ∧
      firstCollisionRow.commonBlocker ≠ secondCollisionRow.commonBlocker ∧
      firstRadiusRow ≠ secondRadiusRow ∧
      forwardLocalized.fresh = secondCollisionRow.source₁ ∧
      reverseLocalized.fresh = firstCollisionRow.source₁ ∧
      forwardCycle.collisionSource = firstCollisionRow.source₁ ∧
      reverseCycle.collisionSource = secondCollisionRow.source₁ ∧
      deleteSecondSourcePacket.row₁ = firstRadiusRow ∧
      deleteSecondSourcePacket.row₂ =
        canonicalRow firstCollisionRow.commonBlocker ∧
      deleteFirstSourcePacket.row₁ = secondRadiusRow ∧
      deleteFirstSourcePacket.row₂ =
        canonicalRow secondCollisionRow.commonBlocker ∧
      (∀ x : Point,
        blocker x ≠ x ∧
          x ∈ canonicalRow (blocker x) ∧
          (canonicalRow (blocker x)).card = 4) ∧
      canonicalCover = carrier ∧
      carrier.card ≤ 4 * notRobust.card ∧
      secondCollisionRow.source₁ ∉
        canonicalRow firstCollisionRow.commonBlocker ∧
      secondCollisionRow.source₂ ∉
        canonicalRow firstCollisionRow.commonBlocker ∧
      firstCollisionRow.source₁ ∉
        canonicalRow secondCollisionRow.commonBlocker ∧
      firstCollisionRow.source₂ ∉
        canonicalRow secondCollisionRow.commonBlocker ∧
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

/-- One theorem combining the exact metric certificate with the complete
finite packet/cycle certificate. -/
theorem equality_arm_local_model :
    (sqDist apexCoord pCoord = sqDist apexCoord qCoord ∧
      sqDist apexCoord uCoord = sqDist apexCoord vCoord ∧
      sqDist apexCoord pCoord ≠ sqDist apexCoord uCoord ∧
      sqDist uCoord pCoord = sqDist uCoord qCoord ∧
      sqDist bCoord uCoord = sqDist bCoord vCoord ∧
      uCoord ≠ bCoord) ∧
    firstCollisionRow.commonBlocker = secondCollisionRow.source₁ ∧
    firstCollisionRow.commonBlocker ≠ secondCollisionRow.commonBlocker ∧
    Nonempty (LocalizedCommonDeletionShadow firstCollisionRow) ∧
    Nonempty (LocalizedCommonDeletionShadow secondCollisionRow) ∧
    Nonempty (MutualOmissionCycleShadow firstCollisionRow forwardLocalized) ∧
    Nonempty (MutualOmissionCycleShadow secondCollisionRow reverseLocalized) := by
  refine ⟨?_, by decide, by decide, ⟨forwardLocalized⟩,
    ⟨reverseLocalized⟩, ⟨forwardCycle⟩, ⟨reverseCycle⟩⟩
  norm_num [sqDist, apexCoord, pCoord, uCoord, qCoord, bCoord, vCoord]

#print axioms rational_two_rows_with_equality_blocker
#print axioms rational_strict_convex_order
#print axioms equality_arm_packet_shadow
#print axioms equality_arm_local_model

end Problem97.EqualityArmLocalModel
