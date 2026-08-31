/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-!
# Source-row cap betweenness

This module extracts the ordered-cap consequence of the source-row-heavy
blocker-`v` branch of the rigid `2+2+1` placement.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The contextual point `other` is genuinely off the complete source row,
so it cannot have the source's distance from the actual source blocker. -/
theorem dist_sourceBlocker_other_ne_dist_sourceBlocker_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    dist
        ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
        P.other.1 ≠
      dist
        ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
        P.source.1 := by
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.source.1 P.source.2).toCriticalFourShell
  have hsourceRadius :
      dist
          ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
          P.source.1 = K.radius := by
    simpa [K] using K.support_eq_radius P.source.1 K.q_mem_support
  have hotherOff :
      dist
          ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
          P.other.1 ≠ K.radius := by
    simpa [K] using
      K.dist_ne_radius_of_mem_A_not_mem_support
        P.other.2 P.context.other_not_mem_source_row
  intro hdist
  exact hotherOff (hdist.trans hsourceRadius)

/-- In the blocker-`v` branch, the tempting second `v`-centered equality is
not a missing source consequence: the exact source row refutes it. -/
theorem dist_v_other_ne_dist_v_source_of_sourceBlocker_eq_v
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    dist P.v.1 P.other.1 ≠ dist P.v.1 P.source.1 := by
  simpa only [hblocker] using
    dist_sourceBlocker_other_ne_dist_sourceBlocker_source P

/-- If both rigid physical traces are wholly in the strict second cap, their
disjoint two-point contributions force the closed second cap to have at least
six points. -/
theorem secondCap_card_ge_six_of_both_rigid_rows_heavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2)
    (hoppositeRowHeavy : P.oppositeRowInteriorCount = 2) :
    6 ≤ (S.capByIndex S.oppIndex2).card := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Iu := Ku.support ∩ C
  let Iv := Kv.support ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  let U := Iu ∩ J
  let V := Iv ∩ J
  have hUCard : U.card = 2 := by
    simpa [ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      U, Iu, Ku, C, J] using hsourceRowHeavy
  have hVCard : V.card = 2 := by
    simpa [ExactFourRigid221PhysicalApexSourceEqUContext.oppositeRowInteriorCount,
      V, Iv, Kv, C, J] using hoppositeRowHeavy
  have hIuIv : Disjoint Iu Iv := by
    rcases P.globalDeletion.rigid with
      ⟨_hIuCard, _hIvCard, hdisjoint, _hcover⟩
    simpa [Iu, Iv, Ku, Kv, C] using hdisjoint
  have hUV : Disjoint U V := by
    rw [Finset.disjoint_left]
    intro z hzU hzV
    exact (Finset.disjoint_left.mp hIuIv)
      (Finset.mem_inter.mp hzU).1 (Finset.mem_inter.mp hzV).1
  have hUnionCard : (U ∪ V).card = 4 := by
    rw [Finset.card_union_of_disjoint hUV, hUCard, hVCard]
  have hUnionSubset : U ∪ V ⊆ J := by
    intro z hz
    rcases Finset.mem_union.mp hz with hzU | hzV
    · exact (Finset.mem_inter.mp hzU).2
    · exact (Finset.mem_inter.mp hzV).2
  have hJCard : 4 ≤ J.card := by
    have := Finset.card_le_card hUnionSubset
    omega
  have hcap :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  change J.card + 2 = (S.capByIndex S.oppIndex2).card at hcap
  omega

/-- A heavy source trace together with the strict-cap blocker `v` and the
distinguished deleted point also supplies four distinct strict-cap points. -/
theorem secondCap_card_ge_six_of_sourceRowHeavy_of_v_deleted_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2)
    (hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hdeletedInterior :
      P.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    6 ≤ (S.capByIndex S.oppIndex2).card := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Iu := Ku.support ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  let U := Iu ∩ J
  let T := insert P.v.1 (insert P.jointDeletion.deleted.1 U)
  have hUCard : U.card = 2 := by
    simpa [ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      U, Iu, Ku, C, J] using hsourceRowHeavy
  have hvNotU : P.v.1 ∉ U := by
    intro hvU
    apply P.hvOmitted
    exact (Finset.mem_inter.mp (Finset.mem_inter.mp hvU).1).1
  have hdeletedNotU : P.jointDeletion.deleted.1 ∉ U := by
    intro hdeletedU
    apply P.jointDeletion.deleted_not_mem_uRow
    exact (Finset.mem_inter.mp (Finset.mem_inter.mp hdeletedU).1).1
  have hdeletedNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
  have hvNotInsert :
      P.v.1 ∉ insert P.jointDeletion.deleted.1 U := by
    simp only [Finset.mem_insert, not_or]
    exact ⟨hdeletedNeV.symm, hvNotU⟩
  have hTCard : T.card = 4 := by
    simp only [T]
    rw [Finset.card_insert_of_notMem hvNotInsert,
      Finset.card_insert_of_notMem hdeletedNotU, hUCard]
  have hTSubset : T ⊆ J := by
    intro z hz
    simp only [T, Finset.mem_insert] at hz
    rcases hz with rfl | rfl | hzU
    · simpa [J] using hvInterior
    · simpa [J] using hdeletedInterior
    · exact (Finset.mem_inter.mp hzU).2
  have hJCard : 4 ≤ J.card := by
    have := Finset.card_le_card hTSubset
    omega
  have hcap :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  change J.card + 2 = (S.capByIndex S.oppIndex2).card at hcap
  omega

/-- In the source-row-heavy blocker-`v` branch, the rigid source row has a
second physical point in the strict second-cap interior.  In any ordered-cap
presentation of that cap, the blocker index lies strictly between the source
index and this partner index. -/
theorem exists_sourceRow_partner_with_blocker_index_strictly_between
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    ∃ partner : ℝ²,
      partner ≠ P.source.1 ∧
      partner ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∧
      partner ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      (∀ z,
        z ∈
            ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support →
          z ∈ SelectedClass D.A S.oppApex2 P.rho →
          z ≠ P.source.1 → z = partner) ∧
      P.source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      partner ∈ S.capInteriorByIndex S.oppIndex2 ∧
      dist P.v.1 P.source.1 = dist P.v.1 partner ∧
      ∃ B : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2),
        ∃ sourceIndex blockerIndex partnerIndex : Fin B.m,
          B.L.points sourceIndex = P.source.1 ∧
          B.L.points blockerIndex = P.v.1 ∧
          B.L.points partnerIndex = partner ∧
          ((sourceIndex < blockerIndex ∧ blockerIndex < partnerIndex) ∨
            (partnerIndex < blockerIndex ∧ blockerIndex < sourceIndex)) := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := K.support ∩ C
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = P.v.1 := by
    simpa only [P.huSource] using hblocker
  have hICard : I.card = 2 := by
    rcases P.globalDeletion.rigid with
      ⟨hIuCard, _hIvCard, _hdisjoint, _hcover⟩
    simpa [I, K, C] using hIuCard
  have hIInteriorCard :
      (I ∩ S.capInteriorByIndex S.oppIndex2).card = 2 := by
    simpa [ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      I, K, C] using hsourceRowHeavy
  have hIInteriorEq :
      I ∩ S.capInteriorByIndex S.oppIndex2 = I := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    omega
  have hsourceI : P.source.1 ∈ I := by
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · simpa [K, P.huSource] using K.q_mem_support
    · simpa [C, P.huSource] using P.huClass
  obtain ⟨partner, hpartnerI, hpartnerNeSource⟩ :=
    Finset.exists_mem_ne (by omega : 1 < I.card) P.source.1
  have hpairEqI : ({P.source.1, partner} : Finset ℝ²) = I := by
    apply Finset.eq_of_subset_of_card_le
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hsourceI
      · exact hpartnerI
    · rw [Finset.card_pair hpartnerNeSource.symm]
      omega
  have hpartnerUnique :
      ∀ z, z ∈ K.support → z ∈ C → z ≠ P.source.1 → z = partner := by
    intro z hzSupport hzClass hzNeSource
    have hzI : z ∈ I := Finset.mem_inter.mpr ⟨hzSupport, hzClass⟩
    rw [← hpairEqI] at hzI
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzI
    rcases hzI with hzSource | hzPartner
    · exact False.elim (hzNeSource hzSource)
    · exact hzPartner
  have hsourceInterior :
      P.source.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    have : P.source.1 ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
      rw [hIInteriorEq]
      exact hsourceI
    exact (Finset.mem_inter.mp this).2
  have hpartnerInterior :
      partner ∈ S.capInteriorByIndex S.oppIndex2 := by
    have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
      rw [hIInteriorEq]
      exact hpartnerI
    exact (Finset.mem_inter.mp this).2
  have hpartnerData := Finset.mem_inter.mp hpartnerI
  have hsourceSupport : P.source.1 ∈ K.support :=
    (Finset.mem_inter.mp hsourceI).1
  have hequidistant :
      dist P.v.1 P.source.1 = dist P.v.1 partner := by
    simpa [K, hblockerU] using
      (K.support_eq_radius P.source.1 hsourceSupport).trans
        (K.support_eq_radius partner hpartnerData.1).symm
  obtain ⟨B⟩ := S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2
  have hsourceCap : P.source.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hsourceInterior
  have hblockerInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    blockerV_sourceRowHeavy_v_mem_secondCapInterior P hblocker hsourceRowHeavy
  have hblockerCap : P.v.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hblockerInterior
  have hpartnerCap : partner ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hpartnerInterior
  have hsourceImage : P.source.1 ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact hsourceCap
  have hblockerImage : P.v.1 ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact hblockerCap
  have hpartnerImage : partner ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact hpartnerCap
  rcases Finset.mem_image.mp hsourceImage with ⟨sourceIndex, _, hsourceIndex⟩
  rcases Finset.mem_image.mp hblockerImage with ⟨blockerIndex, _, hblockerIndex⟩
  rcases Finset.mem_image.mp hpartnerImage with ⟨partnerIndex, _, hpartnerIndex⟩
  have hblockerNeSource : P.v.1 ≠ P.source.1 := by
    intro h
    apply ATailMinimalUniqueFourCover.centerAt_ne_source
      (lateFirstApexSystem R) P.source.1 P.source.2
    rw [hblocker, h]
  have hblockerNePartner : P.v.1 ≠ partner := by
    intro h
    have hcenterEqPartner :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = partner :=
      hblockerU.trans h
    exact K.center_not_mem_support (hcenterEqPartner ▸ hpartnerData.1)
  have hsourceIndexNeBlocker : sourceIndex ≠ blockerIndex := by
    intro h
    apply hblockerNeSource
    rw [← hblockerIndex, ← hsourceIndex, h]
  have hblockerIndexNeSource : blockerIndex ≠ sourceIndex :=
    hsourceIndexNeBlocker.symm
  have hblockerIndexNePartner : blockerIndex ≠ partnerIndex := by
    intro h
    apply hblockerNePartner
    rw [← hblockerIndex, ← hpartnerIndex, h]
  have hsourceIndexNePartner : sourceIndex ≠ partnerIndex := by
    intro h
    apply hpartnerNeSource
    rw [← hpartnerIndex, ← hsourceIndex, h]
  have hindexEquidistant :
      dist (B.L.points blockerIndex) (B.L.points sourceIndex) =
        dist (B.L.points blockerIndex) (B.L.points partnerIndex) := by
    simpa only [hblockerIndex, hsourceIndex, hpartnerIndex] using hequidistant
  refine ⟨partner, hpartnerNeSource, hpartnerData.1, hpartnerData.2, hpartnerUnique,
    hsourceInterior, hpartnerInterior, hequidistant, B,
    sourceIndex, blockerIndex, partnerIndex,
    hsourceIndex, hblockerIndex, hpartnerIndex, ?_⟩
  rcases lt_or_gt_of_ne hsourceIndexNePartner with hlt | hgt
  · exact Or.inl <|
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hlt hblockerIndexNeSource
          hblockerIndexNePartner hindexEquidistant
  · exact Or.inr <|
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hgt hblockerIndexNePartner
          hblockerIndexNeSource hindexEquidistant.symm

/-- The rigid opposite row has a unique member other than `v` in the physical
five-class.  The contextual point `other` is therefore the distinguished
deleted point, `v`, or this opposite-row partner. -/
theorem exists_oppositeRow_partner_with_other_classification
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    ∃ partner : ℝ²,
      partner ≠ P.v.1 ∧
      partner ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∧
      partner ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      (∀ z,
        z ∈
            ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support →
          z ∈ SelectedClass D.A S.oppApex2 P.rho →
          z ≠ P.v.1 → z = partner) ∧
      (P.other.1 = P.jointDeletion.deleted.1 ∨
        P.other.1 = P.v.1 ∨ P.other.1 = partner) := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Iu := Ku.support ∩ C
  let Iv := Kv.support ∩ C
  have hIvCard : Iv.card = 2 := by
    rcases P.globalDeletion.rigid with
      ⟨_hIuCard, hIvCard, _hdisjoint, _hcover⟩
    simpa [Iv, Kv, C] using hIvCard
  have hvIv : P.v.1 ∈ Iv := by
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · simpa [Kv] using Kv.q_mem_support
    · simpa [C] using P.hvClass
  obtain ⟨partner, hpartnerIv, hpartnerNeV⟩ :=
    Finset.exists_mem_ne (by omega : 1 < Iv.card) P.v.1
  have hpairEqIv : ({P.v.1, partner} : Finset ℝ²) = Iv := by
    apply Finset.eq_of_subset_of_card_le
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hvIv
      · exact hpartnerIv
    · rw [Finset.card_pair hpartnerNeV.symm]
      omega
  have hpartnerData := Finset.mem_inter.mp hpartnerIv
  have hpartnerUnique :
      ∀ z, z ∈ Kv.support → z ∈ C → z ≠ P.v.1 → z = partner := by
    intro z hzSupport hzClass hzNeV
    have hzIv : z ∈ Iv := Finset.mem_inter.mpr ⟨hzSupport, hzClass⟩
    rw [← hpairEqIv] at hzIv
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzIv
    rcases hzIv with hzV | hzPartner
    · exact False.elim (hzNeV hzV)
    · exact hzPartner
  have hcover :
      C = insert P.jointDeletion.deleted.1 (Iu ∪ Iv) := by
    have hrigid := P.globalDeletion.rigid
    simpa [C, Iu, Iv, Ku, Kv] using hrigid.2.2.2
  have hotherC : P.other.1 ∈ C := by
    simpa [C] using P.context.other_mem_class
  rw [hcover] at hotherC
  simp only [Finset.mem_insert, Finset.mem_union] at hotherC
  have hclassification :
      P.other.1 = P.jointDeletion.deleted.1 ∨
        P.other.1 = P.v.1 ∨ P.other.1 = partner := by
    rcases hotherC with hdeleted | hIu | hIv
    · exact Or.inl hdeleted
    · have hotherSourceRow :
          P.other.1 ∈
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.support := by
        have hotherIu := hIu
        change P.other.1 ∈
          (((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho) at hotherIu
        rw [P.huSource] at hotherIu
        exact (Finset.mem_inter.mp hotherIu).1
      exact False.elim (P.context.other_not_mem_source_row hotherSourceRow)
    · rcases Finset.mem_inter.mp hIv with ⟨hotherKv, hotherClass⟩
      by_cases hotherV : P.other.1 = P.v.1
      · exact Or.inr (Or.inl hotherV)
      · exact Or.inr (Or.inr
          (hpartnerUnique P.other.1 hotherKv hotherClass hotherV))
  exact ⟨partner, hpartnerNeV, hpartnerData.1, hpartnerData.2,
    hpartnerUnique, hclassification⟩

/-- In the source-row-heavy blocker-`v` branch, the contextual interior point
forces one of three source-faithful outcomes: the distinguished deleted point
is interior, `other` is `v` itself, or the opposite rigid row is also heavy.
In the last case the two disjoint heavy rows force a second cap of cardinality
at least six. -/
theorem blockerV_sourceRowHeavy_deletedInterior_or_otherEqV_or_oppositeRowHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    P.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∨
      P.other.1 = P.v.1 ∨
        (P.oppositeRowInteriorCount = 2 ∧
          6 ≤ (S.capByIndex S.oppIndex2).card) := by
  classical
  rcases exists_oppositeRow_partner_with_other_classification P with
    ⟨partner, hpartnerNeV, hpartnerSupport, hpartnerClass,
      _hpartnerUnique, hother⟩
  rcases hother with hotherDeleted | hotherV | hotherPartner
  · exact Or.inl (by
      simpa only [hotherDeleted] using P.context.other_mem_interior)
  · exact Or.inr (Or.inl hotherV)
  · right
    right
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        P.v.1 P.v.2).toCriticalFourShell
    let C := SelectedClass D.A S.oppApex2 P.rho
    let Iv := Kv.support ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    have hIvCard : Iv.card = 2 := by
      rcases P.globalDeletion.rigid with
        ⟨_hIuCard, hcard, _hdisjoint, _hcover⟩
      simpa [Iv, Kv, C] using hcard
    have hvIv : P.v.1 ∈ Iv := by
      refine Finset.mem_inter.mpr ⟨?_, ?_⟩
      · simpa [Kv] using Kv.q_mem_support
      · simpa [C] using P.hvClass
    have hpartnerIv : partner ∈ Iv := by
      refine Finset.mem_inter.mpr ⟨?_, ?_⟩
      · simpa [Kv] using hpartnerSupport
      · simpa [C] using hpartnerClass
    have hpairEq : ({P.v.1, partner} : Finset ℝ²) = Iv := by
      apply Finset.eq_of_subset_of_card_le
      · intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact hvIv
        · exact hpartnerIv
      · rw [Finset.card_pair hpartnerNeV.symm]
        omega
    have hvInterior : P.v.1 ∈ J := by
      simpa [J] using
        blockerV_sourceRowHeavy_v_mem_secondCapInterior
          P hblocker hsourceRowHeavy
    have hpartnerInterior : partner ∈ J := by
      simpa only [J, hotherPartner] using P.context.other_mem_interior
    have hIvSubset : Iv ⊆ J := by
      intro z hz
      rw [← hpairEq] at hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hvInterior
      · exact hpartnerInterior
    have hoppositeRowHeavy : P.oppositeRowInteriorCount = 2 := by
      change (Iv ∩ J).card = 2
      rw [Finset.inter_eq_left.mpr hIvSubset]
      exact hIvCard
    exact ⟨hoppositeRowHeavy,
      secondCap_card_ge_six_of_both_rigid_rows_heavy
        P hsourceRowHeavy hoppositeRowHeavy⟩

/-- Every non-`v` classification of the contextual peer forces the closed
second cap to have at least six points.  A later exact-five specialization can
therefore identify the peer with `v`. -/
theorem blockerV_sourceRowHeavy_otherEqV_or_secondCap_card_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    P.other.1 = P.v.1 ∨ 6 ≤ (S.capByIndex S.oppIndex2).card := by
  have hvInterior :=
    blockerV_sourceRowHeavy_v_mem_secondCapInterior
      P hblocker hsourceRowHeavy
  rcases
      blockerV_sourceRowHeavy_deletedInterior_or_otherEqV_or_oppositeRowHeavy
        P hblocker hsourceRowHeavy with
    hdeletedInterior | hotherV | hoppositeRowHeavy
  · exact Or.inr
      (secondCap_card_ge_six_of_sourceRowHeavy_of_v_deleted_interior
        P hsourceRowHeavy hvInterior hdeletedInterior)
  · exact Or.inl hotherV
  · exact Or.inr hoppositeRowHeavy.2

/-- Exact cardinality five for the closed second cap eliminates both
non-`v` classifications of the contextual peer. -/
theorem blockerV_sourceRowHeavy_other_eq_v_of_secondCap_card_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2)
    (hsecondCapFive : (S.capByIndex S.oppIndex2).card = 5) :
    P.other.1 = P.v.1 := by
  rcases
      blockerV_sourceRowHeavy_otherEqV_or_secondCap_card_ge_six
        P hblocker hsourceRowHeavy with hotherV | hlarge
  · exact hotherV
  · omega

/-- The live lower bound on the second opposite cap turns the preceding
dichotomy into an exact dispatcher: either the closed cap has cardinality five
and `other = v`, or it belongs to the genuinely large-cap arm. -/
theorem blockerV_sourceRowHeavy_exactFiveOtherEqV_or_secondCap_card_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    (((S.capByIndex S.oppIndex2).card = 5 ∧ P.other.1 = P.v.1) ∨
      6 ≤ (S.capByIndex S.oppIndex2).card) := by
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi]
  have hcapGeFive : 5 ≤ (S.capByIndex S.oppIndex2).card := by
    simpa only [hcapEq] using P.surface.secondOppCap_card_ge_five
  rcases
      blockerV_sourceRowHeavy_otherEqV_or_secondCap_card_ge_six
        P hblocker hsourceRowHeavy with hotherV | hlarge
  · by_cases hcapFive : (S.capByIndex S.oppIndex2).card = 5
    · exact Or.inl ⟨hcapFive, hotherV⟩
    · exact Or.inr (by omega)
  · exact Or.inr hlarge

end ATailFrontierLiveClosure
end Problem97
