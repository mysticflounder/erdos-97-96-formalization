/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerMinimalCycle

/-!
# Source-exact classifier on a minimal actual-blocker cycle

Choose one ambient robust-history pair at every source of a normalized
actual-blocker cycle, without changing the source orientation.  Each chosen
pair retains the exact cycle source and therefore admits the existing
actual-blocker cap/metric classifier at that source.

The resulting finite family has an exact dichotomy: some chosen mate is in
its source's actual-blocker row (HIT), or every chosen mate is omitted
(OMISSION).  The mates and first-apex radii remain independently chosen at
the different cycle sources; no coherence between successive mates or radii
is asserted.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The HIT component of `ActualBlockerCapMetricOutcome`, named separately so
it can be quantified over a source-exact cycle family. -/
def ActualBlockerHitOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) : Prop :=
  let hxA := (mem_selectedClass.mp P.x_mem_class).1
  let b := H.centerAt P.x hxA
  let K := (H.selectedAt P.x hxA).toCriticalFourShell
  P.y ∈ K.support ∧
    b ∉ S.surplusCap ∧
    (b = S.surplusApex ∨
      ∃ i : Fin 3,
        i ≠ S.surplusIdx ∧ b ∈ S.capInteriorByIndex i) ∧
    dist b P.x = dist b P.y ∧
    signedArea2 P.y S.oppApex1 b *
      signedArea2 P.x S.oppApex1 b < 0

/-- The OMISSION component of `ActualBlockerCapMetricOutcome`, named
separately so it can be quantified over a source-exact cycle family. -/
def ActualBlockerOmissionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) : Prop :=
  let hxA := (mem_selectedClass.mp P.x_mem_class).1
  let b := H.centerAt P.x hxA
  let K := (H.selectedAt P.x hxA).toCriticalFourShell
  P.y ∉ K.support ∧
    HasNEquidistantPointsAt 4 (D.A.erase P.y) b ∧
    dist b P.y ≠ dist b P.x

/-- The existing cap/metric outcome exposes exactly HIT or OMISSION. -/
theorem ActualBlockerCapMetricOutcome.hit_or_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (h : ActualBlockerCapMetricOutcome P H) :
    ActualBlockerHitOutcome P H ∨ ActualBlockerOmissionOutcome P H := by
  simpa [ActualBlockerCapMetricOutcome, ActualBlockerHitOutcome,
    ActualBlockerOmissionOutcome] using h.2.2.2.2

/-- One independently chosen robust-history pair at every canonical cycle
source.  Source equality is part of the packet, so no swap of a pair can
silently replace the blocker-orbit source by its mate. -/
structure SourceExactMinimalActualBlockerCyclePairFamily
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) where
  /-- Independently chosen first-apex radius at each cycle source. -/
  rhoAt : Fin K.period → ℝ
  /-- Independently chosen robust pair at each cycle source. -/
  pairAt : ∀ i, AmbientRobustHistoryPair D S C (rhoAt i)
  /-- The chosen pair starts at the named canonical cycle source. -/
  source_eq : ∀ i, (pairAt i).x = (K.source i).1
  /-- The complete actual-blocker classifier holds at every chosen source. -/
  capMetricOutcome : ∀ i, ActualBlockerCapMetricOutcome (pairAt i) H

namespace SourceExactMinimalActualBlockerCycle

/-- Source-exact robust-pair existence at every cycle vertex can be chosen as
one dependent finite family, and the classifier applies to every member. -/
theorem exists_pairFamily
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    Nonempty (SourceExactMinimalActualBlockerCyclePairFamily K) := by
  classical
  choose rhoAt pairAt hsource using fun i => K.exists_pair_at_source_at i
  exact ⟨{
    rhoAt := rhoAt
    pairAt := pairAt
    source_eq := hsource
    capMetricOutcome := fun i =>
      AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
        (pairAt i) H }⟩

/-- For a fixed source-exact choice family, either some chosen source is in
the HIT arm, or every chosen source is in the OMISSION arm. -/
theorem pairFamily_someHit_or_allOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    (W : SourceExactMinimalActualBlockerCyclePairFamily K) :
    (∃ i, ActualBlockerHitOutcome (W.pairAt i) H) ∨
      ∀ i, ActualBlockerOmissionOutcome (W.pairAt i) H := by
  by_cases hhit : ∃ i, ActualBlockerHitOutcome (W.pairAt i) H
  · exact Or.inl hhit
  · right
    intro i
    rcases (W.capMetricOutcome i).hit_or_omission with h | h
    · exact False.elim (hhit ⟨i, h⟩)
    · exact h

/-- Combined source-correct cycle-wide classifier: one chosen family retains
every exact source and every complete cap/metric outcome, together with the
some-HIT versus all-OMISSION split. -/
theorem exists_pairFamily_someHit_or_allOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    ∃ W : SourceExactMinimalActualBlockerCyclePairFamily K,
      ((∃ i, ActualBlockerHitOutcome (W.pairAt i) H) ∨
        ∀ i, ActualBlockerOmissionOutcome (W.pairAt i) H) := by
  rcases K.exists_pairFamily with ⟨W⟩
  exact ⟨W, pairFamily_someHit_or_allOmission W⟩

#print axioms ActualBlockerCapMetricOutcome.hit_or_omission
#print axioms SourceExactMinimalActualBlockerCycle.exists_pairFamily
#print axioms SourceExactMinimalActualBlockerCycle.pairFamily_someHit_or_allOmission
#print axioms SourceExactMinimalActualBlockerCycle.exists_pairFamily_someHit_or_allOmission

end SourceExactMinimalActualBlockerCycle
end ATailRActualBlockerTransitionScratch
end Problem97
