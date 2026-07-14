/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cap.PartitionFromMEC
import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.CGN.CGN4g
import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.WitnessPacketInterface
import Erdos9796Proof.P97.N8.FourSubpacket
import Erdos9796Proof.P97.N8.N8CapCoordNorm
import Erdos9796Proof.P97.U2.OneHitBound
import Erdos9796Proof.P97.U2.SameDistanceArcContainment
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# `SurplusM44Packet` shard 01 (lines 35-1511 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`exists_sorted_pair_finset_eq`.
Last decl:
`triangle_verts_subset_adjacentCapsByIndex`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

/-- Choose the increasing presentation of a two-element finite set in a linear
order.  This is used by the P1 selector to orient the two strict-interior
points of a short cap by their ambient boundary indices. -/
theorem exists_sorted_pair_finset_eq
    {α : Type} [LinearOrder α] [DecidableEq α] {a b : α} (hab : a ≠ b) :
    ∃ x y : α, x < y ∧ ({x, y} : Finset α) = ({a, b} : Finset α) := by
  by_cases h : a < b
  · exact ⟨a, b, h, rfl⟩
  · have hba : b < a := lt_of_le_of_ne (le_of_not_gt h) hab.symm
    exact ⟨b, a, hba, by simp [Finset.pair_comm]⟩

/-- Choose the increasing presentation of a three-element finite set in a
linear order.  The P1 selector applies this to the three exported surplus-cap
boundary indices before assigning the generated labels `s1`, `s2`, `s3`. -/
theorem exists_sorted_triple_finset_eq
    {α : Type} [LinearOrder α] [DecidableEq α]
    {a b c : α} (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ∃ x y z : α, x < y ∧ y < z ∧
      ({x, y, z} : Finset α) = ({a, b, c} : Finset α) := by
  by_cases hablt : a < b
  · by_cases hbclt : b < c
    · exact ⟨a, b, c, hablt, hbclt, rfl⟩
    · have hcb : c < b := lt_of_le_of_ne (le_of_not_gt hbclt) hbc.symm
      by_cases haclt : a < c
      · refine ⟨a, c, b, haclt, hcb, ?_⟩
        ext t
        simp [or_comm]
      · have hca : c < a := lt_of_le_of_ne (le_of_not_gt haclt) hac.symm
        refine ⟨c, a, b, hca, hablt, ?_⟩
        ext t
        simp [or_left_comm, or_comm]
  · have hba : b < a := lt_of_le_of_ne (le_of_not_gt hablt) hab.symm
    by_cases haclt : a < c
    · refine ⟨b, a, c, hba, haclt, ?_⟩
      ext t
      simp [or_left_comm]
    · have hca : c < a := lt_of_le_of_ne (le_of_not_gt haclt) hac.symm
      by_cases hbclt : b < c
      · refine ⟨b, c, a, hbclt, hca, ?_⟩
        ext t
        simp [or_left_comm, or_comm]
      · have hcb : c < b := lt_of_le_of_ne (le_of_not_gt hbclt) hbc.symm
        refine ⟨c, b, a, hcb, hba, ?_⟩
        ext t
        simp [or_left_comm, or_comm]

/-- Sort two already indexed points inside one ambient index interval.  The
P1 selector uses this after the strict cap-interior interval export has found
the two boundary indices for a short cap. -/
theorem exists_sorted_pair_points_between
    {α : Type} [DecidableEq α] {n : ℕ} {φ : Fin n → α}
    {lo hi ia ib : Fin n} {a b : α}
    (hloia : lo < ia) (hiahi : ia < hi)
    (hloib : lo < ib) (hibhi : ib < hi)
    (hia : φ ia = a) (hib : φ ib = b) (hab : a ≠ b) :
    ∃ x y : α, ∃ ix iy : Fin n,
      lo < ix ∧ ix < iy ∧ iy < hi ∧
      φ ix = x ∧ φ iy = y ∧
      ({x, y} : Finset α) = ({a, b} : Finset α) := by
  have hiab : ia ≠ ib := by
    intro h
    exact hab (by rw [← hia, ← hib, h])
  by_cases hlt : ia < ib
  · exact ⟨a, b, ia, ib, hloia, hlt, hibhi, hia, hib, rfl⟩
  · have hible : ib ≤ ia := le_of_not_gt hlt
    have hbi : ib < ia := lt_of_le_of_ne hible hiab.symm
    exact
      ⟨b, a, ib, ia, hloib, hbi, hiahi, hib, hia,
        by simp [Finset.pair_comm]⟩

/-- Sort two already indexed points that both occur after a lower ambient
index.  This is the finite selector for the wrapping cap after the boundary
order is cut at the surplus apex. -/
theorem exists_sorted_pair_points_after
    {α : Type} [DecidableEq α] {n : ℕ} {φ : Fin n → α}
    {lo ia ib : Fin n} {a b : α}
    (hloia : lo < ia) (hloib : lo < ib)
    (hia : φ ia = a) (hib : φ ib = b) (hab : a ≠ b) :
    ∃ x y : α, ∃ ix iy : Fin n,
      lo < ix ∧ ix < iy ∧ φ ix = x ∧ φ iy = y ∧
      ({x, y} : Finset α) = ({a, b} : Finset α) := by
  have hiab : ia ≠ ib := by
    intro h
    exact hab (by rw [← hia, ← hib, h])
  by_cases hlt : ia < ib
  · exact ⟨a, b, ia, ib, hloia, hlt, hia, hib, rfl⟩
  · have hible : ib ≤ ia := le_of_not_gt hlt
    have hbi : ib < ia := lt_of_le_of_ne hible hiab.symm
    exact
      ⟨b, a, ib, ia, hloib, hbi, hib, hia,
        by simp [Finset.pair_comm]⟩

/-- After cutting an ambient boundary enumeration at index zero, the "before
zero" branch of an open reverse-complement interval is impossible. -/
theorem open_reverse_complement_after_zero
    {n : ℕ} (hn : 0 < n) {lo q : Fin n} :
    q < (⟨0, hn⟩ : Fin n) ∨ lo < q → lo < q := by
  intro h
  haveI : NeZero n := ⟨Nat.ne_of_gt hn⟩
  rcases h with hq | hq
  · exact (Fin.not_lt_zero q hq).elim
  · exact hq

/-- Two nonzero distinct indices after a zero cut occur in one of the two
possible linear orders. -/
theorem fin_order_dichotomy_after_zero
    {n : ℕ} (hn : 0 < n) {a b : Fin n}
    (ha : a ≠ (⟨0, hn⟩ : Fin n))
    (hb : b ≠ (⟨0, hn⟩ : Fin n))
    (hab : a ≠ b) :
    (((⟨0, hn⟩ : Fin n) < a ∧ a < b) ∨
      ((⟨0, hn⟩ : Fin n) < b ∧ b < a)) := by
  have h0a : (⟨0, hn⟩ : Fin n) < a := by
    rw [Fin.lt_def]
    exact Nat.pos_of_ne_zero (by
      intro ha0
      exact ha (Fin.ext ha0))
  have h0b : (⟨0, hn⟩ : Fin n) < b := by
    rw [Fin.lt_def]
    exact Nat.pos_of_ne_zero (by
      intro hb0
      exact hb (Fin.ext hb0))
  rcases lt_or_gt_of_ne hab with hablt | hbal
  · exact Or.inl ⟨h0a, hablt⟩
  · exact Or.inr ⟨h0b, hbal⟩

/-- Point-valued version of `fin_order_dichotomy_after_zero`: once the
surplus apex has been cut to index zero, the two other distinct apex indices
fall into one of the two possible side orientations. -/
theorem image_index_order_dichotomy_after_zero
    {α : Type} {n : ℕ} (hn : 0 < n) {φ : Fin n → α}
    {u v w : α} {iv iw : Fin n}
    (hu : φ (⟨0, hn⟩ : Fin n) = u)
    (hv : φ iv = v) (hw : φ iw = w)
    (huv : u ≠ v) (huw : u ≠ w) (hvw : v ≠ w) :
    (((⟨0, hn⟩ : Fin n) < iv ∧ iv < iw) ∨
      ((⟨0, hn⟩ : Fin n) < iw ∧ iw < iv)) := by
  have hiv0 : iv ≠ (⟨0, hn⟩ : Fin n) := by
    intro h
    exact huv (by rw [← hu, ← hv, h])
  have hiw0 : iw ≠ (⟨0, hn⟩ : Fin n) := by
    intro h
    exact huw (by rw [← hu, ← hw, h])
  have hivw : iv ≠ iw := by
    intro h
    exact hvw (by rw [← hv, ← hw, h])
  exact fin_order_dichotomy_after_zero hn hiv0 hiw0 hivw

/-- Sort three already indexed points inside one ambient index interval.  This
keeps the interval bounds and point-set equality needed when the P1 selector
orients a chosen three-point surplus subpacket. -/
theorem exists_sorted_triple_points_between
    {α : Type} [DecidableEq α] {n : ℕ} {φ : Fin n → α}
    {lo hi ia ib ic : Fin n} {a b c : α}
    (hloia : lo < ia) (hiahi : ia < hi)
    (hloib : lo < ib) (hibhi : ib < hi)
    (hloic : lo < ic) (hichi : ic < hi)
    (hia : φ ia = a) (hib : φ ib = b) (hic : φ ic = c)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ∃ x y z : α, ∃ ix iy iz : Fin n,
      lo < ix ∧ ix < iy ∧ iy < iz ∧ iz < hi ∧
      φ ix = x ∧ φ iy = y ∧ φ iz = z ∧
      ({x, y, z} : Finset α) = ({a, b, c} : Finset α) := by
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
      hiab hiac hibc with
    ⟨ix, iy, iz, hixiy, hiyiz, hset⟩
  have hlo_of_mem {t : Fin n}
      (ht : t ∈ ({ia, ib, ic} : Finset (Fin n))) : lo < t := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at ht
    rcases ht with rfl | rfl | rfl
    · exact hloia
    · exact hloib
    · exact hloic
  have hhi_of_mem {t : Fin n}
      (ht : t ∈ ({ia, ib, ic} : Finset (Fin n))) : t < hi := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at ht
    rcases ht with rfl | rfl | rfl
    · exact hiahi
    · exact hibhi
    · exact hichi
  have hix_mem : ix ∈ ({ia, ib, ic} : Finset (Fin n)) := by
    rw [← hset]
    simp
  have hiz_mem : iz ∈ ({ia, ib, ic} : Finset (Fin n)) := by
    rw [← hset]
    simp
  have himage := congrArg (fun s : Finset (Fin n) => s.image φ) hset
  refine
    ⟨φ ix, φ iy, φ iz, ix, iy, iz, hlo_of_mem hix_mem, hixiy,
      hiyiz, hhi_of_mem hiz_mem, rfl, rfl, rfl, ?_⟩
  simpa [hia, hib, hic] using himage

namespace SurplusCapPacket

/-- The cyclic Moser triangle whose first vertex is opposite the selected cap
index. -/
@[reducible] def triangleByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    MoserTriangle A :=
  match i.1 with
  | 0 => S.triangle
  | 1 =>
      { v1 := S.triangle.v2
        v2 := S.triangle.v3
        v3 := S.triangle.v1
        v1_mem := S.triangle.v2_mem
        v2_mem := S.triangle.v3_mem
        v3_mem := S.triangle.v1_mem
        v12_ne := S.triangle.v23_ne
        v13_ne := S.triangle.v12_ne.symm
        v23_ne := S.triangle.v13_ne.symm }
  | _ =>
      { v1 := S.triangle.v3
        v2 := S.triangle.v1
        v3 := S.triangle.v2
        v1_mem := S.triangle.v3_mem
        v2_mem := S.triangle.v1_mem
        v3_mem := S.triangle.v2_mem
        v12_ne := S.triangle.v13_ne.symm
        v13_ne := S.triangle.v23_ne.symm
        v23_ne := S.triangle.v12_ne }

/-- The circumscribed MEC packet carried by a surplus packet. -/
@[reducible] noncomputable def circPacket
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CircumscribedMECPacket A S.triangle :=
  CircumscribedMECPacket.ofNonObtuse S.triangleNonObtuse S.hCirc

/-- The circumscribed MEC packet rotated to cap index `1`. -/
@[reducible] noncomputable def circPacket2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CircumscribedMECPacket A (S.triangleByIndex 1) :=
  { center := S.circPacket.center
    radius := S.circPacket.radius
    radius_pos := S.circPacket.radius_pos
    moser_on_boundary_1 := S.circPacket.moser_on_boundary_2
    moser_on_boundary_2 := S.circPacket.moser_on_boundary_3
    moser_on_boundary_3 := S.circPacket.moser_on_boundary_1
    inner_at_v1 := S.circPacket.inner_at_v2
    inner_at_v2 := S.circPacket.inner_at_v3
    inner_at_v3 := S.circPacket.inner_at_v1
    disk_contains_A := S.circPacket.disk_contains_A }

/-- The circumscribed MEC packet rotated to cap index `2`. -/
@[reducible] noncomputable def circPacket3
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CircumscribedMECPacket A (S.triangleByIndex 2) :=
  { center := S.circPacket.center
    radius := S.circPacket.radius
    radius_pos := S.circPacket.radius_pos
    moser_on_boundary_1 := S.circPacket.moser_on_boundary_3
    moser_on_boundary_2 := S.circPacket.moser_on_boundary_1
    moser_on_boundary_3 := S.circPacket.moser_on_boundary_2
    inner_at_v1 := S.circPacket.inner_at_v3
    inner_at_v2 := S.circPacket.inner_at_v1
    inner_at_v3 := S.circPacket.inner_at_v2
    disk_contains_A := S.circPacket.disk_contains_A }

/-- The circumscribed MEC packet associated with an arbitrary indexed cap. -/
@[reducible] noncomputable def circPacketByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    CircumscribedMECPacket A (S.triangleByIndex i) :=
  Classical.choice <| by
    fin_cases i
    · exact ⟨by simpa [triangleByIndex] using S.circPacket⟩
    · exact ⟨S.circPacket2⟩
    · exact ⟨S.circPacket3⟩

/-- The cap frame whose ordered base is the support chord of an indexed cap. -/
@[reducible] def capFrameByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    MoserTriangle A :=
  (S.triangleByIndex i).rotate

/-- The circumscribed MEC packet in the support-chord frame of an indexed cap. -/
@[reducible] noncomputable def capFramePacketByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    CircumscribedMECPacket A (S.capFrameByIndex i) :=
  (S.circPacketByIndex i).rotate

/-- The support-chord frame of an indexed cap with the base order reversed. -/
@[reducible] def reversedCapFrameByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    MoserTriangle A :=
  (S.triangleByIndex i).reverse

/-- The circumscribed MEC packet in the reversed support-chord frame. -/
@[reducible] noncomputable def reversedCapFramePacketByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    CircumscribedMECPacket A (S.reversedCapFrameByIndex i) :=
  (S.circPacketByIndex i).reverse

/-- The closed cap selected by an index is contained in the ambient point set. -/
theorem capByIndex_subset
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.capByIndex i ⊆ A := by
  intro x hx
  fin_cases i
  · exact S.partition.C1_subset hx
  · exact S.partition.C2_subset hx
  · exact S.partition.C3_subset hx

/-- The strict interior of an indexed cap is contained in the corresponding
closed cap. -/
theorem capInteriorByIndex_subset_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.capInteriorByIndex i ⊆ S.capByIndex i := by
  intro x hx
  fin_cases i
  · simp only [capInteriorByIndex, capByIndex] at hx ⊢
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact hx.2.2
  · simp only [capInteriorByIndex, capByIndex] at hx ⊢
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact hx.2.2
  · simp only [capInteriorByIndex, capByIndex] at hx ⊢
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact hx.2.2

/-- A short indexed cap has two named strict interior points. -/
theorem exists_capInteriorByIndex_pair_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    ∃ x y : ℝ², x ≠ y ∧ S.capInteriorByIndex i = ({x, y} : Finset ℝ²) := by
  exact Finset.card_eq_two.mp
    (S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap)

/-- Indexed arc-membership for the closed cap selected by an index. -/
theorem capByIndex_arc_membership
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    ∀ x ∈ A, x ∈ S.capByIndex i ↔
      OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 x := by
  intro x hxA
  fin_cases i
  · simpa [capByIndex, triangleByIndex] using (S.partition.arc_membership x hxA).1
  · simpa [capByIndex, triangleByIndex] using (S.partition.arc_membership x hxA).2.1
  · simpa [capByIndex, triangleByIndex] using (S.partition.arc_membership x hxA).2.2

/-- In one shared ambient CCW boundary enumeration, an indexed cap is exactly
the closed interval between its two support endpoints whenever the opposite
triangle vertex lies outside that endpoint interval.  This is the packet-level
form of `onArcOpposite_iff_index_block` used by the erased-pin hull-order
producer. -/
theorem capByIndex_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (hab : ia < ib) (hc : ic < ia ∨ ib < ic)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) :
    ∀ x : ℝ²,
      x ∈ S.capByIndex i ↔
        ∃ q : Fin n, ia ≤ q ∧ q ≤ ib ∧ φ q = x := by
  intro x
  constructor
  · intro hxC
    have hxA : x ∈ A := S.capByIndex_subset i hxC
    rw [← hφimage] at hxA
    rcases Finset.mem_image.mp hxA with ⟨q, _hq, hqeq⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have hqC : φ q ∈ S.capByIndex i := by
      simpa [hqeq] using hxC
    have harc : OnArcOpposite (φ ic) (φ ia) (φ ib) (φ q) := by
      have h := (S.capByIndex_arc_membership i (φ q) hqA).1 hqC
      simpa [hic, hia, hib] using h
    obtain ⟨hlo, hhi⟩ :=
      (onArcOpposite_iff_index_block hccw hφ hab hc q).1 harc
    exact ⟨q, hlo, hhi, hqeq⟩
  · rintro ⟨q, hiaq, hqib, rfl⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have harc : OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 (φ q) := by
      have h :=
        (onArcOpposite_iff_index_block hccw hφ hab hc q).2 ⟨hiaq, hqib⟩
      simpa [hic, hia, hib] using h
    exact (S.capByIndex_arc_membership i (φ q) hqA).2 harc

/-- Reverse-support endpoint form of `capByIndex_interval_of_global_indices`.
If the `v3` endpoint occurs before the `v2` endpoint and the opposite apex is
outside that interval, the indexed cap is the closed interval from `v3` to
`v2`. -/
theorem capByIndex_reverse_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (hibia : ib < ia) (hc : ic < ib ∨ ia < ic)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) :
    ∀ x : ℝ²,
      x ∈ S.capByIndex i ↔
        ∃ q : Fin n, ib ≤ q ∧ q ≤ ia ∧ φ q = x := by
  intro x
  constructor
  · intro hxC
    have hxA : x ∈ A := S.capByIndex_subset i hxC
    rw [← hφimage] at hxA
    rcases Finset.mem_image.mp hxA with ⟨q, _hq, hqeq⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have hqC : φ q ∈ S.capByIndex i := by
      simpa [hqeq] using hxC
    have harc : OnArcOpposite (φ ic) (φ ia) (φ ib) (φ q) := by
      have h := (S.capByIndex_arc_membership i (φ q) hqA).1 hqC
      simpa [hic, hia, hib] using h
    have harcSwap : OnArcOpposite (φ ic) (φ ib) (φ ia) (φ q) :=
      (onArcOpposite_swap (φ ic) (φ ia) (φ ib) (φ q)).1 harc
    obtain ⟨hlo, hhi⟩ :=
      (onArcOpposite_iff_index_block hccw hφ hibia hc q).1 harcSwap
    exact ⟨q, hlo, hhi, hqeq⟩
  · rintro ⟨q, hibq, hqia, rfl⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have harcSwap : OnArcOpposite (φ ic) (φ ib) (φ ia) (φ q) :=
      (onArcOpposite_iff_index_block hccw hφ hibia hc q).2 ⟨hibq, hqia⟩
    have harc : OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 (φ q) := by
      have h : OnArcOpposite (φ ic) (φ ia) (φ ib) (φ q) :=
        (onArcOpposite_swap (φ ic) (φ ia) (φ ib) (φ q)).2 harcSwap
      simpa [hic, hia, hib] using h
    exact (S.capByIndex_arc_membership i (φ q) hqA).2 harc

/-- In one shared ambient CCW boundary enumeration, an indexed cap is exactly
the complement of the open endpoint interval whenever the opposite triangle
vertex lies strictly between the endpoint indices.  This is the wraparound
form needed when a cap crosses the chosen linear cut of the cyclic boundary
order. -/
theorem capByIndex_complement_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (haic : ia < ic) (hcib : ic < ib)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) :
    ∀ x : ℝ²,
      x ∈ S.capByIndex i ↔
        ∃ q : Fin n, (q ≤ ia ∨ ib ≤ q) ∧ φ q = x := by
  intro x
  have hab : ia < ib := haic.trans hcib
  have hcpos :
      0 < signedArea2 (φ ic) (φ ia) (φ ib) :=
    signedArea2_pos_of_between hccw hφ haic hcib
  constructor
  · intro hxC
    have hxA : x ∈ A := S.capByIndex_subset i hxC
    rw [← hφimage] at hxA
    rcases Finset.mem_image.mp hxA with ⟨q, _hq, hqeq⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have hqC : φ q ∈ S.capByIndex i := by
      simpa [hqeq] using hxC
    have harc : OnArcOpposite (φ ic) (φ ia) (φ ib) (φ q) := by
      have h := (S.capByIndex_arc_membership i (φ q) hqA).1 hqC
      simpa [hic, hia, hib] using h
    unfold OnArcOpposite at harc
    have hq_nonpos : signedArea2 (φ q) (φ ia) (φ ib) ≤ 0 := by
      by_contra hnot
      have hqpos : 0 < signedArea2 (φ q) (φ ia) (φ ib) :=
        lt_of_not_ge hnot
      have hprod_pos :
          0 <
            signedArea2 (φ q) (φ ia) (φ ib) *
              signedArea2 (φ ic) (φ ia) (φ ib) :=
        mul_pos hqpos hcpos
      linarith
    obtain ⟨_hpos, hzero, hneg⟩ :=
      signedArea2_trichotomy hccw hφ hab q
    rcases lt_or_eq_of_le hq_nonpos with hqneg | hqzero
    · rcases hneg.mp hqneg with hqia | hibq
      · exact ⟨q, Or.inl (le_of_lt hqia), hqeq⟩
      · exact ⟨q, Or.inr (le_of_lt hibq), hqeq⟩
    · rcases hzero.mp hqzero with hqia | hqib
      · exact ⟨q, Or.inl (le_of_eq hqia), hqeq⟩
      · exact ⟨q, Or.inr (le_of_eq hqib.symm), hqeq⟩
  · rintro ⟨q, hqout, rfl⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have hq_nonpos : signedArea2 (φ q) (φ ia) (φ ib) ≤ 0 := by
      rcases hqout with hqia | hibq
      · rcases eq_or_lt_of_le hqia with hqia_eq | hqia_lt
        · exact
            le_of_eq
              (signedArea2_eq_zero_of_endpoint (Or.inl hqia_eq))
        · exact
            le_of_lt
              (signedArea2_neg_of_outside hccw hφ hab (Or.inl hqia_lt))
      · rcases eq_or_lt_of_le hibq with hibq_eq | hibq_lt
        · exact
            le_of_eq
              (signedArea2_eq_zero_of_endpoint (Or.inr hibq_eq.symm))
        · exact
            le_of_lt
              (signedArea2_neg_of_outside hccw hφ hab (Or.inr hibq_lt))
    have harc : OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 (φ q) := by
      have h : OnArcOpposite (φ ic) (φ ia) (φ ib) (φ q) := by
        unfold OnArcOpposite
        exact mul_nonpos_of_nonpos_of_nonneg hq_nonpos (le_of_lt hcpos)
      simpa [hic, hia, hib] using h
    exact (S.capByIndex_arc_membership i (φ q) hqA).2 harc

/-- Reverse-endpoint form of
`capByIndex_complement_interval_of_global_indices`.  If the `v3` endpoint comes
before the opposite apex and the apex comes before the `v2` endpoint in the
ambient order, then the indexed cap is the complement of the open interval from
`v3` to `v2`.  This is the wrapping orientation that occurs after cutting the
P1 boundary order at the surplus apex. -/
theorem capByIndex_reverse_complement_interval_of_global_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hφ : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    {ia ib ic : Fin n} (hibc : ib < ic) (hcia : ic < ia)
    (hic : φ ic = (S.triangleByIndex i).v1)
    (hia : φ ia = (S.triangleByIndex i).v2)
    (hib : φ ib = (S.triangleByIndex i).v3) :
    ∀ x : ℝ²,
      x ∈ S.capByIndex i ↔
        ∃ q : Fin n, (q ≤ ib ∨ ia ≤ q) ∧ φ q = x := by
  intro x
  have hbia : ib < ia := hibc.trans hcia
  have hcpos_swap :
      0 < signedArea2 (φ ic) (φ ib) (φ ia) :=
    signedArea2_pos_of_between hccw hφ hibc hcia
  have hcneg :
      signedArea2 (φ ic) (φ ia) (φ ib) < 0 := by
    rw [signedArea2_swap23]
    linarith
  constructor
  · intro hxC
    have hxA : x ∈ A := S.capByIndex_subset i hxC
    rw [← hφimage] at hxA
    rcases Finset.mem_image.mp hxA with ⟨q, _hq, hqeq⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have hqC : φ q ∈ S.capByIndex i := by
      simpa [hqeq] using hxC
    have harc : OnArcOpposite (φ ic) (φ ia) (φ ib) (φ q) := by
      have h := (S.capByIndex_arc_membership i (φ q) hqA).1 hqC
      simpa [hic, hia, hib] using h
    unfold OnArcOpposite at harc
    have hq_nonneg : 0 ≤ signedArea2 (φ q) (φ ia) (φ ib) :=
      nonneg_of_mul_nonpos_left harc hcneg
    have hq_nonpos_swap :
        signedArea2 (φ q) (φ ib) (φ ia) ≤ 0 := by
      rw [signedArea2_swap23] at hq_nonneg
      linarith
    obtain ⟨_hpos, hzero, hneg⟩ :=
      signedArea2_trichotomy hccw hφ hbia q
    rcases lt_or_eq_of_le hq_nonpos_swap with hqneg | hqzero
    · rcases hneg.mp hqneg with hqib | hiaq
      · exact ⟨q, Or.inl (le_of_lt hqib), hqeq⟩
      · exact ⟨q, Or.inr (le_of_lt hiaq), hqeq⟩
    · rcases hzero.mp hqzero with hqib | hqia
      · exact ⟨q, Or.inl (le_of_eq hqib), hqeq⟩
      · exact ⟨q, Or.inr (le_of_eq hqia.symm), hqeq⟩
  · rintro ⟨q, hqout, rfl⟩
    have hqA : φ q ∈ A := by
      rw [← hφimage]
      exact Finset.mem_image_of_mem φ (Finset.mem_univ q)
    have hq_nonneg : 0 ≤ signedArea2 (φ q) (φ ia) (φ ib) := by
      rcases hqout with hqib | hiaq
      · rcases eq_or_lt_of_le hqib with hqib_eq | hqib_lt
        · exact
            le_of_eq
              (signedArea2_eq_zero_of_endpoint (Or.inr hqib_eq)).symm
        · have hneg_swap :
              signedArea2 (φ q) (φ ib) (φ ia) < 0 :=
            signedArea2_neg_of_outside hccw hφ hbia (Or.inl hqib_lt)
          rw [signedArea2_swap23]
          linarith
      · rcases eq_or_lt_of_le hiaq with hqia_eq | hqia_lt
        · exact
            le_of_eq
              (signedArea2_eq_zero_of_endpoint (Or.inl hqia_eq.symm)).symm
        · have hneg_swap :
              signedArea2 (φ q) (φ ib) (φ ia) < 0 :=
            signedArea2_neg_of_outside hccw hφ hbia (Or.inr hqia_lt)
          rw [signedArea2_swap23]
          linarith
    have harc : OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 (φ q) := by
      have h : OnArcOpposite (φ ic) (φ ia) (φ ib) (φ q) := by
        unfold OnArcOpposite
        exact mul_nonpos_of_nonneg_of_nonpos hq_nonneg (le_of_lt hcneg)
      simpa [hic, hia, hib] using h
    exact (S.capByIndex_arc_membership i (φ q) hqA).2 harc

/-- A carrier point outside an indexed closed cap lies strictly on the same
side of that cap's chord as the opposite Moser vertex. -/
theorem signedArea2_mul_pos_of_not_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {x : ℝ²} (hxA : x ∈ A) (hx : x ∉ S.capByIndex i) :
    0 < signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 *
      signedArea2 (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 := by
  rw [S.capByIndex_arc_membership i x hxA] at hx
  unfold OnArcOpposite at hx
  exact not_le.mp hx

/-- Two carrier points outside the same indexed cap cannot lie on the same two
endpoint-centered circles for that cap. -/
theorem twoCircle_sameSide_reflection_false_of_not_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {rq rv : ℝ} {x y : ℝ²}
    (hxA : x ∈ A) (hyA : y ∈ A)
    (hx : x ∉ S.capByIndex i) (hy : y ∉ S.capByIndex i)
    (hne : x ≠ y)
    (hxq : dist x (S.triangleByIndex i).v2 = rq)
    (hyq : dist y (S.triangleByIndex i).v2 = rq)
    (hxv : dist x (S.triangleByIndex i).v3 = rv)
    (hyv : dist y (S.triangleByIndex i).v3 = rv) :
    False := by
  exact Problem97.twoCircle_sameSide_reflection_false
    (q := (S.triangleByIndex i).v2) (v2 := (S.triangleByIndex i).v3)
    (apex := (S.triangleByIndex i).v1) (y := y) (u := x)
    hxq hyq hxv hyv hne
    (S.signedArea2_mul_pos_of_not_mem_capByIndex i hxA hx)
    (S.signedArea2_mul_pos_of_not_mem_capByIndex i hyA hy)

/-- The first support endpoint of an indexed cap lies in that cap. -/
theorem triangleByIndex_v2_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (S.triangleByIndex i).v2 ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v2_mem_C1
  · exact S.partition.v3_mem_C2
  · exact S.partition.v1_mem_C3

/-- The second support endpoint of an indexed cap lies in that cap. -/
theorem triangleByIndex_v3_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (S.triangleByIndex i).v3 ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v3_mem_C1
  · exact S.partition.v1_mem_C2
  · exact S.partition.v2_mem_C3

/-- Every indexed cap of a surplus packet has ordered-cap data whose first and
last points are the two indexed Moser endpoints, in one of the two possible
orientations. -/
theorem capByIndex_cgn4g_capData_oriented
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) :
    ∃ m, ∃ L : Problem97.CGN.OrderedCap m,
      ∃ Packet : Problem97.CGN.MecCapPacket A L,
      ∃ _ : Problem97.CGN.MinorCapSideHypotheses Packet,
      ∃ _ : Problem97.CGN.StrictCapOrder A L,
        Finset.univ.image L.points = S.capByIndex i ∧
          ((L.points (Problem97.CGN.firstIndex Packet.hm) =
                (S.triangleByIndex i).v2 ∧
              L.points (Problem97.CGN.lastIndex Packet.hm) =
                (S.triangleByIndex i).v3) ∨
            (L.points (Problem97.CGN.firstIndex Packet.hm) =
                (S.triangleByIndex i).v3 ∧
              L.points (Problem97.CGN.lastIndex Packet.hm) =
                (S.triangleByIndex i).v2)) := by
  fin_cases i
  · exact Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
  · exact Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
  · exact Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)

/-- Every indexed cap of a surplus packet has the ordered-cap data supplied by
the CGN4g support-cap theorem. This compatibility wrapper forgets the retained
endpoint orientation. -/
theorem capByIndex_cgn4g_capData
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) :
    ∃ m, ∃ L : Problem97.CGN.OrderedCap m,
      ∃ Packet : Problem97.CGN.MecCapPacket A L,
      ∃ _ : Problem97.CGN.MinorCapSideHypotheses Packet,
      ∃ _ : Problem97.CGN.StrictCapOrder A L,
        Finset.univ.image L.points = S.capByIndex i := by
  rcases S.capByIndex_cgn4g_capData_oriented hconv i with
    ⟨m, L, Packet, Hside, Hord, hcap, _⟩
  exact ⟨m, L, Packet, Hside, Hord, hcap⟩

/-- Every indexed cap of a surplus packet has the retained global block data
supplied by the CGN4g support-cap theorem.  This is the packet-level export
needed when later arguments must compare local cap order with the ambient
convex-boundary order. -/
theorem capByIndex_cgn4g_strictCapBlockData
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) :
    Nonempty (Problem97.CGN.StrictCapBlockData A (S.capByIndex i)) := by
  fin_cases i
  · exact Problem97.CGN.CGN4g_strictCapBlockData_of_supportCap
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
  · exact Problem97.CGN.CGN4g_strictCapBlockData_of_supportCap
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
  · exact Problem97.CGN.CGN4g_strictCapBlockData_of_supportCap
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)

/-- One-hit bound for an indexed support cap, viewed from its first support
endpoint. -/
theorem capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.triangleByIndex i).v2 radius ∩ S.capByIndex i).card ≤
      1 := by
  fin_cases i
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 0).v2 radius ∩ S.capByIndex 0)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 1).v2 radius ∩ S.capByIndex 1)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 2).v2 radius ∩ S.capByIndex 2)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2

/-- One-hit bound for an indexed support cap, viewed from its second support
endpoint. -/
theorem capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.triangleByIndex i).v3 radius ∩ S.capByIndex i).card ≤
      1 := by
  fin_cases i
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 0).v3 radius ∩ S.capByIndex 0)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 1).v3 radius ∩ S.capByIndex 1)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 2).v3 radius ∩ S.capByIndex 2)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2

/-- The cyclic cap index immediately to the left of an indexed cap. -/
@[reducible] def leftAdjacentIndex (i : Fin 3) : Fin 3 :=
  match i.1 with
  | 0 => 1
  | 1 => 2
  | _ => 0

/-- The cyclic cap index immediately to the right of an indexed cap. -/
@[reducible] def rightAdjacentIndex (i : Fin 3) : Fin 3 :=
  match i.1 with
  | 0 => 2
  | 1 => 0
  | _ => 1

/-- The strict interior of the left-adjacent cap for a cyclic cap index. -/
@[reducible] noncomputable def leftAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capInteriorByIndex 1
  | 1 => S.capInteriorByIndex 2
  | _ => S.capInteriorByIndex 0

/-- The strict interior of the right-adjacent cap for a cyclic cap index. -/
@[reducible] noncomputable def rightAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capInteriorByIndex 2
  | 1 => S.capInteriorByIndex 0
  | _ => S.capInteriorByIndex 1

/-- The closed left-adjacent cap for a cyclic cap index. -/
@[reducible] def leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capByIndex 1
  | 1 => S.capByIndex 2
  | _ => S.capByIndex 0

/-- The closed right-adjacent cap for a cyclic cap index. -/
@[reducible] def rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capByIndex 2
  | 1 => S.capByIndex 0
  | _ => S.capByIndex 1

theorem leftAdjacentInteriorByIndex_eq_capInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentInteriorByIndex i =
      S.capInteriorByIndex (leftAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem rightAdjacentInteriorByIndex_eq_capInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentInteriorByIndex i =
      S.capInteriorByIndex (rightAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem leftAdjacentCapByIndex_eq_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentCapByIndex i = S.capByIndex (leftAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem rightAdjacentCapByIndex_eq_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentCapByIndex i = S.capByIndex (rightAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem leftAdjacentCapByIndex_rightAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentCapByIndex (rightAdjacentIndex i) = S.capByIndex i := by
  fin_cases i <;> rfl

theorem rightAdjacentCapByIndex_leftAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentCapByIndex (leftAdjacentIndex i) = S.capByIndex i := by
  fin_cases i <;> rfl

/-- The strict left-adjacent interior lies in the closed left-adjacent cap. -/
theorem leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentInteriorByIndex i ⊆ S.leftAdjacentCapByIndex i := by
  intro x hx
  fin_cases i
  · exact S.capInteriorByIndex_subset_capByIndex 1 hx
  · exact S.capInteriorByIndex_subset_capByIndex 2 hx
  · exact S.capInteriorByIndex_subset_capByIndex 0 hx

/-- The strict right-adjacent interior lies in the closed right-adjacent cap. -/
theorem rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentInteriorByIndex i ⊆ S.rightAdjacentCapByIndex i := by
  intro x hx
  fin_cases i
  · exact S.capInteriorByIndex_subset_capByIndex 2 hx
  · exact S.capInteriorByIndex_subset_capByIndex 0 hx
  · exact S.capInteriorByIndex_subset_capByIndex 1 hx

/-- Count Moser vertices in the selected class. -/
noncomputable def moserCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.triangle.verts).card

/-- Count same-cap interior points, excluding the apex, in the selected class. -/
noncomputable def sameCapCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card

/-- Count left-adjacent-cap interior points in the selected class. -/
noncomputable def leftAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card

/-- Count right-adjacent-cap interior points in the selected class. -/
noncomputable def rightAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card

/-- The Moser vertex opposite the cap selected by a cyclic cap index. -/
@[reducible] def oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v1
  | 1 => S.triangle.v2
  | _ => S.triangle.v3

/-- Closed left-adjacent one-hit bound for the Moser vertex opposite an indexed
cap. -/
theorem leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ≤ 1 := by
  fin_cases i
  · simpa [oppositeVertexByIndex, leftAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep hconv 1 radius
  · simpa [oppositeVertexByIndex, leftAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep hconv 2 radius
  · simpa [oppositeVertexByIndex, leftAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep hconv 0 radius

/-- Closed right-adjacent one-hit bound for the Moser vertex opposite an indexed
cap. -/
theorem rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card ≤ 1 := by
  fin_cases i
  · simpa [oppositeVertexByIndex, rightAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep hconv 2 radius
  · simpa [oppositeVertexByIndex, rightAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep hconv 0 radius
  · simpa [oppositeVertexByIndex, rightAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep hconv 1 radius

/-- Left-adjacent count one-hit bound for a Moser-centered selected class at
the vertex opposite an indexed cap. -/
theorem leftAdjCount_at_opposite_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    S.leftAdjCount i (S.oppositeVertexByIndex i) radius ≤ 1 := by
  have hclosed :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hsub :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i := by
    intro y hy
    rw [Finset.mem_inter] at hy ⊢
    exact ⟨hy.1, S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex i hy.2⟩
  exact le_trans (Finset.card_le_card hsub) hclosed

/-- Right-adjacent count one-hit bound for a Moser-centered selected class at
the vertex opposite an indexed cap. -/
theorem rightAdjCount_at_opposite_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    S.rightAdjCount i (S.oppositeVertexByIndex i) radius ≤ 1 := by
  have hclosed :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hsub :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i := by
    intro y hy
    rw [Finset.mem_inter] at hy ⊢
    exact ⟨hy.1, S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex i hy.2⟩
  exact le_trans (Finset.card_le_card hsub) hclosed

/-- The Moser endpoint on the left-adjacent cap that is not the opposite
Moser vertex for the selected cap. -/
@[reducible] def leftOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v3
  | 1 => S.triangle.v1
  | _ => S.triangle.v2

/-- The Moser endpoint on the right-adjacent cap that is not the opposite
Moser vertex for the selected cap. -/
@[reducible] def rightOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v2
  | 1 => S.triangle.v3
  | _ => S.triangle.v1

theorem oppositeVertexByIndex_leftAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex (leftAdjacentIndex i) =
      S.rightOuterVertexByIndex i := by
  fin_cases i <;> rfl

theorem oppositeVertexByIndex_rightAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex (rightAdjacentIndex i) =
      S.leftOuterVertexByIndex i := by
  fin_cases i <;> rfl

theorem rightOuterVertexByIndex_leftAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex (leftAdjacentIndex i) =
      S.leftOuterVertexByIndex i := by
  fin_cases i <;> rfl

theorem leftOuterVertexByIndex_rightAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex (rightAdjacentIndex i) =
      S.rightOuterVertexByIndex i := by
  fin_cases i <;> rfl

/-- At the first non-surplus cap index, the left outer endpoint is the Moser
apex opposite the surplus cap.  This is the `u` label in the pinned COMP-G
orientation. -/
theorem leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftOuterVertexByIndex S.oppIndex1 =
      S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftOuterVertexByIndex, oppositeVertexByIndex, oppIndex1, hi]

/-- At the first non-surplus cap index, the right outer endpoint is the Moser
apex opposite the second non-surplus cap.  This is the `w` label in the pinned
COMP-G orientation. -/
theorem rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightOuterVertexByIndex S.oppIndex1 =
      S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightOuterVertexByIndex, oppositeVertexByIndex, oppIndex1,
      oppIndex2, hi]

/-- At the second non-surplus cap index, the right outer endpoint is the Moser
apex opposite the surplus cap.  This is the `u` label in the mirror pinned
COMP-G orientation. -/
theorem rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightOuterVertexByIndex S.oppIndex2 =
      S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightOuterVertexByIndex, oppositeVertexByIndex, oppIndex2, hi]

/-- At the second non-surplus cap index, the left outer endpoint is the Moser
apex opposite the first non-surplus cap.  This is the `w` label in the mirror
pinned COMP-G orientation. -/
theorem leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftOuterVertexByIndex S.oppIndex2 =
      S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftOuterVertexByIndex, oppositeVertexByIndex, oppIndex1,
      oppIndex2, hi]

/-- In the surplus cap, the `v2` endpoint is the first non-surplus Moser
apex.  This is the endpoint form consumed by the global interval bridges. -/
theorem triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.surplusIdx).v2 =
      S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [triangleByIndex, oppositeVertexByIndex, oppIndex1, hi]

/-- In the surplus cap, the `v3` endpoint is the second non-surplus Moser
apex.  This is the endpoint form consumed by the global interval bridges. -/
theorem triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.surplusIdx).v3 =
      S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [triangleByIndex, oppositeVertexByIndex, oppIndex2, hi]

/-- The first vertex of the indexed triangle is the Moser vertex opposite the
same indexed cap. -/
theorem triangleByIndex_v1_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (S.triangleByIndex i).v1 = S.oppositeVertexByIndex i := by
  rcases i with ⟨idx, hidx⟩
  interval_cases idx <;> simp [triangleByIndex, oppositeVertexByIndex]

/-- In the first non-surplus cap, the `v2` endpoint is the second
non-surplus Moser apex. -/
theorem triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.oppIndex1).v2 =
      S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [triangleByIndex, oppositeVertexByIndex, oppIndex1, oppIndex2, hi]

/-- In the first non-surplus cap, the `v3` endpoint is the surplus Moser
apex. -/
theorem triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.oppIndex1).v3 =
      S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [triangleByIndex, oppositeVertexByIndex, oppIndex1, hi]

/-- In the second non-surplus cap, the `v2` endpoint is the surplus Moser
apex. -/
theorem triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.oppIndex2).v2 =
      S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [triangleByIndex, oppositeVertexByIndex, oppIndex2, hi]

/-- In the second non-surplus cap, the `v3` endpoint is the first
non-surplus Moser apex. -/
theorem triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.oppIndex2).v3 =
      S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [triangleByIndex, oppositeVertexByIndex, oppIndex1, oppIndex2, hi]

/-- The first non-surplus index is the left-adjacent index of the surplus cap. -/
theorem oppIndex1_eq_leftAdjacentIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppIndex1 = leftAdjacentIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex1, leftAdjacentIndex, hi]

/-- The second non-surplus index is the right-adjacent index of the surplus
cap. -/
theorem oppIndex2_eq_rightAdjacentIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppIndex2 = rightAdjacentIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex2, rightAdjacentIndex, hi]

/-- The surplus cap index is distinct from the first non-surplus cap index. -/
theorem surplusIdx_ne_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusIdx ≠ S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex1, hi]

/-- The surplus cap index is distinct from the second non-surplus cap index. -/
theorem surplusIdx_ne_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusIdx ≠ S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex2, hi]

/-- The two non-surplus cap indices are distinct. -/
theorem oppIndex1_ne_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppIndex1 ≠ S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex1, oppIndex2, hi]

/-- Every cap index is either the surplus index or one of the two non-surplus
indices. -/
theorem index_eq_surplusIdx_or_oppIndex1_or_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    i = S.surplusIdx ∨ i = S.oppIndex1 ∨ i = S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> fin_cases i <;>
    simp [oppIndex1, oppIndex2, hi]

/-- The left outer Moser endpoint for an indexed cap lies in the closed
left-adjacent cap. -/
theorem leftOuterVertexByIndex_mem_leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex i ∈ S.leftAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v3_mem_C2
  · exact S.partition.v1_mem_C3
  · exact S.partition.v2_mem_C1

/-- The right outer Moser endpoint for an indexed cap lies in the closed
right-adjacent cap. -/
theorem rightOuterVertexByIndex_mem_rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex i ∈ S.rightAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v2_mem_C3
  · exact S.partition.v3_mem_C1
  · exact S.partition.v1_mem_C2

/-- The opposite Moser endpoint for an indexed cap lies in the closed
left-adjacent cap. -/
theorem oppositeVertexByIndex_mem_leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ S.leftAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v1_mem_C2
  · exact S.partition.v2_mem_C3
  · exact S.partition.v3_mem_C1

/-- The opposite Moser endpoint for an indexed cap lies in the closed
right-adjacent cap. -/
theorem oppositeVertexByIndex_mem_rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ S.rightAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v1_mem_C3
  · exact S.partition.v2_mem_C1
  · exact S.partition.v3_mem_C2

/-- The left outer Moser endpoint for an indexed cap lies in the indexed cap
itself. -/
theorem leftOuterVertexByIndex_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex i ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v3_mem_C1
  · exact S.partition.v1_mem_C2
  · exact S.partition.v2_mem_C3

/-- The right outer Moser endpoint for an indexed cap lies in the indexed cap
itself. -/
theorem rightOuterVertexByIndex_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex i ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v2_mem_C1
  · exact S.partition.v3_mem_C2
  · exact S.partition.v1_mem_C3

/-- Distinct cap indices have distinct opposite Moser endpoints. -/
theorem oppositeVertexByIndex_ne_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ≠ S.oppositeVertexByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [oppositeVertexByIndex] using S.triangle.v12_ne
  · simpa [oppositeVertexByIndex] using S.triangle.v13_ne
  · simpa [oppositeVertexByIndex] using S.triangle.v12_ne.symm
  · exact False.elim (hij rfl)
  · simpa [oppositeVertexByIndex] using S.triangle.v23_ne
  · simpa [oppositeVertexByIndex] using S.triangle.v13_ne.symm
  · simpa [oppositeVertexByIndex] using S.triangle.v23_ne.symm
  · exact False.elim (hij rfl)

/-- A point in an indexed closed cap that is neither support endpoint lies in
the corresponding strict cap interior. -/
theorem mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxcap : x ∈ S.capByIndex i)
    (hxne_right : x ≠ S.rightOuterVertexByIndex i)
    (hxne_left : x ≠ S.leftOuterVertexByIndex i) :
    x ∈ S.capInteriorByIndex i := by
  fin_cases i
  · simp only [capInteriorByIndex]
    exact Finset.mem_erase.mpr
      ⟨hxne_left, Finset.mem_erase.mpr ⟨hxne_right, hxcap⟩⟩
  · simp only [capInteriorByIndex]
    exact Finset.mem_erase.mpr
      ⟨hxne_left, Finset.mem_erase.mpr ⟨hxne_right, hxcap⟩⟩
  · simp only [capInteriorByIndex]
    exact Finset.mem_erase.mpr
      ⟨hxne_left, Finset.mem_erase.mpr ⟨hxne_right, hxcap⟩⟩

theorem mem_triangle_verts_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hx : x ∈ S.triangle.verts) :
    x = S.triangle.v1 ∨ x = S.triangle.v2 ∨ x = S.triangle.v3 := by
  simpa [MoserTriangle.verts] using hx

/-- The indexed opposite Moser endpoint is one of the three Moser vertices. -/
theorem oppositeVertexByIndex_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ S.triangle.verts := by
  fin_cases i <;> simp [oppositeVertexByIndex, MoserTriangle.verts]

/-- A Moser vertex is one of the three opposite vertices indexed by the surplus
and non-surplus cap indices. -/
theorem mem_triangle_verts_oppositeVertexByIndex_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.triangle.verts) :
    x = S.oppositeVertexByIndex S.surplusIdx ∨
      x = S.oppositeVertexByIndex S.oppIndex1 ∨
      x = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    rcases mem_triangle_verts_cases hx with rfl | rfl | rfl <;>
      simp [oppositeVertexByIndex, oppIndex1, oppIndex2, hi]

/-- The indexed left outer Moser endpoint is one of the three Moser vertices. -/
theorem leftOuterVertexByIndex_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex i ∈ S.triangle.verts := by
  fin_cases i <;> simp [leftOuterVertexByIndex, MoserTriangle.verts]

/-- The indexed right outer Moser endpoint is one of the three Moser
vertices. -/
theorem rightOuterVertexByIndex_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex i ∈ S.triangle.verts := by
  fin_cases i <;> simp [rightOuterVertexByIndex, MoserTriangle.verts]

/-- Any two distinct Moser vertices are either the two endpoints of the indexed
cap, or one of them is the Moser vertex opposite that cap. -/
theorem triangle_pair_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {m₁ m₂ : ℝ²}
    (hm₁ : m₁ ∈ S.triangle.verts)
    (hm₂ : m₂ ∈ S.triangle.verts)
    (hne : m₁ ≠ m₂) :
    ((m₁ = S.leftOuterVertexByIndex i ∧
        m₂ = S.rightOuterVertexByIndex i) ∨
      (m₁ = S.rightOuterVertexByIndex i ∧
        m₂ = S.leftOuterVertexByIndex i)) ∨
      (m₁ = S.oppositeVertexByIndex i ∨
        m₂ = S.oppositeVertexByIndex i) := by
  rcases mem_triangle_verts_cases hm₁ with rfl | rfl | rfl <;>
    rcases mem_triangle_verts_cases hm₂ with rfl | rfl | rfl <;>
    fin_cases i <;>
    first
    | exact False.elim (hne rfl)
    | simp only [leftOuterVertexByIndex, rightOuterVertexByIndex,
        oppositeVertexByIndex, true_and, and_true, true_or, or_true]

/-- Every ambient point is either one of the three Moser vertices or belongs
to the strict interior of one indexed cap. -/
theorem mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} (hxA : x ∈ A) :
    x ∈ S.triangle.verts ∨ ∃ i : Fin 3, x ∈ S.capInteriorByIndex i := by
  classical
  by_cases hxMoser : x ∈ S.triangle.verts
  · exact Or.inl hxMoser
  · right
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    by_cases hxC1 : x ∈ S.partition.C1
    · refine ⟨0, ?_⟩
      exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0
        (by simpa [capByIndex] using hxC1)
        (by
          intro h
          exact hxMoser
            (by simpa [h] using S.rightOuterVertexByIndex_mem_triangle_verts 0))
        (by
          intro h
          exact hxMoser
            (by simpa [h] using S.leftOuterVertexByIndex_mem_triangle_verts 0))
    · by_cases hxC2 : x ∈ S.partition.C2
      · refine ⟨1, ?_⟩
        exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1
          (by simpa [capByIndex] using hxC2)
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.rightOuterVertexByIndex_mem_triangle_verts 1))
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.leftOuterVertexByIndex_mem_triangle_verts 1))
      · have hxC3 : x ∈ S.partition.C3 := by
          by_cases hxC3 : x ∈ S.partition.C3
          · exact hxC3
          · simp [hxC1, hxC2, hxC3] at hone
        refine ⟨2, ?_⟩
        exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2
          (by simpa [capByIndex] using hxC3)
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.rightOuterVertexByIndex_mem_triangle_verts 2))
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.leftOuterVertexByIndex_mem_triangle_verts 2))

/-- The three Moser vertices lie in the two caps adjacent to any indexed cap. -/
theorem triangle_verts_subset_adjacentCapsByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.triangle.verts ⊆
      S.leftAdjacentCapByIndex i ∪ S.rightAdjacentCapByIndex i := by
  intro x hx
  fin_cases i
  · rcases mem_triangle_verts_cases hx with rfl | rfl | rfl
    · exact Finset.mem_union.mpr (Or.inl S.partition.v1_mem_C2)
    · exact Finset.mem_union.mpr (Or.inr S.partition.v2_mem_C3)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v3_mem_C2)
  · rcases mem_triangle_verts_cases hx with rfl | rfl | rfl
    · exact Finset.mem_union.mpr (Or.inl S.partition.v1_mem_C3)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v2_mem_C3)
    · exact Finset.mem_union.mpr (Or.inr S.partition.v3_mem_C1)
  · rcases mem_triangle_verts_cases hx with rfl | rfl | rfl
    · exact Finset.mem_union.mpr (Or.inr S.partition.v1_mem_C2)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v2_mem_C1)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v3_mem_C1)


end SurplusCapPacket

end Problem97
