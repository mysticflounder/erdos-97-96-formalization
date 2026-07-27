/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyLargeCapDirect

/-!
# Exact-four source-equals-u cross-row branch: large-cap placement exclusion

The fourth strict-interior point extracted in the large `uHeavy` arm has
three possible placements.  If it is `v`, the two named points of the
`v`-row are both strict-interior points.  Two-center localization then puts
the actual `v`-blocker in the same strict interior, and one-sided distance
injectivity makes `{v, xv}` the complete `v`-row trace on the cap.

This does not presently contradict the large-cap hypotheses.  It does,
however, sharpen the minimal six-point cap: its strict interior has
cardinality four, so the generic four-interior crossing lemma forces the
`v`-blocker to be `u` or `xu`.  Thus the raw `z = v` placement is replaced
by either a cap of cardinality at least seven or this explicit blocker
coincidence.  The deleted-point and outside-physical-class placements retain
their full source-clean witnesses.
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

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The geometry forced when the extra strict-interior point is `v`. -/
structure ExactFourRigid221SourceEqUVRowOtherVInteriorPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (v : CarrierVertex D.A) (xv : ℝ²) : Prop where
  v_interior :
    v.1 ∈ S.capInteriorByIndex S.oppIndex2
  xv_interior :
    xv ∈ S.capInteriorByIndex S.oppIndex2
  blocker_interior :
    (lateFirstApexSystem R).centerAt v.1 v.2 ∈
      S.capInteriorByIndex S.oppIndex2
  row_cap_trace :
    ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2 = {v.1, xv}

/-- The source-clean residual after eliminating the unstructured `z = v`
placement.  In the exact-six subcase the opposite blocker crosses to the
source pair; otherwise the cap has at least seven points. -/
inductive
    ExactFourRigid221SourceEqUVRowOtherUHeavyLargeCapNarrowedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²) : Prop
  | v_cap_ge_seven
      (packet :
        ExactFourRigid221SourceEqUVRowOtherVInteriorPacket R P.v xv)
      (secondOppCap_card_ge_seven : 7 ≤ S.oppCap2.card)
  | v_exact_six_cross_blocker
      (packet :
        ExactFourRigid221SourceEqUVRowOtherVInteriorPacket R P.v xv)
      (secondOppCap_card_eq_six : S.oppCap2.card = 6)
      (v_blocker_eq_source_point :
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.u.1 ∨
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = xu)
  | deleted_interior
      (deleted_mem_interior :
        P.jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2)
      (deleted_mem_cap :
        P.jointDeletion.deleted.1 ∈ S.capByIndex S.oppIndex2)
      (deleted_mem_A : P.jointDeletion.deleted.1 ∈ D.A)
      (deleted_not_named :
        P.jointDeletion.deleted.1 ∉
          ({P.u.1, xu, xv} : Finset ℝ²))
      (deleted_not_source_row :
        P.jointDeletion.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support)
  | outside_physical_class
      (z : ℝ²)
      (z_mem_interior : z ∈ S.capInteriorByIndex S.oppIndex2)
      (z_mem_cap : z ∈ S.capByIndex S.oppIndex2)
      (z_mem_A : z ∈ D.A)
      (z_not_named : z ∉ ({P.u.1, xu, xv} : Finset ℝ²))
      (z_not_source_row :
        z ∉
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support)
      (z_not_physical_class :
        z ∉ SelectedClass D.A S.oppApex2 P.rho)

/-- The large `uHeavy` arm reduces to the exact-six cross-blocker packet,
a cap of cardinality at least seven, a strict-interior deleted point, or a
fresh strict-interior point outside the physical five-class. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_secondOppositeLarge_exclusion
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
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {P.u.1, xu})
    (secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
    (secondInterior_card_ge_four :
      4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
    (robust_growth : ExactFourRobustCapGrowth S) :
    ExactFourRigid221SourceEqUVRowOtherUHeavyLargeCapNarrowedResidual
      R P xu xv := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  let J := S.capInteriorByIndex S.oppIndex2
  let cap := S.capByIndex S.oppIndex2
  let C := SelectedClass D.A S.oppApex2 P.rho
  obtain ⟨z, hzJ, hzCap, hzA, hzNotNamed, hzNotKu,
      hzV | hzDeleted | hzOutside⟩ :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_secondOppositeLarge_extraInterior
      P xu xv terminal blocker_eq pair_interior blocker_interior
        row_cap_trace secondOppCap_card_ge_six
        secondInterior_card_ge_four robust_growth
  · subst z
    have huInterior : P.u.1 ∈ J := by
      have hmem : P.u.1 ∈ ({P.u.1, xu} : Finset ℝ²) ∩ J := by
        rw [pair_interior]
        simp
      exact (Finset.mem_inter.mp hmem).2
    have hxuInterior : xu ∈ J := by
      have hmem : xu ∈ ({P.u.1, xu} : Finset ℝ²) ∩ J := by
        rw [pair_interior]
        simp
      exact (Finset.mem_inter.mp hmem).2
    have hxvInterior : xv ∈ J := by
      have hblockerEqU :
          (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
        simpa [P.huSource] using blocker_eq
      simpa [J, hblockerEqU] using blocker_interior
    have hvInterior : P.v.1 ∈ J := by simpa [J] using hzJ
    have hvClass : P.v.1 ∈ C := by
      change P.v.1 ∈ SelectedClass D.A S.oppApex2 P.rho
      rw [terminal.named_rows.physical_class]
      simp
    have hxvClass : xv ∈ C := by
      change xv ∈ SelectedClass D.A S.oppApex2 P.rho
      rw [terminal.named_rows.physical_class]
      simp
    have hKvTrace : Kv.support ∩ C = {P.v.1, xv} := by
      simpa [Kv, C] using terminal.named_rows.v_row_trace
    have hvSupport : P.v.1 ∈ Kv.support := by
      simpa [Kv] using Kv.q_mem_support
    have hxvSupport : xv ∈ Kv.support := by
      have : xv ∈ Kv.support ∩ C := by
        rw [hKvTrace]
        simp
      exact (Finset.mem_inter.mp this).1
    have hblockerVA :
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈ D.A := by
      exact (Finset.mem_erase.mp Kv.center_mem).2
    have hblockerVNeApex :
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠
          S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) P.v.1 P.v.2
    have hblockerVEq :
        dist ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) P.v.1 =
          dist ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) xv :=
      (Kv.support_eq_radius P.v.1 hvSupport).trans
        (Kv.support_eq_radius xv hxvSupport).symm
    have hphysicalEq :
        dist S.oppApex2 P.v.1 = dist S.oppApex2 xv :=
      (mem_selectedClass.mp hvClass).2.trans
        (mem_selectedClass.mp hxvClass).2.symm
    have hblockerVInterior :
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈ J := by
      apply commonPhysicalPair_center_mem_secondCapInterior
        hblockerVA hblockerVNeApex hvInterior hxvInterior
          terminal.named_rows.xv_ne_v.symm hblockerVEq hphysicalEq
    have hblockerVCap :
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈ cap :=
      S.capInteriorByIndex_subset_capByIndex S.oppIndex2
        hblockerVInterior
    have hvPairSubset :
        ({P.v.1, xv} : Finset ℝ²) ⊆ Kv.support ∩ cap := by
      intro q hq
      simp only [Finset.mem_insert, Finset.mem_singleton] at hq
      rcases hq with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨hvSupport,
            S.capInteriorByIndex_subset_capByIndex S.oppIndex2
              hvInterior⟩
      · exact Finset.mem_inter.mpr
          ⟨hxvSupport,
            S.capInteriorByIndex_subset_capByIndex S.oppIndex2
              hxvInterior⟩
    have hKvCapCard :
        (Kv.support ∩ cap).card ≤ 2 := by
      simpa [Kv, cap] using
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Kv.toSelectedFourClass hblockerVCap
    have hvPairCard : ({P.v.1, xv} : Finset ℝ²).card = 2 := by
      simp [terminal.named_rows.xv_ne_v.symm]
    have hKvCapTrace : Kv.support ∩ cap = {P.v.1, xv} := by
      exact (Finset.eq_of_subset_of_card_le hvPairSubset
        (by simpa [hvPairCard] using hKvCapCard)).symm
    have packet :
        ExactFourRigid221SourceEqUVRowOtherVInteriorPacket
          R P.v xv :=
      ⟨hvInterior, hxvInterior, hblockerVInterior,
        by simpa [Kv, cap] using hKvCapTrace⟩
    by_cases hcapSix : S.oppCap2.card = 6
    · have hJCard : J.card = 4 := by
        have hcard :=
          ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
            S S.oppIndex2
        rw [capByIndex_oppIndex2_eq_oppCap2 S, hcapSix] at hcard
        dsimp [J]
        omega
      have hKuTrace : Ku.support ∩ C = {P.u.1, xu} := by
        simpa [Ku, C] using terminal.named_rows.u_row_trace
      have hdisj :
          Disjoint ({P.u.1, xu} : Finset ℝ²) {P.v.1, xv} := by
        have hrigid := P.globalDeletion.rigid
        dsimp only at hrigid
        rw [hKuTrace, hKvTrace] at hrigid
        exact hrigid.2.2.1
      have huSupport : P.u.1 ∈ Ku.support := by
        simpa [Ku] using Ku.q_mem_support
      have hxuSupport : xu ∈ Ku.support := by
        have : xu ∈ Ku.support ∩ C := by
          rw [hKuTrace]
          simp
        exact (Finset.mem_inter.mp this).1
      have hblockerEqU :
          (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
        simpa [P.huSource] using blocker_eq
      have hxvNeU :
          (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ≠ P.u.1 := by
        intro h
        apply Ku.center_not_mem_support
        convert huSupport using 1
      have hxvNeXu :
          (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ≠ xu := by
        intro h
        apply Ku.center_not_mem_support
        convert hxuSupport using 1
      have hblockerVNeV :
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠ P.v.1 := by
        intro h
        apply Kv.center_not_mem_support
        convert hvSupport using 1
      have hblockerVNeXv :
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠ xv := by
        intro h
        apply Kv.center_not_mem_support
        convert hxvSupport using 1
      have hcross :=
        four_interior_forces_both_cross_blocker_coincidences
          J P.u.1 xu P.v.1 xv
          ((lateFirstApexSystem R).centerAt P.u.1 P.u.2)
          ((lateFirstApexSystem R).centerAt P.v.1 P.v.2)
          terminal.named_rows.xu_ne_u.symm
          terminal.named_rows.xv_ne_v.symm hdisj
          hxvNeU hxvNeXu hblockerVNeV hblockerVNeXv
          huInterior hxuInterior hvInterior hxvInterior
          (by simpa [J, hblockerEqU] using blocker_interior)
          hblockerVInterior hJCard
      exact .v_exact_six_cross_blocker packet hcapSix hcross.2
    · have hcapSeven : 7 ≤ S.oppCap2.card := by omega
      exact .v_cap_ge_seven packet hcapSeven
  · subst z
    exact .deleted_interior hzJ hzCap hzA hzNotNamed hzNotKu
  · exact .outside_physical_class z hzJ hzCap hzA hzNotNamed hzNotKu
      hzOutside

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_secondOppositeLarge_exclusion

end ATailFrontierLiveClosure
end Problem97
