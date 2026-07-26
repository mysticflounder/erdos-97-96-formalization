/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair

/-!
# Global deletion split at the retained frontier pair

The retained frontier pair is the first source-faithful object after the
frontier extraction.  Global minimality therefore gives a minimal deletion
core contained in that pair.  The output is deliberately a progress surface:
the singleton and full-pair cases have different downstream consumers, so no
unjustified collapse to a common-deletion packet is made here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierPairGlobalDeletionSplit

open ATailCriticalPairFrontier
open ATAILStageOneMinimalDeletionCore
open ATAILStageOnePrescribedApexDichotomy
open ATailGlobalMinimalDeletion
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

/- The retained frontier pair admits a source-faithful minimal-deletion
   reduction.  The two possible cardinalities are kept explicit because the
   singleton arm and the pair arm require different downstream consumers. -/
theorem frontierPair_globalDeletion_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    ∃ center ∈ D.A \ ({F.pair.q, F.pair.w} : Finset ℝ²),
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ({F.pair.q, F.pair.w} : Finset ℝ²) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        (∀ s ∈ V,
          HasNEquidistantPointsAt
            4 (D.A \ (V.erase s)) center) ∧
        (V.card = 1 ∨
          (V.card = 2 ∧ V = ({F.pair.q, F.pair.w} : Finset ℝ²))) := by
  let U : Finset ℝ² := {F.pair.q, F.pair.w}
  have hUsub : U ⊆ D.A := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact F.pair.q_mem_A
    · have hxw : x = F.pair.w := Finset.mem_singleton.mp hx
      subst x
      exact F.pair.w_mem_A
  have hUne : U.Nonempty := ⟨F.pair.q, by simp [U]⟩
  have hUle : U.card ≤ 2 := by
    dsimp [U]
    calc
      ({F.pair.q, F.pair.w} : Finset ℝ²).card ≤
          ({F.pair.w} : Finset ℝ²).card + 1 :=
        Finset.card_insert_le F.pair.q {F.pair.w}
      _ = 2 := by simp
  have hremainingCard : 0 < (D.A \ U).card := by
    have hsplit := Finset.card_sdiff_add_card_inter D.A U
    have hinterLe : (D.A ∩ U).card ≤ 2 := by
      calc
        (D.A ∩ U).card ≤ U.card :=
          Finset.card_le_card Finset.inter_subset_right
        _ ≤ 2 := hUle
    have hAcard : 13 < D.A.card := by
      have hfourteen := L.carrier_card_ge_fourteen
      omega
    omega
  rcases exists_global_cardMinimal_blocking_subdeletion
      R.minimal (by simpa [U] using hUsub) hUne
      (by simpa [U] using Finset.card_pos.mp hremainingCard) with
    ⟨center, hcenterRemaining, V, hVne, hVsub,
      hVblocked, hVminimal⟩
  have hVle : V.card ≤ 2 :=
    le_trans (Finset.card_le_card hVsub) hUle
  have hVcard : V.card = 1 ∨ V.card = 2 := by
    have hVpos : 0 < V.card := Finset.card_pos.mpr hVne
    omega
  refine ⟨center, ?_, V, hVne, ?_, hVblocked, hVminimal, ?_⟩
  · simpa [U] using hcenterRemaining
  · simpa [U] using hVsub
  · rcases hVcard with hVone | hVtwo
    · exact Or.inl hVone
    · right
      refine ⟨hVtwo, ?_⟩
      have hUcard : U.card = 2 := by
        simp [U, F.pair.q_ne_w]
      have hVeq : V = U :=
        Finset.eq_of_subset_of_card_le hVsub (by omega)
      simpa [U] using hVeq

private theorem firstApex_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

private theorem firstApex_survives_q_deletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S r H}
    (R : FrontierCommonDeletionParentResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex1 := by
  rcases R.common.firstApexDouble with ⟨radius, hradius, hfour⟩
  refine ⟨radius, hradius, le_trans hfour (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzErase, hzdist⟩
  exact Finset.mem_filter.mpr ⟨(Finset.mem_erase.mp hzErase).2, hzdist⟩

/-- In a full `{q,w}` global minimal-deletion core, cross membership at `q`
excludes co-radiality of the two frontier sources about the fresh center. -/
theorem full_frontierPair_core_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {center : ℝ²} (hcenter : center ∈ D.A \ ({F.pair.q, F.pair.w} : Finset ℝ²))
    {V : Finset ℝ²}
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hminimal : ∀ s ∈ V, HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center)
    (hVeq : V = ({F.pair.q, F.pair.w} : Finset ℝ²))
    (hcross : F.pair.w ∈
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support) :
    dist center F.pair.q ≠ dist center F.pair.w := by
  intro hcenterEq
  have hcenterA : center ∈ D.A := (Finset.mem_sdiff.mp hcenter).1
  have hqFirst :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex1 :=
    firstApex_survives_q_deletion R
  have hblocker_ne_first :
      H.centerAt F.pair.q F.pair.q_mem_A ≠ S.oppApex1 :=
    actual_blocker_ne_of_deletion_survives H F.pair.q_mem_A hqFirst
  have hcenter_ne_first : center ≠ S.oppApex1 := by
    intro hEq
    subst center
    apply hblocked
    have hVfull : D.A \ V = (D.A.erase F.pair.q).erase F.pair.w := by
      ext x
      simp [hVeq, and_comm, and_left_comm, and_assoc]
    rw [hVfull]
    exact R.common.firstApexDouble
  have hsurvives_w :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) center := by
    have hqV : F.pair.q ∈ V := by simp [hVeq]
    have hVeraseq : V.erase F.pair.q = {F.pair.w} := by
      rw [hVeq]
      simp [F.pair.q_ne_w]
    simpa [hVeraseq, Finset.sdiff_singleton_eq_erase] using
      hminimal F.pair.q hqV
  have hcenter_ne_blocker :
      center ≠ H.centerAt F.pair.q F.pair.q_mem_A := by
    intro hEq
    subst center
    have hnot :=
      (cross_deletion_survives_iff_not_mem_selected_support H F.pair.q_mem_A).mp
        hsurvives_w
    exact hnot hcross
  have hfirstA : S.oppApex1 ∈ D.A := firstApex_mem_A S
  have hblockerA : H.centerAt F.pair.q F.pair.q_mem_A ∈ D.A :=
    blocker_mem_A H F.pair.q_mem_A
  have hfirstEq : dist S.oppApex1 F.pair.q = dist S.oppApex1 F.pair.w :=
    firstApex_dist_eq F.pair
  have hblockerEq :
      dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.q =
        dist (H.centerAt F.pair.q F.pair.q_mem_A) F.pair.w :=
    sourceBlocker_dist_eq_of_crossMembership F.pair hcross
  have hfirstFilter :
      S.oppApex1 ∈ D.A.filter
        (fun apex ↦ dist apex F.pair.q = dist apex F.pair.w) :=
    Finset.mem_filter.mpr ⟨hfirstA, hfirstEq⟩
  have hblockerFilter :
      H.centerAt F.pair.q F.pair.q_mem_A ∈ D.A.filter
        (fun apex ↦ dist apex F.pair.q = dist apex F.pair.w) :=
    Finset.mem_filter.mpr ⟨hblockerA, hblockerEq⟩
  have hcenterFilter :
      center ∈ D.A.filter
        (fun apex ↦ dist apex F.pair.q = dist apex F.pair.w) :=
    Finset.mem_filter.mpr ⟨hcenterA, hcenterEq⟩
  have hthree :
      2 < (D.A.filter
        (fun apex ↦ dist apex F.pair.q = dist apex F.pair.w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨S.oppApex1, hfirstFilter,
      H.centerAt F.pair.q F.pair.q_mem_A, hblockerFilter,
      center, hcenterFilter,
      hblocker_ne_first.symm, hcenter_ne_first.symm, hcenter_ne_blocker.symm⟩
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    F.pair.q_mem_A F.pair.w_mem_A F.pair.q_ne_w
  omega

/-- The full-pair global-deletion branch has no shared-radius subcase on the
directed cross-membership arm.  Its remaining content is a genuine
minimal-deletion core with two distinct source radii at the fresh center. -/
theorem nonempty_minimalDeletionCore_of_full_frontierPair_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {center : ℝ²} (hcenter : center ∈ D.A \ ({F.pair.q, F.pair.w} : Finset ℝ²))
    {V : Finset ℝ²}
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hminimal : ∀ s ∈ V, HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center)
    (hVeq : V = ({F.pair.q, F.pair.w} : Finset ℝ²))
    (hcross : F.pair.w ∈
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support) :
    Nonempty (MinimalDeletionCore D.A V center) := by
  have hdist := full_frontierPair_core_dist_ne (R := R)
    hcenter hblocked hminimal hVeq hcross
  have hVsub : V ⊆ D.A := by
    intro x hx
    have hxPair : x = F.pair.q ∨ x = F.pair.w := by
      simpa [hVeq] using hx
    rcases hxPair with rfl | rfl
    · exact F.pair.q_mem_A
    · exact F.pair.w_mem_A
  apply exists_minimalDeletionCore hVsub (Finset.mem_sdiff.mp hcenter).1
    (by
      intro s hs t ht hst
      have hsPair : s = F.pair.q ∨ s = F.pair.w := by
        simpa [hVeq] using hs
      have htPair : t = F.pair.q ∨ t = F.pair.w := by
        simpa [hVeq] using ht
      rcases hsPair with rfl | rfl <;> rcases htPair with rfl | rfl
      · exact False.elim (hst rfl)
      · exact hdist
      · intro h
        exact hdist h.symm
      · exact False.elim (hst rfl))
    hblocked hminimal

end ATailFrontierPairGlobalDeletionSplit
end Problem97
