/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredSourceCriticalTransitionConsumer
import FixedSingleRadiusAnchoredOrTerminalResidual
import ReciprocalDirectedCrossGlobalBoundary
import SpentEntryTerminalMutualHitConsumer

/-!
# Full-parent fixed-radius normal form

This module reconnects the complete live K-A parent telescope to the current
fixed-single-radius frontier DAG.  It does not re-export the older
source-faithful-orbit endpoint and does not assert a contradiction.

At a chosen critical-pair frontier the exact output is:

* the protected card-four/card-five unique-radius arm;
* a coherent fixed-radius continuation carrying either an anchored
  source-critical transition or the terminal reciprocal directed cross; or
* the radius-spent-at-entry arm, already reduced to a two-center
  common-deletion packet.

The full-parent theorem keeps the concrete critical-shell system and returns
the chosen second-large-cap witness, frontier radius, and frontier itself.
Thus the remaining consumer must use the retained global parent geometry on
the two coherent packets or on the common-deletion continuation; no local
`False` is hidden in this connector.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentNormalFormScratch

open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.AmbientRobustHistoryPair
open ATailRFullParentEntryScratch.CriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The current coherent fixed-single-radius continuation at a chosen
frontier.  Both outputs retain a `CoherentRCommonDeletionPacket`, hence the
actual source/deleted-point rows, blocker provenance, and the underlying
two-center common-deletion packet. -/
def CoherentFixedSingleRadiusContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical) : Prop :=
  ∃ T : FixedSingleFrontierRadiusTerminal F,
    ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier radius,
      P.x = F.pair.q ∧
        ((∃ R : CoherentRCommonDeletionPacket T.terminal P Hcritical,
            Nonempty
              (CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition R)) ∨
          ∃ R : CoherentRCommonDeletionPacket T.terminal P Hcritical,
            Nonempty
              (CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual R))

/-- Honest branch-complete normal form at one chosen frontier.

The left arm is exactly the protected `FA-UNIQ4`/`FA-UNIQ5` surface.  The
middle arm is the current coherent provenance continuation.  The right arm
is the radius-spent-at-entry branch after its checked reduction to common
deletion. -/
def CurrentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical) : Prop :=
  (((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) ∨
    CoherentFixedSingleRadiusContinuation F ∨
      ∃ deleted center₁ : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket
          D Hcritical deleted center₁ S.oppApex2)

/-- A chosen frontier reaches the current fixed-radius normal form.

The coherent branch uses the ordered-cap realization supplied by ambient
convexity.  The spent branch is consumed immediately at frontier entry, with
no alternate-radius descent. -/
theorem CriticalPairFrontier.currentFirstApexFixedRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hcritical : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius Hcritical)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    CurrentFirstApexFixedRadiusNormalForm F := by
  rcases
      firstApexUnique_or_fixedSingleRadiusOrbit_or_spent F hradius hfour with
    hunique | hcoherent | hspent
  · exact Or.inl hunique
  · right
    left
    rcases hcoherent with ⟨T, P, hsource, _horbit⟩
    rcases nonempty_oppCap1OrderedData D S with ⟨O⟩
    exact ⟨T, P, hsource,
      anchoredTransition_or_terminalDirectedCross T.terminal P Hcritical O⟩
  · exact Or.inr (Or.inr hspent.some.exists_commonDeletion)

open Problem97.ATailRFullParentNormalFormScratch.CriticalPairFrontier

set_option linter.unusedVariables false in
/-- The complete live parent telescope reaches the current fixed-radius
normal form while retaining the concrete critical-shell system.

Unlike the older full-parent orbit endpoint, this theorem returns the current
coherent anchored/directed-cross continuation and the already-reduced spent
common-deletion arm.  The second-large-cap witness is also preserved in the
result instead of being consumed as irrelevant bookkeeping. -/
theorem fullParent_extracts_currentFirstApexFixedRadiusNormalForm
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
    (Hcritical : CriticalShellSystem D.A)
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
      ∃ radius : ℝ, 0 < radius ∧
        4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
          ∃ F : CriticalPairFrontier D S radius Hcritical,
            CurrentFirstApexFixedRadiusNormalForm F := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  change ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
    ∃ radius : ℝ, 0 < radius ∧
      4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
        ∃ F : CriticalPairFrontier D S radius Hcritical,
          CurrentFirstApexFixedRadiusNormalForm F
  obtain ⟨j, hjne, hj5⟩ :=
    exists_secondLargeCap_of_noM44 MT hCirc CP hM hsurplus hNoM44
  obtain ⟨radius, hradius, hfour, ⟨F⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D S Hcritical
  exact ⟨j, hjne, hj5, radius, hradius, hfour, F,
    currentFirstApexFixedRadiusNormalForm F hradius hfour⟩

#print axioms CriticalPairFrontier.currentFirstApexFixedRadiusNormalForm
#print axioms fullParent_extracts_currentFirstApexFixedRadiusNormalForm

end ATailRFullParentNormalFormScratch
end Problem97
