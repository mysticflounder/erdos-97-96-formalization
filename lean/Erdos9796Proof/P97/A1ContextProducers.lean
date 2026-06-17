import Erdos9796Proof.P97.N9EndpointN4e

/-!
# A1 row-layer context producers (H1–H7)

Producers for the seven spine-context facts `H1`–`H7` consumed by
`a1Context_kill` (`A1ContextUniform.lean`); design table in
`docs/n-lane/97-row-layer-nonadmissible-census-2026-06-05.md`.  Each
producer is stated against the committed shell vocabulary
(`FiniteEndpointShell` + `ZeroDefectCapLayout`) with the fixed-shell
equidistance facts as explicit hypotheses, so the (uncommitted) spine
wiring can instantiate them directly from its `A1FixedShellPacket`.

This file currently ships **H1** (the radius-order producer
`dist(a₂,v₁) ≠ dist(a₂,v₂)`, from `rv2 < rv1`): the `v₂`-shell radius is
pinned by the interior witness `a₃ ∈ I₃`, which the cap order on `C₃`
places strictly closer to `v₂` than the far endpoint `v₁`, while the
`v₁`-shell radius equals `|v₁v₂|` itself.  `H2`–`H7` follow in this file
as they land.

The two cap-order lemmas are public copies of the `private` pair in
`N4dFormBPEqBProducer.lean` (`v1_lt_v1v3_of_mem_I2` /
`v2_lt_v2v1_of_mem_I3`); when the W3 gate lifts, that file can drop its
privates and import these.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- Any `I₂` vertex lies strictly before the far endpoint `v₃` in the
`v₁`-radial order on support cap `C₂` (public copy of the `pEqB` producer's
private lemma). -/
theorem v1_dist_lt_v1v3_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hpL : p ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hpC2
  rcases Finset.mem_image.mp hpL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v3
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hp_ne_v3
        calc
          p = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt

/-- Any `I₃` vertex is strictly closer to `v₂` than the opposite endpoint
`v₁` (public copy of the `pEqB` producer's private lemma).  This is the
lower-cap order fact producing `|v₂v₃| < |v₁v₂|`. -/
theorem v2_dist_lt_v2v1_of_mem_I3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
  classical
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_zero : i.val ≠ 0 := by
        intro hi_zero
        have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
          ext
          simpa [Problem97.CGN.firstIndex] using hi_zero
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
          _ = S.triangle.v1 := hFirstLast.1
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first :
        (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v1 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt

/-- **H1 producer**: `dist(a₂,v₁) ≠ dist(a₂,v₂)`.

In the A1 fixed-shell context the `v₁`-shell radius `r1` equals `|v₁v₂|`
(`v₂` sits in the `v₁` class) while the `v₂`-shell radius `r2` is the
distance to the interior witness `a₃ ∈ I₃`, which the cap order on `C₃`
places strictly closer to `v₂` than `v₁`.  Hence `r2 < r1` and the two
`a₂`-distances differ. -/
theorem a1_context_h1_producer
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r1 r2 : ℝ}
    (hv1v2 : dist S.triangle.v1 S.triangle.v2 = r1)
    (ha2v1 : dist S.triangle.v1 Z.a2 = r1)
    (ha2v2 : dist S.triangle.v2 Z.a2 = r2)
    (ha3v2 : dist S.triangle.v2 Z.a3 = r2) :
    dist Z.a2 S.triangle.v1 ≠ dist Z.a2 S.triangle.v2 := by
  have ha3I3 : Z.a3 ∈ S.I3 := by
    rw [Z.hI3]
    simp
  have horder : dist S.triangle.v2 Z.a3 < dist S.triangle.v2 S.triangle.v1 :=
    S.v2_dist_lt_v2v1_of_mem_I3 ha3I3
  intro heq
  rw [dist_comm Z.a2 S.triangle.v1, ha2v1,
    dist_comm Z.a2 S.triangle.v2, ha2v2] at heq
  rw [ha3v2, dist_comm S.triangle.v2 S.triangle.v1, hv1v2, heq] at horder
  exact lt_irrefl _ horder

end FiniteEndpointShell

end Problem97
