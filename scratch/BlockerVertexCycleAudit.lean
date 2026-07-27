import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Actual blocker two-cycle audit

An actual two-cycle of the chosen blocker map forces mutual row omission, not
the mutual row membership used by the existing perpendicular-bisector terminal.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- A genuine two-cycle of the actual blocker map points in the opposite
direction from the cross-memberships needed by the perpendicular-bisector
terminal: each cycle vertex is the center, hence not a member, of the other
vertex's canonical shell. -/
theorem blocker_two_cycle_forces_mutual_cross_omission
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : CriticalShellSystem.CarrierVertex A)
    (hcycle : Function.IsPeriodicPt H.blockerVertex 2 q) :
    q.1 ∉
        (H.selectedAt (H.blockerVertex q).1
          (H.blockerVertex q).2).toCriticalFourShell.support ∧
      (H.blockerVertex q).1 ∉
        (H.selectedAt q.1 q.2).toCriticalFourShell.support := by
  have hcycle' : H.blockerVertex (H.blockerVertex q) = q := by
    simpa [Function.IsPeriodicPt, Function.iterate_succ_apply] using hcycle
  constructor
  · have hraw :
        (H.blockerVertex (H.blockerVertex q)).1 ∉
          (H.selectedAt (H.blockerVertex q).1
            (H.blockerVertex q).2).toCriticalFourShell.support := by
      exact
        (H.selectedAt (H.blockerVertex q).1
          (H.blockerVertex q).2).toCriticalFourShell.center_not_mem_support
    simpa only [hcycle'] using hraw
  · exact
      (H.selectedAt q.1 q.2).toCriticalFourShell.center_not_mem_support

end Problem97
