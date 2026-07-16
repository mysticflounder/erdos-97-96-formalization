/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleConsequence
import ActualBlockerMinimalCycleClassifier

/-!
# Fixed-radius actual-blocker residual classifier

At a source of a fixed-single-radius actual-blocker cycle, the exact critical
row has at least two points outside the distinguished first-apex circle.  This
file keeps those points attached to the source-exact HIT/OMISSION split.

The HIT arm is sharp: its only points on the fixed circle are the chosen
source and mate, so the off-circle residual has exactly two points.  In the
OMISSION arm the fixed-circle intersection has cardinality one or two, and
the residual has cardinality three or two respectively.  Every residual
point survives in the terminal carrier and is localized by the full
MEC-derived cap partition.

This is a localization theorem, not a closing theorem.  In particular, the
off-circle residual cannot itself supply the third fixed-circle point needed
by the existing HIT consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch
open ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle

attribute [local instance] Classical.propDecidable

/-- Source-exact classification of the retained off-fixed-circle part of an
actual blocker row.

The cap-location fields come from the existing full geometric actual-blocker
classifier, whose proof uses the MEC cap partition, strict convex cap order,
and global K4/criticality.  No endpoint, mate coherence, or rank field is
added here. -/
theorem SourceExactMinimalActualBlockerCycle.exists_fixedRadiusPair_residualClassifier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    ∃ P' : AmbientRobustHistoryPair D S T.carrier radius,
      P'.x = (K.source i).1 ∧
      let hxA := (mem_selectedClass.mp P'.x_mem_class).1
      let blocker := H.centerAt P'.x hxA
      let shell := (H.selectedAt P'.x hxA).toCriticalFourShell
      let fixedClass := SelectedClass D.A S.oppApex1 radius
      let residual := shell.support \ fixedClass
      blocker ∈ D.A ∧
        blocker ≠ S.oppApex1 ∧
        blocker ≠ S.oppApex2 ∧
        (blocker = S.surplusApex ∨
          ∃ capIndex : Fin 3, blocker ∈ S.capInteriorByIndex capIndex) ∧
        (∀ z ∈ residual,
          z ∈ T.carrier ∧
            (z ∈ S.triangle.verts ∨
              ∃ capIndex : Fin 3, z ∈ S.capInteriorByIndex capIndex)) ∧
        ∃ z w : ℝ²,
          z ∈ residual ∧
          w ∈ residual ∧
          z ≠ w ∧
          ((ActualBlockerHitOutcome P' H ∧
              fixedClass ∩ shell.support = {P'.x, P'.y} ∧
              residual.card = 2) ∨
            (ActualBlockerOmissionOutcome P' H ∧
              ((fixedClass ∩ shell.support).card = 1 ∨
                (fixedClass ∩ shell.support).card = 2) ∧
              (residual.card = 2 ∨ residual.card = 3))) := by
  classical
  rcases exists_fixedRadius_pair_at_source K i with
    ⟨P', hsource, _hyFixed⟩
  let hxA : P'.x ∈ D.A := (mem_selectedClass.mp P'.x_mem_class).1
  let blocker := H.centerAt P'.x hxA
  let shell := (H.selectedAt P'.x hxA).toCriticalFourShell
  let fixedClass := SelectedClass D.A S.oppApex1 radius
  let residual := shell.support \ fixedClass

  have hclassifier :=
    AmbientRobustHistoryPair.actualBlocker_capMetricClassifier P' H
  have hhitOrOmission :
      ActualBlockerHitOutcome P' H ∨ ActualBlockerOmissionOutcome P' H :=
    ActualBlockerCapMetricOutcome.hit_or_omission hclassifier
  rcases hclassifier with ⟨hblockerA, hblocker_ne_first,
    hblocker_ne_second, hblocker_location, _⟩

  have hresidual := T.actualBlockerRow_offRadius_residual P' H
  change 2 ≤ residual.card ∧ residual ⊆ T.carrier at hresidual

  have hresidual_location :
      ∀ z ∈ residual,
        z ∈ T.carrier ∧
          (z ∈ S.triangle.verts ∨
            ∃ capIndex : Fin 3, z ∈ S.capInteriorByIndex capIndex) := by
    intro z hz
    have hzSupport : z ∈ shell.support := (Finset.mem_sdiff.mp hz).1
    exact ⟨hresidual.2 hz,
      S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
        (shell.support_subset_A hzSupport)⟩

  have hresidualOneLt : 1 < residual.card := by omega
  rcases Finset.one_lt_card.mp hresidualOneLt with
    ⟨z, hzResidual, w, hwResidual, hzw⟩

  have hblocker_ne_first' : blocker ≠ S.oppApex1 := by
    simpa [blocker, hxA] using hblocker_ne_first
  have hinter_le_two :
      (fixedClass ∩ shell.support).card ≤ 2 := by
    simpa [fixedClass, shell, hxA] using
      criticalFourShell_fixedClass_inter_card_le_two
        shell hblocker_ne_first'

  have hbranch :
      (ActualBlockerHitOutcome P' H ∧
          fixedClass ∩ shell.support = {P'.x, P'.y} ∧
          residual.card = 2) ∨
        (ActualBlockerOmissionOutcome P' H ∧
          ((fixedClass ∩ shell.support).card = 1 ∨
            (fixedClass ∩ shell.support).card = 2) ∧
          (residual.card = 2 ∨ residual.card = 3)) := by
    rcases hhitOrOmission with hhit | homission
    · left
      have hxSupport : P'.x ∈ shell.support := by
        exact shell.q_mem_support
      have hySupport : P'.y ∈ shell.support := by
        simpa [shell, hxA] using hhit.1
      have hpair_subset :
          ({P'.x, P'.y} : Finset ℝ²) ⊆ fixedClass ∩ shell.support := by
        intro t ht
        simp only [Finset.mem_insert, Finset.mem_singleton] at ht
        rcases ht with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨P'.x_mem_class, hxSupport⟩
        · exact Finset.mem_inter.mpr ⟨P'.y_mem_class, hySupport⟩
      have hinter_le_pair :
          (fixedClass ∩ shell.support).card ≤
            ({P'.x, P'.y} : Finset ℝ²).card := by
        rw [Finset.card_pair P'.x_ne_y]
        exact hinter_le_two
      have hfixed_inter :
          fixedClass ∩ shell.support = ({P'.x, P'.y} : Finset ℝ²) :=
        (Finset.eq_of_subset_of_card_le hpair_subset hinter_le_pair).symm
      have hinter_card : (shell.support ∩ fixedClass).card = 2 := by
        rw [Finset.inter_comm, hfixed_inter, Finset.card_pair P'.x_ne_y]
      have hcard_split := Finset.card_sdiff_add_card_inter
        shell.support fixedClass
      change residual.card + (shell.support ∩ fixedClass).card =
        shell.support.card at hcard_split
      have hresidual_card : residual.card = 2 := by
        rw [hinter_card, shell.support_card] at hcard_split
        omega
      exact ⟨hhit, hfixed_inter, hresidual_card⟩
    · right
      have hxInter : P'.x ∈ fixedClass ∩ shell.support := by
        exact Finset.mem_inter.mpr ⟨P'.x_mem_class, shell.q_mem_support⟩
      have hinter_one : 1 ≤ (fixedClass ∩ shell.support).card :=
        Finset.one_le_card.mpr ⟨P'.x, hxInter⟩
      have hinter_cases :
          (fixedClass ∩ shell.support).card = 1 ∨
            (fixedClass ∩ shell.support).card = 2 := by
        omega
      have hcard_split := Finset.card_sdiff_add_card_inter
        shell.support fixedClass
      change residual.card + (shell.support ∩ fixedClass).card =
        shell.support.card at hcard_split
      have hresidual_cases : residual.card = 2 ∨ residual.card = 3 := by
        rw [shell.support_card] at hcard_split
        rcases hinter_cases with hinter_one | hinter_two
        · right
          have hinter_comm :
              (shell.support ∩ fixedClass).card = 1 := by
            simpa [Finset.inter_comm] using hinter_one
          omega
        · left
          have hinter_comm :
              (shell.support ∩ fixedClass).card = 2 := by
            simpa [Finset.inter_comm] using hinter_two
          omega
      exact ⟨homission, hinter_cases, hresidual_cases⟩

  refine ⟨P', hsource, ?_⟩
  change blocker ∈ D.A ∧
    blocker ≠ S.oppApex1 ∧
    blocker ≠ S.oppApex2 ∧
    (blocker = S.surplusApex ∨
      ∃ capIndex : Fin 3, blocker ∈ S.capInteriorByIndex capIndex) ∧
    (∀ t ∈ residual,
      t ∈ T.carrier ∧
        (t ∈ S.triangle.verts ∨
          ∃ capIndex : Fin 3, t ∈ S.capInteriorByIndex capIndex)) ∧
    ∃ z w : ℝ²,
      z ∈ residual ∧ w ∈ residual ∧ z ≠ w ∧
        ((ActualBlockerHitOutcome P' H ∧
            fixedClass ∩ shell.support = {P'.x, P'.y} ∧
            residual.card = 2) ∨
          (ActualBlockerOmissionOutcome P' H ∧
            ((fixedClass ∩ shell.support).card = 1 ∨
              (fixedClass ∩ shell.support).card = 2) ∧
            (residual.card = 2 ∨ residual.card = 3)))
  exact ⟨hblockerA, hblocker_ne_first, hblocker_ne_second,
    hblocker_location, hresidual_location,
    z, w, hzResidual, hwResidual, hzw, hbranch⟩

#print axioms SourceExactMinimalActualBlockerCycle.exists_fixedRadiusPair_residualClassifier

end ATailRFullParentEntryScratch
end Problem97
