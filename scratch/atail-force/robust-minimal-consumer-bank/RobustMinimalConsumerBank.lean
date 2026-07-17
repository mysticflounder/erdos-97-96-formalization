/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustTwoRadiusGeometry

/-!
# Scratch: theorem-bank adapter for the robust two-radius collision

This file records the one exact conditional theorem-bank terminal found by
the endpoint audit.  A same-row minimal collision already gives two distinct
centers equidistant from the collision pair.  If one further member of the
physical second-apex row lies on the fresh-center collision radius, the
existing three-point center-rigidity theorem identifies the centers,
contradicting the fresh-center separation proved by the minimal-deletion
transition.

The added hypothesis is exactly the impossible three-common-point overlap of
two distinct circles.  The theorem records that conditional boundary; it does
not claim that the current endpoint supplies the hypothesis or recommend it
as the next producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustMinimalConsumerBankScratch

open ATailRobustTwoRadiusGeometryScratch

/-- Conditional three-common-point terminal for the reciprocal-collision
endpoint.

The existential hypothesis states that a third member of the physical
second-apex row is also on the fresh-center radius through the collision
pair.  This is an exact incompatibility boundary, not a claim that the live
minimality data produce such a point.
-/
theorem false_of_sameRowMinimalCollisionTransition_of_third_common_point
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {center : ℝ²} {V : Finset ℝ²}
    (T : SameRowMinimalCollisionTransition D S H K center V)
    (hcenter_ne : center ≠ S.oppApex2)
    (hthird :
      ∃ third ∈ K.support,
        third ≠ T.source ∧ third ≠ T.partner ∧
          dist center T.source = dist center third) :
    False := by
  rcases hthird with
    ⟨third, hthirdRow, hthirdSource, hthirdPartner, hcenterThird⟩
  have hsourceA : T.source ∈ D.A :=
    K.support_subset_A T.source_mem_row
  have hpartnerA : T.partner ∈ D.A :=
    K.support_subset_A T.partner_mem_row
  have hthirdA : third ∈ D.A :=
    K.support_subset_A hthirdRow
  have harea :
      signedArea2 T.source T.partner third ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear
      hsourceA hpartnerA hthirdA T.source_ne_partner
      hthirdSource.symm hthirdPartner.symm
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have happPair :
      dist S.oppApex2 T.source = dist S.oppApex2 T.partner :=
    (K.support_eq_radius T.source T.source_mem_row).trans
      (K.support_eq_radius T.partner T.partner_mem_row).symm
  have happThird :
      dist S.oppApex2 T.source = dist S.oppApex2 third :=
    (K.support_eq_radius T.source T.source_mem_row).trans
      (K.support_eq_radius third hthirdRow).symm
  apply hcenter_ne
  exact eq_of_equidistant_three_noncollinear
    harea T.freshCenter_bisects hcenterThird happPair happThird

#print axioms false_of_sameRowMinimalCollisionTransition_of_third_common_point

end ATailRobustMinimalConsumerBankScratch
end Problem97
