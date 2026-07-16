/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderBridge

/-!
# Thin scratch adapter for the retained I,O,E rows

The pinned five-row subsystem has centers `O,D,E,I,F`.  The existing
four-point/two-circle bank consumer needs only the rows centered at `I,O,E`.
Under the reverse boundary orientation its roles are

* `q = I`, `u = O`, `y = E`, `v = J`;
* the cyclic subsequence is `I,O,E,J`; and
* the six memberships below are exactly the fields of the production
  `ThreeRowSupportData` bridge.

This file validates the wiring shape only.  Producing these named rows from
the live K-A-PAIR hypotheses remains open.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailGlobalK4UnitScratch

open Census554
open Census554.GeneralCarrierBridge

/-- Existing bank closure specialized to the exact retained-row roles. -/
theorem false_of_retained_I_O_E_row_memberships
    {carrier : Finset ℝ²} (F : FaithfulCarrierPattern carrier)
    (boundary : BoundaryIndexing carrier)
    (i o e j : CarrierLabel carrier)
    (o_mem_i : o.1 ∈ (F.classAt i.1 i.2).support)
    (e_mem_i : e.1 ∈ (F.classAt i.1 i.2).support)
    (e_mem_o : e.1 ∈ (F.classAt o.1 o.2).support)
    (j_mem_o : j.1 ∈ (F.classAt o.1 o.2).support)
    (o_mem_e : o.1 ∈ (F.classAt e.1 e.2).support)
    (j_mem_e : j.1 ∈ (F.classAt e.1 e.2).support)
    (hcyc : FourPointTwoCircleBisectorOrderBridge.CyclicSubsequence
      boundary i o e j) :
    False := by
  exact
    FourPointTwoCircleBisectorOrderBridge.false_of_three_rows_and_cyclic_subsequence
      F boundary
      { q := i
        v := j
        u := o
        y := e
        u_mem_q := o_mem_i
        y_mem_q := e_mem_i
        y_mem_u := e_mem_o
        v_mem_u := j_mem_o
        u_mem_y := o_mem_e
        v_mem_y := j_mem_e }
      hcyc

#print axioms false_of_retained_I_O_E_row_memberships

end Problem97.ATailGlobalK4UnitScratch
