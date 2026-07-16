/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonDeletionCriticalExpansion
import GlobalSourceSelection

/-!
# Scratch: finite successor dynamics for common deletion

The recursive arm of `commonDeletion_successor_or_alignedCriticalPair`
keeps its two centers but changes the deleted source.  This file records the
exact finite endpoint of iterating that arm.  Either an aligned prescribed
critical pair occurs at some surviving deleted source, or a nontrivial
periodic orbit occurs.  Every edge of the orbit still comes from a fresh
source in one of the two current rows, outside the current deleted critical
shell, and changes the chosen blocker.

The periodic alternative is not claimed contradictory.  In particular, the
selected rows and their radii may change at every step.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCommonDeletionSuccessorCycleScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailContinuationGeometryClassifier
open ATailCrossSurvivalEliminatorScratch
open ATailFrontierContinuationDispatcherScratch
open ATailGlobalSourceSelectionScratch
open ATailJointTransitionCoreScratch
open CriticalShellSystem

attribute [local instance] Classical.propDecidable

/-- A carrier source whose deletion preserves a four-point radius class at
both fixed centers. -/
abbrev CommonDeletionSurvivorSource
    (D : CounterexampleData) (center₁ center₂ : ℝ²) :=
  {q : CarrierVertex D.A //
    HasNEquidistantPointsAt 4 (D.A.erase q.1) center₁ ∧
      HasNEquidistantPointsAt 4 (D.A.erase q.1) center₂}

/-- The deleted source already carried by a common-deletion packet. -/
def CommonDeletionSurvivorSource.ofPacket
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    CommonDeletionSurvivorSource D center₁ center₂ :=
  ⟨⟨q, C.q_mem_A⟩, C.survives₁, C.survives₂⟩

/-- Choose one exact common-deletion packet at every source which survives
at the same two centers.  The initial packet supplies the center membership
and center inequality; its particular rows are not reused. -/
noncomputable def canonicalPacketAt
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (s : CommonDeletionSurvivorSource D center₁ center₂) :
    CommonDeletionTwoCenterPacket D H s.1.1 center₁ center₂ :=
  Classical.choice
    (nonempty_commonDeletionTwoCenterPacket H s.1.2
      C₀.center₁_mem_A C₀.center₂_mem_A C₀.centers_ne s.2.1 s.2.2)

/-- An aligned prescribed pair occurs at a surviving source, using the
canonical exact rows selected there. -/
def HasAlignedPrescribedPairAt
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (s : CommonDeletionSurvivorSource D center₁ center₂) : Prop :=
  ∃ i : Fin 2,
    Nonempty (AlignedPrescribedCriticalPair (canonicalPacketAt C₀ s) i)

/-- One chosen recursive successor, retaining both the fresh-source witness
and the next common-deletion packet. -/
structure FreshCommonDeletionSuccessor
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) where
  fresh : FreshCriticalSource C
  nextPacket : CommonDeletionTwoCenterPacket
    D H fresh.point center₁ center₂

/-- If the aligned arm is excluded at one packet, its expansion supplies a
fresh recursive successor. -/
theorem nonempty_freshCommonDeletionSuccessor_of_no_aligned
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (hno : ¬ ∃ i : Fin 2,
      Nonempty (AlignedPrescribedCriticalPair C i)) :
    Nonempty (FreshCommonDeletionSuccessor C) := by
  rcases commonDeletion_successor_or_alignedCriticalPair C with
    ⟨X, ⟨Cnext⟩⟩ | haligned
  · exact ⟨⟨X, Cnext⟩⟩
  · exact False.elim (hno haligned)

/-- Noncomputable successor selected under a global absence of aligned
pairs. -/
noncomputable def chosenFreshSuccessor
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
      ¬ HasAlignedPrescribedPairAt C₀ s)
    (s : CommonDeletionSurvivorSource D center₁ center₂) :
    FreshCommonDeletionSuccessor (canonicalPacketAt C₀ s) :=
  Classical.choice
    (nonempty_freshCommonDeletionSuccessor_of_no_aligned
      (canonicalPacketAt C₀ s) (hno s))

/-- The source-to-source map obtained by always taking the recursive arm. -/
noncomputable def commonDeletionSuccessor
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
      ¬ HasAlignedPrescribedPairAt C₀ s) :
    CommonDeletionSurvivorSource D center₁ center₂ →
      CommonDeletionSurvivorSource D center₁ center₂ :=
  fun s =>
    let N := chosenFreshSuccessor C₀ hno s
    ⟨⟨N.fresh.point, N.fresh.mem_A⟩,
      N.nextPacket.survives₁, N.nextPacket.survives₂⟩

@[simp] theorem commonDeletionSuccessor_point
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
      ¬ HasAlignedPrescribedPairAt C₀ s)
    (s : CommonDeletionSurvivorSource D center₁ center₂) :
    (commonDeletionSuccessor C₀ hno s).1.1 =
      (chosenFreshSuccessor C₀ hno s).fresh.point := rfl

/-- Every successor edge lies in one of the two rows selected at its source. -/
theorem commonDeletionSuccessor_mem_current_rows
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
      ¬ HasAlignedPrescribedPairAt C₀ s)
    (s : CommonDeletionSurvivorSource D center₁ center₂) :
    (commonDeletionSuccessor C₀ hno s).1.1 ∈
      (canonicalPacketAt C₀ s).B₁ ∪ (canonicalPacketAt C₀ s).B₂ := by
  exact (chosenFreshSuccessor C₀ hno s).fresh.mem_rows

/-- Every successor edge avoids the current deleted source's exact critical
shell. -/
theorem commonDeletionSuccessor_outside_current_shell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
      ¬ HasAlignedPrescribedPairAt C₀ s)
    (s : CommonDeletionSurvivorSource D center₁ center₂) :
    (commonDeletionSuccessor C₀ hno s).1.1 ∉
      deletedCriticalSupport (canonicalPacketAt C₀ s) := by
  exact (chosenFreshSuccessor C₀ hno s).fresh.outside_deleted_shell

/-- Every successor edge changes the blocker chosen by the retained common
critical-shell system. -/
theorem commonDeletionSuccessor_blocker_ne
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
      ¬ HasAlignedPrescribedPairAt C₀ s)
    (s : CommonDeletionSurvivorSource D center₁ center₂) :
    H.centerAt (commonDeletionSuccessor C₀ hno s).1.1
        (commonDeletionSuccessor C₀ hno s).1.2 ≠
      H.centerAt s.1.1 s.1.2 := by
  exact (chosenFreshSuccessor C₀ hno s).fresh.blocker_ne_deleted_blocker

/-- The successor is never the current deleted source. -/
theorem commonDeletionSuccessor_ne
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂)
    (hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
      ¬ HasAlignedPrescribedPairAt C₀ s)
    (s : CommonDeletionSurvivorSource D center₁ center₂) :
    commonDeletionSuccessor C₀ hno s ≠ s := by
  intro heq
  have hpoint :
      (commonDeletionSuccessor C₀ hno s).1.1 = s.1.1 :=
    congrArg (fun x => x.1.1) heq
  exact (chosenFreshSuccessor C₀ hno s).fresh.point_ne_deleted hpoint

/-- A full periodic orbit of recursive common-deletion successors. -/
structure CommonDeletionSuccessorCycle
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂) where
  no_aligned : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
    ¬ HasAlignedPrescribedPairAt C₀ s
  source : CommonDeletionSurvivorSource D center₁ center₂
  period : ℕ
  period_ge_two : 2 ≤ period
  periodic : Function.IsPeriodicPt
    (commonDeletionSuccessor C₀ no_aligned) period source

/-- Finite iteration is exact: an aligned prescribed pair occurs at some
surviving source, or the recursive successor relation has a genuine cycle of
period at least two. -/
theorem alignedPrescribedPair_or_successorCycle
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q₀ center₁ center₂ : ℝ²}
    (C₀ : CommonDeletionTwoCenterPacket D H q₀ center₁ center₂) :
    (∃ s : CommonDeletionSurvivorSource D center₁ center₂,
      HasAlignedPrescribedPairAt C₀ s) ∨
      Nonempty (CommonDeletionSuccessorCycle C₀) := by
  classical
  by_cases haligned :
      ∃ s : CommonDeletionSurvivorSource D center₁ center₂,
        HasAlignedPrescribedPairAt C₀ s
  · exact Or.inl haligned
  · right
    have hno : ∀ s : CommonDeletionSurvivorSource D center₁ center₂,
        ¬ HasAlignedPrescribedPairAt C₀ s := by
      intro s hs
      exact haligned ⟨s, hs⟩
    let next := commonDeletionSuccessor C₀ hno
    let start := CommonDeletionSurvivorSource.ofPacket C₀
    obtain ⟨m, n, hmn, heq⟩ :=
      Finite.exists_ne_map_eq_of_infinite
        (fun t : ℕ => (next^[t]) start)
    rcases lt_or_gt_of_ne hmn with hmnlt | hmnlt
    · let source := (next^[m]) start
      let period := n - m
      have hperiodPos : 0 < period := by
        dsimp [period]
        omega
      have hperiodic : Function.IsPeriodicPt next period source := by
        change (next^[period]) source = source
        calc
          (next^[period]) source = (next^[period + m]) start := by
            rw [Function.iterate_add_apply]
          _ = (next^[n]) start := by
            congr 1
            omega
          _ = (next^[m]) start := heq.symm
          _ = source := rfl
      have hperiodNeOne : period ≠ 1 := by
        intro hp
        have hfixed : next source = source := by
          simpa [hp] using hperiodic
        exact commonDeletionSuccessor_ne C₀ hno source hfixed
      exact ⟨⟨hno, source, period, by omega, hperiodic⟩⟩
    · let source := (next^[n]) start
      let period := m - n
      have hperiodPos : 0 < period := by
        dsimp [period]
        omega
      have hperiodic : Function.IsPeriodicPt next period source := by
        change (next^[period]) source = source
        calc
          (next^[period]) source = (next^[period + n]) start := by
            rw [Function.iterate_add_apply]
          _ = (next^[m]) start := by
            congr 1
            omega
          _ = (next^[n]) start := heq
          _ = source := rfl
      have hperiodNeOne : period ≠ 1 := by
        intro hp
        have hfixed : next source = source := by
          simpa [hp] using hperiodic
        exact commonDeletionSuccessor_ne C₀ hno source hfixed
      exact ⟨⟨hno, source, period, by omega, hperiodic⟩⟩

/- ## Provenance-preserving adapters -/

/-- The non-equilateral wrapper keeps the second apex as the initial deleted
source and the two strict `oppCap2` continuation centers visible around the
generic finite endpoint. -/
theorem nonEquilateral_alignedPrescribedPair_or_successorCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    (∃ C₀ : CommonDeletionTwoCenterPacket
        (rebasePacket D S) H S.oppApex2 P.z₁ P.z₂,
      (∃ s : CommonDeletionSurvivorSource
          (rebasePacket D S) P.z₁ P.z₂,
        HasAlignedPrescribedPairAt C₀ s) ∨
        Nonempty (CommonDeletionSuccessorCycle C₀)) := by
  rcases N.commonDeletion with ⟨C₀⟩
  exact ⟨C₀, alignedPrescribedPair_or_successorCycle C₀⟩

/-- Cross-survival/global-source provenance remains visible: the fixed
centers are the original strict-`oppCap2` survivor center and the concrete
global escape source.  The only other branch is the already named second
apex double-critical alignment. -/
theorem globalEscape_alignedPrescribedPair_or_successorCycle_or_apexAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (E : GlobalEscapeSource O.survivor) :
    (∃ C₀ : CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.deleted
          O.survivor.center E.source,
      (∃ s : CommonDeletionSurvivorSource
          (rebasePacket D S) O.survivor.center E.source,
        HasAlignedPrescribedPairAt C₀ s) ∨
        Nonempty (CommonDeletionSuccessorCycle C₀)) ∨
    (∃ C₀ : CommonDeletionTwoCenterPacket
        (rebasePacket D S) H O.survivor.center
          O.survivor.center E.source,
      (∃ s : CommonDeletionSurvivorSource
          (rebasePacket D S) O.survivor.center E.source,
        HasAlignedPrescribedPairAt C₀ s) ∨
        Nonempty (CommonDeletionSuccessorCycle C₀)) ∨
      Nonempty (ApexDoubleCriticalResidual O) := by
  rcases globalEscape_commonDeletion_or_apexDoubleCritical O E with
    hcommonDeleted | hcommonCenter | haligned
  · rcases hcommonDeleted with ⟨C₀⟩
    exact Or.inl ⟨C₀, alignedPrescribedPair_or_successorCycle C₀⟩
  · rcases hcommonCenter with ⟨C₀⟩
    exact Or.inr (Or.inl
      ⟨C₀, alignedPrescribedPair_or_successorCycle C₀⟩)
  · exact Or.inr (Or.inr haligned)

#print axioms commonDeletionSuccessor_mem_current_rows
#print axioms commonDeletionSuccessor_outside_current_shell
#print axioms commonDeletionSuccessor_blocker_ne
#print axioms commonDeletionSuccessor_ne
#print axioms alignedPrescribedPair_or_successorCycle
#print axioms nonEquilateral_alignedPrescribedPair_or_successorCycle
#print axioms globalEscape_alignedPrescribedPair_or_successorCycle_or_apexAlignment

end ATailCommonDeletionSuccessorCycleScratch
end Problem97
