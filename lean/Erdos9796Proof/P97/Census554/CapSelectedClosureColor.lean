/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode

/-!
# Canonical finite coloring of equality closure

The finite classifier reasons about seven-bit edge colors. This file names each
equality-closure class by the least row-major index of one of its edges. The
resulting first-occurrence naming agrees with the classifier's restricted-growth
clauses, while color equality still produces a genuine `EdgeClosure` proof.
-/

namespace Problem97
namespace Census554
namespace CapSelectedClosureColor

open EqualityCore
open CapSelectedFiniteCode

/-- Row-major index used by the generated circuit: `(left, right)` has index
`11 * left + right`. -/
def edgeIndex (edge : Edge Label) : Nat :=
  edge.1.val * 11 + edge.2.val

@[simp] theorem edgeIndex_pair (left right : Label) :
    edgeIndex (left, right) = left.val * 11 + right.val := rfl

private theorem edgeIndex_lt_121 (edge : Edge Label) : edgeIndex edge < 121 := by
  rcases edge with ⟨left, right⟩
  have hleft := left.isLt
  have hright := right.isLt
  simp only [edgeIndex]
  omega

private theorem edgeIndex_injective : Function.Injective edgeIndex := by
  rintro ⟨left₁, right₁⟩ ⟨left₂, right₂⟩ hindex
  change left₁.val * 11 + right₁.val =
    left₂.val * 11 + right₂.val at hindex
  have hleft₁ := left₁.isLt
  have hright₁ := right₁.isLt
  have hleft₂ := left₂.isLt
  have hright₂ := right₂.isLt
  have hleft : left₁.val = left₂.val := by omega
  have hright : right₁.val = right₂.val := by omega
  exact Prod.ext (Fin.ext hleft) (Fin.ext hright)

private def IsClassIndex (P : RowPattern Label) (edge : Edge Label)
    (index : Nat) : Prop :=
  ∃ representative : Edge Label,
    edgeIndex representative = index ∧ EdgeClosure P representative edge

private theorem classIndex_exists (P : RowPattern Label) (edge : Edge Label) :
    ∃ index, IsClassIndex P edge index :=
  ⟨edgeIndex edge, edge, rfl, EdgeClosure.refl edge⟩

/-- Least row-major edge index in an equality-closure class. -/
private noncomputable def canonicalIndex (P : RowPattern Label)
    (edge : Edge Label) : Nat := by
  classical
  exact Nat.find (classIndex_exists P edge)

private theorem canonicalIndex_spec (P : RowPattern Label) (edge : Edge Label) :
    IsClassIndex P edge (canonicalIndex P edge) := by
  classical
  simpa [canonicalIndex] using Nat.find_spec (classIndex_exists P edge)

private theorem canonicalIndex_le_of_isClassIndex
    {P : RowPattern Label} {edge : Edge Label} {index : Nat}
    (hindex : IsClassIndex P edge index) : canonicalIndex P edge ≤ index := by
  classical
  simpa [canonicalIndex] using
    Nat.find_min' (classIndex_exists P edge) hindex

private theorem isClassIndex_transport
    {P : RowPattern Label} {left right : Edge Label} {index : Nat}
    (hclosure : EdgeClosure P left right)
    (hindex : IsClassIndex P left index) : IsClassIndex P right index := by
  rcases hindex with ⟨representative, hrepresentative, hleft⟩
  exact ⟨representative, hrepresentative, hleft.trans hclosure⟩

private theorem canonicalIndex_eq_of_edgeClosure
    {P : RowPattern Label} {left right : Edge Label}
    (hclosure : EdgeClosure P left right) :
    canonicalIndex P left = canonicalIndex P right := by
  apply Nat.le_antisymm
  · apply canonicalIndex_le_of_isClassIndex
    exact isClassIndex_transport hclosure.symm (canonicalIndex_spec P right)
  · apply canonicalIndex_le_of_isClassIndex
    exact isClassIndex_transport hclosure (canonicalIndex_spec P left)

private theorem canonicalIndex_le_edgeIndex (P : RowPattern Label)
    (edge : Edge Label) : canonicalIndex P edge ≤ edgeIndex edge := by
  apply canonicalIndex_le_of_isClassIndex
  exact ⟨edge, rfl, EdgeClosure.refl edge⟩

private theorem canonicalIndex_lt_128 (P : RowPattern Label)
    (edge : Edge Label) : canonicalIndex P edge < 128 :=
  (canonicalIndex_le_edgeIndex P edge).trans_lt
    ((edgeIndex_lt_121 edge).trans (by decide))

/-- Canonical seven-bit identifier of an equality-closure class. The identifier
is the least row-major edge index occurring in the class. -/
noncomputable def color (P : RowPattern Label) : EdgeColor := fun edge =>
  BitVec.ofNat 7 (canonicalIndex P edge)

private theorem canonicalIndex_eq_of_colorEq
    {P : RowPattern Label} {left right : Edge Label}
    (h : ColorEq (color P) left right) :
    canonicalIndex P left = canonicalIndex P right := by
  have hnat := congrArg BitVec.toNat h
  simpa [ColorEq, color, BitVec.toNat_ofNat,
    Nat.mod_eq_of_lt (canonicalIndex_lt_128 P left),
    Nat.mod_eq_of_lt (canonicalIndex_lt_128 P right)] using hnat

/-- Equal canonical colors give an actual equality-closure witness. -/
theorem edgeClosure_of_colorEq {P : RowPattern Label} {left right : Edge Label}
    (h : ColorEq (color P) left right) : EdgeClosure P left right := by
  have hindex := canonicalIndex_eq_of_colorEq h
  rcases canonicalIndex_spec P left with
    ⟨leftRepresentative, hleftIndex, hleftClosure⟩
  rcases canonicalIndex_spec P right with
    ⟨rightRepresentative, hrightIndex, hrightClosure⟩
  have hrepresentative : leftRepresentative = rightRepresentative :=
    edgeIndex_injective (hleftIndex.trans (hindex.trans hrightIndex.symm))
  rw [← hrepresentative] at hrightClosure
  exact hleftClosure.symm.trans hrightClosure

/-- Equality closure preserves the canonical color. -/
theorem colorEq_of_edgeClosure {P : RowPattern Label} {left right : Edge Label}
    (hclosure : EdgeClosure P left right) :
    ColorEq (color P) left right := by
  change BitVec.ofNat 7 (canonicalIndex P left) =
    BitVec.ofNat 7 (canonicalIndex P right)
  rw [canonicalIndex_eq_of_edgeClosure hclosure]

/-- Every color is either its edge's own row-major index or a color already
seen at a strictly earlier edge. This is the restricted-growth condition used
by the generated finite classifier. -/
theorem color_eq_edgeIndex_or_eq_earlier (P : RowPattern Label)
    (edge : Edge Label) :
    color P edge = BitVec.ofNat 7 (edgeIndex edge) ∨
      ∃ earlier : Edge Label,
        edgeIndex earlier < edgeIndex edge ∧ color P edge = color P earlier := by
  rcases eq_or_lt_of_le (canonicalIndex_le_edgeIndex P edge) with hfirst | hearlier
  · left
    change BitVec.ofNat 7 (canonicalIndex P edge) =
      BitVec.ofNat 7 (edgeIndex edge)
    rw [hfirst]
  · right
    rcases canonicalIndex_spec P edge with
      ⟨earlier, hearlierIndex, hearlierClosure⟩
    refine ⟨earlier, hearlierIndex.trans_lt hearlier, ?_⟩
    exact colorEq_of_edgeClosure hearlierClosure.symm

/-- The canonical closure coloring respects reversal and every selected row. -/
theorem respectsRows (P : PatternCode) :
    RespectsRows P (color (rowPattern P)) := by
  constructor
  · intro a b
    exact colorEq_of_edgeClosure (EdgeClosure.flip a b)
  · intro center a b ha hb
    exact colorEq_of_edgeClosure (EdgeClosure.row center a b ha hb)

end CapSelectedClosureColor
end Census554
end Problem97
