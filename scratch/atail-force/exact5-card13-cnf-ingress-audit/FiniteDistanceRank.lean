/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Batteries.Data.BitVec.Lemmas
import Mathlib.Data.Finset.Sort
import Mathlib.Tactic

/-!
# Finite ordinal ranks for a finite family of real values

This scratch module isolates the source-valid rank construction needed by the
card-thirteen exact-five ordinal certificate.  It contains no geometric or row
assumptions: any family of `n` values in a linear order admits ranks in `Fin n`
that preserve and reflect both equality and strict order.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The distinct values occurring in a finite indexed family. -/
def finiteValueSet {α : Type*} [LinearOrder α] {n : ℕ} (value : Fin n → α) : Finset α :=
  Finset.univ.image value

theorem finiteValueSet_card_le {α : Type*} [LinearOrder α] {n : ℕ} (value : Fin n → α) :
    (finiteValueSet value).card ≤ n := by
  calc
    (finiteValueSet value).card ≤ Finset.univ.card := Finset.card_image_le
    _ = n := Finset.card_fin n

/-- The zero-based ordinal of `value i` among the distinct values in the
family, embedded into `Fin n`. -/
def finiteOrdinalRank {α : Type*} [LinearOrder α] {n : ℕ}
    (value : Fin n → α) (i : Fin n) : Fin n :=
  let values := finiteValueSet value
  let member : value i ∈ values := Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  Fin.castLE (finiteValueSet_card_le value)
    ((values.orderIsoOfFin rfl).symm ⟨value i, member⟩)

/-- Ordinal ranks preserve and reflect equality. -/
theorem finiteOrdinalRank_eq_iff {α : Type*} [LinearOrder α] {n : ℕ}
    (value : Fin n → α) (i j : Fin n) :
    finiteOrdinalRank value i = finiteOrdinalRank value j ↔ value i = value j := by
  simp only [finiteOrdinalRank, Fin.castLE_inj]
  constructor
  · intro h
    have hsub :
        (⟨value i, Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩⟩ :
            finiteValueSet value) =
          ⟨value j, Finset.mem_image.mpr ⟨j, Finset.mem_univ _, rfl⟩⟩ := by
      exact (finiteValueSet value).orderIsoOfFin rfl |>.symm.injective h
    exact congrArg Subtype.val hsub
  · intro h
    apply congrArg ((finiteValueSet value).orderIsoOfFin rfl).symm
    exact Subtype.ext h

/-- Ordinal ranks preserve and reflect strict order. -/
theorem finiteOrdinalRank_lt_iff {α : Type*} [LinearOrder α] {n : ℕ}
    (value : Fin n → α) (i j : Fin n) :
    finiteOrdinalRank value i < finiteOrdinalRank value j ↔ value i < value j := by
  simp only [finiteOrdinalRank, Fin.lt_def, Fin.castLE]
  exact ((finiteValueSet value).orderIsoOfFin rfl).symm.lt_iff_lt

/-- The rank is uniformly below the number of indexed values.  For the
card-thirteen edge family this gives the encoder's bound `rank < 78`. -/
theorem finiteOrdinalRank_val_lt {α : Type*} [LinearOrder α] {n : ℕ}
    (value : Fin n → α) (i : Fin n) :
    (finiteOrdinalRank value i).val < n :=
  (finiteOrdinalRank value i).isLt

/-- The seven-bit form of the ordinal rank for a family of exactly 78 values.
The width is lossless because `78 < 2 ^ 7`. -/
def finiteOrdinalRank78BitVec {α : Type*} [LinearOrder α]
    (value : Fin 78 → α) (i : Fin 78) : BitVec 7 :=
  BitVec.ofNat 7 (finiteOrdinalRank value i).val

@[simp]
theorem finiteOrdinalRank78BitVec_toNat {α : Type*} [LinearOrder α]
    (value : Fin 78 → α) (i : Fin 78) :
    (finiteOrdinalRank78BitVec value i).toNat = (finiteOrdinalRank value i).val := by
  rw [finiteOrdinalRank78BitVec, BitVec.toNat_ofNat, Nat.mod_eq_of_lt]
  exact (finiteOrdinalRank value i).isLt.trans (by decide)

/-- Seven-bit ranks preserve and reflect equality of the underlying values. -/
theorem finiteOrdinalRank78BitVec_eq_iff {α : Type*} [LinearOrder α]
    (value : Fin 78 → α) (i j : Fin 78) :
    finiteOrdinalRank78BitVec value i = finiteOrdinalRank78BitVec value j ↔
      value i = value j := by
  rw [← BitVec.toNat_inj]
  simp only [finiteOrdinalRank78BitVec_toNat]
  simpa only [Fin.ext_iff] using finiteOrdinalRank_eq_iff value i j

/-- Seven-bit unsigned comparison preserves and reflects strict order of the
underlying values. -/
theorem finiteOrdinalRank78BitVec_ult_iff {α : Type*} [LinearOrder α]
    (value : Fin 78 → α) (i j : Fin 78) :
    (finiteOrdinalRank78BitVec value i).ult
        (finiteOrdinalRank78BitVec value j) = true ↔
      value i < value j := by
  rw [BitVec.ult_eq_decide, decide_eq_true_iff]
  simp only [finiteOrdinalRank78BitVec_toNat]
  exact finiteOrdinalRank_lt_iff value i j

/-- Every generated rank satisfies the explicit `rank < 78` Boolean clause
used by both source-core circuits. -/
theorem finiteOrdinalRank78BitVec_ult_seventyEight {α : Type*} [LinearOrder α]
    (value : Fin 78 → α) (i : Fin 78) :
    (finiteOrdinalRank78BitVec value i).ult (78#7) = true := by
  rw [BitVec.ult_eq_decide, decide_eq_true_iff]
  simpa only [finiteOrdinalRank78BitVec_toNat] using
    (finiteOrdinalRank value i).isLt

/-- Cancellation form used by every strict Kalmanson implication in the
generated circuit: equality of one positive and one negative summand forces
the remaining negative distance to have smaller unsigned rank. -/
theorem finiteOrdinalRank78BitVec_cancellation
    (value : Fin 78 → ℝ) (positiveMate positiveCanceled negativeMate negativeCanceled : Fin 78)
    (hsum : value negativeMate + value negativeCanceled <
      value positiveMate + value positiveCanceled)
    (heq : finiteOrdinalRank78BitVec value positiveCanceled =
      finiteOrdinalRank78BitVec value negativeCanceled) :
    (finiteOrdinalRank78BitVec value negativeMate).ult
        (finiteOrdinalRank78BitVec value positiveMate) = true := by
  have hvalueEq : value positiveCanceled = value negativeCanceled :=
    (finiteOrdinalRank78BitVec_eq_iff value _ _).mp heq
  apply (finiteOrdinalRank78BitVec_ult_iff value _ _).mpr
  linarith

/-- Pack 78 seven-bit ranks in the little-endian block layout used by
`RankBits = BitVec 546` and `rankAtom ranks i = ranks.extractLsb' (7*i) 7`. -/
def packSeventyEightRanks (rank : Fin 78 → BitVec 7) : BitVec 546 :=
  BitVec.ofFnLE fun bit ↦
    let block : Fin 78 := ⟨bit.val / 7, by omega⟩
    (rank block).getLsbD (bit.val % 7)

/-- Extracting block `i` from the packed vector recovers the original
seven-bit rank exactly. -/
theorem extractLsb_packSeventyEightRanks (rank : Fin 78 → BitVec 7) (i : Fin 78) :
    (packSeventyEightRanks rank).extractLsb' (7 * i.val) 7 = rank i := by
  apply BitVec.eq_of_getLsbD_eq
  intro bit hbit
  rw [BitVec.getLsbD_extractLsb']
  simp only [hbit, decide_true, Bool.true_and]
  rw [packSeventyEightRanks, BitVec.getLsbD_ofFnLE]
  have hpacked : 7 * i.val + bit < 546 := by omega
  rw [dif_pos hpacked]
  have hdiv : (7 * i.val + bit) / 7 = i.val := by omega
  have hmod : (7 * i.val + bit) % 7 = bit := by omega
  simp only [hdiv, hmod]

/-- The exact packed rank witness for the generated card-thirteen circuits. -/
def packedFiniteOrdinalRanks78 {α : Type*} [LinearOrder α]
    (value : Fin 78 → α) : BitVec 546 :=
  packSeventyEightRanks (finiteOrdinalRank78BitVec value)

theorem extractLsb_packedFiniteOrdinalRanks78 {α : Type*} [LinearOrder α]
    (value : Fin 78 → α) (i : Fin 78) :
    (packedFiniteOrdinalRanks78 value).extractLsb' (7 * i.val) 7 =
      finiteOrdinalRank78BitVec value i := by
  exact extractLsb_packSeventyEightRanks _ _

/-- The 78 oriented unordered pairs in the same lexicographic order as
`itertools.combinations (range 13) 2`, which the certificate generator uses. -/
def cardThirteenPairs : List (Fin 13 × Fin 13) :=
  (List.finRange 13).flatMap fun left ↦
    ((List.finRange 13).drop (left.val + 1)).map fun right ↦ (left, right)

theorem cardThirteenPairs_length : cardThirteenPairs.length = 78 := by
  decide

/-- The pair represented by one generated distance-atom index. -/
def cardThirteenPairAt (i : Fin 78) : Fin 13 × Fin 13 :=
  cardThirteenPairs[i.val]'(by simpa only [cardThirteenPairs_length] using i.isLt)

theorem cardThirteenPairAt_left_lt_right : ∀ i : Fin 78,
    (cardThirteenPairAt i).1 < (cardThirteenPairAt i).2 := by
  decide

/-- The actual Euclidean distance represented by one generated atom. -/
def cardThirteenPairDistance
    (point : Fin 13 → EuclideanSpace ℝ (Fin 2)) (i : Fin 78) : ℝ :=
  dist (point (cardThirteenPairAt i).1) (point (cardThirteenPairAt i).2)

/-- The complete packed source witness for the generated seven-bit rank
variables. -/
def packedCardThirteenDistanceRanks
    (point : Fin 13 → EuclideanSpace ℝ (Fin 2)) : BitVec 546 :=
  packedFiniteOrdinalRanks78 (cardThirteenPairDistance point)

/-- `rankAtom` extraction from the packed source witness, stated without a
dependency on the generated circuit namespace. -/
theorem extractLsb_packedCardThirteenDistanceRanks
    (point : Fin 13 → EuclideanSpace ℝ (Fin 2))
    (i : Fin 78) :
    (packedCardThirteenDistanceRanks point).extractLsb' (7 * i.val) 7 =
      finiteOrdinalRank78BitVec (cardThirteenPairDistance point) i := by
  exact extractLsb_packedFiniteOrdinalRanks78 _ _

/-- Extracted rank equality is exactly equality of the two actual pairwise
distances. -/
theorem packedCardThirteenDistanceRanks_eq_iff
    (point : Fin 13 → EuclideanSpace ℝ (Fin 2))
    (i j : Fin 78) :
    (packedCardThirteenDistanceRanks point).extractLsb' (7 * i.val) 7 =
        (packedCardThirteenDistanceRanks point).extractLsb' (7 * j.val) 7 ↔
      cardThirteenPairDistance point i = cardThirteenPairDistance point j := by
  rw [extractLsb_packedCardThirteenDistanceRanks,
    extractLsb_packedCardThirteenDistanceRanks]
  exact finiteOrdinalRank78BitVec_eq_iff _ _ _

/-- Extracted unsigned rank comparison is exactly strict comparison of the
two actual pairwise distances. -/
theorem packedCardThirteenDistanceRanks_ult_iff
    (point : Fin 13 → EuclideanSpace ℝ (Fin 2))
    (i j : Fin 78) :
    ((packedCardThirteenDistanceRanks point).extractLsb' (7 * i.val) 7).ult
        ((packedCardThirteenDistanceRanks point).extractLsb' (7 * j.val) 7) = true ↔
      cardThirteenPairDistance point i < cardThirteenPairDistance point j := by
  rw [extractLsb_packedCardThirteenDistanceRanks,
    extractLsb_packedCardThirteenDistanceRanks]
  exact finiteOrdinalRank78BitVec_ult_iff _ _ _

/-- Every extracted source rank satisfies the encoder's explicit upper-bound
clause. -/
theorem packedCardThirteenDistanceRanks_ult_seventyEight
    (point : Fin 13 → EuclideanSpace ℝ (Fin 2)) (i : Fin 78) :
    ((packedCardThirteenDistanceRanks point).extractLsb' (7 * i.val) 7).ult
      (78#7) = true := by
  rw [extractLsb_packedCardThirteenDistanceRanks]
  exact finiteOrdinalRank78BitVec_ult_seventyEight _ _

#print axioms packedCardThirteenDistanceRanks_eq_iff
#print axioms packedCardThirteenDistanceRanks_ult_iff
#print axioms packedCardThirteenDistanceRanks_ult_seventyEight

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
