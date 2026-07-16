/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DangerousRetainingFullParentNormalForm
import ReciprocalSwapReduction

/-!
# Integrating reciprocal criticality as swapped FA-UNIQ4

The reciprocal directed-cross residual has two global continuations.  Its
common-deletion arm remains an R consumer obligation.  Its prescribed
second-apex critical arm is already a first-apex unique-card-four branch after
the fixed-surplus non-surplus swap.

This file removes the obsolete distinct-second-apex-radius intermediate from
the coordinator normal form.  It is an integration adapter, not a
contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRReciprocalSwapIntegrationScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailContinuationBankMatchScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentNormalFormScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapReductionScratch
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

/-- The reciprocal residual has only two honest downstream roles:

* a fresh common-deletion packet, still owned by the R consumer; or
* a swapped first-apex unique-card-four frontier, owned by `FA-UNIQ4`.

No distinct-radius producer remains between the critical alternative and the
protected unique-row branch. -/
theorem reciprocalDirectedCross_commonDeletion_or_swappedFirstApexUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    (∃ z : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H z R.firstCenter S.oppApex2)) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases X.exists_fresh_commonDeletion_or_secondApexCritical with
    ⟨z, _hzDeletedRow, _hzNotFixed, _hzCarrier, _hzOutsideSource,
      _hsourceExact, _hsourceUnique, _hdirectedCross, hnext⟩
  rcases hnext with hcommon | ⟨C, hblocked, _hsupport⟩
  · exact Or.inl ⟨z, hcommon⟩
  · exact Or.inr
      (secondApexCritical_reorients_to_firstApexUniqueFour C hblocked)

/-- Coherent continuation after immediately resolving reciprocal criticality.

The middle arm is a source-faithful common-deletion packet.  The right arm is
the swap-stable `FA-UNIQ4` dependency. -/
def ResolvedCoherentFixedSingleRadiusContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical) : Prop :=
  ∃ T : FixedSingleFrontierRadiusTerminal F,
    ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier radius,
      P.x = F.pair.q ∧
        ((∃ R : CoherentRCommonDeletionPacket T.terminal P Hcritical,
            Nonempty
              (CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition R)) ∨
          (∃ R : CoherentRCommonDeletionPacket T.terminal P Hcritical,
            ∃ z : ℝ²,
              Nonempty (CommonDeletionTwoCenterPacket
                D Hcritical z R.firstCenter S.oppApex2)) ∨
          Nonempty (SwappedFirstApexUniqueFourFrontier D S Hcritical))

/-- Resolve the reciprocal arm of the existing coherent normal form without
changing the anchored arm or forgetting the common-deletion source. -/
theorem resolveCoherentFixedSingleRadiusContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hcritical}
    (h : CoherentFixedSingleRadiusContinuation F) :
    ResolvedCoherentFixedSingleRadiusContinuation F := by
  rcases h with ⟨T, P, hsource, hanchored | hreciprocal⟩
  · exact ⟨T, P, hsource, Or.inl hanchored⟩
  · rcases hreciprocal with ⟨R, ⟨X⟩⟩
    rcases reciprocalDirectedCross_commonDeletion_or_swappedFirstApexUniqueFour X with
      ⟨z, hcommon⟩ | hswapped
    · exact ⟨T, P, hsource, Or.inr (Or.inl ⟨R, z, hcommon⟩)⟩
    · exact ⟨T, P, hsource, Or.inr (Or.inr hswapped)⟩

/-- The current frontier normal form with reciprocal criticality already
reclassified as `FA-UNIQ4`. -/
def ResolvedCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical) : Prop :=
  (((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) ∨
    ResolvedCoherentFixedSingleRadiusContinuation F ∨
      ∃ deleted center₁ : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket
          D Hcritical deleted center₁ S.oppApex2)

/-- Coordinator conversion from the source-current normal form. -/
theorem resolveCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hcritical}
    (h : CurrentFirstApexFixedRadiusNormalForm F) :
    ResolvedCurrentFirstApexFixedRadiusNormalForm F := by
  rcases h with hunique | hcoherent | hspent
  · exact Or.inl hunique
  · exact Or.inr
      (Or.inl (resolveCoherentFixedSingleRadiusContinuation hcoherent))
  · exact Or.inr (Or.inr hspent)

/-- A chosen frontier reaches the resolved coordinator shape directly. -/
theorem CriticalPairFrontier.resolvedCurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    ResolvedCurrentFirstApexFixedRadiusNormalForm F :=
  resolveCurrentFirstApexFixedRadiusNormalForm
    (Problem97.ATailRFullParentNormalFormScratch.CriticalPairFrontier.currentFirstApexFixedRadiusNormalForm
      F hradius hfour)

set_option linter.unusedVariables false in
/-- The complete dangerous-retaining parent telescope with reciprocal
criticality already routed to the swap-stable `FA-UNIQ4` arm. -/
theorem fullParent_extracts_dangerousRetainingResolvedNormalForm
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
      ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
        q ∈ S.surplusCap ∧
          ∃ radius : ℝ, 0 < radius ∧
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
              ∃ F : CriticalPairFrontier D S radius W.H,
                ResolvedCurrentFirstApexFixedRadiusNormalForm F := by
  rcases
      Problem97.ATailRDangerousRetainingFullParentNormalFormScratch.fullParent_extracts_dangerousRetainingCurrentNormalForm
        MT hCirc CP i rows hM hqCap hsurplus hqNonMoser hnotOppExact
        hNoM44 hcard hnoRem hcritical hlocalNoQFree hfixed hbase Hlive
        hcenter hsupport with
    ⟨j, hjne, hj5, W, hqSurplus, radius, hradius, hfour, F, hcurrent⟩
  exact ⟨j, hjne, hj5, W, hqSurplus, radius, hradius, hfour, F,
    resolveCurrentFirstApexFixedRadiusNormalForm hcurrent⟩

#print axioms reciprocalDirectedCross_commonDeletion_or_swappedFirstApexUniqueFour
#print axioms resolveCoherentFixedSingleRadiusContinuation
#print axioms resolveCurrentFirstApexFixedRadiusNormalForm
#print axioms CriticalPairFrontier.resolvedCurrentFirstApexFixedRadiusNormalForm
#print axioms fullParent_extracts_dangerousRetainingResolvedNormalForm

end ATailRReciprocalSwapIntegrationScratch
end Problem97
