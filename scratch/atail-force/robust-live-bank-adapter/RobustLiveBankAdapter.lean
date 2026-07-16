/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ParentTransportExtraction
import RobustParentBoundary
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Live robust adapter for the forward I/O/E/J bank match

The checkpoint-faithful roles are

* `O = S.oppApex1`;
* `E = P.q`;
* `J = j`, a point of the same first-apex marginal, distinct from `P.q`; and
* `I = z`, a strict-surplus center.

In the pinned checkpoint, `J` is not `P.w`: that checkpoint has `P.w = D`.
The weakest sink below does not need that extra freshness and permits
`j = P.w` on a general live parent.

The first-apex marginal automatically gives `dist O E = dist O J`.  If `I`
lies in the strict surplus-cap interior and one globally selected row at `I`
contains `E,J`, then `dist I E = dist I J`.  The two distinct cap centers
`O,I` therefore repeat the outside pair `E,J`, contradicting the production
theorem `CapSelectedRowCounting.outsidePair_unique_capCenter`.

This is smaller than the reverse three-row presentation: it needs no selected
row at `O` or `E`, no cyclic-order packet, and no finite Census-554 labels.
The generic sink does not require blocker-shell provenance.  The live packet
below records membership of `z` in the `P.q` blocker shell only as one
candidate producer strategy; other strict-surplus centers can feed the same
generic sink.  The file is scratch-only.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace RobustLiveBankAdapter

open Problem97.ATAILStageOnePrescribedApexDichotomy
open Problem97.ATAILParentTransportExtraction
open Problem97.ATailForce.RobustFourCenter

attribute [local instance] Classical.propDecidable

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem oppApex1_ne_of_mem_surplusInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) {z : ℝ²}
    (hzI : z ∈ S.capInteriorByIndex S.surplusIdx) :
    S.oppApex1 ≠ z := by
  intro h
  subst z
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, hi] at hzI

/-- Smallest metric sink exposed by the forward bank match.

Both outside points lie in one first-apex marginal.  A strict surplus-cap
center cannot be a second center for the same outside pair. -/
theorem false_of_surplusInterior_bisects_marginalPair
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {r : ℝ} {z q j : ℝ²}
    (hzI : z ∈ S.capInteriorByIndex S.surplusIdx)
    (hqT : q ∈
      (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap)
    (hjT : j ∈
      (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap)
    (hqj : q ≠ j)
    (hzEq : dist z q = dist z j) : False := by
  classical
  rcases Finset.mem_sdiff.mp hqT with ⟨hqFilter, hqOff⟩
  rcases Finset.mem_sdiff.mp hjT with ⟨hjFilter, hjOff⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  rcases Finset.mem_filter.mp hjFilter with ⟨hjA, hjRadius⟩
  have hfirstEq :
      dist S.oppApex1 q = dist S.oppApex1 j := by
    simpa only [dist_comm] using hqRadius.trans hjRadius.symm
  have hzCapIndex : z ∈ S.capByIndex S.surplusIdx :=
    S.capInteriorByIndex_subset_capByIndex S.surplusIdx hzI
  have hzCap : z ∈ S.surplusCap := by
    rwa [capByIndex_surplusIdx_eq_surplusCap S] at hzCapIndex
  have hfirstCap : S.oppApex1 ∈ S.surplusCap :=
    oppApex1_mem_surplusCap S
  have hcentersNe : S.oppApex1 ≠ z :=
    oppApex1_ne_of_mem_surplusInterior S hzI
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcapSurplus : S.capByIndex S.surplusIdx = S.surplusCap :=
    capByIndex_surplusIdx_eq_surplusCap S
  have hfirstImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hfirstCap
  have hzImage : z ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hzCap
  rcases Finset.mem_image.mp hfirstImage with ⟨a, _ha, haFirst⟩
  rcases Finset.mem_image.mp hzImage with ⟨b, _hb, hbZ⟩
  have hab : a ≠ b := by
    intro h
    apply hcentersNe
    calc
      S.oppApex1 = L.points a := haFirst.symm
      _ = L.points b := by simp [h]
      _ = z := hbZ
  have hqOutside : q ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hqOff
  have hjOutside : j ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hjOff
  rcases lt_or_gt_of_ne hab with hab' | hba'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hab' hqA hjA hqOutside hjOutside hqj
        (by simpa [haFirst] using hfirstEq)
        (by simpa [hbZ] using hzEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hba' hqA hjA hqOutside hjOutside hqj
        (by simpa [hbZ] using hzEq)
        (by simpa [haFirst] using hfirstEq)

/-- Row-facing form of the same sink.  Global K4 supplies the row object;
the two prescribed support memberships are the metric producer. -/
theorem false_of_surplusInterior_row_contains_marginalPair
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {r : ℝ} {z q j : ℝ²}
    (hzI : z ∈ S.capInteriorByIndex S.surplusIdx)
    (hqT : q ∈
      (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap)
    (hjT : j ∈
      (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap)
    (hqj : q ≠ j)
    (Kz : SelectedFourClass D.A z)
    (hqKz : q ∈ Kz.support) (hjKz : j ∈ Kz.support) : False := by
  apply false_of_surplusInterior_bisects_marginalPair S hzI hqT hjT hqj
  exact (Kz.support_eq_radius q hqKz).trans
    (Kz.support_eq_radius j hjKz).symm

/-- A q-shell-anchored candidate producer packet over the live parent.

This is deliberately existential in its center `z`; it does not ask for a
completion of every possible blocker-support choice.  The q-shell provenance
is one producer strategy and is not used by the generic contradiction sink.
In particular, it is not itself a membership statement about the new row
centered at `z`. -/
structure LiveForwardBankProducer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) where
  z : ℝ²
  z_mem_qShell :
    z ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  j : ℝ²
  j_mem_marginal :
    j ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap
  j_ne_q : j ≠ P.q
  z_mem_surplusInterior : z ∈ S.capInteriorByIndex S.surplusIdx
  zRow : SelectedFourClass D.A z
  q_mem_zRow : P.q ∈ zRow.support
  j_mem_zRow : j ∈ zRow.support

theorem false_of_liveForwardBankProducer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (L : LiveForwardBankProducer P) : False := by
  exact false_of_surplusInterior_row_contains_marginalPair S
    L.z_mem_surplusInterior P.q_mem_marginal L.j_mem_marginal
    L.j_ne_q.symm L.zRow L.q_mem_zRow L.j_mem_zRow

/-- Existential parent sink: one completed q-shell candidate suffices. -/
theorem false_of_nonempty_liveForwardBankProducer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (produce : Nonempty (LiveForwardBankProducer P)) : False := by
  rcases produce with ⟨L⟩
  exact false_of_liveForwardBankProducer P L

/-- Global K4 automatically supplies some row centered at the q-shell support
point.  It does not supply either prescribed membership in that row. -/
theorem exists_zRow_of_globalK4
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {z : ℝ²}
    (hzShell :
      z ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    Nonempty (SelectedFourClass D.A z) := by
  have hzA : z ∈ D.A :=
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_subset_A
      hzShell
  exact exists_selectedFourClass_of_globalK4 D.K4 hzA

private theorem exists_mem_ne_two
    {A : Type*} [DecidableEq A] (T : Finset A)
    (hcard : 3 ≤ T.card) (a b : A) :
    ∃ x, x ∈ T ∧ x ≠ a ∧ x ≠ b := by
  by_contra hnone
  have hsub : T ⊆ ({a, b} : Finset A) := by
    intro x hx
    by_cases hxa : x = a
    · simp [hxa]
    by_cases hxb : x = b
    · simp [hxb]
    exact False.elim (hnone ⟨x, hx, hxa, hxb⟩)
  have hle := Finset.card_le_card hsub
  have hpair : ({a, b} : Finset A).card ≤ 2 := by
    calc
      ({a, b} : Finset A).card ≤ ({b} : Finset A).card + 1 :=
        Finset.card_insert_le a {b}
      _ = 2 := by simp
  omega

/-- On the card-five arm a checkpoint-faithful `J`, distinct from both stored
frontier sources, is automatic.  This theorem produces only the marginal
role; it says nothing about the new row at `I`. -/
theorem exists_freshMarginalPoint_of_cardFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    ∃ j : ℝ²,
      j ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap ∧
      j ≠ P.q ∧ j ≠ P.w := by
  classical
  let F := D.A.filter fun x => dist x S.oppApex1 = r
  let T := F \ S.surplusCap
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hFcard : F.card = 5 := by
    have hselected : SelectedClass D.A S.oppApex1 r = F := by
      ext x
      simp [SelectedClass, F, dist_comm]
    rw [← hselected]
    exact hcard
  have hhit : (F ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, F] using
      U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  have hTcard : 3 ≤ T.card := by
    dsimp [T]
    omega
  rcases exists_mem_ne_two T hTcard P.q P.w with
    ⟨j, hjT, hjq, hjw⟩
  exact ⟨j, by simpa [T, F] using hjT, hjq, hjw⟩

/-- Optional robust-specific extraction.  This projects the q-shell candidate
from the existing two-shell object without indexing the consumer packet by
that larger object.  It produces no surplus placement or prescribed row
membership. -/
theorem exists_strict_qShellPoint_of_robustFourCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (R : RobustFourCenterPacket P) :
    ∃ z : ℝ²,
      z ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
      z ≠ S.oppApex1 ∧ z ≠ P.q ∧ z ≠ P.w := by
  rcases nonempty_strictTwoBlockerSupportCenters_of_crossSurvival
      P R.w_cross_survives with ⟨C⟩
  exact ⟨C.zq, C.zq_mem_qShell, C.zq_ne_firstApex,
    C.zq_ne_q, C.zq_ne_w⟩

#print axioms false_of_surplusInterior_bisects_marginalPair
#print axioms false_of_surplusInterior_row_contains_marginalPair
#print axioms false_of_liveForwardBankProducer
#print axioms false_of_nonempty_liveForwardBankProducer
#print axioms exists_zRow_of_globalK4
#print axioms exists_freshMarginalPoint_of_cardFive
#print axioms exists_strict_qShellPoint_of_robustFourCenterPacket

end RobustLiveBankAdapter
end ATailForce
end Problem97
