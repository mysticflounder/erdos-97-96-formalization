/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveSourceDichotomy
import scratch.ExactFourRigid221SourceEqUVRowOtherSourceSurvivalKalmanson

/-!
# The exact-five first-hit/bad residual

When neither named companion is a good source, the exact-five `u`-heavy source
dichotomy forces the companions to split between the unique first-apex-class
hit and the unique source bad for both source-valid deletions.  This file keeps
that exhaustive split together with the forced Kalmanson inequality and the
full source-survival packet.

The resulting data do not by themselves give `False`: badness belongs to the
other companion, whereas the surviving deletion belongs to the original
source `u`.  The final theorem records the exact missing metric condition.  A
weak reverse inequality closes the residual immediately.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem firstApexSource_interiorPair_mem_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : CarrierVertex D.A}
    (hfirst : source.1 ∈ SelectedClass D.A S.oppApex1 radius) :
    R.interior_q ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      R.interior_w ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support := by
  rw [lateFirstApexSystem_support_eq_class R source.2 hfirst]
  exact
    ⟨(Finset.mem_inter.mp R.interior_q_mem).1,
      (Finset.mem_inter.mp R.interior_w_mem).1⟩

private theorem badOutsideSource_interiorPair_mem_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : CarrierVertex D.A}
    (hbad : source ∈ interiorPairBadOutsideSources R) :
    R.interior_q ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      R.interior_w ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support := by
  have hfailures := (Finset.mem_filter.mp hbad).2
  constructor
  · by_contra hqOmitted
    exact hfailures.1
      ((cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mpr hqOmitted)
  · by_contra hwOmitted
    exact hfailures.2
      ((cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mpr hwOmitted)

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

/-- Every outside source that is bad for both source-valid interior-pair
deletions forces the first opposite cap to have at least five points.  Its
actual blocker is distinct from the first apex and from both members of the
interior pair, so those three points lie in the strict first-cap interior. -/
theorem firstOppCap_card_ge_five_of_interiorPairBadOutsideSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : CarrierVertex D.A}
    (hbad : source ∈ interiorPairBadOutsideSources R) :
    5 ≤ S.oppCap1.card := by
  let Hlate := lateFirstApexSystem R
  let K := (Hlate.selectedAt source.1 source.2).toCriticalFourShell
  let c := Hlate.centerAt source.1 source.2
  have hpair :=
    badOutsideSource_interiorPair_mem_support (R := R) hbad
  have hcA : c ∈ D.A := by
    exact
      (Finset.mem_erase.mp
        (Hlate.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
  have houtside : source ∈ outsideFirstApexFiber R :=
    (Finset.mem_filter.mp hbad).1
  have hcNeApex : c ≠ S.oppApex1 := by
    intro hcenter
    have hsourceFiber :
        source ∈ actualBlockerFiber Hlate
          ⟨F.pair.q, F.pair.q_mem_A⟩ := by
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_univ _, Subtype.ext ?_⟩
      simpa only [CriticalShellSystem.blockerVertex, hcenter, c, Hlate] using
        (lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A
          (frontier_pair_q_mem_firstApexClass F)).symm
    exact (Finset.mem_sdiff.mp houtside).2 hsourceFiber
  have hdist :
      dist c R.interior_q = dist c R.interior_w :=
    (K.support_eq_radius R.interior_q hpair.1).trans
      (K.support_eq_radius R.interior_w hpair.2).symm
  have hcInterior :
      c ∈ S.capInteriorByIndex S.oppIndex1 :=
    R.bisector_center_mem_interior c hcA hcNeApex hdist
  have hcNeQ : c ≠ R.interior_q := by
    intro hcq
    apply K.center_not_mem_support
    simpa [K, c, Hlate, hcq] using hpair.1
  have hcNeW : c ≠ R.interior_w := by
    intro hcw
    apply K.center_not_mem_support
    simpa [K, c, Hlate, hcw] using hpair.2
  have hthreeSub :
      ({c, R.interior_q, R.interior_w} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact hcInterior
    · exact (Finset.mem_inter.mp R.interior_q_mem).2
    · exact (Finset.mem_inter.mp R.interior_w_mem).2
  have hthreeCard :
      ({c, R.interior_q, R.interior_w} : Finset ℝ²).card = 3 := by
    simp [hcNeQ, hcNeW, R.interior_q_ne_w]
  have hinteriorThree :
      3 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    have hle := Finset.card_le_card hthreeSub
    simpa [hthreeCard] using hle
  have hcap :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex1
  have hindexed : 5 ≤ (S.capByIndex S.oppIndex1).card := by
    omega
  simpa only [capByIndex_oppIndex1_eq_oppCap1] using hindexed

/-- If neither `xu` nor `xv` is a good source, then they split exhaustively
between the first-apex class and the bad-source filter.  The result also
retains the resulting common pair in both selected rows, the strict Kalmanson
inequality, the checked blocker cycle, the exact physical-class deletion
counts, and the complete source-survival residual. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_firstHitBadResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (no_named_good_source :
      ∀ source : CarrierVertex D.A,
        (source.1 = xu ∨ source.1 = xv) →
        ¬ (source ∈ outsideFirstApexFiber R ∧
          (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt source.1 source.2)))) :
    ∃ xuSource xvSource : CarrierVertex D.A,
      xuSource.1 = xu ∧
      xvSource.1 = xv ∧
      xuSource ≠ P.source ∧
      xvSource ≠ P.source ∧
      xuSource ≠ xvSource ∧
      xuSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      xvSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      xuSource.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      xvSource.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      ((xuSource.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
          xvSource ∈ interiorPairBadOutsideSources R ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support) ∨
        (xvSource.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
          xuSource ∈ interiorPairBadOutsideSources R ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support)) ∧
      dist P.source.1 P.other.1 < dist P.source.1 xu ∧
      P.other.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∧
      P.other.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.other.1 P.other.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠
        (lateFirstApexSystem R).centerAt P.other.1 P.other.2 ∧
      P.globalDeletion.deleted.card = 2 ∧
      (SelectedClass
        (D.A \ P.globalDeletion.deleted)
        S.oppApex2 P.rho).card = 3 ∧
      (∀ s ∈ P.globalDeletion.deleted,
        (SelectedClass
          (D.A \ P.globalDeletion.deleted.erase s)
          S.oppApex2 P.rho).card = 4) ∧
      ExactFourRigid221SourceEqUVRowOtherSourceSurvivalKalmansonResidual P := by
  obtain
    ⟨xuSource, xvSource, hxu, hxv, hxuNeSource, hxvNeSource,
      hxuNeXv, hxuClass, hxvClass, hxuInterior, hxvInterior, hcases⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_sourceDichotomy
      P xu xv terminal blocker_eq pair_interior blocker_interior
  have hxuNotGood :
      ¬ (xuSource ∈ outsideFirstApexFiber R ∧
        (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt xuSource.1 xuSource.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt xuSource.1 xuSource.2))) :=
    no_named_good_source xuSource (Or.inl hxu)
  have hxvNotGood :
      ¬ (xvSource ∈ outsideFirstApexFiber R ∧
        (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt xvSource.1 xvSource.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt xvSource.1 xvSource.2))) :=
    no_named_good_source xvSource (Or.inr hxv)
  have hcross :
      (xuSource.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
          xvSource ∈ interiorPairBadOutsideSources R ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support) ∨
        (xvSource.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
          xuSource ∈ interiorPairBadOutsideSources R ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xvSource.1 xvSource.2).toCriticalFourShell.support ∧
          R.interior_q ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support ∧
          R.interior_w ∈
            ((lateFirstApexSystem R).selectedAt
              xuSource.1 xuSource.2).toCriticalFourShell.support) := by
    rcases hcases with hxuGood | hxvGood | hxuFirstXvBad | hxvFirstXuBad
    · exact False.elim (hxuNotGood hxuGood)
    · exact False.elim (hxvNotGood hxvGood)
    · have hxuPair :=
        firstApexSource_interiorPair_mem_support (R := R) hxuFirstXvBad.1
      have hxvPair :=
        badOutsideSource_interiorPair_mem_support (R := R) hxuFirstXvBad.2
      exact
        Or.inl
          ⟨hxuFirstXvBad.1, hxuFirstXvBad.2,
            hxuPair.1, hxuPair.2, hxvPair.1, hxvPair.2⟩
    · have hxvPair :=
        firstApexSource_interiorPair_mem_support (R := R) hxvFirstXuBad.1
      have hxuPair :=
        badOutsideSource_interiorPair_mem_support (R := R) hxvFirstXuBad.2
      exact
        Or.inr
          ⟨hxvFirstXuBad.1, hxvFirstXuBad.2,
            hxvPair.1, hxvPair.2, hxuPair.1, hxuPair.2⟩
  have hkalmanson :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_kalmanson
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three
  have hsurvival :=
    exactFourRigid221_sourceEqU_blockerVRowOther_sourceSurvivalKalmansonResidual
      P hblockerVRow hblockerNeV
  exact
    ⟨xuSource, xvSource, hxu, hxv, hxuNeSource, hxvNeSource,
      hxuNeXv, hxuClass, hxvClass, hxuInterior, hxvInterior, hcross,
      hkalmanson.1, hkalmanson.2.1, hkalmanson.2.2.1,
      hkalmanson.2.2.2.1, hkalmanson.2.2.2.2.1,
      hkalmanson.2.2.2.2.2.1, hkalmanson.2.2.2.2.2.2, hsurvival⟩

/-- In the no-good-source exact-five branch, one named companion is an
interior-pair bad outside source.  Hence the first opposite cap must grow to
cardinality at least five. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_firstHitBad_firstOppCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (no_named_good_source :
      ∀ source : CarrierVertex D.A,
        (source.1 = xu ∨ source.1 = xv) →
        ¬ (source ∈ outsideFirstApexFiber R ∧
          (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt source.1 source.2)))) :
    5 ≤ S.oppCap1.card := by
  obtain
    ⟨xuSource, xvSource, _, _, _, _, _, _, _, _, _, hcross, _⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_firstHitBadResidual
      P hblockerVRow hblockerNeV xu xv terminal blocker_eq pair_interior
        blocker_interior interior_card_eq_three no_named_good_source
  rcases hcross with hxuFirstXvBad | hxvFirstXuBad
  · exact firstOppCap_card_ge_five_of_interiorPairBadOutsideSource
      hxuFirstXvBad.2.1
  · exact firstOppCap_card_ge_five_of_interiorPairBadOutsideSource
      hxvFirstXuBad.2.1

/-- Exact missing metric condition for the first-hit/bad residual: any weak
reverse of the forced Kalmanson inequality yields a contradiction. -/
theorem
    false_of_exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_reverseDistance
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (reverse_distance :
      dist P.source.1 xu ≤ dist P.source.1 P.other.1) :
    False := by
  have hstrict :=
    (exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_kalmanson
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three).1
  exact (not_lt_of_ge reverse_distance) hstrict

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_firstHitBadResidual

#print axioms
  firstOppCap_card_ge_five_of_interiorPairBadOutsideSource

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_firstHitBad_firstOppCap_card_ge_five

#print axioms
  false_of_exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_reverseDistance

end ATailFrontierLiveClosure
end Problem97
