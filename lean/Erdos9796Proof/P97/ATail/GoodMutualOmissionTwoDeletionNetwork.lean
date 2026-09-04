/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.SevenSourceCriticalShellMutualOmission

/-!
# A source-native two-deletion network from seven good sources

The exact-four robust surface leaves at least seven good sources once the
carrier has more than twelve points.  The seven-source critical-shell lemma
then supplies a mutually omitted pair.  This file packages the resulting
pair together with the deletion survivals that follow directly from its two
critical shells and from robustness at the physical second apex.

This is a producer only: it does not consume the network to derive `False`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGoodMutualOmissionTwoDeletionNetwork

open ATailDeletionRobustness
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailSevenSourceCriticalShellMutualOmission
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open SevenSourceTournament

attribute [local instance] Classical.propDecidable

abbrev CarrierVertex (A : Finset ℝ²) :=
  CriticalShellSystem.CarrierVertex A

private theorem good_source_survives_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ goodOutsideSources R) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem R).centerAt source.1 source.2) := by
  have houtside := (Finset.mem_sdiff.mp hsource).1
  have hnotBad := (Finset.mem_sdiff.mp hsource).2
  by_cases hq :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt source.1 source.2)
  · exact Or.inl hq
  · right
    by_contra hw
    exact hnotBad (Finset.mem_filter.mpr ⟨houtside, hq, hw⟩)

structure GoodMutualOmissionTwoDeletionNetwork
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) : Type where
  s : CarrierVertex D.A
  t : CarrierVertex D.A
  s_mem_good : s ∈ goodOutsideSources R
  t_mem_good : t ∈ goodOutsideSources R
  s_ne_t : s ≠ t
  t_not_mem_s_shell :
    t.1 ∉
      ((lateFirstApexSystem R).selectedAt s.1 s.2).toCriticalFourShell.support
  s_not_mem_t_shell :
    s.1 ∉
      ((lateFirstApexSystem R).selectedAt t.1 t.2).toCriticalFourShell.support
  blockers_ne :
    (lateFirstApexSystem R).centerAt s.1 s.2 ≠
      (lateFirstApexSystem R).centerAt t.1 t.2
  s_survives_retained :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt s.1 s.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem R).centerAt s.1 s.2)
  t_survives_retained :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt t.1 t.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem R).centerAt t.1 t.2)
  s_blocker_survives_delete_t :
    HasNEquidistantPointsAt 4 (D.A.erase t.1)
      ((lateFirstApexSystem R).centerAt s.1 s.2)
  t_blocker_survives_delete_s :
    HasNEquidistantPointsAt 4 (D.A.erase s.1)
      ((lateFirstApexSystem R).centerAt t.1 t.2)
  second_apex_survives_delete_s :
    HasNEquidistantPointsAt 4 (D.A.erase s.1) S.oppApex2
  second_apex_survives_delete_t :
    HasNEquidistantPointsAt 4 (D.A.erase t.1) S.oppApex2

theorem nonempty_goodMutualOmissionTwoDeletionNetwork_of_card_gt_twelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (hcard : 12 < D.A.card) :
    Nonempty (GoodMutualOmissionTwoDeletionNetwork R surface) := by
  classical
  let Hlate := lateFirstApexSystem R
  have hgood : 7 ≤ (goodOutsideSources R).card :=
    seven_le_goodOutsideSources_card_of_card_gt_twelve R hcard
  obtain ⟨T, hTsub, hTcard⟩ :=
    Finset.exists_subset_card_eq (s := goodOutsideSources R) hgood
  let TSubtype := {x // x ∈ T}
  have hTSubtypeCard : Fintype.card TSubtype = 7 := by
    simpa [TSubtype] using hTcard
  let castEquiv : Vertex ≃ Fin (Fintype.card TSubtype) :=
    { toFun := Fin.cast hTSubtypeCard.symm
      invFun := Fin.cast hTSubtypeCard
      left_inv := by intro i; simp
      right_inv := by intro i; simp }
  let e : Vertex ≃ TSubtype :=
    castEquiv.trans (Fintype.equivFin TSubtype).symm
  let sources : Vertex ↪ CarrierVertex D.A :=
    { toFun := fun i => (e i).1
      inj' := by
        intro i j hij
        apply e.injective
        apply Subtype.ext
        exact hij }
  have hsource_good : ∀ i : Vertex, sources i ∈ goodOutsideSources R := by
    intro i
    exact hTsub (e i).2
  obtain ⟨i, j, hij, hji, hij'⟩ := exists_mutualOmission Hlate sources
  let s : CarrierVertex D.A := sources i
  let t : CarrierVertex D.A := sources j
  have hs_good : s ∈ goodOutsideSources R := by
    exact hsource_good i
  have ht_good : t ∈ goodOutsideSources R := by
    exact hsource_good j
  have hst : s ≠ t := by
    intro hst
    apply hij
    apply sources.injective
    simpa [s, t] using hst
  have ht_not_s :
      t.1 ∉ (Hlate.selectedAt s.1 s.2).toCriticalFourShell.support := by
    exact hji
  have hs_not_t :
      s.1 ∉ (Hlate.selectedAt t.1 t.2).toCriticalFourShell.support := by
    exact hij'
  have hcenters : Hlate.centerAt s.1 s.2 ≠ Hlate.centerAt t.1 t.2 := by
    intro hcenter
    let Ks := (Hlate.selectedAt s.1 s.2).toCriticalFourShell
    let Kt := (Hlate.selectedAt t.1 t.2).toCriticalFourShell
    have hsupports : Ks.support = Kt.support := by
      change
        (Hlate.selectedAt s.1 s.2).toCriticalFourShell.support =
          (Hlate.selectedAt t.1 t.2).toCriticalFourShell.support
      rw [← uniqueFourClass_centerAt_eq_selectedAt_support Hlate s.1 s.2,
        ← uniqueFourClass_centerAt_eq_selectedAt_support Hlate t.1 t.2,
        hcenter]
    have htKs : t.1 ∈ Ks.support := by
      rw [hsupports]
      exact Kt.q_mem_support
    have hsKt : s.1 ∈ Kt.support := by
      rw [← hsupports]
      exact Ks.q_mem_support
    exact hs_not_t hsKt
  have hs_retained := good_source_survives_retained R hs_good
  have ht_retained := good_source_survives_retained R ht_good
  have hs_delete_t :
      HasNEquidistantPointsAt 4 (D.A.erase t.1)
        (Hlate.centerAt s.1 s.2) := by
    exact selectedFourClass_survives_erase_of_not_mem
      (Hlate.selectedAt s.1 s.2).toCriticalFourShell.toSelectedFourClass ht_not_s
  have ht_delete_s :
      HasNEquidistantPointsAt 4 (D.A.erase s.1)
        (Hlate.centerAt t.1 t.2) := by
    exact selectedFourClass_survives_erase_of_not_mem
      (Hlate.selectedAt t.1 t.2).toCriticalFourShell.toSelectedFourClass hs_not_t
  have hs_second :
      HasNEquidistantPointsAt 4 (D.A.erase s.1) S.oppApex2 :=
    surface.secondApex_robust.survives s.1 s.2
  have ht_second :
      HasNEquidistantPointsAt 4 (D.A.erase t.1) S.oppApex2 :=
    surface.secondApex_robust.survives t.1 t.2
  refine ⟨{
    s := s
    t := t
    s_mem_good := hs_good
    t_mem_good := ht_good
    s_ne_t := hst
    t_not_mem_s_shell := ht_not_s
    s_not_mem_t_shell := hs_not_t
    blockers_ne := hcenters
    s_survives_retained := hs_retained
    t_survives_retained := ht_retained
    s_blocker_survives_delete_t := hs_delete_t
    t_blocker_survives_delete_s := ht_delete_s
    second_apex_survives_delete_s := hs_second
    second_apex_survives_delete_t := ht_second }⟩

end ATailGoodMutualOmissionTwoDeletionNetwork
end Problem97

#print axioms Problem97.ATailGoodMutualOmissionTwoDeletionNetwork.nonempty_goodMutualOmissionTwoDeletionNetwork_of_card_gt_twelve
