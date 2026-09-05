/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.Geometry.TwoInteriorSameBoundaryRadius
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Source-level shared-pair terminal for an exact-thirteen row cell

The geometry kernel rules out two distinct points in a common closed disk when
two selected rows realize the same boundary-radius pattern.  This adapter
keeps the source occurrence explicit: one row must contain the other row's
center, and both rows must contain the same two distinct support points.  The
closed-disk and common-boundary premises are intentionally not reconstructed
from a profile here; an exact-thirteen classifier must supply them from its
source MEC data.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

/-- Two selected rows cannot share two distinct points when their centers are
on a common MEC boundary, the shared points lie in its closed disk, and the
first row contains the second row's center.  These are precisely the
source-level premises consumed by the two-interior metric kernel. -/
theorem false_of_mecBoundary_selectedRows_sharedPair
    {A : Finset ℝ²} {O B P X Y : ℝ²} {R : ℝ}
    (KB : SelectedFourClass A B)
    (KP : SelectedFourClass A P)
    (hB : dist B O = R)
    (hP : dist P O = R)
    (hXi : dist X O ≤ R)
    (hYi : dist Y O ≤ R)
    (hne : X ≠ Y)
    (hP_mem_KB : P ∈ KB.support)
    (hX_mem : X ∈ KB.support ∩ KP.support)
    (hY_mem : Y ∈ KB.support ∩ KP.support) : False := by
  have hX_mem' := Finset.mem_inter.mp hX_mem
  have hY_mem' := Finset.mem_inter.mp hY_mem
  apply Erdos9796Proof.Geometry.false_of_two_interior_same_boundary_radius
    hB hP hXi hYi hne
  · exact (KB.support_eq_radius P hP_mem_KB).trans
      (KB.support_eq_radius X hX_mem'.1).symm
  · exact (KB.support_eq_radius P hP_mem_KB).trans
      (KB.support_eq_radius Y hY_mem'.1).symm
  · exact (KP.support_eq_radius X hX_mem'.2).trans
      (KP.support_eq_radius Y hY_mem'.2).symm

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.false_of_mecBoundary_selectedRows_sharedPair
