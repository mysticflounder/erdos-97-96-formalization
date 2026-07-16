/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredFreshSuccessor

/-!
# An off-surplus anchored successor re-enters the critical-pair frontier

An off-surplus row-external source supplied by an anchored transition lies on
the same first-apex fixed class as the retained deleted point and avoids both
retained exact rows.  The six-point ambient fixed class survives deletion of
the two sources at the first apex.  The retained second-apex row avoids both
sources, so it survives the same double deletion at the second apex.

Thus the pair consisting of the retained deleted point and the new
off-surplus source is an unconditional `CriticalPairFrontier` at the original
radius.  This is a continuation theorem, not a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

namespace CoherentRCommonDeletionPacket
namespace AnchoredSourceCriticalTransition
namespace RowExternalCommonDeletionSource

/-- Repackage an off-surplus row-external source as the fresh marginal source
used by the existing first-apex double-deletion theorem. -/
def toFreshSurvivingMarginalSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hOff : X.point ∉ S.surplusCap) :
    FreshSurvivingMarginalSource A where
  point := X.point
  point_mem_marginal := Finset.mem_sdiff.mpr
    ⟨Finset.mem_filter.mpr
      ⟨X.point_mem_A, by
        simpa [dist_comm] using
          (mem_selectedClass.mp X.point_mem_fixedClass).2⟩,
      hOff⟩
  point_ne_deleted := X.point_ne_deleted
  point_not_mem_sourceRow := X.point_not_mem_sourceRow
  point_survives_secondApex := X.survives_secondApex

/-- The retained second-apex row survives deleting both the original deleted
point and an off-row external source. -/
theorem deletedExternal_secondApexDouble
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    HasNEquidistantPointsAt 4
      ((D.A.erase R.deleted).erase X.point) S.oppApex2 := by
  refine ⟨R.secondApexRow.radius,
    R.secondApexRow.radius_pos, ?_⟩
  calc
    4 = R.secondApexRow.support.card :=
      R.secondApexRow.support_card.symm
    _ ≤ (SelectedClass
        ((D.A.erase R.deleted).erase X.point)
        S.oppApex2 R.secondApexRow.radius).card :=
      Finset.card_le_card (by
        intro z hz
        have hzDouble := R.secondApexRow.support_subset_A hz
        have hzDeleted : z ≠ R.deleted :=
          (Finset.mem_erase.mp hzDouble).1
        have hzA :
            z ∈ D.A :=
          (Finset.mem_erase.mp
            (Finset.mem_erase.mp hzDouble).2).2
        exact mem_selectedClass.mpr
          ⟨Finset.mem_erase.mpr
            ⟨fun hzx =>
                X.point_not_mem_secondApexRow (hzx ▸ hz),
              Finset.mem_erase.mpr ⟨hzDeleted, hzA⟩⟩,
            R.secondApexRow.support_eq_radius z hz⟩)

/-- The retained deleted point and an off-surplus row-external source form a
new relocation packet on the original first-apex marginal. -/
noncomputable def deletedExternalRelocationPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hOff : X.point ∉ S.surplusCap) :
    SurvivorPairRelocationPacket D S radius H where
  q := R.deleted
  w := X.point
  q_mem_A := (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  w_mem_A := X.point_mem_A
  q_mem_marginal := Finset.mem_sdiff.mpr
    ⟨Finset.mem_filter.mpr
      ⟨(mem_selectedClass.mp R.deleted_mem_fixedClass).1,
        by simpa [dist_comm] using
          (mem_selectedClass.mp R.deleted_mem_fixedClass).2⟩,
      R.deleted_off_surplus⟩
  w_mem_marginal :=
    (X.toFreshSurvivingMarginalSource hOff).point_mem_marginal
  q_ne_w := X.point_ne_deleted.symm
  q_survives := R.deleted_survives_secondApex
  w_survives := X.survives_secondApex
  q_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      R.deleted_survives_secondApex
  w_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H
      X.point_mem_A X.survives_secondApex

/-- An off-surplus row-external successor unconditionally produces a new
critical-pair frontier at the original coherent radius. -/
noncomputable def deletedExternalCriticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hOff : X.point ∉ S.surplusCap) :
    CriticalPairFrontier D S radius H := by
  let Q := X.deletedExternalRelocationPacket hOff
  exact
    { pair := Q
      firstApexSplit := Or.inl (by
        simpa [Q, deletedExternalRelocationPacket,
          toFreshSurvivingMarginalSource] using
          (X.toFreshSurvivingMarginalSource hOff).deletedFresh_firstApexDouble)
      secondApexDouble := by
        simpa [Q, deletedExternalRelocationPacket] using
          X.deletedExternal_secondApexDouble
      secondApexSplit := Or.inl (by
        simpa [Q, deletedExternalRelocationPacket] using
          X.deletedExternal_secondApexDouble) }

#print axioms toFreshSurvivingMarginalSource
#print axioms deletedExternal_secondApexDouble
#print axioms deletedExternalRelocationPacket
#print axioms deletedExternalCriticalPairFrontier

end RowExternalCommonDeletionSource
end AnchoredSourceCriticalTransition
end CoherentRCommonDeletionPacket

end ATailRFullParentEntryScratch
end Problem97
