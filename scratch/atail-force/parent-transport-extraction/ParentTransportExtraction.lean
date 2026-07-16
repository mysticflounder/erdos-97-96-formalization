/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.U1Depth5Prefix

/-!
# Parent common-system transport boundary

This scratch module records what the concrete `Hcritical` retained by the
outer U1 tail can and cannot transport before the weakened K-A interface
forgets that the five live rows came from that same system.

The positive results are bookkeeping:

* the parent can retain a `CriticalPairFrontier` indexed by its exact system;
* a cap-local directed cross row has an immediate choice-invariant reading;
* the robust two-direction survival arm retains two distinct actual blockers,
  each separated from both Moser apices in the card-five branch.

The selector-dependence result is also exact: pointwise override followed by
the parent's ordinary row constructor can make the live `t2` row choose any
certified deletion blocker.  Thus common provenance alone cannot produce the
non-apex/cap-local/cross-incidence fields of the unique-row terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILParentTransportExtraction

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- Choice-invariant unique-row output.  This is deliberately independent of
any preselected global `CriticalShellSystem`. -/
def ExistsSurplusPairCriticalBlocker
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (apex q w : ℝ²) : Prop :=
  ∃ source : ℝ², ∃ _hsource : source ∈ D.A, ∃ center : ℝ²,
    center ∈ S.surplusCap ∧ center ≠ apex ∧
    ∃ C : CriticalSelectedFourClass D.A source center,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center ∧
      q ∈ C.toCriticalFourShell.support ∧
      w ∈ C.toCriticalFourShell.support

/-- The outer parent's `t2` row is definitionally the row selected by its
retained common critical system. -/
theorem parent_t2_row_provenance
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    (H : CriticalShellSystem D.A)
    (hqA : q ∈ D.A) (ht1A : t1 ∈ D.A) (ht2A : t2 ∈ D.A)
    (ht3A : t3 ∈ D.A) (huA : u ∈ D.A) :
    let rows := U1Depth5.CriticalSourceRows.ofCriticalShellSystem
      H hqA ht1A ht2A ht3A huA
    (rows.rowAt U1Depth5.CriticalSource.t2).center =
        H.centerAt t2 ht2A ∧
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        (H.selectedAt t2 ht2A).toCriticalFourShell.support := by
  simp [U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
    U1Depth5.CriticalSourceRows.rowAt,
    U1Depth5.CriticalRowPacket.ofCriticalShellSystem]

/-- Selector dependence survives the parent constructor.  Given any certified
deletion blocker for `t2`, override can choose it and rebuilding the five rows
makes the parent's `t2` row use exactly that blocker and shell. -/
theorem parent_common_system_can_select_certified_t2_blocker
    {D : CounterexampleData} {q t1 t2 t3 u center : ℝ²}
    (H0 : CriticalShellSystem D.A)
    (hqA : q ∈ D.A) (ht1A : t1 ∈ D.A) (ht2A : t2 ∈ D.A)
    (ht3A : t3 ∈ D.A) (huA : u ∈ D.A)
    (C : CriticalSelectedFourClass D.A t2 center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A.erase t2) center) :
    ∃ H : CriticalShellSystem D.A,
      let rows := U1Depth5.CriticalSourceRows.ofCriticalShellSystem
        H hqA ht1A ht2A ht3A huA
      (rows.rowAt U1Depth5.CriticalSource.t2).center = center ∧
        (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
          C.toCriticalFourShell.support := by
  let H := H0.overrideAt C hblocked
  refine ⟨H, ?_⟩
  constructor
  · exact H0.overrideAt_centerAt C hblocked ht2A
  · simp [H, U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
      U1Depth5.CriticalSourceRows.rowAt,
      U1Depth5.CriticalRowPacket.ofCriticalShellSystem,
      CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
      CriticalShellSystem.overrideAt]
    rw [if_pos rfl]

/-- The same concrete parent system can retain the complete dependent
critical-pair frontier if extraction is performed before passing through the
weakened pair interface. -/
theorem parent_system_retains_criticalPairFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (Hcritical : CriticalShellSystem D.A) :
    ∃ r : ℝ, 0 < r ∧
      Nonempty (CriticalPairFrontier D S r Hcritical) := by
  rcases exists_criticalPairFrontier_of_K4 D S Hcritical with
    ⟨r, hr, _hfour, F⟩
  exact ⟨r, hr, F⟩

private theorem firstApex_survives_source_q_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 := by
  have hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card := by omega
  have hfour :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le hfive
  exact ⟨r, hr, by simpa [SelectedClass] using hfour⟩

private theorem firstApex_survives_source_w_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex1 := by
  have hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card := by omega
  have hfour :
      4 ≤ (SelectedClass (D.A.erase P.w) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le hfive
  exact ⟨r, hr, by simpa [SelectedClass] using hfour⟩

/-- On the card-five arm, one retained cap-local directed cross row already
has the corrected choice-invariant unique-row interpretation.  The only
content-bearing inputs are the cross hit and blocker localization. -/
theorem choiceInvariantBlocker_of_cardFive_left_capLocalCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcross :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcenterCap : H.centerAt P.q P.q_mem_A ∈ S.surplusCap) :
    ExistsSurplusPairCriticalBlocker S S.oppApex1 P.q P.w := by
  have hcenterNe : H.centerAt P.q P.q_mem_A ≠ S.oppApex1 :=
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H P.q_mem_A
        (firstApex_survives_source_q_of_card_five P hr hcard)
  exact ⟨P.q, P.q_mem_A, H.centerAt P.q P.q_mem_A,
    hcenterCap, hcenterNe, H.selectedAt P.q P.q_mem_A,
    H.no_qfree_at P.q P.q_mem_A,
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support,
    hcross⟩

/-- Right-oriented mirror of
`choiceInvariantBlocker_of_cardFive_left_capLocalCross`. -/
theorem choiceInvariantBlocker_of_cardFive_right_capLocalCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcross :
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support)
    (hcenterCap : H.centerAt P.w P.w_mem_A ∈ S.surplusCap) :
    ExistsSurplusPairCriticalBlocker S S.oppApex1 P.q P.w := by
  have hcenterNe : H.centerAt P.w P.w_mem_A ≠ S.oppApex1 :=
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H P.w_mem_A
        (firstApex_survives_source_w_of_card_five P hr hcard)
  exact ⟨P.w, P.w_mem_A, H.centerAt P.w P.w_mem_A,
    hcenterCap, hcenterNe, H.selectedAt P.w P.w_mem_A,
    H.no_qfree_at P.w P.w_mem_A, hcross,
    (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.q_mem_support⟩

/-- The exact four-center data retained on the two-direction robust arm.
The two actual blockers are distinct and both avoid both opposite apices. -/
structure RobustFourCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Prop where
  q_cross_survives :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
      (H.centerAt P.q P.q_mem_A)
  w_cross_survives :
    HasNEquidistantPointsAt 4 (D.A.erase P.q)
      (H.centerAt P.w P.w_mem_A)
  q_blocker_ne_oppApex1 : H.centerAt P.q P.q_mem_A ≠ S.oppApex1
  w_blocker_ne_oppApex1 : H.centerAt P.w P.w_mem_A ≠ S.oppApex1
  q_blocker_ne_oppApex2 : H.centerAt P.q P.q_mem_A ≠ S.oppApex2
  w_blocker_ne_oppApex2 : H.centerAt P.w P.w_mem_A ≠ S.oppApex2
  blockers_ne :
    H.centerAt P.q P.q_mem_A ≠ H.centerAt P.w P.w_mem_A

/-- Card five plus robust survival in both actual blocker rows gives the
four-center packet without any selector reconstruction or row-provenance
transport. -/
theorem robustFourCenterPacket_of_cardFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hqCross :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A))
    (hwCross :
      HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt P.w P.w_mem_A)) :
    RobustFourCenterPacket P := by
  have hqFirst : H.centerAt P.q P.q_mem_A ≠ S.oppApex1 :=
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H P.q_mem_A
        (firstApex_survives_source_q_of_card_five P hr hcard)
  have hwFirst : H.centerAt P.w P.w_mem_A ≠ S.oppApex1 :=
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      H P.w_mem_A
        (firstApex_survives_source_w_of_card_five P hr hcard)
  have hblockers :
      H.centerAt P.q P.q_mem_A ≠ H.centerAt P.w P.w_mem_A := by
    intro hEq
    apply H.no_qfree_at P.w P.w_mem_A
    simpa [hEq] using hqCross
  exact
    { q_cross_survives := hqCross
      w_cross_survives := hwCross
      q_blocker_ne_oppApex1 := hqFirst
      w_blocker_ne_oppApex1 := hwFirst
      q_blocker_ne_oppApex2 := P.q_blocker_ne_oppApex2
      w_blocker_ne_oppApex2 := P.w_blocker_ne_oppApex2
      blockers_ne := hblockers }

#print axioms parent_t2_row_provenance
#print axioms parent_common_system_can_select_certified_t2_blocker
#print axioms parent_system_retains_criticalPairFrontier
#print axioms choiceInvariantBlocker_of_cardFive_left_capLocalCross
#print axioms choiceInvariantBlocker_of_cardFive_right_capLocalCross
#print axioms robustFourCenterPacket_of_cardFive

end ATAILParentTransportExtraction
end Problem97
