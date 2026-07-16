/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedFirstRadiusTerminalDescent
import ActualBlockerMinimalCycle
import RTransitionLiveSurface
import Erdos9796Proof.P97.N8.N8aArcTwoCircle

/-!
# Fixed-single-radius consequences for the actual-blocker cycle

The single-radius descent records that every point erased before the terminal
carrier lies on one fixed circle about the first opposite apex.  This file
wires that invariant to the source-exact blocker cycle and to its exact
critical rows.

For a cycle already carried by such a full coherent history, every cycle
vertex, and both endpoints of every reconstructed robust pair, use the same
first-apex radius.  The critical row at such a source lies on a distinct
circle, so it contains at most two points from the fixed class.  Since the row
has four points, it leaves at least two retained points outside the fixed
class.  This is a consequence, not yet the missing contradiction: the
remaining producer must localize those retained off-radius row points.

This conditional cycle consequence does not cover a frontier radius of
ambient cardinality four or five that is spent by the entry pair while an
alternate K4 radius keeps the R branch alive.  That branch is exposed
separately by `fixedSingleRadiusTerminal_or_spentAtEntry`.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open ATailRTransitionLiveSurfaceScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- A critical four-shell whose center differs from the fixed apex meets the
fixed first-apex radius class in at most two points. -/
theorem criticalFourShell_fixedClass_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {source blocker : ℝ²}
    (K : CriticalFourShell D.A source blocker)
    (hblocker : blocker ≠ S.oppApex1) :
    ((SelectedClass D.A S.oppApex1 radius) ∩ K.support).card ≤ 2 := by
  let W : N8ApexArcWitness :=
    { apex := S.oppApex1
      selectedRadius := radius
      arc :=
        { support := K.support
          circleCenter := blocker
          circleRadius := K.radius
          on_circle := K.support_eq_radius }
      circles_ne := by
        intro hsame
        exact hblocker
          (congrArg (fun s : Sphere ℝ² => s.1) hsame).symm }
  exact W.selectedClass_inter_card_le_two

/-- Consequently, at least two points of a distinct critical row are outside
the fixed first-apex radius class. -/
theorem criticalFourShell_two_le_off_fixedClass_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {source blocker : ℝ²}
    (K : CriticalFourShell D.A source blocker)
    (hblocker : blocker ≠ S.oppApex1) :
    2 ≤ (K.support \
      SelectedClass D.A S.oppApex1 radius).card := by
  have hinter :
      (K.support ∩ SelectedClass D.A S.oppApex1 radius).card ≤ 2 := by
    simpa [Finset.inter_comm] using
      criticalFourShell_fixedClass_inter_card_le_two K hblocker
  have hsplit := Finset.card_sdiff_add_card_inter K.support
    (SelectedClass D.A S.oppApex1 radius)
  rw [K.support_card] at hsplit
  omega

/-- Every ambient point outside the fixed class is retained by a full-carrier
single-radius history. -/
theorem FixedSingleRadiusTerminalHistory.mem_carrier_of_not_mem_fixedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    {z : ℝ²} (hzA : z ∈ D.A)
    (hzNotFixed : z ∉ SelectedClass D.A S.oppApex1 radius) :
    z ∈ T.carrier := by
  by_contra hzNotCarrier
  exact hzNotFixed (T.erased_mem_fixedClass z
    (Finset.mem_sdiff.mpr ⟨hzA, hzNotCarrier⟩))

/-- Exact row consequence for an ambient robust source: its actual critical
row has at least two off-fixed-radius points, and all of them survive in the
terminal carrier. -/
theorem FixedSingleRadiusTerminalHistory.actualBlockerRow_offRadius_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho)
    (H : CriticalShellSystem D.A) :
    let hxA := (mem_selectedClass.mp P.x_mem_class).1
    let K := (H.selectedAt P.x hxA).toCriticalFourShell
    2 ≤ (K.support \
        SelectedClass D.A S.oppApex1 radius).card ∧
      K.support \
        SelectedClass D.A S.oppApex1 radius ⊆ T.carrier := by
  dsimp only
  let K := (H.selectedAt P.x
    (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell
  have hblocker :
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠
        S.oppApex1 :=
    AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 P H
  refine ⟨criticalFourShell_two_le_off_fixedClass_card K hblocker, ?_⟩
  intro z hz
  exact T.mem_carrier_of_not_mem_fixedClass
    (K.support_subset_A (Finset.mem_sdiff.mp hz).1)
    (Finset.mem_sdiff.mp hz).2

/-- Every canonical vertex of a source-exact actual-blocker cycle lies in the
same distinguished first-apex radius class. -/
theorem SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    (K.source i).1 ∈ SelectedClass D.A S.oppApex1 radius :=
  T.erased_mem_fixedClass _ (K.source_mem_erased_at i)

/-- At every canonical cycle vertex, the source-exact pair can be reconstructed
at the distinguished radius; its mate lies in the same fixed class. -/
theorem SourceExactMinimalActualBlockerCycle.exists_fixedRadius_pair_at_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    ∃ P' : AmbientRobustHistoryPair D S T.carrier radius,
      P'.x = (K.source i).1 ∧
        P'.y ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases K.exists_pair_at_source_at i with ⟨rho', P', hx⟩
  have hrho : rho' = radius := T.pair_radius_eq_fixed P'
  subst rho'
  exact ⟨P', hx, (T.pair_endpoints_mem_fixedClass P').2⟩

/-- The coherent entry arm with its original frontier source reconstructed at
the fixed radius and passed to the existing source-exact blocker-orbit
dichotomy.  Unlike the older integration packet, this does not smuggle in
terminal-radius uniqueness. -/
structure FixedSingleFrontierRadiusSourceFaithfulOrbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  fixed : FixedSingleFrontierRadiusTerminal F
  pair : AmbientRobustHistoryPair D S fixed.terminal.carrier radius
  source_eq : pair.x = F.pair.q
  orbit :
    (∃ n : ℕ,
      ((H.blockerVertex^[n]) (actualBlockerStartVertex pair)).1 ∈
        fixed.terminal.carrier) ∨
      Nonempty (SourceExactMinimalActualBlockerCycle pair H)

/-- Consumer-facing branch-complete form of the coherent entry theorem.  A
card-at-least-six entry produces an actual source-faithful orbit at the one
fixed radius; a card-four/card-five entry exposes the separate radius-switch
packet. -/
theorem CriticalPairFrontier.fixedSingleRadiusOrbit_or_spentAtEntry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hfirstDouble : HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1) :
    Nonempty (FixedSingleFrontierRadiusSourceFaithfulOrbit F) ∨
      Nonempty (FrontierRadiusSpentAtEntry F) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.CriticalPairFrontier.fixedSingleRadiusTerminal_or_spentAtEntry
        F hradius hfour hfirstDouble with hfixed | hspent
  · left
    rcases hfixed with ⟨T⟩
    have hqNotCarrier : F.pair.q ∉ T.terminal.carrier := by
      intro hqCarrier
      have hqPost := T.carrier_subset_postEntry hqCarrier
      exact (Finset.mem_erase.mp
        (Finset.mem_erase.mp hqPost).2).1 rfl
    have hqErased : F.pair.q ∈ D.A \ T.terminal.carrier :=
      Finset.mem_sdiff.mpr ⟨F.pair.q_mem_A, hqNotCarrier⟩
    rcases exists_ambientRobustHistoryPair_with_source_of_erased
        D S T.terminal.history hqErased with ⟨rho, P, hsource⟩
    have hrho : rho = radius := T.terminal.pair_radius_eq_fixed P
    subst rho
    exact ⟨
      { fixed := T
        pair := P
        source_eq := hsource
        orbit :=
          AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
            P H T.terminal.history }⟩
  · exact Or.inr hspent

#print axioms criticalFourShell_fixedClass_inter_card_le_two
#print axioms FixedSingleRadiusTerminalHistory.actualBlockerRow_offRadius_residual
#print axioms SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
#print axioms SourceExactMinimalActualBlockerCycle.exists_fixedRadius_pair_at_source
#print axioms CriticalPairFrontier.fixedSingleRadiusOrbit_or_spentAtEntry

end ATailRFullParentEntryScratch
end Problem97
