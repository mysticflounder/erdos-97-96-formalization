/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourGlobalDeletionCoupling
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.Moser.TriangleNonObtuse

/-!
# Fresh-center and MEC boundary reduction for the exact-four arm

The global-deletion construction chooses its new center outside the exact
first-apex class and outside the three displayed Moser vertices.  The original
transition theorem did not retain that source fact in its conclusion.  This
file records the stronger source-faithful transition and derives two immediate
geometric consequences:

* a fresh center in the first opposite cap forces that cap to have at least
  five vertices; and
* the fresh center is either strictly inside the minimum enclosing disk or is
  a fourth, non-displayed minimum-enclosing-circle boundary point.

The second alternative is only boundary ingress.  It does not by itself
construct an alternative nonobtuse support triangle with two exact four-caps.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourFreshCenterMECBoundaryScratch

open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourGlobalCouplingScratch

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
      ∀ s ∈ V, HasNEquidistantPointsAt 4 (A \ (V.erase s)) center := by
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

/-- Source-faithful strengthening of the global exact-four transition.  The
new center is retained in the actual complement from which minimality chose
it, rather than weakened to bare carrier membership. -/
theorem exists_fresh_strictCap_collision_or_singletonCore_or_packedCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ∃ center : ℝ², center ∈ D.A \ protectedDeletionSet R ∧
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
  · refine ⟨center, ?_, k, hcenterInterior, V, hVne, hVsub,
      hVblocked, hVminimal, ?_⟩
    · simpa [U] using hcenterRemaining
    · rcases hout with hcollision | hcore
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

/-- A fresh transition center in the strict first opposite cap is a third
strict-cap point in addition to the residual's two exact-class points. -/
theorem firstOppCap_card_ge_five_of_fresh_center
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) {center : ℝ²}
    (hcenterFresh : center ∈ D.A \ protectedDeletionSet R)
    (hcenterInterior : center ∈ S.capInteriorByIndex S.oppIndex1) :
    5 ≤ (S.capByIndex S.oppIndex1).card := by
  classical
  have hcenterNotClass :
      center ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hcenterClass
    exact (Finset.mem_sdiff.mp hcenterFresh).2
      (Finset.mem_union_left S.triangle.verts hcenterClass)
  have hqInterior := (Finset.mem_inter.mp R.interior_q_mem).2
  have hwInterior := (Finset.mem_inter.mp R.interior_w_mem).2
  have hqClass := (Finset.mem_inter.mp R.interior_q_mem).1
  have hwClass := (Finset.mem_inter.mp R.interior_w_mem).1
  have hcenterNeQ : center ≠ R.interior_q := by
    intro h
    exact hcenterNotClass (h ▸ hqClass)
  have hcenterNeW : center ≠ R.interior_w := by
    intro h
    exact hcenterNotClass (h ▸ hwClass)
  have hthreeSubset :
      ({center, R.interior_q, R.interior_w} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact hcenterInterior
    · exact hqInterior
    · exact hwInterior
  have hthreeCard :
      ({center, R.interior_q, R.interior_w} : Finset ℝ²).card = 3 := by
    simp [hcenterNeQ, hcenterNeW, R.interior_q_ne_w]
  have hinteriorThree : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    have := Finset.card_le_card hthreeSubset
    omega
  have hcap := ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
    S S.oppIndex1
  omega

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- If the first opposite cap is exact four, no-`IsM44` forces the second
opposite cap to be large. -/
theorem secondOppCap_card_ge_five_of_firstOppCap_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hfirst : (S.capByIndex S.oppIndex1).card = 4) :
    5 ≤ (S.capByIndex S.oppIndex2).card := by
  have hlower := (oppositeCaps_card_ge_four D S).2
  by_contra hnotLarge
  have hsecond : (S.capByIndex S.oppIndex2).card = 4 := by omega
  apply R.noM44
  refine ⟨S, ?_, ?_⟩
  · rw [← capByIndex_oppIndex1_eq_oppCap1 S]
    exact hfirst
  · rw [← capByIndex_oppIndex2_eq_oppCap2 S]
    exact hsecond

/-- On an exact-four first opposite cap, every fresh transition center lies
in one of the other two strict caps, while the second opposite cap is large.
This eliminates one complete cap-location arm of all three transition
outputs. -/
theorem fresh_center_avoids_exact_firstOppCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) {center : ℝ²} {k : Fin 3}
    (hcenterFresh : center ∈ D.A \ protectedDeletionSet R)
    (hcenterInterior : center ∈ S.capInteriorByIndex k)
    (hfirst : (S.capByIndex S.oppIndex1).card = 4) :
    k ≠ S.oppIndex1 ∧ 5 ≤ (S.capByIndex S.oppIndex2).card := by
  refine ⟨?_, secondOppCap_card_ge_five_of_firstOppCap_card_eq_four R hfirst⟩
  intro hk
  subst k
  have hlarge := firstOppCap_card_ge_five_of_fresh_center
    R hcenterFresh hcenterInterior
  omega

/-- The existing collision classification with its discarded freshness field
restored.  When the first opposite cap is exact four, its entire `k =
oppIndex1` arm disappears; no-`IsM44` simultaneously makes the second
opposite cap large. -/
theorem collision_sources_residual_of_firstOppCap_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {center : ℝ²} {k : Fin 3} {V : Finset ℝ²}
    (hcenterFresh : center ∈ D.A \ protectedDeletionSet R)
    (hcenterInterior : center ∈ S.capInteriorByIndex k)
    (hVsub : V ⊆ protectedDeletionSet R)
    {source partner : ℝ²}
    (hsourceV : source ∈ V) (hpartnerV : partner ∈ V)
    (hsourcesNe : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hfirst : (S.capByIndex S.oppIndex1).card = 4) :
    5 ≤ (S.capByIndex S.oppIndex2).card ∧
      ((source ∈ S.triangle.verts ∧
          source ∉ SelectedClass D.A S.oppApex1 radius) ∨
        (partner ∈ S.triangle.verts ∧
          partner ∉ SelectedClass D.A S.oppApex1 radius) ∨
        ((source ∈ S.capByIndex k ∧ partner ∉ S.capByIndex k) ∨
          (partner ∈ S.capByIndex k ∧ source ∉ S.capByIndex k))) := by
  have hsecond :=
    secondOppCap_card_ge_five_of_firstOppCap_card_eq_four R hfirst
  refine ⟨hsecond, ?_⟩
  rcases collision_sources_exact_cap_residual R hcenterInterior hVsub
      hsourceV hpartnerV hsourcesNe hcenterEq with
    hk | hsourceVertex | hpartnerVertex | hsplit
  · have hlarge := firstOppCap_card_ge_five_of_fresh_center
      R hcenterFresh (hk ▸ hcenterInterior)
    omega
  · exact Or.inl hsourceVertex
  · exact Or.inr (Or.inl hpartnerVertex)
  · exact Or.inr (Or.inr hsplit)

/-- The retained fresh center is either strictly inside the minimum enclosing
disk or is a fourth MEC-boundary point distinct from all displayed Moser
vertices. -/
theorem fresh_center_strictlyInsideMEC_or_four_boundary_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) {center : ℝ²}
    (hcenterFresh : center ∈ D.A \ protectedDeletionSet R) :
    dist center (MEC.mec D.A S.hA).center < (MEC.mec D.A S.hA).radius ∨
      4 ≤ (MEC.boundary D.A S.hA).card := by
  classical
  have hcenterA := (Finset.mem_sdiff.mp hcenterFresh).1
  have hcenterNotVerts : center ∉ S.triangle.verts := by
    intro hcenterVerts
    exact (Finset.mem_sdiff.mp hcenterFresh).2
      (Finset.mem_union_right
        (SelectedClass D.A S.oppApex1 radius) hcenterVerts)
  have hcenterLe := (MEC.mec D.A S.hA).enclosing center hcenterA
  rcases lt_or_eq_of_le hcenterLe with hlt | heq
  · exact Or.inl hlt
  · right
    have hcenterBoundary : center ∈ MEC.boundary D.A S.hA :=
      (MEC.mem_boundary_iff S.hA).2 ⟨hcenterA, heq⟩
    have hv1Boundary : S.triangle.v1 ∈ MEC.boundary D.A S.hA :=
      (MEC.mem_boundary_iff S.hA).2
        ⟨S.triangle.v1_mem, S.triangleNonObtuse.toMoserTriangle.v1_boundary⟩
    have hv2Boundary : S.triangle.v2 ∈ MEC.boundary D.A S.hA :=
      (MEC.mem_boundary_iff S.hA).2
        ⟨S.triangle.v2_mem, S.triangleNonObtuse.toMoserTriangle.v2_boundary⟩
    have hv3Boundary : S.triangle.v3 ∈ MEC.boundary D.A S.hA :=
      (MEC.mem_boundary_iff S.hA).2
        ⟨S.triangle.v3_mem, S.triangleNonObtuse.toMoserTriangle.v3_boundary⟩
    have hfourSubset :
        ({center, S.triangle.v1, S.triangle.v2, S.triangle.v3} : Finset ℝ²) ⊆
          MEC.boundary D.A S.hA := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl | rfl
      · exact hcenterBoundary
      · exact hv1Boundary
      · exact hv2Boundary
      · exact hv3Boundary
    have hcenterNeV1 : center ≠ S.triangle.v1 := by
      intro h
      exact hcenterNotVerts (h ▸ by simp [MoserTriangle.verts])
    have hcenterNeV2 : center ≠ S.triangle.v2 := by
      intro h
      exact hcenterNotVerts (h ▸ by simp [MoserTriangle.verts])
    have hcenterNeV3 : center ≠ S.triangle.v3 := by
      intro h
      exact hcenterNotVerts (h ▸ by simp [MoserTriangle.verts])
    have hfourCard :
        ({center, S.triangle.v1, S.triangle.v2, S.triangle.v3} : Finset ℝ²).card = 4 := by
      simp [hcenterNeV1, hcenterNeV2, hcenterNeV3,
        S.triangle.v12_ne, S.triangle.v13_ne, S.triangle.v23_ne]
    have := Finset.card_le_card hfourSubset
    omega

#print axioms exists_fresh_strictCap_collision_or_singletonCore_or_packedCore
#print axioms firstOppCap_card_ge_five_of_fresh_center
#print axioms secondOppCap_card_ge_five_of_firstOppCap_card_eq_four
#print axioms fresh_center_avoids_exact_firstOppCap
#print axioms collision_sources_residual_of_firstOppCap_card_eq_four
#print axioms fresh_center_strictlyInsideMEC_or_four_boundary_points

end ATailUniqueFourFreshCenterMECBoundaryScratch
end Problem97
