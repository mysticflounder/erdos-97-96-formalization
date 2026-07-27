import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Blocker-cycle support bridge audit

This scratch theorem records the full selected-row incidence information
obtained directly from `CriticalShellSystem.exists_blocker_cycle`.

For every orbit vertex `qⱼ`, its selected row contains `qⱼ`, while the center
of that row is the next orbit vertex.  This does not by itself construct a
Kalmanson comparison: the latter additionally requires two specified boundary
vertices in one selected row, together with an ordered boundary quadruple.
-/

namespace Problem97.ATailBlockerCycleKalmansonBridgeScratch

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

/-- Every blocker cycle is a cycle of selected rows whose predecessor belongs
to the support of the row centered at its successor. -/
theorem exists_blocker_cycle_with_support_predecessors
    {A : Finset ℝ²} (H : CriticalShellSystem A) (hne : A.Nonempty) :
    ∃ (q : CriticalShellSystem.CarrierVertex A) (k : ℕ),
      2 ≤ k ∧ Function.IsPeriodicPt H.blockerVertex k q ∧
        ∀ j : ℕ,
          let qj := (H.blockerVertex^[j]) q
          let qnext := (H.blockerVertex^[j + 1]) q
          qj.1 ∈ (H.selectedAt qj.1 qj.2).toCriticalFourShell.support ∧
            H.centerAt qj.1 qj.2 = qnext.1 := by
  rcases H.exists_blocker_cycle hne with ⟨q, k, hk, hperiodic⟩
  refine ⟨q, k, hk, hperiodic, ?_⟩
  intro j
  dsimp only
  constructor
  · exact (H.selectedAt _ _).toCriticalFourShell.q_mem_support
  · change (H.blockerVertex ((H.blockerVertex^[j]) q)).1 =
      ((H.blockerVertex^[j + 1]) q).1
    rw [show j + 1 = 1 + j by omega, Function.iterate_add_apply]
    rfl

/-- A collision row supplies the nonempty carrier needed by the generic
blocker-cycle result, but supplies no localization of the resulting orbit. -/
theorem exists_blocker_cycle_with_support_predecessors_of_collision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    ∃ (q : CriticalShellSystem.CarrierVertex D.A) (k : ℕ),
      2 ≤ k ∧ Function.IsPeriodicPt H.blockerVertex k q ∧
        ∀ j : ℕ,
          let qj := (H.blockerVertex^[j]) q
          let qnext := (H.blockerVertex^[j + 1]) q
          qj.1 ∈ (H.selectedAt qj.1 qj.2).toCriticalFourShell.support ∧
            H.centerAt qj.1 qj.2 = qnext.1 :=
  exists_blocker_cycle_with_support_predecessors H
    ⟨P.source₁, P.source₁_mem_A⟩

#print axioms exists_blocker_cycle_with_support_predecessors
#print axioms exists_blocker_cycle_with_support_predecessors_of_collision

end Problem97.ATailBlockerCycleKalmansonBridgeScratch
