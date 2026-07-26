/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Two-center localization in an indexed Moser cap

If a carrier point and the vertex opposite an indexed cap both bisect the
same distinct pair in the strict interior of that cap, ordered-cap uniqueness
forces the carrier point into the same strict cap interior.

This is the source-independent localization used by the adaptive A-TAIL
large-radius consumers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The vertex opposite one indexed cap belongs to every other indexed cap. -/
private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

/-- Two distinct centers in one indexed ordered cap cannot both bisect the
same distinct carrier pair outside that cap. -/
private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c apex a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ apex)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist apex a = dist apex b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = apex := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

/-- Every Moser vertex is the indexed opposite vertex or one of the two
endpoints of the indexed cap. -/
private theorem mem_triangle_verts_eq_opposite_or_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hx : x ∈ S.triangle.verts) :
    x = S.oppositeVertexByIndex i ∨
      x = S.leftOuterVertexByIndex i ∨
      x = S.rightOuterVertexByIndex i := by
  rcases SurplusCapPacket.mem_triangle_verts_cases hx with hx | hx | hx
  all_goals
    fin_cases i <;>
      simp_all [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftOuterVertexByIndex,
        SurplusCapPacket.rightOuterVertexByIndex]

/-- If a carrier center and an indexed opposite apex bisect two distinct
points of that apex's strict opposite-cap interior, then the carrier center
lies in the same strict cap interior. -/
theorem commonPhysicalPair_center_mem_capInteriorByIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} (i : Fin 3)
    {center source partner : ℝ²}
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppositeVertexByIndex i)
    (hsource : source ∈ S.capInteriorByIndex i)
    (hpartner : partner ∈ S.capInteriorByIndex i)
    (hsourcePartner : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hphysicalEq :
      dist (S.oppositeVertexByIndex i) source =
        dist (S.oppositeVertexByIndex i) partner) :
    center ∈ S.capInteriorByIndex i := by
  classical
  have hsourceClass :
      source ∈ SelectedClass D.A (S.oppositeVertexByIndex i)
        (dist (S.oppositeVertexByIndex i) source) := by
    exact mem_selectedClass.mpr
      ⟨S.capInteriorByIndex_subset i hsource, rfl⟩
  have hpartnerClass :
      partner ∈ SelectedClass D.A (S.oppositeVertexByIndex i)
        (dist (S.oppositeVertexByIndex i) source) := by
    exact mem_selectedClass.mpr
      ⟨S.capInteriorByIndex_subset i hpartner, hphysicalEq.symm⟩
  have hcenter_ne_left :
      center ≠ S.leftOuterVertexByIndex i := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      i hsource hpartner hsourcePartner hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_ne_right :
      center ≠ S.rightOuterVertexByIndex i := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      i hsource hpartner hsourcePartner hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_not_triangle : center ∉ S.triangle.verts := by
    intro hcenterTriangle
    rcases mem_triangle_verts_eq_opposite_or_outer
      S i hcenterTriangle with hcenter | hcenter | hcenter
    · exact hcenterNe hcenter
    · exact hcenter_ne_left hcenter
    · exact hcenter_ne_right hcenter
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    hcenterTriangle | ⟨j, hcenterInterior⟩
  · exact False.elim (hcenter_not_triangle hcenterTriangle)
  · have hj : j = i := by
      by_contra hji
      have hij : i ≠ j := Ne.symm hji
      have hcenterCap : center ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hcenterInterior
      have hapexCap :
          S.oppositeVertexByIndex i ∈ S.capByIndex j :=
        oppositeVertexByIndex_mem_capByIndex_of_ne S hij
      have hsourceOff : source ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hsource hij
      have hpartnerOff : partner ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hpartner hij
      exact false_of_two_cap_centers_equidistant_outside_pair S j
        hcenterCap hapexCap hcenterNe
        (S.capInteriorByIndex_subset i hsource)
        (S.capInteriorByIndex_subset i hpartner)
        hsourcePartner hsourceOff hpartnerOff hcenterEq hphysicalEq
    simpa [hj] using hcenterInterior

/-- If a fresh carrier center and the physical second apex bisect two
distinct points of the strict opposite-cap interior, then the fresh center
lies in that same strict cap interior. -/
theorem commonPhysicalPair_center_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center source partner : ℝ²}
    (hcenterA : center ∈ D.A)
    (hcenterNe : center ≠ S.oppApex2)
    (hsource : source ∈ S.capInteriorByIndex S.oppIndex2)
    (hpartner : partner ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourcePartner : source ≠ partner)
    (hcenterEq : dist center source = dist center partner)
    (hphysicalEq :
      dist S.oppApex2 source = dist S.oppApex2 partner) :
    center ∈ S.capInteriorByIndex S.oppIndex2 := by
  have happ := oppApex2_eq_oppositeVertex_oppIndex2 S
  have hcenterNe' :
      center ≠ S.oppositeVertexByIndex S.oppIndex2 := by
    simpa [← happ] using hcenterNe
  exact commonPhysicalPair_center_mem_capInteriorByIndex S.oppIndex2
    hcenterA hcenterNe' hsource hpartner hsourcePartner hcenterEq
    (by simpa [← happ] using hphysicalEq)

end ATailTwoCenterCapLocalization
end Problem97
