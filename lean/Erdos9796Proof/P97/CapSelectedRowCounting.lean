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

/-- If a carrier point on an ordered minor cap is equidistant from two other
cap points, then its cap index lies strictly between their indices. -/
theorem index_strictly_between_of_equidistant
    {A : Finset ℝ²} {m : ℕ} {L : OrderedCap m}
    (Packet : MecCapPacket A L)
    (Hside : MinorCapSideHypotheses Packet)
    (Hord : StrictCapOrder A L)
    {j r s : Fin m}
    (hrs : r < s) (hjr : j ≠ r) (hjs : j ≠ s)
    (heq : dist (L.points j) (L.points r) =
      dist (L.points j) (L.points s)) :
    r < j ∧ j < s := by
  have hinj := oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  constructor
  · by_contra hrj
    have hjr' : j < r := by omega
    exact (hinj.1 hjr' hrs) heq
  · by_contra hjs'
    have hsj : s < j := by omega
    exact (hinj.2 hrs hsj) heq

/-- If a carrier point on an ordered minor cap is equidistant from two other
cap points, its image in any injective counterclockwise boundary enumeration
lies cyclically between their images.  This is the enumeration-independent
bridge from the local `StrictCapOrder` used by CGN to boundary-indexed finite
valuations. -/
theorem boundary_indices_cyclically_between_of_equidistant
    {A : Finset ℝ²} {m n : ℕ} {L : OrderedCap m}
    (Packet : MecCapPacket A L)
    (Hside : MinorCapSideHypotheses Packet)
    (Hord : StrictCapOrder A L)
    {φ : Fin n → ℝ²} (hφinj : Function.Injective φ)
    (hφccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {j r s : Fin m} {ij ir is : Fin n}
    (hrs : r < s) (hjr : j ≠ r) (hjs : j ≠ s)
    (heq : dist (L.points j) (L.points r) =
      dist (L.points j) (L.points s))
    (hij : φ ij = L.points j)
    (hir : φ ir = L.points r)
    (his : φ is = L.points s) :
    (ir < ij ∧ ij < is) ∨ (ij < is ∧ is < ir) ∨
      (is < ir ∧ ir < ij) := by
  have hlocal :=
    index_strictly_between_of_equidistant
      Packet Hside Hord hrs hjr hjs heq
  have hpos :
      0 < signedArea2 (L.points r) (L.points s) (L.points j) :=
    (Hord.subchord_open_side_iff_A hrs (Packet.mem_A j)).2
      ⟨j, hlocal.1, hlocal.2, rfl⟩
  have harea : signedArea2 (φ ir) (φ ij) (φ is) < 0 := by
    rw [hir, hij, his]
    have hswap :
        signedArea2 (L.points r) (L.points j) (L.points s) =
          -signedArea2 (L.points r) (L.points s) (L.points j) := by
      simp [signedArea2]
    rw [hswap]
    linarith
  have hirj : ir ≠ ij := by
    intro h
    subst ij
    simp [signedArea2] at harea
  have hjis : ij ≠ is := by
    intro h
    subst is
    simp [signedArea2] at harea
  have hsir : is ≠ ir := by
    intro h
    subst is
    simp [signedArea2] at harea
  have hneg : ∀ {a b c : Fin n}, a < b → b < c →
      signedArea2 (φ a) (φ b) (φ c) < 0 :=
    Problem97.hneg_of_ccw hφinj hφccw
  have hnot_irsj : ¬ (ir < is ∧ is < ij) := by
    rintro ⟨hrsi, hsij⟩
    have h := hneg hrsi hsij
    have hswap : signedArea2 (φ ir) (φ is) (φ ij) =
        -signedArea2 (φ ir) (φ ij) (φ is) := by
      simp [signedArea2]
    rw [hswap] at h
    linarith
  have hnot_sjir : ¬ (is < ij ∧ ij < ir) := by
    rintro ⟨hsj, hjr⟩
    have h := hneg hsj hjr
    have hswap : signedArea2 (φ is) (φ ij) (φ ir) =
        -signedArea2 (φ ir) (φ ij) (φ is) := by
      simp [signedArea2]
      ring
    rw [hswap] at h
    linarith
  have hnot_jris : ¬ (ij < ir ∧ ir < is) := by
    rintro ⟨hjr, hrs⟩
    have h := hneg hjr hrs
    have hswap : signedArea2 (φ ij) (φ ir) (φ is) =
        -signedArea2 (φ ir) (φ ij) (φ is) := by
      simp [signedArea2]
      ring
    rw [hswap] at h
    linarith
  omega

/-- A cap point that is not between two local cap indices in the retained
global boundary block cannot be equidistant from those two points. -/
theorem StrictCapBlockData.not_equidistant_of_boundary_not_between
    {A C : Finset ℝ²} (B : StrictCapBlockData A C)
    {j r s : Fin B.m}
    (hrs : r < s) (hjr : j ≠ r) (hjs : j ≠ s)
    (hnot : ¬ (B.Block.idx r < B.Block.idx j ∧
      B.Block.idx j < B.Block.idx s)) :
    dist (B.L.points j) (B.L.points r) ≠
      dist (B.L.points j) (B.L.points s) := by
  intro heq
  have hlocal := index_strictly_between_of_equidistant
    B.Packet B.Hside B.Hord hrs hjr hjs heq
  exact hnot ⟨B.Block.idx_strict hlocal.1, B.Block.idx_strict hlocal.2⟩

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

/-- Every positive-radius selected class centered at a point of an indexed cap
contains at most two points of that cap. -/
theorem selectedClass_inter_capByIndex_card_le_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {center : ℝ²} {radius : ℝ}
    (hcenter : center ∈ S.capByIndex i) (hradius : 0 < radius) :
    (SelectedClass A center radius ∩ S.capByIndex i).card ≤ 2 := by
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
    have hd := (mem_selectedClass.mp (Finset.mem_inter.mp hj).1).2
    rw [hjcenter, dist_self] at hd
    exact (ne_of_gt hradius) hd.symm
  · intro x hx
    simpa [hjcenter] using
      (mem_selectedClass.mp (Finset.mem_inter.mp hx).1).2

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

/-- Every selected four-class admits a cap containing its center, and at
least two of its four witnesses lie outside that cap.  This is the uniform
cap-composition clause used by the FreshThird survivor-row census. -/
theorem selectedFourClass_exists_capByIndex_with_two_outside
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) {center : ℝ²}
    (hcenterA : center ∈ A) (K : SelectedFourClass A center) :
    ∃ i : Fin 3,
      center ∈ S.capByIndex i ∧
      (K.support ∩ S.capByIndex i).card ≤ 2 ∧
      2 ≤ (K.support \ S.capByIndex i).card := by
  classical
  rcases S.exists_mem_capByIndex_of_mem hcenterA with ⟨i, hi⟩
  have hinter : (K.support ∩ S.capByIndex i).card ≤ 2 :=
    selectedFourClass_inter_capByIndex_card_le_two S hconv i K hi
  have hsplit := Finset.card_sdiff_add_card_inter K.support (S.capByIndex i)
  rw [K.support_card] at hsplit
  exact ⟨i, hi, hinter, by omega⟩

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

/-- A pair of points outside an ordered cap has at most one selected-row
    owner.  This packages the distance formulation above directly in terms
    of a faithful carrier pattern. -/
theorem orderedCap_outsidePair_owner_unique
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    {a b : ℝ²} (haA : a ∈ A) (hbA : b ∈ A)
    (haOutside : a ∉ Finset.univ.image L.points)
    (hbOutside : b ∉ Finset.univ.image L.points)
    (hab : a ≠ b) {r s : Fin m}
    (haR : a ∈ (F.classAt (L.points r) (Packet.mem_A r)).support)
    (hbR : b ∈ (F.classAt (L.points r) (Packet.mem_A r)).support)
    (haS : a ∈ (F.classAt (L.points s) (Packet.mem_A s)).support)
    (hbS : b ∈ (F.classAt (L.points s) (Packet.mem_A s)).support) :
    r = s := by
  by_contra hrs
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact outsidePair_unique_capCenter hconv Hord Packet.mem_A hrs'
      haA hbA haOutside hbOutside hab
      (((F.classAt (L.points r) (Packet.mem_A r)).support_eq_radius a haR).trans
        ((F.classAt (L.points r) (Packet.mem_A r)).support_eq_radius b hbR).symm)
      (((F.classAt (L.points s) (Packet.mem_A s)).support_eq_radius a haS).trans
        ((F.classAt (L.points s) (Packet.mem_A s)).support_eq_radius b hbS).symm)
  · exact outsidePair_unique_capCenter hconv Hord Packet.mem_A hsr'
      haA hbA haOutside hbOutside hab
      (((F.classAt (L.points s) (Packet.mem_A s)).support_eq_radius a haS).trans
        ((F.classAt (L.points s) (Packet.mem_A s)).support_eq_radius b hbS).symm)
      (((F.classAt (L.points r) (Packet.mem_A r)).support_eq_radius a haR).trans
        ((F.classAt (L.points r) (Packet.mem_A r)).support_eq_radius b hbR).symm)

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
six-point ordered indexing whose endpoints are the two Moser endpoints and on
which every selected row has the exact endpoint or interior cap-hit count. -/
theorem SurplusCapPacket.exists_orderedSurplusCapSix_with_selected_hitCounts_and_endpoints
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (F : FaithfulCarrierPattern A) (hcard : S.surplusCap.card = 6) :
    ∃ L : CGN.OrderedCap 6,
      ∃ Packet : CGN.MecCapPacket A L,
      ∃ Hside : CGN.MinorCapSideHypotheses Packet,
      ∃ Hord : CGN.StrictCapOrder A L,
        Finset.univ.image L.points = S.surplusCap ∧
        (((L.points (CGN.firstIndex Packet.hm) =
                (S.triangleByIndex S.surplusIdx).v2 ∧
              L.points (CGN.lastIndex Packet.hm) =
                (S.triangleByIndex S.surplusIdx).v3) ∨
            (L.points (CGN.firstIndex Packet.hm) =
                (S.triangleByIndex S.surplusIdx).v3 ∧
              L.points (CGN.lastIndex Packet.hm) =
                (S.triangleByIndex S.surplusIdx).v2)) ∧
          ∀ j : Fin 6,
            ((F.classAt (L.points j) (Packet.mem_A j)).support ∩
                Finset.univ.image L.points).card =
              if j = CGN.firstIndex Packet.hm then 1
              else if j = CGN.lastIndex Packet.hm then 1 else 2) := by
  classical
  rcases S.capByIndex_cgn4g_capData_oriented hconv S.surplusIdx with
    ⟨m, L, Packet, Hside, Hord, hcap, hendpoints⟩
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
  refine ⟨L, Packet, Hside, Hord, hcap.trans hcapSurplus, hendpoints, ?_⟩
  intro j
  exact orderedCap_selected_support_inter_card_eq_of_six_five
    Packet Hside Hord hconv F houtside j

/-- Compatibility wrapper retaining the original exact-count interface while
forgetting the ordered endpoint witness. -/
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
  rcases SurplusCapPacket.exists_orderedSurplusCapSix_with_selected_hitCounts_and_endpoints
      S hconv hM44 F hcard with
    ⟨L, Packet, Hside, Hord, hcap, _hendpoints, hcounts⟩
  exact ⟨L, Packet, Hside, Hord, hcap, hcounts⟩

/-- In the card-eleven equality case, a selected row centered on the surplus
cap hits that cap once at either support endpoint and twice at every other cap
point. -/
theorem SurplusCapPacket.selectedClass_support_inter_surplusCap_card_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (F : FaithfulCarrierPattern A) (hcard : S.surplusCap.card = 6)
    {center : ℝ²} (hcenterA : center ∈ A)
    (hcenterCap : center ∈ S.surplusCap) :
    ((F.classAt center hcenterA).support ∩ S.surplusCap).card =
      if center = (S.triangleByIndex S.surplusIdx).v2 ∨
          center = (S.triangleByIndex S.surplusIdx).v3 then 1 else 2 := by
  classical
  rcases SurplusCapPacket.exists_orderedSurplusCapSix_with_selected_hitCounts_and_endpoints
      S hconv hM44 F hcard with
    ⟨L, Packet, _Hside, _Hord, hcap, hendpoints, hcounts⟩
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rwa [hcap]
  rcases Finset.mem_image.mp hcenterImage with ⟨j, _hj, hjcenter⟩
  subst center
  have hpointEndpoints :
      (L.points j = (S.triangleByIndex S.surplusIdx).v2 ∨
          L.points j = (S.triangleByIndex S.surplusIdx).v3) ↔
        (j = CGN.firstIndex Packet.hm ∨ j = CGN.lastIndex Packet.hm) := by
    rcases hendpoints with hendpoints | hendpoints
    · constructor
      · rintro (hjv2 | hjv3)
        · exact Or.inl (L.injective (hjv2.trans hendpoints.1.symm))
        · exact Or.inr (L.injective (hjv3.trans hendpoints.2.symm))
      · rintro (rfl | rfl)
        · exact Or.inl hendpoints.1
        · exact Or.inr hendpoints.2
    · constructor
      · rintro (hjv2 | hjv3)
        · exact Or.inr (L.injective (hjv2.trans hendpoints.2.symm))
        · exact Or.inl (L.injective (hjv3.trans hendpoints.1.symm))
      · rintro (rfl | rfl)
        · exact Or.inr hendpoints.1
        · exact Or.inl hendpoints.2
  calc
    ((F.classAt (L.points j) hcenterA).support ∩ S.surplusCap).card =
        if j = CGN.firstIndex Packet.hm then 1
        else if j = CGN.lastIndex Packet.hm then 1 else 2 := by
          simpa only [hcap] using hcounts j
    _ = if j = CGN.firstIndex Packet.hm ∨
          j = CGN.lastIndex Packet.hm then 1 else 2 := by
      by_cases hfirst : j = CGN.firstIndex Packet.hm <;>
        by_cases hlast : j = CGN.lastIndex Packet.hm <;> simp [hfirst, hlast]
    _ = if L.points j = (S.triangleByIndex S.surplusIdx).v2 ∨
          L.points j = (S.triangleByIndex S.surplusIdx).v3 then 1 else 2 := by
      simp only [hpointEndpoints]

/-- The card-eleven equality profile also fixes the number of support points
    outside the ordered cap: three for an endpoint row and two for an interior
    row.  This is the outside-support normal form needed by pair-saturation
    consumers. -/
theorem orderedCap_selected_support_sdiff_card_eq_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    (j : Fin 6) :
    ((F.classAt (L.points j) (Packet.mem_A j)).support \
        Finset.univ.image L.points).card =
      if j = CGN.firstIndex Packet.hm then 3
      else if j = CGN.lastIndex Packet.hm then 3 else 2 := by
  classical
  have hcap := orderedCap_selected_support_inter_card_eq_of_six_five
    Packet Hside Hord hconv F houtside j
  have hsplit :
      ((F.classAt (L.points j) (Packet.mem_A j)).support \
          Finset.univ.image L.points).card +
          ((F.classAt (L.points j) (Packet.mem_A j)).support ∩
            Finset.univ.image L.points).card = 4 := by
    rw [Finset.card_sdiff_add_card_inter,
      (F.classAt (L.points j) (Packet.mem_A j)).support_card]
  rw [hcap] at hsplit
  by_cases hfirst : j = CGN.firstIndex Packet.hm
  · subst j
    simp only [if_pos]
    simp only [if_pos] at hsplit
    omega
  · by_cases hlast : j = CGN.lastIndex Packet.hm
    · subst j
      simp only [if_neg hfirst, if_pos]
      simp only [if_neg hfirst, if_pos] at hsplit
      omega
    · simp only [if_neg hfirst, if_neg hlast]
      simp only [if_neg hfirst, if_neg hlast] at hsplit
      omega

/-- Consequently, the six selected rows contribute exactly ten outside pairs
    in the card-eleven equality profile. -/
theorem orderedCap_selected_outside_pair_count_eq_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5) :
    (∑ j : Fin 6,
      Nat.choose
        ((F.classAt (L.points j) (Packet.mem_A j)).support \
          Finset.univ.image L.points).card 2) = 10 := by
  classical
  have hrow (j : Fin 6) :
      Nat.choose
        ((F.classAt (L.points j) (Packet.mem_A j)).support \
          Finset.univ.image L.points).card 2 =
        if j = CGN.firstIndex Packet.hm then 3
        else if j = CGN.lastIndex Packet.hm then 3 else 1 := by
    rw [orderedCap_selected_support_sdiff_card_eq_of_six_five
      Packet Hside Hord hconv F houtside j]
    by_cases hfirst : j = CGN.firstIndex Packet.hm
    · simp [hfirst]
    · by_cases hlast : j = CGN.lastIndex Packet.hm
      · simp [hfirst, hlast]
      · simp [hfirst, hlast]
  calc
    (∑ j : Fin 6,
        Nat.choose
          ((F.classAt (L.points j) (Packet.mem_A j)).support \
            Finset.univ.image L.points).card 2) =
        ∑ j : Fin 6,
          (if j = CGN.firstIndex Packet.hm then 3
           else if j = CGN.lastIndex Packet.hm then 3 else 1) := by
      apply Finset.sum_congr rfl
      intro j _hj
      exact hrow j
    _ = 10 := by
      simp [CGN.firstIndex, CGN.lastIndex, Fin.sum_univ_succ]

/-- The preceding row count saturates the full outside-pair universe when the
    complement has five points. -/
theorem orderedCap_outsidePairCount_eq_choose_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5) :
    (∑ j : Fin 6,
      Nat.choose
        ((F.classAt (L.points j) (Packet.mem_A j)).support \
          Finset.univ.image L.points).card 2) =
      Nat.choose (A \ Finset.univ.image L.points).card 2 := by
  rw [orderedCap_selected_outside_pair_count_eq_of_six_five
    Packet Hside Hord hconv F houtside, houtside]
  norm_num [Nat.choose]

/-- In the same equality case, the outside pairs selected by the six rows
    exhaust the complement's two-subsets.  Pairwise disjointness comes from
    the ordered-cap owner relation, while the preceding count supplies the
    matching cardinality. -/
theorem orderedCap_selected_outside_pairs_cover_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5) :
    (Finset.univ.biUnion (fun j : Fin 6 =>
      ((F.classAt (L.points j) (Packet.mem_A j)).support \
        Finset.univ.image L.points).powersetCard 2)) =
      (A \ Finset.univ.image L.points).powersetCard 2 := by
  classical
  let C : Finset ℝ² := Finset.univ.image L.points
  let B : Finset ℝ² := A \ C
  let K : ∀ j : Fin 6, SelectedFourClass A (L.points j) :=
    fun j => F.classAt (L.points j) (Packet.mem_A j)
  let hits : Fin 6 → Finset ℝ² := fun j => (K j).support \ C
  let pairs : Fin 6 → Finset (Finset ℝ²) :=
    fun j => (hits j).powersetCard 2
  have hdisjoint :
      ((Finset.univ : Finset (Fin 6)) : Set (Fin 6)).PairwiseDisjoint pairs := by
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
    have haR' : a ∈ (K r).support := (Finset.mem_sdiff.mp haR).1
    have hbR' : b ∈ (K r).support := (Finset.mem_sdiff.mp hbR).1
    have haS' : a ∈ (K s).support := (Finset.mem_sdiff.mp haS).1
    have hbS' : b ∈ (K s).support := (Finset.mem_sdiff.mp hbS).1
    have hrOwner := orderedCap_outsidePair_owner_unique
      Packet Hord hconv F
      ((K r).support_subset_A haR') ((K r).support_subset_A hbR')
      (Finset.mem_sdiff.mp haR).2 (Finset.mem_sdiff.mp hbR).2 hab
      haR' hbR' haS' hbS'
    exact hrs hrOwner
  have hsubset : (Finset.univ.biUnion pairs) ⊆ B.powersetCard 2 := by
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
  have hsum :
      (∑ j : Fin 6, (pairs j).card) = (B.powersetCard 2).card := by
    calc
      (∑ j : Fin 6, (pairs j).card) =
          ∑ j : Fin 6, Nat.choose (hits j).card 2 := by
        apply Finset.sum_congr rfl
        intro j _hj
        exact Finset.card_powersetCard 2 (hits j)
      _ = Nat.choose B.card 2 := by
        simpa [B, C, K, hits, pairs] using
          (orderedCap_outsidePairCount_eq_choose_of_six_five
            Packet Hside Hord hconv F houtside)
      _ = (B.powersetCard 2).card :=
        (Finset.card_powersetCard 2 B).symm
  have hcard :
      (Finset.univ.biUnion pairs).card = (B.powersetCard 2).card := by
    rw [Finset.card_biUnion hdisjoint]
    exact hsum
  apply Finset.eq_of_subset_of_card_le hsubset
  exact le_of_eq hcard.symm

/-- Every outside pair has a unique selected-row owner in the saturated
    six-row profile. -/
theorem orderedCap_selected_outside_pair_owner_existsUnique_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    {xy : Finset ℝ²}
    (hxy : xy ∈ (A \ Finset.univ.image L.points).powersetCard 2) :
    ∃! j : Fin 6,
      xy ∈ ((F.classAt (L.points j) (Packet.mem_A j)).support \
        Finset.univ.image L.points).powersetCard 2 := by
  classical
  have hcover := orderedCap_selected_outside_pairs_cover_of_six_five
    Packet Hside Hord hconv F houtside
  have hmemUnion : xy ∈ Finset.univ.biUnion (fun j : Fin 6 =>
      ((F.classAt (L.points j) (Packet.mem_A j)).support \
        Finset.univ.image L.points).powersetCard 2) := by
    rw [hcover]
    exact hxy
  rcases Finset.mem_biUnion.mp hmemUnion with ⟨j, _hj, hj⟩
  refine ⟨j, hj, ?_⟩
  intro k hk
  have hxyCard : xy.card = 2 :=
    (Finset.mem_powersetCard.mp hxy).2
  rw [Finset.card_eq_two] at hxyCard
  rcases hxyCard with ⟨a, b, hab, rfl⟩
  have hjData := Finset.mem_powersetCard.mp hj
  have hkData := Finset.mem_powersetCard.mp hk
  have haJ : a ∈ (F.classAt (L.points j) (Packet.mem_A j)).support :=
    (Finset.mem_sdiff.mp (hjData.1 (by simp))).1
  have hbJ : b ∈ (F.classAt (L.points j) (Packet.mem_A j)).support :=
    (Finset.mem_sdiff.mp (hjData.1 (by simp))).1
  have haK : a ∈ (F.classAt (L.points k) (Packet.mem_A k)).support :=
    (Finset.mem_sdiff.mp (hkData.1 (by simp))).1
  have hbK : b ∈ (F.classAt (L.points k) (Packet.mem_A k)).support :=
    (Finset.mem_sdiff.mp (hkData.1 (by simp))).1
  have howner := orderedCap_outsidePair_owner_unique Packet Hord hconv F
    ((F.classAt (L.points j) (Packet.mem_A j)).support_subset_A haJ)
    ((F.classAt (L.points j) (Packet.mem_A j)).support_subset_A hbJ)
    (Finset.mem_sdiff.mp (hjData.1 (by simp))).2
    (Finset.mem_sdiff.mp (hjData.1 (by simp))).2 hab
    haJ hbJ haK hbK
  exact howner.symm

/- ## The owner map and its saturated fibres -/

/-- The unique selected row owning an outside pair.  The default value on
outside pairs is only a totality device; all uses below are restricted to the
two-subsets of the cap complement. -/
noncomputable def orderedCap_selected_outside_pair_owner_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    (xy : Finset ℝ²) : Fin 6 :=
  if hxy : xy ∈ (A \ Finset.univ.image L.points).powersetCard 2 then
    Classical.choose
      (orderedCap_selected_outside_pair_owner_existsUnique_of_six_five
        Packet Hside Hord hconv F houtside hxy)
  else 0

/-- The owner map sends every outside pair to a row that contains it. -/
theorem orderedCap_selected_outside_pair_owner_mem_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    {xy : Finset ℝ²}
    (hxy : xy ∈ (A \ Finset.univ.image L.points).powersetCard 2) :
    xy ∈ ((F.classAt
      (L.points (orderedCap_selected_outside_pair_owner_of_six_five
        Packet Hside Hord hconv F houtside xy)) (Packet.mem_A _)).support \
    Finset.univ.image L.points).powersetCard 2 := by
  classical
  have howner :
      orderedCap_selected_outside_pair_owner_of_six_five
          Packet Hside Hord hconv F houtside xy =
        Classical.choose
          (orderedCap_selected_outside_pair_owner_existsUnique_of_six_five
            Packet Hside Hord hconv F houtside hxy) := by
    unfold orderedCap_selected_outside_pair_owner_of_six_five
    rw [dif_pos hxy]
  exact
    (howner ▸ Classical.choose_spec
      (orderedCap_selected_outside_pair_owner_existsUnique_of_six_five
        Packet Hside Hord hconv F houtside hxy)).1

/-- On an outside pair, the owner map is the unique row whose outside support
contains that pair. -/
theorem orderedCap_selected_outside_pair_owner_eq_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    {xy : Finset ℝ²}
    (hxy : xy ∈ (A \ Finset.univ.image L.points).powersetCard 2)
    {j : Fin 6}
    (hj : xy ∈ ((F.classAt (L.points j) (Packet.mem_A j)).support \
        Finset.univ.image L.points).powersetCard 2) :
    orderedCap_selected_outside_pair_owner_of_six_five
      Packet Hside Hord hconv F houtside xy = j := by
  exact
    (orderedCap_selected_outside_pair_owner_existsUnique_of_six_five
      Packet Hside Hord hconv F houtside hxy).unique
      (orderedCap_selected_outside_pair_owner_mem_of_six_five
        Packet Hside Hord hconv F houtside hxy)
      hj

/-- The owner-map fibre over a row is exactly that row's two-subsets outside
the cap. -/
theorem orderedCap_selected_outside_pair_owner_fiber_eq_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    (j : Fin 6) :
    ((A \ Finset.univ.image L.points).powersetCard 2).filter (fun xy =>
      orderedCap_selected_outside_pair_owner_of_six_five
        Packet Hside Hord hconv F houtside xy = j) =
      ((F.classAt (L.points j) (Packet.mem_A j)).support \
        Finset.univ.image L.points).powersetCard 2 := by
  classical
  ext xy
  constructor
  · intro hxy
    have hfilter := Finset.mem_filter.mp hxy
    have howner := hfilter.2
    have hrow := orderedCap_selected_outside_pair_owner_mem_of_six_five
      Packet Hside Hord hconv F houtside hfilter.1
    rw [howner] at hrow
    exact hrow
  · intro hrow
    have hrowData := Finset.mem_powersetCard.mp hrow
    have hxyOutside : xy ∈ (A \ Finset.univ.image L.points).powersetCard 2 := by
      apply Finset.mem_powersetCard.mpr
      refine ⟨?_, hrowData.2⟩
      intro x hx
      have hxrow := hrowData.1 hx
      exact Finset.mem_sdiff.mpr
        ⟨(F.classAt (L.points j) (Packet.mem_A j)).support_subset_A
            (Finset.mem_sdiff.mp hxrow).1,
          (Finset.mem_sdiff.mp hxrow).2⟩
    exact Finset.mem_filter.mpr ⟨hxyOutside,
      orderedCap_selected_outside_pair_owner_eq_of_six_five
        Packet Hside Hord hconv F houtside hxyOutside hrow⟩

/-- The owner-map fibres have the exact saturated cardinalities: three pairs
for each endpoint row and one pair for each interior row. -/
theorem orderedCap_selected_outside_pair_owner_fiber_card_eq_of_six_five
    {A : Finset ℝ²} {L : CGN.OrderedCap 6}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (houtside : (A \ Finset.univ.image L.points).card = 5)
    (j : Fin 6) :
    (((A \ Finset.univ.image L.points).powersetCard 2).filter (fun xy =>
      orderedCap_selected_outside_pair_owner_of_six_five
        Packet Hside Hord hconv F houtside xy = j)).card =
      if j = CGN.firstIndex Packet.hm then 3
      else if j = CGN.lastIndex Packet.hm then 3 else 1 := by
  rw [orderedCap_selected_outside_pair_owner_fiber_eq_of_six_five
    Packet Hside Hord hconv F houtside j]
  rw [Finset.card_powersetCard]
  rw [orderedCap_selected_support_sdiff_card_eq_of_six_five
    Packet Hside Hord hconv F houtside j]
  by_cases hfirst : j = CGN.firstIndex Packet.hm
  · simp [hfirst]
  · by_cases hlast : j = CGN.lastIndex Packet.hm
    · simp [hfirst, hlast]
    · simp [hfirst, hlast]

end CapSelectedRowCounting

end Problem97
