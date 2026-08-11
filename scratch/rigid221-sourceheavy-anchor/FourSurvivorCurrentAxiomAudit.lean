import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- Mixed metric adapter.  In the intended C5 use, the radius premises,
`haBx`, `hbBx`, positivity, and `hx_off` come from the physical circle,
the exact trace, and the off-class blocker.  The genuinely extra interface is
`hOBx` plus the two equal-side equations. -/
theorem fourSurvivor_offClass_equilateral_bridge
    {D : CounterexampleData} {q O a b c x : ℝ²} {Bx : Finset ℝ²}
    (hr_pos : 0 < dist O q)
    (ha_radius : dist O a = dist O q)
    (hb_radius : dist O b = dist O q)
    (hc_radius : dist O c = dist O q)
    (hab_pos : 0 < dist a b)
    (hx_off : dist O x ≠ dist O q)
    (Kx : U5QDeletedK4Class D q x Bx)
    (haBx : a ∈ Bx) (hbBx : b ∈ Bx)
    (hOBx : O ∈ Bx)
    (hab_eq_hac : dist a b = dist a c)
    (hab_eq_hbc : dist a b = dist b c) : False := by
  exact u5_equilateral_circumcenter_on_p_circle_incompatibility
    hr_pos ha_radius hb_radius hc_radius hab_eq_hac hab_eq_hbc hab_pos
    hx_off Kx hOBx haBx hbBx

#print axioms fourSurvivor_offClass_equilateral_bridge

end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.exactFour_fourSurvivingCenters_survivalSquare_split

#print axioms Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence

#print axioms Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare

#print axioms Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmission_fourCenterCommonDeletion

#print axioms Problem97.ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary

#print axioms Problem97.U5QDeletedK4Class.inter_card_le_two

#print axioms Problem97.u5_equilateral_bisector_incompatibility

#print axioms Problem97.u5_equilateral_circumcenter_on_p_circle_incompatibility

#print axioms Problem97.u5_equilateral_outer_point_incompatibility
