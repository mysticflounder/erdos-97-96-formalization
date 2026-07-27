/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveGoodSourceClosure
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveKalmanson

/-!
# Exact-five `u`-heavy placement `goodSource = xu`, `omittedPeer = xv`

The regenerated `xu` row omits `xv`.  The original `u` row contains `xu`
and also omits `xv`, because `xv` is its actual blocker.  Hence these two
rows give a directed common-omission packet rather than the mutual-omission
packet available in the opposite `xv/u` placement.

The original row also forces the isosceles equality
`dist xv u = dist xv xu`, while the boundary Kalmanson comparison makes the
base `u--xu` strictly longer.  The exact missing geometric lemma for closure
is the reverse weak comparison
`dist u xu ≤ dist xv xu`; equivalently, a second selected-row ordinal
comparison crossing the `u--xu` interval would contradict this file's
strict inequality.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the `xu/xv` placement, both the original `u` row and the regenerated
`xu` row omit `xv`; the original row contains `xu` and has `xv` as blocker.
Consequently `u, xu, xv` form a strict isosceles triangle with base `u--xu`.
Any joint deletion for the regenerated pair is one of the old deleted point,
`u`, or `v`.  This is a strict narrowing, not yet a contradiction. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (hgoodXu : goodSource.1 = xu)
    (hpeerXv : Q.omittedPeer.1 = xv) :
    Q.omittedPeer.1 ∉
        ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∧
      goodSource.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∧
      Q.omittedPeer.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt
          P.u.1 P.u.2 = Q.omittedPeer.1 ∧
      dist Q.omittedPeer.1 P.u.1 =
        dist Q.omittedPeer.1 goodSource.1 ∧
      dist Q.omittedPeer.1 goodSource.1 <
        dist P.u.1 goodSource.1 ∧
      ¬ dist P.u.1 goodSource.1 ≤
        dist Q.omittedPeer.1 goodSource.1 ∧
      ∃ K : ExactFourMutualOmissionJointDeletion
          R P.rho goodSource Q.omittedPeer,
        K.deleted = P.jointDeletion.deleted ∨
          K.deleted = P.u ∨ K.deleted = P.v := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  have hblockerEqU :
      Hlate.centerAt P.u.1 P.u.2 = xv := by
    simpa only [Hlate, P.huSource] using blocker_eq
  have hpeerBlockerEq :
      Hlate.centerAt P.u.1 P.u.2 = Q.omittedPeer.1 := by
    simpa only [hpeerXv] using hblockerEqU
  have hxuURow :
      xu ∈ Ku.support := by
    have hxuInter :
        xu ∈
          Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
      simpa only [Ku, Hlate] using
        (show
          xu ∈
            (Hlate.selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [terminal.named_rows.u_row_trace]
          simp)
    exact (Finset.mem_inter.mp hxuInter).1
  have hgoodURow :
      goodSource.1 ∈ Ku.support := by
    simpa only [hgoodXu] using hxuURow
  have hpeerNotURow :
      Q.omittedPeer.1 ∉ Ku.support := by
    intro hmem
    apply Ku.center_not_mem_support
    simpa only [Ku, Hlate, hpeerBlockerEq] using hmem
  have hisosceles :
      dist Q.omittedPeer.1 P.u.1 =
        dist Q.omittedPeer.1 goodSource.1 := by
    simpa only [Ku, Hlate, hpeerBlockerEq] using
      (Ku.support_eq_radius P.u.1 Ku.q_mem_support).trans
        (Ku.support_eq_radius goodSource.1 hgoodURow).symm
  have hkalmanson :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_kalmanson
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three
  have hotherEqXv :
      P.other.1 = xv :=
    (exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_other_eq_blocker
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three).trans blocker_eq
  have hlongBase :
      dist Q.omittedPeer.1 goodSource.1 <
        dist P.u.1 goodSource.1 := by
    have hstrict :
        dist P.u.1 xv < dist P.u.1 xu := by
      simpa only [P.huSource, hotherEqXv] using hkalmanson.1
    calc
      dist Q.omittedPeer.1 goodSource.1 =
          dist P.u.1 Q.omittedPeer.1 := by
            rw [← hisosceles]
            exact dist_comm _ _
      _ = dist P.u.1 xv := by rw [hpeerXv]
      _ < dist P.u.1 xu := hstrict
      _ = dist P.u.1 goodSource.1 := by rw [hgoodXu]
  rcases
      nonempty_exactFourMutualOmissionJointDeletion
        R P.surface P.rho P.hfive goodSource Q.omittedPeer
          Q.good_peer_blockers_ne with
    ⟨K⟩
  have hdeletedTernary :
      K.deleted = P.jointDeletion.deleted ∨
        K.deleted = P.u ∨ K.deleted = P.v := by
    have hmem := K.deleted_mem_class
    rw [terminal.named_rows.physical_class] at hmem
    simp only [Finset.mem_insert, Finset.mem_union,
      Finset.mem_singleton] at hmem
    rcases hmem with hold | (hu | hxu) | hv | hxv
    · exact Or.inl (Subtype.ext hold)
    · exact Or.inr (Or.inl (Subtype.ext hu))
    · exfalso
      apply K.deleted_ne_u
      apply Subtype.ext
      exact hxu.trans hgoodXu.symm
    · exact Or.inr (Or.inr (Subtype.ext hv))
    · exfalso
      apply K.deleted_ne_v
      apply Subtype.ext
      exact hxv.trans hpeerXv.symm
  exact
    ⟨Q.omittedPeer_not_mem_good_row, hgoodURow, hpeerNotURow,
      hpeerBlockerEq, hisosceles, hlongBase, not_le_of_gt hlongBase,
      K, hdeletedTernary⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv

end ATailFrontierLiveClosure
end Problem97
