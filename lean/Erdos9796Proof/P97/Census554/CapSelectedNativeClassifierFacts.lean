/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode
import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier

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

set_option maxHeartbeats 1000000 in
-- Exhaustive check over the 2,048 finite label sets and eleven labels.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem has_maskOfFinset (points : Finset Label) (point : Label) :
    has (maskOfFinset points) point.val = decide (point ∈ points) := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
-- Exhaustive bound check over all eleven-bit finite label sets.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem maskOfFinset_lt_2048 (points : Finset Label) :
    maskOfFinset points < 2048 := by
  native_decide +revert

set_option maxHeartbeats 0 in
-- Exhaustive identity over all pairs of eleven-label finite sets.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem countPoints_supportPoints_maskOfFinset
    (left right : Finset Label) :
    countPoints (maskOfFinset left) (supportPoints (maskOfFinset right)) =
      (left ∩ right).card := by
  native_decide +revert

set_option maxHeartbeats 0 in
-- One exhaustive pass checks all three fixed Q3 interior blocks.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem allEmptyCommon_capBlocks_iff (left right : Finset Label) :
    (allEmptyCommon (maskOfFinset left) (maskOfFinset right) [7, 8] = true ↔
      left ∩ right ∩ intO1 = ∅) ∧
    (allEmptyCommon (maskOfFinset left) (maskOfFinset right) [9, 10] = true ↔
      left ∩ right ∩ intO2 = ∅) ∧
    (allEmptyCommon (maskOfFinset left) (maskOfFinset right)
        [3, 4, 5, 6] = true ↔ left ∩ right ∩ intS = ∅) := by
  native_decide +revert

@[simp] theorem allEmptyCommon_intO1_iff (left right : Finset Label) :
    allEmptyCommon (maskOfFinset left) (maskOfFinset right) [7, 8] = true ↔
      left ∩ right ∩ intO1 = ∅ :=
  (allEmptyCommon_capBlocks_iff left right).1

@[simp] theorem allEmptyCommon_intO2_iff (left right : Finset Label) :
    allEmptyCommon (maskOfFinset left) (maskOfFinset right) [9, 10] = true ↔
      left ∩ right ∩ intO2 = ∅ :=
  (allEmptyCommon_capBlocks_iff left right).2.1

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
-- Exhaustive equivalence check over centers, deleted labels, and row masks.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem localCandidateOK_maskOfFinset_iff
    (center deleted : Label) (points : Finset Label) :
    localCandidateOK center.val deleted.val (maskOfFinset points) = true ↔
      LocalCandidateSpec center deleted points := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
-- Exhaustive identity over the four possible pinned surplus-interior labels.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem maskOfFinset_pinnedRow (pinSource : Label)
    (hpinSource : pinSource ∈ intS) :
    maskOfFinset ({0, 7, 8, pinSource} : Finset Label) =
      (fixedPinnedRow pinSource.val).support := by
  native_decide +revert

end CapSelectedNativeClassifierFacts
end Census554
end Problem97
