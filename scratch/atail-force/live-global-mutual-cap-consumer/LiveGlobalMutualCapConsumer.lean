import GlobalMutualPairCycleEdge
import MutualGlobalCapConsumer

/-!
# The transition-global mutual pair reaches the full same-cap consumer

The existing global-cap consumer was indexed by the historical cycle stored
in a parent residual.  The stronger transition-global split produces an
arbitrary mutual pair and a fresh period-two cycle.  This file reruns only the
cycle-independent counting layer on that fresh edge, preserving the named
pair and reaching the same distinct/equal-blocker terminal split.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLiveGlobalMutualCapConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFiveMutualGlobalCapConsumerScratch
open ATailExactFiveMutualOmissionClosureScratch
open ATailGlobalMutualPairCycleEdgeScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source : CriticalShellSystem.CarrierVertex A) :
    (H.blockerVertex source).1 ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2

/-- The global normal form leaves eight fresh-edge cross-surviving sources
on any robust parent surface.  No historical-cycle start is used. -/
theorem nonempty_liveMutualCrossSurvivingSourceFamily
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
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

/-- Two source vertices of one surviving-deletion color whose actual blockers
lie in one indexed cap, now for the fresh period-two edge. -/
structure LiveSameCapMutualCrossSurvivalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) where
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
          (D.A.erase (K.source E.index).1)
          (H.blockerVertex source₁).1 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase (K.source E.index).1)
          (H.blockerVertex source₂).1) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase (K.source (K.successorIndex E.index)).1)
          (H.blockerVertex source₁).1 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase (K.source (K.successorIndex E.index)).1)
          (H.blockerVertex source₂).1))

/-- Eight sources in the six boxes
`surviving deletion × actual-blocker cap` force a fresh-edge collision. -/
theorem nonempty_liveSameCapMutualCrossSurvivalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
    Nonempty (LiveSameCapMutualCrossSurvivalPair F E) := by
  classical
  rcases nonempty_liveMutualCrossSurvivingSourceFamily F E with ⟨family⟩
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
      Classical.byContradiction fun hne ↦ hnone source₁ source₂ hne heq
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
            (D.A.erase (K.source E.index).1)
            (H.blockerVertex source₁.1).1 ∧
          HasNEquidistantPointsAt 4
            (D.A.erase (K.source E.index).1)
            (H.blockerVertex source₂.1).1) ∨
        (HasNEquidistantPointsAt 4
            (D.A.erase (K.source (K.successorIndex E.index)).1)
            (H.blockerVertex source₁.1).1 ∧
          HasNEquidistantPointsAt 4
            (D.A.erase (K.source (K.successorIndex E.index)).1)
            (H.blockerVertex source₂.1).1)) := by
    by_cases hq₁ : HasNEquidistantPointsAt 4
        (D.A.erase (K.source E.index).1)
        (H.blockerVertex source₁.1).1
    · left
      refine ⟨hq₁, ?_⟩
      apply (mutualCrossSurvivalColor_eq_zero_iff E source₂.1).1
      rw [← hcolor]
      exact (mutualCrossSurvivalColor_eq_zero_iff E source₁.1).2 hq₁
    · right
      have hq₂ : ¬ HasNEquidistantPointsAt 4
          (D.A.erase (K.source E.index).1)
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

/-- The distinct-blocker terminal packet on the fresh edge. -/
structure LiveSameCapCommonDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) where
  pair : LiveSameCapMutualCrossSurvivalPair F E
  deleted : ℝ²
  deleted_eq :
    deleted = (K.source E.index).1 ∨
      deleted = (K.source (K.successorIndex E.index)).1
  blockers_ne :
    (H.blockerVertex pair.source₁).1 ≠ (H.blockerVertex pair.source₂).1
  packet : CommonDeletionTwoCenterPacket D H deleted
    (H.blockerVertex pair.source₁).1 (H.blockerVertex pair.source₂).1

/-- The equal-blocker terminal packet on the fresh edge. -/
structure LiveEqualBlockerShellResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) where
  pair : LiveSameCapMutualCrossSurvivalPair F E
  deleted : ℝ²
  deleted_eq :
    deleted = (K.source E.index).1 ∨
      deleted = (K.source (K.successorIndex E.index)).1
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

/-- The fresh global mutual edge reaches the same exact distinct/equal
same-cap blocker split as the historical-cycle consumer. -/
theorem liveSameCapCommonDeletion_or_equalBlockerShellResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
    Nonempty (LiveSameCapCommonDeletionResidual F E) ∨
      Nonempty (LiveEqualBlockerShellResidual F E) := by
  classical
  rcases nonempty_liveSameCapMutualCrossSurvivalPair F E with ⟨pair⟩
  rcases pair.sameSurvival with hfirst | hsecond
  · let deleted := (K.source E.index).1
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
          (PhysicalVertex.mem_A (K.source E.index))
          (blocker_mem_A H pair.source₁) (blocker_mem_A H pair.source₂)
          hblockers hfirst.1 hfirst.2 with ⟨packet⟩
      exact ⟨{
        pair := pair
        deleted := deleted
        deleted_eq := Or.inl rfl
        blockers_ne := hblockers
        packet := packet }⟩
  · let deleted := (K.source (K.successorIndex E.index)).1
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
          (PhysicalVertex.mem_A (K.source (K.successorIndex E.index)))
          (blocker_mem_A H pair.source₁) (blocker_mem_A H pair.source₂)
          hblockers hsecond.1 hsecond.2 with ⟨packet⟩
      exact ⟨{
        pair := pair
        deleted := deleted
        deleted_eq := Or.inr rfl
        blockers_ne := hblockers
        packet := packet }⟩

/-- Named-edge provenance-bearing live mutual outcome at the strongest
current bank-facing boundary.  The profile remains explicit in the theorem
type. -/
theorem nonempty_globalMutualCapOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (pair : PhysicalActualCriticalMutualOmissionPair H profile) :
    ∃ (K : PhysicalActualCriticalOmissionCycle H profile)
      (E : PhysicalActualCriticalMutualOmissionEdge K),
      K.period = 2 ∧
      K.start = pair.source ∧
      K.source E.index = pair.source ∧
      K.source (K.successorIndex E.index) = pair.target ∧
      Nonempty (MutualOmissionCrissCrossNormalForm E) ∧
      (Nonempty (LiveSameCapCommonDeletionResidual F E) ∨
        Nonempty (LiveEqualBlockerShellResidual F E)) := by
  rcases nonempty_twoCycleEdge_of_mutualOmissionPair pair with
    ⟨K, E, hperiod, hstart, hsource, htarget⟩
  exact ⟨K, E, hperiod, hstart, hsource, htarget,
    nonempty_mutualOmissionCrissCrossNormalForm E,
    liveSameCapCommonDeletion_or_equalBlockerShellResidual F E⟩

#print axioms nonempty_liveMutualCrossSurvivingSourceFamily
#print axioms nonempty_liveSameCapMutualCrossSurvivalPair
#print axioms liveSameCapCommonDeletion_or_equalBlockerShellResidual
#print axioms nonempty_globalMutualCapOutcome

end

end ATailLiveGlobalMutualCapConsumerScratch
end Problem97
