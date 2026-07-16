/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.Census554.EquilateralHingeCollisions
import Erdos9796Proof.P97.U5GlobalIncidenceSupport

/-!
# Scratch: theorem-bank match for two global `K4` continuations

The continuation packet supplies two distinct centers in the second opposite
cap and a selected four-class at each center.  This file records the narrowest
existing ordered-cap sink for those two rows: it closes as soon as the rows
share two distinct support points outside their common cap.

The point of this scratch adapter is also diagnostic.  The continuation facts
alone do not provide the common outside pair required by the sink.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailContinuationBankMatchScratch

attribute [local instance] Classical.propDecidable

/-- Two selected four-classes centered at distinct points of one indexed cap
cannot share two distinct support points outside that cap. -/
theorem false_of_two_cap_center_rows_common_outside_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hconv : ConvexIndep A)
    {z₁ z₂ a b : ℝ²}
    (K₁ : SelectedFourClass A z₁) (K₂ : SelectedFourClass A z₂)
    (hz₁Cap : z₁ ∈ S.capByIndex i) (hz₂Cap : z₂ ∈ S.capByIndex i)
    (hzne : z₁ ≠ z₂)
    (ha₁ : a ∈ K₁.support) (hb₁ : b ∈ K₁.support)
    (ha₂ : a ∈ K₂.support) (hb₂ : b ∈ K₂.support)
    (haOutside : a ∉ S.capByIndex i)
    (hbOutside : b ∉ S.capByIndex i)
    (hab : a ≠ b) : False := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv i with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hz₁Image : z₁ ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hz₁Cap
  have hz₂Image : z₂ ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hz₂Cap
  rcases Finset.mem_image.mp hz₁Image with ⟨r, _hr, hrz₁⟩
  rcases Finset.mem_image.mp hz₂Image with ⟨s, _hs, hsz₂⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hzne
    calc
      z₁ = L.points r := hrz₁.symm
      _ = L.points s := by simp [hrs]
      _ = z₂ := hsz₂
  have haA : a ∈ A := K₁.support_subset_A ha₁
  have hbA : b ∈ A := K₁.support_subset_A hb₁
  have haOutsideImage : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOutside
  have hbOutsideImage : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOutside
  have hz₁Eq : dist z₁ a = dist z₁ b :=
    (K₁.support_eq_radius a ha₁).trans
      (K₁.support_eq_radius b hb₁).symm
  have hz₂Eq : dist z₂ a = dist z₂ b :=
    (K₂.support_eq_radius a ha₂).trans
      (K₂.support_eq_radius b hb₂).symm
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hrs' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hrz₁] using hz₁Eq)
      (by simpa [hsz₂] using hz₂Eq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hsr' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hsz₂] using hz₂Eq)
      (by simpa [hrz₁] using hz₁Eq)

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem oppApex1_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C2

private theorem oppApex2_mem_A (D : CounterexampleData) :
    D.packet.oppApex2 ∈ D.A := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using
      D.packet.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using
      D.packet.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using
      D.packet.triangle.v2_mem

private theorem oppApex2_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex2, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex2, hi] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex2, hi] using S.partition.v2_mem_C3

private theorem oppApex2_not_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∉ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v1_notin_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v2_notin_C2

/-- Specialization to the live continuation centers.  Membership in the
strict `oppCap2` region supplies the cap-center hypotheses, but a closing use
still needs two shared row points outside `oppCap2`. -/
theorem false_of_two_strictOppCap2_rows_common_outside_pair
    (D : CounterexampleData)
    {z₁ z₂ a b : ℝ²}
    (K₁ : SelectedFourClass D.A z₁) (K₂ : SelectedFourClass D.A z₂)
    (hz₁Strict :
      z₁ ∈ D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hz₂Strict :
      z₂ ∈ D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hzne : z₁ ≠ z₂)
    (ha₁ : a ∈ K₁.support) (hb₁ : b ∈ K₁.support)
    (ha₂ : a ∈ K₂.support) (hb₂ : b ∈ K₂.support)
    (haOutside : a ∉ D.packet.oppCap2)
    (hbOutside : b ∉ D.packet.oppCap2)
    (hab : a ≠ b) : False := by
  have hcap := capByIndex_oppIndex2_eq_oppCap2 D.packet
  exact false_of_two_cap_center_rows_common_outside_pair
    D.packet D.packet.oppIndex2 D.convex K₁ K₂
    (by simpa only [hcap] using (Finset.mem_sdiff.mp hz₁Strict).1)
    (by simpa only [hcap] using (Finset.mem_sdiff.mp hz₂Strict).1)
    hzne ha₁ hb₁ ha₂ hb₂
    (by simpa only [hcap] using haOutside)
    (by simpa only [hcap] using hbOutside) hab

/-- Symmetric bi-apex specialization.  A row centered at a strict
`oppCap2` point cannot contain both selected strict-`oppCap1` points of the
first-apex row.  Here the two cap centers are `z` and `oppApex1`; the common
outside pair is `a,b`. -/
theorem false_of_strictOppCap2_row_contains_firstApex_strict_pair
    (D : CounterexampleData)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    {a b z : ℝ²}
    (haParent : a ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b)
    (R : SelectedFourClass D.A z)
    (hzStrict : z ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
    (haR : a ∈ R.support) (hbR : b ∈ R.support) : False := by
  have hcap := capByIndex_oppIndex2_eq_oppCap2 D.packet
  have hzCap : z ∈ D.packet.capByIndex D.packet.oppIndex2 := by
    simpa only [hcap] using (Finset.mem_sdiff.mp hzStrict).1
  have hapexCap :
      D.packet.oppApex1 ∈ D.packet.capByIndex D.packet.oppIndex2 := by
    simpa only [hcap] using oppApex1_mem_oppCap2 D.packet
  have hz_ne_apex : z ≠ D.packet.oppApex1 := by
    intro h
    have hzNotAdjacent := (Finset.mem_sdiff.mp hzStrict).2
    apply hzNotAdjacent
    rw [h]
    exact Finset.mem_union.mpr
      (Or.inl (oppApex1_mem_surplusCap D.packet))
  have haOutside : a ∉ D.packet.capByIndex D.packet.oppIndex2 := by
    rw [hcap]
    intro haOpp2
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp haParent).2).2
      (Finset.mem_union.mpr (Or.inr haOpp2))
  have hbOutside : b ∉ D.packet.capByIndex D.packet.oppIndex2 := by
    rw [hcap]
    intro hbOpp2
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hbParent).2).2
      (Finset.mem_union.mpr (Or.inr hbOpp2))
  exact false_of_two_cap_center_rows_common_outside_pair
    D.packet D.packet.oppIndex2 D.convex R K₁
    hzCap hapexCap hz_ne_apex
    haR hbR
    (Finset.mem_inter.mp haParent).1
    (Finset.mem_inter.mp hbParent).1
    haOutside hbOutside hab

/-- Bank-matched normal form for the alternating equilateral arm.

If two strict-`oppCap2` continuation rows both contain `oppApex2`, then any
strict-`oppCap1` point occurring in one row is forced to be absent from the
other.  Otherwise the two rows would have the common outside pair consisting
of that strict point and `oppApex2`, contradicting ordered-cap uniqueness.

Thus the common-apex part of `EquilateralResidual` upgrades a one-hit pattern
to a genuinely alternating pattern; no rhombus or six-point core is needed
for this exclusion. -/
theorem common_secondApex_forces_strictOppCap1_cross_omissions
    (D : CounterexampleData)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    {a b z₁ z₂ : ℝ²}
    (haParent : a ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (R₁ : SelectedFourClass D.A z₁)
    (R₂ : SelectedFourClass D.A z₂)
    (hz₁Strict : z₁ ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hz₂Strict : z₂ ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hz₁z₂ : z₁ ≠ z₂)
    (hO₂R₁ : D.packet.oppApex2 ∈ R₁.support)
    (hO₂R₂ : D.packet.oppApex2 ∈ R₂.support)
    (haR₁ : a ∈ R₁.support)
    (hbR₂ : b ∈ R₂.support) :
    a ∉ R₂.support ∧ b ∉ R₁.support := by
  have haOutside : a ∉ D.packet.oppCap2 := by
    intro haOpp2
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp haParent).2).2
      (Finset.mem_union.mpr (Or.inr haOpp2))
  have hbOutside : b ∉ D.packet.oppCap2 := by
    intro hbOpp2
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hbParent).2).2
      (Finset.mem_union.mpr (Or.inr hbOpp2))
  have ha_ne_O₂ : a ≠ D.packet.oppApex2 := by
    intro h
    have haNotSurplus :=
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp haParent).2).2
    exact haNotSurplus (Finset.mem_union.mpr (Or.inl (by
      simpa [h] using oppApex2_mem_surplusCap D.packet)))
  have hb_ne_O₂ : b ≠ D.packet.oppApex2 := by
    intro h
    have hbNotSurplus :=
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hbParent).2).2
    exact hbNotSurplus (Finset.mem_union.mpr (Or.inl (by
      simpa [h] using oppApex2_mem_surplusCap D.packet)))
  constructor
  · intro haR₂
    exact false_of_two_strictOppCap2_rows_common_outside_pair
      D R₁ R₂ hz₁Strict hz₂Strict hz₁z₂
      haR₁ hO₂R₁ haR₂ hO₂R₂
      haOutside (oppApex2_not_mem_oppCap2 D.packet) ha_ne_O₂
  · intro hbR₁
    exact false_of_two_strictOppCap2_rows_common_outside_pair
      D R₁ R₂ hz₁Strict hz₂Strict hz₁z₂
      hbR₁ hO₂R₁ hbR₂ hO₂R₂
      hbOutside (oppApex2_not_mem_oppCap2 D.packet) hb_ne_O₂

/-- The third apparent hinge-tail equality is already a terminal by itself.
The first-apex row makes `a,b` equidistant from `oppApex1`; if they were also
equidistant from `oppApex2`, the existing two-apex reflection/escape kernel
would contradict their common non-surplus side. -/
theorem false_of_firstApex_strict_pair_equidistant_at_secondApex
    (D : CounterexampleData)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    {a b : ℝ²}
    (haParent : a ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b)
    (hO₂ :
      dist D.packet.oppApex2 b = dist D.packet.oppApex2 a) : False := by
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D D.packet
    (K₁.support_subset_A (Finset.mem_inter.mp haParent).1)
    (K₁.support_subset_A (Finset.mem_inter.mp hbParent).1)
    (fun haSurplus =>
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp haParent).2).2
        (Finset.mem_union.mpr (Or.inl haSurplus)))
    (fun hbSurplus =>
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hbParent).2).2
        (Finset.mem_union.mpr (Or.inl hbSurplus)))
    hab
    (by simpa [dist_comm] using
      K₁.support_eq_radius a (Finset.mem_inter.mp haParent).1)
    (by simpa [dist_comm] using
      K₁.support_eq_radius b (Finset.mem_inter.mp hbParent).1)
    rfl
    (by simpa [dist_comm] using hO₂)

/-- Exact equality-only bank adapter for the surviving alternating arm.

Take the equilateral hinge `(z₁,z₂,oppApex2)`.  The alternating hits
`a ∈ R₁` and `b ∈ R₂` supply the two outward spokes.  The existing
five-point hinge-cycle kernel then needs exactly three tail equalities, listed
as the final three premises below.  This theorem makes that missing producer
boundary executable rather than merely diagrammatic. -/
theorem false_of_alternating_equilateral_of_three_hinge_tail_equalities
    (D : CounterexampleData)
    {z₁ z₂ a b : ℝ²}
    (R₁ : SelectedFourClass D.A z₁)
    (R₂ : SelectedFourClass D.A z₂)
    (hz₁z₂ : z₁ ≠ z₂)
    (hz₂R₁ : z₂ ∈ R₁.support)
    (hO₂R₁ : D.packet.oppApex2 ∈ R₁.support)
    (haR₁ : a ∈ R₁.support)
    (hz₁R₂ : z₁ ∈ R₂.support)
    (hO₂R₂ : D.packet.oppApex2 ∈ R₂.support)
    (hbR₂ : b ∈ R₂.support)
    (hb_z₁_eq_ba : dist b z₁ = dist b a)
    (ha_z₂_eq_aO₂ : dist a z₂ = dist a D.packet.oppApex2)
    (hO₂b_eq_O₂a :
      dist D.packet.oppApex2 b = dist D.packet.oppApex2 a) : False := by
  apply hz₁z₂
  exact Census554.EqualityCore.five_point_hinge_cycle_collision
    (A := z₁) (B := z₂) (C := b) (D := a)
    (H := D.packet.oppApex2)
    ((R₁.support_eq_radius z₂ hz₂R₁).trans
      (R₁.support_eq_radius a haR₁).symm)
    ((R₁.support_eq_radius z₂ hz₂R₁).trans
      (R₁.support_eq_radius D.packet.oppApex2 hO₂R₁).symm)
    ((R₂.support_eq_radius z₁ hz₁R₂).trans
      (R₂.support_eq_radius b hbR₂).symm)
    ((R₂.support_eq_radius z₁ hz₁R₂).trans
      (R₂.support_eq_radius D.packet.oppApex2 hO₂R₂).symm)
    hb_z₁_eq_ba ha_z₂_eq_aO₂ hO₂b_eq_O₂a

private theorem mem_selected_support_of_deletion_blocked
    {A : Finset ℝ²} {q center : ℝ²}
    (R : SelectedFourClass A center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center) :
    q ∈ R.support := by
  by_contra hqR
  apply hblocked
  refine ⟨R.radius, R.radius_pos, ?_⟩
  calc
    4 = R.support.card := R.support_card.symm
    _ ≤ ((A.erase q).filter
        fun x => dist center x = R.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun hxq => hqR (by simpa [hxq] using hx),
              R.support_subset_A hx⟩,
          R.support_eq_radius x hx⟩

private theorem deletion_survives_of_not_mem_selected_support
    {A : Finset ℝ²} {q center : ℝ²}
    (R : SelectedFourClass A center) (hqR : q ∉ R.support) :
    HasNEquidistantPointsAt 4 (A.erase q) center := by
  refine ⟨R.radius, R.radius_pos, ?_⟩
  calc
    4 = R.support.card := R.support_card.symm
    _ ≤ ((A.erase q).filter
        fun x => dist center x = R.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun hxq => hqR (by simpa [hxq] using hx),
              R.support_subset_A hx⟩,
          R.support_eq_radius x hx⟩

/-- Clean one-center selector forced by the symmetric bi-apex packet.  At a
strict `oppCap2` support center, at least one of the two prescribed deletions
of the strict first-apex pair preserves a four-point class.  If both deletions
blocked, an arbitrary global row at `z` would contain both `a,b`, contradicting
the preceding ordered-cap sink. -/
theorem firstApex_strict_pair_deletion_survival_at_secondApex_support_center
    (D : CounterexampleData)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    (K₂ : SelectedFourClass D.A D.packet.oppApex2)
    {a b z : ℝ²}
    (haParent : a ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b)
    (hzParent : z ∈ K₂.support ∩
      (D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1))) :
    HasNEquidistantPointsAt 4 (D.A.erase a) z ∨
      HasNEquidistantPointsAt 4 (D.A.erase b) z := by
  by_cases haSurvives : HasNEquidistantPointsAt 4 (D.A.erase a) z
  · exact Or.inl haSurvives
  by_cases hbSurvives : HasNEquidistantPointsAt 4 (D.A.erase b) z
  · exact Or.inr hbSurvives
  have hzA : z ∈ D.A :=
    K₂.support_subset_A (Finset.mem_inter.mp hzParent).1
  let R : SelectedFourClass D.A z :=
    Classical.choice (exists_selectedFourClass_of_globalK4 D.K4 hzA)
  have haR : a ∈ R.support :=
    mem_selected_support_of_deletion_blocked R haSurvives
  have hbR : b ∈ R.support :=
    mem_selected_support_of_deletion_blocked R hbSurvives
  exact False.elim
    (false_of_strictOppCap2_row_contains_firstApex_strict_pair
      D K₁ haParent hbParent hab R
      (Finset.mem_inter.mp hzParent).2 haR hbR)

/-- The parent second-apex row also omits at least one member of the strict
first-apex pair, by the predecessor two-apex escape kernel.  Consequently at
least one prescribed deletion preserves K4 at `oppApex2`. -/
theorem firstApex_strict_pair_deletion_survival_at_secondApex
    (D : CounterexampleData)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    (K₂ : SelectedFourClass D.A D.packet.oppApex2)
    {a b : ℝ²}
    (haParent : a ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b) :
    HasNEquidistantPointsAt 4 (D.A.erase a) D.packet.oppApex2 ∨
      HasNEquidistantPointsAt 4 (D.A.erase b) D.packet.oppApex2 := by
  by_cases haK₂ : a ∈ K₂.support
  · have hbK₂ : b ∉ K₂.support := by
      intro hbK₂
      exact U2NonSurplusSqueeze.oppCap2_escape_gen
        D D.packet
        (K₁.support_subset_A (Finset.mem_inter.mp haParent).1)
        (K₁.support_subset_A (Finset.mem_inter.mp hbParent).1)
        (fun haSurplus =>
          (Finset.mem_sdiff.mp (Finset.mem_inter.mp haParent).2).2
            (Finset.mem_union.mpr (Or.inl haSurplus)))
        (fun hbSurplus =>
          (Finset.mem_sdiff.mp (Finset.mem_inter.mp hbParent).2).2
            (Finset.mem_union.mpr (Or.inl hbSurplus)))
        hab
        (by simpa [dist_comm] using
          K₁.support_eq_radius a (Finset.mem_inter.mp haParent).1)
        (by simpa [dist_comm] using
          K₁.support_eq_radius b (Finset.mem_inter.mp hbParent).1)
        (by simpa [dist_comm] using K₂.support_eq_radius a haK₂)
        (by simpa [dist_comm] using K₂.support_eq_radius b hbK₂)
    exact Or.inr (deletion_survives_of_not_mem_selected_support K₂ hbK₂)
  · exact Or.inl
      (deletion_survives_of_not_mem_selected_support K₂ haK₂)

/-- Two distinct centers at which one prescribed deletion survives, packaged
as exact q-deleted U5 rows.  The chosen critical-system blocker for the
deleted source avoids both centers, and the two exact supports overlap in at
most two points. -/
structure CommonDeletionTwoCenterPacket
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (q center₁ center₂ : ℝ²) where
  q_mem_A : q ∈ D.A
  center₁_mem_A : center₁ ∈ D.A
  center₂_mem_A : center₂ ∈ D.A
  centers_ne : center₁ ≠ center₂
  survives₁ : HasNEquidistantPointsAt 4 (D.A.erase q) center₁
  survives₂ : HasNEquidistantPointsAt 4 (D.A.erase q) center₂
  actual_blocker_ne_center₁ : H.centerAt q q_mem_A ≠ center₁
  actual_blocker_ne_center₂ : H.centerAt q q_mem_A ≠ center₂
  B₁ : Finset ℝ²
  B₂ : Finset ℝ²
  row₁ : U5QDeletedK4Class D q center₁ B₁
  row₂ : U5QDeletedK4Class D q center₂ B₂
  B₁_card : B₁.card = 4
  B₂_card : B₂.card = 4
  overlap_le_two : (B₁ ∩ B₂).card ≤ 2

/-- Constructor for `CommonDeletionTwoCenterPacket` from its two local
survival facts. -/
theorem nonempty_commonDeletionTwoCenterPacket
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {q center₁ center₂ : ℝ²}
    (hqA : q ∈ D.A)
    (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : center₁ ≠ center₂)
    (hsurvives₁ : HasNEquidistantPointsAt 4 (D.A.erase q) center₁)
    (hsurvives₂ : HasNEquidistantPointsAt 4 (D.A.erase q) center₂) :
    Nonempty (CommonDeletionTwoCenterPacket
      D H q center₁ center₂) := by
  have hsurvives₁' :
      HasNEquidistantPointsAt 4 (D.skeleton q) center₁ := by
    simpa [CounterexampleData.skeleton] using hsurvives₁
  have hsurvives₂' :
      HasNEquidistantPointsAt 4 (D.skeleton q) center₂ := by
    simpa [CounterexampleData.skeleton] using hsurvives₂
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hsurvives₁' with ⟨B₁, ⟨R₁⟩, hB₁⟩
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hsurvives₂' with ⟨B₂, ⟨R₂⟩, hB₂⟩
  exact ⟨
    { q_mem_A := hqA
      center₁_mem_A := hcenter₁A
      center₂_mem_A := hcenter₂A
      centers_ne := hcenters
      survives₁ := hsurvives₁
      survives₂ := hsurvives₂
      actual_blocker_ne_center₁ :=
        ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
          H hqA hsurvives₁
      actual_blocker_ne_center₂ :=
        ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
          H hqA hsurvives₂
      B₁ := B₁
      B₂ := B₂
      row₁ := R₁
      row₂ := R₂
      B₁_card := hB₁
      B₂_card := hB₂
      overlap_le_two :=
        U5QDeletedK4Class.inter_card_le_two R₁ R₂ hcenters }⟩

/-- Three centers (`oppApex2,z₁,z₂`) each survive at least one of two
deletions (`a,b`).  Hence one deletion survives at two distinct centers.
The conclusion lists the six possible center-pair/deletion choices and
packages each as exact q-deleted U5 rows with actual-blocker avoidance. -/
theorem biApex_three_center_two_deletion_coupling
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    (K₂ : SelectedFourClass D.A D.packet.oppApex2)
    {a b z₁ z₂ : ℝ²}
    (haParent : a ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b)
    (hz₁Parent : z₁ ∈ K₂.support ∩
      (D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (hz₂Parent : z₂ ∈ K₂.support ∩
      (D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (hz₁z₂ : z₁ ≠ z₂) :
    Nonempty (CommonDeletionTwoCenterPacket
      D H a D.packet.oppApex2 z₁) ∨
    Nonempty (CommonDeletionTwoCenterPacket
      D H a D.packet.oppApex2 z₂) ∨
    Nonempty (CommonDeletionTwoCenterPacket D H a z₁ z₂) ∨
    Nonempty (CommonDeletionTwoCenterPacket
      D H b D.packet.oppApex2 z₁) ∨
    Nonempty (CommonDeletionTwoCenterPacket
      D H b D.packet.oppApex2 z₂) ∨
    Nonempty (CommonDeletionTwoCenterPacket D H b z₁ z₂) := by
  have haA : a ∈ D.A :=
    K₁.support_subset_A (Finset.mem_inter.mp haParent).1
  have hbA : b ∈ D.A :=
    K₁.support_subset_A (Finset.mem_inter.mp hbParent).1
  have hz₁A : z₁ ∈ D.A :=
    K₂.support_subset_A (Finset.mem_inter.mp hz₁Parent).1
  have hz₂A : z₂ ∈ D.A :=
    K₂.support_subset_A (Finset.mem_inter.mp hz₂Parent).1
  have hO₂z₁ : D.packet.oppApex2 ≠ z₁ := by
    intro h
    apply K₂.center_not_mem
    simpa [h] using (Finset.mem_inter.mp hz₁Parent).1
  have hO₂z₂ : D.packet.oppApex2 ≠ z₂ := by
    intro h
    apply K₂.center_not_mem
    simpa [h] using (Finset.mem_inter.mp hz₂Parent).1
  have hparent := firstApex_strict_pair_deletion_survival_at_secondApex
    D K₁ K₂ haParent hbParent hab
  have hz₁ :=
    firstApex_strict_pair_deletion_survival_at_secondApex_support_center
      D K₁ K₂ haParent hbParent hab hz₁Parent
  have hz₂ :=
    firstApex_strict_pair_deletion_survival_at_secondApex_support_center
      D K₁ K₂ haParent hbParent hab hz₂Parent
  rcases hparent with haO₂ | hbO₂
  · rcases hz₁ with haZ₁ | hbZ₁
    · exact Or.inl
        (nonempty_commonDeletionTwoCenterPacket H haA
          (oppApex2_mem_A D) hz₁A hO₂z₁ haO₂ haZ₁)
    · rcases hz₂ with haZ₂ | hbZ₂
      · exact Or.inr (Or.inl
          (nonempty_commonDeletionTwoCenterPacket H haA
            (oppApex2_mem_A D) hz₂A hO₂z₂ haO₂ haZ₂))
      · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
          (nonempty_commonDeletionTwoCenterPacket H hbA
            hz₁A hz₂A hz₁z₂ hbZ₁ hbZ₂)))))
  · rcases hz₁ with haZ₁ | hbZ₁
    · rcases hz₂ with haZ₂ | hbZ₂
      · exact Or.inr (Or.inr (Or.inl
          (nonempty_commonDeletionTwoCenterPacket H haA
            hz₁A hz₂A hz₁z₂ haZ₁ haZ₂)))
      · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
          (nonempty_commonDeletionTwoCenterPacket H hbA
            (oppApex2_mem_A D) hz₂A hO₂z₂ hbO₂ hbZ₂)))))
    · exact Or.inr (Or.inr (Or.inr (Or.inl
        (nonempty_commonDeletionTwoCenterPacket H hbA
          (oppApex2_mem_A D) hz₁A hO₂z₁ hbO₂ hbZ₁))))

/-- The strict crossed orientation of the 2-by-2 deletion grid.  At `center₁`,
deleting `q₁` survives and deleting `q₂` blocks; at `center₂` the
roles reverse.  The blocked arms produce exact critical rows.  Ordered-cap
uniqueness forces each critical row to omit the other first-apex source.

The common critical system contributes the strongest unconditional fact it
can here: the actual blocker of `q₁` is not `center₁`, and the actual
blocker of `q₂` is not `center₂`.  Failure at the crossed centers does
not identify them with the chosen actual blockers. -/
structure CrossedCriticalNormalForm
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    (q₁ q₂ center₁ center₂ : ℝ²) where
  q₁_mem_A : q₁ ∈ D.A
  q₂_mem_A : q₂ ∈ D.A
  q₁_parent : q₁ ∈ K₁.support ∩
    (D.packet.oppCap1 \
      (D.packet.surplusCap ∪ D.packet.oppCap2))
  q₂_parent : q₂ ∈ K₁.support ∩
    (D.packet.oppCap1 \
      (D.packet.surplusCap ∪ D.packet.oppCap2))
  sources_ne : q₁ ≠ q₂
  center₁_strict : center₁ ∈ D.packet.oppCap2 \
    (D.packet.surplusCap ∪ D.packet.oppCap1)
  center₂_strict : center₂ ∈ D.packet.oppCap2 \
    (D.packet.surplusCap ∪ D.packet.oppCap1)
  q₁_survives_at_center₁ :
    HasNEquidistantPointsAt 4 (D.A.erase q₁) center₁
  q₂_blocks_at_center₁ :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase q₂) center₁
  q₂_survives_at_center₂ :
    HasNEquidistantPointsAt 4 (D.A.erase q₂) center₂
  q₁_blocks_at_center₂ :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase q₁) center₂
  actual_q₁_blocker_ne_center₁ :
    H.centerAt q₁ q₁_mem_A ≠ center₁
  actual_q₂_blocker_ne_center₂ :
    H.centerAt q₂ q₂_mem_A ≠ center₂
  q₂CriticalAtCenter₁ :
    CriticalSelectedFourClass D.A q₂ center₁
  q₁CriticalAtCenter₂ :
    CriticalSelectedFourClass D.A q₁ center₂
  q₁_not_mem_center₁Critical :
    q₁ ∉ q₂CriticalAtCenter₁.toCriticalFourShell.support
  q₂_not_mem_center₂Critical :
    q₂ ∉ q₁CriticalAtCenter₂.toCriticalFourShell.support

/-- Kernel constructor for the strict crossed normal form. -/
theorem nonempty_crossedCriticalNormalForm
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    {q₁ q₂ center₁ center₂ : ℝ²}
    (hq₁Parent : q₁ ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hq₂Parent : q₂ ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hq₁q₂ : q₁ ≠ q₂)
    (hcenter₁Strict : center₁ ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hcenter₂Strict : center₂ ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hq₁Survives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase q₁) center₁)
    (hq₂Blocks₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q₂) center₁)
    (hq₂Survives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase q₂) center₂)
    (hq₁Blocks₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q₁) center₂) :
    Nonempty (CrossedCriticalNormalForm
      D H K₁ q₁ q₂ center₁ center₂) := by
  have hq₁A : q₁ ∈ D.A :=
    K₁.support_subset_A (Finset.mem_inter.mp hq₁Parent).1
  have hq₂A : q₂ ∈ D.A :=
    K₁.support_subset_A (Finset.mem_inter.mp hq₂Parent).1
  have hcenter₁A : center₁ ∈ D.A := by
    have hcap := capByIndex_oppIndex2_eq_oppCap2 D.packet
    apply D.packet.capByIndex_subset D.packet.oppIndex2
    simpa only [hcap] using (Finset.mem_sdiff.mp hcenter₁Strict).1
  have hcenter₂A : center₂ ∈ D.A := by
    have hcap := capByIndex_oppIndex2_eq_oppCap2 D.packet
    apply D.packet.capByIndex_subset D.packet.oppIndex2
    simpa only [hcap] using (Finset.mem_sdiff.mp hcenter₂Strict).1
  have hcenter₁_ne_q₂ : center₁ ≠ q₂ := by
    intro h
    have hq₂NotOpp2 :=
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hq₂Parent).2).2
    apply hq₂NotOpp2
    exact Finset.mem_union.mpr (Or.inr (by
      rw [← h]
      exact (Finset.mem_sdiff.mp hcenter₁Strict).1))
  have hcenter₂_ne_q₁ : center₂ ≠ q₁ := by
    intro h
    have hq₁NotOpp2 :=
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hq₁Parent).2).2
    apply hq₁NotOpp2
    exact Finset.mem_union.mpr (Or.inr (by
      rw [← h]
      exact (Finset.mem_sdiff.mp hcenter₂Strict).1))
  let C₂₁ : CriticalSelectedFourClass D.A q₂ center₁ :=
    Classical.choice
      (ATAILStageOnePrescribedApexDichotomy.criticalSelectedFourClass_at_of_no_qfree
          D.K4 hcenter₁A hcenter₁_ne_q₂ hq₂Blocks₁)
  let C₁₂ : CriticalSelectedFourClass D.A q₁ center₂ :=
    Classical.choice
      (ATAILStageOnePrescribedApexDichotomy.criticalSelectedFourClass_at_of_no_qfree
          D.K4 hcenter₂A hcenter₂_ne_q₁ hq₁Blocks₂)
  have hq₁NotC₂₁ : q₁ ∉ C₂₁.toCriticalFourShell.support := by
    intro hq₁C
    exact false_of_strictOppCap2_row_contains_firstApex_strict_pair
      D K₁ hq₁Parent hq₂Parent hq₁q₂
      C₂₁.toSelectedFourClass hcenter₁Strict hq₁C
      C₂₁.toCriticalFourShell.q_mem_support
  have hq₂NotC₁₂ : q₂ ∉ C₁₂.toCriticalFourShell.support := by
    intro hq₂C
    exact false_of_strictOppCap2_row_contains_firstApex_strict_pair
      D K₁ hq₁Parent hq₂Parent hq₁q₂
      C₁₂.toSelectedFourClass hcenter₂Strict
      C₁₂.toCriticalFourShell.q_mem_support hq₂C
  exact ⟨
    { q₁_mem_A := hq₁A
      q₂_mem_A := hq₂A
      q₁_parent := hq₁Parent
      q₂_parent := hq₂Parent
      sources_ne := hq₁q₂
      center₁_strict := hcenter₁Strict
      center₂_strict := hcenter₂Strict
      q₁_survives_at_center₁ := hq₁Survives₁
      q₂_blocks_at_center₁ := hq₂Blocks₁
      q₂_survives_at_center₂ := hq₂Survives₂
      q₁_blocks_at_center₂ := hq₁Blocks₂
      actual_q₁_blocker_ne_center₁ :=
        ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
            H hq₁A hq₁Survives₁
      actual_q₂_blocker_ne_center₂ :=
        ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
            H hq₂A hq₂Survives₂
      q₂CriticalAtCenter₁ := C₂₁
      q₁CriticalAtCenter₂ := C₁₂
      q₁_not_mem_center₁Critical := hq₁NotC₂₁
      q₂_not_mem_center₂Critical := hq₂NotC₁₂ }⟩

/-- Exclusive 2-by-2 normal form.  A same-column arm gives two exact
q-deleted U5 rows at `z₁,z₂`; otherwise the two centers have opposite
unique deletion choices and give a pair of exact critical rows with forced
cross omissions. -/
theorem biApex_two_by_two_survival_normal_form
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (K₁ : SelectedFourClass D.A D.packet.oppApex1)
    (K₂ : SelectedFourClass D.A D.packet.oppApex2)
    {a b z₁ z₂ : ℝ²}
    (haParent : a ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K₁.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b)
    (hz₁Parent : z₁ ∈ K₂.support ∩
      (D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (hz₂Parent : z₂ ∈ K₂.support ∩
      (D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (hz₁z₂ : z₁ ≠ z₂) :
    Nonempty (CommonDeletionTwoCenterPacket D H a z₁ z₂) ∨
    Nonempty (CommonDeletionTwoCenterPacket D H b z₁ z₂) ∨
    Nonempty (CrossedCriticalNormalForm D H K₁ a b z₁ z₂) ∨
    Nonempty (CrossedCriticalNormalForm D H K₁ b a z₁ z₂) := by
  have haA : a ∈ D.A :=
    K₁.support_subset_A (Finset.mem_inter.mp haParent).1
  have hbA : b ∈ D.A :=
    K₁.support_subset_A (Finset.mem_inter.mp hbParent).1
  have hz₁A : z₁ ∈ D.A :=
    K₂.support_subset_A (Finset.mem_inter.mp hz₁Parent).1
  have hz₂A : z₂ ∈ D.A :=
    K₂.support_subset_A (Finset.mem_inter.mp hz₂Parent).1
  have h₁ :=
    firstApex_strict_pair_deletion_survival_at_secondApex_support_center
      D K₁ K₂ haParent hbParent hab hz₁Parent
  have h₂ :=
    firstApex_strict_pair_deletion_survival_at_secondApex_support_center
      D K₁ K₂ haParent hbParent hab hz₂Parent
  rcases h₁ with ha₁ | hb₁
  · rcases h₂ with ha₂ | hb₂
    · exact Or.inl
        (nonempty_commonDeletionTwoCenterPacket H haA
          hz₁A hz₂A hz₁z₂ ha₁ ha₂)
    · by_cases hb₁' :
        HasNEquidistantPointsAt 4 (D.A.erase b) z₁
      · exact Or.inr (Or.inl
          (nonempty_commonDeletionTwoCenterPacket H hbA
            hz₁A hz₂A hz₁z₂ hb₁' hb₂))
      · by_cases ha₂' :
          HasNEquidistantPointsAt 4 (D.A.erase a) z₂
        · exact Or.inl
            (nonempty_commonDeletionTwoCenterPacket H haA
              hz₁A hz₂A hz₁z₂ ha₁ ha₂')
        · exact Or.inr (Or.inr (Or.inl
            (nonempty_crossedCriticalNormalForm H K₁
              haParent hbParent hab
              (Finset.mem_inter.mp hz₁Parent).2
              (Finset.mem_inter.mp hz₂Parent).2
              ha₁ hb₁' hb₂ ha₂')))
  · rcases h₂ with ha₂ | hb₂
    · by_cases ha₁' :
        HasNEquidistantPointsAt 4 (D.A.erase a) z₁
      · exact Or.inl
          (nonempty_commonDeletionTwoCenterPacket H haA
            hz₁A hz₂A hz₁z₂ ha₁' ha₂)
      · by_cases hb₂' :
          HasNEquidistantPointsAt 4 (D.A.erase b) z₂
        · exact Or.inr (Or.inl
            (nonempty_commonDeletionTwoCenterPacket H hbA
              hz₁A hz₂A hz₁z₂ hb₁ hb₂'))
        · exact Or.inr (Or.inr (Or.inr
            (nonempty_crossedCriticalNormalForm H K₁
              hbParent haParent hab.symm
              (Finset.mem_inter.mp hz₁Parent).2
              (Finset.mem_inter.mp hz₂Parent).2
              hb₁ ha₁' ha₂ hb₂')))
    · exact Or.inr (Or.inl
        (nonempty_commonDeletionTwoCenterPacket H hbA
          hz₁A hz₂A hz₁z₂ hb₁ hb₂))

#print axioms false_of_two_cap_center_rows_common_outside_pair
#print axioms false_of_two_strictOppCap2_rows_common_outside_pair
#print axioms false_of_strictOppCap2_row_contains_firstApex_strict_pair
#print axioms common_secondApex_forces_strictOppCap1_cross_omissions
#print axioms false_of_firstApex_strict_pair_equidistant_at_secondApex
#print axioms false_of_alternating_equilateral_of_three_hinge_tail_equalities
#print axioms
  firstApex_strict_pair_deletion_survival_at_secondApex_support_center
#print axioms firstApex_strict_pair_deletion_survival_at_secondApex
#print axioms nonempty_commonDeletionTwoCenterPacket
#print axioms biApex_three_center_two_deletion_coupling
#print axioms nonempty_crossedCriticalNormalForm
#print axioms biApex_two_by_two_survival_normal_form

end ATailContinuationBankMatchScratch
end Problem97
