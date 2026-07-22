/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch
import card_four_parent_boundary
import UniqueFourIncidenceBoundary

/-!
# The exact-four surplus-pair boundary

The choice-invariant `ExistsSurplusPairCriticalBlocker` packet is already
inconsistent with the retained exact-four frontier geometry.  It is therefore
not a smaller producer than direct `False`.

This file isolates a strictly weaker terminal occurrence.  It forgets the
critical source, deletion blocking, the selected shell, and the retained pair:
it asks only for some non-apex center of the surplus cap and some radius whose
class contains two off-surplus members of the first-apex class.  Ordered-cap
outside-pair uniqueness rules out even that occurrence.

The final finite theorem reuses the checked exact-four incidence boundary to
pin the precise scope of strong-connectivity and blocker-fiber arguments.  It
is an incidence scope guard, not a Euclidean counterexample.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourSurplusPairProducerScratch

open ATAILCardFourParentBoundary
open ATailCriticalPairFrontier
open ATailGenericMarginalPairCountCountermodel
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourDirectFalseScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  set CP := S.partition
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using CP.v2_mem_C1
  · simpa [CP, SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using CP.v3_mem_C2
  · simpa [CP, SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using CP.v1_mem_C3

/-- A radius class at any non-first-apex center of the surplus cap contains
at most one off-surplus member of a fixed first-apex radius class.  This is
the pair-free geometric normal form behind the existing exact-four terminal. -/
theorem nonapex_surplusCenter_firstApexOffCap_inter_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {firstRadius centerRadius : ℝ} {center : ℝ²}
    (hcenterCap : center ∈ S.surplusCap)
    (hcenterNe : center ≠ S.oppApex1) :
    ((SelectedClass D.A center centerRadius) ∩
        (SelectedClass D.A S.oppApex1 firstRadius \ S.surplusCap)).card ≤ 1 := by
  classical
  rw [Finset.card_le_one]
  intro a ha b hb
  rcases Finset.mem_inter.mp ha with ⟨haCenter, haFirstOff⟩
  rcases Finset.mem_inter.mp hb with ⟨hbCenter, hbFirstOff⟩
  rcases Finset.mem_sdiff.mp haFirstOff with ⟨haFirst, haOff⟩
  rcases Finset.mem_sdiff.mp hbFirstOff with ⟨hbFirst, hbOff⟩
  by_contra hab
  rcases S.capByIndex_cgn4g_capData D.convex S.surplusIdx with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcapSurplus : S.capByIndex S.surplusIdx = S.surplusCap := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact oppApex1_mem_surplusCap S
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hcenterCap
  rcases Finset.mem_image.mp hapexImage with ⟨r, _hr, hrapex⟩
  rcases Finset.mem_image.mp hcenterImage with ⟨s, _hs, hscenter⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hcenterNe
    calc
      center = L.points s := hscenter.symm
      _ = L.points r := by simp [hrs]
      _ = S.oppApex1 := hrapex
  have haA : a ∈ D.A := (mem_selectedClass.mp haFirst).1
  have hbA : b ∈ D.A := (mem_selectedClass.mp hbFirst).1
  have haOutside : a ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    rw [hcap, hcapSurplus]
    exact hbOff
  have hapexDist : dist S.oppApex1 a = dist S.oppApex1 b :=
    (mem_selectedClass.mp haFirst).2.trans
      (mem_selectedClass.mp hbFirst).2.symm
  have hcenterDist : dist center a = dist center b :=
    (mem_selectedClass.mp haCenter).2.trans
      (mem_selectedClass.mp hbCenter).2.symm
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hrs' haA hbA haOutside hbOutside hab
        (by simpa [hrapex] using hapexDist)
        (by simpa [hscenter] using hcenterDist)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hsr' haA hbA haOutside hbOutside hab
        (by simpa [hscenter] using hcenterDist)
        (by simpa [hrapex] using hapexDist)

/-- The weakest row-level terminal occurrence identified by this audit.  It
does not require a critical source, deletion blocking, a selected shell, or
the original retained pair. -/
def ExistsSurplusFirstApexClassPairCenter
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (firstRadius : ℝ) : Prop :=
  ∃ center : ℝ², center ∈ S.surplusCap ∧ center ≠ S.oppApex1 ∧
    ∃ centerRadius : ℝ,
      2 ≤ ((SelectedClass D.A center centerRadius) ∩
        (SelectedClass D.A S.oppApex1 firstRadius \ S.surplusCap)).card

/-- The weaker row-level occurrence is already terminal. -/
theorem false_of_existsSurplusFirstApexClassPairCenter
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {firstRadius : ℝ}
    (P : ExistsSurplusFirstApexClassPairCenter S firstRadius) : False := by
  rcases P with ⟨center, hcenterCap, hcenterNe, centerRadius, htwo⟩
  have hone := nonapex_surplusCenter_firstApexOffCap_inter_card_le_one
    S (firstRadius := firstRadius) (centerRadius := centerRadius)
      hcenterCap hcenterNe
  omega

/-- The old choice-invariant critical-blocker packet implies the weaker
row-level occurrence whenever its named pair belongs to the first-apex class.
This formally records that the old target carries strictly more data than the
actual geometric terminal needs. -/
theorem existsSurplusFirstApexClassPairCenter_of_criticalBlocker
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {firstRadius : ℝ} {q w : ℝ²}
    (hqClass : q ∈ SelectedClass D.A S.oppApex1 firstRadius)
    (hwClass : w ∈ SelectedClass D.A S.oppApex1 firstRadius)
    (hqw : q ≠ w)
    (hqOff : q ∉ S.surplusCap)
    (hwOff : w ∉ S.surplusCap)
    (P : ExistsSurplusPairCriticalBlocker S S.oppApex1 q w) :
    ExistsSurplusFirstApexClassPairCenter S firstRadius := by
  classical
  rcases P with ⟨source, hsource, center, hcenterCap, hcenterNe,
    C, _hblocked, hqC, hwC⟩
  refine ⟨center, hcenterCap, hcenterNe, C.toCriticalFourShell.radius, ?_⟩
  let target :=
    (SelectedClass D.A center C.toCriticalFourShell.radius) ∩
      (SelectedClass D.A S.oppApex1 firstRadius \ S.surplusCap)
  have hpairSubset : ({q, w} : Finset ℝ²) ⊆ target := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hz | hz
    · subst z
      apply Finset.mem_inter.mpr
      refine ⟨mem_selectedClass.mpr ⟨?_, ?_⟩,
        Finset.mem_sdiff.mpr ⟨hqClass, hqOff⟩⟩
      · exact C.toCriticalFourShell.support_subset_A hqC
      · simpa using C.toCriticalFourShell.support_eq_radius q hqC
    · subst z
      apply Finset.mem_inter.mpr
      refine ⟨mem_selectedClass.mpr ⟨?_, ?_⟩,
        Finset.mem_sdiff.mpr ⟨hwClass, hwOff⟩⟩
      · exact C.toCriticalFourShell.support_subset_A hwC
      · simpa using C.toCriticalFourShell.support_eq_radius w hwC
  have hpairCard : ({q, w} : Finset ℝ²).card = 2 := by
    simp [hqw]
  calc
    2 = ({q, w} : Finset ℝ²).card := hpairCard.symm
    _ ≤ target.card := Finset.card_le_card hpairSubset

/-- On the full exact-four source surface, the requested producer is already
negated by ordered-cap geometry.  Hence proving it is exactly as hard as
proving the branch contradictory. -/
theorem not_existsSurplusPairCriticalBlocker_of_originalUniqueFourResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (_R : OriginalUniqueFourResidual F) :
    ¬ ExistsSurplusPairCriticalBlocker
      S S.oppApex1 F.pair.q F.pair.w := by
  intro P
  have hqMarginal := Finset.mem_sdiff.mp F.pair.q_mem_marginal
  have hwMarginal := Finset.mem_sdiff.mp F.pair.w_mem_marginal
  have hqFilter := Finset.mem_filter.mp hqMarginal.1
  have hwFilter := Finset.mem_filter.mp hwMarginal.1
  exact false_of_existsSurplusPairCriticalBlocker S
    F.pair.q_mem_A F.pair.w_mem_A F.pair.q_ne_w
    hqMarginal.2 hwMarginal.2
    (by simpa only [dist_comm] using hqFilter.2.trans hwFilter.2.symm) P

/-- Kernel-pinned scope guard: all-center four-rows, no proper selected-row
closed set, the late first-apex blocker assignment for both retained sources,
and the second-apex double-deletion row coexist in the exact incidence
abstraction while every strict surplus-cap row avoids a two-point hit in the
first-apex marginal.  This does not assert Euclidean realizability. -/
theorem exactFour_connectivity_lateFiber_scopeGuard :
    UniqueFourIncidenceBoundary ∧
      (∀ center : ATailUniqueFourDirectFalseScratch.Label,
        (globalRowFour center).card = 4) ∧
      (∀ U : Finset ATailUniqueFourDirectFalseScratch.Label,
        U.Nonempty → RowClosed U → U = Finset.univ) ∧
      blocker retainedQ = firstApex ∧
      blocker retainedW = firstApex ∧
      (globalRowFour secondApex \ {retainedQ, retainedW}).card = 4 ∧
      ¬ ∃ i : CapIndex, i ∈ strictCenters ∧
        2 ≤ (rowFour i ∩ marginalFour).card := by
  let B := uniqueFour_incidence_boundary_checked
  exact ⟨B, B.twoEndpointSurface.global_row_card_four,
    B.no_proper_rowClosed, B.q_blocker_eq_firstApex,
    B.w_blocker_eq_firstApex, B.pair_deletion_preserves_secondRow,
    B.no_strict_marginal_pair⟩

#print axioms nonapex_surplusCenter_firstApexOffCap_inter_card_le_one
#print axioms false_of_existsSurplusFirstApexClassPairCenter
#print axioms existsSurplusFirstApexClassPairCenter_of_criticalBlocker
#print axioms not_existsSurplusPairCriticalBlocker_of_originalUniqueFourResidual
#print axioms exactFour_connectivity_lateFiber_scopeGuard

end ATailUniqueFourSurplusPairProducerScratch
end Problem97
