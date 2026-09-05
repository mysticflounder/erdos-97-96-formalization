/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# Cyclic shifts of carrier boundary indexings

This module transports both halves of a `BoundaryIndexing` across a cyclic
change of cut: the boundary enumeration is shifted forward by `cut`, while
the inverse index map is shifted backward by the same amount.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace GeneralCarrierBridge

/-- Re-cut a carrier boundary indexing at `cut`, transporting every stored
carrier-label index by subtraction. -/
def BoundaryIndexing.cyclicShift {A : Finset ℝ²}
    (B : BoundaryIndexing A) (cut : Fin B.n) : BoundaryIndexing A :=
  let hpos : 0 < B.n :=
    lt_of_le_of_lt (Nat.zero_le cut.val) cut.isLt
  letI : NeZero B.n := ⟨Nat.ne_of_gt hpos⟩
  {
    n := B.n
    boundary := fun i => B.boundary (i + cut)
    indexOf := fun label => B.indexOf label - cut
    boundary_injective := injective_cyclicShift B.boundary_injective cut
    boundary_image :=
      (image_univ_cyclicShift B.boundary cut).trans B.boundary_image
    boundary_ccw :=
      isCcwConvexPolygon_cyclicShift B.boundary_injective B.boundary_ccw cut
    index_injective := by
      intro x y hxy
      apply B.index_injective
      have := congrArg (fun i : Fin B.n => i + cut) hxy
      simpa only [sub_add_cancel] using this
    point_eq := by
      intro label
      simpa only [sub_add_cancel] using B.point_eq label
  }

/-- The label chosen as the cyclic cut has index zero in the shifted
boundary indexing. -/
theorem BoundaryIndexing.cyclicShift_indexOf_cut_eq_zero
    {A : Finset ℝ²} (B : BoundaryIndexing A) (label : CarrierLabel A) :
    (B.cyclicShift (B.indexOf label)).indexOf label =
      (⟨0, lt_of_le_of_lt (Nat.zero_le (B.indexOf label).val)
        (B.indexOf label).isLt⟩ : Fin B.n) := by
  let hpos : 0 < B.n :=
    lt_of_le_of_lt (Nat.zero_le (B.indexOf label).val)
      (B.indexOf label).isLt
  letI : NeZero B.n := ⟨Nat.ne_of_gt hpos⟩
  change B.indexOf label - B.indexOf label = (⟨0, hpos⟩ : Fin B.n)
  exact sub_self _

/-- After cutting at one boundary index, every distinct index is strictly
positive. -/
theorem BoundaryIndexing.cyclicShift_sub_pos_of_ne
    {A : Finset ℝ²} (B : BoundaryIndexing A) {i cut : Fin B.n}
    (hi : i ≠ cut) :
    cut - cut < i - cut := by
  let hpos : 0 < B.n :=
    lt_of_le_of_lt (Nat.zero_le cut.val) cut.isLt
  letI : NeZero B.n := ⟨Nat.ne_of_gt hpos⟩
  have hne : i - cut ≠ (0 : Fin B.n) := by
    intro hzero
    apply hi
    have h := congrArg (fun j : Fin B.n => j + cut) hzero
    simpa only [sub_add_cancel, zero_add] using h
  simpa only [sub_self] using (Fin.pos_iff_ne_zero.mpr hne)

/-- Subtracting one cyclic cut preserves inequality of boundary indices. -/
theorem BoundaryIndexing.cyclicShift_sub_ne_of_ne
    {A : Finset ℝ²} (B : BoundaryIndexing A) {i j cut : Fin B.n}
    (hij : i ≠ j) :
    i - cut ≠ j - cut := by
  let hpos : 0 < B.n :=
    lt_of_le_of_lt (Nat.zero_le cut.val) cut.isLt
  letI : NeZero B.n := ⟨Nat.ne_of_gt hpos⟩
  intro h
  apply hij
  have hadd := congrArg (fun k : Fin B.n => k + cut) h
  simpa only [sub_add_cancel] using hadd

/-- Looking up a label in a shifted boundary indexing still returns its
underlying carrier point. -/
theorem BoundaryIndexing.cyclicShift_boundary_indexOf
    {A : Finset ℝ²} (B : BoundaryIndexing A) (cut : Fin B.n)
    (label : CarrierLabel A) :
    (B.cyclicShift cut).boundary ((B.cyclicShift cut).indexOf label) =
      pointOf label := by
  exact (B.cyclicShift cut).point_eq label

end GeneralCarrierBridge
end Census554
end Problem97
