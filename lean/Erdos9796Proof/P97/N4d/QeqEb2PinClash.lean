import Erdos9796Proof.P97.N4d.FaithfulFrame
import Erdos9796Proof.P97.N4d.SmallSReductions
import Erdos9796Proof.P97.Bridge.A1SpineWiring

/-!
# `N4d` q'=E b₂ column — the pin-clash closer

This module proves `Problem97.qEqE_b2_column_pinclash_false`, the geometric
closer for the q'=E `b₂`, `x = a₂` lower-side column.  It has the exact same
signature as `Problem97.qEqE_b2_freeRb_residual_false`
(`Bridge/A1SpineWiring.lean`) and re-points the four producer call sites in
`N4dExcludesFormBv1.lean`.

## The pin-clash (the settled mathematics)

Normalize the row's faithful frame so `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, `v₃` upper.
Write `X = (T v₃) 0`, `Y = (T v₃) 1` (`Y > 0`), `x = (T x₃) 0`, `y = (T x₃) 1`,
`O = (½, Oy)` (circumcentre), `ŝ = dist (T v₂) (T v₃)` so `ŝ² = (X-1)² + Y²`.

The `S(v₂) ∩ C₃` representative `x₃ ∈ {a₃, b₃}` is double-pinned: it sits on
`circle(v₂, ŝ)` (so `(x-1)² + y² = ŝ²`) and in `I₃` (below chord, `y ≤ 0`, and
in the MEC disk).  The `C₁` ladder applied to the named `C₁`-witness
`p ∈ {a₁, b₁}` (which shares the `v₃`-radius `t` with `x₃`) forces
`dist (T v₃) (T x₃) < ŝ`, i.e. `(X-x)² + (Y-y)² < ŝ²`.  The geometry forces the
opposite, `(X-x)² + (Y-y)² > ŝ²` — the verified scalar core `pinclash_scalar`.
Contradiction.

The geometry is PROVEN and skeptic-audited; this file is the mechanical Lean
assembly.  No new `axiom`, no `native_decide`/`decide` on reals.
-/

open scoped EuclideanGeometry InnerProductSpace
open Finset

namespace Problem97

/- ### Chart coordinate helpers (local copies of the `N4dFaithfulFrame` privates) -/

private theorem dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

private theorem vec2_c0 (a b : ℝ) : (Problem97.CGN.vec2 a b) 0 = a := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem vec2_c1 (a b : ℝ) : (Problem97.CGN.vec2 a b) 1 = b := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem sa2_chart_base_local (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring

/- ### The three radial-order ladders

`v1_lt_v1v3_of_mem_I2` and `v2_lt_v2v1_of_mem_I3` are verbatim copies of the
private locals in `N4dExcludesFormBv1.lean` (re-exported here to avoid the
import cycle, since this file re-points that file's call sites).
`v3_lt_v3v2_of_mem_I1` is the mirror at `C₁` (apex `v₁`, endpoints `v₂, v₃`),
concluding `dist v₃ q < dist v₃ v₂` for `q ∈ I₁`. -/

/-- Any `I₁` vertex is strictly closer to `v₃` than the opposite endpoint `v₂`.
The `C₁` mirror of the `C₃` ladder: cap `C₁` is opposite `v₁`, with
`v₂, v₃` as its chord endpoints, so `q ∈ I₁` lies strictly inside the radial
order on `C₁` from `v₃`. -/
private theorem v3_lt_v3v2_of_mem_I1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI1 : q ∈ S.I1) :
    dist S.triangle.v3 q < dist S.triangle.v3 S.triangle.v2 := by
  classical
  have hqC1 : q ∈ S.CP.C1 :=
    Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI1)
  have hq_ne_v3 : q ≠ S.triangle.v3 :=
    (Finset.mem_erase.mp hqI1).1
  have hq_ne_v2 : q ≠ S.triangle.v2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hqI1).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC1
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v3
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v3 := hFirstLast.2
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      have hi_ne_zero : i.val ≠ 0 := by
        intro hi_zero
        have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
          ext
          simpa [Problem97.CGN.firstIndex] using hi_zero
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
          _ = S.triangle.v2 := hFirstLast.1
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
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v2 := hLastFirst.2
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

/-- Any `I₂` vertex lies strictly before the far endpoint `v₃` in the `v₁`-radial
order on support cap `C₂`.  Verbatim copy of the private local in
`N4dExcludesFormBv1.lean`. -/
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

/-- Any `I₃` vertex is strictly closer to `v₂` than the opposite endpoint `v₁`.
Verbatim copy of the private local in `N4dExcludesFormBv1.lean`. -/
private theorem v2_lt_v2v1_of_mem_I3
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

/- ### The faithful-frame facts -/

set_option maxHeartbeats 4000000 in
-- The coordinate-algebra derivation threads the nested transport `T` through
-- several `nlinarith` certificates; the underlying algebra is light but the
-- elaboration exceeds the default heartbeat budget.
/-- The MEC circumcentre lands at `O = (½, Oy)` with `Oy ≥ 0`, and the squared
similarity radius is `(scale·radius)² = ¼ + Oy²`, in the normalized base frame.
Mirrors the `v2AnchorFrame_facts` circumcentre block. -/
private theorem frame_circumcenter_facts
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hv3y_pos : 0 < (T S.triangle.v3) 1) :
    (T S.Packet.center) 0 = 1 / 2 ∧ 0 ≤ (T S.Packet.center) 1 ∧
      (tau.scale * S.Packet.radius) ^ 2 = 1 / 4 + (T S.Packet.center) 1 ^ 2 := by
  classical
  -- frame inner product at `v₃` (nonneg), via dist²-polarization of `inner_at_v3`.
  have hinner_frame : 0 ≤ (inner ℝ (T S.triangle.v1 - T S.triangle.v3)
      (T S.triangle.v2 - T S.triangle.v3) : ℝ) := by
    have hexp := norm_sub_sq_real (T S.triangle.v1 - T S.triangle.v3)
      (T S.triangle.v2 - T S.triangle.v3)
    have hrw : (T S.triangle.v1 - T S.triangle.v3) - (T S.triangle.v2 - T S.triangle.v3)
        = T S.triangle.v1 - T S.triangle.v2 := by abel
    rw [hrw] at hexp
    have n13 : ‖T S.triangle.v1 - T S.triangle.v3‖
        = tau.scale * dist S.triangle.v1 S.triangle.v3 := by rw [← dist_eq_norm, tau.dist_image]
    have n23 : ‖T S.triangle.v2 - T S.triangle.v3‖
        = tau.scale * dist S.triangle.v2 S.triangle.v3 := by rw [← dist_eq_norm, tau.dist_image]
    have n12 : ‖T S.triangle.v1 - T S.triangle.v2‖
        = tau.scale * dist S.triangle.v1 S.triangle.v2 := by rw [← dist_eq_norm, tau.dist_image]
    rw [n13, n23, n12] at hexp
    have horig := norm_sub_sq_real (S.triangle.v1 - S.triangle.v3)
      (S.triangle.v2 - S.triangle.v3)
    have hrw2 : (S.triangle.v1 - S.triangle.v3) - (S.triangle.v2 - S.triangle.v3)
        = S.triangle.v1 - S.triangle.v2 := by abel
    rw [hrw2] at horig
    have hinner0 : 0 ≤ (inner ℝ (S.triangle.v1 - S.triangle.v3)
        (S.triangle.v2 - S.triangle.v3) : ℝ) := S.Packet.inner_at_v3
    have m13 : ‖S.triangle.v1 - S.triangle.v3‖ = dist S.triangle.v1 S.triangle.v3 :=
      (dist_eq_norm _ _).symm
    have m23 : ‖S.triangle.v2 - S.triangle.v3‖ = dist S.triangle.v2 S.triangle.v3 :=
      (dist_eq_norm _ _).symm
    have m12 : ‖S.triangle.v1 - S.triangle.v2‖ = dist S.triangle.v1 S.triangle.v2 :=
      (dist_eq_norm _ _).symm
    rw [m13, m23, m12] at horig
    have hsc : 0 ≤ tau.scale ^ 2 := sq_nonneg _
    nlinarith [hexp, horig, hinner0, hsc, mul_nonneg hsc hinner0]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, vec2_c1]
  have h2x : (T S.triangle.v2) 0 = 1 := by rw [hv2, vec2_c0]
  have h2y : (T S.triangle.v2) 1 = 0 := by rw [hv2, vec2_c1]
  have hnum : 0 ≤ (T S.triangle.v3) 0 ^ 2 - (T S.triangle.v3) 0 + (T S.triangle.v3) 1 ^ 2 :=
    nonobtuse_v₃_numerator_nonneg _ _ _ h1x h1y h2x h2y hinner_frame
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  set R := tau.scale * S.Packet.radius with hR_def
  have hb1sq : dist (T S.triangle.v1) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd1, hR_def]
  have hb2sq : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd2, hR_def]
  have hb3sq : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd3, hR_def]
  set Vx := (T S.triangle.v3) 0 with hVx_def
  set Vy := (T S.triangle.v3) 1 with hVy_def
  set ox := (T S.Packet.center) 0 with hox_def
  set Oy := (T S.Packet.center) 1 with hOy_def
  have hVy_pos : 0 < Vy := hv3y_pos
  have e1 : ox ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb1sq
    rw [dist_sq_coords, h1x, h1y] at h
    simpa [hox_def, hOy_def] using h
  have e2 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [dist_sq_coords, h2x, h2y] at h
    nlinarith [h]
  have e3 : (Vx - ox) ^ 2 + (Vy - Oy) ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [dist_sq_coords] at h
    simpa [hVx_def, hVy_def, hox_def, hOy_def] using h
  clear_value Vx Vy ox Oy R
  have hox : ox = 1 / 2 := by nlinarith [e1, e2]
  have hOy_nonneg : 0 ≤ Oy := by
    have hmecnum : 2 * Vy * Oy = Vx ^ 2 - Vx + Vy ^ 2 := by nlinarith [e1, e3, hox]
    nlinarith [hmecnum, hnum, hVy_pos]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith [e1, hox]
  exact ⟨hox, hOy_nonneg, hRsq⟩

/-- A cap-`C₃` interior point lands below the base chord in the normalized
frame: `(T x) 1 ≤ 0`.  Re-derivation of the private `frame_c3_lower`. -/
private theorem frame_below_chord
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hv3y_pos : 0 < (T S.triangle.v3) 1)
    (hxI3 : x ∈ S.I3) :
    (T x) 1 ≤ 0 := by
  have hxC3 : x ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).2
  have hxA : x ∈ A := S.CP.C3_subset hxC3
  have hopp : Problem97.OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
    ((S.CP.arc_membership x hxA).2.2.mp hxC3)
  unfold Problem97.OnArcOpposite at hopp
  have hp := tau.halfplane_sign x S.triangle.v1 S.triangle.v2
  have hq := tau.halfplane_sign S.triangle.v3 S.triangle.v1 S.triangle.v2
  rw [hv1, hv2, sa2_chart_base_local] at hp hq
  have hprod : (T x) 1 * (T S.triangle.v3) 1
      = tau.scale ^ 4 *
        (signedArea2 x S.triangle.v1 S.triangle.v2
          * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
    have hkey : (T x) 1 * (T S.triangle.v3) 1
        = (tau.orientation ^ 2 * tau.scale ^ 4) *
          (signedArea2 x S.triangle.v1 S.triangle.v2
            * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
      rw [hp, hq]; ring
    rw [hkey, tau.orientation_sq, one_mul]
  have hle : (T x) 1 * (T S.triangle.v3) 1 ≤ 0 := by
    rw [hprod]; exact mul_nonpos_of_nonneg_of_nonpos (by positivity) hopp
  nlinarith [hle, hv3y_pos]

/-- Every `A`-point lands in the closed MEC disk in the normalized frame
(squared form, radius `scale·radius`). -/
private theorem frame_disk_pt
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hxA : x ∈ A) :
    dist (T x) (T S.Packet.center) ^ 2 ≤ (tau.scale * S.Packet.radius) ^ 2 := by
  have hxdisk : dist x S.Packet.center ≤ S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.disk_contains_A x hxA
  have hle : dist (T x) (T S.Packet.center) ≤ tau.scale * S.Packet.radius := by
    rw [tau.dist_image]
    exact mul_le_mul_of_nonneg_left hxdisk tau.scale_pos.le
  exact pow_le_pow_left₀ dist_nonneg hle 2

/- ### The verified scalar core -/

set_option maxHeartbeats 1000000 in
/-- **The pin-clash geometry direction (PROVEN, z3 + sympy + hand verified).**
In the normalized frame with the apex-circle pin `(x-1)²+y² = ŝ²`, the apex pin
`(X-1)²+Y² = ŝ²`, below-chord `y ≤ 0`, disk-containment, and `ℓ̂ > 1`, the
squared apex distance to the double-pinned point exceeds `ŝ²`. -/
theorem pinclash_scalar (s X Y x y Oy : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (hsdef : (X - 1) ^ 2 + Y ^ 2 = s ^ 2)
    (hcirc : (x - 1) ^ 2 + y ^ 2 = s ^ 2)
    (hY : 0 < Y) (hy : y ≤ 0) (hOy : 0 ≤ Oy)
    (hdisk : (x - 1 / 2) ^ 2 + (y - Oy) ^ 2 ≤ 1 / 4 + Oy ^ 2)
    (hl : 1 < X ^ 2 + Y ^ 2) :
    s ^ 2 < (X - x) ^ 2 + (Y - y) ^ 2 := by
  have hOyy : Oy * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hOy hy
  have hband : x ≤ 1 - s ^ 2 := by nlinarith [hdisk, hcirc, hOyy]
  have h1x_nonneg : 0 ≤ 1 - x := by nlinarith [hband, sq_nonneg s]
  have hsq : (1 - x) ^ 2 ≤ s ^ 2 := by nlinarith [hcirc, sq_nonneg y]
  have h1x_le_s : 1 - x ≤ s := by nlinarith [hsq, h1x_nonneg, hs0]
  have hS2 : 1 - X < s ^ 2 / 2 := by nlinarith [hsdef, hl]
  have hYy : Y * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hY) hy
  have hip : (X - 1) * (x - 1) + Y * y < s ^ 2 / 2 := by
    rcases le_or_gt X 1 with hX | hX
    · have h1X : 0 ≤ 1 - X := by linarith
      have hb : (1 - X) * (1 - x) ≤ (1 - X) * s :=
        mul_le_mul_of_nonneg_left h1x_le_s h1X
      have hb2 : (1 - X) * s < s ^ 2 / 2 * s := mul_lt_mul_of_pos_right hS2 hs0
      nlinarith [hb, hb2, hYy, hs0, hs1,
        mul_pos (mul_pos hs0 hs0) (show (0:ℝ) < 1 - s by linarith)]
    · have hnp : (X - 1) * (x - 1) ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos (by linarith) (by linarith)
      nlinarith [hnp, hYy, hs0]
  nlinarith [hip, hsdef, hcirc]

/- ### The frame-transported core -/

set_option maxHeartbeats 2000000 in
-- The frame transport threads the nested chart `T` through many distance
-- rewrites; the elaboration exceeds the default heartbeat budget.
/-- **The pin-clash, in original-space geometric inputs.**  Given the
double-pinned `C₃` representative `x₃` (on `circle(v₂, |v₂v₃|)`, in `I₃`, and
with the `C₁`-witness clash `dist v₃ x₃ < dist v₃ v₂`), the apex-side `ℓ̂ > 1`
fact, and `|v₂v₃| < |v₂v₁|`, the normalized frame and `pinclash_scalar` give a
contradiction. -/
private theorem pinclash_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x₃ : ℝ²}
    (hx3I3 : x₃ ∈ S.I3) (hx3A : x₃ ∈ A)
    (hv2pin : dist S.triangle.v2 x₃ = dist S.triangle.v2 S.triangle.v3)
    (hclash : dist S.triangle.v3 x₃ < dist S.triangle.v3 S.triangle.v2)
    (hell : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hs1orig : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1) :
    False := by
  classical
  obtain ⟨T, tau, hv1, hv2, hv3y_pos⟩ := S.normBase
  obtain ⟨hOx, hOy_nonneg, hRsq⟩ := frame_circumcenter_facts S tau hv1 hv2 hv3y_pos
  have hyy_le : (T x₃) 1 ≤ 0 := frame_below_chord S tau hv1 hv2 hv3y_pos hx3I3
  have hdisk_x3 := frame_disk_pt S tau hx3A
  rw [hRsq] at hdisk_x3
  have h2x : (T S.triangle.v2) 0 = 1 := by rw [hv2, vec2_c0]
  have h2y : (T S.triangle.v2) 1 = 0 := by rw [hv2, vec2_c1]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, vec2_c1]
  have hsc_pos : 0 < tau.scale := tau.scale_pos
  have hbase_sq : dist (T S.triangle.v2) (T S.triangle.v1) ^ 2 = 1 := by
    rw [dist_sq_coords, h2x, h2y, h1x, h1y]; norm_num
  have hbase_one : dist (T S.triangle.v2) (T S.triangle.v1) = 1 := by
    nlinarith [hbase_sq, dist_nonneg (x := T S.triangle.v2) (y := T S.triangle.v1)]
  have hscale_pin : tau.scale * dist S.triangle.v2 S.triangle.v1 = 1 := by
    rw [← tau.dist_image]; exact hbase_one
  have hd_v2v3 : dist (T S.triangle.v2) (T S.triangle.v3)
      = tau.scale * dist S.triangle.v2 S.triangle.v3 := tau.dist_image _ _
  have hd_v3x3 : dist (T S.triangle.v3) (T x₃)
      = tau.scale * dist S.triangle.v3 x₃ := tau.dist_image _ _
  have hd_v2x3 : dist (T S.triangle.v2) (T x₃)
      = tau.scale * dist S.triangle.v2 x₃ := tau.dist_image _ _
  have hd_v1v3 : dist (T S.triangle.v1) (T S.triangle.v3)
      = tau.scale * dist S.triangle.v1 S.triangle.v3 := tau.dist_image _ _
  have hv23_pos : 0 < dist S.triangle.v2 S.triangle.v3 := dist_pos.mpr S.triangle.v23_ne
  have hsh_pos : 0 < dist (T S.triangle.v2) (T S.triangle.v3) := by
    rw [hd_v2v3]; exact mul_pos hsc_pos hv23_pos
  have hs1 : dist (T S.triangle.v2) (T S.triangle.v3) < 1 := by
    rw [hd_v2v3, ← hscale_pin]; exact mul_lt_mul_of_pos_left hs1orig hsc_pos
  have hpin_frame : dist (T S.triangle.v2) (T x₃) = dist (T S.triangle.v2) (T S.triangle.v3) := by
    rw [hd_v2x3, hv2pin, ← hd_v2v3]
  have hclash_frame : dist (T S.triangle.v3) (T x₃) < dist (T S.triangle.v2) (T S.triangle.v3) := by
    rw [hd_v3x3, hd_v2v3]
    have hd : dist S.triangle.v3 x₃ < dist S.triangle.v2 S.triangle.v3 := by
      rw [dist_comm S.triangle.v2 S.triangle.v3]; exact hclash
    exact mul_lt_mul_of_pos_left hd hsc_pos
  have hv13_gt : (1 : ℝ) < dist (T S.triangle.v1) (T S.triangle.v3) := by
    have hv12 : dist S.triangle.v2 S.triangle.v1 = dist S.triangle.v1 S.triangle.v2 := dist_comm _ _
    rw [hd_v1v3, ← hscale_pin, hv12]; exact mul_lt_mul_of_pos_left hell hsc_pos
  -- precompute the squared facts as cheap one-multiplication steps
  have hsh_lt1_sq : dist (T S.triangle.v2) (T S.triangle.v3) ^ 2 < 1 := by
    nlinarith [hs1, hsh_pos]
  have hv13_gt_sq : (1 : ℝ) < dist (T S.triangle.v1) (T S.triangle.v3) ^ 2 := by
    nlinarith [hv13_gt]
  have hclash_lt_sq :
      dist (T S.triangle.v3) (T x₃) ^ 2 < dist (T S.triangle.v2) (T S.triangle.v3) ^ 2 := by
    nlinarith [hclash_frame, dist_nonneg (x := T S.triangle.v3) (y := T x₃), hsh_pos]
  have hsq_v2v3 := dist_sq_coords (T S.triangle.v2) (T S.triangle.v3)
  have hsq_v2x3 := dist_sq_coords (T S.triangle.v2) (T x₃)
  have hsq_v1v3 := dist_sq_coords (T S.triangle.v1) (T S.triangle.v3)
  have hsq_v3x3 := dist_sq_coords (T S.triangle.v3) (T x₃)
  have hsq_x3O := dist_sq_coords (T x₃) (T S.Packet.center)
  rw [h2x, h2y] at hsq_v2v3 hsq_v2x3
  rw [h1x, h1y] at hsq_v1v3
  rw [hOx] at hsq_x3O
  rw [hpin_frame] at hsq_v2x3
  set X := (T S.triangle.v3) 0
  set Y := (T S.triangle.v3) 1
  set xx := (T x₃) 0
  set yy := (T x₃) 1
  set Oy := (T S.Packet.center) 1
  set sh := dist (T S.triangle.v2) (T S.triangle.v3)
  set dv3x3 := dist (T S.triangle.v3) (T x₃)
  set dv1v3 := dist (T S.triangle.v1) (T S.triangle.v3)
  have hsdef : (X - 1) ^ 2 + Y ^ 2 = sh ^ 2 := by linarith [hsq_v2v3]
  have hcirc : (xx - 1) ^ 2 + yy ^ 2 = sh ^ 2 := by linarith [hsq_v2x3]
  have hl : 1 < X ^ 2 + Y ^ 2 := by rw [hsq_v1v3] at hv13_gt_sq; linarith [hv13_gt_sq]
  have hdisk : (xx - 1 / 2) ^ 2 + (yy - Oy) ^ 2 ≤ 1 / 4 + Oy ^ 2 := by
    rw [hsq_x3O] at hdisk_x3; linarith [hdisk_x3]
  have hconc : sh ^ 2 < (X - xx) ^ 2 + (Y - yy) ^ 2 :=
    pinclash_scalar sh X Y xx yy Oy hsh_pos hs1 hsdef hcirc hv3y_pos hyy_le hOy_nonneg hdisk hl
  rw [← hsq_v3x3] at hconc
  linarith [hconc, hclash_lt_sq]

namespace FiniteEndpointShell

/-- Feed the named `C₃`/`C₁` representatives into the pin-clash core.  Reads off
the double-pin (`dist v₂ x₃ = dist v₂ v₃`, `dist v₃ x₃ = dist v₃ p = t`), the
`ℓ̂ > 1` fact (`dist v₁ a₂ = r = dist v₁ v₂ < dist v₁ v₃`), and the radius bound
(`dist v₂ v₃ < dist v₂ v₁`) and routes them through `pinclash_core`. -/
private theorem pinclash_from_reps
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hA2 : (Z.a2 : ℝ²) ∈ S.I2)
    (hA2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²))
    (hv3C1 : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 t)
    {x₃ : ℝ²} (hx3I3 : x₃ ∈ S.I3) (hx3T2 : x₃ ∈ S.witnessClassAt_v2 s)
    {p : ℝ²} (hpI1 : p ∈ S.I1) (hpT3 : p ∈ S.witnessClassAt_v3 t) :
    False := by
  classical
  have hx3A : x₃ ∈ A :=
    S.CP.C3_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp hx3I3).2).2)
  have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hv3C1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hd_v2v3 : dist S.triangle.v2 S.triangle.v3 = s := (Finset.mem_filter.mp hv3T2).2
  have hd_v2x3 : dist S.triangle.v2 x₃ = s := (Finset.mem_filter.mp hx3T2).2
  have hv2pin : dist S.triangle.v2 x₃ = dist S.triangle.v2 S.triangle.v3 := by
    rw [hd_v2x3, hd_v2v3]
  have hx3T3 : x₃ ∈ S.witnessClassAt_v3 t := hI3sub hx3I3
  have hd_v3x3 : dist S.triangle.v3 x₃ = t := (Finset.mem_filter.mp hx3T3).2
  have hd_v3p : dist S.triangle.v3 p = t := (Finset.mem_filter.mp hpT3).2
  have hclash : dist S.triangle.v3 x₃ < dist S.triangle.v3 S.triangle.v2 := by
    rw [hd_v3x3, ← hd_v3p]
    exact v3_lt_v3v2_of_mem_I1 S hpI1
  have hd_v1a2 : dist S.triangle.v1 Z.a2 = r := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← hA2eq] at hmem
      exact (Finset.mem_inter.mp hmem).1
    exact (Finset.mem_filter.mp ha2T1).2
  have hd_v1v2 : dist S.triangle.v1 S.triangle.v2 = r := by
    rcases hB with ⟨y, hyI2, hyC2, hv2eq⟩
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hmem
      exact (Finset.mem_inter.mp hmem).1
    exact (Finset.mem_filter.mp hv2T1).2
  have hell : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    rw [hd_v1v2, ← hd_v1a2]
    exact v1_lt_v1v3_of_mem_I2 S hA2
  have hs1orig : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1 := by
    rw [← hv2pin]
    exact v2_lt_v2v1_of_mem_I3 S hx3I3
  exact pinclash_core S hx3I3 hx3A hv2pin hclash hell hs1orig

end FiniteEndpointShell

/-- **The q'=E `b₂` pin-clash closer.**  Same signature as
`qEqE_b2_freeRb_residual_false`.  The `S(v₂)∩C₃` representative `x₃ ∈ {a₃, b₃}`
is double-pinned (`circle(v₂, |v₂v₃|)` and `I₃`), and shares its `v₃`-radius
with the named `C₁`-witness `p ∈ {a₁, b₁}`; the resulting clash contradicts the
faithful-frame geometry. -/
theorem qEqE_b2_column_pinclash_false
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : FiniteEndpointShell.ZeroDefectCapLayout S)
    {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic S Z r s)
    (hpacket3 : FiniteEndpointShell.SelectorV3Qb2PacketPublic S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, hA2eq, -, -, hv3C1, hC3choice⟩
  rcases hpacket3 with ⟨hI3sub, p, hp, hpC1, -⟩
  have hpI1 : p ∈ S.I1 := by rw [Z.hI1]; exact hp
  have hpT3 : p ∈ S.witnessClassAt_v3 t := by
    have hmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpC1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  rcases hC3choice with ha3C3 | hb3C3
  · have hx3T2 : (Z.a3 : ℝ²) ∈ S.witnessClassAt_v2 s := by
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← ha3C3] at hmem
      exact (Finset.mem_inter.mp hmem).1
    have hx3I3 : (Z.a3 : ℝ²) ∈ S.I3 := by rw [Z.hI3]; simp
    exact FiniteEndpointShell.pinclash_from_reps Z hB hA2 hA2eq hv3C1 hI3sub
      hx3I3 hx3T2 hpI1 hpT3
  · have hx3T2 : (Z.b3 : ℝ²) ∈ S.witnessClassAt_v2 s := by
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hb3C3] at hmem
      exact (Finset.mem_inter.mp hmem).1
    have hx3I3 : (Z.b3 : ℝ²) ∈ S.I3 := by rw [Z.hI3]; simp
    exact FiniteEndpointShell.pinclash_from_reps Z hB hA2 hA2eq hv3C1 hI3sub
      hx3I3 hx3T2 hpI1 hpT3

end Problem97
