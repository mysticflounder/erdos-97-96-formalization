/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerCapMetricClassifier

/-!
# Retained-point provenance at the first-apex terminal carrier

The recursive bi-apex descent only records positive geometric provenance for
the points it erases.  A point retained by the terminal carrier has one
additional source-derived status: it is either on the unique terminal
first-apex radius, or its own first-apex radius class has cardinality at most
three on that carrier.

This file states that exact invariant and specializes it to a retained actual
blocker.  It does not assert any critical-row incidence for the retained
point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRTransitionLiveSurfaceScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- A retained non-apex point is either on the unique terminal radius or its
own retained first-apex radius class has at most three points. -/
theorem retainedPoint_mem_terminalClass_or_ownClass_card_le_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {terminalRadius : ℝ} {z : ℝ²}
    (hzC : z ∈ C)
    (hz_ne_apex : z ≠ S.oppApex1)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass C S.oppApex1 rho).card →
      rho = terminalRadius) :
    z ∈ SelectedClass C S.oppApex1 terminalRadius ∨
      (SelectedClass C S.oppApex1
        (dist S.oppApex1 z)).card ≤ 3 := by
  by_cases hradius : dist S.oppApex1 z = terminalRadius
  · left
    exact mem_selectedClass.mpr ⟨hzC, hradius⟩
  · right
    by_contra hnot
    have hfour :
        4 ≤ (SelectedClass C S.oppApex1
          (dist S.oppApex1 z)).card := by
      omega
    have hpositive : 0 < dist S.oppApex1 z :=
      dist_pos.mpr hz_ne_apex.symm
    exact hradius (hunique (dist S.oppApex1 z) hpositive hfour)

/-- Exact role of a retained point relative to the named terminal pair.  Away
from the two endpoints, it remains in the carrier on which the terminal
second-apex K4 witness is stated.  The remaining point also carries the
terminal-radius versus small-class split. -/
def RetainedPointTerminalRole
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (C : Finset ℝ²) (terminalRadius : ℝ)
    (q w z : ℝ²) : Prop :=
  z = q ∨ z = w ∨
    (z ∈ (C.erase q).erase w ∧
      (z ∈ SelectedClass C S.oppApex1 terminalRadius ∨
        (SelectedClass C S.oppApex1
          (dist S.oppApex1 z)).card ≤ 3))

/-- Every retained non-apex point has the exact terminal role above. -/
theorem retainedPoint_terminalRole
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {terminalRadius : ℝ} {q w z : ℝ²}
    (hzC : z ∈ C)
    (hz_ne_apex : z ≠ S.oppApex1)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass C S.oppApex1 rho).card →
      rho = terminalRadius) :
    RetainedPointTerminalRole S C terminalRadius q w z := by
  by_cases hzq : z = q
  · exact Or.inl hzq
  · by_cases hzw : z = w
    · exact Or.inr (Or.inl hzw)
    · exact Or.inr (Or.inr ⟨
        Finset.mem_erase.mpr
          ⟨hzw, Finset.mem_erase.mpr ⟨hzq, hzC⟩⟩,
        retainedPoint_mem_terminalClass_or_ownClass_card_le_three
          hzC hz_ne_apex hunique⟩)

/-- `FirstApexTerminalOn` exposes the terminal radius together with the exact
retained-point status forced by its uniqueness clause. -/
theorem FirstApexTerminalOn.exists_radius_with_retainedPoint_status
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²}
    (hterminal : FirstApexTerminalOn D S C)
    {z : ℝ²} (hzC : z ∈ C) (hz_ne_apex : z ≠ S.oppApex1) :
    ∃ terminalRadius : ℝ,
      0 < terminalRadius ∧
      ((SelectedClass C S.oppApex1 terminalRadius).card = 4 ∨
        (SelectedClass C S.oppApex1 terminalRadius).card = 5) ∧
      (∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass C S.oppApex1 rho).card →
        rho = terminalRadius) ∧
      (z ∈ SelectedClass C S.oppApex1 terminalRadius ∨
        (SelectedClass C S.oppApex1
          (dist S.oppApex1 z)).card ≤ 3) := by
  rcases hterminal with
    ⟨terminalRadius, q, w, hr, _hq, _hw, _hqw, hcard,
      hunique, _hsecond⟩
  exact ⟨terminalRadius, hr, hcard, hunique,
    retainedPoint_mem_terminalClass_or_ownClass_card_le_three
      hzC hz_ne_apex hunique⟩

/-- The terminal constructor already preserves a complete named witness and
the exact endpoint-versus-residual role of any retained non-apex point. -/
theorem FirstApexTerminalOn.exists_witness_with_retainedPoint_role
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²}
    (hterminal : FirstApexTerminalOn D S C)
    {z : ℝ²} (hzC : z ∈ C) (hz_ne_apex : z ≠ S.oppApex1) :
    ∃ terminalRadius : ℝ, ∃ q w : ℝ²,
      0 < terminalRadius ∧
      q ∈ (C.filter fun x => dist x S.oppApex1 = terminalRadius) \
        S.surplusCap ∧
      w ∈ (C.filter fun x => dist x S.oppApex1 = terminalRadius) \
        S.surplusCap ∧
      q ≠ w ∧
      ((SelectedClass C S.oppApex1 terminalRadius).card = 4 ∨
        (SelectedClass C S.oppApex1 terminalRadius).card = 5) ∧
      (∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass C S.oppApex1 rho).card →
        rho = terminalRadius) ∧
      HasNEquidistantPointsAt 4
        ((C.erase q).erase w) S.oppApex2 ∧
      RetainedPointTerminalRole S C terminalRadius q w z := by
  rcases hterminal with
    ⟨terminalRadius, q, w, hr, hq, hw, hqw, hcard,
      hunique, hsecond⟩
  exact ⟨terminalRadius, q, w, hr, hq, hw, hqw, hcard, hunique,
    hsecond, retainedPoint_terminalRole hzC hz_ne_apex hunique⟩

/-- Specialization to the actual blocker of an ambient robust history pair.
If that blocker is retained by the terminal carrier, this is all the current
terminal interface says about its first-apex radius class. -/
theorem AmbientRobustHistoryPair.exists_terminalRadius_actualBlocker_status
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hterminal : FirstApexTerminalOn D S C)
    (hbC : H.centerAt P.x
      (mem_selectedClass.mp P.x_mem_class).1 ∈ C) :
    ∃ terminalRadius : ℝ,
      0 < terminalRadius ∧
      ((SelectedClass C S.oppApex1 terminalRadius).card = 4 ∨
        (SelectedClass C S.oppApex1 terminalRadius).card = 5) ∧
      (∀ d : ℝ, 0 < d →
        4 ≤ (SelectedClass C S.oppApex1 d).card →
        d = terminalRadius) ∧
      (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∈
          SelectedClass C S.oppApex1 terminalRadius ∨
        (SelectedClass C S.oppApex1
          (dist S.oppApex1
            (H.centerAt P.x
              (mem_selectedClass.mp P.x_mem_class).1))).card ≤ 3) := by
  apply FirstApexTerminalOn.exists_radius_with_retainedPoint_status
      hterminal hbC
  exact AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 P H

/-- The exact source-derived product available for the retained-blocker arm:
terminal-radius status for the blocker, together with the existing HIT versus
OMISSION classifier.  This is the narrow surface on which subsequent producer
search should operate. -/
theorem AmbientRobustHistoryPair.exists_terminalRadius_status_and_capMetricOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hterminal : FirstApexTerminalOn D S C)
    (hbC : H.centerAt P.x
      (mem_selectedClass.mp P.x_mem_class).1 ∈ C) :
    ∃ terminalRadius : ℝ,
      0 < terminalRadius ∧
      ((SelectedClass C S.oppApex1 terminalRadius).card = 4 ∨
        (SelectedClass C S.oppApex1 terminalRadius).card = 5) ∧
      (∀ d : ℝ, 0 < d →
        4 ≤ (SelectedClass C S.oppApex1 d).card →
        d = terminalRadius) ∧
      (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∈
          SelectedClass C S.oppApex1 terminalRadius ∨
        (SelectedClass C S.oppApex1
          (dist S.oppApex1
            (H.centerAt P.x
              (mem_selectedClass.mp P.x_mem_class).1))).card ≤ 3) ∧
      ActualBlockerCapMetricOutcome P H := by
  rcases
      Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_terminalRadius_actualBlocker_status
        P H hterminal hbC with
    ⟨terminalRadius, hr, hcard, hunique, hstatus⟩
  exact ⟨terminalRadius, hr, hcard, hunique, hstatus,
    Problem97.ATailRActualBlockerTransitionScratch.AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
      P H⟩

/-- Source-derived terminal witness, retained-blocker role, and HIT/OMISSION
classifier in one theorem.  This is the exact branch product for subsequent
mining; no endpoint, rank, or cross-incidence field is postulated. -/
theorem AmbientRobustHistoryPair.exists_terminalWitness_role_and_capMetricOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hterminal : FirstApexTerminalOn D S C)
    (hbC : H.centerAt P.x
      (mem_selectedClass.mp P.x_mem_class).1 ∈ C) :
    ∃ terminalRadius : ℝ, ∃ q w : ℝ²,
      0 < terminalRadius ∧
      q ∈ (C.filter fun x => dist x S.oppApex1 = terminalRadius) \
        S.surplusCap ∧
      w ∈ (C.filter fun x => dist x S.oppApex1 = terminalRadius) \
        S.surplusCap ∧
      q ≠ w ∧
      ((SelectedClass C S.oppApex1 terminalRadius).card = 4 ∨
        (SelectedClass C S.oppApex1 terminalRadius).card = 5) ∧
      (∀ d : ℝ, 0 < d →
        4 ≤ (SelectedClass C S.oppApex1 d).card →
        d = terminalRadius) ∧
      HasNEquidistantPointsAt 4
        ((C.erase q).erase w) S.oppApex2 ∧
      RetainedPointTerminalRole S C terminalRadius q w
        (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1) ∧
      ActualBlockerCapMetricOutcome P H := by
  have hb_ne_apex :
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠
        S.oppApex1 :=
    AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 P H
  rcases
      FirstApexTerminalOn.exists_witness_with_retainedPoint_role
        hterminal hbC hb_ne_apex with
    ⟨terminalRadius, q, w, hr, hq, hw, hqw, hcard, hunique,
      hsecond, hrole⟩
  exact ⟨terminalRadius, q, w, hr, hq, hw, hqw, hcard, hunique,
    hsecond, hrole,
    Problem97.ATailRActualBlockerTransitionScratch.AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
      P H⟩

/-- Named form of the exact terminal-carrier payload, for downstream orbit
adapters that reconstruct a source-exact predecessor pair. -/
def RetainedActualBlockerTerminalPayload
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) : Prop :=
  ∃ terminalRadius : ℝ, ∃ q w : ℝ²,
    0 < terminalRadius ∧
    q ∈ (C.filter fun x => dist x S.oppApex1 = terminalRadius) \
      S.surplusCap ∧
    w ∈ (C.filter fun x => dist x S.oppApex1 = terminalRadius) \
      S.surplusCap ∧
    q ≠ w ∧
    ((SelectedClass C S.oppApex1 terminalRadius).card = 4 ∨
      (SelectedClass C S.oppApex1 terminalRadius).card = 5) ∧
    (∀ d : ℝ, 0 < d →
      4 ≤ (SelectedClass C S.oppApex1 d).card →
      d = terminalRadius) ∧
    HasNEquidistantPointsAt 4
      ((C.erase q).erase w) S.oppApex2 ∧
    RetainedPointTerminalRole S C terminalRadius q w
      (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1) ∧
    ActualBlockerCapMetricOutcome P H

/-- Package the preceding source-derived theorem under its reusable name. -/
theorem AmbientRobustHistoryPair.retainedActualBlockerTerminalPayload
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hterminal : FirstApexTerminalOn D S C)
    (hbC : H.centerAt P.x
      (mem_selectedClass.mp P.x_mem_class).1 ∈ C) :
    RetainedActualBlockerTerminalPayload P H := by
  simpa [RetainedActualBlockerTerminalPayload] using
    Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_terminalWitness_role_and_capMetricOutcome
      P H hterminal hbC

#print axioms retainedPoint_mem_terminalClass_or_ownClass_card_le_three
#print axioms retainedPoint_terminalRole
#print axioms FirstApexTerminalOn.exists_radius_with_retainedPoint_status
#print axioms FirstApexTerminalOn.exists_witness_with_retainedPoint_role
#print axioms AmbientRobustHistoryPair.exists_terminalRadius_actualBlocker_status
#print axioms AmbientRobustHistoryPair.exists_terminalRadius_status_and_capMetricOutcome
#print axioms AmbientRobustHistoryPair.exists_terminalWitness_role_and_capMetricOutcome
#print axioms AmbientRobustHistoryPair.retainedActualBlockerTerminalPayload

end ATailRFullParentEntryScratch
end Problem97
