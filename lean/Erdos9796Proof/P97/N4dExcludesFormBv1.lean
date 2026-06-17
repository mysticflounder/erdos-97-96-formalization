import Erdos9796Proof.P97.N9EndpointN4e
import Erdos9796Proof.P97.N4dFormBLowerForcesV3
import Erdos9796Proof.P97.N4dFormBPEqBProducer
import Erdos9796Proof.P97.N4dFormBXb2UpperArc
import Erdos9796Proof.P97.Bridge.A1SpineWiring
import Erdos9796Proof.P97.N4dQeqEb2PinClash

/-!
# `N4d` Form-`b` exclusion at `v₁`

This module assembles the escaped Form-`b` case tree at `v₁` and exports the
theorem-facing exclusion `N4dExcludesFormB_v1_proof`.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97
namespace FiniteEndpointShell

/-- The exact `(4,4,4)` shell admits a zero-defect cap layout. -/
theorem exists_capLayout
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Nonempty (ZeroDefectCapLayout S) :=
  ⟨S.zeroDefectCapLayout⟩

end FiniteEndpointShell

/-- Any `I₂` vertex lies strictly before the far endpoint `v₃` in the `v₁`-radial
order on support cap `C₂`. This local re-export keeps the `x = b₂` branch
self-contained in this file. -/
private theorem v1_lt_v1v3_of_mem_I2_local
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

/-- Any `I₃` vertex is strictly closer to `v₂` than the opposite endpoint `v₁`.
This local re-export keeps the `x = b₂` branch self-contained in this file. -/
private theorem v1_lt_v1v2_of_mem_I3_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · -- `firstIndex ↦ v₁`, `lastIndex ↦ v₂`: bound from `v₁` as the left endpoint.
    have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      have hi_le_pred : i.val ≤ m - 1 := Nat.le_pred_of_lt hi_lt_top
      exact lt_of_le_of_ne hi_le_pred hi_ne_top
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  · -- `firstIndex ↦ v₂`, `lastIndex ↦ v₁`: bound from `v₁` as the right endpoint.
    have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v2 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      have h1 : 1 < i.val + 1 := Nat.succ_lt_succ hi_pos
      have hm1 : 1 < m := lt_of_lt_of_le h1 (Nat.succ_le_of_lt hi_lt_top)
      simpa [Fin.val_rev] using (Nat.sub_lt_sub_left hm1 h1)
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
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt

private theorem v2_lt_v2v1_of_mem_I3_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
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
      have hi_pos : 0 < i.val := Nat.pos_of_ne_zero hi_ne_zero
      have hfirst_lt_i : Problem97.CGN.firstIndex Packet.hm < i := by
        rw [Fin.lt_def]
        simpa [Problem97.CGN.firstIndex] using hi_pos
      have hlast_rev_first' :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      rw [Fin.rev_lt_iff]
      simpa [hlast_rev_first'] using hfirst_lt_i
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

/-- Local `I₂` relabeling used to reuse the `x = a₂` lower-branch forcing
lemma in the `x = b₂` branch. -/
private def FiniteEndpointShell.ZeroDefectCapLayout.swapI2
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.a1
  b1 := Z.b1
  a2 := Z.b2
  b2 := Z.a2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := Z.hI1
  hI2 := by
    ext x
    constructor <;> intro hx <;> simpa [Z.hI2, or_comm] using hx
  hI3 := Z.hI3

/-- `N4d-bB-4`: in the `x = b₂`, `p = D` lower-side branch, the `q' = E`
column of the `v₃` selector is impossible.  This is the `E = b₂` analogue of
`qEqC_reflection_below_contradiction`: the Form-`b` pin gives the unit-apex
equality at `b₂`, the lower-side selector pins the `v₂` circle, and the
`q'=E` row closes by the existing reflection contradiction. -/
theorem FiniteEndpointShell.n4d_bB_4_q_eq_E_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hB2 : (Z.b2 : ℝ²) ∈ S.I2)
    (hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s)
    (hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
    (hC3eq :
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
    (hC2eq3 : S.witnessClassAt_v3 t ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 t) :
    False := by
  classical
  rcases hB with ⟨_, _, _, hv2eq⟩
  let T : Finset ℝ² := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hqset : (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
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
    rcases hqset with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
    have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
    rw [← hb2eq] at hb2mem
    exact (Finset.mem_inter.mp hb2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hv2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hAE : dist S.triangle.v1 Z.b2 = dist S.triangle.v1 S.triangle.v2 := by
    have hb2r : dist S.triangle.v1 Z.b2 = r := by
      simpa using (Finset.mem_filter.mp hb2T1).2
    have hv2r : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    rw [hb2r, hv2r]
  have hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.b2 := by
    have hb2T2 : Z.b2 ∈ T := hI2sub hB2
    have hv3r : dist S.triangle.v2 S.triangle.v3 = s := by
      simpa [T] using (Finset.mem_filter.mp hv3T).2
    have hb2r : dist S.triangle.v2 Z.b2 = s := by
      simpa [T] using (Finset.mem_filter.mp hb2T2).2
    rw [hv3r, hb2r]
  have hBq : dist S.triangle.v2 q = dist S.triangle.v2 Z.b2 := by
    have hqT2' : q ∈ T := hqT2
    have hqr : dist S.triangle.v2 q = s := by
      simpa [T] using (Finset.mem_filter.mp hqT2').2
    have hb2r : dist S.triangle.v2 Z.b2 = s := by
      have hb2T2 : Z.b2 ∈ T := hI2sub hB2
      simpa [T] using (Finset.mem_filter.mp hb2T2).2
    rw [hqr, hb2r]
  have hDq : dist S.triangle.v3 q = dist S.triangle.v3 Z.b2 := by
    have hqT3 : q ∈ S.witnessClassAt_v3 t := hI3sub hqI3
    have hqr : dist S.triangle.v3 q = t := by
      simpa using (Finset.mem_filter.mp hqT3).2
    have hb2T3 : Z.b2 ∈ S.witnessClassAt_v3 t := by
      have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hC2eq3] at hb2mem
      exact (Finset.mem_inter.mp hb2mem).1
    have hb2r : dist S.triangle.v3 Z.b2 = t := by
      simpa using (Finset.mem_filter.mp hb2T3).2
    rw [hqr, hb2r]
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    simpa [hAE] using (v1_lt_v1v3_of_mem_I2_local S hB2)
  have hEside :
      0 < signedArea2 Z.b2 S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
    S.c2_vertex_same_open_side_as_v3 hB2
  have hqE : q ≠ Z.b2 := by
    intro hqb2
    have hlt := v1_lt_v1v2_of_mem_I3_local S hqI3
    rw [hqb2, hAE] at hlt
    exact lt_irrefl _ hlt
  exact S.qEqE_row_impossible_of_reflection hqI3 hAE hBD hBq hDq hlong hEside hqE

/-- `N4d-bB-5`: in the `x = b₂`, `p = D` lower-side branch, the `q' = C`
column of the `v₃` selector is impossible.  This is the lower-arc
distance-order route with the upper point `C = a₂`; the proof cases on the
`a₂`-pin comparison and dispatches to the existing or flipped lower-arc
keystone accordingly. -/
theorem FiniteEndpointShell.n4d_bB_5_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hB2 : (Z.b2 : ℝ²) ∈ S.I2)
    (hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s)
    (hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
    (hC3eq :
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  classical
  rcases hB with ⟨_, _, _, hv2eq⟩
  have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
    have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
    rw [← hb2eq] at hb2mem
    exact (Finset.mem_inter.mp hb2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hv2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hAEb2 : dist S.triangle.v1 Z.b2 = dist S.triangle.v1 S.triangle.v2 := by
    have hb2r : dist S.triangle.v1 Z.b2 = r := by
      simpa using (Finset.mem_filter.mp hb2T1).2
    have hv2r : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    rw [hb2r, hv2r]
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    simpa [hAEb2] using (v1_lt_v1v3_of_mem_I2_local S hB2)
  have hA2I2 : Z.a2 ∈ S.I2 := by
    rw [Z.hI2]
    simp
  have hA2C2 : Z.a2 ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2I2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2I2).2).2
  have hA2T2 : Z.a2 ∈ S.witnessClassAt_v2 s := hI2sub hA2I2
  have hEside :
      0 < signedArea2 Z.a2 S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
    S.c2_vertex_same_open_side_as_v3 hA2I2
  rcases hpacket with ⟨hI3sub, hpacket⟩
  rcases hpacket with ⟨p, hpnamed, hpC1, hpC2⟩
  have hA2T3 : Z.a2 ∈ S.witnessClassAt_v3 t := by
    have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← hpC2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    rcases hC3eq with hqa3 | hqb3
    · have hqI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.a3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
        rw [← hqa3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hq_lt_base : dist S.triangle.v2 Z.a3 < dist S.triangle.v2 S.triangle.v1 :=
        v2_lt_v2v1_of_mem_I3_local S hqI3
      have hqrad : dist S.triangle.v2 Z.a3 = s := by
        simpa using (Finset.mem_filter.mp hqT2).2
      have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
        simpa using (Finset.mem_filter.mp hv3T2).2
      calc
        dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.a3 := by
          rw [hv3rad, hqrad]
        _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
        _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
    · have hqI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.b3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
        rw [← hqb3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hq_lt_base : dist S.triangle.v2 Z.b3 < dist S.triangle.v2 S.triangle.v1 :=
        v2_lt_v2v1_of_mem_I3_local S hqI3
      have hqrad : dist S.triangle.v2 Z.b3 = s := by
        simpa using (Finset.mem_filter.mp hqT2).2
      have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
        simpa using (Finset.mem_filter.mp hv3T2).2
      calc
        dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.b3 := by
          rw [hv3rad, hqrad]
        _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
        _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
  have hA2ne_base : dist S.triangle.v1 Z.a2 ≠ dist S.triangle.v1 S.triangle.v2 := by
    intro hEq
    have hA2neqb2 : Z.a2 ≠ Z.b2 := by
      intro hEq2
      have hcard : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by
        simpa [Z.hI2] using S.I2_card_eq_two
      rw [hEq2] at hcard
      simp at hcard
    have hA2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have hA2r : dist S.triangle.v1 Z.a2 = r := by
        rw [hEq, (Finset.mem_filter.mp hv2T1).2]
      change Z.a2 ∈ A.filter (fun x => dist S.triangle.v1 x = r)
      exact Finset.mem_filter.mpr ⟨S.CP.C2_subset hA2C2, hA2r⟩
    have hA2inter : Z.a2 ∈ S.witnessClassAt_v1 r ∩ S.CP.C2 := by
      exact Finset.mem_inter.mpr ⟨hA2T1, hA2C2⟩
    rw [hb2eq] at hA2inter
    have hEq2 : Z.a2 = Z.b2 := by
      simpa using hA2inter
    exact hA2neqb2 hEq2
  have hA3neqb3 : Z.a3 ≠ Z.b3 := by
    intro hEq
    have hcard : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by
      simpa [Z.hI3] using S.I3_card_eq_two
    rw [hEq] at hcard
    simp at hcard
  rcases lt_or_gt_of_ne hA2ne_base with hAElt | hAEgt
  · rcases hC3eq with hqa3 | hqb3
    · have hqI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.a3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
        rw [← hqa3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.a3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.a3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.b3 = dist S.triangle.v3 Z.a3 := by
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.a3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.a3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.a3 ≠ Z.b3 := hA3neqb3
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible (q := Z.a3) (qs := Z.b3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAElt hEside hqE hcap_opp
    · have hqI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.b3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
        rw [← hqb3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.b3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.b3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.a3 = dist S.triangle.v3 Z.b3 := by
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.b3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.b3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.b3 ≠ Z.a3 := hA3neqb3.symm
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible (q := Z.b3) (qs := Z.a3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAElt hEside hqE hcap_opp
  · rcases hC3eq with hqa3 | hqb3
    · have hqI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.a3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
        rw [← hqa3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.a3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.a3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.b3 = dist S.triangle.v3 Z.a3 := by
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.a3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.a3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.a3 ≠ Z.b3 := hA3neqb3
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible_flipped (q := Z.a3) (qs := Z.b3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAEgt hA2C2 hEside hqE hcap_opp
    · have hqI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.b3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
        rw [← hqb3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.b3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.b3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.a3 = dist S.triangle.v3 Z.b3 := by
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.b3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.b3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.b3 ≠ Z.a3 := hA3neqb3.symm
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible_flipped (q := Z.b3) (qs := Z.a3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAEgt hA2C2 hEside hqE hcap_opp

/-- Workstream W3 export: the escaped Form `b` at `v₁` is impossible. -/
theorem FiniteEndpointShell.N4dExcludesFormB_v1_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormB_v1 := by
  classical
  intro r hr hcard hesc hB
  obtain ⟨Z⟩ := S.exists_capLayout
  rcases S.formB_v1_split Z hB with ⟨ha2, hxa2⟩ | ⟨hb2, hxb2⟩
  · rcases S.selectorShape_v2_split Z with ⟨s, hs, hsplit2⟩
    rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
    rcases hcases2 with hqv1 | hlower
    · have hB2 : Xb2Pin S (Z.swapI2) r := by
        refine ⟨?_, ?_⟩
        · simpa [FiniteEndpointShell.ZeroDefectCapLayout.swapI2] using ha2
        · simpa [FiniteEndpointShell.ZeroDefectCapLayout.swapI2] using hxa2
      have hAinSB : AInSBPin S (Z.swapI2) s := by
        refine ⟨hs, hTcard2, hI2sub, ?_⟩
        simpa [SelectorV2Qv1Packet, FiniteEndpointShell.ZeroDefectCapLayout.swapI2] using hqv1
      exact S.n4d_bB1_impossible (Z := Z.swapI2) hB hcard hB2 hAinSB
    · rcases hlower with ha3 | hb3
      · rcases ha3 with ⟨p2, hp2, hp2C1, ha3C3⟩
        -- F2 fix: the named C₁ witness is forced to v₃ by the lower-branch
        -- unit-circle exclusion before the packet is manufactured.
        have hp2v3 : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 Z hr hs hcard hB ha2 hxa2 hI2sub hp2 hp2C1
        have hlowerPacket : FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket S Z r s := by
          exact ⟨ha2, hxa2, hTcard2, hI2sub, hp2v3, Or.inl ha3C3⟩
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨_, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bA_2_q_eq_v1_impossible Z hB hlowerPacket hqv1
        · rcases hrest with hqa2 | hqb2
          · exact S.n4d_bA_2_q_eq_C_impossible Z hB hlowerPacket ⟨hI3sub, hqa2⟩
          · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpa1 | hp3
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpa1] using hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpb1 | hpv2
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpb1] using hp3, hp3C1, hb2C2⟩
            · have hpv2' : p3 = S.triangle.v2 := by simpa using hpv2
              rw [hpv2'] at hp3C1
              exact S.pEqB_column_impossible Z hB hlowerPacket
                (by
                  simpa [FiniteEndpointShell.SelectorV3PeqBPacket] using
                    (show FiniteEndpointShell.SelectorV3Pv2Packet S Z t from
                      ⟨hI3sub, hp3C1, Or.inr hb2C2⟩))
      · rcases hb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
        -- F2 fix: same forcing as the a₃ branch.
        have hp2v3 : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 Z hr hs hcard hB ha2 hxa2 hI2sub hp2 hp2C1
        have hlowerPacket : FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket S Z r s := by
          exact ⟨ha2, hxa2, hTcard2, hI2sub, hp2v3, Or.inr hb3C3⟩
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨_, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bA_2_q_eq_v1_impossible Z hB hlowerPacket hqv1
        · rcases hrest with hqa2 | hqb2
          · exact S.n4d_bA_2_q_eq_C_impossible Z hB hlowerPacket ⟨hI3sub, hqa2⟩
          · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpa1 | hp3
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpa1] using hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpb1 | hpv2
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpb1] using hp3, hp3C1, hb2C2⟩
            · have hpv2' : p3 = S.triangle.v2 := by simpa using hpv2
              rw [hpv2'] at hp3C1
              exact S.pEqB_column_impossible Z hB hlowerPacket
                (by
                  simpa [FiniteEndpointShell.SelectorV3PeqBPacket] using
                    (show FiniteEndpointShell.SelectorV3Pv2Packet S Z t from
                      ⟨hI3sub, hp3C1, Or.inr hb2C2⟩))
  · rcases S.selectorShape_v2_split Z with ⟨s, hs, hsplit2⟩
    rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
    rcases hcases2 with hqv1 | hlower
    · exact S.n4d_bB1_impossible Z hB hcard ⟨hb2, hxb2⟩ ⟨hs, hTcard2, hI2sub, hqv1⟩
    · rcases hlower with hqa3 | hqb3
      · rcases hqa3 with ⟨p2, hp2, hp2C1, ha3C3⟩
        have hB2 : (Z.b2 : ℝ²) ∈ S.I2 := hb2
        have hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) := hxb2
        have hTcard3 : (S.witnessClassAt_v2 s).card = 4 := hTcard2
        have hI2sub3 : S.I2 ⊆ S.witnessClassAt_v2 s := hI2sub
        have hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 (Z := Z.swapI2) hr hs hcard hB hb2 hxb2 hI2sub hp2 hp2C1
        have hC3eq :
            (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
              (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)) :=
          Or.inl ha3C3
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨hTcard4, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bB_2_q_eq_v1_impossible Z hB
            ⟨hB2, hb2eq, hTcard3, hI2sub3, hC1eq, hC3eq⟩
            hqv1
        · rcases hrest with hqa2 | hqb2
          · have hpacket : SelectorV3Qa2Packet S Z t := by
              dsimp [SelectorV3Qa2Packet]
              exact ⟨hI3sub, hqa2⟩
            exact S.n4d_bB_5_q_eq_C_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hpacket
          · rcases hqb2 with ⟨p, hp, hpeq, hqeqC2⟩
            exact S.n4d_bB_4_q_eq_E_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hqeqC2 hI3sub
      · rcases hqb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
        have hB2 : (Z.b2 : ℝ²) ∈ S.I2 := hb2
        have hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) := hxb2
        have hTcard3 : (S.witnessClassAt_v2 s).card = 4 := hTcard2
        have hI2sub3 : S.I2 ⊆ S.witnessClassAt_v2 s := hI2sub
        have hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 (Z := Z.swapI2) hr hs hcard hB hb2 hxb2 hI2sub hp2 hp2C1
        have hC3eq :
            (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
              (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)) :=
          Or.inr hb3C3
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨hTcard4, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bB_2_q_eq_v1_impossible Z hB
            ⟨hB2, hb2eq, hTcard3, hI2sub3, hC1eq, hC3eq⟩
            hqv1
        · rcases hrest with hqa2 | hqb2
          · have hpacket : SelectorV3Qa2Packet S Z t := by
              dsimp [SelectorV3Qa2Packet]
              exact ⟨hI3sub, hqa2⟩
            exact S.n4d_bB_5_q_eq_C_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hpacket
          · rcases hqb2 with ⟨p, hp, hpeq, hqeqC2⟩
            exact S.n4d_bB_4_q_eq_E_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hqeqC2 hI3sub

end Problem97
