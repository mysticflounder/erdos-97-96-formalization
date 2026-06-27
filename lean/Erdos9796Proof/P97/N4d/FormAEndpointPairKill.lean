import Erdos9796Proof.P97.N9Endpoint.N4e
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Form-`a` `v₁` endpoint-endpoint kill (W3 leaf)

This module discharges the single remaining endpoint-endpoint leaf of the
`v₁` Form-`a` exclusion `N4dExcludesFormA_v1_of_layout`: the sub-case in which
the forced `v₂` selector class `wc_v2 s` meets `C₁` in `{v₃}` and meets `C₃`
in `{v₁}` (the *endpoint-endpoint packet*).

Together with `Form a` at `v₁` (an interior witness `x ∈ I₂` and `y ∈ I₃` both
on the `v₁`-circle of radius `r`), this packet pins the triangle to an
isosceles/equilateral shape that the forced `v₃` selector cannot realise.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

private theorem hneg_of_cyclicShift_local'
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

private theorem supportCap_interval_of_oppositeFirst_local'
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
chord `v₁v₃` as the opposite apex `v₂`.  (Local copy of the `private`
`c1_vertex_same_open_side_as_v2` from `N4dFormCcB1UpperArc.lean`, which is not
importable here without an import cycle through `N4dFaithfulFrame`.) -/
private theorem c1_vertex_same_open_side_as_v2'
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI1 : p ∈ S.I1) :
    0 < signedArea2 p S.triangle.v1 S.triangle.v3 *
      signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
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
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v3_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v2_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv3A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv2A with ⟨i3, _, hi3⟩
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
      (hneg_of_cyclicShift_local' (phi := phi) hneg i1 hij hjk :
        Problem97.signedArea2 (phi (i + i1)) (phi (j + i1)) (phi (k + i1)) < 0)
  have hpsi0 : psi i0 = S.triangle.v1 := by
    simpa [psi, i0, hi1]
  have hshift_i2 : (i2 - i1) + i1 = i2 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i2)
  have hshift_i3 : (i3 - i1) + i1 = i3 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i3)
  have hi2_ne_i1 : i2 ≠ i1 := by
    intro h
    exact S.triangle.v13_ne (by simpa [hi1, hi2] using congrArg phi h.symm)
  have hi3_ne_i1 : i3 ≠ i1 := by
    intro h
    exact S.triangle.v12_ne (by simpa [hi1, hi3] using congrArg phi h.symm)
  have hi2_ne_i3 : i2 ≠ i3 := by
    intro h
    exact S.triangle.v23_ne.symm (by simpa [hi2, hi3] using congrArg phi h)
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
  · have hpsi_i2 : psi (i2 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i2 - i1 ≤ q ∧ q ≤ i3 - i1 ∧ psi q = x := by
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
      simpa [psi, hshift_i2, hshift_i3] using
        supportCap_interval_of_oppositeFirst_local'
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          hC1_arc_swap
          S.CP.v3_mem_C1 S.CP.v2_mem_C1
          (u_idx := i0) (v_idx := i2 - i1) (w_idx := i3 - i1)
          hpsi0 hpsi_i2 hpsi_i3 hi2_pos h23
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i2
    have hq_ne_right : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i3
    have hqgt : i2 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt3 : q < i3 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) < 0 := hneg_shift hi2_pos hqgt
    have hv2_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := hneg_shift hi2_pos h23
    have hp_side : Problem97.signedArea2 p S.triangle.v1 S.triangle.v3 < 0 := by
      rw [← hqeq, ← hpsi0, ← hpsi_i2]
      simpa [hcyc] using hp_neg
    have hv2_side :
        Problem97.signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 < 0 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      simpa [hcyc] using hv2_neg
    exact mul_pos_of_neg_of_neg hp_side hv2_side
  · have h32 : i3 - i1 < i2 - i1 := by
      have hle : i3 - i1 ≤ i2 - i1 := le_of_not_gt h23
      have hne : i3 - i1 ≠ i2 - i1 := by
        intro h
        apply hi2_ne_i3
        have h' := congrArg (fun t : Fin n => t + i1) h
        simpa [hshift_i2, hshift_i3] using h'.symm
      exact lt_of_le_of_ne hle hne
    have hpsi_i2 : psi (i2 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i3 - i1 ≤ q ∧ q ≤ i2 - i1 ∧ psi q = x := by
      simpa [psi, hshift_i2, hshift_i3] using
        supportCap_interval_of_oppositeFirst_local'
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          (fun x hxA => (S.CP.arc_membership x hxA).1) S.CP.v2_mem_C1 S.CP.v3_mem_C1
          (u_idx := i0) (v_idx := i3 - i1) (w_idx := i2 - i1)
          hpsi0 hpsi_i3 hpsi_i2 hi3_pos h32
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i3
    have hq_ne_right : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i2
    have hqgt : i3 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt2 : q < i2 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_mid :
        Problem97.signedArea2 (psi i0) (psi q) (psi (i2 - i1)) < 0 :=
      hneg_shift (lt_trans hi3_pos hqgt) hqlt2
    have hv2_mid :
        Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) < 0 :=
      hneg_shift hi3_pos h32
    have hp_side : 0 < Problem97.signedArea2 p S.triangle.v1 S.triangle.v3 := by
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
    have hv2_side : 0 < Problem97.signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      have hv2_side' : 0 < Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
        have hswap_3 :
            Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) =
              -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
          simpa using (hswap (a := psi i0) (b := psi (i3 - i1)) (c := psi (i2 - i1)))
        have : -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := by
          rw [← hswap_3]
          exact hv2_mid
        linarith
      simpa [hcyc] using hv2_side'
    exact mul_pos hp_side hv2_side

private theorem c3_sameSide_core' (p q s t c : ℝ)
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
/-- A `C₃` interior vertex `a₃ ∈ I₃` lies strictly on the same open side of the
chord `v₁v₃` as the opposite apex `v₂`.  (Local copy of the `private`
`c3_vertex_same_open_side_as_v2` from `N4dFormCcB1UpperArc.lean`, which is not
importable here without an import cycle through `N4dFaithfulFrame`.) -/
private theorem c3_vertex_same_open_side_as_v2'
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
  have haC2 : a ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).2
  have ha_ne_v1 : a ≠ q1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).1
  have ha_ne_v3 : a ≠ q3 := (Finset.mem_erase.mp ha2).1
  have haA : a ∈ A := S.CP.C3_subset haC2
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
  have hav3v1_ne : signedArea2 a q3 q1 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a, q3, q1} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a q3 q1 hΔ
    have hconv : ConvexIndep A := S.hconv
    have h3A : q3 ∈ A := S.triangle.v2_mem
    have h1A : q1 ∈ A := S.triangle.v1_mem
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    · apply hconv q3 (by exact_mod_cast h3A)
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
    · apply hconv q1 (by exact_mod_cast h1A)
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
    · apply hconv a (by exact_mod_cast haA)
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
  have harc : signedArea2 a q3 q1 * signedArea2 q2 q3 q1 < 0 :=
    lt_of_le_of_ne harc_le (mul_ne_zero hav3v1_ne hv2v3v1_ne)
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
  have hdiff : ∀ z w : ℝ², z - w = (X z - X w) • u + (Y z - Y w) • nvec := by
    intro z w
    have : (z - M) - (w - M) = z - w := by abel
    rw [← this, hsum_pt z, hsum_pt w, sub_smul, sub_smul]; abel
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
  have hca : signedArea2 center q1 q2 = yc * ‖u‖ ^ 2 := by
    have hyc : Y center = yc := rfl
    rw [harea_gen center q1 q2, hX_q1, hY_q1, hX_q2, hY_q2, hXc, hyc]; ring
  have hc3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
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
  have hcore : 0 < Y a * Y q3 :=
    c3_sameSide_core' (X a) (Y a) (X q3) (Y q3) yc hcenter_q3 hARC hD hC1
  have hsa_a : signedArea2 a q1 q2 = Y a * ‖u‖ ^ 2 := by
    rw [harea_gen a q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hsa_3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  change 0 < signedArea2 a q1 q2 * signedArea2 q3 q1 q2
  rw [hsa_a, hsa_3]
  have : Y a * ‖u‖ ^ 2 * (Y q3 * ‖u‖ ^ 2) = (Y a * Y q3) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by ring
  rw [this]
  exact mul_pos hcore (mul_pos hu_sq_pos hu_sq_pos)

/-- Three distinct `A`-points are non-collinear under `ConvexIndep`, hence have
nonzero signed area.  (Local copy of `ArcPartitionCount`'s private helper, used by
the `K4` budget sieves; reuses the `wbtw`-trichotomy / `convexHull` argument that
already appears inline several times in this file.) -/
private theorem signedArea2_ne_zero_of_convexIndep_local
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {v1 v2 v3 : ℝ²} (h1A : v1 ∈ A) (h2A : v2 ∈ A) (h3A : v3 ∈ A)
    (h12 : v1 ≠ v2) (h23 : v2 ≠ v3) (h13 : v1 ≠ v3) :
    signedArea2 v1 v2 v3 ≠ 0 := by
  intro hΔ
  have hcol : Collinear ℝ ({v1, v2, v3} : Set ℝ²) :=
    Problem97.collinear_of_signedArea2_eq_zero v1 v2 v3 hΔ
  rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
  · apply hA v2 (by exact_mod_cast h2A)
    have hseg : v2 ∈ segment ℝ v1 v3 := hw.mem_segment
    rw [← convexHull_pair] at hseg
    refine convexHull_mono ?_ hseg
    intro z hz; rcases hz with rfl | hz
    · exact ⟨by exact_mod_cast h1A, by
        simp only [Set.mem_singleton_iff]; exact fun h => h12 h⟩
    · rcases hz with rfl
      exact ⟨by exact_mod_cast h3A, by
        simp only [Set.mem_singleton_iff]; exact fun h => h23 h.symm⟩
  · apply hA v3 (by exact_mod_cast h3A)
    have hseg : v3 ∈ segment ℝ v2 v1 := hw.mem_segment
    rw [← convexHull_pair] at hseg
    refine convexHull_mono ?_ hseg
    intro z hz; rcases hz with rfl | hz
    · exact ⟨by exact_mod_cast h2A, by
        simp only [Set.mem_singleton_iff]; exact fun h => h23 h⟩
    · rcases hz with rfl
      exact ⟨by exact_mod_cast h1A, by
        simp only [Set.mem_singleton_iff]; exact fun h => h13 h⟩
  · apply hA v1 (by exact_mod_cast h1A)
    have hseg : v1 ∈ segment ℝ v3 v2 := hw.mem_segment
    rw [← convexHull_pair] at hseg
    refine convexHull_mono ?_ hseg
    intro z hz; rcases hz with rfl | hz
    · exact ⟨by exact_mod_cast h3A, by
        simp only [Set.mem_singleton_iff]; exact fun h => h13 h.symm⟩
    · rcases hz with rfl
      exact ⟨by exact_mod_cast h2A, by
        simp only [Set.mem_singleton_iff]; exact fun h => h12 h.symm⟩

/-- **Bisector-separation master tool.**  If `u ≠ w` are both at distance `τ`
from a center `c` and both at distance `ρ` from a point `x`, then the line `x c`
is the perpendicular bisector of `uw`, so `u` and `w` lie on strictly opposite
open sides of that line (assuming `u` is not collinear with `c, x`). -/
private theorem bisector_separates
    {c x u w : ℝ²} {τ ρ : ℝ}
    (huc : dist u c = τ) (hwc : dist w c = τ)
    (hux : dist u x = ρ) (hwx : dist w x = ρ)
    (hne : u ≠ w)
    (hucol : signedArea2 u c x ≠ 0) :
    signedArea2 u c x * signedArea2 w c x < 0 := by
  have hmid : signedArea2 (midpoint ℝ w u) c x = 0 :=
    twoCircle_midpoint_collinear huc hwc hux hwx hne
  have hrefl : signedArea2 u c x = - signedArea2 w c x :=
    signedArea2_reflection_neg hmid
  have hwne : signedArea2 w c x ≠ 0 := by
    intro h; apply hucol; rw [hrefl, h]; ring
  rw [hrefl]
  nlinarith [sq_pos_of_ne_zero hwne]

/-- **Sieve step.**  Suppose every point of a finite set `P` that is distinct
from `x` lies on the circle `S(c, τ)` and strictly on one fixed open side of the
line `x c` (formalized by `signedArea2 · c x` all having the same sign as a
reference value `σ ≠ 0`).  Then at most one point of `P` can also lie on the
circle `S(x, ρ)`: any two such points would be separated by the line `x c` by
`bisector_separates`, contradicting same-sidedness. -/
private theorem sieve_at_most_one_on_xcircle
    {c x : ℝ²} {τ ρ σ : ℝ}
    {P : Finset ℝ²}
    (hcirc : ∀ p ∈ P, dist p c = τ)
    (hside : ∀ p ∈ P, 0 < signedArea2 p c x * σ) :
    (P.filter (fun p => dist p x = ρ)).card ≤ 1 := by
  classical
  rw [Finset.card_le_one]
  intro u hu w hw
  rcases Finset.mem_filter.mp hu with ⟨huP, hux⟩
  rcases Finset.mem_filter.mp hw with ⟨hwP, hwx⟩
  by_contra hne
  have huc : dist u c = τ := hcirc u huP
  have hwc : dist w c = τ := hcirc w hwP
  have husgn : 0 < signedArea2 u c x * σ := hside u huP
  have hwsgn : 0 < signedArea2 w c x * σ := hside w hwP
  have hucol : signedArea2 u c x ≠ 0 := by
    intro h; rw [h, zero_mul] at husgn; exact lt_irrefl 0 husgn
  have hsep : signedArea2 u c x * signedArea2 w c x < 0 :=
    bisector_separates huc hwc hux hwx hne hucol
  -- Same side: both signed areas have the same sign as `σ`, so their product is
  -- positive — contradicting the separation.
  nlinarith [mul_pos husgn hwsgn, sq_nonneg σ, hsep]

/- ### Cyclic-interval frame infrastructure for the variable chord `v₃–x`

The two same-side certificates below (`same_side_of_chord_endpoint_thales`,
`same_side_of_chord_capPair`) reduce to *index-interval position* facts on the
global CCW boundary order `φ` of `A` (from
`CGN4g0_globalBoundaryOrder_of_convexIndep`).  We package the boundary order as a
*descending* signed-area predicate `hneg` (every increasing index triple gives a
strictly negative signed area), shift the enumeration so the apex `v₂` sits at
index `0`, and read off the side of each point against the chord `v₃–x` purely
from index comparisons.  These helpers are local copies of the cyclic-shift /
interval machinery already used by `c1_vertex_same_open_side_as_v2'`. -/

/-- The global CCW boundary order of `A`, packaged as the *descending* signed-area
predicate `hneg` (increasing index triple ⟹ strictly negative signed area). -/
private theorem boundaryOrder_hneg
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ (n : ℕ) (phi : Fin n → ℝ²),
      Function.Injective phi ∧ Finset.univ.image phi = A ∧
      (∀ {i j k : Fin n}, i < j → j < k →
        Problem97.signedArea2 (phi i) (phi j) (phi k) < 0) ∧ 0 < n := by
  classical
  obtain ⟨n, hn, phi, hphi_inj, hphi_image, hccw⟩ :=
    Problem97.CGN.CGN4g0_globalBoundaryOrder_of_convexIndep S.hconv S.hnoncol
  refine ⟨n, phi, hphi_inj, hphi_image, ?_, by omega⟩
  intro i j k hij hjk
  have hij_ne : phi i ≠ phi j := fun h => (ne_of_lt hij) (hphi_inj h)
  have hkj_ne : phi k ≠ phi j := fun h => (ne_of_gt hjk) (hphi_inj h)
  have hsign : SignType.sign (Problem97.signedArea2 (phi j) (phi i) (phi k)) = 1 := by
    rw [Problem97.signedArea2_sign_eq_oangle_sign (phi j) (phi i) (phi k) hij_ne hkj_ne]
    exact hccw.sign_oangle hij hjk
  have hpos : 0 < Problem97.signedArea2 (phi j) (phi i) (phi k) := (sign_eq_one_iff).mp hsign
  have hswap : Problem97.signedArea2 (phi j) (phi i) (phi k) =
      -Problem97.signedArea2 (phi i) (phi j) (phi k) := by simp [Problem97.signedArea2]; ring
  linarith

/-- Cyclically shift a descending boundary order to put `phi ic` at index `0`.
Returns the shifted enumeration `psi`, its descending predicate, and the
reindexing `psi (i - ic) = phi i`. -/
private theorem shift_boundaryOrder
    {A : Finset ℝ²} {n : ℕ} [NeZero n] {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (ic : Fin n) :
    ∃ psi : Fin n → ℝ², Function.Injective psi ∧ Finset.univ.image psi = A ∧
      (∀ {i j k : Fin n}, i < j → j < k →
        Problem97.signedArea2 (psi i) (psi j) (psi k) < 0) ∧
      (∀ i : Fin n, psi (i - ic) = phi i) := by
  classical
  refine ⟨fun t => phi (t + ic), ?_, ?_, ?_, ?_⟩
  · intro a b hab; apply (finCycle ic).injective; exact hphi_inj hab
  · ext y
    constructor
    · intro hy; rcases Finset.mem_image.mp hy with ⟨t, _, rfl⟩
      rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ _)
    · intro hy; rw [← hphi_image] at hy
      rcases Finset.mem_image.mp hy with ⟨q, _, rfl⟩
      refine Finset.mem_image.mpr ⟨q - ic, Finset.mem_univ _, ?_⟩; simp
  · intro i j k hij hjk; exact hneg_of_cyclicShift_local' (phi := phi) hneg ic hij hjk
  · intro i; simp

/-- Chord-side sign `< 0`, ascending apex case: `a < b < c ⟹ signedArea2 a b c < 0`. -/
private theorem sa_neg_abc {n : ℕ} {psi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (psi i) (psi j) (psi k) < 0)
    {a b c : Fin n} (h1 : a < b) (h2 : b < c) :
    Problem97.signedArea2 (psi a) (psi b) (psi c) < 0 := hneg h1 h2

/-- Chord-side sign `< 0`, trailing apex case: `b < c < a ⟹ signedArea2 a b c < 0`. -/
private theorem sa_neg_bca {n : ℕ} {psi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (psi i) (psi j) (psi k) < 0)
    {a b c : Fin n} (h1 : b < c) (h2 : c < a) :
    Problem97.signedArea2 (psi a) (psi b) (psi c) < 0 := by
  have hcyc {p q r : ℝ²} :
      Problem97.signedArea2 p q r = Problem97.signedArea2 r p q := by
    simp only [Problem97.signedArea2]; ring
  rw [hcyc, hcyc]; exact hneg h1 h2

/-- Chord-side sign `> 0`, interleaved case: `a < c < b ⟹ 0 < signedArea2 a b c`. -/
private theorem sa_pos_acb {n : ℕ} {psi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (psi i) (psi j) (psi k) < 0)
    {a b c : Fin n} (h1 : a < c) (h2 : c < b) :
    0 < Problem97.signedArea2 (psi a) (psi b) (psi c) := by
  have hswap {p q r : ℝ²} :
      Problem97.signedArea2 p q r = - Problem97.signedArea2 p r q := by
    simp only [Problem97.signedArea2]; ring
  have h := hneg h1 h2; rw [hswap]; linarith

/-- Strictly-between vertex is on the positive side of its bracketing chord:
`iq < ipt < ir ⟹ 0 < signedArea2 (psi ipt) (psi iq) (psi ir)`. -/
private theorem sa_pos_between {n : ℕ} {psi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (psi i) (psi j) (psi k) < 0)
    {iq ipt ir : Fin n} (h1 : iq < ipt) (h2 : ipt < ir) :
    0 < Problem97.signedArea2 (psi ipt) (psi iq) (psi ir) := by
  have hcyc {p q r : ℝ²} :
      Problem97.signedArea2 p q r = Problem97.signedArea2 r p q := by
    simp only [Problem97.signedArea2]; ring
  rw [hcyc, hcyc]; exact sa_pos_acb hneg h1 h2

/-- **Arc-opposite ⟹ index strictly between (opposite-outside form).**  If the
arc-defining apex `ip` is outside the index interval `[iq, ir]` (`ip < iq` or
`ir < ip`) and `ipt` lies on `OnArcOpposite (psi ip) (psi iq) (psi ir)` (with
`ipt ∉ {iq, ir}`), then `iq < ipt < ir`. -/
private theorem index_between_of_onArc {n : ℕ} {psi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (psi i) (psi j) (psi k) < 0)
    {ip iq ir ipt : Fin n} (hqr : iq < ir) (hp : ip < iq ∨ ir < ip)
    (hne_q : ipt ≠ iq) (hne_r : ipt ≠ ir)
    (harc : Problem97.OnArcOpposite (psi ip) (psi iq) (psi ir) (psi ipt)) :
    iq < ipt ∧ ipt < ir := by
  unfold Problem97.OnArcOpposite at harc
  have hp_neg : Problem97.signedArea2 (psi ip) (psi iq) (psi ir) < 0 := by
    rcases hp with h | h
    · exact sa_neg_abc hneg h hqr
    · exact sa_neg_bca hneg hqr h
  have hpt_nonneg : 0 ≤ Problem97.signedArea2 (psi ipt) (psi iq) (psi ir) := by
    nlinarith [harc, hp_neg]
  rcases lt_trichotomy ipt iq with h | h | h
  · exfalso
    have : Problem97.signedArea2 (psi ipt) (psi iq) (psi ir) < 0 := sa_neg_abc hneg h hqr
    linarith
  · exact absurd h hne_q
  · rcases lt_trichotomy ipt ir with h2 | h2 | h2
    · exact ⟨h, h2⟩
    · exact absurd h2 hne_r
    · exfalso
      have : Problem97.signedArea2 (psi ipt) (psi iq) (psi ir) < 0 := sa_neg_bca hneg hqr h2
      linarith

/-- **Arc-opposite ⟹ index strictly outside (opposite-inside / wrap form).**  If
the apex `ip` lies *inside* the index interval `(iq, ir)` then a point `ipt` on
`OnArcOpposite (psi ip) (psi iq) (psi ir)` (with `ipt ∉ {iq, ir}`) is *outside*
the interval: `ipt < iq` or `ir < ipt`.  This handles the orientation in which
the cap wraps the chosen enumeration cut. -/
private theorem index_outside_of_onArc {n : ℕ} {psi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (psi i) (psi j) (psi k) < 0)
    {ip iq ir ipt : Fin n} (hp1 : iq < ip) (hp2 : ip < ir)
    (hne_q : ipt ≠ iq) (hne_r : ipt ≠ ir)
    (harc : Problem97.OnArcOpposite (psi ip) (psi iq) (psi ir) (psi ipt)) :
    ipt < iq ∨ ir < ipt := by
  unfold Problem97.OnArcOpposite at harc
  have hp_pos : 0 < Problem97.signedArea2 (psi ip) (psi iq) (psi ir) :=
    sa_pos_between hneg hp1 hp2
  have hpt_nonpos : Problem97.signedArea2 (psi ipt) (psi iq) (psi ir) ≤ 0 := by
    nlinarith [harc, hp_pos]
  rcases lt_trichotomy ipt iq with h | h | h
  · exact Or.inl h
  · exact absurd h hne_q
  · rcases lt_trichotomy ipt ir with h2 | h2 | h2
    · exfalso
      have : 0 < Problem97.signedArea2 (psi ipt) (psi iq) (psi ir) := sa_pos_between hneg h h2
      linarith
    · exact absurd h2 hne_r
    · exact Or.inr h2

/-- `OnArcOpposite` is symmetric in its two chord-endpoint slots (frame form). -/
private theorem onArc_swap_psi {n : ℕ} {psi : Fin n → ℝ²} {ip iq ir ipt : Fin n}
    (h : Problem97.OnArcOpposite (psi ip) (psi iq) (psi ir) (psi ipt)) :
    Problem97.OnArcOpposite (psi ip) (psi ir) (psi iq) (psi ipt) := by
  unfold Problem97.OnArcOpposite at h ⊢
  have e1 : signedArea2 (psi ipt) (psi ir) (psi iq) =
      - signedArea2 (psi ipt) (psi iq) (psi ir) := by simp only [Problem97.signedArea2]; ring
  have e2 : signedArea2 (psi ip) (psi ir) (psi iq) =
      - signedArea2 (psi ip) (psi iq) (psi ir) := by simp only [Problem97.signedArea2]; ring
  rw [e1, e2]; nlinarith [h]

/-- `C₂` arc-membership in chord-endpoint-swapped form: `z ∈ C₂` iff
`OnArcOpposite v₂ v₁ v₃ z` (the swap of the canonical `OnArcOpposite v₂ v₃ v₁`),
used when the boundary order places `v₁` before `v₃`. -/
private theorem c2_arc_swap {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∀ z ∈ A, z ∈ S.CP.C2 ↔
      Problem97.OnArcOpposite S.triangle.v2 S.triangle.v1 S.triangle.v3 z := by
  intro z hzA
  rw [(S.CP.arc_membership z hzA).2.1]
  unfold Problem97.OnArcOpposite
  constructor
  · intro hx
    have e1 : signedArea2 z S.triangle.v1 S.triangle.v3 =
        - signedArea2 z S.triangle.v3 S.triangle.v1 := by
      simp only [Problem97.signedArea2]; ring
    have e2 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 =
        - signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by
      simp only [Problem97.signedArea2]; ring
    rw [e1, e2]; nlinarith [hx]
  · intro hx
    have e1 : signedArea2 z S.triangle.v3 S.triangle.v1 =
        - signedArea2 z S.triangle.v1 S.triangle.v3 := by
      simp only [Problem97.signedArea2]; ring
    have e2 : signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 =
        - signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
      simp only [Problem97.signedArea2]; ring
    rw [e1, e2]; nlinarith [hx]

/-- **(P-v₂) Apex-endpoint same-side certificate for the variable chord `v₃–x`.**
For an `I₂` interior point `x` with the apex `v₂` equidistant from both chord
endpoints `v₃` and `x` (`dist v₂ v₃ = dist v₂ x`), the apex `v₂` and the opposite
Moser vertex `v₁` lie strictly on the **same** open side of the chord `v₃–x`:

  `0 < signedArea2 v₂ v₃ x · signedArea2 v₁ v₃ x`.

This is the (P-v₂) half of the variable-chord same-side certificate
`c3_same_side_of_v3x_chord`.  Together with `(P-a₃)` it feeds the
sign-transitivity reduction
(`Problem97.signedArea_prod_pos_trans`, common reference `v₁`).

**Proof (cyclic-interval position).**  Shift the global CCW boundary order
(`boundaryOrder_hneg` from `CGN4g0_globalBoundaryOrder_of_convexIndep`) so the
apex `v₂` sits at index `0` (`shift_boundaryOrder`).  The cap `C₂` is the
opposite-`v₂` arc, so `supportCap_interval_of_oppositeFirst_local'` puts `x`'s
index strictly between the `v₃` and `v₁` indices (`jv3 < ix < jv1` up to the
orientation swap).  With `v₂` at `0`, both `v₁` and `v₂` then sit on the same
strict side of the chord `v₃–x` (both negative when `jv3 < jv1`, both positive
when `jv1 < jv3`), via the `sa_neg_*` / `sa_pos_acb` index-sign helpers.  See
`capSide_same_side` (`U2WitnessReflectionKernel`) for the analogous fixed-apex
pattern, and memories `0CQMNA`/`NA3N89`. -/
private theorem same_side_of_chord_endpoint_thales
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} {t : ℝ}
    (hxI2 : x ∈ S.I2)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t)
    (hv2x : dist S.triangle.v2 x = t) :
    0 < signedArea2 S.triangle.v2 S.triangle.v3 x *
        signedArea2 S.triangle.v1 S.triangle.v3 x := by
  classical
  -- `x ∈ I₂ = (C₂.erase v₃).erase v₁`: membership and distinctness from the
  -- chord endpoint `v₃` and the far Moser vertex `v₁`.
  have hxC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hx_ne_v3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
  have hx_ne_v1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hxI2).1
  -- Global CCW boundary order as a descending signed-area predicate, then shift
  -- the apex `v₂` to index `0`.
  obtain ⟨n, phi, hphi_inj, hphi_image, hneg, hnpos⟩ := boundaryOrder_hneg S
  haveI : NeZero n := ⟨by omega⟩
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v1_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v2_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v3_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv2A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv3A with ⟨i3, _, hi3⟩
  obtain ⟨psi, hpsi_inj, hpsi_image, hneg_s, hpsi_re⟩ :=
    shift_boundaryOrder hphi_inj hphi_image hneg i2
  set jv2 : Fin n := i2 - i2 with hjv2def
  set jv3 : Fin n := i3 - i2 with hjv3def
  set jv1 : Fin n := i1 - i2 with hjv1def
  have hpv2 : psi jv2 = S.triangle.v2 := by rw [hjv2def, hpsi_re, hi2]
  have hpv3 : psi jv3 = S.triangle.v3 := by rw [hjv3def, hpsi_re, hi3]
  have hpv1 : psi jv1 = S.triangle.v1 := by rw [hjv1def, hpsi_re, hi1]
  have hjv2_zero : jv2 = 0 := by rw [hjv2def]; exact sub_self i2
  have hv3_ne_v2 : jv3 ≠ jv2 := fun h => S.triangle.v23_ne.symm (by rw [← hpv3, ← hpv2, h])
  have hv1_ne_v2 : jv1 ≠ jv2 := fun h => S.triangle.v12_ne (by rw [← hpv1, ← hpv2, h])
  have hv1_ne_v3 : jv1 ≠ jv3 := fun h => S.triangle.v13_ne (by rw [← hpv1, ← hpv3, h])
  have h0_lt_jv3 : jv2 < jv3 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv3_ne_v2 (hjv2_zero ▸ h))
  have h0_lt_jv1 : jv2 < jv1 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv1_ne_v2 (hjv2_zero ▸ h))
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  -- Two orientation branches on the relative index order of `v₃` and `v₁`.
  by_cases h31 : jv3 < jv1
  · -- `v₂ = 0 < jv3 < jv1`; `C₂` is the clean index block `[jv3, jv1]`.
    have hC2int := supportCap_interval_of_oppositeFirst_local'
      (A := A) (C := S.CP.C2) (phi := psi) (u := S.triangle.v2) (v := S.triangle.v3)
        (w := S.triangle.v1)
      hpsi_inj hpsi_image hneg_s S.CP.C2_subset
      (fun z hzA => (S.CP.arc_membership z hzA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 hpv2 hpv3 hpv1 h0_lt_jv3 h31
    rcases (hC2int x).1 hxC2 with ⟨ix, hlo, hhi, hxq⟩
    have hix_ne_lo : ix ≠ jv3 := fun h => hx_ne_v3 (by rw [← hxq, h, hpv3])
    have hix_ne_hi : ix ≠ jv1 := fun h => hx_ne_v1 (by rw [← hxq, h, hpv1])
    have h3x : jv3 < ix := lt_of_le_of_ne hlo (Ne.symm hix_ne_lo)
    have hx1 : ix < jv1 := lt_of_le_of_ne hhi hix_ne_hi
    -- `v₁` (index `> ix`) and `v₂` (index `0 < jv3`) are both on the negative side.
    have hv1_side : signedArea2 S.triangle.v1 S.triangle.v3 x < 0 := by
      rw [← hpv1, ← hpv3, ← hxq]; exact sa_neg_bca hneg_s h3x hx1
    have hv2_side : signedArea2 S.triangle.v2 S.triangle.v3 x < 0 := by
      rw [← hpv2, ← hpv3, ← hxq]; exact sa_neg_abc hneg_s h0_lt_jv3 h3x
    exact mul_pos_of_neg_of_neg hv2_side hv1_side
  · -- `v₂ = 0 < jv1 < jv3`; `C₂` is the swapped index block `[jv1, jv3]`.
    have h13 : jv1 < jv3 := lt_of_le_of_ne (le_of_not_gt h31) hv1_ne_v3
    have hC2int := supportCap_interval_of_oppositeFirst_local'
      (A := A) (C := S.CP.C2) (phi := psi) (u := S.triangle.v2) (v := S.triangle.v1)
        (w := S.triangle.v3)
      hpsi_inj hpsi_image hneg_s S.CP.C2_subset
      (c2_arc_swap S) S.CP.v1_mem_C2 S.CP.v3_mem_C2
      hpv2 hpv1 hpv3 h0_lt_jv1 h13
    rcases (hC2int x).1 hxC2 with ⟨ix, hlo, hhi, hxq⟩
    have hix_ne_lo : ix ≠ jv1 := fun h => hx_ne_v1 (by rw [← hxq, h, hpv1])
    have hix_ne_hi : ix ≠ jv3 := fun h => hx_ne_v3 (by rw [← hxq, h, hpv3])
    have h1x : jv1 < ix := lt_of_le_of_ne hlo (Ne.symm hix_ne_lo)
    have hx3 : ix < jv3 := lt_of_le_of_ne hhi hix_ne_hi
    have hv1_side : 0 < signedArea2 S.triangle.v1 S.triangle.v3 x := by
      rw [← hpv1, ← hpv3, ← hxq]; exact sa_pos_acb hneg_s h1x hx3
    have hv2_side : 0 < signedArea2 S.triangle.v2 S.triangle.v3 x := by
      rw [← hpv2, ← hpv3, ← hxq]
      exact sa_pos_acb hneg_s (lt_trans h0_lt_jv1 h1x) hx3
    exact mul_pos hv2_side hv1_side

/-- **(P-a₁) Cap-pair same-side certificate for the variable chord `v₁–x`.**
Mirror of `same_side_of_chord_capPair` with the cap interior point taken from
`I₁` and the chord swung onto `v₁–x`: for a `C₁` interior vertex `a₁ ∈ I₁` and
an `I₂` interior point `x`, the cap vertex `a₁` and the opposite Moser vertex
`v₃` lie strictly on the **same** open side of the chord `v₁–x`:

  `0 < signedArea2 a₁ v₁ x · signedArea2 v₃ v₁ x`.

**Proof (cyclic-interval position).**  Shift the global CCW boundary order so the
apex `v₂` sits at index `0` (`shift_boundaryOrder`).  The point `x ∈ I₂` is
located strictly between the `v₃` and `v₁` indices via `index_between_of_onArc`
on `C₂ = OnArcOpposite v₂ v₃ v₁`.  The cap vertex `a₁ ∈ I₁ = OnArcOpposite
v₁ v₂ v₃` is the canonical arc (no chord-endpoint swap needed): in the
`jv3 < jv1` orientation `v₁` is *outside* the `[v₂, v₃]` index interval, so
`index_between_of_onArc` places `0 < ja1 < jv3`; in the `jv1 < jv3` orientation
`v₁` is *inside* that interval, so `index_outside_of_onArc` forces `jv3 < ja1`.
In both orientations `a₁` and `v₃` then share the strict sign of
`signedArea2 · v₁ x` (`sa_pos_acb` / `sa_neg_bca`). -/
private theorem c1_same_side_of_v1x_chord
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {a₁ x : ℝ²}
    (ha1I1 : a₁ ∈ S.I1)
    (hxI2 : x ∈ S.I2) :
    0 < signedArea2 a₁ S.triangle.v1 x *
        signedArea2 S.triangle.v3 S.triangle.v1 x := by
  classical
  -- `x ∈ I₂ = (C₂.erase v₃).erase v₁`, `a₁ ∈ I₁ = (C₁.erase v₂).erase v₃`.
  have hxC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hx_ne_v3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
  have hx_ne_v1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hxI2).1
  have ha1C1 : a₁ ∈ S.CP.C1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha1I1).2).2
  have ha1_ne_v3 : a₁ ≠ S.triangle.v3 := (Finset.mem_erase.mp ha1I1).1
  have ha1_ne_v2 : a₁ ≠ S.triangle.v2 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha1I1).2).1
  -- Global CCW boundary order; shift the apex `v₂` to index `0`.
  obtain ⟨n, phi, hphi_inj, hphi_image, hneg, hnpos⟩ := boundaryOrder_hneg S
  haveI : NeZero n := ⟨by omega⟩
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v1_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v2_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v3_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv2A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv3A with ⟨i3, _, hi3⟩
  obtain ⟨psi, hpsi_inj, hpsi_image, hneg_s, hpsi_re⟩ :=
    shift_boundaryOrder hphi_inj hphi_image hneg i2
  set jv2 : Fin n := i2 - i2 with hjv2def
  set jv3 : Fin n := i3 - i2 with hjv3def
  set jv1 : Fin n := i1 - i2 with hjv1def
  have hpv2 : psi jv2 = S.triangle.v2 := by rw [hjv2def, hpsi_re, hi2]
  have hpv3 : psi jv3 = S.triangle.v3 := by rw [hjv3def, hpsi_re, hi3]
  have hpv1 : psi jv1 = S.triangle.v1 := by rw [hjv1def, hpsi_re, hi1]
  have hjv2_zero : jv2 = 0 := by rw [hjv2def]; exact sub_self i2
  have hv3_ne_v2 : jv3 ≠ jv2 := fun h => S.triangle.v23_ne.symm (by rw [← hpv3, ← hpv2, h])
  have hv1_ne_v2 : jv1 ≠ jv2 := fun h => S.triangle.v12_ne (by rw [← hpv1, ← hpv2, h])
  have hv1_ne_v3 : jv1 ≠ jv3 := fun h => S.triangle.v13_ne (by rw [← hpv1, ← hpv3, h])
  have h0_lt_jv3 : jv2 < jv3 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv3_ne_v2 (hjv2_zero ▸ h))
  have h0_lt_jv1 : jv2 < jv1 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv1_ne_v2 (hjv2_zero ▸ h))
  -- Index of `a₁` and its (canonical) arc-membership form `OnArcOpposite v₁ v₂ v₃`.
  have ha1A : a₁ ∈ A := S.CP.C1_subset ha1C1
  have ha1arc : Problem97.OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 a₁ :=
    (S.CP.arc_membership a₁ ha1A).1.mp ha1C1
  have ha1img : a₁ ∈ Finset.univ.image psi := by rw [hpsi_image]; exact ha1A
  rcases Finset.mem_image.mp ha1img with ⟨ja1, _, hja1⟩
  have ha1_ne_idx_v3 : ja1 ≠ jv3 := fun h => ha1_ne_v3 (by rw [← hja1, h, hpv3])
  have ha1_ne_idx_v2 : ja1 ≠ jv2 := fun h => ha1_ne_v2 (by rw [← hja1, h, hpv2])
  have ha1arc' : Problem97.OnArcOpposite (psi jv1) (psi jv2) (psi jv3) (psi ja1) := by
    rw [hpv1, hpv2, hpv3, hja1]; exact ha1arc
  -- Index of `x` and its arc-membership form `OnArcOpposite v₂ v₃ v₁`.
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  have hximg : x ∈ Finset.univ.image psi := by rw [hpsi_image]; exact hxA
  rcases Finset.mem_image.mp hximg with ⟨ix, _, hix⟩
  have hx_ne_idx_v3 : ix ≠ jv3 := fun h => hx_ne_v3 (by rw [← hix, h, hpv3])
  have hx_ne_idx_v1 : ix ≠ jv1 := fun h => hx_ne_v1 (by rw [← hix, h, hpv1])
  have hxarc : Problem97.OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
    (S.CP.arc_membership x hxA).2.1.mp hxC2
  have hxarc' : Problem97.OnArcOpposite (psi jv2) (psi jv3) (psi jv1) (psi ix) := by
    rw [hpv2, hpv3, hpv1, hix]; exact hxarc
  -- Two orientation branches on the relative index order of `v₃` and `v₁`.
  by_cases h31 : jv3 < jv1
  · -- `0 < jv3 < jv1`: `x ∈ (jv3, jv1)`; `a₁ ∈ (0, jv3)` so `ja1 < jv3 < ix < jv1`.
    obtain ⟨h3x, hx1⟩ := index_between_of_onArc hneg_s (ip := jv2) (iq := jv3) (ir := jv1)
      h31 (Or.inl h0_lt_jv3) hx_ne_idx_v3 hx_ne_idx_v1 hxarc'
    obtain ⟨ha1lo, ha1hi⟩ := index_between_of_onArc hneg_s (ip := jv1) (iq := jv2) (ir := jv3)
      h0_lt_jv3 (Or.inr h31) ha1_ne_idx_v2 ha1_ne_idx_v3 ha1arc'
    have hv3_side : 0 < signedArea2 S.triangle.v3 S.triangle.v1 x := by
      rw [← hpv3, ← hpv1, ← hix]; exact sa_pos_acb hneg_s h3x hx1
    have ha1_side : 0 < signedArea2 a₁ S.triangle.v1 x := by
      rw [← hja1, ← hpv1, ← hix]; exact sa_pos_acb hneg_s (lt_trans ha1hi h3x) hx1
    exact mul_pos ha1_side hv3_side
  · -- `0 < jv1 < jv3`: `x ∈ (jv1, jv3)`; `a₁` outside `[0, jv3]` ⟹ `jv3 < ja1`.
    have h13 : jv1 < jv3 := lt_of_le_of_ne (le_of_not_gt h31) hv1_ne_v3
    obtain ⟨h1x, hx3⟩ := index_between_of_onArc hneg_s (ip := jv2) (iq := jv1) (ir := jv3)
      h13 (Or.inl h0_lt_jv1) hx_ne_idx_v1 hx_ne_idx_v3 (onArc_swap_psi hxarc')
    have ha1out := index_outside_of_onArc hneg_s (ip := jv1) (iq := jv2) (ir := jv3)
      h0_lt_jv1 h13 ha1_ne_idx_v2 ha1_ne_idx_v3 ha1arc'
    have hja1_gt : jv3 < ja1 := by
      rcases ha1out with h | h
      · exact absurd h (by rw [hjv2_zero]; exact Fin.not_lt_zero _)
      · exact h
    have hv3_side : signedArea2 S.triangle.v3 S.triangle.v1 x < 0 := by
      rw [← hpv3, ← hpv1, ← hix]; exact sa_neg_bca hneg_s h1x hx3
    have ha1_side : signedArea2 a₁ S.triangle.v1 x < 0 := by
      rw [← hja1, ← hpv1, ← hix]; exact sa_neg_bca hneg_s h1x (lt_trans hx3 hja1_gt)
    exact mul_pos_of_neg_of_neg ha1_side hv3_side

/-- **I₃ same-side certificate for the variable chord `v₁–x` (A2 sieve).**
For `a₃ ∈ I₃` and `x ∈ I₂`, the cap vertex `a₃` and the opposite Moser vertex
`v₃` lie strictly on the **same** open side of the chord `v₁–x`:

  `0 < signedArea2 a₃ v₁ x · signedArea2 v₃ v₁ x`.

This certificate feeds the A2 sieve (`sieve_at_most_one_on_xcircle` with
`c := v₁`) for the K4 budget argument in `layer4_subshapeA/B_kill`.

**Proof (cyclic-interval position).**  Shift the global CCW boundary order so
`v₂` sits at index `0`.  In orientation `jv₃ < jv₁`, `x` is strictly between
indices `jv₃` and `jv₁`, while `a₃` lies outside the interval — so `jv₁ < ja₃`.
In orientation `jv₁ < jv₃`, both `x ∈ (jv₁, jv₃)` and `a₃ ∈ (0, jv₁)`.  In
both cases `a₃` and `v₃` share the strict sign of `signedArea2 · v₁ x`. -/
private theorem c3_same_side_of_v1x_chord
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {a₃ x : ℝ²}
    (ha3I3 : a₃ ∈ S.I3)
    (hxI2 : x ∈ S.I2) :
    0 < signedArea2 a₃ S.triangle.v1 x *
        signedArea2 S.triangle.v3 S.triangle.v1 x := by
  classical
  have hxC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hx_ne_v3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
  have hx_ne_v1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hxI2).1
  have ha3C3 : a₃ ∈ S.CP.C3 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha3I3).2).2
  have ha3_ne_v2 : a₃ ≠ S.triangle.v2 := (Finset.mem_erase.mp ha3I3).1
  have ha3_ne_v1 : a₃ ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha3I3).2).1
  obtain ⟨n, phi, hphi_inj, hphi_image, hneg, hnpos⟩ := boundaryOrder_hneg S
  haveI : NeZero n := ⟨by omega⟩
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v1_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v2_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v3_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv2A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv3A with ⟨i3, _, hi3⟩
  obtain ⟨psi, hpsi_inj, hpsi_image, hneg_s, hpsi_re⟩ :=
    shift_boundaryOrder hphi_inj hphi_image hneg i2
  set jv2 : Fin n := i2 - i2 with hjv2def
  set jv3 : Fin n := i3 - i2 with hjv3def
  set jv1 : Fin n := i1 - i2 with hjv1def
  have hpv2 : psi jv2 = S.triangle.v2 := by rw [hjv2def, hpsi_re, hi2]
  have hpv3 : psi jv3 = S.triangle.v3 := by rw [hjv3def, hpsi_re, hi3]
  have hpv1 : psi jv1 = S.triangle.v1 := by rw [hjv1def, hpsi_re, hi1]
  have hjv2_zero : jv2 = 0 := by rw [hjv2def]; exact sub_self i2
  have hv3_ne_v2 : jv3 ≠ jv2 := fun h => S.triangle.v23_ne.symm (by rw [← hpv3, ← hpv2, h])
  have hv1_ne_v2 : jv1 ≠ jv2 := fun h => S.triangle.v12_ne (by rw [← hpv1, ← hpv2, h])
  have hv1_ne_v3 : jv1 ≠ jv3 := fun h => S.triangle.v13_ne (by rw [← hpv1, ← hpv3, h])
  have h0_lt_jv3 : jv2 < jv3 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv3_ne_v2 (hjv2_zero ▸ h))
  have h0_lt_jv1 : jv2 < jv1 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv1_ne_v2 (hjv2_zero ▸ h))
  have ha3A : a₃ ∈ A := S.CP.C3_subset ha3C3
  have ha3arc : OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 a₃ :=
    (S.CP.arc_membership a₃ ha3A).2.2.mp ha3C3
  have ha3img : a₃ ∈ Finset.univ.image psi := by rw [hpsi_image]; exact ha3A
  rcases Finset.mem_image.mp ha3img with ⟨ja3, _, hja3⟩
  have ha3_ne_idx_v1 : ja3 ≠ jv1 := fun h => ha3_ne_v1 (by rw [← hja3, h, hpv1])
  have ha3_ne_idx_v2 : ja3 ≠ jv2 := fun h => ha3_ne_v2 (by rw [← hja3, h, hpv2])
  have ha3arc' : OnArcOpposite (psi jv3) (psi jv1) (psi jv2) (psi ja3) := by
    rw [hpv3, hpv1, hpv2, hja3]; exact ha3arc
  have ha3arc_sw : OnArcOpposite (psi jv3) (psi jv2) (psi jv1) (psi ja3) :=
    onArc_swap_psi ha3arc'
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  have hximg : x ∈ Finset.univ.image psi := by rw [hpsi_image]; exact hxA
  rcases Finset.mem_image.mp hximg with ⟨ix, _, hix⟩
  have hx_ne_idx_v3 : ix ≠ jv3 := fun h => hx_ne_v3 (by rw [← hix, h, hpv3])
  have hx_ne_idx_v1 : ix ≠ jv1 := fun h => hx_ne_v1 (by rw [← hix, h, hpv1])
  have hxarc : OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
    (S.CP.arc_membership x hxA).2.1.mp hxC2
  have hxarc' : OnArcOpposite (psi jv2) (psi jv3) (psi jv1) (psi ix) := by
    rw [hpv2, hpv3, hpv1, hix]; exact hxarc
  by_cases h31 : jv3 < jv1
  · -- `0 < jv3 < jv1`: x ∈ (jv3, jv1); a₃ outside [0, jv1] so jv1 < ja3.
    obtain ⟨h3x, hx1⟩ := index_between_of_onArc hneg_s (ip := jv2) (iq := jv3) (ir := jv1)
      h31 (Or.inl h0_lt_jv3) hx_ne_idx_v3 hx_ne_idx_v1 hxarc'
    have ha3out := index_outside_of_onArc hneg_s (ip := jv3) (iq := jv2) (ir := jv1)
      h0_lt_jv3 h31 ha3_ne_idx_v2 ha3_ne_idx_v1 ha3arc_sw
    have hja3_gt : jv1 < ja3 := by
      rcases ha3out with h | h
      · exact absurd h (by rw [hjv2_zero]; exact Fin.not_lt_zero _)
      · exact h
    have hv3_side : 0 < signedArea2 S.triangle.v3 S.triangle.v1 x := by
      rw [← hpv3, ← hpv1, ← hix]; exact sa_pos_acb hneg_s h3x hx1
    have ha3_side : 0 < signedArea2 a₃ S.triangle.v1 x := by
      rw [← hja3, ← hpv1, ← hix]
      -- SA(psi ja3, psi jv1, psi ix) = SA(psi ix, psi ja3, psi jv1) by cyclicity;
      -- the latter is sa_pos_acb with ix < jv1 < ja3 (interleaved a=ix, c=jv1, b=ja3).
      have heq : signedArea2 (psi ix) (psi ja3) (psi jv1) =
                 signedArea2 (psi ja3) (psi jv1) (psi ix) := by
        simp only [signedArea2]; ring
      rw [← heq]; exact sa_pos_acb hneg_s hx1 hja3_gt
    exact mul_pos ha3_side hv3_side
  · -- `0 < jv1 < jv3`: x ∈ (jv1, jv3); a₃ ∈ (0, jv1).
    have h13 : jv1 < jv3 := lt_of_le_of_ne (le_of_not_gt h31) hv1_ne_v3
    obtain ⟨h1x, hx3⟩ := index_between_of_onArc hneg_s (ip := jv2) (iq := jv1) (ir := jv3)
      h13 (Or.inl h0_lt_jv1) hx_ne_idx_v1 hx_ne_idx_v3 (onArc_swap_psi hxarc')
    obtain ⟨ha3lo, ha3hi⟩ := index_between_of_onArc hneg_s (ip := jv3) (iq := jv2) (ir := jv1)
      h0_lt_jv1 (Or.inr h13) ha3_ne_idx_v2 ha3_ne_idx_v1 ha3arc_sw
    have hv3_side : signedArea2 S.triangle.v3 S.triangle.v1 x < 0 := by
      rw [← hpv3, ← hpv1, ← hix]; exact sa_neg_bca hneg_s h1x hx3
    have ha3_side : signedArea2 a₃ S.triangle.v1 x < 0 := by
      rw [← hja3, ← hpv1, ← hix]; exact sa_neg_abc hneg_s ha3hi h1x
    exact mul_pos_of_neg_of_neg ha3_side hv3_side

/-- **(P-a₃) Cap-pair same-side certificate for the variable chord `v₃–x`.**
For a `C₃` interior vertex `a₃ ∈ I₃` and an `I₂` interior point `x`, the cap
vertex `a₃` and the opposite Moser vertex `v₁` lie strictly on the **same** open
side of the chord `v₃–x`:

  `0 < signedArea2 a₃ v₃ x · signedArea2 v₁ v₃ x`.

This is the (P-a₃) half of the variable-chord same-side certificate
`c3_same_side_of_v3x_chord`.  Together with `(P-v₂)` it feeds the
sign-transitivity reduction (`Problem97.signedArea_prod_pos_trans`).

**Proof (cyclic-interval position).**  Shift the global CCW boundary order so the
apex `v₂` sits at index `0` (`shift_boundaryOrder`).  The point `x ∈ I₂` is
located strictly between the `v₃` and `v₁` indices via `index_between_of_onArc`
on `C₂ = OnArcOpposite v₂ v₃ v₁` (opposite vertex `v₂` at index `0`, so outside
the chord interval).  The cap vertex `a₃ ∈ I₃ = OnArcOpposite v₃ v₁ v₂` is located
against the `[v₂, v₁]` index interval: in the `jv3 < jv1` orientation `v₃` is
*inside* that interval, so `index_outside_of_onArc` forces `jv1 < ia3`; in the
`jv1 < jv3` orientation `v₃` is *outside*, so `index_between_of_onArc` gives
`0 < ia3 < jv1`.  In both orientations `a₃` and `v₁` then share the strict sign of
`signedArea2 · v₃ x` (`sa_neg_bca` / `sa_pos_acb`).  Models:
`c3_vertex_same_open_side_as_v2'` (fixed chord `v₁v₃`) and `capSide_same_side`
(`U2WitnessReflectionKernel`).  See memories `0CQMNA`/`NA3N89`. -/
private theorem same_side_of_chord_capPair
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {a₃ x : ℝ²}
    (ha3I3 : a₃ ∈ S.I3)
    (hxI2 : x ∈ S.I2) :
    0 < signedArea2 a₃ S.triangle.v3 x *
        signedArea2 S.triangle.v1 S.triangle.v3 x := by
  classical
  -- `x ∈ I₂ = (C₂.erase v₃).erase v₁`, `a₃ ∈ I₃ = (C₃.erase v₁).erase v₂`.
  have hxC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hx_ne_v3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
  have hx_ne_v1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hxI2).1
  have ha3C3 : a₃ ∈ S.CP.C3 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha3I3).2).2
  have ha3_ne_v2 : a₃ ≠ S.triangle.v2 := (Finset.mem_erase.mp ha3I3).1
  have ha3_ne_v1 : a₃ ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha3I3).2).1
  -- Global CCW boundary order; shift the apex `v₂` to index `0`.
  obtain ⟨n, phi, hphi_inj, hphi_image, hneg, hnpos⟩ := boundaryOrder_hneg S
  haveI : NeZero n := ⟨by omega⟩
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v1_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v2_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v3_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv2A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv3A with ⟨i3, _, hi3⟩
  obtain ⟨psi, hpsi_inj, hpsi_image, hneg_s, hpsi_re⟩ :=
    shift_boundaryOrder hphi_inj hphi_image hneg i2
  set jv2 : Fin n := i2 - i2 with hjv2def
  set jv3 : Fin n := i3 - i2 with hjv3def
  set jv1 : Fin n := i1 - i2 with hjv1def
  have hpv2 : psi jv2 = S.triangle.v2 := by rw [hjv2def, hpsi_re, hi2]
  have hpv3 : psi jv3 = S.triangle.v3 := by rw [hjv3def, hpsi_re, hi3]
  have hpv1 : psi jv1 = S.triangle.v1 := by rw [hjv1def, hpsi_re, hi1]
  have hjv2_zero : jv2 = 0 := by rw [hjv2def]; exact sub_self i2
  have hv3_ne_v2 : jv3 ≠ jv2 := fun h => S.triangle.v23_ne.symm (by rw [← hpv3, ← hpv2, h])
  have hv1_ne_v2 : jv1 ≠ jv2 := fun h => S.triangle.v12_ne (by rw [← hpv1, ← hpv2, h])
  have hv1_ne_v3 : jv1 ≠ jv3 := fun h => S.triangle.v13_ne (by rw [← hpv1, ← hpv3, h])
  have h0_lt_jv3 : jv2 < jv3 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv3_ne_v2 (hjv2_zero ▸ h))
  have h0_lt_jv1 : jv2 < jv1 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv1_ne_v2 (hjv2_zero ▸ h))
  -- Index of `a₃` and its (swapped) arc-membership form `OnArcOpposite v₃ v₂ v₁`.
  have ha3A : a₃ ∈ A := S.CP.C3_subset ha3C3
  have ha3arc : Problem97.OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 a₃ :=
    (S.CP.arc_membership a₃ ha3A).2.2.mp ha3C3
  have ha3img : a₃ ∈ Finset.univ.image psi := by rw [hpsi_image]; exact ha3A
  rcases Finset.mem_image.mp ha3img with ⟨ja3, _, hja3⟩
  have ha3_ne_idx_v1 : ja3 ≠ jv1 := fun h => ha3_ne_v1 (by rw [← hja3, h, hpv1])
  have ha3_ne_idx_v2 : ja3 ≠ jv2 := fun h => ha3_ne_v2 (by rw [← hja3, h, hpv2])
  have ha3arc' : Problem97.OnArcOpposite (psi jv3) (psi jv1) (psi jv2) (psi ja3) := by
    rw [hpv3, hpv1, hpv2, hja3]; exact ha3arc
  have ha3arc_sw : Problem97.OnArcOpposite (psi jv3) (psi jv2) (psi jv1) (psi ja3) :=
    onArc_swap_psi ha3arc'
  -- Index of `x` and its arc-membership form `OnArcOpposite v₂ v₃ v₁`.
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  have hximg : x ∈ Finset.univ.image psi := by rw [hpsi_image]; exact hxA
  rcases Finset.mem_image.mp hximg with ⟨ix, _, hix⟩
  have hx_ne_idx_v3 : ix ≠ jv3 := fun h => hx_ne_v3 (by rw [← hix, h, hpv3])
  have hx_ne_idx_v1 : ix ≠ jv1 := fun h => hx_ne_v1 (by rw [← hix, h, hpv1])
  have hxarc : Problem97.OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
    (S.CP.arc_membership x hxA).2.1.mp hxC2
  have hxarc' : Problem97.OnArcOpposite (psi jv2) (psi jv3) (psi jv1) (psi ix) := by
    rw [hpv2, hpv3, hpv1, hix]; exact hxarc
  -- Two orientation branches on the relative index order of `v₃` and `v₁`.
  by_cases h31 : jv3 < jv1
  · -- `0 < jv3 < jv1`: `x ∈ (jv3, jv1)`; `a₃` outside `[0, jv1]` ⟹ `jv1 < ja3`.
    obtain ⟨h3x, hx1⟩ := index_between_of_onArc hneg_s (ip := jv2) (iq := jv3) (ir := jv1)
      h31 (Or.inl h0_lt_jv3) hx_ne_idx_v3 hx_ne_idx_v1 hxarc'
    have ha3out := index_outside_of_onArc hneg_s (ip := jv3) (iq := jv2) (ir := jv1)
      h0_lt_jv3 h31 ha3_ne_idx_v2 ha3_ne_idx_v1 ha3arc_sw
    have hja3_gt : jv1 < ja3 := by
      rcases ha3out with h | h
      · exact absurd h (by rw [hjv2_zero]; exact Fin.not_lt_zero _)
      · exact h
    have hv1_side : signedArea2 S.triangle.v1 S.triangle.v3 x < 0 := by
      rw [← hpv1, ← hpv3, ← hix]; exact sa_neg_bca hneg_s h3x hx1
    have ha3_side : signedArea2 a₃ S.triangle.v3 x < 0 := by
      rw [← hja3, ← hpv3, ← hix]; exact sa_neg_bca hneg_s h3x (lt_trans hx1 hja3_gt)
    exact mul_pos_of_neg_of_neg ha3_side hv1_side
  · -- `0 < jv1 < jv3`: `x ∈ (jv1, jv3)`; `a₃ ∈ (0, jv1)`.
    have h13 : jv1 < jv3 := lt_of_le_of_ne (le_of_not_gt h31) hv1_ne_v3
    obtain ⟨h1x, hx3⟩ := index_between_of_onArc hneg_s (ip := jv2) (iq := jv1) (ir := jv3)
      h13 (Or.inl h0_lt_jv1) hx_ne_idx_v1 hx_ne_idx_v3 (onArc_swap_psi hxarc')
    obtain ⟨ha0, ha1⟩ := index_between_of_onArc hneg_s (ip := jv3) (iq := jv2) (ir := jv1)
      h0_lt_jv1 (Or.inr h13) ha3_ne_idx_v2 ha3_ne_idx_v1 ha3arc_sw
    have hv1_side : 0 < signedArea2 S.triangle.v1 S.triangle.v3 x := by
      rw [← hpv1, ← hpv3, ← hix]; exact sa_pos_acb hneg_s h1x hx3
    have ha3_side : 0 < signedArea2 a₃ S.triangle.v3 x := by
      rw [← hja3, ← hpv3, ← hix]; exact sa_pos_acb hneg_s (lt_trans ha1 h1x) hx3
    exact mul_pos ha3_side hv1_side

set_option maxHeartbeats 4000000 in
/-- **Variable-chord same-side lemma (A1 sieve certificate).**  For a `C₃`
interior vertex `a₃ ∈ I₃` and an `I₂` interior point `x` such that the apex `v₂`
is equidistant from both chord endpoints `v₃` and `x` (`dist v₂ v₃ = dist v₂ x =
t`), the point `a₃` lies strictly on the same open side of the chord `v₃–x` as
`v₂`:
`0 < signedArea2 a₃ v₃ x · signedArea2 v₂ v₃ x`.

This is the *master same-side certificate* feeding `sieve_at_most_one_on_xcircle`
(with `c := v₃`, the variable chord `v₃–x`) in the Layer-4 sub-shape A/B sieves:
the points `{a₃, b₃, y, v₁, v₂} ⊆ S(v₃, t)` all share the sign of
`signedArea2 · v₃ x` with `signedArea2 v₂ v₃ x`, so at most one of them can also
lie on the `x`-circle `S(x, ρ) = K`.  This bounds the A1 budget to `≤ 1`,
driving the card-`≥ 4` budget argument for both Layer-4 leaves.

**Frame reduction (verified below).**  In the `harea_gen` coordinate frame for
the chord `v₃–x` (direction `u := x − v₃`, midpoint `M`), the equidistance
`dist v₂ v₃ = dist v₂ x` pins `v₂` to the perpendicular bisector of `v₃–x`, i.e.
`X v₂ = 0`.  Both chord endpoints sit on the `X`-axis (`Y v₃ = Y x = 0`), so
`signedArea2 P v₃ x = Y P · ‖u‖²` for every `P`, and the goal collapses to
`0 < Y a₃ · Y v₂` (the points lie on the same side of the chord line).

**`hsign` now decomposed (no sorry here).**  The frame-reduced goal
`0 < signedArea2 a₃ v₃ x * signedArea2 v₂ v₃ x` is discharged by sign-transitivity
through the common reference `v₁` (`Problem97.signedArea_prod_pos_trans`,
`CapArcInteriorPoints.lean`) applied to the two same-side certificates:

* (P-a₃) `same_side_of_chord_capPair`: a₃ and v₁ on the same side of chord v₃–x
  (from a₃ ∈ I₃ + x ∈ I₂ + ConvexIndep);
* (P-v₂) `same_side_of_chord_endpoint_thales`: v₂ and v₁ on the same side of
  chord v₃–x (from x ∈ I₂ + the v₂-equidistance packet + ConvexIndep).

Both `same_side_*` lemmas live just above this theorem and are proven from the
cyclic-interval position of the cap/apex vertices relative to the variable chord
v₃–x (via `CGN4g0_globalBoundaryOrder_of_convexIndep` +
`signedArea2_{neg_of_outside,pos_of_between}`); the general algebraic bridges
(`signedArea_prod_pos_trans`, `signedArea_prod_pos_of_inner_midpoint_pos`) are
proven axiom-clean in `CapArcInteriorPoints.lean`.  See memory `0CQMNA`/`NA3N89`. -/
private theorem c3_same_side_of_v3x_chord
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {a₃ x : ℝ²} {t : ℝ}
    (ha3I3 : a₃ ∈ S.I3)
    (hxI2 : x ∈ S.I2)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t)
    (hv2x : dist S.triangle.v2 x = t)
    (ht : 0 < t) :
    0 < signedArea2 a₃ S.triangle.v3 x *
        signedArea2 S.triangle.v2 S.triangle.v3 x := by
  classical
  -- `x ≠ v₃`: `x ∈ I₂ = (C₂.erase v₃).erase v₁` excludes the apex `v₃`.
  have hne23 : S.triangle.v3 ≠ x := by
    have hx_ne_v3 : x ≠ S.MT.toMoserTriangle.v3 :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
    exact fun h => hx_ne_v3 h.symm
  -- ─────────────────────────────────────────────────────────────────────────
  -- FRAME for the variable chord `v₃–x`: `q1 = v₃`, `q2 = x`, `p2 = v₂`.
  -- ─────────────────────────────────────────────────────────────────────────
  set q1 : ℝ² := S.triangle.v3 with hq1
  set q2 : ℝ² := x with hq2
  set p2 : ℝ² := S.triangle.v2 with hp2
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr (Ne.symm hne23)
  set u : ℝ² := q2 - q1 with hudef
  set nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u with hnvecdef
  set β := Problem97.stdOrientation.basisRightAngleRotation u hu with hβdef
  set M : ℝ² := midpoint ℝ q1 q2 with hMdef
  set X : ℝ² → ℝ := fun z => β.repr (z - M) 0 with hXdef
  set Y : ℝ² → ℝ := fun z => β.repr (z - M) 1 with hYdef
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [hβdef, hXdef, hYdef, hnvecdef] using (β.sum_repr (z - M)).symm
  have horth : inner ℝ u nvec = 0 := by
    simpa [hnvecdef] using Problem97.stdOrientation.inner_rightAngleRotation_self u
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  have hdiff : ∀ z w : ℝ², z - w = (X z - X w) • u + (Y z - Y w) • nvec := by
    intro z w
    have h : (z - M) - (w - M) = z - w := by abel
    rw [← h, hsum_pt z, hsum_pt w, sub_smul, sub_smul]; abel
  have harea_u_left : ∀ r : ℝ, Problem97.stdOrientation.areaForm u (r • u) = 0 := by
    intro r; rw [map_smul]; simp
  have harea_u_right : ∀ r : ℝ,
      Problem97.stdOrientation.areaForm u (r • nvec) = r * ‖u‖ ^ 2 := by
    intro r; rw [map_smul]
    simp [hnvecdef, Orientation.areaForm_rightAngleRotation_right]
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
  have harea_gen : ∀ z w v : ℝ²,
      signedArea2 z w v =
        ((X w - X z) * (Y v - Y z) - (Y w - Y z) * (X v - X z)) * ‖u‖ ^ 2 := by
    intro z w v
    rw [Problem97.signedArea2_eq_stdOrientation_areaForm, hdiff w z, hdiff v z,
        harea_bilin]
  -- Chord-endpoint coordinates: both on the `X`-axis at `∓1/2`.
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simpa [hMdef] using (left_sub_midpoint ℝ q1 q2)
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by rw [hudef]; abel]; simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simpa [hMdef, hudef] using (right_sub_midpoint ℝ q1 q2)
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [hβdef, hnvecdef] using (β.repr_self 0)
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
  -- In this frame `signedArea2 P v₃ x = Y P · ‖u‖²` for every `P`.
  have hsa : ∀ P : ℝ², signedArea2 P q1 q2 = Y P * ‖u‖ ^ 2 := by
    intro P; rw [harea_gen P q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  -- `v₂` sits on the perpendicular bisector of `v₃–x`: `X v₂ = 0`.
  have hXp2 : X p2 = 0 := by
    have hdist_eq : dist p2 q1 = dist p2 q2 := by
      rw [show dist p2 q1 = t from hv2v3, show dist p2 q2 = t from hv2x]
    have hperp : p2 ∈ AffineSubspace.perpBisector q1 q2 := by
      rw [AffineSubspace.mem_perpBisector_iff_dist_eq]; simpa using hdist_eq
    have hcenter_perp : inner ℝ (p2 - M) u = 0 := by
      have h := (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
        (c := p2) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [hMdef] using h
    have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
    have hinner : inner ℝ (p2 - M) u = X p2 * ‖u‖ ^ 2 := by
      calc
        inner ℝ (p2 - M) u
            = inner ℝ (X p2 • u + Y p2 • nvec) u := by rw [hsum_pt p2]
        _ = X p2 * ‖u‖ ^ 2 + Y p2 * 0 := by
              rw [inner_add_left, inner_smul_left, inner_smul_left,
                real_inner_self_eq_norm_sq, horth_rev]; simp
        _ = X p2 * ‖u‖ ^ 2 := by ring
    rw [hcenter_perp] at hinner
    rcases mul_eq_zero.mp hinner.symm with h | h
    · exact h
    · exact absurd h (ne_of_gt hu_sq_pos)
  -- ─────────────────────────────────────────────────────────────────────────
  -- GEOMETRIC CORE (gated): the same-side sign agreement.
  --
  -- The verified frame above reduces the goal to `0 < Y a₃ · Y v₂`: both `a₃`
  -- and `v₂` lie on the same open side of the chord line `v₃–x`.
  --
  -- Via `inner_midpoint_eq_signedArea_prod_of_chord_sphere` (O := v₂, chord
  -- v₃–x, both endpoints on the v₂-circle of radius t), the goal is EQUIVALENT
  -- to `0 < ⟪M − a₃, M − v₂⟫` with `M = midpoint v₃ x`.
  --
  -- Route: apply `inner_midpoint_eq_signedArea_prod_of_chord_sphere` (O := v₂,
  -- chord v₃–x, both endpoints on S(v₂,t)).  This gives equivalence with
  -- `0 < ⟪M − a₃, M − v₂⟫`.  Decompose as:
  --   (P-v₂): v₂ on same side of chord v₃–x as v₁ (from x ∈ I₂ + ConvexIndep)
  --   (P-a₃): a₃ on same side of chord v₃–x as v₁ (from a₃ ∈ I₃ + x ∈ I₂)
  -- Both sub-claims target `same_side_of_chord_endpoint_thales` and
  -- `same_side_of_chord_capPair` in `CapArcInteriorPoints.lean`.
  have hsign :
      0 < signedArea2 a₃ q1 q2 * signedArea2 p2 q1 q2 := by
    -- Restore the original Moser-vertex names for the chord endpoints/apex.
    rw [hq1, hq2, hp2]
    -- Recover the hypotheses in original-named form (the frame `set` aliases them).
    have hxI2' : x ∈ S.I2 := by rw [hq2] at hxI2; exact hxI2
    have hv2v3' : dist S.triangle.v2 S.triangle.v3 = t := by
      rw [hp2, hq1] at hv2v3; exact hv2v3
    have hv2x' : dist S.triangle.v2 x = t := by rw [hp2, hq2] at hv2x; exact hv2x
    -- Sign-transitivity through the common reference `v₁`
    -- (`Problem97.signedArea_prod_pos_trans`, CapArcInteriorPoints):
    --   (P-a₃)  0 < signedArea2 a₃ v₃ x · signedArea2 v₁ v₃ x
    --   (P-v₂)  0 < signedArea2 v₂ v₃ x · signedArea2 v₁ v₃ x
    -- ⟹       0 < signedArea2 a₃ v₃ x · signedArea2 v₂ v₃ x.
    exact Problem97.signedArea_prod_pos_trans
      (same_side_of_chord_capPair S ha3I3 hxI2')
      (same_side_of_chord_endpoint_thales S hxI2' hv2v3' hv2x')
  -- Discharge the goal from the gated core (definitional unfold of `q1,q2,p2`).
  simpa [hq1, hq2, hp2] using hsign

/-- **(P-v₁) Moser-vertex same-side certificate for the variable chord `v₃–x`.**
For an `I₂` interior point `x`, the Moser vertex `v₁` and the apex `v₂` lie
strictly on the **same** open side of the variable chord `v₃–x`:

  `0 < signedArea2 v₁ v₃ x · signedArea2 v₂ v₃ x`.

This is the `v₁`-flavoured companion of the `(P-v₂)` certificate
`same_side_of_chord_endpoint_thales`: where that lemma reads off the common
negative/positive sign of `v₂` and `v₁` against the chord `v₃–x`, this one
reports the same pair of signs in the commuted product order `v₁ · v₂`.  It is
the A1-sieve same-side fact needed for the Moser vertex `v₁`, which lies on the
sieve circle `S(v₃, t)` (the triangle is equilateral, `dist v₃ v₁ = t`).

**Proof (cyclic-interval position — identical frame to
`same_side_of_chord_endpoint_thales`).**  Shift the global CCW boundary order
(`boundaryOrder_hneg`) so the apex `v₂` sits at index `0`
(`shift_boundaryOrder`).  The cap `C₂` is the opposite-`v₂` arc, so
`supportCap_interval_of_oppositeFirst_local'` puts `x`'s index strictly between
the `v₃` and `v₁` indices (`jv3 < ix < jv1`, up to the orientation swap).  With
`v₂` at index `0`, both `v₁` and `v₂` sit on the *same* strict side of the
chord `v₃–x` (both negative when `jv3 < jv1`, both positive when `jv1 < jv3`),
via the `sa_neg_*` / `sa_pos_acb` index-sign helpers.  No equidistance packet is
required — the certificate is a pure boundary-order/index-interval fact about
the convex position of the nine points (exactly as in the `v₂` half). -/
private theorem v1_same_side_of_v3x_chord
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²}
    (hxI2 : x ∈ S.I2) :
    0 < signedArea2 S.triangle.v1 S.triangle.v3 x *
        signedArea2 S.triangle.v2 S.triangle.v3 x := by
  classical
  -- `x ∈ I₂ = (C₂.erase v₃).erase v₁`: membership and distinctness from the
  -- chord endpoint `v₃` and the far Moser vertex `v₁`.
  have hxC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hx_ne_v3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
  have hx_ne_v1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hxI2).1
  -- Global CCW boundary order as a descending signed-area predicate, then shift
  -- the apex `v₂` to index `0`.
  obtain ⟨n, phi, hphi_inj, hphi_image, hneg, hnpos⟩ := boundaryOrder_hneg S
  haveI : NeZero n := ⟨by omega⟩
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v1_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v2_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by rw [hphi_image]; exact S.triangle.v3_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv2A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv3A with ⟨i3, _, hi3⟩
  obtain ⟨psi, hpsi_inj, hpsi_image, hneg_s, hpsi_re⟩ :=
    shift_boundaryOrder hphi_inj hphi_image hneg i2
  set jv2 : Fin n := i2 - i2 with hjv2def
  set jv3 : Fin n := i3 - i2 with hjv3def
  set jv1 : Fin n := i1 - i2 with hjv1def
  have hpv2 : psi jv2 = S.triangle.v2 := by rw [hjv2def, hpsi_re, hi2]
  have hpv3 : psi jv3 = S.triangle.v3 := by rw [hjv3def, hpsi_re, hi3]
  have hpv1 : psi jv1 = S.triangle.v1 := by rw [hjv1def, hpsi_re, hi1]
  have hjv2_zero : jv2 = 0 := by rw [hjv2def]; exact sub_self i2
  have hv3_ne_v2 : jv3 ≠ jv2 := fun h => S.triangle.v23_ne.symm (by rw [← hpv3, ← hpv2, h])
  have hv1_ne_v2 : jv1 ≠ jv2 := fun h => S.triangle.v12_ne (by rw [← hpv1, ← hpv2, h])
  have hv1_ne_v3 : jv1 ≠ jv3 := fun h => S.triangle.v13_ne (by rw [← hpv1, ← hpv3, h])
  have h0_lt_jv3 : jv2 < jv3 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv3_ne_v2 (hjv2_zero ▸ h))
  have h0_lt_jv1 : jv2 < jv1 :=
    hjv2_zero ▸ Fin.pos_iff_ne_zero.mpr (fun h => hv1_ne_v2 (hjv2_zero ▸ h))
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  -- Two orientation branches on the relative index order of `v₃` and `v₁`.
  by_cases h31 : jv3 < jv1
  · -- `v₂ = 0 < jv3 < jv1`; `C₂` is the clean index block `[jv3, jv1]`.
    have hC2int := supportCap_interval_of_oppositeFirst_local'
      (A := A) (C := S.CP.C2) (phi := psi) (u := S.triangle.v2) (v := S.triangle.v3)
        (w := S.triangle.v1)
      hpsi_inj hpsi_image hneg_s S.CP.C2_subset
      (fun z hzA => (S.CP.arc_membership z hzA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 hpv2 hpv3 hpv1 h0_lt_jv3 h31
    rcases (hC2int x).1 hxC2 with ⟨ix, hlo, hhi, hxq⟩
    have hix_ne_lo : ix ≠ jv3 := fun h => hx_ne_v3 (by rw [← hxq, h, hpv3])
    have hix_ne_hi : ix ≠ jv1 := fun h => hx_ne_v1 (by rw [← hxq, h, hpv1])
    have h3x : jv3 < ix := lt_of_le_of_ne hlo (Ne.symm hix_ne_lo)
    have hx1 : ix < jv1 := lt_of_le_of_ne hhi hix_ne_hi
    -- `v₁` (index `> ix`) and `v₂` (index `0 < jv3`) are both on the negative side.
    have hv1_side : signedArea2 S.triangle.v1 S.triangle.v3 x < 0 := by
      rw [← hpv1, ← hpv3, ← hxq]; exact sa_neg_bca hneg_s h3x hx1
    have hv2_side : signedArea2 S.triangle.v2 S.triangle.v3 x < 0 := by
      rw [← hpv2, ← hpv3, ← hxq]; exact sa_neg_abc hneg_s h0_lt_jv3 h3x
    exact mul_pos_of_neg_of_neg hv1_side hv2_side
  · -- `v₂ = 0 < jv1 < jv3`; `C₂` is the swapped index block `[jv1, jv3]`.
    have h13 : jv1 < jv3 := lt_of_le_of_ne (le_of_not_gt h31) hv1_ne_v3
    have hC2int := supportCap_interval_of_oppositeFirst_local'
      (A := A) (C := S.CP.C2) (phi := psi) (u := S.triangle.v2) (v := S.triangle.v1)
        (w := S.triangle.v3)
      hpsi_inj hpsi_image hneg_s S.CP.C2_subset
      (c2_arc_swap S) S.CP.v1_mem_C2 S.CP.v3_mem_C2
      hpv2 hpv1 hpv3 h0_lt_jv1 h13
    rcases (hC2int x).1 hxC2 with ⟨ix, hlo, hhi, hxq⟩
    have hix_ne_lo : ix ≠ jv1 := fun h => hx_ne_v1 (by rw [← hxq, h, hpv1])
    have hix_ne_hi : ix ≠ jv3 := fun h => hx_ne_v3 (by rw [← hxq, h, hpv3])
    have h1x : jv1 < ix := lt_of_le_of_ne hlo (Ne.symm hix_ne_lo)
    have hx3 : ix < jv3 := lt_of_le_of_ne hhi hix_ne_hi
    have hv1_side : 0 < signedArea2 S.triangle.v1 S.triangle.v3 x := by
      rw [← hpv1, ← hpv3, ← hxq]; exact sa_pos_acb hneg_s h1x hx3
    have hv2_side : 0 < signedArea2 S.triangle.v2 S.triangle.v3 x := by
      rw [← hpv2, ← hpv3, ← hxq]
      exact sa_pos_acb hneg_s (lt_trans h0_lt_jv1 h1x) hx3
    exact mul_pos hv1_side hv2_side

/-- Squared distance in coordinates: `dist a b ^ 2 = (a₀−b₀)² + (a₁−b₁)²`.
Local helper used by the equilateral-clash algebra below. -/
private theorem dist_sq_coord (a b : ℝ²) :
    (dist a b) ^ 2 = (a 0 - b 0) ^ 2 + (a 1 - b 1) ^ 2 := by
  rw [EuclideanSpace.dist_eq, Real.sq_sqrt (by positivity)]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 1600000 in
/-- **Sub-shape B perp-bisector clash engine.**  The non-equilateral analogue of
`equilateral_clash`: `v₁v₂v₃` is isoceles at `v₂` (legs `dist v₁ v₂ = dist v₂ v₃
= t`, base `v₁v₃` free), `v₂` is non-obtuse (`inner_at_v2 ≥ 0`, i.e. the apex
hypothesis `hnonob`), and `x` is at distance `r` from both `v₁` and `v₃` and `t`
from `v₂`.  Given the *near-branch* selection `hAB` (placing `x` and `v₂` on
opposite sides of chord `v₁v₃`), it yields the sub-shape B clash
`r²·t² < signedArea2(v₁,v₂,v₃)²`.

This is the verified algebraic engine behind the prose §"Sub-shape (B) sieve".
With base `d := |v₁v₃|`, the proof chains (writing `A := signedArea2 v₂ v₁ v₃`,
`B := signedArea2 x v₁ v₃`):
* `hnonobd` : `d² ≤ 2t²` (non-obtuse at `v₂` ⟺ base ≤ leg·√2);
* `hSAx`/`hSAv2` : Heron with base `d` (`4B² = 4r²d²−d⁴`, `4A² = 4t²d²−d⁴`);
* `hdiff` : `(A−B)² = d²t²` (cross-difference `(v₃−v₁)×(v₂−x)`, perpendicular);
* `hd2gt` : `d² > 2r²` (from `hAB` + the three identities — the near branch);
* final: on `d² ∈ (2r², 2t²]` the increasing parabola `4t²d²−d²·d² = 4A²`
  exceeds `4r²t²`, giving `r²t² < A² = signedArea2(v₁,v₂,v₃)²`.

Unlike `equilateral_clash`, the orientation→`hAB` translation is *not* folded in:
for the general base the `hBC` positivity (`x` sees `v₂,v₃` on one side of line
`x–v₁`) does not reduce to a flat `nlinarith`, so `hAB` is exposed as the clean
near-branch boundary the caller's orientation argument must supply. -/
private theorem subshapeB_clash
    {v1 v2 v3 x : ℝ²} {r t : ℝ}
    (h12 : dist v1 v2 = t) (h23 : dist v2 v3 = t)
    (hxv1 : dist x v1 = r) (hxv3 : dist x v3 = r) (hxv2 : dist x v2 = t)
    (hnonob : 0 ≤ (v3 0 - v2 0) * (v1 0 - v2 0) + (v3 1 - v2 1) * (v1 1 - v2 1))
    (hAB : signedArea2 v2 v1 v3 * signedArea2 x v1 v3 < 0) :
    r ^ 2 * t ^ 2 < signedArea2 v1 v2 v3 ^ 2 := by
  set d2 : ℝ := (v1 0 - v3 0) ^ 2 + (v1 1 - v3 1) ^ 2 with hd2def
  have hd2nonneg : 0 ≤ d2 := by rw [hd2def]; positivity
  have hnonobd : d2 ≤ 2 * t ^ 2 := by
    have e12 := dist_sq_coord v1 v2; have e23 := dist_sq_coord v2 v3
    rw [h12] at e12; rw [h23] at e23
    rw [hd2def]; nlinarith [e12, e23, hnonob]
  have hSAx : 4 * signedArea2 x v1 v3 ^ 2 = 4 * r ^ 2 * d2 - d2 ^ 2 := by
    have ex1 := dist_sq_coord x v1; have ex3 := dist_sq_coord x v3
    rw [hxv1] at ex1; rw [hxv3] at ex3
    simp only [signedArea2]; rw [hd2def]; nlinarith [ex1, ex3]
  have hSAv2 : 4 * signedArea2 v2 v1 v3 ^ 2 = 4 * t ^ 2 * d2 - d2 ^ 2 := by
    have e12 := dist_sq_coord v1 v2; have e23 := dist_sq_coord v2 v3
    rw [h12] at e12; rw [h23] at e23
    simp only [signedArea2]; rw [hd2def]; nlinarith [e12, e23]
  have hdiff : (signedArea2 v2 v1 v3 - signedArea2 x v1 v3) ^ 2 = d2 * t ^ 2 := by
    have hperp : (v3 0 - v1 0) * (v2 0 - x 0) + (v3 1 - v1 1) * (v2 1 - x 1) = 0 := by
      have ex1 := dist_sq_coord x v1; have ex3 := dist_sq_coord x v3
      have e12 := dist_sq_coord v1 v2; have e23 := dist_sq_coord v2 v3
      rw [hxv1] at ex1; rw [hxv3] at ex3; rw [h12] at e12; rw [h23] at e23
      nlinarith [ex1, ex3, e12, e23]
    have ex2 := dist_sq_coord x v2
    rw [hxv2] at ex2
    simp only [signedArea2]; rw [hd2def]; nlinarith [hperp, ex2]
  have hsq_eq : signedArea2 v1 v2 v3 ^ 2 = signedArea2 v2 v1 v3 ^ 2 := by
    have hflip : signedArea2 v1 v2 v3 = - signedArea2 v2 v1 v3 := by
      simp only [signedArea2]; ring
    rw [hflip]; ring
  rw [hsq_eq]
  have hd2gt : d2 > 2 * r ^ 2 := by nlinarith [hSAx, hSAv2, hdiff, hAB]
  nlinarith [hSAv2, hd2gt, hnonobd, sq_nonneg (t ^ 2 - r ^ 2),
    mul_nonneg hd2nonneg hd2nonneg]

/-- **Scalar lemma (strict Cauchy–Schwarz upper bound on triangle area).**
For any `a₁ ∈ I₁` at radius `r` from `v₁`, and base `dist v₂ v₃ = t`, the
squared area of the Moser triangle is strictly below `r²t²`:

  `signedArea2(v₁,v₂,v₃)² < r²·t²`

**Proof:** `a₁ ∈ C₁` forces `SA(a₁,v₂,v₃)·SA(v₁,v₂,v₃) ≤ 0` (arc membership).
Both factors are nonzero (ConvexIndep + Moser circle), so the product is
strictly negative.  Cross-difference identity + 2D Cauchy–Schwarz give
`(SA(v₁) − SA(a₁))² ≤ t²r²`.  Strict opposite-sign forces `SA(v₁)² <
(SA(v₁) − SA(a₁))²`, completing the chain `SA(v₁)² < t²r²`.

This is the strict form of the upper bound proved inside `subshapeB_clash`
(`hupper` steps a–i).  Used by the L1 same-side cert for `q₃ ∈ I₂` wrt
chord `v₃–x` (arc-ordering step of the K4 budget argument). -/
private theorem scalar_lemma
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {a₁ : ℝ²} {r t : ℝ}
    (ha1I1 : a₁ ∈ S.I1)
    (hv1a1 : dist S.triangle.v1 a₁ = r)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t) :
    signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ^ 2 < r ^ 2 * t ^ 2 := by
  set v1 := S.triangle.v1 with hv1def
  set v2 := S.triangle.v2 with hv2def
  set v3 := S.triangle.v3 with hv3def
  have ha1A : a₁ ∈ A := S.CP.C1_subset (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1))
  have ha1C1 : a₁ ∈ S.CP.C1 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1)
  have ha1ne3 : a₁ ≠ v3 := (Finset.mem_erase.mp ha1I1).1
  have ha1ne2 : a₁ ≠ v2 := (Finset.mem_erase.mp (Finset.mem_of_mem_erase ha1I1)).1
  have hle : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 ≤ 0 :=
    (S.CP.arc_membership a₁ ha1A).1.mp ha1C1
  have h2A : v2 ∈ A := S.triangle.v2_mem
  have h3A : v3 ∈ A := S.triangle.v3_mem
  have ha1SAne : signedArea2 a₁ v2 v3 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a₁, v2, v3} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a₁ v2 v3 hΔ
    have hconv : ConvexIndep A := S.hconv
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    · apply hconv v2 (by exact_mod_cast h2A)
      have hseg : v2 ∈ segment ℝ a₁ v3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp; rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast ha1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h.symm⟩
    · apply hconv v3 (by exact_mod_cast h3A)
      have hseg : v3 ∈ segment ℝ v2 a₁ := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp; rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast h2A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast ha1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h⟩
    · apply hconv a₁ (by exact_mod_cast ha1A)
      have hseg : a₁ ∈ segment ℝ v3 v2 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp; rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h.symm⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast h2A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h.symm⟩
  have hv1SAne : signedArea2 v1 v2 v3 ≠ 0 := by
    have hv1O : ‖v1 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_1
    have hv2O : ‖v2 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_2
    have hv3O : ‖v3 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_3
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_eq_norm] using hv1O) (by simpa [dist_eq_norm] using hv2O)
      (by simpa [dist_eq_norm] using hv3O)
      S.triangle.v12_ne S.triangle.v23_ne S.triangle.v13_ne
  have hstrict : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 < 0 :=
    lt_of_le_of_ne hle (mul_ne_zero ha1SAne hv1SAne)
  have hcross : signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3 =
      (v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0) := by
    simp only [signedArea2]; ring
  have hcs : ((v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0)) ^ 2
      ≤ t ^ 2 * r ^ 2 := by
    have e23 := dist_sq_coord v2 v3; have e1a1 := dist_sq_coord v1 a₁
    rw [hv2v3] at e23; rw [hv1a1] at e1a1
    nlinarith [sq_nonneg ((v2 0 - v3 0) * (a₁ 0 - v1 0) + (v2 1 - v3 1) * (a₁ 1 - v1 1)),
      e23, e1a1]
  have ha1sq : 0 < signedArea2 a₁ v2 v3 ^ 2 := by positivity
  have hgap : signedArea2 v1 v2 v3 ^ 2 <
      (signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3) ^ 2 := by nlinarith [hstrict, ha1sq]
  rw [hcross] at hgap
  nlinarith [hcs, hgap]

/- ### Local `A`-enumeration helper for the K4 budget argument

The Layer-4 budget sieves need the full nine-point enumeration of `A` from the
zero-defect cap layout `Z`.  The canonical `A_eq_named` (`N4dQa2Cover.lean`)
lives downstream of this file (its import chain runs through `N4dFaithfulFrame`),
so it cannot be imported here without an import cycle.  We therefore re-derive a
local copy from the same upstream primitives (`CapTriple.nonmoser_in_one` plus
the vertex cap profiles), which are all available in `CapStructure` /
`CapPartition` upstream of this module. -/

/-- A point `p ∈ I₁` is a non-Moser point lying in cap `C₁` alone. -/
private theorem classify_I1_local {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I1) :
    p ∈ A ∧ p ∈ S.CP.C1 ∧ p ∉ S.CP.C2 ∧ p ∉ S.CP.C3 := by
  have hC1 : p ∈ S.CP.C1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp hp).1
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne1 : p ≠ S.triangle.v1 := fun h => S.CP.v1_notin_C1 (h ▸ hC1)
  have hA : p ∈ A := S.CP.C1_subset hC1
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, hC1, ?_, ?_⟩
  · intro hC2; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone

/-- A point `p ∈ I₂` is a non-Moser point lying in cap `C₂` alone. -/
private theorem classify_I2_local {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I2) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∈ S.CP.C2 ∧ p ∉ S.CP.C3 := by
  have hC2 : p ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp hp).1
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne2 : p ≠ S.triangle.v2 := fun h => S.CP.v2_notin_C2 (h ▸ hC2)
  have hA : p ∈ A := S.CP.C2_subset hC2
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, hC2, ?_⟩
  · intro hC1; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC2, hC3, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone

/-- A point `p ∈ I₃` is a non-Moser point lying in cap `C₃` alone. -/
private theorem classify_I3_local {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I3) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∉ S.CP.C2 ∧ p ∈ S.CP.C3 := by
  have hC3 : p ∈ S.CP.C3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp hp).1
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne3 : p ≠ S.triangle.v3 := fun h => S.CP.v3_notin_C3 (h ▸ hC3)
  have hA : p ∈ A := S.CP.C3_subset hC3
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, ?_, hC3⟩
  · intro hC1; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
  · intro hC2; simp only [hC2, hC3, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone

/-- Two points distinguished by membership in a common finset are distinct. -/
private theorem ne_of_mem_not_mem_local {α : Type*} {C : Finset α} {p q : α}
    (hp : p ∈ C) (hq : q ∉ C) : p ≠ q := fun h => hq (h ▸ hp)

/-- **The nine named points exhaust `A`** (local copy of `A_eq_named`).  In the
zero-defect `(4,4,4)` shell, `A = {v₁, v₂, v₃, a₁, b₁, a₂, b₂, a₃, b₃}`. -/
private theorem A_eq_named_local {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    A = ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.a3, Z.b3}
      : Finset ℝ²) := by
  classical
  have ha1 := S.classify_I1_local (show Z.a1 ∈ S.I1 by rw [Z.hI1]; simp)
  have hb1 := S.classify_I1_local (show Z.b1 ∈ S.I1 by rw [Z.hI1]; simp)
  have ha2 := S.classify_I2_local (show Z.a2 ∈ S.I2 by rw [Z.hI2]; simp)
  have hb2 := S.classify_I2_local (show Z.b2 ∈ S.I2 by rw [Z.hI2]; simp)
  have ha3 := S.classify_I3_local (show Z.a3 ∈ S.I3 by rw [Z.hI3]; simp)
  have hb3 := S.classify_I3_local (show Z.b3 ∈ S.I3 by rw [Z.hI3]; simp)
  have v1c1 : S.triangle.v1 ∉ S.CP.C1 := S.CP.v1_notin_C1
  have v1c2 : S.triangle.v1 ∈ S.CP.C2 := S.CP.v1_mem_C2
  have v1c3 : S.triangle.v1 ∈ S.CP.C3 := S.CP.v1_mem_C3
  have v2c1 : S.triangle.v2 ∈ S.CP.C1 := S.CP.v2_mem_C1
  have v2c2 : S.triangle.v2 ∉ S.CP.C2 := S.CP.v2_notin_C2
  have v2c3 : S.triangle.v2 ∈ S.CP.C3 := S.CP.v2_mem_C3
  have v3c1 : S.triangle.v3 ∈ S.CP.C1 := S.CP.v3_mem_C1
  have v3c2 : S.triangle.v3 ∈ S.CP.C2 := S.CP.v3_mem_C2
  have v3c3 : S.triangle.v3 ∉ S.CP.C3 := S.CP.v3_notin_C3
  obtain ⟨_, a1c1, a1c2, a1c3⟩ := ha1
  obtain ⟨_, b1c1, b1c2, b1c3⟩ := hb1
  obtain ⟨_, a2c1, a2c2, a2c3⟩ := ha2
  obtain ⟨_, b2c1, b2c2, b2c3⟩ := hb2
  obtain ⟨_, a3c1, a3c2, a3c3⟩ := ha3
  obtain ⟨_, b3c1, b3c2, b3c3⟩ := hb3
  have e_a1b1 : Z.a1 ≠ Z.b1 := by
    have h : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by simpa [Z.hI1] using S.I1_card_eq_two
    intro h'; simp [h'] at h
  have e_a2b2 : Z.a2 ≠ Z.b2 := by
    have h : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by simpa [Z.hI2] using S.I2_card_eq_two
    intro h'; simp [h'] at h
  have e_a3b3 : Z.a3 ≠ Z.b3 := by
    have h : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by simpa [Z.hI3] using S.I3_card_eq_two
    intro h'; simp [h'] at h
  have e_v1v2 : S.triangle.v1 ≠ S.triangle.v2 := ne_of_mem_not_mem_local v1c2 v2c2
  have e_v1v3 : S.triangle.v1 ≠ S.triangle.v3 := ne_of_mem_not_mem_local v1c3 v3c3
  have e_v1a1 : S.triangle.v1 ≠ Z.a1 := ne_of_mem_not_mem_local v1c2 a1c2
  have e_v1b1 : S.triangle.v1 ≠ Z.b1 := ne_of_mem_not_mem_local v1c2 b1c2
  have e_v1a2 : S.triangle.v1 ≠ Z.a2 := ne_of_mem_not_mem_local v1c3 a2c3
  have e_v1b2 : S.triangle.v1 ≠ Z.b2 := ne_of_mem_not_mem_local v1c3 b2c3
  have e_v1a3 : S.triangle.v1 ≠ Z.a3 := ne_of_mem_not_mem_local v1c2 a3c2
  have e_v1b3 : S.triangle.v1 ≠ Z.b3 := ne_of_mem_not_mem_local v1c2 b3c2
  have e_v2v3 : S.triangle.v2 ≠ S.triangle.v3 := ne_of_mem_not_mem_local v2c3 v3c3
  have e_v2a1 : S.triangle.v2 ≠ Z.a1 := ne_of_mem_not_mem_local v2c3 a1c3
  have e_v2b1 : S.triangle.v2 ≠ Z.b1 := ne_of_mem_not_mem_local v2c3 b1c3
  have e_v2a2 : S.triangle.v2 ≠ Z.a2 := ne_of_mem_not_mem_local v2c1 a2c1
  have e_v2b2 : S.triangle.v2 ≠ Z.b2 := ne_of_mem_not_mem_local v2c1 b2c1
  have e_v2a3 : S.triangle.v2 ≠ Z.a3 := ne_of_mem_not_mem_local v2c1 a3c1
  have e_v2b3 : S.triangle.v2 ≠ Z.b3 := ne_of_mem_not_mem_local v2c1 b3c1
  have e_v3a1 : S.triangle.v3 ≠ Z.a1 := ne_of_mem_not_mem_local v3c2 a1c2
  have e_v3b1 : S.triangle.v3 ≠ Z.b1 := ne_of_mem_not_mem_local v3c2 b1c2
  have e_v3a2 : S.triangle.v3 ≠ Z.a2 := ne_of_mem_not_mem_local v3c1 a2c1
  have e_v3b2 : S.triangle.v3 ≠ Z.b2 := ne_of_mem_not_mem_local v3c1 b2c1
  have e_v3a3 : S.triangle.v3 ≠ Z.a3 := ne_of_mem_not_mem_local v3c1 a3c1
  have e_v3b3 : S.triangle.v3 ≠ Z.b3 := ne_of_mem_not_mem_local v3c1 b3c1
  have e_a1a2 : Z.a1 ≠ Z.a2 := ne_of_mem_not_mem_local a1c1 a2c1
  have e_a1b2 : Z.a1 ≠ Z.b2 := ne_of_mem_not_mem_local a1c1 b2c1
  have e_a1a3 : Z.a1 ≠ Z.a3 := ne_of_mem_not_mem_local a1c1 a3c1
  have e_a1b3 : Z.a1 ≠ Z.b3 := ne_of_mem_not_mem_local a1c1 b3c1
  have e_b1a2 : Z.b1 ≠ Z.a2 := ne_of_mem_not_mem_local b1c1 a2c1
  have e_b1b2 : Z.b1 ≠ Z.b2 := ne_of_mem_not_mem_local b1c1 b2c1
  have e_b1a3 : Z.b1 ≠ Z.a3 := ne_of_mem_not_mem_local b1c1 a3c1
  have e_b1b3 : Z.b1 ≠ Z.b3 := ne_of_mem_not_mem_local b1c1 b3c1
  have e_a2a3 : Z.a2 ≠ Z.a3 := ne_of_mem_not_mem_local a2c2 a3c2
  have e_a2b3 : Z.a2 ≠ Z.b3 := ne_of_mem_not_mem_local a2c2 b3c2
  have e_b2a3 : Z.b2 ≠ Z.a3 := ne_of_mem_not_mem_local b2c2 a3c2
  have e_b2b3 : Z.b2 ≠ Z.b3 := ne_of_mem_not_mem_local b2c2 b3c2
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact S.triangle.v1_mem
    · exact S.triangle.v2_mem
    · exact S.triangle.v3_mem
    · exact S.CP.C1_subset a1c1
    · exact S.CP.C1_subset b1c1
    · exact S.CP.C2_subset a2c2
    · exact S.CP.C2_subset b2c2
    · exact S.CP.C3_subset a3c3
    · exact S.CP.C3_subset b3c3
  · rw [S.hcard9]
    have hcard :
        ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.a3, Z.b3}
          : Finset ℝ²).card = 9 := by
      rw [Finset.card_insert_of_notMem (by
            simp [e_v1v2, e_v1v3, e_v1a1, e_v1b1, e_v1a2, e_v1b2, e_v1a3, e_v1b3]),
          Finset.card_insert_of_notMem (by
            simp [e_v2v3, e_v2a1, e_v2b1, e_v2a2, e_v2b2, e_v2a3, e_v2b3]),
          Finset.card_insert_of_notMem (by
            simp [e_v3a1, e_v3b1, e_v3a2, e_v3b2, e_v3a3, e_v3b3]),
          Finset.card_insert_of_notMem (by simp [e_a1b1, e_a1a2, e_a1b2, e_a1a3, e_a1b3]),
          Finset.card_insert_of_notMem (by simp [e_b1a2, e_b1b2, e_b1a3, e_b1b3]),
          Finset.card_insert_of_notMem (by simp [e_a2b2, e_a2a3, e_a2b3]),
          Finset.card_insert_of_notMem (by simp [e_b2a3, e_b2b3]),
          Finset.card_insert_of_notMem (by simp [e_a3b3]),
          Finset.card_singleton]
    rw [hcard]

set_option maxHeartbeats 1600000 in
/-- **General r-window lower bound (strict, no equilateral hypothesis).**
For a cap-`C₁` *interior* point `a₁ ∈ I₁` at radius `r` from `v₁`
(`dist v₁ a₁ = r`) on the base `v₂v₃` of length `t` (`dist v₂ v₃ = t`), the
closed-cap membership of `a₁` (opposite side of chord `v₂v₃` from `v₁`) forces
the strict r-window

  `signedArea2 v₁ v₂ v₃ ^ 2 < t² · r²`

(the polynomial form of `r > t · sin α`, `signedArea2 = 2·area`).

This is exactly STEPS 1–8 of `equilateral_rWindow` (the `hupper`-style chain),
*without* the equilateral Heron specialisation (step 9): the cross-difference
`signedArea2 v₁ v₂ v₃ − signedArea2 a₁ v₂ v₃` is the 2D cross product
`(v₂−v₃) × (a₁−v₁)`, bounded by `t²·r²` via Cauchy–Schwarz; the strict
opposite-sign condition (`a₁`, `v₁` on opposite open sides of line `v₂v₃`,
both signed areas nonzero by ConvexIndep / the Moser-circle non-degeneracy)
makes `signedArea2 v₁ v₂ v₃ ^ 2 < (signedArea2 v₁ v₂ v₃ − signedArea2 a₁ v₂ v₃)²`.

Used by `layer4_subshapeB_kill`'s `hL1` same-side certificate. -/
private theorem rWindow_general
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {a₁ : ℝ²} {r t : ℝ}
    (ha1I1 : a₁ ∈ S.I1)
    (hv1a1 : dist S.triangle.v1 a₁ = r)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t) :
    signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ^ 2 < t ^ 2 * r ^ 2 := by
  classical
  set v1 := S.triangle.v1 with hv1def
  set v2 := S.triangle.v2 with hv2def
  set v3 := S.triangle.v3 with hv3def
  -- (a) Membership of `a₁` in cap `C₁` and `A`, with `a₁ ∉ {v₂, v₃}`.
  have ha1A : a₁ ∈ A :=
    S.CP.C1_subset (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1))
  have ha1C1 : a₁ ∈ S.CP.C1 :=
    Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1)
  have ha1ne3 : a₁ ≠ v3 := (Finset.mem_erase.mp ha1I1).1
  have ha1ne2 : a₁ ≠ v2 :=
    (Finset.mem_erase.mp (Finset.mem_of_mem_erase ha1I1)).1
  -- (b) Cap-`C₁` arc membership: closed chord-separation
  -- `SA(a₁,v₂,v₃)·SA(v₁,v₂,v₃) ≤ 0`.
  have hle : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 ≤ 0 :=
    (S.CP.arc_membership a₁ ha1A).1.mp ha1C1
  -- (c) Strict non-degeneracy of `SA(a₁,v₂,v₃)` from ConvexIndep.
  have h2A : v2 ∈ A := S.triangle.v2_mem
  have h3A : v3 ∈ A := S.triangle.v3_mem
  have ha1SAne : signedArea2 a₁ v2 v3 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a₁, v2, v3} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a₁ v2 v3 hΔ
    have hconv : ConvexIndep A := S.hconv
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    · apply hconv v2 (by exact_mod_cast h2A)
      have hseg : v2 ∈ segment ℝ a₁ v3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp
      rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast ha1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h.symm⟩
    · apply hconv v3 (by exact_mod_cast h3A)
      have hseg : v3 ∈ segment ℝ v2 a₁ := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp
      rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast h2A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast ha1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h⟩
    · apply hconv a₁ (by exact_mod_cast ha1A)
      have hseg : a₁ ∈ segment ℝ v3 v2 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp
      rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h.symm⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast h2A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h.symm⟩
  -- (d) Non-degeneracy of `SA(v₁,v₂,v₃)`: the three Moser triangle vertices
  -- lie on the Moser circle (centre `S.Packet.center`), hence are noncollinear.
  have hv1SAne : signedArea2 v1 v2 v3 ≠ 0 := by
    have hv1O : ‖v1 - S.Packet.center‖ = S.Packet.radius :=
      S.Packet.moser_on_boundary_1
    have hv2O : ‖v2 - S.Packet.center‖ = S.Packet.radius :=
      S.Packet.moser_on_boundary_2
    have hv3O : ‖v3 - S.Packet.center‖ = S.Packet.radius :=
      S.Packet.moser_on_boundary_3
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_eq_norm] using hv1O)
      (by simpa [dist_eq_norm] using hv2O)
      (by simpa [dist_eq_norm] using hv3O)
      S.triangle.v12_ne S.triangle.v23_ne S.triangle.v13_ne
  -- (e) Strict opposite-sign: both factors nonzero and product `≤ 0`.
  have hstrict : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 < 0 :=
    lt_of_le_of_ne hle (mul_ne_zero ha1SAne hv1SAne)
  -- (f) Cross-difference identity (the 2D cross product `(v₂−v₃) × (a₁−v₁)`).
  have hcross : signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3 =
      (v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0) := by
    simp only [signedArea2]; ring
  -- (g) 2D Cauchy–Schwarz on the cross product: `(cross)² ≤ t²·r²`.
  have hcs : ((v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0)) ^ 2
      ≤ t ^ 2 * r ^ 2 := by
    have e23 := dist_sq_coord v2 v3; have e1a1 := dist_sq_coord v1 a₁
    rw [hv2v3] at e23; rw [hv1a1] at e1a1
    nlinarith [sq_nonneg ((v2 0 - v3 0) * (a₁ 0 - v1 0) +
      (v2 1 - v3 1) * (a₁ 1 - v1 1)), e23, e1a1]
  -- (h) Strict opposite-sign ⟹ `SA(v₁)² < (SA(v₁) − SA(a₁))²`.
  have ha1sq : 0 < signedArea2 a₁ v2 v3 ^ 2 := by positivity
  have hgap : signedArea2 v1 v2 v3 ^ 2 <
      (signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3) ^ 2 := by
    nlinarith [hstrict, ha1sq]
  -- (i) Chain: `SA(v₁)² < (SA(v₁) − SA(a₁))² ≤ t²r²`.
  rw [hcross] at hgap
  linarith [hcs, hgap]

/- ### Scalar √-witness core for the sub-shape (B) `L1` residual

The acute-angle-at-`q₃` residual `0 < ⟪v₃ − q₃, x − q₃⟫` reduces (frame `v₂ = 0`,
`v₃ = (t,0)`, all five points on `κ₂ = S(v₂,t)`) to a pure scalar inequality on
the central-angle cosines.  Writing `a = cos α` (the `v₁`-angle, `≥ 0` from the
non-obtuse apex), `p = cos(angle between x and v₁)`, and `B = |sin α|`,
`T = |perp(x rel v₁)|`, the r-window becomes `2p ≤ 1 + a²`, the `x`-arc sign
becomes `p > a`, and the target `cos θ_x ≥ √3/2` is `4(ap + BT)² ≥ 3` together
with `ap + BT ≥ 0`.  These three lemmas carry the certificate.  No polynomial
Positivstellensatz cert exists (degree ≤ 4 Putinar LP/SDP infeasible — the
feasible region pinches singularly at `θ_x = 60°` as `signedArea2 v₁ v₂ v₃ → 0`),
so the proof is an explicit order argument: a case split on the sign of
`N := 8a²p² − 4a² − 4p² + 1` together with the squaring identity
`(8·a·p·B·T)² − N² = (1 − 16(p²−a²)²) − 2N`. -/

/-- Abstract monotone-squaring core: from `M ≥ 0`, `K ≥ 0` and the identity
`M² − N² = K − 2N`, conclude `0 ≤ N + M`.  On the negative-`N` branch the
identity gives `N² ≤ M²`, hence `−N ≤ M`. -/
private theorem cap_MNK_core {M N K : ℝ} (hKnn : 0 ≤ K) (hM0 : 0 ≤ M)
    (hDid : M ^ 2 - N ^ 2 = K - 2 * N) : 0 ≤ N + M := by
  rcases le_or_gt 0 N with hNpos | hNneg
  · linarith
  · have hMN : N ^ 2 ≤ M ^ 2 := by nlinarith [hDid, hKnn, hNneg]
    have hge : -N ≤ M := by nlinarith [hMN, hM0, hNneg, sq_nonneg (M + N)]
    linarith

-- The reduced cosine inequality is a degree-8 polynomial identity over the
-- r-window boundary; `linear_combination` discharges the two identities exactly,
-- but the `64·a²·p²·hBTsq` combination needs the raised heartbeat budget.
set_option maxHeartbeats 2000000 in
/-- Reduced scalar inequality.  With `a ∈ [0,1]`, `BT ≥ 0` the perpendicular
cross product with `BT² = (1 − a²)(1 − p²)`, the `x`-arc sign `a < p` and the
r-window `2p ≤ 1 + a²`, the `v₃`-frame cosine `c = a·p + BT` satisfies `4c² ≥ 3`
(i.e. `cos θ_x ≥ √3/2`). -/
private theorem cap_reduced (a p BT : ℝ)
    (ha0 : 0 ≤ a) (ha1 : a ≤ 1) (hBT0 : 0 ≤ BT)
    (hBTsq : BT ^ 2 = (1 - a ^ 2) * (1 - p ^ 2))
    (hpa : a < p) (hR : 2 * p ≤ 1 + a ^ 2) :
    3 ≤ 4 * (a * p + BT) ^ 2 := by
  have hp0 : 0 ≤ p := le_of_lt (lt_of_le_of_lt ha0 hpa)
  have hapBT : 0 ≤ a * p * BT := mul_nonneg (mul_nonneg ha0 hp0) hBT0
  have hpub : p ≤ (1 + a ^ 2) / 2 := by linarith
  have hp2 : p ^ 2 ≤ ((1 + a ^ 2) / 2) ^ 2 := by nlinarith [hp0, hpub, mul_nonneg hp0 hp0]
  have hpa2 : p ^ 2 - a ^ 2 ≤ 1 / 4 := by
    nlinarith [hp2, mul_nonneg (mul_nonneg ha0 ha0)
      (by nlinarith [ha1, ha0] : (0 : ℝ) ≤ 2 - a ^ 2)]
  have hpa2nn : 0 ≤ p ^ 2 - a ^ 2 := by nlinarith [hpa, ha0, hp0]
  obtain ⟨M, hMdef⟩ : ∃ M, M = 8 * (a * p * BT) := ⟨_, rfl⟩
  obtain ⟨N, hNdef⟩ : ∃ N, N = 8 * a ^ 2 * p ^ 2 - 4 * a ^ 2 - 4 * p ^ 2 + 1 := ⟨_, rfl⟩
  obtain ⟨K, hKdef⟩ : ∃ K, K = 1 - 16 * (p ^ 2 - a ^ 2) ^ 2 := ⟨_, rfl⟩
  have hKnn : 0 ≤ K := by rw [hKdef]; nlinarith [hpa2, hpa2nn]
  have hM0 : 0 ≤ M := by rw [hMdef]; linarith [hapBT]
  have hid' : 4 * (a * p + BT) ^ 2 - 3 = N + M := by
    rw [hMdef, hNdef]; linear_combination 4 * hBTsq
  have hDid' : M ^ 2 - N ^ 2 = K - 2 * N := by
    rw [hMdef, hNdef, hKdef]; linear_combination (64 * a ^ 2 * p ^ 2) * hBTsq
  have := cap_MNK_core hKnn hM0 hDid'
  linarith [hid', this]

-- The `a < p` branch chains an `harcx`-driven `βσ ≥ β²` with a monotone square,
-- needing the raised heartbeat budget for the closing `nlinarith`.
set_option maxHeartbeats 2000000 in
/-- Scalar bridge in the `v₁`-frame normalized invariants.  Here `a = cos α`,
`beta = sin α` (signed), `p = cos∠(x,v₁)`, `sig = sin∠(x,v₁)`, all with
`a² + beta² = 1`, `p² + sig² = 1`.  The non-obtuse apex gives `a ≥ 0`, the Moser
non-degeneracy `signedArea2 v₁ v₂ v₃ ≠ 0` gives `a < 1`, the r-window is
`2p ≤ 1 + a²`, and `harcx` (strict via convex independence) is the arc sign.
The conclusion packages `4·cc² ≥ 3` and `cc ≥ 0` for `cc = a·p + beta·sig`
(`= cos θ_x`), the two facts the goal closer consumes. -/
private theorem cap_scalar (a beta p sig : ℝ)
    (h1 : a ^ 2 + beta ^ 2 = 1) (h2 : p ^ 2 + sig ^ 2 = 1)
    (ha : 0 ≤ a) (ha1 : a < 1)
    (hrwin : 2 * p ≤ 1 + a ^ 2)
    (harcx : beta * (beta * (1 - p) - sig * (1 - a)) < 0) :
    3 ≤ 4 * (a * p + beta * sig) ^ 2 ∧ 0 ≤ a * p + beta * sig := by
  have h1a : 0 < 1 - a := by linarith
  have hbsig : 0 ≤ beta * sig := by
    have hk : beta ^ 2 * (1 - p) ≤ beta * sig * (1 - a) := by nlinarith [harcx]
    have hb2 : 0 ≤ beta ^ 2 * (1 - p) := by nlinarith [sq_nonneg beta, h2, sq_nonneg sig]
    nlinarith [hk, hb2, h1a, mul_pos h1a h1a]
  have hpa : a < p := by
    by_contra hlt
    push_neg at hlt
    have hbsb : beta ^ 2 ≤ beta * sig := by
      have hstep : beta ^ 2 * (1 - a) ≤ beta * sig * (1 - a) := by
        nlinarith [harcx, sq_nonneg beta, hlt]
      exact le_of_mul_le_mul_right (by linarith [hstep]) h1a
    have hb2 : 0 < beta ^ 2 := by nlinarith [h1, ha1, ha]
    have hsig2 : beta ^ 2 ≤ sig ^ 2 := by nlinarith [hbsb, hb2, sq_nonneg (beta * sig - beta ^ 2)]
    nlinarith [hbsb, hb2, hsig2, h1, h2, ha, hlt, sq_nonneg (sig - beta), sq_nonneg (sig + beta),
      mul_pos hb2 hb2, mul_nonneg (le_of_lt hb2) (sub_nonneg.mpr hsig2), sq_nonneg (p - a)]
  have hBTsq : (beta * sig) ^ 2 = (1 - a ^ 2) * (1 - p ^ 2) := by
    have e1 : beta ^ 2 = 1 - a ^ 2 := by linarith
    have e2 : sig ^ 2 = 1 - p ^ 2 := by linarith
    rw [mul_pow, e1, e2]
  have hp0 : 0 ≤ p := le_of_lt (lt_of_le_of_lt ha hpa)
  exact ⟨cap_reduced a p (beta * sig) ha (le_of_lt ha1) hbsig hBTsq hpa hrwin,
    add_nonneg (mul_nonneg ha hp0) hbsig⟩

/-- Goal-positivity closer.  From `cos θ_x ≥ √3/2` (encoded as `s3 ≤ 2*cc`, with
`s3 = √3`), the on-circle perpendicular `Qx² = (1 − cc²)·t⁴` and the equilateral
apex cross magnitude `Qq² = 3t⁴/4`, the inner product
`⟪v₃ − q₃, x − q₃⟫ = (t²/2)·(cc + 1) − Qq·Qx/t²` (scaled here to
`cc·t⁴ − 2·Qq·Qx + t⁴`) is strictly positive. -/
private theorem cap_goal_pos (cc Qx Qq t s3 : ℝ)
    (ht : 0 < t) (hs3 : s3 ^ 2 = 3) (hs3pos : 0 < s3)
    (hcc : s3 ≤ 2 * cc)
    (hQq : Qq ^ 2 = 3 * t ^ 4 / 4) (hQx : Qx ^ 2 = (1 - cc ^ 2) * t ^ 4) :
    0 < cc * t ^ 4 - 2 * Qq * Qx + t ^ 4 := by
  have ht4 : 0 < t ^ 4 := by positivity
  have hcc2 : 3 / 4 ≤ cc ^ 2 := by nlinarith [hcc, hs3, hs3pos]
  have h1cc : 1 - cc ^ 2 ≤ 1 / 4 := by linarith
  have hpos : 0 < (cc + 1) * t ^ 4 := by nlinarith [hcc, hs3pos, ht4, hcc2]
  have hsqstrict : (2 * Qq * Qx) ^ 2 < ((cc + 1) * t ^ 4) ^ 2 := by
    have e : (2 * Qq * Qx) ^ 2 = 3 * (1 - cc ^ 2) * t ^ 8 := by
      have h2 : (2 * Qq * Qx) ^ 2 = 4 * (Qq ^ 2) * (Qx ^ 2) := by ring
      rw [h2, hQq, hQx]; ring
    rw [e]
    nlinarith [h1cc, hcc2, ht4, mul_pos ht4 ht4, hcc, hs3pos]
  have hlt : 2 * Qq * Qx < (cc + 1) * t ^ 4 := by
    nlinarith [hsqstrict, hpos, sq_nonneg (2 * Qq * Qx - (cc + 1) * t ^ 4)]
  linarith [hlt]

-- The bridge expands four `signedArea2`/`inner` Lagrange-type identities to
-- coordinates and feeds the scalar core; the degree-4 `linear_combination`s and
-- the assembly need the raised heartbeat budget.
set_option maxHeartbeats 4000000 in
/-- **Sub-shape (B) `L1` residual — geometric bridge.**  All five points
`v₁,v₃,x,q₃` lie on `κ₂ = S(v₂,t)` and `q₃` is the equilateral apex on base
`v₂v₃` (`dist v₃ q₃ = t`).  Given the non-obtuse apex (`hnonob`), the strict
r-window (`hrwin`), the strict `x`-arc sign (`harcx_strict`), the Moser
non-degeneracy `signedArea2 v₂ v₃ v₁ ≠ 0` and `x ≠ v₁`, the inner product
`⟪v₃ − q₃, x − q₃⟫` is strictly positive (the acute-angle-at-`q₃` fact).  The
proof rotates into the `v₃`-frame via frame-free Lagrange/rotation identities,
reducing to `cap_scalar` (`cos θ_x ≥ √3/2`) and `cap_goal_pos`. -/
private theorem subshapeB_L1_residual
    {v1 v2 v3 x q3 : ℝ²} {r t : ℝ}
    (ht : 0 < t) (hr : 0 < r)
    (hv2v3 : dist v2 v3 = t) (hv2v1 : dist v2 v1 = t) (hv2x : dist v2 x = t)
    (hv2q3 : dist v2 q3 = t) (hv3q3 : dist v3 q3 = t) (hv1x : dist v1 x = r)
    (hnonob : 0 ≤ inner ℝ (v3 - v2) (v1 - v2))
    (hrwin : signedArea2 v1 v2 v3 ^ 2 < t ^ 2 * r ^ 2)
    (harcx_strict : signedArea2 x v3 v1 * signedArea2 v2 v3 v1 < 0)
    (hbne : signedArea2 v2 v3 v1 ≠ 0) (hx_ne_v1 : x ≠ v1) :
    0 < inner ℝ (v3 - q3) (x - q3) := by
  classical
  -- `t² = ‖·‖²` on the four chord lengths from `v₂` and the equilateral leg.
  set t2 : ℝ := t ^ 2 with ht2def
  have ht2pos : 0 < t2 := by positivity
  have hnv3 : inner ℝ (v3 - v2) (v3 - v2) = t2 := by
    rw [real_inner_self_eq_norm_sq, ← dist_eq_norm, dist_comm, hv2v3]
  have hnv1 : inner ℝ (v1 - v2) (v1 - v2) = t2 := by
    rw [real_inner_self_eq_norm_sq, ← dist_eq_norm, dist_comm, hv2v1]
  have hnx : inner ℝ (x - v2) (x - v2) = t2 := by
    rw [real_inner_self_eq_norm_sq, ← dist_eq_norm, dist_comm, hv2x]
  have hnq : inner ℝ (q3 - v2) (q3 - v2) = t2 := by
    rw [real_inner_self_eq_norm_sq, ← dist_eq_norm, dist_comm, hv2q3]
  have hnv3q : inner ℝ (v3 - q3) (v3 - q3) = t2 := by
    rw [real_inner_self_eq_norm_sq, ← dist_eq_norm, hv3q3]
  -- Scalar invariants (un-normalized; everything carries a factor `t2`).
  set Ia : ℝ := inner ℝ (v1 - v2) (v3 - v2) with hIadef
  set Ip : ℝ := inner ℝ (x - v2) (v1 - v2) with hIpdef
  set Ic : ℝ := inner ℝ (x - v2) (v3 - v2) with hIcdef
  set bcr : ℝ := signedArea2 v2 v3 v1 with hbdef
  set scr : ℝ := signedArea2 v1 v2 x with hsdef
  set Qx : ℝ := signedArea2 v2 v3 x with hQxdef
  set Qq : ℝ := signedArea2 v2 v3 q3 with hQqdef
  -- Coordinate (frame-free) identities, each `ring`-closed after expansion.
  have hLag1' : Ia ^ 2 + bcr ^ 2
      = inner ℝ (v1 - v2) (v1 - v2) * inner ℝ (v3 - v2) (v3 - v2) := by
    rw [hIadef, hbdef]
    simp only [signedArea2, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
      Fin.sum_univ_two, PiLp.sub_apply]; ring
  have hLag1 : Ia ^ 2 + bcr ^ 2 = t2 * t2 := by rw [hLag1', hnv1, hnv3]
  have hLagx' : Ip ^ 2 + scr ^ 2
      = inner ℝ (x - v2) (x - v2) * inner ℝ (v1 - v2) (v1 - v2) := by
    rw [hIpdef, hsdef]
    simp only [signedArea2, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
      Fin.sum_univ_two, PiLp.sub_apply]; ring
  have hLagx : Ip ^ 2 + scr ^ 2 = t2 * t2 := by rw [hLagx', hnx, hnv1]
  have hLagc' : Ic ^ 2 + Qx ^ 2
      = inner ℝ (x - v2) (x - v2) * inner ℝ (v3 - v2) (v3 - v2) := by
    rw [hIcdef, hQxdef]
    simp only [signedArea2, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
      Fin.sum_univ_two, PiLp.sub_apply]; ring
  have hLagc : Ic ^ 2 + Qx ^ 2 = t2 * t2 := by rw [hLagc', hnx, hnv3]
  have hrot' : Ic * inner ℝ (v1 - v2) (v1 - v2) = Ia * Ip + bcr * scr := by
    rw [hIadef, hIpdef, hIcdef, hbdef, hsdef]
    simp only [signedArea2, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
      Fin.sum_univ_two, PiLp.sub_apply]; ring
  have hrot : Ic * t2 = Ia * Ip + bcr * scr := by rw [← hnv1]; exact hrot'
  -- `signedArea2 x v₃ v₁ = bcr − scr − Qx` (signed-area additivity).
  have hadd : signedArea2 x v3 v1 = bcr - scr - Qx := by
    simp only [hbdef, hsdef, hQxdef, signedArea2]; ring
  -- Goal identity: `2·t2·goal = Ic·t2 − 2·Qq·Qx + t2²`.
  have hgoalid : 2 * t2 * (inner ℝ (v3 - q3) (x - q3)) = Ic * t2 - 2 * Qq * Qx + t2 ^ 2 := by
    rw [hIcdef, hQqdef, hQxdef]
    simp only [signedArea2, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
      Fin.sum_univ_two, PiLp.sub_apply] at hnq hnv3 hnv3q ⊢
    set IP3PX := (v3 0 - v2 0) * (x 0 - v2 0) + (v3 1 - v2 1) * (x 1 - v2 1)
    set IPQPX := (q3 0 - v2 0) * (x 0 - v2 0) + (q3 1 - v2 1) * (x 1 - v2 1)
    linear_combination (t2 - IP3PX) * hnq + (-IP3PX + 2 * IPQPX - t2) * hnv3 + (IP3PX + t2) * hnv3q
  -- Equilateral apex cross magnitude: `4·Qq² = 3·t2²`.
  have hQqsq : 4 * Qq ^ 2 = 3 * t2 ^ 2 := by
    rw [hQqdef]
    simp only [signedArea2, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
      Fin.sum_univ_two, PiLp.sub_apply] at hnq hnv3 hnv3q ⊢
    set IP3P3 := (v3 0 - v2 0) * (v3 0 - v2 0) + (v3 1 - v2 1) * (v3 1 - v2 1)
    set IP3PQ := (v3 0 - v2 0) * (q3 0 - v2 0) + (v3 1 - v2 1) * (q3 1 - v2 1)
    linear_combination (4 * IP3P3 - 2 * IP3PQ - t2) * hnq + (-2 * IP3PQ + 3 * t2) * hnv3 +
      (2 * IP3PQ + t2) * hnv3q
  -- Normalize by `t2`.
  set a : ℝ := Ia / t2 with hadef
  set beta : ℝ := bcr / t2 with hbetadef
  set p : ℝ := Ip / t2 with hpdef
  set sig : ℝ := scr / t2 with hsigdef
  set cc : ℝ := Ic / t2 with hccdef
  have ht2ne : t2 ≠ 0 := ne_of_gt ht2pos
  -- Unit-circle relations.
  have h1 : a ^ 2 + beta ^ 2 = 1 := by
    rw [hadef, hbetadef, div_pow, div_pow, ← add_div, div_eq_one_iff_eq (by positivity)]
    rw [hLag1]; ring
  have h2 : p ^ 2 + sig ^ 2 = 1 := by
    rw [hpdef, hsigdef, div_pow, div_pow, ← add_div, div_eq_one_iff_eq (by positivity)]
    rw [hLagx]; ring
  -- `cc = a·p + beta·sig`.
  have hcceq : cc = a * p + beta * sig := by
    rw [hccdef, hadef, hbetadef, hpdef, hsigdef]
    have key : Ia / t2 * (Ip / t2) + bcr / t2 * (scr / t2) = (Ia * Ip + bcr * scr) / t2 ^ 2 := by
      field_simp
    rw [key, ← hrot]
    field_simp
  -- `a ≥ 0` (non-obtuse), `a < 1` (non-degeneracy `bcr ≠ 0`).
  have haIa : 0 ≤ Ia := by rw [hIadef]; rw [real_inner_comm]; exact hnonob
  have ha : 0 ≤ a := by rw [hadef]; exact div_nonneg haIa (le_of_lt ht2pos)
  have hbetane : beta ≠ 0 := by
    rw [hbetadef]; exact div_ne_zero hbne ht2ne
  have ha1 : a < 1 := by
    have hb2pos : 0 < beta ^ 2 := by positivity
    nlinarith [h1, hb2pos, ha]
  -- r-window in normalized form: `2p ≤ 1 + a²`.
  have hrwin' : 2 * p ≤ 1 + a ^ 2 := by
    -- `signedArea2 v₁ v₂ v₃ = bcr` (cyclic), so `hrwin : bcr² < t2·r²`. And `r² = t2·(2 − 2p)`.
    have hSAeq : signedArea2 v1 v2 v3 = bcr := by
      simp only [hbdef, signedArea2]; ring
    have hr2 : r ^ 2 = t2 * (2 - 2 * p) := by
      have hxv1 : inner ℝ (x - v1) (x - v1) = r ^ 2 := by
        rw [real_inner_self_eq_norm_sq, ← dist_eq_norm, dist_comm, hv1x]
      have hexp : inner ℝ (x - v1) (x - v1)
          = inner ℝ (x - v2) (x - v2) + inner ℝ (v1 - v2) (v1 - v2)
            - 2 * inner ℝ (x - v2) (v1 - v2) := by
        simp only [PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
          Fin.sum_univ_two, PiLp.sub_apply]; ring
      rw [hexp, hnx, hnv1, ← hIpdef] at hxv1
      rw [hpdef]; field_simp; linear_combination -hxv1
    rw [hSAeq] at hrwin
    -- bcr² < t2·r² = t2·t2·(2−2p) = t2²·(2−2p). β=bcr/t2, β²=bcr²/t2². so β²<2−2p.
    have hbeta2 : beta ^ 2 < 2 - 2 * p := by
      rw [hbetadef, div_pow]
      rw [div_lt_iff₀ (by positivity)]
      rw [hr2] at hrwin
      nlinarith [hrwin, ht2pos]
    nlinarith [hbeta2, h1]
  -- Inverse normalization relations (no division), used to keep `hkey` polynomial.
  have hbcr : bcr = beta * t2 := by rw [hbetadef]; field_simp
  have hIpr : Ip = p * t2 := by rw [hpdef]; field_simp
  have hscr : scr = sig * t2 := by rw [hsigdef]; field_simp
  have hIar : Ia = a * t2 := by rw [hadef]; field_simp
  -- `harcx` strict in normalized form: `beta·(beta(1−p) − sig(1−a)) < 0`.
  have harcx' : beta * (beta * (1 - p) - sig * (1 - a)) < 0 := by
    -- Perpendicular rotation identity `Qx·t2 = bcr·Ip − Ia·scr`.
    have hQxrot' : Qx * inner ℝ (v1 - v2) (v1 - v2) = bcr * Ip - Ia * scr := by
      rw [hIadef, hIpdef, hbdef, hsdef, hQxdef]
      simp only [signedArea2, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
        Fin.sum_univ_two, PiLp.sub_apply]; ring
    have hQxrot : Qx * t2 = bcr * Ip - Ia * scr := by rw [← hnv1]; exact hQxrot'
    -- `Qx = (beta·p − a·sig)·t2` from the perpendicular rotation, then expand.
    have hQ : Qx * t2 = (beta * p - a * sig) * t2 ^ 2 := by
      rw [hQxrot, hbcr, hIpr, hscr, hIar]; ring
    have hQx : Qx = (beta * p - a * sig) * t2 := by
      have hcancel : Qx * t2 = ((beta * p - a * sig) * t2) * t2 := by rw [hQ]; ring
      exact mul_right_cancel₀ ht2ne hcancel
    -- `signedArea2 x v₃ v₁ · bcr = t2²·beta·(beta(1−p) − sig(1−a))`.
    have hkey : signedArea2 x v3 v1 * bcr
        = t2 ^ 2 * (beta * (beta * (1 - p) - sig * (1 - a))) := by
      rw [hadd, hbcr, hscr, hQx]; ring
    rw [hbdef] at harcx_strict
    have hpos : 0 < t2 ^ 2 := by positivity
    nlinarith [harcx_strict, hkey, hpos]
  -- Apply the scalar core: `cos θ_x ≥ √3/2` and `cos θ_x ≥ 0`.
  obtain ⟨h4cc, hcc0⟩ := cap_scalar a beta p sig h1 h2 ha ha1 hrwin' harcx'
  rw [← hcceq] at h4cc hcc0
  -- `s3 := √3`, `2·cc ≥ s3`.
  set s3 : ℝ := Real.sqrt 3 with hs3def
  have hs3sq : s3 ^ 2 = 3 := by rw [hs3def, Real.sq_sqrt]; norm_num
  have hs3pos : 0 < s3 := by rw [hs3def]; exact Real.sqrt_pos.mpr (by norm_num)
  have hcc_ge : s3 ≤ 2 * cc := by
    have h2cc : 0 ≤ 2 * cc := by linarith [hcc0]
    nlinarith [h4cc, hcc0, hs3sq, hs3pos, sq_nonneg (2 * cc - s3), sq_nonneg (2 * cc + s3)]
  -- `Qx² = (1 − cc²)·t⁴`.
  have hQxsq : Qx ^ 2 = (1 - cc ^ 2) * t ^ 4 := by
    have hcct2 : Ic = cc * t2 := by rw [hccdef]; field_simp
    have : Qx ^ 2 = t2 * t2 - Ic ^ 2 := by linarith [hLagc]
    rw [this, hcct2, ht2def]; ring
  -- `Qq² = 3·t⁴/4`.
  have hQqsq' : Qq ^ 2 = 3 * t ^ 4 / 4 := by rw [ht2def] at hQqsq; nlinarith [hQqsq]
  -- Goal positivity via `cap_goal_pos`, then unscale by `2·t2 > 0`.
  have hpos := cap_goal_pos cc Qx Qq t s3 ht hs3sq hs3pos hcc_ge hQqsq' hQxsq
  have hcct4 : cc * t ^ 4 - 2 * Qq * Qx + t ^ 4 = 2 * t2 * (inner ℝ (v3 - q3) (x - q3)) := by
    rw [hgoalid]
    have hcct2 : Ic = cc * t2 := by rw [hccdef]; field_simp
    rw [hcct2, ht2def]; ring
  rw [hcct4] at hpos
  have h2t2 : 0 < 2 * t2 := by positivity
  exact (mul_pos_iff_of_pos_left h2t2).mp hpos

-- Raised from 1600000: the K4 budget sieve (cover + two-circle sieves + card
-- splitting) adds substantial elaboration on top of the perp-bisector clash.
set_option maxHeartbeats 4000000 in
/-- **Layer-4 bisector-separation sieve, sub-shape (B) [`q₃ ∈ I₂` leaf].**
The base `v₂v₃` is at distance `t`, the Form-`a` witnesses `x ∈ I₂`, `y ∈ I₃`
sit at radius `r` from `v₁`, `x` at radius `t` from `v₂`, and `q₃` is the
equilateral apex on base `v₂v₃` (`dist v₂ q₃ = dist v₃ q₃ = t`).  The
bisector-separation sieve at `x` (apply `S.hK4` at `x`; the two half-plane
bounds A1/A2 of the prose limit `wc_{v₃}(t)∖{x,v₃}` and `{a₁,b₁,y}` to ≤1 hit
each on the `x`-circle, so the card-≥4 budget forces `v₁,v₃ ∈ wc_x(ρ)`),
pins `x` to the perpendicular bisector of `v₁v₃`, giving `r = 2t·sin(α/4)`;
combined with the r-window `r > t·sin α` and `2 sin(α/4) < sin α` on
`α ∈ (60°,90°]`, this is contradictory.

W3 Layer-4 `q₃ ∈ I₂` leaf (proven below).

**Critical correction (2026-06-12)**: The clash algebra `r²·t² < signedArea2(v₁,v₂,v₃)²`
cannot be derived from squared-distance hypotheses alone — the perp-bisector pin system has
two solutions (near branch: `r² = t²(2−√3)` ✓; far branch: `r² = t²(2+√3)` genuine model).
The orientation hypothesis `horient` (x on same side of chord v₁v₂ as v₃, equivalently
opposite side of v₁v₃ from v₂) selects the near branch and is now a leaf parameter,
supplied from `c2_vertex_same_open_side_as_v3 hxI2` in the caller.

Remaining gaps (status 2026-06-14):
1. **K4 budget argument** — now CLOSED apart from a single same-side certificate.
   The cover (`A ⊆ {v₁,v₂,v₃} ∪ I₁ ∪ I₂ ∪ I₃`), the two-circle sieves
   (A1 = `S(v₃,t) ⊇ {v₂,q₃,a₃,b₃}`, A2 = `S(v₁,r) ⊇ {a₁,b₁}`), and the
   card-splitting step forcing `{v₁,v₃} ⊆ K` are all machine-checked.  The A1
   certs for `a₃,b₃` come from `c3_same_side_of_v3x_chord`; the A2 certs for
   `a₁,b₁` from `c1_same_side_of_v1x_chord`.  The single residual was **L1**: the
   same-side cert for the cap-`C₂` apex `q₃` wrt chord `v₃–x`
   (`0 < signedArea2 q₃ v₃ x · signedArea2 v₂ v₃ x`), the metric arc-position fact
   that the boundary order cannot see.  L1 is now CLOSED (no sorry): two verified
   bridge steps (`signedArea_prod_pos_of_inner_midpoint_pos` then
   `inner_chord_eq_two_mul_inner_midpoint`, both `O := v₂` on κ₂) collapse it to the
   acute-angle-at-`q₃` residual `0 < ⟪v₃ − q₃, x − q₃⟫` (= `θ_x < 60°`), and that
   residual is discharged by `subshapeB_L1_residual`: a frame-free rotation into the
   `v₃`-frame (four Lagrange/rotation `signedArea2`/`inner` identities) reduces it to
   `cos θ_x ≥ √3/2`, proved by `cap_scalar` + `cap_reduced` (the √-witness +
   monotone-squaring ORDER argument — case split on `N := 8a²p² − 4a² − 4p² + 1` with
   `(8apβσ)² − N² = (1 − 16(p²−a²)²) − 2N`, NOT a Positivstellensatz cert) and closed
   by `cap_goal_pos`.  Strictness uses the Moser non-degeneracy
   `signedArea2 v₂ v₃ v₁ ≠ 0` and `x ≠ v₁` to exclude the `v₁ = v₃` pinch.
2. **Sub-shape B clash** — once v₁,v₃ ∈ K give `dist x v₁ = dist x v₃ = ρ`, the clash
   `r²·t² < signedArea2(v₁,v₂,v₃)²` is CLOSED as the verified standalone lemma
   `subshapeB_clash` (below; Heron + perp-bisector + non-obtuse parabola bound, no sorry).
   The near-branch selection `hAB` (x, v₂ opposite sides of chord v₁v₃) is now proved
   directly from `hxI2` (cap membership), independent of `horient`.

Discharged in prose: `docs/n-lane/97-section3-n-lane-prose.md` §"Sub-shape (B) sieve"
(lines 1895–1900). -/
private theorem layer4_subshapeB_kill
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {x y q₃ a₁ b₁ a₃ b₃ : ℝ²} {r t : ℝ}
    (hr : 0 < r) (ht : 0 < t)
    (hxI2 : x ∈ S.I2) (hyI3 : y ∈ S.I3) (ha3I3 : a₃ ∈ S.I3) (hb3I3 : b₃ ∈ S.I3)
    (hI1eq : S.I1 = ({a₁, b₁} : Finset ℝ²)) (hI3eq : S.I3 = ({a₃, b₃} : Finset ℝ²))
    (hxA : x ∈ A)
    (ha1I1 : a₁ ∈ S.I1) (hv1a1 : dist S.triangle.v1 a₁ = r)
    (hb1I1 : b₁ ∈ S.I1) (hv1b1 : dist S.triangle.v1 b₁ = r)
    (hv1x : dist S.triangle.v1 x = r) (hv1y : dist S.triangle.v1 y = r)
    (hv2x : dist S.triangle.v2 x = t) (hv3y : dist S.triangle.v3 y = t)
    (hv3a3 : dist S.triangle.v3 a₃ = t) (hv3b3 : dist S.triangle.v3 b₃ = t)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t)
    (hv2v1 : dist S.triangle.v2 S.triangle.v1 = t)
    (hv2q3 : dist S.triangle.v2 q₃ = t) (hv3q3 : dist S.triangle.v3 q₃ = t)
    (hq3I2 : q₃ ∈ S.I2)
    -- Orientation: x lies on the same open side of chord v₁v₂ as v₃.
    -- Supplied by `c2_vertex_same_open_side_as_v3 hxI2` in the caller.
    -- This selects the near perp-bisector branch (r² = t²(2−√3)) and is
    -- mandatory for the clash algebra — the far branch (r² = t²(2+√3)) is a
    -- genuine model where no contradiction exists.
    (horient : 0 < signedArea2 x S.triangle.v1 S.triangle.v2 *
                 signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) :
    False := by
  classical
  -- LAYER 4 setup: apply `PerVertexK4` at the interior witness `x ∈ I₂ ⊆ A`,
  -- obtaining the `x`-witness radius `ρ > 0` with `wc_x(ρ) = K`, card ≥ 4.
  obtain ⟨ρ, hρpos, hKcard⟩ := S.hK4 x hxA
  set K : Finset ℝ² := A.filter (fun q => dist x q = ρ) with hKdef
  have hKcard' : 4 ≤ K.card := hKcard
  -- The sieve now runs on `K`: the A1 half-plane bound (chord `v₃–x`) limits
  -- `wc_{v₃}(t) ∖ {x,v₃}` to ≤1 hit in `K` (via `sieve_at_most_one_on_xcircle`
  -- with `c := v₃`), the A2 bound (chord `v₁–x`) limits `{a₁,b₁,y}` to ≤1, and
  -- the card-≥4 budget then forces `v₁,v₃ ∈ K`, i.e. `dist x v₁ = dist x v₃ = ρ`.
  -- K4 budget argument — A1/A2 inscribed-angle side-bounds
  -- (`C₃ ⊆ {p₁ ≥ d/2}`) drive the card budget; machine-checked below.
  -- Once K4 gives hv1K : dist x v₁ = ρ and hv3K : dist x v₃ = ρ (hence
  -- dist x v₁ = dist x v₃ = ρ, with ρ = r from hv1x), the sub-shape B clash
  -- algebra is now CLOSED as the verified standalone lemma `subshapeB_clash`
  -- (below): it consumes the isoceles legs `hv2v1`/`hv2v3`, the three
  -- x-distances (`dist x v₁ = dist x v₃ = r`, `dist x v₂ = t`), the non-obtuse
  -- apex `S.Packet.inner_at_v2` (rewritten into the coordinate `hnonob` form),
  -- and the near-branch selection `hAB`, and yields
  -- `r²·t² < signedArea2(v₁,v₂,v₃)²` with no sorry (Heron + perp-bisector +
  -- non-obtuse parabola bound).  Both former residuals are now discharged: (i) the
  -- K4 budget below forces `v₁,v₃ ∈ K`, and (ii) the orientation→`hAB` translation
  -- threads `hAB` (x, v₂ on opposite sides of chord v₁v₃) from `horient` via the
  -- inscribed-angle ordering.  Combined with the `r`-window contradiction, B is dead.
  --
  -- ───────────────────────────────────────────────────────────────────────────
  -- Structured wiring: the verified `subshapeB_clash` engine is invoked against
  -- concrete inputs; both former gaps are now machine-checked `have`s —
  -- (1) the K4 budget forcing `v₁,v₃ ∈ K`, and (2) the orientation→`hAB`
  -- near-branch translation.  The upper bound `signedArea2(v₁,v₂,v₃)² ≤ r²t²`
  -- (`hupper`) is now PROVED by 2D Cauchy–Schwarz on the cross-difference (no
  -- sin-window / trig needed).  Everything else (the `ρ = r` pin, the non-obtuse
  -- `hnonob` coordinate conversion, the clash invocation, and the final
  -- contradiction) is concrete and machine-checked.
  -- ───────────────────────────────────────────────────────────────────────────
  -- (1) BUDGET FORCING.  The card-≥4 budget forces both `v₁ ∈ K` and `v₃ ∈ K`.
  -- Cover (via `A ⊆ {v₁,v₂,v₃} ∪ I₁ ∪ I₂ ∪ I₃`, the `ZeroDefectCapLayout`
  -- enumeration): `A \ {v₁,v₃,x} ⊆ P1 ∪ P2` where `P1 = {v₂,q₃,a₃,b₃} ⊆ S(v₃,t)`
  -- and `P2 = {a₁,b₁} ⊆ S(v₁,r)`.  Sieve: `|K ∩ P1| ≤ 1` (via
  -- `sieve_at_most_one_on_xcircle`, `c = v₃`), `|K ∩ P2| ≤ 1` (`c = v₁`).  Then
  -- `|K \ {v₁,v₃}| ≤ 2`, and with `|K| ≥ 4` the splitting identity
  -- `card_sdiff_add_card_inter` forces `{v₁,v₃} ⊆ K`, i.e. `dist x v₁ = dist x v₃ = ρ`.
  --
  -- The A1 same-side certificate `hL1` for the cap-`C₂` apex `q₃`
  -- (`q₃ ∈ I₂` shares `signedArea2 · v₃ x`-sign with `v₂`) is proved below via
  -- `subshapeB_L1_residual`; everything else (the A1 certs for `a₃,b₃` via
  -- `c3_same_side_of_v3x_chord`, the A2 certs for `a₁,b₁` via
  -- `c1_same_side_of_v1x_chord`, the cover, and the card budget) is machine-checked.
  -- L1 same-side cert for `q₃ ∈ I₂` wrt chord `v₃–x`,
  --   `0 < signedArea2 q₃ v₃ x · signedArea2 v₂ v₃ x`.  This is the metric
  --   arc-position fact placing `q₃` (the equilateral apex on base `v₂v₃` that is
  --   not `v₁`) on the same open side of the variable chord `v₃–x` as `v₂`.  The
  --   pure CCW boundary order does not see the radius `dist v₃ q₃ = t`, so the
  --   arc-order of `q₃` relative to `x` is not readable from the cyclic frame
  --   alone; the metric route is needed.
  --
  -- REDUCTION (verified, no sorry below it): with `v₂` at origin all of
  --   `v₃,q₃,v₁,x ∈ κ₂ = S(v₂,t)`.  Two verified bridge steps collapse the goal:
  --     STEP 1 `signedArea_prod_pos_of_inner_midpoint_pos` (`O := v₂`, `a := q₃`;
  --       needs `‖v₃−v₂‖ = ‖x−v₂‖` (✓ both `t`: hv2v3/hv2x) and `x ≠ v₃`) ⟹
  --       `0 < ⟪M − q₃, M − v₂⟫` (`M = midpoint v₃ x`).
  --     STEP 2 `inner_chord_eq_two_mul_inner_midpoint` (center `v₂`, chord `v₃–x`,
  --       point `q₃`, all on κ₂) ⟹ `⟪v₃−q₃, x−q₃⟫ = 2·⟪M−v₂, M−q₃⟫`, so the
  --       residual is EQUIVALENT to the acute-angle-at-`q₃` claim
  --       `0 < ⟪v₃ − q₃, x − q₃⟫` (= `θ_x < 60°`, x strictly before `q₃` on I₂).
  -- The three load-bearing inputs are assembled at the residual (BOTH (1)+(2)
  -- mandatory — each alone is insufficient; at `α = 120°` the target goes `< 0`):
  --     (1) r-window `signedArea2 v₁ v₂ v₃ ^ 2 < t² · r²`  via `rWindow_general`
  --         (the steps-1–8 sub-lemma of `equilateral_rWindow`, no Heron step 9).
  --     (2) non-obtuse `0 ≤ ⟪v₃ − v₂, v₁ − v₂⟫`  from `S.Packet.inner_at_v2`.
  --     (3) x-arc sign `signedArea2 x v₃ v₁ · signedArea2 v₂ v₃ v₁ ≤ 0` from `hxI2`.
  -- L1 core (sub-shape B): the acute-angle residual `0 < ⟪v₃ − q₃, x − q₃⟫`
  --   is discharged below via `subshapeB_L1_residual`.  It has no polynomial
  --   Positivstellensatz certificate (degree ≤ 4 Putinar LP/SDP infeasible —
  --   the feasible region is SINGULAR, pinching to `θ_x = 60°` as
  --   `signedArea2 v₁ v₂ v₃ → 0`), so the closure is an explicit √-witness +
  --   monotone-squaring ORDER argument (cf. the sibling `qEqE_oneCosine_crux`).
  have hL1 : 0 < signedArea2 q₃ S.triangle.v3 x *
      signedArea2 S.triangle.v2 S.triangle.v3 x := by
    set v1 := S.triangle.v1 with hv1def
    set v2 := S.triangle.v2 with hv2def
    set v3 := S.triangle.v3 with hv3def
    -- `x ≠ v₃` (chord non-degeneracy): `x ∈ I₂ = (C₂.erase v₃).erase v₁`.
    have hx_ne_v3 : x ≠ v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
    -- ── STEP 1: chord-sphere bridge (`O := v₂`, apex `a := q₃`, chord `v₃–x`). ──
    -- Both chord endpoints `v₃, x` are at distance `t` from `v₂` (`hv2v3`/`hv2x`),
    -- so `v₂` is on the perpendicular bisector; `signedArea_prod_pos_of_inner_midpoint_pos`
    -- reduces the goal to `0 < ⟪M − q₃, M − v₂⟫` with `M = midpoint v₃ x`.
    have heqnorm : ‖v3 - v2‖ = ‖x - v2‖ := by
      rw [← dist_eq_norm, ← dist_eq_norm, dist_comm v3 v2, dist_comm x v2, hv2v3, hv2x]
    refine signedArea_prod_pos_of_inner_midpoint_pos heqnorm hx_ne_v3 ?_
    -- ── STEP 2: inscribed-angle identity collapses `⟪M − q₃, M − v₂⟫` to the
    -- vertex-angle inner product `(1/2)·⟪v₃ − q₃, x − q₃⟫`. ──
    -- `q₃, v₃, x` are all on the `v₂`-circle of radius `t` (`hv2q3`/`hv2v3`/`hv2x`),
    -- so `inner_chord_eq_two_mul_inner_midpoint` (center `v₂`, chord `v₃–x`, point `q₃`)
    -- gives `⟪v₃ − q₃, x − q₃⟫ = 2·⟪M − v₂, M − q₃⟫`.  The residual `0 < ⟪M − q₃, M − v₂⟫`
    -- is therefore EQUIVALENT to `0 < ⟪v₃ − q₃, x − q₃⟫`: the inscribed angle at the
    -- equilateral apex `q₃` (on base `v₂v₃`) subtending the chord `v₃–x` is ACUTE.
    have hv3O : ‖v3 - v2‖ = ‖q₃ - v2‖ := by
      rw [← dist_eq_norm, ← dist_eq_norm, dist_comm v3 v2, dist_comm q₃ v2, hv2v3, hv2q3]
    have hxO : ‖x - v2‖ = ‖q₃ - v2‖ := by
      rw [← dist_eq_norm, ← dist_eq_norm, dist_comm x v2, dist_comm q₃ v2, hv2x, hv2q3]
    have hangle : inner ℝ (v3 - q₃) (x - q₃)
        = 2 * inner ℝ (midpoint ℝ v3 x - v2) (midpoint ℝ v3 x - q₃) :=
      inner_chord_eq_two_mul_inner_midpoint hv3O hxO
    have hcomm : inner ℝ (midpoint ℝ v3 x - q₃) (midpoint ℝ v3 x - v2)
        = inner ℝ (midpoint ℝ v3 x - v2) (midpoint ℝ v3 x - q₃) := real_inner_comm _ _
    have hhalf : inner ℝ (midpoint ℝ v3 x - q₃) (midpoint ℝ v3 x - v2)
        = (1 / 2 : ℝ) * inner ℝ (v3 - q₃) (x - q₃) := by rw [hcomm]; linarith [hangle]
    rw [hhalf]
    suffices hresidual : 0 < inner ℝ (v3 - q₃) (x - q₃) by linarith
    -- ── RESIDUAL (L1 core): the acute-angle-at-`q₃` inner product. ──
    -- Goal: `0 < ⟪v₃ − q₃, x − q₃⟫`.  With `v₂` at the origin and `v₃, x, q₃, v₁`
    -- on the circle `κ₂ = S(v₂,t)`, `q₃` the equilateral apex at central angle 60°
    -- from `v₃`, this is EXACTLY `θ_x < 60°` (x strictly before `q₃` on the I₂ arc),
    -- equivalently (reduced frame) the scalar `1 + cos θ_x + √3·sin θ_x > 0`.
    --
    -- The three load-bearing inputs are assembled below (all in scope):
    --   (1) r-window  `signedArea2 v₁ v₂ v₃ ^ 2 < t² · r²`   (`hrwin`)
    --   (2) non-obtuse `0 ≤ ⟪v₃ − v₂, v₁ − v₂⟫`              (`hnonob`)
    --   (3) x-arc sign `signedArea2 x v₃ v₁ · signedArea2 v₂ v₃ v₁ ≤ 0` (`harcx`),
    --       strict (`< 0`) via the Moser-circle non-degeneracy `signedArea2 v₂ v₃ v₁ ≠ 0`
    --       and ConvexIndep `signedArea2 x v₃ v₁ ≠ 0` (`hSAv2v3v1ne`/`hSAxv3v1ne`).
    -- L1 core (sub-shape B): the acute-angle-at-`q₃` residual
    --   `0 < ⟪v₃ − q₃, x − q₃⟫`.  Reduces (frame `v₂=0`, `v₃=(t,0)`, `q₃=(t/2,−t√3/2)`,
    --   on-circle) to the scalar `1 + x₀/t + √3·x₁/t > 0`, i.e. `θ_x < 60°`.  It has
    --   no polynomial Positivstellensatz certificate (degree ≤ 4 Putinar LP/SDP
    --   infeasible across all tested formulations — direct product, inner-product,
    --   `2c−1` reduction, `f²`-boosted, in both reduced and raw coordinates; the
    --   feasible region is SINGULAR, pinching to the boundary `θ_x = 60°` exactly
    --   as `signedArea2 v₁ v₂ v₃ → 0` (`v₁ → v₃`), so any cert would degenerate
    --   with `1/signedArea2 v₁ v₂ v₃`).  Discharged via `subshapeB_L1_residual`
    --   (cf. the sibling `qEqE_oneCosine_crux`, memory `2Y9K54`): an explicit
    --   √-witness + monotone-squaring ORDER argument on the central angle.
    -- INPUT (1): strict r-window.
    have hrwin : signedArea2 v1 v2 v3 ^ 2 < t ^ 2 * r ^ 2 :=
      rWindow_general S ha1I1 hv1a1 hv2v3
    -- INPUT (2): non-obtuse apex at `v₂`.
    have hnonob : 0 ≤ inner ℝ (v3 - v2) (v1 - v2) := S.Packet.inner_at_v2
    -- INPUT (3): `x ∈ I₂` arc sign (closed), then strict via non-degeneracy.
    have harcx : signedArea2 x v3 v1 * signedArea2 v2 v3 v1 ≤ 0 := by
      have haC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
      have h := ((S.CP.arc_membership x hxA).2.1).mp haC2
      simpa [Problem97.OnArcOpposite] using h
    -- ── BRIDGE to the scalar √-witness core (`cap_scalar` + `cap_goal_pos`). ──
    -- `x ≠ v₁` (outer erase of `I₂ = (C₂.erase v₃).erase v₁`).
    have hx_ne_v1 : x ≠ v1 := (Finset.mem_erase.mp hxI2).1
    -- Non-degeneracy `signedArea2 v₂ v₃ v₁ ≠ 0` (the three triangle vertices on the
    -- Moser circle are noncollinear).
    have hbne : signedArea2 v2 v3 v1 ≠ 0 := by
      have hv1O : ‖v1 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_1
      have hv2O : ‖v2 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_2
      have hv3O : ‖v3 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_3
      have h132 : signedArea2 v1 v2 v3 ≠ 0 :=
        MEC.signedArea2_ne_zero_of_three_dist_eq
          (by simpa [dist_eq_norm] using hv1O) (by simpa [dist_eq_norm] using hv2O)
          (by simpa [dist_eq_norm] using hv3O)
          S.triangle.v12_ne S.triangle.v23_ne S.triangle.v13_ne
      intro hb0; apply h132
      have : signedArea2 v1 v2 v3 = signedArea2 v2 v3 v1 := by
        simp only [signedArea2]; ring
      rw [this]; exact hb0
    -- Non-degeneracy `signedArea2 x v₃ v₁ ≠ 0` (`x, v₃, v₁` noncollinear by ConvexIndep).
    have hxSAne : signedArea2 x v3 v1 ≠ 0 := by
      intro hΔ
      have hcol : Collinear ℝ ({x, v3, v1} : Set ℝ²) :=
        Problem97.collinear_of_signedArea2_eq_zero x v3 v1 hΔ
      have hconv : ConvexIndep A := S.hconv
      have hxne1 : x ≠ v1 := hx_ne_v1
      have hxne3 : x ≠ v3 := hx_ne_v3
      have hv1ne3 : v1 ≠ v3 := S.triangle.v13_ne
      have h3A : v3 ∈ A := S.triangle.v3_mem
      have h1A : v1 ∈ A := S.triangle.v1_mem
      rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
      · apply hconv v3 (by exact_mod_cast h3A)
        have hseg : v3 ∈ segment ℝ x v1 := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro q hq
        rcases hq with rfl | hq
        · exact ⟨by exact_mod_cast hxA, by
            simp only [Set.mem_singleton_iff]; exact fun h => hxne3 h⟩
        · rcases hq with rfl
          exact ⟨by exact_mod_cast h1A, by
            simp only [Set.mem_singleton_iff]; exact fun h => hv1ne3 h⟩
      · apply hconv v1 (by exact_mod_cast h1A)
        have hseg : v1 ∈ segment ℝ v3 x := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro q hq
        rcases hq with rfl | hq
        · exact ⟨by exact_mod_cast h3A, by
            simp only [Set.mem_singleton_iff]; exact fun h => hv1ne3 h.symm⟩
        · rcases hq with rfl
          exact ⟨by exact_mod_cast hxA, by
            simp only [Set.mem_singleton_iff]; exact fun h => hxne1 h⟩
      · apply hconv x (by exact_mod_cast hxA)
        have hseg : x ∈ segment ℝ v1 v3 := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro q hq
        rcases hq with rfl | hq
        · exact ⟨by exact_mod_cast h1A, by
            simp only [Set.mem_singleton_iff]; exact fun h => hxne1 h.symm⟩
        · rcases hq with rfl
          exact ⟨by exact_mod_cast h3A, by
            simp only [Set.mem_singleton_iff]; exact fun h => hxne3 h.symm⟩
    -- Strict arc sign.
    have harcx_strict : signedArea2 x v3 v1 * signedArea2 v2 v3 v1 < 0 :=
      lt_of_le_of_ne harcx (mul_ne_zero hxSAne hbne)
    exact subshapeB_L1_residual ht hr hv2v3 hv2v1 hv2x hv2q3 hv3q3 hv1x
      hnonob hrwin harcx_strict hbne hx_ne_v1
  -- A1 same-side certs for the `I₃` cap vertices (`c3_same_side_of_v3x_chord`).
  have hcertA3 : 0 < signedArea2 a₃ S.triangle.v3 x *
      signedArea2 S.triangle.v2 S.triangle.v3 x :=
    c3_same_side_of_v3x_chord S ha3I3 hxI2 hv2v3 hv2x ht
  have hcertB3 : 0 < signedArea2 b₃ S.triangle.v3 x *
      signedArea2 S.triangle.v2 S.triangle.v3 x :=
    c3_same_side_of_v3x_chord S hb3I3 hxI2 hv2v3 hv2x ht
  -- A2 same-side certs for the `I₁` cap vertices (`c1_same_side_of_v1x_chord`).
  have hcertA1 : 0 < signedArea2 a₁ S.triangle.v1 x *
      signedArea2 S.triangle.v3 S.triangle.v1 x :=
    c1_same_side_of_v1x_chord S ha1I1 hxI2
  have hcertB1 : 0 < signedArea2 b₁ S.triangle.v1 x *
      signedArea2 S.triangle.v3 S.triangle.v1 x :=
    c1_same_side_of_v1x_chord S hb1I1 hxI2
  -- Nondegeneracy of `signedArea2 v₂ v₃ x` (from `hL1 > 0`).
  have hSAv2ne : signedArea2 S.triangle.v2 S.triangle.v3 x ≠ 0 := by
    intro h; rw [h, mul_zero] at hL1; exact (lt_irrefl 0) hL1
  -- `x ≠ q₃` (subsumed by `hL1`: `signedArea2 q₃ v₃ x ≠ 0`).
  have hxq3 : x ≠ q₃ := by
    intro h; rw [← h] at hL1
    simp only [signedArea2] at hL1; nlinarith [hL1]
  -- The two `I₂` points are exactly `x` and `q₃` (`|I₂| = 2`).
  have hI2eq : S.I2 = ({x, q₃} : Finset ℝ²) := by
    have hcard : S.I2.card = 2 := S.I2_card_eq_two
    have hsub : ({x, q₃} : Finset ℝ²) ⊆ S.I2 := by
      intro p hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl | rfl <;> assumption
    have hcard2 : ({x, q₃} : Finset ℝ²).card = 2 := by
      rw [Finset.card_insert_of_notMem (by simp [hxq3]), Finset.card_singleton]
    exact (Finset.eq_of_subset_of_card_le hsub (by rw [hcard, hcard2])).symm
  -- `x ∉ K` (`dist x x = 0 ≠ ρ`).
  have hxnotK : x ∉ K := by
    rw [hKdef, Finset.mem_filter]; rintro ⟨-, hd⟩
    rw [dist_self] at hd; exact (ne_of_lt hρpos) hd
  -- The two sieve groups.
  set P1 : Finset ℝ² := {S.triangle.v2, q₃, a₃, b₃} with hP1def
  set P2 : Finset ℝ² := {a₁, b₁} with hP2def
  -- A1 sieve: `|K ∩ P1| ≤ 1` (all of `P1 ⊆ S(v₃,t)`, same `v₃–x` chord side).
  have hsieveP1 : (P1.filter (fun p => dist p x = ρ)).card ≤ 1 := by
    apply sieve_at_most_one_on_xcircle (c := S.triangle.v3) (τ := t)
      (σ := signedArea2 S.triangle.v2 S.triangle.v3 x)
    · intro p hp
      rw [hP1def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl|rfl|rfl
      · exact hv2v3
      · rw [dist_comm]; exact hv3q3
      · rw [dist_comm]; exact hv3a3
      · rw [dist_comm]; exact hv3b3
    · intro p hp
      rw [hP1def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl|rfl|rfl
      · exact mul_self_pos.mpr hSAv2ne
      · exact hL1
      · exact hcertA3
      · exact hcertB3
  -- A2 sieve: `|K ∩ P2| ≤ 1` (all of `P2 ⊆ S(v₁,r)`, same `v₁–x` chord side).
  have hsieveP2 : (P2.filter (fun p => dist p x = ρ)).card ≤ 1 := by
    apply sieve_at_most_one_on_xcircle (c := S.triangle.v1) (τ := r)
      (σ := signedArea2 S.triangle.v3 S.triangle.v1 x)
    · intro p hp
      rw [hP2def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl
      · rw [dist_comm]; exact hv1a1
      · rw [dist_comm]; exact hv1b1
    · intro p hp
      rw [hP2def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl
      · exact hcertA1
      · exact hcertB1
  -- Convert the `filter`-on-`P` bounds to `K ∩ P` bounds (`dist_comm`).
  have hKP1 : (K ∩ P1).card ≤ 1 := by
    refine le_trans (Finset.card_le_card ?_) hsieveP1
    intro q hq; rcases Finset.mem_inter.mp hq with ⟨hqK, hqP1⟩
    rw [Finset.mem_filter]; refine ⟨hqP1, ?_⟩
    have hd : dist x q = ρ := by rw [hKdef, Finset.mem_filter] at hqK; exact hqK.2
    rw [dist_comm]; exact hd
  have hKP2 : (K ∩ P2).card ≤ 1 := by
    refine le_trans (Finset.card_le_card ?_) hsieveP2
    intro q hq; rcases Finset.mem_inter.mp hq with ⟨hqK, hqP2⟩
    rw [Finset.mem_filter]; refine ⟨hqP2, ?_⟩
    have hd : dist x q = ρ := by rw [hKdef, Finset.mem_filter] at hqK; exact hqK.2
    rw [dist_comm]; exact hd
  -- `A` is covered by the three Moser vertices plus the three cap interiors.
  have hAcover : A ⊆ ({S.triangle.v1, S.triangle.v2, S.triangle.v3} : Finset ℝ²)
      ∪ S.I1 ∪ S.I2 ∪ S.I3 := by
    intro p hpA
    by_cases hv1 : p = S.triangle.v1
    · subst hv1; simp
    by_cases hv2 : p = S.triangle.v2
    · subst hv2; simp
    by_cases hv3 : p = S.triangle.v3
    · subst hv3; simp
    have hnm : p ∉ S.triangle.verts := by
      simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
      push_neg; exact ⟨hv1, hv2, hv3⟩
    have hone := S.CP.nonmoser_in_one p hpA hnm
    by_cases hC1 : p ∈ S.CP.C1
    · have hpI1 : p ∈ S.I1 := by
        rw [show S.I1 = (S.CP.C1.erase S.triangle.v2).erase S.triangle.v3 from rfl]
        rw [Finset.mem_erase, Finset.mem_erase]; exact ⟨hv3, hv2, hC1⟩
      simp [hpI1]
    by_cases hC2 : p ∈ S.CP.C2
    · have hpI2 : p ∈ S.I2 := by
        rw [show S.I2 = (S.CP.C2.erase S.triangle.v3).erase S.triangle.v1 from rfl]
        rw [Finset.mem_erase, Finset.mem_erase]; exact ⟨hv1, hv3, hC2⟩
      simp [hpI2]
    by_cases hC3 : p ∈ S.CP.C3
    · have hpI3 : p ∈ S.I3 := by
        rw [show S.I3 = (S.CP.C3.erase S.triangle.v1).erase S.triangle.v2 from rfl]
        rw [Finset.mem_erase, Finset.mem_erase]; exact ⟨hv2, hv1, hC3⟩
      simp [hpI3]
    · exfalso; simp only [hC1, hC2, hC3, if_false] at hone; simp at hone
  -- Cover: every `q ∈ A` off `{v₁,v₃,x}` lands in `P1 ∪ P2`.
  have hcover : ∀ q ∈ A, q ≠ S.triangle.v1 → q ≠ S.triangle.v3 → q ≠ x →
      q ∈ P1 ∨ q ∈ P2 := by
    intro q hqA hqv1 hqv3 hqx
    have hq9 := hAcover hqA
    rcases Finset.mem_union.mp hq9 with hq789 | hI3mem
    · rcases Finset.mem_union.mp hq789 with hq456 | hI2mem
      · rcases Finset.mem_union.mp hq456 with hverts | hI1mem
        · -- `q ∈ {v₁,v₂,v₃}`: must be `v₂` (the others are excluded).
          simp only [Finset.mem_insert, Finset.mem_singleton] at hverts
          rcases hverts with hv1 | hv2 | hv3
          · exact absurd hv1 hqv1
          · exact Or.inl (by rw [hP1def]; simp [hv2])
          · exact absurd hv3 hqv3
        · -- `q ∈ I₁ = {a₁,b₁} = P2`.
          right; rw [← hI1eq]; exact hI1mem
      · -- `q ∈ I₂ = {x,q₃}`: must be `q₃` (`q ≠ x`).
        rw [hI2eq] at hI2mem
        simp only [Finset.mem_insert, Finset.mem_singleton] at hI2mem
        rcases hI2mem with hxc | hq3c
        · exact absurd hxc hqx
        · exact Or.inl (by rw [hP1def]; simp [hq3c])
    · -- `q ∈ I₃ = {a₃,b₃}`.
      left; rw [hP1def]; rw [hI3eq] at hI3mem
      simp only [Finset.mem_insert, Finset.mem_singleton] at hI3mem ⊢
      tauto
  -- Card budget: `|K \ {v₁,v₃}| ≤ 2`, hence with `|K| ≥ 4` both `v₁,v₃ ∈ K`.
  have hKsub : K ⊆ A := by rw [hKdef]; exact Finset.filter_subset _ _
  set T : Finset ℝ² := {S.triangle.v1, S.triangle.v3} with hTdef
  have hsubT : K \ T ⊆ (K ∩ P1) ∪ (K ∩ P2) := by
    intro q hq; rcases Finset.mem_sdiff.mp hq with ⟨hqK, hqT⟩
    have hqA : q ∈ A := hKsub hqK
    have hqv1 : q ≠ S.triangle.v1 := by intro h; exact hqT (by rw [hTdef, h]; simp)
    have hqv3 : q ≠ S.triangle.v3 := by intro h; exact hqT (by rw [hTdef, h]; simp)
    have hqx : q ≠ x := by intro h; exact hxnotK (h ▸ hqK)
    rcases hcover q hqA hqv1 hqv3 hqx with h | h
    · exact Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨hqK, h⟩)
    · exact Finset.mem_union_right _ (Finset.mem_inter.mpr ⟨hqK, h⟩)
  have hcard_sdiff : (K \ T).card ≤ 2 := by
    calc (K \ T).card ≤ ((K ∩ P1) ∪ (K ∩ P2)).card := Finset.card_le_card hsubT
      _ ≤ (K ∩ P1).card + (K ∩ P2).card := Finset.card_union_le _ _
      _ ≤ 2 := by omega
  have hsplit : (K \ T).card + (K ∩ T).card = K.card := Finset.card_sdiff_add_card_inter K T
  have hTcard : T.card = 2 := by
    rw [hTdef, Finset.card_insert_of_notMem (by simp [S.triangle.v13_ne]), Finset.card_singleton]
  have hinterT : (K ∩ T) = T := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
    have hle : (K ∩ T).card ≤ T.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hTsubK : T ⊆ K := by
    intro q hq; have hqKT : q ∈ K ∩ T := by rw [hinterT]; exact hq
    exact (Finset.mem_inter.mp hqKT).1
  have hv1mem : S.triangle.v1 ∈ K := hTsubK (by rw [hTdef]; simp)
  have hv3mem : S.triangle.v3 ∈ K := hTsubK (by rw [hTdef]; simp)
  have hv1K : dist x S.triangle.v1 = ρ := by
    rw [hKdef, Finset.mem_filter] at hv1mem; exact hv1mem.2
  have hv3K : dist x S.triangle.v3 = ρ := by
    rw [hKdef, Finset.mem_filter] at hv3mem; exact hv3mem.2
  -- (2) ρ = r pin and the two x-distances at radius r (concrete).
  have hρr : ρ = r := by rw [← hv1K, dist_comm]; exact hv1x
  have hxv1 : dist x S.triangle.v1 = r := by rw [hv1K, hρr]
  have hxv3 : dist x S.triangle.v3 = r := by rw [hv3K, hρr]
  -- (3) Non-obtuse apex at v₂ in coordinate form (concrete; from the packet's
  -- `inner_at_v2 : 0 ≤ ⟪v₃ − v₂, v₁ − v₂⟫`).
  have hnonob : 0 ≤ (S.triangle.v3 0 - S.triangle.v2 0) * (S.triangle.v1 0 - S.triangle.v2 0) +
      (S.triangle.v3 1 - S.triangle.v2 1) * (S.triangle.v1 1 - S.triangle.v2 1) := by
    have h := S.Packet.inner_at_v2
    simp only [EuclideanSpace.inner_eq_star_dotProduct, Matrix.vec2_dotProduct] at h
    simpa [mul_comm] using h
  -- (4) NEAR-BRANCH selection `hAB` (x, v₂ on opposite sides of chord v₁v₃).
  -- Proved directly from `hxI2 : x ∈ S.I2` (cap membership across chord v₃v₁),
  -- mirroring `c2_vertex_same_open_side_as_v3`; independent of `horient`.
  have hAB : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 *
      signedArea2 x S.triangle.v1 S.triangle.v3 < 0 := by
    -- This is independent of `horient`: it follows purely from cap membership
    -- `x ∈ S.I2`, mirroring `c2_vertex_same_open_side_as_v3` (steps 1–3) and
    -- then flipping to the chord-`v₁v₃` frame by antisymmetry.
    -- Decompose `x ∈ I2 = (C₂.erase v₃).erase v₁`.
    have haC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
    have hx_ne_v1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hxI2).1
    have hx_ne_v3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
    -- Cap membership ⇒ `x` on the closed arc opposite `v₂` across chord `v₃v₁`.
    have harc_le : signedArea2 x S.triangle.v3 S.triangle.v1 *
        signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 := by
      have h := ((S.CP.arc_membership x hxA).2.1).mp haC2
      simpa [Problem97.OnArcOpposite] using h
    -- Convex-independence: `x, v₃, v₁` are not collinear, so `signedArea2 x v₃ v₁ ≠ 0`.
    have hxv3v1_ne : signedArea2 x S.triangle.v3 S.triangle.v1 ≠ 0 := by
      intro hΔ
      have hcol : Collinear ℝ ({x, S.triangle.v3, S.triangle.v1} : Set ℝ²) :=
        Problem97.collinear_of_signedArea2_eq_zero x S.triangle.v3 S.triangle.v1 hΔ
      have hconv : ConvexIndep A := S.hconv
      have h3A : S.triangle.v3 ∈ A := S.triangle.v3_mem
      have h1A : S.triangle.v1 ∈ A := S.triangle.v1_mem
      rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
      · apply hconv S.triangle.v3 (by exact_mod_cast h3A)
        have hseg : S.triangle.v3 ∈ segment ℝ x S.triangle.v1 := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro z hz
        rcases hz with rfl | hz
        · exact ⟨by exact_mod_cast hxA, by
            simp only [Set.mem_singleton_iff]; exact fun h => hx_ne_v3 h⟩
        · rcases hz with rfl
          exact ⟨by exact_mod_cast h1A, by
            simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v13_ne h⟩
      · apply hconv S.triangle.v1 (by exact_mod_cast h1A)
        have hseg : S.triangle.v1 ∈ segment ℝ S.triangle.v3 x := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro z hz
        rcases hz with rfl | hz
        · exact ⟨by exact_mod_cast h3A, by
            simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v13_ne h.symm⟩
        · rcases hz with rfl
          exact ⟨by exact_mod_cast hxA, by
            simp only [Set.mem_singleton_iff]; exact fun h => hx_ne_v1 h⟩
      · apply hconv x (by exact_mod_cast hxA)
        have hseg : x ∈ segment ℝ S.triangle.v1 S.triangle.v3 := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro z hz
        rcases hz with rfl | hz
        · exact ⟨by exact_mod_cast h1A, by
            simp only [Set.mem_singleton_iff]; exact fun h => hx_ne_v1 h.symm⟩
        · rcases hz with rfl
          exact ⟨by exact_mod_cast h3A, by
            simp only [Set.mem_singleton_iff]; exact fun h => hx_ne_v3 h.symm⟩
    -- Three Moser triangle vertices on the Moser circle ⇒ `signedArea2 v₂ v₃ v₁ ≠ 0`.
    have hv2v3v1_ne : signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≠ 0 := by
      have hv1O : ‖S.triangle.v1 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_1
      have hv2O : ‖S.triangle.v2 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_2
      have hv3O : ‖S.triangle.v3 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        (by simpa [dist_eq_norm] using hv2O)
        (by simpa [dist_eq_norm] using hv3O)
        (by simpa [dist_eq_norm] using hv1O)
        S.triangle.v23_ne S.triangle.v13_ne.symm S.triangle.v12_ne.symm
    -- Hence the arc product is *strictly* negative.
    have harc : signedArea2 x S.triangle.v3 S.triangle.v1 *
        signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 < 0 :=
      lt_of_le_of_ne harc_le (mul_ne_zero hxv3v1_ne hv2v3v1_ne)
    -- Flip to the chord-`v₁v₃` frame by antisymmetry of the last two arguments:
    -- `signedArea2 x v₃ v₁ = -signedArea2 x v₁ v₃` and
    -- `signedArea2 v₂ v₃ v₁ = -signedArea2 v₂ v₁ v₃`, so the product is unchanged
    -- up to a `(-1)·(-1)` and a `mul_comm`.
    have hflip1 : signedArea2 x S.triangle.v3 S.triangle.v1 =
        -signedArea2 x S.triangle.v1 S.triangle.v3 := by
      simp only [signedArea2]; ring
    have hflip2 : signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 =
        -signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 := by
      simp only [signedArea2]; ring
    rw [hflip1, hflip2] at harc
    nlinarith [harc]
  -- (5) Sub-shape B clash via the verified standalone engine (concrete).
  have hclash : r ^ 2 * t ^ 2 <
      signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ^ 2 :=
    subshapeB_clash (by rw [dist_comm]; exact hv2v1) hv2v3 hxv1 hxv3
      (by rw [dist_comm]; exact hv2x) hnonob hAB
  -- (6) Upper bound `SA(v₁,v₂,v₃)² ≤ r²t²` by 2D Cauchy–Schwarz on the
  -- cross-difference `SA(v₁,v₂,v₃) − SA(a₁,v₂,v₃) = (v₂−v₃) × (a₁−v₁)`.
  -- This is the non-equilateral analogue of the bound inside
  -- `equilateral_rWindow` (steps 1–3 there), without the Heron identity:
  -- `a₁ ∈ I₁` lies in the closed cap `C₁` opposite `v₁`, so `SA(a₁,v₂,v₃)` and
  -- `SA(v₁,v₂,v₃)` have strictly opposite signs (ConvexIndep makes both nonzero).
  -- Opposite signs give `SA(v₁)² < (SA(v₁) − SA(a₁))²`, and Cauchy–Schwarz with
  -- `|v₂v₃| = t`, `|v₁a₁| = r` gives `(SA(v₁) − SA(a₁))² ≤ t²r² = r²t²`.
  have hupper : signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ^ 2 ≤ r ^ 2 * t ^ 2 := by
    set v1 := S.triangle.v1 with hv1def
    set v2 := S.triangle.v2 with hv2def
    set v3 := S.triangle.v3 with hv3def
    -- (a) Membership of `a₁` in cap `C₁` and `A`, with `a₁ ∉ {v₂, v₃}`.
    have ha1A : a₁ ∈ A :=
      S.CP.C1_subset (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1))
    have ha1C1 : a₁ ∈ S.CP.C1 :=
      Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1)
    have ha1ne3 : a₁ ≠ v3 := (Finset.mem_erase.mp ha1I1).1
    have ha1ne2 : a₁ ≠ v2 :=
      (Finset.mem_erase.mp (Finset.mem_of_mem_erase ha1I1)).1
    -- (b) Cap-`C₁` arc membership: closed chord-separation
    -- `SA(a₁,v₂,v₃)·SA(v₁,v₂,v₃) ≤ 0`.
    have hle : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 ≤ 0 :=
      (S.CP.arc_membership a₁ ha1A).1.mp ha1C1
    -- (c) Strict non-degeneracy of `SA(a₁,v₂,v₃)` from ConvexIndep.
    have h2A : v2 ∈ A := S.triangle.v2_mem
    have h3A : v3 ∈ A := S.triangle.v3_mem
    have ha1SAne : signedArea2 a₁ v2 v3 ≠ 0 := by
      intro hΔ
      have hcol : Collinear ℝ ({a₁, v2, v3} : Set ℝ²) :=
        Problem97.collinear_of_signedArea2_eq_zero a₁ v2 v3 hΔ
      have hconv : ConvexIndep A := S.hconv
      rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
      · apply hconv v2 (by exact_mod_cast h2A)
        have hseg : v2 ∈ segment ℝ a₁ v3 := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro p hp
        rcases hp with rfl | hp
        · exact ⟨by exact_mod_cast ha1A, by
            simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h⟩
        · rcases hp with rfl
          exact ⟨by exact_mod_cast h3A, by
            simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h.symm⟩
      · apply hconv v3 (by exact_mod_cast h3A)
        have hseg : v3 ∈ segment ℝ v2 a₁ := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro p hp
        rcases hp with rfl | hp
        · exact ⟨by exact_mod_cast h2A, by
            simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h⟩
        · rcases hp with rfl
          exact ⟨by exact_mod_cast ha1A, by
            simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h⟩
      · apply hconv a₁ (by exact_mod_cast ha1A)
        have hseg : a₁ ∈ segment ℝ v3 v2 := hw.mem_segment
        rw [← convexHull_pair] at hseg
        refine convexHull_mono ?_ hseg
        intro p hp
        rcases hp with rfl | hp
        · exact ⟨by exact_mod_cast h3A, by
            simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h.symm⟩
        · rcases hp with rfl
          exact ⟨by exact_mod_cast h2A, by
            simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h.symm⟩
    -- (d) Non-degeneracy of `SA(v₁,v₂,v₃)`: the three Moser triangle vertices
    -- lie on the Moser circle (centre `S.Packet.center`), hence are noncollinear.
    have hv1SAne : signedArea2 v1 v2 v3 ≠ 0 := by
      have hv1O : ‖v1 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_1
      have hv2O : ‖v2 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_2
      have hv3O : ‖v3 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        (by simpa [dist_eq_norm] using hv1O)
        (by simpa [dist_eq_norm] using hv2O)
        (by simpa [dist_eq_norm] using hv3O)
        S.triangle.v12_ne S.triangle.v23_ne S.triangle.v13_ne
    -- (e) Strict opposite-sign: both factors nonzero and product `≤ 0`.
    have hstrict : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 < 0 :=
      lt_of_le_of_ne hle (mul_ne_zero ha1SAne hv1SAne)
    -- (f) Cross-difference identity (the 2D cross product `(v₂−v₃) × (a₁−v₁)`).
    have hcross : signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3 =
        (v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0) := by
      simp only [signedArea2]; ring
    -- (g) 2D Cauchy–Schwarz on the cross product: `(cross)² ≤ t²·r²`.
    have hcs : ((v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0)) ^ 2
        ≤ t ^ 2 * r ^ 2 := by
      have e23 := dist_sq_coord v2 v3; have e1a1 := dist_sq_coord v1 a₁
      rw [hv2v3] at e23; rw [hv1a1] at e1a1
      nlinarith [sq_nonneg ((v2 0 - v3 0) * (a₁ 0 - v1 0) +
        (v2 1 - v3 1) * (a₁ 1 - v1 1)), e23, e1a1]
    -- (h) Strict opposite-sign ⟹ `SA(v₁)² < (SA(v₁) − SA(a₁))²`.
    have ha1sq : 0 < signedArea2 a₁ v2 v3 ^ 2 := by positivity
    have hgap : signedArea2 v1 v2 v3 ^ 2 <
        (signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3) ^ 2 := by
      nlinarith [hstrict, ha1sq]
    -- (i) Chain: `SA(v₁)² < (SA(v₁) − SA(a₁))² ≤ t²r² = r²t²`.
    rw [hcross] at hgap
    nlinarith [hcs, hgap]
  -- (7) Final contradiction: `r²t² < SA² ≤ r²t²` (concrete).
  linarith

set_option maxHeartbeats 1600000 in
/-- **Equilateral perp-bisector clash (sub-shape A, c = v₁ subcase).**
Given an equilateral triangle `v₁v₂v₃` (all sides `t`) and a point `x` at
distance `r` from both `v₁` and `v₃` (i.e. on the perpendicular bisector of
`v₁v₃`, which passes through `v₂`) and at distance `t` from `v₂`, the
orientation hypothesis `horient` (placing `x` on the same open side of chord
`v₁v₂` as `v₃`) selects the *near* perp-bisector branch and forces
`4r² < 3t²`.

This packages the prose §"Sub-shape (A) sieve" clash pieces `harea`/`hpin`/
`hclash` into one verified frame-free algebraic fact.  Branch selection is
genuine: the *far* branch (`r² = t²(2+√3)`, where `horient` fails) is a real
model with `4r² > 3t²`.  The proof chains:
* `hBC` : `signedArea2 x v₁ v₃ · signedArea2 x v₁ v₂ > 0` (x sees `v₂,v₃` on
  the same side of line `x–v₁`; branch-independent);
* `hCA` : `horient` rewritten as `signedArea2 x v₁ v₂ · signedArea2 v₂ v₁ v₃ < 0`
  (via `signedArea2 v₃ v₁ v₂ = −signedArea2 v₂ v₁ v₃`);
* `hAB` : hence `signedArea2 v₂ v₁ v₃ · signedArea2 x v₁ v₃ < 0` (near branch);
* `hSAx`/`hSAv2` : Heron in coordinates
  (`4·SA(x,v₁,v₃)² = 4r²t²−t⁴`, `4·SA(v₂,v₁,v₃)² = 3t⁴`);
* `hdiff` : `(SA(v₂,v₁,v₃)−SA(x,v₁,v₃))² = t⁴` (cross-difference is the
  cross product `(v₃−v₁)×(v₂−x)`; perpendicularity gives magnitude `t·t`). -/
private theorem equilateral_clash
    {v1 v2 v3 x : ℝ²} {r t : ℝ} (hr : 0 < r) (ht : 0 < t)
    (h12 : dist v1 v2 = t) (h23 : dist v2 v3 = t) (h31 : dist v3 v1 = t)
    (hxv1 : dist x v1 = r) (hxv3 : dist x v3 = r) (hxv2 : dist x v2 = t)
    (horient : 0 < signedArea2 x v1 v2 * signedArea2 v3 v1 v2) :
    4 * r ^ 2 < 3 * t ^ 2 := by
  -- x sees v₂,v₃ on the same side of line x–v₁ (branch-independent positivity).
  have hBC : 0 < signedArea2 x v1 v3 * signedArea2 x v1 v2 := by
    have e12 := dist_sq_coord v1 v2; have e23 := dist_sq_coord v2 v3
    have e31 := dist_sq_coord v3 v1
    have ex1 := dist_sq_coord x v1; have ex3 := dist_sq_coord x v3
    have ex2 := dist_sq_coord x v2
    rw [h12] at e12; rw [h23] at e23; rw [h31] at e31
    rw [hxv1] at ex1; rw [hxv3] at ex3; rw [hxv2] at ex2
    simp only [signedArea2]
    nlinarith [e12, e23, e31, ex1, ex3, ex2, mul_pos hr ht, sq_nonneg t, sq_nonneg r]
  -- horient ⟺ C·A < 0 (since signedArea2 v₃ v₁ v₂ = −signedArea2 v₂ v₁ v₃).
  have hCA : signedArea2 x v1 v2 * signedArea2 v2 v1 v3 < 0 := by
    have hflip : signedArea2 v3 v1 v2 = - signedArea2 v2 v1 v3 := by
      simp only [signedArea2]; ring
    rw [hflip] at horient; nlinarith [horient]
  -- hence A·B < 0 : x, v₂ on opposite sides of v₁v₃ (the near branch).
  have hAB : signedArea2 v2 v1 v3 * signedArea2 x v1 v3 < 0 := by
    have hC2 : 0 < signedArea2 x v1 v2 ^ 2 := by
      have hCne : signedArea2 x v1 v2 ≠ 0 := by rintro h; rw [h] at hBC; simp at hBC
      positivity
    nlinarith [mul_neg_of_neg_of_pos hCA hBC, hC2]
  -- Heron for the x-isoceles triangle (sides r,r,t):
  have hSAx : 4 * signedArea2 x v1 v3 ^ 2 = 4 * r ^ 2 * t ^ 2 - t ^ 4 := by
    have ex1 := dist_sq_coord x v1; have ex3 := dist_sq_coord x v3
    have e31 := dist_sq_coord v3 v1
    rw [hxv1] at ex1; rw [hxv3] at ex3; rw [h31] at e31
    simp only [signedArea2]; nlinarith [ex1, ex3, e31]
  -- equilateral area:
  have hSAv2 : 4 * signedArea2 v2 v1 v3 ^ 2 = 3 * t ^ 4 := by
    have e12 := dist_sq_coord v1 v2; have e23 := dist_sq_coord v2 v3
    have e31 := dist_sq_coord v3 v1
    rw [h12] at e12; rw [h23] at e23; rw [h31] at e31
    simp only [signedArea2]; nlinarith [e12, e23, e31]
  -- perp-bisector + dist x v₂ = t ⟹ (A − B)² = t⁴:
  have hdiff : (signedArea2 v2 v1 v3 - signedArea2 x v1 v3) ^ 2 = t ^ 4 := by
    have hperp : (v3 0 - v1 0) * (v2 0 - x 0) + (v3 1 - v1 1) * (v2 1 - x 1) = 0 := by
      have ex1 := dist_sq_coord x v1; have ex3 := dist_sq_coord x v3
      have e12 := dist_sq_coord v1 v2; have e23 := dist_sq_coord v2 v3
      rw [hxv1] at ex1; rw [hxv3] at ex3; rw [h12] at e12; rw [h23] at e23
      nlinarith [ex1, ex3, e12, e23]
    have e31 := dist_sq_coord v3 v1; have ex2 := dist_sq_coord x v2
    rw [h31] at e31; rw [hxv2] at ex2
    simp only [signedArea2]; nlinarith [hperp, e31, ex2]
  nlinarith [hSAx, hSAv2, hdiff, hAB, mul_pos hr ht, sq_nonneg t]

set_option maxHeartbeats 1600000 in
/-- **Equilateral r-window lower bound (sub-shape A, Piece 4).**
For the equilateral triangle `v₁v₂v₃` (all sides `t`) and a cap-`C₁` *interior*
point `a₁ ∈ I₁` at radius `r` from `v₁`, the chord-separation membership of `a₁`
in the closed cap `C₁` (it lies on the arc opposite `v₁`, on the far side of
chord `v₂v₃` from `v₁`) forces `r` above the equilateral half-height bound:
`4r² > 3t²` (⇔ `r > t·sin 60° = t·√3/2`).

The argument is purely algebraic — no `Real.sqrt`:
* `a₁ ∈ C₁` gives `signedArea2 a₁ v₂ v₃ · signedArea2 v₁ v₂ v₃ ≤ 0` (closed-arc
  `OnArcOpposite`), and `a₁ ∉ {v₂, v₃}` + `ConvexIndep` make `signedArea2 a₁ v₂ v₃`
  strictly nonzero, so the product is strictly `< 0` (`a₁` and `v₁` on opposite
  open sides of line `v₂v₃`).
* equilateral Heron: `4·signedArea2(v₁,v₂,v₃)² = 3t⁴` (the `hSAv2` identity).
* cross-difference identity: `signedArea2 v₁ v₂ v₃ − signedArea2 a₁ v₂ v₃` is the
  2D cross product `(v₂−v₃) × (a₁−v₁)`, whose square is bounded by `t²·r²`
  (Cauchy–Schwarz, `|v₂v₃| = t`, `|v₁a₁| = r`).
* the strict opposite-sign condition makes `(SA(v₁) − SA(a₁))² > SA(v₁)²`, so
  `t²r² ≥ (SA(v₁) − SA(a₁))² > SA(v₁)² = 3t⁴/4`, giving `4r²t² > 3t⁴` and hence
  `4r² > 3t²` after dividing by `t² > 0`.

Combined with `equilateral_clash`'s `4r² < 3t²` (selected on the near branch by
`horient`), the `c = v₁` sub-case of `layer4_subshapeA_kill` closes by `linarith`. -/
private theorem equilateral_rWindow
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {a₁ : ℝ²} {r t : ℝ}
    (ht : 0 < t)
    (ha1I1 : a₁ ∈ S.I1)
    (hv1a1 : dist S.triangle.v1 a₁ = r)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t)
    (hv2v1 : dist S.triangle.v2 S.triangle.v1 = t)
    (hv3v1 : dist S.triangle.v3 S.triangle.v1 = t) :
    3 * t ^ 2 < 4 * r ^ 2 := by
  set v1 := S.triangle.v1 with hv1def
  set v2 := S.triangle.v2 with hv2def
  set v3 := S.triangle.v3 with hv3def
  -- (1) Membership of `a₁` in cap `C₁` and `A`, with `a₁ ∉ {v₂, v₃}`.
  have ha1A : a₁ ∈ A :=
    S.CP.C1_subset (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1))
  have ha1C1 : a₁ ∈ S.CP.C1 :=
    Finset.mem_of_mem_erase (Finset.mem_of_mem_erase ha1I1)
  have ha1ne3 : a₁ ≠ v3 := (Finset.mem_erase.mp ha1I1).1
  have ha1ne2 : a₁ ≠ v2 :=
    (Finset.mem_erase.mp (Finset.mem_of_mem_erase ha1I1)).1
  -- (2) Cap-`C₁` arc membership: `OnArcOpposite v₁ v₂ v₃ a₁`, i.e. the closed
  -- chord-separation `SA(a₁,v₂,v₃)·SA(v₁,v₂,v₃) ≤ 0`.
  have hle : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 ≤ 0 :=
    (S.CP.arc_membership a₁ ha1A).1.mp ha1C1
  -- (3) Strict non-degeneracy of `SA(a₁,v₂,v₃)` from ConvexIndep (a₁,v₂,v₃
  -- are three distinct A-vertices, not collinear).
  have h2A : v2 ∈ A := S.triangle.v2_mem
  have h3A : v3 ∈ A := S.triangle.v3_mem
  have ha1SAne : signedArea2 a₁ v2 v3 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a₁, v2, v3} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a₁ v2 v3 hΔ
    have hconv : ConvexIndep A := S.hconv
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    · apply hconv v2 (by exact_mod_cast h2A)
      have hseg : v2 ∈ segment ℝ a₁ v3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp
      rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast ha1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h.symm⟩
    · apply hconv v3 (by exact_mod_cast h3A)
      have hseg : v3 ∈ segment ℝ v2 a₁ := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp
      rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast h2A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast ha1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h⟩
    · apply hconv a₁ (by exact_mod_cast ha1A)
      have hseg : a₁ ∈ segment ℝ v3 v2 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro p hp
      rcases hp with rfl | hp
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne3 h.symm⟩
      · rcases hp with rfl
        exact ⟨by exact_mod_cast h2A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha1ne2 h.symm⟩
  -- (4) Equilateral Heron: `4·SA(v₁,v₂,v₃)² = 3t⁴`.  In particular `SA(v₁) ≠ 0`.
  have harea : 4 * signedArea2 v1 v2 v3 ^ 2 = 3 * t ^ 4 := by
    have e12 := dist_sq_coord v1 v2; have e23 := dist_sq_coord v2 v3
    have e31 := dist_sq_coord v3 v1
    rw [show dist v1 v2 = t by rw [dist_comm]; exact hv2v1] at e12
    rw [hv2v3] at e23
    rw [hv3v1] at e31
    simp only [signedArea2]; nlinarith [e12, e23, e31]
  have hv1SAne : signedArea2 v1 v2 v3 ≠ 0 := by
    intro hz; rw [hz] at harea; nlinarith [harea, pow_pos ht 4]
  -- (5) Strict opposite-sign: `a₁`, `v₁` on opposite open sides of line `v₂v₃`.
  -- The product `SA(a₁)·SA(v₁)` is `≤ 0` and nonzero (both factors nonzero).
  have hstrict : signedArea2 a₁ v2 v3 * signedArea2 v1 v2 v3 < 0 :=
    lt_of_le_of_ne hle (mul_ne_zero ha1SAne hv1SAne)
  -- (6) Cross-difference identity: `SA(v₁,v₂,v₃) − SA(a₁,v₂,v₃)` is the 2D
  -- cross product `(v₂−v₃) × (a₁−v₁)`.
  have hcross : signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3 =
      (v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0) := by
    simp only [signedArea2]; ring
  -- (7) 2D Cauchy–Schwarz on the cross product: `(cross)² ≤ t²·r²`.
  have hcs : ((v2 0 - v3 0) * (a₁ 1 - v1 1) - (v2 1 - v3 1) * (a₁ 0 - v1 0)) ^ 2
      ≤ t ^ 2 * r ^ 2 := by
    have e23 := dist_sq_coord v2 v3; have e1a1 := dist_sq_coord v1 a₁
    rw [hv2v3] at e23; rw [hv1a1] at e1a1
    nlinarith [sq_nonneg ((v2 0 - v3 0) * (a₁ 0 - v1 0) +
      (v2 1 - v3 1) * (a₁ 1 - v1 1)), e23, e1a1]
  -- (8) Strict-sign ⟹ `(SA(v₁) − SA(a₁))² > SA(v₁)²` (the `−2ab` cross term is
  -- strictly positive since `SA(a₁)·SA(v₁) < 0` and `SA(a₁)² > 0`).
  have ha1sq : 0 < signedArea2 a₁ v2 v3 ^ 2 := by positivity
  have hgap : signedArea2 v1 v2 v3 ^ 2 <
      (signedArea2 v1 v2 v3 - signedArea2 a₁ v2 v3) ^ 2 := by
    nlinarith [hstrict, ha1sq]
  -- (9) Chain `t²r² ≥ (SA(v₁) − SA(a₁))² > SA(v₁)² = 3t⁴/4` and divide by `t²`.
  rw [hcross] at hgap
  nlinarith [hcs, hgap, harea, ht, sq_nonneg t, mul_pos ht ht]

set_option maxHeartbeats 1600000 in
/-- **Metric pin for the `c ∈ {a₃,b₃}` sub-case (sub-shape A, Piece 4 / "ρ < t/2").**
In the equilateral triangle `v₁v₂v₃` (all sides `t`), the cap-interior witness
`x ∈ I₂` sits on the `v₂`-circle (`dist v₂ x = t`); writing `dist v₁ x = r` and
`dist x v₃ = ρ`, the K4-radius `ρ` is pinned small: `4ρ² < t²` (⇔ `ρ < t/2`).

The argument is purely polynomial — **no `Real.cos`/`Real.sin`/`Real.Angle`**:

* **Constraint (θ-elimination, square-root-free).**  The three difference
  vectors `A := x − v₂`, `B := v₁ − v₂`, `C := v₃ − v₂` all have length `t`, so
  the `3×3` Gram determinant of `{A,B,C}` vanishes *identically* (three plane
  vectors are linearly dependent).  Expanding the Gram entries via the
  polarization identity `⟪P−v₂,Q−v₂⟫ = (|P−v₂|² + |Q−v₂|² − |P−Q|²)/2`
  (`gAA=gBB=gCC=t²`, `gBC=t²/2`, `gAB=t²−r²/2`, `gAC=t²−ρ²/2`) turns
  `det = 0` into `−(t²/4)·[3(t²−r²/2)² + (t²+r²/2−ρ²)² − 3t⁴] = 0`, hence the
  constraint `3(t²−r²/2)² + (t²+r²/2−ρ²)² = 3t⁴` after dividing by `t² > 0`.
  This is the Cartesian shadow of `cos²θ + sin²θ = 1`.
* **Branch selection (which root).**  The orientation hypothesis `horient`
  (`x` on the `v₃`-side of line `v₁v₂`) fixes the sign of the branch quantity
  `t² + r²/2 − ρ²` through the polynomial identity
  `t²·(t²+r²/2−ρ²) = 2·signedArea2(x,v₁,v₂)·signedArea2(v₃,v₁,v₂)`; since the
  RHS is `horient > 0` and `t² > 0`, the branch quantity is positive (this is
  `√3·sinθ = 1 + u/2 − w > 0`, the near branch).
* **Window.**  With `u := r²/t² ∈ (3/4, 1)` (`hrwin` gives `u > 3/4`, `hu_lt`
  gives `u < 1`), the constraint + positive branch force `4w − 1 < 0`
  (`w := ρ²/t²`): squaring the equivalent `4·branch > 3 + 2u` reduces to
  `16u² − 36u + 9 < 0`, whose roots `(9 ± √45)/8 ≈ 0.287, 1.964` bracket the
  window, so the quadratic is negative there.  Hence `w < 1/4`, i.e. `4ρ² < t²`.

The far branch (`horient < 0`, `r² = t²(2+√3)`) is a genuine model with
`4ρ² ≈ 11t² > t²`; `horient` is therefore load-bearing (numerically confirmed:
`horient > 0 ⟺ near branch ⟺ 4ρ² < t²` over the whole window).

Feeds the `c ∈ {a₃,b₃}` sub-case of `layer4_subshapeA_kill`: there `ρ = dist x v₃ =
dist x c`, and `dist v₃ c = t` together with `ρ < t/2` gives
`dist x c ≥ t − ρ > t/2 > ρ`, the contradiction.  Discharged in prose at
`docs/n-lane/97-section3-n-lane-prose.md` §"Sub-shape (A) sieve". -/
private theorem metric_pin_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} {r t ρ : ℝ}
    (ht : 0 < t) (hr : 0 < r)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t)
    (hv2v1 : dist S.triangle.v2 S.triangle.v1 = t)
    (hv3v1 : dist S.triangle.v3 S.triangle.v1 = t)
    (hv2x : dist S.triangle.v2 x = t)
    (hv1x : dist S.triangle.v1 x = r)
    (hxv3 : dist x S.triangle.v3 = ρ)
    (hrwin : 3 * t ^ 2 < 4 * r ^ 2)
    (hu_lt : r ^ 2 < t ^ 2)
    (horient : 0 < signedArea2 x S.triangle.v1 S.triangle.v2 *
                 signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) :
    4 * ρ ^ 2 < t ^ 2 := by
  set v1 := S.triangle.v1 with hv1def
  set v2 := S.triangle.v2 with hv2def
  set v3 := S.triangle.v3 with hv3def
  have ht2 : (0 : ℝ) < t ^ 2 := by positivity
  -- The two `t,r,ρ`-only facts (constraint + branch sign) are proved in a sub-block
  -- that introduces the six difference-coordinate reals (translating `v₂` to the
  -- origin); the final certificate runs in pure `t,r,ρ`.
  have hkey : 3 * (t ^ 2 - r ^ 2 / 2) ^ 2 + (t ^ 2 + r ^ 2 / 2 - ρ ^ 2) ^ 2 = 3 * t ^ 4
      ∧ 0 < t ^ 2 + r ^ 2 / 2 - ρ ^ 2 := by
    obtain ⟨a0, a1, b0, b1, c0, c1, ha0, ha1, hb0, hb1, hc0, hc1⟩ :
        ∃ a0 a1 b0 b1 c0 c1 : ℝ, a0 = x 0 - v2 0 ∧ a1 = x 1 - v2 1 ∧
          b0 = v1 0 - v2 0 ∧ b1 = v1 1 - v2 1 ∧ c0 = v3 0 - v2 0 ∧ c1 = v3 1 - v2 1 :=
      ⟨_, _, _, _, _, _, rfl, rfl, rfl, rfl, rfl, rfl⟩
    -- squared-distance expansions (`dist_sq_coord` + the six distance hypotheses):
    have e_v2v3 := dist_sq_coord v2 v3; rw [hv2v3] at e_v2v3
    have e_v2v1 := dist_sq_coord v2 v1; rw [hv2v1] at e_v2v1
    have e_v3v1 := dist_sq_coord v3 v1; rw [hv3v1] at e_v3v1
    have e_v2x := dist_sq_coord v2 x; rw [hv2x] at e_v2x
    have e_v1x := dist_sq_coord v1 x; rw [hv1x] at e_v1x
    have e_xv3 := dist_sq_coord x v3; rw [hxv3] at e_xv3
    -- Gram entries of `{A,B,C}` over the six reals (diagonal `= t²`, off-diagonal
    -- via polarization):
    have gAA : a0 ^ 2 + a1 ^ 2 = t ^ 2 := by rw [ha0, ha1]; linear_combination -e_v2x
    have gBB : b0 ^ 2 + b1 ^ 2 = t ^ 2 := by rw [hb0, hb1]; linear_combination -e_v2v1
    have gCC : c0 ^ 2 + c1 ^ 2 = t ^ 2 := by rw [hc0, hc1]; linear_combination -e_v2v3
    have gAB : a0 * b0 + a1 * b1 = t ^ 2 - r ^ 2 / 2 := by
      rw [ha0, ha1, hb0, hb1]; linear_combination (-e_v2x) / 2 + (-e_v2v1) / 2 + e_v1x / 2
    have gAC : a0 * c0 + a1 * c1 = t ^ 2 - ρ ^ 2 / 2 := by
      rw [ha0, ha1, hc0, hc1]; linear_combination (-e_v2x) / 2 + (-e_v2v3) / 2 + e_xv3 / 2
    have gBC : b0 * c0 + b1 * c1 = t ^ 2 / 2 := by
      rw [hb0, hb1, hc0, hc1]; linear_combination (-e_v2v1) / 2 + (-e_v2v3) / 2 + e_v3v1 / 2
    -- signed-area → pure-real bridges (translation-invariance of `signedArea2`):
    have hsaX : signedArea2 x v1 v2 = a0 * b1 - a1 * b0 := by
      rw [ha0, ha1, hb0, hb1]; simp only [signedArea2]; ring
    have hsaV : signedArea2 v3 v1 v2 = -b0 * c1 + b1 * c0 := by
      rw [hb0, hb1, hc0, hc1]; simp only [signedArea2]; ring
    rw [hsaX, hsaV] at horient
    -- discard the geometric/coordinate clutter so the algebra runs in pure reals:
    clear ha0 ha1 hb0 hb1 hc0 hc1 e_v2v3 e_v2v1 e_v3v1 e_v2x e_v1x e_xv3
      hsaX hsaV hv2v3 hv2v1 hv3v1 hv2x hv1x hxv3 hr hrwin hu_lt ht
      hv1def hv2def hv3def
    refine ⟨?_, ?_⟩
    · -- CONSTRAINT: `det(Gram) = 0` (ring) with the entries substituted.
      have hgram :
          (a0 ^ 2 + a1 ^ 2)
              * ((b0 ^ 2 + b1 ^ 2) * (c0 ^ 2 + c1 ^ 2)
                  - (b0 * c0 + b1 * c1) * (b0 * c0 + b1 * c1))
            - (a0 * b0 + a1 * b1)
              * ((a0 * b0 + a1 * b1) * (c0 ^ 2 + c1 ^ 2)
                  - (b0 * c0 + b1 * c1) * (a0 * c0 + a1 * c1))
            + (a0 * c0 + a1 * c1)
              * ((a0 * b0 + a1 * b1) * (b0 * c0 + b1 * c1)
                  - (b0 ^ 2 + b1 ^ 2) * (a0 * c0 + a1 * c1)) = 0 := by
        ring
      rw [gAA, gBB, gCC, gAB, gAC, gBC] at hgram
      nlinarith [hgram, ht2]
    · -- BRANCH SIGN: `t²·(t²+r²/2−ρ²) = 2·horient > 0`, so the branch quantity > 0.
      have hbid : t ^ 2 * (t ^ 2 + r ^ 2 / 2 - ρ ^ 2)
          = 2 * ((a0 * b1 - a1 * b0) * (-b0 * c1 + b1 * c0)) := by
        linear_combination
          (2 * a0 * c0 + 2 * a1 * c1 - 2 * b0 * c0 - 2 * b1 * c1 + ρ ^ 2 - t ^ 2) * gAA
            + (-2 * a0 * c0 - 2 * a1 * c1) * gBB
            + (2 * b0 * c0 + 2 * b1 * c1) * gAB
            + (-2 * a0 ^ 2 - 2 * a1 ^ 2) * gAC
            + (2 * a0 ^ 2 + 2 * a1 ^ 2 - r ^ 2) * gBC
      have hpos : 0 < t ^ 2 * (t ^ 2 + r ^ 2 / 2 - ρ ^ 2) := by rw [hbid]; linarith [horient]
      by_contra hc; push_neg at hc
      nlinarith [mul_nonpos_of_nonneg_of_nonpos ht2.le hc, hpos]
  obtain ⟨hcon, hbranch⟩ := hkey
  -- FINAL CERTIFICATE: `4w − 1 < 0` from the constraint + positive branch + window.
  nlinarith [hcon, hbranch, hrwin, hu_lt, ht, ht2, mul_pos ht2 ht2,
    sq_nonneg (t ^ 2 + r ^ 2 / 2 - ρ ^ 2), sq_nonneg (4 * r ^ 2 - 3 * t ^ 2),
    sq_nonneg (t ^ 2 - r ^ 2), mul_pos hbranch hbranch]

set_option maxHeartbeats 1600000 in
/-- **`r² < t²` (the upper-arc window) for the equilateral `I₂` leaf.**
In the equilateral triangle `v₁v₂v₃` (all sides `t`), an `I₂` cap-interior witness
`x` sits on the `v₂`-circle (`dist v₂ x = t`).  Writing `dist v₁ x = r`, the
witness lies strictly inside the radius: `r² < t²`.  Geometrically `x`, `v₁`, `v₃`
all lie on `S(v₂, t)`, and the cap-`C₂` arc condition pins `x` to the *open minor
arc* `v₁v₃`, on which `dist(v₁, ·)² < dist(v₁, v₃)² = t²`.

This is exactly the `u < 1` window input that `metric_pin_v3` needs (`u = r²/t²`);
without it `metric_pin_v3`'s final quadratic `16u² − 36u + 9 < 0` is not pinned to
the negative interval `(0.287, 1.964)`.  It is **not** derivable from `horient`
alone (numerically falsified: the whole `θ ∈ (60°, 180°)` arc has `horient > 0`
yet `r² ≥ t²`), nor from the `(t, r, ρ)` Gram constraint plus the branch sign
(both fail near `x = v₃`); the cross-product **arc sign** is genuinely required.

**Proof (square-root-free, no `Real.cos`/`Real.sin`/`Real.Angle`).**  Translate
`v₂` to the origin; let `A = x − v₂`, `B = v₁ − v₂`, `C = v₃ − v₂`, each of length
`t`, with the polarization Gram entries `gAA = gBB = gCC = t²`, `gBC = t²/2`,
`gAB = t² − r²/2`.  With `ρ := dist x v₃ > 0` (from `x ≠ v₃`) the identity

  `t²·(t² − r²) = −4·(signedArea2 x v₃ v₁ · signedArea2 v₂ v₃ v₁) + t²·ρ²`

holds (a `nlinarith` consequence of the Gram facts).  The arc product is `≤ 0`
(cap-`C₂` membership: `OnArcOpposite v₂ v₃ v₁ x`), so `−4·(arc) ≥ 0`, and `t²·ρ² > 0`
(strict, since `x ≠ v₃`).  Hence `t²·(t² − r²) > 0`, and `t² > 0` gives `r² < t²`.

Feeds the `c = v₁` / Case-B branch of `layer4_subshapeA_kill` as the `hu_lt`
argument to `metric_pin_v3`. -/
private theorem hu_lt_equilateral_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} {r t : ℝ}
    (ht : 0 < t)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t)
    (hv2v1 : dist S.triangle.v2 S.triangle.v1 = t)
    (hv3v1 : dist S.triangle.v3 S.triangle.v1 = t)
    (hv2x : dist S.triangle.v2 x = t)
    (hv1x : dist S.triangle.v1 x = r)
    (hx_ne_v3 : x ≠ S.triangle.v3)
    -- Cap-`C₂` arc condition (`x ∈ I₂`): `x` on the closed arc opposite `v₂`
    -- across chord `v₃v₁` (`OnArcOpposite v₂ v₃ v₁ x`).
    (harc : signedArea2 x S.triangle.v3 S.triangle.v1 *
            signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0) :
    r ^ 2 < t ^ 2 := by
  set v1 := S.triangle.v1 with hv1def
  set v2 := S.triangle.v2 with hv2def
  set v3 := S.triangle.v3 with hv3def
  have ht2 : (0 : ℝ) < t ^ 2 := by positivity
  set rho : ℝ := dist x v3 with hrhodef
  have hrho2pos : 0 < rho ^ 2 := by
    have : 0 < rho := by rw [hrhodef]; exact dist_pos.mpr hx_ne_v3
    positivity
  -- Translate `v₂` to the origin; introduce the six difference coordinates.
  obtain ⟨a0, a1, b0, b1, c0, c1, ha0, ha1, hb0, hb1, hc0, hc1⟩ :
      ∃ a0 a1 b0 b1 c0 c1 : ℝ, a0 = x 0 - v2 0 ∧ a1 = x 1 - v2 1 ∧
        b0 = v1 0 - v2 0 ∧ b1 = v1 1 - v2 1 ∧ c0 = v3 0 - v2 0 ∧ c1 = v3 1 - v2 1 :=
    ⟨_, _, _, _, _, _, rfl, rfl, rfl, rfl, rfl, rfl⟩
  -- Squared-distance expansions (`dist_sq_coord` + the equidistance hypotheses).
  have e_v2v3 := dist_sq_coord v2 v3; rw [hv2v3] at e_v2v3
  have e_v2v1 := dist_sq_coord v2 v1; rw [hv2v1] at e_v2v1
  have e_v3v1 := dist_sq_coord v3 v1; rw [hv3v1] at e_v3v1
  have e_v2x := dist_sq_coord v2 x; rw [hv2x] at e_v2x
  have e_v1x := dist_sq_coord v1 x; rw [hv1x] at e_v1x
  have e_xv3 := dist_sq_coord x v3
  -- Gram entries of `{A,B,C}` (diagonal `= t²`, off-diagonal via polarization).
  have gAA : a0 ^ 2 + a1 ^ 2 = t ^ 2 := by rw [ha0, ha1]; linear_combination -e_v2x
  have gBB : b0 ^ 2 + b1 ^ 2 = t ^ 2 := by rw [hb0, hb1]; linear_combination -e_v2v1
  have gCC : c0 ^ 2 + c1 ^ 2 = t ^ 2 := by rw [hc0, hc1]; linear_combination -e_v2v3
  have gAB : a0 * b0 + a1 * b1 = t ^ 2 - r ^ 2 / 2 := by
    rw [ha0, ha1, hb0, hb1]; linear_combination (-e_v2x) / 2 + (-e_v2v1) / 2 + e_v1x / 2
  have gBC : b0 * c0 + b1 * c1 = t ^ 2 / 2 := by
    rw [hb0, hb1, hc0, hc1]; linear_combination (-e_v2v1) / 2 + (-e_v2v3) / 2 + e_v3v1 / 2
  -- `ρ² = |A − C|²` in the six coordinates.
  have hrho2c : rho ^ 2 = (a0 - c0) ^ 2 + (a1 - c1) ^ 2 := by
    rw [hrhodef, e_xv3, ha0, ha1, hc0, hc1]; ring
  -- Signed-area → pure-real bridges (translation-invariance of `signedArea2`).
  have hsaX : signedArea2 x v3 v1 = (c0 - a0) * (b1 - a1) - (b0 - a0) * (c1 - a1) := by
    rw [ha0, ha1, hb0, hb1, hc0, hc1]; simp only [signedArea2]; ring
  have hsaV : signedArea2 v2 v3 v1 = c0 * b1 - b0 * c1 := by
    rw [hb0, hb1, hc0, hc1]; simp only [signedArea2]; try ring
  rw [hsaX, hsaV] at harc
  -- Discard the geometric/coordinate clutter so the algebra runs in pure reals
  -- (mirrors `metric_pin_v3`; avoids `whnf` blow-up through the `set` lets).
  clear ha0 ha1 hb0 hb1 hc0 hc1 e_v2v3 e_v2v1 e_v3v1 e_v2x e_v1x e_xv3
    hsaX hsaV hv1def hv2def hv3def hrhodef hv2v3 hv2v1 hv3v1 hv2x hv1x hx_ne_v3
  -- KEY IDENTITY: `t²·(t² − r²) = −4·(arc) + t²·ρ²` (exact `linear_combination`
  -- of the five Gram facts; coefficients found by polynomial division).
  have hid : t ^ 2 * (t ^ 2 - r ^ 2)
      = -4 * (((c0 - a0) * (b1 - a1) - (b0 - a0) * (c1 - a1)) * (c0 * b1 - b0 * c1))
        + t ^ 2 * rho ^ 2 := by
    rw [hrho2c]
    linear_combination (-t ^ 2) * gAA
      + (-4 * a0 * c0 - 4 * a1 * c1 + 4 * c0 ^ 2 + 4 * c1 ^ 2) * gBB
      + (-4 * a0 * b0 - 4 * a1 * b1 + 3 * t ^ 2) * gCC
      + (4 * a0 * b0 + 4 * a0 * c0 + 4 * a1 * b1 + 4 * a1 * c1
          - 4 * b0 * c0 - 4 * b1 * c1 - 2 * t ^ 2) * gBC
      + (-2 * t ^ 2) * gAB
  -- `t²·(t² − r²) = (≥0) + (>0) > 0`, and `t² > 0`, so `r² < t²`.
  nlinarith [hid, harc, hrho2pos, ht2]

-- The direct |K| ≤ 3 budget (z* derivation + two-circle sieves + the cover + the
-- v₃∈K case split feeding `metric_pin_v3`) is substantial elaboration, mirroring
-- `layer4_subshapeB_kill` (also 4000000).
set_option maxHeartbeats 4000000 in
/-- **Layer-4 `|K| ≤ 3` budget, sub-shape (A) [equilateral leaf].**
With `|v₂v₁| = |v₂v₃| = |v₃v₁| = t` (equilateral, `α = 60°`) and the Form-`a`
witnesses `x ∈ I₂`, `y ∈ I₃` at radius `r` from `v₁` (`x` at radius `t` from
`v₂`), applying `S.hK4` at `x` yields `K = wc_x(ρ)` with `|K| ≥ 4` and `x ∉ K`.
We contradict this by a direct cardinality budget showing `|K| ≤ 3`.

**Why not the sub-shape (B) route.**  The "force `v₁,v₃ ∈ K`" budget used in
`layer4_subshapeB_kill` is INVALID here: in the equilateral case `dist v₃ v₁ = t`
(`hv3v1`), so `v₁ ∈ S(v₃,t)` joins the A1 sieve group `{v₁,v₂,a₃,b₃}` and is no
longer a free slot.  Forcing `v₁,v₃ ∈ K` (the deleted route) is in fact JOINTLY
contradictory with the proven `equilateral_rWindow`, so it is unprovable.

**The budget.**  The nine points of `A` are `{v₁,v₂,v₃} ∪ {a₁,b₁} ∪ {x,z*} ∪
{a₃,b₃}` (`z*` = the other `I₂` point, derived internally from `Z.hI2`).  Since
`x ∉ K`, the candidates are the eight points minus `x`.  Two same-side sieves
(`sieve_at_most_one_on_xcircle`) cap two circle-groups, and the cover
`A ∖ {v₃,z*,x} ⊆ P1 ∪ P2` ties them to `K`:
* `P1 = {v₁,v₂,a₃,b₃} ⊆ S(v₃,t)` (same `v₃–x` chord side): `|K ∩ P1| ≤ 1`.
    The `v₁` certificate is `v1_same_side_of_v3x_chord`; `a₃,b₃` use
    `c3_same_side_of_v3x_chord`; `v₂` is the self-cert `(signedArea2 v₂ v₃ x)² > 0`.
* `P2 = {a₁,b₁} ⊆ S(v₁,r)` (same `v₁–x` chord side, `c1_same_side_of_v1x_chord`):
    `|K ∩ P2| ≤ 1`.
Hence `|K ∖ {v₃,z*}| ≤ |K∩P1| + |K∩P2| ≤ 2`.  A plain `|K∩{v₃,z*}| ≤ 2` only
gives `|K| ≤ 4`, so we split on `v₃ ∈ K`:
* **Case `v₃ ∉ K`**: `|K∩{v₃,z*}| ≤ |{z*}| = 1`, so `|K| ≤ 2 + 1 = 3`.
* **Case `v₃ ∈ K`** (`dist x v₃ = ρ`): `metric_pin_v3` (fed the proven r-window
    `equilateral_rWindow` and the upper-arc window `hu_lt_equilateral_I2 : r² < t²`)
    gives `4ρ² < t²`, i.e. `ρ < t/2`.  Then every `P1` point is at distance
    `≥ dist v₃ p − dist v₃ x = t − ρ > t/2 > ρ` from `x` (triangle inequality),
    so `K ∩ P1 = ∅`, `|K ∖ {v₃,z*}| ≤ 1`, and `|K| ≤ 1 + 2 = 3`.
Both `|K| ≤ 3` contradict `|K| ≥ 4`.

`horient` (x on the same open side of chord `v₁v₂` as `v₃`, supplied by
`c2_vertex_same_open_side_as_v3 hxI2`) is the load-bearing branch selector for
`metric_pin_v3`; the far branch (`r² = t²(2+√3)`, `horient < 0`) is a genuine
model with `4ρ² > t²` and no contradiction.

Discharged in prose: `docs/n-lane/97-section3-n-lane-prose.md` §"Sub-shape (A) sieve"
(lines 1902–1926). -/
private theorem layer4_subshapeA_kill
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {x y a₁ b₁ a₃ b₃ : ℝ²} {r t : ℝ}
    (hr : 0 < r) (ht : 0 < t)
    (hxI2 : x ∈ S.I2) (hyI3 : y ∈ S.I3) (ha3I3 : a₃ ∈ S.I3) (hb3I3 : b₃ ∈ S.I3)
    (hI1eq : S.I1 = ({a₁, b₁} : Finset ℝ²)) (hI3eq : S.I3 = ({a₃, b₃} : Finset ℝ²))
    (hxA : x ∈ A)
    (ha1I1 : a₁ ∈ S.I1) (hv1a1 : dist S.triangle.v1 a₁ = r)
    (hb1I1 : b₁ ∈ S.I1) (hv1b1 : dist S.triangle.v1 b₁ = r)
    (hv1x : dist S.triangle.v1 x = r) (hv1y : dist S.triangle.v1 y = r)
    (hv2x : dist S.triangle.v2 x = t) (hv3y : dist S.triangle.v3 y = t)
    (hv3a3 : dist S.triangle.v3 a₃ = t) (hv3b3 : dist S.triangle.v3 b₃ = t)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = t)
    (hv2v1 : dist S.triangle.v2 S.triangle.v1 = t)
    (hv3v1 : dist S.triangle.v3 S.triangle.v1 = t)
    -- Orientation: x lies on the same open side of chord v₁v₂ as v₃.
    -- Supplied by `c2_vertex_same_open_side_as_v3 hxI2` in the caller.
    -- This selects the near perp-bisector branch (r² = t²(2−√3)) and is
    -- mandatory for the clash algebra — the far branch (r² = t²(2+√3)) is a
    -- genuine model where no contradiction exists.
    (horient : 0 < signedArea2 x S.triangle.v1 S.triangle.v2 *
                 signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) :
    False := by
  classical
  -- LAYER 4 setup: apply `PerVertexK4` at the interior witness `x ∈ I₂ ⊆ A`,
  -- obtaining the `x`-witness radius `ρ > 0` with `wc_x(ρ) = K`, card ≥ 4.
  obtain ⟨ρ, hρpos, hKcard⟩ := S.hK4 x hxA
  set K : Finset ℝ² := A.filter (fun q => dist x q = ρ) with hKdef
  have hKcard' : 4 ≤ K.card := hKcard
  -- ───────────────────────────────────────────────────────────────────────────
  -- DIRECT |K| ≤ 3 BUDGET (the correct sub-shape-A argument).
  --
  -- The "force v₁,v₃ ∈ K" route used for sub-shape (B) is INVALID here: in the
  -- equilateral case `dist v₃ v₁ = t` (`hv3v1`), so `v₁ ∈ S(v₃,t)` joins the A1
  -- group and is no longer a free budget slot.  Instead we cap `|K|` directly.
  --
  -- The nine points of `A` are `{v₁,v₂,v₃} ∪ I₁{a₁,b₁} ∪ I₂{x,z*} ∪ I₃{a₃,b₃}`,
  -- where `z*` is the OTHER `I₂` point.  Since `x ∉ K` (`dist x x = 0 ≠ ρ`), the
  -- candidates for `K` are the eight points `{v₁,v₂,v₃,a₁,b₁,z*,a₃,b₃}`.  We
  -- sieve two circle-groups and split off the leftover doubleton `{v₃, z*}`:
  --   • P1 = {v₁,v₂,a₃,b₃} ⊆ S(v₃,t):  `|K ∩ P1| ≤ 1`  (same `v₃–x` chord side).
  --   • P2 = {a₁,b₁}       ⊆ S(v₁,r):  `|K ∩ P2| ≤ 1`  (same `v₁–x` chord side).
  --   • Leftover T = {v₃, z*}.
  -- The cover `A ∖ {v₃,z*,x} ⊆ P1 ∪ P2` gives `|K ∖ T| ≤ |K∩P1| + |K∩P2| ≤ 2`,
  -- so `|K| = |K∖T| + |K∩T| ≤ 2 + |K∩T|`.  A plain `|K∩T| ≤ |T| = 2` only yields
  -- `|K| ≤ 4` (consistent with `|K| ≥ 4`) — hence the case split on `v₃ ∈ K`:
  --   • Case A (`v₃ ∉ K`): `|K∩T| ≤ |{z*}| = 1`, so `|K| ≤ 2 + 1 = 3 < 4`.
  --   • Case B (`v₃ ∈ K`): `dist x v₃ = ρ`, and `metric_pin_v3` gives `4ρ² < t²`
  --       (`ρ < t/2`), which excludes EVERY `P1` point from `K` by distance
  --       (`dist x p ≥ t − ρ > t/2 > ρ`), so `|K∩P1| = 0` and `|K∖T| ≤ 1`, giving
  --       `|K| ≤ 1 + |K∩T| ≤ 1 + 2 = 3 < 4`.
  -- Both contradict `|K| ≥ 4`.  The two inputs of the old route
  -- (`hv1K`, `hv3K` forcing `v₁,v₃ ∈ K`) were JOINTLY contradictory with the
  -- proven `equilateral_rWindow`; this direct budget needs neither.
  set v1 := S.triangle.v1 with hv1def
  set v2 := S.triangle.v2 with hv2def
  set v3 := S.triangle.v3 with hv3def
  -- `z*` := the OTHER `I₂` point (from `ZeroDefectCapLayout`: `I₂ = {a2, b2}`).
  have hxI2' : x ∈ ({Z.a2, Z.b2} : Finset ℝ²) := by rw [← Z.hI2]; exact hxI2
  have ha2b2 : Z.a2 ≠ Z.b2 := by
    have h2 : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by rw [← Z.hI2]; exact S.I2_card_eq_two
    by_contra h; rw [h] at h2; simp at h2
  obtain ⟨zstar, hzI2, hxz⟩ :
      ∃ zstar, zstar ∈ S.I2 ∧ x ≠ zstar := by
    rcases Finset.mem_insert.mp hxI2' with hxa2 | hxb2
    · exact ⟨Z.b2, by rw [Z.hI2]; simp, by rw [hxa2]; exact ha2b2⟩
    · have hxb2' : x = Z.b2 := by simpa using hxb2
      exact ⟨Z.a2, by rw [Z.hI2]; simp, by rw [hxb2']; exact (Ne.symm ha2b2)⟩
  -- `v₂v₃x` non-degeneracy: `signedArea2 v₂ v₃ x ≠ 0` (from `v1_same_side`).
  have hL1 : 0 < signedArea2 v1 v3 x * signedArea2 v2 v3 x :=
    v1_same_side_of_v3x_chord S hxI2
  have hSAv2ne : signedArea2 v2 v3 x ≠ 0 := by
    intro h; rw [h, mul_zero] at hL1; exact (lt_irrefl 0) hL1
  -- A1 same-side certs for `a₃, b₃` (cap-`I₃`, chord `v₃–x`).
  have hcertA3 : 0 < signedArea2 a₃ v3 x * signedArea2 v2 v3 x :=
    c3_same_side_of_v3x_chord S ha3I3 hxI2 hv2v3 hv2x ht
  have hcertB3 : 0 < signedArea2 b₃ v3 x * signedArea2 v2 v3 x :=
    c3_same_side_of_v3x_chord S hb3I3 hxI2 hv2v3 hv2x ht
  -- A2 same-side certs for `a₁, b₁` (cap-`I₁`, chord `v₁–x`).
  have hcertA1 : 0 < signedArea2 a₁ v1 x * signedArea2 v3 v1 x :=
    c1_same_side_of_v1x_chord S ha1I1 hxI2
  have hcertB1 : 0 < signedArea2 b₁ v1 x * signedArea2 v3 v1 x :=
    c1_same_side_of_v1x_chord S hb1I1 hxI2
  -- `x ∉ K` (`dist x x = 0 ≠ ρ`).
  have hxnotK : x ∉ K := by
    rw [hKdef, Finset.mem_filter]; rintro ⟨-, hd⟩
    rw [dist_self] at hd; exact (ne_of_lt hρpos) hd
  -- The two sieve groups and the leftover doubleton.
  set P1 : Finset ℝ² := {v1, v2, a₃, b₃} with hP1def
  set P2 : Finset ℝ² := {a₁, b₁} with hP2def
  set T : Finset ℝ² := {v3, zstar} with hTdef
  -- A1 sieve: `|K ∩ P1| ≤ 1` (all of `P1 ⊆ S(v₃,t)`, same `v₃–x` chord side).
  have hsieveP1 : (P1.filter (fun p => dist p x = ρ)).card ≤ 1 := by
    apply sieve_at_most_one_on_xcircle (c := v3) (τ := t)
      (σ := signedArea2 v2 v3 x)
    · intro p hp
      rw [hP1def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl|rfl|rfl
      · rw [dist_comm]; exact hv3v1
      · exact hv2v3
      · rw [dist_comm]; exact hv3a3
      · rw [dist_comm]; exact hv3b3
    · intro p hp
      rw [hP1def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl|rfl|rfl
      · exact hL1
      · exact mul_self_pos.mpr hSAv2ne
      · exact hcertA3
      · exact hcertB3
  -- A2 sieve: `|K ∩ P2| ≤ 1` (all of `P2 ⊆ S(v₁,r)`, same `v₁–x` chord side).
  have hsieveP2 : (P2.filter (fun p => dist p x = ρ)).card ≤ 1 := by
    apply sieve_at_most_one_on_xcircle (c := v1) (τ := r)
      (σ := signedArea2 v3 v1 x)
    · intro p hp
      rw [hP2def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl
      · rw [dist_comm]; exact hv1a1
      · rw [dist_comm]; exact hv1b1
    · intro p hp
      rw [hP2def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl|rfl
      · exact hcertA1
      · exact hcertB1
  -- Convert the `filter`-on-`P` bounds to `K ∩ P` bounds (`dist_comm`).
  have hKP1 : (K ∩ P1).card ≤ 1 := by
    refine le_trans (Finset.card_le_card ?_) hsieveP1
    intro q hq; rcases Finset.mem_inter.mp hq with ⟨hqK, hqP1⟩
    rw [Finset.mem_filter]; refine ⟨hqP1, ?_⟩
    have hd : dist x q = ρ := by rw [hKdef, Finset.mem_filter] at hqK; exact hqK.2
    rw [dist_comm]; exact hd
  have hKP2 : (K ∩ P2).card ≤ 1 := by
    refine le_trans (Finset.card_le_card ?_) hsieveP2
    intro q hq; rcases Finset.mem_inter.mp hq with ⟨hqK, hqP2⟩
    rw [Finset.mem_filter]; refine ⟨hqP2, ?_⟩
    have hd : dist x q = ρ := by rw [hKdef, Finset.mem_filter] at hqK; exact hqK.2
    rw [dist_comm]; exact hd
  -- `A` is covered by the three Moser vertices plus the three cap interiors.
  have hAcover : A ⊆ ({v1, v2, v3} : Finset ℝ²) ∪ S.I1 ∪ S.I2 ∪ S.I3 := by
    intro p hpA
    by_cases hpv1 : p = v1
    · subst hpv1; simp
    by_cases hpv2 : p = v2
    · subst hpv2; simp
    by_cases hpv3 : p = v3
    · subst hpv3; simp
    have hnm : p ∉ S.triangle.verts := by
      simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
      push_neg; exact ⟨hpv1, hpv2, hpv3⟩
    have hone := S.CP.nonmoser_in_one p hpA hnm
    by_cases hC1 : p ∈ S.CP.C1
    · have hpI1 : p ∈ S.I1 := by
        rw [show S.I1 = (S.CP.C1.erase v2).erase v3 from rfl]
        rw [Finset.mem_erase, Finset.mem_erase]; exact ⟨hpv3, hpv2, hC1⟩
      simp [hpI1]
    by_cases hC2 : p ∈ S.CP.C2
    · have hpI2 : p ∈ S.I2 := by
        rw [show S.I2 = (S.CP.C2.erase v3).erase v1 from rfl]
        rw [Finset.mem_erase, Finset.mem_erase]; exact ⟨hpv1, hpv3, hC2⟩
      simp [hpI2]
    by_cases hC3 : p ∈ S.CP.C3
    · have hpI3 : p ∈ S.I3 := by
        rw [show S.I3 = (S.CP.C3.erase v1).erase v2 from rfl]
        rw [Finset.mem_erase, Finset.mem_erase]; exact ⟨hpv2, hpv1, hC3⟩
      simp [hpI3]
    · exfalso; simp only [hC1, hC2, hC3, if_false] at hone; simp at hone
  -- The two `I₂` points are exactly `{x, z*}`.
  have hI2eq : S.I2 = ({x, zstar} : Finset ℝ²) := by
    have hcard : S.I2.card = 2 := S.I2_card_eq_two
    have hsub : ({x, zstar} : Finset ℝ²) ⊆ S.I2 := by
      intro p hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl | rfl <;> assumption
    have hcard2 : ({x, zstar} : Finset ℝ²).card = 2 := by
      rw [Finset.card_insert_of_notMem (by simp [hxz]), Finset.card_singleton]
    exact (Finset.eq_of_subset_of_card_le hsub (by rw [hcard, hcard2])).symm
  -- Cover: every `q ∈ A` off `{v₃, z*, x}` lands in `P1 ∪ P2`.
  have hcover : ∀ q ∈ A, q ≠ v3 → q ≠ zstar → q ≠ x → q ∈ P1 ∨ q ∈ P2 := by
    intro q hqA hqv3 hqz hqx
    have hq9 := hAcover hqA
    rcases Finset.mem_union.mp hq9 with hq789 | hI3mem
    · rcases Finset.mem_union.mp hq789 with hq456 | hI2mem
      · rcases Finset.mem_union.mp hq456 with hverts | hI1mem
        · -- `q ∈ {v₁,v₂,v₃}`: `v₃` excluded, so `q ∈ {v₁,v₂} ⊆ P1`.
          simp only [Finset.mem_insert, Finset.mem_singleton] at hverts
          rcases hverts with hqv1 | hqv2 | hqv3'
          · exact Or.inl (by rw [hP1def]; simp [hqv1])
          · exact Or.inl (by rw [hP1def]; simp [hqv2])
          · exact absurd hqv3' hqv3
        · -- `q ∈ I₁`; `set P2` folded `hI1eq` to `S.I1 = P2`, so rewrite directly.
          right; exact hI1eq ▸ hI1mem
      · -- `q ∈ I₂ = {x, z*}`: `x` and `z*` both excluded — impossible.
        rw [hI2eq] at hI2mem
        simp only [Finset.mem_insert, Finset.mem_singleton] at hI2mem
        rcases hI2mem with hxc | hzc
        · exact absurd hxc hqx
        · exact absurd hzc hqz
    · -- `q ∈ I₃ = {a₃,b₃} ⊆ P1`.
      left; rw [hP1def]; rw [hI3eq] at hI3mem
      simp only [Finset.mem_insert, Finset.mem_singleton] at hI3mem ⊢
      tauto
  -- `K ∖ T ⊆ (K ∩ P1) ∪ (K ∩ P2)`, hence `|K ∖ T| ≤ |K∩P1| + |K∩P2|`.
  have hKsub : K ⊆ A := by rw [hKdef]; exact Finset.filter_subset _ _
  have hsubT : K \ T ⊆ (K ∩ P1) ∪ (K ∩ P2) := by
    intro q hq; rcases Finset.mem_sdiff.mp hq with ⟨hqK, hqT⟩
    have hqA : q ∈ A := hKsub hqK
    have hqv3 : q ≠ v3 := by intro h; exact hqT (by rw [hTdef, h]; simp)
    have hqz : q ≠ zstar := by intro h; exact hqT (by rw [hTdef, h]; simp)
    have hqx : q ≠ x := by intro h; exact hxnotK (h ▸ hqK)
    rcases hcover q hqA hqv3 hqz hqx with h | h
    · exact Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨hqK, h⟩)
    · exact Finset.mem_union_right _ (Finset.mem_inter.mpr ⟨hqK, h⟩)
  have hsplit : (K \ T).card + (K ∩ T).card = K.card :=
    Finset.card_sdiff_add_card_inter K T
  -- THE CASE SPLIT on `v₃ ∈ K`, both branches giving `|K| ≤ 3`.
  by_cases hv3K : v3 ∈ K
  · -- Case B: `dist x v₃ = ρ`; `metric_pin_v3` gives `4ρ² < t²`, excluding `P1`.
    have hxv3 : dist x v3 = ρ := by
      rw [hKdef, Finset.mem_filter] at hv3K; exact hv3K.2
    -- `r² < t²` (the `u < 1` window) from the equilateral `I₂` arc.
    have hx_ne_v3 : x ≠ v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1
    have harc_le : signedArea2 x v3 v1 * signedArea2 v2 v3 v1 ≤ 0 := by
      have haC2 : x ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
      exact ((S.CP.arc_membership x hxA).2.1).mp haC2
    have hu_lt : r ^ 2 < t ^ 2 :=
      hu_lt_equilateral_I2 S ht hv2v3 hv2v1 hv3v1 hv2x hv1x hx_ne_v3 harc_le
    -- The proven r-window `3t² < 4r²` (cap-`C₁` interior `a₁`).
    have hrwin : 3 * t ^ 2 < 4 * r ^ 2 :=
      S.equilateral_rWindow ht ha1I1 hv1a1 hv2v3 hv2v1 hv3v1
    -- Metric pin: `4ρ² < t²` (`ρ < t/2`).
    have hpin : 4 * ρ ^ 2 < t ^ 2 :=
      metric_pin_v3 S ht hr hv2v3 hv2v1 hv3v1 hv2x hv1x hxv3 hrwin hu_lt horient
    -- `ρ ≥ 0` and `t > 2ρ` (from `4ρ² < t²`).
    have hρnn : 0 ≤ ρ := le_of_lt hρpos
    have ht2ρ : 2 * ρ < t := by nlinarith [hpin, hρnn, ht, sq_nonneg (t - 2 * ρ)]
    -- Every `P1` point is at distance `≥ t − ρ > ρ` from `x`, so `P1 ∩ K = ∅`.
    have hP1notK : ∀ p ∈ P1, p ∉ K := by
      intro p hp hpK
      have hpdist : dist x p = ρ := by
        rw [hKdef, Finset.mem_filter] at hpK; exact hpK.2
      -- `dist v₃ p = t` for every `p ∈ P1`.
      have hv3p : dist v3 p = t := by
        rw [hP1def] at hp; simp only [Finset.mem_insert, Finset.mem_singleton] at hp
        rcases hp with rfl|rfl|rfl|rfl
        · exact hv3v1
        · rw [dist_comm]; exact hv2v3
        · exact hv3a3
        · exact hv3b3
      -- triangle inequality: `t = dist v₃ p ≤ dist v₃ x + dist x p = ρ + ρ`.
      have htri : dist v3 p ≤ dist v3 x + dist x p := dist_triangle v3 x p
      rw [hv3p, dist_comm v3 x, hxv3, hpdist] at htri
      -- `t ≤ 2ρ` contradicts `2ρ < t`.
      linarith [ht2ρ]
    -- Hence `K ∩ P1 = ∅`, so `|K ∖ T| ≤ |K∩P2| ≤ 1`.
    have hKP1zero : (K ∩ P1).card = 0 := by
      rw [Finset.card_eq_zero, Finset.eq_empty_iff_forall_notMem]
      intro q hq; rcases Finset.mem_inter.mp hq with ⟨hqK, hqP1⟩
      exact hP1notK q hqP1 hqK
    have hKsdiff : (K \ T).card ≤ 1 := by
      calc (K \ T).card ≤ ((K ∩ P1) ∪ (K ∩ P2)).card := Finset.card_le_card hsubT
        _ ≤ (K ∩ P1).card + (K ∩ P2).card := Finset.card_union_le _ _
        _ ≤ 1 := by omega
    -- `|K∩T| ≤ |T| = 2`, and `|K| ≤ 1 + 2 = 3 < 4`.
    have hTcard : T.card ≤ 2 := by
      rw [hTdef]; exact le_trans (Finset.card_insert_le _ _) (by simp)
    have hKTle : (K ∩ T).card ≤ 2 :=
      le_trans (Finset.card_le_card Finset.inter_subset_right) hTcard
    omega
  · -- Case A: `v₃ ∉ K`, so `K ∩ T ⊆ {z*}` and `|K∩T| ≤ 1`; `|K| ≤ 2 + 1 = 3 < 4`.
    have hKsdiff : (K \ T).card ≤ 2 := by
      calc (K \ T).card ≤ ((K ∩ P1) ∪ (K ∩ P2)).card := Finset.card_le_card hsubT
        _ ≤ (K ∩ P1).card + (K ∩ P2).card := Finset.card_union_le _ _
        _ ≤ 2 := by omega
    -- `K ∩ T ⊆ {z*}` (since `v₃ ∉ K`), so `|K∩T| ≤ 1`.
    have hKTsub : K ∩ T ⊆ ({zstar} : Finset ℝ²) := by
      intro q hq; rcases Finset.mem_inter.mp hq with ⟨hqK, hqT⟩
      rw [hTdef] at hqT; simp only [Finset.mem_insert, Finset.mem_singleton] at hqT
      rcases hqT with hqv3 | hqz
      · exact absurd (hqv3 ▸ hqK) hv3K
      · simp [hqz]
    have hKTle : (K ∩ T).card ≤ 1 :=
      le_trans (Finset.card_le_card hKTsub) (by simp)
    omega

/-- The endpoint-endpoint leaf of the `v₁` Form-`a` exclusion: if `Form a`
holds at `v₁` (radius `r`) and the forced `v₂` selector class at radius `s`
meets `C₁` in `{v₃}` and meets `C₃` in `{v₁}`, then `False`. -/
theorem formA_v1_endpointPair_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hA : S.IsFormA_v1 r)
    (hT2card : (S.witnessClassAt_v2 s).card = 4)
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s)
    (hpv3 : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
    (hqv1 : S.witnessClassAt_v2 s ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)) :
    False := by
  classical
  -- `v₃ ∈ wc_v2 s`, so `dist v2 v3 = s`.
  have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hpv3] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hv1T2 : S.triangle.v1 ∈ S.witnessClassAt_v2 s := by
    have hmem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hqv1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hv2v3 : dist S.triangle.v2 S.triangle.v3 = s := (Finset.mem_filter.mp hv3T2).2
  have hv2v1 : dist S.triangle.v2 S.triangle.v1 = s := (Finset.mem_filter.mp hv1T2).2
  have hs_pos : 0 < s := by
    rw [← hv2v3]; exact dist_pos.mpr S.triangle.v23_ne
  -- Form `a` at `v₁`: interior witnesses `x ∈ I₂`, `y ∈ I₃` both on the
  -- `v₁`-circle of radius `r`.
  obtain ⟨x, y, hxI2, hyI3, hxeq, hyeq⟩ := hA
  have hxT1 : x ∈ S.witnessClassAt_v1 r := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT1 : y ∈ S.witnessClassAt_v1 r := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hv1x : dist S.triangle.v1 x = r := (Finset.mem_filter.mp hxT1).2
  have hv1y : dist S.triangle.v1 y = r := (Finset.mem_filter.mp hyT1).2
  have hxA : x ∈ A :=
    S.CP.C2_subset (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hxT2 : x ∈ S.witnessClassAt_v2 s := hI2sub hxI2
  have hv2x : dist S.triangle.v2 x = s := (Finset.mem_filter.mp hxT2).2
  have hcore1 := S.coreSelector_v1 hr hcard
  rcases hcore1 with ⟨-, hI1sub1, -, -⟩
  -- LAYER 1: the forced `v₃` selector shape.
  rcases S.selectorShape_v3 Z with ⟨t, ht, hshape3⟩
  simp only [] at hshape3
  obtain ⟨hTcard3, hI3sub3, p3, q3, hp3named, hq3named, hp3C1, hq3C2⟩ := hshape3
  -- The two `I₃` points sit on the `v₃`-circle of radius `t`.
  have ha3I3 : Z.a3 ∈ S.I3 := by rw [Z.hI3]; simp
  have hb3I3 : Z.b3 ∈ S.I3 := by rw [Z.hI3]; simp
  have hp3T3 : p3 ∈ S.witnessClassAt_v3 t := by
    have hmem : p3 ∈ ({p3} : Finset ℝ²) := by simp
    rw [← hp3C1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq3T3 : q3 ∈ S.witnessClassAt_v3 t := by
    have hmem : q3 ∈ ({q3} : Finset ℝ²) := by simp
    rw [← hq3C2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hv3p3 : dist S.triangle.v3 p3 = t := (Finset.mem_filter.mp hp3T3).2
  have hv3q3 : dist S.triangle.v3 q3 = t := (Finset.mem_filter.mp hq3T3).2
  have hp3_not_I1 :
      ¬ p3 ∈ S.I1 := by
    intro hp3I1
    have hp3T1 : p3 ∈ S.witnessClassAt_v1 r := hI1sub1 hp3I1
    have hyT3 : y ∈ S.witnessClassAt_v3 t := hI3sub3 hyI3
    have hv1p3 : dist S.triangle.v1 p3 = r := (Finset.mem_filter.mp hp3T1).2
    have hv3y : dist S.triangle.v3 y = t := (Finset.mem_filter.mp hyT3).2
    have hp3C1 : p3 ∈ S.CP.C1 :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hp3I1).2).2
    have hyC3 : y ∈ S.CP.C3 :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hyI3).2).2
    have hy_not_C1 : y ∉ S.CP.C1 := by
      intro hyC1
      have hyA : y ∈ A := S.CP.C3_subset hyC3
      have hy_ne_v2 : y ≠ S.triangle.v2 := (Finset.mem_erase.mp hyI3).1
      have hy_ne_v1 : y ≠ S.triangle.v1 :=
        (Finset.mem_erase.mp (Finset.mem_erase.mp hyI3).2).1
      have hy_ne_v3 : y ≠ S.triangle.v3 := by
        intro h
        exact S.CP.v3_notin_C3 (by simpa [h] using hyC3)
      have hynonmoser : y ∉ S.triangle.verts := by
        simp [Problem97.MoserTriangle.verts, hy_ne_v1, hy_ne_v2, hy_ne_v3]
      have hone := S.CP.nonmoser_in_one y hyA hynonmoser
      by_cases hyC2 : y ∈ S.CP.C2
      · have : (3 : ℕ) = 1 := by
          simpa [hyC1, hyC2, hyC3] using hone
        omega
      · have : (2 : ℕ) = 1 := by
          simpa [hyC1, hyC2, hyC3] using hone
        omega
    have hyp3 : y ≠ p3 := by
      intro h
      exact hy_not_C1 (by simpa [h] using hp3C1)
    have hmid :
        signedArea2 (midpoint ℝ y p3) S.triangle.v1 S.triangle.v3 = 0 :=
      twoCircle_midpoint_collinear
        (by simpa [dist_comm] using hv1p3)
        (by simpa [dist_comm] using hv1y)
        (by simpa [dist_comm] using hv3p3)
        (by simpa [dist_comm] using hv3y)
        hyp3.symm
    have hreflect :
        signedArea2 p3 S.triangle.v1 S.triangle.v3 =
          -signedArea2 y S.triangle.v1 S.triangle.v3 :=
      signedArea2_reflection_neg
        (q := S.triangle.v1) (v2 := S.triangle.v3) (y := y) (u := p3) hmid
    have hy_side :
        0 < signedArea2 y S.triangle.v1 S.triangle.v3 *
          signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 :=
      c3_vertex_same_open_side_as_v2' S hyI3
    have hp_side :
        0 < signedArea2 p3 S.triangle.v1 S.triangle.v3 *
          signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 :=
      c1_vertex_same_open_side_as_v2' S hp3I1
    rw [hreflect] at hp_side
    linarith
  have hp3v2 : p3 = S.triangle.v2 := by
    rcases Finset.mem_insert.mp hp3named with hp3a1 | hp3rest
    · exfalso
      apply hp3_not_I1
      rw [hp3a1, Z.hI1]
      simp
    rcases Finset.mem_insert.mp hp3rest with hp3b1 | hp3v2
    · exfalso
      apply hp3_not_I1
      rw [hp3b1, Z.hI1]
      simp
    · simpa using hp3v2
  -- LAYER 3: `p₃ = v₂` forces `t = s` (since `dist v₃ v₂ = dist v₂ v₃ = s`).
  have hts : t = s := by
    have : dist S.triangle.v3 S.triangle.v2 = t := by rw [← hp3v2]; exact hv3p3
    rw [← this]; rw [dist_comm]; exact hv2v3
  subst hts
  -- Now the `v₃`-selector lives at radius `s`: both `I₃` points and `q₃` are on
  -- the `v₃`-circle of radius `s`.
  have hv3y : dist S.triangle.v3 y = t := (Finset.mem_filter.mp (hI3sub3 hyI3)).2
  have hv3a3 : dist S.triangle.v3 Z.a3 = t := (Finset.mem_filter.mp (hI3sub3 ha3I3)).2
  have hv3b3 : dist S.triangle.v3 Z.b3 = t := (Finset.mem_filter.mp (hI3sub3 hb3I3)).2
  -- `q₃ ∈ {a₂, b₂, v₁}` trichotomy.
  -- For the `q₃ ∈ I₂` rows, record that `q₃` sits at distance `s` from both
  -- `v₂` and `v₃` (the `S(v₂,s) ∩ S(v₃,s)` packet).
  have hZa1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
  have hv1Za1 : dist S.triangle.v1 Z.a1 = r :=
    (Finset.mem_filter.mp (hI1sub1 hZa1I1)).2
  have hZb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
  have hv1Zb1 : dist S.triangle.v1 Z.b1 = r :=
    (Finset.mem_filter.mp (hI1sub1 hZb1I1)).2
  -- Orientation for x ∈ I₂: x lies on the same open side of chord v₁v₂ as v₃.
  -- This selects the near perp-bisector branch and is required by both leaf sieves.
  have hxorient : 0 < signedArea2 x S.triangle.v1 S.triangle.v2 *
      signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
    S.c2_vertex_same_open_side_as_v3 hxI2
  have hq3I2_kill : q3 ∈ S.I2 → False := by
    intro hq3I2
    have hv2q3 : dist S.triangle.v2 q3 = t := (Finset.mem_filter.mp (hI2sub hq3I2)).2
    -- The `q₃ ∈ I₂` packet matches sub-shape (B): `q₃` is the equilateral apex
    -- on base `v₂v₃` (`hv2q3`, `hv3q3`).  Discharged by the banked Layer-4
    -- sieve `layer4_subshapeB_kill` (K4 budget + sub-shape B clash, proven).
    exact layer4_subshapeB_kill S Z hr ht hxI2 hyI3 ha3I3 hb3I3 Z.hI1 Z.hI3 hxA
      hZa1I1 hv1Za1 hZb1I1 hv1Zb1 hv1x hv1y hv2x hv3y hv3a3 hv3b3
      hv2v3 hv2v1 hv2q3 hv3q3 hq3I2 hxorient
  rcases Finset.mem_insert.mp hq3named with hq3a2 | hq3rest
  · exact hq3I2_kill (by rw [hq3a2, Z.hI2]; simp)
  rcases Finset.mem_insert.mp hq3rest with hq3b2 | hq3v1
  · refine hq3I2_kill ?_
    have hq3b2' : q3 = Z.b2 := by simpa using hq3b2
    rw [hq3b2', Z.hI2]; simp
  · -- `q₃ = v₁`: equilateral packet `|v₂v₁| = |v₂v₃| = |v₃v₁| = s`.
    have hq3v1' : q3 = S.triangle.v1 := by simpa using hq3v1
    -- `dist v₃ v₁ = s`, so the triangle is equilateral.
    have hv3v1 : dist S.triangle.v3 S.triangle.v1 = t := by rw [← hq3v1']; exact hv3q3
    -- The equilateral packet is sub-shape (A).  Discharged by the banked
    -- Layer-4 sieve `layer4_subshapeA_kill` (K4 budget + r-window, proven).
    exact layer4_subshapeA_kill S Z hr ht hxI2 hyI3 ha3I3 hb3I3 Z.hI1 Z.hI3 hxA
      hZa1I1 hv1Za1 hZb1I1 hv1Zb1 hv1x hv1y hv2x hv3y hv3a3 hv3b3 hv2v3 hv2v1 hv3v1 hxorient

end FiniteEndpointShell

end Problem97
