/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LiveSharedPairNonalternationIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSignedArea

/-!
# Signed-area ingress for a B1 live slice

The same-boundary-arc condition on a slice cut by an apex and a row center is
equivalent to positivity of the product of the two signed areas against that
chord.  Membership in a positive-radius selected class excludes the apex,
while critical-shell membership excludes the row center.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Every distinct boundary-index pair in `slice` has the same signed-area
sign against the chord from `apex` to `source`. -/
def B1SliceSignedAreaProductPositive
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (apex source : CarrierLabel A) (slice : Finset ℝ²) : Prop :=
  ∀ ix iy : Fin B.n,
    B.boundary ix ∈ slice →
    B.boundary iy ∈ slice →
    ix ≠ iy →
    0 < Problem97.signedArea2 (B.boundary ix) apex.1 source.1 *
      Problem97.signedArea2 (B.boundary iy) apex.1 source.1

private theorem slice_index_ne_endpoints
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (apex source : CarrierLabel A)
    {radius : ℝ} (hradius : 0 < radius)
    {q : ℝ²} (row : CriticalFourShell A q source.1)
    {ix : Fin B.n}
    (hix : B.boundary ix ∈
      row.support ∩ SelectedClass A apex.1 radius) :
    ix ≠ B.indexOf apex ∧ ix ≠ B.indexOf source := by
  have hrow := (Finset.mem_inter.mp hix).1
  have hclass := (Finset.mem_inter.mp hix).2
  have hneApex : B.boundary ix ≠ apex.1 := by
    intro h
    have hdist := (mem_selectedClass.mp hclass).2
    rw [h] at hdist
    have hzero : (0 : ℝ) = radius := by simpa using hdist
    linarith
  have hneSource : B.boundary ix ≠ source.1 := by
    intro h
    apply row.center_not_mem_support
    simpa only [h] using hrow
  constructor
  · intro hindex
    apply hneApex
    calc
      B.boundary ix = B.boundary (B.indexOf apex) := congrArg B.boundary hindex
      _ = apex.1 := by simpa [pointOf] using B.point_eq apex
  · intro hindex
    apply hneSource
    calc
      B.boundary ix = B.boundary (B.indexOf source) := congrArg B.boundary hindex
      _ = source.1 := by simpa [pointOf] using B.point_eq source

private theorem slice_pair_iff_signedAreaProduct
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (apex source : CarrierLabel A) (hapexSource : apex ≠ source)
    {radius : ℝ} (hradius : 0 < radius)
    {q : ℝ²} (row : CriticalFourShell A q source.1)
    {ix iy : Fin B.n}
    (hix : B.boundary ix ∈
      row.support ∩ SelectedClass A apex.1 radius)
    (hiy : B.boundary iy ∈
      row.support ∩ SelectedClass A apex.1 radius)
    :
    (SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf source) ix ↔
      SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf source) iy) ↔
      0 < Problem97.signedArea2 (B.boundary ix) apex.1 source.1 *
        Problem97.signedArea2 (B.boundary iy) apex.1 source.1 := by
  have hixEnds := slice_index_ne_endpoints B apex source hradius row hix
  have hiyEnds := slice_index_ne_endpoints B apex source hradius row hiy
  have hcut : B.indexOf apex ≠ B.indexOf source :=
    B.index_injective.ne hapexSource
  have hbridge := cyclicAdjacent_iff_signedArea2_mul_pos
    B.boundary_ccw B.boundary_injective hcut
    hixEnds.1 hixEnds.2 hiyEnds.1 hiyEnds.2
  have hapexPoint : B.boundary (B.indexOf apex) = apex.1 := by
    simpa [pointOf] using B.point_eq apex
  have hsourcePoint : B.boundary (B.indexOf source) = source.1 := by
    simpa [pointOf] using B.point_eq source
  rw [hapexPoint, hsourcePoint] at hbridge
  simpa [cyclicAdjacent] using hbridge

theorem b1SliceSameBoundaryArc_iff_signedAreaProductPositive
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (apex source : CarrierLabel A) (hapexSource : apex ≠ source)
    {radius : ℝ} (hradius : 0 < radius)
    {q : ℝ²} (row : CriticalFourShell A q source.1) :
    B1SliceSameBoundaryArc B apex source
        (row.support ∩ SelectedClass A apex.1 radius) ↔
      B1SliceSignedAreaProductPositive B apex source
        (row.support ∩ SelectedClass A apex.1 radius) := by
  unfold B1SliceSameBoundaryArc B1SliceSignedAreaProductPositive
  constructor
  · intro hsame ix iy hix hiy hixy
    exact (slice_pair_iff_signedAreaProduct B apex source hapexSource
      hradius row hix hiy).mp (hsame ix iy hix hiy hixy)
  · intro hproduct ix iy hix hiy hixy
    exact (slice_pair_iff_signedAreaProduct B apex source hapexSource
      hradius row hix hiy).mpr (hproduct ix iy hix hiy hixy)

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.b1SliceSameBoundaryArc_iff_signedAreaProductPositive
