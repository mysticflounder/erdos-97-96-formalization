/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Card13BoundaryNormalization
import BooleanPacking
import FiniteDistanceRank
import Erdos9796Proof.P97.ATail.ExactFiveGlobalCrossDeletionPair
import Erdos9796Proof.P97.ATail.FirstApexShellRoleExtractor

/-!
# Source ingress for the exact-card-thirteen all-one arm

This module keeps the actual cyclic boundary labeling fixed.  In particular,
hub indices `1`, `2`, and `3` remain three distinct finite-certificate orbits.
No role-only permutation is applied to the boundary frame.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveCard13AllOneSourceIngressScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The strict points of the physical exact-five cap in the fixed boundary
frame. -/
def strictPhysicalIndices13 : Finset (Fin 13) := {1, 2, 3}

@[simp] theorem mem_strictPhysicalIndices13_iff (i : Fin 13) :
    i ∈ strictPhysicalIndices13 ↔
      i = (1 : Fin 13) ∨ i = (2 : Fin 13) ∨ i = (3 : Fin 13) := by
  simp [strictPhysicalIndices13]

/-- Direct-orientation strict Kalmanson inequalities on a card-thirteen
boundary enumeration. -/
private theorem strictKalmanson_pair_of_ccw13
    {A : Finset ℝ²} (hcard : A.card = 13) (hA : ConvexIndep A)
    (phi : Fin 13 → ℝ²) (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d : Fin 13} (hab : a < b) (hbc : b < c) (hcd : c < d) :
    (dist (phi b) (phi c) + dist (phi a) (phi d) <
        dist (phi a) (phi c) + dist (phi b) (phi d)) ∧
      (dist (phi a) (phi b) + dist (phi c) (phi d) <
        dist (phi a) (phi c) + dist (phi b) (phi d)) := by
  let toCard : Fin A.card → Fin 13 := Fin.cast hcard
  let fromCard : Fin 13 → Fin A.card := Fin.cast hcard.symm
  let phiCard : Fin A.card → ℝ² := fun i ↦ phi (toCard i)
  have hphiCard_inj : Function.Injective phiCard := by
    intro i j hij
    apply Fin.cast_injective hcard
    exact hphi_inj hij
  have hphiCard_image : Finset.univ.image phiCard = A := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
      have hxImage : phi (toCard i) ∈ Finset.univ.image phi :=
        Finset.mem_image.mpr ⟨toCard i, Finset.mem_univ _, rfl⟩
      rwa [hphi_image] at hxImage
    · intro hx
      have hxImage : x ∈ Finset.univ.image phi := by rwa [hphi_image]
      rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨fromCard i, Finset.mem_univ _, by simp [phiCard, toCard, fromCard]⟩
  have hccwCard : EuclideanGeometry.IsCcwConvexPolygon phiCard := by
    intro i j k hij hjk
    exact hccw hij hjk
  constructor
  · simpa [phiCard, toCard, fromCard] using
      (CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA hphiCard_inj hphiCard_image hccwCard
        (show fromCard a < fromCard b from hab)
        (show fromCard b < fromCard c from hbc)
        (show fromCard c < fromCard d from hcd))
  · simpa [phiCard, toCard, fromCard] using
      (CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hphiCard_inj hphiCard_image hccwCard
        (show fromCard a < fromCard b from hab)
        (show fromCard b < fromCard c from hbc)
        (show fromCard c < fromCard d from hcd))

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem mem_surplusCap_iff_middle_block_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
    (hsecond : phi 8 = S.oppositeVertexByIndex S.oppIndex2)
    (i : Fin 13) :
    phi i ∈ S.surplusCap ↔ (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13) := by
  have hcap : ∀ x : ℝ², x ∈ S.surplusCap ↔
      ∃ q : Fin 13, (4 : Fin 13) ≤ q ∧ q ≤ (8 : Fin 13) ∧ phi q = x := by
    rw [← capByIndex_surplusIdx_eq_surplusCap S]
    exact S.capByIndex_interval_of_global_indices S.surplusIdx hccw hinj himage
      (ia := (4 : Fin 13)) (ib := (8 : Fin 13)) (ic := (0 : Fin 13))
      (by decide) (Or.inl (by decide))
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hzero)
      (by simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
      (by simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
        using hsecond)
  constructor
  · intro hi
    rcases (hcap _).mp hi with ⟨q, hq4, hq8, hqi⟩
    have : q = i := hinj hqi
    simpa only [this] using And.intro hq4 hq8
  · intro hi
    exact (hcap _).mpr ⟨i, hi.1, hi.2, rfl⟩

private theorem mem_oppCap2_iff_initial_block_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
    (hsecond : phi 8 = S.oppositeVertexByIndex S.oppIndex2)
    (i : Fin 13) :
    phi i ∈ S.oppCap2 ↔ i ≤ (4 : Fin 13) := by
  have hcap : ∀ x : ℝ², x ∈ S.oppCap2 ↔
      ∃ q : Fin 13, (0 : Fin 13) ≤ q ∧ q ≤ (4 : Fin 13) ∧ phi q = x := by
    rw [← capByIndex_oppIndex2_eq_oppCap2 S]
    exact S.capByIndex_interval_of_global_indices S.oppIndex2 hccw hinj himage
      (ia := (0 : Fin 13)) (ib := (4 : Fin 13)) (ic := (8 : Fin 13))
      (by decide) (Or.inr (by decide))
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hsecond)
      (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
      (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
  constructor
  · intro hi
    rcases (hcap _).mp hi with ⟨q, _hq0, hq4, hqi⟩
    simpa only [hinj hqi] using hq4
  · intro hi
    exact (hcap _).mpr ⟨i, by omega, hi, rfl⟩

private theorem mem_oppCap1_iff_final_wrap_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
    (hsecond : phi 8 = S.oppositeVertexByIndex S.oppIndex2)
    (i : Fin 13) :
    phi i ∈ S.oppCap1 ↔ i = 0 ∨ (8 : Fin 13) ≤ i := by
  have hcap : ∀ x : ℝ², x ∈ S.oppCap1 ↔
      ∃ q : Fin 13, (q ≤ (0 : Fin 13) ∨ (8 : Fin 13) ≤ q) ∧ phi q = x := by
    rw [← capByIndex_oppIndex1_eq_oppCap1 S]
    exact S.capByIndex_reverse_complement_interval_of_global_indices
      S.oppIndex1 hccw hinj himage (ib := (0 : Fin 13))
      (ic := (4 : Fin 13)) (ia := (8 : Fin 13)) (by decide) (by decide)
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hfirst)
      (by simpa [S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2]
        using hsecond)
      (by simpa [S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
  constructor
  · intro hi
    rcases (hcap _).mp hi with ⟨q, hq, hpoint⟩
    have hqi : q = i := hinj hpoint
    subst q
    rcases hq with hi0 | hi8
    · exact Or.inl (Fin.ext (by omega))
    · exact Or.inr hi8
  · intro hi
    rcases hi with rfl | hi8
    · exact (hcap _).mpr ⟨0, Or.inl (by decide), rfl⟩
    · exact (hcap _).mpr ⟨i, Or.inr hi8, rfl⟩

private theorem mem_surplusCap_iff_middle_block_reflected
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hsecond : phi 5 = S.oppositeVertexByIndex S.oppIndex2)
    (hfirst : phi 9 = S.oppositeVertexByIndex S.oppIndex1)
    (i : Fin 13) :
    phi (reverseCyclicIndex13 i) ∈ S.surplusCap ↔
      (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13) := by
  have hcap : ∀ x : ℝ², x ∈ S.surplusCap ↔
      ∃ q : Fin 13, (5 : Fin 13) ≤ q ∧ q ≤ (9 : Fin 13) ∧ phi q = x := by
    rw [← capByIndex_surplusIdx_eq_surplusCap S]
    exact S.capByIndex_reverse_interval_of_global_indices S.surplusIdx
      hccw hinj himage (ib := (5 : Fin 13)) (ia := (9 : Fin 13))
      (ic := (0 : Fin 13)) (by decide) (Or.inl (by decide))
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hzero)
      (by simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
      (by simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
        using hsecond)
  constructor
  · intro hi
    rcases (hcap _).mp hi with ⟨q, hq5, hq9, hqPoint⟩
    have hq : q = reverseCyclicIndex13 i := hinj hqPoint
    have hiPos : (0 : Fin 13) < i := by
      by_contra hnot
      have hi0 : i = 0 := by apply Fin.ext; omega
      subst i
      have hq0 : q = 0 := by simpa [reverseCyclicIndex13] using hq
      subst q
      omega
    have hrev := reverseCyclicIndex13_val_of_pos hiPos
    rw [hq] at hq5 hq9
    change 5 ≤ (reverseCyclicIndex13 i).val at hq5
    change (reverseCyclicIndex13 i).val ≤ 9 at hq9
    rw [hrev] at hq5 hq9
    constructor <;> omega
  · intro hi
    have hiPos : (0 : Fin 13) < i := by omega
    have hrev := reverseCyclicIndex13_val_of_pos hiPos
    apply (hcap _).mpr
    refine ⟨reverseCyclicIndex13 i, ?_, ?_, rfl⟩
    · rw [Fin.le_def, hrev]
      omega
    · rw [Fin.le_def, hrev]
      omega

private theorem mem_oppCap2_iff_initial_block_reflected
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hsecond : phi 5 = S.oppositeVertexByIndex S.oppIndex2)
    (hfirst : phi 9 = S.oppositeVertexByIndex S.oppIndex1)
    (i : Fin 13) :
    phi (reverseCyclicIndex13 i) ∈ S.oppCap2 ↔ i ≤ (4 : Fin 13) := by
  have hcap : ∀ x : ℝ², x ∈ S.oppCap2 ↔
      ∃ q : Fin 13, (q ≤ (0 : Fin 13) ∨ (9 : Fin 13) ≤ q) ∧ phi q = x := by
    rw [← capByIndex_oppIndex2_eq_oppCap2 S]
    exact S.capByIndex_complement_interval_of_global_indices S.oppIndex2
      hccw hinj himage (ia := (0 : Fin 13)) (ic := (5 : Fin 13))
      (ib := (9 : Fin 13)) (by decide) (by decide)
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hsecond)
      (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
      (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
  constructor
  · intro hi
    rcases (hcap _).mp hi with ⟨q, hqSide, hqPoint⟩
    have hq : q = reverseCyclicIndex13 i := hinj hqPoint
    by_cases hi0 : i = 0
    · subst i
      decide
    · have hiPos : (0 : Fin 13) < i := by
        apply lt_of_le_of_ne (Fin.zero_le i)
        exact Ne.symm hi0
      have hrev := reverseCyclicIndex13_val_of_pos hiPos
      rw [hq] at hqSide
      rcases hqSide with hq0 | hq9
      · rw [Fin.le_def, hrev] at hq0
        omega
      · rw [Fin.le_def, hrev] at hq9
        omega
  · intro hi
    apply (hcap _).mpr
    by_cases hi0 : i = 0
    · subst i
      exact ⟨0, Or.inl (by decide), by simp [reverseCyclicIndex13]⟩
    · have hiPos : (0 : Fin 13) < i := by
        apply lt_of_le_of_ne (Fin.zero_le i)
        exact Ne.symm hi0
      have hrev := reverseCyclicIndex13_val_of_pos hiPos
      refine ⟨reverseCyclicIndex13 i, Or.inr ?_, rfl⟩
      rw [Fin.le_def, hrev]
      omega

private theorem mem_oppCap1_iff_final_wrap_reflected
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hsecond : phi 5 = S.oppositeVertexByIndex S.oppIndex2)
    (hfirst : phi 9 = S.oppositeVertexByIndex S.oppIndex1)
    (i : Fin 13) :
    phi (reverseCyclicIndex13 i) ∈ S.oppCap1 ↔
      i = 0 ∨ (8 : Fin 13) ≤ i := by
  have hcap : ∀ x : ℝ², x ∈ S.oppCap1 ↔
      ∃ q : Fin 13, (0 : Fin 13) ≤ q ∧ q ≤ (5 : Fin 13) ∧ phi q = x := by
    rw [← capByIndex_oppIndex1_eq_oppCap1 S]
    exact S.capByIndex_reverse_interval_of_global_indices S.oppIndex1
      hccw hinj himage (ib := (0 : Fin 13)) (ia := (5 : Fin 13))
      (ic := (9 : Fin 13)) (by decide) (Or.inr (by decide))
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hfirst)
      (by simpa [S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2]
        using hsecond)
      (by simpa [S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
  constructor
  · intro hi
    rcases (hcap _).mp hi with ⟨q, _hq0, hq5, hqPoint⟩
    have hq : q = reverseCyclicIndex13 i := hinj hqPoint
    by_cases hi0 : i = 0
    · exact Or.inl hi0
    · right
      have hiPos : (0 : Fin 13) < i := by
        apply lt_of_le_of_ne (Fin.zero_le i)
        exact Ne.symm hi0
      have hrev := reverseCyclicIndex13_val_of_pos hiPos
      rw [hq, Fin.le_def, hrev] at hq5
      omega
  · intro hi
    apply (hcap _).mpr
    rcases hi with hi0 | hi8
    · subst i
      exact ⟨0, by decide, by decide, by simp [reverseCyclicIndex13]⟩
    · have hiPos : (0 : Fin 13) < i := by omega
      have hrev := reverseCyclicIndex13_val_of_pos hiPos
      refine ⟨reverseCyclicIndex13 i, Fin.zero_le _, ?_, rfl⟩
      rw [Fin.le_def, hrev]
      omega
private theorem canonical_index_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
    (hsecond : phi 8 = S.oppositeVertexByIndex S.oppIndex2)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ phi i = x := by
  rcases S.capInteriorByIndex_open_interval_of_global_indices S.oppIndex2
      hccw hinj himage (ia := (0 : Fin 13)) (ib := (4 : Fin 13))
      (ic := (8 : Fin 13)) (by decide) (Or.inr (by decide))
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hsecond)
      (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
      (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
      hx with ⟨i, hi0, hi4, hpoint⟩
  refine ⟨i, ?_, hpoint⟩
  simp only [mem_strictPhysicalIndices13_iff]
  have hiCases : i.val = 1 ∨ i.val = 2 ∨ i.val = 3 := by omega
  rcases hiCases with h | h | h
  · exact Or.inl (Fin.ext h)
  · exact Or.inr (Or.inl (Fin.ext h))
  · exact Or.inr (Or.inr (Fin.ext h))

private theorem canonical_index_reflected
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hsecond : phi 5 = S.oppositeVertexByIndex S.oppIndex2)
    (hfirst : phi 9 = S.oppositeVertexByIndex S.oppIndex1)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧
      phi (reverseCyclicIndex13 i) = x := by
  rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
      S.oppIndex2 hccw hinj himage (ia := (0 : Fin 13))
      (ib := (9 : Fin 13)) (ic := (5 : Fin 13)) (by decide) (by decide)
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hsecond)
      (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
      (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
      hx with ⟨q, hqout, hqpoint⟩
  have hq9 : (9 : Fin 13) < q := by
    rcases hqout with hq0 | hq9
    · omega
    · exact hq9
  have hq0 : (0 : Fin 13) < q := by omega
  let i : Fin 13 := reverseCyclicIndex13 q
  have hiVal : i.val = 13 - q.val :=
    reverseCyclicIndex13_val_of_pos hq0
  have hi : i ∈ strictPhysicalIndices13 := by
    simp only [mem_strictPhysicalIndices13_iff]
    have hiCases : i.val = 1 ∨ i.val = 2 ∨ i.val = 3 := by
      rw [hiVal]
      omega
    rcases hiCases with h | h | h
    · exact Or.inl (Fin.ext h)
    · exact Or.inr (Or.inl (Fin.ext h))
    · exact Or.inr (Or.inr (Fin.ext h))
  refine ⟨i, hi, ?_⟩
  have hinvol : reverseCyclicIndex13 i = q := by
    simp [i, reverseCyclicIndex13]
  simpa [hinvol] using hqpoint

private theorem physicalVertices_eq_strict_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (point : Fin 13 → ℝ²) (hinj : Function.Injective point)
    (hindex : ∀ x ∈ physicalVertices profile,
      ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ point i = x) :
    physicalVertices profile = strictPhysicalIndices13.image point := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases hindex x hx with ⟨i, hi, rfl⟩
    exact Finset.mem_image.mpr ⟨i, hi, rfl⟩
  · rw [physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile,
      Finset.card_image_of_injective _ hinj]
    decide

/-- Role-independent fixed cyclic frame for all three all-one hub orbits. -/
structure CanonicalCard13Frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  point : Fin 13 → ℝ²
  point_injective : Function.Injective point
  point_image : Finset.univ.image point = D.A
  surplusOpposite_at_zero :
    point 0 = S.oppositeVertexByIndex S.surplusIdx
  firstApex_at_four :
    point 4 = S.oppositeVertexByIndex S.oppIndex1
  secondApex_at_eight :
    point 8 = S.oppositeVertexByIndex S.oppIndex2
  surplusCap_mem_iff_middle_block : ∀ i : Fin 13,
    point i ∈ S.surplusCap ↔ (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13)
  firstOppCap_mem_iff_final_wrap : ∀ i : Fin 13,
    point i ∈ S.oppCap1 ↔ i = 0 ∨ (8 : Fin 13) ≤ i
  secondOppCap_mem_iff_initial_block : ∀ i : Fin 13,
    point i ∈ S.oppCap2 ↔ i ≤ (4 : Fin 13)
  physicalVertices_eq :
    physicalVertices profile = strictPhysicalIndices13.image point
  strictKalmanson : ∀ {a b c d : Fin 13}, a < b → b < c → c < d →
    (dist (point b) (point c) + dist (point a) (point d) <
        dist (point a) (point c) + dist (point b) (point d)) ∧
      (dist (point a) (point b) + dist (point c) (point d) <
        dist (point a) (point c) + dist (point b) (point d))

namespace CanonicalCard13Frame

theorem point_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) (i : Fin 13) :
    P.point i ∈ D.A := by
  rw [← P.point_image]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

theorem point_mem_physicalVertices_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) (i : Fin 13) :
    P.point i ∈ physicalVertices profile ↔ i ∈ strictPhysicalIndices13 := by
  rw [P.physicalVertices_eq]
  constructor
  · intro hi
    rcases Finset.mem_image.mp hi with ⟨j, hj, hji⟩
    exact P.point_injective hji ▸ hj
  · intro hi
    exact Finset.mem_image.mpr ⟨i, hi, rfl⟩

end CanonicalCard13Frame

/-- Construct the boundary frame without choosing any two-hit source row. -/
theorem nonempty_canonicalCard13Frame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcard : D.A.card = 13) :
    Nonempty (CanonicalCard13Frame profile) := by
  classical
  rcases exists_card13_ccw_boundary_apexPlacement Q hcard with
    ⟨phi, hinj, himage, hccw, hplacement⟩
  rcases hplacement with ⟨hzero, hfirst, hsecond⟩ |
      ⟨hzero, hsecond, hfirst⟩
  · have hindex : ∀ x ∈ physicalVertices profile,
        ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ phi i = x := by
      intro x hx
      rw [physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile] at hx
      exact canonical_index_direct phi hinj himage hccw hzero hfirst hsecond hx
    exact ⟨{
      point := phi
      point_injective := hinj
      point_image := himage
      surplusOpposite_at_zero := hzero
      firstApex_at_four := hfirst
      secondApex_at_eight := hsecond
      surplusCap_mem_iff_middle_block :=
        mem_surplusCap_iff_middle_block_direct
          phi hinj himage hccw hzero hfirst hsecond
      firstOppCap_mem_iff_final_wrap :=
        mem_oppCap1_iff_final_wrap_direct
          phi hinj himage hccw hzero hfirst hsecond
      secondOppCap_mem_iff_initial_block :=
        mem_oppCap2_iff_initial_block_direct
          phi hinj himage hccw hzero hfirst hsecond
      physicalVertices_eq :=
        physicalVertices_eq_strict_image Q profile phi hinj hindex
      strictKalmanson := fun hab hbc hcd ↦
        strictKalmanson_pair_of_ccw13 hcard D.convex phi hinj himage hccw
          hab hbc hcd }⟩
  · let point : Fin 13 → ℝ² := fun i ↦ phi (reverseCyclicIndex13 i)
    have point_injective : Function.Injective point :=
      hinj.comp (by
        intro i j hij
        simpa [reverseCyclicIndex13] using congrArg Neg.neg hij)
    have point_image : Finset.univ.image point = D.A := by
      rw [← himage]
      ext z
      simp only [Finset.mem_image, Finset.mem_univ, true_and]
      constructor
      · rintro ⟨i, rfl⟩
        exact ⟨reverseCyclicIndex13 i, rfl⟩
      · rintro ⟨i, rfl⟩
        refine ⟨reverseCyclicIndex13 i, ?_⟩
        simp [point, reverseCyclicIndex13]
    have point_zero : point 0 = S.oppositeVertexByIndex S.surplusIdx := by
      simpa [point] using hzero
    have point_four : point 4 = S.oppositeVertexByIndex S.oppIndex1 := by
      simpa [point, reverseCyclicIndex13] using hfirst
    have point_eight : point 8 = S.oppositeVertexByIndex S.oppIndex2 := by
      simpa [point, reverseCyclicIndex13] using hsecond
    have hindex : ∀ x ∈ physicalVertices profile,
        ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ point i = x := by
      intro x hx
      rw [physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile] at hx
      simpa [point] using
        canonical_index_reflected phi hinj himage hccw hzero hsecond hfirst hx
    exact ⟨{
      point := point
      point_injective := point_injective
      point_image := point_image
      surplusOpposite_at_zero := point_zero
      firstApex_at_four := point_four
      secondApex_at_eight := point_eight
      surplusCap_mem_iff_middle_block :=
        mem_surplusCap_iff_middle_block_reflected
          phi hinj himage hccw hzero hsecond hfirst
      firstOppCap_mem_iff_final_wrap :=
        mem_oppCap1_iff_final_wrap_reflected
          phi hinj himage hccw hzero hsecond hfirst
      secondOppCap_mem_iff_initial_block :=
        mem_oppCap2_iff_initial_block_reflected
          phi hinj himage hccw hzero hsecond hfirst
      physicalVertices_eq :=
        physicalVertices_eq_strict_image Q profile point point_injective hindex
      strictKalmanson := fun hab hbc hcd ↦
        strictKalmanson_pair_reverseCyclicIndex13 hcard D.convex phi hinj himage
          hccw hab hbc hcd }⟩

/-- One ambient four-row selected from a witness surviving one of two
deletions. -/
structure DeletionCoverRow (A : Finset ℝ²)
    (center left right : ℝ²) : Type where
  row : SelectedFourClass A center
  omits_left_or_right : left ∉ row.support ∨ right ∉ row.support

private theorem exists_selectedFourClass_omitting_of_erasedK4
    {A : Finset ℝ²} {center deleted : ℝ²}
    (hK4 : HasNEquidistantPointsAt 4 (A.erase deleted) center) :
    ∃ K : SelectedFourClass A center, deleted ∉ K.support := by
  classical
  unfold HasNEquidistantPointsAt at hK4
  rcases hK4 with ⟨r, hradius, hcard⟩
  let shell : Finset ℝ² :=
    (A.erase deleted).filter fun x ↦ dist center x = r
  obtain ⟨support, hsupportSub, hsupportCard⟩ :=
    Finset.exists_subset_card_eq hcard
  have hsupportAmbient : support ⊆ A := by
    intro x hx
    exact Finset.mem_of_mem_erase
      (Finset.mem_filter.mp (hsupportSub hx)).1
  have hdeleted : deleted ∉ support := by
    intro hmem
    exact (Finset.notMem_erase deleted A)
      (Finset.mem_filter.mp (hsupportSub hmem)).1
  let K : SelectedFourClass A center := {
    support := support
    support_subset_A := hsupportAmbient
    support_card := hsupportCard
    radius := r
    radius_pos := hradius
    support_eq_radius := fun x hx ↦
      (Finset.mem_filter.mp (hsupportSub hx)).2
    center_not_mem := by
      intro hcenter
      have hdist : dist center center = r :=
        (Finset.mem_filter.mp (hsupportSub hcenter)).2
      have : (0 : ℝ) = r := by simpa using hdist
      linarith }
  exact ⟨K, hdeleted⟩

private theorem nonempty_deletionCoverRow
    {A : Finset ℝ²} {center left right : ℝ²}
    (hcover :
      HasNEquidistantPointsAt 4 (A.erase left) center ∨
        HasNEquidistantPointsAt 4 (A.erase right) center) :
    Nonempty (DeletionCoverRow A center left right) := by
  rcases hcover with hleft | hright
  · rcases exists_selectedFourClass_omitting_of_erasedK4 hleft with ⟨K, hK⟩
    exact ⟨⟨K, Or.inl hK⟩⟩
  · rcases exists_selectedFourClass_omitting_of_erasedK4 hright with ⟨K, hK⟩
    exact ⟨⟨K, Or.inr hK⟩⟩

private theorem exists_selectedFourClass_omitting_two_of_doubleErasedK4
    {A : Finset ℝ²} {center q w : ℝ²}
    (hK4 : HasNEquidistantPointsAt 4 ((A.erase q).erase w) center) :
    ∃ K : SelectedFourClass A center, q ∉ K.support ∧ w ∉ K.support := by
  classical
  unfold HasNEquidistantPointsAt at hK4
  rcases hK4 with ⟨r, hradius, hcard⟩
  let shell : Finset ℝ² :=
    ((A.erase q).erase w).filter fun x ↦ dist center x = r
  obtain ⟨support, hsupportSub, hsupportCard⟩ :=
    Finset.exists_subset_card_eq hcard
  have hsupportAmbient : support ⊆ A := by
    intro x hx
    have hxDouble := (Finset.mem_filter.mp (hsupportSub hx)).1
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxDouble)
  have hq : q ∉ support := by
    intro hmem
    have hqDouble := (Finset.mem_filter.mp (hsupportSub hmem)).1
    exact (Finset.notMem_erase q A) (Finset.mem_of_mem_erase hqDouble)
  have hw : w ∉ support := by
    intro hmem
    exact (Finset.notMem_erase w (A.erase q))
      (Finset.mem_filter.mp (hsupportSub hmem)).1
  let K : SelectedFourClass A center := {
    support := support
    support_subset_A := hsupportAmbient
    support_card := hsupportCard
    radius := r
    radius_pos := hradius
    support_eq_radius := fun x hx ↦
      (Finset.mem_filter.mp (hsupportSub hx)).2
    center_not_mem := by
      intro hcenter
      have hdist : dist center center = r :=
        (Finset.mem_filter.mp (hsupportSub hcenter)).2
      have : (0 : ℝ) = r := by simpa using hdist
      linarith }
  exact ⟨K, hq, hw⟩

private theorem selectedFourClass_support_transport
    {A : Finset ℝ²} {a b : ℝ²} (h : a = b)
    (K : SelectedFourClass A a) :
    (h ▸ K).support = K.support := by
  cases h
  rfl

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- Public orientation-free identification used by downstream packed-source
adapters. -/
theorem physicalSecondApex_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
  oppApex2_eq_oppositeVertexByIndex_oppIndex2 S

/-- Complete semantic objects consumed by the finite all-one formula.  The
two cover families remain independently chosen and keep their source star
labels. -/
structure CanonicalAllOneSemanticRowTable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (first : FirstApexShellRolePacket F R) : Type where
  main : ∀ center : Fin 13, SelectedFourClass D.A (P.point center)
  main_firstApex_support :
    (main 4).support = first.retainedRow.support
  cover₁ : ∀ center : Fin 13,
    DeletionCoverRow D.A (P.point center) star.hub.1 star.spoke₁.1
  cover₂ : ∀ center : Fin 13,
    DeletionCoverRow D.A (P.point center) star.hub.1 star.spoke₂.1
  blockerIndex : Fin 13 → Fin 13
  blocker_point : ∀ source : Fin 13,
    P.point (blockerIndex source) =
      H.centerAt (P.point source) (P.point_mem_A source)
  exactFiveShell : Finset (Fin 13)
  exactFiveShell_mem_iff : ∀ point : Fin 13,
    point ∈ exactFiveShell ↔
      P.point point ∈ SelectedClass D.A S.oppApex2 profile.radius
  exactFiveShell_card : exactFiveShell.card = 5
  frontierQIndex : Fin 13
  frontierQ_point : P.point frontierQIndex = F.pair.q
  frontierWIndex : Fin 13
  frontierW_point : P.point frontierWIndex = F.pair.w
  main_secondApex_q_not_mem :
    P.point frontierQIndex ∉ (main 8).support
  main_secondApex_w_not_mem :
    P.point frontierWIndex ∉ (main 8).support
  firstApexDoubleRow : SelectedFourClass D.A (P.point 4)
  firstApexDoubleRow_support :
    firstApexDoubleRow.support = first.doubleRow.support
  actual_one_hit : ∀ source : Fin 13,
    source ∈ strictPhysicalIndices13 →
      (physicalVertices profile ∩
        (H.selectedAt (P.point source) (P.point_mem_A source)).toCriticalFourShell.support).card = 1

namespace CanonicalAllOneSemanticRowTable

/-- The source parent constructs the complete semantic table without choosing
an asymmetric two-hit row. -/
theorem nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (first : FirstApexShellRolePacket F R) :
    Nonempty (CanonicalAllOneSemanticRowTable P star hall first) := by
  classical
  have hpointFirst : P.point 4 = S.oppApex1 :=
    P.firstApex_at_four.trans
      (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  have hpointSecond : P.point 8 = S.oppApex2 :=
    P.secondApex_at_eight.trans
      (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  let firstRowAtFour : SelectedFourClass D.A (P.point 4) :=
    hpointFirst.symm ▸ first.retainedRow
  rcases exists_selectedFourClass_omitting_two_of_doubleErasedK4
      F.secondApexDouble with ⟨secondRow, hsecondQ, hsecondW⟩
  let secondRowAtEight : SelectedFourClass D.A (P.point 8) :=
    hpointSecond.symm ▸ secondRow
  let main : ∀ i : Fin 13, SelectedFourClass D.A (P.point i) :=
    fun i ↦ if hi : i = 4 then
      hi.symm ▸ firstRowAtFour
    else if hi : i = 8 then
      hi.symm ▸ secondRowAtEight
    else Classical.choice
        (exists_selectedFourClass_of_globalK4 D.K4 (P.point_mem_A i))
  have hmain : (main 4).support = first.retainedRow.support := by
    simp only [main, dite_true]
    exact selectedFourClass_support_transport hpointFirst.symm first.retainedRow
  have hmainSecond : (main 8).support = secondRow.support := by
    simp only [main, dite_true]
    exact selectedFourClass_support_transport hpointSecond.symm secondRow
  let cover₁ : ∀ i : Fin 13,
      DeletionCoverRow D.A (P.point i) star.hub.1 star.spoke₁.1 :=
    fun i ↦ Classical.choice <|
      nonempty_deletionCoverRow (star.hub_spoke₁_cover _ (P.point_mem_A i))
  let cover₂ : ∀ i : Fin 13,
      DeletionCoverRow D.A (P.point i) star.hub.1 star.spoke₂.1 :=
    fun i ↦ Classical.choice <|
      nonempty_deletionCoverRow (star.hub_spoke₂_cover _ (P.point_mem_A i))
  have hblockerExists : ∀ source : Fin 13, ∃ target : Fin 13,
      P.point target = H.centerAt (P.point source) (P.point_mem_A source) := by
    intro source
    have hcenterA : H.centerAt (P.point source) (P.point_mem_A source) ∈ D.A :=
      (Finset.mem_erase.mp
        (H.selectedAt (P.point source) (P.point_mem_A source)).toCriticalFourShell.center_mem).2
    have hcenterImage :
        H.centerAt (P.point source) (P.point_mem_A source) ∈
          Finset.univ.image P.point := by
      simpa only [P.point_image] using hcenterA
    rcases Finset.mem_image.mp hcenterImage with ⟨target, _htarget, htarget⟩
    exact ⟨target, htarget⟩
  let blockerIndex : Fin 13 → Fin 13 :=
    fun source ↦ Classical.choose (hblockerExists source)
  have hblockerPoint : ∀ source : Fin 13,
      P.point (blockerIndex source) =
        H.centerAt (P.point source) (P.point_mem_A source) :=
    fun source ↦ Classical.choose_spec (hblockerExists source)
  let exactFiveShell : Finset (Fin 13) :=
    Finset.univ.filter fun i ↦
      P.point i ∈ SelectedClass D.A S.oppApex2 profile.radius
  have hshellMem : ∀ i : Fin 13, i ∈ exactFiveShell ↔
      P.point i ∈ SelectedClass D.A S.oppApex2 profile.radius := by
    intro i
    simp [exactFiveShell]
  have hshellImage : exactFiveShell.image P.point =
      SelectedClass D.A S.oppApex2 profile.radius := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact (hshellMem i).mp hi
    · intro hx
      have hxA : x ∈ D.A := (mem_selectedClass.mp hx).1
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr ⟨i, (hshellMem i).mpr hx, rfl⟩
  have hshellCard : exactFiveShell.card = 5 := by
    calc
      exactFiveShell.card = (exactFiveShell.image P.point).card :=
        (Finset.card_image_of_injective _ P.point_injective).symm
      _ = (SelectedClass D.A S.oppApex2 profile.radius).card := by
        rw [hshellImage]
      _ = 5 := profile.class_card_eq_five
  have hqIndexExists : ∃ i : Fin 13, P.point i = F.pair.q := by
    have hqImage : F.pair.q ∈ Finset.univ.image P.point := by
      simpa only [P.point_image] using F.pair.q_mem_A
    rcases Finset.mem_image.mp hqImage with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  have hwIndexExists : ∃ i : Fin 13, P.point i = F.pair.w := by
    have hwImage : F.pair.w ∈ Finset.univ.image P.point := by
      simpa only [P.point_image] using F.pair.w_mem_A
    rcases Finset.mem_image.mp hwImage with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let frontierQIndex : Fin 13 := Classical.choose hqIndexExists
  let frontierWIndex : Fin 13 := Classical.choose hwIndexExists
  let firstApexDoubleRow : SelectedFourClass D.A (P.point 4) :=
    hpointFirst.symm ▸ first.doubleRow
  exact ⟨{
    main := main
    main_firstApex_support := hmain
    cover₁ := cover₁
    cover₂ := cover₂
    blockerIndex := blockerIndex
    blocker_point := hblockerPoint
    exactFiveShell := exactFiveShell
    exactFiveShell_mem_iff := hshellMem
    exactFiveShell_card := hshellCard
    frontierQIndex := frontierQIndex
    frontierQ_point := Classical.choose_spec hqIndexExists
    frontierWIndex := frontierWIndex
    frontierW_point := Classical.choose_spec hwIndexExists
    main_secondApex_q_not_mem := by
      rw [hmainSecond, Classical.choose_spec hqIndexExists]
      exact hsecondQ
    main_secondApex_w_not_mem := by
      rw [hmainSecond, Classical.choose_spec hwIndexExists]
      exact hsecondW
    firstApexDoubleRow := firstApexDoubleRow
    firstApexDoubleRow_support :=
      selectedFourClass_support_transport hpointFirst.symm first.doubleRow
    actual_one_hit := by
      intro source hsource
      let q : PhysicalVertex profile :=
        ⟨P.point source, (P.point_mem_physicalVertices_iff source).2 hsource⟩
      simpa [q] using hall q }⟩

/-- Parent-only constructor, including the existing retained first-apex row
extractor. -/
theorem nonempty_from_parent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile) :
    Nonempty (Σ first : FirstApexShellRolePacket F R,
      CanonicalAllOneSemanticRowTable P star hall first) := by
  rcases nonempty_firstApexShellRolePacket F R with ⟨first⟩
  rcases nonempty P star hall first with ⟨table⟩
  exact ⟨⟨first, table⟩⟩

/-- The main row at the fixed blocker image of a source is exactly that
source's complete critical shell. -/
theorem fixed_blocker_main_support_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (source : Fin 13) :
    (T.main (T.blockerIndex source)).support =
      (H.selectedAt (P.point source) (P.point_mem_A source)).toCriticalFourShell.support := by
  let center := H.centerAt (P.point source) (P.point_mem_A source)
  have hcenter : P.point (T.blockerIndex source) = center := by
    simpa [center] using T.blocker_point source
  let Kmain : SelectedFourClass D.A center :=
    hcenter ▸ T.main (T.blockerIndex source)
  calc
    (T.main (T.blockerIndex source)).support = Kmain.support :=
      (selectedFourClass_support_transport hcenter
        (T.main (T.blockerIndex source))).symm
    _ = (H.selectedAt (P.point source)
        (P.point_mem_A source)).toCriticalFourShell.support :=
      H.selectedFourClass_support_eq_shell
        (P.point source) (P.point_mem_A source) Kmain

/-- Every source belongs to the main row at its own fixed blocker image. -/
theorem source_mem_fixed_blocker_main
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (source : Fin 13) :
    P.point source ∈ (T.main (T.blockerIndex source)).support := by
  rw [fixed_blocker_main_support_eq T source]
  exact (H.selectedAt (P.point source)
    (P.point_mem_A source)).toCriticalFourShell.q_mem_support

/-- Both independently selected deletion-cover families synchronize with the
main family at every center in the fixed blocker image. -/
theorem blocker_image_supports_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (source : Fin 13) :
    (T.cover₁ (T.blockerIndex source)).row.support =
        (T.main (T.blockerIndex source)).support ∧
      (T.cover₂ (T.blockerIndex source)).row.support =
        (T.main (T.blockerIndex source)).support := by
  let center := H.centerAt (P.point source) (P.point_mem_A source)
  have hcenter : P.point (T.blockerIndex source) = center := by
    simpa [center] using T.blocker_point source
  let Kmain : SelectedFourClass D.A center :=
    hcenter ▸ T.main (T.blockerIndex source)
  let Kcover₁ : SelectedFourClass D.A center :=
    hcenter ▸ (T.cover₁ (T.blockerIndex source)).row
  let Kcover₂ : SelectedFourClass D.A center :=
    hcenter ▸ (T.cover₂ (T.blockerIndex source)).row
  have hmain := H.selectedFourClass_support_eq_shell
    (P.point source) (P.point_mem_A source) Kmain
  have hcover₁ := H.selectedFourClass_support_eq_shell
    (P.point source) (P.point_mem_A source) Kcover₁
  have hcover₂ := H.selectedFourClass_support_eq_shell
    (P.point source) (P.point_mem_A source) Kcover₂
  constructor
  · calc
      (T.cover₁ (T.blockerIndex source)).row.support = Kcover₁.support :=
        (selectedFourClass_support_transport hcenter
          (T.cover₁ (T.blockerIndex source)).row).symm
      _ = Kmain.support := hcover₁.trans hmain.symm
      _ = (T.main (T.blockerIndex source)).support :=
        selectedFourClass_support_transport hcenter
          (T.main (T.blockerIndex source))
  · calc
      (T.cover₂ (T.blockerIndex source)).row.support = Kcover₂.support :=
        (selectedFourClass_support_transport hcenter
          (T.cover₂ (T.blockerIndex source)).row).symm
      _ = Kmain.support := hcover₂.trans hmain.symm
      _ = (T.main (T.blockerIndex source)).support :=
        selectedFourClass_support_transport hcenter
          (T.main (T.blockerIndex source))

/-- The all-one source condition is visible on the canonical main table at
the fixed blocker image, rather than only on the hidden critical-system row. -/
theorem fixed_blocker_main_one_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (source : Fin 13) (hsource : source ∈ strictPhysicalIndices13) :
    (physicalVertices profile ∩
      (T.main (T.blockerIndex source)).support).card = 1 := by
  rw [fixed_blocker_main_support_eq T source]
  exact T.actual_one_hit source hsource

/-- The finite blocker index is a genuine non-fixed carrier map and omits
both deletion-robust physical apices. -/
theorem blocker_index_constraints
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (source : Fin 13) :
    T.blockerIndex source ≠ source ∧
      T.blockerIndex source ≠ (4 : Fin 13) ∧
      T.blockerIndex source ≠ (8 : Fin 13) := by
  have hpointFirst : P.point 4 = S.oppApex1 :=
    P.firstApex_at_four.trans
      (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  have hpointSecond : P.point 8 = S.oppApex2 :=
    P.secondApex_at_eight.trans
      (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  refine ⟨?_, ?_, ?_⟩
  · intro hfixed
    have hcenterEq :
        H.centerAt (P.point source) (P.point_mem_A source) = P.point source :=
      (T.blocker_point source).symm.trans (congrArg P.point hfixed)
    exact (Finset.mem_erase.mp
      (H.selectedAt (P.point source)
        (P.point_mem_A source)).toCriticalFourShell.center_mem).1 hcenterEq
  · intro hfour
    apply B.firstApex_robust.centerAt_ne H
      (P.point source) (P.point_mem_A source)
    calc
      H.centerAt (P.point source) (P.point_mem_A source) =
          P.point (T.blockerIndex source) := (T.blocker_point source).symm
      _ = P.point 4 := congrArg P.point hfour
      _ = S.oppApex1 := hpointFirst
  · intro height
    apply B.secondApex_robust.centerAt_ne H
      (P.point source) (P.point_mem_A source)
    calc
      H.centerAt (P.point source) (P.point_mem_A source) =
          P.point (T.blockerIndex source) := (T.blocker_point source).symm
      _ = P.point 8 := congrArg P.point height
      _ = S.oppApex2 := hpointSecond

/-- Distinct physical source indices are omitted from one another's main row
at the actual blocker image, exactly as required by the all-one clauses. -/
theorem fixed_blocker_main_omits_other_physical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    {source target : Fin 13}
    (hsource : source ∈ strictPhysicalIndices13)
    (htarget : target ∈ strictPhysicalIndices13)
    (hne : source ≠ target) :
    P.point target ∉ (T.main (T.blockerIndex source)).support := by
  rw [fixed_blocker_main_support_eq T source]
  let q : PhysicalVertex profile :=
    ⟨P.point source, (P.point_mem_physicalVertices_iff source).2 hsource⟩
  let w : PhysicalVertex profile :=
    ⟨P.point target, (P.point_mem_physicalVertices_iff target).2 htarget⟩
  have hqw : q ≠ w := by
    intro h
    apply hne
    apply P.point_injective
    exact congrArg Subtype.val h
  simpa [q, w] using hall.not_mem_support_of_ne hqw

private theorem selectedFourClass_support_subset_exactFiveClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (K : SelectedFourClass D.A S.oppApex2) :
    K.support ⊆ SelectedClass D.A S.oppApex2 profile.radius := by
  have hsub : K.support ⊆ SelectedClass D.A S.oppApex2 K.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  have hfour : 4 ≤ (SelectedClass D.A S.oppApex2 K.radius).card := by
    calc
      4 = K.support.card := K.support_card.symm
      _ ≤ (SelectedClass D.A S.oppApex2 K.radius).card :=
        Finset.card_le_card hsub
  have hradius : K.radius = profile.radius :=
    profile.unique_K4_radius K.radius K.radius_pos hfour
  simpa only [hradius] using hsub

/-- All three selected row families at the second apex are subsets of the
same complete exact-five shell. -/
theorem secondApex_rows_mem_exactFiveShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (point : Fin 13) :
    (P.point point ∈ (T.main 8).support → point ∈ T.exactFiveShell) ∧
      (P.point point ∈ (T.cover₁ 8).row.support → point ∈ T.exactFiveShell) ∧
      (P.point point ∈ (T.cover₂ 8).row.support → point ∈ T.exactFiveShell) := by
  have hpointSecond : P.point 8 = S.oppApex2 :=
    P.secondApex_at_eight.trans
      (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  let Kmain : SelectedFourClass D.A S.oppApex2 := hpointSecond ▸ T.main 8
  let Kcover₁ : SelectedFourClass D.A S.oppApex2 :=
    hpointSecond ▸ (T.cover₁ 8).row
  let Kcover₂ : SelectedFourClass D.A S.oppApex2 :=
    hpointSecond ▸ (T.cover₂ 8).row
  have hmainTransport : Kmain.support = (T.main 8).support :=
    selectedFourClass_support_transport hpointSecond (T.main 8)
  have hcover₁Transport : Kcover₁.support = (T.cover₁ 8).row.support :=
    selectedFourClass_support_transport hpointSecond (T.cover₁ 8).row
  have hcover₂Transport : Kcover₂.support = (T.cover₂ 8).row.support :=
    selectedFourClass_support_transport hpointSecond (T.cover₂ 8).row
  refine ⟨?_, ?_, ?_⟩
  · intro hpoint
    apply (T.exactFiveShell_mem_iff point).2
    apply selectedFourClass_support_subset_exactFiveClass profile Kmain
    rwa [hmainTransport]
  · intro hpoint
    apply (T.exactFiveShell_mem_iff point).2
    apply selectedFourClass_support_subset_exactFiveClass profile Kcover₁
    rwa [hcover₁Transport]
  · intro hpoint
    apply (T.exactFiveShell_mem_iff point).2
    apply selectedFourClass_support_subset_exactFiveClass profile Kcover₂
    rwa [hcover₂Transport]

/-- The three fixed strict physical indices all belong to the complete
exact-five shell. -/
theorem physical_index_mem_exactFiveShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (point : Fin 13) (hpoint : point ∈ strictPhysicalIndices13) :
    point ∈ T.exactFiveShell := by
  apply (T.exactFiveShell_mem_iff point).2
  exact (Finset.mem_inter.mp
    ((P.point_mem_physicalVertices_iff point).2 hpoint)).1

/-- The two frontier indices are distinct and both lie outside the canonical
surplus-cap block. -/
theorem frontier_index_facts
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    T.frontierQIndex ≠ T.frontierWIndex ∧
      ¬ ((4 : Fin 13) ≤ T.frontierQIndex ∧ T.frontierQIndex ≤ (8 : Fin 13)) ∧
      ¬ ((4 : Fin 13) ≤ T.frontierWIndex ∧ T.frontierWIndex ≤ (8 : Fin 13)) := by
  have hqOff : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hwOff : F.pair.w ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
  refine ⟨?_, ?_, ?_⟩
  · intro h
    apply F.pair.q_ne_w
    calc
      F.pair.q = P.point T.frontierQIndex := T.frontierQ_point.symm
      _ = P.point T.frontierWIndex := congrArg P.point h
      _ = F.pair.w := T.frontierW_point
  · intro hindex
    apply hqOff
    rw [← T.frontierQ_point]
    exact (P.surplusCap_mem_iff_middle_block T.frontierQIndex).2 hindex
  · intro hindex
    apply hwOff
    rw [← T.frontierW_point]
    exact (P.surplusCap_mem_iff_middle_block T.frontierWIndex).2 hindex

/-- The retained first-apex row contains both frontier points, while both the
second-apex main row and first-apex double-deletion row omit them. -/
theorem frontier_parent_row_facts
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    P.point T.frontierQIndex ∈ (T.main 4).support ∧
      P.point T.frontierWIndex ∈ (T.main 4).support ∧
      P.point T.frontierQIndex ∉ (T.main 8).support ∧
      P.point T.frontierWIndex ∉ (T.main 8).support ∧
      P.point T.frontierQIndex ∉ T.firstApexDoubleRow.support ∧
      P.point T.frontierWIndex ∉ T.firstApexDoubleRow.support := by
  have hqMain : P.point T.frontierQIndex ∈ (T.main 4).support := by
    rw [T.main_firstApex_support, T.frontierQ_point]
    exact first.q_mem_retainedRow
  have hwMain : P.point T.frontierWIndex ∈ (T.main 4).support := by
    rw [T.main_firstApex_support, T.frontierW_point]
    exact first.w_mem_retainedRow
  have hqDouble : P.point T.frontierQIndex ∉
      T.firstApexDoubleRow.support := by
    intro hq
    have hqSource : F.pair.q ∈ first.doubleRow.support := by
      rw [← T.frontierQ_point, ← T.firstApexDoubleRow_support]
      exact hq
    have hqErase := first.doubleRow_subset_doubleErase hqSource
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqErase).2).1 rfl
  have hwDouble : P.point T.frontierWIndex ∉
      T.firstApexDoubleRow.support := by
    intro hw
    have hwSource : F.pair.w ∈ first.doubleRow.support := by
      rw [← T.frontierW_point, ← T.firstApexDoubleRow_support]
      exact hw
    have hwErase := first.doubleRow_subset_doubleErase hwSource
    exact (Finset.mem_erase.mp hwErase).1 rfl
  exact ⟨hqMain, hwMain, T.main_secondApex_q_not_mem,
    T.main_secondApex_w_not_mem, hqDouble, hwDouble⟩

end CanonicalAllOneSemanticRowTable

/-- The three boundary-order hub orbits used by the three distinct CNFs. -/
inductive CanonicalAllOneHubOrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile) : Type
  | left
      (hub_eq : P.point 1 = star.hub.1)
      (spokes_eq : ({P.point 2, P.point 3} : Finset ℝ²) =
        {star.spoke₁.1, star.spoke₂.1})
  | middle
      (hub_eq : P.point 2 = star.hub.1)
      (spokes_eq : ({P.point 1, P.point 3} : Finset ℝ²) =
        {star.spoke₁.1, star.spoke₂.1})
  | right
      (hub_eq : P.point 3 = star.hub.1)
      (spokes_eq : ({P.point 1, P.point 2} : Finset ℝ²) =
        {star.spoke₁.1, star.spoke₂.1})

private theorem spokes_eq_remaining_of_hub_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hhub : P.point 1 = star.hub.1) :
    ({P.point 2, P.point 3} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1} := by
  have hhubNeOne : star.hub.1 ≠ star.spoke₁.1 := by
    intro h
    exact star.hub_ne_spoke₁ (Subtype.ext h)
  have hhubNeTwo : star.hub.1 ≠ star.spoke₂.1 := by
    intro h
    exact star.hub_ne_spoke₂ (Subtype.ext h)
  have hphysical : physicalVertices profile =
      {P.point 1, P.point 2, P.point 3} := by
    rw [P.physicalVertices_eq]
    simp [strictPhysicalIndices13]
  have hp21 : P.point 2 ≠ P.point 1 :=
    P.point_injective.ne (by decide)
  have hp31 : P.point 3 ≠ P.point 1 :=
    P.point_injective.ne (by decide)
  calc
    ({P.point 2, P.point 3} : Finset ℝ²) =
        (physicalVertices profile).erase star.hub.1 := by
      rw [hphysical, ← hhub]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_erase]
      aesop
    _ = {star.spoke₁.1, star.spoke₂.1} := by
      rw [star.physicalVertices_eq]
      simp [hhubNeOne, hhubNeTwo]

private theorem spokes_eq_remaining_of_hub_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hhub : P.point 2 = star.hub.1) :
    ({P.point 1, P.point 3} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1} := by
  have hhubNeOne : star.hub.1 ≠ star.spoke₁.1 := by
    intro h
    exact star.hub_ne_spoke₁ (Subtype.ext h)
  have hhubNeTwo : star.hub.1 ≠ star.spoke₂.1 := by
    intro h
    exact star.hub_ne_spoke₂ (Subtype.ext h)
  have hphysical : physicalVertices profile =
      {P.point 1, P.point 2, P.point 3} := by
    rw [P.physicalVertices_eq]
    simp [strictPhysicalIndices13]
  have hp12 : P.point 1 ≠ P.point 2 :=
    P.point_injective.ne (by decide)
  have hp32 : P.point 3 ≠ P.point 2 :=
    P.point_injective.ne (by decide)
  calc
    ({P.point 1, P.point 3} : Finset ℝ²) =
        (physicalVertices profile).erase star.hub.1 := by
      rw [hphysical, ← hhub]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_erase]
      aesop
    _ = {star.spoke₁.1, star.spoke₂.1} := by
      rw [star.physicalVertices_eq]
      simp [hhubNeOne, hhubNeTwo]

private theorem spokes_eq_remaining_of_hub_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hhub : P.point 3 = star.hub.1) :
    ({P.point 1, P.point 2} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1} := by
  have hhubNeOne : star.hub.1 ≠ star.spoke₁.1 := by
    intro h
    exact star.hub_ne_spoke₁ (Subtype.ext h)
  have hhubNeTwo : star.hub.1 ≠ star.spoke₂.1 := by
    intro h
    exact star.hub_ne_spoke₂ (Subtype.ext h)
  have hphysical : physicalVertices profile =
      {P.point 1, P.point 2, P.point 3} := by
    rw [P.physicalVertices_eq]
    simp [strictPhysicalIndices13]
  have hp13 : P.point 1 ≠ P.point 3 :=
    P.point_injective.ne (by decide)
  have hp23 : P.point 2 ≠ P.point 3 :=
    P.point_injective.ne (by decide)
  calc
    ({P.point 1, P.point 2} : Finset ℝ²) =
        (physicalVertices profile).erase star.hub.1 := by
      rw [hphysical, ← hhub]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_erase]
      aesop
    _ = {star.spoke₁.1, star.spoke₂.1} := by
      rw [star.physicalVertices_eq]
      simp [hhubNeOne, hhubNeTwo]

/-- Every all-one star occupies exactly one of the three fixed boundary hub
indices.  No role permutation or left/right quotient is used. -/
theorem nonempty_canonicalAllOneHubOrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (star : PhysicalGlobalCrossDeletionStar profile) :
    Nonempty (CanonicalAllOneHubOrbit P star) := by
  have hhub : star.hub.1 ∈ physicalVertices profile := star.hub.2
  rw [P.physicalVertices_eq] at hhub
  rcases Finset.mem_image.mp hhub with ⟨i, hi, hpoint⟩
  simp only [mem_strictPhysicalIndices13_iff] at hi
  rcases hi with rfl | rfl | rfl
  · exact ⟨.left hpoint (spokes_eq_remaining_of_hub_one P star hpoint)⟩
  · exact ⟨.middle hpoint (spokes_eq_remaining_of_hub_two P star hpoint)⟩
  · exact ⟨.right hpoint (spokes_eq_remaining_of_hub_three P star hpoint)⟩

/-- The two source cover families, permuted into the two boundary edges
incident to a specified hub index.  The rows remain independently selected;
the packet records only which source family supplies each boundary edge. -/
structure CanonicalAlignedCoverFamilies
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (hub left right : Fin 13) : Type where
  leftRow : ∀ center : Fin 13, SelectedFourClass D.A (P.point center)
  rightRow : ∀ center : Fin 13, SelectedFourClass D.A (P.point center)
  left_omits : ∀ center : Fin 13,
    P.point hub ∉ (leftRow center).support ∨
      P.point left ∉ (leftRow center).support
  right_omits : ∀ center : Fin 13,
    P.point hub ∉ (rightRow center).support ∨
      P.point right ∉ (rightRow center).support
  left_is_source_cover :
    (∀ center, (leftRow center).support = (T.cover₁ center).row.support) ∨
      (∀ center, (leftRow center).support = (T.cover₂ center).row.support)
  right_is_source_cover :
    (∀ center, (rightRow center).support = (T.cover₁ center).row.support) ∨
      (∀ center, (rightRow center).support = (T.cover₂ center).row.support)

namespace CanonicalAlignedCoverFamilies

/-- A hub position and the unordered spoke pair suffice to align the two
independent source cover families with the two ordered boundary edges. -/
theorem nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (hub left right : Fin 13)
    (hleftRight : left ≠ right)
    (hhub : P.point hub = star.hub.1)
    (hspokes : ({P.point left, P.point right} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1}) :
    Nonempty (CanonicalAlignedCoverFamilies T hub left right) := by
  have hleftMem : P.point left ∈
      ({star.spoke₁.1, star.spoke₂.1} : Finset ℝ²) := by
    rw [← hspokes]
    simp
  have hrightMem : P.point right ∈
      ({star.spoke₁.1, star.spoke₂.1} : Finset ℝ²) := by
    rw [← hspokes]
    simp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hleftMem hrightMem
  rcases hleftMem with hleftOne | hleftTwo
  · have hrightTwo : P.point right = star.spoke₂.1 := by
      rcases hrightMem with hrightOne | hrightTwo
      · exfalso
        apply hleftRight
        apply P.point_injective
        exact hleftOne.trans hrightOne.symm
      · exact hrightTwo
    exact ⟨{
      leftRow := fun center ↦ (T.cover₁ center).row
      rightRow := fun center ↦ (T.cover₂ center).row
      left_omits := fun center ↦ by
        simpa only [hhub, hleftOne] using
          (T.cover₁ center).omits_left_or_right
      right_omits := fun center ↦ by
        simpa only [hhub, hrightTwo] using
          (T.cover₂ center).omits_left_or_right
      left_is_source_cover := Or.inl (fun _ ↦ rfl)
      right_is_source_cover := Or.inr (fun _ ↦ rfl) }⟩
  · have hrightOne : P.point right = star.spoke₁.1 := by
      rcases hrightMem with hrightOne | hrightTwo
      · exact hrightOne
      · exfalso
        apply hleftRight
        apply P.point_injective
        exact hleftTwo.trans hrightTwo.symm
    exact ⟨{
      leftRow := fun center ↦ (T.cover₂ center).row
      rightRow := fun center ↦ (T.cover₁ center).row
      left_omits := fun center ↦ by
        simpa only [hhub, hleftTwo] using
          (T.cover₂ center).omits_left_or_right
      right_omits := fun center ↦ by
        simpa only [hhub, hrightOne] using
          (T.cover₁ center).omits_left_or_right
      left_is_source_cover := Or.inr (fun _ ↦ rfl)
      right_is_source_cover := Or.inl (fun _ ↦ rfl) }⟩

/-- Reordering the source cover families preserves synchronization with the
main row at every fixed blocker-image center. -/
theorem blocker_supports_eq_main
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    {hub left right : Fin 13}
    (C : CanonicalAlignedCoverFamilies T hub left right)
    (source : Fin 13) :
    (C.leftRow (T.blockerIndex source)).support =
        (T.main (T.blockerIndex source)).support ∧
      (C.rightRow (T.blockerIndex source)).support =
        (T.main (T.blockerIndex source)).support := by
  have hsource := CanonicalAllOneSemanticRowTable.blocker_image_supports_eq T source
  constructor
  · rcases C.left_is_source_cover with hleft | hleft
    · exact (hleft _).trans hsource.1
    · exact (hleft _).trans hsource.2
  · rcases C.right_is_source_cover with hright | hright
    · exact (hright _).trans hsource.1
    · exact (hright _).trans hsource.2

end CanonicalAlignedCoverFamilies

/-- The three source-faithful CNF ingress cases.  Each constructor preserves
its actual boundary hub index and carries cover rows aligned to that hub's
two incident physical edges. -/
inductive CanonicalAllOneSourceOrbitIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) : Type
  | left
      (covers : CanonicalAlignedCoverFamilies T 1 2 3)
  | middle
      (covers : CanonicalAlignedCoverFamilies T 2 1 3)
  | right
      (covers : CanonicalAlignedCoverFamilies T 3 1 2)

/-- Every all-one semantic table enters exactly one of the three unquotiented
boundary hub cases used by the certificate search. -/
theorem nonempty_canonicalAllOneSourceOrbitIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    Nonempty (CanonicalAllOneSourceOrbitIngress T) := by
  rcases nonempty_canonicalAllOneHubOrbit P star with ⟨orbit⟩
  rcases orbit with ⟨hleft, hleftSpokes⟩ |
      ⟨hmiddle, hmiddleSpokes⟩ | ⟨hright, hrightSpokes⟩
  · rcases CanonicalAlignedCoverFamilies.nonempty T 1 2 3
      (by decide) hleft hleftSpokes with ⟨covers⟩
    exact ⟨.left covers⟩
  · rcases CanonicalAlignedCoverFamilies.nonempty T 2 1 3
      (by decide) hmiddle hmiddleSpokes with ⟨covers⟩
    exact ⟨.middle covers⟩
  · rcases CanonicalAlignedCoverFamilies.nonempty T 3 1 2
      (by decide) hright hrightSpokes with ⟨covers⟩
    exact ⟨.right covers⟩

namespace CanonicalAllOneSourceOrbitIngress

private def alignedSourceClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    {hub left right : Fin 13}
    (C : CanonicalAlignedCoverFamilies T hub left right)
    (family : Fin 3) (center : Fin 13) :
    SelectedFourClass D.A (P.point center) :=
  if family = 0 then T.main center
  else if family = 1 then C.leftRow center
  else C.rightRow center

/-- Interpret a family index as the corresponding source-selected row in any
of the three boundary hub cases. -/
def sourceClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center : Fin 13) :
    SelectedFourClass D.A (P.point center) := by
  cases I with
  | left C => exact alignedSourceClass C family center
  | middle C => exact alignedSourceClass C family center
  | right C => exact alignedSourceClass C family center

@[simp] theorem sourceClass_zero
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T) (center : Fin 13) :
    I.sourceClass 0 center = T.main center := by
  cases I <;> rfl

@[simp] theorem sourceClass_middle_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 2 1 3) (center : Fin 13) :
    (CanonicalAllOneSourceOrbitIngress.middle C).sourceClass 1 center =
      C.leftRow center := by
  rfl

@[simp] theorem sourceClass_middle_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 2 1 3) (center : Fin 13) :
    (CanonicalAllOneSourceOrbitIngress.middle C).sourceClass 2 center =
      C.rightRow center := by
  rfl

/-- Every source-family row centered at the physical second apex is contained
in the complete exact-five shell.  This keeps the independently selected
cover rows source-faithful: the proof uses their recorded provenance rather
than identifying either cover family with the main family. -/
theorem sourceClass_secondApex_mem_exactFiveShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (point : Fin 13)
    (hpoint : P.point point ∈ (I.sourceClass family 8).support) :
    point ∈ T.exactFiveShell := by
  cases I with
  | left C | middle C | right C =>
      fin_cases family
      · exact (T.secondApex_rows_mem_exactFiveShell point).1 hpoint
      · rcases C.left_is_source_cover with hleft | hleft
        · apply (T.secondApex_rows_mem_exactFiveShell point).2.1
          rw [← hleft 8]
          simpa only [sourceClass, alignedSourceClass] using hpoint
        · apply (T.secondApex_rows_mem_exactFiveShell point).2.2
          rw [← hleft 8]
          simpa only [sourceClass, alignedSourceClass] using hpoint
      · rcases C.right_is_source_cover with hright | hright
        · apply (T.secondApex_rows_mem_exactFiveShell point).2.1
          rw [← hright 8]
          simpa only [sourceClass, alignedSourceClass] using hpoint
        · apply (T.secondApex_rows_mem_exactFiveShell point).2.2
          rw [← hright 8]
          simpa only [sourceClass, alignedSourceClass] using hpoint

/-- Exact row-membership assignment for the three-family Boolean layout. -/
def sourceRowMember
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center point : Fin 13) : Bool :=
  decide (P.point point ∈ (I.sourceClass family center).support)

/-- Packed finite witnesses in precisely the layouts used by the Boolean and
ordinal-rank certificate front end. -/
def sourceRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T) : RowBits :=
  packThreeRowFamilies I.sourceRowMember

def sourceBlockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) : BlockerBits :=
  packThirteenBlockers fun source ↦ BitVec.ofNat 4 (T.blockerIndex source).val

def sourceShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) : ShellBits :=
  packShell fun point ↦ decide (point ∈ T.exactFiveShell)

def sourceFirstApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) : FirstRowBits :=
  packFirstApexRow fun point ↦
    decide (P.point point ∈ T.firstApexDoubleRow.support)

def sourceQ
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) : BitVec 4 :=
  BitVec.ofNat 4 T.frontierQIndex.val

def sourceW
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) : BitVec 4 :=
  BitVec.ofNat 4 T.frontierWIndex.val

def sourceRanks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) : BitVec 546 :=
  packedCardThirteenDistanceRanks P.point

@[simp] theorem rowBit_sourceRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center point : Fin 13) :
    rowBit I.sourceRows family.val center.val point.val =
      I.sourceRowMember family center point := by
  exact rowBit_packThreeRowFamilies _ _ _ _

end CanonicalAllOneSourceOrbitIngress

/-- Complete source object from the live exact-five card-thirteen all-one
branch to one of the three unquotiented finite-certificate inputs.  The
ambient `Q` parameter deliberately retains the robust parent residual needed
for the blocker-apex exclusions and the remaining parent projection facts. -/
structure CanonicalAllOneCard13SourceIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile) : Type where
  frame : CanonicalCard13Frame profile
  first : FirstApexShellRolePacket F R
  table : CanonicalAllOneSemanticRowTable frame star hall first
  orbit : CanonicalAllOneSourceOrbitIngress table

/-- The live exact-five card-thirteen all-one branch constructs the complete
role-preserving source ingress without a role reflection or row reselection. -/
theorem nonempty_canonicalAllOneCard13SourceIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (hcard : D.A.card = 13) :
    Nonempty (CanonicalAllOneCard13SourceIngress Q profile star hall) := by
  rcases nonempty_canonicalCard13Frame Q profile hcard with ⟨frame⟩
  rcases nonempty_firstApexShellRolePacket F R with ⟨first⟩
  rcases CanonicalAllOneSemanticRowTable.nonempty frame star hall first with ⟨table⟩
  rcases nonempty_canonicalAllOneSourceOrbitIngress table with ⟨orbit⟩
  exact ⟨⟨frame, first, table, orbit⟩⟩

#print axioms nonempty_canonicalCard13Frame
#print axioms CanonicalAllOneSemanticRowTable.nonempty_from_parent
#print axioms CanonicalAllOneSemanticRowTable.blocker_image_supports_eq
#print axioms CanonicalAllOneSemanticRowTable.fixed_blocker_main_one_hit
#print axioms CanonicalAllOneSemanticRowTable.blocker_index_constraints
#print axioms CanonicalAllOneSemanticRowTable.secondApex_rows_mem_exactFiveShell
#print axioms CanonicalAllOneSemanticRowTable.frontier_parent_row_facts
#print axioms nonempty_canonicalAllOneHubOrbit
#print axioms nonempty_canonicalAllOneSourceOrbitIngress
#print axioms CanonicalAllOneSourceOrbitIngress.rowBit_sourceRows
#print axioms nonempty_canonicalAllOneCard13SourceIngress

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
