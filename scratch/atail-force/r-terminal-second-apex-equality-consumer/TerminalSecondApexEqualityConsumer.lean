/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import LeastTerminalHitReciprocalRowSplit
import JointProfileElimination

/-!
# Second-apex equality consumer for the terminal directed-cross residual

The coherent least-terminal-hit split exposes
`ReciprocalDirectedCrossResidual`: a source and a terminal deletion on one
first-apex radius, with the source in the deletion's selected critical row
and the deletion omitted from the source row.  Both individual deletions
preserve K4 at both prescribed opposite apices.

The conditional sink below assumes one further metric field: the source and
deletion have equal distance from the second opposite apex.  The first apex,
second apex, and deletion's actual blocker are then three distinct carrier
centers on the perpendicular bisector of the source-deletion pair,
contradicting the banked Dumitrescu bound.

This equality is deliberately only a regression boundary, not a producer
target.  `ATailSecondApexJointFiberScratch.
secondApex_distance_injective_on_firstApex_offSurplus_fiber` already proves
that distinct off-surplus points on one first-apex fiber have unequal
second-apex distances.  The remaining closure producer must therefore expose
a different consequence of that strict second-apex separation; it must not
try to mine the equality assumed below.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalSecondApexEqualityConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailJointProfileEliminationScratch
open ATailRFullParentEntryScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

namespace CoherentRCommonDeletionPacket

/-- Regression consumer: the exact terminal asymmetric residual closes if its
two named points are also co-radial about the second opposite apex.

The additional hypothesis is the sole conditional input to this theorem, but
it is not a viable producer target: second-apex injectivity on the existing
off-surplus first-apex fiber proves its negation for the distinct named
points.  All carrier memberships, first-apex co-radiality,
deletion/blocker separation, and the selected-row equality at the deletion's
blocker come from `ReciprocalDirectedCrossResidual`. -/
theorem ReciprocalDirectedCrossResidual.false_of_secondApex_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual R)
    (hsecond :
      dist S.oppApex2 R.sourcePair.x =
        dist S.oppApex2 R.deleted) :
    False := by
  let hdeletedA : R.deleted ∈ D.A :=
    (mem_selectedClass.mp X.deleted_mem_fixedClass).1
  let deletedCenter := H.centerAt R.deleted hdeletedA
  let deletedRow :=
    (H.selectedAt R.deleted hdeletedA).toCriticalFourShell

  have hsourceA : R.sourcePair.x ∈ D.A :=
    (mem_selectedClass.mp X.source_mem_fixedClass).1
  have hdeletedCenterA : deletedCenter ∈ D.A := by
    simpa [deletedCenter, deletedRow] using
      (Finset.mem_erase.mp deletedRow.center_mem).2
  have hfirst :
      dist S.oppApex1 R.sourcePair.x =
        dist S.oppApex1 R.deleted :=
    (mem_selectedClass.mp X.source_mem_fixedClass).2.trans
      (mem_selectedClass.mp X.deleted_mem_fixedClass).2.symm
  have hdeletedCenter :
      dist deletedCenter R.sourcePair.x =
        dist deletedCenter R.deleted := by
    exact
      (deletedRow.support_eq_radius
          R.sourcePair.x X.source_mem_deletedRow).trans
        (deletedRow.support_eq_radius
          R.deleted deletedRow.q_mem_support).symm
  have hdeletedCenter_ne_first :
      deletedCenter ≠ S.oppApex1 := by
    simpa [deletedCenter, hdeletedA] using
      actual_blocker_ne_of_deletion_survives
        H hdeletedA X.deleted_survives_firstApex
  have hdeletedCenter_ne_second :
      deletedCenter ≠ S.oppApex2 := by
    simpa [deletedCenter, hdeletedA] using
      actual_blocker_ne_of_deletion_survives
        H hdeletedA X.deleted_survives_secondApex

  exact false_of_three_carrier_bisector_centers
    hsourceA hdeletedA R.source_ne_deleted
    (oppApex1_mem_A S) (oppApex2_mem_A S) hdeletedCenterA
    hfirst hsecond hdeletedCenter
    (oppApex1_ne_oppApex2 S)
    hdeletedCenter_ne_first.symm
    hdeletedCenter_ne_second.symm

#print axioms ReciprocalDirectedCrossResidual.false_of_secondApex_distance_eq

end CoherentRCommonDeletionPacket

end ATailRTerminalSecondApexEqualityConsumerScratch
end Problem97
