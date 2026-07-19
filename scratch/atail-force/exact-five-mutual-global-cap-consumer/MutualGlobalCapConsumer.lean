import MutualOmissionCrissCross
import PhysicalOmissionCycleParentAdapter
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Exact-five mutual-omission global cap consumer

The mutual-omission global normal form leaves at most one exceptional actual
blocker, and the complete source fiber of that blocker has cardinality at
most two.  The robust parent has at least ten ambient points.  Consequently
at least eight source vertices have one of the two mutual-edge deletions
surviving at their actual blocker.

Coloring those source vertices by a surviving deletion and by a closed cap
containing their actual blocker gives two distinct sources of one color whose
blockers lie in one cap.  Distinct blockers produce the existing
`CommonDeletionTwoCenterPacket`.  Equal blockers leave one exact critical
shell containing both source points and omitting the common deleted point.

This is the strongest current bank-facing reduction.  Neither residual is a
contradiction without a common two-point support outside the blocker cap (in
the distinct case) or an additional cap placement/incidence for the two
sources (in the equal case).
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveMutualGlobalCapConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFiveMutualOmissionClosureScratch
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailPhysicalOmissionCycleParentAdapterScratch

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source : CriticalShellSystem.CarrierVertex A) :
    (H.blockerVertex source).1 ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2

/-- Every closed cap has its two distinct Moser endpoints. -/
private theorem two_le_oppCap1_card
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    2 ≤ S.oppCap1.card := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · have hone : 1 < S.oppCap1.card := by
      rw [Finset.one_lt_card]
      exact ⟨S.triangle.v1, by
        simpa [SurplusCapPacket.oppCap1, hi] using S.partition.v1_mem_C2,
        S.triangle.v3, by
        simpa [SurplusCapPacket.oppCap1, hi] using S.partition.v3_mem_C2,
        S.triangle.v13_ne⟩
    omega
  · have hone : 1 < S.oppCap1.card := by
      rw [Finset.one_lt_card]
      exact ⟨S.triangle.v1, by
        simpa [SurplusCapPacket.oppCap1, hi] using S.partition.v1_mem_C3,
        S.triangle.v2, by
        simpa [SurplusCapPacket.oppCap1, hi] using S.partition.v2_mem_C3,
        S.triangle.v12_ne⟩
    omega
  · have hone : 1 < S.oppCap1.card := by
      rw [Finset.one_lt_card]
      exact ⟨S.triangle.v2, by
        simpa [SurplusCapPacket.oppCap1, hi] using S.partition.v2_mem_C1,
        S.triangle.v3, by
        simpa [SurplusCapPacket.oppCap1, hi] using S.partition.v3_mem_C1,
        S.triangle.v23_ne⟩
    omega

/-- The six-point physical cap and the surplus cap already force ten ambient
points, without using the first-apex frontier or no-`IsM44`. -/
theorem ten_le_card_of_robustLargeRadiusParentSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S) :
    10 ≤ D.A.card := by
  have hsurplus : 5 ≤ S.surplusCap.card := by
    have := S.surplus_card_gt_four
    omega
  have hopp1 : 2 ≤ S.oppCap1.card := two_le_oppCap1_card S
  have hopp2 : 6 ≤ S.oppCap2.card := F.oppCap2_card_ge_six
  have hsum := S.capSum
  omega

/-- Every ambient carrier point belongs to at least one indexed closed cap. -/
private theorem exists_mem_capByIndex_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A) :
    ∃ i : Fin 3, x ∈ S.capByIndex i := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | ⟨i, hxInterior⟩
  · have hxCases :
        x = S.triangle.v1 ∨ x = S.triangle.v2 ∨ x = S.triangle.v3 := by
      simpa [MoserTriangle.verts] using hxMoser
    rcases hxCases with rfl | rfl | rfl
    · exact ⟨1, by
          simpa [SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2⟩
    · exact ⟨0, by
          simpa [SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1⟩
    · exact ⟨0, by
          simpa [SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1⟩
  · exact ⟨i, S.capInteriorByIndex_subset_capByIndex i hxInterior⟩

/-- Choose one closed cap containing an actual blocker. -/
noncomputable def actualBlockerCapIndex
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) : Fin 3 :=
  Classical.choose (exists_mem_capByIndex_of_mem S (blocker_mem_A H source))

theorem actualBlocker_mem_chosenCap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    (H.blockerVertex source).1 ∈
      S.capByIndex (actualBlockerCapIndex S H source) :=
  Classical.choose_spec
    (exists_mem_capByIndex_of_mem S (blocker_mem_A H source))

/-- A large family of source vertices for which one of the mutual-edge
deletions survives at the source's actual blocker. -/
structure MutualCrossSurvivingSourceFamily
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) where
  sources : Finset (CriticalShellSystem.CarrierVertex D.A)
  card_ge_eight : 8 ≤ sources.card
  crossSurvives : ∀ source ∈ sources,
    HasNEquidistantPointsAt 4
        (D.A.erase (K.source E.index).1)
        (H.blockerVertex source).1 ∨
      HasNEquidistantPointsAt 4
        (D.A.erase (K.source (K.successorIndex E.index)).1)
        (H.blockerVertex source).1

/-- The at-most-two-source exceptional blocker fiber leaves at least eight
cross-surviving sources on the full robust parent surface. -/
theorem nonempty_mutualCrossSurvivingSourceFamily
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (E : PhysicalActualCriticalMutualOmissionEdge R.exactFive.cycle) :
    Nonempty (MutualCrossSurvivingSourceFamily E) := by
  classical
  have hcard : 10 ≤ D.A.card :=
    ten_le_card_of_robustLargeRadiusParentSurface F
  rcases (nonempty_mutualOmissionGlobalNormalForm E).2 with
    hall | ⟨exceptional, hexceptionalA, _hqBlocked, _hwBlocked,
      hcover, hfiber⟩
  · refine ⟨{
      sources := Finset.univ
      card_ge_eight := ?_
      crossSurvives := ?_ }⟩
    · have hcard' : 8 ≤ D.A.card := by omega
      simpa [CriticalShellSystem.CarrierVertex, Fintype.card_coe] using hcard'
    · intro source _hsource
      exact hall source.1 source.2
  · let exceptionalFiber := actualBlockerFiber H hexceptionalA
    let sources : Finset (CriticalShellSystem.CarrierVertex D.A) :=
      Finset.univ \ exceptionalFiber
    have hsplit := Finset.card_sdiff_add_card_inter
      (Finset.univ : Finset (CriticalShellSystem.CarrierVertex D.A))
      exceptionalFiber
    have htotal :
        Fintype.card (CriticalShellSystem.CarrierVertex D.A) = D.A.card := by
      simp [CriticalShellSystem.CarrierVertex, Fintype.card_coe]
    have hfiberSubset : exceptionalFiber ⊆
        (Finset.univ : Finset (CriticalShellSystem.CarrierVertex D.A)) :=
      Finset.subset_univ _
    have hsources : 8 ≤ sources.card := by
      have hfiber' : exceptionalFiber.card ≤ 2 := by
        simpa [exceptionalFiber] using hfiber
      simp only [Finset.inter_eq_right.mpr hfiberSubset,
        Finset.card_univ, htotal] at hsplit
      simpa [sources] using (show 8 ≤
        (Finset.univ \ exceptionalFiber).card by omega)
    refine ⟨{
      sources := sources
      card_ge_eight := hsources
      crossSurvives := ?_ }⟩
    intro source hsource
    have hnotFiber : source ∉ exceptionalFiber := by
      simpa [sources] using hsource
    rcases hcover source.1 source.2 with hq | hw | hcenter
    · exact Or.inl hq
    · exact Or.inr hw
    · exact False.elim (hnotFiber (Finset.mem_filter.mpr
        ⟨Finset.mem_univ source, Subtype.ext hcenter⟩))

/-- Color a source by one surviving deletion; color zero is chosen whenever
the first deletion survives. -/
noncomputable def mutualCrossSurvivalColor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K)
    (source : CriticalShellSystem.CarrierVertex D.A) : Fin 2 :=
  if HasNEquidistantPointsAt 4
      (D.A.erase (K.source E.index).1) (H.blockerVertex source).1 then
    0
  else
    1

theorem mutualCrossSurvivalColor_eq_zero_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    mutualCrossSurvivalColor E source = 0 ↔
      HasNEquidistantPointsAt 4
        (D.A.erase (K.source E.index).1) (H.blockerVertex source).1 := by
  simp [mutualCrossSurvivalColor]

theorem mutualCrossSurvivalColor_eq_one_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    mutualCrossSurvivalColor E source = 1 ↔
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase (K.source E.index).1) (H.blockerVertex source).1 := by
  simp [mutualCrossSurvivalColor]

/-- Two cross-surviving source vertices of one deletion color whose actual
blockers occupy one indexed closed cap. -/
structure SameCapMutualCrossSurvivalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (E : PhysicalActualCriticalMutualOmissionEdge R.exactFive.cycle) where
  family : MutualCrossSurvivingSourceFamily E
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  capIndex : Fin 3
  sources_ne : source₁ ≠ source₂
  source₁_mem : source₁ ∈ family.sources
  source₂_mem : source₂ ∈ family.sources
  blocker₁_mem_cap :
    (H.blockerVertex source₁).1 ∈ S.capByIndex capIndex
  blocker₂_mem_cap :
    (H.blockerVertex source₂).1 ∈ S.capByIndex capIndex
  sameSurvival :
    ((HasNEquidistantPointsAt 4
          (D.A.erase (R.exactFive.cycle.source E.index).1)
          (H.blockerVertex source₁).1 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase (R.exactFive.cycle.source E.index).1)
          (H.blockerVertex source₂).1) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex E.index)).1)
          (H.blockerVertex source₁).1 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex E.index)).1)
          (H.blockerVertex source₂).1))

/-- Eight sources in the six boxes
`surviving deletion × actual-blocker cap` force a collision. -/
theorem nonempty_sameCapMutualCrossSurvivalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (E : PhysicalActualCriticalMutualOmissionEdge R.exactFive.cycle) :
    Nonempty (SameCapMutualCrossSurvivalPair R E) := by
  classical
  rcases nonempty_mutualCrossSurvivingSourceFamily R E with ⟨family⟩
  let Box := Fin 2 × Fin 3
  let assignment : {source // source ∈ family.sources} → Box :=
    fun source ↦
      (mutualCrossSurvivalColor E source.1,
        actualBlockerCapIndex S H source.1)
  have hnotInjective : ¬ Function.Injective assignment := by
    intro hinjective
    have hle := Fintype.card_le_of_injective assignment hinjective
    have hdomain :
        Fintype.card {source // source ∈ family.sources} =
          family.sources.card := by simp
    have hbox : Fintype.card Box = 6 := by simp [Box]
    rw [hdomain, hbox] at hle
    have hfamily := family.card_ge_eight
    omega
  obtain ⟨source₁, source₂, hsources, hassignment⟩ :
      ∃ source₁ source₂ : {source // source ∈ family.sources},
        source₁ ≠ source₂ ∧ assignment source₁ = assignment source₂ := by
    by_contra hnone
    push_neg at hnone
    exact hnotInjective fun source₁ source₂ heq ↦
      Classical.byContradiction fun hne ↦
        hnone source₁ source₂ hne heq
  have hcolor :
      mutualCrossSurvivalColor E source₁.1 =
        mutualCrossSurvivalColor E source₂.1 :=
    congrArg Prod.fst hassignment
  have hcap :
      actualBlockerCapIndex S H source₁.1 =
        actualBlockerCapIndex S H source₂.1 :=
    congrArg Prod.snd hassignment
  let capIndex := actualBlockerCapIndex S H source₁.1
  have hsameSurvival :
      ((HasNEquidistantPointsAt 4
            (D.A.erase (R.exactFive.cycle.source E.index).1)
            (H.blockerVertex source₁.1).1 ∧
          HasNEquidistantPointsAt 4
            (D.A.erase (R.exactFive.cycle.source E.index).1)
            (H.blockerVertex source₂.1).1) ∨
        (HasNEquidistantPointsAt 4
            (D.A.erase
              (R.exactFive.cycle.source
                (R.exactFive.cycle.successorIndex E.index)).1)
            (H.blockerVertex source₁.1).1 ∧
          HasNEquidistantPointsAt 4
            (D.A.erase
              (R.exactFive.cycle.source
                (R.exactFive.cycle.successorIndex E.index)).1)
            (H.blockerVertex source₂.1).1)) := by
    by_cases hq₁ : HasNEquidistantPointsAt 4
        (D.A.erase (R.exactFive.cycle.source E.index).1)
        (H.blockerVertex source₁.1).1
    · left
      refine ⟨hq₁, ?_⟩
      apply (mutualCrossSurvivalColor_eq_zero_iff E source₂.1).1
      rw [← hcolor]
      exact (mutualCrossSurvivalColor_eq_zero_iff E source₁.1).2 hq₁
    · right
      have hq₂ : ¬ HasNEquidistantPointsAt 4
          (D.A.erase (R.exactFive.cycle.source E.index).1)
          (H.blockerVertex source₂.1).1 := by
        apply (mutualCrossSurvivalColor_eq_one_iff E source₂.1).1
        rw [← hcolor]
        exact (mutualCrossSurvivalColor_eq_one_iff E source₁.1).2 hq₁
      exact ⟨
        (family.crossSurvives source₁.1 source₁.2).resolve_left hq₁,
        (family.crossSurvives source₂.1 source₂.2).resolve_left hq₂⟩
  exact ⟨{
    family := family
    source₁ := source₁.1
    source₂ := source₂.1
    capIndex := capIndex
    sources_ne := Subtype.coe_injective.ne hsources
    source₁_mem := source₁.2
    source₂_mem := source₂.2
    blocker₁_mem_cap := actualBlocker_mem_chosenCap S H source₁.1
    blocker₂_mem_cap := by
      simpa [capIndex, hcap] using actualBlocker_mem_chosenCap S H source₂.1
    sameSurvival := hsameSurvival }⟩

/-- Distinct same-cap blockers give a banked common-deletion packet. -/
structure SameCapCommonDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (E : PhysicalActualCriticalMutualOmissionEdge R.exactFive.cycle) where
  pair : SameCapMutualCrossSurvivalPair R E
  deleted : ℝ²
  deleted_eq :
    deleted = (R.exactFive.cycle.source E.index).1 ∨
      deleted =
        (R.exactFive.cycle.source
          (R.exactFive.cycle.successorIndex E.index)).1
  blockers_ne :
    (H.blockerVertex pair.source₁).1 ≠ (H.blockerVertex pair.source₂).1
  packet : CommonDeletionTwoCenterPacket D H deleted
    (H.blockerVertex pair.source₁).1 (H.blockerVertex pair.source₂).1

/-- Equal blockers leave one exact critical shell containing both sources and
omitting the shared surviving deletion. -/
structure EqualBlockerShellResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (E : PhysicalActualCriticalMutualOmissionEdge R.exactFive.cycle) where
  pair : SameCapMutualCrossSurvivalPair R E
  deleted : ℝ²
  deleted_eq :
    deleted = (R.exactFive.cycle.source E.index).1 ∨
      deleted =
        (R.exactFive.cycle.source
          (R.exactFive.cycle.successorIndex E.index)).1
  blockers_eq :
    (H.blockerVertex pair.source₁).1 = (H.blockerVertex pair.source₂).1
  source₁_mem_shell :
    pair.source₁.1 ∈
      (H.selectedAt pair.source₁.1 pair.source₁.2).toCriticalFourShell.support
  source₂_mem_shell :
    pair.source₂.1 ∈
      (H.selectedAt pair.source₁.1 pair.source₁.2).toCriticalFourShell.support
  deleted_not_mem_shell :
    deleted ∉
      (H.selectedAt pair.source₁.1 pair.source₁.2).toCriticalFourShell.support

/-- Exact terminal split after the global cap pigeonhole.  The distinct arm
reaches an existing bank packet; the equal arm records the remaining exact
shell without inventing an incidence that the parent does not supply. -/
theorem sameCapCommonDeletion_or_equalBlockerShellResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (E : PhysicalActualCriticalMutualOmissionEdge R.exactFive.cycle) :
    Nonempty (SameCapCommonDeletionResidual R E) ∨
      Nonempty (EqualBlockerShellResidual R E) := by
  classical
  rcases nonempty_sameCapMutualCrossSurvivalPair R E with ⟨pair⟩
  rcases pair.sameSurvival with hfirst | hsecond
  · let deleted := (R.exactFive.cycle.source E.index).1
    by_cases hblockers :
        (H.blockerVertex pair.source₁).1 = (H.blockerVertex pair.source₂).1
    · right
      refine ⟨{
        pair := pair
        deleted := deleted
        deleted_eq := Or.inl rfl
        blockers_eq := hblockers
        source₁_mem_shell :=
          (H.selectedAt pair.source₁.1 pair.source₁.2).toCriticalFourShell.q_mem_support
        source₂_mem_shell := ?_
        deleted_not_mem_shell := ?_ }⟩
      · apply source_mem_critical_support_of_no_qfree
        intro hsurvives
        apply H.no_qfree_at pair.source₂.1 pair.source₂.2
        have hcenters :
            H.centerAt pair.source₁.1 pair.source₁.2 =
              H.centerAt pair.source₂.1 pair.source₂.2 := hblockers
        rw [hcenters] at hsurvives
        exact hsurvives
      · exact (cross_deletion_survives_iff_not_mem_selected_support
          H pair.source₁.2).mp hfirst.1
    · left
      rcases nonempty_commonDeletionTwoCenterPacket H
          (PhysicalVertex.mem_A (R.exactFive.cycle.source E.index))
          (blocker_mem_A H pair.source₁) (blocker_mem_A H pair.source₂)
          hblockers hfirst.1 hfirst.2 with ⟨packet⟩
      exact ⟨{
        pair := pair
        deleted := deleted
        deleted_eq := Or.inl rfl
        blockers_ne := hblockers
        packet := packet }⟩
  · let deleted :=
      (R.exactFive.cycle.source
        (R.exactFive.cycle.successorIndex E.index)).1
    by_cases hblockers :
        (H.blockerVertex pair.source₁).1 = (H.blockerVertex pair.source₂).1
    · right
      refine ⟨{
        pair := pair
        deleted := deleted
        deleted_eq := Or.inr rfl
        blockers_eq := hblockers
        source₁_mem_shell :=
          (H.selectedAt pair.source₁.1 pair.source₁.2).toCriticalFourShell.q_mem_support
        source₂_mem_shell := ?_
        deleted_not_mem_shell := ?_ }⟩
      · apply source_mem_critical_support_of_no_qfree
        intro hsurvives
        apply H.no_qfree_at pair.source₂.1 pair.source₂.2
        have hcenters :
            H.centerAt pair.source₁.1 pair.source₁.2 =
              H.centerAt pair.source₂.1 pair.source₂.2 := hblockers
        rw [hcenters] at hsurvives
        exact hsurvives
      · exact (cross_deletion_survives_iff_not_mem_selected_support
          H pair.source₁.2).mp hsecond.1
    · left
      rcases nonempty_commonDeletionTwoCenterPacket H
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex E.index)))
          (blocker_mem_A H pair.source₁) (blocker_mem_A H pair.source₂)
          hblockers hsecond.1 hsecond.2 with ⟨packet⟩
      exact ⟨{
        pair := pair
        deleted := deleted
        deleted_eq := Or.inr rfl
        blockers_ne := hblockers
        packet := packet }⟩

#print axioms ten_le_card_of_robustLargeRadiusParentSurface
#print axioms nonempty_mutualCrossSurvivingSourceFamily
#print axioms nonempty_sameCapMutualCrossSurvivalPair
#print axioms sameCapCommonDeletion_or_equalBlockerShellResidual

end

end ATailExactFiveMutualGlobalCapConsumerScratch
end Problem97
