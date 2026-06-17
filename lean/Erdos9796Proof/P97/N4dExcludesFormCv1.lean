import Erdos9796Proof.P97.N4dFormCPEqCProducer
import Erdos9796Proof.P97.N4dFormCLowerForcesV2
import Erdos9796Proof.P97.N4dFormBXb2UpperArc
import Erdos9796Proof.P97.N4dFormCcB1UpperArc
import Erdos9796Proof.P97.N4dFormCcA3QeqC
import Erdos9796Proof.P97.N4dFormCQeqEb3PinClash

/-!
# `N4d` Form-`c` exclusion at `v₁`

This module mirrors the completed Form-`b` exclusion at `v₁` under the
side-chain swap `C₂ ↔ C₃`, `v₂ ↔ v₃`, `I₂ ↔ I₃`, `a₂ ↔ a₃`, `b₂ ↔ b₃`.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97
namespace FiniteEndpointShell

/-- Full `q = v₁` packet for the forced `v₃` selector. -/
def SelectorV3Qv1FullPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (s : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 s
  T.card = 4 ∧
    S.I3 ⊆ T ∧
      ∃ p : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
            T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)

/-- The `q = a₃` row inside the forced `v₂` selector. -/
def SelectorV2Qa3Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 t
  S.I2 ⊆ T ∧
    ∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)

/-- The `q = b₃` row inside the forced `v₂` selector. -/
def SelectorV2Qb3Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 t
  S.I2 ⊆ T ∧
    ∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)

/-- The `p = v₃` rows inside the forced `v₂` selector. -/
def SelectorV2Pv3Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 t
  S.I2 ⊆ T ∧
    T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
      ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
       (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))

/-- The `y = a₃`, `q = v₁` Form-`c` branch packet. -/
def FormCv1A3SelectorV3Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  (Z.a3 : ℝ²) ∈ S.I3 ∧
    S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²) ∧
      S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²) ∧
        0 < s ∧ SelectorV3Qv1FullPacket S Z s

/-- The `y = b₃`, lower-side Form-`c` packet. -/
def FormCv1B3SelectorV3LowerPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 s
  (Z.b3 : ℝ²) ∈ S.I3 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I3 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) ∧
  ((T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))

/-- The `y = b₃`, `q = v₁` Form-`c` branch packet. -/
def FormCv1B3SelectorV3Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  (Z.b3 : ℝ²) ∈ S.I3 ∧
    S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²) ∧
      S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²) ∧
        0 < s ∧ SelectorV3Qv1FullPacket S Z s

/-- Spec-default `y = a₃` pin at `v₁`. -/
def Xa3Pin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  ∃ _ : (Z.a3 : ℝ²) ∈ S.I3,
    S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)

/-- Spec-default `A ∈ S(C)` pin at `v₃`. -/
def AInSCPin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (s : ℝ) : Prop :=
  0 < s ∧ SelectorV3Qv1FullPacket S Z s

/-- Swap the two `I₃` names locally. -/
private def ZeroDefectCapLayout.swapI3
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.a1
  b1 := Z.b1
  a2 := Z.a2
  b2 := Z.b2
  a3 := Z.b3
  b3 := Z.a3
  hI1 := Z.hI1
  hI2 := Z.hI2
  hI3 := by simpa [Finset.pair_comm] using Z.hI3

/-- Combine the spec-default `y = a₃` pin with `IsFormC_v1`. -/
private theorem formCv1A3SelectorV3Qv1Packet_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC : S.IsFormC_v1 r) (hxa3 : Xa3Pin S Z r)
    (hAinSC : AInSCPin S Z s) :
    FormCv1A3SelectorV3Qv1Packet S Z r s := by
  rcases hC with ⟨_, _, hv3eq, _⟩
  rcases hxa3 with ⟨ha3I3, ha3eq⟩
  rcases hAinSC with ⟨hs, hselector⟩
  exact ⟨ha3I3, ha3eq, hv3eq, hs, hselector⟩

/-- Any `I₂` vertex lies strictly before the far endpoint `v₁` in the
`v₃`-radial order on support cap `C₂`. -/
private theorem v3_lt_v3v1_of_mem_I2_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v3 p < dist S.triangle.v3 S.triangle.v1 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
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
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hp_ne_v1
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v1 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
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
      hi, hFirstLast.1, hFirstLast.2] using hlt
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v1
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v1 := hLastFirst.1
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
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt

/-- Any `I₃` vertex is strictly closer to `v₁` than the far endpoint `v₂`. -/
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
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
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
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
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

/-- Swap the two `I₁` names locally. -/
private def ZeroDefectCapLayout.swapI1
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.b1
  b1 := Z.a1
  a2 := Z.a2
  b2 := Z.b2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := by simpa [Finset.pair_comm] using Z.hI1
  hI2 := Z.hI2
  hI3 := Z.hI3

/-- The `I₁` side-chain distance order viewed from `v₂`. -/
private theorem I1_v2_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ near far : ℝ²,
      ({near, far} : Finset ℝ²) = S.I1 ∧
      dist S.triangle.v2 near < dist S.triangle.v2 far ∧
      dist S.triangle.v2 far < dist S.triangle.v2 S.triangle.v3 := by
  classical
  have hC1four : S.CP.C1.card = 4 := (S.n5_forced_m44).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hm4 : m = 4 := by
    calc
      m = (Finset.univ.image L.points).card := by
        symm
        simpa using Finset.card_image_of_injective (s := Finset.univ) (f := L.points)
          L.injective
      _ = S.CP.C1.card := by rw [hLC]
      _ = 4 := hC1four
  subst m
  let i0 : Fin 4 := ⟨0, by omega⟩
  let i1 : Fin 4 := ⟨1, by omega⟩
  let i2 : Fin 4 := ⟨2, by omega⟩
  let i3 : Fin 4 := ⟨3, by omega⟩
  have hi12 : i1 < i2 := by
    apply Fin.lt_def.mpr
    simp [i1, i2]
  have hi23 : i2 < i3 := by
    apply Fin.lt_def.mpr
    simp [i2, i3]
  have hidx0 : (Problem97.CGN.firstIndex Packet.hm : Fin 4) = i0 := by
    ext
    simp [Problem97.CGN.firstIndex, i0]
  have hidx3 : (Problem97.CGN.lastIndex Packet.hm : Fin 4) = i3 := by
    ext
    simp [Problem97.CGN.lastIndex, i3]
  rcases hEnds with hFirstLast | hLastFirst
  · have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v2 := by
      simpa [hidx0, i0] using hFirstLast.1
    have hlast3 : L.points i3 = S.triangle.v3 := by
      simpa [hidx3, i3] using hFirstLast.2
    have hnearfar : dist S.triangle.v2 (L.points i1) < dist S.triangle.v2 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0]
          using hmono hi12
      simpa [hfirst0] using htmp
    have hfarv3 : dist S.triangle.v2 (L.points i2) < dist S.triangle.v2 S.triangle.v3 := by
      have htmp :
          dist (L.points i0) (L.points i2) < dist (L.points i0) (L.points i3) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0, hidx3]
          using hmono hi23
      simpa [hfirst0, hlast3] using htmp
    have hnearC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hfarC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hnear_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hnear_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hfar_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hfar_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hnearI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i1, L.points i2} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i2 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i1, L.points i2} : Finset ℝ²).card = 2 := by
      have hne : L.points i1 ≠ L.points i2 := by
        intro h
        have : i1 = i2 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i1, L.points i2} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i1, L.points i2, ?_, hnearfar, hfarv3⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le
  · have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v3 := by
      simpa [hidx0, i0] using hLastFirst.1
    have hlast3 : L.points i3 = S.triangle.v2 := by
      simpa [hidx3, i3] using hLastFirst.2
    have hi1rev : i1.rev = i2 := by
      ext
      simp [i1, i2, Fin.val_rev]
    have hi2rev : i2.rev = i1 := by
      ext
      simp [i1, i2, Fin.val_rev]
    have hi3rev : i3.rev = i0 := by
      ext
      simp [i0, i3, Fin.val_rev]
    have hnearfar : dist S.triangle.v2 (L.points i2) < dist S.triangle.v2 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmono hi12
      simpa [hlast3] using htmp
    have hfarv3 : dist S.triangle.v2 (L.points i1) < dist S.triangle.v2 S.triangle.v3 := by
      have htmp :
          dist (L.points i3) (L.points i1) < dist (L.points i3) (L.points i0) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi2rev, hi3rev] using hmono hi23
      simpa [hlast3, hfirst0] using htmp
    have hnearC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hfarC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hnear_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hnear_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hfar_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hfar_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hnearI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i2, L.points i1} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i1 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i2, L.points i1} : Finset ℝ²).card = 2 := by
      have hne : L.points i2 ≠ L.points i1 := by
        intro h
        have : i2 = i1 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i2, L.points i1} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i2, L.points i1, ?_, hnearfar, hfarv3⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le

/-- The `q = v₁` row in the forced `v₂` selector is impossible from the local
distance chain. -/
private theorem selectorShape_v2_q_eq_v1_impossible_of_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {t : ℝ}
    (hpacket : SelectorV2Qv1Packet S Z t)
    (hb1a1 : dist S.triangle.v2 Z.b1 < dist S.triangle.v2 Z.a1)
    (ha1v3 : dist S.triangle.v2 Z.a1 < dist S.triangle.v2 S.triangle.v3)
    (hv3v1 : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1) :
    False := by
  classical
  let T := S.witnessClassAt_v2 t
  rcases hpacket with ⟨_, _, p, hp, hpeq, hqeq⟩
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hv1T : S.triangle.v1 ∈ T := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hqeq] at hv1mem
    exact (Finset.mem_inter.mp hv1mem).1
  have hpeqd : dist S.triangle.v2 p = dist S.triangle.v2 S.triangle.v1 := by
    exact (Finset.mem_filter.mp hpT).2.trans ((Finset.mem_filter.mp hv1T).2.symm)
  rcases Finset.mem_insert.mp hp with hpa1 | hp
  · subst hpa1
    linarith
  rcases Finset.mem_insert.mp hp with hpb1 | hpv3
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    subst hpb1'
    linarith
  have hpv3' : p = S.triangle.v3 := by simpa using hpv3
  subst hpv3'
  linarith

/-- Close the `q = v₁` row of the forced `v₂` selector. -/
private theorem selectorShape_v2_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {t : ℝ}
    (hpacket : SelectorV2Qv1Packet S Z t)
    (hv3v1 : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1) :
    False := by
  classical
  rcases S.I1_v2_distance_chain with ⟨near, far, hI1eq, hnearfar, hfarv3⟩
  have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
    simpa [Z.hI1] using S.I1_card_eq_two
  have hab_ne : Z.a1 ≠ Z.b1 := by
    intro h
    simp [h] at hI1card
  have haI1 : Z.a1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  have hbI1 : Z.b1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  rw [← hI1eq] at haI1 hbI1
  rcases Finset.mem_insert.mp haI1 with haNear | haFar
  · have hbFar : Z.b1 = far := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · exfalso
        exact hab_ne (haNear.trans hbNear.symm)
      · simpa using hbFar
    have hpacket' : SelectorV2Qv1Packet S (Z.swapI1) t := by
      simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI1, Finset.insert_comm] using hpacket
    apply selectorShape_v2_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z.swapI1) (t := t) hpacket'
    · simpa [ZeroDefectCapLayout.swapI1, haNear, hbFar] using hnearfar
    · simpa [ZeroDefectCapLayout.swapI1, hbFar] using hfarv3
    · exact hv3v1
  · have haFar' : Z.a1 = far := by
      simpa using haFar
    have hbNear : Z.b1 = near := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · simpa using hbNear
      · exfalso
        have hbFar' : Z.b1 = far := by simpa using hbFar
        exact hab_ne (haFar'.trans hbFar'.symm)
    apply selectorShape_v2_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z) (t := t) hpacket
    · simpa [hbNear, haFar'] using hnearfar
    · simpa [haFar'] using hfarv3
    · exact hv3v1

/-- Temporary C-side mirror leaf for the `y = a₃`, `q = v₁` branch. -/
theorem n4d_cB1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC : S.IsFormC_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxa3 : Xa3Pin S Z r)
    (hAinSC : AInSCPin S Z s) :
    False := by
  classical
  obtain ⟨ha3I3, ha3C3⟩ := hxa3
  obtain ⟨hs, hsel⟩ := hAinSC
  obtain ⟨hTcard, hI3sub, q, hq, hqC1, hv1C2⟩ := hsel
  exact n4d_cB1_impossible_core S Z hC hcard ha3I3 ha3C3 hs hTcard hI3sub q hq hqC1 hv1C2

/-- `N4d-cA-3`: the `y = a₃`, lower-side `q'=A` column is impossible. -/
theorem n4d_cA_3_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA3, ha3eq, hTcard, hI3sub, hC1eq, hC2eq⟩
  let T := S.witnessClassAt_v3 s
  have hv2T : S.triangle.v2 ∈ T := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a2 : ℝ²) ∈ T ∩ S.CP.C2 ∨ (Z.b2 : ℝ²) ∈ T ∩ S.CP.C2 := by
    rcases hC2eq with hqa2 | hqb2
    · left
      have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← hqa2] at hmem
      exact hmem
    · right
      have hmem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hqb2] at hmem
      exact hmem
  obtain ⟨q, hqI2, hqT3⟩ : ∃ q : ℝ², q ∈ S.I2 ∧ q ∈ T := by
    rcases hq with hqa2 | hqb2
    · refine ⟨Z.a2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqa2).1
    · refine ⟨Z.b2, ?_, ?_⟩
      · rw [Z.hI2]
        simp
      · exact (Finset.mem_inter.mp hqb2).1
  have hv2rad : dist S.triangle.v3 S.triangle.v2 = s := by
    simpa [T] using (Finset.mem_filter.mp hv2T).2
  have hqrad : dist S.triangle.v3 q = s := by
    simpa [T] using (Finset.mem_filter.mp hqT3).2
  have hq_lt_base : dist S.triangle.v3 q < dist S.triangle.v3 S.triangle.v1 :=
    v3_lt_v3v1_of_mem_I2_local S hqI2
  have hbase_lt_long : dist S.triangle.v3 S.triangle.v1 < dist S.triangle.v2 S.triangle.v1 := by
    have ha3T1 : Z.a3 ∈ S.witnessClassAt_v1 r := by
      have ha3mem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← ha3eq] at ha3mem
      exact (Finset.mem_inter.mp ha3mem).1
    have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
      rcases hC with ⟨_, _, hv3eq, _⟩
      have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
      rw [← hv3eq] at hv3mem
      exact (Finset.mem_inter.mp hv3mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v3 = dist S.triangle.v1 Z.a3 := by
      have hv3dist : dist S.triangle.v1 S.triangle.v3 = r := by
        simpa using (Finset.mem_filter.mp hv3T1).2
      have ha3dist : dist S.triangle.v1 Z.a3 = r := by
        simpa using (Finset.mem_filter.mp ha3T1).2
      rw [hv3dist, ha3dist]
    have h := v1_lt_v1v2_of_mem_I3_local S hA3
    simpa [hbase_eq, dist_comm] using h
  have hv3v1 : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1 := by
    calc
      dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v3 S.triangle.v2 := by rw [dist_comm]
      _ = dist S.triangle.v3 q := by rw [hv2rad, hqrad]
      _ < dist S.triangle.v3 S.triangle.v1 := hq_lt_base
      _ < dist S.triangle.v2 S.triangle.v1 := hbase_lt_long
  exact selectorShape_v2_q_eq_v1_impossible S Z hpacket2 hv3v1

/-- `N4d-cA-3`: the `y = a₃`, lower-side `q'=C` column is impossible. -/
theorem n4d_cA_3_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qa3Packet S Z t) :
    False := by
  classical
  obtain ⟨hI2sub, p, hp, hpC1, ha3C3⟩ := hpacket2
  exact n4d_cA_3_q_eq_C_impossible_core S Z hC hlower hI2sub p hp hpC1 ha3C3

/-- FormC mirror of the q'=E pin-clash closer in the `y = a₃` branch. -/
theorem qEqE_b3_column_pinclash_false
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qb3Packet S Z t) :
    False := by
  classical
  obtain ⟨hI2sub, p, hp, hpC1, hb3C3⟩ := hpacket2
  exact qEqE_b3_column_pinclash_false_core Z hC hlower hI2sub p hp hpC1 hb3C3

/-- `N4d-cB-3`: the `y = b₃`, lower-side `q'=A` column is impossible. -/
theorem n4d_cB_3_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1B3SelectorV3LowerPacket S Z r s)
    (hpacket2 : SelectorV2Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hB3, hb3eq, hTcard, hI3sub, hC1eq, hC2eq⟩
  have hlower' : FormCv1A3SelectorV3LowerPacket S Z.swapI3 r s := by
    refine ⟨?_, ?_, hTcard, hI3sub, hC1eq, hC2eq⟩
    · simpa [ZeroDefectCapLayout.swapI3] using hB3
    · simpa [ZeroDefectCapLayout.swapI3] using hb3eq
  have hpacket2' : SelectorV2Qv1Packet S Z.swapI3 t := by
    simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI3] using hpacket2
  exact S.n4d_cA_3_q_eq_v1_impossible (Z := Z.swapI3) hC hlower' hpacket2'

/-- `N4d-cB-5`: in the `y = b₃` lower-side branch, the `q'=C` column is impossible. -/
theorem n4d_cB_5_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hB3 : (Z.b3 : ℝ²) ∈ S.I3)
    (hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))
    (hTcard : (S.witnessClassAt_v3 s).card = 4)
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s)
    (hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²))
    (hC2eq :
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
    (hpacket : SelectorV2Qa3Packet S Z t) :
    False := by
  classical
  rcases hpacket with ⟨hI2sub, p, hp, hpC1, hqC3⟩
  have hlower' : FormCv1A3SelectorV3LowerPacket S Z.swapI3 r s := by
    refine ⟨?_, ?_, hTcard, hI3sub, hC1eq, hC2eq⟩
    · simpa [ZeroDefectCapLayout.swapI3] using hB3
    · simpa [ZeroDefectCapLayout.swapI3] using hb3eq
  have hpacket' : SelectorV2Qb3Packet S Z.swapI3 t := by
    refine ⟨hI2sub, p, ?_, hpC1, ?_⟩
    · simpa [ZeroDefectCapLayout.swapI3] using hp
    · simpa [ZeroDefectCapLayout.swapI3] using hqC3
  exact qEqE_b3_column_pinclash_false (S := S) (Z := Z.swapI3) hC hlower' hpacket'

/-- `N4d-cB-4`: in the `y = b₃` lower-side branch, the `q'=E` column is impossible. -/
theorem n4d_cB_4_q_eq_E_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hB3 : (Z.b3 : ℝ²) ∈ S.I3)
    (hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))
    (hTcard : (S.witnessClassAt_v3 s).card = 4)
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s)
    (hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²))
    (hC2eq :
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
      (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
    (hpacket : SelectorV2Qb3Packet S Z t) :
    False := by
  classical
  have hlower' : FormCv1A3SelectorV3LowerPacket S Z.swapI3 r s := by
    refine ⟨?_, ?_, hTcard, hI3sub, hC1eq, hC2eq⟩
    · simpa [ZeroDefectCapLayout.swapI3] using hB3
    · simpa [ZeroDefectCapLayout.swapI3] using hb3eq
  have hpacket' : SelectorV2Qa3Packet S Z.swapI3 t := by
    simpa [SelectorV2Qa3Packet, SelectorV2Qb3Packet, ZeroDefectCapLayout.swapI3] using hpacket
  exact S.n4d_cA_3_q_eq_C_impossible (Z := Z.swapI3) hC hlower' hpacket'

/-- Workstream W5 export: the escaped Form `c` at `v₁` is impossible. -/
theorem N4dExcludesFormC_v1_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormC_v1 := by
  classical
  intro r hr hcard hesc hC
  let Z : ZeroDefectCapLayout S := S.zeroDefectCapLayout
  rcases S.formC_v1_split Z hC with ⟨ha3, hxa3⟩ | ⟨hb3, hxb3⟩
  · rcases S.selectorShape_v3_split Z with ⟨s, hs, hsplit3⟩
    rcases hsplit3 with ⟨hTcard3, hI3sub, hcases3⟩
    rcases hcases3 with hqv1 | hlower
    · have hA3 : Xa3Pin S Z r := ⟨ha3, hxa3⟩
      have hAinSC : AInSCPin S Z s := by
        refine ⟨hs, ?_⟩
        rcases hqv1 with ⟨p, hp, hpC1, hv1C2⟩
        exact ⟨hTcard3, hI3sub, p, hp, hpC1, hv1C2⟩
      exact S.n4d_cB1_impossible Z hC hcard hA3 hAinSC
    · rcases hlower with hqa2 | hqb2
      · rcases hqa2 with ⟨p3, hp3, hp3C1, ha2C2⟩
        have hp3v2 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 Z hr hs hcard hC ha3 hxa3 hI3sub hp3 hp3C1
        have hlowerPacket : FormCv1A3SelectorV3LowerPacket S Z r s := by
          exact ⟨ha3, hxa3, hTcard3, hI3sub, hp3v2, Or.inl ha2C2⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cA_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · exact S.n4d_cA_3_q_eq_C_impossible Z hC hlowerPacket ⟨hI2sub, hqa3⟩
          · rcases hqb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpa1 | hp2
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpa1] using hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpb1 | hpv3
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpb1] using hp2, hp2C1, hb3C3⟩
            · have hpv3' : p2 = S.triangle.v3 := by simpa using hpv3
              rw [hpv3'] at hp2C1
              exact S.pEqC_column_impossible Z hC hlowerPacket
                (by
                  exact ⟨hI2sub, hp2C1, Or.inr hb3C3⟩)
      · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
        have hp3v2 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 Z hr hs hcard hC ha3 hxa3 hI3sub hp3 hp3C1
        have hlowerPacket : FormCv1A3SelectorV3LowerPacket S Z r s := by
          exact ⟨ha3, hxa3, hTcard3, hI3sub, hp3v2, Or.inr hb2C2⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cA_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · exact S.n4d_cA_3_q_eq_C_impossible Z hC hlowerPacket ⟨hI2sub, hqa3⟩
          · rcases hqb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpa1 | hp2
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpa1] using hp2, hp2C1, hb3C3⟩
            rcases Finset.mem_insert.mp hp2 with hpb1 | hpv3
            · exact qEqE_b3_column_pinclash_false Z hC hlowerPacket
                ⟨hI2sub, p2, by simpa [hpb1] using hp2, hp2C1, hb3C3⟩
            · have hpv3' : p2 = S.triangle.v3 := by simpa using hpv3
              rw [hpv3'] at hp2C1
              exact S.pEqC_column_impossible Z hC hlowerPacket
                (by
                  exact ⟨hI2sub, hp2C1, Or.inr hb3C3⟩)
  · rcases S.selectorShape_v3_split Z with ⟨s, hs, hsplit3⟩
    rcases hsplit3 with ⟨hTcard3, hI3sub, hcases3⟩
    rcases hcases3 with hqv1 | hlower
    · have hA3 : Xa3Pin S (Z.swapI3) r := by
        refine ⟨?_, ?_⟩
        · simpa [ZeroDefectCapLayout.swapI3] using hb3
        · simpa [ZeroDefectCapLayout.swapI3] using hxb3
      have hAinSC : AInSCPin S (Z.swapI3) s := by
        refine ⟨hs, ?_⟩
        rcases hqv1 with ⟨p, hp, hpC1, hv1C2⟩
        refine ⟨hTcard3, ?_, p, ?_, hpC1, hv1C2⟩
        · simpa [ZeroDefectCapLayout.swapI3] using hI3sub
        · simpa [ZeroDefectCapLayout.swapI3] using hp
      exact S.n4d_cB1_impossible (Z := Z.swapI3) hC hcard hA3 hAinSC
    · rcases hlower with hqa2 | hqb2
      · rcases hqa2 with ⟨p3, hp3, hp3C1, ha2C2⟩
        have hB3 : (Z.b3 : ℝ²) ∈ S.I3 := hb3
        have hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²) := hxb3
        have hI3sub3 : S.I3 ⊆ S.witnessClassAt_v3 s := hI3sub
        have hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 (Z := Z.swapI3) hr hs hcard hC hb3 hxb3 hI3sub hp3 hp3C1
        have hC2eq :
            (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
              (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) :=
          Or.inl ha2C2
        have hlowerPacket : FormCv1B3SelectorV3LowerPacket S Z r s := by
          exact ⟨hB3, hb3eq, hTcard3, hI3sub3, hC1eq, hC2eq⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cB_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · have hpacket : SelectorV2Qa3Packet S Z t := by
              dsimp [SelectorV2Qa3Packet]
              exact ⟨hI2sub, hqa3⟩
            exact S.n4d_cB_5_q_eq_C_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq hpacket
          · rcases hqb3 with ⟨p, hp, hpeq, hqeqC3⟩
            exact S.n4d_cB_4_q_eq_E_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq
              ⟨hI2sub, p, hp, hpeq, hqeqC3⟩
      · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
        have hB3 : (Z.b3 : ℝ²) ∈ S.I3 := hb3
        have hb3eq : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²) := hxb3
        have hI3sub3 : S.I3 ⊆ S.witnessClassAt_v3 s := hI3sub
        have hC1eq : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) :=
          S.selectorShape_v3_lower_forces_v2 (Z := Z.swapI3) hr hs hcard hC hb3 hxb3 hI3sub hp3 hp3C1
        have hC2eq :
            (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
              (S.witnessClassAt_v3 s ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) :=
          Or.inr hb2C2
        have hlowerPacket : FormCv1B3SelectorV3LowerPacket S Z r s := by
          exact ⟨hB3, hb3eq, hTcard3, hI3sub3, hC1eq, hC2eq⟩
        rcases S.selectorShape_v2_split Z with ⟨t, ht, hsplit2⟩
        rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
        rcases hcases2 with hqv1 | hrest
        · exact S.n4d_cB_3_q_eq_v1_impossible Z hC hlowerPacket
            ⟨hTcard2, hI2sub, hqv1⟩
        · rcases hrest with hqa3 | hqb3
          · have hpacket : SelectorV2Qa3Packet S Z t := by
              dsimp [SelectorV2Qa3Packet]
              exact ⟨hI2sub, hqa3⟩
            exact S.n4d_cB_5_q_eq_C_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq hpacket
          · rcases hqb3 with ⟨p, hp, hpeq, hqeqC3⟩
            exact S.n4d_cB_4_q_eq_E_impossible Z hC hB3 hb3eq hTcard3 hI3sub3 hC1eq hC2eq
              ⟨hI2sub, p, hp, hpeq, hqeqC3⟩

end FiniteEndpointShell
end Problem97
