/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# PG136 / Lemma 184: fixed-anchor companion nesting

This is the order-theoretic geometric core used by the endpoint critical-fiber
producer audit.  It requires only one convex boundary enumeration, three
same-side centers, three later targets, and the three displayed equalities.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberProducerPushScratch

open CapCrossingKalmansonBridge

/-- If `D < P < Q` and the distinct targets `A,B,Z` all occur after `Q`, the
equalities

```text
DA = DB,  PZ = PA,  QZ = QB
```

force `B` to lie strictly between `Z` and `A`.  This is PG136 / Lemma 184
with arbitrary intervening boundary vertices allowed. -/
theorem pg136_fixedAnchorCompanion_nesting
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {iD iP iQ iA iB iZ : Fin carrier.card}
    (hDP : iD < iP) (hPQ : iP < iQ)
    (hQA : iQ < iA) (hQB : iQ < iB) (hQZ : iQ < iZ)
    (hBA : iB ≠ iA) (hBZ : iB ≠ iZ)
    (hDA_eq_DB :
      dist (boundary iD) (boundary iA) =
        dist (boundary iD) (boundary iB))
    (hPZ_eq_PA :
      dist (boundary iP) (boundary iZ) =
        dist (boundary iP) (boundary iA))
    (hQZ_eq_QB :
      dist (boundary iQ) (boundary iZ) =
        dist (boundary iQ) (boundary iB)) :
    (iZ < iB ∧ iB < iA) ∨ (iA < iB ∧ iB < iZ) := by
  rcases lt_or_gt_of_ne hBA with hBA' | hAB
  · rcases lt_or_gt_of_ne hBZ with hBZ' | hZB
    · have hPB_lt_PA :
          dist (boundary iP) (boundary iB) <
            dist (boundary iP) (boundary iA) :=
        dist_lt_of_ccw_of_dist_diagonal_eq_side hcarrier
          hboundary_injective hboundary_image hboundary_ccw
          hDP (hPQ.trans hQB) hBA' hDA_eq_DB.symm
      have hPZ_lt_PB :
          dist (boundary iP) (boundary iZ) <
            dist (boundary iP) (boundary iB) := by
        have hkal :=
          dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
            hboundary_injective hboundary_image hboundary_ccw
            hPQ hQB hBZ'
        linarith
      exfalso
      linarith
    · exact Or.inl ⟨hZB, hBA'⟩
  · rcases lt_or_gt_of_ne hBZ with hBZ' | hZB
    · exact Or.inr ⟨hAB, hBZ'⟩
    · have hPA_lt_PB :
          dist (boundary iP) (boundary iA) <
            dist (boundary iP) (boundary iB) :=
        dist_lt_of_ccw_of_dist_diagonal_eq_side hcarrier
          hboundary_injective hboundary_image hboundary_ccw
          hDP (hPQ.trans hQA) hAB hDA_eq_DB
      have hPB_lt_PZ :
          dist (boundary iP) (boundary iB) <
            dist (boundary iP) (boundary iZ) := by
        have hkal :=
          dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
            hboundary_injective hboundary_image hboundary_ccw
            hPQ hQZ hZB
        linarith
      exfalso
      linarith

#print axioms pg136_fixedAnchorCompanion_nesting

end ATailCriticalFiberProducerPushScratch
end Problem97
