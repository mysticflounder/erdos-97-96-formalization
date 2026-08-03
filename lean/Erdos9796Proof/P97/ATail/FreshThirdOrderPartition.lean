/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Mathlib

/-!
# Finite order partition for the fresh-third parity adapter

The two-center parity terminals consume one of four strict index orders.  For
the finite clauses used by the fresh-third route, a pair of endpoints is
either wholly inside the open interval between the two centers or wholly
outside it.  This arithmetic kernel exposes the corresponding terminal order
without making any geometric or `FreshThird` claim.
-/

namespace Problem97

/-- Partition a pair of ordered endpoints into the four nonalternating orders
used by the two-center parity terminals.  The first disjunct is the
center-interval case; the second is the before-or-after union case. -/
theorem freshThird_pair_order_partition
    {n : Nat} {cL cH i j : Fin n}
    (hcenters : cL < cH)
    (hij : i < j)
    (hregion :
      (cL < i ∧ i < cH ∧ cL < j ∧ j < cH) ∨
        ((i < cL ∨ cH < i) ∧ (j < cL ∨ cH < j))) :
    (i < j ∧ j < cL) ∨
      (cH < i ∧ i < j) ∨
      (i < cL ∧ cH < j) ∨
      (cL < i ∧ j < cH) := by
  omega

end Problem97
