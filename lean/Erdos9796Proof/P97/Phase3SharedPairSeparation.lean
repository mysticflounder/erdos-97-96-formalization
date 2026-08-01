/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Selected-shell shared-pair cyclic separation

Two distinct selected-shell rows that share two distinct witnesses force those
witnesses to lie on opposite sides of the two centers in every injective CCW
convex enumeration.  This is the geometric rule used by the Phase-3
shared-pair cap-order certificate.

The theorem is independent of the exact-ten cardinality and of the concrete
Python certificate ingress.  The latter still requires a checked adapter from
SAT row memberships and cap-order annotations.
-/

open scoped EuclideanGeometry

namespace Problem97

noncomputable section

/-- Shared membership in two selected four-classes forces cyclic alternation
of the shared pair across the two centers. -/
theorem selectedFourClass_shared_pair_separated
    {A : Finset ℝ²}
    (rowAt : (center : ↑A) → SelectedFourClass A center.1)
    {n : ℕ}
    (boundary : Fin n → ℝ²)
    (indexOf : ↑A → Fin n)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hboundary : Function.Injective boundary)
    (hindex : Function.Injective indexOf)
    (hpoint : ∀ label, boundary (indexOf label) = label.1)
    {firstCenter secondCenter firstPoint secondPoint : ↑A}
    (hcenters : firstCenter ≠ secondCenter)
    (hpoints : firstPoint ≠ secondPoint)
    (hfirstPoint_first :
      firstPoint.1 ∈ (rowAt firstCenter).support)
    (hsecondPoint_first :
      secondPoint.1 ∈ (rowAt firstCenter).support)
    (hfirstPoint_second :
      firstPoint.1 ∈ (rowAt secondCenter).support)
    (hsecondPoint_second :
      secondPoint.1 ∈ (rowAt secondCenter).support) :
    SurplusCOMPGBank.btw
        (indexOf firstCenter) (indexOf secondCenter) (indexOf firstPoint) ↔
      ¬ SurplusCOMPGBank.btw
        (indexOf firstCenter) (indexOf secondCenter) (indexOf secondPoint) := by
  have hsecondPoint_ne_firstCenter :
      secondPoint ≠ firstCenter := by
    intro h
    subst secondPoint
    exact (rowAt firstCenter).center_not_mem hsecondPoint_first
  have hsecondPoint_ne_secondCenter :
      secondPoint ≠ secondCenter := by
    intro h
    subst secondPoint
    exact (rowAt secondCenter).center_not_mem hsecondPoint_second
  have hfirst :
      dist (boundary (indexOf firstPoint))
          (boundary (indexOf firstCenter)) =
        dist (boundary (indexOf secondPoint))
          (boundary (indexOf firstCenter)) := by
    simpa only [hpoint, dist_comm] using
      ((rowAt firstCenter).support_eq_radius
        firstPoint.1 hfirstPoint_first).trans
        ((rowAt firstCenter).support_eq_radius
          secondPoint.1 hsecondPoint_first).symm
  have hsecond :
      dist (boundary (indexOf firstPoint))
          (boundary (indexOf secondCenter)) =
        dist (boundary (indexOf secondPoint))
          (boundary (indexOf secondCenter)) := by
    simpa only [hpoint, dist_comm] using
      ((rowAt secondCenter).support_eq_radius
        firstPoint.1 hfirstPoint_second).trans
        ((rowAt secondCenter).support_eq_radius
          secondPoint.1 hsecondPoint_second).symm
  apply SurplusCOMPGBank.btw_sep hccw hboundary
  · exact hindex.ne hcenters
  · exact hindex.ne hsecondPoint_ne_firstCenter
  · exact hindex.ne hsecondPoint_ne_secondCenter
  · exact hfirst
  · exact hsecond
  · exact hboundary.ne (hindex.ne hpoints)

end

end Problem97
