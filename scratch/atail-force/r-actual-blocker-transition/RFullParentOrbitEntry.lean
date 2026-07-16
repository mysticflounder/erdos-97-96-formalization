/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import ActualBlockerMinimalCycleClassifier
import LeastTerminalHitPredecessor
import RFullParentEntry

/-!
# Full-parent entry to the source-faithful R blocker orbit

This module wires the complete live K-A parent telescope through the checked
critical-pair frontier and first-apex split.  The unique-radius arm is retained
unchanged for its separately owned producer lane.  On the robust arm, the
terminal carrier, full ambient erasure history, a named ambient robust pair,
and the source-faithful actual-blocker orbit are all constructed.

No terminal-hit or erased-cycle contradiction is asserted here.  Those are
the two remaining full-geometric R obligations.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open ATailRFullParentEntryScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The normalized erased-cycle arm together with one source-exact choice
family and its exact cycle-wide HIT/OMISSION split. -/
def ClassifiedSourceExactMinimalActualBlockerCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) : Prop :=
  ∃ K : SourceExactMinimalActualBlockerCycle P H,
    ∃ W : SourceExactMinimalActualBlockerCyclePairFamily K,
      ((∃ i, ActualBlockerHitOutcome (W.pairAt i) H) ∨
        ∀ i, ActualBlockerOmissionOutcome (W.pairAt i) H)

/-- The exact terminal-payload or classified minimal-cycle conclusion,
factored so the complete parent entry can expose it without weakening or
changing its source. -/
def SourceFaithfulActualBlockerOrbitOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) : Prop :=
  (∃ K : LeastPositiveTerminalHitPredecessor P H,
    RetainedActualBlockerTerminalPayload K.predecessorPair H) ∨
    ClassifiedSourceExactMinimalActualBlockerCycle P H

/-- The branch-complete first-apex output at one concrete frontier.  The left
arm is exactly the unique-radius branch already assigned to the protected
lane.  The right arm contains the complete R state and its source-faithful
finite blocker orbit. -/
def FirstApexUniqueOrSourceFaithfulROrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H) : Prop :=
  (((SelectedClass D.A S.oppApex1 r).card = 4 ∨
      (SelectedClass D.A S.oppApex1 r).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) ∨
    ∃ C : Finset ℝ², ∃ rho : ℝ,
      ∃ P : AmbientRobustHistoryPair D S C rho,
        C ⊆ (D.A.erase F.pair.q).erase F.pair.w ∧
        RobustPairedErasureHistory D S D.A C ∧
        FirstApexTerminalOn D S C ∧
        P.x = F.pair.q ∧
        SourceFaithfulActualBlockerOrbitOutcome P H

/-- A concrete frontier's first-apex split refines to either its unchanged
unique-radius arm or the complete source-faithful R orbit state. -/
theorem CriticalPairFrontier.firstApexUnique_or_sourceFaithfulROrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hr : 0 < r) :
    FirstApexUniqueOrSourceFaithfulROrbit F := by
  rcases F.firstApexSplit with hfirstDouble | hunique
  · right
    rcases exists_terminal_with_nonempty_robust_history_of_frontier
        D S H F.pair hr hfirstDouble F.secondApexDouble with
      ⟨C, hCsub, hqErased, Hhist, hterminal⟩
    rcases exists_ambientRobustHistoryPair_with_source_of_erased
        D S Hhist hqErased with ⟨rho, P, hsource⟩
    refine ⟨C, rho, P, hCsub, Hhist, hterminal, hsource, ?_⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.actualBlockerOrbit_terminalPayload_or_sourceExactMinimalCycle
          P H Hhist hterminal with
      hterminalPayload | hcycle
    · exact Or.inl hterminalPayload
    · right
      rcases hcycle with ⟨K⟩
      rcases K.exists_pairFamily_someHit_or_allOmission with ⟨W, houtcome⟩
      exact ⟨K, W, houtcome⟩
  · exact Or.inl hunique

set_option linter.unusedVariables false in
/-- The complete live K-A parent telescope reaches exactly the protected
unique-radius arm or a source-faithful R blocker orbit.  All parent hypotheses
are retained so the two remaining R exclusions can use the full geometric
surface rather than an over-abstracted transition packet. -/
theorem fullParent_extracts_firstApexUnique_or_sourceFaithfulROrbit
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y) [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ Hcritical : CriticalShellSystem D.A,
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
        ∃ F : CriticalPairFrontier D S r Hcritical,
          FirstApexUniqueOrSourceFaithfulROrbit F := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  change ∃ Hcritical : CriticalShellSystem D.A,
    ∃ r : ℝ, 0 < r ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
      ∃ F : CriticalPairFrontier D S r Hcritical,
        FirstApexUniqueOrSourceFaithfulROrbit F
  rcases fullParent_extracts_criticalPairFrontier_firstApexSplit
      MT hCirc CP i j rows hM hqCap hsurplus hqNonMoser hjne hj5 hNoM44
      hcard hcritical hlocalNoQFree hfixed hbase Hlive hcenter hsupport with
    ⟨Hcritical, r, hr, hfour, F, _hfirst⟩
  exact ⟨Hcritical, r, hr, hfour, F,
    Problem97.ATailRActualBlockerTransitionScratch.CriticalPairFrontier.firstApexUnique_or_sourceFaithfulROrbit
      F hr⟩

#print axioms CriticalPairFrontier.firstApexUnique_or_sourceFaithfulROrbit
#print axioms fullParent_extracts_firstApexUnique_or_sourceFaithfulROrbit

end ATailRActualBlockerTransitionScratch
end Problem97
