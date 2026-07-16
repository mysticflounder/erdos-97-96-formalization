/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Scratch: cap-order classifier for the bi-apex continuation grid

This file keeps the full indexed-cap geometry visible.  Two distinct centers
of one cap are assigned actual ordered-cap ranks; every carrier point outside
that cap is then strictly on the negative side of the oriented center chord.

For the bi-apex continuation grid this upgrades a support omission to a metric
exclusion.  Once a strict opposite-cap row contains one point of the parent
apex pair, the other point is not merely absent from the selected four-point
support: its distance from the row center is different from the selected row
radius.  Reciprocal and cyclic reverse grids therefore have four exact
forbidden metric entries.  Adding any one of them is an immediate
ordered-cap contradiction.

The file is scratch-only and does not assert that the live hypotheses produce
one of the forbidden entries.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailContinuationCapOrderClassifierScratch

attribute [local instance] Classical.propDecidable

/-- The ordered-cap ranks and strict chord-side signs associated to two
distinct cap centers and two outside carrier points. -/
structure RankSideData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (c₁ c₂ a b : ℝ²) where
  m : ℕ
  L : CGN.OrderedCap m
  Packet : CGN.MecCapPacket A L
  Hside : CGN.MinorCapSideHypotheses Packet
  Hord : CGN.StrictCapOrder A L
  r : Fin m
  s : Fin m
  hrs : r < s
  cap_eq : Finset.univ.image L.points = S.capByIndex i
  centers_eq :
    (L.points r = c₁ ∧ L.points s = c₂) ∨
      (L.points r = c₂ ∧ L.points s = c₁)
  a_side_neg : signedArea2 (L.points r) (L.points s) a < 0
  b_side_neg : signedArea2 (L.points r) (L.points s) b < 0
  projection_pos :
    0 < inner ℝ (L.points s - L.points r)
      (L.points (CGN.lastIndex Hord.hm) -
        L.points (CGN.firstIndex Hord.hm))

/-- Full MEC/cap-order data assigns ranks to two distinct cap centers and
places every outside carrier point strictly on the same side of their chord.
The strict sign, rather than only a non-membership fact, uses convex
independence to exclude collinearity. -/
theorem nonempty_rankSideData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {c₁ c₂ a b : ℝ²}
    (hc₁ : c₁ ∈ S.capByIndex i) (hc₂ : c₂ ∈ S.capByIndex i)
    (hcne : c₁ ≠ c₂)
    (haA : a ∈ A) (hbA : b ∈ A)
    (haOutside : a ∉ S.capByIndex i)
    (hbOutside : b ∉ S.capByIndex i) :
    Nonempty (RankSideData S i c₁ c₂ a b) := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hc₁Image : c₁ ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hc₁
  have hc₂Image : c₂ ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hc₂
  rcases Finset.mem_image.mp hc₁Image with ⟨r, _hr, hrc₁⟩
  rcases Finset.mem_image.mp hc₂Image with ⟨s, _hs, hsc₂⟩
  have hrsne : r ≠ s := by
    intro h
    apply hcne
    calc
      c₁ = L.points r := hrc₁.symm
      _ = L.points s := by simp [h]
      _ = c₂ := hsc₂
  have haOutsideImage : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOutside
  have hbOutsideImage : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOutside
  have outside_neg :
      ∀ {u v : Fin m}, u < v → ∀ {x : ℝ²}, x ∈ A →
        x ∉ Finset.univ.image L.points →
        signedArea2 (L.points u) (L.points v) x < 0 := by
    intro u v huv x hxA hxOutside
    have hx_nonpos : signedArea2 (L.points u) (L.points v) x ≤ 0 := by
      apply le_of_not_gt
      intro hpos
      rcases (Hord.subchord_open_side_iff_A huv hxA).mp hpos with
        ⟨j, _huj, _hjv, hj⟩
      exact hxOutside
        (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)
    have huvPoint : L.points u ≠ L.points v := by
      intro h
      exact (ne_of_lt huv) (L.injective h)
    have hxu : x ≠ L.points u := by
      intro h
      apply hxOutside
      exact Finset.mem_image.mpr
        ⟨u, Finset.mem_univ _, by simp [h]⟩
    have hxv : x ≠ L.points v := by
      intro h
      apply hxOutside
      exact Finset.mem_image.mpr
        ⟨v, Finset.mem_univ _, by simp [h]⟩
    have hx_ne : signedArea2 (L.points u) (L.points v) x ≠ 0 := by
      intro hzero
      exact hconv.not_three_collinear (Packet.mem_A u) (Packet.mem_A v) hxA
        huvPoint hxu.symm hxv.symm
        (collinear_of_signedArea2_eq_zero _ _ _ hzero)
    exact lt_of_le_of_ne hx_nonpos hx_ne
  rcases lt_or_gt_of_ne hrsne with hrs | hsr
  · exact ⟨{
      m := m
      L := L
      Packet := Packet
      Hside := Hside
      Hord := Hord
      r := r
      s := s
      hrs := hrs
      cap_eq := hcap
      centers_eq := Or.inl ⟨hrc₁, hsc₂⟩
      a_side_neg := outside_neg hrs haA haOutsideImage
      b_side_neg := outside_neg hrs hbA hbOutsideImage
      projection_pos := Hord.chord_projection_strict hrs }⟩
  · exact ⟨{
      m := m
      L := L
      Packet := Packet
      Hside := Hside
      Hord := Hord
      r := s
      s := r
      hrs := hsr
      cap_eq := hcap
      centers_eq := Or.inr ⟨hsc₂, hrc₁⟩
      a_side_neg := outside_neg hsr haA haOutsideImage
      b_side_neg := outside_neg hsr hbA hbOutsideImage
      projection_pos := Hord.chord_projection_strict hsr }⟩

/-- Once one cap center bisects an outside pair, every other distinct center
of that cap has unequal distances to the pair.  The proof consumes the
ranked strict-cap data above and the existing ordered-cap sink. -/
theorem second_center_separates_outside_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {c₁ c₂ a b : ℝ²}
    (hc₁ : c₁ ∈ S.capByIndex i) (hc₂ : c₂ ∈ S.capByIndex i)
    (hcne : c₁ ≠ c₂)
    (haA : a ∈ A) (hbA : b ∈ A)
    (haOutside : a ∉ S.capByIndex i)
    (hbOutside : b ∉ S.capByIndex i)
    (hab : a ≠ b)
    (hc₁eq : dist c₁ a = dist c₁ b) :
    dist c₂ a ≠ dist c₂ b := by
  intro hc₂eq
  rcases nonempty_rankSideData S hconv i hc₁ hc₂ hcne
      haA hbA haOutside hbOutside with ⟨R⟩
  rcases R.centers_eq with hforward | hreverse
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv R.Hord R.Packet.mem_A R.hrs haA hbA
      (by simpa [R.cap_eq] using haOutside)
      (by simpa [R.cap_eq] using hbOutside) hab
      (by simpa [hforward.1] using hc₁eq)
      (by simpa [hforward.2] using hc₂eq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv R.Hord R.Packet.mem_A R.hrs haA hbA
      (by simpa [R.cap_eq] using haOutside)
      (by simpa [R.cap_eq] using hbOutside) hab
      (by simpa [hreverse.1] using hc₂eq)
      (by simpa [hreverse.2] using hc₁eq)

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

private theorem oppApex2_mem_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppApex2, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppApex2, hi] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppApex2, hi] using S.partition.v2_mem_C1

/-- A strict `oppCap2` center separates the two strict `oppCap1` points of a
selected first-apex row by distance. -/
theorem secondCap_center_separates_firstApex_pair
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex1)
    {a b z : ℝ²}
    (ha : a ∈ K.support ∩
      (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hb : b ∈ K.support ∩
      (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b)
    (hz : z ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1)) :
    dist z a ≠ dist z b := by
  have hcap := capByIndex_oppIndex2_eq_oppCap2 D.packet
  have hzNotSurplus : z ∉ D.packet.surplusCap := by
    intro h
    exact (Finset.mem_sdiff.mp hz).2
      (Finset.mem_union.mpr (Or.inl h))
  have hcenters : D.packet.oppApex1 ≠ z := by
    intro h
    apply hzNotSurplus
    simpa [h] using oppApex1_mem_surplusCap D.packet
  apply second_center_separates_outside_pair
    D.packet D.convex D.packet.oppIndex2
    (by simpa only [hcap] using oppApex1_mem_oppCap2 D.packet)
    (by simpa only [hcap] using (Finset.mem_sdiff.mp hz).1)
    hcenters
    (K.support_subset_A (Finset.mem_inter.mp ha).1)
    (K.support_subset_A (Finset.mem_inter.mp hb).1)
    (by
      rw [hcap]
      intro haOpp2
      exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp ha).2).2
        (Finset.mem_union.mpr (Or.inr haOpp2)))
    (by
      rw [hcap]
      intro hbOpp2
      exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hb).2).2
        (Finset.mem_union.mpr (Or.inr hbOpp2)))
    hab
  exact (K.support_eq_radius a (Finset.mem_inter.mp ha).1).trans
    (K.support_eq_radius b (Finset.mem_inter.mp hb).1).symm

/-- Symmetric distance separation for a strict `oppCap1` center and the
strict `oppCap2` pair of the second-apex row. -/
theorem firstCap_center_separates_secondApex_pair
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2)
    {c d z : ℝ²}
    (hc : c ∈ K.support ∩
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (hd : d ∈ K.support ∩
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (hcd : c ≠ d)
    (hz : z ∈ D.packet.oppCap1 \
      (D.packet.surplusCap ∪ D.packet.oppCap2)) :
    dist z c ≠ dist z d := by
  have hcap := capByIndex_oppIndex1_eq_oppCap1 D.packet
  have hzNotSurplus : z ∉ D.packet.surplusCap := by
    intro h
    exact (Finset.mem_sdiff.mp hz).2
      (Finset.mem_union.mpr (Or.inl h))
  have hcenters : D.packet.oppApex2 ≠ z := by
    intro h
    apply hzNotSurplus
    simpa [h] using oppApex2_mem_surplusCap D.packet
  apply second_center_separates_outside_pair
    D.packet D.convex D.packet.oppIndex1
    (by simpa only [hcap] using oppApex2_mem_oppCap1 D.packet)
    (by simpa only [hcap] using (Finset.mem_sdiff.mp hz).1)
    hcenters
    (K.support_subset_A (Finset.mem_inter.mp hc).1)
    (K.support_subset_A (Finset.mem_inter.mp hd).1)
    (by
      rw [hcap]
      intro hcOpp1
      exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hc).2).2
        (Finset.mem_union.mpr (Or.inr hcOpp1)))
    (by
      rw [hcap]
      intro hdOpp1
      exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp hd).2).2
        (Finset.mem_union.mpr (Or.inr hdOpp1)))
    hcd
  exact (K.support_eq_radius c (Finset.mem_inter.mp hc).1).trans
    (K.support_eq_radius d (Finset.mem_inter.mp hd).1).symm

/-- The exact four-center data needed by the cap-order classifier.  Global K4
is visible through the four selected continuation rows, while the parent rows
retain the two opposite-cap pairs. -/
structure FourCenterGrid (D : CounterexampleData) where
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

/-- Ordered ranks and same-side signs for the two second-cap centers against
the first-apex pair. -/
theorem secondPair_rankSideData
    (D : CounterexampleData) (G : FourCenterGrid D) :
    Nonempty (RankSideData D.packet D.packet.oppIndex2
      G.second1 G.second2 G.first1 G.first2) := by
  have hcap := capByIndex_oppIndex2_eq_oppCap2 D.packet
  apply nonempty_rankSideData D.packet D.convex D.packet.oppIndex2
    (by simpa only [hcap] using
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.second1_mem).2).1)
    (by simpa only [hcap] using
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.second2_mem).2).1)
    G.second_ne
    (G.firstApexClass.support_subset_A
      (Finset.mem_inter.mp G.first1_mem).1)
    (G.firstApexClass.support_subset_A
      (Finset.mem_inter.mp G.first2_mem).1)
  · rw [hcap]
    intro h
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.first1_mem).2).2
      (Finset.mem_union.mpr (Or.inr h))
  · rw [hcap]
    intro h
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.first2_mem).2).2
      (Finset.mem_union.mpr (Or.inr h))

/-- Symmetric ordered ranks and same-side signs for the first-cap centers. -/
theorem firstPair_rankSideData
    (D : CounterexampleData) (G : FourCenterGrid D) :
    Nonempty (RankSideData D.packet D.packet.oppIndex1
      G.first1 G.first2 G.second1 G.second2) := by
  have hcap := capByIndex_oppIndex1_eq_oppCap1 D.packet
  apply nonempty_rankSideData D.packet D.convex D.packet.oppIndex1
    (by simpa only [hcap] using
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.first1_mem).2).1)
    (by simpa only [hcap] using
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.first2_mem).2).1)
    G.first_ne
    (G.secondApexClass.support_subset_A
      (Finset.mem_inter.mp G.second1_mem).1)
    (G.secondApexClass.support_subset_A
      (Finset.mem_inter.mp G.second2_mem).1)
  · rw [hcap]
    intro h
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.second1_mem).2).2
      (Finset.mem_union.mpr (Or.inr h))
  · rw [hcap]
    intro h
    exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp G.second2_mem).2).2
      (Finset.mem_union.mpr (Or.inr h))

/-- The forward diagonal hits.  No omission is assumed. -/
structure ForwardHits (D : CounterexampleData) (G : FourCenterGrid D) where
  first1_mem_at_second1 : G.first1 ∈ G.classAtSecond1.support
  first2_mem_at_second2 : G.first2 ∈ G.classAtSecond2.support

/-- Reverse hits along the same two undirected edges. -/
structure ReciprocalHits
    (D : CounterexampleData) (G : FourCenterGrid D)
    extends ForwardHits D G where
  second1_mem_at_first1 : G.second1 ∈ G.classAtFirst1.support
  second2_mem_at_first2 : G.second2 ∈ G.classAtFirst2.support

/-- Reverse hits along the other diagonal, producing the directed four-cycle. -/
structure CyclicHits
    (D : CounterexampleData) (G : FourCenterGrid D)
    extends ForwardHits D G where
  second2_mem_at_first1 : G.second2 ∈ G.classAtFirst1.support
  second1_mem_at_first2 : G.second1 ∈ G.classAtFirst2.support

/-- The forward two hits force the two off-diagonal distances to differ from
the corresponding selected-row radii. -/
theorem forward_metric_exclusions
    (D : CounterexampleData) (G : FourCenterGrid D)
    (F : ForwardHits D G) :
    dist G.second1 G.first2 ≠ G.classAtSecond1.radius ∧
      dist G.second2 G.first1 ≠ G.classAtSecond2.radius := by
  have hsep1 := secondCap_center_separates_firstApex_pair
    D G.firstApexClass G.first1_mem G.first2_mem G.first_ne
    (Finset.mem_inter.mp G.second1_mem).2
  have hsep2 := secondCap_center_separates_firstApex_pair
    D G.firstApexClass G.first1_mem G.first2_mem G.first_ne
    (Finset.mem_inter.mp G.second2_mem).2
  constructor
  · intro hmissing
    apply hsep1
    exact (G.classAtSecond1.support_eq_radius G.first1
      F.first1_mem_at_second1).trans hmissing.symm
  · intro hmissing
    apply hsep2
    exact hmissing.trans
      (G.classAtSecond2.support_eq_radius G.first2
        F.first2_mem_at_second2).symm

/-- Reciprocal grids have four forbidden extra metric entries, one for every
off-diagonal row/point incidence. -/
theorem reciprocal_metric_exclusions
    (D : CounterexampleData) (G : FourCenterGrid D)
    (R : ReciprocalHits D G) :
    dist G.second1 G.first2 ≠ G.classAtSecond1.radius ∧
      dist G.second2 G.first1 ≠ G.classAtSecond2.radius ∧
      dist G.first1 G.second2 ≠ G.classAtFirst1.radius ∧
      dist G.first2 G.second1 ≠ G.classAtFirst2.radius := by
  have hf := forward_metric_exclusions D G R.toForwardHits
  have hsep1 := firstCap_center_separates_secondApex_pair
    D G.secondApexClass G.second1_mem G.second2_mem G.second_ne
    (Finset.mem_inter.mp G.first1_mem).2
  have hsep2 := firstCap_center_separates_secondApex_pair
    D G.secondApexClass G.second1_mem G.second2_mem G.second_ne
    (Finset.mem_inter.mp G.first2_mem).2
  refine ⟨hf.1, hf.2, ?_, ?_⟩
  · intro hmissing
    apply hsep1
    exact (G.classAtFirst1.support_eq_radius G.second1
      R.second1_mem_at_first1).trans hmissing.symm
  · intro hmissing
    apply hsep2
    exact hmissing.trans
      (G.classAtFirst2.support_eq_radius G.second2
        R.second2_mem_at_first2).symm

/-- Cyclic grids have the corresponding four forbidden entries, with the
reverse pair exchanged. -/
theorem cyclic_metric_exclusions
    (D : CounterexampleData) (G : FourCenterGrid D)
    (C : CyclicHits D G) :
    dist G.second1 G.first2 ≠ G.classAtSecond1.radius ∧
      dist G.second2 G.first1 ≠ G.classAtSecond2.radius ∧
      dist G.first1 G.second1 ≠ G.classAtFirst1.radius ∧
      dist G.first2 G.second2 ≠ G.classAtFirst2.radius := by
  have hf := forward_metric_exclusions D G C.toForwardHits
  have hsep1 := firstCap_center_separates_secondApex_pair
    D G.secondApexClass G.second1_mem G.second2_mem G.second_ne
    (Finset.mem_inter.mp G.first1_mem).2
  have hsep2 := firstCap_center_separates_secondApex_pair
    D G.secondApexClass G.second1_mem G.second2_mem G.second_ne
    (Finset.mem_inter.mp G.first2_mem).2
  refine ⟨hf.1, hf.2, ?_, ?_⟩
  · intro hmissing
    apply hsep1
    exact hmissing.trans
      (G.classAtFirst1.support_eq_radius G.second2
        C.second2_mem_at_first1).symm
  · intro hmissing
    apply hsep2
    exact (G.classAtFirst2.support_eq_radius G.second1
      C.second1_mem_at_first2).trans hmissing.symm

/-- Any one additional metric entry closes the reciprocal grid. -/
theorem false_of_reciprocal_one_metric_entry
    (D : CounterexampleData) (G : FourCenterGrid D)
    (R : ReciprocalHits D G)
    (hentry :
      dist G.second1 G.first2 = G.classAtSecond1.radius ∨
      dist G.second2 G.first1 = G.classAtSecond2.radius ∨
      dist G.first1 G.second2 = G.classAtFirst1.radius ∨
      dist G.first2 G.second1 = G.classAtFirst2.radius) : False := by
  have h := reciprocal_metric_exclusions D G R
  rcases hentry with hentry | hentry | hentry | hentry
  · exact h.1 hentry
  · exact h.2.1 hentry
  · exact h.2.2.1 hentry
  · exact h.2.2.2 hentry

/-- Any one additional metric entry closes the cyclic grid. -/
theorem false_of_cyclic_one_metric_entry
    (D : CounterexampleData) (G : FourCenterGrid D)
    (C : CyclicHits D G)
    (hentry :
      dist G.second1 G.first2 = G.classAtSecond1.radius ∨
      dist G.second2 G.first1 = G.classAtSecond2.radius ∨
      dist G.first1 G.second1 = G.classAtFirst1.radius ∨
      dist G.first2 G.second2 = G.classAtFirst2.radius) : False := by
  have h := cyclic_metric_exclusions D G C
  rcases hentry with hentry | hentry | hentry | hentry
  · exact h.1 hentry
  · exact h.2.1 hentry
  · exact h.2.2.1 hentry
  · exact h.2.2.2 hentry

#print axioms nonempty_rankSideData
#print axioms second_center_separates_outside_pair
#print axioms secondCap_center_separates_firstApex_pair
#print axioms firstCap_center_separates_secondApex_pair
#print axioms secondPair_rankSideData
#print axioms firstPair_rankSideData
#print axioms forward_metric_exclusions
#print axioms reciprocal_metric_exclusions
#print axioms cyclic_metric_exclusions
#print axioms false_of_reciprocal_one_metric_entry
#print axioms false_of_cyclic_one_metric_entry

end ATailContinuationCapOrderClassifierScratch
end Problem97
