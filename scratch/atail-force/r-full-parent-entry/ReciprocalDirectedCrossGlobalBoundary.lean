/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import LeastTerminalHitReciprocalRowSplit

/-!
# Global continuation boundary for the reciprocal directed cross

The asymmetric terminal cross has two fixed-radius points in the deleted
source's exact critical row: the deleted point itself and the predecessor
source.  Since the row center differs from the fixed first apex, those are
the entire fixed-radius intersection, leaving exactly two off-fixed-radius
row points.

The source row meets the deleted row in at most two points and already
contains the predecessor source.  Hence at least one of the two off-fixed
points is outside the source row.  Deleting this fresh point preserves K4 at
the first center.  Global K4 at the second apex then gives the exact
branch-complete continuation:

* either deletion also survives at the second apex, producing a new
  two-center common-deletion packet; or
* deletion is critical at the second apex, and the retained double-deletion
  row is exactly that prescribed critical shell.

This is a genuine strengthening of `ReciprocalDirectedCrossResidual`, but not
yet a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailContinuationBankMatchScratch
open ATailPrescribedDeletionEdge
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

namespace CoherentRCommonDeletionPacket

/-- The actual critical row sourced by the deleted terminal endpoint. -/
def reciprocalDeletedRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    CriticalFourShell D.A R.deleted
      (H.centerAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1) :=
  (H.selectedAt R.deleted
    (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell

/-- The two points in the deleted row outside the coherent fixed first-apex
radius. -/
noncomputable def reciprocalOffFixedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) : Finset ℝ² :=
  R.reciprocalDeletedRow.support \
    SelectedClass D.A S.oppApex1 radius

namespace ReciprocalDirectedCrossResidual

/-- The fixed first-apex circle meets the deleted endpoint's critical row
exactly in the deleted endpoint and the predecessor source. -/
theorem fixedClass_inter_deletedRow_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    SelectedClass D.A S.oppApex1 radius ∩
        R.reciprocalDeletedRow.support =
      ({R.deleted, R.sourcePair.x} : Finset ℝ²) := by
  let K := R.reciprocalDeletedRow
  have hblockerNe :
      H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1 ≠
        S.oppApex1 :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      X.deleted_survives_firstApex
  have hinter :
      ((SelectedClass D.A S.oppApex1 radius) ∩ K.support).card ≤ 2 :=
    criticalFourShell_fixedClass_inter_card_le_two K hblockerNe
  have hpairSub :
      ({R.deleted, R.sourcePair.x} : Finset ℝ²) ⊆
        SelectedClass D.A S.oppApex1 radius ∩ K.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨X.deleted_mem_fixedClass, K.q_mem_support⟩
    · exact Finset.mem_inter.mpr
        ⟨X.source_mem_fixedClass, by
          simpa [K, reciprocalDeletedRow] using
            X.source_mem_deletedRow⟩
  have hinterCardLe :
      ((SelectedClass D.A S.oppApex1 radius) ∩ K.support).card ≤
        ({R.deleted, R.sourcePair.x} : Finset ℝ²).card := by
    rw [Finset.card_pair R.source_ne_deleted.symm]
    exact hinter
  have heq :
      (SelectedClass D.A S.oppApex1 radius ∩ K.support) =
        ({R.deleted, R.sourcePair.x} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hpairSub hinterCardLe).symm
  simpa [K, reciprocalDeletedRow] using heq

/-- The deleted endpoint's exact row has precisely two points outside the
fixed first-apex radius. -/
theorem offFixedResidual_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    R.reciprocalOffFixedResidual.card = 2 := by
  let K := R.reciprocalDeletedRow
  let F := SelectedClass D.A S.oppApex1 radius
  have hinterCard : (K.support ∩ F).card = 2 := by
    rw [Finset.inter_comm]
    simpa [K, F, reciprocalDeletedRow,
      Finset.card_pair R.source_ne_deleted.symm] using
      congrArg Finset.card X.fixedClass_inter_deletedRow_eq_pair
  have hsplit := Finset.card_sdiff_add_card_inter K.support F
  change R.reciprocalOffFixedResidual.card +
      (K.support ∩ F).card = K.support.card at hsplit
  rw [hinterCard, K.support_card] at hsplit
  omega

/-- At least one of the two off-fixed points in the deleted row lies outside
the predecessor source's exact row. -/
theorem exists_offFixed_not_mem_sourceRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    ∃ z ∈ R.reciprocalOffFixedResidual,
      z ∉ R.sourceRow.support := by
  by_contra hnone
  have hsub :
      R.reciprocalOffFixedResidual ⊆ R.sourceRow.support := by
    intro z hz
    by_contra hzOutside
    exact hnone ⟨z, hz, hzOutside⟩
  have hsourceDeletedRow :
      R.sourcePair.x ∈ R.reciprocalDeletedRow.support := by
    simpa [reciprocalDeletedRow] using X.source_mem_deletedRow
  have hsourceNotResidual :
      R.sourcePair.x ∉ R.reciprocalOffFixedResidual := by
    intro hsource
    exact (Finset.mem_sdiff.mp hsource).2 X.source_mem_fixedClass
  have hinsert :
      insert R.sourcePair.x R.reciprocalOffFixedResidual ⊆
        R.reciprocalDeletedRow.support ∩ R.sourceRow.support := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzResidual
    · exact Finset.mem_inter.mpr
        ⟨hsourceDeletedRow, R.source_mem_sourceRow⟩
    · exact Finset.mem_inter.mpr
        ⟨(Finset.mem_sdiff.mp hzResidual).1, hsub hzResidual⟩
  have hcardLe := Finset.card_le_card hinsert
  have hresidualCard := X.offFixedResidual_card
  have hinterLe :
      (R.reciprocalDeletedRow.support ∩ R.sourceRow.support).card ≤ 2 := by
    simpa [reciprocalDeletedRow] using X.selectedRows_inter_card_le_two
  rw [Finset.card_insert_of_notMem hsourceNotResidual,
    hresidualCard] at hcardLe
  omega

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- A prescribed second-apex deletion failure forces the retained
double-deletion row to be exactly the resulting critical shell. -/
theorem secondApexRow_eq_criticalSupport_of_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {z : ℝ²}
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2)
    (C : CriticalSelectedFourClass D.A z S.oppApex2) :
    C.toCriticalFourShell.support = R.secondApexRow.support := by
  have hzSecond : z ∈ R.secondApexRow.support := by
    by_contra hzNot
    apply hblocked
    refine ⟨R.secondApexRow.radius,
      R.secondApexRow.radius_pos, ?_⟩
    calc
      4 = R.secondApexRow.support.card :=
        R.secondApexRow.support_card.symm
      _ ≤ (SelectedClass (D.A.erase z) S.oppApex2
          R.secondApexRow.radius).card :=
        Finset.card_le_card (by
          intro w hw
          have hwDouble := R.secondApexRow.support_subset_A hw
          have hwA :=
            (Finset.mem_erase.mp (Finset.mem_erase.mp hwDouble).2).2
          exact mem_selectedClass.mpr
            ⟨Finset.mem_erase.mpr
                ⟨fun hwz ↦ hzNot (hwz ▸ hw), hwA⟩,
              R.secondApexRow.support_eq_radius w hw⟩)
  have hradii :
      C.toCriticalFourShell.radius = R.secondApexRow.radius := by
    calc
      C.toCriticalFourShell.radius =
          dist S.oppApex2 z :=
        (C.toCriticalFourShell.support_eq_radius
          z C.toCriticalFourShell.q_mem_support).symm
      _ = R.secondApexRow.radius :=
        R.secondApexRow.support_eq_radius z hzSecond
  have hsub :
      R.secondApexRow.support ⊆ C.toCriticalFourShell.support := by
    intro w hw
    rw [C.toCriticalFourShell.support_eq]
    have hwDouble := R.secondApexRow.support_subset_A hw
    have hwA :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hwDouble).2).2
    exact mem_selectedClass.mpr
      ⟨hwA, by
        rw [hradii]
        exact R.secondApexRow.support_eq_radius w hw⟩
  have hcardLe :
      C.toCriticalFourShell.support.card ≤
        R.secondApexRow.support.card := by
    rw [C.toCriticalFourShell.support_card,
      R.secondApexRow.support_card]
  exact (Finset.eq_of_subset_of_card_le hsub hcardLe).symm

/-- Omitting the fresh point preserves not just one first-center K4 witness,
but the exact and unique source row after deleting both the original deleted
endpoint and the fresh point. -/
theorem sourceRow_exact_unique_after_deleted_and_omitted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R)
    {z : ℝ²} (hzOutside : z ∉ R.sourceRow.support) :
    SelectedClass ((D.A.erase R.deleted).erase z)
        R.firstCenter R.sourceRow.radius =
      R.sourceRow.support ∧
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass ((D.A.erase R.deleted).erase z)
        R.firstCenter tau).card →
      tau = R.sourceRow.radius := by
  constructor
  · rw [selectedClass_erase_eq, X.sourceRow_exact_after_deleted,
      Finset.erase_eq_self.mpr hzOutside]
  · intro tau htau hfour
    apply X.sourceRow_unique_radius_after_deleted tau htau
    exact hfour.trans (Finset.card_le_card (by
      intro w hw
      rcases mem_selectedClass.mp hw with ⟨hwErase, hwdist⟩
      exact mem_selectedClass.mpr
        ⟨(Finset.mem_erase.mp hwErase).2, hwdist⟩))

/-- The reciprocal-cross residual always supplies a fresh retained off-fiber
point.  At the two global centers it yields either a new common-deletion
packet or an exact prescribed critical second-apex row. -/
theorem exists_fresh_commonDeletion_or_secondApexCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    ∃ z : ℝ²,
      z ∈ R.reciprocalDeletedRow.support ∧
      z ∉ SelectedClass D.A S.oppApex1 radius ∧
      z ∈ T.carrier ∧
      z ∉ R.sourceRow.support ∧
      SelectedClass ((D.A.erase R.deleted).erase z)
          R.firstCenter R.sourceRow.radius =
        R.sourceRow.support ∧
      (∀ tau : ℝ, 0 < tau →
        4 ≤ (SelectedClass ((D.A.erase R.deleted).erase z)
          R.firstCenter tau).card →
        tau = R.sourceRow.radius) ∧
      signedArea2 R.sourcePair.x S.oppApex1
          (H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1) *
        signedArea2 R.deleted S.oppApex1
          (H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1) < 0 ∧
      (Nonempty (CommonDeletionTwoCenterPacket
          D H z R.firstCenter S.oppApex2) ∨
        ∃ C : CriticalSelectedFourClass D.A z S.oppApex2,
          ¬ HasNEquidistantPointsAt 4
              (D.A.erase z) S.oppApex2 ∧
            C.toCriticalFourShell.support =
              R.secondApexRow.support) := by
  rcases X.exists_offFixed_not_mem_sourceRow with
    ⟨z, hzResidual, hzOutsideSource⟩
  have hzDeletedRow :=
    (Finset.mem_sdiff.mp hzResidual).1
  have hzNotFixed :=
    (Finset.mem_sdiff.mp hzResidual).2
  have hzA : z ∈ D.A :=
    R.reciprocalDeletedRow.support_subset_A hzDeletedRow
  have hzCarrier : z ∈ T.carrier :=
    T.mem_carrier_of_not_mem_fixedClass hzA hzNotFixed
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase z) R.firstCenter :=
    deletion_survives_of_not_mem_selected_support
      R.sourceRow.toSelectedFourClass hzOutsideSource
  have hsourceRowExactUnique :=
    X.sourceRow_exact_unique_after_deleted_and_omitted
      hzOutsideSource
  rcases erase_survives_or_criticalSelectedFourClass_at
      D.K4 (oppApex2_mem_A S) with
    hsurvivesSecond | ⟨C, hblocked⟩
  · refine ⟨z, hzDeletedRow, hzNotFixed, hzCarrier,
      hzOutsideSource, hsourceRowExactUnique.1,
      hsourceRowExactUnique.2,
      X.directedCross_signedArea_product_neg, Or.inl ?_⟩
    exact nonempty_commonDeletionTwoCenterPacket H
      hzA R.firstCenter_mem_A (oppApex2_mem_A S)
      R.firstCenter_ne_oppApex2 hsurvivesFirst hsurvivesSecond
  · refine ⟨z, hzDeletedRow, hzNotFixed, hzCarrier,
      hzOutsideSource, hsourceRowExactUnique.1,
      hsourceRowExactUnique.2,
      X.directedCross_signedArea_product_neg,
      Or.inr ⟨C, hblocked, ?_⟩⟩
    exact secondApexRow_eq_criticalSupport_of_blocked
      (R := R) hblocked C

#print axioms fixedClass_inter_deletedRow_eq_pair
#print axioms offFixedResidual_card
#print axioms exists_offFixed_not_mem_sourceRow
#print axioms secondApexRow_eq_criticalSupport_of_blocked
#print axioms sourceRow_exact_unique_after_deleted_and_omitted
#print axioms exists_fresh_commonDeletion_or_secondApexCritical

end ReciprocalDirectedCrossResidual
end CoherentRCommonDeletionPacket

end ATailRFullParentEntryScratch
end Problem97
