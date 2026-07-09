/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.LocalEnumerator

/-!
# Finite profile symmetries for multi-center class certificates

This module gives executable names to the six permutations of the three Moser
vertices and proves that every profile-preserving code acts by a
`JointProfile.Automorphism`.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ProfileSymmetry

/-- The six permutations of the three Moser vertices. -/
inductive PermCode where
  | identity
  | swap01
  | swap02
  | swap12
  | cycle012
  | cycle021
  deriving Repr, DecidableEq

/-- All permutation codes in certificate order. -/
def permCodes : List PermCode :=
  [.identity, .swap01, .swap02, .swap12, .cycle012, .cycle021]

/-- Interpret a permutation code on Moser vertices. -/
def vertexPerm : PermCode -> Equiv.Perm MoserVertex
  | .identity => Equiv.refl MoserVertex
  | .swap01 => Equiv.swap 0 1
  | .swap02 => Equiv.swap 0 2
  | .swap12 => Equiv.swap 1 2
  | .cycle012 => (Equiv.swap 0 1).trans (Equiv.swap 1 2)
  | .cycle021 => (Equiv.swap 1 2).trans (Equiv.swap 0 1)

/-- Identify a cap with the unique Moser vertex it omits. -/
def capMissingEquiv : JointCap ≃ MoserVertex where
  toFun
    | .S => 0
    | .O1 => 1
    | .O2 => 2
  invFun
    | ⟨0, _⟩ => .S
    | ⟨1, _⟩ => .O1
    | ⟨2, _⟩ => .O2
  left_inv := by intro cap; cases cap <;> rfl
  right_inv := by intro z; fin_cases z <;> rfl

/-- Cap permutation induced by a Moser-vertex permutation. -/
def capPerm (code : PermCode) : Equiv.Perm JointCap :=
  (capMissingEquiv.trans (vertexPerm code)).trans capMissingEquiv.symm

/-- Executable test that a permutation preserves a profile's cap sizes. -/
def preservesProfile (code : PermCode) (profile : JointProfile) : Bool :=
  [decide (profile.capSize (capPerm code .S) = profile.capSize .S),
    decide (profile.capSize (capPerm code .O1) = profile.capSize .O1),
    decide (profile.capSize (capPerm code .O2) = profile.capSize .O2)].all id

/-- The executable profile test supplies the cap-size field of an
automorphism. -/
theorem cap_size_of_preservesProfile
    {code : PermCode} {profile : JointProfile}
    (hpreserves : preservesProfile code profile = true) :
    ∀ cap, profile.capSize (capPerm code cap) = profile.capSize cap := by
  intro cap
  simp [preservesProfile] at hpreserves
  fin_cases cap <;> aesop

set_option linter.style.nativeDecide false in
/-- The induced cap permutation carries each cap's two vertices along the
vertex permutation. -/
theorem cap_vertices (code : PermCode) (cap : JointCap) (v : MoserVertex) :
    v ∈ cap.vertices ↔ vertexPerm code v ∈ (capPerm code cap).vertices := by
  cases code <;> fin_cases cap <;> fin_cases v <;>
    native_decide

/-- Build the semantic profile automorphism certified by a preserving code. -/
def automorphismOf
    (profile : JointProfile) (code : PermCode)
    (hpreserves : preservesProfile code profile = true) :
    profile.Automorphism where
  vertexPerm := vertexPerm code
  capPerm := capPerm code
  cap_size := cap_size_of_preservesProfile hpreserves
  cap_vertices := cap_vertices code

/-- Transport a joint class along one permutation code. -/
def transform (code : PermCode) (cls : JointClass) : JointClass where
  layer := cls.layer
  participants := cls.participants.image (vertexPerm code).toEmbedding
  moserMask := fun z =>
    (cls.moserMask ((vertexPerm code).symm z)).image
      (vertexPerm code).toEmbedding
  capCounts := fun cap mask =>
    cls.capCounts ((capPerm code).symm cap)
      (mask.image (vertexPerm code).symm.toEmbedding)

/-- Transport along a profile-preserving code is semantic profile
equivalence. -/
theorem equivalentUnder_transform
    {profile : JointProfile} {cls : JointClass} {code : PermCode}
    (hpreserves : preservesProfile code profile = true) :
    JointClass.EquivalentUnder profile cls (transform code cls) := by
  refine ⟨automorphismOf profile code hpreserves, rfl, rfl, ?_, ?_⟩
  · intro z
    simp [transform, automorphismOf]
  · intro cap mask
    change cls.capCounts ((capPerm code).symm (capPerm code cap))
        (Finset.image (vertexPerm code).symm
          (Finset.image (vertexPerm code) mask)) = cls.capCounts cap mask
    rw [Equiv.symm_apply_apply]
    apply congrArg (cls.capCounts cap)
    ext vertex
    simp

/-- Explicit cap list used by executable class-data comparisons. -/
def jointCaps : List JointCap := [.S, .O1, .O2]

/-- Every cap occurs in `jointCaps`. -/
theorem mem_jointCaps (cap : JointCap) : cap ∈ jointCaps := by
  cases cap <;> simp [jointCaps]

/-- Executable equality check for all cap-count cells. -/
def allCapCountsEqual (left right : JointClass) : Bool :=
  jointCaps.all fun cap =>
    LocalEnumerator.maskChoices.all fun mask =>
      decide (left.capCounts cap mask = right.capCounts cap mask)

/-- A successful cap-count comparison gives pointwise equality. -/
theorem capCounts_eq_of_allCapCountsEqual
    {left right : JointClass}
    (hcounts : allCapCountsEqual left right = true) :
    left.capCounts = right.capCounts := by
  funext cap mask
  have hcap := (List.all_eq_true.mp hcounts) cap (mem_jointCaps cap)
  have hmask := (List.all_eq_true.mp hcap) mask
    (LocalEnumerator.mem_maskChoices mask)
  simpa using hmask

/-- Executable equality check for semantic joint-class data. -/
def sameJointClassData (left right : JointClass) : Bool :=
  decide (left.layer = right.layer) &&
    (decide (left.participants = right.participants) &&
      (decide (left.moserMask 0 = right.moserMask 0) &&
        (decide (left.moserMask 1 = right.moserMask 1) &&
          (decide (left.moserMask 2 = right.moserMask 2) &&
            allCapCountsEqual left right))))

/-- Successful semantic data comparison is actual `JointClass` equality. -/
theorem jointClass_eq_of_sameJointClassData
    {left right : JointClass}
    (hdata : sameJointClassData left right = true) :
    left = right := by
  simp only [sameJointClassData, Bool.and_eq_true, decide_eq_true_eq] at hdata
  rcases hdata with ⟨hlayer, hparticipants, h0, h1, h2, hcounts⟩
  cases left with
  | mk layer participants moserMask capCounts =>
      cases right with
      | mk layer' participants' moserMask' capCounts' =>
          simp only [JointClass.mk.injEq] at hlayer hparticipants ⊢
          refine ⟨hlayer, hparticipants, ?_, ?_⟩
          · funext z
            fin_cases z
            · exact h0
            · exact h1
            · exact h2
          · exact capCounts_eq_of_allCapCountsEqual hcounts

/-- Matching a transported candidate to a representative row proves profile
equivalence to that representative. -/
theorem equivalentUnder_of_sameTransformedData
    {profile : JointProfile} {candidate representative : JointClass}
    {code : PermCode}
    (hpreserves : preservesProfile code profile = true)
    (hdata : sameJointClassData (transform code candidate) representative = true) :
    JointClass.EquivalentUnder profile candidate representative := by
  rw [← jointClass_eq_of_sameJointClassData hdata]
  exact equivalentUnder_transform hpreserves

end ProfileSymmetry
end Certificate
end MultiCenter
end Problem97
