/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion
import Erdos9796Proof.P97.ATail.AnchoredDoubleDeletionProducer

/-!
# Card-≥14 survival-cover producer

This is the production port of the source-faithful survival-cover adapter.
Away from the exact-card-four first-apex arm, ten sources remain outside the
known blocker fiber at card at least fourteen.  Two-coloring those sources by
which frontier deletion survives, and using the four-point bound on every
actual-blocker fiber, produces two distinct blocker centers for one deletion.
The physical second apex is then paired with one of them by the existing
`CommonDeletionTwoCenterPacket` constructor.

The result is deliberately a producer: it reduces the card-≥14 surface to
the existing physical-second-apex robust/critical consumer and does not claim
a contradiction by itself.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSurvivalCover

open ATAILStageOnePrescribedApexDichotomy
open ATailAnchoredDoubleDeletionProducer
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- The source fiber of one actual blocker in a concrete critical system. -/
noncomputable def actualBlockerFiber
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A) :
    Finset (CriticalShellSystem.CarrierVertex A) :=
  Finset.univ.filter fun source =>
    H.blockerVertex source = H.blockerVertex anchor

/-- Equal actual blockers force equality of their exact selected supports. -/
theorem selectedSupports_eq_of_actualBlockers_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source₁ source₂ : ℝ²}
    (hsource₁ : source₁ ∈ A) (hsource₂ : source₂ ∈ A)
    (hcenters :
      H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂) :
    (H.selectedAt source₁ hsource₁).toCriticalFourShell.support =
      (H.selectedAt source₂ hsource₂).toCriticalFourShell.support := by
  let K : SelectedFourClass A (H.centerAt source₁ hsource₁) :=
    { support :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.support
      support_subset_A :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.support_subset_A
      support_card :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.support_card
      radius :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.radius
      radius_pos :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.radius_pos
      support_eq_radius := by
        intro z hz
        rw [hcenters]
        exact
          (H.selectedAt source₂ hsource₂).toCriticalFourShell.support_eq_radius z hz
      center_not_mem := by
        intro hmem
        apply
          (H.selectedAt source₂ hsource₂).toCriticalFourShell.center_not_mem_support
        let T :=
          (H.selectedAt source₂ hsource₂).toCriticalFourShell.support
        have hmemT : H.centerAt source₁ hsource₁ ∈ T := hmem
        have hmemT' : H.centerAt source₂ hsource₂ ∈ T := by
          rw [← hcenters]
          exact hmemT
        exact hmemT' }
  exact (H.selectedFourClass_support_eq_shell source₁ hsource₁ K).symm

/-- Every actual-blocker fiber has at most four source vertices. -/
theorem actualBlockerFiber_card_le_four
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A) :
    (actualBlockerFiber H anchor).card ≤ 4 := by
  let points : Finset ℝ² :=
    (actualBlockerFiber H anchor).image fun source => source.1
  have hpoints :
      points ⊆
        (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsourceFiber, rfl⟩
    have hblockerVertex := (Finset.mem_filter.mp hsourceFiber).2
    have hcenter :
        H.centerAt source.1 source.2 = H.centerAt anchor.1 anchor.2 :=
      congrArg Subtype.val hblockerVertex
    have hsupport :=
      selectedSupports_eq_of_actualBlockers_eq H source.2 anchor.2 hcenter
    have hsourceSupport :=
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
    rw [hsupport] at hsourceSupport
    exact hsourceSupport
  calc
    (actualBlockerFiber H anchor).card = points.card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support.card :=
      Finset.card_le_card hpoints
    _ = 4 :=
      (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support_card

/-- Five sources contain two with distinct actual blockers. -/
theorem exists_pair_distinct_actualBlockers_of_five_le_card
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (T : Finset (CriticalShellSystem.CarrierVertex A))
    (hfive : 5 ≤ T.card) :
    ∃ source₁ ∈ T, ∃ source₂ ∈ T,
      H.centerAt source₁.1 source₁.2 ≠
        H.centerAt source₂.1 source₂.2 := by
  by_contra hnone
  have hnonempty : T.Nonempty := Finset.card_pos.mp (by omega)
  rcases hnonempty with ⟨anchor, hanchor⟩
  have hsubset : T ⊆ actualBlockerFiber H anchor := by
    intro source hsource
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, Subtype.ext ?_⟩
    by_contra hcenters
    apply hnone
    exact ⟨source, hsource, anchor, hanchor, hcenters⟩
  have hle := Finset.card_le_card hsubset
  have hfiber := actualBlockerFiber_card_le_four H anchor
  omega

/-- Color a source by which frontier deletion survives at its actual blocker. -/
noncomputable def survivalColor
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (source : CriticalShellSystem.CarrierVertex D.A) : Fin 2 :=
  if HasNEquidistantPointsAt 4 (D.A.erase P.q)
      (H.centerAt source.1 source.2) then 0 else 1

theorem survivalColor_eq_zero_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    survivalColor P source = 0 ↔
      HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source.1 source.2) := by
  simp [survivalColor]

theorem survivalColor_eq_one_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    survivalColor P source = 1 ↔
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source.1 source.2) := by
  simp [survivalColor]

private theorem finTwo_eq_one_of_ne_zero (color : Fin 2)
    (hcolor : color ≠ 0) : color = 1 := by
  fin_cases color <;> simp_all

/-- Away from the exact-card-four arm, an outside source preserves one of the
two frontier deletions at its actual blocker. -/
theorem deletionSurvival_cover_of_mem_outside_qBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceOutside : source ∈ Finset.univ \ qBlockerFiber P) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt source.1 source.2) := by
  have hsourceNotFiber : source ∉ qBlockerFiber P :=
    (Finset.mem_sdiff.mp hsourceOutside).2
  have hcenterNe :
      H.centerAt source.1 source.2 ≠ H.centerAt P.q P.q_mem_A := by
    intro hcenter
    apply hsourceNotFiber
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, ?_⟩
    apply Subtype.ext
    exact hcenter
  rcases frontierDeletion_survival_or_actualBlocker_eq_qBlocker
      P hnotFour hwSupport source.2 with hq | hw | hcenter
  · exact Or.inl hq
  · exact Or.inr hw
  · exact False.elim (hcenterNe hcenter)

private theorem actualBlocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source : CriticalShellSystem.CarrierVertex A) :
    H.centerAt source.1 source.2 ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2

private theorem oppApex2_mem_A
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    S.oppApex2 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Card at least fourteen forces a source-faithful common-deletion packet
whose second center is the physical second apex. -/
theorem exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card) :
    ∃ deleted : ℝ², ∃ _hdeleted : deleted ∈ D.A,
      ∃ source : CriticalShellSystem.CarrierVertex D.A,
        (deleted = P.q ∨ deleted = P.w) ∧
        source ∈ Finset.univ \ qBlockerFiber P ∧
        H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
        HasNEquidistantPointsAt 4 (D.A.erase deleted)
          (H.centerAt source.1 source.2) ∧
        Nonempty (CommonDeletionTwoCenterPacket D H deleted
          (H.centerAt source.1 source.2) S.oppApex2) := by
  let outside : Finset (CriticalShellSystem.CarrierVertex D.A) :=
    Finset.univ \ qBlockerFiber P
  let qColor := outside.filter fun source => survivalColor P source = 0
  let notQColor := outside.filter fun source => survivalColor P source ≠ 0
  have houtside : 10 ≤ outside.card := by
    have hfiber := qBlockerFiber_card_le_four P
    have hsplit := Finset.card_sdiff_add_card_inter
      (Finset.univ : Finset (CriticalShellSystem.CarrierVertex D.A))
      (qBlockerFiber P)
    have htotal :
        Fintype.card (CriticalShellSystem.CarrierVertex D.A) = D.A.card := by
      simp [CriticalShellSystem.CarrierVertex, Fintype.card_coe]
    simp only [Finset.inter_eq_right.mpr (Finset.subset_univ _),
      Finset.card_univ, htotal] at hsplit
    have houtside' :
        10 ≤ (Finset.univ \ qBlockerFiber P).card := by
      omega
    simpa [outside] using houtside'
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := outside) (fun source => survivalColor P source = 0)
  change qColor.card + notQColor.card = outside.card at hsplit
  by_cases hqFive : 5 ≤ qColor.card
  · rcases exists_pair_distinct_actualBlockers_of_five_le_card
      H qColor hqFive with
      ⟨source₁, hsource₁Color, source₂, hsource₂Color, hcenters⟩
    have hsource₁Outside : source₁ ∈ outside :=
      (Finset.mem_filter.mp hsource₁Color).1
    have hsource₂Outside : source₂ ∈ outside :=
      (Finset.mem_filter.mp hsource₂Color).1
    have hsurvives₁ := (survivalColor_eq_zero_iff P source₁).1
      (Finset.mem_filter.mp hsource₁Color).2
    have hsurvives₂ := (survivalColor_eq_zero_iff P source₂).1
      (Finset.mem_filter.mp hsource₂Color).2
    have hsecondApexSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex2 :=
      P.q_survives
    by_cases hsource₁Center :
        H.centerAt source₁.1 source₁.2 ≠ S.oppApex2
    · refine ⟨P.q, P.q_mem_A, source₁, Or.inl rfl,
        hsource₁Outside, hsource₁Center, hsurvives₁, ?_⟩
      exact nonempty_commonDeletionTwoCenterPacket H P.q_mem_A
        (actualBlocker_mem_A H source₁) (oppApex2_mem_A S)
        hsource₁Center hsurvives₁ hsecondApexSurvives
    · have heq : H.centerAt source₁.1 source₁.2 = S.oppApex2 :=
        not_ne_iff.mp hsource₁Center
      have hsource₂Center :
          H.centerAt source₂.1 source₂.2 ≠ S.oppApex2 := by
        intro hsource₂CenterEq
        exact hcenters (heq.trans hsource₂CenterEq.symm)
      refine ⟨P.q, P.q_mem_A, source₂, Or.inl rfl,
        hsource₂Outside, hsource₂Center, hsurvives₂, ?_⟩
      exact nonempty_commonDeletionTwoCenterPacket H P.q_mem_A
        (actualBlocker_mem_A H source₂) (oppApex2_mem_A S)
        hsource₂Center hsurvives₂ hsecondApexSurvives
  · have hnotQFive : 5 ≤ notQColor.card := by omega
    rcases exists_pair_distinct_actualBlockers_of_five_le_card
      H notQColor hnotQFive with
      ⟨source₁, hsource₁Color, source₂, hsource₂Color, hcenters⟩
    have hsource₁Outside : source₁ ∈ outside :=
      (Finset.mem_filter.mp hsource₁Color).1
    have hsource₂Outside : source₂ ∈ outside :=
      (Finset.mem_filter.mp hsource₂Color).1
    have hsource₁ColorOne : survivalColor P source₁ = 1 :=
      finTwo_eq_one_of_ne_zero _ (Finset.mem_filter.mp hsource₁Color).2
    have hsource₂ColorOne : survivalColor P source₂ = 1 :=
      finTwo_eq_one_of_ne_zero _ (Finset.mem_filter.mp hsource₂Color).2
    have hqBlocked₁ := (survivalColor_eq_one_iff P source₁).1 hsource₁ColorOne
    have hqBlocked₂ := (survivalColor_eq_one_iff P source₂).1 hsource₂ColorOne
    have hsource₁Survives :
        HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.centerAt source₁.1 source₁.2) :=
      (deletionSurvival_cover_of_mem_outside_qBlockerFiber
        P hnotFour hwSupport source₁ hsource₁Outside).resolve_left hqBlocked₁
    have hsource₂Survives :
        HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.centerAt source₂.1 source₂.2) :=
      (deletionSurvival_cover_of_mem_outside_qBlockerFiber
        P hnotFour hwSupport source₂ hsource₂Outside).resolve_left hqBlocked₂
    have hsecondApexSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex2 :=
      P.w_survives
    by_cases hsource₁Center :
        H.centerAt source₁.1 source₁.2 ≠ S.oppApex2
    · refine ⟨P.w, P.w_mem_A, source₁, Or.inr rfl,
        hsource₁Outside, hsource₁Center, hsource₁Survives, ?_⟩
      exact nonempty_commonDeletionTwoCenterPacket H P.w_mem_A
        (actualBlocker_mem_A H source₁) (oppApex2_mem_A S)
        hsource₁Center hsource₁Survives hsecondApexSurvives
    · have heq : H.centerAt source₁.1 source₁.2 = S.oppApex2 :=
        not_ne_iff.mp hsource₁Center
      have hsource₂Center :
          H.centerAt source₂.1 source₂.2 ≠ S.oppApex2 := by
        intro hsource₂CenterEq
        exact hcenters (heq.trans hsource₂CenterEq.symm)
      refine ⟨P.w, P.w_mem_A, source₂, Or.inr rfl,
        hsource₂Outside, hsource₂Center, hsource₂Survives, ?_⟩
      exact nonempty_commonDeletionTwoCenterPacket H P.w_mem_A
        (actualBlocker_mem_A H source₂) (oppApex2_mem_A S)
        hsource₂Center hsource₂Survives hsecondApexSurvives

/-- The source-faithful producer is wired to the existing physical-second-
apex consumer.  This is the first production boundary for the revised
card-≥14 route; the remaining work is the robust/critical endpoint itself. -/
theorem sourceFaithful_card_ge_fourteen_physicalSecondApex_consumer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (PhysicalSecondApexCriticalResidual D S) := by
  rcases exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen
      P hnotFour hwSupport hcard with
    ⟨deleted, _hdeleted, source, _hdeletedCases, _hsourceOutside,
      hcenterNe, hsurvives, hpacket⟩
  rcases hpacket with ⟨packet⟩
  exact physicalSecondApex_commonDeletion_robust_or_critical packet

#print axioms exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen
#print axioms sourceFaithful_card_ge_fourteen_physicalSecondApex_consumer

end ATailSurvivalCover
end Problem97
