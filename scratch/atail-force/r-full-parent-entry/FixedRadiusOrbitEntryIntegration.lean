/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedFirstRadiusTerminalDescent
import RFullParentOrbitEntry

/-!
# Fixed-radius integration at the R orbit entry

This file combines the fixed-first-radius terminal descent with the existing
source-faithful actual-blocker orbit entry.  It does not add another terminal
consumer.  On the fixed-radius arm it reconstructs the original frontier
source from the retained ambient history, proves that the history radius is
the original frontier radius, and then invokes the already checked orbit
normal form.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- The unchanged unique-radius arm from the frontier's first-apex split. -/
def OriginalFrontierUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (_F : CriticalPairFrontier D S radius H) : Prop :=
  ((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius

/-- The fixed-radius terminal carrier, the original frontier source rebuilt
as an ambient history pair at the original radius, and its existing
source-faithful actual-blocker orbit outcome. -/
structure FixedFrontierRadiusSourceFaithfulOrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  fixed : FixedFrontierRadiusTerminal F
  pair : AmbientRobustHistoryPair D S fixed.terminal.carrier radius
  source_eq : pair.x = F.pair.q
  orbit : SourceFaithfulActualBlockerOrbitOutcome pair H

/-- The exact three-way integration surface: the original unique-radius arm,
a fixed-radius source-faithful orbit, or a certificate that the original
radius was spent by the frontier pair itself. -/
def FirstApexUniqueOrFixedRadiusOrbitOrSpent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Prop :=
  OriginalFrontierUniqueRadiusArm F ∨
    Nonempty (FixedFrontierRadiusSourceFaithfulOrbit F) ∨
      Nonempty (FrontierRadiusSpentAtEntry F)

private theorem frontier_source_mem_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1 with
    ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa [dist_comm] using hqRadius⟩

/-- The fixed terminal history remembers the original frontier pair at the
original radius.  The generic named-source reconstruction may existentially
name its radius, but co-radiality at the common source proves that it is the
frontier radius. -/
private theorem exists_originalRadiusHistoryPair_of_fixedFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (T : FixedFrontierRadiusTerminal F) :
    ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier radius,
      P.x = F.pair.q := by
  have hqNotCarrier : F.pair.q ∉ T.terminal.carrier := by
    intro hqCarrier
    have hqPost := T.terminal.carrier_subset hqCarrier
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hqPost).2).1 rfl
  have hqErased : F.pair.q ∈ D.A \ T.terminal.carrier :=
    Finset.mem_sdiff.mpr ⟨F.pair.q_mem_A, hqNotCarrier⟩
  rcases exists_ambientRobustHistoryPair_with_source_of_erased
      D S T.ambient_history hqErased with
    ⟨rho, P, hsource⟩
  have hqAtRho : F.pair.q ∈ SelectedClass D.A S.oppApex1 rho := by
    simpa [hsource] using P.x_mem_class
  have hrho : rho = radius :=
    (mem_selectedClass.mp hqAtRho).2.symm.trans
      (mem_selectedClass.mp (frontier_source_mem_selectedClass F)).2
  subst rho
  exact ⟨P, hsource⟩

/-- Reuse the existing terminal-payload/minimal-cycle normal form and its
existing cycle classifier; no terminal endpoint is reproved here. -/
private theorem sourceFaithfulOrbitOutcome_of_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C)
    (hterminal : FirstApexTerminalOn D S C) :
    SourceFaithfulActualBlockerOrbitOutcome P H := by
  rcases
      AmbientRobustHistoryPair.actualBlockerOrbit_terminalPayload_or_sourceExactMinimalCycle
        P H Hhist hterminal with
    hterminalPayload | hcycle
  · exact Or.inl hterminalPayload
  · right
    rcases hcycle with ⟨K⟩
    rcases K.exists_pairFamily_someHit_or_allOmission with ⟨W, houtcome⟩
    exact ⟨K, W, houtcome⟩

/-- Integrate the fixed-radius descent with the source-faithful R orbit.

The robust arm either keeps the original radius all the way to a terminal
carrier and starts the orbit from the original source `F.pair.q` at that
same radius, or records the exact first transition where that radius was
spent. -/
theorem CriticalPairFrontier.firstApexUnique_or_fixedRadiusOrbit_or_spent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    FirstApexUniqueOrFixedRadiusOrbitOrSpent F := by
  rcases F.firstApexSplit with hfirstDouble | hunique
  · rcases
      Problem97.ATailRFullParentEntryScratch.CriticalPairFrontier.fixedRadiusTerminal_or_spentAtEntry
        F hradius hfour hfirstDouble with hfixed | hspent
    · right
      left
      rcases hfixed with ⟨T⟩
      rcases exists_originalRadiusHistoryPair_of_fixedFrontier F T with
        ⟨P, hsource⟩
      refine ⟨
        { fixed := T
          pair := P
          source_eq := hsource
          orbit := ?_ }⟩
      exact sourceFaithfulOrbitOutcome_of_terminal P H T.ambient_history
        T.terminal.terminal.toFirstApexTerminalOn
    · exact Or.inr (Or.inr hspent)
  · exact Or.inl hunique

#print axioms CriticalPairFrontier.firstApexUnique_or_fixedRadiusOrbit_or_spent

end ATailRFullParentEntryScratch
end Problem97
