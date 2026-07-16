/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CoherentRCommonDeletionProvenance

/-!
# Period-two coherent R cycles leave the deleted shell

For a two-cycle of the actual blocker map, the deleted successor's blocker is
the original source.  The deleted successor's selected critical shell is
therefore centered at that source, so the source cannot belong to the shell's
positive-radius support.  This closes `SourceOutsideDeletedCriticalShell` in
the shortest coherent-cycle case without any endpoint-radius assumption.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- A provenance-bearing common-deletion packet coming from a period-two
actual-blocker cycle has its source outside the deleted successor's selected
critical shell. -/
theorem CoherentRCommonDeletionPacket.sourceOutsideDeletedCriticalShell_of_period_two_cycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H)
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hsource :
      R.sourcePair.x =
        (K.source
          ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩).1)
    (hdeleted : R.deleted = (K.source ⟨1, K.two_le_period⟩).1)
    (hperiod : K.period = 2) :
    R.SourceOutsideDeletedCriticalShell := by
  let i0 : Fin K.period :=
    ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩
  let i1 : Fin K.period := ⟨1, K.two_le_period⟩
  have hedge10 : H.blockerVertex (K.source i1) = K.source i0 := by
    have hperiodic := K.isPeriodicPt
    rw [hperiod] at hperiodic
    simpa [i0, i1, SourceExactMinimalActualBlockerCycle.source,
      Function.iterate_succ_apply'] using hperiodic
  let hdeletedA : R.deleted ∈ D.A :=
    (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  have hdeletedVertex :
      (⟨R.deleted, hdeletedA⟩ : CriticalShellSystem.CarrierVertex D.A) =
        K.source i1 := by
    apply Subtype.ext
    simpa [i1] using hdeleted
  have hcenter :
      H.centerAt R.deleted hdeletedA = R.sourcePair.x := by
    calc
      H.centerAt R.deleted hdeletedA =
          (H.blockerVertex
            (⟨R.deleted, hdeletedA⟩ :
              CriticalShellSystem.CarrierVertex D.A)).1 := rfl
      _ = (K.source i0).1 := by rw [hdeletedVertex, hedge10]
      _ = R.sourcePair.x := by simpa [i0] using hsource.symm
  intro hmem
  exact
    (H.selectedAt R.deleted hdeletedA).toCriticalFourShell.center_not_mem_support
      (by simpa [hcenter] using hmem)

/-- The period-two cycle therefore reaches the already-defined anchored
source-critical transition without any additional geometric premise. -/
theorem CoherentRCommonDeletionPacket.nonempty_anchoredSourceCriticalTransition_of_period_two_cycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H)
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hsource :
      R.sourcePair.x =
        (K.source
          ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩).1)
    (hdeleted : R.deleted = (K.source ⟨1, K.two_le_period⟩).1)
    (hperiod : K.period = 2) :
    Nonempty (CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition R) :=
  R.anchoredSourceCriticalTransition_of_sourceOutsideDeletedCriticalShell
    (R.sourceOutsideDeletedCriticalShell_of_period_two_cycle
      K hsource hdeleted hperiod)

#print axioms CoherentRCommonDeletionPacket.sourceOutsideDeletedCriticalShell_of_period_two_cycle
#print axioms CoherentRCommonDeletionPacket.nonempty_anchoredSourceCriticalTransition_of_period_two_cycle

end ATailRFullParentEntryScratch
end Problem97
