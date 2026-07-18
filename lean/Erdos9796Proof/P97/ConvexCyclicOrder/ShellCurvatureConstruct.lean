/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvature
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# Constructing shell-curvature charts from convex boundaries

This module constructs a coherent open-window angle chart directly from an
injective counterclockwise convex polygon boundary. It derives the strict edge
lift order, the proper-chord brackets, and the principal chord-turn bounds
needed by `ShellCurvature.OpenFundamentalWindowAngleChart`.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ShellCurvatureConstruction

open EuclideanGeometry
open Fin.NatCast

theorem rev_add_one_eq_neg (n : Nat) (i : Fin (n + 1)) :
    i.rev + 1 = -i := by
  apply Fin.ext
  simp only [Fin.rev, Nat.reduceSubDiff, Fin.add_def, Fin.coe_ofNat_eq_mod,
    Nat.add_mod_mod, Fin.neg_def]
  rw [show n - i.val + 1 = n + 1 - i.val by omega]

/-- Walk a cyclic enumeration backwards, starting at its zeroth vertex. -/
def reverseCyclicIndex (n i : Nat) : Fin (n + 1) :=
  -(i : Fin (n + 1))

theorem reverseCyclicIndex_succ (n i : Nat) :
    reverseCyclicIndex n (i + 1) =
      finRotate (n + 1) (reverseCyclicIndex n (i + 2)) := by
  rw [finRotate_succ_apply]
  simp only [reverseCyclicIndex, Nat.cast_add, Nat.cast_one, neg_add_rev,
    Nat.cast_ofNat]
  rw [show (2 : Fin (n + 1)) = 1 + 1 by norm_num]
  abel

theorem reverseCyclicIndex_rotate_succ (n i : Nat) :
    finRotate (n + 1) (reverseCyclicIndex n (i + 1)) =
      reverseCyclicIndex n i := by
  rw [finRotate_succ_apply]
  simp [reverseCyclicIndex, Nat.cast_add, Nat.cast_one]

theorem finRotate_ne_self_of_three_le (n : Nat) (hn : 3 <= n + 1)
    (i : Fin (n + 1)) : finRotate (n + 1) i ≠ i := by
  intro h
  rw [finRotate_succ_apply] at h
  have hone : (1 : Fin (n + 1)) = 0 := by
    apply add_left_cancel (a := i)
    simpa using h
  have hval := congrArg Fin.val hone
  have hlt : 1 < n + 1 := by omega
  simp [Nat.mod_eq_of_lt hlt] at hval

/-- Periodic boundary points in the standard counterclockwise direction. -/
def reverseCyclicPoint {n : Nat} (point : Fin (n + 1) -> ℝ²)
    (i : Nat) : ℝ² :=
  point (reverseCyclicIndex n i)

/-- Shift the upstream cyclic cut by one before reversing its linear order. -/
def rotatePoint {n : Nat} (point : Fin (n + 1) -> ℝ²)
    (i : Fin (n + 1)) : ℝ² :=
  point (i + 1)

theorem rotatePoint_rev_eq_reverseCyclicPoint {n : Nat}
    (point : Fin (n + 1) -> ℝ²) (i : Fin (n + 1)) :
    rotatePoint point i.rev = reverseCyclicPoint point i.val := by
  simp only [rotatePoint, reverseCyclicPoint, reverseCyclicIndex,
    Fin.cast_val_eq_self]
  rw [rev_add_one_eq_neg]

/-- Arbitrary increasing triples in the reversed linear window have standard
counterclockwise chirality. -/
theorem reverseCyclicPoint_orderedTriple_sign_neg {n : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) {i j k : Fin (n + 1)}
    (hij : i < j) (hjk : j < k) :
    (∡ (reverseCyclicPoint point i.val) (reverseCyclicPoint point j.val)
      (reverseCyclicPoint point k.val)).sign = -1 := by
  have hrotate : IsCcwConvexPolygon (rotatePoint point) := by
    simpa [rotatePoint] using
      isCcwConvexPolygon_cyclicShift hinj hccw (1 : Fin (n + 1))
  have hstandard :=
    ShellCurvature.standardCounterclockwiseConvexPolygon_reverseLinear hrotate
  simpa [rotatePoint_rev_eq_reverseCyclicPoint] using hstandard hij hjk

/-- Every consecutive triple in the reversed cyclic walk has the standard
counterclockwise chirality, including both wraparound triples. -/
theorem reverseCyclicPoint_consecutive_sign_neg {n : Nat}
    (hn : 3 <= n + 1) {point : Fin (n + 1) -> ℝ²}
    (hccw : IsCcwConvexPolygon point) (i : Nat) :
    (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point (i + 1))
      (reverseCyclicPoint point (i + 2))).sign = -1 := by
  have hforward := hccw.sign_oangle_finRotate hn (reverseCyclicIndex n (i + 2))
  rw [← reverseCyclicIndex_succ n i,
    reverseCyclicIndex_rotate_succ n i] at hforward
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (reverseCyclicPoint point (i + 2))
    (reverseCyclicPoint point (i + 1))
    (reverseCyclicPoint point i)
  have hforward' :
      (∡ (reverseCyclicPoint point (i + 2))
        (reverseCyclicPoint point (i + 1))
        (reverseCyclicPoint point i)).sign = 1 := by
    simpa [reverseCyclicPoint] using hforward
  rw [hforward'] at hswap
  simpa [reverseCyclicPoint] using hswap.symm

theorem reverseCyclicPoint_ne_succ {n : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (i : Nat) :
    reverseCyclicPoint point i ≠ reverseCyclicPoint point (i + 1) := by
  apply hinj.ne
  intro hindex
  have hrotate := reverseCyclicIndex_rotate_succ n i
  have hfixed :
      finRotate (n + 1) (reverseCyclicIndex n (i + 1)) =
        reverseCyclicIndex n (i + 1) := by
    rw [hrotate, hindex]
  exact finRotate_ne_self_of_three_le n hn _ hfixed

/-- The positive exterior turn from one boundary edge to the next. -/
noncomputable def exteriorTurn {n : Nat} (point : Fin (n + 1) -> ℝ²)
    (i : Nat) : ℝ :=
  Real.pi +
    (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point (i + 1))
      (reverseCyclicPoint point (i + 2))).toReal

theorem exteriorTurn_pos {n : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hccw : IsCcwConvexPolygon point)
    (i : Nat) : 0 < exteriorTurn point i := by
  have hsign := reverseCyclicPoint_consecutive_sign_neg hn hccw i
  have hlow := Real.Angle.neg_pi_lt_toReal
    (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point (i + 1))
      (reverseCyclicPoint point (i + 2)))
  simp only [exteriorTurn]
  linarith

theorem exteriorTurn_lt_pi {n : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hccw : IsCcwConvexPolygon point)
    (i : Nat) : exteriorTurn point i < Real.pi := by
  have hsign := reverseCyclicPoint_consecutive_sign_neg hn hccw i
  have hneg := Real.Angle.toReal_neg_iff_sign_neg.mpr hsign
  simp only [exteriorTurn]
  linarith

/-- Coherent real lift of the cyclic boundary-edge directions. -/
noncomputable def edgeLift {n : Nat} (point : Fin (n + 1) -> ℝ²)
    (i : Nat) : ℝ :=
  (arcAngle (reverseCyclicPoint point 0)
      (reverseCyclicPoint point 1)).toReal +
    ∑ t ∈ Finset.range i, exteriorTurn point t

theorem edgeLift_succ {n : Nat} (point : Fin (n + 1) -> ℝ²)
    (i : Nat) :
    edgeLift point (i + 1) = edgeLift point i + exteriorTurn point i := by
  simp [edgeLift, Finset.sum_range_succ]
  ring

theorem edgeLift_strictMono {n : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hccw : IsCcwConvexPolygon point) :
    StrictMono (edgeLift point) := by
  apply strictMono_nat_of_lt_succ
  intro i
  rw [edgeLift_succ]
  exact lt_add_of_pos_right _ (exteriorTurn_pos hn hccw i)

theorem edgeLift_lifts_arcAngle {n : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (i : Nat) :
    ((edgeLift point i : ℝ) : Real.Angle) =
      arcAngle (reverseCyclicPoint point i)
        (reverseCyclicPoint point (i + 1)) := by
  induction i with
  | zero => simp [edgeLift]
  | succ i ih =>
      rw [edgeLift_succ, Real.Angle.coe_add, ih]
      have hfirst := reverseCyclicPoint_ne_succ hn hinj i
      have hlast := reverseCyclicPoint_ne_succ hn hinj (i + 1)
      have hturn := ShellCurvature.arcAngle_first_chord_turn hfirst hlast
      have hturnCoe :
          ((exteriorTurn point i : ℝ) : Real.Angle) =
            (∡ (reverseCyclicPoint point i)
                (reverseCyclicPoint point (i + 1))
                (reverseCyclicPoint point (i + 2))) +
              (Real.pi : Real.Angle) := by
        simp [exteriorTurn, add_comm]
      rw [hturnCoe]
      rw [sub_eq_iff_eq_add] at hturn
      exact (add_comm _ _).trans hturn.symm

theorem reverseCyclicPoint_period {n : Nat}
    (point : Fin (n + 1) -> ℝ²) :
    reverseCyclicPoint point (n + 1) = reverseCyclicPoint point 0 := by
  simp [reverseCyclicPoint, reverseCyclicIndex]

/-- Increasing natural triples in one closed window have standard chirality,
provided the repeated full-window pair is excluded. -/
theorem reverseCyclicPoint_openWindow_orderedTriple_sign_neg {n : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) {i j k : Nat}
    (hij : i < j) (hjk : j < k) (hk : k <= n + 1)
    (hnotFull : ¬ (i = 0 /\ k = n + 1)) :
    (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point j)
      (reverseCyclicPoint point k)).sign = -1 := by
  by_cases hklt : k < n + 1
  · have hi : i < n + 1 := hij.trans (hjk.trans hklt)
    have hj : j < n + 1 := hjk.trans hklt
    exact reverseCyclicPoint_orderedTriple_sign_neg hinj hccw
      (i := ⟨i, hi⟩) (j := ⟨j, hj⟩) (k := ⟨k, hklt⟩) hij hjk
  · have hkeq : k = n + 1 := by omega
    have hi0 : 0 < i := by
      by_contra h
      have hieq : i = 0 := by omega
      exact hnotFull ⟨hieq, hkeq⟩
    have hjlt : j < n + 1 := by omega
    have hilt : i < n + 1 := hij.trans hjlt
    have hlinear := reverseCyclicPoint_orderedTriple_sign_neg hinj hccw
      (i := (0 : Fin (n + 1))) (j := ⟨i, hilt⟩) (k := ⟨j, hjlt⟩)
      hi0 hij
    have hrotate :
        (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point j)
          (reverseCyclicPoint point 0)).sign = -1 := by
      rw [EuclideanGeometry.oangle_rotate_sign]
      exact hlinear
    subst k
    simpa [reverseCyclicPoint_period] using hrotate

/-- Proper window endpoints denote distinct actual boundary points. -/
theorem reverseCyclicPoint_ne_of_proper {n i j : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    reverseCyclicPoint point i ≠ reverseCyclicPoint point j := by
  rcases hproper with ⟨_hi0, hij, hj, hnotFull⟩
  apply hinj.ne
  intro hindex
  have hcast : (i : Fin (n + 1)) = (j : Fin (n + 1)) := by
    apply neg_injective
    simpa [reverseCyclicPoint, reverseCyclicIndex] using hindex
  have hi : i < n + 1 := hij.trans_le hj
  by_cases hjlt : j < n + 1
  · have hval := congrArg Fin.val hcast
    simp [Fin.val_cast_of_lt hi, Fin.val_cast_of_lt hjlt] at hval
    omega
  · have hjeq : j = n + 1 := by omega
    have hval := congrArg Fin.val hcast
    have hieq : i = 0 := by
      simp only [Fin.val_cast_of_lt hi, hjeq, Fin.natCast_self,
        Fin.coe_ofNat_eq_mod, Nat.zero_mod] at hval
      exact hval
    exact hnotFull ⟨hieq, hjeq⟩

/-- Principal counterclockwise gap from the first edge at `i` to the proper
chord `i -> j`. -/
noncomputable def chordStartGap {n : Nat}
    (point : Fin (n + 1) -> ℝ²) (i j : Nat) : ℝ :=
  (∡ (reverseCyclicPoint point (i + 1)) (reverseCyclicPoint point i)
    (reverseCyclicPoint point j)).toReal

theorem chordStartGap_nonneg {n i j : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    0 <= chordStartGap point i j := by
  rcases hproper with ⟨_hi0, hij, hj, hnotFull⟩
  by_cases hadj : j = i + 1
  · subst j
    simp [chordStartGap]
  · have hisuccj : i + 1 < j := by omega
    have hordered := reverseCyclicPoint_openWindow_orderedTriple_sign_neg
      hinj hccw (show i < i + 1 by omega) hisuccj hj hnotFull
    have hrotate :
        (∡ (reverseCyclicPoint point j) (reverseCyclicPoint point i)
          (reverseCyclicPoint point (i + 1))).sign = -1 := by
      rw [EuclideanGeometry.oangle_rotate_sign,
        EuclideanGeometry.oangle_rotate_sign]
      exact hordered
    have hswap := EuclideanGeometry.oangle_swap₁₃_sign
      (reverseCyclicPoint point j) (reverseCyclicPoint point i)
      (reverseCyclicPoint point (i + 1))
    rw [hrotate] at hswap
    have hsign :
        (∡ (reverseCyclicPoint point (i + 1))
          (reverseCyclicPoint point i)
          (reverseCyclicPoint point j)).sign = 1 := by
      simpa using hswap.symm
    exact (Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign).1.le

theorem chordStartGap_lt_pi {n i j : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    chordStartGap point i j < Real.pi := by
  rcases hproper with ⟨_hi0, hij, hj, hnotFull⟩
  by_cases hadj : j = i + 1
  · subst j
    simp [chordStartGap, Real.pi_pos]
  · have hisuccj : i + 1 < j := by omega
    have hordered := reverseCyclicPoint_openWindow_orderedTriple_sign_neg
      hinj hccw (show i < i + 1 by omega) hisuccj hj hnotFull
    have hrotate :
        (∡ (reverseCyclicPoint point j) (reverseCyclicPoint point i)
          (reverseCyclicPoint point (i + 1))).sign = -1 := by
      rw [EuclideanGeometry.oangle_rotate_sign,
        EuclideanGeometry.oangle_rotate_sign]
      exact hordered
    have hswap := EuclideanGeometry.oangle_swap₁₃_sign
      (reverseCyclicPoint point j) (reverseCyclicPoint point i)
      (reverseCyclicPoint point (i + 1))
    rw [hrotate] at hswap
    have hsign :
        (∡ (reverseCyclicPoint point (i + 1))
          (reverseCyclicPoint point i)
          (reverseCyclicPoint point j)).sign = 1 := by
      simpa using hswap.symm
    exact (Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign).2

/-- Actual real lift of every proper chord, aligned with its initial edge. -/
noncomputable def chordLift {n : Nat} (point : Fin (n + 1) -> ℝ²)
    (i j : Nat) : ℝ :=
  edgeLift point i + chordStartGap point i j

theorem chordLift_lifts_arcAngle {n i j : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    ((chordLift point i j : ℝ) : Real.Angle) =
      arcAngle (reverseCyclicPoint point i) (reverseCyclicPoint point j) := by
  have hfirst := reverseCyclicPoint_ne_succ hn hinj i
  have hlast := reverseCyclicPoint_ne_of_proper hinj hproper
  have hsub := arcAngle_sub_arcAngle
    (reverseCyclicPoint point i) (reverseCyclicPoint point j)
    (reverseCyclicPoint point (i + 1)) hlast.symm hfirst.symm
  have hsub' :
      arcAngle (reverseCyclicPoint point i) (reverseCyclicPoint point j) -
          arcAngle (reverseCyclicPoint point i)
            (reverseCyclicPoint point (i + 1)) =
        (∡ (reverseCyclicPoint point (i + 1))
          (reverseCyclicPoint point i)
          (reverseCyclicPoint point j)) := by
    simpa using hsub
  rw [chordLift, Real.Angle.coe_add, edgeLift_lifts_arcAngle hn hinj,
    chordStartGap, Real.Angle.coe_toReal]
  rw [sub_eq_iff_eq_add] at hsub'
  exact (add_comm _ _).trans hsub'.symm

theorem edgeLift_le_chordLift {n i j : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    edgeLift point i <= chordLift point i j := by
  rw [chordLift]
  exact le_add_of_nonneg_right (chordStartGap_nonneg hinj hccw hproper)

/-- Consecutive chords from one vertex rotate by a principal positive angle. -/
theorem chordLift_step_sub_mem_Ioo {n i j : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j)
    (hproperSucc : ShellCurvature.IsProperFundamentalWindowChord
      0 (n + 1) i (j + 1)) :
    chordLift point i (j + 1) - chordLift point i j ∈
      Set.Ioo 0 Real.pi := by
  have hgap0 := chordStartGap_nonneg hinj hccw hproper
  have hgapPi := chordStartGap_lt_pi hinj hccw hproper
  have hgapSucc0 := chordStartGap_nonneg hinj hccw hproperSucc
  have hgapSuccPi := chordStartGap_lt_pi hinj hccw hproperSucc
  let d := chordLift point i (j + 1) - chordLift point i j
  have hdLower : -Real.pi < d := by
    dsimp [d, chordLift]
    linarith
  have hdUpper : d <= Real.pi := by
    dsimp [d, chordLift]
    linarith
  have hiNeJ := reverseCyclicPoint_ne_of_proper hinj hproper
  have hiNeSucc := reverseCyclicPoint_ne_of_proper hinj hproperSucc
  have hsub := arcAngle_sub_arcAngle
    (reverseCyclicPoint point i) (reverseCyclicPoint point (j + 1))
    (reverseCyclicPoint point j) hiNeSucc.symm hiNeJ.symm
  have hcoe : ((d : ℝ) : Real.Angle) =
      (∡ (reverseCyclicPoint point j) (reverseCyclicPoint point i)
        (reverseCyclicPoint point (j + 1))) := by
    dsimp [d]
    rw [chordLift_lifts_arcAngle hn hinj hproperSucc,
      chordLift_lifts_arcAngle hn hinj hproper]
    simpa using hsub
  rcases hproperSucc with ⟨_hi0, hijSucc, hjSucc, hnotFull⟩
  have hij : i < j := by
    rcases hproper with ⟨_, hij, _, _⟩
    exact hij
  have hordered := reverseCyclicPoint_openWindow_orderedTriple_sign_neg
    hinj hccw hij (show j < j + 1 by omega) hjSucc hnotFull
  have hrotate :
      (∡ (reverseCyclicPoint point (j + 1))
        (reverseCyclicPoint point i)
        (reverseCyclicPoint point j)).sign = -1 := by
    rw [EuclideanGeometry.oangle_rotate_sign,
      EuclideanGeometry.oangle_rotate_sign]
    exact hordered
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (reverseCyclicPoint point (j + 1)) (reverseCyclicPoint point i)
    (reverseCyclicPoint point j)
  rw [hrotate] at hswap
  have hsign :
      (∡ (reverseCyclicPoint point j) (reverseCyclicPoint point i)
        (reverseCyclicPoint point (j + 1))).sign = 1 := by
    simpa using hswap.symm
  have htoReal : ((d : ℝ) : Real.Angle).toReal = d :=
    Real.Angle.toReal_coe_eq_self_iff.mpr ⟨hdLower, hdUpper⟩
  have hrange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
  rw [← hcoe, htoReal] at hrange
  exact hrange

/-- Difference of global directions for two segments with a common terminal
point, expressed as the oriented angle at that terminal point. -/
theorem arcAngle_terminal_sub_arcAngle {a b c : ℝ²}
    (ha : a ≠ c) (hb : b ≠ c) :
    arcAngle b c - arcAngle a c = ∡ a c b := by
  unfold arcAngle
  have he : (EuclideanSpace.basisFun (Fin 2) ℝ) 0 ≠ (0 : ℝ²) :=
    (EuclideanSpace.basisFun (Fin 2) ℝ).orthonormal.ne_zero 0
  have hac : c - a ≠ 0 := sub_ne_zero.mpr ha.symm
  have hbc : c - b ≠ 0 := sub_ne_zero.mpr hb.symm
  rw [stdOrientation.oangle_sub_left he hac hbc]
  rw [show c - a = -(a - c) by module,
    show c - b = -(b - c) by module,
    stdOrientation.oangle_neg_neg]
  rfl

/-- The endpoint deficit of a chord is a principal positive angle. -/
theorem chordEndpointAngle_sign_pos {n i j : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) (hij : i < j)
    (hj : j + 1 <= n + 1)
    (hnotFull : ¬ (i = 0 /\ j + 1 = n + 1)) :
    (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point (j + 1))
      (reverseCyclicPoint point j)).sign = 1 := by
  have hordered := reverseCyclicPoint_openWindow_orderedTriple_sign_neg
    hinj hccw hij (show j < j + 1 by omega) hj hnotFull
  have hrotate :
      (∡ (reverseCyclicPoint point j) (reverseCyclicPoint point (j + 1))
        (reverseCyclicPoint point i)).sign = -1 := by
    rw [EuclideanGeometry.oangle_rotate_sign]
    exact hordered
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (reverseCyclicPoint point j) (reverseCyclicPoint point (j + 1))
    (reverseCyclicPoint point i)
  rw [hrotate] at hswap
  simpa using hswap.symm

/-- One induction step for the proper-chord upper bracket. -/
theorem chordEndDeficit_succ_mem_Ico {n i j : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j)
    (hproperSucc : ShellCurvature.IsProperFundamentalWindowChord
      0 (n + 1) i (j + 1))
    (hprev : edgeLift point (j - 1) - chordLift point i j ∈
      Set.Ico 0 Real.pi) :
    edgeLift point j - chordLift point i (j + 1) ∈
      Set.Ico 0 Real.pi := by
  rcases hproper with ⟨_hi0, hij, _hj, _hnotFull⟩
  rcases hproperSucc with ⟨_hi0Succ, _hijSucc, hjSucc, hnotFullSucc⟩
  have hjpos : 0 < j := hij.trans_le' (Nat.zero_le i)
  have hjPred : j - 1 + 1 = j := by omega
  have hedgeStep := edgeLift_succ point (j - 1)
  rw [hjPred] at hedgeStep
  have hdelta0 := exteriorTurn_pos hn hccw (j - 1)
  have hdeltaPi := exteriorTurn_lt_pi hn hccw (j - 1)
  have hinc := chordLift_step_sub_mem_Ioo hn hinj hccw
    ⟨_hi0, hij, _hj, _hnotFull⟩
    ⟨_hi0Succ, _hijSucc, hjSucc, hnotFullSucc⟩
  let d := edgeLift point j - chordLift point i (j + 1)
  have hdFormula :
      d = exteriorTurn point (j - 1) +
          (edgeLift point (j - 1) - chordLift point i j) -
          (chordLift point i (j + 1) - chordLift point i j) := by
    dsimp [d]
    rw [hedgeStep]
    ring
  have hdLower : -Real.pi < d := by
    rw [hdFormula]
    linarith [hprev.1, hinc.2]
  have hdUpper : d < 2 * Real.pi := by
    rw [hdFormula]
    linarith [hdeltaPi, hprev.2, hinc.1]
  have hiEnd := reverseCyclicPoint_ne_of_proper hinj
    ⟨_hi0Succ, _hijSucc, hjSucc, hnotFullSucc⟩
  have hjEnd := reverseCyclicPoint_ne_succ hn hinj j
  have hcoe : ((d : ℝ) : Real.Angle) =
      ∡ (reverseCyclicPoint point i) (reverseCyclicPoint point (j + 1))
        (reverseCyclicPoint point j) := by
    dsimp [d]
    rw [edgeLift_lifts_arcAngle hn hinj,
      chordLift_lifts_arcAngle hn hinj
        ⟨_hi0Succ, _hijSucc, hjSucc, hnotFullSucc⟩]
    exact arcAngle_terminal_sub_arcAngle hiEnd hjEnd
  have hsign := chordEndpointAngle_sign_pos hinj hccw hij hjSucc hnotFullSucc
  by_cases hdPi : d <= Real.pi
  · have htoReal : ((d : ℝ) : Real.Angle).toReal = d :=
      Real.Angle.toReal_coe_eq_self_iff.mpr ⟨hdLower, hdPi⟩
    have hrange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
    rw [← hcoe, htoReal] at hrange
    exact ⟨hrange.1.le, hrange.2⟩
  · have hdPi' : Real.pi < d := lt_of_not_ge hdPi
    have hthree : d <= 3 * Real.pi := by
      nlinarith [Real.pi_pos]
    have htoReal : ((d : ℝ) : Real.Angle).toReal = d - 2 * Real.pi :=
      Real.Angle.toReal_coe_eq_self_sub_two_pi_iff.mpr ⟨hdPi', hthree⟩
    have hrange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
    rw [← hcoe, htoReal] at hrange
    rcases hrange with ⟨hrange0, _hrangePi⟩
    linarith

/-- Every proper chord is bracketed above by its terminal boundary edge. -/
theorem chordEndDeficit_mem_Ico {n i j : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    edgeLift point (j - 1) - chordLift point i j ∈ Set.Ico 0 Real.pi := by
  revert i
  induction j using Nat.strong_induction_on with
  | h j ih =>
      intro i hproper
      rcases hproper with ⟨hi0, hij, hj, hnotFull⟩
      by_cases hadj : j = i + 1
      · subst j
        simp [chordLift, chordStartGap, Real.pi_pos]
      · have hiPred : i < j - 1 := by omega
        have hpredLe : j - 1 <= n + 1 := by omega
        have hpredNotFull : ¬ (i = 0 /\ j - 1 = n + 1) := by omega
        have hproperPred :
            ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i (j - 1) :=
          ⟨hi0, hiPred, hpredLe, hpredNotFull⟩
        have hrec := ih (j - 1) (by omega) hproperPred
        have hsuccEq : j - 1 + 1 = j := by omega
        have hproperSucc :
            ShellCurvature.IsProperFundamentalWindowChord
              0 (n + 1) i (j - 1 + 1) := by
          rw [hsuccEq]
          exact ⟨hi0, hij, hj, hnotFull⟩
        have hstep := chordEndDeficit_succ_mem_Ico hn hinj hccw
          hproperPred hproperSucc hrec
        simpa [hsuccEq] using hstep

theorem chordLift_le_terminalEdge {n i j : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    chordLift point i j <= edgeLift point (j - 1) := by
  have hdeficit := chordEndDeficit_mem_Ico hn hinj hccw hproper
  linarith [hdeficit.1]

/-- The two standard chord-direction bounds, now derived automatically from
the actual convex boundary. -/
theorem chordLift_bounds {n i j : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point)
    (hproper : ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j) :
    edgeLift point i <= chordLift point i j /\
      chordLift point i j <= edgeLift point (j - 1) := by
  exact ⟨edgeLift_le_chordLift hinj hccw hproper,
    chordLift_le_terminalEdge hn hinj hccw hproper⟩

theorem real_mem_Ioo_of_coe_sign_pos {d : ℝ}
    (hlow : -Real.pi < d) (hhigh : d <= Real.pi)
    (hsign : ((d : ℝ) : Real.Angle).sign = 1) :
    d ∈ Set.Ioo 0 Real.pi := by
  have htoReal : ((d : ℝ) : Real.Angle).toReal = d :=
    Real.Angle.toReal_coe_eq_self_iff.mpr ⟨hlow, hhigh⟩
  have hrange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
  rwa [htoReal] at hrange

theorem openWindow_apex_sign_pos {n i j k : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) (hij : i < j) (hjk : j < k)
    (hk : k <= n + 1) (hnotFull : ¬ (i = 0 /\ k = n + 1)) :
    (∡ (reverseCyclicPoint point j) (reverseCyclicPoint point i)
      (reverseCyclicPoint point k)).sign = 1 := by
  have hordered := reverseCyclicPoint_openWindow_orderedTriple_sign_neg
    hinj hccw hij hjk hk hnotFull
  have hrotate :
      (∡ (reverseCyclicPoint point k) (reverseCyclicPoint point i)
        (reverseCyclicPoint point j)).sign = -1 := by
    rw [EuclideanGeometry.oangle_rotate_sign,
      EuclideanGeometry.oangle_rotate_sign]
    exact hordered
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (reverseCyclicPoint point k) (reverseCyclicPoint point i)
    (reverseCyclicPoint point j)
  rw [hrotate] at hswap
  simpa using hswap.symm

theorem openWindow_terminal_sign_pos {n i j k : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) (hij : i < j) (hjk : j < k)
    (hk : k <= n + 1) (hnotFull : ¬ (i = 0 /\ k = n + 1)) :
    (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point k)
      (reverseCyclicPoint point j)).sign = 1 := by
  have hordered := reverseCyclicPoint_openWindow_orderedTriple_sign_neg
    hinj hccw hij hjk hk hnotFull
  have hrotate :
      (∡ (reverseCyclicPoint point j) (reverseCyclicPoint point k)
        (reverseCyclicPoint point i)).sign = -1 := by
    rw [EuclideanGeometry.oangle_rotate_sign]
    exact hordered
  have hswap := EuclideanGeometry.oangle_swap₁₃_sign
    (reverseCyclicPoint point j) (reverseCyclicPoint point k)
    (reverseCyclicPoint point i)
  rw [hrotate] at hswap
  simpa using hswap.symm

/-- Chords with a common initial point rotate by a principal positive angle. -/
theorem chordLift_sameStart_sub_mem_Ioo {n i j k : Nat}
    (hn : 3 <= n + 1) {point : Fin (n + 1) -> ℝ²}
    (hinj : Function.Injective point) (hccw : IsCcwConvexPolygon point)
    (hij : i < j) (hjk : j < k) (hk : k <= n + 1)
    (hnotFull : ¬ (i = 0 /\ k = n + 1)) :
    chordLift point i k - chordLift point i j ∈ Set.Ioo 0 Real.pi := by
  have hjlt : j < n + 1 := hjk.trans_le hk
  have hproperIJ :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j :=
    ⟨Nat.zero_le i, hij, hjlt.le, by omega⟩
  have hproperIK :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i k :=
    ⟨Nat.zero_le i, hij.trans hjk, hk, hnotFull⟩
  have hgapJ0 := chordStartGap_nonneg hinj hccw hproperIJ
  have hgapJPi := chordStartGap_lt_pi hinj hccw hproperIJ
  have hgapK0 := chordStartGap_nonneg hinj hccw hproperIK
  have hgapKPi := chordStartGap_lt_pi hinj hccw hproperIK
  let d := chordLift point i k - chordLift point i j
  have hdLower : -Real.pi < d := by
    dsimp [d, chordLift]
    linarith
  have hdUpper : d <= Real.pi := by
    dsimp [d, chordLift]
    linarith
  have hiJ := reverseCyclicPoint_ne_of_proper hinj hproperIJ
  have hiK := reverseCyclicPoint_ne_of_proper hinj hproperIK
  have hsub := arcAngle_sub_arcAngle
    (reverseCyclicPoint point i) (reverseCyclicPoint point k)
    (reverseCyclicPoint point j) hiK.symm hiJ.symm
  have hcoe : ((d : ℝ) : Real.Angle) =
      ∡ (reverseCyclicPoint point j) (reverseCyclicPoint point i)
        (reverseCyclicPoint point k) := by
    dsimp [d]
    rw [chordLift_lifts_arcAngle hn hinj hproperIK,
      chordLift_lifts_arcAngle hn hinj hproperIJ]
    simpa using hsub
  have hsign := openWindow_apex_sign_pos hinj hccw hij hjk hk hnotFull
  apply real_mem_Ioo_of_coe_sign_pos hdLower hdUpper
  rwa [hcoe]

/-- Chords with a common terminal point rotate by a principal positive angle. -/
theorem chordLift_sameTerminal_sub_mem_Ioo {n i j k : Nat}
    (hn : 3 <= n + 1) {point : Fin (n + 1) -> ℝ²}
    (hinj : Function.Injective point) (hccw : IsCcwConvexPolygon point)
    (hij : i < j) (hjk : j < k) (hk : k <= n + 1)
    (hnotFull : ¬ (i = 0 /\ k = n + 1)) :
    chordLift point j k - chordLift point i k ∈ Set.Ioo 0 Real.pi := by
  have hproperIK :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i k :=
    ⟨Nat.zero_le i, hij.trans hjk, hk, hnotFull⟩
  have hproperJK :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) j k :=
    ⟨Nat.zero_le j, hjk, hk, by omega⟩
  have hdefI := chordEndDeficit_mem_Ico hn hinj hccw hproperIK
  have hdefJ := chordEndDeficit_mem_Ico hn hinj hccw hproperJK
  let d := chordLift point j k - chordLift point i k
  have hdLower : -Real.pi < d := by
    dsimp [d]
    linarith [hdefI.1, hdefJ.2]
  have hdUpper : d <= Real.pi := by
    dsimp [d]
    linarith [hdefI.2, hdefJ.1]
  have hiK := reverseCyclicPoint_ne_of_proper hinj hproperIK
  have hjK := reverseCyclicPoint_ne_of_proper hinj hproperJK
  have hcoe : ((d : ℝ) : Real.Angle) =
      ∡ (reverseCyclicPoint point i) (reverseCyclicPoint point k)
        (reverseCyclicPoint point j) := by
    dsimp [d]
    rw [chordLift_lifts_arcAngle hn hinj hproperJK,
      chordLift_lifts_arcAngle hn hinj hproperIK]
    exact arcAngle_terminal_sub_arcAngle hiK hjK
  have hsign := openWindow_terminal_sign_pos hinj hccw hij hjk hk hnotFull
  apply real_mem_Ioo_of_coe_sign_pos hdLower hdUpper
  rwa [hcoe]

theorem real_lt_pi_of_pos_of_lt_two_pi_of_coe_sign_pos {d : ℝ}
    (hd0 : 0 < d) (hdTwoPi : d < 2 * Real.pi)
    (hsign : ((d : ℝ) : Real.Angle).sign = 1) : d < Real.pi := by
  by_cases hdPi : d <= Real.pi
  · have htoReal : ((d : ℝ) : Real.Angle).toReal = d :=
      Real.Angle.toReal_coe_eq_self_iff.mpr ⟨by linarith [Real.pi_pos], hdPi⟩
    have hrange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
    rw [htoReal] at hrange
    exact hrange.2
  · have hdPi' : Real.pi < d := lt_of_not_ge hdPi
    have hthree : d <= 3 * Real.pi := by nlinarith [Real.pi_pos]
    have htoReal : ((d : ℝ) : Real.Angle).toReal = d - 2 * Real.pi :=
      Real.Angle.toReal_coe_eq_self_sub_two_pi_iff.mpr ⟨hdPi', hthree⟩
    have hrange := Real.Angle.toReal_mem_Ioo_iff_sign_pos.mpr hsign
    rw [htoReal] at hrange
    rcases hrange with ⟨hrange0, _hrangePi⟩
    linarith

/-- The principal turn between two consecutive chords when their outer chord
is proper. -/
theorem chordLift_turn_lt_pi_of_not_full {n i j k : Nat}
    (hn : 3 <= n + 1) {point : Fin (n + 1) -> ℝ²}
    (hinj : Function.Injective point) (hccw : IsCcwConvexPolygon point)
    (hij : i < j) (hjk : j < k) (hk : k <= n + 1)
    (hnotFull : ¬ (i = 0 /\ k = n + 1)) :
    chordLift point j k - chordLift point i j < Real.pi := by
  have hstart := chordLift_sameStart_sub_mem_Ioo hn hinj hccw
    hij hjk hk hnotFull
  have hterminal := chordLift_sameTerminal_sub_mem_Ioo hn hinj hccw
    hij hjk hk hnotFull
  let d := chordLift point j k - chordLift point i j
  have hdFormula :
      d = (chordLift point j k - chordLift point i k) +
        (chordLift point i k - chordLift point i j) := by
    dsimp [d]
    ring
  have hd0 : 0 < d := by
    rw [hdFormula]
    linarith [hstart.1, hterminal.1]
  have hdTwoPi : d < 2 * Real.pi := by
    rw [hdFormula]
    linarith [hstart.2, hterminal.2]
  have hjlt : j < n + 1 := hjk.trans_le hk
  have hproperIJ :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) i j :=
    ⟨Nat.zero_le i, hij, hjlt.le, by omega⟩
  have hproperJK :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) j k :=
    ⟨Nat.zero_le j, hjk, hk, by omega⟩
  have hiJ := reverseCyclicPoint_ne_of_proper hinj hproperIJ
  have hjK := reverseCyclicPoint_ne_of_proper hinj hproperJK
  have hturn := ShellCurvature.arcAngle_first_chord_turn hiJ hjK
  have hcoe : ((d : ℝ) : Real.Angle) =
      (∡ (reverseCyclicPoint point i) (reverseCyclicPoint point j)
        (reverseCyclicPoint point k)) + (Real.pi : Real.Angle) := by
    dsimp [d]
    rw [chordLift_lifts_arcAngle hn hinj hproperJK,
      chordLift_lifts_arcAngle hn hinj hproperIJ]
    exact hturn
  have htheta := reverseCyclicPoint_openWindow_orderedTriple_sign_neg
    hinj hccw hij hjk hk hnotFull
  have hsign : ((d : ℝ) : Real.Angle).sign = 1 := by
    rw [hcoe, Real.Angle.sign_add_pi, htheta]
    decide
  exact real_lt_pi_of_pos_of_lt_two_pi_of_coe_sign_pos hd0 hdTwoPi hsign

/-- In the full-window outer case, the two chords are opposite directions and
their selected real turn is exactly `pi`. -/
theorem chordLift_turn_eq_pi_of_full {n j : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) (hj0 : 0 < j) (hjN : j < n + 1) :
    chordLift point j (n + 1) - chordLift point 0 j = Real.pi := by
  have hproperFirst :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) 0 j :=
    ⟨Nat.zero_le 0, hj0, hjN.le, by omega⟩
  have hproperLast :
      ShellCurvature.IsProperFundamentalWindowChord 0 (n + 1) j (n + 1) :=
    ⟨Nat.zero_le j, hjN, le_rfl, by omega⟩
  have hgapPi := chordStartGap_lt_pi hinj hccw hproperLast
  have hdeficit := chordEndDeficit_mem_Ico hn hinj hccw hproperFirst
  have hdeltaPi := exteriorTurn_lt_pi hn hccw (j - 1)
  have hjPred : j - 1 + 1 = j := by omega
  have hedgeStep := edgeLift_succ point (j - 1)
  rw [hjPred] at hedgeStep
  let d := chordLift point j (n + 1) - chordLift point 0 j
  have hfirstBounds := chordLift_bounds hn hinj hccw hproperFirst
  have hlastBounds := chordLift_bounds hn hinj hccw hproperLast
  have hedgeLt : edgeLift point (j - 1) < edgeLift point j :=
    edgeLift_strictMono hn hccw (by omega)
  have hd0 : 0 < d := by
    dsimp [d]
    linarith [hfirstBounds.2, hlastBounds.1, hedgeLt]
  have hdFormula :
      d = chordStartGap point j (n + 1) + exteriorTurn point (j - 1) +
        (edgeLift point (j - 1) - chordLift point 0 j) := by
    dsimp [d, chordLift]
    rw [hedgeStep]
    ring
  have hdThreePi : d < 3 * Real.pi := by
    rw [hdFormula]
    linarith [hgapPi, hdeltaPi, hdeficit.2]
  have hfirst := reverseCyclicPoint_ne_of_proper hinj hproperFirst
  have hlast := reverseCyclicPoint_ne_of_proper hinj hproperLast
  have hturn := ShellCurvature.arcAngle_first_chord_turn hfirst hlast
  have hcoe : ((d : ℝ) : Real.Angle) = (Real.pi : Real.Angle) := by
    dsimp [d]
    rw [chordLift_lifts_arcAngle hn hinj hproperLast,
      chordLift_lifts_arcAngle hn hinj hproperFirst]
    simpa [reverseCyclicPoint_period] using hturn
  by_cases hdPi : d <= Real.pi
  · have htoReal : ((d : ℝ) : Real.Angle).toReal = d := by
      apply Real.Angle.toReal_coe_eq_self_iff.mpr
      constructor
      · linarith [Real.pi_pos]
      · exact hdPi
    rw [hcoe, Real.Angle.toReal_pi] at htoReal
    exact htoReal.symm
  · have hdPi' : Real.pi < d := lt_of_not_ge hdPi
    have htoReal : ((d : ℝ) : Real.Angle).toReal = d - 2 * Real.pi :=
      Real.Angle.toReal_coe_eq_self_sub_two_pi_iff.mpr
        ⟨hdPi', hdThreePi.le⟩
    rw [hcoe, Real.Angle.toReal_pi] at htoReal
    linarith

/-- The final global direction-order obligation: every consecutive chord turn
in the closed finite window is at most `pi`. -/
theorem chordLift_turn_le_pi {n i j k : Nat} (hn : 3 <= n + 1)
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hccw : IsCcwConvexPolygon point) (hij : i < j) (hjk : j < k)
    (hk : k <= n + 1) :
    chordLift point j k - chordLift point i j <= Real.pi := by
  by_cases hfull : i = 0 /\ k = n + 1
  · rcases hfull with ⟨rfl, rfl⟩
    exact (chordLift_turn_eq_pi_of_full hn hinj hccw hij
      (hjk.trans_le le_rfl)).le
  · exact (chordLift_turn_lt_pi_of_not_full hn hinj hccw
      hij hjk hk hfull).le

theorem reverseCyclicPoint_injective_before_period {n i j : Nat}
    {point : Fin (n + 1) -> ℝ²} (hinj : Function.Injective point)
    (hi : i < n + 1) (hj : j < n + 1)
    (hpoint : reverseCyclicPoint point i = reverseCyclicPoint point j) :
    i = j := by
  have hindex : reverseCyclicIndex n i = reverseCyclicIndex n j := hinj hpoint
  have hcast : (i : Fin (n + 1)) = (j : Fin (n + 1)) := by
    exact neg_injective hindex
  have hval := congrArg Fin.val hcast
  simpa [Fin.val_cast_of_lt hi, Fin.val_cast_of_lt hj] using hval

/-- Automatic production chart from an actual injective finite convex boundary.

No direction-order field is assumed: edge monotonicity, both proper-chord
bounds, and every principal chord-turn bound are derived above. -/
noncomputable def openFundamentalWindowAngleChartOfCcwBoundary {n : Nat}
    (hn : 3 <= n + 1) (point : Fin (n + 1) -> ℝ²)
    (hinj : Function.Injective point) (hccw : IsCcwConvexPolygon point) :
    ShellCurvature.OpenFundamentalWindowAngleChart where
  windowStart := 0
  windowEnd := n + 1
  windowStart_lt_windowEnd := by omega
  point := reverseCyclicPoint point
  edgeArg := edgeLift point
  chordArg := chordLift point
  point_period := reverseCyclicPoint_period point
  point_injective_before_end := by
    intro i j _hi0 hi _hj0 hj hpoint
    exact reverseCyclicPoint_injective_before_period hinj hi hj hpoint
  edgeArg_lifts := by
    intro i _hi0 _hi
    exact edgeLift_lifts_arcAngle hn hinj i
  chordArg_lifts := by
    intro i j hproper
    exact chordLift_lifts_arcAngle hn hinj hproper
  edgeArg_strictMono := by
    intro i j _hi0 hij _hj
    exact edgeLift_strictMono hn hccw hij
  orderedTriple_sign_neg := by
    intro i j k _hi0 hij hjk hk
    exact reverseCyclicPoint_orderedTriple_sign_neg hinj hccw
      (i := ⟨i, by omega⟩) (j := ⟨j, by omega⟩) (k := ⟨k, hk⟩) hij hjk
  chordArg_bounds := by
    intro i j hproper
    exact chordLift_bounds hn hinj hccw hproper
  chordTurn_le_pi := by
    intro i j k _hi0 hij hjk hk
    exact chordLift_turn_le_pi hn hinj hccw hij hjk hk


end ShellCurvatureConstruction
end Problem97
