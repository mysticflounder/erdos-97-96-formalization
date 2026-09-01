/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cyclic1248AbstractRowSystem
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas

/-!
# Kalmanson obstruction for the cyclic `{1, 2, 4, 8}` system

The cyclic row system is incidence-consistent, but it cannot be realized as
equal-radius rows on a strictly convex CCW boundary.  This module supplies the
small adapter from cyclic row membership to the existing five-role Kalmanson
schema.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace Cyclic1248KalmansonObstruction

open Cyclic1248AbstractRowSystem

/-- Regard a boundary index as its canonical cyclic label. -/
def label {n : ℕ} (i : Fin n) : ZMod n :=
  (i.1 : ZMod n)

/-- Every two boundary points selected by the same cyclic row are equidistant
from that row's center. -/
def RealizesRows {n : ℕ} (phi : Fin n → ℝ²) : Prop :=
  ∀ c a b : Fin n,
    label a ∈ row n (label c) →
    label b ∈ row n (label c) →
    dist (phi c) (phi a) = dist (phi c) (phi b)

/-- For every `n ≥ 9`, the cyclic `{1,2,4,8}` row system has no equal-radius
realization on a strictly convex CCW boundary. -/
theorem false_of_realizesRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hn : 9 ≤ A.card)
    (hrows : RealizesRows phi) : False := by
  let i0 : Fin A.card := ⟨0, by omega⟩
  let i1 : Fin A.card := ⟨1, by omega⟩
  let i2 : Fin A.card := ⟨2, by omega⟩
  let i3 : Fin A.card := ⟨3, by omega⟩
  let i4 : Fin A.card := ⟨A.card - 1, by omega⟩
  have hi01 : i0 < i1 := by simp [i0, i1]
  have hi12 : i1 < i2 := by simp [i1, i2]
  have hi23 : i2 < i3 := by simp [i2, i3]
  have hi34 : i3 < i4 := by
    change 3 < A.card - 1
    omega
  have h01mem : label i1 ∈ row A.card (label i0) := by
    simp [label, i0, i1, row]
  have h02mem : label i2 ∈ row A.card (label i0) := by
    simp [label, i0, i2, row]
  have h12mem : label i2 ∈ row A.card (label i1) := by
    apply (mem_row_iff A.card (label i1) (label i2)).2
    exact Or.inl (by simp [label, i1, i2]; ring)
  have h13mem : label i3 ∈ row A.card (label i1) := by
    apply (mem_row_iff A.card (label i1) (label i3)).2
    exact Or.inr (Or.inl (by simp [label, i1, i3]; ring))
  have hpred_add_one : label i4 + 1 = 0 := by
    have hnat : A.card - 1 + 1 = A.card := by omega
    have hcast := congrArg (fun k : ℕ => (k : ZMod A.card)) hnat
    simpa [label, i4, Nat.cast_add, ZMod.natCast_self] using hcast
  have hpred_add_two : label i4 + 2 = 1 := by
    calc
      label i4 + 2 = (label i4 + 1) + 1 := by ring
      _ = 1 := by rw [hpred_add_one]; simp
  have hpred_add_four : label i4 + 4 = 3 := by
    calc
      label i4 + 4 = (label i4 + 1) + 3 := by ring
      _ = 3 := by rw [hpred_add_one]; simp
  have h41mem : label i1 ∈ row A.card (label i4) := by
    apply (mem_row_iff A.card (label i4) (label i1)).2
    exact Or.inr (Or.inl (by simpa [label, i1] using hpred_add_two.symm))
  have h43mem : label i3 ∈ row A.card (label i4) := by
    apply (mem_row_iff A.card (label i4) (label i3)).2
    exact Or.inr (Or.inr (Or.inl
      (by simpa [label, i3] using hpred_add_four.symm)))
  have h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2) :=
    hrows i0 i1 i2 h01mem h02mem
  have h123 : dist (phi i1) (phi i2) = dist (phi i1) (phi i3) :=
    hrows i1 i2 i3 h12mem h13mem
  have h413 : dist (phi i4) (phi i1) = dist (phi i4) (phi i3) :=
    hrows i4 i1 i3 h41mem h43mem
  exact Problem97.CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_012_123_413
    hA hphi_inj hphi_image hccw hi01 hi12 hi23 hi34 h012 h123 h413

end Cyclic1248KalmansonObstruction
end Problem97
