/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SurvivalCoverBankMatch
import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.U1OppositeCapLowerBounds

/-!
# Scratch: full-parent geometry of the deletion-survival cover

The primary card-at-least-fourteen producer now lives in
`SurvivalCoverBankMatch`: it returns a source-faithful
`CommonDeletionTwoCenterPacket` for one of the two frontier deletions.  This
file retains the complementary card-at-least-eleven MEC/cap-order reduction.

No-`IsM44`, the MEC-derived cap lower bounds, and the surplus cap give
`11 ≤ card A`.  Hence the known blocker fiber leaves at least seven sources.
Coloring those sources by a surviving frontier deletion and by the closed cap
containing their *actual blocker* produces two sources of one color whose
blockers lie in one cap.

The result splits honestly.  The blockers can coincide, in which case their
critical shell contains both sources and omits the deleted frontier point.
If they are distinct, full cap order supplies two distinct ordered ranks, but
the survival cover does not supply a common outside support pair for the two
rows.  That missing pair is exactly the antecedent of the existing ordered-cap
uniqueness sink.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSurvivalCoverGeometryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailAnchoredDoubleDeletionProducerScratch
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailSurvivalCoverBankMatchScratch

attribute [local instance] Classical.propDecidable

/-- The full MEC/cap lower bounds and failure of `(m,4,4)` force ambient
cardinality at least eleven. -/
theorem eleven_le_card_of_not_isM44
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hNoM44 : ¬ S.IsM44) :
    11 ≤ D.A.card := by
  obtain ⟨hC1, hC2, hC3⟩ :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four
      S.partition D.convex S.hncol D.K4
        (CircumscribedMECPacket.ofNonObtuse
          S.triangleNonObtuse S.hCirc)
  have hsurplus : 5 ≤ S.surplusCap.card := by
    have := S.surplus_card_gt_four
    omega
  have hopp1 : 4 ≤ S.oppCap1.card := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppCap1, hi] using hC2
    · simpa [SurplusCapPacket.oppCap1, hi] using hC3
    · simpa [SurplusCapPacket.oppCap1, hi] using hC1
  have hopp2 : 4 ≤ S.oppCap2.card := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppCap2, hi] using hC3
    · simpa [SurplusCapPacket.oppCap2, hi] using hC1
    · simpa [SurplusCapPacket.oppCap2, hi] using hC2
  have hsecond : 5 ≤ S.oppCap1.card ∨ 5 ≤ S.oppCap2.card := by
    by_contra h
    push_neg at h
    apply hNoM44
    exact ⟨by omega, by omega⟩
  have hsum := S.capSum
  omega

/-- Assign a source the cap containing its actual blocker center. -/
noncomputable def blockerCapIndex
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) : Fin 3 :=
  sourceCapIndex S (H.blockerVertex source)

theorem blocker_mem_chosenCap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    (H.blockerVertex source).1 ∈ S.capByIndex (blockerCapIndex S H source) :=
  source_mem_chosenCap S (H.blockerVertex source)

/-- Two outside-fiber sources of one deletion-survival color whose actual
blockers lie in one closed cap.  Source cap placement is not asserted. -/
structure BlockerCapSurvivalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) where
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  capIndex : Fin 3
  sources_ne : source₁ ≠ source₂
  source₁_outside : source₁ ∈ Finset.univ \ qBlockerFiber P
  source₂_outside : source₂ ∈ Finset.univ \ qBlockerFiber P
  blocker₁_mem_cap :
    (H.blockerVertex source₁).1 ∈ S.capByIndex capIndex
  blocker₂_mem_cap :
    (H.blockerVertex source₂).1 ∈ S.capByIndex capIndex
  sameSurvival :
    ((HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.blockerVertex source₁).1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.blockerVertex source₂).1) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.blockerVertex source₁).1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.blockerVertex source₂).1))

/-- Seven sources in the six boxes
`survival color × actual-blocker cap` produce a blocker-cap pair. -/
theorem nonempty_blockerCapSurvivalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 11 ≤ D.A.card) :
    Nonempty (BlockerCapSurvivalPair P) := by
  let outside : Finset (CriticalShellSystem.CarrierVertex D.A) :=
    Finset.univ \ qBlockerFiber P
  let Box := Fin 2 × Fin 3
  let assignment : {source // source ∈ outside} → Box := fun source ↦
    (survivalColor P source.1, blockerCapIndex S H source.1)
  have houtside : 7 ≤ outside.card := by
    simpa [outside] using seven_le_sources_outside_qBlockerFiber P hcard
  have hnotInjective : ¬ Function.Injective assignment := by
    intro hinjective
    have hle := Fintype.card_le_of_injective assignment hinjective
    have hdomain : Fintype.card {source // source ∈ outside} = outside.card := by
      simp
    have hbox : Fintype.card Box = 6 := by
      simp [Box]
    rw [hdomain, hbox] at hle
    omega
  obtain ⟨source₁, source₂, hne, hassignment⟩ :
      ∃ source₁ source₂ : {source // source ∈ outside},
        source₁ ≠ source₂ ∧ assignment source₁ = assignment source₂ := by
    by_contra hnone
    push_neg at hnone
    exact hnotInjective fun source₁ source₂ heq ↦
      Classical.byContradiction fun hne ↦ hnone source₁ source₂ hne heq
  have hcolor :
      survivalColor P source₁.1 = survivalColor P source₂.1 :=
    congrArg Prod.fst hassignment
  have hcapIndex :
      blockerCapIndex S H source₁.1 = blockerCapIndex S H source₂.1 :=
    congrArg Prod.snd hassignment
  let i := blockerCapIndex S H source₁.1
  have hcap₁ : (H.blockerVertex source₁.1).1 ∈ S.capByIndex i :=
    blocker_mem_chosenCap S H source₁.1
  have hcap₂ : (H.blockerVertex source₂.1).1 ∈ S.capByIndex i := by
    simpa [i, hcapIndex] using blocker_mem_chosenCap S H source₂.1
  have hsameSurvival :
      ((HasNEquidistantPointsAt 4 (D.A.erase P.q)
            (H.blockerVertex source₁.1).1 ∧
          HasNEquidistantPointsAt 4 (D.A.erase P.q)
            (H.blockerVertex source₂.1).1) ∨
        (HasNEquidistantPointsAt 4 (D.A.erase P.w)
            (H.blockerVertex source₁.1).1 ∧
          HasNEquidistantPointsAt 4 (D.A.erase P.w)
            (H.blockerVertex source₂.1).1)) := by
    by_cases hq₁ : HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.blockerVertex source₁.1).1
    · left
      refine ⟨hq₁, ?_⟩
      apply (survivalColor_eq_zero_iff P source₂.1).1
      rw [← hcolor]
      exact (survivalColor_eq_zero_iff P source₁.1).2 hq₁
    · right
      have hq₂ : ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.blockerVertex source₂.1).1 := by
        apply (survivalColor_eq_one_iff P source₂.1).1
        rw [← hcolor]
        exact (survivalColor_eq_one_iff P source₁.1).2 hq₁
      exact ⟨
        (deletionSurvival_cover_of_mem_outside_qBlockerFiber
          P hnotFour hwSupport source₁.1
            (by
              exact source₁.2)).resolve_left hq₁,
        (deletionSurvival_cover_of_mem_outside_qBlockerFiber
          P hnotFour hwSupport source₂.1
            (by
              exact source₂.2)).resolve_left hq₂⟩
  exact ⟨{
    source₁ := source₁.1
    source₂ := source₂.1
    capIndex := i
    sources_ne := Subtype.coe_injective.ne hne
    source₁_outside := by
      exact source₁.2
    source₂_outside := by
      exact source₂.2
    blocker₁_mem_cap := hcap₁
    blocker₂_mem_cap := hcap₂
    sameSurvival := hsameSurvival }⟩

/-- Full ordered-cap data for two distinct actual blockers occupying the
same closed cap. -/
structure OrderedDistinctBlockerPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (B : BlockerCapSurvivalPair P) where
  m : ℕ
  L : CGN.OrderedCap m
  Packet : CGN.MecCapPacket D.A L
  Hside : CGN.MinorCapSideHypotheses Packet
  Hord : CGN.StrictCapOrder D.A L
  firstRank : Fin m
  secondRank : Fin m
  ranks_lt : firstRank < secondRank
  cap_image : Finset.univ.image L.points = S.capByIndex B.capIndex
  blockers_eq :
    (L.points firstRank = (H.blockerVertex B.source₁).1 ∧
        L.points secondRank = (H.blockerVertex B.source₂).1) ∨
      (L.points firstRank = (H.blockerVertex B.source₂).1 ∧
        L.points secondRank = (H.blockerVertex B.source₁).1)

/-- Distinct same-cap blockers acquire honest ordered ranks. -/
theorem nonempty_orderedDistinctBlockerPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (B : BlockerCapSurvivalPair P)
    (hblockers : H.blockerVertex B.source₁ ≠ H.blockerVertex B.source₂) :
    Nonempty (OrderedDistinctBlockerPair B) := by
  rcases S.capByIndex_cgn4g_capData_oriented D.convex B.capIndex with
    ⟨m, L, Packet, Hside, Hord, hcap, _hendpoints⟩
  have hb₁Image :
      (H.blockerVertex B.source₁).1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact B.blocker₁_mem_cap
  have hb₂Image :
      (H.blockerVertex B.source₂).1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact B.blocker₂_mem_cap
  rcases Finset.mem_image.mp hb₁Image with ⟨i₁, _hi₁, hi₁⟩
  rcases Finset.mem_image.mp hb₂Image with ⟨i₂, _hi₂, hi₂⟩
  have hi_ne : i₁ ≠ i₂ := by
    intro hi
    apply hblockers
    apply Subtype.ext
    calc
      (H.blockerVertex B.source₁).1 = L.points i₁ := hi₁.symm
      _ = L.points i₂ := by rw [hi]
      _ = (H.blockerVertex B.source₂).1 := hi₂
  rcases lt_or_gt_of_ne hi_ne with hi | hi
  · exact ⟨{
      m := m
      L := L
      Packet := Packet
      Hside := Hside
      Hord := Hord
      firstRank := i₁
      secondRank := i₂
      ranks_lt := hi
      cap_image := hcap
      blockers_eq := Or.inl ⟨hi₁, hi₂⟩ }⟩
  · exact ⟨{
      m := m
      L := L
      Packet := Packet
      Hside := Hside
      Hord := Hord
      firstRank := i₂
      secondRank := i₁
      ranks_lt := hi
      cap_image := hcap
      blockers_eq := Or.inr ⟨hi₂, hi₁⟩ }⟩

/-- Two distinct sources with one actual blocker make that blocker's exact
critical shell contain both sources. -/
theorem second_source_mem_selectedSupport_of_same_actualBlocker
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hcenter : H.blockerVertex source₁ = H.blockerVertex source₂) :
    source₂.1 ∈
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support := by
  let K := (H.selectedAt source₁.1 source₁.2).toCriticalFourShell
  by_contra hsource₂
  apply H.no_qfree_at source₂.1 source₂.2
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ (SelectedClass (D.A.erase source₂.1)
          (H.blockerVertex source₂).1 K.radius).card := by
      apply Finset.card_le_card
      intro z hz
      apply mem_selectedClass.mpr
      refine ⟨Finset.mem_erase.mpr ⟨?_, K.support_subset_A hz⟩, ?_⟩
      · intro hzsource₂
        subst z
        exact hsource₂ hz
      · rw [← hcenter]
        exact K.support_eq_radius z hz

/-- The pair's exact output.  Equal blockers give one exact shell through
both sources.  Distinct blockers give honest ordered-cap ranks.  In either
case the selected row or rows omit the common survival-color frontier point.
-/
theorem sameBlockerShell_or_orderedDistinctBlockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (B : BlockerCapSurvivalPair P) :
    ((H.blockerVertex B.source₁ = H.blockerVertex B.source₂) ∧
      B.source₂.1 ∈
        (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∧
      (P.q ∉
          (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∨
        P.w ∉
          (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support)) ∨
    ((H.blockerVertex B.source₁ ≠ H.blockerVertex B.source₂) ∧
      Nonempty (OrderedDistinctBlockerPair B) ∧
      ((P.q ∉
            (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∧
          P.q ∉
            (H.selectedAt B.source₂.1 B.source₂.2).toCriticalFourShell.support) ∨
        (P.w ∉
            (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∧
          P.w ∉
            (H.selectedAt B.source₂.1 B.source₂.2).toCriticalFourShell.support))) := by
  by_cases hblockers : H.blockerVertex B.source₁ = H.blockerVertex B.source₂
  · left
    refine ⟨hblockers,
      second_source_mem_selectedSupport_of_same_actualBlocker
        B.source₁ B.source₂ hblockers, ?_⟩
    rcases B.sameSurvival with hq | hw
    · exact Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          H B.source₁.2).mp hq.1)
    · exact Or.inr
        ((cross_deletion_survives_iff_not_mem_selected_support
          H B.source₁.2).mp hw.1)
  · right
    refine ⟨hblockers, nonempty_orderedDistinctBlockerPair B hblockers, ?_⟩
    rcases B.sameSurvival with hq | hw
    · exact Or.inl ⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H B.source₁.2).mp hq.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          H B.source₂.2).mp hq.2⟩
    · exact Or.inr ⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H B.source₁.2).mp hw.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          H B.source₂.2).mp hw.2⟩

/-- Full-parent-facing reduction.  Global no-`IsM44` is used at the concrete
surplus packet, and the resulting blocker-cap pair is sharpened by actual
ordered-cap geometry. -/
theorem fullParent_survivalCover_geometricReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    ∃ B : BlockerCapSurvivalPair P,
      ((H.blockerVertex B.source₁ = H.blockerVertex B.source₂) ∧
        B.source₂.1 ∈
          (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∧
        (P.q ∉
            (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∨
          P.w ∉
            (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support)) ∨
      ((H.blockerVertex B.source₁ ≠ H.blockerVertex B.source₂) ∧
        Nonempty (OrderedDistinctBlockerPair B) ∧
        ((P.q ∉
              (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∧
            P.q ∉
              (H.selectedAt B.source₂.1 B.source₂.2).toCriticalFourShell.support) ∨
          (P.w ∉
              (H.selectedAt B.source₁.1 B.source₁.2).toCriticalFourShell.support ∧
            P.w ∉
              (H.selectedAt B.source₂.1 B.source₂.2).toCriticalFourShell.support))) := by
  have hcard : 11 ≤ D.A.card :=
    eleven_le_card_of_not_isM44 D S (fun hM44 ↦ hNoM44 ⟨S, hM44⟩)
  rcases nonempty_blockerCapSurvivalPair P hnotFour hwSupport hcard with ⟨B⟩
  exact ⟨B, sameBlockerShell_or_orderedDistinctBlockers B⟩

#print axioms eleven_le_card_of_not_isM44
#print axioms exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen
#print axioms nonempty_blockerCapSurvivalPair
#print axioms nonempty_orderedDistinctBlockerPair
#print axioms second_source_mem_selectedSupport_of_same_actualBlocker
#print axioms sameBlockerShell_or_orderedDistinctBlockers
#print axioms fullParent_survivalCover_geometricReduction

end ATailSurvivalCoverGeometryScratch
end Problem97
