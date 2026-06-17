import Erdos9796Proof.P97.N4dFormAEndpointPairKill
import Erdos9796Proof.P97.N9EndpointN4e
import Erdos9796Proof.P97.U2WitnessReflectionKernel

/-!
# `N4d` Form-`a` exclusion at `v₁`

This file packages the theorem-facing `v₁` Form-`a` exclusion required by
`docs/n-lane/specs/W4-formA-v1-spec.md`.

The endpoint-column branches are intentionally left as `SORRY-GATE`s against the
separate Form-`b` / Form-`c` workstreams.  The interior-interior branch is the
new geometry lane for this module.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

private theorem hneg_of_cyclicShift_local
    {n : ℕ} {phi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (cut : Fin n) :
    ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi (i + cut)) (phi (j + cut)) (phi (k + cut)) < 0 := by
  have hcyc {a b c : ℝ²} :
      Problem97.signedArea2 a b c = Problem97.signedArea2 c a b := by
    simp [Problem97.signedArea2]
    ring
  let bound : ℕ := n - cut.val
  have hval_nowrap {t : Fin n} (ht : (t : ℕ) < bound) :
      ((t + cut : Fin n) : ℕ) = t.val + cut.val := by
    rw [Fin.val_add_eq_ite]
    have hlt : ¬ n ≤ t.val + cut.val := by
      omega
    simp [hlt]
  have hval_wrap {t : Fin n} (ht : bound ≤ (t : ℕ)) :
      ((t + cut : Fin n) : ℕ) = t.val - bound := by
    rw [Fin.val_add_eq_ite]
    have hge : n ≤ t.val + cut.val := by
      omega
    simp [hge]
    omega
  intro i j k hij hjk
  by_cases hk : (k : ℕ) < bound
  · have hi : (i : ℕ) < bound := by omega
    have hj : (j : ℕ) < bound := by omega
    have hij' : i + cut < j + cut := by
      change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
      rw [hval_nowrap hi, hval_nowrap hj]
      omega
    have hjk' : j + cut < k + cut := by
      change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
      rw [hval_nowrap hj, hval_nowrap hk]
      omega
    exact hneg hij' hjk'
  · by_cases hj : (j : ℕ) < bound
    · have hi : (i : ℕ) < bound := by omega
      have hk' : bound ≤ (k : ℕ) := by omega
      have hki : k + cut < i + cut := by
        change (((k + cut : Fin n) : ℕ) < ((i + cut : Fin n) : ℕ))
        rw [hval_wrap hk', hval_nowrap hi]
        omega
      have hij' : i + cut < j + cut := by
        change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
        rw [hval_nowrap hi, hval_nowrap hj]
        omega
      have hneg' :
          Problem97.signedArea2 (phi (k + cut)) (phi (i + cut)) (phi (j + cut)) < 0 :=
        hneg hki hij'
      simpa [hcyc] using hneg'
    · by_cases hi : (i : ℕ) < bound
      · have hj' : bound ≤ (j : ℕ) := by omega
        have hk' : bound ≤ (k : ℕ) := by omega
        have hjk'' : j + cut < k + cut := by
          change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
          rw [hval_wrap hj', hval_wrap hk']
          omega
        have hki : k + cut < i + cut := by
          change (((k + cut : Fin n) : ℕ) < ((i + cut : Fin n) : ℕ))
          rw [hval_wrap hk', hval_nowrap hi]
          omega
        have hneg' :
            Problem97.signedArea2 (phi (j + cut)) (phi (k + cut)) (phi (i + cut)) < 0 :=
          hneg hjk'' hki
        simpa [hcyc] using hneg'
      · have hi' : bound ≤ (i : ℕ) := by omega
        have hj' : bound ≤ (j : ℕ) := by omega
        have hk' : bound ≤ (k : ℕ) := by omega
        have hij' : i + cut < j + cut := by
          change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
          rw [hval_wrap hi', hval_wrap hj']
          omega
        have hjk' : j + cut < k + cut := by
          change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
          rw [hval_wrap hj', hval_wrap hk']
          omega
        exact hneg hij' hjk'

private theorem supportCap_interval_of_oppositeFirst_local
    {A C : Finset ℝ²} {n : ℕ} {phi : Fin n → ℝ²}
    {u v w : ℝ²}
    (_hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ Problem97.OnArcOpposite u v w x)
    (hv_mem : v ∈ C)
    (hw_mem : w ∈ C)
    {u_idx v_idx w_idx : Fin n}
    (hu : phi u_idx = u)
    (hv : phi v_idx = v)
    (hw : phi w_idx = w)
    (huv : u_idx < v_idx)
    (hvw : v_idx < w_idx) :
    ∀ x : ℝ², x ∈ C ↔ ∃ q : Fin n, v_idx ≤ q ∧ q ≤ w_idx ∧ phi q = x := by
  have hu_neg : Problem97.signedArea2 u v w < 0 := by
    simpa [hu, hv, hw] using hneg huv hvw
  intro x
  constructor
  · intro hxC
    have hxA : x ∈ A := hC_subset hxC
    rw [← hphi_image] at hxA
    rcases Finset.mem_image.mp hxA with ⟨q, _, rfl⟩
    have hqA : phi q ∈ A := by
      rw [← hphi_image]
      exact Finset.mem_image_of_mem _ (Finset.mem_univ q)
    have hq_arc : Problem97.OnArcOpposite u v w (phi q) :=
      (hC_arc (phi q) hqA).1 hxC
    have hnot_lt_left : ¬ q < v_idx := by
      intro hqv
      have hq_neg : Problem97.signedArea2 (phi q) v w < 0 := by
        simpa [hv, hw] using hneg hqv hvw
      have hprod_pos :
          0 < Problem97.signedArea2 (phi q) v w * Problem97.signedArea2 u v w := by
        have h1 : 0 < -Problem97.signedArea2 (phi q) v w := by linarith
        have h2 : 0 < -Problem97.signedArea2 u v w := by linarith
        have hpos :
            0 < (-Problem97.signedArea2 (phi q) v w) *
              (-Problem97.signedArea2 u v w) := by positivity
        simpa [neg_mul_neg] using hpos
      unfold Problem97.OnArcOpposite at hq_arc
      linarith
    have hnot_lt_right : ¬ w_idx < q := by
      intro hwq
      have hq_neg_vwx : Problem97.signedArea2 v w (phi q) < 0 := by
        simpa [hv, hw] using hneg hvw hwq
      have hcyc : Problem97.signedArea2 (phi q) v w =
          Problem97.signedArea2 v w (phi q) := by
        simp [Problem97.signedArea2]
        ring
      have hq_neg : Problem97.signedArea2 (phi q) v w < 0 := by
        rw [hcyc]
        exact hq_neg_vwx
      have hprod_pos :
          0 < Problem97.signedArea2 (phi q) v w * Problem97.signedArea2 u v w := by
        have h1 : 0 < -Problem97.signedArea2 (phi q) v w := by linarith
        have h2 : 0 < -Problem97.signedArea2 u v w := by linarith
        have hpos :
            0 < (-Problem97.signedArea2 (phi q) v w) *
              (-Problem97.signedArea2 u v w) := by positivity
        simpa [neg_mul_neg] using hpos
      unfold Problem97.OnArcOpposite at hq_arc
      linarith
    exact ⟨q, le_of_not_gt hnot_lt_left, le_of_not_gt hnot_lt_right, rfl⟩
  · rintro ⟨q, hvle, hqle, rfl⟩
    have hqA : phi q ∈ A := by
      rw [← hphi_image]
      exact Finset.mem_image_of_mem _ (Finset.mem_univ q)
    rcases eq_or_lt_of_le hvle with rfl | hvq
    · simpa [hv] using hv_mem
    rcases eq_or_lt_of_le hqle with rfl | hqw
    · simpa [hw] using hw_mem
    · have hmid_neg : Problem97.signedArea2 v (phi q) w < 0 := by
        simpa [hv, hw] using hneg hvq hqw
      have hcyc : Problem97.signedArea2 (phi q) v w =
          Problem97.signedArea2 v w (phi q) := by
        simp [Problem97.signedArea2]
        ring
      have hswap : Problem97.signedArea2 v w (phi q) =
          -Problem97.signedArea2 v (phi q) w := by
        simp [Problem97.signedArea2]
      have hq_pos : 0 < Problem97.signedArea2 (phi q) v w := by
        rw [hcyc, hswap]
        linarith
      have hq_arc : Problem97.OnArcOpposite u v w (phi q) := by
        unfold Problem97.OnArcOpposite
        have hprod_nonpos :
            Problem97.signedArea2 (phi q) v w * Problem97.signedArea2 u v w ≤ 0 := by
          nlinarith
        exact hprod_nonpos
      exact (hC_arc (phi q) hqA).2 hq_arc

/-- A `C₁` interior vertex `p ∈ I₁` lies strictly on the same open side of the
base chord `v₁v₂` as the apex `v₃`.  (Made non-`private` so the v₁-anchor
faithful-frame extractor in `N4dFaithfulFrame.lean` can reuse it for the cap-`C₁`
`y`-positivity of `a₁, b₁`.) -/
theorem c1_vertex_same_open_side_as_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI1 : p ∈ S.I1) :
    0 < signedArea2 p S.triangle.v1 S.triangle.v2 *
      signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
  classical
  have hp_ne_v3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp hpI1).1
  have hp_ne_v2 : p ≠ S.triangle.v2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hpI1).2).1
  have hpC1 : p ∈ S.CP.C1 := by
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI1).2).2
  obtain ⟨n, hn, phi, hphi_inj, hphi_image, hccw⟩ :=
    Problem97.CGN.CGN4g0_globalBoundaryOrder_of_convexIndep S.hconv S.hnoncol
  haveI : NeZero n := ⟨by omega⟩
  let i0 : Fin n := 0
  have hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0 := by
    intro i j k hij hjk
    have hij_ne : phi i ≠ phi j := by
      intro h
      exact (ne_of_lt hij) (hphi_inj h)
    have hkj_ne : phi k ≠ phi j := by
      intro h
      exact (ne_of_gt hjk) (hphi_inj h)
    have hswap : Problem97.signedArea2 (phi j) (phi i) (phi k) =
        -Problem97.signedArea2 (phi i) (phi j) (phi k) := by
      simp [Problem97.signedArea2]
      ring
    have hsign :
        SignType.sign (Problem97.signedArea2 (phi j) (phi i) (phi k)) = 1 := by
      rw [Problem97.signedArea2_sign_eq_oangle_sign (phi j) (phi i) (phi k) hij_ne hkj_ne]
      exact hccw.sign_oangle hij hjk
    have hpos : 0 < Problem97.signedArea2 (phi j) (phi i) (phi k) :=
      (sign_eq_one_iff).mp hsign
    linarith
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v1_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v2_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v3_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv2A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv3A with ⟨i3, _, hi3⟩
  let psi : Fin n → ℝ² := fun t => phi (t + i1)
  have hpsi_inj : Function.Injective psi := by
    intro a b hab
    apply (finCycle i1).injective
    exact hphi_inj hab
  have hpsi_image : Finset.univ.image psi = A := by
    calc
      Finset.univ.image psi = Finset.univ.image (fun t : Fin n => phi (t + i1)) := rfl
      _ = Finset.univ.image phi := by
        ext x
        constructor
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨t, _, rfl⟩
          exact Finset.mem_image_of_mem phi (Finset.mem_univ _)
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨q, _, rfl⟩
          refine Finset.mem_image.mpr ?_
          refine ⟨q - i1, Finset.mem_univ _, ?_⟩
          simpa [psi, finCycle] using (Equiv.apply_symm_apply (finCycle i1) q)
      _ = A := hphi_image
  have hneg_shift :
      ∀ {i j k : Fin n}, i < j → j < k →
        Problem97.signedArea2 (psi i) (psi j) (psi k) < 0 := by
    intro i j k hij hjk
    simpa [psi] using
      (hneg_of_cyclicShift_local (phi := phi) hneg i1 hij hjk :
        Problem97.signedArea2 (phi (i + i1)) (phi (j + i1)) (phi (k + i1)) < 0)
  have hpsi0 : psi i0 = S.triangle.v1 := by
    simpa [psi, i0, hi1]
  have hshift_i2 : (i2 - i1) + i1 = i2 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i2)
  have hshift_i3 : (i3 - i1) + i1 = i3 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i3)
  have hi2_ne_i1 : i2 ≠ i1 := by
    intro h
    exact S.triangle.v12_ne (by simpa [hi1, hi2] using congrArg phi h.symm)
  have hi3_ne_i1 : i3 ≠ i1 := by
    intro h
    exact S.triangle.v13_ne (by simpa [hi1, hi3] using congrArg phi h.symm)
  have hi2_ne_i3 : i2 ≠ i3 := by
    intro h
    exact S.triangle.v23_ne (by simpa [hi2, hi3] using congrArg phi h)
  have hi2_pos : i0 < i2 - i1 := by
    exact Fin.pos_iff_ne_zero.mpr (by
      intro h0
      apply hi2_ne_i1
      have h := congrArg (fun t : Fin n => t + i1) h0
      simpa [i0, hshift_i2] using h)
  have hi3_pos : i0 < i3 - i1 := by
    exact Fin.pos_iff_ne_zero.mpr (by
      intro h0
      apply hi3_ne_i1
      have h := congrArg (fun t : Fin n => t + i1) h0
      simpa [i0, hshift_i3] using h)
  have hcyc {a b c : ℝ²} :
      Problem97.signedArea2 a b c = Problem97.signedArea2 c a b := by
    simp [Problem97.signedArea2]
    ring
  have hswap {a b c : ℝ²} :
      Problem97.signedArea2 a b c = -Problem97.signedArea2 a c b := by
    simp [Problem97.signedArea2]
  by_cases h23 : i2 - i1 < i3 - i1
  · have hpsi_i2 : psi (i2 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i2 - i1 ≤ q ∧ q ≤ i3 - i1 ∧ psi q = x := by
      simpa [psi, hshift_i2, hshift_i3] using
        supportCap_interval_of_oppositeFirst_local
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          (fun x hxA => (S.CP.arc_membership x hxA).1)
          S.CP.v2_mem_C1 S.CP.v3_mem_C1
          (u_idx := i0) (v_idx := i2 - i1) (w_idx := i3 - i1)
          hpsi0 hpsi_i2 hpsi_i3 hi2_pos h23
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i2
    have hq_ne_right : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i3
    have hqgt : i2 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt3 : q < i3 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) < 0 := hneg_shift hi2_pos hqgt
    have hv3_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := hneg_shift hi2_pos h23
    have hp_side : Problem97.signedArea2 p S.triangle.v1 S.triangle.v2 < 0 := by
      rw [← hqeq, ← hpsi0, ← hpsi_i2]
      simpa [hcyc] using hp_neg
    have hv3_side :
        Problem97.signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 < 0 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      simpa [hcyc] using hv3_neg
    exact mul_pos_of_neg_of_neg hp_side hv3_side
  · have h32 : i3 - i1 < i2 - i1 := by
      have hle : i3 - i1 ≤ i2 - i1 := le_of_not_gt h23
      have hne : i3 - i1 ≠ i2 - i1 := by
        intro h
        apply hi2_ne_i3
        have h' := congrArg (fun t : Fin n => t + i1) h
        simpa [hshift_i2, hshift_i3] using h'.symm
      exact lt_of_le_of_ne hle hne
    have hpsi_i2 : psi (i2 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_arc_swap :
        ∀ x ∈ A,
          x ∈ S.CP.C1 ↔ Problem97.OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x := by
      intro x hxA
      have hC1_arc := (S.CP.arc_membership x hxA).1
      constructor
      · intro hx
        have hx' : Problem97.OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 x :=
          hC1_arc.mp hx
        unfold Problem97.OnArcOpposite at hx' ⊢
        have hxswap : signedArea2 x S.triangle.v3 S.triangle.v2 =
            -signedArea2 x S.triangle.v2 S.triangle.v3 := by
          simpa using (hswap (a := x) (b := S.triangle.v3) (c := S.triangle.v2))
        have hvswap : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 =
            -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by
          simpa using (hswap (a := S.triangle.v1) (b := S.triangle.v3) (c := S.triangle.v2))
        calc
          signedArea2 x S.triangle.v3 S.triangle.v2 *
              signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2
              = (-signedArea2 x S.triangle.v2 S.triangle.v3) *
                  (-signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) := by
                    rw [hxswap, hvswap]
          _ = signedArea2 x S.triangle.v2 S.triangle.v3 *
                signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by ring
          _ ≤ 0 := hx'
      · intro hx
        have hx' : Problem97.OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x :=
          hx
        unfold Problem97.OnArcOpposite at hx'
        have hxswap : signedArea2 x S.triangle.v2 S.triangle.v3 =
            -signedArea2 x S.triangle.v3 S.triangle.v2 := by
          simpa using (hswap (a := x) (b := S.triangle.v2) (c := S.triangle.v3))
        have hvswap : signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 =
            -signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 := by
          simpa using (hswap (a := S.triangle.v1) (b := S.triangle.v2) (c := S.triangle.v3))
        have : signedArea2 x S.triangle.v2 S.triangle.v3 *
            signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 := by
          calc
            signedArea2 x S.triangle.v2 S.triangle.v3 *
                signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3
                = (-signedArea2 x S.triangle.v3 S.triangle.v2) *
                    (-signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2) := by
                      rw [hxswap, hvswap]
            _ = signedArea2 x S.triangle.v3 S.triangle.v2 *
                  signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 := by ring
            _ ≤ 0 := hx'
        exact hC1_arc.mpr this
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i3 - i1 ≤ q ∧ q ≤ i2 - i1 ∧ psi q = x := by
      simpa [psi, hshift_i2, hshift_i3] using
        supportCap_interval_of_oppositeFirst_local
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          hC1_arc_swap S.CP.v3_mem_C1 S.CP.v2_mem_C1
          (u_idx := i0) (v_idx := i3 - i1) (w_idx := i2 - i1)
          hpsi0 hpsi_i3 hpsi_i2 hi3_pos h32
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i3
    have hq_ne_right : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i2
    have hqgt : i3 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt2 : q < i2 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_mid :
        Problem97.signedArea2 (psi i0) (psi q) (psi (i2 - i1)) < 0 :=
      hneg_shift (lt_trans hi3_pos hqgt) hqlt2
    have hv3_mid :
        Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) < 0 :=
      hneg_shift hi3_pos h32
    have hp_side : 0 < Problem97.signedArea2 p S.triangle.v1 S.triangle.v2 := by
      rw [← hqeq, ← hpsi0, ← hpsi_i2]
      have hq_side : 0 < Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) := by
        have hswap_q :
            Problem97.signedArea2 (psi i0) (psi q) (psi (i2 - i1)) =
              -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) := by
          simpa using (hswap (a := psi i0) (b := psi q) (c := psi (i2 - i1)))
        have : -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) < 0 := by
          rw [← hswap_q]
          exact hp_mid
        linarith
      simpa [hcyc] using hq_side
    have hv3_side : 0 < Problem97.signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      have hv3_side' : 0 < Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
        have hswap_3 :
            Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) =
              -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
          simpa using (hswap (a := psi i0) (b := psi (i3 - i1)) (c := psi (i2 - i1)))
        have : -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := by
          rw [← hswap_3]
          exact hv3_mid
        linarith
      simpa [hcyc] using hv3_side'
    exact mul_pos hp_side hv3_side

/-- Workstream W4 layout-bound export: the escaped Form `a` at `v₁` is
impossible. -/
theorem N4dExcludesFormA_v1_of_layout
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hB2 : S.N4dExcludesFormB_v2) :
    S.N4dExcludesFormA_v1 := by
  classical
  intro r hr hcard hesc hA
  rcases hA with ⟨x, y, hxI2, hyI3, hxeq, hyeq⟩
  have hxT1 : x ∈ S.witnessClassAt_v1 r := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  rcases S.selectorShape_v2_split Z with ⟨s, hs, hT2card, hI2sub, hsplit2⟩
  have hxT2 : x ∈ S.witnessClassAt_v2 s := hI2sub hxI2
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨-, hI1sub, -, -⟩
  have hnonendpoint :
      ∀ {p : ℝ²},
        p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) →
        p ≠ S.triangle.v3 →
        S.witnessClassAt_v2 s ∩ S.CP.C1 = ({p} : Finset ℝ²) →
        False := by
    intro p hp hp_ne_v3 hpC1
    have hpT2 : p ∈ S.witnessClassAt_v2 s := by
      have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
      rw [← hpC1] at hpmem
      exact (Finset.mem_inter.mp hpmem).1
    have hpI1_or_v3 : p ∈ S.I1 ∨ p = S.triangle.v3 := by
      rcases Finset.mem_insert.mp hp with hpa1 | hp
      · left
        rw [hpa1, Z.hI1]
        simp
      rcases Finset.mem_insert.mp hp with hpb1 | hpv3
      · left
        rw [hpb1, Z.hI1]
        simp
      · right
        simpa using hpv3
    rcases hpI1_or_v3 with hpI1 | hpv3
    · have hpT1 : p ∈ S.witnessClassAt_v1 r := hI1sub hpI1
      have hpC1 : p ∈ S.CP.C1 := by
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI1).2).2
      have hxv1 : dist S.triangle.v1 x = r := by
        simpa using (Finset.mem_filter.mp hxT1).2
      have hpv1 : dist S.triangle.v1 p = r := by
        simpa using (Finset.mem_filter.mp hpT1).2
      have hxv2 : dist S.triangle.v2 x = s := by
        simpa using (Finset.mem_filter.mp hxT2).2
      have hpv2 : dist S.triangle.v2 p = s := by
        simpa using (Finset.mem_filter.mp hpT2).2
      have hxp : x ≠ p := by
        intro hxp
        have hxC2 : x ∈ S.CP.C2 := by
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
        have hxA : x ∈ A := S.CP.C2_subset hxC2
        have hx_ne_v1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hxI2).1
        have hx_ne_v3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
        have hx_ne_v2 : x ≠ S.triangle.v2 := by
          intro hxv2
          exact S.CP.v2_notin_C2 (by simpa [hxv2] using hxC2)
        have hxnonmoser : x ∉ S.triangle.verts := by
          simp [Problem97.MoserTriangle.verts, hx_ne_v1, hx_ne_v2, hx_ne_v3]
        have hxC1 : x ∈ S.CP.C1 := by
          simpa [hxp] using hpC1
        have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
        by_cases hxC3 : x ∈ S.CP.C3
        · have : (3 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxC3] using hone
          omega
        · have : (2 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxC3] using hone
          omega
      have hx_side :
          0 < signedArea2 x S.triangle.v1 S.triangle.v2 *
            signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
        S.c2_vertex_same_open_side_as_v3 hxI2
      have hp_side :
          0 < signedArea2 p S.triangle.v1 S.triangle.v2 *
            signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
        c1_vertex_same_open_side_as_v3 S hpI1
      have hmid :
          signedArea2 (midpoint ℝ x p) S.triangle.v1 S.triangle.v2 = 0 :=
        twoCircle_midpoint_collinear
          (by simpa [dist_comm] using hpv1)
          (by simpa [dist_comm] using hxv1)
          (by simpa [dist_comm] using hpv2)
          (by simpa [dist_comm] using hxv2)
          hxp.symm
      have hreflect :
          signedArea2 p S.triangle.v1 S.triangle.v2 =
            -signedArea2 x S.triangle.v1 S.triangle.v2 :=
        signedArea2_reflection_neg
          (q := S.triangle.v1) (v2 := S.triangle.v2) (y := x) (u := p) hmid
      rw [hreflect] at hp_side
      linarith
    · exact False.elim (hp_ne_v3 hpv3)
  have hnonendpoint_or_endpoint :
      ∀ {p q : ℝ²},
        p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) →
        q ∈ S.I3 →
        S.witnessClassAt_v2 s ∩ S.CP.C1 = ({p} : Finset ℝ²) →
        S.witnessClassAt_v2 s ∩ S.CP.C3 = ({q} : Finset ℝ²) →
        False := by
    intro p q hp hqI3 hpC1 hqC3
    by_cases hpv3 : p = S.triangle.v3
    · have hs_pos : 0 < s := by
        have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
          have hmem : p ∈ ({p} : Finset ℝ²) := by simp
          rw [← hpC1] at hmem
          rw [hpv3] at hmem
          exact (Finset.mem_inter.mp hmem).1
        have hv3dist : dist S.triangle.v2 S.triangle.v3 = s :=
          (Finset.mem_filter.mp hv3T2).2
        have hdist_pos : 0 < dist S.triangle.v2 S.triangle.v3 :=
          dist_pos.mpr S.triangle.v23_ne
        rwa [← hv3dist]
      have hcard2 : 4 ≤ (S.witnessClassAt_v2 s).card := by
        omega
      have hqT2 : q ∈ S.witnessClassAt_v2 s := by
        have hmem : q ∈ ({q} : Finset ℝ²) := by simp
        rw [← hqC3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hqC3mem : q ∈ S.CP.C3 := by
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).2
      have hqA : q ∈ A := S.CP.C3_subset hqC3mem
      have hq_ne_v2 : q ≠ S.triangle.v2 := (Finset.mem_erase.mp hqI3).1
      have hq_ne_v1 : q ≠ S.triangle.v1 :=
        (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
      have hq_ne_v3 : q ≠ S.triangle.v3 := by
        intro h
        exact S.CP.v3_notin_C3 (by simpa [h] using hqC3mem)
      have hq_nonmoser : q ∉ S.triangle.verts := by
        simp [Problem97.MoserTriangle.verts, hq_ne_v1, hq_ne_v2, hq_ne_v3]
      have hq_not_C2 : q ∉ S.CP.C2 := by
        intro hqC2
        have hone := S.CP.nonmoser_in_one q hqA hq_nonmoser
        by_cases hqC1 : q ∈ S.CP.C1
        · have : (3 : ℕ) = 1 := by
            simpa [hqC1, hqC2, hqC3mem] using hone
          omega
        · have : (2 : ℕ) = 1 := by
            simpa [hqC1, hqC2, hqC3mem] using hone
          omega
      have hesc2 : ¬ S.witnessClassAt_v2 s ⊆ S.CP.C2 := by
        intro hsub
        exact hq_not_C2 (hsub hqT2)
      have hB : S.IsFormB_v2 s := by
        exact ⟨q, hqI3, hqC3, by simpa [hpv3] using hpC1⟩
      exact hB2 hs_pos hcard2 hesc2 hB
    · exact hnonendpoint hp hpv3 hpC1
  rcases hsplit2 with hqv1 | hqa3 | hqb3
  · rcases hqv1 with ⟨p, hp, hpC1, hpC3⟩
    by_cases hpv3 : p = S.triangle.v3
    · exact S.formA_v1_endpointPair_impossible Z hr hcard
        ⟨x, y, hxI2, hyI3, hxeq, hyeq⟩ hT2card hI2sub
        (by simpa [hpv3] using hpC1) hpC3
    · exact hnonendpoint hp hpv3 hpC1
  · rcases hqa3 with ⟨p, hp, hpC1, hpC3⟩
    have ha3I3 : Z.a3 ∈ S.I3 := by
      rw [Z.hI3]
      simp
    exact hnonendpoint_or_endpoint hp ha3I3 hpC1 hpC3
  · rcases hqb3 with ⟨p, hp, hpC1, hpC3⟩
    have hb3I3 : Z.b3 ∈ S.I3 := by
      rw [Z.hI3]
      simp
    exact hnonendpoint_or_endpoint hp hb3I3 hpC1 hpC3

/-- Workstream W4 export: the escaped Form `a` at `v₁` is impossible. -/
theorem N4dExcludesFormA_v1_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hB2 : S.N4dExcludesFormB_v2) :
    S.N4dExcludesFormA_v1 :=
  S.N4dExcludesFormA_v1_of_layout S.zeroDefectCapLayout hB2

end FiniteEndpointShell

end Problem97
