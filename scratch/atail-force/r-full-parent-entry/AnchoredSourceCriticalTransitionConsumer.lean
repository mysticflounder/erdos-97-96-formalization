/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CoherentRCommonDeletionProvenance
import CommonDeletionCriticalExpansion

/-!
# Downstream interface for the anchored coherent-R transition

The provenance-bearing source is a genuine fresh source for the generic
common-deletion expansion, but its transition is already decided: deletion is
critical at the first row center and survives at the second apex.  Thus this
packet is not another common-deletion successor and is not itself a
contradiction.

The smallest direct U5 contradiction target exposed here is also explicit.
The source row gives a dangerous triple, while the deleted point's own
critical row is an exact source-deleted class at a distinct center.  The U5
two-circle theorem therefore bounds their overlap by two.  A third common row
point is the exact missing incidence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailCriticalShellDangerousTripleScratch
open ATailContinuationBankMatchScratch
open ATailRTransitionLiveSurfaceScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

namespace CoherentRCommonDeletionPacket
namespace AnchoredSourceCriticalTransition

/-- The named source is exactly one of the fresh sources in the generic
common-deletion expansion. -/
def toFreshCriticalSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    FreshCriticalSource R.toCommonDeletionTwoCenterPacket := by
  let C := R.toCommonDeletionTwoCenterPacket
  have hrows : R.sourcePair.x ∈ C.B₁ ∪ C.B₂ := by
    exact Finset.mem_union.mpr (Or.inl A.source_mem_firstRow)
  have houtside :
      R.sourcePair.x ∉ deletedCriticalSupport C := by
    simpa [C, deletedCriticalSupport, SourceOutsideDeletedCriticalShell,
      toCommonDeletionTwoCenterPacket] using A.source_outside_deletedRow
  simpa [C] using freshCriticalSource_of_mem C hrows houtside

/-- The source's actual first center differs from the deleted point's chosen
critical center.  This is the blocker-separation content of being a fresh
expansion source. -/
theorem firstCenter_ne_deletedCriticalCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    R.firstCenter ≠ H.centerAt R.deleted
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1 := by
  simpa [firstCenter] using
    A.toFreshCriticalSource.blocker_ne_deleted_blocker

/-- The source's prescribed transition at the first center is already on the
critical arm.  No `IsM44` hypothesis is used. -/
def prescribedCriticalAtFirstCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    PrescribedCriticalAt D R.sourcePair.x R.firstCenter where
  shell := H.selectedAt R.sourcePair.x
    (mem_selectedClass.mp R.sourcePair.x_mem_class).1
  blocks := A.source_critical_at_firstCenter

/-- The prescribed first-center shell is the exact retained source row, not
an arbitrary class recovered after forgetting provenance. -/
theorem prescribedCriticalAtFirstCenter_support_eq_sourceRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    A.prescribedCriticalAtFirstCenter.shell.toCriticalFourShell.support =
      R.sourceRow.support := rfl

/-- At the anchored source, the generic prescribed transition is exactly on
the first-center critical arm. -/
theorem freshSourcePrescribedTransition_at_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    FreshSourcePrescribedTransition R.toCommonDeletionTwoCenterPacket
      A.toFreshCriticalSource := by
  exact Or.inr (Or.inl ⟨A.prescribedCriticalAtFirstCenter⟩)

/-- The anchored source is not a recursive common-deletion successor at the
same two centers. -/
theorem not_commonDeletionSuccessor_at_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    ¬ Nonempty (CommonDeletionTwoCenterPacket D H
      A.toFreshCriticalSource.point R.firstCenter S.oppApex2) := by
  simpa using R.not_nonempty_commonDeletion_at_source

/-- The retained source row supplies a dangerous triple with the named source
as deleted point and the actual first center as its dangerous center. -/
def sourceDangerousTriple
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) :
    U5DangerousTriple D R.sourcePair.x R.firstCenter
      (R.sourceRow.support.erase R.sourcePair.x) := by
  simpa [firstCenter, sourceRow] using
    ATailCriticalShellDangerousTripleScratch.dangerousTriple_of_criticalShellSystem
      D H (mem_selectedClass.mp R.sourcePair.x_mem_class).1

/-- Since the named source avoids the deleted point's selected critical row,
that row is an exact source-deleted U5 class. -/
def deletedCriticalRowSourceDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    U5QDeletedK4Class D R.sourcePair.x
      (H.centerAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1)
      (H.selectedAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support :=
  criticalFourShellToU5QDeletedK4ClassOfNotMem
    (H.selectedAt R.deleted
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell
    A.source_outside_deletedRow

/-- The banked two-circle theorem bounds the exact overlap of the retained
source row and the deleted point's critical row by two. -/
theorem deletedCriticalRow_inter_sourceRow_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    ((H.selectedAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support ∩
      R.sourceRow.support).card ≤ 2 := by
  have hbound := U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
    A.sourceDangerousTriple A.deletedCriticalRowSourceDeleted
    A.firstCenter_ne_deletedCriticalCenter.symm
  rw [Finset.insert_erase R.source_mem_sourceRow] at hbound
  exact hbound

/-- Exact additional incidence sufficient to close the anchored source: the
two already-existing critical rows share at least three points.  This is a
missing producer proposition, not a fact asserted by the coherent-R packet. -/
def ThreeCommonCriticalRowPoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) : Prop :=
  3 ≤ ((H.selectedAt R.deleted
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support ∩
    R.sourceRow.support).card

/-- A third common point is consumed directly by the banked U5 two-circle
intersection bound. -/
theorem false_of_threeCommonCriticalRowPoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R)
    (hthree : ThreeCommonCriticalRowPoints A) : False := by
  change 3 ≤ ((H.selectedAt R.deleted
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support ∩
    R.sourceRow.support).card at hthree
  have htwo := A.deletedCriticalRow_inter_sourceRow_card_le_two
  omega

#print axioms toFreshCriticalSource
#print axioms firstCenter_ne_deletedCriticalCenter
#print axioms prescribedCriticalAtFirstCenter
#print axioms prescribedCriticalAtFirstCenter_support_eq_sourceRow
#print axioms freshSourcePrescribedTransition_at_source
#print axioms not_commonDeletionSuccessor_at_source
#print axioms sourceDangerousTriple
#print axioms deletedCriticalRowSourceDeleted
#print axioms deletedCriticalRow_inter_sourceRow_card_le_two
#print axioms false_of_threeCommonCriticalRowPoints

end AnchoredSourceCriticalTransition
end CoherentRCommonDeletionPacket

end ATailRFullParentEntryScratch
end Problem97
