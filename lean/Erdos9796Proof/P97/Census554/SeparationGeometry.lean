/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeometryBridge
import Erdos9796Proof.P97.Census554.SeparationMirror

/-!
# Geometric production of the card-11 separation surface

A cap-aware Census-554 labeling fixes the three Moser apices and the exact
strict-interior label blocks of sizes `3`, `3`, and `2`.  This file cuts a
global CCW boundary order at the surplus apex and uses cap-arc contiguity to
show that those blocks occur in one of the two orders

`U, O2, V, S, W, O1` or `U, O1, W, S, V, O2`.

The order inside each strict-interior block is deliberately left as a finite
permutation.  Thus the geometric output lands exactly on the direct-or-mirror
surface checked by the separation certificate.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

open U1LargeCapRouteBTailMetricResidualTarget
open Card11Labeling

namespace SeparationGeometry

open SeparationCore

private def labelS (i : Fin 3) : Fin 11 :=
  ⟨3 + i, by omega⟩

private def labelO1 (i : Fin 3) : Fin 11 :=
  ⟨6 + i, by omega⟩

private def labelO2 (i : Fin 2) : Fin 11 :=
  ⟨9 + i, by omega⟩

private def directO2Position (i : Fin 2) : Fin 11 :=
  ⟨1 + i, by omega⟩

private def directSPosition (i : Fin 3) : Fin 11 :=
  ⟨4 + i, by omega⟩

private def directO1Position (i : Fin 3) : Fin 11 :=
  ⟨8 + i, by omega⟩

private theorem labelS_injective : Function.Injective labelS := by
  intro i j hij
  apply Fin.ext
  have hval := congrArg Fin.val hij
  simp [labelS] at hval
  omega

private theorem labelO1_injective : Function.Injective labelO1 := by
  intro i j hij
  apply Fin.ext
  have hval := congrArg Fin.val hij
  simp [labelO1] at hval
  omega

private theorem labelO2_injective : Function.Injective labelO2 := by
  intro i j hij
  apply Fin.ext
  have hval := congrArg Fin.val hij
  simp [labelO2] at hval
  omega

private theorem directO2Position_injective :
    Function.Injective directO2Position := by
  intro i j hij
  apply Fin.ext
  have hval := congrArg Fin.val hij
  simp [directO2Position] at hval
  omega

private theorem directSPosition_injective :
    Function.Injective directSPosition := by
  intro i j hij
  apply Fin.ext
  have hval := congrArg Fin.val hij
  simp [directSPosition] at hval
  omega

private theorem directO1Position_injective :
    Function.Injective directO1Position := by
  intro i j hij
  apply Fin.ext
  have hval := congrArg Fin.val hij
  simp [directO1Position] at hval
  omega

private theorem image_fin_two {alpha : Type*} [DecidableEq alpha]
    (f : Fin 2 → alpha) :
    Finset.univ.image f = {f 0, f 1} := by
  ext x
  constructor
  · rintro hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
    fin_cases i <;> simp
  · intro hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_image.mpr ⟨0, Finset.mem_univ _, rfl⟩
    · exact Finset.mem_image.mpr ⟨1, Finset.mem_univ _, rfl⟩

private theorem image_fin_three {alpha : Type*} [DecidableEq alpha]
    (f : Fin 3 → alpha) :
    Finset.univ.image f = {f 0, f 1, f 2} := by
  ext x
  constructor
  · rintro hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
    fin_cases i <;> simp
  · intro hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_image.mpr ⟨0, Finset.mem_univ _, rfl⟩
    · exact Finset.mem_image.mpr ⟨1, Finset.mem_univ _, rfl⟩
    · exact Finset.mem_image.mpr ⟨2, Finset.mem_univ _, rfl⟩

/-- An equality of two injectively enumerated finite images gives the internal
permutation carrying the second enumeration to the first. -/
private theorem exists_matching_perm {k : Nat} {alpha : Type*}
    [DecidableEq alpha] {f g : Fin k → alpha}
    (hf : Function.Injective f)
    (himage : Finset.univ.image f = Finset.univ.image g) :
    ∃ e : Equiv.Perm (Fin k), ∀ i, g (e i) = f i := by
  classical
  have hex : ∀ i, ∃ j, g j = f i := by
    intro i
    have hfi : f i ∈ Finset.univ.image g := by
      rw [← himage]
      exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
    rcases Finset.mem_image.mp hfi with ⟨j, _hj, hji⟩
    exact ⟨j, hji⟩
  let e : Fin k → Fin k := fun i => Classical.choose (hex i)
  have heq : ∀ i, g (e i) = f i := fun i => Classical.choose_spec (hex i)
  have heinj : Function.Injective e := by
    intro i j hij
    apply hf
    rw [← heq i, ← heq j, hij]
  have hesurj : Function.Surjective e :=
    Finite.surjective_of_injective heinj
  exact ⟨Equiv.ofBijective e ⟨heinj, hesurj⟩, heq⟩

/-- Sort three already indexed points that all occur after one ambient index. -/
private theorem exists_sorted_triple_points_after
    {alpha : Type*} [DecidableEq alpha] {n : Nat} {phi : Fin n → alpha}
    {lo ia ib ic : Fin n} {a b c : alpha}
    (hloia : lo < ia) (hloib : lo < ib) (hloic : lo < ic)
    (hia : phi ia = a) (hib : phi ib = b) (hic : phi ic = c)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ∃ x y z : alpha, ∃ ix iy iz : Fin n,
      lo < ix ∧ ix < iy ∧ iy < iz ∧
      phi ix = x ∧ phi iy = y ∧ phi iz = z ∧
      ({x, y, z} : Finset alpha) = ({a, b, c} : Finset alpha) := by
  have hiab : ia ≠ ib := by
    intro h
    exact hab (by rw [← hia, ← hib, h])
  have hiac : ia ≠ ic := by
    intro h
    exact hac (by rw [← hia, ← hic, h])
  have hibc : ib ≠ ic := by
    intro h
    exact hbc (by rw [← hib, ← hic, h])
  rcases exists_sorted_triple_finset_eq (a := ia) (b := ib) (c := ic)
      hiab hiac hibc with ⟨ix, iy, iz, hixiy, hiyiz, hset⟩
  have hlo_of_mem {t : Fin n}
      (ht : t ∈ ({ia, ib, ic} : Finset (Fin n))) : lo < t := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at ht
    rcases ht with rfl | rfl | rfl
    · exact hloia
    · exact hloib
    · exact hloic
  have hix_mem : ix ∈ ({ia, ib, ic} : Finset (Fin n)) := by
    rw [← hset]
    simp
  have himage := congrArg (fun s : Finset (Fin n) => s.image phi) hset
  refine ⟨phi ix, phi iy, phi iz, ix, iy, iz, hlo_of_mem hix_mem,
    hixiy, hiyiz, rfl, rfl, rfl, ?_⟩
  simpa [hia, hib, hic] using himage

private theorem ambient_index_ne_of_label_ne
    {alpha : Type*} {k n : Nat} {pointOf : Fin k → alpha}
    (hpoint : Function.Injective pointOf) {phi : Fin n → alpha}
    {p q : Fin k} {ip iq : Fin n}
    (hip : phi ip = pointOf p) (hiq : phi iq = pointOf q)
    (hpq : p ≠ q) : ip ≠ iq := by
  intro hidx
  apply hpq
  apply hpoint
  rw [← hip, ← hiq, hidx]

/-- The support vertices of an indexed cap are the two other indexed Moser
apices, in one of the two possible endpoint orders. -/
private theorem triangleByIndex_support_eq_other_apices
    {A : Finset ℝ²} (SP : SurplusCapPacket A) {i j k : Fin 3}
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
    (((SP.triangleByIndex i).v2 = SP.oppositeVertexByIndex j ∧
        (SP.triangleByIndex i).v3 = SP.oppositeVertexByIndex k) ∨
      ((SP.triangleByIndex i).v2 = SP.oppositeVertexByIndex k ∧
        (SP.triangleByIndex i).v3 = SP.oppositeVertexByIndex j)) := by
  fin_cases i <;> fin_cases j <;> fin_cases k <;>
    simp_all [SurplusCapPacket.triangleByIndex,
      SurplusCapPacket.oppositeVertexByIndex]

/-- A strict point of cap `i` lies on the arc opposite apex `i`, with the two
other frame apices used as the chord endpoints. -/
private theorem capInteriorAt_onArc_other_apices
    {A : Finset ℝ²} (SP : SurplusCapPacket A) {i j k : Fin 3}
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) {x : ℝ²}
    (hx : x ∈ capInteriorAt SP.partition i) :
    OnArcOpposite (apexAt SP.triangle i) (apexAt SP.triangle j)
      (apexAt SP.triangle k) x := by
  have hxA : x ∈ A := Card11Labeling.capInteriorAt_subset SP.partition i hx
  have hxCapAt : x ∈ SP.partition.capAt i :=
    Card11Labeling.capInteriorAt_subset_capAt SP.partition i hx
  have hxCap : x ∈ SP.capByIndex i := by
    rwa [Card11SelectedCube.capByIndex_eq_capAt SP]
  have hArc := (SP.capByIndex_arc_membership i x hxA).mp hxCap
  have href : (SP.triangleByIndex i).v1 = apexAt SP.triangle i :=
    (SP.triangleByIndex_v1_eq_oppositeVertexByIndex i).trans
      (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex SP i).symm
  rcases triangleByIndex_support_eq_other_apices SP hij hik hjk with
      hsupp | hsupp
  · have hj : (SP.triangleByIndex i).v2 = apexAt SP.triangle j :=
      hsupp.1.trans
        (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex SP j).symm
    have hk : (SP.triangleByIndex i).v3 = apexAt SP.triangle k :=
      hsupp.2.trans
        (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex SP k).symm
    simpa [href, hj, hk] using hArc
  · have hk : (SP.triangleByIndex i).v2 = apexAt SP.triangle k :=
      hsupp.1.trans
        (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex SP k).symm
    have hj : (SP.triangleByIndex i).v3 = apexAt SP.triangle j :=
      hsupp.2.trans
        (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex SP j).symm
    have hSwap :=
      (onArcOpposite_swap (apexAt SP.triangle i)
        (apexAt SP.triangle k) (apexAt SP.triangle j) x).mp
        (by simpa [href, hk, hj] using hArc)
    exact hSwap

private theorem strict_between_of_onArc
    {n : Nat} {phi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hphi : Function.Injective phi) {ia ib ic q : Fin n}
    (hab : ia < ib) (hc : ic < ia ∨ ib < ic)
    (harc : OnArcOpposite (phi ic) (phi ia) (phi ib) (phi q))
    (hqa : q ≠ ia) (hqb : q ≠ ib) :
    ia < q ∧ q < ib := by
  rcases (onArcOpposite_iff_index_block hccw hphi hab hc q).mp harc with
    ⟨hlo, hhi⟩
  exact ⟨lt_of_le_of_ne hlo hqa.symm, lt_of_le_of_ne hhi hqb⟩

/-- If the reference vertex is strictly between the chord endpoints, an
opposite-arc point distinct from the endpoints lies strictly outside their
closed index interval. -/
private theorem strict_outside_of_onArc_reference_between
    {n : Nat} {phi : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hphi : Function.Injective phi) {ia ib ic q : Fin n}
    (haic : ia < ic) (hcib : ic < ib)
    (harc : OnArcOpposite (phi ic) (phi ia) (phi ib) (phi q))
    (hqa : q ≠ ia) (hqb : q ≠ ib) :
    q < ia ∨ ib < q := by
  have hab : ia < ib := haic.trans hcib
  have hcpos : 0 < signedArea2 (phi ic) (phi ia) (phi ib) :=
    signedArea2_pos_of_between hccw hphi haic hcib
  unfold OnArcOpposite at harc
  have hq_nonpos : signedArea2 (phi q) (phi ia) (phi ib) ≤ 0 := by
    by_contra hnot
    have hqpos : 0 < signedArea2 (phi q) (phi ia) (phi ib) :=
      lt_of_not_ge hnot
    have hprod :
        0 < signedArea2 (phi q) (phi ia) (phi ib) *
          signedArea2 (phi ic) (phi ia) (phi ib) :=
      mul_pos hqpos hcpos
    linarith
  obtain ⟨_hpos, hzero, hneg⟩ :=
    signedArea2_trichotomy hccw hphi hab q
  rcases lt_or_eq_of_le hq_nonpos with hqneg | hqzero
  · exact hneg.mp hqneg
  · rcases hzero.mp hqzero with hqia | hqib
    · exact (hqa hqia).elim
    · exact (hqb hqib).elim

private theorem card11IndexEquiv_zero
    (order : Card11InternalOrder) :
    card11IndexEquiv order 0 = 0 := by rfl

private theorem card11IndexEquiv_one
    (order : Card11InternalOrder) :
    card11IndexEquiv order 1 = 3 := by rfl

private theorem card11IndexEquiv_two
    (order : Card11InternalOrder) :
    card11IndexEquiv order 2 = 7 := by rfl

private theorem card11IndexEquiv_labelS
    (eO2 : Equiv.Perm (Fin 2)) (eS eO1 : Equiv.Perm (Fin 3))
    (i : Fin 3) :
    card11IndexEquiv (eO2, (eS, eO1)) (labelS i) =
      directSPosition (eS i) := by
  simp [labelS, directSPosition,
    SeparationCore.card11IndexEquiv_surplusInterior]

private theorem card11IndexEquiv_labelO1
    (eO2 : Equiv.Perm (Fin 2)) (eS eO1 : Equiv.Perm (Fin 3))
    (i : Fin 3) :
    card11IndexEquiv (eO2, (eS, eO1)) (labelO1 i) =
      directO1Position (eO1 i) := by
  simp [labelO1, directO1Position,
    SeparationCore.card11IndexEquiv_firstOtherInterior]

private theorem card11IndexEquiv_labelO2
    (eO2 : Equiv.Perm (Fin 2)) (eS eO1 : Equiv.Perm (Fin 3))
    (i : Fin 2) :
    card11IndexEquiv (eO2, (eS, eO1)) (labelO2 i) =
      directO2Position (eO2 i) := by
  simp [labelO2, directO2Position,
    SeparationCore.card11IndexEquiv_secondOtherInterior]

private noncomputable def directLabeling_of_ordered_blocks
    {pointOf : Fin 11 → ℝ²} {n : Nat} {phi : Fin n → ℝ²}
    {iu io20 io21 iv is0 is1 is2 iw io10 io11 io12 : Fin n}
    (hpoint : Function.Injective pointOf)
    (hphi : Function.Injective phi)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (huo20 : iu < io20) (ho20o21 : io20 < io21)
    (ho21v : io21 < iv) (hvs0 : iv < is0) (hs0s1 : is0 < is1)
    (hs1s2 : is1 < is2) (hs2w : is2 < iw) (hwo10 : iw < io10)
    (ho10o11 : io10 < io11) (ho11o12 : io11 < io12)
    (hu : phi iu = pointOf 0) (hv : phi iv = pointOf 1)
    (hw : phi iw = pointOf 2)
    (hO2set : ({phi io20, phi io21} : Finset ℝ²) =
      {pointOf 9, pointOf 10})
    (hSset : ({phi is0, phi is1, phi is2} : Finset ℝ²) =
      {pointOf 3, pointOf 4, pointOf 5})
    (hO1set : ({phi io10, phi io11, phi io12} : Finset ℝ²) =
      {pointOf 6, pointOf 7, pointOf 8}) :
    Card11MacroCcwLabeling pointOf := by
  classical
  let idx : Fin 11 → Fin n
    | ⟨0, _⟩ => iu
    | ⟨1, _⟩ => io20
    | ⟨2, _⟩ => io21
    | ⟨3, _⟩ => iv
    | ⟨4, _⟩ => is0
    | ⟨5, _⟩ => is1
    | ⟨6, _⟩ => is2
    | ⟨7, _⟩ => iw
    | ⟨8, _⟩ => io10
    | ⟨9, _⟩ => io11
    | ⟨10, _⟩ => io12
    | ⟨k + 11, hk⟩ => by omega
  have hidx : StrictMono idx := by
    intro a b hab
    fin_cases a <;> fin_cases b <;> simp [idx] at hab ⊢ <;> omega
  let boundary : Fin 11 → ℝ² := fun i => phi (idx i)
  have hboundary : Function.Injective boundary :=
    hphi.comp hidx.injective
  have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary :=
    isCcwConvexPolygon_subsequence (φ := phi) (idx := idx) hccw hidx
  let fO2 : Fin 2 → ℝ² := fun i => pointOf (labelO2 i)
  let fS : Fin 3 → ℝ² := fun i => pointOf (labelS i)
  let fO1 : Fin 3 → ℝ² := fun i => pointOf (labelO1 i)
  let gO2 : Fin 2 → ℝ² := fun i => boundary (directO2Position i)
  let gS : Fin 3 → ℝ² := fun i => boundary (directSPosition i)
  let gO1 : Fin 3 → ℝ² := fun i => boundary (directO1Position i)
  have hfO2 : Function.Injective fO2 :=
    hpoint.comp labelO2_injective
  have hfS : Function.Injective fS :=
    hpoint.comp labelS_injective
  have hfO1 : Function.Injective fO1 :=
    hpoint.comp labelO1_injective
  have hO2image : Finset.univ.image fO2 = Finset.univ.image gO2 := by
    rw [image_fin_two fO2, image_fin_two gO2]
    simpa [fO2, gO2, labelO2, directO2Position, boundary, idx] using
      hO2set.symm
  have hSimage : Finset.univ.image fS = Finset.univ.image gS := by
    rw [image_fin_three fS, image_fin_three gS]
    simpa [fS, gS, labelS, directSPosition, boundary, idx] using
      hSset.symm
  have hO1image : Finset.univ.image fO1 = Finset.univ.image gO1 := by
    rw [image_fin_three fO1, image_fin_three gO1]
    simpa [fO1, gO1, labelO1, directO1Position, boundary, idx] using
      hO1set.symm
  let eO2 : Equiv.Perm (Fin 2) :=
    Classical.choose (exists_matching_perm hfO2 hO2image)
  have heO2 : ∀ i, gO2 (eO2 i) = fO2 i :=
    Classical.choose_spec (exists_matching_perm hfO2 hO2image)
  let eS : Equiv.Perm (Fin 3) :=
    Classical.choose (exists_matching_perm hfS hSimage)
  have heS : ∀ i, gS (eS i) = fS i :=
    Classical.choose_spec (exists_matching_perm hfS hSimage)
  let eO1 : Equiv.Perm (Fin 3) :=
    Classical.choose (exists_matching_perm hfO1 hO1image)
  have heO1 : ∀ i, gO1 (eO1 i) = fO1 i :=
    Classical.choose_spec (exists_matching_perm hfO1 hO1image)
  let order : Card11InternalOrder := (eO2, (eS, eO1))
  refine
    { order := order
      boundary := boundary
      boundary_injective := hboundary
      boundary_ccw := hboundaryCcw
      point_eq := ?_ }
  intro label
  fin_cases label
  · simpa [order, card11IndexEquiv_zero, boundary, idx] using hu
  · simpa [order, card11IndexEquiv_one, boundary, idx] using hv
  · simpa [order, card11IndexEquiv_two, boundary, idx] using hw
  · change boundary
      (card11IndexEquiv (eO2, (eS, eO1)) (labelS 0)) =
        pointOf (labelS 0)
    rw [card11IndexEquiv_labelS]
    simpa [fS, gS] using heS 0
  · change boundary
      (card11IndexEquiv (eO2, (eS, eO1)) (labelS 1)) =
        pointOf (labelS 1)
    rw [card11IndexEquiv_labelS]
    simpa [fS, gS] using heS 1
  · change boundary
      (card11IndexEquiv (eO2, (eS, eO1)) (labelS 2)) =
        pointOf (labelS 2)
    rw [card11IndexEquiv_labelS]
    simpa [fS, gS] using heS 2
  · change boundary
      (card11IndexEquiv (eO2, (eS, eO1)) (labelO1 0)) =
        pointOf (labelO1 0)
    rw [card11IndexEquiv_labelO1]
    simpa [fO1, gO1] using heO1 0
  · change boundary
      (card11IndexEquiv (eO2, (eS, eO1)) (labelO1 1)) =
        pointOf (labelO1 1)
    rw [card11IndexEquiv_labelO1]
    simpa [fO1, gO1] using heO1 1
  · change boundary
      (card11IndexEquiv (eO2, (eS, eO1)) (labelO1 2)) =
        pointOf (labelO1 2)
    rw [card11IndexEquiv_labelO1]
    simpa [fO1, gO1] using heO1 2
  · simpa [order, card11IndexEquiv_labelO2, labelO2, fO2, gO2] using heO2 0
  · simpa [order, card11IndexEquiv_labelO2, labelO2, fO2, gO2] using heO2 1

private noncomputable def mirrorLabeling_of_ordered_blocks
    {pointOf : Fin 11 → ℝ²} {n : Nat} {phi : Fin n → ℝ²}
    {iu io10 io11 io12 iw is0 is1 is2 iv io20 io21 : Fin n}
    (hpoint : Function.Injective pointOf)
    (hphi : Function.Injective phi)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (huo10 : iu < io10) (ho10o11 : io10 < io11)
    (ho11o12 : io11 < io12) (ho12w : io12 < iw) (hws0 : iw < is0)
    (hs0s1 : is0 < is1) (hs1s2 : is1 < is2) (hs2v : is2 < iv)
    (hvo20 : iv < io20) (ho20o21 : io20 < io21)
    (hu : phi iu = pointOf 0) (hv : phi iv = pointOf 1)
    (hw : phi iw = pointOf 2)
    (hO1set : ({phi io10, phi io11, phi io12} : Finset ℝ²) =
      {pointOf 6, pointOf 7, pointOf 8})
    (hSset : ({phi is0, phi is1, phi is2} : Finset ℝ²) =
      {pointOf 3, pointOf 4, pointOf 5})
    (hO2set : ({phi io20, phi io21} : Finset ℝ²) =
      {pointOf 9, pointOf 10}) :
    Card11MirrorMacroCcwLabeling pointOf := by
  classical
  let idx : Fin 11 → Fin n
    | ⟨0, _⟩ => iu
    | ⟨1, _⟩ => io10
    | ⟨2, _⟩ => io11
    | ⟨3, _⟩ => io12
    | ⟨4, _⟩ => iw
    | ⟨5, _⟩ => is0
    | ⟨6, _⟩ => is1
    | ⟨7, _⟩ => is2
    | ⟨8, _⟩ => iv
    | ⟨9, _⟩ => io20
    | ⟨10, _⟩ => io21
    | ⟨k + 11, hk⟩ => by omega
  have hidx : StrictMono idx := by
    intro a b hab
    fin_cases a <;> fin_cases b <;> simp [idx] at hab ⊢ <;> omega
  let boundary : Fin 11 → ℝ² := fun i => phi (idx i)
  have hboundary : Function.Injective boundary :=
    hphi.comp hidx.injective
  have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary :=
    isCcwConvexPolygon_subsequence (φ := phi) (idx := idx) hccw hidx
  let fO2 : Fin 2 → ℝ² := fun i => pointOf (labelO2 i)
  let fS : Fin 3 → ℝ² := fun i => pointOf (labelS i)
  let fO1 : Fin 3 → ℝ² := fun i => pointOf (labelO1 i)
  let gO2 : Fin 2 → ℝ² := fun i =>
    boundary (card11BoundaryReflection (directO2Position i))
  let gS : Fin 3 → ℝ² := fun i =>
    boundary (card11BoundaryReflection (directSPosition i))
  let gO1 : Fin 3 → ℝ² := fun i =>
    boundary (card11BoundaryReflection (directO1Position i))
  have hfO2 : Function.Injective fO2 :=
    hpoint.comp labelO2_injective
  have hfS : Function.Injective fS :=
    hpoint.comp labelS_injective
  have hfO1 : Function.Injective fO1 :=
    hpoint.comp labelO1_injective
  have hO2image : Finset.univ.image fO2 = Finset.univ.image gO2 := by
    rw [image_fin_two fO2, image_fin_two gO2]
    ext x
    have hx := congrArg (fun s : Finset ℝ² => x ∈ s) hO2set.symm
    simpa [fO2, gO2, labelO2, directO2Position,
      card11BoundaryReflection, boundary, idx, or_comm] using hx
  have hSimage : Finset.univ.image fS = Finset.univ.image gS := by
    rw [image_fin_three fS, image_fin_three gS]
    ext x
    have hx := congrArg (fun s : Finset ℝ² => x ∈ s) hSset.symm
    simpa [fS, gS, labelS, directSPosition, card11BoundaryReflection,
      boundary, idx, or_comm, or_left_comm, or_assoc] using hx
  have hO1image : Finset.univ.image fO1 = Finset.univ.image gO1 := by
    rw [image_fin_three fO1, image_fin_three gO1]
    ext x
    have hx := congrArg (fun s : Finset ℝ² => x ∈ s) hO1set.symm
    simpa [fO1, gO1, labelO1, directO1Position,
      card11BoundaryReflection, boundary, idx, or_comm, or_left_comm,
      or_assoc] using hx
  let eO2 : Equiv.Perm (Fin 2) :=
    Classical.choose (exists_matching_perm hfO2 hO2image)
  have heO2 : ∀ i, gO2 (eO2 i) = fO2 i :=
    Classical.choose_spec (exists_matching_perm hfO2 hO2image)
  let eS : Equiv.Perm (Fin 3) :=
    Classical.choose (exists_matching_perm hfS hSimage)
  have heS : ∀ i, gS (eS i) = fS i :=
    Classical.choose_spec (exists_matching_perm hfS hSimage)
  let eO1 : Equiv.Perm (Fin 3) :=
    Classical.choose (exists_matching_perm hfO1 hO1image)
  have heO1 : ∀ i, gO1 (eO1 i) = fO1 i :=
    Classical.choose_spec (exists_matching_perm hfO1 hO1image)
  let order : Card11InternalOrder := (eO2, (eS, eO1))
  refine
    { order := order
      boundary := boundary
      boundary_injective := hboundary
      boundary_ccw := hboundaryCcw
      point_eq := ?_ }
  intro label
  fin_cases label
  · simpa [order, card11MirrorIndexEquiv, card11IndexEquiv_zero,
      card11BoundaryReflection, boundary, idx] using hu
  · simpa [order, card11MirrorIndexEquiv, card11IndexEquiv_one,
      card11BoundaryReflection, boundary, idx] using hv
  · simpa [order, card11MirrorIndexEquiv, card11IndexEquiv_two,
      card11BoundaryReflection, boundary, idx] using hw
  · change boundary (card11BoundaryReflection
      (card11IndexEquiv (eO2, (eS, eO1)) (labelS 0))) =
        pointOf (labelS 0)
    rw [card11IndexEquiv_labelS]
    simpa [fS, gS] using heS 0
  · change boundary (card11BoundaryReflection
      (card11IndexEquiv (eO2, (eS, eO1)) (labelS 1))) =
        pointOf (labelS 1)
    rw [card11IndexEquiv_labelS]
    simpa [fS, gS] using heS 1
  · change boundary (card11BoundaryReflection
      (card11IndexEquiv (eO2, (eS, eO1)) (labelS 2))) =
        pointOf (labelS 2)
    rw [card11IndexEquiv_labelS]
    simpa [fS, gS] using heS 2
  · change boundary (card11BoundaryReflection
      (card11IndexEquiv (eO2, (eS, eO1)) (labelO1 0))) =
        pointOf (labelO1 0)
    rw [card11IndexEquiv_labelO1]
    simpa [fO1, gO1] using heO1 0
  · change boundary (card11BoundaryReflection
      (card11IndexEquiv (eO2, (eS, eO1)) (labelO1 1))) =
        pointOf (labelO1 1)
    rw [card11IndexEquiv_labelO1]
    simpa [fO1, gO1] using heO1 1
  · change boundary (card11BoundaryReflection
      (card11IndexEquiv (eO2, (eS, eO1)) (labelO1 2))) =
        pointOf (labelO1 2)
    rw [card11IndexEquiv_labelO1]
    simpa [fO1, gO1] using heO1 2
  · simpa [order, card11MirrorIndexEquiv, card11IndexEquiv_labelO2,
      labelO2, fO2, gO2] using heO2 0
  · simpa [order, card11MirrorIndexEquiv, card11IndexEquiv_labelO2,
      labelO2, fO2, gO2] using heO2 1

end SeparationGeometry

open SeparationCore
open SeparationGeometry

namespace Card11CapLabeling

/-- A geometric card-11 cap labeling lies on one of the two finite separation
surfaces.  No orientation is chosen a priori: the order of the two non-surplus
apices after cutting the CCW boundary at the surplus apex selects the direct or
mirrored constructor. -/
theorem nonempty_directOrMirrorMacroCcwLabeling
    {A : Finset ℝ²} (SP : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {second : Fin 3} (hsecond : second ≠ SP.surplusIdx)
    (frame : MultiCenter.JointCapIndexFrame SP.surplusIdx second)
    (L : Card11CapLabeling SP.partition frame) :
    Nonempty (Card11DirectOrMirrorCcwLabeling L.pointOf) := by
  classical
  have hAne : A.Nonempty := ⟨L.pointOf 0, L.mem_carrier 0⟩
  rcases SP.exists_ccw_boundary_order_at_surplus_apex hAne hconv hK4 with
    ⟨n, hn, phi, hphi, hphiImage, hccw, hzero⟩
  let iu : Fin n := ⟨0, hn⟩
  have hex : ∀ p : Fin 11, ∃ i : Fin n, phi i = L.pointOf p := by
    intro p
    have hpImage : L.pointOf p ∈ Finset.univ.image phi := by
      rw [hphiImage]
      exact L.mem_carrier p
    rcases Finset.mem_image.mp hpImage with ⟨i, _hi, hip⟩
    exact ⟨i, hip⟩
  let indexOf : Fin 11 → Fin n := fun p => Classical.choose (hex p)
  have hindex : ∀ p : Fin 11, phi (indexOf p) = L.pointOf p :=
    fun p => Classical.choose_spec (hex p)
  let iv : Fin n := indexOf 1
  let iw : Fin n := indexOf 2
  have hu : phi iu = L.pointOf 0 := by
    exact hzero.trans
      (L.point_zero.trans
        (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex SP
          SP.surplusIdx)).symm
  have hv : phi iv = L.pointOf 1 := by
    simpa [iv] using hindex 1
  have hw : phi iw = L.pointOf 2 := by
    simpa [iw] using hindex 2
  have hphiU : phi iu = apexAt SP.triangle SP.surplusIdx :=
    hu.trans L.point_zero
  have hphiV : phi iv = apexAt SP.triangle second :=
    hv.trans L.point_one
  have hphiW : phi iw = apexAt SP.triangle frame.rest :=
    hw.trans L.point_two
  have horder :
      ((iu < iv ∧ iv < iw) ∨ (iu < iw ∧ iw < iv)) := by
    apply image_index_order_dichotomy_after_zero hn hu hv hw
    · exact L.injective.ne (by decide)
    · exact L.injective.ne (by decide)
    · exact L.injective.ne (by decide)
  have hSmem : ∀ p, p ∈ capSInteriorLabels →
      L.pointOf p ∈ capInteriorAt SP.partition SP.surplusIdx := by
    intro p hp
    apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mp
    change p ∈ L.toCard11Labeling.interiorLabels SP.partition
      SP.surplusIdx
    rw [L.surplusInterior_eq]
    exact hp
  have hO1mem : ∀ p, p ∈ capO1InteriorLabels →
      L.pointOf p ∈ capInteriorAt SP.partition second := by
    intro p hp
    apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mp
    change p ∈ L.toCard11Labeling.interiorLabels SP.partition second
    rw [L.secondInterior_eq]
    exact hp
  have hO2mem : ∀ p, p ∈ capO2InteriorLabels →
      L.pointOf p ∈ capInteriorAt SP.partition frame.rest := by
    intro p hp
    apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mp
    change p ∈ L.toCard11Labeling.interiorLabels SP.partition frame.rest
    rw [L.restInterior_eq]
    exact hp
  have hArcS : ∀ p, p ∈ capSInteriorLabels →
      OnArcOpposite (phi iu) (phi iv) (phi iw) (phi (indexOf p)) := by
    intro p hp
    have h := capInteriorAt_onArc_other_apices SP
      hsecond.symm frame.rest_ne_surplus.symm
      frame.rest_ne_second.symm (hSmem p hp)
    rw [← hphiU, ← hphiV, ← hphiW, ← hindex p] at h
    exact h
  have hArcO1 : ∀ p, p ∈ capO1InteriorLabels →
      OnArcOpposite (phi iv) (phi iu) (phi iw) (phi (indexOf p)) := by
    intro p hp
    have h := capInteriorAt_onArc_other_apices SP hsecond
      frame.rest_ne_second.symm frame.rest_ne_surplus.symm (hO1mem p hp)
    rw [← hphiV, ← hphiU, ← hphiW, ← hindex p] at h
    exact h
  have hArcO2 : ∀ p, p ∈ capO2InteriorLabels →
      OnArcOpposite (phi iw) (phi iu) (phi iv) (phi (indexOf p)) := by
    intro p hp
    have h := capInteriorAt_onArc_other_apices SP
      frame.rest_ne_surplus frame.rest_ne_second hsecond.symm (hO2mem p hp)
    rw [← hphiW, ← hphiU, ← hphiV, ← hindex p] at h
    exact h
  rcases horder with hdirect | hmirror
  · have hO2nine : iu < indexOf 9 ∧ indexOf 9 < iv :=
      strict_between_of_onArc hccw hphi hdirect.1 (Or.inr hdirect.2)
        (hArcO2 9 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 9) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 9) hv (by decide))
    have hO2ten : iu < indexOf 10 ∧ indexOf 10 < iv :=
      strict_between_of_onArc hccw hphi hdirect.1 (Or.inr hdirect.2)
        (hArcO2 10 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 10) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 10) hv (by decide))
    have hSthree : iv < indexOf 3 ∧ indexOf 3 < iw :=
      strict_between_of_onArc hccw hphi hdirect.2 (Or.inl hdirect.1)
        (hArcS 3 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 3) hv (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 3) hw (by decide))
    have hSfour : iv < indexOf 4 ∧ indexOf 4 < iw :=
      strict_between_of_onArc hccw hphi hdirect.2 (Or.inl hdirect.1)
        (hArcS 4 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 4) hv (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 4) hw (by decide))
    have hSfive : iv < indexOf 5 ∧ indexOf 5 < iw :=
      strict_between_of_onArc hccw hphi hdirect.2 (Or.inl hdirect.1)
        (hArcS 5 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 5) hv (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 5) hw (by decide))
    have hO1sixOutside : indexOf 6 < iu ∨ iw < indexOf 6 :=
      strict_outside_of_onArc_reference_between hccw hphi hdirect.1
        hdirect.2 (hArcO1 6 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 6) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 6) hw (by decide))
    have hO1sevenOutside : indexOf 7 < iu ∨ iw < indexOf 7 :=
      strict_outside_of_onArc_reference_between hccw hphi hdirect.1
        hdirect.2 (hArcO1 7 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 7) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 7) hw (by decide))
    have hO1eightOutside : indexOf 8 < iu ∨ iw < indexOf 8 :=
      strict_outside_of_onArc_reference_between hccw hphi hdirect.1
        hdirect.2 (hArcO1 8 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 8) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 8) hw (by decide))
    have hO1six : iw < indexOf 6 :=
      open_reverse_complement_after_zero hn (lo := iw) hO1sixOutside
    have hO1seven : iw < indexOf 7 :=
      open_reverse_complement_after_zero hn (lo := iw) hO1sevenOutside
    have hO1eight : iw < indexOf 8 :=
      open_reverse_complement_after_zero hn (lo := iw) hO1eightOutside
    rcases exists_sorted_pair_points_between (φ := phi) (lo := iu) (hi := iv)
        hO2nine.1 hO2nine.2 hO2ten.1 hO2ten.2 (hindex 9) (hindex 10)
        (L.injective.ne (by decide)) with
      ⟨o20, o21, io20, io21, huo20, ho20o21, ho21v, hio20, hio21,
        hO2set⟩
    rcases exists_sorted_triple_points_between (φ := phi) (lo := iv)
        (hi := iw) hSthree.1 hSthree.2 hSfour.1 hSfour.2 hSfive.1
        hSfive.2 (hindex 3) (hindex 4) (hindex 5)
        (L.injective.ne (by decide)) (L.injective.ne (by decide))
        (L.injective.ne (by decide)) with
      ⟨s0, s1, s2, is0, is1, is2, hvs0, hs0s1, hs1s2, hs2w,
        his0, his1, his2, hSset⟩
    rcases exists_sorted_triple_points_after (phi := phi) (lo := iw)
        hO1six hO1seven hO1eight (hindex 6) (hindex 7) (hindex 8)
        (L.injective.ne (by decide)) (L.injective.ne (by decide))
        (L.injective.ne (by decide)) with
      ⟨o10, o11, o12, io10, io11, io12, hwo10, ho10o11, ho11o12,
        hio10, hio11, hio12, hO1set⟩
    have hO2set' : ({phi io20, phi io21} : Finset ℝ²) =
        {L.pointOf 9, L.pointOf 10} := by
      simpa [hio20, hio21] using hO2set
    have hSset' : ({phi is0, phi is1, phi is2} : Finset ℝ²) =
        {L.pointOf 3, L.pointOf 4, L.pointOf 5} := by
      simpa [his0, his1, his2] using hSset
    have hO1set' : ({phi io10, phi io11, phi io12} : Finset ℝ²) =
        {L.pointOf 6, L.pointOf 7, L.pointOf 8} := by
      simpa [hio10, hio11, hio12] using hO1set
    exact ⟨Card11DirectOrMirrorCcwLabeling.direct
      (directLabeling_of_ordered_blocks L.injective hphi hccw
        huo20 ho20o21 ho21v hvs0 hs0s1 hs1s2 hs2w hwo10 ho10o11
        ho11o12 hu hv hw hO2set' hSset' hO1set')⟩
  · have hO1six : iu < indexOf 6 ∧ indexOf 6 < iw :=
      strict_between_of_onArc hccw hphi hmirror.1 (Or.inr hmirror.2)
        (hArcO1 6 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 6) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 6) hw (by decide))
    have hO1seven : iu < indexOf 7 ∧ indexOf 7 < iw :=
      strict_between_of_onArc hccw hphi hmirror.1 (Or.inr hmirror.2)
        (hArcO1 7 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 7) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 7) hw (by decide))
    have hO1eight : iu < indexOf 8 ∧ indexOf 8 < iw :=
      strict_between_of_onArc hccw hphi hmirror.1 (Or.inr hmirror.2)
        (hArcO1 8 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 8) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 8) hw (by decide))
    have hSthree : iw < indexOf 3 ∧ indexOf 3 < iv :=
      strict_between_of_onArc hccw hphi hmirror.2 (Or.inl hmirror.1)
        ((onArcOpposite_swap (phi iu) (phi iv) (phi iw)
          (phi (indexOf 3))).mp (hArcS 3 (by decide)))
        (ambient_index_ne_of_label_ne L.injective (hindex 3) hw (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 3) hv (by decide))
    have hSfour : iw < indexOf 4 ∧ indexOf 4 < iv :=
      strict_between_of_onArc hccw hphi hmirror.2 (Or.inl hmirror.1)
        ((onArcOpposite_swap (phi iu) (phi iv) (phi iw)
          (phi (indexOf 4))).mp (hArcS 4 (by decide)))
        (ambient_index_ne_of_label_ne L.injective (hindex 4) hw (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 4) hv (by decide))
    have hSfive : iw < indexOf 5 ∧ indexOf 5 < iv :=
      strict_between_of_onArc hccw hphi hmirror.2 (Or.inl hmirror.1)
        ((onArcOpposite_swap (phi iu) (phi iv) (phi iw)
          (phi (indexOf 5))).mp (hArcS 5 (by decide)))
        (ambient_index_ne_of_label_ne L.injective (hindex 5) hw (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 5) hv (by decide))
    have hO2nineOutside : indexOf 9 < iu ∨ iv < indexOf 9 :=
      strict_outside_of_onArc_reference_between hccw hphi hmirror.1
        hmirror.2 (hArcO2 9 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 9) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 9) hv (by decide))
    have hO2tenOutside : indexOf 10 < iu ∨ iv < indexOf 10 :=
      strict_outside_of_onArc_reference_between hccw hphi hmirror.1
        hmirror.2 (hArcO2 10 (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 10) hu (by decide))
        (ambient_index_ne_of_label_ne L.injective (hindex 10) hv (by decide))
    have hO2nine : iv < indexOf 9 :=
      open_reverse_complement_after_zero hn (lo := iv) hO2nineOutside
    have hO2ten : iv < indexOf 10 :=
      open_reverse_complement_after_zero hn (lo := iv) hO2tenOutside
    rcases exists_sorted_triple_points_between (φ := phi) (lo := iu)
        (hi := iw) hO1six.1 hO1six.2 hO1seven.1 hO1seven.2 hO1eight.1
        hO1eight.2 (hindex 6) (hindex 7) (hindex 8)
        (L.injective.ne (by decide)) (L.injective.ne (by decide))
        (L.injective.ne (by decide)) with
      ⟨o10, o11, o12, io10, io11, io12, huo10, ho10o11, ho11o12,
        ho12w, hio10, hio11, hio12, hO1set⟩
    rcases exists_sorted_triple_points_between (φ := phi) (lo := iw)
        (hi := iv) hSthree.1 hSthree.2 hSfour.1 hSfour.2 hSfive.1
        hSfive.2 (hindex 3) (hindex 4) (hindex 5)
        (L.injective.ne (by decide)) (L.injective.ne (by decide))
        (L.injective.ne (by decide)) with
      ⟨s0, s1, s2, is0, is1, is2, hws0, hs0s1, hs1s2, hs2v,
        his0, his1, his2, hSset⟩
    rcases exists_sorted_pair_points_after (φ := phi) (lo := iv)
        hO2nine hO2ten (hindex 9) (hindex 10)
        (L.injective.ne (by decide)) with
      ⟨o20, o21, io20, io21, hvo20, ho20o21, hio20, hio21, hO2set⟩
    have hO1set' : ({phi io10, phi io11, phi io12} : Finset ℝ²) =
        {L.pointOf 6, L.pointOf 7, L.pointOf 8} := by
      simpa [hio10, hio11, hio12] using hO1set
    have hSset' : ({phi is0, phi is1, phi is2} : Finset ℝ²) =
        {L.pointOf 3, L.pointOf 4, L.pointOf 5} := by
      simpa [his0, his1, his2] using hSset
    have hO2set' : ({phi io20, phi io21} : Finset ℝ²) =
        {L.pointOf 9, L.pointOf 10} := by
      simpa [hio20, hio21] using hO2set
    exact ⟨Card11DirectOrMirrorCcwLabeling.mirror
      (mirrorLabeling_of_ordered_blocks L.injective hphi hccw
        huo10 ho10o11 ho11o12 ho12w hws0 hs0s1 hs1s2 hs2v hvo20
        ho20o21 hu hv hw hO1set' hSset' hO2set')⟩

end Card11CapLabeling
end Census554
end Problem97
