/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting
import Mathlib.Order.Fin.Basic

/-!
# Three equidistant points in a strict Moser cap

This module isolates the cardinality-independent ordered-cap obstruction used
by several downstream closing arguments.  A center in a strict cap cannot be
equidistant from three distinct points of that cap: each pair would have to
straddle the center in the strict linear cap order.
-/

namespace Problem97
namespace ATailCapInteriorEquidistant

open scoped EuclideanGeometry

/-- A point in a strictly ordered minor cap cannot be equidistant from three
distinct points of the same cap. -/
theorem false_of_orderedCap_center_equidistant_three_points
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {id ic ia ib : Fin m}
    (hic_ia : ic ≠ ia) (hic_ib : ic ≠ ib) (hia_ib : ia ≠ ib)
    (hid_ic : id ≠ ic) (hid_ia : id ≠ ia) (hid_ib : id ≠ ib)
    (hca : dist (L.points id) (L.points ic) =
      dist (L.points id) (L.points ia))
    (hcb : dist (L.points id) (L.points ic) =
      dist (L.points id) (L.points ib)) :
    False := by
  have between_of_equidistant :
      ∀ {j r s : Fin m}, r ≠ s → j ≠ r → j ≠ s →
        dist (L.points j) (L.points r) =
          dist (L.points j) (L.points s) →
        (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    intro j r s hrs hjr hjs heq
    rcases lt_or_gt_of_ne hrs with hrslt | hsrlt
    · exact Or.inl
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hrslt hjr hjs heq)
    · exact Or.inr
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hsrlt hjs hjr heq.symm)
  have hcaBetween := between_of_equidistant hic_ia hid_ic hid_ia hca
  have hcbBetween := between_of_equidistant hic_ib hid_ic hid_ib hcb
  have habBetween := between_of_equidistant hia_ib hid_ia hid_ib
    (hca.symm.trans hcb)
  rcases hcaBetween with hcaBetween | hcaBetween <;>
    rcases hcbBetween with hcbBetween | hcbBetween <;>
    rcases habBetween with habBetween | habBetween <;> omega

/-- Four points in one strict cap cannot consist of a center and three
distinct points equidistant from that center. -/
theorem false_of_capInterior_center_equidistant_three_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {i : Fin 3}
    {d c a b : ℝ²}
    (hd : d ∈ S.capInteriorByIndex i)
    (hc : c ∈ S.capInteriorByIndex i)
    (ha : a ∈ S.capInteriorByIndex i)
    (hb : b ∈ S.capInteriorByIndex i)
    (hca : c ≠ a) (hcb : c ≠ b) (hab : a ≠ b)
    (hdc : d ≠ c) (hda : d ≠ a) (hdb : d ≠ b)
    (hdca : dist d c = dist d a)
    (hdcb : dist d c = dist d b) :
    False := by
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have point_mem_image {z : ℝ²}
      (hz : z ∈ S.capInteriorByIndex i) :
      z ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex i hz
  rcases Finset.mem_image.mp (point_mem_image hd) with ⟨id, _hidMem, hid⟩
  rcases Finset.mem_image.mp (point_mem_image hc) with ⟨ic, _hicMem, hic⟩
  rcases Finset.mem_image.mp (point_mem_image ha) with ⟨ia, _hiaMem, hia⟩
  rcases Finset.mem_image.mp (point_mem_image hb) with ⟨ib, _hibMem, hib⟩
  have hic_ia : ic ≠ ia := by
    intro h
    apply hca
    rw [← hic, ← hia, h]
  have hic_ib : ic ≠ ib := by
    intro h
    apply hcb
    rw [← hic, ← hib, h]
  have hia_ib : ia ≠ ib := by
    intro h
    apply hab
    rw [← hia, ← hib, h]
  have hid_ic : id ≠ ic := by
    intro h
    apply hdc
    rw [← hid, ← hic, h]
  have hid_ia : id ≠ ia := by
    intro h
    apply hda
    rw [← hid, ← hia, h]
  have hid_ib : id ≠ ib := by
    intro h
    apply hdb
    rw [← hid, ← hib, h]
  exact false_of_orderedCap_center_equidistant_three_points
    Packet Hside Hord hic_ia hic_ib hia_ib hid_ic hid_ia hid_ib
    (by simpa only [hid, hic, hia] using hdca)
    (by simpa only [hid, hic, hib] using hdcb)

end ATailCapInteriorEquidistant
end Problem97
