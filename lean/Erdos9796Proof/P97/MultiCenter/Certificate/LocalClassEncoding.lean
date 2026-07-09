/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.TypedClass
import Mathlib.Tactic.FinCases

/-!
# Multi-center local class encoding

This module records the exact finite mask encoding used by generated
`RawClassRow` values.  It is the hand-written bridge layer between arbitrary
semantic `JointClass` values and the raw row shape consumed by the generated
multi-center certificate banks.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate

namespace RawClassRow

set_option linter.style.nativeDecide false in
/-- Decoding the encoded mask of a finite Moser-vertex set recovers that set. -/
theorem maskToFinset_finsetMask (mask : Finset MoserVertex) :
    maskToFinset (finsetMask mask) = mask := by
  native_decide +revert

set_option linter.style.nativeDecide false in
/-- The empty finite set has raw mask zero. -/
theorem finsetMask_empty :
    finsetMask (∅ : Finset MoserVertex) = 0 := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The full Moser-vertex set has raw mask seven. -/
theorem finsetMask_univ :
    finsetMask (Finset.univ : Finset MoserVertex) = 7 := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Raw mask one decodes to the singleton center `0`. -/
@[simp] theorem maskToFinset_one :
    maskToFinset 1 = ({0} : Finset MoserVertex) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Raw mask two decodes to the singleton center `1`. -/
@[simp] theorem maskToFinset_two :
    maskToFinset 2 = ({1} : Finset MoserVertex) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Raw mask three decodes to centers `0` and `1`. -/
@[simp] theorem maskToFinset_three :
    maskToFinset 3 = ({0, 1} : Finset MoserVertex) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Raw mask four decodes to the singleton center `2`. -/
@[simp] theorem maskToFinset_four :
    maskToFinset 4 = ({2} : Finset MoserVertex) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Raw mask five decodes to centers `0` and `2`. -/
@[simp] theorem maskToFinset_five :
    maskToFinset 5 = ({0, 2} : Finset MoserVertex) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Raw mask six decodes to centers `1` and `2`. -/
@[simp] theorem maskToFinset_six :
    maskToFinset 6 = ({1, 2} : Finset MoserVertex) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Raw mask seven decodes to all three centers. -/
@[simp] theorem maskToFinset_seven :
    maskToFinset 7 = ({0, 1, 2} : Finset MoserVertex) := by
  native_decide

end RawClassRow

namespace LocalClassEncoding

/-- The nonempty raw masks stored in a `RawClassRow.counts` block. -/
def countMasks : List (Finset MoserVertex) :=
  [RawClassRow.maskToFinset 1,
    RawClassRow.maskToFinset 2,
    RawClassRow.maskToFinset 3,
    RawClassRow.maskToFinset 4,
    RawClassRow.maskToFinset 5,
    RawClassRow.maskToFinset 6,
    RawClassRow.maskToFinset 7]

/-- The seven raw count entries for one cap. -/
def countsForCap (cls : JointClass) (cap : JointCap) : List Nat :=
  countMasks.map (fun mask => cls.capCounts cap mask)

/-- The 21 raw count entries for all caps in generated-bank order. -/
def countsOfClass (cls : JointClass) : List Nat :=
  countsForCap cls .S ++ countsForCap cls .O1 ++ countsForCap cls .O2

/-- Encode a semantic class in the raw row shape used by the generated class
bank.  The metadata fields are placeholders; only the support-incidence fields
participate in `RawClassRow.toJointClass`. -/
def rawRowOfClass (cls : JointClass) : RawClassRow where
  id := 0
  firstN := 0
  lastN := 0
  participantsMask := RawClassRow.finsetMask cls.participants
  moser0 := RawClassRow.finsetMask (cls.moserMask 0)
  moser1 := RawClassRow.finsetMask (cls.moserMask 1)
  moser2 := RawClassRow.finsetMask (cls.moserMask 2)
  counts := countsOfClass cls

/-- The raw encoding always decodes to the L2 layer, matching generated rows. -/
theorem rawRowOfClass_layer (cls : JointClass) :
    (rawRowOfClass cls).toJointClass.layer = .L2 := by
  rfl

/-- The raw encoding preserves the participant set. -/
theorem rawRowOfClass_participants (cls : JointClass) :
    (rawRowOfClass cls).toJointClass.participants = cls.participants := by
  simp [rawRowOfClass, RawClassRow.toJointClass,
    RawClassRow.maskToFinset_finsetMask]

/-- The raw encoding preserves Moser-vertex masks. -/
theorem rawRowOfClass_moserMask (cls : JointClass) :
    (rawRowOfClass cls).toJointClass.moserMask = cls.moserMask := by
  funext z
  fin_cases z <;>
    simp [rawRowOfClass, RawClassRow.toJointClass, RawClassRow.moserMaskAt,
      RawClassRow.maskToFinset_finsetMask]

set_option linter.flexible false in
/-- The raw encoding preserves cap-count cells when the empty mask is unused.
This is the exact side condition supplied by `JointClass.Supported`. -/
theorem rawRowOfClass_capCounts
    (cls : JointClass) (hEmpty : ∀ cap, cls.capCounts cap ∅ = 0)
    (cap : JointCap) (mask : Finset MoserVertex) :
    (rawRowOfClass cls).toJointClass.capCounts cap mask =
      cls.capCounts cap mask := by
  fin_cases cap <;> fin_cases mask <;>
    simp [rawRowOfClass, RawClassRow.toJointClass, RawClassRow.countAt,
      RawClassRow.countAtMask, RawClassRow.capOffset, countsOfClass,
      countsForCap, countMasks, RawClassRow.finsetMask,
      RawClassRow.vertexBit, hEmpty] <;>
      congr 1

/-- `Supported` classes do not use the empty cap-count mask. -/
theorem capCounts_empty_eq_zero_of_supported
    {cls : JointClass} (hsupp : cls.Supported) (cap : JointCap) :
    cls.capCounts cap ∅ = 0 := by
  by_contra h
  have hne : cls.capCounts cap ∅ ≠ 0 := h
  exact (Finset.not_nonempty_empty (hsupp.2 cap ∅ hne).1)

/-- A raw row built from an L2 class with no empty cap-count cells decodes
back to that class. -/
theorem rawRowOfClass_toJointClass
    (cls : JointClass) (hLayer : cls.layer = .L2)
    (hEmpty : ∀ cap, cls.capCounts cap ∅ = 0) :
    (rawRowOfClass cls).toJointClass = cls := by
  cases cls with
  | mk layer participants moserMask capCounts =>
      simp only [rawRowOfClass, RawClassRow.toJointClass,
        JointClass.mk.injEq]
      refine ⟨hLayer.symm, ?_, ?_, ?_⟩
      · exact RawClassRow.maskToFinset_finsetMask participants
      · funext z
        fin_cases z <;>
          simp [RawClassRow.moserMaskAt, RawClassRow.maskToFinset_finsetMask]
      · funext cap mask
        exact rawRowOfClass_capCounts
          { layer := layer
            participants := participants
            moserMask := moserMask
            capCounts := capCounts } hEmpty cap mask

/-- An L2 supported semantic class has an exact raw-row encoding. -/
theorem rawRowOfClass_toJointClass_of_l2_supported
    {cls : JointClass} (hLayer : cls.layer = .L2)
    (hsupp : cls.Supported) :
    (rawRowOfClass cls).toJointClass = cls :=
  rawRowOfClass_toJointClass cls hLayer
    (capCounts_empty_eq_zero_of_supported hsupp)

end LocalClassEncoding

end Certificate
end MultiCenter
end Problem97
