/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.LargeOppositeCapsBiApexSurface
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.CapSelectedRowCounting

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLargeOppositeCapsBiApexSurface
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

/-- The all-large-caps residual: every cap of the partition carries at least six
points, so the carrier has at least fifteen points and the least profile is
`(6, 6, 6)`.  This is the honest residual of the cap-six continuation after the
five-point-cap profiles are dispatched. -/
structure FrontierAllLargeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : Prop where
  /-- The surplus cap is large as well, not merely the two opposite caps. -/
  surplusCap_card_ge_six : 6 ≤ S.surplusCap.card


/-- The all-large-caps residual with robustness at **all three** Moser apices.

The bi-apex surface only ever reports `oppApex1` and `oppApex2`.  Rotating the
packet so that the surplus cap takes the second opposite role and running the
fresh common-deletion parent on it reports the third, since
`FullyDeletionRobustAt` is a statement about `D` and a point alone and does not
mention the packet.  That rotation is performed in
`false_of_frontierAllLargeCapsBiApexRobustResidual` below, so this residual is
strictly stronger than `FrontierAllLargeCapsBiApexRobustResidual`. -/
structure FrontierAllLargeCapsTriApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    (N : FrontierAllLargeCapsBiApexRobustResidual L) : Prop where
  /-- Every Moser apex carries a six-point class or two distinct K4 radii.
  Robustness alone only gives a five-point class in the first branch; the
  strengthening comes from the first-apex dichotomy, run at each apex in turn
  by rotating the packet. -/
  oppApex1_rich : ApexRichClassStructure D.A S.oppApex1
  /-- Rich class structure at the second opposite apex. -/
  oppApex2_rich : ApexRichClassStructure D.A S.oppApex2
  /-- Rich class structure at the surplus apex. -/
  surplusApex_rich : ApexRichClassStructure D.A S.surplusApex
  /-- Minimality's positive content, in robustness form: the carrier is covered
  by four-point classes of centres carrying exactly one K4 radius, and those are
  exactly the points where deletion robustness fails. -/
  notRobustCover_card : D.A.card ≤ 4 * (notRobustCenters D).card
  /-- No centre covers all three Moser apices on one radius, so at least two
  distinct covering centres are spent on the apices. -/
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

/-- Two hits of one rich opposite-apex class in a canonical critical shell
force that shell's blocker center into the same indexed strict cap.  This is
the uniform ordered-cap localization needed by the tri-apex terminal. -/
theorem criticalShellCenter_mem_capInteriorByIndex_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i := by
  classical
  have hone :
      1 < ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card := by
    omega
  rw [Finset.one_lt_card] at hone
  obtain ⟨q, hq, w, hw, hqw⟩ := hone
  have hq' := Finset.mem_inter.mp hq
  have hw' := Finset.mem_inter.mp hw
  have hqClassInterior := Finset.mem_inter.mp hq'.2
  have hwClassInterior := Finset.mem_inter.mp hw'.2
  have hcenterA : H.centerAt x hx ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt x hx).toCriticalFourShell.center_mem).2
  have hcenterNe :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    apply not_isUniqueFourCenter_of_fullyDeletionRobust
      (fullyDeletionRobustAt_of_apexRichClassStructure hrich)
    simpa [hcenter] using hunique
  have hcenterEq :
      dist (H.centerAt x hx) q = dist (H.centerAt x hx) w :=
    ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius q hq'.1).trans
      ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius w hw'.1).symm
  have hapexEq :
      dist (S.oppositeVertexByIndex i) q =
        dist (S.oppositeVertexByIndex i) w :=
    (mem_selectedClass.mp hqClassInterior.1).2.trans
      (mem_selectedClass.mp hwClassInterior.1).2.symm
  exact commonPhysicalPair_center_mem_capInteriorByIndex i
    hcenterA hcenterNe hqClassInterior.2 hwClassInterior.2 hqw
    hcenterEq hapexEq

theorem triApexAllLargeContext_index_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    i = S.oppIndex1 ∨ i = S.oppIndex2 ∨ i = S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨j, hj3⟩
  fin_cases i <;>
    interval_cases j <;>
      simp [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]

/-- Two distinct strict-cap points on one rich-apex radius whose canonical
critical shells have the same blocker determine that blocker's complete
intersection with the indexed cap.  In particular, the common blocker is
strictly inside the cap and its selected shell meets the whole cap in exactly
the two source points. -/
theorem equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3} {r : ℝ}
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A)
    (hx :
      x ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hy :
      y ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hxy : x ≠ y)
    (hblockers : H.centerAt x hxA = H.centerAt y hyA)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hxA)) :
    H.centerAt x hxA ∈ S.capInteriorByIndex i ∧
      (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i =
        {x, y} := by
  classical
  have hsupports :
      (H.selectedAt x hxA).toCriticalFourShell.support =
        (H.selectedAt y hyA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H x hxA,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H y hyA,
      hblockers]
  have hyShell :
      y ∈ (H.selectedAt x hxA).toCriticalFourShell.support := by
    rw [hsupports]
    exact (H.selectedAt y hyA).toCriticalFourShell.q_mem_support
  have hpairSubsetSlice :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support, hx⟩
    · subst z
      exact Finset.mem_inter.mpr ⟨hyShell, hy⟩
  have htwo :
      2 ≤
        ((H.selectedAt x hxA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i)).card := by
    simpa [hxy] using Finset.card_le_card hpairSubsetSlice
  have hcenterInterior :
      H.centerAt x hxA ∈ S.capInteriorByIndex i :=
    criticalShellCenter_mem_capInteriorByIndex_of_two_hits
      hxA hrich hunique htwo
  have hpairSubsetCap :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt x hxA).toCriticalFourShell.support ∩
          S.capByIndex i := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzx | hzy
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt x hxA).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hx).2⟩
    · subst z
      exact Finset.mem_inter.mpr
        ⟨hyShell,
          S.capInteriorByIndex_subset_capByIndex i
            (Finset.mem_inter.mp hy).2⟩
  have hcapTwo :
      ((H.selectedAt x hxA).toCriticalFourShell.support ∩
        S.capByIndex i).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex i
        (H.selectedAt x hxA).toCriticalFourShell.toSelectedFourClass
        (S.capInteriorByIndex_subset_capByIndex i hcenterInterior)
  exact ⟨hcenterInterior,
    (Finset.eq_of_subset_of_card_le hpairSubsetCap (by
      simpa [hxy] using hcapTwo)).symm⟩

/-- Two selected four-classes with distinct centres in one indexed ordered cap
share at most one support point outside that cap. -/
theorem selectedFourClass_outside_overlap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {c d : ℝ²}
    (hcCap : c ∈ S.capByIndex i)
    (hdCap : d ∈ S.capByIndex i)
    (hcd : c ≠ d)
    (Kc : SelectedFourClass D.A c)
    (Kd : SelectedFourClass D.A d) :
    ((Kc.support \ S.capByIndex i) ∩
      (Kd.support \ S.capByIndex i)).card ≤ 1 := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hdImage : d ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hdCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hdImage with ⟨id, _hid, hid⟩
  have hic_ne_id : ic ≠ id := by
    intro h
    apply hcd
    calc
      c = L.points ic := hic.symm
      _ = L.points id := by simp [h]
      _ = d := hid
  by_contra hcard
  have hone :
      1 <
        ((Kc.support \ S.capByIndex i) ∩
          (Kd.support \ S.capByIndex i)).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_inter.mp ha with ⟨haKcOff, haKdOff⟩
  rcases Finset.mem_inter.mp hb with ⟨hbKcOff, hbKdOff⟩
  have haKc : a ∈ Kc.support := (Finset.mem_sdiff.mp haKcOff).1
  have hbKc : b ∈ Kc.support := (Finset.mem_sdiff.mp hbKcOff).1
  have haKd : a ∈ Kd.support := (Finset.mem_sdiff.mp haKdOff).1
  have hbKd : b ∈ Kd.support := (Finset.mem_sdiff.mp hbKdOff).1
  have haOff : a ∉ S.capByIndex i := (Finset.mem_sdiff.mp haKcOff).2
  have hbOff : b ∉ S.capByIndex i := (Finset.mem_sdiff.mp hbKcOff).2
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have hcEq : dist c a = dist c b :=
    (Kc.support_eq_radius a haKc).trans
      (Kc.support_eq_radius b hbKc).symm
  have hdEq : dist d a = dist d b :=
    (Kd.support_eq_radius a haKd).trans
      (Kd.support_eq_radius b hbKd).symm
  rcases lt_or_gt_of_ne hic_ne_id with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hid] using hdEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt
      (Kc.support_subset_A haKc) (Kc.support_subset_A hbKc)
      haOutside hbOutside hab
      (by simpa [hid] using hdEq)
      (by simpa [hic] using hcEq)
/- The indexed context consumed by the E1 core.  The old residual chain is
flattened here once; the core need not repeatedly distinguish the surplus and
the two named opposite roles. -/
structure TriApexAllLargeContext
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop where
  cap_card_ge_six :
    ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card
  apex_rich :
    ∀ i : Fin 3,
      ApexRichClassStructure D.A
        (S.oppositeVertexByIndex i)
  notRobustCover_card :
    D.A.card ≤ 4 * (notRobustCenters D).card
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

/-- Every canonical critical-shell center lies in one of the three strict cap
interiors once all three opposite apices are rich.  Richness makes every Moser
apex deletion robust, whereas a critical-shell center is unique-four; the cap
partition then leaves only the three strict interiors. -/
theorem exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3, H.centerAt x hx ∈ S.capInteriorByIndex i := by
  have hunique : IsUniqueFourCenter D.A (H.centerAt x hx) :=
    isUniqueFourCenter_centerAt H x hx
  have hcenterNe (i : Fin 3) :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i))
        (by simpa [hcenter] using hunique)
  have hcenterA : H.centerAt x hx ∈ D.A :=
    Finset.mem_of_mem_erase
      (H.selectedAt x hx).toCriticalFourShell.center_mem
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim ((hcenterNe S.surplusIdx) hsurplus)
    · exact False.elim ((hcenterNe S.oppIndex1) hfirst)
    · exact False.elim ((hcenterNe S.oppIndex2) hsecond)
  · exact hcap


private theorem capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppIndex1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppIndex2, hi]

private theorem capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]


/-- Build the indexed E1 context from the existing residual bundle. -/
theorem triApexAllLargeContext_of_residuals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    TriApexAllLargeContext D S := by
  have hcap1 : 6 ≤ (S.capByIndex S.oppIndex1).card := by
    rw [capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext]
    exact L.firstOppCap_card_ge_six
  have hcap2 : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    rw [capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext]
    exact L.secondOppCap_card_ge_six
  have hsurplus : 6 ≤ (S.capByIndex S.surplusIdx).card := by
    rw [capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext]
    exact N.surplusCap_card_ge_six
  refine {
    cap_card_ge_six := ?_
    apex_rich := ?_
    notRobustCover_card := T.notRobustCover_card
    no_center_covers_all_apices := T.no_center_covers_all_apices }
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · exact hcap1
    · exact hcap2
    · exact hsurplus
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · simpa using T.oppApex1_rich
    · simpa using T.oppApex2_rich
    · simpa using T.surplusApex_rich

/-- Two exact two-point cap intersections of four-point rows, supported on
disjoint pairs, force the complete cross-omission rectangle.  Each row also
has exactly two support points outside the cap. -/
theorem exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
    {α : Type*} [DecidableEq α]
    {K₀ K₁ C : Finset α} {a b u v : α}
    (hK₀card : K₀.card = 4)
    (hK₁card : K₁.card = 4)
    (hK₀cap : K₀ ∩ C = {a, b})
    (hK₁cap : K₁ ∩ C = {u, v})
    (hab : a ≠ b) (huv : u ≠ v)
    (hpairs : Disjoint ({a, b} : Finset α) {u, v}) :
    u ∉ K₀ ∧ v ∉ K₀ ∧ a ∉ K₁ ∧ b ∉ K₁ ∧
      (K₀ \ C).card = 2 ∧ (K₁ \ C).card = 2 := by
  have haC : a ∈ C := by
    have haInter : a ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp haInter).2
  have hbC : b ∈ C := by
    have hbInter : b ∈ K₀ ∩ C := by
      rw [hK₀cap]
      simp
    exact (Finset.mem_inter.mp hbInter).2
  have huC : u ∈ C := by
    have huInter : u ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp huInter).2
  have hvC : v ∈ C := by
    have hvInter : v ∈ K₁ ∩ C := by
      rw [hK₁cap]
      simp
    exact (Finset.mem_inter.mp hvInter).2
  have huNotK₀ : u ∉ K₀ := by
    intro huK₀
    have huPair₀ : u ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨huK₀, huC⟩
    exact Finset.disjoint_left.mp hpairs huPair₀ (by simp)
  have hvNotK₀ : v ∉ K₀ := by
    intro hvK₀
    have hvPair₀ : v ∈ ({a, b} : Finset α) := by
      rw [← hK₀cap]
      exact Finset.mem_inter.mpr ⟨hvK₀, hvC⟩
    exact Finset.disjoint_left.mp hpairs hvPair₀ (by simp)
  have haNotK₁ : a ∉ K₁ := by
    intro haK₁
    have haPair₁ : a ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨haK₁, haC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) haPair₁
  have hbNotK₁ : b ∉ K₁ := by
    intro hbK₁
    have hbPair₁ : b ∈ ({u, v} : Finset α) := by
      rw [← hK₁cap]
      exact Finset.mem_inter.mpr ⟨hbK₁, hbC⟩
    exact Finset.disjoint_left.mp hpairs (by simp) hbPair₁
  have hsplit₀ := Finset.card_sdiff_add_card_inter K₀ C
  have houtside₀ : (K₀ \ C).card = 2 := by
    rw [hK₀card, hK₀cap] at hsplit₀
    simp [hab] at hsplit₀
    omega
  have hsplit₁ := Finset.card_sdiff_add_card_inter K₁ C
  have houtside₁ : (K₁ \ C).card = 2 := by
    rw [hK₁card, hK₁cap] at hsplit₁
    simp [huv] at hsplit₁
    omega
  exact
    ⟨huNotK₀, hvNotK₀, haNotK₁, hbNotK₁, houtside₀, houtside₁⟩

/-- Six pairwise accounted-for interior points are forced unless one blocker
coincides with a source from the other pair. -/
theorem six_interior_or_cross_blocker_coincidence
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀b₁ : b₀ ≠ b₁)
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I) :
    6 ≤ I.card ∨ b₀ = u ∨ b₀ = v ∨ b₁ = p₁ ∨ b₁ = p₂ := by
  by_cases hb₀u : b₀ = u
  · exact Or.inr (Or.inl hb₀u)
  by_cases hb₀v : b₀ = v
  · exact Or.inr (Or.inr (Or.inl hb₀v))
  by_cases hb₁p₁ : b₁ = p₁
  · exact Or.inr (Or.inr (Or.inr (Or.inl hb₁p₁)))
  by_cases hb₁p₂ : b₁ = p₂
  · exact Or.inr (Or.inr (Or.inr (Or.inr hb₁p₂)))
  left
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hb₀NotPairUnion : b₀ ∉ pairUnion := by
    simp [pairUnion, hb₀p₁, hb₀p₂, hb₀u, hb₀v]
  have hb₁NotInsert : b₁ ∉ insert b₀ pairUnion := by
    simp [pairUnion, hb₀b₁.symm, hb₁p₁, hb₁p₂, hb₁u, hb₁v]
  have hpacketCard :
      (insert b₁ (insert b₀ pairUnion)).card = 6 := by
    simp [hb₁NotInsert, hb₀NotPairUnion, hpairUnionCard]
  have hpacketSubset : insert b₁ (insert b₀ pairUnion) ⊆ I := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₁I
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₀I
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  calc
    6 = (insert b₁ (insert b₀ pairUnion)).card := hpacketCard.symm
    _ ≤ I.card := Finset.card_le_card hpacketSubset

/-- If the interior consists of the four disjoint source points, each blocker
must be one of the sources from the other pair. -/
theorem four_interior_forces_both_cross_blocker_coincidences
    {α : Type*} [DecidableEq α]
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) {u, v})
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I)
    (hIcard : I.card = 4) :
    (b₀ = u ∨ b₀ = v) ∧ (b₁ = p₁ ∨ b₁ = p₂) := by
  let pairUnion : Finset α := {p₁, p₂} ∪ {u, v}
  have hpairUnionCard : pairUnion.card = 4 := by
    dsimp [pairUnion]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hpairUnionSubset : pairUnion ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  have hpairUnionEq : pairUnion = I :=
    Finset.eq_of_subset_of_card_le hpairUnionSubset (by omega)
  have hb₀PairUnion : b₀ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₀I
  have hb₁PairUnion : b₁ ∈ pairUnion := by
    rw [hpairUnionEq]
    exact hb₁I
  constructor
  · rcases Finset.mem_union.mp hb₀PairUnion with hb₀pair | hb₀pair
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact False.elim (hb₀p₁ h)
      · exact False.elim (hb₀p₂ (Finset.mem_singleton.mp h))
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
  · rcases Finset.mem_union.mp hb₁PairUnion with hb₁pair | hb₁pair
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact False.elim (hb₁u h)
      · exact False.elim (hb₁v (Finset.mem_singleton.mp h))


end ATailFrontierLiveClosure
end Problem97
