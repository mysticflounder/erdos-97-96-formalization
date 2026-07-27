/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherVHeavyExclusion
import scratch.ExactFourRigid221SourceEqUVRowOtherAdditionalSource

/-!
# Exact-four source-equals-u cross-row branch: direct v-heavy residual

The exact-five `vHeavy` packet is locally realizable: the two selected rows
only force three consecutive equal chords in the checked boundary order.
Consequently this file does not assert a false contradiction.  Instead it
combines the exact-five deletion packet with the production additional-source
packet and reduces the latter to five named placements in the rigid shell.

The reduction is strict.  Both additional sources lie in the three-point
interior `{u, v, xv}`; distinctness removes the diagonal placements, and the
row trace `{v, xv}` removes the placement with good source `v` and peer `xv`.
The remaining frontier is therefore

* `goodSource = u`, with peer `v` or point `xv`;
* `goodSource = v`, with peer `u`; or
* `goodSource` at point `xv`, with peer `u` or `v`.

All deletion, source-validity, row-omission, blocker, metric, and common-boundary
data are retained in the conclusion.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Context-complete exact-five residual for the live `vHeavy` branch.

The final disjunction is the exact five-case source-placement frontier.  A
terminal contradiction now needs information not present in the local packet:
an ordinal/metric or regenerated-row constraint that excludes these five
source-valid row configurations. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_exactFive_directResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.v.1, xv} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.v.1, xv})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {P.v.1, xv})
    (hfive : S.oppCap2.card = 5) :
    ∃ (a b : ℝ²) (goodSource peer : CarrierVertex D.A),
      a ≠ b ∧
      P.globalDeletion.deleted = {a, b} ∧
      a ∈ insert P.jointDeletion.deleted.1
        (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) ∧
      b ∈ insert P.jointDeletion.deleted.1
        (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) ∧
      (SelectedClass D.A S.oppApex2 P.rho \
          P.globalDeletion.deleted).card = 3 ∧
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, P.v.1, xv} ∧
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.u.1 ∧
      (P.other = P.v ∨ P.other.1 = xv) ∧
      ((xu ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
            P.jointDeletion.deleted.1 ∈
              S.rightAdjacentCapByIndex S.oppIndex2) ∨
        (P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∧
          xu ∈ S.rightAdjacentCapByIndex S.oppIndex2)) ∧
      (∃ (card_pos : 0 < D.A.card)
          (boundary : Fin D.A.card → ℝ²)
          (source_index xu_index v_index xv_index : Fin D.A.card),
        Function.Injective boundary ∧
        Finset.univ.image boundary = D.A ∧
        EuclideanGeometry.IsCcwConvexPolygon boundary ∧
        boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
        boundary source_index = P.u.1 ∧
        boundary xu_index = xu ∧
        boundary v_index = P.v.1 ∧
        boundary xv_index = xv ∧
        ((v_index < source_index ∧
            source_index < xv_index ∧
            xv_index < xu_index) ∨
          (xu_index < xv_index ∧
            xv_index < source_index ∧
            source_index < v_index))) ∧
      dist P.u.1 P.v.1 = dist P.u.1 xv ∧
      dist P.u.1 xv = dist xv xu ∧
      goodSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      goodSource.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      goodSource ∈ outsideFirstApexFiber R ∧
      (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt
              goodSource.1 goodSource.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt
              goodSource.1 goodSource.2)) ∧
      goodSource.1 ∈
        insert P.jointDeletion.deleted.1
          (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) ∧
      peer ≠ goodSource ∧
      peer.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      peer.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      peer.1 ∉
        ((lateFirstApexSystem R).selectedAt
          goodSource.1 goodSource.2).toCriticalFourShell.support ∧
      ((lateFirstApexSystem R).centerAt
          goodSource.1 goodSource.2) ≠
        (lateFirstApexSystem R).centerAt peer.1 peer.2 ∧
      peer.1 ∈
        insert P.jointDeletion.deleted.1
          (({P.u.1, xu} : Finset ℝ²) ∪ {P.v.1, xv}) ∧
      ((goodSource = P.u ∧
          (peer = P.v ∨ peer.1 = xv)) ∨
        (goodSource = P.v ∧ peer = P.u) ∨
        (goodSource.1 = xv ∧
          (peer = P.u ∨ peer = P.v))) := by
  classical
  obtain ⟨a, b, hab, hdeleted, ha, hb, hremaining,
      hinterior, hvBlocker, hother, hadjacent, hboundary⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_exactFiveDeletion
      P hblockerVRow hblockerNeV xu xv terminal blocker_eq
        pair_interior blocker_interior row_cap_trace hfive
  obtain ⟨xu', xv', terminal', blocker_eq', _blocker_mem',
      _blocker_ne', goodSource, hgoodClass, hgoodInterior,
      hgoodOutside, hgoodSurvival, hgoodNamed, peer, hpeerNe,
      hpeerClass, hpeerInterior, hpeerOmitted, hblockersNe,
      hpeerNamed⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_additionalSourceResidual
      P hblockerVRow hblockerNeV
  have hxu'Mem : xu' ∈ ({P.u.1, xu} : Finset ℝ²) := by
    rw [← terminal.named_rows.u_row_trace,
      terminal'.named_rows.u_row_trace]
    simp
  have hxu'Eq : xu' = xu := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxu'Mem
    rcases hxu'Mem with hxu'U | hxu'Xu
    · exact (terminal'.named_rows.xu_ne_u hxu'U).elim
    · exact hxu'Xu
  have hxv'Mem : xv' ∈ ({P.v.1, xv} : Finset ℝ²) := by
    rw [← terminal.named_rows.v_row_trace,
      terminal'.named_rows.v_row_trace]
    simp
  have hxv'Eq : xv' = xv := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxv'Mem
    rcases hxv'Mem with hxv'V | hxv'Xv
    · exact (terminal'.named_rows.xv_ne_v hxv'V).elim
    · exact hxv'Xv
  subst xu'
  rw [hxv'Eq] at terminal' blocker_eq' hgoodNamed hpeerNamed
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  have huMem : P.u.1 ∈ Ku.support := by
    simpa [Ku] using Ku.q_mem_support
  have hxuMem : xu ∈ Ku.support := by
    have hmem :
        xu ∈ Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
      rw [show
        Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, xu} by
          simpa [Ku] using terminal.named_rows.u_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hvMem : P.v.1 ∈ Kv.support := by
    simpa [Kv] using Kv.q_mem_support
  have hxvMem : xv ∈ Kv.support := by
    have hmem :
        xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
      rw [show
        Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho =
            {P.v.1, xv} by
          simpa [Kv] using terminal.named_rows.v_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hblockerEqU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
    simpa [P.huSource] using blocker_eq
  have huMetric : dist P.u.1 xv = dist xv xu := by
    have hraw :=
      (Ku.support_eq_radius P.u.1 huMem).trans
        (Ku.support_eq_radius xu hxuMem).symm
    rw [dist_comm P.u.1 xv]
    simpa [Ku, hblockerEqU] using hraw
  have hvMetric : dist P.u.1 P.v.1 = dist P.u.1 xv := by
    have hraw :=
      (Kv.support_eq_radius P.v.1 hvMem).trans
        (Kv.support_eq_radius xv hxvMem).symm
    simpa [Kv, hvBlocker] using hraw
  have hgoodPlacement :
      goodSource = P.u ∨ goodSource = P.v ∨ goodSource.1 = xv := by
    rw [hinterior] at hgoodInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hgoodInterior
    rcases hgoodInterior with hgoodU | hgoodV | hgoodXv
    · exact Or.inl (Subtype.ext hgoodU)
    · exact Or.inr (Or.inl (Subtype.ext hgoodV))
    · exact Or.inr (Or.inr hgoodXv)
  have hpeerPlacement :
      peer = P.u ∨ peer = P.v ∨ peer.1 = xv := by
    rw [hinterior] at hpeerInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpeerInterior
    rcases hpeerInterior with hpeerU | hpeerV | hpeerXv
    · exact Or.inl (Subtype.ext hpeerU)
    · exact Or.inr (Or.inl (Subtype.ext hpeerV))
    · exact Or.inr (Or.inr hpeerXv)
  have hplacements :
      (goodSource = P.u ∧ (peer = P.v ∨ peer.1 = xv)) ∨
        (goodSource = P.v ∧ peer = P.u) ∨
        (goodSource.1 = xv ∧ (peer = P.u ∨ peer = P.v)) := by
    rcases hgoodPlacement with hgoodU | hgoodV | hgoodXv
    · rcases hpeerPlacement with hpeerU | hpeerV | hpeerXv
      · exact (hpeerNe (hpeerU.trans hgoodU.symm)).elim
      · exact Or.inl ⟨hgoodU, Or.inl hpeerV⟩
      · exact Or.inl ⟨hgoodU, Or.inr hpeerXv⟩
    · rcases hpeerPlacement with hpeerU | hpeerV | hpeerXv
      · exact Or.inr (Or.inl ⟨hgoodV, hpeerU⟩)
      · exact (hpeerNe (hpeerV.trans hgoodV.symm)).elim
      · exfalso
        apply hpeerOmitted
        rw [hgoodV, hpeerXv]
        exact hxvMem
    · rcases hpeerPlacement with hpeerU | hpeerV | hpeerXv
      · exact Or.inr (Or.inr ⟨hgoodXv, Or.inl hpeerU⟩)
      · exact Or.inr (Or.inr ⟨hgoodXv, Or.inr hpeerV⟩)
      · exact
          (hpeerNe (Subtype.ext (hpeerXv.trans hgoodXv.symm))).elim
  exact
    ⟨a, b, goodSource, peer, hab, hdeleted, ha, hb, hremaining,
      hinterior, hvBlocker, hother, hadjacent, hboundary, hvMetric,
      huMetric, hgoodClass, hgoodInterior, hgoodOutside, hgoodSurvival,
      hgoodNamed, hpeerNe, hpeerClass, hpeerInterior, hpeerOmitted,
      hblockersNe, hpeerNamed, hplacements⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_exactFive_directResidual

end ATailFrontierLiveClosure
end Problem97
