/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U3ToU5DangerousTriple
import Erdos9796Proof.P97.U1Depth5Prefix

/-!
# ATAIL Stage-I three-dangerous-point equidistant sink

This scratch module records the smallest imported contradiction consumer found
by the Stage-I theorem-bank audit.  A `U3FixedTriplePacket` already makes
`t1,t2,t3` three noncollinear points equidistant from `p`.  Therefore a second
center `c ≠ p` cannot also be equidistant from the same triple.  Only two
equalities at `c` are needed.

The second theorem specializes the sink to the live `u`-row.  Membership of
all three dangerous points in its exact critical shell supplies the two
equalities automatically.

No axiom, `sorry`, `admit`, or `native_decide` is introduced.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILStageOneThreeDangerousEquidistantSink

open U1Depth5

/-- Two common-distance equalities at a second center contradict the fixed
dangerous triple around `p`.

This is the minimal raw metric sink: `hfixed` supplies the corresponding two
equalities at `p` and the noncollinearity of `t1,t2,t3`. -/
theorem false_of_fixedTriple_secondCenter_two_equalities
    {D : CounterexampleData} {q p t1 t2 t3 c : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hpc : p ≠ c)
    (hc12 : dist c t1 = dist c t2)
    (hc13 : dist c t1 = dist c t3) : False := by
  have hT := u5DangerousTriple_of_u3FixedTriplePacket hfixed
  have hnoncol : ¬ Collinear ℝ ({t1, t2, t3} : Set Plane) := by
    simpa only [Finset.coe_insert, Finset.coe_singleton] using hT.T_noncollinear
  have harea : signedArea2 t1 t2 t3 ≠ 0 := by
    intro hzero
    exact hnoncol (collinear_of_signedArea2_eq_zero t1 t2 t3 hzero)
  apply hpc
  exact eq_of_equidistant_three_noncollinear harea
    (hfixed.t1_same_radius.trans hfixed.t2_same_radius.symm)
    (hfixed.t1_same_radius.trans hfixed.t3_same_radius.symm)
    hc12 hc13

/-- Preferred live-facing raw metric sink.  The fixed packet also makes
`q,t1,t3` three distinct points on the positive-radius `p`-circle, so a
distinct center cannot share the two indicated equalities. -/
theorem false_of_fixedTriple_secondCenter_q_t1_t3_equalities
    {D : CounterexampleData} {q p t1 t2 t3 c : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hpc : p ≠ c)
    (hcq1 : dist c q = dist c t1)
    (hcq3 : dist c q = dist c t3) : False := by
  have harea : signedArea2 q t1 t3 ≠ 0 :=
    MEC.signedArea2_ne_zero_of_three_dist_eq
      (dist_comm q p)
      (by simpa only [dist_comm] using hfixed.t1_same_radius)
      (by simpa only [dist_comm] using hfixed.t3_same_radius)
      hfixed.q_ne_t1 hfixed.t1_ne_t3 hfixed.q_ne_t3
  apply hpc
  exact eq_of_equidistant_three_noncollinear harea
    hfixed.t1_same_radius.symm hfixed.t3_same_radius.symm hcq1 hcq3

/-- Producer-facing specialization: if the live `u`-row exact shell contains
all three fixed dangerous points, its center is the forbidden second center. -/
theorem false_of_fixedTriple_mem_uRow_support
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hpc : p ≠ rows.uRow.center)
    (ht1 : t1 ∈ rows.uRow.selected.toCriticalFourShell.support)
    (ht2 : t2 ∈ rows.uRow.selected.toCriticalFourShell.support)
    (ht3 : t3 ∈ rows.uRow.selected.toCriticalFourShell.support) : False := by
  apply false_of_fixedTriple_secondCenter_two_equalities hfixed hpc
  · exact
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius t1 ht1).trans
        (rows.uRow.selected.toCriticalFourShell.support_eq_radius t2 ht2).symm
  · exact
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius t1 ht1).trans
        (rows.uRow.selected.toCriticalFourShell.support_eq_radius t3 ht3).symm

/-- Membership form of the preferred `q,t1,t3` sink. -/
theorem false_of_fixedTriple_q_t1_t3_mem_uRow_support
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hpc : p ≠ rows.uRow.center)
    (hq : q ∈ rows.uRow.selected.toCriticalFourShell.support)
    (ht1 : t1 ∈ rows.uRow.selected.toCriticalFourShell.support)
    (ht3 : t3 ∈ rows.uRow.selected.toCriticalFourShell.support) : False := by
  apply false_of_fixedTriple_secondCenter_q_t1_t3_equalities hfixed hpc
  · exact
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius q hq).trans
        (rows.uRow.selected.toCriticalFourShell.support_eq_radius t1 ht1).symm
  · exact
      (rows.uRow.selected.toCriticalFourShell.support_eq_radius q hq).trans
        (rows.uRow.selected.toCriticalFourShell.support_eq_radius t3 ht3).symm

#print axioms false_of_fixedTriple_secondCenter_two_equalities
#print axioms false_of_fixedTriple_secondCenter_q_t1_t3_equalities
#print axioms false_of_fixedTriple_mem_uRow_support
#print axioms false_of_fixedTriple_q_t1_t3_mem_uRow_support

end ATAILStageOneThreeDangerousEquidistantSink
end Problem97
