/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReciprocalSwapReduction
import DoubleSurvivorConsumer

/-!
# Swapped FA-UNIQ4 interface audit

This file separates the packet-polymorphic first-apex card-four branch from
the full parent telescope used by the live A-tail leaf.

The reciprocal swap really produces every local field of the source-current
`FA-UNIQ4` branch, including both single-deletion blockers and the retained
second-apex double survival.  Reusing a future full-parent eliminator still
requires either a theorem quantified over an arbitrary surplus packet or an
explicit rebase of the live parent geometry to the swapped packet.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRSwapFAUniq4InterfaceAuditScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRReciprocalSwapReductionScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

private theorem pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem pair_w_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr
    ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

private theorem single_deletion_blocked_of_unique_card_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {x : ℝ²}
    (hx : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hunique : ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card →
      tau = radius) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1 := by
  rintro ⟨tau, htau, hfour⟩
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase x) S.oppApex1 tau).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card := by
    rw [selectedClass_erase_eq] at hfourErase
    exact hfourErase.trans
      (Finset.card_le_card (Finset.erase_subset _ _))
  have htauEq : tau = radius := hunique tau htau hfourAmbient
  subst tau
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hx, hcard] at hfourErase
  omega

/-- Exact packet-polymorphic branch fields supplied by the swapped frontier.

This matches the card-four arm of
`firstApex_trichotomy_with_secondApex_double_survival`; no full-parent
geometry is used in this structure. -/
structure PacketGenericFAUniq4Fields
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type where
  radius : ℝ
  radius_pos : 0 < radius
  frontier : CriticalPairFrontier D S radius H
  firstClass_card_eq_four :
    (SelectedClass D.A S.oppApex1 radius).card = 4
  firstClass_unique_radius :
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card →
      tau = radius
  q_single_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase frontier.pair.q) S.oppApex1
  w_single_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase frontier.pair.w) S.oppApex1
  firstApex_double_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase frontier.pair.q).erase frontier.pair.w) S.oppApex1
  secondApex_double_deletion_survives :
    HasNEquidistantPointsAt 4
      ((D.A.erase frontier.pair.q).erase frontier.pair.w) S.oppApex2

/-- The swapped reciprocal frontier has every honest local field of the
source-current `FA-UNIQ4` branch. -/
def packetGenericFAUniq4Fields_of_swapped
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    PacketGenericFAUniq4Fields D X.packet H where
  radius := X.radius
  radius_pos := X.radius_pos
  frontier := X.frontier
  firstClass_card_eq_four := X.firstClass_card_eq_four
  firstClass_unique_radius := X.firstClass_unique_radius
  q_single_deletion_blocked :=
    single_deletion_blocked_of_unique_card_four
      (pair_q_mem_firstClass X.frontier)
      X.firstClass_card_eq_four X.firstClass_unique_radius
  w_single_deletion_blocked :=
    single_deletion_blocked_of_unique_card_four
      (pair_w_mem_firstClass X.frontier)
      X.firstClass_card_eq_four X.firstClass_unique_radius
  firstApex_double_deletion_blocked := X.firstApexDouble_blocked
  secondApex_double_deletion_survives := X.frontier.secondApexDouble

/-- The fresh frontier can be classified in the exact right arm of the
production `FirstApexSplit`; this does not assert a full-parent contradiction. -/
theorem firstApexSplit_uniqueFour_of_swapped
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    FirstApexSplit X.frontier.pair :=
  Or.inr
    ⟨Or.inl X.firstClass_card_eq_four, X.firstClass_unique_radius⟩

/-- Physical reading in the original packet orientation.

The fresh pair is co-radial at the old second apex, both single deletions and
the double deletion block K4 there, while the double deletion preserves K4
at the old first apex. -/
theorem physical_branch_fields_of_swapped
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    X.frontier.pair.q ∈ D.A ∧
      X.frontier.pair.w ∈ D.A ∧
      X.frontier.pair.q ≠ X.frontier.pair.w ∧
      X.frontier.pair.q ∉ S.surplusCap ∧
      X.frontier.pair.w ∉ S.surplusCap ∧
      dist X.frontier.pair.q S.oppApex2 = X.radius ∧
      dist X.frontier.pair.w S.oppApex2 = X.radius ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase X.frontier.pair.q) S.oppApex2 ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase X.frontier.pair.w) S.oppApex2 ∧
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase X.frontier.pair.q).erase X.frontier.pair.w)
          S.oppApex2 ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase X.frontier.pair.q).erase X.frontier.pair.w)
          S.oppApex1 := by
  let L := packetGenericFAUniq4Fields_of_swapped X
  have hqOffNew : X.frontier.pair.q ∉ X.packet.surplusCap :=
    (Finset.mem_sdiff.mp X.frontier.pair.q_mem_marginal).2
  have hwOffNew : X.frontier.pair.w ∉ X.packet.surplusCap :=
    (Finset.mem_sdiff.mp X.frontier.pair.w_mem_marginal).2
  have hqRadiusNew :
      dist X.frontier.pair.q X.packet.oppApex1 = X.radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp X.frontier.pair.q_mem_marginal).1).2
  have hwRadiusNew :
      dist X.frontier.pair.w X.packet.oppApex1 = X.radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp X.frontier.pair.w_mem_marginal).1).2
  exact
    ⟨X.frontier.pair.q_mem_A,
      X.frontier.pair.w_mem_A,
      X.frontier.pair.q_ne_w,
      by simpa only [X.surplusCap_eq] using hqOffNew,
      by simpa only [X.surplusCap_eq] using hwOffNew,
      by simpa only [X.firstApex_eq] using hqRadiusNew,
      by simpa only [X.firstApex_eq] using hwRadiusNew,
      by simpa only [X.firstApex_eq] using L.q_single_deletion_blocked,
      by simpa only [X.firstApex_eq] using L.w_single_deletion_blocked,
      by simpa only [X.firstApex_eq] using
        L.firstApex_double_deletion_blocked,
      by simpa only [X.secondApex_eq] using
        L.secondApex_double_deletion_survives⟩

private lemma mem_moserVerts_cases
    {A : Finset ℝ²} {M : MoserTriangle A} {x : ℝ²}
    (hx : x ∈ M.verts) :
    x = M.v1 ∨ x = M.v2 ∨ x = M.v3 := by
  simpa [MoserTriangle.verts] using hx

private theorem surplusApex_mem_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.surplusApex, hi] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.surplusApex, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.surplusApex, hi] using S.partition.v3_mem_C1

private theorem surplusApex_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] using S.partition.v3_mem_C2

private theorem oppCap1_inter_oppCap2_subset_surplusApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppCap1 ∩ S.oppCap2 ⊆
      ({S.surplusApex} : Finset ℝ²) := by
  intro x hx
  have hx1 : x ∈ S.oppCap1 := (Finset.mem_inter.mp hx).1
  have hx2 : x ∈ S.oppCap2 := (Finset.mem_inter.mp hx).2
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ S.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · simp
      · exact False.elim (S.partition.v2_notin_C2 hx1)
      · exact False.elim (S.partition.v3_notin_C3 hx2)
    · have hxA : x ∈ A := S.partition.C2_subset hx1
      have hone := S.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC1 : x ∈ S.partition.C1
      · simp [hxC1, hx1, hx2] at hone
      · simp [hxC1, hx1, hx2] at hone
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ S.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (S.partition.v1_notin_C1 hx2)
      · simp
      · exact False.elim (S.partition.v3_notin_C3 hx1)
    · have hxA : x ∈ A := S.partition.C3_subset hx1
      have hone := S.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC2 : x ∈ S.partition.C2
      · simp [hx1, hx2, hxC2] at hone
      · simp [hx1, hx2, hxC2] at hone
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ S.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (S.partition.v1_notin_C1 hx1)
      · exact False.elim (S.partition.v2_notin_C2 hx2)
      · simp
    · have hxA : x ∈ A := S.partition.C1_subset hx1
      have hone := S.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC3 : x ∈ S.partition.C3
      · simp [hx1, hx2, hxC3] at hone
      · simp [hx1, hx2, hxC3] at hone

/-- The cap equalities stored by the swapped frontier also determine the
physical surplus Moser apex. -/
theorem swapped_surplusApex_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    X.packet.surplusApex = S.surplusApex := by
  have hmemOpp1 : S.surplusApex ∈ X.packet.oppCap1 := by
    rw [X.firstCap_eq]
    exact surplusApex_mem_oppCap2 S
  have hmemOpp2 : S.surplusApex ∈ X.packet.oppCap2 := by
    rw [X.secondCap_eq]
    exact surplusApex_mem_oppCap1 S
  have hmemInter :
      S.surplusApex ∈ X.packet.oppCap1 ∩ X.packet.oppCap2 :=
    Finset.mem_inter.mpr ⟨hmemOpp1, hmemOpp2⟩
  have hsingleton :=
    oppCap1_inter_oppCap2_subset_surplusApex X.packet hmemInter
  exact (Finset.mem_singleton.mp hsingleton).symm

private theorem triangle_verts_eq_physical_apices
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.triangle.verts =
      ({S.surplusApex, S.oppApex1, S.oppApex2} : Finset ℝ²) := by
  ext x
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [MoserTriangle.verts, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi,
      or_comm, or_left_comm]

/-- The swapped packet has the same physical Moser-vertex set. -/
theorem swapped_triangle_verts_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    X.packet.triangle.verts = S.triangle.verts := by
  rw [triangle_verts_eq_physical_apices X.packet,
    triangle_verts_eq_physical_apices S, swapped_surplusApex_eq X,
    X.firstApex_eq, X.secondApex_eq]
  ext x
  simp [or_comm, or_left_comm]

private theorem capAt_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.partition.capAt S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [CapTriple.capAt, SurplusCapPacket.surplusCap, hi]

private theorem oppositePairExactAt_surplusIdx_iff_isM44
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.partition.OppositePairExactAt S.surplusIdx ↔ S.IsM44 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [CapTriple.OppositePairExactAt, SurplusCapPacket.IsM44,
      SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hi,
      and_comm]

/-- Every surplus packet is the `leafSurplusPacket` built from its own
embedded MEC witness, circumscribed proof, cap triple, and surplus index.
Thus the swap does not leave the class of leaf packets; it changes which
embedded parent data must be used. -/
theorem leafSurplusPacket_of_embedded_data_eq
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    leafSurplusPacket
      (D := D)
      S.triangleNonObtuse S.hCirc S.partition S.surplusIdx
      rfl (by
        rw [capAt_surplusIdx_eq_surplusCap]
        exact S.surplus_card_gt_four) = S := by
  cases S
  rfl

/-- Packet-specific part of the full live parent telescope after rebasing to
the swapped packet's own embedded MEC witness and cap triple. -/
structure RebasedSwappedLeafGeometry
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (q : ℝ²) : Prop where
  q_mem_surplus_capAt :
    q ∈ S.partition.capAt S.surplusIdx
  surplus_capAt_card_gt_four :
    4 < (S.partition.capAt S.surplusIdx).card
  q_not_moser : q ∉ S.triangle.verts
  opposite_pair_not_exact :
    ¬ S.partition.OppositePairExactAt S.surplusIdx
  second_large_cap :
    ∃ j : Fin 3, j ≠ S.surplusIdx ∧
      5 ≤ (S.partition.capAt j).card

/-- The packet-specific live parent fields rebase to the swapped packet.

Carrier-only hypotheses (`hcard`, `hnoRem`, live rows, fixed triples, and the
critical-shell system) need no transport.  This theorem handles the fields
that actually mention the packet's MEC/cap orientation. -/
theorem rebase_leaf_geometry_of_swapped
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H)
    {q : ℝ²}
    (hqSurplus : q ∈ S.surplusCap)
    (hqNonMoser : q ∉ S.triangle.verts)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44) :
    RebasedSwappedLeafGeometry D X.packet q := by
  have hqSurplusNew : q ∈ X.packet.surplusCap := by
    simpa only [X.surplusCap_eq] using hqSurplus
  have hqCapAt : q ∈ X.packet.partition.capAt X.packet.surplusIdx := by
    rw [capAt_surplusIdx_eq_surplusCap]
    exact hqSurplusNew
  have hsurplus :
      4 < (X.packet.partition.capAt X.packet.surplusIdx).card := by
    rw [capAt_surplusIdx_eq_surplusCap]
    exact X.packet.surplus_card_gt_four
  have hqNonMoserNew : q ∉ X.packet.triangle.verts := by
    rw [swapped_triangle_verts_eq X]
    exact hqNonMoser
  have hnotExact :
      ¬ X.packet.partition.OppositePairExactAt X.packet.surplusIdx := by
    rw [oppositePairExactAt_surplusIdx_iff_isM44]
    exact fun hM44 => hNoM44 ⟨X.packet, hM44⟩
  have hsecond :
      ∃ j : Fin 3, j ≠ X.packet.surplusIdx ∧
        5 ≤ (X.packet.partition.capAt j).card := by
    exact exists_secondLargeCap_of_noM44
      X.packet.triangleNonObtuse X.packet.hCirc X.packet.partition
      rfl hsurplus hNoM44
  exact ⟨hqCapAt, hsurplus, hqNonMoserNew, hnotExact, hsecond⟩

/-- Exact source-current specialization: the packet-specific part of the
full live parent telescope can be rebased from the original CP-built leaf to
the swapped frontier's packet. -/
theorem rebase_leaf_geometry_of_swapped_from_live_parent
    {D : CounterexampleData} {q : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D
      (leafSurplusPacket
        (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
        (hM := hM) (hsurplus := hsurplus)) H) :
    RebasedSwappedLeafGeometry D X.packet q := by
  subst M
  have hqSurplus :
      q ∈
        (leafSurplusPacket
          (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
          (hM := rfl) (hsurplus := hsurplus)).surplusCap := by
    simpa [leafSurplusPacket, SurplusCapPacket.surplusCap,
      CapTriple.capAt] using hqCap
  have hqNonMoserLeaf :
      q ∉
        (leafSurplusPacket
          (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
          (hM := rfl) (hsurplus := hsurplus)).triangle.verts := by
    simpa [leafSurplusPacket, SurplusCapPacket.triangle] using hqNonMoser
  exact rebase_leaf_geometry_of_swapped X
    hqSurplus hqNonMoserLeaf hNoM44

#print axioms packetGenericFAUniq4Fields_of_swapped
#print axioms firstApexSplit_uniqueFour_of_swapped
#print axioms physical_branch_fields_of_swapped
#print axioms swapped_surplusApex_eq
#print axioms swapped_triangle_verts_eq
#print axioms leafSurplusPacket_of_embedded_data_eq
#print axioms rebase_leaf_geometry_of_swapped
#print axioms rebase_leaf_geometry_of_swapped_from_live_parent

end ATailRSwapFAUniq4InterfaceAuditScratch
end Problem97
