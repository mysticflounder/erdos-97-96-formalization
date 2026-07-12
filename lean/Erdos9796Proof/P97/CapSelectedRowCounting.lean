/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CGN.CGN6
import Erdos9796Proof.P97.SurplusM44Packet
import Erdos9796Proof.P97.SurplusCOMPGBankSep
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Selected-row counting on an ordered cap

This file records two cap-local facts used by the general-`m` pinned-surplus
branch. A selected class centered on a cap has at most one same-radius member
on either side of its center, hence at most two cap members in total. Moreover,
two distinct cap centers cannot share the same pair of points outside the cap.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace CGN

/-- The normalized one-sided distance-injectivity theorem transports back to
the original ordered cap. -/
theorem oneSidedDistanceInjective_of_mecCapPacket
    {A : Finset ℝ²} {m : ℕ} {L : OrderedCap m}
    (Packet : MecCapPacket A L)
    (Hside : MinorCapSideHypotheses Packet)
    (Hord : StrictCapOrder A L) :
    (∀ {j r s : Fin m}, j < r → r < s →
      dist (L.points j) (L.points r) ≠ dist (L.points j) (L.points s)) ∧
    (∀ {j r s : Fin m}, r < s → s < j →
      dist (L.points j) (L.points r) ≠ dist (L.points j) (L.points s)) := by
  rcases CGN6norm_minorCapChainModel_of_mecCapPacket Packet Hside Hord with
    ⟨T, hT, tau, ⟨Model⟩⟩
  have hnormalized := CGN6c_oneSidedDistanceInjective Model
  constructor
  · intro j r s hjr hrs heq
    apply hnormalized.1 hjr hrs
    simpa using (tau.dist_eq_iff (L.points j) (L.points r) (L.points s)).2 heq
  · intro j r s hrs hsj heq
    apply hnormalized.2 hrs hsj
    simpa using (tau.dist_eq_iff (L.points j) (L.points r) (L.points s)).2 heq

end CGN

namespace CapSelectedRowCounting

private theorem sameRadiusIndices_card_le_two
    {m : ℕ} (L : CGN.OrderedCap m)
    (hinj :
      (∀ {j r s : Fin m}, j < r → r < s →
        dist (L.points j) (L.points r) ≠ dist (L.points j) (L.points s)) ∧
      (∀ {j r s : Fin m}, r < s → s < j →
        dist (L.points j) (L.points r) ≠ dist (L.points j) (L.points s)))
    (j : Fin m) {S : Finset ℝ²} {radius : ℝ}
    (hsub : S ⊆ Finset.univ.image L.points)
    (hcenter : L.points j ∉ S)
    (hrad : ∀ x ∈ S, dist (L.points j) x = radius) :
    S.card ≤ 2 := by
  classical
  let I : Finset (Fin m) := Finset.univ.filter fun k => L.points k ∈ S
  let left : Finset (Fin m) := I.filter fun k => k < j
  let right : Finset (Fin m) := I.filter fun k => j < k
  have himage : I.image L.points = S := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨k, hk, rfl⟩
      exact (Finset.mem_filter.mp hk).2
    · intro hx
      rcases Finset.mem_image.mp (hsub hx) with ⟨k, _hk, rfl⟩
      exact Finset.mem_image.mpr
        ⟨k, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hx⟩, rfl⟩
  have hleft : left.card ≤ 1 := by
    rw [Finset.card_le_one]
    intro r hr s hs
    by_cases hrs : r = s
    · exact hrs
    · have hrI : r ∈ I := (Finset.mem_filter.mp hr).1
      have hsI : s ∈ I := (Finset.mem_filter.mp hs).1
      have hrj : r < j := (Finset.mem_filter.mp hr).2
      have hsj : s < j := (Finset.mem_filter.mp hs).2
      have hre : dist (L.points j) (L.points r) = radius :=
        hrad _ (Finset.mem_filter.mp hrI).2
      have hse : dist (L.points j) (L.points s) = radius :=
        hrad _ (Finset.mem_filter.mp hsI).2
      rcases lt_or_gt_of_ne hrs with hrs' | hsr'
      · exact False.elim (hinj.2 hrs' hsj (hre.trans hse.symm))
      · exact False.elim (hinj.2 hsr' hrj (hse.trans hre.symm))
  have hright : right.card ≤ 1 := by
    rw [Finset.card_le_one]
    intro r hr s hs
    by_cases hrs : r = s
    · exact hrs
    · have hrI : r ∈ I := (Finset.mem_filter.mp hr).1
      have hsI : s ∈ I := (Finset.mem_filter.mp hs).1
      have hjr : j < r := (Finset.mem_filter.mp hr).2
      have hjs : j < s := (Finset.mem_filter.mp hs).2
      have hre : dist (L.points j) (L.points r) = radius :=
        hrad _ (Finset.mem_filter.mp hrI).2
      have hse : dist (L.points j) (L.points s) = radius :=
        hrad _ (Finset.mem_filter.mp hsI).2
      rcases lt_or_gt_of_ne hrs with hrs' | hsr'
      · exact False.elim (hinj.1 hjr hrs' (hre.trans hse.symm))
      · exact False.elim (hinj.1 hjs hsr' (hse.trans hre.symm))
  have hcover : I ⊆ left ∪ right := by
    intro k hk
    have hkj : k ≠ j := by
      intro h
      subst k
      exact hcenter (Finset.mem_filter.mp hk).2
    rcases lt_or_gt_of_ne hkj with hlt | hgt
    · exact Finset.mem_union.mpr
        (Or.inl (Finset.mem_filter.mpr ⟨hk, hlt⟩))
    · exact Finset.mem_union.mpr
        (Or.inr (Finset.mem_filter.mpr ⟨hk, hgt⟩))
  calc
    S.card = I.card := by
      rw [← himage, Finset.card_image_of_injective _ L.injective]
    _ ≤ (left ∪ right).card := Finset.card_le_card hcover
    _ ≤ left.card + right.card := Finset.card_union_le _ _
    _ ≤ 1 + 1 := Nat.add_le_add hleft hright
    _ = 2 := by norm_num

private theorem sameRadiusIndices_card_le_one
    {m : ℕ} (L : CGN.OrderedCap m) (j : Fin m)
    (hpair : ∀ {r s : Fin m}, r ≠ s → r ≠ j → s ≠ j →
      dist (L.points j) (L.points r) ≠ dist (L.points j) (L.points s))
    {S : Finset ℝ²} {radius : ℝ}
    (hsub : S ⊆ Finset.univ.image L.points)
    (hcenter : L.points j ∉ S)
    (hrad : ∀ x ∈ S, dist (L.points j) x = radius) :
    S.card ≤ 1 := by
  classical
  let I : Finset (Fin m) := Finset.univ.filter fun k => L.points k ∈ S
  have himage : I.image L.points = S := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨k, hk, rfl⟩
      exact (Finset.mem_filter.mp hk).2
    · intro hx
      rcases Finset.mem_image.mp (hsub hx) with ⟨k, _hk, rfl⟩
      exact Finset.mem_image.mpr
        ⟨k, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hx⟩, rfl⟩
  rw [← himage, Finset.card_image_of_injective _ L.injective,
    Finset.card_le_one]
  intro r hr s hs
  by_cases hrs : r = s
  · exact hrs
  · have hrS : L.points r ∈ S := (Finset.mem_filter.mp hr).2
    have hsS : L.points s ∈ S := (Finset.mem_filter.mp hs).2
    have hrj : r ≠ j := by
      intro h
      subst r
      exact hcenter hrS
    have hsj : s ≠ j := by
      intro h
      subst s
      exact hcenter hsS
    exact False.elim (hpair hrs hrj hsj
      ((hrad _ hrS).trans (hrad _ hsS).symm))

/-- At the first endpoint of an ordered cap, a selected same-radius class has
at most one member in that cap. -/
theorem selectedFourClass_inter_orderedCap_first_card_le_one
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (K : SelectedFourClass A (L.points (CGN.firstIndex Packet.hm))) :
    (K.support ∩ Finset.univ.image L.points).card ≤ 1 := by
  classical
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  refine sameRadiusIndices_card_le_one L (CGN.firstIndex Packet.hm)
    (S := K.support ∩ Finset.univ.image L.points) (radius := K.radius)
    ?_ ?_ ?_ ?_
  · intro r s hrs hrfirst hsfirst
    have hfirst_r : CGN.firstIndex Packet.hm < r := by
      apply Fin.lt_def.mpr
      rw [CGN.firstIndex_val]
      have hrval : r.val ≠ 0 := by
        intro hzero
        apply hrfirst
        ext
        simpa [CGN.firstIndex, CGN.finIndex] using hzero
      omega
    have hfirst_s : CGN.firstIndex Packet.hm < s := by
      apply Fin.lt_def.mpr
      rw [CGN.firstIndex_val]
      have hsval : s.val ≠ 0 := by
        intro hzero
        apply hsfirst
        ext
        simpa [CGN.firstIndex, CGN.finIndex] using hzero
      omega
    rcases lt_or_gt_of_ne hrs with hrs' | hsr'
    · exact hinj.1 hfirst_r hrs'
    · exact fun heq => hinj.1 hfirst_s hsr' heq.symm
  · exact Finset.inter_subset_right
  · intro h
    exact K.center_not_mem (Finset.mem_inter.mp h).1
  · intro x hx
    exact K.support_eq_radius x (Finset.mem_inter.mp hx).1

/-- At the last endpoint of an ordered cap, a selected same-radius class has at
most one member in that cap. -/
theorem selectedFourClass_inter_orderedCap_last_card_le_one
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (K : SelectedFourClass A (L.points (CGN.lastIndex Packet.hm))) :
    (K.support ∩ Finset.univ.image L.points).card ≤ 1 := by
  classical
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  refine sameRadiusIndices_card_le_one L (CGN.lastIndex Packet.hm)
    (S := K.support ∩ Finset.univ.image L.points) (radius := K.radius)
    ?_ ?_ ?_ ?_
  · intro r s hrs hrlast hslast
    have hr_last : r < CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [CGN.lastIndex_val]
      have hrTop : r.val < m := r.isLt
      have hrval : r.val ≠ m - 1 := by
        intro htop
        apply hrlast
        ext
        simpa [CGN.lastIndex, CGN.finIndex] using htop
      omega
    have hs_last : s < CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [CGN.lastIndex_val]
      have hsTop : s.val < m := s.isLt
      have hsval : s.val ≠ m - 1 := by
        intro htop
        apply hslast
        ext
        simpa [CGN.lastIndex, CGN.finIndex] using htop
      omega
    rcases lt_or_gt_of_ne hrs with hrs' | hsr'
    · exact hinj.2 hrs' hs_last
    · exact fun heq => hinj.2 hsr' hr_last heq.symm
  · exact Finset.inter_subset_right
  · intro h
    exact K.center_not_mem (Finset.mem_inter.mp h).1
  · intro x hx
    exact K.support_eq_radius x (Finset.mem_inter.mp hx).1

/-- A selected four-class centered at a point of an indexed cap contains at
most two points of that cap. -/
theorem selectedFourClass_inter_capByIndex_card_le_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {center : ℝ²}
    (K : SelectedFourClass A center)
    (hcenter : center ∈ S.capByIndex i) :
    (K.support ∩ S.capByIndex i).card ≤ 2 := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenter
  rcases Finset.mem_image.mp hcenterImage with ⟨j, _hj, hjcenter⟩
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  apply sameRadiusIndices_card_le_two L hinj j
  · intro x hx
    rw [hcap]
    exact (Finset.mem_inter.mp hx).2
  · intro hj
    apply K.center_not_mem
    simpa [hjcenter] using (Finset.mem_inter.mp hj).1
  · intro x hx
    simpa [hjcenter] using K.support_eq_radius x (Finset.mem_inter.mp hx).1

/-- Two distinct centers of one ordered cap cannot both be equidistant from
the same two distinct points outside that cap. -/
theorem outsidePair_unique_capCenter
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A) (Hord : CGN.StrictCapOrder A L)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    {r s : Fin m} (hrs : r < s) {a b : ℝ²}
    (haA : a ∈ A) (hbA : b ∈ A)
    (haOutside : a ∉ Finset.univ.image L.points)
    (hbOutside : b ∉ Finset.univ.image L.points)
    (hab : a ≠ b)
    (hra : dist (L.points r) a = dist (L.points r) b)
    (hsa : dist (L.points s) a = dist (L.points s) b) : False := by
  have hrA : L.points r ∈ A := hmem r
  have hsA : L.points s ∈ A := hmem s
  have hrsPoint : L.points r ≠ L.points s := by
    intro h
    exact (ne_of_lt hrs) (L.injective h)
  have hrImage : L.points r ∈ Finset.univ.image L.points :=
    Finset.mem_image.mpr ⟨r, Finset.mem_univ _, rfl⟩
  have hsImage : L.points s ∈ Finset.univ.image L.points :=
    Finset.mem_image.mpr ⟨s, Finset.mem_univ _, rfl⟩
  have har : a ≠ L.points r := fun h => haOutside (h ▸ hrImage)
  have has : a ≠ L.points s := fun h => haOutside (h ▸ hsImage)
  have hbr : b ≠ L.points r := fun h => hbOutside (h ▸ hrImage)
  have hbs : b ≠ L.points s := fun h => hbOutside (h ▸ hsImage)
  have ha_nonpos : signedArea2 (L.points r) (L.points s) a ≤ 0 := by
    apply le_of_not_gt
    intro hpos
    rcases (Hord.subchord_open_side_iff_A hrs haA).mp hpos with ⟨j, _hrj, _hjs, hj⟩
    exact haOutside (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)
  have hb_nonpos : signedArea2 (L.points r) (L.points s) b ≤ 0 := by
    apply le_of_not_gt
    intro hpos
    rcases (Hord.subchord_open_side_iff_A hrs hbA).mp hpos with ⟨j, _hrj, _hjs, hj⟩
    exact hbOutside (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)
  have ha_ne : signedArea2 (L.points r) (L.points s) a ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear hrA hsA haA
      hrsPoint
      har.symm has.symm
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hb_ne : signedArea2 (L.points r) (L.points s) b ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear hrA hsA hbA
      hrsPoint
      hbr.symm hbs.symm
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have ha_neg : signedArea2 (L.points r) (L.points s) a < 0 :=
    lt_of_le_of_ne ha_nonpos ha_ne
  have hb_neg : signedArea2 (L.points r) (L.points s) b < 0 :=
    lt_of_le_of_ne hb_nonpos hb_ne
  have hsep := SurplusCOMPGBank.sep_signedArea2 a b (L.points r) (L.points s)
    (by simpa [dist_comm] using hra) (by simpa [dist_comm] using hsa) hab
  have hcyc_a :
      signedArea2 a (L.points r) (L.points s) =
        signedArea2 (L.points r) (L.points s) a := by
    unfold signedArea2
    ring
  have hcyc_b :
      signedArea2 b (L.points r) (L.points s) =
        signedArea2 (L.points r) (L.points s) b := by
    unfold signedArea2
    ring
  rw [hcyc_a, hcyc_b] at hsep
  nlinarith

/-- Outside pairs selected by distinct centers of one ordered cap are
disjoint, so their total pair incidence is bounded by all pairs in the cap
complement. -/
theorem orderedCap_outsidePairCount_sum_le
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A) :
    (∑ j : Fin m,
      Nat.choose
        ((F.classAt (L.points j) (Packet.mem_A j)).support \
          Finset.univ.image L.points).card 2) ≤
      Nat.choose (A \ Finset.univ.image L.points).card 2 := by
  classical
  let C : Finset ℝ² := Finset.univ.image L.points
  let B : Finset ℝ² := A \ C
  let K : ∀ j : Fin m, SelectedFourClass A (L.points j) :=
    fun j => F.classAt (L.points j) (Packet.mem_A j)
  let hits : Fin m → Finset ℝ² := fun j => (K j).support \ C
  let pairs : Fin m → Finset (Finset ℝ²) :=
    fun j => (hits j).powersetCard 2
  have hdisjoint :
      ((Finset.univ : Finset (Fin m)) : Set (Fin m)).PairwiseDisjoint pairs := by
    rintro r _hr s _hs hrs
    change Disjoint (pairs r) (pairs s)
    rw [Finset.disjoint_left]
    intro xy hxr hxs
    have hrData := Finset.mem_powersetCard.mp hxr
    have hsData := Finset.mem_powersetCard.mp hxs
    have hxyCard : xy.card = 2 := hrData.2
    rw [Finset.card_eq_two] at hxyCard
    rcases hxyCard with ⟨a, b, hab, rfl⟩
    have haR : a ∈ hits r := hrData.1 (by simp)
    have hbR : b ∈ hits r := hrData.1 (by simp)
    have haS : a ∈ hits s := hsData.1 (by simp)
    have hbS : b ∈ hits s := hsData.1 (by simp)
    have haK : a ∈ (K r).support := (Finset.mem_sdiff.mp haR).1
    have hbK : b ∈ (K r).support := (Finset.mem_sdiff.mp hbR).1
    have haKS : a ∈ (K s).support := (Finset.mem_sdiff.mp haS).1
    have hbKS : b ∈ (K s).support := (Finset.mem_sdiff.mp hbS).1
    have hra : dist (L.points r) a = dist (L.points r) b :=
      ((K r).support_eq_radius a haK).trans
        ((K r).support_eq_radius b hbK).symm
    have hsa : dist (L.points s) a = dist (L.points s) b :=
      ((K s).support_eq_radius a haKS).trans
        ((K s).support_eq_radius b hbKS).symm
    have haA : a ∈ A := (K r).support_subset_A haK
    have hbA : b ∈ A := (K r).support_subset_A hbK
    have haOutside : a ∉ C := (Finset.mem_sdiff.mp haR).2
    have hbOutside : b ∉ C := (Finset.mem_sdiff.mp hbR).2
    rcases lt_or_gt_of_ne hrs with hrs' | hsr'
    · exact outsidePair_unique_capCenter hconv Hord Packet.mem_A hrs'
        haA hbA haOutside hbOutside hab hra hsa
    · exact outsidePair_unique_capCenter hconv Hord Packet.mem_A hsr'
        haA hbA haOutside hbOutside hab hsa hra
  have hallPairsSubset :
      (Finset.univ.biUnion pairs) ⊆ B.powersetCard 2 := by
    intro xy hxy
    rcases Finset.mem_biUnion.mp hxy with ⟨j, _hj, hjxy⟩
    have hjData := Finset.mem_powersetCard.mp hjxy
    apply Finset.mem_powersetCard.mpr
    refine ⟨?_, hjData.2⟩
    intro x hx
    have hx' : x ∈ hits j := hjData.1 hx
    exact Finset.mem_sdiff.mpr
      ⟨(K j).support_subset_A (Finset.mem_sdiff.mp hx').1,
        (Finset.mem_sdiff.mp hx').2⟩
  change (∑ j : Fin m, Nat.choose (hits j).card 2) ≤ Nat.choose B.card 2
  calc
    (∑ j : Fin m, Nat.choose (hits j).card 2) =
        ∑ j : Fin m, (pairs j).card := by
      apply Finset.sum_congr rfl
      intro j _hj
      rw [Finset.card_powersetCard]
    _ = (Finset.univ.biUnion pairs).card := by
      rw [Finset.card_biUnion hdisjoint]
    _ ≤ (B.powersetCard 2).card := Finset.card_le_card hallPairsSubset
    _ = Nat.choose B.card 2 := Finset.card_powersetCard 2 B

/-- In the equality case of the cap pair count, every endpoint row has exactly
one cap member and every interior row has exactly two. -/
theorem orderedCap_selected_support_inter_card_eq_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    (j : Fin 6) :
    ((F.classAt (L.points j) (Packet.mem_A j)).support ∩
        Finset.univ.image L.points).card =
      if j = CGN.firstIndex Packet.hm then 1
      else if j = CGN.lastIndex Packet.hm then 1 else 2 := by
  classical
  let C : Finset ℝ² := Finset.univ.image L.points
  let K : ∀ j : Fin 6, SelectedFourClass A (L.points j) :=
    fun j => F.classAt (L.points j) (Packet.mem_A j)
  let hits : Fin 6 → Finset ℝ² := fun j => (K j).support \ C
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  have hcapTwo (i : Fin 6) : ((K i).support ∩ C).card ≤ 2 := by
    apply sameRadiusIndices_card_le_two L hinj i
    · exact Finset.inter_subset_right
    · intro h
      exact (K i).center_not_mem (Finset.mem_inter.mp h).1
    · intro x hx
      exact (K i).support_eq_radius x (Finset.mem_inter.mp hx).1
  have hfirstCap :
      ((K (CGN.firstIndex Packet.hm)).support ∩ C).card ≤ 1 := by
    simpa [C] using selectedFourClass_inter_orderedCap_first_card_le_one
      Packet Hside Hord (K (CGN.firstIndex Packet.hm))
  have hlastCap :
      ((K (CGN.lastIndex Packet.hm)).support ∩ C).card ≤ 1 := by
    simpa [C] using selectedFourClass_inter_orderedCap_last_card_le_one
      Packet Hside Hord (K (CGN.lastIndex Packet.hm))
  have hsplit (i : Fin 6) :
      (hits i).card + ((K i).support ∩ C).card = 4 := by
    change ((K i).support \ C).card + ((K i).support ∩ C).card = 4
    rw [Finset.card_sdiff_add_card_inter, (K i).support_card]
  have houtsideTwo (i : Fin 6) : 2 ≤ (hits i).card := by
    have := hsplit i
    have := hcapTwo i
    omega
  have hfirstOutside : 3 ≤ (hits (CGN.firstIndex Packet.hm)).card := by
    have := hsplit (CGN.firstIndex Packet.hm)
    omega
  have hlastOutside : 3 ≤ (hits (CGN.lastIndex Packet.hm)).card := by
    have := hsplit (CGN.lastIndex Packet.hm)
    omega
  have hchooseOne (i : Fin 6) : 1 ≤ Nat.choose (hits i).card 2 := by
    calc
      1 = Nat.choose 2 2 := by norm_num
      _ ≤ Nat.choose (hits i).card 2 := Nat.choose_le_choose 2 (houtsideTwo i)
  have hfirstChoose :
      3 ≤ Nat.choose (hits (CGN.firstIndex Packet.hm)).card 2 := by
    calc
      3 = Nat.choose 3 2 := by norm_num
      _ ≤ Nat.choose (hits (CGN.firstIndex Packet.hm)).card 2 :=
        Nat.choose_le_choose 2 hfirstOutside
  have hlastChoose :
      3 ≤ Nat.choose (hits (CGN.lastIndex Packet.hm)).card 2 := by
    calc
      3 = Nat.choose 3 2 := by norm_num
      _ ≤ Nat.choose (hits (CGN.lastIndex Packet.hm)).card 2 :=
        Nat.choose_le_choose 2 hlastOutside
  have hfirstLast : CGN.firstIndex Packet.hm ≠ CGN.lastIndex Packet.hm := by
    intro h
    have hval : (0 : ℕ) = 6 - 1 := by
      simpa [CGN.firstIndex_val, CGN.lastIndex_val] using congrArg Fin.val h
    omega
  let weight : Fin 6 → ℕ := fun i =>
    1 + (if i = CGN.firstIndex Packet.hm then 2 else 0) +
      (if i = CGN.lastIndex Packet.hm then 2 else 0)
  have hweight (i : Fin 6) : weight i ≤ Nat.choose (hits i).card 2 := by
    by_cases hfirst : i = CGN.firstIndex Packet.hm
    · subst i
      simpa [weight, hfirstLast] using hfirstChoose
    · by_cases hlast : i = CGN.lastIndex Packet.hm
      · subst i
        simpa [weight, hfirstLast.symm] using hlastChoose
      · simpa [weight, hfirst, hlast] using hchooseOne i
  have hweightSum : ∑ i : Fin 6, weight i = 10 := by
    simp [weight, Finset.sum_add_distrib, Nat.add_assoc]
  have hsumLower : 10 ≤ ∑ i : Fin 6, Nat.choose (hits i).card 2 := by
    rw [← hweightSum]
    exact Finset.sum_le_sum fun i _hi => hweight i
  have hsumUpper := orderedCap_outsidePairCount_sum_le Packet Hord hconv F
  change (∑ i : Fin 6, Nat.choose (hits i).card 2) ≤
    Nat.choose (A \ C).card 2 at hsumUpper
  rw [houtside] at hsumUpper
  norm_num [Nat.choose] at hsumUpper
  have hsumEq : ∑ i : Fin 6, Nat.choose (hits i).card 2 = 10 := by omega
  have hpairEq (i : Fin 6) : Nat.choose (hits i).card 2 = weight i := by
    by_contra hne
    have hlt : weight i < Nat.choose (hits i).card 2 :=
      lt_of_le_of_ne (hweight i) (fun h => hne h.symm)
    have hsumLt : (∑ k : Fin 6, weight k) <
        ∑ k : Fin 6, Nat.choose (hits k).card 2 := by
      apply Finset.sum_lt_sum
      · intro k _hk
        exact hweight k
      · exact ⟨i, Finset.mem_univ _, hlt⟩
    rw [hweightSum, hsumEq] at hsumLt
    omega
  change ((K j).support ∩ C).card = _
  by_cases hfirst : j = CGN.firstIndex Packet.hm
  · subst j
    simp only [if_pos]
    by_contra hne
    have hzero :
        ((K (CGN.firstIndex Packet.hm)).support ∩ C).card = 0 := by omega
    have houtFour : (hits (CGN.firstIndex Packet.hm)).card = 4 := by
      have := hsplit (CGN.firstIndex Packet.hm)
      omega
    have hp := hpairEq (CGN.firstIndex Packet.hm)
    have hp' : Nat.choose 4 2 = 3 := by
      simpa [houtFour, weight, hfirstLast] using hp
    norm_num [Nat.choose] at hp'
  · by_cases hlast : j = CGN.lastIndex Packet.hm
    · subst j
      simp only [if_neg hfirstLast.symm, if_pos]
      by_contra hne
      have hzero :
          ((K (CGN.lastIndex Packet.hm)).support ∩ C).card = 0 := by omega
      have houtFour : (hits (CGN.lastIndex Packet.hm)).card = 4 := by
        have := hsplit (CGN.lastIndex Packet.hm)
        omega
      have hp := hpairEq (CGN.lastIndex Packet.hm)
      have hp' : Nat.choose 4 2 = 3 := by
        simpa [houtFour, weight, hfirstLast.symm] using hp
      norm_num [Nat.choose] at hp'
    · simp only [if_neg hfirst, if_neg hlast]
      by_contra hne
      have hcapOne : ((K j).support ∩ C).card ≤ 1 := by
        have := hcapTwo j
        omega
      have houtThree : 3 ≤ (hits j).card := by
        have := hsplit j
        omega
      have hchooseThree : 3 ≤ Nat.choose (hits j).card 2 := by
        calc
          3 = Nat.choose 3 2 := by norm_num
          _ ≤ Nat.choose (hits j).card 2 :=
            Nat.choose_le_choose 2 houtThree
      have hp := hpairEq j
      have hp' : Nat.choose (hits j).card 2 = 1 := by
        simpa [weight, hfirst, hlast] using hp
      omega

/-- Pair-incidence double count for one ordered cap. Each cap-center row has at
least two support points outside the cap, while the endpoint rows have at least
three. Outside pairs are unique to their cap center. -/
theorem orderedCap_card_add_four_le_choose_outside
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A) :
    m + 4 ≤ Nat.choose (A \ Finset.univ.image L.points).card 2 := by
  classical
  let C : Finset ℝ² := Finset.univ.image L.points
  let B : Finset ℝ² := A \ C
  let K : ∀ j : Fin m, SelectedFourClass A (L.points j) :=
    fun j => F.classAt (L.points j) (Packet.mem_A j)
  let hits : Fin m → Finset ℝ² := fun j => (K j).support ∩ B
  let pairs : Fin m → Finset (Finset ℝ²) :=
    fun j => (hits j).powersetCard 2
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  have hcapTwo (j : Fin m) : ((K j).support ∩ C).card ≤ 2 := by
    apply sameRadiusIndices_card_le_two L hinj j
    · exact Finset.inter_subset_right
    · intro h
      exact (K j).center_not_mem (Finset.mem_inter.mp h).1
    · intro x hx
      exact (K j).support_eq_radius x (Finset.mem_inter.mp hx).1
  have houtsideTwo (j : Fin m) : 2 ≤ (hits j).card := by
    have hsdiff : (K j).support \ C = hits j := by
      ext x
      constructor
      · intro hx
        rcases Finset.mem_sdiff.mp hx with ⟨hxK, hxC⟩
        exact Finset.mem_inter.mpr
          ⟨hxK, Finset.mem_sdiff.mpr ⟨(K j).support_subset_A hxK, hxC⟩⟩
      · intro hx
        rcases Finset.mem_inter.mp hx with ⟨hxK, hxB⟩
        exact Finset.mem_sdiff.mpr ⟨hxK, (Finset.mem_sdiff.mp hxB).2⟩
    have hsplit :
        ((K j).support \ C).card + ((K j).support ∩ C).card =
          (K j).support.card :=
      Finset.card_sdiff_add_card_inter _ _
    rw [hsdiff, (K j).support_card] at hsplit
    have := hcapTwo j
    omega
  have hfirstOutside : 3 ≤ (hits (CGN.firstIndex Packet.hm)).card := by
    have hcapOne := selectedFourClass_inter_orderedCap_first_card_le_one
      Packet Hside Hord (K (CGN.firstIndex Packet.hm))
    change ((K (CGN.firstIndex Packet.hm)).support ∩ C).card ≤ 1 at hcapOne
    have hsdiff :
        (K (CGN.firstIndex Packet.hm)).support \ C =
          hits (CGN.firstIndex Packet.hm) := by
      ext x
      constructor
      · intro hx
        rcases Finset.mem_sdiff.mp hx with ⟨hxK, hxC⟩
        exact Finset.mem_inter.mpr
          ⟨hxK, Finset.mem_sdiff.mpr
            ⟨(K (CGN.firstIndex Packet.hm)).support_subset_A hxK, hxC⟩⟩
      · intro hx
        rcases Finset.mem_inter.mp hx with ⟨hxK, hxB⟩
        exact Finset.mem_sdiff.mpr ⟨hxK, (Finset.mem_sdiff.mp hxB).2⟩
    have hsplit :
        ((K (CGN.firstIndex Packet.hm)).support \ C).card +
            ((K (CGN.firstIndex Packet.hm)).support ∩ C).card =
          (K (CGN.firstIndex Packet.hm)).support.card :=
      Finset.card_sdiff_add_card_inter _ _
    rw [hsdiff, (K (CGN.firstIndex Packet.hm)).support_card] at hsplit
    omega
  have hlastOutside : 3 ≤ (hits (CGN.lastIndex Packet.hm)).card := by
    have hcapOne := selectedFourClass_inter_orderedCap_last_card_le_one
      Packet Hside Hord (K (CGN.lastIndex Packet.hm))
    change ((K (CGN.lastIndex Packet.hm)).support ∩ C).card ≤ 1 at hcapOne
    have hsdiff :
        (K (CGN.lastIndex Packet.hm)).support \ C =
          hits (CGN.lastIndex Packet.hm) := by
      ext x
      constructor
      · intro hx
        rcases Finset.mem_sdiff.mp hx with ⟨hxK, hxC⟩
        exact Finset.mem_inter.mpr
          ⟨hxK, Finset.mem_sdiff.mpr
            ⟨(K (CGN.lastIndex Packet.hm)).support_subset_A hxK, hxC⟩⟩
      · intro hx
        rcases Finset.mem_inter.mp hx with ⟨hxK, hxB⟩
        exact Finset.mem_sdiff.mpr ⟨hxK, (Finset.mem_sdiff.mp hxB).2⟩
    have hsplit :
        ((K (CGN.lastIndex Packet.hm)).support \ C).card +
            ((K (CGN.lastIndex Packet.hm)).support ∩ C).card =
          (K (CGN.lastIndex Packet.hm)).support.card :=
      Finset.card_sdiff_add_card_inter _ _
    rw [hsdiff, (K (CGN.lastIndex Packet.hm)).support_card] at hsplit
    omega
  have hpairsOne (j : Fin m) : 1 ≤ (pairs j).card := by
    change 1 ≤ ((hits j).powersetCard 2).card
    rw [Finset.card_powersetCard]
    calc
      1 = Nat.choose 2 2 := by norm_num
      _ ≤ Nat.choose (hits j).card 2 :=
        Nat.choose_le_choose 2 (houtsideTwo j)
  have hfirstPairs : 3 ≤ (pairs (CGN.firstIndex Packet.hm)).card := by
    change 3 ≤ ((hits (CGN.firstIndex Packet.hm)).powersetCard 2).card
    rw [Finset.card_powersetCard]
    calc
      3 = Nat.choose 3 2 := by norm_num
      _ ≤ Nat.choose (hits (CGN.firstIndex Packet.hm)).card 2 :=
        Nat.choose_le_choose 2 hfirstOutside
  have hlastPairs : 3 ≤ (pairs (CGN.lastIndex Packet.hm)).card := by
    change 3 ≤ ((hits (CGN.lastIndex Packet.hm)).powersetCard 2).card
    rw [Finset.card_powersetCard]
    calc
      3 = Nat.choose 3 2 := by norm_num
      _ ≤ Nat.choose (hits (CGN.lastIndex Packet.hm)).card 2 :=
        Nat.choose_le_choose 2 hlastOutside
  have hfirstLast : CGN.firstIndex Packet.hm ≠ CGN.lastIndex Packet.hm := by
    intro h
    have hm1 : 1 < m := by simpa using Packet.hm
    have hval : (0 : ℕ) = m - 1 := by
      simpa [CGN.firstIndex_val, CGN.lastIndex_val] using congrArg Fin.val h
    exact (Nat.sub_ne_zero_of_lt hm1) hval.symm
  let weight : Fin m → ℕ := fun j =>
    1 + (if j = CGN.firstIndex Packet.hm then 2 else 0) +
      (if j = CGN.lastIndex Packet.hm then 2 else 0)
  have hweight (j : Fin m) : weight j ≤ (pairs j).card := by
    by_cases hfirst : j = CGN.firstIndex Packet.hm
    · subst j
      simpa [weight, hfirstLast] using hfirstPairs
    · by_cases hlast : j = CGN.lastIndex Packet.hm
      · subst j
        simpa [weight, hfirstLast.symm] using hlastPairs
      · simpa [weight, hfirst, hlast] using hpairsOne j
  have hweightSum : ∑ j : Fin m, weight j = m + 4 := by
    simp [weight, Finset.sum_add_distrib, hfirstLast, Nat.add_assoc,
      Nat.add_comm, Nat.add_left_comm]
  have hlower : m + 4 ≤ ∑ j : Fin m, (pairs j).card := by
    rw [← hweightSum]
    exact Finset.sum_le_sum fun j _hj => hweight j
  have hdisjoint :
      ((Finset.univ : Finset (Fin m)) : Set (Fin m)).PairwiseDisjoint pairs := by
    rintro r _hr s _hs hrs
    change Disjoint (pairs r) (pairs s)
    rw [Finset.disjoint_left]
    intro xy hxr hxs
    have hrData := Finset.mem_powersetCard.mp hxr
    have hsData := Finset.mem_powersetCard.mp hxs
    have hxyCard : xy.card = 2 := hrData.2
    rw [Finset.card_eq_two] at hxyCard
    rcases hxyCard with ⟨a, b, hab, rfl⟩
    have haR : a ∈ hits r := hrData.1 (by simp)
    have hbR : b ∈ hits r := hrData.1 (by simp)
    have haS : a ∈ hits s := hsData.1 (by simp)
    have hbS : b ∈ hits s := hsData.1 (by simp)
    have haK : a ∈ (K r).support := (Finset.mem_inter.mp haR).1
    have hbK : b ∈ (K r).support := (Finset.mem_inter.mp hbR).1
    have haKS : a ∈ (K s).support := (Finset.mem_inter.mp haS).1
    have hbKS : b ∈ (K s).support := (Finset.mem_inter.mp hbS).1
    have haB : a ∈ B := (Finset.mem_inter.mp haR).2
    have hbB : b ∈ B := (Finset.mem_inter.mp hbR).2
    have hra : dist (L.points r) a = dist (L.points r) b :=
      ((K r).support_eq_radius a haK).trans
        ((K r).support_eq_radius b hbK).symm
    have hsa : dist (L.points s) a = dist (L.points s) b :=
      ((K s).support_eq_radius a haKS).trans
        ((K s).support_eq_radius b hbKS).symm
    rcases lt_or_gt_of_ne hrs with hrs' | hsr'
    · exact outsidePair_unique_capCenter hconv Hord Packet.mem_A hrs'
        (Finset.mem_sdiff.mp haB).1 (Finset.mem_sdiff.mp hbB).1
        (Finset.mem_sdiff.mp haB).2 (Finset.mem_sdiff.mp hbB).2 hab hra hsa
    · exact outsidePair_unique_capCenter hconv Hord Packet.mem_A hsr'
        (Finset.mem_sdiff.mp haB).1 (Finset.mem_sdiff.mp hbB).1
        (Finset.mem_sdiff.mp haB).2 (Finset.mem_sdiff.mp hbB).2 hab hsa hra
  have hallPairsSubset :
      (Finset.univ.biUnion pairs) ⊆ B.powersetCard 2 := by
    intro xy hxy
    rcases Finset.mem_biUnion.mp hxy with ⟨j, _hj, hjxy⟩
    have hjData := Finset.mem_powersetCard.mp hjxy
    exact Finset.mem_powersetCard.mpr
      ⟨hjData.1.trans Finset.inter_subset_right, hjData.2⟩
  have hupper :
      (∑ j : Fin m, (pairs j).card) ≤ Nat.choose B.card 2 := by
    rw [← Finset.card_biUnion hdisjoint]
    calc
      (Finset.univ.biUnion pairs).card ≤ (B.powersetCard 2).card :=
        Finset.card_le_card hallPairsSubset
      _ = Nat.choose B.card 2 := Finset.card_powersetCard 2 B
  change m + 4 ≤ Nat.choose B.card 2
  exact hlower.trans hupper

/-- In an `(m,4,4)` packet with global K4, cap-local distance injectivity and
outside-pair uniqueness force the surplus cap to have size at most six. -/
theorem SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) :
    S.surplusCap.card ≤ 6 := by
  classical
  rcases exists_faithfulCarrierPattern_of_globalK4 hK4 S.triangle.v1_mem with ⟨F⟩
  rcases S.capByIndex_cgn4g_capData hconv S.surplusIdx with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hindexed := orderedCap_card_add_four_le_choose_outside
    Packet Hside Hord hconv F
  have hcapSurplus : S.capByIndex S.surplusIdx = S.surplusCap := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;> simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi]
  have hCcard : (Finset.univ.image L.points).card = m := by
    rw [Finset.card_image_of_injective _ L.injective, Finset.card_univ,
      Fintype.card_fin]
  have hCsub : Finset.univ.image L.points ⊆ A := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨j, _hj, rfl⟩
    exact Packet.mem_A j
  have hBcard : (A \ Finset.univ.image L.points).card = 5 := by
    rw [Finset.card_sdiff_of_subset hCsub]
    have hsurplus := hM44.surplus_card_eq
    have hcapCard : (Finset.univ.image L.points).card = S.surplusCap.card := by
      rw [hcap, hcapSurplus]
    omega
  rw [hBcard] at hindexed
  norm_num [Nat.choose] at hindexed
  have hm : m ≤ 6 := by omega
  have hcapCard : m = S.surplusCap.card := by
    rw [← hCcard, hcap, hcapSurplus]
  omega

/-- The non-label-complete `(m,4,4)` branch is forced to the single value
`m = 6`; there is no residual branch with a larger surplus cap. -/
theorem SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hgt : 5 < S.surplusCap.card) :
    S.surplusCap.card = 6 := by
  have hle := SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4
    S hconv hK4 hM44
  omega

/-- Consequently, the general-`m` pinned-surplus branch is entirely a
card-eleven `(6,4,4)` problem. -/
theorem SurplusCapPacket.card_eq_eleven_of_surplus_card_gt_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hgt : 5 < S.surplusCap.card) :
    A.card = 11 := by
  have hm := SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4
    S hconv hK4 hM44 hgt
  have hcard := hM44.surplus_card_eq
  omega

/-- At the forced card-eleven equality case, the surplus cap admits a
six-point ordered indexing on which every selected row has the exact endpoint
or interior cap-hit count. -/
theorem SurplusCapPacket.exists_orderedSurplusCapSix_with_selected_hitCounts
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (F : FaithfulCarrierPattern A) (hcard : S.surplusCap.card = 6) :
    ∃ L : CGN.OrderedCap 6,
      ∃ Packet : CGN.MecCapPacket A L,
      ∃ Hside : CGN.MinorCapSideHypotheses Packet,
      ∃ Hord : CGN.StrictCapOrder A L,
        Finset.univ.image L.points = S.surplusCap ∧
        ∀ j : Fin 6,
          ((F.classAt (L.points j) (Packet.mem_A j)).support ∩
              Finset.univ.image L.points).card =
            if j = CGN.firstIndex Packet.hm then 1
            else if j = CGN.lastIndex Packet.hm then 1 else 2 := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv S.surplusIdx with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcapSurplus : S.capByIndex S.surplusIdx = S.surplusCap := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;> simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi]
  have himageCard : (Finset.univ.image L.points).card = 6 := by
    rw [hcap, hcapSurplus, hcard]
  have hm : m = 6 := by
    rw [Finset.card_image_of_injective _ L.injective, Finset.card_univ,
      Fintype.card_fin] at himageCard
    exact himageCard
  subst m
  have hCsub : Finset.univ.image L.points ⊆ A := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨j, _hj, rfl⟩
    exact Packet.mem_A j
  have hAcard : A.card = 11 := by
    have hsum := hM44.surplus_card_eq
    omega
  have houtside : (A \ Finset.univ.image L.points).card = 5 := by
    rw [Finset.card_sdiff_of_subset hCsub, himageCard, hAcard]
  refine ⟨L, Packet, Hside, Hord, hcap.trans hcapSurplus, ?_⟩
  intro j
  exact orderedCap_selected_support_inter_card_eq_of_six_five
    Packet Hside Hord hconv F houtside j

end CapSelectedRowCounting

end Problem97
