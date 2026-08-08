/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate

/-!
# Semantic index bridge for the exact-twelve source-safe cover CNF

This file connects `FrozenSafeCubeOK` to one in-range candidate-table index at
each center.  It proves that the selected masks recover the semantic rows and
inherit exactly the `C2` and `C4` hypotheses used by the finite encoding.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SafeCoverIndexBridge

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open SafeCoverCnf

/-- Twelve-bit encoding of a semantic row. -/
def classMask (K : Finset Label) : Nat :=
  ∑ q ∈ K, 1 <<< q.val

set_option maxHeartbeats 0 in
-- Exhaustive reduction over all exact-twelve labels and finite candidate rows.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- The numerical table and the proof-facing candidate predicate agree
exactly, not merely in the source-to-table direction. -/
theorem classMask_mem_candMasks_iff (p : Label) (K : Finset Label) :
    classMask K ∈ candMasks p.val ↔ FrozenSafeCandidateAt p K := by
  native_decide +revert

/-- Every source-safe semantic candidate occurs in the numerical table. -/
theorem classMask_mem_candMasks (p : Label) (K : Finset Label)
    (hK : FrozenSafeCandidateAt p K) :
    classMask K ∈ candMasks p.val :=
  (classMask_mem_candMasks_iff p K).2 hK

set_option maxHeartbeats 1000000 in
-- Exhaustive reduction over all exact-twelve labels and finite row masks.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Semantic membership is the corresponding bit of `classMask`. -/
theorem classMask_testBit (K : Finset Label) (a : Label) :
    (classMask K).testBit a.val = decide (a ∈ K) := by
  native_decide +revert

set_option maxHeartbeats 0 in
-- Exhaustive reduction over all pairs of exact-twelve finite row masks.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Bitwise conjunction of semantic row masks is semantic intersection. -/
theorem classMask_land_classMask (K L : Finset Label) :
    classMask K &&& classMask L = classMask (K ∩ L) := by
  native_decide +revert

set_option maxHeartbeats 0 in
-- Exhaustive reduction over all pairs of exact-twelve finite row masks.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Numerical and semantic intersection cardinalities agree. -/
theorem interCard12_classMask (K L : Finset Label) :
    interCard12 (classMask K) (classMask L) = (K ∩ L).card := by
  native_decide +revert

/-- The number of true entries in `List.range n` is the corresponding
indicator sum over `Finset.range n`. -/
theorem length_filter_range_eq_sum (f : Nat → Bool) (n : Nat) :
    ((List.range n).filter f).length =
      ∑ i ∈ Finset.range n, if f i then 1 else 0 := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [List.range_succ, List.filter_append, List.length_append,
        Finset.sum_range_succ]
      simp only [List.filter_singleton]
      rw [ih]
      cases f n <;> simp

/-- The candidate table has one entry for every exact-twelve center. -/
theorem candCounts_length : candCounts.length = 12 := by
  simp [candCounts, candTable, List.length_map, List.length_range]

/-- On the valid center range, `candCount` is the candidate-list length. -/
theorem candMasks_length {p : Nat} (h : p < 12) :
    (candMasks p).length = candCount p := by
  have hlen : candTable.length = 12 := by
    simp [candTable, List.length_map, List.length_range]
  have hp : p < candTable.length := by rw [hlen]; exact h
  simp only [candMasks, candCount, candCounts]
  rw [List.getD_eq_getElem _ _ (by rw [hlen]; exact h),
    List.getD_eq_getElem _ _ (by simp [List.length_map]; rw [hlen]; exact h),
    List.getElem_map]

/-- Index of one semantic candidate in its center's numerical table. -/
def coverIndexAt (p : Label) (K : Finset Label) : Nat :=
  (candMasks p.val).findIdx fun m => m == classMask K

/-- A source-safe candidate's table index is in range. -/
theorem coverIndexAt_lt (p : Label) (K : Finset Label)
    (hK : FrozenSafeCandidateAt p K) :
    coverIndexAt p K < candCount p.val := by
  rw [← candMasks_length p.isLt]
  apply List.findIdx_lt_length_of_exists
  exact ⟨classMask K, classMask_mem_candMasks p K hK, by simp⟩

/-- Looking up a source-safe candidate's index recovers its exact mask. -/
theorem getD_coverIndexAt (p : Label) (K : Finset Label)
    (hK : FrozenSafeCandidateAt p K) :
    (candMasks p.val).getD (coverIndexAt p K) 0 = classMask K := by
  have hi : coverIndexAt p K < (candMasks p.val).length := by
    simpa only [candMasks_length p.isLt] using coverIndexAt_lt p K hK
  rw [List.getD_eq_getElem _ _ hi]
  have hfind := List.findIdx_getElem
    (p := fun m => m == classMask K) (xs := candMasks p.val) (w := hi)
  exact beq_iff_eq.mp hfind

/-- Total candidate-index function; values outside `0..11` are irrelevant. -/
def coverIndex (row : RowPattern Label) (p : Nat) : Nat :=
  if hp : p < 12 then coverIndexAt ⟨p, hp⟩ (row ⟨p, hp⟩) else 0

/-- Every valid center receives an in-range candidate index. -/
theorem coverIndex_lt_of_safeCubeOK {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) {p : Nat} (hp : p < 12) :
    coverIndex row p < candCount p := by
  simp only [coverIndex, dif_pos hp]
  exact coverIndexAt_lt ⟨p, hp⟩ (row ⟨p, hp⟩)
    ((mem_frozenSafeCandidateClasses).1 (hrow.candidate_mem ⟨p, hp⟩))

/-- Looking up the selected index recovers the semantic row mask. -/
theorem getD_coverIndex_of_safeCubeOK {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) (p : Label) :
    (candMasks p.val).getD (coverIndex row p.val) 0 = classMask (row p) := by
  simp only [coverIndex, dif_pos p.isLt]
  exact getD_coverIndexAt p (row p)
    ((mem_frozenSafeCandidateClasses).1 (hrow.candidate_mem p))

/-- Point membership in a semantic row is exactly the chosen mask bit. -/
theorem coverIndex_testBit_of_safeCubeOK {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) (p a : Label) :
    ((candMasks p.val).getD (coverIndex row p.val) 0).testBit a.val =
      decide (a ∈ row p) := by
  rw [getD_coverIndex_of_safeCubeOK hrow p, classMask_testBit]

/-- The chosen candidate indices inherit `C2`. -/
theorem coverIndex_c2_of_safeCubeOK {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) :
    ∀ p q, p < 12 → q < 12 → p ≠ q →
      interCard12 ((candMasks p).getD (coverIndex row p) 0)
        ((candMasks q).getD (coverIndex row q) 0) ≤ 2 := by
  intro p q hp hq hpq
  let pf : Label := ⟨p, hp⟩
  let qf : Label := ⟨q, hq⟩
  have hpqf : pf ≠ qf := by
    intro h
    exact hpq (congrArg Fin.val h)
  rw [show p = pf.val from rfl, show q = qf.val from rfl,
    getD_coverIndex_of_safeCubeOK hrow pf,
    getD_coverIndex_of_safeCubeOK hrow qf,
    interCard12_classMask]
  exact hrow.sourceCube.row_inter_card_le_two hpqf

/-- The chosen candidate indices inherit `C4`. -/
theorem coverIndex_c4_of_safeCubeOK {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) :
    ∀ a b, a < 12 → b < 12 → a ≠ b →
      ((List.range 12).filter fun p =>
        ((candMasks p).getD (coverIndex row p) 0).testBit a &&
          ((candMasks p).getD (coverIndex row p) 0).testBit b).length ≤ 2 := by
  intro a b ha hb hab
  let af : Label := ⟨a, ha⟩
  let bf : Label := ⟨b, hb⟩
  have habf : af ≠ bf := by
    intro h
    exact hab (congrArg Fin.val h)
  rw [length_filter_range_eq_sum]
  rw [← Fin.sum_univ_eq_sum_range]
  have hsemantic := hrow.sourceCube.pair_center_count_le_two habf
  rw [Finset.card_filter] at hsemantic
  simp_rw [show a = af.val from rfl, show b = bf.val from rfl,
    getD_coverIndex_of_safeCubeOK hrow, classMask_testBit]
  simpa only [Bool.and_eq_true, decide_eq_true_eq, Finset.mem_univ,
    true_and] using hsemantic

/-- Packaged index-level ingress consumed by the CNF valuation proof. -/
theorem exists_coverIndex_of_safeCubeOK {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) :
    ∃ idx : Nat → Nat,
      (∀ p, p < 12 → idx p < candCount p) ∧
      (∀ p a : Label,
        ((candMasks p.val).getD (idx p.val) 0).testBit a.val =
          decide (a ∈ row p)) ∧
      (∀ p q, p < 12 → q < 12 → p ≠ q →
        interCard12 ((candMasks p).getD (idx p) 0)
          ((candMasks q).getD (idx q) 0) ≤ 2) ∧
      (∀ a b, a < 12 → b < 12 → a ≠ b →
        ((List.range 12).filter fun p =>
          ((candMasks p).getD (idx p) 0).testBit a &&
            ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) := by
  exact ⟨coverIndex row,
    (fun p hp => coverIndex_lt_of_safeCubeOK hrow (p := p) hp),
    coverIndex_testBit_of_safeCubeOK hrow,
    coverIndex_c2_of_safeCubeOK hrow,
    coverIndex_c4_of_safeCubeOK hrow⟩

end SafeCoverIndexBridge
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
