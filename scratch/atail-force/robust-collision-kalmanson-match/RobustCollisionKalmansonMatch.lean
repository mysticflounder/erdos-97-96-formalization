/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape
import Erdos9796Proof.P97.ATail.OrdinalKalmansonCycle

/-!
# Ordered-cap normal form for the first-apex robust blocker collision

The global blocker collision gives one exact four-point shell at one common
blocker.  This file classifies the two colliding sources relative to a closed
indexed cap containing that blocker and extracts two distinct shell points
outside the cap.

The result reaches exactly the one-center prefix of
`CapSelectedRowCounting.outsidePair_unique_capCenter`.  A second distinct
center in the same cap, equidistant from the extracted outside pair, is the
first missing antecedent of that terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustCollisionKalmansonMatchScratch

attribute [local instance] Classical.propDecidable

/-- The exhaustive four-way placement of two named points relative to one
closed indexed cap. -/
def PairCapRoleCases
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3)
    (a b : ℝ²) : Prop :=
  (a ∈ S.capByIndex k ∧ b ∈ S.capByIndex k) ∨
    (a ∈ S.capByIndex k ∧ b ∉ S.capByIndex k) ∨
    (a ∉ S.capByIndex k ∧ b ∈ S.capByIndex k) ∨
    (a ∉ S.capByIndex k ∧ b ∉ S.capByIndex k)

private theorem pairCapRoleCases_total
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3)
    (a b : ℝ²) :
    PairCapRoleCases S k a b := by
  by_cases ha : a ∈ S.capByIndex k <;>
    by_cases hb : b ∈ S.capByIndex k <;>
      simp [PairCapRoleCases, ha, hb]

/-- Every carrier point belongs to at least one indexed closed cap. -/
private theorem exists_mem_capByIndex_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A) :
    ∃ k : Fin 3, x ∈ S.capByIndex k := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | ⟨k, hxInterior⟩
  · rcases S.mem_triangle_verts_cases hxMoser with rfl | rfl | rfl
    · exact ⟨1, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2⟩
    · exact ⟨0, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1⟩
    · exact ⟨0, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1⟩
  · exact ⟨k, S.capInteriorByIndex_subset_capByIndex k hxInterior⟩

/-- One ordered-cap projection of the anonymous global blocker collision.

The two colliding sources are classified into four cap roles.  Independently,
the exact four-shell supplies two distinct support points outside the cap,
both equidistant from the common blocker. -/
structure RobustCollisionCapOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {commonBlocker source₁ source₂ : ℝ²}
    (K : SelectedFourClass D.A commonBlocker) : Type where
  capIndex : Fin 3
  commonBlocker_mem_cap : commonBlocker ∈ S.capByIndex capIndex
  sourceRole : PairCapRoleCases S capIndex source₁ source₂
  outside₁ : ℝ²
  outside₂ : ℝ²
  outside₁_mem_A : outside₁ ∈ D.A
  outside₂_mem_A : outside₂ ∈ D.A
  outside_points_ne : outside₁ ≠ outside₂
  outside₁_mem_commonSupport : outside₁ ∈ K.support
  outside₂_mem_commonSupport : outside₂ ∈ K.support
  outside₁_not_mem_cap : outside₁ ∉ S.capByIndex capIndex
  outside₂_not_mem_cap : outside₂ ∉ S.capByIndex capIndex
  commonBlocker_equidistant :
    dist commonBlocker outside₁ = dist commonBlocker outside₂

/-- The exact common four-shell always has an ordered-cap projection with two
distinct outside points. -/
theorem nonempty_robustCollisionCapOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {commonBlocker source₁ source₂ : ℝ²}
    (K : SelectedFourClass D.A commonBlocker)
    (hcommonBlockerA : commonBlocker ∈ D.A) :
    Nonempty (RobustCollisionCapOutsidePair (S := S)
      (source₁ := source₁) (source₂ := source₂) K) := by
  rcases exists_mem_capByIndex_of_mem S hcommonBlockerA with
    ⟨k, hcenterCap⟩
  have hinterLe : (K.support ∩ S.capByIndex k).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex k K hcenterCap
  have hsplit :
      (K.support ∩ S.capByIndex k).card +
          (K.support \ S.capByIndex k).card = K.support.card :=
    Finset.card_inter_add_card_sdiff K.support (S.capByIndex k)
  have hcard : K.support.card = 4 := K.support_card
  have hone : 1 < (K.support \ S.capByIndex k).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haSupport, haOutside⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbSupport, hbOutside⟩
  refine ⟨{
    capIndex := k
    commonBlocker_mem_cap := hcenterCap
    sourceRole := pairCapRoleCases_total S k source₁ source₂
    outside₁ := a
    outside₂ := b
    outside₁_mem_A := K.support_subset_A haSupport
    outside₂_mem_A := K.support_subset_A hbSupport
    outside_points_ne := hab
    outside₁_mem_commonSupport := haSupport
    outside₂_mem_commonSupport := hbSupport
    outside₁_not_mem_cap := haOutside
    outside₂_not_mem_cap := hbOutside
    commonBlocker_equidistant :=
      (K.support_eq_radius a haSupport).trans
        (K.support_eq_radius b hbSupport).symm }⟩

/-- The first missing antecedent for the ordered-cap terminal is precisely a
second distinct center in the same cap bisecting the extracted outside pair. -/
theorem false_of_secondCapCenter_bisecting_collisionOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {commonBlocker source₁ source₂ : ℝ²}
    {K : SelectedFourClass D.A commonBlocker}
    (P : RobustCollisionCapOutsidePair (S := S)
      (source₁ := source₁) (source₂ := source₂) K)
    {secondCenter : ℝ²}
    (hsecondCap : secondCenter ∈ S.capByIndex P.capIndex)
    (hsecondNe : secondCenter ≠ commonBlocker)
    (hsecondEq : dist secondCenter P.outside₁ = dist secondCenter P.outside₂) :
    False := by
  rcases S.capByIndex_cgn4g_capData D.convex P.capIndex with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcommonImage :
      commonBlocker ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact P.commonBlocker_mem_cap
  have hsecondImage : secondCenter ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hsecondCap
  rcases Finset.mem_image.mp hcommonImage with ⟨i, _hi, hiCommon⟩
  rcases Finset.mem_image.mp hsecondImage with ⟨j, _hj, hjSecond⟩
  have hij : i ≠ j := by
    intro hij
    apply hsecondNe
    calc
      secondCenter = L.points j := hjSecond.symm
      _ = L.points i := by rw [hij]
      _ = commonBlocker := hiCommon
  have haOutside : P.outside₁ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₁_not_mem_cap
  have hbOutside : P.outside₂ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₂_not_mem_cap
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij P.outside₁_mem_A P.outside₂_mem_A
      haOutside hbOutside P.outside_points_ne
      (by simpa [hiCommon] using P.commonBlocker_equidistant)
      (by simpa [hjSecond] using hsecondEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji P.outside₁_mem_A P.outside₂_mem_A
      haOutside hbOutside P.outside_points_ne
      (by simpa [hjSecond] using hsecondEq)
      (by simpa [hiCommon] using P.commonBlocker_equidistant)

#print axioms nonempty_robustCollisionCapOutsidePair
#print axioms false_of_secondCapCenter_bisecting_collisionOutsidePair

end ATailRobustCollisionKalmansonMatchScratch
end Problem97
