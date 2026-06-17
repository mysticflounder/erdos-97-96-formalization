import Erdos9796Proof.P97.N9EndpointN4e

/-!
# `N4d` Form-`b`, `p' = B` producer

This file exposes the theorem-facing producer for the escaped-form `N4d`
Form-`b`, `x = a₂`, lower-side `p' = B` column. It mirrors the local packet
shape used in `N9EndpointN4e.lean`, extracts the equilateral-apex data from the
selector packets, and closes the row through the existing shell-level consumer
`pEqB_row_impossible_of_equilateral`.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- The `p' = B` row inside the forced `v₃` selector. The selector contains the
whole lower witness pair `I₃`, meets `C₁` in the named point `v₂`, and meets
`C₂` in one of the two upper witnesses. -/
abbrev SelectorV3PeqBPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  FiniteEndpointShell.SelectorV3Pv2Packet S Z r

/-- Any `I₂` vertex lies strictly before the far endpoint `v₃` in the
`v₁`-radial order on support cap `C₂`. This is the local re-export needed to
derive `|v₁v₂| < |v₁v₃|` in the separate producer module. -/
private theorem v1_lt_v1v3_of_mem_I2
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
`v₁`. This is the lower-cap order fact used to produce `|v₂v₃| < |v₁v₂|`. -/
private theorem v2_lt_v2v1_of_mem_I3
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

/-- The `p' = B` lower-side producer: extract the lower witness and the two
equilateral radii from the selector packets, derive the shell-order inequalities
`|v₂v₃| < |v₁v₂| < |v₁v₃|`, and hand the packet to the existing standalone
equilateral-apex closer. -/
theorem pEqB_column_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3PeqBPacket S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, ha2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  rcases hpacket3 with ⟨hI3sub, hpBeq, hqeqC2⟩
  let T := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hv2T3 : S.triangle.v2 ∈ S.witnessClassAt_v3 t := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hpBeq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hqT3 : q ∈ S.witnessClassAt_v3 t := hI3sub hqI3
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hqrad2 : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hv2rad3 : dist S.triangle.v3 S.triangle.v2 = t := by
    simpa using (Finset.mem_filter.mp hv2T3).2
  have hqrad3 : dist S.triangle.v3 q = t := by
    simpa using (Finset.mem_filter.mp hqT3).2
  have hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3 := by
    rw [hqrad2, hv3rad]
  have hDq : dist S.triangle.v3 q = dist S.triangle.v2 S.triangle.v3 := by
    rw [hqrad3, ← hv2rad3, dist_comm]
  have hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    have hq_lt_base : dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 :=
      S.v2_lt_v2v1_of_mem_I3 hqI3
    calc
      dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 q := by rw [hBq]
      _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
      _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← ha2eq] at ha2mem
      exact (Finset.mem_inter.mp ha2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.a2 := by
      have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
        simpa using (Finset.mem_filter.mp hv2T1).2
      have ha2dist : dist S.triangle.v1 Z.a2 = r := by
        simpa using (Finset.mem_filter.mp ha2T1).2
      rw [hv2dist, ha2dist]
    have h := S.v1_lt_v1v3_of_mem_I2 (p := Z.a2) hA2
    rwa [← hbase_eq] at h
  exact S.pEqB_row_impossible_of_equilateral hqI3 hBq hDq hsmall hlong

end FiniteEndpointShell

end Problem97
