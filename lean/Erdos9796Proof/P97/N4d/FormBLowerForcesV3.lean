import Erdos9796Proof.P97.N9Endpoint.N4e

/-!
# Lower-branch `C₁`-hit forcing for the `x = a₂` Form-`b` tree (W3 F2)

The prose "upper unit-circle witness exclusion"
(`97-section3-n-lane-prose.md:1109–1143`) closes the four lower-side rows
`N4d-bA2a/bA2b/bA3a/bA3b`: under Form `b` at `v₁` with a `4`-class, both
`a₂` and any named `C₁` candidate `p ∈ {a₁,b₁}` of the `v₂` selector lie on
`circle(v₁, r) ∩ circle(v₂, s)`; the two intersections of those circles are
mirror images across the line `v₁v₂`, the same-side intersection is `a₂`
itself, and the reflected one lies outside the MEC disk — so `p` must be
`v₃`.

This is the unequal-radius generalization of
`selectorShape_v2_q_eq_v1_forces_v3` (`N9EndpointN4e.lean`), whose
chord-frame computation hard-pins `s = |v₁v₂|` from the upper branch's
`T ∩ C₃ = {v₁}`.  Here the only requirement on the second radius is
`0 < s`: in the chord frame on `u = v₂ - v₁` the shared points have
`X = (‖u‖² - s²)/(2‖u‖²)`, and the reflected-point disk exclusion needs
exactly `X < 1/2 ⟺ s² > 0`.  In particular no cap-monotonicity input
(`s < r`) is consumed.

The wrapper `selectorShape_v2_lower_forces_v3` is the deliverable named by
the W1 audit (`97-w1-packet-reuse-audit-2026-06-05.md`, F2): it lets the
W3 assembly manufacture `FormBv1A2SelectorV2LowerPacket` from the raw
`selectorShape_v2_split` lower branches.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

set_option maxHeartbeats 2000000 in
-- chord-frame coordinate development + several `nlinarith` calls over
-- degree-3 monomials (same budget as `selectorShape_v2_q_eq_v1_forces_v3`)
/-- Unequal-radius shared-circle forcing: under Form `b` at `v₁` with the
`x = a₂` side pin, any named `C₁` candidate of the `v₂` selector class that
lies on both witness circles must be `v₃`.  The two circles
`circle(v₁, r)` and `circle(v₂, s)` share `a₂`; in the chord frame their
common points are mirror images across line `v₁v₂`, the same-side point is
`a₂` (cap-disjointness contradiction), and the reflected point is outside
the MEC disk (disk-containment contradiction). -/
theorem sharedCirclePointForcesV3_of_formB_lower
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hs : 0 < s)
    (hB : S.IsFormB_v1 r)
    (hA2 : (Z.a2 : ℝ²) ∈ S.I2)
    (h_a2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s) :
    S.SharedCirclePointForcesV3 Z r s := by
  classical
  obtain ⟨-, -, -, h_v2eq⟩ := hB
  intro q hqnamed hqT2 hqT1
  by_cases hqv3 : q = S.triangle.v3
  · exact hqv3
  exfalso
  have hqI1 : q ∈ S.I1 := by
    rw [Z.hI1]
    rcases Finset.mem_insert.mp hqnamed with h | hrest
    · simp [h]
    · rcases Finset.mem_insert.mp hrest with h | h
      · simp [h]
      · exact absurd (by simpa using h) hqv3
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let a : ℝ² := Z.a2
  let center : ℝ² := S.Packet.center
  have hqA : q ∈ A := (Finset.mem_filter.mp hqT1).1
  have haC2 : a ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
  have haA : a ∈ A := S.CP.C2_subset haC2
  have haT1 : a ∈ S.witnessClassAt_v1 r := by
    have hamem : a ∈ ({a} : Finset ℝ²) := by simp
    rw [← h_a2eq] at hamem
    exact (Finset.mem_inter.mp hamem).1
  have haT2 : a ∈ S.witnessClassAt_v2 s := hI2sub hA2
  have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
    rw [← h_v2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hr_q1q2 : dist q1 q2 = r := by
    simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
  have hr_q1a : dist q1 a = r := by
    simpa [q1, a] using (Finset.mem_filter.mp haT1).2
  have hr_q1q : dist q1 q = r := by
    simpa [q1] using (Finset.mem_filter.mp hqT1).2
  have hs_q2a : dist q2 a = s := by
    simpa [q2, a] using (Finset.mem_filter.mp haT2).2
  have hs_q2q : dist q2 q = s := by
    simpa [q2] using (Finset.mem_filter.mp hqT2).2
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v12_ne.symm
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
    simp [nvec]
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have horth : inner ℝ u nvec = 0 := by
    simp [nvec]
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simp [M]
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by
          dsimp [u]
          abel_nf]
        simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simp [M, u]
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h
    simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h
    simpa using h
  have hdist_sq_coeff :
      ∀ a b : ℝ, ‖a • u + b • nvec‖ ^ 2 = (a ^ 2 + b ^ 2) * ‖u‖ ^ 2 := by
    intro a b
    have horth' : inner ℝ (a • u) (b • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]
      ring
    have hnorm :
        ‖a • u + b • nvec‖ ^ 2 = ‖a • u‖ ^ 2 + ‖b • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (a • u) (b • nvec) horth'
    have hu_part : ‖a • u‖ ^ 2 = a ^ 2 * ‖u‖ ^ 2 := by
      calc
        ‖a • u‖ ^ 2 = (|a| * ‖u‖) ^ 2 := by rw [norm_smul, Real.norm_eq_abs]
        _ = |a| ^ 2 * ‖u‖ ^ 2 := by ring
        _ = a ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
    have hn_part : ‖b • nvec‖ ^ 2 = b ^ 2 * ‖u‖ ^ 2 := by
      calc
        ‖b • nvec‖ ^ 2 = (|b| * ‖u‖) ^ 2 := by
          rw [norm_smul, Real.norm_eq_abs, hnorm_nvec]
        _ = |b| ^ 2 * ‖u‖ ^ 2 := by ring
        _ = b ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
    rw [hnorm, hu_part, hn_part]
    ring
  have hpt_minus_q1 : ∀ z : ℝ²,
      z - q1 = (X z + 1 / 2) • u + Y z • nvec := by
    intro z
    calc
      z - q1 = (z - M) - (q1 - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - ((-(1 / 2 : ℝ)) • u) := by
        rw [hsum_pt z, hq1mid]
      _ = (X z • u + (1 / 2 : ℝ) • u) + Y z • nvec := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = (X z + 1 / 2) • u + Y z • nvec := by
        rw [← add_smul]
  have hpt_minus_q2 : ∀ z : ℝ²,
      z - q2 = (X z - 1 / 2) • u + Y z • nvec := by
    intro z
    calc
      z - q2 = (z - M) - (q2 - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - ((1 / 2 : ℝ) • u) := by
        rw [hsum_pt z, hq2mid]
      _ = (X z • u + (-(1 / 2 : ℝ)) • u) + Y z • nvec := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = (X z - 1 / 2) • u + Y z • nvec := by
        rw [← add_smul]
        simp [sub_eq_add_neg]
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have hdist_eq : dist center q1 = dist center q2 := by
        rw [dist_comm center q1, dist_comm center q2]
        simpa [q1, q2] using
          S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
      have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
        rw [AffineSubspace.mem_perpBisector_iff_dist_eq]
        simpa using hdist_eq
      have h :=
        (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
          (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have hxc_zero : X center = 0 := by
      have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
        have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
        calc
          inner ℝ (center - M) u = inner ℝ (X center • u + Y center • nvec) u := by
            rw [hsum_pt center]
          _ = inner ℝ (X center • u) u + inner ℝ (Y center • nvec) u := by
            rw [inner_add_left]
          _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
            rw [inner_smul_left, inner_smul_left, real_inner_self_eq_norm_sq, horth_rev]
            simp
          _ = X center * ‖u‖ ^ 2 := by ring
      have hsqpos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
      nlinarith
    calc
      z - center = (z - M) - (center - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - (Y center • nvec) := by
        rw [hsum_pt z, hsum_pt center, hxc_zero, zero_smul, zero_add]
      _ = X z • u + (Y z • nvec + (-Y center) • nvec) := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = X z • u + (Y z - yc) • nvec := by
        rw [← add_smul]
        rfl
  have hdist_q1_sq :
      ∀ z : ℝ², dist q1 z ^ 2 = ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_q1, hdist_sq_coeff]
  have hdist_q2_sq :
      ∀ z : ℝ², dist q2 z ^ 2 = ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_q2, hdist_sq_coeff]
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  have hs_sq_pos : 0 < s ^ 2 := by positivity
  -- the chord-frame circle equations for the two shared points
  have hnorm_u : ‖u‖ = r := by
    rw [← hr_q1q2, dist_eq_norm]
    simp [u, norm_sub_rev]
  have hcommon_eqs :
      ∀ z : ℝ², dist q1 z = r → dist q2 z = s →
        ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 ∧
        ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = s ^ 2 := by
    intro z hz1 hz2
    constructor
    · rw [← hdist_q1_sq z, hz1, ← hnorm_u]
    · rw [← hdist_q2_sq z, hz2]
  obtain ⟨ha_eq1, ha_eq2⟩ := hcommon_eqs a hr_q1a hs_q2a
  obtain ⟨hq_eq1, hq_eq2⟩ := hcommon_eqs q hr_q1q hs_q2q
  -- both shared points have the same chord-frame abscissa …
  have hXdiff : (X q - X a) * (2 * ‖u‖ ^ 2) = 0 := by
    linear_combination hq_eq1 - hq_eq2 - ha_eq1 + ha_eq2
  have hqX_eq : X q = X a := by
    rcases mul_eq_zero.mp hXdiff with h | h
    · exact sub_eq_zero.mp h
    · nlinarith [hu_sq_pos]
  -- … and opposite-or-equal ordinates
  have hYdiff : (Y q ^ 2 - Y a ^ 2) * ‖u‖ ^ 2 = 0 := by
    linear_combination hq_eq1 - ha_eq1 - (X q + X a + 1) * ‖u‖ ^ 2 * hqX_eq
  have hqY_sq : Y q ^ 2 = Y a ^ 2 := by
    rcases mul_eq_zero.mp hYdiff with h | h
    · exact sub_eq_zero.mp h
    · nlinarith [hu_sq_pos]
  have hy_cases : Y q = Y a ∨ Y q = -Y a :=
    sq_eq_sq_iff_eq_or_eq_neg.mp hqY_sq
  -- the abscissa is strictly left of v₂'s: exactly `0 < s²`
  have h2XaU : 2 * X a * ‖u‖ ^ 2 = ‖u‖ ^ 2 - s ^ 2 := by
    linear_combination ha_eq1 - ha_eq2
  rcases hy_cases with hsame | hopp
  · -- same-side point: `q = a₂`, contradicting cap membership
    have hqa2 : q = a := by
      have hsub : q - M = a - M := by
        calc
          q - M = X q • u + Y q • nvec := hsum_pt q
          _ = X a • u + Y a • nvec := by rw [hqX_eq, hsame]
          _ = a - M := (hsum_pt a).symm
      have hadd := congrArg (fun t : ℝ² => t + M) hsub
      simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hadd
    have ha_not_verts : a ∉ S.triangle.verts := by
      have ha_ne_v1 : a ≠ q1 := by
        unfold Problem97.FiniteEndpointShell.I2 at hA2
        exact (Finset.mem_erase.mp hA2).1
      have ha_ne_v3 : a ≠ S.triangle.v3 := by
        unfold Problem97.FiniteEndpointShell.I2 at hA2
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
      have ha_ne_v2 : a ≠ q2 := by
        intro h
        have : q2 ∈ S.CP.C2 := by simpa [h] using haC2
        exact S.CP.v2_notin_C2 this
      simp [Problem97.MoserTriangle.verts, q1, q2, ha_ne_v1, ha_ne_v2, ha_ne_v3]
    have hone_a := S.CP.nonmoser_in_one a haA ha_not_verts
    have haI1 : a ∈ S.I1 := by simpa [hqa2] using hqI1
    have haC1 : a ∈ S.CP.C1 := by
      unfold Problem97.FiniteEndpointShell.I1 at haI1
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase haI1)
    have hone_a' : (2 + if a ∈ S.CP.C3 then 1 else 0) = 1 := by
      simpa [haC1, haC2] using hone_a
    by_cases haC3 : a ∈ S.CP.C3 <;> simp [haC3] at hone_a'
  · -- reflected point: outside the MEC disk, contradicting disk containment
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A a haA
      rw [dist_eq_norm, norm_sub_rev]
      exact hdisk_a'
    have hradius : dist center q1 = S.Packet.radius := by
      rw [dist_comm]
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
      have hnonneg_a : 0 ≤ dist center a := dist_nonneg
      have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
      nlinarith [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
    rw [hdist_center_sq a, hdist_center_sq q1, hX_q1, hY_q1] at hdist_sq
    have hyc_pos : 0 < Y a * yc := by
      nlinarith [hdist_sq, ha_eq1, h2XaU, hs_sq_pos, hu_sq_pos]
    have hq_out : dist center q > S.Packet.radius := by
      have hdist_sq_q : dist center q ^ 2 > S.Packet.radius ^ 2 := by
        rw [hdist_center_sq q]
        have hradius_sq :
            S.Packet.radius ^ 2 = ((1 / 2 : ℝ) ^ 2 + yc ^ 2) * ‖u‖ ^ 2 := by
          have hq1sq := hdist_center_sq q1
          rw [hradius, hX_q1, hY_q1] at hq1sq
          nlinarith
        rw [hqX_eq, hopp, hradius_sq]
        nlinarith [ha_eq1, h2XaU, hyc_pos, hs_sq_pos, hu_sq_pos]
      have hrad_nn : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      have hdist_nn : 0 ≤ dist center q := dist_nonneg
      nlinarith
    have hdisk_q : dist center q ≤ S.Packet.radius := by
      have hdisk_q' : ‖q - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A q hqA
      rw [dist_eq_norm, norm_sub_rev]
      exact hdisk_q'
    exact absurd hdisk_q (not_le_of_gt hq_out)

/-- W3 F2 deliverable (`97-w1-packet-reuse-audit-2026-06-05.md`): in the
`x = a₂` lower-side branches of `selectorShape_v2_split`, the named `C₁`
witness of the `v₂` selector is forced to be `v₃`, so the lower packet's
`T ∩ C₁ = {v₃}` pin is manufacturable from the raw split data. -/
theorem selectorShape_v2_lower_forces_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r) (hs : 0 < s)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hB : S.IsFormB_v1 r)
    (hA2 : (Z.a2 : ℝ²) ∈ S.I2)
    (h_a2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s)
    {p : ℝ²}
    (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpeq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({p} : Finset ℝ²)) :
    S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) := by
  classical
  have hforce : S.SharedCirclePointForcesV3 Z r s :=
    S.sharedCirclePointForcesV3_of_formB_lower Z hs hB hA2 h_a2eq hI2sub
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨-, hI1sub, -, -⟩
  have hpT2 : p ∈ S.witnessClassAt_v2 s := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  rcases Finset.mem_insert.mp hp with hpa1 | hprest
  · have hpa1' : p = Z.a1 := by simpa using hpa1
    have ha1I1 : Z.a1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have ha1T1 : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
    have hpv3 : p = S.triangle.v3 :=
      hforce p hp hpT2 (by simpa [hpa1'] using ha1T1)
    rwa [hpv3] at hpeq
  rcases Finset.mem_insert.mp hprest with hpb1 | hpv3
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    have hb1I1 : Z.b1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have hb1T1 : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
    have hpv3 : p = S.triangle.v3 :=
      hforce p hp hpT2 (by simpa [hpb1'] using hb1T1)
    rwa [hpv3] at hpeq
  · have hpv3' : p = S.triangle.v3 := by simpa using hpv3
    rwa [hpv3'] at hpeq

end FiniteEndpointShell

end Problem97
