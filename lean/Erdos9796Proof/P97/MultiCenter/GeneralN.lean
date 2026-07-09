/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Max
import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Nat.Basic

/-!
# Multi-center census: class objects and abstract general-`n` lemmas

This file contains the proof-clean part of the multi-center census theorem
stack.  The first section records the finite class object used by the
`canon_joint` boundary in `census/multi_center/multi_center_census.py`; the
second section records the abstract finite-inventory lemmas that the eventual
geometric statements should consume:

* forward persistence plus a reverse/upper-bound direction locks an inventory;
* a stable `LOCAL` alphabet plus local-to-global completion locks `GLOBAL`;
* these arguments are independent of the computational census artifacts.
-/

namespace Problem97
namespace MultiCenter

/-- The three Moser vertices used by the multi-center token census. -/
abbrev MoserVertex := Fin 3

/-- The three cap names in the multi-center token census. -/
inductive JointCap where
  | S
  | O1
  | O2
  deriving DecidableEq, Repr

namespace JointCap

instance : Fintype JointCap where
  elems := {S, O1, O2}
  complete := by
    intro cap
    cases cap <;> simp

/-- The two Moser vertices spanning each cap. -/
def vertices : JointCap -> Finset MoserVertex
  | S => {1, 2}
  | O1 => {0, 2}
  | O2 => {0, 1}

end JointCap

/-- The local/global class layer.  `L2` is the current triple-support surface;
`L1` is retained for pairwise projections. -/
inductive JointLayer where
  | L1
  | L2
  deriving DecidableEq, Repr

namespace JointLayer

instance : Fintype JointLayer where
  elems := {L1, L2}
  complete := by
    intro layer
    cases layer <;> simp

end JointLayer

/-- Cap sizes for one `(S,O1,O2)` profile.  The census uses sizes including
the two Moser endpoints of each cap; interior capacity is therefore `size - 2`.
-/
structure JointProfile where
  capSize : JointCap -> Nat

namespace JointProfile

/-- Available non-Moser labels in a cap of the profile. -/
def interiorCapacity (P : JointProfile) (cap : JointCap) : Nat :=
  P.capSize cap - 2

/-- Increase one cap size by one label.  This is the profile-level operation
for adding an unused interior point to one cap. -/
def extendCap (P : JointProfile) (target : JointCap) : JointProfile where
  capSize := fun cap =>
    if cap = target then P.capSize cap + 1 else P.capSize cap

/-- Extending one cap weakly increases every cap's interior capacity. -/
theorem interiorCapacity_le_extendCap
    (P : JointProfile) (target cap : JointCap) :
    P.interiorCapacity cap ≤ (P.extendCap target).interiorCapacity cap := by
  by_cases h : cap = target
  · have hle : P.capSize cap - 2 ≤ (P.capSize cap + 1) - 2 :=
      Nat.sub_le_sub_right (Nat.le_succ (P.capSize cap)) 2
    simpa [extendCap, interiorCapacity, h] using hle
  · simp [extendCap, interiorCapacity, h]

/-- A size-preserving profile automorphism, stated with both its Moser-vertex
and cap-level actions.  This is the Lean surface corresponding to
`allowed_profile_perms`. -/
structure Automorphism (P : JointProfile) where
  vertexPerm : Equiv.Perm MoserVertex
  capPerm : Equiv.Perm JointCap
  cap_size : ∀ cap, P.capSize (capPerm cap) = P.capSize cap
  cap_vertices :
    ∀ cap v, v ∈ cap.vertices ↔ vertexPerm v ∈ (capPerm cap).vertices

namespace Automorphism

/-- The identity profile automorphism. -/
def refl (P : JointProfile) : P.Automorphism where
  vertexPerm := Equiv.refl MoserVertex
  capPerm := Equiv.refl JointCap
  cap_size := by
    intro cap
    rfl
  cap_vertices := by
    intro cap v
    simp

end Automorphism

end JointProfile

/-- A support-incidence class before quotienting by profile automorphisms.

`moserMask z` records which participating centers use the Moser vertex `z`.
`capCounts cap mask` records how many interior labels of `cap` are used by
exactly the centers in `mask`.  This is the data encoded by `canon_joint`
before canonical minimization. -/
structure JointClass where
  layer : JointLayer
  participants : Finset MoserVertex
  moserMask : MoserVertex -> Finset MoserVertex
  capCounts : JointCap -> Finset MoserVertex -> Nat

namespace JointClass

/-- All masks over the three Moser centers. -/
def allMasks : Finset (Finset MoserVertex) :=
  Finset.univ

/-- The unordered two-center mask. -/
def pairMask (a b : MoserVertex) : Finset MoserVertex :=
  {a, b}

/-- Uses supplied by Moser vertices to a participating center. -/
def moserUseCount (C : JointClass) (center : MoserVertex) : Nat :=
  ((Finset.univ : Finset MoserVertex).filter
    (fun z => center ∈ C.moserMask z)).card

/-- Uses supplied by one cap's interior labels to a participating center. -/
def capUseCount (C : JointClass) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  (allMasks.filter (fun mask => center ∈ mask)).sum
    (fun mask => C.capCounts cap mask)

/-- Total selected-class size recorded for a participating center. -/
def centerUseCount (C : JointClass) (center : MoserVertex) : Nat :=
  C.moserUseCount center +
    (Finset.univ : Finset JointCap).sum
      (fun cap => C.capUseCount cap center)

/-- Total number of interior labels of a cap consumed by the class. -/
def capTotalCount (C : JointClass) (cap : JointCap) : Nat :=
  allMasks.sum (fun mask => C.capCounts cap mask)

/-- The H1 one-hit budget inside a cap containing the queried Moser center. -/
def h1UseInCap (C : JointClass) (cap : JointCap)
    (center : MoserVertex) : Nat :=
  (cap.vertices.filter
      (fun z => z ≠ center ∧ center ∈ C.moserMask z)).card +
    C.capUseCount cap center

/-- Number of selected classes sharing both centers in a pair. -/
def pairSharedCount (C : JointClass) (a b : MoserVertex) : Nat :=
  let ab := pairMask a b
  ((Finset.univ : Finset MoserVertex).filter
      (fun z => ab ⊆ C.moserMask z)).card +
    (Finset.univ : Finset JointCap).sum
      (fun cap =>
        (allMasks.filter (fun mask => ab ⊆ mask)).sum
          (fun mask => C.capCounts cap mask))

/-- Number of interior labels in one cap shared by both centers in a pair. -/
def pairSharedInCap (C : JointClass) (cap : JointCap)
    (a b : MoserVertex) : Nat :=
  let ab := pairMask a b
  (allMasks.filter (fun mask => ab ⊆ mask)).sum
    (fun mask => C.capCounts cap mask)

/-- The cap containing both Moser centers in a pair, followed by the two
remaining caps.  This is the `PAIR_CAP` table in `q3_token.py`. -/
def pairCapData (a b : MoserVertex) : JointCap × JointCap × JointCap :=
  if ({a, b} : Finset MoserVertex) = ({1, 2} : Finset MoserVertex) then
    (.S, .O1, .O2)
  else if ({a, b} : Finset MoserVertex) = ({0, 2} : Finset MoserVertex) then
    (.O1, .S, .O2)
  else
    (.O2, .S, .O1)

/-- The proven Q3 joint-kill layer: no common-cap shared interior member, and
not shared interior members on both opposite caps. -/
def jointKillsOK (C : JointClass) : Prop :=
  ∀ a ∈ C.participants, ∀ b ∈ C.participants, a ≠ b ->
    let data := pairCapData a b
    C.pairSharedInCap data.1 a b = 0 ∧
      (C.pairSharedInCap data.2.1 a b = 0 ∨
        C.pairSharedInCap data.2.2 a b = 0)

/-- Local syntactic well-formedness before the census-specific constraints. -/
def Supported (C : JointClass) : Prop :=
  (∀ z, C.moserMask z ⊆ C.participants ∧ z ∉ C.moserMask z) ∧
    ∀ cap mask, C.capCounts cap mask ≠ 0 ->
      mask.Nonempty ∧ mask ⊆ C.participants

/-- The LOCAL constraints represented by the `local_structures` enumerator. -/
def LocallyAdmissible (P : JointProfile) (C : JointClass) : Prop :=
  C.Supported ∧
    (∀ center ∈ C.participants, C.centerUseCount center = 4) ∧
    (∀ cap, C.capTotalCount cap ≤ P.interiorCapacity cap) ∧
    (∀ center ∈ C.participants, ∀ cap,
      center ∈ cap.vertices -> C.h1UseInCap cap center ≤ 1) ∧
    (∀ a ∈ C.participants, ∀ b ∈ C.participants,
      a ≠ b -> C.pairSharedCount a b ≤ 2) ∧
    C.jointKillsOK

/-- The profile-automorphism equivalence relation before choosing a canonical
minimum representative. -/
def EquivalentUnder (P : JointProfile) (C D : JointClass) : Prop :=
  ∃ e : P.Automorphism,
    D.layer = C.layer ∧
      D.participants = C.participants.image e.vertexPerm.toEmbedding ∧
      (∀ z,
        D.moserMask (e.vertexPerm z) =
          (C.moserMask z).image e.vertexPerm.toEmbedding) ∧
      ∀ cap mask,
        D.capCounts (e.capPerm cap) (mask.image e.vertexPerm.toEmbedding) =
          C.capCounts cap mask

/-- Profile-automorphism equivalence is reflexive. -/
theorem equivalentUnder_refl (P : JointProfile) (C : JointClass) :
    EquivalentUnder P C C := by
  refine ⟨JointProfile.Automorphism.refl P, ?_⟩
  refine ⟨rfl, ?_, ?_, ?_⟩
  · apply Finset.ext
    intro x
    simp [JointProfile.Automorphism.refl]
  · intro z
    apply Finset.ext
    intro x
    simp [JointProfile.Automorphism.refl]
  · intro cap mask
    congr 1
    apply Finset.ext
    intro x
    simp [JointProfile.Automorphism.refl]

/-- Restrict a class to a chosen participant set, aggregating cap-count rows
whose masks have the same restricted image.  Pairwise `L1` projections of an
`L2` class are instances of this operation. -/
def restrictTo (C : JointClass) (participants : Finset MoserVertex)
    (layer : JointLayer) : JointClass where
  layer := layer
  participants := C.participants ∩ participants
  moserMask := fun z => C.moserMask z ∩ participants
  capCounts := fun cap mask =>
    (allMasks.filter (fun sourceMask => sourceMask ∩ participants = mask)).sum
      (fun sourceMask => C.capCounts cap sourceMask)

/-- Every cap-count cell in a locally admissible class is bounded by the
profile's interior capacity for that cap. -/
theorem capCounts_le_interiorCapacity_of_locallyAdmissible
    {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P)
    (cap : JointCap) (mask : Finset MoserVertex) :
    C.capCounts cap mask ≤ P.interiorCapacity cap := by
  exact (Finset.single_le_sum
      (fun sourceMask _ => Nat.zero_le (C.capCounts cap sourceMask))
      (by simp [allMasks])).trans (hlocal.2.2.1 cap)

/-- Every cap-count cell in a locally admissible class is bounded by the
selected class size `4`, independently of the profile capacity. -/
theorem capCounts_le_four_of_locallyAdmissible
    {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P)
    (cap : JointCap) (mask : Finset MoserVertex) :
    C.capCounts cap mask ≤ 4 := by
  by_cases hzero : C.capCounts cap mask = 0
  · rw [hzero]
    exact Nat.zero_le 4
  · have hsupp := hlocal.1.2 cap mask hzero
    rcases hsupp.1 with ⟨center, hcenter_mask⟩
    have hcenter_part : center ∈ C.participants := hsupp.2 hcenter_mask
    have hmask_filter :
        mask ∈ allMasks.filter (fun sourceMask => center ∈ sourceMask) := by
      simp [allMasks, hcenter_mask]
    have hcount_le_capUse : C.capCounts cap mask ≤ C.capUseCount cap center := by
      exact Finset.single_le_sum
        (fun sourceMask _ => Nat.zero_le (C.capCounts cap sourceMask))
        hmask_filter
    have hcap_mem : cap ∈ (Finset.univ : Finset JointCap) := by
      simp
    have hcapUse_le_sum :
        C.capUseCount cap center ≤
          (Finset.univ : Finset JointCap).sum
            (fun sourceCap => C.capUseCount sourceCap center) := by
      exact Finset.single_le_sum
        (fun sourceCap _ => Nat.zero_le (C.capUseCount sourceCap center))
        hcap_mem
    have hsum_le_center :
        (Finset.univ : Finset JointCap).sum
            (fun sourceCap => C.capUseCount sourceCap center) ≤
          C.centerUseCount center := by
      simp [centerUseCount]
    calc
      C.capCounts cap mask ≤ C.capUseCount cap center := hcount_le_capUse
      _ ≤ (Finset.univ : Finset JointCap).sum
            (fun sourceCap => C.capUseCount sourceCap center) := hcapUse_le_sum
      _ ≤ C.centerUseCount center := hsum_le_center
      _ = 4 := hlocal.2.1 center hcenter_part

/-- LOCAL admissibility is monotone under increasing profile capacities. -/
theorem locallyAdmissible_of_interiorCapacity_mono
    {P Q : JointProfile} {C : JointClass}
    (hcap : ∀ cap, P.interiorCapacity cap ≤ Q.interiorCapacity cap)
    (hlocal : C.LocallyAdmissible P) :
    C.LocallyAdmissible Q := by
  rcases hlocal with ⟨hsupp, hcenter, hcapacity, hh1, hpair, hkills⟩
  refine ⟨hsupp, hcenter, ?_, hh1, hpair, hkills⟩
  intro cap
  exact le_trans (hcapacity cap) (hcap cap)

/-- Adding one unused cap label preserves LOCAL admissibility. -/
theorem locallyAdmissible_extendCap
    {P : JointProfile} {C : JointClass} (target : JointCap)
    (hlocal : C.LocallyAdmissible P) :
    C.LocallyAdmissible (P.extendCap target) :=
  locallyAdmissible_of_interiorCapacity_mono
    (JointProfile.interiorCapacity_le_extendCap P target) hlocal

end JointClass

/-- Finite bounded coding of a class for a fixed profile.

The unbounded `JointClass` keeps cap counts as natural numbers because it is
the convenient semantic surface.  This wrapper is the finite alphabet carrier:
for a fixed profile, every cap-count cell is recorded as an element of
`Fin (interiorCapacity + 1)`. -/
structure BoundedJointClass (P : JointProfile) where
  layer : JointLayer
  participants : Finset MoserVertex
  moserMask : MoserVertex -> Finset MoserVertex
  capCounts :
    (cap : JointCap) ->
      Finset MoserVertex ->
        Fin (P.interiorCapacity cap + 1)

namespace BoundedJointClass

/-- Forget the finite bounds and recover the semantic class object. -/
def toJointClass {P : JointProfile} (B : BoundedJointClass P) : JointClass where
  layer := B.layer
  participants := B.participants
  moserMask := B.moserMask
  capCounts := fun cap mask => B.capCounts cap mask

/-- Recode a class whose cap-count cells are bounded by the profile. -/
def ofJointClassWithBounds (P : JointProfile) (C : JointClass)
    (hbound : ∀ cap mask, C.capCounts cap mask ≤ P.interiorCapacity cap) :
    BoundedJointClass P where
  layer := C.layer
  participants := C.participants
  moserMask := C.moserMask
  capCounts := fun cap mask =>
    ⟨C.capCounts cap mask, Nat.lt_succ_of_le (hbound cap mask)⟩

/-- A locally admissible class has a bounded code for its profile. -/
def ofLocallyAdmissible {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) : BoundedJointClass P :=
  ofJointClassWithBounds P C
    (JointClass.capCounts_le_interiorCapacity_of_locallyAdmissible hlocal)

theorem toJointClass_ofJointClassWithBounds
    (P : JointProfile) (C : JointClass)
    (hbound : ∀ cap mask, C.capCounts cap mask ≤ P.interiorCapacity cap) :
    (ofJointClassWithBounds P C hbound).toJointClass = C := by
  cases C
  rfl

theorem toJointClass_ofLocallyAdmissible
    {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) :
    (ofLocallyAdmissible hlocal).toJointClass = C := by
  exact toJointClass_ofJointClassWithBounds P C _

/-- Product coding used only to expose the finite alphabet instance. -/
def codingEquiv (P : JointProfile) :
    BoundedJointClass P ≃
      JointLayer × Finset MoserVertex ×
        (MoserVertex -> Finset MoserVertex) ×
          ((cap : JointCap) ->
            Finset MoserVertex ->
              Fin (P.interiorCapacity cap + 1)) where
  toFun B := (B.layer, B.participants, B.moserMask, B.capCounts)
  invFun data :=
    { layer := data.1
      participants := data.2.1
      moserMask := data.2.2.1
      capCounts := data.2.2.2 }
  left_inv := by
    intro B
    cases B
    rfl
  right_inv := by
    intro data
    rcases data with ⟨layer, participants, moserMask, capCounts⟩
    rfl

noncomputable instance (P : JointProfile) : Fintype (BoundedJointClass P) :=
  Fintype.ofEquiv _ (codingEquiv P).symm

end BoundedJointClass

/-- The finite alphabet of locally admissible bounded class codes for a fixed
profile. -/
abbrev LocalClassCode (P : JointProfile) :=
  {B : BoundedJointClass P // B.toJointClass.LocallyAdmissible P}

namespace LocalClassCode

noncomputable instance (P : JointProfile) : Fintype (LocalClassCode P) := by
  classical
  infer_instance

/-- Forget a local code back to its semantic class object. -/
def toJointClass {P : JointProfile} (B : LocalClassCode P) : JointClass :=
  B.1.toJointClass

theorem locallyAdmissible {P : JointProfile} (B : LocalClassCode P) :
    B.toJointClass.LocallyAdmissible P :=
  B.2

/-- Recode a locally admissible semantic class as a finite local code. -/
def ofLocallyAdmissible {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) : LocalClassCode P :=
  ⟨BoundedJointClass.ofLocallyAdmissible hlocal, by
    rw [BoundedJointClass.toJointClass_ofLocallyAdmissible hlocal]
    exact hlocal⟩

theorem toJointClass_ofLocallyAdmissible
    {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) :
    (ofLocallyAdmissible hlocal).toJointClass = C := by
  exact BoundedJointClass.toJointClass_ofLocallyAdmissible hlocal

end LocalClassCode

/-- Profile-independent finite coding of joint classes.

For locally admissible classes every cap-count cell is at most `4`, so the
profile capacity is not needed to obtain a finite carrier for class keys. -/
structure FourBoundedJointClass where
  layer : JointLayer
  participants : Finset MoserVertex
  moserMask : MoserVertex -> Finset MoserVertex
  capCounts : JointCap -> Finset MoserVertex -> Fin 5

namespace FourBoundedJointClass

/-- Forget the `≤ 4` cap-count bounds. -/
def toJointClass (K : FourBoundedJointClass) : JointClass where
  layer := K.layer
  participants := K.participants
  moserMask := K.moserMask
  capCounts := fun cap mask => K.capCounts cap mask

/-- Recode a class whose cap-count cells are bounded by `4`. -/
def ofJointClassWithFour (C : JointClass)
    (hbound : ∀ cap mask, C.capCounts cap mask ≤ 4) :
    FourBoundedJointClass where
  layer := C.layer
  participants := C.participants
  moserMask := C.moserMask
  capCounts := fun cap mask =>
    ⟨C.capCounts cap mask, Nat.lt_succ_of_le (hbound cap mask)⟩

/-- A locally admissible class has a profile-independent finite code. -/
def ofLocallyAdmissible {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) : FourBoundedJointClass :=
  ofJointClassWithFour C
    (JointClass.capCounts_le_four_of_locallyAdmissible hlocal)

theorem toJointClass_ofJointClassWithFour
    (C : JointClass)
    (hbound : ∀ cap mask, C.capCounts cap mask ≤ 4) :
    (ofJointClassWithFour C hbound).toJointClass = C := by
  cases C
  rfl

theorem toJointClass_ofLocallyAdmissible
    {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) :
    (ofLocallyAdmissible hlocal).toJointClass = C := by
  exact toJointClass_ofJointClassWithFour C _

/-- Product coding used only to expose the finite profile-independent alphabet. -/
def codingEquiv :
    FourBoundedJointClass ≃
      JointLayer × Finset MoserVertex ×
        (MoserVertex -> Finset MoserVertex) ×
          (JointCap -> Finset MoserVertex -> Fin 5) where
  toFun K := (K.layer, K.participants, K.moserMask, K.capCounts)
  invFun data :=
    { layer := data.1
      participants := data.2.1
      moserMask := data.2.2.1
      capCounts := data.2.2.2 }
  left_inv := by
    intro K
    cases K
    rfl
  right_inv := by
    intro data
    rcases data with ⟨layer, participants, moserMask, capCounts⟩
    rfl

noncomputable instance : Fintype FourBoundedJointClass :=
  Fintype.ofEquiv _ codingEquiv.symm

/-- The semantic forgetful map from four-bounded codes is injective. -/
theorem toJointClass_injective : Function.Injective toJointClass := by
  intro K L h
  cases K with
  | mk layer participants moserMask capCounts =>
  cases L with
  | mk layer' participants' moserMask' capCounts' =>
  simp only [toJointClass, JointClass.mk.injEq, FourBoundedJointClass.mk.injEq] at h ⊢
  rcases h with ⟨hlayer, hparticipants, hmoser, hcounts⟩
  subst layer'
  subst participants'
  subst moserMask'
  refine ⟨rfl, rfl, rfl, ?_⟩
  funext cap mask
  apply Fin.ext
  exact congrFun (congrFun hcounts cap) mask

/-- Embedding of four-bounded class keys into the semantic class surface. -/
def toJointClassEmbedding : FourBoundedJointClass ↪ JointClass where
  toFun := toJointClass
  inj' := toJointClass_injective

end FourBoundedJointClass

/-- The finite profile-independent alphabet of locally admissible joint-class
keys. -/
abbrev LocalJointClassCode :=
  {K : FourBoundedJointClass //
    ∃ P : JointProfile, K.toJointClass.LocallyAdmissible P}

namespace LocalJointClassCode

noncomputable instance : Fintype LocalJointClassCode := by
  classical
  infer_instance

/-- Forget a local key back to its semantic class object. -/
def toJointClass (K : LocalJointClassCode) : JointClass :=
  K.1.toJointClass

theorem locallyAdmissible_for_some_profile (K : LocalJointClassCode) :
    ∃ P : JointProfile, K.toJointClass.LocallyAdmissible P :=
  K.2

/-- Recode a locally admissible semantic class as a profile-independent key. -/
def ofLocallyAdmissible {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) : LocalJointClassCode :=
  ⟨FourBoundedJointClass.ofLocallyAdmissible hlocal, by
    refine ⟨P, ?_⟩
    rw [FourBoundedJointClass.toJointClass_ofLocallyAdmissible hlocal]
    exact hlocal⟩

theorem toJointClass_ofLocallyAdmissible
    {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) :
    (ofLocallyAdmissible hlocal).toJointClass = C := by
  exact FourBoundedJointClass.toJointClass_ofLocallyAdmissible hlocal

/-- The semantic forgetful map from local class keys is injective. -/
theorem toJointClass_injective : Function.Injective toJointClass := by
  intro K L h
  apply Subtype.ext
  exact FourBoundedJointClass.toJointClass_injective h

/-- Embedding of local class keys into the semantic class surface. -/
def toJointClassEmbedding : LocalJointClassCode ↪ JointClass where
  toFun := toJointClass
  inj' := toJointClass_injective

/-- A semantic class is represented by the finite local-code alphabet. -/
def CodedBy (C : JointClass) : Prop :=
  ∃ K : LocalJointClassCode, K.toJointClass = C

theorem codedBy_of_locallyAdmissible
    {P : JointProfile} {C : JointClass}
    (hlocal : C.LocallyAdmissible P) :
    CodedBy C :=
  ⟨ofLocallyAdmissible hlocal, toJointClass_ofLocallyAdmissible hlocal⟩

end LocalJointClassCode

/-- A finite class inventory is stable from `N` onward. -/
def StabilizesAt (I : Nat -> Finset α) (N : Nat) : Prop :=
  ∀ n, N ≤ n -> I n = I N

/-- Stability persists if the threshold is moved upward. -/
theorem stabilizesAt_mono
    {I : Nat -> Finset α} {N M : Nat}
    (hstable : StabilizesAt I N) (hNM : N ≤ M) :
    StabilizesAt I M := by
  intro n hn
  calc
    I n = I N := hstable n (le_trans hNM hn)
    _ = I M := (hstable M hNM).symm

/-- A finite class inventory is monotone in `n`. -/
def MonotoneInventory (I : Nat -> Finset α) : Prop :=
  ∀ {m n : Nat}, m ≤ n -> I m ⊆ I n

/-- Pointwise one-step persistence of realized classes. -/
def StepPersistent (I : Nat -> Finset α) : Prop :=
  ∀ n, I n ⊆ I (n + 1)

/-- Pointwise reverse persistence above a threshold.  This is the upper-bound
direction missing from forward persistence alone. -/
def StepReversePersistentFrom (I : Nat -> Finset α) (N : Nat) : Prop :=
  ∀ n, N ≤ n -> I (n + 1) ⊆ I n

/-- All inventories live inside one finite alphabet. -/
def BoundedByAlphabet (I : Nat -> Finset α) (U : Finset α) : Prop :=
  ∀ n, I n ⊆ U

/-- Every globally realized class is locally admissible. -/
def GlobalSubsetsLocal (L G : Nat -> Finset α) : Prop :=
  ∀ n, G n ⊆ L n

/-- Local-to-global completion above a threshold. -/
def LocalCompletesGlobalFrom (L G : Nat -> Finset α) (N : Nat) : Prop :=
  ∀ n, N ≤ n -> L n ⊆ G n

/-- Local-to-global completion persists if the threshold is moved upward. -/
theorem localCompletesGlobalFrom_mono
    {L G : Nat -> Finset α} {N M : Nat}
    (hcompletion : LocalCompletesGlobalFrom L G N) (hNM : N ≤ M) :
    LocalCompletesGlobalFrom L G M := by
  intro n hn
  exact hcompletion n (le_trans hNM hn)

/-- Two inventories agree above a threshold. -/
def EqualInventoriesFrom (I J : Nat -> Finset α) (N : Nat) : Prop :=
  ∀ n, N ≤ n -> I n = J n

/-- Map a class inventory along an embedding. -/
def mapInventory (e : α ↪ β) (I : Nat -> Finset α) : Nat -> Finset β :=
  fun n => (I n).map e

/-- One-step persistence gives monotonicity in the ambient parameter. -/
theorem monotoneInventory_of_stepPersistent
    {I : Nat -> Finset α}
    (hstep : StepPersistent I) :
    MonotoneInventory I := by
  intro m n hmn
  induction n, hmn using Nat.le_induction with
  | base =>
      intro x hx
      exact hx
  | succ n _ ih =>
      intro x hx
      exact hstep n (ih hx)

/-- Inventories over a finite type are bounded by the universal alphabet. -/
theorem boundedByAlphabet_univ
    [Fintype α] {I : Nat -> Finset α} :
    BoundedByAlphabet I (Finset.univ : Finset α) := by
  intro n x hx
  simp

/-- A monotone inventory is locked from `N` once every later inventory is
bounded above by the inventory at `N`. -/
theorem stabilizesAt_of_subset_base
    {I : Nat -> Finset α} {N : Nat}
    (hmono : MonotoneInventory I)
    (hub : ∀ n, N ≤ n -> I n ⊆ I N) :
    StabilizesAt I N := by
  intro n hn
  exact Finset.Subset.antisymm (hub n hn) (hmono hn)

/-- One-step forward persistence plus one-step reverse persistence above `N`
locks the inventory from `N` onward. -/
theorem stabilizesAt_of_step_sandwich
    {I : Nat -> Finset α} {N : Nat}
    (hforward : StepPersistent I)
    (hback : StepReversePersistentFrom I N) :
    StabilizesAt I N := by
  intro n hn
  induction n, hn using Nat.le_induction with
  | base => rfl
  | succ n hn ih =>
      apply Finset.Subset.antisymm
      · calc
          I (n + 1) ⊆ I n := hback n hn
          _ = I N := ih
      · calc
          I N = I n := ih.symm
          _ ⊆ I (n + 1) := hforward n

/-- A monotone inventory bounded by one finite alphabet is eventually stable.

This is the abstract proof of the qualitative carry-forward step: once the
class alphabet is finite, forward persistence alone rules out infinitely many
fresh classes, although it does not identify the quantitative threshold. -/
theorem exists_stabilizesAt_of_monotone_bounded
    {I : Nat -> Finset α} {U : Finset α}
    (hmono : MonotoneInventory I)
    (hbounded : BoundedByAlphabet I U) :
    ∃ N, StabilizesAt I N := by
  classical
  let values : Finset Nat :=
    (Finset.range (U.card + 1)).filter (fun k => ∃ n, (I n).card = k)
  have hnonempty : values.Nonempty := by
    refine ⟨(I 0).card, ?_⟩
    simpa [values] using Nat.lt_succ_of_le (Finset.card_le_card (hbounded 0))
  let k := values.max' hnonempty
  have hk_mem : k ∈ values := Finset.max'_mem values hnonempty
  have hk_spec : ∃ N, (I N).card = k := by
    have h : k < U.card + 1 ∧ ∃ n, (I n).card = k := by
      simpa [values] using hk_mem
    exact h.2
  rcases hk_spec with ⟨N, hNcard⟩
  refine ⟨N, ?_⟩
  intro n hn
  have hn_mem : (I n).card ∈ values := by
    simpa [values] using Nat.lt_succ_of_le (Finset.card_le_card (hbounded n))
  have hn_le_k : (I n).card ≤ k :=
    Finset.le_max' values (I n).card hn_mem
  have hN_subset : I N ⊆ I n := hmono hn
  have hcard_le : (I n).card ≤ (I N).card := by
    rw [hNcard]
    exact hn_le_k
  exact (Finset.eq_of_subset_of_card_le hN_subset hcard_le).symm

/-- A step-persistent inventory bounded by one finite alphabet is eventually
stable. -/
theorem exists_stabilizesAt_of_stepPersistent_bounded
    {I : Nat -> Finset α} {U : Finset α}
    (hstep : StepPersistent I)
    (hbounded : BoundedByAlphabet I U) :
    ∃ N, StabilizesAt I N :=
  exists_stabilizesAt_of_monotone_bounded
    (monotoneInventory_of_stepPersistent hstep) hbounded

/-- A step-persistent inventory over a finite carrier is eventually stable. -/
theorem exists_stabilizesAt_of_stepPersistent_finite
    [Finite α] {I : Nat -> Finset α}
    (hstep : StepPersistent I) :
    ∃ N, StabilizesAt I N := by
  letI := Fintype.ofFinite α
  exact exists_stabilizesAt_of_stepPersistent_bounded hstep boundedByAlphabet_univ

/-- A step-persistent inventory of local class codes for a fixed profile is
eventually stable. -/
theorem exists_stabilizesAt_of_stepPersistent_localClassCode
    {P : JointProfile} {I : Nat -> Finset (LocalClassCode P)}
    (hstep : StepPersistent I) :
    ∃ N, StabilizesAt I N :=
  exists_stabilizesAt_of_stepPersistent_finite hstep

/-- A step-persistent inventory of profile-independent local class keys is
eventually stable. -/
theorem exists_stabilizesAt_of_stepPersistent_localJointClassCode
    {I : Nat -> Finset LocalJointClassCode}
    (hstep : StepPersistent I) :
    ∃ N, StabilizesAt I N :=
  exists_stabilizesAt_of_stepPersistent_finite hstep

/-- Mapping an inventory along an embedding preserves one-step persistence. -/
theorem stepPersistent_mapInventory
    (e : α ↪ β) {I : Nat -> Finset α}
    (hstep : StepPersistent I) :
    StepPersistent (mapInventory e I) := by
  intro n x hx
  rcases Finset.mem_map.1 hx with ⟨a, ha, rfl⟩
  exact Finset.mem_map.2 ⟨a, hstep n ha, rfl⟩

/-- Mapping an inventory along an embedding preserves stabilization at a
threshold. -/
theorem stabilizesAt_mapInventory
    (e : α ↪ β) {I : Nat -> Finset α} {N : Nat}
    (hstable : StabilizesAt I N) :
    StabilizesAt (mapInventory e I) N := by
  intro n hn
  simp [mapInventory, hstable n hn]

/-- A step-persistent inventory over a finite carrier remains eventually stable
after mapping into any semantic surface. -/
theorem exists_stabilizesAt_mapInventory_of_stepPersistent_finite
    [Finite α] (e : α ↪ β) {I : Nat -> Finset α}
    (hstep : StepPersistent I) :
    ∃ N, StabilizesAt (mapInventory e I) N := by
  rcases exists_stabilizesAt_of_stepPersistent_finite hstep with ⟨N, hN⟩
  exact ⟨N, stabilizesAt_mapInventory e hN⟩

/-- Semantic `JointClass` inventory obtained by forgetting local class codes. -/
noncomputable def localJointClassCodeSemanticInventory
    (I : Nat -> Finset LocalJointClassCode) : Nat -> Finset JointClass :=
  mapInventory LocalJointClassCode.toJointClassEmbedding I

/-- A step-persistent inventory of local class codes has an eventually stable
semantic `JointClass` projection. -/
theorem exists_stabilizesAt_localJointClassCodeSemanticInventory
    {I : Nat -> Finset LocalJointClassCode}
    (hstep : StepPersistent I) :
    ∃ N, StabilizesAt (localJointClassCodeSemanticInventory I) N :=
  exists_stabilizesAt_mapInventory_of_stepPersistent_finite
    LocalJointClassCode.toJointClassEmbedding hstep

/-- Local-to-global completion plus global-to-local soundness identifies the
two inventories above the threshold. -/
theorem equalInventoriesFrom_of_globalSubsetsLocal_of_completion
    {L G : Nat -> Finset α} {N : Nat}
    (hglobalLocal : GlobalSubsetsLocal L G)
    (hcompletion : LocalCompletesGlobalFrom L G N) :
    EqualInventoriesFrom G L N := by
  intro n hn
  exact Finset.Subset.antisymm (hglobalLocal n) (hcompletion n hn)

/-- A stable local alphabet and local-to-global completion lock the global
inventory above the same threshold. -/
theorem global_stabilizesAt_of_local_stabilizesAt_of_completion
    {L G : Nat -> Finset α} {N : Nat}
    (hlocal : StabilizesAt L N)
    (hglobalLocal : GlobalSubsetsLocal L G)
    (hcompletion : LocalCompletesGlobalFrom L G N) :
    StabilizesAt G N := by
  intro n hn
  apply Finset.Subset.antisymm
  · calc
      G n ⊆ L n := hglobalLocal n
      _ = L N := hlocal n hn
      _ ⊆ G N := hcompletion N le_rfl
  · calc
      G N ⊆ L N := hglobalLocal N
      _ = L n := (hlocal n hn).symm
      _ ⊆ G n := hcompletion n hn

/-- If LOCAL stability and LOCAL-to-GLOBAL completion start at different
thresholds, GLOBAL stability starts at their maximum. -/
theorem global_stabilizesAt_of_local_stabilizesAt_of_completionFrom
    {L G : Nat -> Finset α} {localThreshold completionThreshold : Nat}
    (hlocal : StabilizesAt L localThreshold)
    (hglobalLocal : GlobalSubsetsLocal L G)
    (hcompletion : LocalCompletesGlobalFrom L G completionThreshold) :
    StabilizesAt G (max localThreshold completionThreshold) :=
  global_stabilizesAt_of_local_stabilizesAt_of_completion
    (stabilizesAt_mono hlocal
      (Nat.le_max_left localThreshold completionThreshold))
    hglobalLocal
    (localCompletesGlobalFrom_mono hcompletion
      (Nat.le_max_right localThreshold completionThreshold))

/-- If the local alphabet is already locked at `N`, global classes are local,
and all local classes complete globally above `N`, then the global inventory is
locked at `N`.  This is the abstract formal version of the quantitative route
identified by the multi-center census. -/
theorem global_locksAt_of_local_locksAt_of_completion
    {L G : Nat -> Finset α} {N : Nat}
    (hlocal : StabilizesAt L N)
    (hglobalLocal : GlobalSubsetsLocal L G)
    (hcompletion : LocalCompletesGlobalFrom L G N) :
    StabilizesAt G N :=
  global_stabilizesAt_of_local_stabilizesAt_of_completion
    hlocal hglobalLocal hcompletion

end MultiCenter
end Problem97
