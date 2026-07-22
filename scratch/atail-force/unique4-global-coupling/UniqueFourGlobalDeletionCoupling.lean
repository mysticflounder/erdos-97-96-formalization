/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch
import Erdos9796Proof.P97.ATail.MinimalDeletionCore
import Erdos9796Proof.P97.ATail.DeletionRobustness
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Global deletion coupling for the original exact-four arm

This module is deliberately not another local row adapter.  It combines the
complete exact first-apex class with global cardinal minimality, all-center
K4, and the physical cap partition.

Delete the exact four-class together with all three Moser vertices.  The
carrier-cardinality hypothesis leaves a point behind, while minimality forces
some remaining point to lose K4.  A cardinality-minimal blocking subset then
gives either a genuine equal-radius collision or pairwise-disjoint exact
critical shells.  Because all Moser vertices were deleted, the new center is
in a strict physical cap; a non-singleton shell core therefore obeys the
cap-complement packing inequality.

The theorem below is a source-faithful global reduction.  It does not claim
that any of its three outputs is presently terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourGlobalCouplingScratch

open ATAILStageOneMinimalDeletionCore
open ATailDeletionRobustness
open ATailUniqueArmRouteAuditScratch
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem not_global_K4_of_nonempty_proper_subset
    {D : CounterexampleData} (hmin : D.Minimal)
    {B : Finset ℝ²}
    (hBne : B.Nonempty) (hBA : B ⊆ D.A) (hBproper : B ≠ D.A) :
    ¬ HasNEquidistantProperty 4 B := by
  intro hBK4
  have hBconvex : ConvexIndep B := ConvexIndep.mono hBA D.convex
  have hcard : D.A.card ≤ B.card := hmin B hBne hBconvex hBK4
  exact hBproper (Finset.eq_of_subset_of_card_le hBA hcard)

private theorem exists_local_blocker_of_not_global_K4
    {B : Finset ℝ²} (hnot : ¬ HasNEquidistantProperty 4 B) :
    ∃ center ∈ B, ¬ HasNEquidistantPointsAt 4 B center := by
  classical
  by_contra hnone
  apply hnot
  intro center hcenter
  by_contra hblocked
  exact hnone ⟨center, hcenter, hblocked⟩

private theorem exists_cardMinimal_blocking_subdeletion
    {A U : Finset ℝ²} {center : ℝ²}
    (hfull : HasNEquidistantPointsAt 4 A center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ U) center) :
    ∃ V : Finset ℝ²,
      V.Nonempty ∧ V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (A \ V) center ∧
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4 (A \ (V.erase s)) center := by
  classical
  let candidates : Finset (Finset ℝ²) :=
    U.powerset.filter fun V ↦
      ¬ HasNEquidistantPointsAt 4 (A \ V) center
  have hUcand : U ∈ candidates := by
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_powerset.mpr (fun _ hx ↦ hx), hblocked⟩
  have hcandidates : candidates.Nonempty := ⟨U, hUcand⟩
  rcases Finset.exists_min_image candidates Finset.card hcandidates with
    ⟨V, hVcand, hVmin⟩
  rcases Finset.mem_filter.mp hVcand with ⟨hVpowerset, hVblocked⟩
  have hVsub : V ⊆ U := Finset.mem_powerset.mp hVpowerset
  have hVne : V.Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hVempty
    apply hVblocked
    simpa [hVempty] using hfull
  refine ⟨V, hVne, hVsub, hVblocked, ?_⟩
  intro s hsV
  by_contra hrestoreBlocked
  have hEraseCand : V.erase s ∈ candidates := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_powerset.mpr ?_, hrestoreBlocked⟩
    exact (Finset.erase_subset s V).trans hVsub
  have hle : V.card ≤ (V.erase s).card := hVmin (V.erase s) hEraseCand
  exact (not_lt_of_ge hle) (Finset.card_erase_lt_of_mem hsV)

private theorem exists_fresh_collision_or_minimalDeletionCore_of_card_lt
    {D : CounterexampleData} (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A) (hUne : U.Nonempty)
    (hcard : U.card < D.A.card) :
    ∃ center ∈ D.A \ U, ∃ V : Finset ℝ²,
      V.Nonempty ∧ V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      (∀ s ∈ V,
        HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center) ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  have hremaining : (D.A \ U).Nonempty := by
    have hsplit := Finset.card_sdiff_add_card_inter D.A U
    have hinter : D.A ∩ U = U := Finset.inter_eq_right.mpr hUsub
    rw [hinter] at hsplit
    apply Finset.card_pos.mp
    omega
  have hproper : D.A \ U ≠ D.A := by
    rcases hUne with ⟨u, huU⟩
    intro heq
    have huRemaining : u ∈ D.A \ U := by
      rw [heq]
      exact hUsub huU
    exact (Finset.mem_sdiff.mp huRemaining).2 huU
  have hnotGlobal : ¬ HasNEquidistantProperty 4 (D.A \ U) :=
    not_global_K4_of_nonempty_proper_subset hmin hremaining
      Finset.sdiff_subset hproper
  rcases exists_local_blocker_of_not_global_K4 hnotGlobal with
    ⟨center, hcenterRemaining, hcenterBlocked⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterRemaining).1
  rcases exists_cardMinimal_blocking_subdeletion
      (D.K4 center hcenterA) hcenterBlocked with
    ⟨V, hVne, hVsub, hVblocked, hVminimal⟩
  refine ⟨center, hcenterRemaining, V, hVne, hVsub, hVblocked,
    hVminimal, ?_⟩
  by_cases hcollision :
      ∃ s ∈ V, ∃ t ∈ V,
        s ≠ t ∧ dist center s = dist center t
  · exact Or.inl hcollision
  · apply Or.inr
    apply exists_minimalDeletionCore
      (A := D.A) (U := V) (center := center)
      (hVsub.trans hUsub) hcenterA
    · intro s hsV t htV hst hdist
      exact hcollision ⟨s, hsV, t, htV, hst, hdist⟩
    · exact hVblocked
    · exact hVminimal

private theorem sdiff_erase_restored_member_eq_sdiff
    {X : Type*} [DecidableEq X]
    (A V : Finset X) {source : X} (hsourceV : source ∈ V) :
    (A \ (V.erase source)).erase source = A \ V := by
  ext x
  by_cases hxs : x = source
  · subst x
    simp [hsourceV]
  · simp [hxs]

/-- A repeated radius inside a cardinal-minimal blocking deletion set creates
a five-point ambient radius class at the new blocker center. -/
theorem five_le_selectedClass_of_minimalDeletion_collision
    {A V : Finset ℝ²} {center source partner : ℝ²}
    (hVsub : V ⊆ A)
    (hsourceV : source ∈ V) (hpartnerV : partner ∈ V)
    (hsourcePartner : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hsurvives :
      HasNEquidistantPointsAt 4 (A \ (V.erase source)) center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ V) center) :
    5 ≤ (SelectedClass A center (dist center source)).card := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨radius, hradius, hfour⟩
  have hsourceClass :
      source ∈ SelectedClass (A \ (V.erase source)) center radius := by
    by_contra hsourceNot
    apply hblocked
    rw [← sdiff_erase_restored_member_eq_sdiff A V hsourceV]
    refine ⟨radius, hradius, ?_⟩
    have hsameCard :
        (SelectedClass ((A \ (V.erase source)).erase source)
          center radius).card =
          (SelectedClass (A \ (V.erase source)) center radius).card :=
      selectedClass_erase_card_eq_of_not_mem hsourceNot
    change
      4 ≤ (SelectedClass ((A \ (V.erase source)).erase source)
        center radius).card
    rw [hsameCard]
    exact hfour
  have hsourceDist : dist center source = radius :=
    (mem_selectedClass.mp hsourceClass).2
  have hpartnerNotClass :
      partner ∉ SelectedClass (A \ (V.erase source)) center radius := by
    intro hpartnerClass
    have hpartnerRestored := (mem_selectedClass.mp hpartnerClass).1
    exact (Finset.mem_sdiff.mp hpartnerRestored).2
      (Finset.mem_erase.mpr ⟨hsourcePartner.symm, hpartnerV⟩)
  have hinsert :
      insert partner (SelectedClass (A \ (V.erase source)) center radius) ⊆
        SelectedClass A center (dist center source) := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzClass
    · exact mem_selectedClass.mpr
        ⟨hVsub hpartnerV, hcenterEq.symm⟩
    · rcases mem_selectedClass.mp hzClass with ⟨hzRestored, hzDist⟩
      exact mem_selectedClass.mpr
        ⟨(Finset.mem_sdiff.mp hzRestored).1,
          hzDist.trans hsourceDist.symm⟩
  have hcard := Finset.card_le_card hinsert
  rw [Finset.card_insert_of_notMem hpartnerNotClass] at hcard
  omega

private theorem fullyDeletionRobustAt_of_nontrivial_minimalDeletionCore
    {D : CounterexampleData} {V : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A V center) (hVtwo : 2 ≤ V.card) :
    FullyDeletionRobustAt D center := by
  have hone : 1 < V.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hsV, t, htV, hst⟩
  let s' : {x : ℝ² // x ∈ V} := ⟨s, hsV⟩
  let t' : {x : ℝ² // x ∈ V} := ⟨t, htV⟩
  let Ks : SelectedFourClass D.A center :=
    (K.shellAt s').toSelectedFourClass
  let Kt : SelectedFourClass D.A center :=
    (K.shellAt t').toSelectedFourClass
  have hst' : s' ≠ t' := by
    intro h
    exact hst (congrArg Subtype.val h)
  exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    Ks Kt (by
      simpa [Ks, Kt] using K.supports_pairwise_disjoint s' t' hst')

theorem minimalDeletionCore_two_mul_card_le_cap_complement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A U center)
    (k : Fin 3) (hcenter : center ∈ S.capByIndex k) :
    2 * U.card ≤ (D.A \ S.capByIndex k).card := by
  classical
  let hits : {x : ℝ² // x ∈ U} → Finset ℝ² := fun s ↦
    (K.shellAt s).toCriticalFourShell.support \ S.capByIndex k
  have hhitsTwo (s : {x : ℝ² // x ∈ U}) : 2 ≤ (hits s).card := by
    have hinter :
        ((K.shellAt s).toCriticalFourShell.support ∩
          S.capByIndex k).card ≤ 2 := by
      let Krow : SelectedFourClass D.A center :=
        (K.shellAt s).toSelectedFourClass
      have h :=
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex k Krow hcenter
      simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass] using h
    have hsplit := Finset.card_inter_add_card_sdiff
      (K.shellAt s).toCriticalFourShell.support (S.capByIndex k)
    have hfour := (K.shellAt s).toCriticalFourShell.support_card
    change 2 ≤
      ((K.shellAt s).toCriticalFourShell.support \ S.capByIndex k).card
    omega
  have hdisjoint :
      ((Finset.univ : Finset {x : ℝ² // x ∈ U}) :
        Set {x : ℝ² // x ∈ U}).PairwiseDisjoint hits := by
    rintro s _hs t _ht hst
    change Disjoint
      ((K.shellAt s).toCriticalFourShell.support \ S.capByIndex k)
      ((K.shellAt t).toCriticalFourShell.support \ S.capByIndex k)
    have hsupport := K.supports_pairwise_disjoint s t hst
    rw [Finset.disjoint_left] at hsupport ⊢
    intro x hxs hxt
    exact hsupport (Finset.mem_sdiff.mp hxs).1
      (Finset.mem_sdiff.mp hxt).1
  have hallSubset :
      (Finset.univ.biUnion hits) ⊆ D.A \ S.capByIndex k := by
    intro x hx
    rcases Finset.mem_biUnion.mp hx with ⟨s, _hs, hxs⟩
    rcases Finset.mem_sdiff.mp hxs with ⟨hxsSupport, hxsOff⟩
    exact Finset.mem_sdiff.mpr
      ⟨(K.shellAt s).toCriticalFourShell.support_subset_A hxsSupport,
        hxsOff⟩
  have hlower :
      2 * U.card ≤ ∑ s : {x : ℝ² // x ∈ U}, (hits s).card := by
    calc
      2 * U.card = ∑ _s : {x : ℝ² // x ∈ U}, 2 := by
        simp [Nat.mul_comm]
      _ ≤ ∑ s : {x : ℝ² // x ∈ U}, (hits s).card :=
        Finset.sum_le_sum fun s _hs ↦ hhitsTwo s
  calc
    2 * U.card ≤ ∑ s : {x : ℝ² // x ∈ U}, (hits s).card := hlower
    _ = (Finset.univ.biUnion hits).card := by
      rw [Finset.card_biUnion hdisjoint]
    _ ≤ (D.A \ S.capByIndex k).card := Finset.card_le_card hallSubset

/-- The exact first-apex class together with all three physical Moser
vertices.  Deleting this set prevents the trivial minimality witness at a
Moser vertex and forces the returned blocker center into a strict cap. -/
noncomputable def protectedDeletionSet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : OriginalUniqueFourResidual F) : Finset ℝ² :=
  SelectedClass D.A S.oppApex1 radius ∪ S.triangle.verts

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

private theorem rightAdjacentCapByIndex_oppIndex1_eq_capByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex1 =
      S.capByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1, hi]

/-- A first-apex radius class meets either adjacent closed cap in at most one
point.  This is the endpoint one-hit bound stated in the physical cap-index
normal form used by the collision classification below. -/
theorem firstApex_selectedClass_inter_otherCap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (k : Fin 3) (hk : k ≠ S.oppIndex1) (radius : ℝ) :
    (SelectedClass D.A S.oppApex1 radius ∩ S.capByIndex k).card ≤ 1 := by
  have happ := oppApex1_eq_oppositeVertex_oppIndex1 S
  rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 k with
    hkSurplus | hkFirst | hkSecond
  · rw [hkSurplus,
      ← rightAdjacentCapByIndex_oppIndex1_eq_capByIndex_surplusIdx S,
      happ]
    exact S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius
  · exact False.elim (hk hkFirst)
  · rw [hkSecond,
      ← S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2,
      happ]
    exact S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 radius

private theorem collision_source_mem_cap_of_centers_mem_cap
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {center apex source partner : ℝ²}
    (hcenterCap : center ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hcentersNe : center ≠ apex)
    (hsourceA : source ∈ D.A) (hpartnerA : partner ∈ D.A)
    (hsourcesNe : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hapexEq : dist apex source = dist apex partner) :
    source ∈ S.capByIndex k ∨ partner ∈ S.capByIndex k := by
  classical
  by_contra hneither
  push_neg at hneither
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenterCap
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcenterImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hicNeIa : ic ≠ ia := by
    intro h
    apply hcentersNe
    calc
      center = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = apex := hia
  have hsourceOutside : source ∉ Finset.univ.image L.points := by
    simpa [hcap] using hneither.1
  have hpartnerOutside : partner ∉ Finset.univ.image L.points := by
    simpa [hcap] using hneither.2
  rcases lt_or_gt_of_ne hicNeIa with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt hsourceA hpartnerA
      hsourceOutside hpartnerOutside hsourcesNe
      (by simpa [hic] using hcenterEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt hsourceA hpartnerA
      hsourceOutside hpartnerOutside hsourcesNe
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcenterEq)

/-- Exact classification of the collision output away from the first
opposite-cap index.

If both deleted collision sources belong to the exact first-apex class, the
outside-pair terminal forces at least one into the fresh center's cap, while
endpoint one-hit forces at most one.  Hence exactly one lies in that cap.
The only remaining alternatives are that the fresh center lies in the first
opposite cap itself, or that one collision source came from the three
protected Moser vertices rather than the exact class. -/
theorem collision_sources_exact_cap_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {center : ℝ²} {k : Fin 3} {V : Finset ℝ²}
    (hcenterInterior : center ∈ S.capInteriorByIndex k)
    (hVsub : V ⊆ protectedDeletionSet R)
    {source partner : ℝ²}
    (hsourceV : source ∈ V) (hpartnerV : partner ∈ V)
    (hsourcesNe : source ≠ partner)
    (hcenterEq : dist center source = dist center partner) :
    k = S.oppIndex1 ∨
      (source ∈ S.triangle.verts ∧
        source ∉ SelectedClass D.A S.oppApex1 radius) ∨
      (partner ∈ S.triangle.verts ∧
        partner ∉ SelectedClass D.A S.oppApex1 radius) ∨
      ((source ∈ S.capByIndex k ∧ partner ∉ S.capByIndex k) ∨
        (partner ∈ S.capByIndex k ∧ source ∉ S.capByIndex k)) := by
  classical
  by_cases hk : k = S.oppIndex1
  · exact Or.inl hk
  right
  have hsourceU := hVsub hsourceV
  have hpartnerU := hVsub hpartnerV
  change source ∈
      SelectedClass D.A S.oppApex1 radius ∪ S.triangle.verts at hsourceU
  change partner ∈
      SelectedClass D.A S.oppApex1 radius ∪ S.triangle.verts at hpartnerU
  by_cases hsourceClass :
      source ∈ SelectedClass D.A S.oppApex1 radius
  · by_cases hpartnerClass :
        partner ∈ SelectedClass D.A S.oppApex1 radius
    · right; right
      have happ := oppApex1_eq_oppositeVertex_oppIndex1 S
      have hcenterCap : center ∈ S.capByIndex k :=
        S.capInteriorByIndex_subset_capByIndex k hcenterInterior
      have hapexCap : S.oppApex1 ∈ S.capByIndex k := by
        rw [happ]
        exact oppositeVertexByIndex_mem_capByIndex_of_ne S (Ne.symm hk)
      have hcenterNe : center ≠ S.oppApex1 := by
        rw [happ]
        exact S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
          hcenterInterior
      have hsourceA := (mem_selectedClass.mp hsourceClass).1
      have hpartnerA := (mem_selectedClass.mp hpartnerClass).1
      have hapexEq :
          dist S.oppApex1 source = dist S.oppApex1 partner :=
        (mem_selectedClass.mp hsourceClass).2.trans
          (mem_selectedClass.mp hpartnerClass).2.symm
      have hone := collision_source_mem_cap_of_centers_mem_cap
        S k hcenterCap hapexCap hcenterNe hsourceA hpartnerA
        hsourcesNe hcenterEq hapexEq
      have hnotBoth :
          ¬ (source ∈ S.capByIndex k ∧ partner ∈ S.capByIndex k) := by
        rintro ⟨hsourceCap, hpartnerCap⟩
        have hpairSub :
            ({source, partner} : Finset ℝ²) ⊆
              SelectedClass D.A S.oppApex1 radius ∩ S.capByIndex k := by
          intro z hz
          simp only [Finset.mem_insert, Finset.mem_singleton] at hz
          rcases hz with rfl | rfl
          · exact Finset.mem_inter.mpr ⟨hsourceClass, hsourceCap⟩
          · exact Finset.mem_inter.mpr ⟨hpartnerClass, hpartnerCap⟩
        have hpairCard := Finset.card_le_card hpairSub
        have honeCard :=
          firstApex_selectedClass_inter_otherCap_card_le_one
            S k hk radius
        have htwo : ({source, partner} : Finset ℝ²).card = 2 := by
          simp [hsourcesNe]
        omega
      rcases hone with hsourceCap | hpartnerCap
      · exact Or.inl ⟨hsourceCap, fun hpartnerCap ↦
          hnotBoth ⟨hsourceCap, hpartnerCap⟩⟩
      · exact Or.inr ⟨hpartnerCap, fun hsourceCap ↦
          hnotBoth ⟨hsourceCap, hpartnerCap⟩⟩
    · right; left
      exact ⟨(Finset.mem_union.mp hpartnerU).resolve_left hpartnerClass,
        hpartnerClass⟩
  · left
    exact ⟨(Finset.mem_union.mp hsourceU).resolve_left hsourceClass,
      hsourceClass⟩

/-- Minimality applied after deleting the exact four-class and all physical
Moser vertices.

The output is exhaustive:

* two deleted sources collide at the fresh strict-cap center;
* the minimal blocking set is a singleton exact critical shell; or
* it is a nontrivial family of pairwise-disjoint exact critical shells, with
  at least two complement points consumed per source in the center's cap.

Unlike the earlier finite marginal boundaries, every point, row, and cap in
this statement belongs to the original Euclidean carrier. -/
theorem exists_strictCap_collision_or_singletonCore_or_packedCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ∃ center : ℝ², center ∈ D.A ∧
      ∃ k : Fin 3, center ∈ S.capInteriorByIndex k ∧
        ∃ V : Finset ℝ²,
          V.Nonempty ∧
          V ⊆ protectedDeletionSet R ∧
          ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
          (∀ s ∈ V,
            HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center) ∧
          ((∃ s ∈ V, ∃ t ∈ V,
              s ≠ t ∧ dist center s = dist center t ∧
              FullyDeletionRobustAt D center ∧
              (∀ z : ℝ², ∀ hz : z ∈ D.A,
                H.centerAt z hz ≠ center)) ∨
            (Nonempty (MinimalDeletionCore D.A V center) ∧
              V.card = 1) ∨
            (Nonempty (MinimalDeletionCore D.A V center) ∧
              2 ≤ V.card ∧
              FullyDeletionRobustAt D center ∧
              (∀ z : ℝ², ∀ hz : z ∈ D.A,
                H.centerAt z hz ≠ center) ∧
              2 * V.card ≤ (D.A \ S.capByIndex k).card)) := by
  classical
  let C := SelectedClass D.A S.oppApex1 radius
  let U := protectedDeletionSet R
  have hCsub : C ⊆ D.A := by
    intro x hx
    exact (mem_selectedClass.mp hx).1
  have hUsub : U ⊆ D.A := by
    intro x hx
    rcases Finset.mem_union.mp hx with hxC | hxVerts
    · exact hCsub hxC
    · exact S.triangle.verts_subset hxVerts
  have hCne : C.Nonempty := by
    apply Finset.card_pos.mp
    have hcard : C.card = 4 := by
      simpa [C] using R.class_card_eq_four
    omega
  have hUne : U.Nonempty := by
    exact hCne.mono (by
      intro x hx
      exact Finset.mem_union_left S.triangle.verts hx)
  have hUcard : U.card ≤ 7 := by
    calc
      U.card ≤ C.card + S.triangle.verts.card := by
        simpa [U, protectedDeletionSet, C] using
          (Finset.card_union_le C S.triangle.verts)
      _ = 7 := by
        rw [S.triangle.verts_card]
        have hcard : C.card = 4 := by
          simpa [C] using R.class_card_eq_four
        omega
  have hUcardLt : U.card < D.A.card := by
    have hAcard := R.carrier_card_gt_nine
    omega
  rcases exists_fresh_collision_or_minimalDeletionCore_of_card_lt
      R.minimal hUsub hUne hUcardLt with
    ⟨center, hcenterRemaining, V, hVne, hVsub, hVblocked,
      hVminimal, hout⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterRemaining).1
  have hcenterNotVerts : center ∉ S.triangle.verts := by
    intro hcenterVerts
    exact (Finset.mem_sdiff.mp hcenterRemaining).2
      (by
        change center ∈ C ∪ S.triangle.verts
        exact Finset.mem_union_right C hcenterVerts)
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    hcenterVerts | ⟨k, hcenterInterior⟩
  · exact False.elim (hcenterNotVerts hcenterVerts)
  · refine ⟨center, hcenterA, k, hcenterInterior, V, hVne, hVsub,
      hVblocked, hVminimal, ?_⟩
    rcases hout with hcollision | hcore
    · rcases hcollision with ⟨s, hsV, t, htV, hst, heq⟩
      have hfive :
          5 ≤ (SelectedClass D.A center (dist center s)).card :=
        five_le_selectedClass_of_minimalDeletion_collision
          (hVsub.trans hUsub) hsV htV hst heq
          (hVminimal s hsV) hVblocked
      have hcenterNeS : center ≠ s := by
        intro hcenterS
        have hsU : s ∈ U := hVsub hsV
        exact (Finset.mem_sdiff.mp hcenterRemaining).2
          (hcenterS ▸ hsU)
      have hradius : 0 < dist center s := dist_pos.mpr hcenterNeS
      have hrobust : FullyDeletionRobustAt D center :=
        fullyDeletionRobustAt_of_five_le_selectedClass hradius hfive
      have homitted :
          ∀ z : ℝ², ∀ hz : z ∈ D.A, H.centerAt z hz ≠ center :=
        fun z hz ↦ hrobust.centerAt_ne H z hz
      exact Or.inl ⟨s, hsV, t, htV, hst, heq, hrobust, homitted⟩
    · rcases hcore with ⟨K⟩
      by_cases hsingleton : V.card = 1
      · exact Or.inr (Or.inl ⟨⟨K⟩, hsingleton⟩)
      · have hVtwo : 2 ≤ V.card := by
          have hVpos : 0 < V.card := Finset.card_pos.mpr hVne
          omega
        have hcenterCap : center ∈ S.capByIndex k :=
          S.capInteriorByIndex_subset_capByIndex k hcenterInterior
        have hpack :
            2 * V.card ≤ (D.A \ S.capByIndex k).card :=
          minimalDeletionCore_two_mul_card_le_cap_complement K k hcenterCap
        have hrobust : FullyDeletionRobustAt D center :=
          fullyDeletionRobustAt_of_nontrivial_minimalDeletionCore K hVtwo
        have homitted :
            ∀ z : ℝ², ∀ hz : z ∈ D.A,
              H.centerAt z hz ≠ center :=
          fun z hz ↦ hrobust.centerAt_ne H z hz
        exact Or.inr
          (Or.inr ⟨⟨K⟩, hVtwo, hrobust, homitted, hpack⟩)

#print axioms exists_strictCap_collision_or_singletonCore_or_packedCore
#print axioms firstApex_selectedClass_inter_otherCap_card_le_one
#print axioms collision_sources_exact_cap_residual

end ATailUniqueFourGlobalCouplingScratch
end Problem97
