/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode
import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier
import Mathlib.Combinatorics.Colex

/-!
# Closed finite facts for the native card-eleven classifier

This module caches exhaustive identities about eleven-bit row masks. Keeping
these computations separate lets the ordinary soundness proofs iterate without
rerunning the multi-million-case native checks.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNativeClassifierFacts

open CapSelectedFiniteCode
open CapSelectedNativeClassifier

/-- Eleven-bit encoding of a finite label set. -/
def maskOfFinset (points : Finset Label) : RowMask :=
  ∑ point ∈ points, 2 ^ point.val

/-- A label belongs to a finite set exactly when its bit is set in the
sum-of-powers-of-two encoding. -/
theorem has_maskOfFinset (points : Finset Label) (point : Label) :
    has (maskOfFinset points) point.val = decide (point ∈ points) := by
  have hsum :
      (∑ point ∈ points, 2 ^ point.val) =
        ∑ i ∈ points.image (fun point : Label ↦ point.val), 2 ^ i := by
    rw [Finset.sum_image Fin.val_injective.injOn]
  apply Bool.eq_iff_iff.mpr
  simp only [has, decide_eq_true_eq]
  rw [← Nat.mem_bitIndices]
  simp only [maskOfFinset]
  rw [hsum, ← List.mem_toFinset,
    Finset.toFinset_bitIndices_sum_two_pow, Finset.mem_image]
  constructor
  · rintro ⟨a, ha, hval⟩
    have : a = point := Fin.ext hval
    simpa [this] using ha
  · intro hp
    exact ⟨point, hp, rfl⟩

private theorem countPoints_eq_filter_length (mask : RowMask) (xs : List Nat) :
    countPoints mask xs = (xs.filter (has mask)).length := by
  unfold countPoints
  have aux (ys : List Nat) (acc : Nat) :
      List.foldl (fun n i ↦ bif has mask i then n + 1 else n) acc ys =
        acc + (ys.filter (has mask)).length := by
    induction ys generalizing acc with
    | nil => simp
    | cons a ys ih =>
      by_cases ha : has mask a = true <;>
        simp [ha, ih, Nat.add_assoc, Nat.add_comm]
  simpa using aux xs 0

private theorem countPoints_map_val (points : Finset Label) (items : List Label) :
    countPoints (maskOfFinset points) (items.map Fin.val) =
      (items.filter fun p ↦ p ∈ points).length := by
  rw [countPoints_eq_filter_length]
  induction items with
  | nil => simp
  | cons p items ih =>
    simp only [List.map_cons, List.filter_cons]
    rw [has_maskOfFinset points p]
    by_cases hp : p ∈ points <;> simp [hp, ih]

private theorem countPoints_map_val_eq_inter_card
    (points : Finset Label) (items : List Label) (hi : items.Nodup) :
    countPoints (maskOfFinset points) (items.map Fin.val) =
      (points ∩ items.toFinset).card := by
  rw [countPoints_map_val]
  calc
    (items.filter fun p ↦ p ∈ points).length =
        (items.filter fun p ↦ p ∈ points).toFinset.card := by
      symm
      exact List.toFinset_card_of_nodup (hi.filter _)
    _ = (items.toFinset.filter fun p ↦ p ∈ points).card := by
      rw [← List.filter_toFinset]
    _ = (points ∩ items.toFinset).card := by
      rw [Finset.filter_mem_eq_inter, Finset.inter_comm]

private theorem countPoints_labels_maskOfFinset (points : Finset Label) :
    countPoints (maskOfFinset points) labels = points.card := by
  have hr : List.range 11 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] := by decide
  rw [labels, hr]
  have hu : ({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10} : Finset Label) = Finset.univ := by
    ext p
    fin_cases p <;> simp
  simpa [hu] using countPoints_map_val_eq_inter_card points
    ([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] : List Label) (by decide)

/-- The binary mask of a set of eleven labels is smaller than `2 ^ 11`.

This is a structural geometric-sum bound rather than an enumeration of all
2,048 finite label sets. -/
theorem maskOfFinset_lt_2048 (points : Finset Label) :
    maskOfFinset points < 2048 := by
  have h :
      (∑ i ∈ points.image (fun point : Label ↦ point.val), 2 ^ i) < 2 ^ 11 :=
    Nat.geomSum_lt (by norm_num) (by
      intro i hi
      obtain ⟨point, _, rfl⟩ := Finset.mem_image.mp hi
      exact point.isLt)
  rw [Finset.sum_image Fin.val_injective.injOn] at h
  simpa [maskOfFinset] using h

/-- Structural identity for intersections of finite eleven-label sets. -/
theorem countPoints_supportPoints_maskOfFinset
    (left right : Finset Label) :
    countPoints (maskOfFinset left) (supportPoints (maskOfFinset right)) =
      (left ∩ right).card := by
  let items : List Label := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  have hlabels : labels = items.map Fin.val := by
    change List.range 11 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    decide
  have hsupport :
      supportPoints (maskOfFinset right) =
        (items.filter (fun point ↦ point ∈ right)).map Fin.val := by
    rw [supportPoints, hlabels]
    simp only [List.filter_map]
    induction items with
    | nil => rfl
    | cons point items ih =>
      simp only [List.filter_cons, Function.comp_apply]
      by_cases hp : point ∈ right <;> simp [has_maskOfFinset, hp, ih]
  have hitems_nodup : items.Nodup := by
    simp [items]
  have hnodup : (items.filter (fun point ↦ point ∈ right)).Nodup :=
    hitems_nodup.filter _
  rw [hsupport, countPoints_map_val_eq_inter_card left _ hnodup]
  have hitems : items.toFinset = Finset.univ := by
    apply Finset.eq_univ_of_forall
    intro point
    fin_cases point <;> simp [items]
  have hfiltered :
      (items.filter (fun point ↦ point ∈ right)).toFinset = right := by
    ext point
    simp [hitems]
  simp [hfiltered]

private theorem allEmptyCommon_map_val_iff_empty
    (left right : Finset Label) (items : List Label) (_hi : items.Nodup) :
    allEmptyCommon (maskOfFinset left) (maskOfFinset right)
        (items.map Fin.val) = true ↔
      left ∩ right ∩ items.toFinset = ∅ := by
  simp only [allEmptyCommon]
  rw [List.all_eq_true]
  constructor
  · intro hall
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro point hpoint
    rcases Finset.mem_inter.mp hpoint with ⟨hleftRight, hitems⟩
    rcases Finset.mem_inter.mp hleftRight with ⟨hleft, hright⟩
    have hitems' : point ∈ items := List.mem_toFinset.mp hitems
    have hbad := hall point.val (List.mem_map.mpr ⟨point, hitems', rfl⟩)
    simp [has_maskOfFinset, hleft, hright] at hbad
  · intro hempty point hpoint
    obtain ⟨item, hitem, rfl⟩ := List.mem_map.mp hpoint
    by_cases hleft : item ∈ left
    · by_cases hright : item ∈ right
      · have hmem : item ∈ left ∩ right ∩ items.toFinset := by
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_inter.mpr ⟨hleft, hright⟩,
              List.mem_toFinset.mpr hitem⟩
        have hfalse : item ∈ (∅ : Finset Label) := by
          simpa [hempty] using hmem
        simp at hfalse
      · simp [has_maskOfFinset, hright]
    · simp [has_maskOfFinset, hleft]

set_option maxHeartbeats 0 in
-- One exhaustive pass checks all three fixed Q3 interior blocks.
set_option maxRecDepth 10000 in
/-- Census-554 certificate-bank theorem. -/
theorem allEmptyCommon_capBlocks_iff (left right : Finset Label) :
    (allEmptyCommon (maskOfFinset left) (maskOfFinset right) [7, 8] = true ↔
      left ∩ right ∩ intO1 = ∅) ∧
    (allEmptyCommon (maskOfFinset left) (maskOfFinset right) [9, 10] = true ↔
      left ∩ right ∩ intO2 = ∅) ∧
    (allEmptyCommon (maskOfFinset left) (maskOfFinset right)
        [3, 4, 5, 6] = true ↔ left ∩ right ∩ intS = ∅) := by
  have ho1 := allEmptyCommon_map_val_iff_empty left right
    ([7, 8] : List Label) (by decide)
  have ho2 := allEmptyCommon_map_val_iff_empty left right
    ([9, 10] : List Label) (by decide)
  have hs := allEmptyCommon_map_val_iff_empty left right
    ([3, 4, 5, 6] : List Label) (by decide)
  simpa [intO1, intO2, intS] using And.intro ho1 (And.intro ho2 hs)

/-- Census-554 certificate-bank theorem. -/
@[simp] theorem allEmptyCommon_intO1_iff (left right : Finset Label) :
    allEmptyCommon (maskOfFinset left) (maskOfFinset right) [7, 8] = true ↔
      left ∩ right ∩ intO1 = ∅ :=
  (allEmptyCommon_capBlocks_iff left right).1

/-- Census-554 certificate-bank theorem. -/
@[simp] theorem allEmptyCommon_intO2_iff (left right : Finset Label) :
    allEmptyCommon (maskOfFinset left) (maskOfFinset right) [9, 10] = true ↔
      left ∩ right ∩ intO2 = ∅ :=
  (allEmptyCommon_capBlocks_iff left right).2.1

/-- Census-554 certificate-bank theorem. -/
@[simp] theorem allEmptyCommon_intS_iff (left right : Finset Label) :
    allEmptyCommon (maskOfFinset left) (maskOfFinset right)
      [3, 4, 5, 6] = true ↔ left ∩ right ∩ intS = ∅ :=
  (allEmptyCommon_capBlocks_iff left right).2.2

/-- Local semantic conditions represented by `localCandidateOK`. -/
def LocalCandidateSpec (center deleted : Label)
    (points : Finset Label) : Prop :=
  points.card = 4 ∧
  center ∉ points ∧
  (center = 0 →
    (points ∩ ({2, 7, 8} : Finset Label)).card ≤ 1 ∧
    (points ∩ ({1, 9, 10} : Finset Label)).card ≤ 1) ∧
  (center = 1 →
    (points ∩ ({2, 3, 4, 5, 6} : Finset Label)).card ≤ 1 ∧
    (points ∩ ({0, 9, 10} : Finset Label)).card ≤ 1) ∧
  (center = 2 →
    (points ∩ ({1, 3, 4, 5, 6} : Finset Label)).card ≤ 1 ∧
    (points ∩ ({0, 7, 8} : Finset Label)).card ≤ 1) ∧
  (center ∉ moser → (points ∩ moser).card ≤ 2) ∧
  (center ∈ capS →
    (points ∩ capS).card = if center = 1 ∨ center = 2 then 1 else 2) ∧
  (center = 0 → deleted ∈ points)

instance (center deleted : Label) (points : Finset Label) :
    Decidable (LocalCandidateSpec center deleted points) := by
  unfold LocalCandidateSpec
  infer_instance

set_option maxHeartbeats 1000000 in
-- Structural reduction from bitmask counts to finite-set cardinalities.
set_option maxRecDepth 10000 in
/-- The executable local-candidate test exactly expresses its finite-set
cardinality and incidence conditions. -/
theorem localCandidateOK_maskOfFinset_iff
    (center deleted : Label) (points : Finset Label) :
    localCandidateOK center.val deleted.val (maskOfFinset points) = true ↔
      LocalCandidateSpec center deleted points := by
  have h278 :
      countPoints (maskOfFinset points) [2, 7, 8] =
        (points ∩ ({2, 7, 8} : Finset Label)).card := by
    simpa using countPoints_map_val_eq_inter_card points
      ([2, 7, 8] : List Label) (by decide)
  have h1910 :
      countPoints (maskOfFinset points) [1, 9, 10] =
        (points ∩ ({1, 9, 10} : Finset Label)).card := by
    simpa using countPoints_map_val_eq_inter_card points
      ([1, 9, 10] : List Label) (by decide)
  have h23456 :
      countPoints (maskOfFinset points) [2, 3, 4, 5, 6] =
        (points ∩ ({2, 3, 4, 5, 6} : Finset Label)).card := by
    simpa using countPoints_map_val_eq_inter_card points
      ([2, 3, 4, 5, 6] : List Label) (by decide)
  have h0910 :
      countPoints (maskOfFinset points) [0, 9, 10] =
        (points ∩ ({0, 9, 10} : Finset Label)).card := by
    simpa using countPoints_map_val_eq_inter_card points
      ([0, 9, 10] : List Label) (by decide)
  have h13456 :
      countPoints (maskOfFinset points) [1, 3, 4, 5, 6] =
        (points ∩ ({1, 3, 4, 5, 6} : Finset Label)).card := by
    simpa using countPoints_map_val_eq_inter_card points
      ([1, 3, 4, 5, 6] : List Label) (by decide)
  have h078 :
      countPoints (maskOfFinset points) [0, 7, 8] =
        (points ∩ ({0, 7, 8} : Finset Label)).card := by
    simpa using countPoints_map_val_eq_inter_card points
      ([0, 7, 8] : List Label) (by decide)
  have h012 :
      countPoints (maskOfFinset points) [0, 1, 2] =
        (points ∩ moser).card := by
    simpa [moser] using countPoints_map_val_eq_inter_card points
      ([0, 1, 2] : List Label) (by decide)
  have h123456 :
      countPoints (maskOfFinset points) [1, 2, 3, 4, 5, 6] =
        (points ∩ capS).card := by
    simpa [capS] using countPoints_map_val_eq_inter_card points
      ([1, 2, 3, 4, 5, 6] : List Label) (by decide)
  simp [localCandidateOK, localCandidateOKFourPoint, LocalCandidateSpec,
    moserOneHitOK, capSelectedCountOK,
    countPoints_labels_maskOfFinset, h278, h1910, h23456, h0910, h13456,
    h078, h012, h123456, has_maskOfFinset, moser, capS]
  fin_cases center <;> simp_all [moser, capS] <;> aesop

set_option maxHeartbeats 1000000 in
-- Exhaustive identity over the four possible pinned surplus-interior labels.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Census-554 certificate-bank theorem. -/
theorem maskOfFinset_pinnedRow (pinSource : Label)
    (hpinSource : pinSource ∈ intS) :
    maskOfFinset ({0, 7, 8, pinSource} : Finset Label) =
      (fixedPinnedRow pinSource.val).support := by
  native_decide +revert

end CapSelectedNativeClassifierFacts
end Census554
end Problem97
