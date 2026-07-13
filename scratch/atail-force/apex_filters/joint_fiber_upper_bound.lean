import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# ATAIL double-apex joint-fiber upper bound

The Route-B reflection/sign sink says more than that one extracted pair is
impossible: every fixed double-apex radius fiber on the non-surplus side has
cardinality at most one.  This scratch theorem records that exact finite-set
form so proposed ATAIL producers can be checked against the true geometry.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1LargeCapRouteBTailMetricResidualTarget
namespace U2NonSurplusSqueeze

private theorem two_le_inter_third_of_four_le_of_cover_two_one_hits
    {α : Type*} [DecidableEq α] {T A B C : Finset α}
    (hfour : 4 ≤ T.card) (hcover : T ⊆ A ∪ B ∪ C)
    (honeA : (T ∩ A).card ≤ 1) (honeB : (T ∩ B).card ≤ 1) :
    2 ≤ (T ∩ C).card := by
  have hsub : T ⊆ (T ∩ A) ∪ (T ∩ B) ∪ (T ∩ C) := by
    intro x hxT
    have hx := hcover hxT
    simp only [Finset.mem_union] at hx ⊢
    rcases hx with (hxA | hxB) | hxC
    · exact Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxA⟩))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxB⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC⟩)
  have hcard := Finset.card_le_card hsub
  have hu1 := Finset.card_union_le (T ∩ A) (T ∩ B)
  have hu2 := Finset.card_union_le ((T ∩ A) ∪ (T ∩ B)) (T ∩ C)
  omega

/-- A fixed pair of opposite-apex radii has at most one carrier realization
outside the surplus cap. -/
theorem doubleApexJointFiber_sdiff_surplus_card_le_one
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r ρ : ℝ) :
    (((D.A.filter fun x => dist x S.oppApex1 = r) ∩
        (D.A.filter fun x => dist x S.oppApex2 = ρ)) \
          S.surplusCap).card ≤ 1 := by
  classical
  rw [Finset.card_le_one]
  intro x hx w hw
  by_contra hxw
  have hx' := Finset.mem_sdiff.mp hx
  have hw' := Finset.mem_sdiff.mp hw
  have hxFilters := Finset.mem_inter.mp hx'.1
  have hwFilters := Finset.mem_inter.mp hw'.1
  have hx1 := Finset.mem_filter.mp hxFilters.1
  have hx2 := Finset.mem_filter.mp hxFilters.2
  have hw1 := Finset.mem_filter.mp hwFilters.1
  have hw2 := Finset.mem_filter.mp hwFilters.2
  exact oppCap2_escape_gen D S
    hx1.1 hw1.1 hx'.2 hw'.2 hxw hx1.2 hw1.2 hx2.2 hw2.2

/-- Repacketing the carrier with the leaf's surplus packet transfers the
existing endpoint one-hit theorem.  Consequently a K4 radius at the first
opposite apex has at least three representatives outside the surplus cap. -/
theorem exists_oppApex1_radius_three_le_sdiff_surplus
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card := by
  classical
  have hapex : S.oppApex1 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem
  obtain ⟨r, hr, hfour'⟩ := D.K4 S.oppApex1 hapex
  have hfour :
      4 ≤ (D.A.filter fun x => dist x S.oppApex1 = r).card := by
    simpa [dist_comm] using hfour'
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hone :
      (((D.A.filter fun x => dist x S.oppApex1 = r) ∩
        S.surplusCap).card ≤ 1) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have hsplit :
      ((D.A.filter fun x => dist x S.oppApex1 = r) \
          S.surplusCap).card +
        ((D.A.filter fun x => dist x S.oppApex1 = r) ∩
          S.surplusCap).card =
        (D.A.filter fun x => dist x S.oppApex1 = r).card :=
    Finset.card_sdiff_add_card_inter _ _
  exact ⟨r, hr, by omega⟩

/-- Symmetric three-off-surplus marginal bound for the second opposite apex. -/
theorem exists_oppApex2_radius_three_le_sdiff_surplus
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      3 ≤ ((D.A.filter fun x => dist x S.oppApex2 = r) \
        S.surplusCap).card := by
  classical
  have hapex : S.oppApex2 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem
  obtain ⟨r, hr, hfour'⟩ := D.K4 S.oppApex2 hapex
  have hfour :
      4 ≤ (D.A.filter fun x => dist x S.oppApex2 = r).card := by
    simpa [dist_comm] using hfour'
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hone :
      (((D.A.filter fun x => dist x S.oppApex2 = r) ∩
        S.surplusCap).card ≤ 1) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit DS r
  have hsplit :
      ((D.A.filter fun x => dist x S.oppApex2 = r) \
          S.surplusCap).card +
        ((D.A.filter fun x => dist x S.oppApex2 = r) ∩
          S.surplusCap).card =
        (D.A.filter fun x => dist x S.oppApex2 = r).card :=
    Finset.card_sdiff_add_card_inter _ _
  exact ⟨r, hr, by omega⟩

/-- A first-apex K4 radius has at least two points in the strict interior of
its own opposite cap.  This transfers the existing U2 cover and both adjacent
one-hit bounds to an arbitrary leaf packet by repacketing `D`. -/
theorem exists_oppApex1_radius_two_le_own_strict_interior
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      2 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) ∩
        (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card := by
  classical
  have hapex : S.oppApex1 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem
  obtain ⟨r, hr, hfour'⟩ := D.K4 S.oppApex1 hapex
  have hfour :
      4 ≤ (D.A.filter fun x => dist x S.oppApex1 = r).card := by
    simpa [dist_comm] using hfour'
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hcover :
      (D.A.filter fun x => dist x S.oppApex1 = r) ⊆
        S.surplusCap ∪ S.oppCap2 ∪
          (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover DS r
  have honeSurplus :
      (((D.A.filter fun x => dist x S.oppApex1 = r) ∩
        S.surplusCap).card ≤ 1) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS r
  have honeOther :
      (((D.A.filter fun x => dist x S.oppApex1 = r) ∩
        S.oppCap2).card ≤ 1) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS r
  exact ⟨r, hr,
    two_le_inter_third_of_four_le_of_cover_two_one_hits
      hfour hcover honeSurplus honeOther⟩

/-- Symmetric strict-own-cap interior lower bound for the second apex. -/
theorem exists_oppApex2_radius_two_le_own_strict_interior
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      2 ≤ ((D.A.filter fun x => dist x S.oppApex2 = r) ∩
        (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))).card := by
  classical
  have hapex : S.oppApex2 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem
  obtain ⟨r, hr, hfour'⟩ := D.K4 S.oppApex2 hapex
  have hfour :
      4 ≤ (D.A.filter fun x => dist x S.oppApex2 = r).card := by
    simpa [dist_comm] using hfour'
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hcover :
      (D.A.filter fun x => dist x S.oppApex2 = r) ⊆
        S.surplusCap ∪ S.oppCap1 ∪
          (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex2_exactRadiusClass_cover DS r
  have honeSurplus :
      (((D.A.filter fun x => dist x S.oppApex2 = r) ∩
        S.surplusCap).card ≤ 1) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit DS r
  have honeOther :
      (((D.A.filter fun x => dist x S.oppApex2 = r) ∩
        S.oppCap1).card ≤ 1) := by
    simpa [DS] using
      Problem97.U2NonSurplusSqueeze.oppApex2_otherCap_one_hit DS r
  exact ⟨r, hr,
    two_le_inter_third_of_four_le_of_cover_two_one_hits
      hfour hcover honeSurplus honeOther⟩

/-- The opposite-apex distance is injective on every fixed first-apex radius
class after removing the surplus cap.  Thus the three-point marginal supplied
by K4 has at least three *distinct* second-apex radii, rather than a small
two-value image that could drive pigeonhole. -/
theorem exists_oppApex1_radius_three_le_oppApex2_distance_image
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      3 ≤ (((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).image fun x => dist x S.oppApex2).card := by
  classical
  obtain ⟨r, hr, hthree⟩ :=
    exists_oppApex1_radius_three_le_sdiff_surplus D S
  let T := (D.A.filter fun x => dist x S.oppApex1 = r) \
    S.surplusCap
  have hinj : Set.InjOn (fun x => dist x S.oppApex2) T := by
    intro x hx w hw heq
    by_contra hxw
    have hx' := Finset.mem_sdiff.mp hx
    have hw' := Finset.mem_sdiff.mp hw
    have hxFilter := Finset.mem_filter.mp hx'.1
    have hwFilter := Finset.mem_filter.mp hw'.1
    exact oppCap2_escape_gen D S
      hxFilter.1 hwFilter.1 hx'.2 hw'.2 hxw
      hxFilter.2 hwFilter.2 rfl heq.symm
  refine ⟨r, hr, ?_⟩
  calc
    3 ≤ T.card := by simpa [T] using hthree
    _ = (T.image fun x => dist x S.oppApex2).card := by
      symm
      exact Finset.card_image_of_injOn hinj

/-- Symmetric distinct-opposite-radius conclusion for a second-apex K4
marginal. -/
theorem exists_oppApex2_radius_three_le_oppApex1_distance_image
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ ρ : ℝ, 0 < ρ ∧
      3 ≤ (((D.A.filter fun x => dist x S.oppApex2 = ρ) \
        S.surplusCap).image fun x => dist x S.oppApex1).card := by
  classical
  obtain ⟨ρ, hρ, hthree⟩ :=
    exists_oppApex2_radius_three_le_sdiff_surplus D S
  let T := (D.A.filter fun x => dist x S.oppApex2 = ρ) \
    S.surplusCap
  have hinj : Set.InjOn (fun x => dist x S.oppApex1) T := by
    intro x hx w hw heq
    by_contra hxw
    have hx' := Finset.mem_sdiff.mp hx
    have hw' := Finset.mem_sdiff.mp hw
    have hxFilter := Finset.mem_filter.mp hx'.1
    have hwFilter := Finset.mem_filter.mp hw'.1
    exact oppCap2_escape_gen D S
      hxFilter.1 hwFilter.1 hx'.2 hw'.2 hxw
      rfl heq.symm hxFilter.2 hwFilter.2
  refine ⟨ρ, hρ, ?_⟩
  calc
    3 ≤ T.card := by simpa [T] using hthree
    _ = (T.image fun x => dist x S.oppApex1).card := by
      symm
      exact Finset.card_image_of_injOn hinj

end U2NonSurplusSqueeze
end U1LargeCapRouteBTailMetricResidualTarget
end Problem97
