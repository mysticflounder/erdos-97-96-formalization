/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCommonDeletionIntegration
import ActualBlockerOmissionAdapter
import PrescribedDeletionEdge
import StrictOppCapCrossClassifier

/-!
# Provenance-preserving common deletion on the coherent R arm

The generic `CommonDeletionTwoCenterPacket` forgets why its deleted point and
two centers were selected.  On the coherent fixed-radius R arm substantially
more survives:

* a named erased source and the deleted point lie on the same fixed circle
  about the first opposite apex and both avoid the surplus cap;
* at least one of those two points lies in strict `oppCap1`;
* the first center is the source's actual blocker, whose exact critical row
  contains the source and omits the deleted point;
* deletion of the source is critical at that first center;
* an exact second-apex row survives deleting both the source and the deleted
  point; and
* the source is either the predecessor of the least terminal hit or the first
  vertex of the minimal blocker cycle.

This file retains those facts in one packet and only then forgets them to the
older common-deletion interface.  The exact antecedent needed to anchor the
generic critical expansion is also isolated: the named source must lie
outside the deleted point's own selected critical shell.  Under that one
cross-incidence fact, the named source is a fresh expansion source whose
transition is forced into the first-center critical arm, not another generic
common-deletion packet.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailPrescribedDeletionEdge
open ATailRActualBlockerTransitionScratch
open ATailRTransitionLiveSurfaceScratch
open ATailSubcarrierTerminalInvariantScratch
open ATailStrictOppCapCrossClassifierScratch

attribute [local instance] Classical.propDecidable

private theorem equidistant_mono_provenance
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, le_trans hcard (Finset.card_le_card (by
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
    exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩))⟩

private theorem nonempty_selectedFourClass_of_hasNEquidistantPointsAt
    {A : Finset ℝ²} {center : ℝ²}
    (h : HasNEquidistantPointsAt 4 A center) :
    Nonempty (SelectedFourClass A center) := by
  classical
  rcases h with ⟨r, hr, hcard⟩
  let C := A.filter fun z ↦ dist center z = r
  rcases Finset.exists_subset_card_eq (s := C) hcard with
    ⟨B, hBC, hBcard⟩
  exact ⟨
    { support := B
      support_subset_A := by
        intro z hz
        exact (Finset.mem_filter.mp (hBC hz)).1
      support_card := hBcard
      radius := r
      radius_pos := hr
      support_eq_radius := by
        intro z hz
        exact (Finset.mem_filter.mp (hBC hz)).2
      center_not_mem := by
        intro hcenter
        have hdist := (Finset.mem_filter.mp (hBC hcenter)).2
        rw [dist_self] at hdist
        linarith }⟩

private theorem selectedFourClass_hasNEquidistantPointsAt
    {A : Finset ℝ²} {center : ℝ²}
    (R : SelectedFourClass A center) :
    HasNEquidistantPointsAt 4 A center := by
  refine ⟨R.radius, R.radius_pos, ?_⟩
  calc
    4 = R.support.card := R.support_card.symm
    _ ≤ (A.filter fun z ↦ dist center z = R.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨R.support_subset_A hz, R.support_eq_radius z hz⟩)

private theorem oppApex2_mem_A_provenance
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Two distinct off-surplus points on one first-apex circle cannot both be
the exceptional `oppCap2` hit.  Hence one lies in strict `oppCap1`. -/
theorem one_of_two_fixed_offSurplus_mem_strictOppCap1
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (radius : ℝ) {x y : ℝ²}
    (hxClass : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hyClass : y ∈ SelectedClass D.A S.oppApex1 radius)
    (hxOff : x ∉ S.surplusCap) (hyOff : y ∉ S.surplusCap)
    (hxy : x ≠ y) :
    x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      y ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  by_cases hxOpp2 : x ∈ S.oppCap2
  · right
    have hyNotOpp2 : y ∉ S.oppCap2 := by
      intro hyOpp2
      let DS : CounterexampleData :=
        { A := D.A
          nonempty := D.nonempty
          convex := D.convex
          K4 := D.K4
          packet := S }
      have hone := U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS radius
      rw [Finset.card_le_one] at hone
      have hxInter :
          x ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) ∩
            S.oppCap2 :=
        Finset.mem_inter.mpr
          ⟨Finset.mem_filter.mpr
            ⟨(mem_selectedClass.mp hxClass).1, by
              simpa [dist_comm] using (mem_selectedClass.mp hxClass).2⟩,
            hxOpp2⟩
      have hyInter :
          y ∈ (D.A.filter fun z ↦ dist z S.oppApex1 = radius) ∩
            S.oppCap2 :=
        Finset.mem_inter.mpr
          ⟨Finset.mem_filter.mpr
            ⟨(mem_selectedClass.mp hyClass).1, by
              simpa [dist_comm] using (mem_selectedClass.mp hyClass).2⟩,
            hyOpp2⟩
      exact hxy (hone x (by simpa [DS] using hxInter)
        y (by simpa [DS] using hyInter))
    exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps S
      (mem_selectedClass.mp hyClass).1 hyOff hyNotOpp2
  · left
    exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps S
      (mem_selectedClass.mp hxClass).1 hxOff hxOpp2

/-- The common deletion together with the source/radius/row provenance that
the generic two-center packet forgets. -/
structure CoherentRCommonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho)
    (H : CriticalShellSystem D.A) : Type where
  sourcePair : AmbientRobustHistoryPair D S T.carrier radius
  deleted : ℝ²
  deleted_mem_fixedClass :
    deleted ∈ SelectedClass D.A S.oppApex1 radius
  deleted_off_surplus : deleted ∉ S.surplusCap
  source_ne_deleted : sourcePair.x ≠ deleted
  source_or_deleted_mem_strictOppCap1 :
    sourcePair.x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  deleted_not_mem_sourceRow :
    deleted ∉
      (H.selectedAt sourcePair.x
        (mem_selectedClass.mp sourcePair.x_mem_class).1).toCriticalFourShell.support
  secondApexRow :
    SelectedFourClass
      ((D.A.erase sourcePair.x).erase deleted) S.oppApex2
  firstCenter_terminal_or_self :
    H.centerAt sourcePair.x
        (mem_selectedClass.mp sourcePair.x_mem_class).1 ∈ T.carrier ∨
      H.centerAt sourcePair.x
        (mem_selectedClass.mp sourcePair.x_mem_class).1 = deleted
  provenance :
    (∃ K : LeastPositiveTerminalHitPredecessor P H,
      sourcePair.x = K.predecessorPair.x ∧ deleted ∈ T.carrier) ∨
    (∃ K : SourceExactMinimalActualBlockerCycle P H,
      sourcePair.x =
          (K.source
            ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩).1 ∧
        deleted = (K.source ⟨1, K.two_le_period⟩).1)

namespace CoherentRCommonDeletionPacket

def firstCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) : ℝ² :=
  H.centerAt R.sourcePair.x
    (mem_selectedClass.mp R.sourcePair.x_mem_class).1

def sourceRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    CriticalFourShell D.A R.sourcePair.x R.firstCenter :=
  (H.selectedAt R.sourcePair.x
    (mem_selectedClass.mp R.sourcePair.x_mem_class).1).toCriticalFourShell

theorem source_mem_fixedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    R.sourcePair.x ∈ SelectedClass D.A S.oppApex1 radius :=
  (T.pair_endpoints_mem_fixedClass R.sourcePair).1

theorem source_mem_sourceRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    R.sourcePair.x ∈ R.sourceRow.support :=
  R.sourceRow.q_mem_support

/-- The named coherent source is an actual endpoint of the selected critical
shell at its actual blocker, not merely a point satisfying a cap-order
predicate. -/
theorem source_eq_sourceRow_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    dist R.firstCenter R.sourcePair.x = R.sourceRow.radius :=
  R.sourceRow.support_eq_radius _ R.source_mem_sourceRow

/-- The deleted point is genuinely outside the selected source row.  Since
that row is the full positive-radius class at the first center, it cannot lie
at the row radius. -/
theorem deleted_ne_sourceRow_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    dist R.firstCenter R.deleted ≠ R.sourceRow.radius := by
  intro hdist
  exact R.deleted_not_mem_sourceRow
    (R.sourceRow.off_row_named_label_forbidden
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1 hdist)

/-- Both named points retain the coherent fixed first-apex radius. -/
theorem source_deleted_eq_firstApex_distance
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    dist S.oppApex1 R.sourcePair.x =
      dist S.oppApex1 R.deleted := by
  exact (mem_selectedClass.mp R.source_mem_fixedClass).2.trans
    (mem_selectedClass.mp R.deleted_mem_fixedClass).2.symm

theorem firstCenter_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) : R.firstCenter ∈ D.A :=
  (Finset.mem_erase.mp R.sourceRow.center_mem).2

theorem firstCenter_ne_oppApex1
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    R.firstCenter ≠ S.oppApex1 :=
  AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 R.sourcePair H

theorem firstCenter_ne_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    R.firstCenter ≠ S.oppApex2 :=
  AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 R.sourcePair H

theorem source_deletion_critical_at_firstCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) R.firstCenter :=
  H.no_qfree_at R.sourcePair.x
    (mem_selectedClass.mp R.sourcePair.x_mem_class).1

theorem source_survives_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) S.oppApex2 := by
  apply equidistant_mono_provenance
    (h := selectedFourClass_hasNEquidistantPointsAt R.secondApexRow)
  intro z hz
  exact (Finset.mem_erase.mp hz).2

theorem deleted_survives_firstCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    HasNEquidistantPointsAt 4 (D.A.erase R.deleted) R.firstCenter :=
  deletion_survives_of_not_mem_selected_support
    R.sourceRow.toSelectedFourClass R.deleted_not_mem_sourceRow

theorem deleted_survives_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    HasNEquidistantPointsAt 4 (D.A.erase R.deleted) S.oppApex2 := by
  apply equidistant_mono_provenance
    (h := selectedFourClass_hasNEquidistantPointsAt R.secondApexRow)
  intro z hz
  rcases Finset.mem_erase.mp hz with ⟨hzDeleted, hzEraseSource⟩
  exact Finset.mem_erase.mpr
    ⟨hzDeleted, (Finset.mem_erase.mp hzEraseSource).2⟩

def sourceRowQDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    U5QDeletedK4Class D R.deleted R.firstCenter R.sourceRow.support :=
  criticalFourShellToU5QDeletedK4ClassOfNotMem
    R.sourceRow R.deleted_not_mem_sourceRow

def secondApexRowQDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    U5QDeletedK4Class D R.deleted S.oppApex2
      R.secondApexRow.support where
  subset := by
    intro z hz
    have hzDouble := R.secondApexRow.support_subset_A hz
    rcases Finset.mem_erase.mp hzDouble with ⟨hzDeleted, hzEraseSource⟩
    have hzA := (Finset.mem_erase.mp hzEraseSource).2
    change z ∈ (D.A.erase R.deleted).erase S.oppApex2
    exact Finset.mem_erase.mpr
      ⟨fun h ↦ R.secondApexRow.center_not_mem (h ▸ hz),
        Finset.mem_erase.mpr ⟨hzDeleted, hzA⟩⟩
  card_four := by rw [R.secondApexRow.support_card]
  q_not_mem := by
    intro hdeleted
    exact (Finset.mem_erase.mp
      (R.secondApexRow.support_subset_A hdeleted)).1 rfl
  radius := R.secondApexRow.radius
  radius_pos := R.secondApexRow.radius_pos
  same_radius := R.secondApexRow.support_eq_radius

/-- Forget provenance only after fixing the first row to be the source's
actual critical shell and the second row to avoid both named points. -/
noncomputable def toCommonDeletionTwoCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    CommonDeletionTwoCenterPacket
      D H R.deleted R.firstCenter S.oppApex2 where
  q_mem_A := (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  center₁_mem_A := R.firstCenter_mem_A
  center₂_mem_A := oppApex2_mem_A_provenance S
  centers_ne := R.firstCenter_ne_oppApex2
  survives₁ := R.deleted_survives_firstCenter
  survives₂ := R.deleted_survives_secondApex
  actual_blocker_ne_center₁ :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      R.deleted_survives_firstCenter
  actual_blocker_ne_center₂ :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      R.deleted_survives_secondApex
  B₁ := R.sourceRow.support
  B₂ := R.secondApexRow.support
  row₁ := R.sourceRowQDeleted
  row₂ := R.secondApexRowQDeleted
  B₁_card := R.sourceRow.support_card
  B₂_card := R.secondApexRow.support_card
  overlap_le_two :=
    U5QDeletedK4Class.inter_card_le_two
      R.sourceRowQDeleted R.secondApexRowQDeleted
      R.firstCenter_ne_oppApex2

theorem source_not_mem_secondApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    R.sourcePair.x ∉ R.secondApexRow.support := by
  intro hsource
  have hdouble := R.secondApexRow.support_subset_A hsource
  exact (Finset.mem_erase.mp
    (Finset.mem_erase.mp hdouble).2).1 rfl

/-- The first missing cross-incidence fact, stated without generic recursion
terminology: the named predecessor/cycle source avoids the deleted point's
chosen exact critical shell. -/
def SourceOutsideDeletedCriticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) : Prop :=
  R.sourcePair.x ∉
    (H.selectedAt R.deleted
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support

/-- The exact provenance-bearing alternative to a recursive common-deletion
step.  Membership in the first row and avoidance of the deleted source's row
make the original source eligible as a fresh expansion source; its actual
blocker provenance forces deletion-criticality at the first center, while the
double-deleted second row retains survival at the second center. -/
structure AnchoredSourceCriticalTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) : Type where
  source_mem_firstRow : R.sourcePair.x ∈ R.sourceRow.support
  source_outside_deletedRow : R.SourceOutsideDeletedCriticalShell
  source_critical_at_firstCenter :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) R.firstCenter
  source_survives_secondApex :
    HasNEquidistantPointsAt 4
      (D.A.erase R.sourcePair.x) S.oppApex2

/-- The sole missing input for the anchored transition is the named source's
nonmembership in the deleted point's own exact critical shell. -/
theorem anchoredSourceCriticalTransition_of_sourceOutsideDeletedCriticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H)
    (houtside : R.SourceOutsideDeletedCriticalShell) :
    Nonempty (AnchoredSourceCriticalTransition R) :=
  ⟨
    { source_mem_firstRow := R.source_mem_sourceRow
      source_outside_deletedRow := houtside
      source_critical_at_firstCenter :=
        R.source_deletion_critical_at_firstCenter
      source_survives_secondApex := R.source_survives_secondApex }⟩

/-- In particular, the provenance-bearing source itself can never be the next
generic common deletion at the same two centers: deletion is already known to
destroy K4 at its first center. -/
theorem not_nonempty_commonDeletion_at_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    ¬ Nonempty (CommonDeletionTwoCenterPacket
      D H R.sourcePair.x R.firstCenter S.oppApex2) := by
  rintro ⟨C⟩
  exact R.source_deletion_critical_at_firstCenter C.survives₁

end CoherentRCommonDeletionPacket

private theorem nonempty_coherentPacket_of_terminalEndpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H)
    (Q : AmbientRobustHistoryPair D S T.carrier radius)
    (hQpredecessor : Q.x = K.predecessorPair.x)
    {deleted other : ℝ²}
    (hdeleted : deleted ∈
      (T.carrier.filter fun z ↦ dist z S.oppApex1 = radius) \
        S.surplusCap)
    (hdeletedOmitted : deleted ∉
      (H.selectedAt Q.x
        (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell.support)
    (hsecond : HasNEquidistantPointsAt 4
      ((T.carrier.erase deleted).erase other) S.oppApex2) :
    Nonempty (CoherentRCommonDeletionPacket T P H) := by
  have hdeletedCarrier : deleted ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hdeleted).1).1
  have hdeletedA : deleted ∈ D.A := T.carrier_subset hdeletedCarrier
  have hdeletedClass :
      deleted ∈ SelectedClass D.A S.oppApex1 radius := by
    exact mem_selectedClass.mpr
      ⟨hdeletedA, by
        simpa [dist_comm] using
          (Finset.mem_filter.mp (Finset.mem_sdiff.mp hdeleted).1).2⟩
  have hdeletedOff : deleted ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp hdeleted).2
  have hsourceNeDeleted : Q.x ≠ deleted := by
    intro h
    exact (Finset.mem_sdiff.mp Q.x_mem_erased).2
      (by simpa [h] using hdeletedCarrier)
  have hsourceClass :=
    (T.pair_endpoints_mem_fixedClass Q).1
  have hstrict := one_of_two_fixed_offSurplus_mem_strictOppCap1
    D S radius hsourceClass hdeletedClass Q.x_off_surplus
      hdeletedOff hsourceNeDeleted
  have hsecondDouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase Q.x).erase deleted) S.oppApex2 := by
    apply equidistant_mono_provenance (h := hsecond)
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨_zOther, hzEraseDeleted⟩
    rcases Finset.mem_erase.mp hzEraseDeleted with
      ⟨hzDeleted, hzCarrier⟩
    have hzSource : z ≠ Q.x := by
      intro h
      exact (Finset.mem_sdiff.mp Q.x_mem_erased).2
        (by simpa [h] using hzCarrier)
    exact Finset.mem_erase.mpr
      ⟨hzDeleted,
        Finset.mem_erase.mpr ⟨hzSource, T.carrier_subset hzCarrier⟩⟩
  rcases nonempty_selectedFourClass_of_hasNEquidistantPointsAt
      hsecondDouble with ⟨secondRow⟩
  have hcenterTerminal :
      H.centerAt Q.x
        (mem_selectedClass.mp Q.x_mem_class).1 ∈ T.carrier := by
    simpa [hQpredecessor] using K.predecessor_blocker_mem_terminal
  exact ⟨
    { sourcePair := Q
      deleted := deleted
      deleted_mem_fixedClass := hdeletedClass
      deleted_off_surplus := hdeletedOff
      source_ne_deleted := hsourceNeDeleted
      source_or_deleted_mem_strictOppCap1 := hstrict
      deleted_not_mem_sourceRow := hdeletedOmitted
      secondApexRow := secondRow
      firstCenter_terminal_or_self := Or.inl hcenterTerminal
      provenance := Or.inl ⟨K, hQpredecessor, hdeletedCarrier⟩ }⟩

/-- Terminal-hit producer with all coherent-radius and row provenance
retained. -/
theorem LeastPositiveTerminalHitPredecessor.nonempty_coherentRCommonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H) :
    Nonempty (CoherentRCommonDeletionPacket T P H) := by
  rcases exists_ambientRobustHistoryPair_with_source_of_erased
      D S T.history K.predecessor_mem_erased with
    ⟨predecessorRadius, Q, hQsource⟩
  have hQradius : predecessorRadius = radius :=
    T.pair_radius_eq_fixed Q
  subst predecessorRadius
  have hQpredecessor : Q.x = K.predecessorPair.x :=
    hQsource.trans K.predecessor_source_eq.symm
  let sourceRow :=
    (H.selectedAt Q.x
      (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell
  rcases T.terminal with
    ⟨q, w, _hradius, hq, hw, hqw, _hcard, hsecond⟩
  have hqCarrier : q ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).1
  have hwCarrier : w ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hw).1).1
  have hqA : q ∈ D.A := T.carrier_subset hqCarrier
  have hwA : w ∈ D.A := T.carrier_subset hwCarrier
  have hqClass : q ∈ SelectedClass D.A S.oppApex1 radius :=
    mem_selectedClass.mpr
      ⟨hqA, by
        simpa [dist_comm] using
          (Finset.mem_filter.mp (Finset.mem_sdiff.mp hq).1).2⟩
  have hwClass : w ∈ SelectedClass D.A S.oppApex1 radius :=
    mem_selectedClass.mpr
      ⟨hwA, by
        simpa [dist_comm] using
          (Finset.mem_filter.mp (Finset.mem_sdiff.mp hw).1).2⟩
  have hsourceClass := (T.pair_endpoints_mem_fixedClass Q).1
  have hsourceNotCarrier : Q.x ∉ T.carrier :=
    (Finset.mem_sdiff.mp Q.x_mem_erased).2
  have hsourceNeQ : Q.x ≠ q := by
    intro h
    exact hsourceNotCarrier (by simpa [h] using hqCarrier)
  have hsourceNeW : Q.x ≠ w := by
    intro h
    exact hsourceNotCarrier (by simpa [h] using hwCarrier)
  have hcenterNeFirst :
      H.centerAt Q.x (mem_selectedClass.mp Q.x_mem_class).1 ≠
        S.oppApex1 :=
    AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 Q H
  have hinter :
      ((SelectedClass D.A S.oppApex1 radius) ∩
        sourceRow.support).card ≤ 2 := by
    exact criticalFourShell_fixedClass_inter_card_le_two
      sourceRow hcenterNeFirst
  have hsourceRow : Q.x ∈ sourceRow.support :=
    sourceRow.q_mem_support
  have hq_or_hw_omitted : q ∉ sourceRow.support ∨
      w ∉ sourceRow.support := by
    by_cases hqRow : q ∈ sourceRow.support
    · right
      intro hwRow
      have hsourceInter : Q.x ∈
          (SelectedClass D.A S.oppApex1 radius) ∩ sourceRow.support :=
        Finset.mem_inter.mpr ⟨hsourceClass, hsourceRow⟩
      have hqInter : q ∈
          (SelectedClass D.A S.oppApex1 radius) ∩ sourceRow.support :=
        Finset.mem_inter.mpr ⟨hqClass, hqRow⟩
      have hwInter : w ∈
          (SelectedClass D.A S.oppApex1 radius) ∩ sourceRow.support :=
        Finset.mem_inter.mpr ⟨hwClass, hwRow⟩
      have hthree :
          2 < ((SelectedClass D.A S.oppApex1 radius) ∩
            sourceRow.support).card := by
        rw [Finset.two_lt_card]
        exact ⟨Q.x, hsourceInter, q, hqInter, w, hwInter,
          hsourceNeQ, hsourceNeW, hqw⟩
      omega
    · exact Or.inl hqRow
  rcases hq_or_hw_omitted with hqOmitted | hwOmitted
  · exact nonempty_coherentPacket_of_terminalEndpoint
      (other := w) K Q hQpredecessor hq hqOmitted hsecond
  · apply nonempty_coherentPacket_of_terminalEndpoint
      (other := q) K Q hQpredecessor hw hwOmitted
    simpa [Finset.erase_right_comm] using hsecond

/-- Minimal-cycle producer with the same provenance packet. -/
theorem SourceExactMinimalActualBlockerCycle.nonempty_coherentRCommonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    Nonempty (CoherentRCommonDeletionPacket T P H) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_fixedRadius_successorMate_omission
        K with
    ⟨Q, hsource, hdeleted, hdeletedCenter, homission⟩
  have hdeletedOmitted :
      Q.y ∉
        (H.selectedAt Q.x
          (mem_selectedClass.mp Q.x_mem_class).1).toCriticalFourShell.support := by
    exact homission.1
  rcases nonempty_selectedFourClass_of_hasNEquidistantPointsAt
      Q.second_double with ⟨secondRow⟩
  exact ⟨
    { sourcePair := Q
      deleted := Q.y
      deleted_mem_fixedClass :=
        (T.pair_endpoints_mem_fixedClass Q).2
      deleted_off_surplus := Q.y_off_surplus
      source_ne_deleted := Q.x_ne_y
      source_or_deleted_mem_strictOppCap1 := Q.strict_endpoint
      deleted_not_mem_sourceRow := hdeletedOmitted
      secondApexRow := secondRow
      firstCenter_terminal_or_self := Or.inr hdeletedCenter.symm
      provenance := Or.inr ⟨K, hsource, hdeleted⟩ }⟩

/-- Uniform classifier over both source-exact orbit outcomes. -/
theorem AmbientRobustHistoryPair.nonempty_coherentRCommonDeletionPacket_of_orbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho)
    (H : CriticalShellSystem D.A)
    (horbit :
      (∃ n : ℕ,
        ((H.blockerVertex^[n])
          (actualBlockerStartVertex P)).1 ∈ T.carrier) ∨
        Nonempty (SourceExactMinimalActualBlockerCycle P H)) :
    Nonempty (CoherentRCommonDeletionPacket T P H) := by
  rcases horbit with hhit | hcycle
  · rcases
        Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
          P H T.history hhit with
      ⟨K⟩
    exact
      Problem97.ATailRFullParentEntryScratch.LeastPositiveTerminalHitPredecessor.nonempty_coherentRCommonDeletionPacket
        K
  · rcases hcycle with ⟨K⟩
    exact
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.nonempty_coherentRCommonDeletionPacket
        K

#print axioms one_of_two_fixed_offSurplus_mem_strictOppCap1
#print axioms CoherentRCommonDeletionPacket.source_eq_sourceRow_radius
#print axioms CoherentRCommonDeletionPacket.deleted_ne_sourceRow_radius
#print axioms CoherentRCommonDeletionPacket.source_deleted_eq_firstApex_distance
#print axioms CoherentRCommonDeletionPacket.toCommonDeletionTwoCenterPacket
#print axioms CoherentRCommonDeletionPacket.anchoredSourceCriticalTransition_of_sourceOutsideDeletedCriticalShell
#print axioms CoherentRCommonDeletionPacket.not_nonempty_commonDeletion_at_source
#print axioms LeastPositiveTerminalHitPredecessor.nonempty_coherentRCommonDeletionPacket
#print axioms SourceExactMinimalActualBlockerCycle.nonempty_coherentRCommonDeletionPacket
#print axioms AmbientRobustHistoryPair.nonempty_coherentRCommonDeletionPacket_of_orbit

end ATailRFullParentEntryScratch
end Problem97
