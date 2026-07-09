/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.LocalClassEncoding
import Mathlib.Data.List.Dedup

/-!
# Complete finite enumeration of L2 local class rows

This module defines the small verified search used to cover the generated
typed class bank.  The search records the remaining four-use budget at each
Moser center and rejects a cap-count choice as soon as it exceeds that budget.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace LocalEnumerator

/-- One cap/count-mask cell in generated row order. -/
abbrev CountCell := JointCap × Finset MoserVertex

/-- The seven nonempty count cells for one cap. -/
def cellsForCap (cap : JointCap) : List CountCell :=
  LocalClassEncoding.countMasks.map (fun mask => (cap, mask))

/-- The 21 count cells in generated row order. -/
def countCells : List CountCell :=
  cellsForCap .S ++ cellsForCap .O1 ++ cellsForCap .O2

/-- Pointwise condition for assigning `count` copies of a mask while respecting
the remaining use budget. -/
def CountFits
    (remaining : MoserVertex -> Nat) (mask : Finset MoserVertex)
    (count : Nat) : Prop :=
  ∀ center ∈ mask, count ≤ remaining center

/-- Executable three-center form of `CountFits`. -/
def countFits
    (remaining : MoserVertex -> Nat) (mask : Finset MoserVertex)
    (count : Nat) : Bool :=
  (decide (0 ∉ mask) || decide (count ≤ remaining 0)) &&
    (decide (1 ∉ mask) || decide (count ≤ remaining 1)) &&
      (decide (2 ∉ mask) || decide (count ≤ remaining 2))

/-- The executable remaining-use test has the intended pointwise meaning. -/
theorem countFits_eq_true_iff
    {remaining : MoserVertex -> Nat} {mask : Finset MoserVertex}
    {count : Nat} :
    countFits remaining mask count = true ↔ CountFits remaining mask count := by
  constructor
  · intro h center hcenter
    fin_cases center <;> simp [countFits] at h ⊢ <;> aesop
  · intro h
    simp only [countFits, Bool.and_eq_true, Bool.or_eq_true,
      decide_eq_true_eq]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · by_cases hmem : 0 ∈ mask
      · exact Or.inr (h 0 hmem)
      · exact Or.inl hmem
    · by_cases hmem : 1 ∈ mask
      · exact Or.inr (h 1 hmem)
      · exact Or.inl hmem
    · by_cases hmem : 2 ∈ mask
      · exact Or.inr (h 2 hmem)
      · exact Or.inl hmem

/-- Remove one count choice from every center used by its mask. -/
def subtractCount
    (remaining : MoserVertex -> Nat) (mask : Finset MoserVertex)
    (count : Nat) : MoserVertex -> Nat :=
  fun center => if center ∈ mask then remaining center - count else remaining center

/-- Pruned enumeration of count vectors.  Every cell count is at most four;
the remaining-use test supplies the material pruning. -/
def countVectors :
    List CountCell -> (MoserVertex -> Nat) -> List (List Nat)
  | [], remaining =>
      if ∀ center, remaining center = 0 then [[]] else []
  | cell :: rest, remaining =>
      (List.range 5).flatMap fun count =>
        if countFits remaining cell.2 count then
          (countVectors rest (subtractCount remaining cell.2 count)).map
            (count :: ·)
        else
          []

/-- Use contributed to one center by a count vector aligned with a cell list. -/
def requiredUse :
    List CountCell -> List Nat -> MoserVertex -> Nat
  | [], _, _ => 0
  | _, [], _ => 0
  | cell :: rest, count :: counts, center =>
      (if center ∈ cell.2 then count else 0) +
        requiredUse rest counts center

/-- Every bounded target vector whose required uses equal the initial budget
occurs in the pruned count search. -/
theorem mem_countVectors_of_requiredUse
    {cells : List CountCell} {counts : List Nat}
    {remaining : MoserVertex -> Nat}
    (hlength : counts.length = cells.length)
    (hbounded : ∀ count ∈ counts, count < 5)
    (hrequired : ∀ center, remaining center = requiredUse cells counts center) :
    counts ∈ countVectors cells remaining := by
  induction cells generalizing counts remaining with
  | nil =>
      cases counts with
      | nil =>
          have hzero : ∀ center, remaining center = 0 := by
            intro center
            simpa [requiredUse] using hrequired center
          simp [countVectors, hzero]
      | cons count counts => simp at hlength
  | cons cell rest ih =>
      cases counts with
      | nil => simp at hlength
      | cons count counts =>
          have hcount : count ∈ List.range 5 := List.mem_range.mpr (hbounded count (by simp))
          have hfits : CountFits remaining cell.2 count := by
            intro center hcenter
            rw [hrequired center]
            simp [requiredUse, hcenter]
          have hfitsBool : countFits remaining cell.2 count = true :=
            countFits_eq_true_iff.2 hfits
          have htailLength : counts.length = rest.length := by
            simpa using hlength
          have htailBounded : ∀ value ∈ counts, value < 5 := by
            intro value hvalue
            exact hbounded value (by simp [hvalue])
          have htailRequired :
              ∀ center,
                subtractCount remaining cell.2 count center =
                  requiredUse rest counts center := by
            intro center
            by_cases hcenter : center ∈ cell.2
            · simp [subtractCount, hcenter, hrequired center, requiredUse]
            · simp [subtractCount, hcenter, hrequired center, requiredUse]
          have htail :
              counts ∈ countVectors rest
                (subtractCount remaining cell.2 count) :=
            ih htailLength htailBounded htailRequired
          rw [countVectors]
          exact List.mem_flatMap.mpr
            ⟨count, hcount, by simp [hfitsBool, htail]⟩

/-- Monotone budgets used to prune the LOCAL count search. -/
inductive LocalConstraint
  | use0 | use1 | use2
  | hO1_0 | hO2_0 | hS_1 | hO2_1 | hS_2 | hO1_2
  | pair01 | pair02 | pair12
  deriving DecidableEq

/-- The constraints in executable traversal order. -/
def localConstraints : List LocalConstraint :=
  [.use0, .use1, .use2,
    .hO1_0, .hO2_0, .hS_1, .hO2_1, .hS_2, .hO1_2,
    .pair01, .pair02, .pair12]

/-- Whether one count cell consumes a given LOCAL budget. -/
def constraintApplies : LocalConstraint → CountCell → Bool
  | .use0, cell => decide (0 ∈ cell.2)
  | .use1, cell => decide (1 ∈ cell.2)
  | .use2, cell => decide (2 ∈ cell.2)
  | .hO1_0, cell => decide (cell.1 = .O1) && decide (0 ∈ cell.2)
  | .hO2_0, cell => decide (cell.1 = .O2) && decide (0 ∈ cell.2)
  | .hS_1, cell => decide (cell.1 = .S) && decide (1 ∈ cell.2)
  | .hO2_1, cell => decide (cell.1 = .O2) && decide (1 ∈ cell.2)
  | .hS_2, cell => decide (cell.1 = .S) && decide (2 ∈ cell.2)
  | .hO1_2, cell => decide (cell.1 = .O1) && decide (2 ∈ cell.2)
  | .pair01, cell => decide (0 ∈ cell.2) && decide (1 ∈ cell.2)
  | .pair02, cell => decide (0 ∈ cell.2) && decide (2 ∈ cell.2)
  | .pair12, cell => decide (1 ∈ cell.2) && decide (2 ∈ cell.2)

/-- The center-use constraints are exact at a search leaf; H1 and pair budgets
are upper bounds. -/
def constraintExact : LocalConstraint → Bool
  | .use0 | .use1 | .use2 => true
  | _ => false

/-- Concrete remaining values for all twelve LOCAL budgets. -/
structure LocalBudget where
  use0 : Nat
  use1 : Nat
  use2 : Nat
  hO1_0 : Nat
  hO2_0 : Nat
  hS_1 : Nat
  hO2_1 : Nat
  hS_2 : Nat
  hO1_2 : Nat
  pair01 : Nat
  pair02 : Nat
  pair12 : Nat
  deriving DecidableEq

namespace LocalBudget

/-- Read one named budget. -/
def remaining (budget : LocalBudget) : LocalConstraint → Nat
  | .use0 => budget.use0
  | .use1 => budget.use1
  | .use2 => budget.use2
  | .hO1_0 => budget.hO1_0
  | .hO2_0 => budget.hO2_0
  | .hS_1 => budget.hS_1
  | .hO2_1 => budget.hO2_1
  | .hS_2 => budget.hS_2
  | .hO1_2 => budget.hO1_2
  | .pair01 => budget.pair01
  | .pair02 => budget.pair02
  | .pair12 => budget.pair12

end LocalBudget

/-- Executable check that one count choice fits every remaining LOCAL budget. -/
def localCountFits (budget : LocalBudget) (cell : CountCell) (count : Nat) : Bool :=
  localConstraints.all fun constraint =>
    !constraintApplies constraint cell ||
      decide (count ≤ budget.remaining constraint)

/-- Subtract one count choice from every LOCAL budget consumed by its cell. -/
def subtractLocalBudget
    (budget : LocalBudget) (cell : CountCell) (count : Nat) : LocalBudget :=
  let next := fun constraint =>
    if constraintApplies constraint cell then
      budget.remaining constraint - count
    else
      budget.remaining constraint
  { use0 := next .use0
    use1 := next .use1
    use2 := next .use2
    hO1_0 := next .hO1_0
    hO2_0 := next .hO2_0
    hS_1 := next .hS_1
    hO2_1 := next .hO2_1
    hS_2 := next .hS_2
    hO1_2 := next .hO1_2
    pair01 := next .pair01
    pair02 := next .pair02
    pair12 := next .pair12 }

/-- Count-vector search pruned by center-use, H1, and pair-sharing budgets. -/
def localCountVectors : List CountCell → LocalBudget → List (List Nat)
  | [], budget =>
      if budget.use0 = 0 ∧ budget.use1 = 0 ∧ budget.use2 = 0 then
        [[]]
      else
        []
  | cell :: rest, budget =>
      (List.range 5).flatMap fun count =>
        if localCountFits budget cell count then
          (localCountVectors rest (subtractLocalBudget budget cell count)).map
            (count :: ·)
        else
          []

/-- Contribution of an aligned count vector to one named LOCAL constraint. -/
def requiredConstraint :
    List CountCell → List Nat → LocalConstraint → Nat
  | [], _, _ => 0
  | _, [], _ => 0
  | cell :: rest, count :: counts, constraint =>
      (if constraintApplies constraint cell then count else 0) +
        requiredConstraint rest counts constraint

/-- A budget covers all contributions of a target vector, with equality on the
three center-use constraints. -/
def LocalBudget.Covers
    (budget : LocalBudget) (cells : List CountCell) (counts : List Nat) : Prop :=
  (∀ constraint,
    requiredConstraint cells counts constraint ≤ budget.remaining constraint) ∧
  (∀ constraint, constraintExact constraint = true →
    budget.remaining constraint = requiredConstraint cells counts constraint)

/-- The executable fit check has its pointwise budget meaning. -/
theorem localCountFits_eq_true_iff
    {budget : LocalBudget} {cell : CountCell} {count : Nat} :
    localCountFits budget cell count = true ↔
      ∀ constraint, constraintApplies constraint cell = true →
        count ≤ budget.remaining constraint := by
  constructor
  · intro h constraint happlies
    rw [localCountFits, List.all_eq_true] at h
    have hmem : constraint ∈ localConstraints := by
      cases constraint <;> simp [localConstraints]
    simpa [happlies] using h constraint hmem
  · intro h
    rw [localCountFits, List.all_eq_true]
    intro constraint _hmem
    by_cases happlies : constraintApplies constraint cell = true
    · simp [happlies, h constraint happlies]
    · have hfalse : constraintApplies constraint cell = false :=
        Bool.eq_false_of_not_eq_true happlies
      simp [hfalse]

/-- Reading a subtracted budget gives pointwise truncated subtraction. -/
theorem subtractLocalBudget_remaining
    (budget : LocalBudget) (cell : CountCell) (count : Nat)
    (constraint : LocalConstraint) :
    (subtractLocalBudget budget cell count).remaining constraint =
      if constraintApplies constraint cell then
        budget.remaining constraint - count
      else
        budget.remaining constraint := by
  cases constraint <;>
    simp [subtractLocalBudget, LocalBudget.remaining]

/-- Every bounded vector covered by the initial LOCAL budget occurs in the
pruned LOCAL count search. -/
theorem mem_localCountVectors_of_covers
    {cells : List CountCell} {counts : List Nat} {budget : LocalBudget}
    (hlength : counts.length = cells.length)
    (hbounded : ∀ count ∈ counts, count < 5)
    (hcovers : budget.Covers cells counts) :
    counts ∈ localCountVectors cells budget := by
  induction cells generalizing counts budget with
  | nil =>
      cases counts with
      | nil =>
          have h0 := hcovers.2 .use0 rfl
          have h1 := hcovers.2 .use1 rfl
          have h2 := hcovers.2 .use2 rfl
          have h0' : budget.use0 = 0 := by
            simpa only [LocalBudget.remaining, requiredConstraint] using h0
          have h1' : budget.use1 = 0 := by
            simpa only [LocalBudget.remaining, requiredConstraint] using h1
          have h2' : budget.use2 = 0 := by
            simpa only [LocalBudget.remaining, requiredConstraint] using h2
          simp [localCountVectors, h0', h1', h2']
      | cons count counts => simp at hlength
  | cons cell rest ih =>
      cases counts with
      | nil => simp at hlength
      | cons count counts =>
          have hcount : count ∈ List.range 5 :=
            List.mem_range.mpr (hbounded count (by simp))
          have hfits :
              ∀ constraint, constraintApplies constraint cell = true →
                count ≤ budget.remaining constraint := by
            intro constraint happlies
            have hcover := hcovers.1 constraint
            simp [requiredConstraint, happlies] at hcover
            omega
          have hfitsBool : localCountFits budget cell count = true :=
            localCountFits_eq_true_iff.2 hfits
          have htailLength : counts.length = rest.length := by
            simpa using hlength
          have htailBounded : ∀ value ∈ counts, value < 5 := by
            intro value hvalue
            exact hbounded value (by simp [hvalue])
          have htailCovers :
              (subtractLocalBudget budget cell count).Covers rest counts := by
            constructor
            · intro constraint
              rw [subtractLocalBudget_remaining]
              by_cases happlies : constraintApplies constraint cell = true
              · simp only [happlies, if_true]
                have hcover := hcovers.1 constraint
                simp [requiredConstraint, happlies] at hcover
                omega
              · simp only [happlies]
                simpa [requiredConstraint, happlies] using hcovers.1 constraint
            · intro constraint hexact
              rw [subtractLocalBudget_remaining]
              by_cases happlies : constraintApplies constraint cell = true
              · simp only [happlies, if_true]
                have hcover := hcovers.2 constraint hexact
                simp [requiredConstraint, happlies] at hcover
                omega
              · simp only [happlies]
                simpa [requiredConstraint, happlies] using
                  hcovers.2 constraint hexact
          have htail := ih htailLength htailBounded htailCovers
          rw [localCountVectors]
          exact List.mem_flatMap.mpr
            ⟨count, hcount, by simp [hfitsBool, htail]⟩

/-- A choice of Moser masks before cap-count cells are assigned. -/
structure MoserAssignment where
  mask0 : Finset MoserVertex
  mask1 : Finset MoserVertex
  mask2 : Finset MoserVertex
  deriving DecidableEq

namespace MoserAssignment

/-- Read the mask assigned to one Moser vertex. -/
def maskAt (assignment : MoserAssignment) : MoserVertex -> Finset MoserVertex
  | ⟨0, _⟩ => assignment.mask0
  | ⟨1, _⟩ => assignment.mask1
  | ⟨2, _⟩ => assignment.mask2

end MoserAssignment

/-- All masks on the three Moser vertices, in raw-mask order. -/
def maskChoices : List (Finset MoserVertex) :=
  [RawClassRow.maskToFinset 0,
    RawClassRow.maskToFinset 1,
    RawClassRow.maskToFinset 2,
    RawClassRow.maskToFinset 3,
    RawClassRow.maskToFinset 4,
    RawClassRow.maskToFinset 5,
    RawClassRow.maskToFinset 6,
    RawClassRow.maskToFinset 7]

set_option linter.style.nativeDecide false in
/-- Raw mask zero decodes to the empty set. -/
@[simp] theorem maskToFinset_zero :
    RawClassRow.maskToFinset 0 = (∅ : Finset MoserVertex) := by
  native_decide

/-- Masks that avoid their source Moser vertex. -/
def masksAvoiding (z : MoserVertex) : List (Finset MoserVertex) :=
  maskChoices.filter fun mask => decide (z ∉ mask)

/-- All self-avoiding Moser-mask assignments. -/
def moserAssignments : List MoserAssignment :=
  (masksAvoiding 0).flatMap fun mask0 =>
    (masksAvoiding 1).flatMap fun mask1 =>
      (masksAvoiding 2).map fun mask2 =>
        ⟨mask0, mask1, mask2⟩

/-- Remaining center-use budget after fixing the Moser masks. -/
def remainingUses (assignment : MoserAssignment) (center : MoserVertex) : Nat :=
  4 - ((Finset.univ : Finset MoserVertex).filter
    (fun z => center ∈ assignment.maskAt z)).card

/-- A concrete three-center remaining-use budget, used to share count-vector
searches among Moser assignments with the same budget. -/
structure UseBudget where
  use0 : Nat
  use1 : Nat
  use2 : Nat
  deriving DecidableEq

namespace UseBudget

/-- Read one center's remaining use from a concrete budget. -/
def remaining (budget : UseBudget) : MoserVertex -> Nat
  | ⟨0, _⟩ => budget.use0
  | ⟨1, _⟩ => budget.use1
  | ⟨2, _⟩ => budget.use2

end UseBudget

/-- Remaining-use triple of one Moser assignment. -/
def budgetOf (assignment : MoserAssignment) : UseBudget where
  use0 := remainingUses assignment 0
  use1 := remainingUses assignment 1
  use2 := remainingUses assignment 2

/-- Reading `budgetOf` recovers the assignment's remaining-use function. -/
theorem budgetOf_remaining (assignment : MoserAssignment) :
    (budgetOf assignment).remaining = remainingUses assignment := by
  funext center
  fin_cases center <;> rfl

/-- Distinct remaining-use triples represented by the Moser assignments. -/
def useBudgets : List UseBudget :=
  (moserAssignments.map budgetOf).dedup

/-- Moser assignments with one fixed remaining-use triple. -/
def assignmentsFor (budget : UseBudget) : List MoserAssignment :=
  moserAssignments.filter fun assignment => decide (budgetOf assignment = budget)

/-- Moser-vertex contribution to one H1 cap budget. -/
def assignmentH1Use (assignment : MoserAssignment) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  ([0, 1, 2].map fun z =>
    if z ∈ cap.vertices ∧ z ≠ center ∧ center ∈ assignment.maskAt z then
      1
    else
      0).sum

/-- Moser-vertex contribution to one pair-sharing budget. -/
def assignmentPairUse (assignment : MoserAssignment)
    (left right : MoserVertex) : Nat :=
  ([0, 1, 2].map fun z =>
    if left ∈ assignment.maskAt z ∧ right ∈ assignment.maskAt z then
      1
    else
      0).sum

/-- Full LOCAL search budget determined by one Moser-mask assignment. -/
def localBudgetOf (assignment : MoserAssignment) : LocalBudget where
  use0 := remainingUses assignment 0
  use1 := remainingUses assignment 1
  use2 := remainingUses assignment 2
  hO1_0 := 1 - assignmentH1Use assignment .O1 0
  hO2_0 := 1 - assignmentH1Use assignment .O2 0
  hS_1 := 1 - assignmentH1Use assignment .S 1
  hO2_1 := 1 - assignmentH1Use assignment .O2 1
  hS_2 := 1 - assignmentH1Use assignment .S 2
  hO1_2 := 1 - assignmentH1Use assignment .O1 2
  pair01 := 2 - assignmentPairUse assignment 0 1
  pair02 := 2 - assignmentPairUse assignment 0 2
  pair12 := 2 - assignmentPairUse assignment 1 2

/-- Distinct full LOCAL budgets represented by the Moser assignments. -/
def localBudgets : List LocalBudget :=
  (moserAssignments.map localBudgetOf).dedup

/-- Moser assignments with one fixed full LOCAL budget. -/
def assignmentsForLocal (budget : LocalBudget) : List MoserAssignment :=
  moserAssignments.filter fun assignment => decide (localBudgetOf assignment = budget)

/-- Raw generated-row shape associated with one search leaf. -/
def rowOfData (assignment : MoserAssignment) (counts : List Nat) : RawClassRow where
  id := 0
  firstN := 0
  lastN := 0
  participantsMask := 7
  moser0 := RawClassRow.finsetMask assignment.mask0
  moser1 := RawClassRow.finsetMask assignment.mask1
  moser2 := RawClassRow.finsetMask assignment.mask2
  counts := counts

/-- All rows generated from center-use-complete count vectors. -/
def unprunedRows : List RawClassRow :=
  useBudgets.flatMap fun budget =>
    let vectors := countVectors countCells budget.remaining
    (assignmentsFor budget).flatMap fun assignment =>
      vectors.map (rowOfData assignment)

/-- Rows generated by the center-use, H1, and pair-pruned LOCAL search. -/
def rows : List RawClassRow :=
  localBudgets.flatMap fun budget =>
    let vectors := localCountVectors countCells budget
    (assignmentsForLocal budget).flatMap fun assignment =>
      vectors.map (rowOfData assignment)

/-- The seven nonempty raw masks in count-vector order. -/
def rawMasks : List Nat := [1, 2, 3, 4, 5, 6, 7]

/-- Read one raw Moser mask without constructing a finite set. -/
def rawMoserMaskAt (row : RawClassRow) : MoserVertex → Nat
  | ⟨0, _⟩ => row.moser0
  | ⟨1, _⟩ => row.moser1
  | ⟨2, _⟩ => row.moser2

/-- Fast raw cap-use sum over the seven count slots of one cap. -/
def rawCapUse (row : RawClassRow) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  (rawMasks.map fun mask =>
    if RawClassRow.maskContains mask center then row.countAtMask cap mask else 0).sum

/-- Fast raw H1 use over the three Moser masks and one cap count block. -/
def rawH1Use (row : RawClassRow) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  ([0, 1, 2].map fun z =>
    if z ∈ cap.vertices ∧ z ≠ center ∧
        RawClassRow.maskContains (rawMoserMaskAt row z) center = true then
      1
    else
      0).sum + rawCapUse row cap center

/-- Fast raw shared count for one pair in one cap. -/
def rawPairSharedInCap (row : RawClassRow) (cap : JointCap)
    (left right : MoserVertex) : Nat :=
  (rawMasks.map fun mask =>
    if RawClassRow.maskContains mask left ∧
        RawClassRow.maskContains mask right then
      row.countAtMask cap mask
    else
      0).sum

/-- Fast raw total shared count for one pair. -/
def rawPairShared (row : RawClassRow)
    (left right : MoserVertex) : Nat :=
  ([0, 1, 2].map fun z =>
    if RawClassRow.maskContains (rawMoserMaskAt row z) left ∧
        RawClassRow.maskContains (rawMoserMaskAt row z) right then
      1
    else
      0).sum +
    (rawPairSharedInCap row .S left right +
      rawPairSharedInCap row .O1 left right +
        rawPairSharedInCap row .O2 left right)

/-- Constant-time count lookup after one conversion of a raw count list. -/
def arrayCountAtMask (counts : Array Nat) (cap : JointCap) (mask : Nat) : Nat :=
  if 1 ≤ mask ∧ mask ≤ 7 then
    counts.getD (RawClassRow.capOffset cap + (mask - 1)) 0
  else
    0

/-- Array-backed cap-use sum. -/
def arrayCapUse (counts : Array Nat) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  (rawMasks.map fun mask =>
    if RawClassRow.maskContains mask center then
      arrayCountAtMask counts cap mask
    else
      0).sum

/-- Array-backed H1 use. -/
def arrayH1Use (row : RawClassRow) (counts : Array Nat) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  ([0, 1, 2].map fun z =>
    if z ∈ cap.vertices ∧ z ≠ center ∧
        RawClassRow.maskContains (rawMoserMaskAt row z) center = true then
      1
    else
      0).sum + arrayCapUse counts cap center

/-- Array-backed shared count for one pair in one cap. -/
def arrayPairSharedInCap (counts : Array Nat) (cap : JointCap)
    (left right : MoserVertex) : Nat :=
  (rawMasks.map fun mask =>
    if RawClassRow.maskContains mask left ∧
        RawClassRow.maskContains mask right then
      arrayCountAtMask counts cap mask
    else
      0).sum

/-- Array-backed total shared count for one pair. -/
def arrayPairShared (row : RawClassRow) (counts : Array Nat)
    (left right : MoserVertex) : Nat :=
  ([0, 1, 2].map fun z =>
    if RawClassRow.maskContains (rawMoserMaskAt row z) left ∧
        RawClassRow.maskContains (rawMoserMaskAt row z) right then
      1
    else
      0).sum +
    (arrayPairSharedInCap counts .S left right +
      arrayPairSharedInCap counts .O1 left right +
        arrayPairSharedInCap counts .O2 left right)

/-- The profile-independent checks not already enforced structurally by the
pruned search.  The three pair conditions are symmetric, so one orientation
of each unordered pair suffices. -/
def AcceptedLocalChecks (cls : JointClass) : Prop :=
  cls.h1UseInCap .O1 0 ≤ 1 ∧
    cls.h1UseInCap .O2 0 ≤ 1 ∧
      cls.h1UseInCap .S 1 ≤ 1 ∧
        cls.h1UseInCap .O2 1 ≤ 1 ∧
          cls.h1UseInCap .S 2 ≤ 1 ∧
            cls.h1UseInCap .O1 2 ≤ 1 ∧
              cls.pairSharedCount 0 1 ≤ 2 ∧
                cls.pairSharedCount 0 2 ≤ 2 ∧
                  cls.pairSharedCount 1 2 ≤ 2 ∧
                    (cls.pairSharedInCap .O2 0 1 = 0 ∧
                      (cls.pairSharedInCap .S 0 1 = 0 ∨
                        cls.pairSharedInCap .O1 0 1 = 0)) ∧
                    (cls.pairSharedInCap .O1 0 2 = 0 ∧
                      (cls.pairSharedInCap .S 0 2 = 0 ∨
                        cls.pairSharedInCap .O2 0 2 = 0)) ∧
                    (cls.pairSharedInCap .S 1 2 = 0 ∧
                      (cls.pairSharedInCap .O1 1 2 = 0 ∨
                        cls.pairSharedInCap .O2 1 2 = 0))

/-- Explicit Moser-vertex list used by the fast LOCAL checker. -/
def moserVertices : List MoserVertex := [0, 1, 2]

/-- Fast cap-use sum over the seven explicit nonempty masks. -/
def fastCapUse (cls : JointClass) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  (LocalClassEncoding.countMasks.map fun mask =>
    if center ∈ mask then cls.capCounts cap mask else 0).sum

/-- Fast H1 use over the three explicit Moser vertices and seven count masks. -/
def fastH1Use (cls : JointClass) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  (moserVertices.map fun z =>
    if z ∈ cap.vertices ∧ z ≠ center ∧ center ∈ cls.moserMask z then 1 else 0).sum +
      fastCapUse cls cap center

/-- Fast shared interior count for one pair in one cap. -/
def fastPairSharedInCap (cls : JointClass) (cap : JointCap)
    (left right : MoserVertex) : Nat :=
  let pair := JointClass.pairMask left right
  (LocalClassEncoding.countMasks.map fun mask =>
    if pair ⊆ mask then cls.capCounts cap mask else 0).sum

/-- Fast total shared count for one pair. -/
def fastPairShared (cls : JointClass)
    (left right : MoserVertex) : Nat :=
  let pair := JointClass.pairMask left right
  (moserVertices.map fun z => if pair ⊆ cls.moserMask z then 1 else 0).sum +
    (fastPairSharedInCap cls .S left right +
      fastPairSharedInCap cls .O1 left right +
        fastPairSharedInCap cls .O2 left right)

/-- Fast explicit-list form of the profile-independent accepted-row checks. -/
def fastAcceptedLocalChecks (cls : JointClass) : Bool :=
  [decide (fastH1Use cls .O1 0 ≤ 1),
    decide (fastH1Use cls .O2 0 ≤ 1),
    decide (fastH1Use cls .S 1 ≤ 1),
    decide (fastH1Use cls .O2 1 ≤ 1),
    decide (fastH1Use cls .S 2 ≤ 1),
    decide (fastH1Use cls .O1 2 ≤ 1),
    decide (fastPairShared cls 0 1 ≤ 2),
    decide (fastPairShared cls 0 2 ≤ 2),
    decide (fastPairShared cls 1 2 ≤ 2),
    decide (fastPairSharedInCap cls .O2 0 1 = 0),
    decide (fastPairSharedInCap cls .S 0 1 = 0 ∨
      fastPairSharedInCap cls .O1 0 1 = 0),
    decide (fastPairSharedInCap cls .O1 0 2 = 0),
    decide (fastPairSharedInCap cls .S 0 2 = 0 ∨
      fastPairSharedInCap cls .O2 0 2 = 0),
    decide (fastPairSharedInCap cls .S 1 2 = 0),
    decide (fastPairSharedInCap cls .O1 1 2 = 0 ∨
      fastPairSharedInCap cls .O2 1 2 = 0)].all id

/-- Raw executable form of the profile-independent accepted-row checks. -/
def rawAcceptedLocalChecks (row : RawClassRow) : Bool :=
  [decide (rawH1Use row .O1 0 ≤ 1),
    decide (rawH1Use row .O2 0 ≤ 1),
    decide (rawH1Use row .S 1 ≤ 1),
    decide (rawH1Use row .O2 1 ≤ 1),
    decide (rawH1Use row .S 2 ≤ 1),
    decide (rawH1Use row .O1 2 ≤ 1),
    decide (rawPairShared row 0 1 ≤ 2),
    decide (rawPairShared row 0 2 ≤ 2),
    decide (rawPairShared row 1 2 ≤ 2),
    decide (rawPairSharedInCap row .O2 0 1 = 0),
    decide (rawPairSharedInCap row .S 0 1 = 0 ∨
      rawPairSharedInCap row .O1 0 1 = 0),
    decide (rawPairSharedInCap row .O1 0 2 = 0),
    decide (rawPairSharedInCap row .S 0 2 = 0 ∨
      rawPairSharedInCap row .O2 0 2 = 0),
    decide (rawPairSharedInCap row .S 1 2 = 0),
    decide (rawPairSharedInCap row .O1 1 2 = 0 ∨
      rawPairSharedInCap row .O2 1 2 = 0)].all id

/-- Array-backed executable form of the accepted-row checks. -/
def arrayAcceptedLocalChecks (row : RawClassRow) : Bool :=
  let counts := row.counts.toArray
  [decide (arrayH1Use row counts .O1 0 ≤ 1),
    decide (arrayH1Use row counts .O2 0 ≤ 1),
    decide (arrayH1Use row counts .S 1 ≤ 1),
    decide (arrayH1Use row counts .O2 1 ≤ 1),
    decide (arrayH1Use row counts .S 2 ≤ 1),
    decide (arrayH1Use row counts .O1 2 ≤ 1),
    decide (arrayPairShared row counts 0 1 ≤ 2),
    decide (arrayPairShared row counts 0 2 ≤ 2),
    decide (arrayPairShared row counts 1 2 ≤ 2),
    decide (arrayPairSharedInCap counts .O2 0 1 = 0),
    decide (arrayPairSharedInCap counts .S 0 1 = 0 ∨
      arrayPairSharedInCap counts .O1 0 1 = 0),
    decide (arrayPairSharedInCap counts .O1 0 2 = 0),
    decide (arrayPairSharedInCap counts .S 0 2 = 0 ∨
      arrayPairSharedInCap counts .O2 0 2 = 0),
    decide (arrayPairSharedInCap counts .S 1 2 = 0),
    decide (arrayPairSharedInCap counts .O1 1 2 = 0 ∨
      arrayPairSharedInCap counts .O2 1 2 = 0)].all id

/-- Executable form of the profile-independent accepted-row checks. -/
def acceptedLocalChecks (cls : JointClass) : Bool :=
  [decide (cls.h1UseInCap .O1 0 ≤ 1),
    decide (cls.h1UseInCap .O2 0 ≤ 1),
    decide (cls.h1UseInCap .S 1 ≤ 1),
    decide (cls.h1UseInCap .O2 1 ≤ 1),
    decide (cls.h1UseInCap .S 2 ≤ 1),
    decide (cls.h1UseInCap .O1 2 ≤ 1),
    decide (cls.pairSharedCount 0 1 ≤ 2),
    decide (cls.pairSharedCount 0 2 ≤ 2),
    decide (cls.pairSharedCount 1 2 ≤ 2),
    decide (cls.pairSharedInCap .O2 0 1 = 0),
    decide (cls.pairSharedInCap .S 0 1 = 0 ∨
      cls.pairSharedInCap .O1 0 1 = 0),
    decide (cls.pairSharedInCap .O1 0 2 = 0),
    decide (cls.pairSharedInCap .S 0 2 = 0 ∨
      cls.pairSharedInCap .O2 0 2 = 0),
    decide (cls.pairSharedInCap .S 1 2 = 0),
    decide (cls.pairSharedInCap .O1 1 2 = 0 ∨
      cls.pairSharedInCap .O2 1 2 = 0)].all id

/-- The executable accepted-row checks have the stated semantic meaning. -/
theorem acceptedLocalChecks_eq_true_iff {cls : JointClass} :
    acceptedLocalChecks cls = true ↔ AcceptedLocalChecks cls := by
  simp [acceptedLocalChecks, AcceptedLocalChecks]
  aesop

/-- Search rows that satisfy every profile-independent LOCAL condition. -/
def acceptedRows : List RawClassRow :=
  rows.filter arrayAcceptedLocalChecks

/-- Encode one semantic class as a Moser-mask assignment. -/
def assignmentOfClass (cls : JointClass) : MoserAssignment where
  mask0 := cls.moserMask 0
  mask1 := cls.moserMask 1
  mask2 := cls.moserMask 2

/-- Reading the assignment of a semantic class recovers its Moser masks. -/
theorem assignmentOfClass_maskAt (cls : JointClass) :
    (assignmentOfClass cls).maskAt = cls.moserMask := by
  funext z
  fin_cases z <;> rfl

set_option linter.style.nativeDecide false in
/-- Every three-center mask occurs in the explicit raw-mask list. -/
theorem mem_maskChoices (mask : Finset MoserVertex) : mask ∈ maskChoices := by
  native_decide +revert

/-- Supported semantic masks occur in the finite Moser-assignment search. -/
theorem assignmentOfClass_mem_moserAssignments
    {cls : JointClass} (hsupported : cls.Supported) :
    assignmentOfClass cls ∈ moserAssignments := by
  refine List.mem_flatMap.mpr ⟨cls.moserMask 0, ?_, ?_⟩
  · simp [masksAvoiding, mem_maskChoices, (hsupported.1 0).2]
  refine List.mem_flatMap.mpr ⟨cls.moserMask 1, ?_, ?_⟩
  · simp [masksAvoiding, mem_maskChoices, (hsupported.1 1).2]
  exact List.mem_map.mpr ⟨cls.moserMask 2,
    by simp [masksAvoiding, mem_maskChoices, (hsupported.1 2).2], rfl⟩

/-- The 21 semantic cap counts aligned with `countCells`. -/
def countsOfClass (cls : JointClass) : List Nat :=
  countCells.map fun cell => cls.capCounts cell.1 cell.2

/-- The enumerator and generated-row encoders use the same count order. -/
theorem countsOfClass_eq_encoding (cls : JointClass) :
    countsOfClass cls = LocalClassEncoding.countsOfClass cls := by
  unfold countsOfClass countCells cellsForCap
  simp only [
    LocalClassEncoding.countsOfClass, LocalClassEncoding.countsForCap,
    List.map_append, List.map_map]
  rfl

set_option linter.style.nativeDecide false in
/-- Explicit finite list of cap names. -/
theorem jointCap_univ :
    (Finset.univ : Finset JointCap) = {.S, .O1, .O2} := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Explicit finite list of masks on the three Moser vertices. -/
theorem allMasks_eq :
    JointClass.allMasks =
      {∅, {0}, {1}, {0, 1}, {2}, {0, 2}, {1, 2}, {0, 1, 2}} := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The explicit nonempty-mask list has no repetitions. -/
theorem countMasks_nodup : LocalClassEncoding.countMasks.Nodup := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The explicit count-mask list is the full mask set with the empty mask
removed. -/
theorem countMasks_toFinset :
    LocalClassEncoding.countMasks.toFinset = JointClass.allMasks.erase ∅ := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The explicit Moser-vertex list has no repetitions. -/
theorem moserVertices_nodup : moserVertices.Nodup := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The explicit Moser-vertex list contains every Moser vertex. -/
theorem moserVertices_toFinset :
    moserVertices.toFinset = (Finset.univ : Finset MoserVertex) := by
  native_decide

/-- A Boolean sum over the explicit vertex list is the corresponding filtered
cardinality. -/
theorem sum_moserVertices_boole
    (predicate : MoserVertex → Prop) [DecidablePred predicate] :
    (moserVertices.map fun z => if predicate z then 1 else 0).sum =
      ((Finset.univ : Finset MoserVertex).filter predicate).card := by
  rw [← List.sum_toFinset _ moserVertices_nodup, moserVertices_toFinset]
  rw [Finset.card_eq_sum_ones, Finset.sum_filter]

/-- Summing one center's contributions over the explicit mask list recovers
the semantic cap-use count. -/
theorem countMasks_use_eq_capUse
    (cls : JointClass) (cap : JointCap) (center : MoserVertex) :
    (LocalClassEncoding.countMasks.map fun mask =>
      if center ∈ mask then cls.capCounts cap mask else 0).sum =
        cls.capUseCount cap center := by
  rw [← List.sum_toFinset _ countMasks_nodup, countMasks_toFinset]
  rw [JointClass.capUseCount, Finset.sum_filter]
  apply Finset.sum_subset (Finset.erase_subset _ _)
  intro mask hmask hnot
  have hmaskEmpty : mask = ∅ := by
    by_contra hne
    exact hnot (Finset.mem_erase.mpr ⟨hne, hmask⟩)
  simp [hmaskEmpty]

/-- The fast cap-use computation agrees with the semantic finite-set sum. -/
theorem fastCapUse_eq_capUseCount
    (cls : JointClass) (cap : JointCap) (center : MoserVertex) :
    fastCapUse cls cap center = cls.capUseCount cap center := by
  exact countMasks_use_eq_capUse cls cap center

/-- The fast H1 computation agrees with the semantic finite-set sum. -/
theorem fastH1Use_eq_h1UseInCap
    (cls : JointClass) (cap : JointCap) (center : MoserVertex) :
    fastH1Use cls cap center = cls.h1UseInCap cap center := by
  have hfilter :
      ((Finset.univ : Finset MoserVertex).filter fun z =>
          z ∈ cap.vertices ∧ z ≠ center ∧ center ∈ cls.moserMask z) =
        cap.vertices.filter
          (fun z => z ≠ center ∧ center ∈ cls.moserMask z) := by
    ext z
    simp
  rw [fastH1Use, sum_moserVertices_boole, fastCapUse_eq_capUseCount]
  rw [JointClass.h1UseInCap, hfilter]

/-- The fast shared-cap computation agrees with the semantic finite-set sum. -/
theorem fastPairSharedInCap_eq_pairSharedInCap
    (cls : JointClass) (cap : JointCap) (left right : MoserVertex) :
    fastPairSharedInCap cls cap left right =
      cls.pairSharedInCap cap left right := by
  rw [fastPairSharedInCap, ← List.sum_toFinset _ countMasks_nodup,
    countMasks_toFinset]
  rw [JointClass.pairSharedInCap, Finset.sum_filter]
  apply Finset.sum_subset (Finset.erase_subset _ _)
  intro mask hmask hnot
  have hmaskEmpty : mask = ∅ := by
    by_contra hne
    exact hnot (Finset.mem_erase.mpr ⟨hne, hmask⟩)
  simp [hmaskEmpty, JointClass.pairMask]

/-- The fast total pair-sharing computation agrees with the semantic sum. -/
theorem fastPairShared_eq_pairSharedCount
    (cls : JointClass) (left right : MoserVertex) :
    fastPairShared cls left right = cls.pairSharedCount left right := by
  rw [fastPairShared, sum_moserVertices_boole,
    fastPairSharedInCap_eq_pairSharedInCap,
    fastPairSharedInCap_eq_pairSharedInCap,
    fastPairSharedInCap_eq_pairSharedInCap]
  simp [JointClass.pairSharedCount, JointClass.pairSharedInCap,
    jointCap_univ, Nat.add_assoc]

/-- The fast accepted-row checker is extensionally the semantic checker. -/
theorem fastAcceptedLocalChecks_eq (cls : JointClass) :
    fastAcceptedLocalChecks cls = acceptedLocalChecks cls := by
  simp [fastAcceptedLocalChecks, acceptedLocalChecks,
    fastH1Use_eq_h1UseInCap, fastPairShared_eq_pairSharedCount,
    fastPairSharedInCap_eq_pairSharedInCap]

/-- The raw cap-use computation agrees with semantic decoding. -/
theorem rawCapUse_eq_capUseCount
    (row : RawClassRow) (cap : JointCap) (center : MoserVertex) :
    rawCapUse row cap center = row.toJointClass.capUseCount cap center := by
  calc
    rawCapUse row cap center = fastCapUse row.toJointClass cap center := by
      fin_cases cap <;> fin_cases center <;>
        simp [rawCapUse, rawMasks, fastCapUse,
          LocalClassEncoding.countMasks, RawClassRow.toJointClass,
          RawClassRow.countAt, RawClassRow.countAtMask,
          RawClassRow.finsetMask, RawClassRow.vertexBit,
          RawClassRow.maskContains]
    _ = row.toJointClass.capUseCount cap center :=
      fastCapUse_eq_capUseCount _ _ _

/-- The raw H1 computation agrees with semantic decoding. -/
theorem rawH1Use_eq_h1UseInCap
    (row : RawClassRow) (cap : JointCap) (center : MoserVertex) :
    rawH1Use row cap center = row.toJointClass.h1UseInCap cap center := by
  calc
    rawH1Use row cap center = fastH1Use row.toJointClass cap center := by
      fin_cases cap <;> fin_cases center <;>
        simp [rawH1Use, rawMoserMaskAt, fastH1Use, moserVertices,
          RawClassRow.toJointClass, RawClassRow.moserMaskAt,
          RawClassRow.maskToFinset, RawClassRow.maskContains,
          rawCapUse_eq_capUseCount, fastCapUse_eq_capUseCount]
    _ = row.toJointClass.h1UseInCap cap center :=
      fastH1Use_eq_h1UseInCap _ _ _

/-- The raw shared-cap computation agrees with semantic decoding. -/
theorem rawPairSharedInCap_eq_pairSharedInCap
    (row : RawClassRow) (cap : JointCap) (left right : MoserVertex) :
    rawPairSharedInCap row cap left right =
      row.toJointClass.pairSharedInCap cap left right := by
  calc
    rawPairSharedInCap row cap left right =
        fastPairSharedInCap row.toJointClass cap left right := by
      fin_cases cap <;> fin_cases left <;> fin_cases right <;>
        simp [rawPairSharedInCap, rawMasks, fastPairSharedInCap,
          LocalClassEncoding.countMasks, JointClass.pairMask,
          RawClassRow.toJointClass, RawClassRow.countAt,
          RawClassRow.countAtMask, RawClassRow.finsetMask,
          RawClassRow.vertexBit, RawClassRow.maskContains,
          Finset.subset_iff]
    _ = row.toJointClass.pairSharedInCap cap left right :=
      fastPairSharedInCap_eq_pairSharedInCap _ _ _ _

/-- The raw total pair-sharing computation agrees with semantic decoding. -/
theorem rawPairShared_eq_pairSharedCount
    (row : RawClassRow) (left right : MoserVertex) :
    rawPairShared row left right =
      row.toJointClass.pairSharedCount left right := by
  calc
    rawPairShared row left right =
        fastPairShared row.toJointClass left right := by
      fin_cases left <;> fin_cases right <;>
        simp [rawPairShared, rawMoserMaskAt, fastPairShared,
          moserVertices, JointClass.pairMask, RawClassRow.toJointClass,
          RawClassRow.moserMaskAt, RawClassRow.maskToFinset,
          RawClassRow.maskContains,
          rawPairSharedInCap_eq_pairSharedInCap,
          fastPairSharedInCap_eq_pairSharedInCap, Finset.subset_iff,
          Nat.add_assoc]
    _ = row.toJointClass.pairSharedCount left right :=
      fastPairShared_eq_pairSharedCount _ _ _

/-- The raw accepted-row checker is extensionally the semantic checker. -/
theorem rawAcceptedLocalChecks_eq (row : RawClassRow) :
    rawAcceptedLocalChecks row = acceptedLocalChecks row.toJointClass := by
  simp [rawAcceptedLocalChecks, acceptedLocalChecks,
    rawH1Use_eq_h1UseInCap, rawPairShared_eq_pairSharedCount,
    rawPairSharedInCap_eq_pairSharedInCap]

/-- Array lookup after `List.toArray` agrees with list lookup. -/
theorem array_getD_toArray
    (values : List Nat) (index fallback : Nat) :
    values.toArray.getD index fallback = values.getD index fallback := by
  by_cases hindex : index < values.length
  · simp [Array.getD, List.getD, hindex]
  · simp [Array.getD, List.getD, hindex]

/-- Array-backed count lookup agrees with raw-row count lookup. -/
theorem arrayCountAtMask_toArray
    (row : RawClassRow) (cap : JointCap) (mask : Nat) :
    arrayCountAtMask row.counts.toArray cap mask = row.countAtMask cap mask := by
  simp [arrayCountAtMask, RawClassRow.countAtMask]

/-- Array-backed cap use agrees with raw cap use. -/
theorem arrayCapUse_toArray
    (row : RawClassRow) (cap : JointCap) (center : MoserVertex) :
    arrayCapUse row.counts.toArray cap center = rawCapUse row cap center := by
  simp [arrayCapUse, rawCapUse, arrayCountAtMask_toArray]

/-- Array-backed H1 use agrees with raw H1 use. -/
theorem arrayH1Use_toArray
    (row : RawClassRow) (cap : JointCap) (center : MoserVertex) :
    arrayH1Use row row.counts.toArray cap center = rawH1Use row cap center := by
  simp [arrayH1Use, rawH1Use, arrayCapUse_toArray]

/-- Array-backed cap sharing agrees with raw cap sharing. -/
theorem arrayPairSharedInCap_toArray
    (row : RawClassRow) (cap : JointCap) (left right : MoserVertex) :
    arrayPairSharedInCap row.counts.toArray cap left right =
      rawPairSharedInCap row cap left right := by
  simp [arrayPairSharedInCap, rawPairSharedInCap,
    arrayCountAtMask_toArray]

/-- Array-backed total sharing agrees with raw total sharing. -/
theorem arrayPairShared_toArray
    (row : RawClassRow) (left right : MoserVertex) :
    arrayPairShared row row.counts.toArray left right =
      rawPairShared row left right := by
  simp [arrayPairShared, rawPairShared, arrayPairSharedInCap_toArray]

/-- The array-backed checker agrees with the raw list checker. -/
theorem arrayAcceptedLocalChecks_eq_raw (row : RawClassRow) :
    arrayAcceptedLocalChecks row = rawAcceptedLocalChecks row := by
  simp [arrayAcceptedLocalChecks, rawAcceptedLocalChecks,
    arrayH1Use_toArray, arrayPairShared_toArray,
    arrayPairSharedInCap_toArray]

/-- The array-backed checker is extensionally the semantic checker. -/
theorem arrayAcceptedLocalChecks_eq (row : RawClassRow) :
    arrayAcceptedLocalChecks row = acceptedLocalChecks row.toJointClass :=
  (arrayAcceptedLocalChecks_eq_raw row).trans (rawAcceptedLocalChecks_eq row)

/-- `requiredUse` on a mapped cell list is the corresponding list sum. -/
theorem requiredUse_map
    (cells : List CountCell) (value : CountCell -> Nat)
    (center : MoserVertex) :
    requiredUse cells (cells.map value) center =
      (cells.map fun cell =>
        if center ∈ cell.2 then value cell else 0).sum := by
  induction cells with
  | nil => simp [requiredUse]
  | cons cell rest ih => simp [requiredUse, ih]

/-- The aligned count vector contributes exactly the sum of the three cap-use
counts at a center. -/
theorem requiredUse_countsOfClass (cls : JointClass) (center : MoserVertex) :
    requiredUse countCells (countsOfClass cls) center =
      (Finset.univ : Finset JointCap).sum
        (fun cap => cls.capUseCount cap center) := by
  rw [countsOfClass, requiredUse_map]
  simp only [countCells, cellsForCap, List.map_append, List.sum_append,
    List.map_map]
  change
    (LocalClassEncoding.countMasks.map fun mask =>
      if center ∈ mask then cls.capCounts .S mask else 0).sum +
      (LocalClassEncoding.countMasks.map fun mask =>
        if center ∈ mask then cls.capCounts .O1 mask else 0).sum +
      (LocalClassEncoding.countMasks.map fun mask =>
        if center ∈ mask then cls.capCounts .O2 mask else 0).sum =
      (Finset.univ : Finset JointCap).sum
        (fun cap => cls.capUseCount cap center)
  rw [countMasks_use_eq_capUse cls .S center,
    countMasks_use_eq_capUse cls .O1 center,
    countMasks_use_eq_capUse cls .O2 center]
  simp [jointCap_univ, Nat.add_assoc]

/-- `requiredConstraint` on a mapped cell list is the corresponding list sum. -/
theorem requiredConstraint_map
    (cells : List CountCell) (value : CountCell → Nat)
    (constraint : LocalConstraint) :
    requiredConstraint cells (cells.map value) constraint =
      (cells.map fun cell =>
        if constraintApplies constraint cell then value cell else 0).sum := by
  induction cells with
  | nil => simp [requiredConstraint]
  | cons cell rest ih => simp [requiredConstraint, ih]

/-- The three exact constraint contributions agree with `requiredUse`. -/
theorem requiredConstraint_use_eq_requiredUse
    (cells : List CountCell) (counts : List Nat) :
    requiredConstraint cells counts .use0 = requiredUse cells counts 0 ∧
      requiredConstraint cells counts .use1 = requiredUse cells counts 1 ∧
        requiredConstraint cells counts .use2 = requiredUse cells counts 2 := by
  induction cells generalizing counts with
  | nil => simp [requiredConstraint, requiredUse]
  | cons cell rest ih =>
      cases counts with
      | nil => simp [requiredConstraint, requiredUse]
      | cons count counts =>
          simpa [requiredConstraint, requiredUse, constraintApplies] using ih counts

/-- Containing a two-center mask is equivalent to containing both centers. -/
theorem pairMask_subset_iff
    (left right : MoserVertex) (mask : Finset MoserVertex) :
    JointClass.pairMask left right ⊆ mask ↔ left ∈ mask ∧ right ∈ mask := by
  constructor
  · intro hsubset
    exact ⟨hsubset (by simp [JointClass.pairMask]),
      hsubset (by simp [JointClass.pairMask])⟩
  · rintro ⟨hleft, hright⟩ vertex hvertex
    have hvertex' : vertex = left ∨ vertex = right := by
      simpa only [JointClass.pairMask, Finset.mem_insert,
        Finset.mem_singleton] using hvertex
    rcases hvertex' with rfl | rfl
    · exact hleft
    · exact hright

/-- The explicit count-mask pair sum is the semantic shared-cap count. -/
theorem countMasks_pair_eq_pairSharedInCap
    (cls : JointClass) (cap : JointCap) (left right : MoserVertex) :
    (LocalClassEncoding.countMasks.map fun mask =>
      if left ∈ mask ∧ right ∈ mask then cls.capCounts cap mask else 0).sum =
        cls.pairSharedInCap cap left right := by
  rw [← fastPairSharedInCap_eq_pairSharedInCap cls cap left right]
  simp [fastPairSharedInCap, pairMask_subset_iff]

/-- Semantic contribution represented by one finite LOCAL search constraint. -/
def semanticConstraintUse (cls : JointClass) : LocalConstraint → Nat
  | .use0 => (Finset.univ : Finset JointCap).sum
      (fun cap => cls.capUseCount cap 0)
  | .use1 => (Finset.univ : Finset JointCap).sum
      (fun cap => cls.capUseCount cap 1)
  | .use2 => (Finset.univ : Finset JointCap).sum
      (fun cap => cls.capUseCount cap 2)
  | .hO1_0 => cls.capUseCount .O1 0
  | .hO2_0 => cls.capUseCount .O2 0
  | .hS_1 => cls.capUseCount .S 1
  | .hO2_1 => cls.capUseCount .O2 1
  | .hS_2 => cls.capUseCount .S 2
  | .hO1_2 => cls.capUseCount .O1 2
  | .pair01 => cls.pairSharedInCap .S 0 1 +
      cls.pairSharedInCap .O1 0 1 + cls.pairSharedInCap .O2 0 1
  | .pair02 => cls.pairSharedInCap .S 0 2 +
      cls.pairSharedInCap .O1 0 2 + cls.pairSharedInCap .O2 0 2
  | .pair12 => cls.pairSharedInCap .S 1 2 +
      cls.pairSharedInCap .O1 1 2 + cls.pairSharedInCap .O2 1 2

/-- Constraint contributions of a semantic class are exactly the named cap-use
and pair-sharing quantities. -/
theorem requiredConstraint_countsOfClass
    (cls : JointClass) (constraint : LocalConstraint) :
    requiredConstraint countCells (countsOfClass cls) constraint =
      semanticConstraintUse cls constraint := by
  rcases requiredConstraint_use_eq_requiredUse countCells (countsOfClass cls) with
    ⟨huse0, huse1, huse2⟩
  cases constraint with
  | use0 => simpa [semanticConstraintUse] using
      huse0.trans (requiredUse_countsOfClass cls 0)
  | use1 => simpa [semanticConstraintUse] using
      huse1.trans (requiredUse_countsOfClass cls 1)
  | use2 => simpa [semanticConstraintUse] using
      huse2.trans (requiredUse_countsOfClass cls 2)
  | hO1_0 | hO2_0 | hS_1 | hO2_1 | hS_2 | hO1_2 =>
      rw [countsOfClass, requiredConstraint_map]
      simp [countCells, cellsForCap, constraintApplies,
        semanticConstraintUse, Function.comp_def,
        countMasks_use_eq_capUse]
  | pair01 | pair02 | pair12 =>
      rw [countsOfClass, requiredConstraint_map]
      simp [countCells, cellsForCap, constraintApplies,
        semanticConstraintUse, Function.comp_def,
        countMasks_pair_eq_pairSharedInCap, Nat.add_assoc]

/-- The assignment H1 contribution of a semantic class is its filtered Moser
vertex count. -/
theorem assignmentH1Use_assignmentOfClass
    (cls : JointClass) (cap : JointCap) (center : MoserVertex) :
    assignmentH1Use (assignmentOfClass cls) cap center =
      (cap.vertices.filter
        (fun z => z ≠ center ∧ center ∈ cls.moserMask z)).card := by
  have hfilter :
      ((Finset.univ : Finset MoserVertex).filter fun z =>
          z ∈ cap.vertices ∧ z ≠ center ∧ center ∈ cls.moserMask z) =
        cap.vertices.filter
          (fun z => z ≠ center ∧ center ∈ cls.moserMask z) := by
    ext z
    simp
  rw [assignmentH1Use, show [0, 1, 2] = moserVertices from rfl,
    assignmentOfClass_maskAt, sum_moserVertices_boole, hfilter]

/-- The assignment pair contribution of a semantic class is its filtered Moser
vertex count. -/
theorem assignmentPairUse_assignmentOfClass
    (cls : JointClass) (left right : MoserVertex) :
    assignmentPairUse (assignmentOfClass cls) left right =
      ((Finset.univ : Finset MoserVertex).filter
        (fun z => JointClass.pairMask left right ⊆ cls.moserMask z)).card := by
  rw [assignmentPairUse, show [0, 1, 2] = moserVertices from rfl,
    assignmentOfClass_maskAt, sum_moserVertices_boole]
  congr 1
  ext z
  simp [JointClass.pairMask, Finset.subset_iff]

/-- The assignment H1 contribution plus one cap-use sum is the semantic H1
quantity. -/
theorem assignmentH1Use_add_capUse_eq_h1UseInCap
    (cls : JointClass) (cap : JointCap) (center : MoserVertex) :
    assignmentH1Use (assignmentOfClass cls) cap center +
        cls.capUseCount cap center = cls.h1UseInCap cap center := by
  rw [assignmentH1Use_assignmentOfClass]
  rfl

/-- The assignment pair contribution plus the three cap sums is the semantic
total pair-sharing quantity. -/
theorem assignmentPairUse_add_caps_eq_pairSharedCount
    (cls : JointClass) (left right : MoserVertex) :
    assignmentPairUse (assignmentOfClass cls) left right +
        (cls.pairSharedInCap .S left right +
          cls.pairSharedInCap .O1 left right +
            cls.pairSharedInCap .O2 left right) =
      cls.pairSharedCount left right := by
  rw [assignmentPairUse_assignmentOfClass]
  simp [JointClass.pairSharedCount, JointClass.pairSharedInCap,
    jointCap_univ, Nat.add_assoc]

/-- The search budget induced by a semantic class is four minus its Moser use. -/
theorem remainingUses_assignmentOfClass
    (cls : JointClass) (center : MoserVertex) :
    remainingUses (assignmentOfClass cls) center =
      4 - cls.moserUseCount center := by
  simp only [remainingUses, JointClass.moserUseCount,
    assignmentOfClass_maskAt]

/-- A locally admissible full-participant class supplies the initial
remaining-use invariant required by the count-vector completeness theorem. -/
theorem remainingUses_eq_requiredUse_of_l2FullLocal
    {profile : JointProfile} {cls : JointClass}
    (hfull : cls.participants = (Finset.univ : Finset MoserVertex))
    (hlocal : cls.LocallyAdmissible profile) (center : MoserVertex) :
    remainingUses (assignmentOfClass cls) center =
      requiredUse countCells (countsOfClass cls) center := by
  rw [remainingUses_assignmentOfClass, requiredUse_countsOfClass]
  have hcenter : cls.centerUseCount center = 4 :=
    hlocal.2.1 center (by simp [hfull])
  simp only [JointClass.centerUseCount] at hcenter
  omega

/-- Counts of a locally admissible class lie in the search range `0..4`. -/
theorem countsOfClass_lt_five_of_l2FullLocal
    {profile : JointProfile} {cls : JointClass}
    (hlocal : cls.LocallyAdmissible profile) :
    ∀ count ∈ countsOfClass cls, count < 5 := by
  intro count hcount
  rcases List.mem_map.mp hcount with ⟨cell, _hcell, rfl⟩
  exact Nat.lt_succ_of_le
    (JointClass.capCounts_le_four_of_locallyAdmissible hlocal cell.1 cell.2)

/-- The full LOCAL budget induced by a locally admissible class covers its
aligned count vector. -/
theorem localBudgetOf_assignmentOfClass_covers
    {profile : JointProfile} {cls : JointClass}
    (hfull : cls.participants = (Finset.univ : Finset MoserVertex))
    (hlocal : cls.LocallyAdmissible profile) :
    (localBudgetOf (assignmentOfClass cls)).Covers
      countCells (countsOfClass cls) := by
  have hlocalCopy := hlocal
  rcases hlocal with
    ⟨_hsupported, _hcenter, _hcap, hh1, hpair, _hkills⟩
  have hmem : ∀ z : MoserVertex, z ∈ cls.participants := by
    intro z
    simp [hfull]
  have huse0 :
      (localBudgetOf (assignmentOfClass cls)).remaining .use0 =
        requiredConstraint countCells (countsOfClass cls) .use0 := by
    rw [requiredConstraint_use_eq_requiredUse countCells (countsOfClass cls) |>.1]
    exact remainingUses_eq_requiredUse_of_l2FullLocal hfull hlocalCopy 0
  have huse1 :
      (localBudgetOf (assignmentOfClass cls)).remaining .use1 =
        requiredConstraint countCells (countsOfClass cls) .use1 := by
    rw [requiredConstraint_use_eq_requiredUse countCells (countsOfClass cls) |>.2.1]
    exact remainingUses_eq_requiredUse_of_l2FullLocal hfull hlocalCopy 1
  have huse2 :
      (localBudgetOf (assignmentOfClass cls)).remaining .use2 =
        requiredConstraint countCells (countsOfClass cls) .use2 := by
    rw [requiredConstraint_use_eq_requiredUse countCells (countsOfClass cls) |>.2.2]
    exact remainingUses_eq_requiredUse_of_l2FullLocal hfull hlocalCopy 2
  have hhO1_0 := hh1 0 (hmem 0) .O1 (by simp [JointCap.vertices])
  have hhO2_0 := hh1 0 (hmem 0) .O2 (by simp [JointCap.vertices])
  have hhS_1 := hh1 1 (hmem 1) .S (by simp [JointCap.vertices])
  have hhO2_1 := hh1 1 (hmem 1) .O2 (by simp [JointCap.vertices])
  have hhS_2 := hh1 2 (hmem 2) .S (by simp [JointCap.vertices])
  have hhO1_2 := hh1 2 (hmem 2) .O1 (by simp [JointCap.vertices])
  rw [← assignmentH1Use_add_capUse_eq_h1UseInCap] at hhO1_0
  rw [← assignmentH1Use_add_capUse_eq_h1UseInCap] at hhO2_0
  rw [← assignmentH1Use_add_capUse_eq_h1UseInCap] at hhS_1
  rw [← assignmentH1Use_add_capUse_eq_h1UseInCap] at hhO2_1
  rw [← assignmentH1Use_add_capUse_eq_h1UseInCap] at hhS_2
  rw [← assignmentH1Use_add_capUse_eq_h1UseInCap] at hhO1_2
  have hp01 := hpair 0 (hmem 0) 1 (hmem 1) (by decide)
  have hp02 := hpair 0 (hmem 0) 2 (hmem 2) (by decide)
  have hp12 := hpair 1 (hmem 1) 2 (hmem 2) (by decide)
  rw [← assignmentPairUse_add_caps_eq_pairSharedCount] at hp01 hp02 hp12
  constructor
  · intro constraint
    cases constraint with
    | use0 => exact huse0.ge
    | use1 => exact huse1.ge
    | use2 => exact huse2.ge
    | hO1_0 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | hO2_0 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | hS_1 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | hO2_1 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | hS_2 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | hO1_2 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | pair01 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | pair02 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
    | pair12 =>
        rw [requiredConstraint_countsOfClass]
        simp [semanticConstraintUse, localBudgetOf, LocalBudget.remaining]
        omega
  · intro constraint hexact
    cases constraint <;> simp [constraintExact] at hexact
    · exact huse0
    · exact huse1
    · exact huse2

/-- The semantic raw-row encoder is exactly the row assembled by the finite
search. -/
theorem rowOfData_assignmentOfClass_countsOfClass
    {cls : JointClass}
    (hfull : cls.participants = (Finset.univ : Finset MoserVertex)) :
    rowOfData (assignmentOfClass cls) (countsOfClass cls) =
      LocalClassEncoding.rawRowOfClass cls := by
  simp [rowOfData, assignmentOfClass, LocalClassEncoding.rawRowOfClass,
    countsOfClass_eq_encoding, hfull, RawClassRow.finsetMask_univ]

/-- Every L2/full LOCAL class has its exact raw encoding in the pruned search. -/
theorem rawRowOfClass_mem_rows
    {profile : JointProfile} {cls : JointClass}
    (hfull : cls.participants = (Finset.univ : Finset MoserVertex))
    (hlocal : cls.LocallyAdmissible profile) :
    LocalClassEncoding.rawRowOfClass cls ∈ rows := by
  have hassignment : assignmentOfClass cls ∈ moserAssignments :=
    assignmentOfClass_mem_moserAssignments hlocal.1
  have hcounts :
      countsOfClass cls ∈
        localCountVectors countCells (localBudgetOf (assignmentOfClass cls)) :=
    mem_localCountVectors_of_covers (by simp [countsOfClass])
      (countsOfClass_lt_five_of_l2FullLocal hlocal)
      (localBudgetOf_assignmentOfClass_covers hfull hlocal)
  let budget := localBudgetOf (assignmentOfClass cls)
  have hbudget : budget ∈ localBudgets := by
    exact List.mem_dedup.mpr
      (List.mem_map.mpr ⟨assignmentOfClass cls, hassignment, rfl⟩)
  have hassignmentBudget :
      assignmentOfClass cls ∈ assignmentsForLocal budget := by
    simp [assignmentsForLocal, budget, hassignment]
  have hcountsBudget :
      countsOfClass cls ∈ localCountVectors countCells budget := by
    simpa [budget] using hcounts
  refine List.mem_flatMap.mpr ⟨budget, hbudget, ?_⟩
  refine List.mem_flatMap.mpr ⟨assignmentOfClass cls, hassignmentBudget, ?_⟩
  exact List.mem_map.mpr ⟨countsOfClass cls, hcountsBudget,
    rowOfData_assignmentOfClass_countsOfClass hfull⟩

/-- The profile-independent accepted checks follow from the LOCAL premise. -/
theorem acceptedLocalChecks_of_l2FullLocal
    {profile : JointProfile} {cls : JointClass}
    (hfull : cls.participants = (Finset.univ : Finset MoserVertex))
    (hlocal : cls.LocallyAdmissible profile) :
    AcceptedLocalChecks cls := by
  rcases hlocal with
    ⟨_hsupported, _hcenter, _hcap, hh1, hpair, hkills⟩
  have hmem : ∀ z : MoserVertex, z ∈ cls.participants := by
    intro z
    simp [hfull]
  have hk01 := hkills 0 (hmem 0) 1 (hmem 1) (by decide)
  have hk02 := hkills 0 (hmem 0) 2 (hmem 2) (by decide)
  have hk12 := hkills 1 (hmem 1) 2 (hmem 2) (by decide)
  refine ⟨hh1 0 (hmem 0) .O1 (by simp [JointCap.vertices]),
    hh1 0 (hmem 0) .O2 (by simp [JointCap.vertices]),
    hh1 1 (hmem 1) .S (by simp [JointCap.vertices]),
    hh1 1 (hmem 1) .O2 (by simp [JointCap.vertices]),
    hh1 2 (hmem 2) .S (by simp [JointCap.vertices]),
    hh1 2 (hmem 2) .O1 (by simp [JointCap.vertices]),
    hpair 0 (hmem 0) 1 (hmem 1) (by decide),
    hpair 0 (hmem 0) 2 (hmem 2) (by decide),
    hpair 1 (hmem 1) 2 (hmem 2) (by decide), ?_, ?_, ?_⟩
  · simpa [JointClass.pairCapData] using hk01
  · simpa [JointClass.pairCapData] using hk02
  · simpa [JointClass.pairCapData] using hk12

/-- Every L2/full LOCAL class has its exact raw encoding among the accepted
enumerator rows. -/
theorem rawRowOfClass_mem_acceptedRows
    {profile : JointProfile} {cls : JointClass}
    (hlayer : cls.layer = .L2)
    (hfull : cls.participants = (Finset.univ : Finset MoserVertex))
    (hlocal : cls.LocallyAdmissible profile) :
    LocalClassEncoding.rawRowOfClass cls ∈ acceptedRows := by
  have hrow : LocalClassEncoding.rawRowOfClass cls ∈ rows :=
    rawRowOfClass_mem_rows hfull hlocal
  have hdecode : (LocalClassEncoding.rawRowOfClass cls).toJointClass = cls :=
    LocalClassEncoding.rawRowOfClass_toJointClass_of_l2_supported hlayer hlocal.1
  simp [acceptedRows, hrow, arrayAcceptedLocalChecks_eq,
    acceptedLocalChecks_eq_true_iff, hdecode,
    acceptedLocalChecks_of_l2FullLocal hfull hlocal]

end LocalEnumerator
end Certificate
end MultiCenter
end Problem97
