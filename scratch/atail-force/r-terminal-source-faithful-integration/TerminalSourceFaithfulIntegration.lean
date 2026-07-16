/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import TerminalSourceFaithfulPacket
import ReciprocalSwapIntegration

/-!
# Source-faithful terminal integration

The terminal-only refinement is useful only if the coherent orbit coordinator
retains it.  This file rebuilds the terminal-hit arm with the original
double-erased row and named terminal endpoint still present, while leaving the
minimal-cycle anchored arm uniform.

The reciprocal terminal arm is then resolved immediately into fresh common
deletion or swapped `FA-UNIQ4`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalSourceFaithfulIntegrationScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRActualBlockerTransitionScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentNormalFormScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapIntegrationScratch
open ATailRReciprocalSwapReductionScratch
open ATailRTerminalSourceFaithfulPacketScratch
open ATailRTerminalSourceFaithfulPacketScratch.SourceFaithfulTerminalCommonDeletionPacket
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The source-outside/reciprocal split is a property of the retained
coherent packet itself; it need not reconstruct another packet. -/
theorem coherent_sourceOutside_or_reciprocalDirectedCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    R.SourceOutsideDeletedCriticalShell ∨
      Nonempty (ReciprocalDirectedCrossResidual R) := by
  by_cases houtside : R.SourceOutsideDeletedCriticalShell
  · exact Or.inl houtside
  · right
    have hsourceIn :
        R.sourcePair.x ∈
          (H.selectedAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support := by
      change ¬ R.sourcePair.x ∉
        (H.selectedAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1).toCriticalFourShell.support
        at houtside
      exact not_not.mp houtside
    have hcenters :
        R.firstCenter ≠
          H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1 := by
      have hne :=
        blocker_centers_ne_of_not_mem_other_selected_support H
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1
          (mem_selectedClass.mp R.source_mem_fixedClass).1
          R.deleted_not_mem_sourceRow
      simpa [CoherentRCommonDeletionPacket.firstCenter] using hne.symm
    have hinter :=
      selected_support_inter_card_le_two_of_not_mem_other_selected_support H
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        (mem_selectedClass.mp R.source_mem_fixedClass).1
        R.deleted_not_mem_sourceRow
    have hexact :=
      cross_survival_unique_radius_and_exact_support H
        (mem_selectedClass.mp R.source_mem_fixedClass).1
        R.deleted_survives_firstCenter
    have hdeletedBlockerNeFirst :
        H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1 ≠
          S.oppApex1 :=
      actual_blocker_ne_of_deletion_survives H
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        R.deleted_survives_firstApex
    have hsign :=
      signedArea_product_neg_of_cross_membership
        R.deletedSourceRelocationPacket hsourceIn hdeletedBlockerNeFirst
    exact ⟨{
      source_mem_deletedRow := hsourceIn
      deleted_not_mem_sourceRow := R.deleted_not_mem_sourceRow
      source_mem_fixedClass := R.source_mem_fixedClass
      deleted_mem_fixedClass := R.deleted_mem_fixedClass
      source_off_surplus := R.sourcePair.x_off_surplus
      deleted_off_surplus := R.deleted_off_surplus
      source_or_deleted_mem_strictOppCap1 :=
        R.source_or_deleted_mem_strictOppCap1
      source_survives_firstApex := R.source_survives_firstApex
      deleted_survives_firstApex := R.deleted_survives_firstApex
      source_survives_secondApex := R.source_survives_secondApex
      deleted_survives_secondApex := R.deleted_survives_secondApex
      source_critical_at_firstCenter :=
        R.source_deletion_critical_at_firstCenter
      deleted_survives_firstCenter := R.deleted_survives_firstCenter
      blocker_centers_ne := hcenters
      selectedRows_inter_card_le_two := by
        simpa [CoherentRCommonDeletionPacket.sourceRow] using hinter
      sourceRow_exact_after_deleted := by
        simpa [CoherentRCommonDeletionPacket.firstCenter,
          CoherentRCommonDeletionPacket.sourceRow] using hexact.1
      sourceRow_unique_radius_after_deleted := by
        simpa [CoherentRCommonDeletionPacket.firstCenter,
          CoherentRCommonDeletionPacket.sourceRow] using hexact.2
      directedCross_signedArea_product_neg := by
        simpa [CoherentRCommonDeletionPacket.deletedSourceRelocationPacket]
          using hsign
    }⟩

/-- Source-faithful orbit split.

The first arm is the terminal-hit anchored transition and retains its refined
packet.  The second is the minimal-cycle anchored transition.  The third is
the terminal reciprocal residual and also retains the refined packet. -/
theorem AmbientRobustHistoryPair.sourceFaithfulTerminal_or_cycleContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho)
    (H : CriticalShellSystem D.A)
    (O : OppCap1OrderedData D S) :
    (∃ W : SourceFaithfulTerminalCommonDeletionPacket T P H,
      Nonempty (AnchoredSourceCriticalTransition W.coherent)) ∨
      (∃ R : CoherentRCommonDeletionPacket T P H,
        Nonempty (AnchoredSourceCriticalTransition R)) ∨
      (∃ W : SourceFaithfulTerminalCommonDeletionPacket T P H,
        Nonempty (ReciprocalDirectedCrossResidual W.coherent)) := by
  rcases
      Problem97.ATailRActualBlockerTransitionScratch.AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
        P H T.history with hhit | hcycle
  · rcases
        Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
          P H T.history hhit with
      ⟨K⟩
    rcases
        Problem97.ATailRTerminalSourceFaithfulPacketScratch.SourceFaithfulTerminalCommonDeletionPacket.LeastPositiveTerminalHitPredecessor.nonempty_sourceFaithfulTerminalPacket
          K with
      ⟨W⟩
    rcases coherent_sourceOutside_or_reciprocalDirectedCross W.coherent with
      houtside | hreciprocal
    · exact Or.inl
        ⟨W, W.coherent.anchoredSourceCriticalTransition_of_sourceOutsideDeletedCriticalShell
          houtside⟩
    · exact Or.inr (Or.inr ⟨W, hreciprocal⟩)
  · right
    left
    rcases hcycle with ⟨K⟩
    exact
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_anchoredSourceCriticalTransition
        K O

/-- Resolved coherent continuation that retains the source-faithful terminal
packet through both terminal outputs. -/
def SourceFaithfulResolvedCoherentContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical) : Prop :=
  ∃ T : FixedSingleFrontierRadiusTerminal F,
    ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier radius,
      P.x = F.pair.q ∧
        ((∃ W : SourceFaithfulTerminalCommonDeletionPacket
              T.terminal P Hcritical,
            Nonempty (AnchoredSourceCriticalTransition W.coherent)) ∨
          (∃ R : CoherentRCommonDeletionPacket T.terminal P Hcritical,
            Nonempty (AnchoredSourceCriticalTransition R)) ∨
          (∃ W : SourceFaithfulTerminalCommonDeletionPacket
              T.terminal P Hcritical,
            ∃ z : ℝ²,
              Nonempty (CommonDeletionTwoCenterPacket
                D Hcritical z W.coherent.firstCenter S.oppApex2)) ∨
          Nonempty (SwappedFirstApexUniqueFourFrontier D S Hcritical))

/-- The frontier normal form with the source-faithful terminal packet and
the reciprocal swap reduction both integrated. -/
def SourceFaithfulResolvedCurrentNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical) : Prop :=
  (((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) ∨
    SourceFaithfulResolvedCoherentContinuation F ∨
      ∃ deleted center₁ : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket
          D Hcritical deleted center₁ S.oppApex2)

/-- A chosen frontier reaches the fully source-faithful resolved normal
form. -/
theorem CriticalPairFrontier.sourceFaithfulResolvedCurrentNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    SourceFaithfulResolvedCurrentNormalForm F := by
  rcases
      Problem97.ATailRFullParentEntryScratch.CriticalPairFrontier.firstApexUnique_or_fixedSingleRadiusOrbit_or_spent
        F hradius hfour with hunique | hcoherent | hspent
  · exact Or.inl hunique
  · right
    left
    rcases hcoherent with ⟨T, P, hsource, _horbit⟩
    rcases nonempty_oppCap1OrderedData D S with ⟨O⟩
    rcases
        Problem97.ATailRTerminalSourceFaithfulIntegrationScratch.AmbientRobustHistoryPair.sourceFaithfulTerminal_or_cycleContinuation
          T.terminal P Hcritical O with
      hterminalAnchored | hcycleAnchored | hterminalReciprocal
    · exact ⟨T, P, hsource, Or.inl hterminalAnchored⟩
    · exact ⟨T, P, hsource, Or.inr (Or.inl hcycleAnchored)⟩
    · rcases hterminalReciprocal with ⟨W, ⟨X⟩⟩
      rcases reciprocalDirectedCross_commonDeletion_or_swappedFirstApexUniqueFour
          X with
        ⟨z, hcommon⟩ | hswapped
      · exact ⟨T, P, hsource,
          Or.inr (Or.inr (Or.inl ⟨W, z, hcommon⟩))⟩
      · exact ⟨T, P, hsource,
          Or.inr (Or.inr (Or.inr hswapped))⟩
  · exact Or.inr (Or.inr hspent.some.exists_commonDeletion)

set_option linter.unusedVariables false in
/-- Complete dangerous-retaining parent connector with the source-faithful
terminal packet preserved through the final branch split. -/
theorem fullParent_extracts_sourceFaithfulResolvedCurrentNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
      ∃ Wlive : LiveDangerousRetainingSystem D p q t1 t2 t3,
        q ∈ S.surplusCap ∧
          ∃ radius : ℝ, 0 < radius ∧
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
              ∃ F : CriticalPairFrontier D S radius Wlive.H,
                SourceFaithfulResolvedCurrentNormalForm F := by
  rcases
      Problem97.ATailRDangerousRetainingFullParentNormalFormScratch.fullParent_extracts_dangerousRetainingCurrentNormalForm
        MT hCirc CP i rows hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem hcritical hlocalNoQFree hfixed hbase Hlive
        hcenter hsupport with
    ⟨j, hjne, hj5, Wlive, hqSurplus, radius, hradius, hfour, F, _hcurrent⟩
  exact ⟨j, hjne, hj5, Wlive, hqSurplus, radius, hradius, hfour, F,
    Problem97.ATailRTerminalSourceFaithfulIntegrationScratch.CriticalPairFrontier.sourceFaithfulResolvedCurrentNormalForm
      F hradius hfour⟩

#print axioms coherent_sourceOutside_or_reciprocalDirectedCross
#print axioms
  AmbientRobustHistoryPair.sourceFaithfulTerminal_or_cycleContinuation
#print axioms CriticalPairFrontier.sourceFaithfulResolvedCurrentNormalForm
#print axioms fullParent_extracts_sourceFaithfulResolvedCurrentNormalForm

end ATailRTerminalSourceFaithfulIntegrationScratch
end Problem97
