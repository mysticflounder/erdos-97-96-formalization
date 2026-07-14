/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# Rank-1 ATAIL producer: the exact orientation forced by a cross hit

This scratch file audits the proposed rank-1 residue-930 producer.  Once the
actual critical shell selected at source `q` also contains `w`, the first-apex
circle and that critical circle have the two distinct common points `q,w`.
Convex independence makes the center chord nondegenerate, and the existing
reflection kernel then forces the two points onto *opposite* strict sides of
the center chord.

Consequently the rank-1 sink's positive signed-area product is not an
additional consequence of the cross membership.  It is precisely the
contradictory order antecedent that a live cap/order producer would still
have to force.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRank1ProducerScratch

open ATAILStageOnePrescribedApexDichotomy

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

/-- Reverse the ordered source choice in a survivor pair. -/
private def swapPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    SurvivorPairRelocationPacket D S r H where
  q := P.w
  w := P.q
  q_mem_A := P.w_mem_A
  w_mem_A := P.q_mem_A
  q_mem_marginal := P.w_mem_marginal
  w_mem_marginal := P.q_mem_marginal
  q_ne_w := P.q_ne_w.symm
  q_survives := P.w_survives
  w_survives := P.q_survives
  q_blocker_ne_oppApex2 := P.w_blocker_ne_oppApex2
  w_blocker_ne_oppApex2 := P.q_blocker_ne_oppApex2

/-- A cross hit in the actual selected critical row forces the two common
points onto opposite strict sides of the chord joining the first apex to the
chosen blocker.  The only extra input is separation of those two centers. -/
theorem signedArea_product_neg_of_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcenters : H.centerAt P.q P.q_mem_A ≠ S.oppApex1) :
    signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
        signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) < 0 := by
  have hqFirst : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hwFirst : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  have hqBlocker :
      dist P.q (H.centerAt P.q P.q_mem_A) =
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius := by
    simpa only [dist_comm] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.q
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
  have hwBlocker :
      dist P.w (H.centerAt P.q P.q_mem_A) =
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius := by
    simpa only [dist_comm] using
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwShell
  have hmid :
      signedArea2 (midpoint ℝ P.q P.w) S.oppApex1
        (H.centerAt P.q P.q_mem_A) = 0 :=
    twoCircle_midpoint_collinear hwFirst hqFirst hwBlocker hqBlocker
      P.q_ne_w.symm
  have hflip :
      signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) =
        -signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) :=
    signedArea2_reflection_neg hmid
  have hq_ne_apex : P.q ≠ S.oppApex1 := by
    intro h
    exact (Finset.mem_sdiff.mp P.q_mem_marginal).2
      (by
        rcases hi : S.surplusIdx with ⟨i, hi3⟩
        interval_cases i
        · simpa [h, SurplusCapPacket.surplusCap,
            SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
        · simpa [h, SurplusCapPacket.surplusCap,
            SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
        · simpa [h, SurplusCapPacket.surplusCap,
            SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3)
  have hq_ne_blocker : P.q ≠ H.centerAt P.q P.q_mem_A := by
    intro h
    apply H.blockerVertex_ne ⟨P.q, P.q_mem_A⟩
    apply Subtype.ext
    exact h.symm
  have harea_ne :
      signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear
      P.q_mem_A (oppApex1_mem_A S) (blocker_mem_A H P.q_mem_A)
      hq_ne_apex hq_ne_blocker hcenters.symm
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  rw [hflip]
  nlinarith [sq_pos_of_ne_zero harea_ne]

/-- Swapping the source orientation does not create the desired positive
packet: a reciprocal cross hit is forced onto opposite strict sides as well. -/
theorem signedArea_product_neg_of_reciprocal_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqShell :
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support)
    (hcenters : H.centerAt P.w P.w_mem_A ≠ S.oppApex1) :
    signedArea2 P.q S.oppApex1 (H.centerAt P.w P.w_mem_A) *
        signedArea2 P.w S.oppApex1 (H.centerAt P.w P.w_mem_A) < 0 := by
  simpa [swapPair] using
    signedArea_product_neg_of_cross_membership (swapPair P) hqShell hcenters

/-- At the rank-1 boundary, a same-side/order producer and a cross membership
close immediately.  This corollary is intentionally phrased with the actual
`SurvivorPairRelocationPacket`, not a detached finite row pattern. -/
theorem false_of_cross_membership_of_sameSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcenters : H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hsameSide :
      0 < signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
        signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A)) :
    False := by
  have hopp := signedArea_product_neg_of_cross_membership
    P hwShell hcenters
  linarith

/-- Deletion failure at `w` for the blocker selected at `q` is exactly a
sufficient live antecedent for the missing cross membership. -/
theorem false_of_cross_deletion_blocked_of_sameSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A))
    (hcenters : H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hsameSide :
      0 < signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
        signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A)) :
    False := by
  have hwShell :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt P.q P.q_mem_A) hwblocked
  exact false_of_cross_membership_of_sameSide
    P hwShell hcenters hsameSide

/-- Exact branch normal form at the blocker selected for source `q`: deleting
`w` either preserves a four-point class there, or the same chosen critical
shell contains `w`.  No cap, MEC, or live-row hypothesis is needed. -/
theorem cross_deletion_survives_or_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) ∨
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
  by_cases hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A)
  · exact Or.inl hsurvives
  · exact Or.inr
      (source_mem_critical_support_of_no_qfree
        (H.selectedAt P.q P.q_mem_A) hsurvives)

/-- In the unique card-five first-apex branch, deleting either chosen source
leaves the other four class members, so the actual blocker at that source is
automatically different from the first apex. -/
theorem blocker_ne_oppApex1_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
  have hqSelected : P.q ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _⟩
    rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqRadius⟩
  have hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card := by
    omega
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le hfive
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 :=
    ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩
  exact actual_blocker_ne_of_deletion_survives
    H P.q_mem_A hsurvives

/-- Exact card-five branch normal form for the rank-1 attempt.  Either the
cross deletion survives at `q`'s actual blocker, or the missing cross hit is
present and the two common points are forced onto opposite strict sides.

The absent positive-sign branch is therefore not a geometric default; it
would be a separate cap/order contradiction. -/
theorem card_five_cross_deletion_survives_or_cross_oppositeSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) ∨
      (P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
        signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
          signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) < 0) := by
  rcases cross_deletion_survives_or_cross_membership P with
    hsurvives | hwShell
  · exact Or.inl hsurvives
  · exact Or.inr ⟨hwShell,
      signedArea_product_neg_of_cross_membership P hwShell
        (blocker_ne_oppApex1_of_card_five P hr hcard)⟩

/-- If an independent cap/order argument supplies the forbidden positive
product, the exact branch normal form collapses to cross-deletion survival.
This makes the first missing antecedent explicit: to fire rank 1 one must
refute this survival branch (or consume it elsewhere). -/
theorem cross_deletion_survives_of_sameSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcenters : H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hsameSide :
      0 < signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
        signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A)) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) := by
  rcases cross_deletion_survives_or_cross_membership P with
    hsurvives | hwShell
  · exact hsurvives
  · exact False.elim
      (false_of_cross_membership_of_sameSide
        P hwShell hcenters hsameSide)

#print axioms signedArea_product_neg_of_cross_membership
#print axioms signedArea_product_neg_of_reciprocal_cross_membership
#print axioms false_of_cross_membership_of_sameSide
#print axioms false_of_cross_deletion_blocked_of_sameSide
#print axioms cross_deletion_survives_or_cross_membership
#print axioms blocker_ne_oppApex1_of_card_five
#print axioms card_five_cross_deletion_survives_or_cross_oppositeSide
#print axioms cross_deletion_survives_of_sameSide

end ATailRank1ProducerScratch
end Problem97
