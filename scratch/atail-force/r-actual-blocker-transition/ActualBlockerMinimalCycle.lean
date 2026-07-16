/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerOrbitNormalForm

/-!
# Minimal source-exact actual-blocker cycles

This module canonically normalizes the cycle arm of
`actualBlockerOrbit_terminalHit_or_erasedCycle`.  The cycle period is the
minimal period of the retained critical system's actual blocker map, its base
is reachable from the original erased source, and every vertex carries a
complete ambient robust-history pair whose source is exactly that vertex.

No geometric progress or contradiction is asserted here.  In particular, the
mate reconstructed at each source remains existential and need not be coherent
around the cycle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The carrier vertex from which the actual-blocker orbit of an ambient
robust-history pair starts. -/
def actualBlockerStartVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho) :
    CriticalShellSystem.CarrierVertex D.A :=
  ⟨P.x, (mem_selectedClass.mp P.x_mem_class).1⟩

/-- A canonical genuine cycle of the retained actual-blocker map, reached
after `entryTime` iterations from the original erased source.  Its period is
definitionally the minimal period.  Each canonical cycle index is still in
the erased carrier and has a complete robust pair with exactly that source.
-/
structure SourceExactMinimalActualBlockerCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) where
  /-- Number of actual-blocker steps from the original source to the cycle
  base. -/
  entryTime : ℕ
  /-- The canonical minimal period is genuine; fixed points are impossible. -/
  period_two_le :
    2 ≤ Function.minimalPeriod H.blockerVertex
      ((H.blockerVertex^[entryTime]) (actualBlockerStartVertex P))
  /-- Every canonical cycle source remains outside the terminal carrier. -/
  source_mem_erased :
    ∀ i : Fin (Function.minimalPeriod H.blockerVertex
        ((H.blockerVertex^[entryTime]) (actualBlockerStartVertex P))),
      ((H.blockerVertex^[i.1])
          ((H.blockerVertex^[entryTime]) (actualBlockerStartVertex P))).1 ∈
        D.A \ C
  /-- Every canonical cycle source has a complete robust pair with exactly
  that source. -/
  exists_pair_at_source :
    ∀ i : Fin (Function.minimalPeriod H.blockerVertex
        ((H.blockerVertex^[entryTime]) (actualBlockerStartVertex P))),
      ∃ rho' : ℝ,
        ∃ P' : AmbientRobustHistoryPair D S C rho',
          P'.x = ((H.blockerVertex^[i.1])
            ((H.blockerVertex^[entryTime]) (actualBlockerStartVertex P))).1

namespace SourceExactMinimalActualBlockerCycle

/-- The reachable base of a normalized cycle. -/
def base
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    CriticalShellSystem.CarrierVertex D.A :=
  (H.blockerVertex^[K.entryTime]) (actualBlockerStartVertex P)

/-- The canonical period of a normalized cycle. -/
noncomputable def period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) : ℕ :=
  Function.minimalPeriod H.blockerVertex K.base

/-- The source at one canonical cycle index. -/
def source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) : CriticalShellSystem.CarrierVertex D.A :=
  (H.blockerVertex^[i.1]) K.base

/-- The normalized period is at least two. -/
theorem two_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) : 2 ≤ K.period := by
  simpa [period, base] using K.period_two_le

/-- The canonical base is periodic with exactly the normalized period. -/
theorem isPeriodicPt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    Function.IsPeriodicPt H.blockerVertex K.period K.base := by
  exact Function.isPeriodicPt_minimalPeriod H.blockerVertex K.base

/-- Distinct canonical indices give distinct actual-blocker sources. -/
theorem source_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    Function.Injective K.source := by
  intro i j hij
  apply Fin.ext
  exact Function.iterate_injOn_Iio_minimalPeriod i.isLt j.isLt hij

/-- The convenient erased-carrier projection for the named canonical source. -/
theorem source_mem_erased_at
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) (i : Fin K.period) :
    (K.source i).1 ∈ D.A \ C := by
  simpa [source, period, base] using K.source_mem_erased i

/-- The convenient source-exact robust-pair projection at a named canonical
cycle index. -/
theorem exists_pair_at_source_at
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) (i : Fin K.period) :
    ∃ rho' : ℝ,
      ∃ P' : AmbientRobustHistoryPair D S C rho',
        P'.x = (K.source i).1 := by
  simpa [source, period, base] using K.exists_pair_at_source i

/-- The corresponding mathlib periodic orbit is a nodup cycle. -/
theorem periodicOrbit_nodup
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    (Function.periodicOrbit H.blockerVertex K.base).Nodup :=
  Function.nodup_periodicOrbit

end SourceExactMinimalActualBlockerCycle

/-- The source-faithful orbit dichotomy with its cycle arm normalized to the
minimal period.  The map is still the same retained `H.blockerVertex`, the
cycle base is explicitly reachable from `P.x`, and robust-pair existence is
preserved at every canonical cycle source. -/
theorem AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C) :
    (∃ n : ℕ,
      ((H.blockerVertex^[n]) (actualBlockerStartVertex P)).1 ∈ C) ∨
      Nonempty (SourceExactMinimalActualBlockerCycle P H) := by
  rcases AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_erasedCycle
      P H Hhist with
      hterminal | ⟨m, k, hk, hperiodic, hsource⟩
  · exact Or.inl hterminal
  · right
    let q : CriticalShellSystem.CarrierVertex D.A :=
      (H.blockerVertex^[m]) (actualBlockerStartVertex P)
    have hperiod_pos :
        0 < Function.minimalPeriod H.blockerVertex q :=
      hperiodic.minimalPeriod_pos (by omega)
    have hperiod_ne_one :
        Function.minimalPeriod H.blockerVertex q ≠ 1 := by
      intro hone
      have hfixed : H.blockerVertex q = q :=
        Function.minimalPeriod_eq_one_iff_isFixedPt.mp hone
      exact H.blockerVertex_ne q hfixed
    have hperiod_two :
        2 ≤ Function.minimalPeriod H.blockerVertex q := by
      omega
    refine ⟨{
      entryTime := m
      period_two_le := ?_
      source_mem_erased := ?_
      exists_pair_at_source := ?_ }⟩
    · simpa [q] using hperiod_two
    · intro i
      have hi := (hsource (i.1 + m)).1
      simpa [Function.iterate_add_apply] using hi
    · intro i
      have hi := (hsource (i.1 + m)).2
      simpa [Function.iterate_add_apply] using hi

#print axioms AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle

end ATailRActualBlockerTransitionScratch
end Problem97
