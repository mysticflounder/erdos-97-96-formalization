import Erdos9796Proof.P97.N4dFormCPEqCProducer
import Erdos9796Proof.P97.N4dFormCLowerForcesV2

/-!
# `N4d` Form-`c`, `q' = C` producer

Cycle-free producer for the `y = a3`, lower-side `q' = C` column.  The proof
locally mirrors the private Form-`b` reflection machinery under the swap
`C2 ↔ C3`, `v2 ↔ v3`, `I2 ↔ I3`, `a2 ↔ a3`, `b2 ↔ b3`.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97
namespace FiniteEndpointShell

/-- Any `I₂` vertex lies strictly before the far endpoint `v₃` in the
`v₁`-radial order on support cap `C₂`. -/
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

/-- Any `I₃` vertex lies strictly before the far endpoint `v₂` in the
`v₁`-radial order on support cap `C₃`. -/
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
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
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
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v2 := hLastFirst.1
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

/-- Interior points of `I₂` lie on the second opposite cap. -/
private theorem mem_C2_of_mem_I2_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ S.CP.C2 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)

/-- Interior points of `I₃` lie on the third opposite cap. -/
private theorem mem_C3_of_mem_I3_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I3) :
    x ∈ S.CP.C3 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)

/-- `I₂` points lie in `A`. -/
private theorem mem_A_of_mem_I2_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ A :=
  S.CP.C2_subset (mem_C2_of_mem_I2_local hx)

/-- `I₂` excludes the three Moser vertices. -/
private theorem not_triangle_of_mem_I2_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∉ S.triangle.verts := by
  have hxv1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hx).1
  have hxv3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hx).2).1
  have hxC2 : x ∈ S.CP.C2 := mem_C2_of_mem_I2_local hx
  have hxv2 : x ≠ S.triangle.v2 := by
    intro h
    exact S.CP.v2_notin_C2 (h ▸ hxC2)
  simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]

/-- Interior points from `I₂` and `I₃` are distinct. -/
private theorem ne_of_mem_I2_of_mem_I3_local {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x y : ℝ²} (hx : x ∈ S.I2) (hy : y ∈ S.I3) :
    x ≠ y := by
  intro hxy
  have hxA : x ∈ A := mem_A_of_mem_I2_local hx
  have hxnon : x ∉ S.triangle.verts := not_triangle_of_mem_I2_local hx
  have hxC2 : x ∈ S.CP.C2 := mem_C2_of_mem_I2_local hx
  have hxC3 : x ∈ S.CP.C3 := by simpa [hxy] using mem_C3_of_mem_I3_local hy
  have hone := S.CP.nonmoser_in_one x hxA hxnon
  by_cases hxC1 : x ∈ S.CP.C1
  · simp [hxC1, hxC2, hxC3] at hone
  · simp [hxC1, hxC2, hxC3] at hone

private theorem c3_sameSide_core (p q s t c : ℝ)
    (hCT : 0 ≤ c * t)
    (hARC : t * (2 * p * t - 2 * q * s - q + t) < 0)
    (hD : p ^ 2 + q ^ 2 ≤ 1 / 4 + 2 * c * q)
    (hC : 8 * c * t = 4 * s ^ 2 + 4 * t ^ 2 - 1) :
    0 < q * t := by
  rcases lt_trichotomy t 0 with ht | ht | ht
  · have hc : c ≤ 0 := by nlinarith [hCT, ht]
    have hARC' : 0 < 2 * p * t - 2 * q * s - q + t := by
      by_contra h; push_neg at h
      nlinarith [mul_nonpos_of_nonpos_of_nonneg
        (by linarith : (2 * p * t - 2 * q * s - q + t) ≤ 0)
        (by linarith : (0 : ℝ) ≤ -t), hARC]
    by_contra hcon; push_neg at hcon
    have hcon' : 0 ≤ q := by nlinarith [ht]
    nlinarith [ht, hc, hARC', hD, hC,
      mul_nonneg (neg_nonneg.mpr ht.le) (neg_nonneg.mpr hc), sq_nonneg (p - s),
      mul_nonneg hcon' (neg_nonneg.mpr ht.le),
      mul_nonneg hcon' (neg_nonneg.mpr hc),
      sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]
  · exfalso; rw [ht] at hARC; simp at hARC
  · have hc : 0 ≤ c := by nlinarith [hCT, ht]
    have hARC' : 2 * p * t - 2 * q * s - q + t < 0 := by
      by_contra h; push_neg at h
      nlinarith [mul_nonneg h (le_of_lt ht), hARC]
    by_contra hcon; push_neg at hcon
    have hcon' : q ≤ 0 := by nlinarith [ht]
    nlinarith [ht, hc, hARC', hD, hC,
      mul_nonneg ht.le hc, sq_nonneg (p - s),
      mul_nonneg (neg_nonneg.mpr hcon') (le_of_lt ht),
      mul_nonneg (neg_nonneg.mpr hcon') hc,
      sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]

set_option maxHeartbeats 4000000 in
/-- **`C₃` cap vertices lie on the same open side of the base chord `v₁v₃`
as the apex `v₂` — selector-independent form.**

Unlike `C2_same_open_side_of_base_chord_as_v3`, which pins the candidate via
the exact `v₃`-selector packet (`|v₃a₃| = |v₃v₂| = |v₁v₃|`), this version uses
only that `a₃` is a vertex of the cap `C₃`.  The cap-membership invariant
(`CapTriple.arc_membership`) places `a₃` on the closed MEC arc opposite `v₃`
across the chord `v₂v₁`; convex-independence of `A` upgrades this to the strict
open side; the circumscribed-MEC packet (disk containment, non-obtuse apex at
`v₂`) then forces `a₃` strictly onto `v₂`'s side of `v₁v₃`.  No
`ZeroDefectCapLayout`, selector packet, or exact equidistance hypothesis is
required, so the conclusion serves both the lower (`v₁ ∉ S(v₃)`) and upper
residual branches of the `q' = C` column.

The heartbeat budget is raised because the proof carries the full chord-frame
coordinate scaffolding plus several `nlinarith` certificate searches. -/
private theorem c3_vertex_same_open_side_as_v2_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {a₃ : ℝ²}
    (ha2 : a₃ ∈ S.I3) :
    0 < signedArea2 a₃ S.triangle.v1 S.triangle.v3 *
      signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v3
  let q3 : ℝ² := S.triangle.v2
  let a : ℝ² := a₃
  let center : ℝ² := S.Packet.center
  -- Decompose the open-cap membership `a₃ ∈ I2 = (C₃.erase v₂).erase v₁`.
  have haC2 : a ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).2
  have ha_ne_v1 : a ≠ q1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).1
  have ha_ne_v3 : a ≠ q3 := (Finset.mem_erase.mp ha2).1
  have haA : a ∈ A := S.CP.C3_subset haC2
  -- Cap membership ⇒ `a` on the closed arc opposite `v₃` across chord `v₂v₁`.
  have harc_le :
      signedArea2 a q3 q1 * signedArea2 q2 q3 q1 ≤ 0 := by
    have hraw : signedArea2 a q1 q3 * signedArea2 q2 q1 q3 ≤ 0 :=
      (S.CP.arc_membership a haA).2.2.1 haC2
    have hswap_a : signedArea2 a q3 q1 = -signedArea2 a q1 q3 := by
      unfold Problem97.signedArea2
      ring
    have hswap_q2 : signedArea2 q2 q3 q1 = -signedArea2 q2 q1 q3 := by
      unfold Problem97.signedArea2
      ring
    rw [hswap_a, hswap_q2]
    simpa using hraw
  -- Convex-independence: `a, v₂, v₁` are not collinear, so `signedArea2 a v₂ v₁ ≠ 0`.
  have hav3v1_ne : signedArea2 a q3 q1 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a, q3, q1} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a q3 q1 hΔ
    have hconv : ConvexIndep A := S.hconv
    have h3A : q3 ∈ A := S.triangle.v2_mem
    have h1A : q1 ∈ A := S.triangle.v1_mem
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    · -- Wbtw a q3 q1 : q3 ∈ segment a q1 ⊆ convexHull (A \ {q3}).
      apply hconv q3 (by exact_mod_cast h3A)
      have hseg : q3 ∈ segment ℝ a q1 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v12_ne h⟩
    · -- Wbtw q3 q1 a : q1 ∈ segment q3 a ⊆ convexHull (A \ {q1}).
      apply hconv q1 (by exact_mod_cast h1A)
      have hseg : q1 ∈ segment ℝ q3 a := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v12_ne h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h⟩
    · -- Wbtw q1 a q3 : a ∈ segment q1 q3 ⊆ convexHull (A \ {a}).
      apply hconv a (by exact_mod_cast haA)
      have hseg : a ∈ segment ℝ q1 q3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h.symm⟩
  have hv2v3v1_ne : signedArea2 q2 q3 q1 ≠ 0 := by
    have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_1
    have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_3
    have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_2
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_eq_norm] using hv2O)
      (by simpa [dist_eq_norm] using hv3O)
      (by simpa [dist_eq_norm] using hv1O)
      S.triangle.v23_ne.symm S.triangle.v12_ne.symm S.triangle.v13_ne.symm
  -- Hence the arc product is *strictly* negative.
  have harc : signedArea2 a q3 q1 * signedArea2 q2 q3 q1 < 0 :=
    lt_of_le_of_ne harc_le (mul_ne_zero hav3v1_ne hv2v3v1_ne)
  -- ===== Chord frame on `v₁v₃` (selector-independent scaffolding). =====
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v13_ne.symm
  let u : ℝ² := q2 - q1
  let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
  let β := Problem97.stdOrientation.basisRightAngleRotation u hu
  let M : ℝ² := midpoint ℝ q1 q2
  let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
  let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
  let yc : ℝ := Y center
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
  have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
    simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
  have horth : inner ℝ u nvec = 0 := by
    simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
  have harea_u_left : ∀ r : ℝ, Problem97.stdOrientation.areaForm u (r • u) = 0 := by
    intro r; rw [map_smul]; simp
  have harea_u_right : ∀ r : ℝ,
      Problem97.stdOrientation.areaForm u (r • nvec) = r * ‖u‖ ^ 2 := by
    intro r; rw [map_smul]
    simp [nvec, Orientation.areaForm_rightAngleRotation_right]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  -- Difference of two points in frame coordinates.
  have hdiff : ∀ z w : ℝ², z - w = (X z - X w) • u + (Y z - Y w) • nvec := by
    intro z w
    have : (z - M) - (w - M) = z - w := by abel
    rw [← this, hsum_pt z, hsum_pt w, sub_smul, sub_smul]; abel
  -- General signed area in frame coordinates.
  have hun : Problem97.stdOrientation.areaForm u nvec = ‖u‖ ^ 2 := by
    simpa using harea_u_right 1
  have hnu : Problem97.stdOrientation.areaForm nvec u = -‖u‖ ^ 2 := by
    rw [Problem97.stdOrientation.areaForm_swap, hun]
  have huu : Problem97.stdOrientation.areaForm u u = 0 := by
    simpa using harea_u_left 1
  have hnn : Problem97.stdOrientation.areaForm nvec nvec = 0 := by simp
  have harea_bilin : ∀ xa ya xb yb : ℝ,
      Problem97.stdOrientation.areaForm (xa • u + ya • nvec) (xb • u + yb • nvec)
        = (xa * yb - ya * xb) * ‖u‖ ^ 2 := by
    intro xa ya xb yb
    simp only [map_add, LinearMap.add_apply, map_smul, LinearMap.smul_apply,
      smul_eq_mul, huu, hun, hnu, hnn]
    ring
  have harea_gen : ∀ z w x : ℝ²,
      signedArea2 z w x =
        ((X w - X z) * (Y x - Y z) - (Y w - Y z) * (X x - X z)) * ‖u‖ ^ 2 := by
    intro z w x
    rw [Problem97.signedArea2_eq_stdOrientation_areaForm, hdiff w z, hdiff x z,
        harea_bilin]
  -- Center perp-bisector: `X center = 0`.
  have hXc : X center = 0 := by
    have hdist_eq : dist center q1 = dist center q2 := by
      rw [dist_comm center q1, dist_comm center q2]
      simpa [q1, q2] using
        S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_3.symm
    have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
      rw [AffineSubspace.mem_perpBisector_iff_dist_eq]; simpa using hdist_eq
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have h := (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
        (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
    have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
      calc
        inner ℝ (center - M) u
            = inner ℝ (X center • u + Y center • nvec) u := by rw [hsum_pt center]
        _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_add_left, inner_smul_left, inner_smul_left,
                real_inner_self_eq_norm_sq, horth_rev]; simp
        _ = X center * ‖u‖ ^ 2 := by ring
    rw [hcenter_perp] at hinner
    have hprod : X center * ‖u‖ ^ 2 = 0 := hinner.symm
    rcases mul_eq_zero.mp hprod with h | h
    · exact h
    · exact absurd h (ne_of_gt hu_sq_pos)
  -- Frame `X`/`Y` of `v₁` and `v₃`.
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simpa [M] using (left_sub_midpoint ℝ q1 q2)
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by dsimp [u]; abel_nf]; simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hX_q2 : X q2 = (1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq2mid
    change X q2 = (β.repr ((1 / 2 : ℝ) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q2 : Y q2 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq2mid
    change Y q2 = (β.repr ((1 / 2 : ℝ) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  -- Squared distances in frame coordinates.
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    rw [hdiff z center, hXc]; simp [yc]
  have hdist_sq_coeff :
      ∀ x y : ℝ, ‖x • u + y • nvec‖ ^ 2 = (x ^ 2 + y ^ 2) * ‖u‖ ^ 2 := by
    intro x y
    have horth' : inner ℝ (x • u) (y • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]; ring
    have hnorm : ‖x • u + y • nvec‖ ^ 2 = ‖x • u‖ ^ 2 + ‖y • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (x • u) (y • nvec) horth'
    have hu_part : ‖x • u‖ ^ 2 = x ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
    have hn_part : ‖y • nvec‖ ^ 2 = y ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, hnorm_nvec, mul_pow, sq_abs]
    rw [hnorm, hu_part, hn_part]; ring
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  -- `v₂` on the MEC, `a` in the disk, expressed via frame coordinates.
  have hradius_sq : S.Packet.radius ^ 2 = ((1 / 4 : ℝ) + yc ^ 2) * ‖u‖ ^ 2 := by
    have hr : dist center q1 = S.Packet.radius := by
      rw [dist_comm]; simpa [q1, center] using S.Packet.moser_on_boundary_1
    have := hdist_center_sq q1
    rw [hr, hX_q1, hY_q1] at this
    rw [this]; ring
  have hC1 : 8 * yc * Y q3 = 4 * (X q3) ^ 2 + 4 * (Y q3) ^ 2 - 1 := by
    have hr : dist center q3 = S.Packet.radius := by
      rw [dist_comm]; simpa [q3, center] using S.Packet.moser_on_boundary_2
    have h := hdist_center_sq q3
    rw [hr, hradius_sq] at h
    have hcancel : (X q3) ^ 2 + (Y q3 - yc) ^ 2 = (1 / 4 : ℝ) + yc ^ 2 :=
      (mul_right_cancel₀ (ne_of_gt hu_sq_pos) h).symm
    nlinarith [hcancel]
  have hD : (X a) ^ 2 + (Y a) ^ 2 ≤ 1 / 4 + 2 * yc * Y a := by
    have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
      simpa [center] using S.Packet.disk_contains_A a haA
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      rw [dist_eq_norm, norm_sub_rev]; exact hdisk_a'
    have hsq : dist center a ^ 2 ≤ S.Packet.radius ^ 2 := by
      have h0 : 0 ≤ dist center a := dist_nonneg
      have h1 : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      nlinarith [hdisk_a, h0, h1]
    rw [hdist_center_sq a, hradius_sq] at hsq
    have hsq' : (X a) ^ 2 + (Y a - yc) ^ 2 ≤ (1 / 4 : ℝ) + yc ^ 2 :=
      le_of_mul_le_mul_right (by linarith [hsq]) hu_sq_pos
    nlinarith [hsq']
  -- Frame area of the center and of `v₂` on the chord `v₁v₃`.
  have hca : signedArea2 center q1 q2 = yc * ‖u‖ ^ 2 := by
    have hyc : Y center = yc := rfl
    rw [harea_gen center q1 q2, hX_q1, hY_q1, hX_q2, hY_q2, hXc, hyc]; ring
  have hc3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  -- Center on the *closed* same side as the non-obtuse apex `v₂` (selector-free).
  have hcenter_q3 : 0 ≤ yc * Y q3 := by
    have hq1O : ‖q1 - center‖ = S.Packet.radius := by
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hq2O : ‖q2 - center‖ = S.Packet.radius := by
      simpa [q2, center] using S.Packet.moser_on_boundary_3
    have hq3O : ‖q3 - center‖ = S.Packet.radius := by
      simpa [q3, center] using S.Packet.moser_on_boundary_2
    have hinn : inner ℝ (q1 - q3) (q2 - q3) ≥ 0 := by
      simpa [q1, q2, q3, real_inner_comm] using S.Packet.inner_at_v2
    have hprod :
        signedArea2 center q1 q2 * signedArea2 q3 q1 q2 ≥ 0 :=
      center_same_side_as_apex_of_nonobtuse hq1O hq2O hq3O hinn
    rw [hca, hc3] at hprod
    have hpos : 0 < ‖u‖ ^ 2 * ‖u‖ ^ 2 := mul_pos hu_sq_pos hu_sq_pos
    nlinarith [hprod, hpos]
  -- Arc product in frame coordinates ⇒ the `hARC` premise of the core lemma.
  have hARC : Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3) < 0 := by
    have hf1 : signedArea2 a q3 q1 =
        ((X q3 - X a) * (Y q1 - Y a) - (Y q3 - Y a) * (X q1 - X a)) * ‖u‖ ^ 2 :=
      harea_gen a q3 q1
    have hf2 : signedArea2 q2 q3 q1 =
        ((X q3 - X q2) * (Y q1 - Y q2) - (Y q3 - Y q2) * (X q1 - X q2)) * ‖u‖ ^ 2 :=
      harea_gen q2 q3 q1
    rw [hf1, hf2, hX_q1, hY_q1, hX_q2, hY_q2] at harc
    have hexpand :
        ((X q3 - X a) * (0 - Y a) - (Y q3 - Y a) * (-(1 / 2) - X a)) * ‖u‖ ^ 2 *
          (((X q3 - (1 / 2)) * (0 - 0) - (Y q3 - 0) * (-(1 / 2) - (1 / 2))) * ‖u‖ ^ 2)
        = (Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3)) *
            ((1 / 2) * (‖u‖ ^ 2 * ‖u‖ ^ 2)) := by ring
    rw [hexpand] at harc
    have hpos : 0 < (1 / 2 : ℝ) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by positivity
    nlinarith [harc, hpos]
  -- Apply the core scalar inequality.
  have hcore : 0 < Y a * Y q3 :=
    c3_sameSide_core (X a) (Y a) (X q3) (Y q3) yc hcenter_q3 hARC hD hC1
  -- Translate back to signed areas.
  have hsa_a : signedArea2 a q1 q2 = Y a * ‖u‖ ^ 2 := by
    rw [harea_gen a q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hsa_3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  change 0 < signedArea2 a q1 q2 * signedArea2 q3 q1 q2
  rw [hsa_a, hsa_3]
  have : Y a * ‖u‖ ^ 2 * (Y q3 * ‖u‖ ^ 2) = (Y a * Y q3) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by ring
  rw [this]
  exact mul_pos hcore (mul_pos hu_sq_pos hu_sq_pos)

private theorem dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

private theorem signedArea2_baseChord_vec2 (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 (-1) 0) (Problem97.CGN.vec2 1 0) = 2 * p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring

private noncomputable def similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring

private noncomputable def halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)

private theorem halfShift_injective : Function.Injective halfShift := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h

private noncomputable def halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (halfShift a) (halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        halfShift a - halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith
  · intro S a
    have hmap : halfShift '' convexHull ℝ S = convexHull ℝ (halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show halfShift a ∈ halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring

private noncomputable def flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)

private theorem flipY_injective : Function.Injective flipY := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h

private noncomputable def flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (flipY a) (flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖flipY a - flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖flipY a - flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : flipY '' convexHull ℝ S = convexHull ℝ (flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show flipY a ∈ flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring

private theorem exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  classical
  let A2 : Finset ℝ² := ({q1, q2} : Finset ℝ²)
  let L2 : Problem97.CGN.OrderedCap 2 :=
    { points := ![q1, q2]
      injective := by
        intro i j hij
        fin_cases i <;> fin_cases j
        · rfl
        · exfalso
          exact hqne hij
        · exfalso
          exact hqne hij.symm
        · rfl }
  let P2 : Problem97.CGN.MecCapPacket A2 L2 :=
    { hm := by norm_num
      center := midpoint ℝ q1 q2
      radius := dist q1 q2 / 2
      radius_nonneg := by positivity
      mem_A := by
        intro t
        fin_cases t <;> simp [A2, L2]
      disk_mem := by
        intro t
        fin_cases t
        · simpa [L2, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_left (𝕜 := ℝ) q1 q2)))
        · simpa [L2, dist_comm, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_right (𝕜 := ℝ) q1 q2)))
      first_on_circle := by
        simpa [L2, Problem97.CGN.firstIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_left_midpoint (𝕜 := ℝ) q1 q2)
      last_on_circle := by
        simpa [L2, Problem97.CGN.lastIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_right_midpoint (𝕜 := ℝ) q1 q2) }
  let Hside2 : Problem97.CGN.MinorCapSideHypotheses P2 :=
    { cap_side_nonneg := by
        intro t
        fin_cases t <;> simp [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2]
      center_side_nonpos := by
        simp [P2, L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2, midpoint_eq_smul_add]
        linarith }
  let Hord2 : Problem97.CGN.StrictCapOrder A2 L2 :=
    { hm := by norm_num
      consecutive_turn_nonpos := by
        intro t ht
        omega
      chord_projection_strict := by
        intro i j hij
        have hijval : i.val < j.val := Fin.lt_def.mp hij
        fin_cases i <;> fin_cases j
        · exfalso
          exact Nat.lt_irrefl 0 hijval
        · simpa [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, real_inner_self_eq_norm_sq] using
            sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr hqne.symm))
        · exfalso
          exact Nat.not_lt_zero 1 hijval
        · exfalso
          exact Nat.lt_irrefl 1 hijval
      subchord_open_side_iff_A := by
        intro r s hrs x hxA
        have hrsval : r.val < s.val := Fin.lt_def.mp hrs
        fin_cases r <;> fin_cases s
        · exfalso
          exact Nat.lt_irrefl 0 hrsval
        · constructor
          · intro hx
            exfalso
            simp [A2] at hxA
            rcases hxA with rfl | rfl
            · simp [L2, Problem97.signedArea2] at hx
            · simp [L2, Problem97.signedArea2] at hx
          · intro hx
            rcases hx with ⟨j, hrj, hjs, _⟩
            fin_cases j <;> omega
        · exfalso
          exact Nat.not_lt_zero 1 hrsval
        · exfalso
          exact Nat.lt_irrefl 1 hrsval }
  rcases Problem97.CGN.CGN6norm_minorCapChainModel_of_mecCapPacket P2 Hside2 Hord2 with
    ⟨T0, hT0, tau0, hModel⟩
  let LT0 : Problem97.CGN.OrderedCap 2 := L2.map T0 hT0
  let M0 : Problem97.CGN.MinorCapChainModel LT0 := Classical.choice hModel
  refine ⟨T0, tau0, ?_, ?_⟩
  · have hpt := M0.points_eq (Problem97.CGN.firstIndex (by norm_num : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q1) 0 = M0.coords.X (Problem97.CGN.firstIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = -1 := M0.coords.X_first
        _ = (Problem97.CGN.vec2 (-1) 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q1) 1 = M0.coords.Y (Problem97.CGN.firstIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_first
        _ = (Problem97.CGN.vec2 (-1) 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  · have hpt := M0.points_eq (Problem97.CGN.lastIndex (by norm_num : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q2) 0 = M0.coords.X (Problem97.CGN.lastIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = 1 := M0.coords.X_last
        _ = (Problem97.CGN.vec2 1 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q2) 1 = M0.coords.Y (Problem97.CGN.lastIndex (by norm_num : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_last
        _ = (Problem97.CGN.vec2 1 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem qEqC_reflection_below_contradiction_v13
    (r θ δ : ℝ) (hr : 0 < r)
    (hcosθ : Real.cos θ = -(r / 2)) (hsinθ : 0 < Real.sin θ)
    (hθ0 : 0 ≤ θ) (hθπ : θ ≤ Real.pi)
    (hcosδ : -(r / 2) < Real.cos δ) (hsinδ : 0 < Real.sin δ)
    (hδ0 : 0 ≤ δ) (hδπ : δ ≤ Real.pi)
    (hqbelow : Real.sin (2 * δ - θ) < 0)
    (hAq : Real.cos (2 * δ - θ) < -(r / 2)) : False := by
  -- `δ > 0`: `sin δ > 0` rules out `δ = 0`.
  have hδpos : 0 < δ := by
    rcases lt_or_eq_of_le hδ0 with h | h
    · exact h
    · exfalso; rw [← h, Real.sin_zero] at hsinδ; exact lt_irrefl _ hsinδ
  -- `δ < θ` from `cos δ > cos θ` with both angles in `[0, π]`.
  have hδ_lt_θ : δ < θ := by
    rcases lt_trichotomy δ θ with hlt | heq | hgt
    · exact hlt
    · exfalso; rw [heq, hcosθ] at hcosδ; exact lt_irrefl _ hcosδ
    · exfalso
      have hcc := Real.cos_lt_cos_of_nonneg_of_le_pi hθ0 hδπ hgt
      rw [hcosθ] at hcc
      linarith [hcc, hcosδ]
  -- `w := 2δ - θ` lies in `(-π, π)`.
  set w : ℝ := 2 * δ - θ with hw_def
  have hw_lo : -Real.pi < w := by rw [hw_def]; linarith [hδpos, hθπ]
  have hw_hi : w < Real.pi := by rw [hw_def]; linarith [hδ_lt_θ, hθπ]
  -- `sin w < 0` forces `w < 0`.
  have hw_neg : w < 0 := by
    by_contra hge
    push_neg at hge
    exact absurd (Real.sin_nonneg_of_nonneg_of_le_pi hge (le_of_lt hw_hi))
      (not_le.mpr hqbelow)
  -- `-w = θ - 2δ ∈ (0, θ)`, so `cos w = cos(-w) > cos θ = -r/2`.
  have hneg_w_lo : 0 ≤ -w := by linarith [hw_neg]
  have hneg_w_lt : -w < θ := by rw [hw_def]; linarith [hδpos]
  have hcos_gt : Real.cos θ < Real.cos (-w) :=
    Real.cos_lt_cos_of_nonneg_of_le_pi hneg_w_lo hθπ hneg_w_lt
  rw [Real.cos_neg] at hcos_gt
  rw [hcosθ] at hcos_gt
  linarith [hAq, hcos_gt]

/-- Branch-local normalized configuration packet for the `q'=C`, `p' ∈ {a₁,b₁}`
reflection-side rows.

After a similarity transport `T` (placing `A=v₁ ↦ (0,0)`, `B=v₃ ↦ (1,0)`), the
exact upper cap-apex `C` over `AB` has polar angle `θ` about `B` with
`\cos θ = -r/2`, `\sin θ > 0`; the upper far apex `D` (`|AD| > 1`) has polar
angle `δ` about `B` with `\cos δ > -r/2`, `\sin δ > 0`; and the lower witness
`q`, being the reflection of `C` across line `BD`, sits at polar angle `2δ - θ`,
i.e.

```text
T q = (1 + r \cos(2δ - θ), r \sin(2δ - θ)),    \sin(2δ - θ) < 0.
```

This is exactly the data the coordinate contradiction
`qEqC_reflection_below_contradiction_v13` consumes once the lower-chain cap order
`|v₁q| < |v₁v₃| = 1` is supplied (which converts to `\cos(2δ - θ) < -r/2`). -/
abbrev QEqCReflectionConfigV13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (q : ℝ²) (r : ℝ) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ _tau : Problem97.CGN.SimilarityTransportData T, ∃ θ δ : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v3 = Problem97.CGN.vec2 1 0 ∧
    0 < r ∧
    Real.cos θ = -(r / 2) ∧ 0 < Real.sin θ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
    -(r / 2) < Real.cos δ ∧ 0 < Real.sin δ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
    T q =
      Problem97.CGN.vec2
        (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) ∧
    Real.sin (2 * δ - θ) < 0

/-- Consumer step for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows: once the
lower witness `q` is presented in the prose-normalized reflection frame
(`QEqCReflectionConfigV13`), the lower-chain cap order `|v₁q| < |v₁v₃|` is
impossible.  This is a pure consumer of the cosine-monotonicity contradiction;
it replays no geometry beyond similarity-distance preservation. -/
theorem qEqC_row_impossible_of_normalized_config_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hconfig : S.QEqCReflectionConfigV13 q r)
    (hcap : dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v3) :
    False := by
  rcases hconfig with
    ⟨T, tau, θ, δ, hv1, hv2, hr, hcosθ, hsinθ, hθ0, hθπ,
      hcosδ, hsinδ, hδ0, hδπ, hqT, hqbelow⟩
  -- Transport the cap order to the normalized frame.
  have hcapT : dist (T S.triangle.v1) (T q) < dist (T S.triangle.v1) (T S.triangle.v3) := by
    rw [tau.dist_image, tau.dist_image]
    have hscale : 0 < tau.scale := tau.scale_pos
    nlinarith [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q),
      dist_nonneg (x := S.triangle.v1) (y := S.triangle.v3)]
  -- `|T v₁ T v₃| = 1` and `|T v₁ T q|² = 1 + 2 r cos(2δ-θ) + r²`.
  have hAB1 : dist (T S.triangle.v1) (T S.triangle.v3) = 1 := by
    rw [hv1, hv2, dist_eq_norm]
    have hvec :
        Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
      ext i <;> fin_cases i <;>
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [hvec, EuclideanSpace.norm_eq]
    norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist (T S.triangle.v1) (T q) ^ 2
      = 1 + 2 * r * Real.cos (2 * δ - θ) + r ^ 2 := by
    rw [hv1, hqT, dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith [Real.sin_sq_add_cos_sq (2 * δ - θ)]
  -- Convert the cap order into `cos(2δ-θ) < -r/2`.
  have hAq : Real.cos (2 * δ - θ) < -(r / 2) := by
    rw [hAB1] at hcapT
    have hAq_nonneg : 0 ≤ dist (T S.triangle.v1) (T q) := dist_nonneg
    nlinarith [hcapT, hAq_sq, hAq_nonneg, hr]
  exact qEqC_reflection_below_contradiction_v13 r θ δ hr hcosθ hsinθ hθ0 hθπ
    hcosδ hsinδ hδ0 hδπ hqbelow hAq

/-- Row-level closure for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows
(`N4d-bA2c-D5`, `N4d-bA2c-D6`, `N4d-bA3c-D5`, `N4d-bA3c-D6`).

The lower witness `q` of such a row lies in `I₂`, so the support-cap distance
order on `C₂` supplies the cap inequality `|v₁q| < |v₁v₃|` automatically.
Combined with the prose-normalized reflection configuration
`QEqCReflectionConfigV13`, the cosine-monotonicity contradiction
`qEqC_row_impossible_of_normalized_config_v13` closes the row. -/
theorem qEqC_row_impossible_of_lower_witness_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI3 : q ∈ S.I2)
    (hconfig : S.QEqCReflectionConfigV13 q r) :
    False :=
  S.qEqC_row_impossible_of_normalized_config_v13 hconfig
    (v1_lt_v1v3_of_mem_I2_local S hqI3)

/-- Reflection-angle coordinate core for the `q'=C` producer.

In the normalized frame `A=(0,0)`, `B=(1,0)`, the points `C`, `D`, `q` all lie on
the circle of radius `r` about `B`:

* `C = (1 + r\cosθ, r\sinθ)` is the exact upper cap-apex (`\cosθ = -r/2`,
  `\sinθ > 0`),
* `D = (1 + r\cosδ, r\sinδ)` is the upper far apex (`\sinδ > 0`, `\cosδ > -r/2`),
* `q = (1 + r c_η, r s_η)` with `c_η² + s_η² = 1`, `s_η < 0` (q below `AB`).

The single geometric input is that `q` lies on the same `D`-centered circle as
`C` (the radical condition `c_η\cosδ + s_η\sinδ = \cosθ\cosδ + \sinθ\sinδ`) and
`q ≠ C`.  Then `q` is the reflection of `C` across line `BD`, i.e.
`c_η = \cos(2δ-θ)` and `s_η = \sin(2δ-θ)`.

The output is exactly the trigonometric data of `QEqCReflectionConfigV13`. -/
private theorem qEqC_reflection_coords_v13
    (r cθ sθ cδ sδ cη sη : ℝ) (hr : 0 < r)
    (hcθ : cθ = -(r / 2)) (hsθ : 0 < sθ) (hθpyth : cθ ^ 2 + sθ ^ 2 = 1)
    (hcδ : -(r / 2) < cδ) (hsδ : 0 < sδ) (hδpyth : cδ ^ 2 + sδ ^ 2 = 1)
    (hηpyth : cη ^ 2 + sη ^ 2 = 1) (hsη : sη < 0)
    (hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ)
    (hne : ¬ (cη = cθ ∧ sη = sθ)) :
    ∃ θ δ : ℝ,
      Real.cos θ = cθ ∧ Real.sin θ = sθ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
      Real.cos δ = cδ ∧ Real.sin δ = sδ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
      cη = Real.cos (2 * δ - θ) ∧ sη = Real.sin (2 * δ - θ) := by
  -- Recover genuine angles `θ = arccos cθ`, `δ = arccos cδ` for `C`, `D` (upper).
  have hcθ_mem : -1 ≤ cθ ∧ cθ ≤ 1 := by
    constructor <;> nlinarith [hθpyth, sq_nonneg sθ, sq_nonneg cθ]
  have hcδ_mem : -1 ≤ cδ ∧ cδ ≤ 1 := by
    constructor <;> nlinarith [hδpyth, sq_nonneg sδ, sq_nonneg cδ]
  have hcη_mem : -1 ≤ cη ∧ cη ≤ 1 := by
    constructor <;> nlinarith [hηpyth, sq_nonneg sη, sq_nonneg cη]
  -- Set up genuine angles `θ = arccos cθ`, `δ = arccos cδ` (upper), and
  -- `η := -arccos cη` so that `cos η = cη` and `sin η = sη` (`sη < 0`).
  set θ : ℝ := Real.arccos cθ with hθ_def
  set δ : ℝ := Real.arccos cδ with hδ_def
  set η : ℝ := -Real.arccos cη with hη_def
  have hcosθ : Real.cos θ = cθ := Real.cos_arccos hcθ_mem.1 hcθ_mem.2
  have hsinθ : Real.sin θ = sθ := by
    rw [hθ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cθ ^ 2) = Real.sqrt (sθ ^ 2) := by congr 1; nlinarith [hθpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsθ)]
  have hcosδ : Real.cos δ = cδ := Real.cos_arccos hcδ_mem.1 hcδ_mem.2
  have hsinδ : Real.sin δ = sδ := by
    rw [hδ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cδ ^ 2) = Real.sqrt (sδ ^ 2) := by congr 1; nlinarith [hδpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsδ)]
  have hcosη : Real.cos η = cη := by
    rw [hη_def, Real.cos_neg]; exact Real.cos_arccos hcη_mem.1 hcη_mem.2
  have hsinη : Real.sin η = sη := by
    rw [hη_def, Real.sin_neg, Real.sin_arccos]
    have hsqrt : Real.sqrt (1 - cη ^ 2) = Real.sqrt (sη ^ 2) := by congr 1; nlinarith [hηpyth]
    rw [hsqrt, Real.sqrt_sq_eq_abs, abs_of_neg hsη]; ring
  -- The radical condition is `cos (η - δ) = cos (θ - δ)`.
  have hcoseq : Real.cos (η - δ) = Real.cos (θ - δ) := by
    rw [Real.cos_sub, Real.cos_sub, hcosη, hsinη, hcosθ, hsinθ, hcosδ, hsinδ]
    linarith [hradical]
  have hcoords : ¬ (Real.cos η = Real.cos θ ∧ Real.sin η = Real.sin θ) := by
    rw [hcosη, hsinη, hcosθ, hsinθ]; exact hne
  -- Reflection identity from the chord condition and `q ≠ C`.
  have hrefl : Real.cos η = Real.cos (2 * δ - θ) ∧ Real.sin η = Real.sin (2 * δ - θ) := by
    rw [Real.cos_eq_cos_iff] at hcoseq
    obtain ⟨k, hk | hk⟩ := hcoseq
    · exfalso; apply hcoords
      have he : η = θ + ((-k : ℤ) : ℝ) * (2 * Real.pi) := by push_cast; linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
    · have he : η = (2 * δ - θ) + ((k : ℤ) : ℝ) * (2 * Real.pi) := by linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
  refine ⟨θ, δ, hcosθ, hsinθ, Real.arccos_nonneg cθ, Real.arccos_le_pi cθ,
    hcosδ, hsinδ, Real.arccos_nonneg cδ, Real.arccos_le_pi cδ, ?_, ?_⟩
  · rw [← hcosη, hrefl.1]
  · rw [← hsinη, hrefl.2]

/- PRODUCER for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows: build the
prose-normalized `QEqCReflectionConfigV13` from shell-level reflection data.

The geometric input is `B=v₃`, `D=v₂`, the exact upper cap-apex `C` over `AB`,
and the lower witness `q ∈ I₂` that is the reflection of `C` across line `BD`:

* `hAC  : |AC| = |AB|`        (`C` is the exact cap-apex; gives `cos θ = -r/2`),
* `hBD  : |BD| = |BC|`        (`D` lies on the radius-`r=|BC|` circle about `B`),
* `hBq  : |Bq| = |BC|`        (`q` on the radius-`r` circle about `B`),
* `hDq  : |Dq| = |DC|`        (`q` on the `D`-centered circle through `C`),
* `hlong : |AB| < |AD|`       (`v₂` is the far apex: `|AD| > 1`, gives `cos δ > -r/2`),
* `hCside : C` is on the same open side of `AB` as `v₂` (above),
* `hqC : q ≠ C`               (`q` is the *other* common point).

Normalizing by a similarity transport `A=v₁ ↦ (0,0)`, `B=v₃ ↦ (1,0)` (flipped so
`(T v₂)₁` is above the chord), `C`, `D`, `q` all sit on the circle of radius
`r := |BC|` about `B`.  The chord condition `|Dq| = |DC|` makes `q` the
reflection of `C` across `BD`, so `T q = (1 + r\cos(2δ-θ), r\sin(2δ-θ))` with
`\sin(2δ-θ) < 0` (`q` below `AB`).  This is exactly the `QEqCReflectionConfigV13`
data the consumer `qEqC_row_impossible_of_lower_witness_v13` requires. -/
set_option maxHeartbeats 8000000 in
-- Large heartbeat budget: the proof packages a full similarity transport,
-- several coordinate `nlinarith` certificates, and the reflection-angle core.
theorem qEqC_reflection_config_of_shell_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I2)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v3)
    (hBD : dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v3 C)
    (hBq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hDq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3)
    (hqC : q ≠ C) :
    ∃ r : ℝ, S.QEqCReflectionConfigV13 q r := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v3
  let q3 : ℝ² := S.triangle.v2
  -- Base transport `v₁ ↦ (-1,0)`, `v₃ ↦ (1,0)`.
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v13_ne
  rcases exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  -- `v₂` is off the base chord, so its image second coordinate is nonzero.
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_3
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  -- Reusable construction from any base transport with `v₂` above the chord.
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.QEqCReflectionConfigV13 q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    -- Postcompose by the fixed half-shift: `v₁ ↦ (0,0)`, `v₃ ↦ (1,0)`.
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    -- `v₂` stays above the chord after the half-shift.
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    -- Coordinate values of the base endpoints.
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    -- `q ∈ I₂` lies strictly below the base chord `AB`; first some shell facts.
    have hxA : q ∈ A := S.CP.C2_subset (by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).2)
    have hqC3 : q ∈ S.CP.C2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).2
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_2
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
    have hq_arc : signedArea2 q q1 q2 * signedArea2 q3 q1 q2 ≤ 0 := by
      have hraw : signedArea2 q q2 q1 * signedArea2 q3 q2 q1 ≤ 0 := by
        simpa [q1, q2, q3, Problem97.OnArcOpposite] using
          ((S.CP.arc_membership q hxA).2.1.mp hqC3)
      have hswapq : signedArea2 q q2 q1 = - signedArea2 q q1 q2 := by
        unfold Problem97.signedArea2
        ring
      have hswap3 : signedArea2 q3 q2 q1 = - signedArea2 q3 q1 q2 := by
        unfold Problem97.signedArea2
        ring
      rw [hswapq, hswap3] at hraw
      simpa using hraw
    have hq_base_ne : signedArea2 q q1 q2 ≠ 0 := by
      intro hz
      have hcol : Collinear ℝ ({q, q1, q2} : Set ℝ²) :=
        (Problem97.signedArea2_eq_zero_iff_collinear q q1 q2).1 hz
      exact False.elim <|
        S.hconv.not_three_collinear hxA S.triangle.v1_mem S.triangle.v3_mem
          hq_ne_v1 hq_ne_v2 S.triangle.v13_ne hcol
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, signedArea2_baseChord_vec2]; linarith
    -- `q` below `AB`: `(T q)₁ < 0`.
    have hqy_T : (T q) 1 < 0 := by
      have himg_nonpos :
          signedArea2 (T0 q) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign q q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 q q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hq_arc
      have hq_img_lt : signedArea2 (T0 q) (T0 q1) (T0 q2) < 0 := by
        have hq_img_le : signedArea2 (T0 q) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hq_pos
          have : 0 < signedArea2 (T0 q) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hq_img_ne : signedArea2 (T0 q) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign q q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hq_base_ne
        exact lt_of_le_of_ne hq_img_le hq_img_ne
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 q) 1 / 2 < 0 := by linarith
      simpa using this
    -- `C` above `AB`: `(T C)₁ > 0`, from `hCside` (same side as `v₂`).
    have hC_base_ne : signedArea2 C q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hCside; exact lt_irrefl _ hCside
    have hCy_T : 0 < (T C) 1 := by
      have hC_img_prod :
          0 < signedArea2 (T0 C) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign C q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 C q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 C q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hCside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hC_img_pos : 0 < signedArea2 (T0 C) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 C) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hC_img_pos
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 C) 1 / 2 := by linarith
      simpa using this
    -- Transported radius `r := |Bq| = |BC|`.
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne
    set r : ℝ := dist (T q2) (T C) with hr_def
    have hC_ne_v2 : C ≠ q2 := by
      intro h; rw [h] at hC_base_ne
      exact hC_base_ne (by
        have : signedArea2 q2 q1 q2 = 0 := by
          simp [signedArea2]
        simpa [q1, q2] using this)
    have hd_C : 0 < dist q2 C := by rw [dist_pos]; exact fun h => hC_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_C
    -- The three radius-`r` circle facts (all about center `T v₃`).
    have hBC_T : dist (T q2) (T C) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 C := by simpa [q2] using hBq
      rw [this]
    have hBD_T : dist (T q2) (T q3) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q3 = dist q2 C := by simpa [q2, q3] using hBD
      rw [this]
    -- `|Dq| = |DC|` transported (the chord condition; `|Dq|` need not equal `r`).
    have hDq_T : dist (T q3) (T q) = dist (T q3) (T C) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 q = dist q3 C := by simpa [q3] using hDq
      rw [this]
    -- Coordinate abbreviations on the circle of radius `r` about `(1,0)`.
    set cθ : ℝ := ((T C) 0 - 1) / r with hcθ_def
    set sθ : ℝ := (T C) 1 / r with hsθ_def
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    -- Pythagorean identities from the circle facts.
    have hθpyth : cθ ^ 2 + sθ ^ 2 = 1 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T C)
      rw [hBC_T, hv2c0, hv2c1] at hsq
      rw [hcθ_def, hsθ_def]; field_simp; nlinarith [hsq]
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hcδ_def, hsδ_def]; field_simp; nlinarith [hsq]
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [hcη_def, hsη_def]; field_simp; nlinarith [hsq]
    -- `sθ > 0`, `sδ > 0` (above), `sη < 0` (below).
    have hsθ_pos : 0 < sθ := by rw [hsθ_def]; positivity
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; positivity
    have hsη_neg : sη < 0 := by
      rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    -- `cθ = -r/2` from `|AC| = |AB| = 1`.
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hAC_T : dist (T q1) (T C) = 1 := by
      rw [tau.dist_image]
      have : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
      rw [hAB1] at this
      have hAC' : dist q1 C = dist q1 q2 := by simpa [q1, q2] using hAC
      rw [hAC']; linarith [this]
    have hcθ_eq : cθ = -(r / 2) := by
      -- `|AC|² = 1`: `(TC₀)² + (TC₁)² = 1` (no `r`-unfolding).
      have hACsq : (T C) 0 ^ 2 + (T C) 1 ^ 2 = 1 := by
        have h := dist_sq_eq_coord_sq_add_coord_sq (T q1) (T C)
        rw [hAC_T, hv1c0, hv1c1] at h
        nlinarith [h]
      -- The circle identity `(TC₀-1)² + (TC₁)² = r²` from `hθpyth`.
      have hcirc : ((T C) 0 - 1) ^ 2 + (T C) 1 ^ 2 = r ^ 2 := by
        have h := hθpyth
        rw [hcθ_def, hsθ_def] at h
        field_simp at h
        nlinarith [h]
      -- Subtract to get `TC₀ = 1 - r²/2`, hence `cθ = -r/2`.
      have hTC0 : (T C) 0 = 1 - r ^ 2 / 2 := by nlinarith [hACsq, hcirc]
      rw [hcθ_def, hTC0]; field_simp; ring
    -- `cδ > -r/2` from `|AD| > 1`.
    have hcδ_gt : -(r / 2) < cδ := by
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith [hsc, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 := by
        have h := dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
        rw [hv1c0, hv1c1] at h
        nlinarith [hAD, dist_nonneg (x := T q1) (y := T q3), h]
      -- circle identity `(TD₀-1)² + (TD₁)² = r²` from `hδpyth`.
      have hBDsq : ((T q3) 0 - 1) ^ 2 + (T q3) 1 ^ 2 = r ^ 2 := by
        have h := hδpyth
        rw [hcδ_def, hsδ_def] at h
        field_simp at h
        nlinarith [h]
      -- `(TD₀)² + (TD₁)² > 1` and `(TD₀-1)² + (TD₁)² = r²` give `TD₀ > 1 - r²/2 > -r²/2`.
      rw [hcδ_def, lt_div_iff₀ hr_pos]
      nlinarith [hADsq, hBDsq]
    -- Coordinate values on the circle of radius `r` about `(1,0)`.
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    have hTC0 : (T C) 0 = 1 + r * cθ := by rw [hcθ_def]; field_simp; ring
    have hTC1 : (T C) 1 = r * sθ := by rw [hsθ_def]; field_simp
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    -- The radical (chord) condition `cη·cδ + sη·sδ = cθ·cδ + sθ·sδ` from `|Dq| = |DC|`.
    have hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ := by
      have hsqeq : dist (T q3) (T q) ^ 2 = dist (T q3) (T C) ^ 2 := by rw [hDq_T]
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTC0, hTC1, hTD0, hTD1, hTq0, hTq1] at hsqeq
      have hrne : r ≠ 0 := ne_of_gt hr_pos
      have hkey : (cη * cδ + sη * sδ) * r ^ 2 = (cθ * cδ + sθ * sδ) * r ^ 2 := by
        nlinarith [hsqeq, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact mul_right_cancel₀ (ne_of_gt hr2pos) hkey
    -- `q ≠ C` gives `(cη, sη) ≠ (cθ, sθ)`.
    have hne : ¬ (cη = cθ ∧ sη = sθ) := by
      rintro ⟨hc, hs⟩
      apply hqC
      have h0 : (T q) 0 = (T C) 0 := by rw [hTq0, hTC0, hc]
      have h1 : (T q) 1 = (T C) 1 := by rw [hTq1, hTC1, hs]
      have hTqC : T q = T C := by
        ext i; fin_cases i
        · exact h0
        · exact h1
      have hd0 : dist (T q) (T C) = 0 := by rw [hTqC]; simp
      rw [tau.dist_image] at hd0
      have : dist q C = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp this
    -- Build the genuine angles via the reflection-angle core.
    obtain ⟨θ, δ, hcosθ, hsinθ, hθ0, hθπ, hcosδ, hsinδ, hδ0, hδπ, hcη_eq, hsη_eq⟩ :=
      qEqC_reflection_coords_v13 r cθ sθ cδ sδ cη sη hr_pos hcθ_eq hsθ_pos hθpyth
        hcδ_gt hsδ_pos hδpyth hηpyth hsη_neg hradical hne
    -- Assemble the configuration: `T q = (1 + r cos(2δ-θ), r sin(2δ-θ))`.
    have hcosθ' : Real.cos θ = -(r / 2) := by rw [hcosθ]; exact hcθ_eq
    have hsinθ' : 0 < Real.sin θ := by rw [hsinθ]; exact hsθ_pos
    have hcosδ' : -(r / 2) < Real.cos δ := by rw [hcosδ]; exact hcδ_gt
    have hsinδ' : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hqbelow' : Real.sin (2 * δ - θ) < 0 := by rw [← hsη_eq]; exact hsη_neg
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - θ) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - θ) := by rw [hTq1, hsη_eq]
    have hqcoord : T q =
        Problem97.CGN.vec2 (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) := by
      ext i; fin_cases i
      · change (T q) 0 = _
        rw [hTq0']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      · change (T q) 1 = _
        rw [hTq1']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    exact ⟨r, T, tau, θ, δ, hv1T, hv2T, hr_pos,
      hcosθ', hsinθ', hθ0, hθπ, hcosδ', hsinδ', hδ0, hδπ, hqcoord, hqbelow'⟩
  -- Orient so that `(T q3) 1 > 0`, flipping if necessary.
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip

/-- Row-level closure for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows
(`N4d-bA2c-D5`, `N4d-bA2c-D6`, `N4d-bA3c-D5`, `N4d-bA3c-D6`), wired end to end
from shell-level reflection data.

The producer `qEqC_reflection_config_of_shell_v13` turns the cap-apex/reflection
equidistances into the prose-normalized `QEqCReflectionConfigV13`; the consumer
`qEqC_row_impossible_of_lower_witness_v13` then closes the row using the lower-chain
cap order automatic for `q ∈ I₂`. -/
theorem qEqC_row_impossible_of_reflection_v13
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I2)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v3)
    (hBD : dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v3 C)
    (hBq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hDq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3)
    (hqC : q ≠ C) :
    False := by
  obtain ⟨r, hconfig⟩ :=
    S.qEqC_reflection_config_of_shell_v13 hqI3 hAC hBD hBq hDq hlong hCside hqC
  exact S.qEqC_row_impossible_of_lower_witness_v13 hqI3 hconfig


/-- `N4d-cA-3`: the `y = a3`, lower-side `q' = C` column is impossible.

This is the cycle-free producer core for the row currently assembled in
`N4dExcludesFormCv1.lean`; the `SelectorV2Qa3Packet` hypothesis is taken in its
fully unfolded form. -/
theorem n4d_cA_3_q_eq_C_impossible_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hC : S.IsFormC_v1 r)
    (hlower : FormCv1A3SelectorV3LowerPacket S Z r s)
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 t)
    (p : ℝ²) (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpC1 : S.witnessClassAt_v2 t ∩ S.CP.C1 = ({p} : Finset ℝ²))
    (ha3C3 : S.witnessClassAt_v2 t ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) :
    False := by
  classical
  rcases hlower with ⟨hA3, ha3eq, _hTcard, hI3sub, hC1eq, hC2eq⟩
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
  have hAC : dist S.triangle.v1 Z.a3 = dist S.triangle.v1 S.triangle.v3 := by
    have ha3T1 : Z.a3 ∈ S.witnessClassAt_v1 r := by
      have ha3mem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← ha3eq] at ha3mem
      exact (Finset.mem_inter.mp ha3mem).1
    have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
      rcases hC with ⟨_, _, hv3eq, _⟩
      have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
      rw [← hv3eq] at hv3mem
      exact (Finset.mem_inter.mp hv3mem).1
    have ha3dist : dist S.triangle.v1 Z.a3 = r := by
      simpa using (Finset.mem_filter.mp ha3T1).2
    have hv3dist : dist S.triangle.v1 S.triangle.v3 = r := by
      simpa using (Finset.mem_filter.mp hv3T1).2
    rw [ha3dist, hv3dist]
  have ha3T3 : Z.a3 ∈ T := hI3sub hA3
  have hv2rad3 : dist S.triangle.v3 S.triangle.v2 = s := by
    simpa [T] using (Finset.mem_filter.mp hv2T).2
  have ha3rad3 : dist S.triangle.v3 Z.a3 = s := by
    simpa [T] using (Finset.mem_filter.mp ha3T3).2
  have hBD : dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v3 Z.a3 := by
    rw [hv2rad3, ha3rad3]
  have hqrad3 : dist S.triangle.v3 q = s := by
    simpa [T] using (Finset.mem_filter.mp hqT3).2
  have hBq : dist S.triangle.v3 q = dist S.triangle.v3 Z.a3 := by
    rw [hqrad3, ha3rad3]
  have ha3T2 : Z.a3 ∈ S.witnessClassAt_v2 t := by
    have ha3mem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
    rw [← ha3C3] at ha3mem
    exact (Finset.mem_inter.mp ha3mem).1
  have hqT2 : q ∈ S.witnessClassAt_v2 t := hI2sub hqI2
  have ha3rad2 : dist S.triangle.v2 Z.a3 = t := by
    simpa using (Finset.mem_filter.mp ha3T2).2
  have hqrad2 : dist S.triangle.v2 q = t := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hDq : dist S.triangle.v2 q = dist S.triangle.v2 Z.a3 := by
    rw [hqrad2, ha3rad2]
  have hlong : dist S.triangle.v1 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    have h := v1_lt_v1v2_of_mem_I3_local S (q := Z.a3) hA3
    rwa [hAC] at h
  have hCside :
      0 < signedArea2 Z.a3 S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 :=
    c3_vertex_same_open_side_as_v2_local S hA3
  have hqC : q ≠ Z.a3 := by
    exact ne_of_mem_I2_of_mem_I3_local hqI2 hA3
  exact S.qEqC_row_impossible_of_reflection_v13 hqI2 hAC hBD hBq hDq hlong hCside hqC

end FiniteEndpointShell

end Problem97
