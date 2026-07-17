/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustTwoRadiusCenterLocalization
import Erdos9796Proof.P97.IsoscelesCount

/-!
# Scratch: source-facing consequences of the unequal two-radius core

This file consumes `StrictPairUnequalCoreEndpoint` without iterating its
fresh robustness.  It extracts two disjoint equal-radius pairs outside the
physical second-apex shell and proves the resulting strict local isosceles
excess at the fresh center.

The packet supplies the metric part of a two-pair shell-curvature input.  It
does not manufacture the missing lifted boundary-angle chart or assert that
the two pairs are nonalternating in boundary order.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustTwoRadiusUnequalCoreConsumerScratch

open ATAILStageOneMinimalDeletionCore
open ATailRobustTwoRadiusCenterLocalizationScratch

attribute [local instance] Classical.propDecidable

/-- Two distinct-radius pairs supplied by the fresh minimal-deletion shells,
after removing the physical second-apex row.  The union has four distinct
targets, but no cyclic pairing order is asserted. -/
structure UnequalCoreOffPhysicalTwoPairPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (firstRow : SelectedFourClass D.A S.oppApex2)
    (E : StrictPairUnequalCoreEndpoint D S firstRow) : Type where
  firstSource : ℝ²
  secondSource : ℝ²
  firstSource_mem : firstSource ∈ E.deleted
  secondSource_mem : secondSource ∈ E.deleted
  sources_ne : firstSource ≠ secondSource
  firstPair : Finset ℝ²
  secondPair : Finset ℝ²
  firstPair_card : firstPair.card = 2
  secondPair_card : secondPair.card = 2
  firstPair_subset_shell :
    firstPair ⊆
      (E.core.shellAt ⟨firstSource, firstSource_mem⟩).toCriticalFourShell.support
  secondPair_subset_shell :
    secondPair ⊆
      (E.core.shellAt ⟨secondSource, secondSource_mem⟩).toCriticalFourShell.support
  firstPair_disjoint_physical : Disjoint firstPair firstRow.support
  secondPair_disjoint_physical : Disjoint secondPair firstRow.support
  pairs_disjoint : Disjoint firstPair secondPair
  four_targets : (firstPair ∪ secondPair).card = 4
  firstPair_sameRadius :
    ∀ point ∈ firstPair,
      dist E.center point = dist E.center firstSource
  secondPair_sameRadius :
    ∀ point ∈ secondPair,
      dist E.center point = dist E.center secondSource
  source_radii_ne :
    dist E.center firstSource ≠ dist E.center secondSource

private theorem two_le_shell_sdiff_physical
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (E : StrictPairUnequalCoreEndpoint D S firstRow)
    (source : {point : ℝ² // point ∈ E.deleted}) :
    2 ≤
      ((E.core.shellAt source).toCriticalFourShell.support \
        firstRow.support).card := by
  let freshRow : SelectedFourClass D.A E.center :=
    (E.core.shellAt source).toSelectedFourClass
  have hinter :
      (freshRow.support ∩ firstRow.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two freshRow firstRow
      E.center_ne_secondApex
  have hsplit := Finset.card_sdiff_add_card_inter
    freshRow.support firstRow.support
  have hcard : freshRow.support.card = 4 := freshRow.support_card
  change 2 ≤ (freshRow.support \ firstRow.support).card
  omega

/-- The unequal two-source core supplies two disjoint two-point fibers at
different fresh-center radii, all outside the physical exact shell. -/
theorem StrictPairUnequalCoreEndpoint.exists_offPhysicalTwoPairPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (E : StrictPairUnequalCoreEndpoint D S firstRow) :
    Nonempty (UnequalCoreOffPhysicalTwoPairPacket D S firstRow E) := by
  classical
  have htwo : 1 < E.deleted.card := by
    rw [E.deleted_card_eq_two]
    omega
  rcases Finset.one_lt_card.mp htwo with
    ⟨firstSource, hfirstSource, secondSource, hsecondSource, hsources⟩
  let first : {point : ℝ² // point ∈ E.deleted} :=
    ⟨firstSource, hfirstSource⟩
  let second : {point : ℝ² // point ∈ E.deleted} :=
    ⟨secondSource, hsecondSource⟩
  let firstShell : SelectedFourClass D.A E.center :=
    (E.core.shellAt first).toSelectedFourClass
  let secondShell : SelectedFourClass D.A E.center :=
    (E.core.shellAt second).toSelectedFourClass
  have hfirstTwo :
      2 ≤ (firstShell.support \ firstRow.support).card := by
    simpa [firstShell, first] using
      two_le_shell_sdiff_physical E first
  have hsecondTwo :
      2 ≤ (secondShell.support \ firstRow.support).card := by
    simpa [secondShell, second] using
      two_le_shell_sdiff_physical E second
  rcases Finset.exists_subset_card_eq
      (s := firstShell.support \ firstRow.support) hfirstTwo with
    ⟨firstPair, hfirstPairSub, hfirstPairCard⟩
  rcases Finset.exists_subset_card_eq
      (s := secondShell.support \ firstRow.support) hsecondTwo with
    ⟨secondPair, hsecondPairSub, hsecondPairCard⟩
  have hfirstSecond : first ≠ second := by
    intro h
    exact hsources (congrArg Subtype.val h)
  have hshells : Disjoint firstShell.support secondShell.support := by
    simpa [firstShell, secondShell] using
      E.core.supports_pairwise_disjoint first second hfirstSecond
  have hpairs : Disjoint firstPair secondPair := by
    rw [Finset.disjoint_left]
    intro point hfirstPoint hsecondPoint
    exact Finset.disjoint_left.mp hshells
      (Finset.mem_sdiff.mp (hfirstPairSub hfirstPoint)).1
      (Finset.mem_sdiff.mp (hsecondPairSub hsecondPoint)).1
  have hfirstPhysical : Disjoint firstPair firstRow.support := by
    rw [Finset.disjoint_left]
    intro point hfirstPoint hphysical
    exact (Finset.mem_sdiff.mp (hfirstPairSub hfirstPoint)).2 hphysical
  have hsecondPhysical : Disjoint secondPair firstRow.support := by
    rw [Finset.disjoint_left]
    intro point hsecondPoint hphysical
    exact (Finset.mem_sdiff.mp (hsecondPairSub hsecondPoint)).2 hphysical
  exact ⟨{
    firstSource := firstSource
    secondSource := secondSource
    firstSource_mem := hfirstSource
    secondSource_mem := hsecondSource
    sources_ne := hsources
    firstPair := firstPair
    secondPair := secondPair
    firstPair_card := hfirstPairCard
    secondPair_card := hsecondPairCard
    firstPair_subset_shell := by
      intro point hpoint
      exact (Finset.mem_sdiff.mp (hfirstPairSub hpoint)).1
    secondPair_subset_shell := by
      intro point hpoint
      exact (Finset.mem_sdiff.mp (hsecondPairSub hpoint)).1
    firstPair_disjoint_physical := hfirstPhysical
    secondPair_disjoint_physical := hsecondPhysical
    pairs_disjoint := hpairs
    four_targets := by
      rw [Finset.card_union_of_disjoint hpairs,
        hfirstPairCard, hsecondPairCard]
    firstPair_sameRadius := by
      intro point hpoint
      exact (firstShell.support_eq_radius point
        (Finset.mem_sdiff.mp (hfirstPairSub hpoint)).1).trans
        (MinimalDeletionCore.shellAt_radius_eq E.core first)
    secondPair_sameRadius := by
      intro point hpoint
      exact (secondShell.support_eq_radius point
        (Finset.mem_sdiff.mp (hsecondPairSub hpoint)).1).trans
        (MinimalDeletionCore.shellAt_radius_eq E.core second)
    source_radii_ne :=
      E.source_radii_injective firstSource hfirstSource
        secondSource hsecondSource hsources
  }⟩

/-- The endpoint's two deleted strict-cap sources cannot themselves be one
of the equal-radius pairs required by the shell-curvature theorem. -/
theorem StrictPairUnequalCoreEndpoint.deleted_source_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (E : StrictPairUnequalCoreEndpoint D S firstRow)
    {source partner : ℝ²}
    (hsource : source ∈ E.deleted)
    (hpartner : partner ∈ E.deleted)
    (hne : source ≠ partner) :
    dist E.center source ≠ dist E.center partner :=
  E.source_radii_injective source hsource partner hpartner hne

/-- Two distinct fresh radius classes force a strict local isosceles excess
at the fresh center.  This is source-facing progress, but the known global
isosceles upper bound does not make it terminal for the live cardinal range. -/
theorem StrictPairUnequalCoreEndpoint.seven_le_iCountAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (E : StrictPairUnequalCoreEndpoint D S firstRow) :
    7 ≤ iCountAt D.A E.center := by
  rcases
      StrictPairUnequalCoreEndpoint.exists_offPhysicalTwoPairPacket E with
    ⟨P⟩
  let first : {point : ℝ² // point ∈ E.deleted} :=
    ⟨P.firstSource, P.firstSource_mem⟩
  let firstShell : SelectedFourClass D.A E.center :=
    (E.core.shellAt first).toSelectedFourClass
  let second : {point : ℝ² // point ∈ E.deleted} :=
    ⟨P.secondSource, P.secondSource_mem⟩
  obtain ⟨u, v, huv, hpair⟩ := Finset.card_eq_two.mp P.secondPair_card
  apply iCountAt_ge_seven_of_four_class_and_extra_pair
    D.A E.center firstShell.support u v
  · rw [firstShell.support_card]
  · intro point hpoint
    exact Finset.mem_erase.mpr
      ⟨fun h ↦ firstShell.center_not_mem (h ▸ hpoint),
        firstShell.support_subset_A hpoint⟩
  · exact ⟨firstShell.radius, firstShell.support_eq_radius⟩
  · intro point hpoint
    have hpointSecond : point ∈ P.secondPair := by
      simpa [hpair] using hpoint
    have hpointShell := P.secondPair_subset_shell hpointSecond
    exact Finset.mem_erase.mpr
      ⟨fun h ↦
        (E.core.shellAt second).toSelectedFourClass.center_not_mem
          (h ▸ hpointShell),
        (E.core.shellAt
          ⟨P.secondSource, P.secondSource_mem⟩).toCriticalFourShell.support_subset_A
            hpointShell⟩
  · simpa [hpair] using P.secondPair_card
  · refine ⟨dist E.center P.secondSource, ?_⟩
    intro point hpoint
    apply P.secondPair_sameRadius point
    simpa [hpair] using hpoint
  · intro huFirst
    have huSecond : u ∈ P.secondPair := by simp [hpair]
    have hfirstSecond : first ≠ second := by
      intro h
      exact P.sources_ne (congrArg Subtype.val h)
    exact Finset.disjoint_left.mp
      (E.core.supports_pairwise_disjoint first second hfirstSecond)
      huFirst (P.secondPair_subset_shell huSecond)

/-- Both four-point fresh shells contribute disjoint two-subsets to the
isosceles-pair count, so the exact local lower bound is twelve. -/
theorem StrictPairUnequalCoreEndpoint.twelve_le_iCountAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRow : SelectedFourClass D.A S.oppApex2}
    (E : StrictPairUnequalCoreEndpoint D S firstRow) :
    12 ≤ iCountAt D.A E.center := by
  rcases
      StrictPairUnequalCoreEndpoint.exists_offPhysicalTwoPairPacket E with
    ⟨P⟩
  let first : {point : ℝ² // point ∈ E.deleted} :=
    ⟨P.firstSource, P.firstSource_mem⟩
  let second : {point : ℝ² // point ∈ E.deleted} :=
    ⟨P.secondSource, P.secondSource_mem⟩
  let firstShell : SelectedFourClass D.A E.center :=
    (E.core.shellAt first).toSelectedFourClass
  let secondShell : SelectedFourClass D.A E.center :=
    (E.core.shellAt second).toSelectedFourClass
  have hfirstSub : firstShell.support ⊆ D.A.erase E.center := by
    intro point hpoint
    exact Finset.mem_erase.mpr
      ⟨fun h ↦ firstShell.center_not_mem (h ▸ hpoint),
        firstShell.support_subset_A hpoint⟩
  have hsecondSub : secondShell.support ⊆ D.A.erase E.center := by
    intro point hpoint
    exact Finset.mem_erase.mpr
      ⟨fun h ↦ secondShell.center_not_mem (h ▸ hpoint),
        secondShell.support_subset_A hpoint⟩
  have hfirstIso :
      firstShell.support.powersetCard 2 ⊆ IsoscelesPairsAt D.A E.center :=
    powersetCard_two_subset_isoscelesPairsAt_of_equidistant_subset
      D.A E.center firstShell.support hfirstSub
        ⟨firstShell.radius, firstShell.support_eq_radius⟩
  have hsecondIso :
      secondShell.support.powersetCard 2 ⊆ IsoscelesPairsAt D.A E.center :=
    powersetCard_two_subset_isoscelesPairsAt_of_equidistant_subset
      D.A E.center secondShell.support hsecondSub
        ⟨secondShell.radius, secondShell.support_eq_radius⟩
  have hfirstSecond : first ≠ second := by
    intro h
    exact P.sources_ne (congrArg Subtype.val h)
  have hshells : Disjoint firstShell.support secondShell.support := by
    simpa [firstShell, secondShell] using
      E.core.supports_pairwise_disjoint first second hfirstSecond
  have hpowers :
      Disjoint (firstShell.support.powersetCard 2)
        (secondShell.support.powersetCard 2) := by
    rw [Finset.disjoint_left]
    intro pair hfirstPair hsecondPair
    rcases Finset.mem_powersetCard.mp hfirstPair with
      ⟨hpairFirst, hpairCard⟩
    rcases Finset.mem_powersetCard.mp hsecondPair with
      ⟨hpairSecond, _⟩
    have hpairNe : pair.Nonempty := Finset.card_pos.mp (by omega)
    rcases hpairNe with ⟨point, hpoint⟩
    exact Finset.disjoint_left.mp hshells
      (hpairFirst hpoint) (hpairSecond hpoint)
  have hunion :
      firstShell.support.powersetCard 2 ∪
          secondShell.support.powersetCard 2 ⊆
        IsoscelesPairsAt D.A E.center := by
    intro pair hpair
    rcases Finset.mem_union.mp hpair with hfirstPair | hsecondPair
    · exact hfirstIso hfirstPair
    · exact hsecondIso hsecondPair
  calc
    12 =
        (firstShell.support.powersetCard 2 ∪
          secondShell.support.powersetCard 2).card := by
      rw [Finset.card_union_of_disjoint hpowers,
        Finset.card_powersetCard, Finset.card_powersetCard,
        firstShell.support_card, secondShell.support_card]
      decide
    _ ≤ iCountAt D.A E.center := Finset.card_le_card hunion

#print axioms UnequalCoreOffPhysicalTwoPairPacket
#print axioms StrictPairUnequalCoreEndpoint.exists_offPhysicalTwoPairPacket
#print axioms StrictPairUnequalCoreEndpoint.deleted_source_dist_ne
#print axioms StrictPairUnequalCoreEndpoint.seven_le_iCountAt
#print axioms StrictPairUnequalCoreEndpoint.twelve_le_iCountAt

end ATailRobustTwoRadiusUnequalCoreConsumerScratch
end Problem97
