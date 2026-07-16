import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Scratch: symmetric opposite-apex K4 continuation

This file isolates the symmetric all-center-K4 consequence at both opposite
apices.  It then gives the exact deletion/membership split for a strict pair
from the first-apex class against one selected row centered at a strict point
of the second opposite cap.

The split deliberately does not use the retained frontier sources: their
membership in a particular opposite cap is not part of the current production
interface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace BiapexContinuationGridScratch

attribute [local instance] Classical.propDecidable

private theorem two_le_third_inter_of_card_four
    {alpha : Type _} [DecidableEq alpha]
    {T B₁ B₂ I : Finset alpha}
    (hcard : T.card = 4)
    (hcover : T ⊆ B₁ ∪ B₂ ∪ I)
    (hB₁ : (T ∩ B₁).card ≤ 1)
    (hB₂ : (T ∩ B₂).card ≤ 1) :
    2 ≤ (T ∩ I).card := by
  have hdecomp : T = (T ∩ B₁) ∪ (T ∩ B₂) ∪ (T ∩ I) := by
    ext x
    constructor
    · intro hxT
      have hx := hcover hxT
      simp only [Finset.mem_union, Finset.mem_inter] at hx ⊢
      rcases hx with (hxB₁ | hxB₂) | hxI
      · exact Or.inl (Or.inl ⟨hxT, hxB₁⟩)
      · exact Or.inl (Or.inr ⟨hxT, hxB₂⟩)
      · exact Or.inr ⟨hxT, hxI⟩
    · intro hx
      simp only [Finset.mem_union, Finset.mem_inter] at hx
      rcases hx with (hxB₁ | hxB₂) | hxI
      · exact hxB₁.1
      · exact hxB₂.1
      · exact hxI.1
  have hcard_le :
      T.card ≤ (T ∩ B₁).card + (T ∩ B₂).card + (T ∩ I).card := by
    calc
      T.card = (((T ∩ B₁) ∪ (T ∩ B₂)) ∪ (T ∩ I)).card := by
        exact congrArg Finset.card hdecomp
      _ ≤ ((T ∩ B₁) ∪ (T ∩ B₂)).card + (T ∩ I).card :=
        Finset.card_union_le _ _
      _ ≤ ((T ∩ B₁).card + (T ∩ B₂).card) + (T ∩ I).card :=
        Nat.add_le_add_right (Finset.card_union_le _ _) _
      _ = (T ∩ B₁).card + (T ∩ B₂).card + (T ∩ I).card := by
        rw [Nat.add_assoc]
  omega

private theorem oppApex1_mem_A (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.A := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using D.packet.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using D.packet.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using D.packet.triangle.v1_mem

private theorem oppApex2_mem_A (D : CounterexampleData) :
    D.packet.oppApex2 ∈ D.A := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using D.packet.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using D.packet.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using D.packet.triangle.v2_mem

private theorem oppApex1_mem_surplusCap (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.packet.surplusCap := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v2_mem_C1
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v1_mem_C3

private theorem oppApex2_mem_surplusCap (D : CounterexampleData) :
    D.packet.oppApex2 ∈ D.packet.surplusCap := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v2_mem_C3

private theorem oppApex1_mem_oppCap2 (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.packet.oppCap2 := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v1_mem_C2

private theorem oppApex2_mem_oppCap1 (D : CounterexampleData) :
    D.packet.oppApex2 ∈ D.packet.oppCap1 := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.oppCap1, hi] using
      D.packet.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.oppCap1, hi] using
      D.packet.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.oppCap1, hi] using
      D.packet.partition.v2_mem_C1

private theorem capByIndex_oppIndex2_eq_oppCap2 (D : CounterexampleData) :
    D.packet.capByIndex D.packet.oppIndex2 = D.packet.oppCap2 := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1 (D : CounterexampleData) :
    D.packet.capByIndex D.packet.oppIndex1 = D.packet.oppCap1 := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

/-- A first-apex selected four-class has at least two support points in the
part of the first opposite cap outside both adjacent closed caps. -/
theorem firstApex_support_strictInterior_card_ge_two
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex1) :
    2 ≤ (K.support ∩
      (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2))).card := by
  let F := D.A.filter fun x => dist x D.packet.oppApex1 = K.radius
  have hsupportF : K.support ⊆ F := by
    intro x hx
    exact Finset.mem_filter.mpr
      ⟨K.support_subset_A hx, by simpa [dist_comm] using K.support_eq_radius x hx⟩
  have hcover : K.support ⊆
      D.packet.surplusCap ∪ D.packet.oppCap2 ∪
        (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)) :=
    fun _ hx => U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover
      D K.radius (hsupportF hx)
  have hsurplus : (K.support ∩ D.packet.surplusCap).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.surplusCap).card ≤
          (F ∩ D.packet.surplusCap).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit D K.radius
  have hother : (K.support ∩ D.packet.oppCap2).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.oppCap2).card ≤
          (F ∩ D.packet.oppCap2).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex1_otherCap_one_hit D K.radius
  exact two_le_third_inter_of_card_four K.support_card hcover hsurplus hother

/-- The second-apex counterpart of
`firstApex_support_strictInterior_card_ge_two`. -/
theorem secondApex_support_strictInterior_card_ge_two
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2) :
    2 ≤ (K.support ∩
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1))).card := by
  let F := D.A.filter fun x => dist x D.packet.oppApex2 = K.radius
  have hsupportF : K.support ⊆ F := by
    intro x hx
    exact Finset.mem_filter.mpr
      ⟨K.support_subset_A hx, by simpa [dist_comm] using K.support_eq_radius x hx⟩
  have hcover : K.support ⊆
      D.packet.surplusCap ∪ D.packet.oppCap1 ∪
        (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)) :=
    fun _ hx => U2NonSurplusSqueeze.oppApex2_exactRadiusClass_cover
      D K.radius (hsupportF hx)
  have hsurplus : (K.support ∩ D.packet.surplusCap).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.surplusCap).card ≤
          (F ∩ D.packet.surplusCap).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit D K.radius
  have hother : (K.support ∩ D.packet.oppCap1).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.oppCap1).card ≤
          (F ∩ D.packet.oppCap1).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1, (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex2_otherCap_one_hit D K.radius
  exact two_le_third_inter_of_card_four K.support_card hcover hsurplus hother

/-- Four named strict centers and their all-center-K4 rows, chosen
symmetrically from selected classes at the two opposite apices. -/
structure TwoOppositeApexContinuationRows (D : CounterexampleData) where
  firstApexClass : SelectedFourClass D.A D.packet.oppApex1
  secondApexClass : SelectedFourClass D.A D.packet.oppApex2
  first1 : ℝ²
  first2 : ℝ²
  second1 : ℝ²
  second2 : ℝ²
  first1_mem : first1 ∈ firstApexClass.support ∩
    (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2))
  first2_mem : first2 ∈ firstApexClass.support ∩
    (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2))
  first_ne : first1 ≠ first2
  second1_mem : second1 ∈ secondApexClass.support ∩
    (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1))
  second2_mem : second2 ∈ secondApexClass.support ∩
    (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1))
  second_ne : second1 ≠ second2
  classAtFirst1 : SelectedFourClass D.A first1
  classAtFirst2 : SelectedFourClass D.A first2
  classAtSecond1 : SelectedFourClass D.A second1
  classAtSecond2 : SelectedFourClass D.A second2

private theorem exists_two_distinct_of_two_le_card
    {alpha : Type _} [DecidableEq alpha] {T : Finset alpha}
    (hT : 2 ≤ T.card) :
    ∃ a b, a ∈ T ∧ b ∈ T ∧ a ≠ b := by
  rcases Finset.one_lt_card.mp (by omega : 1 < T.card) with
    ⟨a, ha, b, hb, hab⟩
  exact ⟨a, b, ha, hb, hab⟩

/-- Global K4 chooses the full symmetric four-center continuation data. -/
theorem exists_twoOppositeApexContinuationRows (D : CounterexampleData) :
    Nonempty (TwoOppositeApexContinuationRows D) := by
  let K₁ : SelectedFourClass D.A D.packet.oppApex1 :=
    Classical.choice
      (exists_selectedFourClass_of_globalK4 D.K4 (oppApex1_mem_A D))
  let K₂ : SelectedFourClass D.A D.packet.oppApex2 :=
    Classical.choice
      (exists_selectedFourClass_of_globalK4 D.K4 (oppApex2_mem_A D))
  rcases exists_two_distinct_of_two_le_card
      (firstApex_support_strictInterior_card_ge_two D K₁) with
    ⟨a, b, ha, hb, hab⟩
  rcases exists_two_distinct_of_two_le_card
      (secondApex_support_strictInterior_card_ge_two D K₂) with
    ⟨c, d, hc, hd, hcd⟩
  let Ka : SelectedFourClass D.A a := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4
      (K₁.support_subset_A (Finset.mem_inter.mp ha).1))
  let Kb : SelectedFourClass D.A b := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4
      (K₁.support_subset_A (Finset.mem_inter.mp hb).1))
  let Kc : SelectedFourClass D.A c := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4
      (K₂.support_subset_A (Finset.mem_inter.mp hc).1))
  let Kd : SelectedFourClass D.A d := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4
      (K₂.support_subset_A (Finset.mem_inter.mp hd).1))
  exact ⟨{
    firstApexClass := K₁
    secondApexClass := K₂
    first1 := a
    first2 := b
    second1 := c
    second2 := d
    first1_mem := ha
    first2_mem := hb
    first_ne := hab
    second1_mem := hc
    second2_mem := hd
    second_ne := hcd
    classAtFirst1 := Ka
    classAtFirst2 := Kb
    classAtSecond1 := Kc
    classAtSecond2 := Kd }⟩

private theorem false_of_two_indexedCap_centers_share_outsidePair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {center₁ center₂ a b : ℝ²}
    (hcenter₁ : center₁ ∈ S.capByIndex i)
    (hcenter₂ : center₂ ∈ S.capByIndex i)
    (hcenters : center₁ ≠ center₂)
    (haA : a ∈ A) (hbA : b ∈ A)
    (haOutside : a ∉ S.capByIndex i)
    (hbOutside : b ∉ S.capByIndex i)
    (hab : a ≠ b)
    (h₁ : dist center₁ a = dist center₁ b)
    (h₂ : dist center₂ a = dist center₂ b) : False := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv i with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcenter₁Image : center₁ ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenter₁
  have hcenter₂Image : center₂ ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenter₂
  rcases Finset.mem_image.mp hcenter₁Image with ⟨r, _hr, hr⟩
  rcases Finset.mem_image.mp hcenter₂Image with ⟨s, _hs, hs⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hcenters
    rw [← hr, ← hs, hrs]
  have haOutsideImage : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOutside
  have hbOutsideImage : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOutside
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hrs' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hr] using h₁) (by simpa [hs] using h₂)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hsr' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hs] using h₂) (by simpa [hr] using h₁)

/-- A strict pair chosen from the first-apex class cannot both occur in a row
centered at a strict point of the second opposite cap. -/
theorem first_strictPair_not_both_mem_secondContinuation
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D)
    {z : ℝ²}
    (hz : z ∈ G.secondApexClass.support ∩
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (Kz : SelectedFourClass D.A z) :
    ¬ (G.first1 ∈ Kz.support ∧ G.first2 ∈ Kz.support) := by
  intro hboth
  have hcap := capByIndex_oppIndex2_eq_oppCap2 D
  have hcenter₁ :
      D.packet.oppApex1 ∈ D.packet.capByIndex D.packet.oppIndex2 := by
    rw [hcap]
    exact oppApex1_mem_oppCap2 D
  have hcenter₂ : z ∈ D.packet.capByIndex D.packet.oppIndex2 := by
    rw [hcap]
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).1
  have hzNotSurplus : z ∉ D.packet.surplusCap := by
    intro hzSurplus
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).2
      (Finset.mem_union.mpr (Or.inl hzSurplus))
  have hcenters : D.packet.oppApex1 ≠ z := by
    intro h
    apply hzNotSurplus
    simpa [h] using oppApex1_mem_surplusCap D
  have hfirst1A : G.first1 ∈ D.A :=
    G.firstApexClass.support_subset_A (Finset.mem_inter.mp G.first1_mem).1
  have hfirst2A : G.first2 ∈ D.A :=
    G.firstApexClass.support_subset_A (Finset.mem_inter.mp G.first2_mem).1
  have hfirst1Outside :
      G.first1 ∉ D.packet.capByIndex D.packet.oppIndex2 := by
    rw [hcap]
    exact fun hmem =>
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.first1_mem).2).2
        (Finset.mem_union.mpr (Or.inr hmem))
  have hfirst2Outside :
      G.first2 ∉ D.packet.capByIndex D.packet.oppIndex2 := by
    rw [hcap]
    exact fun hmem =>
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.first2_mem).2).2
        (Finset.mem_union.mpr (Or.inr hmem))
  exact false_of_two_indexedCap_centers_share_outsidePair
    D.packet D.convex D.packet.oppIndex2 hcenter₁ hcenter₂ hcenters
    hfirst1A hfirst2A hfirst1Outside hfirst2Outside G.first_ne
    ((G.firstApexClass.support_eq_radius G.first1
      (Finset.mem_inter.mp G.first1_mem).1).trans
      (G.firstApexClass.support_eq_radius G.first2
        (Finset.mem_inter.mp G.first2_mem).1).symm)
    ((Kz.support_eq_radius G.first1 hboth.1).trans
      (Kz.support_eq_radius G.first2 hboth.2).symm)

/-- The symmetric outside-pair terminal: a strict pair chosen from the
second-apex class cannot both occur in a row centered at a strict point of the
first opposite cap. -/
theorem second_strictPair_not_both_mem_firstContinuation
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D)
    {z : ℝ²}
    (hz : z ∈ G.firstApexClass.support ∩
      (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (Kz : SelectedFourClass D.A z) :
    ¬ (G.second1 ∈ Kz.support ∧ G.second2 ∈ Kz.support) := by
  intro hboth
  have hcap := capByIndex_oppIndex1_eq_oppCap1 D
  have hcenter₁ :
      D.packet.oppApex2 ∈ D.packet.capByIndex D.packet.oppIndex1 := by
    rw [hcap]
    exact oppApex2_mem_oppCap1 D
  have hcenter₂ : z ∈ D.packet.capByIndex D.packet.oppIndex1 := by
    rw [hcap]
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).1
  have hzNotSurplus : z ∉ D.packet.surplusCap := by
    intro hzSurplus
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).2
      (Finset.mem_union.mpr (Or.inl hzSurplus))
  have hcenters : D.packet.oppApex2 ≠ z := by
    intro h
    apply hzNotSurplus
    simpa [h] using oppApex2_mem_surplusCap D
  have hsecond1A : G.second1 ∈ D.A :=
    G.secondApexClass.support_subset_A (Finset.mem_inter.mp G.second1_mem).1
  have hsecond2A : G.second2 ∈ D.A :=
    G.secondApexClass.support_subset_A (Finset.mem_inter.mp G.second2_mem).1
  have hsecond1Outside :
      G.second1 ∉ D.packet.capByIndex D.packet.oppIndex1 := by
    rw [hcap]
    exact fun hmem =>
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.second1_mem).2).2
        (Finset.mem_union.mpr (Or.inr hmem))
  have hsecond2Outside :
      G.second2 ∉ D.packet.capByIndex D.packet.oppIndex1 := by
    rw [hcap]
    exact fun hmem =>
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.second2_mem).2).2
        (Finset.mem_union.mpr (Or.inr hmem))
  exact false_of_two_indexedCap_centers_share_outsidePair
    D.packet D.convex D.packet.oppIndex1 hcenter₁ hcenter₂ hcenters
    hsecond1A hsecond2A hsecond1Outside hsecond2Outside G.second_ne
    ((G.secondApexClass.support_eq_radius G.second1
      (Finset.mem_inter.mp G.second1_mem).1).trans
      (G.secondApexClass.support_eq_radius G.second2
        (Finset.mem_inter.mp G.second2_mem).1).symm)
    ((Kz.support_eq_radius G.second1 hboth.1).trans
      (Kz.support_eq_radius G.second2 hboth.2).symm)

private theorem erase_survives_of_not_mem_selectedSupport
    {A : Finset ℝ²} {center x : ℝ²}
    (K : SelectedFourClass A center) (hx : x ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase x) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  change 4 ≤ (SelectedClass (A.erase x) center K.radius).card
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ (SelectedClass (A.erase x) center K.radius).card := by
      apply Finset.card_le_card
      intro y hy
      exact mem_selectedClass.mpr
        ⟨Finset.mem_erase.mpr
            ⟨by
              intro hyx
              subst y
              exact hx hy,
            K.support_subset_A hy⟩,
          K.support_eq_radius y hy⟩

private theorem double_erase_survives_of_not_mem_selectedSupport
    {A : Finset ℝ²} {center x y : ℝ²}
    (K : SelectedFourClass A center)
    (hx : x ∉ K.support) (hy : y ∉ K.support) :
    HasNEquidistantPointsAt 4 ((A.erase x).erase y) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  change 4 ≤ (SelectedClass ((A.erase x).erase y) center K.radius).card
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ (SelectedClass ((A.erase x).erase y) center K.radius).card := by
      apply Finset.card_le_card
      intro t ht
      exact mem_selectedClass.mpr
        ⟨Finset.mem_erase.mpr
            ⟨by
              intro hty
              subst t
              exact hy ht,
            Finset.mem_erase.mpr
              ⟨by
                intro htx
                subst t
                exact hx ht,
                K.support_subset_A ht⟩⟩,
          K.support_eq_radius t ht⟩

/-- Exhaustive support-membership split for one second-cap continuation row.

The first branch omits both strict first-cap sources and preserves the row
after both deletions.  Each one-hit branch identifies an omitted source whose
single deletion preserves K4 at `z`, hence whose chosen critical-shell center
is not `z`.  The fourth Boolean membership pattern is impossible by
`first_strictPair_not_both_mem_secondContinuation`. -/
theorem firstPair_deletion_membership_classifier
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (G : TwoOppositeApexContinuationRows D)
    {z : ℝ²}
    (hz : z ∈ G.secondApexClass.support ∩
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (Kz : SelectedFourClass D.A z) :
    (G.first1 ∉ Kz.support ∧ G.first2 ∉ Kz.support ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase G.first1).erase G.first2) z) ∨
    (G.first1 ∈ Kz.support ∧ G.first2 ∉ Kz.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.first2) z ∧
      H.centerAt G.first2
        (G.firstApexClass.support_subset_A
          (Finset.mem_inter.mp G.first2_mem).1) ≠ z) ∨
    (G.first1 ∉ Kz.support ∧ G.first2 ∈ Kz.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.first1) z ∧
      H.centerAt G.first1
        (G.firstApexClass.support_subset_A
          (Finset.mem_inter.mp G.first1_mem).1) ≠ z) := by
  let hfirst1A : G.first1 ∈ D.A :=
    G.firstApexClass.support_subset_A (Finset.mem_inter.mp G.first1_mem).1
  let hfirst2A : G.first2 ∈ D.A :=
    G.firstApexClass.support_subset_A (Finset.mem_inter.mp G.first2_mem).1
  by_cases hfirst1 : G.first1 ∈ Kz.support
  · by_cases hfirst2 : G.first2 ∈ Kz.support
    · exact False.elim
        (first_strictPair_not_both_mem_secondContinuation
          D G hz Kz ⟨hfirst1, hfirst2⟩)
    · right
      left
      have hsurvives := erase_survives_of_not_mem_selectedSupport Kz hfirst2
      exact ⟨hfirst1, hfirst2, hsurvives,
        ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
          H hfirst2A hsurvives⟩
  · by_cases hfirst2 : G.first2 ∈ Kz.support
    · right
      right
      have hsurvives := erase_survives_of_not_mem_selectedSupport Kz hfirst1
      exact ⟨hfirst1, hfirst2, hsurvives,
        ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
          H hfirst1A hsurvives⟩
    · left
      exact ⟨hfirst1, hfirst2,
        double_erase_survives_of_not_mem_selectedSupport Kz hfirst1 hfirst2⟩

/-- At least one source in the strict first-apex pair has its chosen blocker
away from any prescribed strict second-cap continuation center. -/
theorem one_firstPair_blocker_ne_secondContinuation
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (G : TwoOppositeApexContinuationRows D)
    {z : ℝ²}
    (hz : z ∈ G.secondApexClass.support ∩
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (Kz : SelectedFourClass D.A z) :
    H.centerAt G.first1
        (G.firstApexClass.support_subset_A
          (Finset.mem_inter.mp G.first1_mem).1) ≠ z ∨
      H.centerAt G.first2
        (G.firstApexClass.support_subset_A
          (Finset.mem_inter.mp G.first2_mem).1) ≠ z := by
  let hfirst1A : G.first1 ∈ D.A :=
    G.firstApexClass.support_subset_A (Finset.mem_inter.mp G.first1_mem).1
  let hfirst2A : G.first2 ∈ D.A :=
    G.firstApexClass.support_subset_A (Finset.mem_inter.mp G.first2_mem).1
  by_cases hfirst1 : G.first1 ∈ Kz.support
  · have hfirst2 : G.first2 ∉ Kz.support := by
      intro hmem
      exact first_strictPair_not_both_mem_secondContinuation
        D G hz Kz ⟨hfirst1, hmem⟩
    right
    have hsurvives := erase_survives_of_not_mem_selectedSupport Kz hfirst2
    exact
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H hfirst2A hsurvives
  · left
    have hsurvives := erase_survives_of_not_mem_selectedSupport Kz hfirst1
    exact
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        H hfirst1A hsurvives

/-- The two selected continuation centers give two relocation disjunctions.
There is no two-by-two pigeonhole consequence choosing the same source in
both disjunctions. -/
theorem firstPair_blocker_relocation_at_both_secondCenters
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (G : TwoOppositeApexContinuationRows D) :
    (H.centerAt G.first1
          (G.firstApexClass.support_subset_A
            (Finset.mem_inter.mp G.first1_mem).1) ≠ G.second1 ∨
        H.centerAt G.first2
          (G.firstApexClass.support_subset_A
            (Finset.mem_inter.mp G.first2_mem).1) ≠ G.second1) ∧
      (H.centerAt G.first1
          (G.firstApexClass.support_subset_A
            (Finset.mem_inter.mp G.first1_mem).1) ≠ G.second2 ∨
        H.centerAt G.first2
          (G.firstApexClass.support_subset_A
            (Finset.mem_inter.mp G.first2_mem).1) ≠ G.second2) := by
  exact ⟨
    one_firstPair_blocker_ne_secondContinuation
      D H G G.second1_mem G.classAtSecond1,
    one_firstPair_blocker_ne_secondContinuation
      D H G G.second2_mem G.classAtSecond2⟩

/-- The independent same-radius split at the first apex for the chosen strict
pair.  If double deletion does not preserve K4 there, the first-apex class is
the unique K4 radius and its full cardinality is four or five. -/
theorem firstPair_sameRadius_doubleErase_classifier
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D) :
    HasNEquidistantPointsAt 4
        ((D.A.erase G.first1).erase G.first2) D.packet.oppApex1 ∨
      (((SelectedClass D.A D.packet.oppApex1
          G.firstApexClass.radius).card = 4 ∨
        (SelectedClass D.A D.packet.oppApex1
          G.firstApexClass.radius).card = 5) ∧
      ∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass D.A D.packet.oppApex1 rho).card →
        rho = G.firstApexClass.radius) := by
  apply
    ATAILSameRadiusDoubleErase.sameRadius_double_erase_survives_or_unique_class_card_four_or_five
      (D.K4 D.packet.oppApex1 (oppApex1_mem_A D))
  · exact mem_selectedClass.mpr
      ⟨G.firstApexClass.support_subset_A
          (Finset.mem_inter.mp G.first1_mem).1,
        G.firstApexClass.support_eq_radius G.first1
          (Finset.mem_inter.mp G.first1_mem).1⟩
  · exact mem_selectedClass.mpr
      ⟨G.firstApexClass.support_subset_A
          (Finset.mem_inter.mp G.first2_mem).1,
        G.firstApexClass.support_eq_radius G.first2
          (Finset.mem_inter.mp G.first2_mem).1⟩
  · exact G.first_ne

/- ## Exact normal form of the surviving alternating arm -/

/-- The forward permutation matrix: the first continuation row hits only the
first source, and the second continuation row hits only the second source. -/
structure ForwardAlternatingMembership
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D) where
  first1_mem_at_second1 : G.first1 ∈ G.classAtSecond1.support
  first2_not_mem_at_second1 : G.first2 ∉ G.classAtSecond1.support
  first1_not_mem_at_second2 : G.first1 ∉ G.classAtSecond2.support
  first2_mem_at_second2 : G.first2 ∈ G.classAtSecond2.support

/-- The reverse permutation closes into two reciprocal directed pairs:
`first1 ↔ second1` and `first2 ↔ second2`. -/
structure ReciprocalAlternatingMembership
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D) extends
    ForwardAlternatingMembership D G where
  second1_mem_at_first1 : G.second1 ∈ G.classAtFirst1.support
  second2_not_mem_at_first1 : G.second2 ∉ G.classAtFirst1.support
  second1_not_mem_at_first2 : G.second1 ∉ G.classAtFirst2.support
  second2_mem_at_first2 : G.second2 ∈ G.classAtFirst2.support

/-- The other reverse permutation closes into the genuine directed four-cycle
`first1 → second1 → first2 → second2 → first1`. -/
structure CyclicAlternatingMembership
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D) extends
    ForwardAlternatingMembership D G where
  second1_not_mem_at_first1 : G.second1 ∉ G.classAtFirst1.support
  second2_mem_at_first1 : G.second2 ∈ G.classAtFirst1.support
  second1_mem_at_first2 : G.second1 ∈ G.classAtFirst2.support
  second2_not_mem_at_first2 : G.second2 ∉ G.classAtFirst2.support

/-- A named one-hit row either survives deletion of its hit source, or that
source makes the center deletion-critical and the selected row is exactly the
resulting critical full shell. -/
def SelectedRowHitOutcome
    (D : CounterexampleData) (q center : ℝ²)
    (K : SelectedFourClass D.A center) : Prop :=
  HasNEquidistantPointsAt 4 (D.A.erase q) center ∨
    ∃ C : CriticalSelectedFourClass D.A q center,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q) center ∧
      K.support = C.toCriticalFourShell.support

private theorem selectedFourClass_support_eq_criticalShell_of_source_mem
    {A : Finset ℝ²} {q center : ℝ²}
    (C : CriticalSelectedFourClass A q center)
    (K : SelectedFourClass A center)
    (hqK : q ∈ K.support) :
    K.support = C.toCriticalFourShell.support := by
  have hradius : K.radius = C.toCriticalFourShell.radius := by
    exact (K.support_eq_radius q hqK).symm.trans
      (C.toCriticalFourShell.support_eq_radius q
        C.toCriticalFourShell.q_mem_support)
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    apply C.toCriticalFourShell.off_row_named_label_forbidden
      (K.support_subset_A hz)
    exact (K.support_eq_radius z hz).trans hradius
  · rw [C.toCriticalFourShell.support_card, K.support_card]

/-- Global K4 makes `SelectedRowHitOutcome` exhaustive for every selected row
that contains the named source. -/
theorem selectedRow_hitOutcome
    (D : CounterexampleData) {q center : ℝ²}
    (hcenter : center ∈ D.A)
    (K : SelectedFourClass D.A center)
    (hqK : q ∈ K.support) :
    SelectedRowHitOutcome D q center K := by
  rcases ATAILStageOnePrescribedApexDichotomy.erase_survives_or_criticalSelectedFourClass_at
      D.K4 hcenter with hsurvives | ⟨C, hblocked⟩
  · exact Or.inl hsurvives
  · exact Or.inr
      ⟨C, hblocked,
        selectedFourClass_support_eq_criticalShell_of_source_mem C K hqK⟩

/-- Exact selector boundary for a prescribed hit center.  Once one total
critical-shell system exists, failure of K4 after deleting `q` at a distinct
carrier center is equivalent to the existence of a (possibly overridden)
critical-shell system that selects that center as the blocker of `q`.

The forward implication uses global K4 to turn the prescribed failure into an
exact critical shell and then overrides the supplied selector at `q`.  The
reverse implication is just the selected system's `no_qfree` field.  Thus a
bare `Nonempty (CriticalShellSystem D.A)` does not force failure at an
arbitrary continuation center: the missing datum is precisely alignment of a
selector with that center. -/
theorem prescribed_deletion_blocked_iff_exists_css_alignment
    (D : CounterexampleData)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    {q center : ℝ²}
    (hq : q ∈ D.A) (hcenter : center ∈ D.A)
    (hcenter_ne_q : center ≠ q) :
    (¬ HasNEquidistantPointsAt 4 (D.A.erase q) center) ↔
      ∃ H : CriticalShellSystem D.A, H.centerAt q hq = center := by
  constructor
  · intro hblocked
    rcases
        (ATAILStageOnePrescribedApexDichotomy.criticalSelectedFourClass_at_of_no_qfree
            D.K4 hcenter hcenter_ne_q hblocked) with
      ⟨C⟩
    rcases hcritical with ⟨H⟩
    let H' : CriticalShellSystem D.A := H.overrideAt C hblocked
    refine ⟨H', ?_⟩
    exact H.overrideAt_centerAt C hblocked hq
  · rintro ⟨H, halign⟩ hsurvives
    apply H.no_qfree_at q hq
    simpa only [halign] using hsurvives

/-- All four directed hits in the reciprocal survivor receive the exact
survival-or-critical-shell split. -/
theorem reciprocalAlternating_four_hitOutcomes
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D)
    (R : ReciprocalAlternatingMembership D G) :
    SelectedRowHitOutcome D G.first1 G.second1 G.classAtSecond1 ∧
      SelectedRowHitOutcome D G.first2 G.second2 G.classAtSecond2 ∧
      SelectedRowHitOutcome D G.second1 G.first1 G.classAtFirst1 ∧
      SelectedRowHitOutcome D G.second2 G.first2 G.classAtFirst2 := by
  exact ⟨
    selectedRow_hitOutcome D
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second1_mem).1)
      G.classAtSecond1 R.first1_mem_at_second1,
    selectedRow_hitOutcome D
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second2_mem).1)
      G.classAtSecond2 R.first2_mem_at_second2,
    selectedRow_hitOutcome D
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first1_mem).1)
      G.classAtFirst1 R.second1_mem_at_first1,
    selectedRow_hitOutcome D
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first2_mem).1)
      G.classAtFirst2 R.second2_mem_at_first2⟩

/-- All four directed hits in the genuine four-cycle receive the exact
survival-or-critical-shell split. -/
theorem cyclicAlternating_four_hitOutcomes
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D)
    (C : CyclicAlternatingMembership D G) :
    SelectedRowHitOutcome D G.first1 G.second1 G.classAtSecond1 ∧
      SelectedRowHitOutcome D G.first2 G.second2 G.classAtSecond2 ∧
      SelectedRowHitOutcome D G.second1 G.first2 G.classAtFirst2 ∧
      SelectedRowHitOutcome D G.second2 G.first1 G.classAtFirst1 := by
  exact ⟨
    selectedRow_hitOutcome D
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second1_mem).1)
      G.classAtSecond1 C.first1_mem_at_second1,
    selectedRow_hitOutcome D
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second2_mem).1)
      G.classAtSecond2 C.first2_mem_at_second2,
    selectedRow_hitOutcome D
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first2_mem).1)
      G.classAtFirst2 C.second1_mem_at_first2,
    selectedRow_hitOutcome D
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first1_mem).1)
      G.classAtFirst1 C.second2_mem_at_first1⟩

/-- Reciprocal directed membership identifies the two radii in each mutual
pair.  This is the only radius coincidence forced by the incidence grid. -/
theorem reciprocalAlternating_paired_radius_eq
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D)
    (R : ReciprocalAlternatingMembership D G) :
    G.classAtSecond1.radius = G.classAtFirst1.radius ∧
      G.classAtSecond2.radius = G.classAtFirst2.radius := by
  constructor
  · calc
      G.classAtSecond1.radius = dist G.second1 G.first1 :=
        (G.classAtSecond1.support_eq_radius G.first1
          R.first1_mem_at_second1).symm
      _ = dist G.first1 G.second1 := dist_comm _ _
      _ = G.classAtFirst1.radius :=
        G.classAtFirst1.support_eq_radius G.second1
          R.second1_mem_at_first1
  · calc
      G.classAtSecond2.radius = dist G.second2 G.first2 :=
        (G.classAtSecond2.support_eq_radius G.first2
          R.first2_mem_at_second2).symm
      _ = dist G.first2 G.second2 := dist_comm _ _
      _ = G.classAtFirst2.radius :=
        G.classAtFirst2.support_eq_radius G.second2
          R.second2_mem_at_first2

/-- In the genuine four-cycle each row radius is exactly one edge length.
Unlike the reciprocal branch, no two of these edge lengths are identified by
the membership data. -/
theorem cyclicAlternating_directed_edge_radii
    (D : CounterexampleData) (G : TwoOppositeApexContinuationRows D)
    (C : CyclicAlternatingMembership D G) :
    G.classAtSecond1.radius = dist G.first1 G.second1 ∧
      G.classAtFirst2.radius = dist G.second1 G.first2 ∧
      G.classAtSecond2.radius = dist G.first2 G.second2 ∧
      G.classAtFirst1.radius = dist G.second2 G.first1 := by
  exact ⟨
    (G.classAtSecond1.support_eq_radius G.first1
      C.first1_mem_at_second1).symm.trans (dist_comm _ _),
    (G.classAtFirst2.support_eq_radius G.second1
      C.second1_mem_at_first2).symm.trans (dist_comm _ _),
    (G.classAtSecond2.support_eq_radius G.first2
      C.first2_mem_at_second2).symm.trans (dist_comm _ _),
    (G.classAtFirst1.support_eq_radius G.second2
      C.second2_mem_at_first1).symm.trans (dist_comm _ _)⟩

private theorem aligned_cross_deletion_survives
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w center : ℝ²} (hq : q ∈ A)
    (K : SelectedFourClass A center)
    (halign : H.centerAt q hq = center)
    (hwomit : w ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase w) center := by
  subst center
  apply
    (ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
      H hq).mpr
  rw [← H.selectedFourClass_support_eq_shell q hq K]
  exact hwomit

/-- The reciprocal membership arm aligned with the chosen CSS blocker map. -/
structure ReciprocalCSSAlignedArm
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (G : TwoOppositeApexContinuationRows D) extends
    ReciprocalAlternatingMembership D G where
  first1_blocker_is_second1 :
    H.centerAt G.first1
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first1_mem).1) = G.second1
  first2_blocker_is_second2 :
    H.centerAt G.first2
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first2_mem).1) = G.second2
  second1_blocker_is_first1 :
    H.centerAt G.second1
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second1_mem).1) = G.first1
  second2_blocker_is_first2 :
    H.centerAt G.second2
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second2_mem).1) = G.first2

/-- The genuine four-cycle membership arm aligned with the CSS blocker map. -/
structure CyclicCSSAlignedArm
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (G : TwoOppositeApexContinuationRows D) extends
    CyclicAlternatingMembership D G where
  first1_blocker_is_second1 :
    H.centerAt G.first1
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first1_mem).1) = G.second1
  first2_blocker_is_second2 :
    H.centerAt G.first2
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first2_mem).1) = G.second2
  second1_blocker_is_first2 :
    H.centerAt G.second1
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second1_mem).1) = G.first2
  second2_blocker_is_first1 :
    H.centerAt G.second2
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second2_mem).1) = G.first1

/-- With CSS alignment, every omission in the reciprocal grid is exactly a
cross-deletion survivor at the corresponding source blocker. -/
theorem reciprocalCSSAligned_cross_deletion_survivals
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (G : TwoOppositeApexContinuationRows D)
    (R : ReciprocalCSSAlignedArm D H G) :
    HasNEquidistantPointsAt 4 (D.A.erase G.first2) G.second1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.first1) G.second2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.second2) G.first1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.second1) G.first2 := by
  exact ⟨
    aligned_cross_deletion_survives H
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first1_mem).1)
      G.classAtSecond1 R.first1_blocker_is_second1
      R.first2_not_mem_at_second1,
    aligned_cross_deletion_survives H
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first2_mem).1)
      G.classAtSecond2 R.first2_blocker_is_second2
      R.first1_not_mem_at_second2,
    aligned_cross_deletion_survives H
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second1_mem).1)
      G.classAtFirst1 R.second1_blocker_is_first1
      R.second2_not_mem_at_first1,
    aligned_cross_deletion_survives H
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second2_mem).1)
      G.classAtFirst2 R.second2_blocker_is_first2
      R.second1_not_mem_at_first2⟩

/-- With CSS alignment, every omission in the four-cycle grid is exactly a
cross-deletion survivor at the corresponding source blocker. -/
theorem cyclicCSSAligned_cross_deletion_survivals
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (G : TwoOppositeApexContinuationRows D)
    (C : CyclicCSSAlignedArm D H G) :
    HasNEquidistantPointsAt 4 (D.A.erase G.first2) G.second1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.first1) G.second2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.second2) G.first2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase G.second1) G.first1 := by
  exact ⟨
    aligned_cross_deletion_survives H
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first1_mem).1)
      G.classAtSecond1 C.first1_blocker_is_second1
      C.first2_not_mem_at_second1,
    aligned_cross_deletion_survives H
      (G.firstApexClass.support_subset_A
        (Finset.mem_inter.mp G.first2_mem).1)
      G.classAtSecond2 C.first2_blocker_is_second2
      C.first1_not_mem_at_second2,
    aligned_cross_deletion_survives H
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second1_mem).1)
      G.classAtFirst2 C.second1_blocker_is_first2
      C.second2_not_mem_at_first2,
    aligned_cross_deletion_survives H
      (G.secondApexClass.support_subset_A
        (Finset.mem_inter.mp G.second2_mem).1)
      G.classAtFirst1 C.second2_blocker_is_first1
      C.second1_not_mem_at_first1⟩

#print axioms firstApex_support_strictInterior_card_ge_two
#print axioms secondApex_support_strictInterior_card_ge_two
#print axioms exists_twoOppositeApexContinuationRows
#print axioms first_strictPair_not_both_mem_secondContinuation
#print axioms second_strictPair_not_both_mem_firstContinuation
#print axioms firstPair_deletion_membership_classifier
#print axioms one_firstPair_blocker_ne_secondContinuation
#print axioms firstPair_blocker_relocation_at_both_secondCenters
#print axioms firstPair_sameRadius_doubleErase_classifier
#print axioms selectedRow_hitOutcome
#print axioms prescribed_deletion_blocked_iff_exists_css_alignment
#print axioms reciprocalAlternating_four_hitOutcomes
#print axioms cyclicAlternating_four_hitOutcomes
#print axioms reciprocalAlternating_paired_radius_eq
#print axioms cyclicAlternating_directed_edge_radii
#print axioms reciprocalCSSAligned_cross_deletion_survivals
#print axioms cyclicCSSAligned_cross_deletion_survivals

end BiapexContinuationGridScratch
end Problem97
