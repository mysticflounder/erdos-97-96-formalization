import Erdos9796Proof.P97.N4dFormCPEqCProducer
import Erdos9796Proof.P97.N4dFormCLowerForcesV2
import Erdos9796Proof.P97.N4dFormBXb2UpperArc

/-!
# `N4d-cB1` FormC `q = v1` upper-arc producer

Cycle-free producer for the FormC branch with `y = a3` at `v1` and the forced
`v3` selector choosing `v1` in `C2`.  The local proof mirrors the FormB K4 cover
under `C2 <-> C3`, `v2 <-> v3`, `I2 <-> I3`, `a2 <-> a3`, `b2 <-> b3`.
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
base chord `v₁v₃` as the apex `v₂`.  (Made non-`private` so the v₁-anchor
faithful-frame extractor in `N4dFaithfulFrame.lean` can reuse it for the cap-`C₁`
`y`-positivity of `a₁, b₁`.) -/
private theorem c1_vertex_same_open_side_as_v2
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
        supportCap_interval_of_oppositeFirst_local
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
        supportCap_interval_of_oppositeFirst_local
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
private theorem c3_vertex_same_open_side_as_v2
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
        simpa [L2, Problem97.CGN.firstIndex, div_eq_mul_inv, mul_comm, mul_left_comm,
          mul_assoc] using
          (dist_left_midpoint (𝕜 := ℝ) q1 q2)
      last_on_circle := by
        simpa [L2, Problem97.CGN.lastIndex, div_eq_mul_inv, mul_comm, mul_left_comm,
          mul_assoc] using
          (dist_right_midpoint (𝕜 := ℝ) q1 q2) }
  let Hside2 : Problem97.CGN.MinorCapSideHypotheses P2 :=
    { cap_side_nonneg := by
        intro t
        fin_cases t <;> simp [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex,
          Problem97.signedArea2]
      center_side_nonpos := by
        simp [P2, L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2,
          midpoint_eq_smul_add]
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
        · simpa [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex,
            real_inner_self_eq_norm_sq] using
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

/- ### Chart coordinate helpers -/

private theorem vec2_coord0 (x y : ℝ) : (Problem97.CGN.vec2 x y) 0 = x := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem vec2_coord1 (x y : ℝ) : (Problem97.CGN.vec2 x y) 1 = y := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem dist_vec2_00_10 :
    dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) = 1 := by
  have hsq : dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) ^ 2 = 1 := by
    rw [dist_sq_eq_coord_sq_add_coord_sq]
    simp [vec2_coord0, vec2_coord1]
  have hnn : 0 ≤ dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) :=
    dist_nonneg
  calc dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0)
      = Real.sqrt (dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) ^ 2) :=
        (Real.sqrt_sq hnn).symm
    _ = Real.sqrt 1 := by rw [hsq]
    _ = 1 := Real.sqrt_one

private theorem signedArea2_chart_base (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring


/- ### Row dist facts from `hexact`

From `hexact : S(v₃) = {a₃, b₃, v₂, v₁}` every named member sits at
`v₃`-distance `s`.  We package the three we need: `|v₃v₁| = |v₃v₂| = |v₃a₃| = s`.
These are the `circle(v₃, s)` memberships that, after scaling `1/s`, become the
`circle(v₃, 1)` memberships of `bisectorKill`'s `hBeq`. -/

/-- `|v₃v₁| = s`, read off `hexact`. -/
private theorem v3v1_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 S.triangle.v1 = s := by
  have hmem : S.triangle.v1 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/-- `|v₃v₂| = s`, read off `hexact`. -/
private theorem v3v2_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 S.triangle.v2 = s := by
  have hmem : S.triangle.v2 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/-- `|v₃a₃| = s`, read off `hexact`. -/
private theorem v3a3_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 Z.a3 = s := by
  have hmem : Z.a3 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/-- `|v₃b₃| = s`, read off `hexact`. -/
private theorem v3b3_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v3 Z.b3 = s := by
  have hmem : Z.b3 ∈ S.witnessClassAt_v3 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2

/- ### A normalized base transport with `v₁ ↦ (0,0)`, `v₃ ↦ (1,0)`, `v₂` upper -/

/-- A normalized base transport packaged as data: a similarity chart `T` with
`v₁ ↦ (0,0)`, `v₃ ↦ (1,0)`, and `v₂` in the upper half-plane. -/
structure CB1NormBase {A : Finset ℝ²} (S : FiniteEndpointShell A) where
  /-- The similarity chart. -/
  T : ℝ² → ℝ²
  /-- Transport data. -/
  tau : Problem97.CGN.SimilarityTransportData T
  /-- `v₁ ↦ (0,0)`. -/
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  /-- `v₃ ↦ (1,0)`. -/
  hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0
  /-- `v₂` strictly upper. -/
  hv2y_pos : 0 < (T S.triangle.v2) 1

/-- A similarity chart normalizing the base edge `v₁v₃` to `(0,0)`–`(1,0)`,
chosen so the apex `v₂` lands strictly in the upper half-plane.  Uses only that
`v₁ ≠ v₃` and `v₂` is off the base line (`0 < signedArea2 v₂ v₁ v₃` up to sign,
delivered here from `v₃v₂ ≠ 0` and `v₂ ≠ v₁` via the non-degenerate triangle —
the orientation is fixed by composing with `flipY` when needed). -/
private theorem exists_v3_normalized_transport
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
      T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
      T S.triangle.v3 = Problem97.CGN.vec2 1 0 ∧
      0 < (T S.triangle.v2) 1 := by
  classical
  obtain ⟨T0, tau0, hT0v1, hT0v3⟩ :=
    exists_base_transportData S.triangle.v1 S.triangle.v3 S.triangle.v13_ne
  have hhalf_neg : halfShift (Problem97.CGN.vec2 (-1) 0) = Problem97.CGN.vec2 0 0 := by
    ext i <;> fin_cases i <;>
      simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  have hhalf_one : halfShift (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
    ext i <;> fin_cases i <;>
      simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  let T1 : ℝ² → ℝ² := fun x => halfShift (T0 x)
  let tau1 : Problem97.CGN.SimilarityTransportData T1 :=
    similarityTransportComp tau0 halfShiftSimilarityTransportData
  have hT1v1 : T1 S.triangle.v1 = Problem97.CGN.vec2 0 0 := by
    change halfShift (T0 S.triangle.v1) = _
    rw [hT0v1, hhalf_neg]
  have hT1v3 : T1 S.triangle.v3 = Problem97.CGN.vec2 1 0 := by
    change halfShift (T0 S.triangle.v3) = _
    rw [hT0v3, hhalf_one]
  -- `v₂` is off the base line: `(T1 v₂) 1 ≠ 0`, else `v₁, v₃, v₂` are collinear.
  -- The three triangle vertices are non-collinear: they are pairwise distinct
  -- points on the MEC circle.
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hbd3 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hsa0 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 ≠ 0 :=
    Problem97.MEC.signedArea2_ne_zero_of_three_dist_eq hbd3 hbd1 hbd2
      S.triangle.v12_ne.symm S.triangle.v13_ne S.triangle.v23_ne
  have hv2_off : (T1 S.triangle.v2) 1 ≠ 0 := by
    intro hzero
    have harea : signedArea2 (T1 S.triangle.v2) (T1 S.triangle.v1) (T1 S.triangle.v3) = 0 := by
      rw [hT1v1, hT1v3, signedArea2_chart_base, hzero]
    have htrans := tau1.halfplane_sign S.triangle.v2 S.triangle.v1 S.triangle.v3
    rw [harea] at htrans
    have ho : tau1.orientation ≠ 0 := by
      intro h0
      have := tau1.orientation_sq
      rw [h0] at this; norm_num at this
    have hsc : tau1.scale ^ 2 ≠ 0 := pow_ne_zero 2 tau1.scale_pos.ne'
    have : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = 0 := by
      have hcoef : tau1.orientation * tau1.scale ^ 2 ≠ 0 := mul_ne_zero ho hsc
      rcases mul_eq_zero.mp htrans.symm with h | h
      · exact absurd h hcoef
      · exact h
    exact hsa0 this
  rcases lt_trichotomy ((T1 S.triangle.v2) 1) 0 with hneg | hzero | hpos
  · -- flip
    have hflip00 : flipY (Problem97.CGN.vec2 0 0) = Problem97.CGN.vec2 0 0 := by
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflip10 : flipY (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflipy : ∀ p : ℝ², (flipY p) 1 = -(p 1) := by
      intro p
      simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    let T2 : ℝ² → ℝ² := fun x => flipY (T1 x)
    let tau2 : Problem97.CGN.SimilarityTransportData T2 :=
      similarityTransportComp tau1 flipYSimilarityTransportData
    refine ⟨T2, tau2, ?_, ?_, ?_⟩
    · change flipY (T1 S.triangle.v1) = _; rw [hT1v1, hflip00]
    · change flipY (T1 S.triangle.v3) = _; rw [hT1v3, hflip10]
    · change 0 < (flipY (T1 S.triangle.v2)) 1; rw [hflipy]; linarith
  · exact absurd hzero hv2_off
  · exact ⟨T1, tau1, hT1v1, hT1v3, hpos⟩

/-- The normalized base transport as data (chosen classically from the
existence theorem). -/
noncomputable def cb1_normBase {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    CB1NormBase S :=
  Classical.choice (by
    obtain ⟨T, tau, hv1, hv3, hv2y_pos⟩ := S.exists_v3_normalized_transport
    exact ⟨⟨T, tau, hv1, hv3, hv2y_pos⟩⟩)

/- ### The v₃-anchor faithful frame

The structure `CB1V3AnchorFrame S Z` bundles a similarity chart `T` and the
faithful-frame coordinate facts the v₃-anchor `bisectorKill` instantiations need:

* `v₁ ↦ (0,0)`, `v₃ ↦ (1,0)`, `v₂ ↦ (1+c, sg)` with `c² + sg² = 1`, `sg > 0`,
  `c ≤ 0`;
* the MEC centre `T O = (½, Oy)` with `Oy > 0` and the MEC relation
  `2·sg·Oy = 1 + c` (so `R² = ¼ + Oy²`);
* `a₃ ↦ (a₃ₓ, a₃_y)` upper (`a₃_y > 0`) on `circle(v₃,1)` (so `a₃ₓ ≤ 2`);
* the `circle(v₃,1)` memberships of `v₁, v₂, a₃`;
* the closed-disk facts (`dist (T x) (T O) ≤ R` for `x ∈ A`);
* the cap-`C₂` signs `a₂_y ≤ 0`, `b₂_y ≤ 0`.

From these the v₃-anchor `bisectorKill` hypotheses-minus-`hXeq` follow by
elementary coordinate algebra (the §4 reductions). -/
structure CB1V3AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  /-- The similarity chart. -/
  T : ℝ² → ℝ²
  /-- Transport data for `T`. -/
  tau : Problem97.CGN.SimilarityTransportData T
  /-- Faithful apex `x`-offset (`v₂ = (1+c, sg)`). -/
  c : ℝ
  /-- Faithful apex height (`v₂ = (1+c, sg)`). -/
  sg : ℝ
  /-- MEC centre height (`O = (½, Oy)`). -/
  Oy : ℝ
  /-- `v₁ ↦ (0,0)`. -/
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  /-- `v₃ ↦ (1,0)`. -/
  hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0
  /-- `v₂ ↦ (1+c, sg)`. -/
  hv2 : T S.triangle.v2 = Problem97.CGN.vec2 (1 + c) sg
  /-- MEC centre `O ↦ (½, Oy)`. -/
  hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy
  /-- `c² + sg² = 1` (unit base edge). -/
  hcsg : c ^ 2 + sg ^ 2 = 1
  /-- Apex strictly upper. -/
  hsg_pos : 0 < sg
  /-- Non-obtuse at `v₃`. -/
  hc_le : c ≤ 0
  /-- MEC centre strictly upper. -/
  hOy_pos : 0 < Oy
  /-- MEC relation `2·sg·Oy = 1 + c`. -/
  hmec : 2 * sg * Oy = 1 + c
  /-- `v₁` on `circle(v₃, 1)`. -/
  hcirc_v1 : dist (T S.triangle.v3) (T S.triangle.v1) = 1
  /-- `v₂` on `circle(v₃, 1)`. -/
  hcirc_v2 : dist (T S.triangle.v3) (T S.triangle.v2) = 1
  /-- `a₃` on `circle(v₃, 1)`. -/
  hcirc_a3 : dist (T S.triangle.v3) (T Z.a3) = 1
  /-- `b₃` on `circle(v₃, 1)`. -/
  hcirc_b3 : dist (T S.triangle.v3) (T Z.b3) = 1
  /-- `a₃` strictly upper (cap-`C₃` sign). -/
  ha3_y : 0 < (T Z.a3) 1
  /-- `b₃` strictly upper (cap-`C₃` sign). -/
  hb3_y : 0 < (T Z.b3) 1
  /-- `v₃` on the MEC circle: `dist (T v₃) (T O) = R`. -/
  hv3_on_mec : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2
  /-- Every `A`-point lands in the closed MEC disk. -/
  hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2
  /-- `a₂` on the cap-`C₂` (lower) side. -/
  ha2_y : (T Z.a2) 1 ≤ 0
  /-- `b₂` on the cap-`C₂` (lower) side. -/
  hb2_y : (T Z.b2) 1 ≤ 0

/- ### Producer for `CB1V3AnchorFrame`

We assemble the frame from the row's exact-packet hypothesis `hexact`
(`S(v₃) = {a₃, b₃, v₂, v₁}`, giving the three `circle(v₃, s)` memberships) and
the committed shell structure (the circumscribed-MEC packet's boundary /
non-obtuse / disk facts, and the cap-side invariants for `a₃ ∈ I₃` and
`a₂, b₂ ∈ I₂`). -/

/-- Transported chart-base signed-area equals the second coordinate:
`signedArea2 (T p) (vec2 0 0) (vec2 1 0) = (T p) 1` once the ends are normalized. -/
private theorem chart_signedArea_eq_coord1 {T : ℝ² → ℝ²}
    {v1 v3 p : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv3 : T v3 = Problem97.CGN.vec2 1 0) :
    signedArea2 (T p) (T v1) (T v3) = (T p) 1 := by
  rw [hv1, hv3, signedArea2_chart_base]

/-- A transported half-plane sign product, reduced to the product of the two
`y`-coordinates: `(T p) 1 * (T q) 1 = (orientation² · scale⁴) · (sa p · sa q)`. -/
private theorem chart_y_product {T : ℝ² → ℝ²}
    (tau : Problem97.CGN.SimilarityTransportData T) {v1 v3 p q : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv3 : T v3 = Problem97.CGN.vec2 1 0) :
    (T p) 1 * (T q) 1 =
      tau.scale ^ 4 *
        (signedArea2 p v1 v3 * signedArea2 q v1 v3) := by
  have hp := tau.halfplane_sign p v1 v3
  have hq := tau.halfplane_sign q v1 v3
  rw [chart_signedArea_eq_coord1 hv1 hv3] at hp
  rw [chart_signedArea_eq_coord1 hv1 hv3] at hq
  have hkey : (T p) 1 * (T q) 1
      = (tau.orientation ^ 2 * tau.scale ^ 4) *
        (signedArea2 p v1 v3 * signedArea2 q v1 v3) := by
    rw [hp, hq]; ring
  rw [hkey, tau.orientation_sq, one_mul]

/-- A cap-`C₂` interior point lands strictly below the base line in the
normalized frame: `(T x) 1 ≤ 0`.  (Generic over `x ∈ I₂`; used for both
`a₂` and `b₂`.) -/
private theorem frame_c3_lower
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1)
    (hxI2 : x ∈ S.I2) :
    (T x) 1 ≤ 0 := by
  have hxC2 : x ∈ S.CP.C2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).2
  have hxA : x ∈ A := S.CP.C2_subset hxC2
  have hopp_raw : Problem97.OnArcOpposite S.triangle.v2 S.triangle.v3 S.triangle.v1 x :=
    ((S.CP.arc_membership x hxA).2.1.mp hxC2)
  unfold Problem97.OnArcOpposite at hopp_raw
  have hopp :
      signedArea2 x S.triangle.v1 S.triangle.v3 *
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 ≤ 0 := by
    have hxswap :
        signedArea2 x S.triangle.v1 S.triangle.v3 =
          -signedArea2 x S.triangle.v3 S.triangle.v1 := by
      simp [signedArea2]
    have hvswap :
        signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 =
          -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by
      simp [signedArea2]
    calc
      signedArea2 x S.triangle.v1 S.triangle.v3 *
          signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3
          = (-signedArea2 x S.triangle.v3 S.triangle.v1) *
              (-signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) := by
                rw [hxswap, hvswap]
      _ = signedArea2 x S.triangle.v3 S.triangle.v1 *
            signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by ring
      _ ≤ 0 := hopp_raw
  have hy := chart_y_product (T := T) tau (p := x) (q := S.triangle.v2) hv1 hv3
  have hle : (T x) 1 * (T S.triangle.v2) 1 ≤ 0 := by
    rw [hy]; exact mul_nonpos_of_nonneg_of_nonpos (by positivity) hopp
  nlinarith [hle, hsg_pos]

/-- The `C₃` interior point `p ∈ I₃` lands strictly above the base line:
`0 < (T p) 1`.  (Generic over `p ∈ I₃`; used for both `a₃` and `b₃`.) -/
private theorem frame_c2_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1)
    (hpI3 : p ∈ S.I3) :
    0 < (T p) 1 := by
  have hside := S.c3_vertex_same_open_side_as_v2 hpI3
  have hy := chart_y_product (T := T) tau (p := p) (q := S.triangle.v2) hv1 hv3
  have hpos : 0 < (T p) 1 * (T S.triangle.v2) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith [hpos, hsg_pos]

/-- The `C₃` interior point `a₃` lands strictly above the base line:
`0 < (T a₃) 1`. -/
private theorem frame_a3_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1) :
    0 < (T Z.a3) 1 :=
  S.frame_c2_upper tau hv1 hv3 hsg_pos (by rw [Z.hI3]; simp)

/-- Every `A`-point lands in the closed MEC disk in the normalized frame. -/
private theorem frame_disk
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {Oy R : ℝ}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hR : R = tau.scale * S.Packet.radius)
    (hRsq : R ^ 2 = 1 / 4 + Oy ^ 2) :
    ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 := by
  intro x hx
  have hxdisk : dist x S.Packet.center ≤ S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.disk_contains_A x hx
  have hle : dist (T x) (T S.Packet.center) ≤ R := by
    rw [tau.dist_image, hR]
    exact mul_le_mul_of_nonneg_left hxdisk tau.scale_pos.le
  have hsq : dist (T x) (T S.Packet.center) ^ 2 ≤ R ^ 2 :=
    pow_le_pow_left₀ dist_nonneg hle 2
  rw [hRsq] at hsq; exact hsq

set_option maxHeartbeats 4000000 in
-- The coordinate-algebra derivation (≈20 `have`s threading the nested transport
-- `T = flipY ∘ halfShift ∘ T0` through `nlinarith` certificates) exceeds the
-- default heartbeat budget; the underlying algebra is light.
/-- **The v₃-anchor faithful-frame scalar facts.**  Given a normalized base
transport and the row's `circle(v₃, s)` distance pins, derive the faithful
coordinates `c, sg, Oy` and every `CB1V3AnchorFrame` field as a packaged
existential.  (Isolated from the structure assembly so the heavy coordinate
algebra carries its own heartbeat budget.) -/
private theorem cb1_v3AnchorFrame_facts
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (T : ℝ² → ℝ²) (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hv2y_pos : 0 < (T S.triangle.v2) 1)
    (hv3v1 : dist S.triangle.v3 S.triangle.v1 = s)
    (hv3v2 : dist S.triangle.v3 S.triangle.v2 = s)
    (hv3a3 : dist S.triangle.v3 Z.a3 = s)
    (hv3b3 : dist S.triangle.v3 Z.b3 = s) :
    ∃ c sg Oy : ℝ,
      T S.triangle.v2 = Problem97.CGN.vec2 (1 + c) sg ∧
      T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy ∧
      c ^ 2 + sg ^ 2 = 1 ∧ 0 < sg ∧ c ≤ 0 ∧ 0 < Oy ∧ 2 * sg * Oy = 1 + c ∧
      dist (T S.triangle.v3) (T S.triangle.v1) = 1 ∧
      dist (T S.triangle.v3) (T S.triangle.v2) = 1 ∧
      dist (T S.triangle.v3) (T Z.a3) = 1 ∧
      dist (T S.triangle.v3) (T Z.b3) = 1 ∧
      0 < (T Z.a3) 1 ∧
      0 < (T Z.b3) 1 ∧
      dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 ∧
      (∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2) ∧
      (T Z.a2) 1 ≤ 0 ∧ (T Z.b2) 1 ≤ 0 := by
  classical
  have hs_pos : 0 < s := by
    rw [← hv3v1]; exact dist_pos.mpr S.triangle.v13_ne.symm
  -- Scale pin: `tau.scale * s = 1`.
  have hscale : tau.scale * s = 1 := by
    have hbase : dist (T S.triangle.v3) (T S.triangle.v1) = tau.scale * s := by
      rw [tau.dist_image, hv3v1]
    have hone : dist (T S.triangle.v3) (T S.triangle.v1) = 1 := by
      rw [hv3, hv1, dist_comm, dist_vec2_00_10]
    rw [← hbase, hone]
  -- Set the faithful coordinates.
  set c := (T S.triangle.v2) 0 - 1 with hc_def
  set sg := (T S.triangle.v2) 1 with hsg_def
  set Oy := (T S.Packet.center) 1 with hOy_def
  -- `v₂ = (1 + c, sg)`.
  have hv2 : T S.triangle.v2 = Problem97.CGN.vec2 (1 + c) sg := by
    ext i
    fin_cases i
    · change (T S.triangle.v2) 0 = (Problem97.CGN.vec2 (1 + c) sg) 0
      rw [vec2_coord0, hc_def]; ring
    · change (T S.triangle.v2) 1 = (Problem97.CGN.vec2 (1 + c) sg) 1
      rw [vec2_coord1, hsg_def]
  -- `sg > 0`.
  have hsg_pos : 0 < sg := hv2y_pos
  -- Transported circle(v₃,1) memberships (squared form).
  have hcirc_v1 : dist (T S.triangle.v3) (T S.triangle.v1) = 1 := by
    rw [tau.dist_image, hv3v1, hscale]
  have hcirc_v2 : dist (T S.triangle.v3) (T S.triangle.v2) = 1 := by
    rw [tau.dist_image, hv3v2, hscale]
  have hcirc_a3 : dist (T S.triangle.v3) (T Z.a3) = 1 := by
    rw [tau.dist_image, hv3a3, hscale]
  have hcirc_b3 : dist (T S.triangle.v3) (T Z.b3) = 1 := by
    rw [tau.dist_image, hv3b3, hscale]
  have hc3sq : dist (T S.triangle.v3) (T S.triangle.v2) ^ 2 = 1 := by
    rw [hcirc_v2]; norm_num
  -- Transported MEC boundary squared-dist facts (all = R²), `R := scale·radius`.
  set R := tau.scale * S.Packet.radius with hR_def
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hbd3 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hb1sq : dist (T S.triangle.v1) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd1, hR_def]
  have hb3sq : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd2, hR_def]
  have hb2sq : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd3, hR_def]
  -- Centre coordinates and the MEC relation, via the verified algebra.
  -- Expand the four squared-dist facts into coordinate form ONCE (fresh names).
  set ox := (T S.Packet.center) 0 with hox_def
  have e1 : ox ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb1sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv1, vec2_coord0, vec2_coord1] at h
    simpa [hox_def, hOy_def] using h
  have e2 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv3, vec2_coord0, vec2_coord1] at h
    have h' : ((1 : ℝ) - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by nlinarith [h]
    exact h'
  have e3 : (1 + c - ox) ^ 2 + (sg - Oy) ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv2, vec2_coord0, vec2_coord1] at h
    exact h
  have ec : c ^ 2 + sg ^ 2 = 1 := by
    have h := hc3sq
    rw [dist_sq_eq_coord_sq_add_coord_sq, hv3, hv2, vec2_coord0, vec2_coord1,
      vec2_coord0, vec2_coord1] at h
    nlinarith [h]
  -- Make the faithful coordinates opaque so the remaining algebra/sign analyses
  -- do not attempt to `whnf` through the (deeply nested) transport `T`.
  clear_value c sg Oy ox R
  have hox : ox = 1 / 2 := by nlinarith [e1, e2]
  have hcsg : c ^ 2 + sg ^ 2 = 1 := ec
  have hmec : 2 * sg * Oy = 1 + c := by nlinarith [e1, e3, ec, hox]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith [e1, hox]
  have hv3_on_mec : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 := by
    rw [hb3sq, hRsq]
  -- `T O = (½, Oy)`.
  have hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy := by
    ext i
    fin_cases i
    · change (T S.Packet.center) 0 = (Problem97.CGN.vec2 (1 / 2) Oy) 0
      rw [vec2_coord0, ← hox_def]; exact hox
    · change (T S.Packet.center) 1 = (Problem97.CGN.vec2 (1 / 2) Oy) 1
      rw [vec2_coord1, hOy_def]
  -- `c ≤ 0` from the non-obtuse angle at `v₃` (`S.Packet.inner_at_v3`).
  have hc_le : c ≤ 0 := by
    -- `inner_at_v3 : 0 ≤ ⟪v₂ - v₃, v₁ - v₃⟫`.  Transport via dist² polarization.
    -- In the frame: ⟪(c, sg), (-1, 0)⟫ = -c ≥ 0 ⟹ c ≤ 0.
    have hpol : dist S.triangle.v1 S.triangle.v2 ^ 2 ≤ s ^ 2 + s ^ 2 := by
      have hinner := S.Packet.inner_at_v3
      have hinner' : 0 ≤ inner ℝ (S.triangle.v2 - S.triangle.v3)
          (S.triangle.v1 - S.triangle.v3) := by
        simpa [real_inner_comm] using hinner
      have hexp := norm_sub_sq_real (S.triangle.v2 - S.triangle.v3)
        (S.triangle.v1 - S.triangle.v3)
      have hrw : S.triangle.v2 - S.triangle.v3 - (S.triangle.v1 - S.triangle.v3)
          = S.triangle.v2 - S.triangle.v1 := by abel
      rw [hrw] at hexp
      have h1 : ‖S.triangle.v2 - S.triangle.v1‖ = dist S.triangle.v1 S.triangle.v2 := by
        rw [← dist_eq_norm, dist_comm]
      have h2 : ‖S.triangle.v2 - S.triangle.v3‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv3v2]
      have h3 : ‖S.triangle.v1 - S.triangle.v3‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv3v1]
      rw [h1, h2, h3] at hexp
      nlinarith [hinner', hexp]
    -- transported: |T v₁ - T v₂|² ≤ (scale·s)² + (scale·s)² = 2, and
    -- |T v₁ - T v₂|² = (1+c)² + sg² = 2 + 2c, so 2 + 2c ≤ 2 ⟹ c ≤ 0.
    have htrans : dist (T S.triangle.v1) (T S.triangle.v2) ^ 2 ≤ 2 := by
      rw [tau.dist_image]
      calc (tau.scale * dist S.triangle.v1 S.triangle.v2) ^ 2
          = tau.scale ^ 2 * dist S.triangle.v1 S.triangle.v2 ^ 2 := by ring
        _ ≤ tau.scale ^ 2 * (s ^ 2 + s ^ 2) :=
            mul_le_mul_of_nonneg_left hpol (by positivity)
        _ = (tau.scale * s) ^ 2 + (tau.scale * s) ^ 2 := by ring
        _ = 2 := by rw [hscale]; norm_num
    have hexpand : dist (T S.triangle.v1) (T S.triangle.v2) ^ 2 = (1 + c) ^ 2 + sg ^ 2 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq, hv1, hv2, vec2_coord0, vec2_coord1,
        vec2_coord0, vec2_coord1]
      ring
    rw [hexpand] at htrans
    nlinarith [htrans, hcsg]
  -- `Oy > 0`: from `2·sg·Oy = 1 + c`, `sg > 0`, and `1 + c > 0` (since `c² + sg² = 1`,
  -- `sg > 0` ⟹ `c > -1`).
  have hOy_pos : 0 < Oy := by
    have hcgt : -1 < c := by nlinarith [hcsg, hsg_pos]
    have h1c : 0 < 1 + c := by linarith
    have h2sg : 0 < 2 * sg := by linarith
    have hprod : 0 < 2 * sg * Oy := by rw [hmec]; exact h1c
    nlinarith [hprod, h2sg]
  -- `(T v₂) 1 > 0` in raw form (for the cap-sign helpers).
  have hv2y_pos' : 0 < (T S.triangle.v2) 1 := hsg_def ▸ hsg_pos
  -- Cap-sign and disk facts, delegated to the dedicated helpers.
  have ha3_y : 0 < (T Z.a3) 1 := S.frame_a3_upper Z tau hv1 hv3 hv2y_pos'
  have hb3_y : 0 < (T Z.b3) 1 :=
    S.frame_c2_upper tau hv1 hv3 hv2y_pos' (by rw [Z.hI3]; simp)
  have ha2_y : (T Z.a2) 1 ≤ 0 :=
    S.frame_c3_lower tau hv1 hv3 hv2y_pos' (by rw [Z.hI2]; simp)
  have hb2_y : (T Z.b2) 1 ≤ 0 :=
    S.frame_c3_lower tau hv1 hv3 hv2y_pos' (by rw [Z.hI2]; simp)
  have hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 :=
    S.frame_disk tau hR_def hRsq
  exact ⟨c, sg, Oy, hv2, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v2,
    hcirc_a3, hcirc_b3, ha3_y, hb3_y, hv3_on_mec, hdisk, ha2_y, hb2_y⟩

/-- **The v₃-anchor faithful-frame producer.**  From the row's exact-packet
hypothesis `hexact` and the committed shell structure, build the
`CB1V3AnchorFrame`. -/
noncomputable def cb1_v3AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    CB1V3AnchorFrame S Z := by
  classical
  obtain ⟨T, tau, hv1, hv3, hv2y_pos⟩ := S.cb1_normBase
  have hfacts := S.cb1_v3AnchorFrame_facts Z T tau hv1 hv3 hv2y_pos
      (S.v3v1_dist_of_hexact Z hexact)
      (S.v3v2_dist_of_hexact Z hexact)
      (S.v3a3_dist_of_hexact Z hexact)
      (S.v3b3_dist_of_hexact Z hexact)
  -- Extract the three real coordinates classically; the remaining facts are
  -- propositions and can be projected directly.
  set c := hfacts.choose with hc_eq
  set sg := hfacts.choose_spec.choose with hsg_eq
  set Oy := hfacts.choose_spec.choose_spec.choose with hOy_eq
  obtain ⟨hv2, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v2,
      hcirc_a3, hcirc_b3, ha3_y, hb3_y, hv3_on_mec, hdisk, ha2_y, hb2_y⟩ :=
    hfacts.choose_spec.choose_spec.choose_spec
  exact
    { T := T
      tau := tau
      c := c
      sg := sg
      Oy := Oy
      hv1 := hv1
      hv3 := hv3
      hv2 := hv2
      hO := hO
      hcsg := hcsg
      hsg_pos := hsg_pos
      hc_le := hc_le
      hOy_pos := hOy_pos
      hmec := hmec
      hcirc_v1 := hcirc_v1
      hcirc_v2 := hcirc_v2
      hcirc_a3 := hcirc_a3
      hcirc_b3 := hcirc_b3
      ha3_y := ha3_y
      hb3_y := hb3_y
      hv3_on_mec := hv3_on_mec
      hdisk := hdisk
      ha2_y := ha2_y
      hb2_y := hb2_y }

/-- `v₁ ∈ A` (a Moser vertex of the shell). -/
private theorem v1_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v1 ∈ A :=
  S.triangle.v1_mem

/-- `v₂ ∈ A` (a Moser vertex of the shell). -/
private theorem v2_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v2 ∈ A :=
  S.triangle.v2_mem

/-- `a₃ ∈ A` (a `C₃`-interior named point). -/
private theorem a3_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.a3 ∈ A := by
  have h : Z.a3 ∈ S.I3 := by rw [Z.hI3]; simp
  exact S.CP.C3_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)

/-- `b₃ ∈ A` (a `C₃`-interior named point). -/
private theorem b3_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.b3 ∈ A := by
  have h : Z.b3 ∈ S.I3 := by rw [Z.hI3]; simp
  exact S.CP.C3_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)

namespace CB1V3AnchorFrame

variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}

/-- The chart `T` is injective (it is a positive-scale similarity). -/
theorem T_injective (F : CB1V3AnchorFrame S Z) : Function.Injective F.T := by
  intro a b hab
  by_contra hne
  have hd : 0 < dist a b := dist_pos.mpr hne
  have heq : dist (F.T a) (F.T b) = F.tau.scale * dist a b := F.tau.dist_image a b
  rw [hab, dist_self] at heq
  have hpos : 0 < F.tau.scale * dist a b := mul_pos F.tau.scale_pos hd
  rw [← heq] at hpos
  exact lt_irrefl 0 hpos

/-- `bisectorKill`'s `hBy0`: the v₃-anchor's `y`-coordinate is `0`. -/
theorem anchor_y_zero (F : CB1V3AnchorFrame S Z) : (F.T S.triangle.v3) 1 = 0 := by
  rw [F.hv3, vec2_coord1]

/-- `bisectorKill`'s `hXdisk`: any `A`-point `x` lies in the closed MEC disk,
whose boundary contains the anchor `v₃` — so `dist (T x) (T O) ≤ dist (T v₃) (T O)`. -/
theorem x_dist_le_anchor (F : CB1V3AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) := by
  have hX := F.hdisk x hx
  have hv3sq := F.hv3_on_mec
  have h : dist (F.T x) (F.T S.Packet.center) ^ 2
      ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ^ 2 := by
    rw [hv3sq]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.T x) (F.T S.Packet.center) := dist_nonneg
  have hv3nn : (0 : ℝ) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) := dist_nonneg
  nlinarith [h, hXnn, hv3nn]

/-- `a₃`'s `x`-coordinate is at most `2` (from the `circle(v₃,1)` membership). -/
theorem a3_x_le_two (F : CB1V3AnchorFrame S Z) : (F.T Z.a3) 0 ≤ 2 := by
  have h := F.hcirc_a3
  have hsq : dist (F.T S.triangle.v3) (F.T Z.a3) ^ 2 = 1 := by rw [h]; norm_num
  rw [dist_sq_eq_coord_sq_add_coord_sq, F.hv3, vec2_coord0, vec2_coord1] at hsq
  nlinarith [hsq, sq_nonneg ((F.T Z.a3) 1)]

/-- A `circle(v₃,1)` point `p` is distinct from the anchor `v₃` (which is the
circle's centre, `dist v₃ v₃ = 0 ≠ 1`). -/
theorem circ_ne_anchor (F : CB1V3AnchorFrame S Z) {p : ℝ²}
    (hp : dist (F.T S.triangle.v3) (F.T p) = 1) : F.T p ≠ F.T S.triangle.v3 := by
  intro heq
  rw [heq, dist_self] at hp
  exact one_ne_zero hp.symm

/-- The disk-bound `x`-floor for a `circle(v₃, 1)` point `p`: with `v₃ = (1,0)`,
`O = (½, Oy)` and `p` in the closed MEC disk, `p_x ≤ 2·Oy·p_y`.  (The v₃-anchor
`hinner` reduction for every dead pair reduces to a sum of `p_x − 2·Oy·p_y ≤ 0`
contributions and a `−1`, so this floor discharges all of them uniformly.) -/
theorem circ_disk_x_floor (F : CB1V3AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.T S.triangle.v3) (F.T p) = 1) :
    (F.T p) 0 ≤ 2 * F.Oy * (F.T p) 1 := by
  -- unit-circle pin in chart: `(p_x − 1)² + p_y² = 1`.
  have hunit : ((F.T p) 0 - 1) ^ 2 + (F.T p) 1 ^ 2 = 1 := by
    have h : dist (F.T S.triangle.v3) (F.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [dist_sq_eq_coord_sq_add_coord_sq, F.hv3, vec2_coord0, vec2_coord1] at h
    nlinarith [h]
  -- closed-disk pin in chart: `(p_x − ½)² + (p_y − Oy)² ≤ ¼ + Oy²`.
  have hdisk := F.hdisk p hpA
  rw [dist_sq_eq_coord_sq_add_coord_sq, F.hO, vec2_coord0, vec2_coord1] at hdisk
  nlinarith [hunit, hdisk]

/- ### The two v₃-anchor `bisectorKill` argument bundles

For each dead pair `(P, Q)` ∈ `{(v₁, a₃), (v₂, a₃)}` and each lower point `x`
(`a₂` or `b₂`), the following lemmas package **every** hypothesis of
`Problem97.bisectorKill (F.T v₃) (F.T O) (F.T P) (F.T Q) (F.T x)` **except
`hXeq`** (the K4-equidistance demand the cover slice supplies):

* `hXdisk`, `hBeq`, `hBy0`, `hXy`, `hdy`, `hinner`, `hPQ`, `hXne`.

The cover slice then closes the row with
`Problem97.bisectorKill _ _ _ _ _ hXdisk hXeq hBeq hBy0 hXy hdy hinner hPQ hXne`. -/

/-- **`bisectorKill` argument bundle, dead pair `{v₁, a₃}`.**  `B := T v₃`,
`O := T O`, `P := T v₁`, `Q := T a₃`, `X := T x` for a lower point `x ∈ A`
distinct from `v₃`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v1a3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v1) = dist (F.T S.triangle.v3) (F.T Z.a3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.a3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.a3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  -- coordinates of the named points
  have hv1c0 : (F.T S.triangle.v1) 0 = 0 := by rw [F.hv1, vec2_coord0]
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have ha3x : (F.T Z.a3) 0 ≤ 2 := F.a3_x_le_two
  have ha3y : 0 < (F.T Z.a3) 1 := F.ha3_y
  have hOy : 0 < F.Oy := F.hOy_pos
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_a3]
  · rw [hv1c1, hv3c1]; linarith [ha3y]
  · rw [hv1c0, hv1c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [ha3x, ha3y, hOy]
  · -- `T v₁ ≠ T a₃`: `v₁` is on the base line (`y = 0`), `a₃` is strictly above.
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.a3) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [ha3y, hcontr]
  · -- `T x ≠ T v₃` from `x ≠ v₃` and `T` injective.
    intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₂, a₃}`.**  `B := T v₃`,
`O := T O`, `P := T v₂`, `Q := T a₃`, `X := T x` for a lower point `x ∈ A`
distinct from `v₃`.  Supplies every `bisectorKill` hypothesis except `hXeq`.
The `hinner` reduction collapses to the same `a₃ₓ/2 − 1 − Oy·a₃_y < 0` as the
`{v₁, a₃}` pair after substituting the MEC relation `2·sg·Oy = 1 + c`. -/
theorem bisectorKill_args_v2a3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v2) = dist (F.T S.triangle.v3) (F.T Z.a3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v2) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.a3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v2 ≠ F.T Z.a3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 + F.c := by rw [F.hv2, vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = F.sg := by rw [F.hv2, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have ha3x : (F.T Z.a3) 0 ≤ 2 := F.a3_x_le_two
  have ha3y : 0 < (F.T Z.a3) 1 := F.ha3_y
  have hOy : 0 < F.Oy := F.hOy_pos
  have hsg : 0 < F.sg := F.hsg_pos
  have hmec : 2 * F.sg * F.Oy = 1 + F.c := F.hmec
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_a3]
  · rw [hv2c1, hv3c1]; linarith [hsg, ha3y]
  · rw [hv2c0, hv2c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [ha3x, ha3y, hOy, hmec]
  · -- `T v₂ ≠ T a₃`: distinct points (their images differ); via `T` injective
    -- and `v₂ ≠ a₃` (a₃ ∈ I₃ excludes the apex `v₂`).
    intro heq
    have ha3I3 : Z.a3 ∈ S.I3 := by rw [Z.hI3]; simp
    have hne : S.triangle.v2 ≠ Z.a3 :=
      fun h => (Finset.mem_erase.mp ha3I3).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/- ### The four additional v₃-anchor `bisectorKill` argument bundles

The cover at `a₂` of all `C(8,4) = 70` candidate 4-subsets uses, beyond the
two banked v₃-anchor pairs `{v₁,a₃}`/`{v₂,a₃}`, these four more v₃-anchor
pairs `{v₁,b₃}`, `{v₂,b₃}`, `{a₃,b₃}`, `{v₁,v₂}` — all members on
`circle(v₃, 1)`.  Their `hinner` discharge is uniform: for any two
`circle(v₃,1)` members `P, Q` in the closed MEC disk,
`⟨d, v₃−O⟩ = P_x/2 + Q_x/2 − 1 − Oy·(P_y+Q_y) ≤ −1 < 0` via the disk floor
`p_x ≤ 2·Oy·p_y` (`circ_disk_x_floor`).  Together with the three banked
v₁-anchor pairs these nine pairs cover all 70 subsets in every branch. -/

/-- **`bisectorKill` argument bundle, dead pair `{v₁, b₃}`.**  `B := T v₃`,
`O := T O`, `P := T v₁`, `Q := T b₃`, `X := T x` for a lower point `x ∈ A`
distinct from `v₃`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v1b3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v1) = dist (F.T S.triangle.v3) (F.T Z.b3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.b3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.b3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have hb3y : 0 < (F.T Z.b3) 1 := F.hb3_y
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.v1_mem_A) F.hcirc_v1
  have hb3floor : (F.T Z.b3) 0 ≤ 2 * F.Oy * (F.T Z.b3) 1 :=
    F.circ_disk_x_floor (S.b3_mem_A Z) F.hcirc_b3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_b3]
  · rw [hv1c1, hv3c1]; linarith [hb3y]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [hv1floor, hb3floor, hv1c1]
  · -- `T v₁ ≠ T b₃`: `v₁` is on the base line (`y = 0`), `b₃` is strictly above.
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.b3) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [hb3y, hcontr]
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₂, b₃}`.**  `B := T v₃`,
`O := T O`, `P := T v₂`, `Q := T b₃`, `X := T x` for a lower point `x ∈ A`
distinct from `v₃`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v2b3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v2) = dist (F.T S.triangle.v3) (F.T Z.b3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v2) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.b3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v2 ≠ F.T Z.b3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, vec2_coord1]
  have hv2c1 : (F.T S.triangle.v2) 1 = F.sg := by rw [F.hv2, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have hb3y : 0 < (F.T Z.b3) 1 := F.hb3_y
  have hsg : 0 < F.sg := F.hsg_pos
  have hv2floor : (F.T S.triangle.v2) 0 ≤ 2 * F.Oy * (F.T S.triangle.v2) 1 :=
    F.circ_disk_x_floor (S.v2_mem_A) F.hcirc_v2
  have hb3floor : (F.T Z.b3) 0 ≤ 2 * F.Oy * (F.T Z.b3) 1 :=
    F.circ_disk_x_floor (S.b3_mem_A Z) F.hcirc_b3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_b3]
  · rw [hv2c1, hv3c1]; linarith [hsg, hb3y]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [hv2floor, hb3floor]
  · -- `T v₂ ≠ T b₃`: `b₃ ∈ I₃` excludes the apex `v₂`.
    intro heq
    have hb3I3 : Z.b3 ∈ S.I3 := by rw [Z.hI3]; simp
    have hne : S.triangle.v2 ≠ Z.b3 :=
      fun h => (Finset.mem_erase.mp hb3I3).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{a₃, b₃}`.**  `B := T v₃`,
`O := T O`, `P := T a₃`, `Q := T b₃`, `X := T x` for a lower point `x ∈ A`
distinct from `v₃`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_a3b3 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T Z.a3) = dist (F.T S.triangle.v3) (F.T Z.b3) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T Z.a3) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T Z.a3) 0 - (F.T S.triangle.v3) 0)
        + ((F.T Z.b3) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T Z.a3) 1 - (F.T S.triangle.v3) 1)
        + ((F.T Z.b3) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T Z.a3 ≠ F.T Z.b3 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have ha3y : 0 < (F.T Z.a3) 1 := F.ha3_y
  have hb3y : 0 < (F.T Z.b3) 1 := F.hb3_y
  have ha3floor : (F.T Z.a3) 0 ≤ 2 * F.Oy * (F.T Z.a3) 1 :=
    F.circ_disk_x_floor (S.a3_mem_A Z) F.hcirc_a3
  have hb3floor : (F.T Z.b3) 0 ≤ 2 * F.Oy * (F.T Z.b3) 1 :=
    F.circ_disk_x_floor (S.b3_mem_A Z) F.hcirc_b3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_a3, F.hcirc_b3]
  · rw [hv3c1]; linarith [ha3y, hb3y]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [ha3floor, hb3floor]
  · -- `T a₃ ≠ T b₃`: `a₃ ≠ b₃` (`I₃.card = 2`) via `T` injective.
    intro heq
    have ha3_ne_b3 : Z.a3 ≠ Z.b3 := by
      have hI3card : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by
        simpa [Z.hI3] using S.I3_card_eq_two
      intro h; simp [h] at hI3card
    exact ha3_ne_b3 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₁, v₂}`.**  `B := T v₃`,
`O := T O`, `P := T v₁`, `Q := T v₂`, `X := T x` for a lower point `x ∈ A`
distinct from `v₃`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v1v2 (F : CB1V3AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v3) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v3) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v3) (F.T S.triangle.v1) = dist (F.T S.triangle.v3) (F.T S.triangle.v2) ∧
    (F.T S.triangle.v3) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v3) 0)
        + ((F.T S.triangle.v2) 0 - (F.T S.triangle.v3) 0))
        * ((F.T S.triangle.v3) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v3) 1)
        + ((F.T S.triangle.v2) 1 - (F.T S.triangle.v3) 1))
        * ((F.T S.triangle.v3) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T S.triangle.v2 ∧
    F.T x ≠ F.T S.triangle.v3 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 := by rw [F.hv3, vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = 0 := by rw [F.hv3, vec2_coord1]
  have hv2c1 : (F.T S.triangle.v2) 1 = F.sg := by rw [F.hv2, vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, vec2_coord1]
  have hsg : 0 < F.sg := F.hsg_pos
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.v1_mem_A) F.hcirc_v1
  have hv2floor : (F.T S.triangle.v2) 0 ≤ 2 * F.Oy * (F.T S.triangle.v2) 1 :=
    F.circ_disk_x_floor (S.v2_mem_A) F.hcirc_v2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv3c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_v2]
  · rw [hv1c1, hv3c1]; linarith [hsg, hv2c1]
  · rw [hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [hv1floor, hv2floor, hv1c1]
  · -- `T v₁ ≠ T v₂` via `T` injective and `v₁ ≠ v₂`.
    intro heq
    exact S.triangle.v12_ne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

end CB1V3AnchorFrame

/- ### The v₁-anchor faithful frame

The v₁-anchored dead pairs `{a₁,b₁}`, `{v₃,a₁}`, `{v₃,b₁}` (handproof §4
"v₁-anchored", census §2.3) are killed by `bisectorKill` with anchor
`B := T v₁ = (0,0)`.  The faithful frame (chart `T`, scalars `c, sg, Oy`, MEC
disk facts, cap-`C₂` lower signs) is **identical** to `CB1V3AnchorFrame`, so we
reuse it verbatim as the `base` field and only add the v₁-specific facts:

* `a₁, b₁, v₃ ∈ circle(v₁, 1)` (the chart radius-`1` memberships) — the B3
  `hcard` content: with `4 ≤ (witnessClassAt_v1 r).card` the v₁-class is exactly
  `{a₁, b₁, b₃, v₃}` (`coreSelector_v1` gives `I1 ⊆ class`, the `hbranch` pins
  put `b₃, v₃` in it), so every member sits at `v₁`-distance `r`, which the
  chart scales to `1` since `|v₁v₃| = r` is the unit base edge;
* `a₁, b₁` cap-`C₁` `y`-positivity (`0 < (T a₁) 1`, `0 < (T b₁) 1`), via the
  same `same_open_side_as_v2` idiom as `a₃` but on the `C₁` cap.

The `bisectorKill` `hinner` reduction `−½·d_x − Oy·d_y < 0` needs no
`x`-positivity: each circle(v₁,1) member also lies in the MEC disk, which (with
`v₁` on the disk boundary) forces `p_x ≥ 1 − 2·Oy·p_y`, hence
`½·d_x + Oy·d_y ≥ 1 > 0` for every dead pair. -/

/-- The `C₁` interior point `p ∈ I₁` lands strictly above the base line:
`0 < (T p) 1`.  (Generic over `p ∈ I₁`; used for both `a₁` and `b₁`.)  Same
idiom as `frame_a3_upper`, on the `C₁` cap via `c1_vertex_same_open_side_as_v2`. -/
private theorem frame_c1_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv3 : T S.triangle.v3 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v2) 1)
    (hpI1 : p ∈ S.I1) :
    0 < (T p) 1 := by
  have hside := S.c1_vertex_same_open_side_as_v2 hpI1
  have hy := chart_y_product (T := T) tau (p := p) (q := S.triangle.v2) hv1 hv3
  have hpos : 0 < (T p) 1 * (T S.triangle.v2) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith [hpos, hsg_pos]

/-- **The v₁-anchor faithful frame.**  Carries a `CB1V3AnchorFrame` (the shared
faithful frame — same chart `T`, scalars `c, sg, Oy`, MEC disk facts, cap-`C₂`
lower signs) plus the v₁-anchor-specific facts: the `circle(v₁, 1)` memberships
of `a₁, b₁, v₃`, the cap-`C₁` `y`-positivity of `a₁, b₁`, and `a₁, b₁ ∈ A`. -/
structure CB1V1AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  /-- The shared faithful frame (chart, scalars, MEC, disk, cap-`C₂`). -/
  base : CB1V3AnchorFrame S Z
  /-- `a₁ ∈ A`. -/
  ha1A : Z.a1 ∈ A
  /-- `b₁ ∈ A`. -/
  hb1A : Z.b1 ∈ A
  /-- `a₁` on `circle(v₁, 1)`. -/
  hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1
  /-- `b₁` on `circle(v₁, 1)`. -/
  hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1
  /-- `v₃` on `circle(v₁, 1)` (the unit base edge). -/
  hcirc_v3 : dist (base.T S.triangle.v1) (base.T S.triangle.v3) = 1
  /-- `a₁` strictly upper (cap-`C₁` `y`-sign). -/
  ha1_y : 0 < (base.T Z.a1) 1
  /-- `b₁` strictly upper (cap-`C₁` `y`-sign). -/
  hb1_y : 0 < (base.T Z.b1) 1

/-- **The v₁-anchor faithful-frame producer.**  From the row's C₂-pin
`hC2pin` (which puts `v₃` into the v₁-class at radius `r` — the `hbranch`'s
`FormBv1B2Packet` C₂ component), the cardinality hypothesis `hcard` (which, via
`coreSelector_v1`, forces `I1 = {a₁, b₁}` into the v₁-class), and the
exact-packet hypothesis `hexact` (for the shared frame), build the
`CB1V1AnchorFrame`.  Stated on the bare C₂-pin (rather than the downstream
`FormBv1B2SelectorV2Qv1Packet`, which is defined in the importing
`N4dFormBXb3UpperArc` module) so this producer stays upstream of the packet
restatements; the target theorem supplies the pin by destructuring `hbranch`. -/
noncomputable def cb1_v1AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {r s : ℝ}
    (hC2pin : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    CB1V1AnchorFrame S Z := by
  classical
  let base := S.cb1_v3AnchorFrame_of_hexact Z hexact
  -- `v₃ ∈ witnessClassAt_v1 r` (from the C₂-pin) ⟹ `|v₁v₃| = r`.
  have hv3_in : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
    have hmem : S.triangle.v3 ∈ S.witnessClassAt_v1 r ∩ S.CP.C2 := by
      rw [hC2pin]; simp
    exact (Finset.mem_inter.mp hmem).1
  have hv1v3 : dist S.triangle.v1 S.triangle.v3 = r :=
    (Finset.mem_filter.mp hv3_in).2
  have hr : 0 < r := by
    rw [← hv1v3]; exact dist_pos.mpr S.triangle.v13_ne
  -- `I1 ⊆ witnessClassAt_v1 r` (core selector), so `a₁, b₁` are at radius `r`.
  have hcore := S.coreSelector_v1 hr hcard
  have hI1sub : S.I1 ⊆ S.witnessClassAt_v1 r := hcore.2.1
  have ha1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
  have hb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
  have ha1_in : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
  have hb1_in : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
  have ha1A : Z.a1 ∈ A := (Finset.mem_filter.mp ha1_in).1
  have hb1A : Z.b1 ∈ A := (Finset.mem_filter.mp hb1_in).1
  have hv1a1 : dist S.triangle.v1 Z.a1 = r := (Finset.mem_filter.mp ha1_in).2
  have hv1b1 : dist S.triangle.v1 Z.b1 = r := (Finset.mem_filter.mp hb1_in).2
  -- Chart scale pin: `tau.scale * r = 1` (the base edge `|v₁v₃| = r` is unit).
  have hscale : base.tau.scale * r = 1 := by
    have hbase : dist (base.T S.triangle.v1) (base.T S.triangle.v3)
        = base.tau.scale * r := by
      rw [base.tau.dist_image, hv1v3]
    have hone : dist (base.T S.triangle.v1) (base.T S.triangle.v3) = 1 := by
      rw [base.hv1, base.hv3, dist_vec2_00_10]
    rw [← hbase, hone]
  -- Transport the three `circle(v₁, r)` memberships into chart `circle(v₁, 1)`.
  have hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1 := by
    rw [base.tau.dist_image, hv1a1, hscale]
  have hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1 := by
    rw [base.tau.dist_image, hv1b1, hscale]
  have hcirc_v3 : dist (base.T S.triangle.v1) (base.T S.triangle.v3) = 1 := by
    rw [base.tau.dist_image, hv1v3, hscale]
  -- Cap-`C₁` `y`-positivity of `a₁, b₁`.
  have hsg_pos : 0 < (base.T S.triangle.v2) 1 := by rw [base.hv2, vec2_coord1]; exact base.hsg_pos
  have ha1_y : 0 < (base.T Z.a1) 1 :=
    S.frame_c1_upper base.tau base.hv1 base.hv3 hsg_pos ha1I1
  have hb1_y : 0 < (base.T Z.b1) 1 :=
    S.frame_c1_upper base.tau base.hv1 base.hv3 hsg_pos hb1I1
  exact
    { base := base
      ha1A := ha1A
      hb1A := hb1A
      hcirc_a1 := hcirc_a1
      hcirc_b1 := hcirc_b1
      hcirc_v3 := hcirc_v3
      ha1_y := ha1_y
      hb1_y := hb1_y }

namespace CB1V1AnchorFrame

variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}

/-- `bisectorKill`'s `hBy0`: the v₁-anchor's `y`-coordinate is `0`. -/
theorem anchor_y_zero (F : CB1V1AnchorFrame S Z) : (F.base.T S.triangle.v1) 1 = 0 := by
  rw [F.base.hv1, vec2_coord1]

/-- `bisectorKill`'s `hXdisk`: any `A`-point `x` lies in the closed MEC disk,
whose boundary contains the anchor `v₁` — so `dist (T x) (T O) ≤ dist (T v₁) (T O)`. -/
theorem x_dist_le_anchor (F : CB1V1AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.base.T x) (F.base.T S.Packet.center)
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := by
  have hX := F.base.hdisk x hx
  -- `v₁` on the MEC circle: `dist (T v₁) (T O)² = ¼ + Oy²`.
  have hv1_on_mec : dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2
      = 1 / 4 + F.base.Oy ^ 2 := by
    rw [dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, F.base.hO,
      vec2_coord0, vec2_coord1, vec2_coord0, vec2_coord1]
    ring
  have h : dist (F.base.T x) (F.base.T S.Packet.center) ^ 2
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2 := by
    rw [hv1_on_mec]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.base.T x) (F.base.T S.Packet.center) := dist_nonneg
  have hv1nn : (0 : ℝ) ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := dist_nonneg
  nlinarith [h, hXnn, hv1nn]

/-- The disk-bound `x`-floor for a `circle(v₁, 1)` point `p`: with `v₁ = (0,0)`,
`O = (½, Oy)` and `p` in the closed MEC disk, `p_x ≥ 1 − 2·Oy·p_y`.  (`hinner`
needs no cap-`C₁` `x`-positivity — this disk floor alone yields
`½·d_x + Oy·d_y ≥ 1` for every dead pair.) -/
theorem circ_disk_x_floor (F : CB1V1AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.base.T S.triangle.v1) (F.base.T p) = 1) :
    1 - 2 * F.base.Oy * (F.base.T p) 1 ≤ (F.base.T p) 0 := by
  -- unit-circle pin in chart: `p_x² + p_y² = 1`.
  have hunit : (F.base.T p) 0 ^ 2 + (F.base.T p) 1 ^ 2 = 1 := by
    have h : dist (F.base.T S.triangle.v1) (F.base.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, vec2_coord0, vec2_coord1] at h
    nlinarith [h]
  -- closed-disk pin in chart: `(p_x − ½)² + (p_y − Oy)² ≤ ¼ + Oy²`.
  have hdisk := F.base.hdisk p hpA
  rw [dist_sq_eq_coord_sq_add_coord_sq, F.base.hO, vec2_coord0, vec2_coord1] at hdisk
  nlinarith [hunit, hdisk]

/-- A `circle(v₁,1)` point `p` is distinct from the anchor `v₁` (the centre,
`dist v₁ v₁ = 0 ≠ 1`). -/
theorem circ_ne_anchor (F : CB1V1AnchorFrame S Z) {p : ℝ²}
    (hp : dist (F.base.T S.triangle.v1) (F.base.T p) = 1) :
    F.base.T p ≠ F.base.T S.triangle.v1 := by
  intro heq
  rw [heq, dist_self] at hp
  exact one_ne_zero hp.symm

/-- The chart is injective (inherited from the base frame's positive-scale
similarity). -/
theorem T_injective (F : CB1V1AnchorFrame S Z) : Function.Injective F.base.T :=
  F.base.T_injective

/- ### The three v₁-anchor `bisectorKill` argument bundles

For each dead pair `(P, Q) ∈ {(a₁, b₁), (v₃, a₁), (v₃, b₁)}` and each lower
point `x` (`a₂` or `b₂`), the lemmas below package **every** hypothesis of
`Problem97.bisectorKill (F.base.T v₁) (F.base.T O) (F.base.T P) (F.base.T Q)
(F.base.T x)` **except `hXeq`** (the K4-equidistance demand the cover slice
supplies): `hXdisk`, `hBeq`, `hBy0`, `hXy`, `hdy`, `hinner`, `hPQ`, `hXne`.

The cover slice then closes the row with
`Problem97.bisectorKill _ _ _ _ _ hXdisk hXeq hBeq hBy0 hXy hdy hinner hPQ hXne`. -/

/-- **`bisectorKill` argument bundle, dead pair `{a₁, b₁}`.**  `B := T v₁`,
`O := T O`, `P := T a₁`, `Q := T b₁`, `X := T x` for a lower point `x ∈ A`
distinct from `v₁`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_a1b1 (F : CB1V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T Z.a1)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.b1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T Z.a1) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.b1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T Z.a1 ≠ F.base.T Z.b1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, vec2_coord1]
  have ha1y : 0 < (F.base.T Z.a1) 1 := F.ha1_y
  have hb1y : 0 < (F.base.T Z.b1) 1 := F.hb1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have ha1floor : 1 - 2 * F.base.Oy * (F.base.T Z.a1) 1 ≤ (F.base.T Z.a1) 0 :=
    F.circ_disk_x_floor F.ha1A F.hcirc_a1
  have hb1floor : 1 - 2 * F.base.Oy * (F.base.T Z.b1) 1 ≤ (F.base.T Z.b1) 0 :=
    F.circ_disk_x_floor F.hb1A F.hcirc_b1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_a1, F.hcirc_b1]
  · rw [hv1c1]; linarith [ha1y, hb1y]
  · rw [hv1c0, hv1c1, hOc0, hOc1]
    nlinarith [ha1floor, hb1floor, ha1y, hb1y, hOy]
  · -- `T a₁ ≠ T b₁` from `a₁ ≠ b₁` (`I1.card = 2`) and `T` injective.
    intro heq
    have ha1_ne_b1 : Z.a1 ≠ Z.b1 := by
      have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
        simpa [Z.hI1] using S.I1_card_eq_two
      intro h; simp [h] at hI1card
    exact ha1_ne_b1 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₃, a₁}`.**  `B := T v₁`,
`O := T O`, `P := T v₃`, `Q := T a₁`, `X := T x` for a lower point `x ∈ A`
distinct from `v₁`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v3a1 (F : CB1V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v3)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.a1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v3) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.a1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v3 ≠ F.base.T Z.a1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, vec2_coord1]
  have hv3c0 : (F.base.T S.triangle.v3) 0 = 1 := by rw [F.base.hv3, vec2_coord0]
  have hv3c1 : (F.base.T S.triangle.v3) 1 = 0 := by rw [F.base.hv3, vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, vec2_coord1]
  have ha1y : 0 < (F.base.T Z.a1) 1 := F.ha1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have ha1floor : 1 - 2 * F.base.Oy * (F.base.T Z.a1) 1 ≤ (F.base.T Z.a1) 0 :=
    F.circ_disk_x_floor F.ha1A F.hcirc_a1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_a1]
  · rw [hv1c1, hv3c1]; linarith [ha1y]
  · rw [hv1c0, hv1c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [ha1floor, ha1y, hOy]
  · refine ⟨?_, ?_⟩
    · -- `T v₃ ≠ T a₁`: `a₁ ∈ I1` excludes `v₃`, via `T` injective.
      intro heq
      have ha1_ne_v3 : Z.a1 ≠ S.triangle.v3 := by
        have ha1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
        exact (Finset.mem_erase.mp ha1I1).1
      exact ha1_ne_v3 (F.T_injective heq.symm)
    · intro heq
      exact hxne (F.T_injective heq)

/-- **`bisectorKill` argument bundle, dead pair `{v₃, b₁}`.**  `B := T v₁`,
`O := T O`, `P := T v₃`, `Q := T b₁`, `X := T x` for a lower point `x ∈ A`
distinct from `v₁`.  Supplies every `bisectorKill` hypothesis except `hXeq`. -/
theorem bisectorKill_args_v3b1 (F : CB1V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v3)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.b1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v3) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.b1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v3) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v3 ≠ F.base.T Z.b1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, vec2_coord1]
  have hv3c0 : (F.base.T S.triangle.v3) 0 = 1 := by rw [F.base.hv3, vec2_coord0]
  have hv3c1 : (F.base.T S.triangle.v3) 1 = 0 := by rw [F.base.hv3, vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, vec2_coord1]
  have hb1y : 0 < (F.base.T Z.b1) 1 := F.hb1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have hb1floor : 1 - 2 * F.base.Oy * (F.base.T Z.b1) 1 ≤ (F.base.T Z.b1) 0 :=
    F.circ_disk_x_floor F.hb1A F.hcirc_b1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_b1]
  · rw [hv1c1, hv3c1]; linarith [hb1y]
  · rw [hv1c0, hv1c1, hv3c0, hv3c1, hOc0, hOc1]
    nlinarith [hb1floor, hb1y, hOy]
  · refine ⟨?_, ?_⟩
    · -- `T v₃ ≠ T b₁`: `b₁ ∈ I1` excludes `v₃`, via `T` injective.
      intro heq
      have hb1_ne_v3 : Z.b1 ≠ S.triangle.v3 := by
        have hb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
        exact (Finset.mem_erase.mp hb1I1).1
      exact hb1_ne_v3 (F.T_injective heq.symm)
    · intro heq
      exact hxne (F.T_injective heq)

end CB1V1AnchorFrame

private theorem classify_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I1) :
    p ∈ A ∧ p ∈ S.CP.C1 ∧ p ∉ S.CP.C3 ∧ p ∉ S.CP.C2 := by
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
  · intro hC3; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
  · intro hC2; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone

/-- A point `p ∈ I₃` is a non-Moser point lying in cap `C₃` alone. -/
private theorem classify_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I3) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∈ S.CP.C3 ∧ p ∉ S.CP.C2 := by
  have hC3 : p ∈ S.CP.C3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp hp).1
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne3 : p ≠ S.triangle.v3 := fun h => S.CP.v3_notin_C3 (h ▸ hC3)
  have hA : p ∈ A := S.CP.C3_subset hC3
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, hC3, ?_⟩
  · intro hC1; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
  · intro hC2; simp only [hC3, hC2, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone

/-- A point `p ∈ I₂` is a non-Moser point lying in cap `C₂` alone. -/
private theorem classify_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I2) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∉ S.CP.C3 ∧ p ∈ S.CP.C2 := by
  have hC2 : p ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp hp).1
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne2 : p ≠ S.triangle.v2 := fun h => S.CP.v2_notin_C2 (h ▸ hC2)
  have hA : p ∈ A := S.CP.C2_subset hC2
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, ?_, hC2⟩
  · intro hC1; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC3, hC2, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone

/-- Two points distinguished by membership in a common finset are distinct. -/
private theorem ne_of_mem_not_mem {α : Type*} {C : Finset α} {p q : α}
    (hp : p ∈ C) (hq : q ∉ C) : p ≠ q := fun h => hq (h ▸ hp)

/- ### `A` is exactly the nine named points -/

/-- **The nine named points exhaust `A`.**  In the zero-defect `(4,4,4)` shell,
`A = {v₁, v₃, v₂, a₁, b₁, a₃, b₃, a₂, b₂}` — nine distinct points (three Moser
vertices, each in two caps; six cap-interior points, each in one cap).  This is
the finiteness backbone of the K4 cover: a K4-class at `a₂` draws from these
nine, and (excluding `a₂` itself) from the other eight. -/
private theorem cb1_A_eq_named {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    A = ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3, Z.a2, Z.b2}
      : Finset ℝ²) := by
  classical
  have ha1 := S.classify_I1 (show Z.a1 ∈ S.I1 by rw [Z.hI1]; simp)
  have hb1 := S.classify_I1 (show Z.b1 ∈ S.I1 by rw [Z.hI1]; simp)
  have ha3 := S.classify_I3 (show Z.a3 ∈ S.I3 by rw [Z.hI3]; simp)
  have hb3 := S.classify_I3 (show Z.b3 ∈ S.I3 by rw [Z.hI3]; simp)
  have ha2 := S.classify_I2 (show Z.a2 ∈ S.I2 by rw [Z.hI2]; simp)
  have hb2 := S.classify_I2 (show Z.b2 ∈ S.I2 by rw [Z.hI2]; simp)
  -- vertex cap profiles
  have v1c1 : S.triangle.v1 ∉ S.CP.C1 := S.CP.v1_notin_C1
  have v1c2 : S.triangle.v1 ∈ S.CP.C3 := S.CP.v1_mem_C3
  have v1c3 : S.triangle.v1 ∈ S.CP.C2 := S.CP.v1_mem_C2
  have v3c1 : S.triangle.v3 ∈ S.CP.C1 := S.CP.v3_mem_C1
  have v3c2 : S.triangle.v3 ∉ S.CP.C3 := S.CP.v3_notin_C3
  have v3c3 : S.triangle.v3 ∈ S.CP.C2 := S.CP.v3_mem_C2
  have v2c1 : S.triangle.v2 ∈ S.CP.C1 := S.CP.v2_mem_C1
  have v2c2 : S.triangle.v2 ∈ S.CP.C3 := S.CP.v2_mem_C3
  have v2c3 : S.triangle.v2 ∉ S.CP.C2 := S.CP.v2_notin_C2
  obtain ⟨_, a1c1, a1c2, a1c3⟩ := ha1
  obtain ⟨_, b1c1, b1c2, b1c3⟩ := hb1
  obtain ⟨_, a3c1, a3c2, a3c3⟩ := ha3
  obtain ⟨_, b3c1, b3c2, b3c3⟩ := hb3
  obtain ⟨_, a2c1, a2c2, a2c3⟩ := ha2
  obtain ⟨_, b2c1, b2c2, b2c3⟩ := hb2
  -- same-cap interior disequalities
  have e_a1b1 : Z.a1 ≠ Z.b1 := by
    have h : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by simpa [Z.hI1] using S.I1_card_eq_two
    intro h'; simp [h'] at h
  have e_a3b3 : Z.a3 ≠ Z.b3 := by
    have h : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by simpa [Z.hI3] using S.I3_card_eq_two
    intro h'; simp [h'] at h
  have e_a2b2 : Z.a2 ≠ Z.b2 := by
    have h : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by simpa [Z.hI2] using S.I2_card_eq_two
    intro h'; simp [h'] at h
  -- the remaining 33 disequalities, each via a distinguishing cap
  have e_v1v3 : S.triangle.v1 ≠ S.triangle.v3 := ne_of_mem_not_mem v1c2 v3c2
  have e_v1v2 : S.triangle.v1 ≠ S.triangle.v2 := ne_of_mem_not_mem v1c3 v2c3
  have e_v1a1 : S.triangle.v1 ≠ Z.a1 := ne_of_mem_not_mem v1c2 a1c2
  have e_v1b1 : S.triangle.v1 ≠ Z.b1 := ne_of_mem_not_mem v1c2 b1c2
  have e_v1a3 : S.triangle.v1 ≠ Z.a3 := ne_of_mem_not_mem v1c3 a3c3
  have e_v1b3 : S.triangle.v1 ≠ Z.b3 := ne_of_mem_not_mem v1c3 b3c3
  have e_v1a2 : S.triangle.v1 ≠ Z.a2 := ne_of_mem_not_mem v1c2 a2c2
  have e_v1b2 : S.triangle.v1 ≠ Z.b2 := ne_of_mem_not_mem v1c2 b2c2
  have e_v3v2 : S.triangle.v3 ≠ S.triangle.v2 := ne_of_mem_not_mem v3c3 v2c3
  have e_v3a1 : S.triangle.v3 ≠ Z.a1 := ne_of_mem_not_mem v3c3 a1c3
  have e_v3b1 : S.triangle.v3 ≠ Z.b1 := ne_of_mem_not_mem v3c3 b1c3
  have e_v3a3 : S.triangle.v3 ≠ Z.a3 := ne_of_mem_not_mem v3c1 a3c1
  have e_v3b3 : S.triangle.v3 ≠ Z.b3 := ne_of_mem_not_mem v3c1 b3c1
  have e_v3a2 : S.triangle.v3 ≠ Z.a2 := ne_of_mem_not_mem v3c1 a2c1
  have e_v3b2 : S.triangle.v3 ≠ Z.b2 := ne_of_mem_not_mem v3c1 b2c1
  have e_v2a1 : S.triangle.v2 ≠ Z.a1 := ne_of_mem_not_mem v2c2 a1c2
  have e_v2b1 : S.triangle.v2 ≠ Z.b1 := ne_of_mem_not_mem v2c2 b1c2
  have e_v2a3 : S.triangle.v2 ≠ Z.a3 := ne_of_mem_not_mem v2c1 a3c1
  have e_v2b3 : S.triangle.v2 ≠ Z.b3 := ne_of_mem_not_mem v2c1 b3c1
  have e_v2a2 : S.triangle.v2 ≠ Z.a2 := ne_of_mem_not_mem v2c1 a2c1
  have e_v2b2 : S.triangle.v2 ≠ Z.b2 := ne_of_mem_not_mem v2c1 b2c1
  have e_a1a3 : Z.a1 ≠ Z.a3 := ne_of_mem_not_mem a1c1 a3c1
  have e_a1b3 : Z.a1 ≠ Z.b3 := ne_of_mem_not_mem a1c1 b3c1
  have e_a1a2 : Z.a1 ≠ Z.a2 := ne_of_mem_not_mem a1c1 a2c1
  have e_a1b2 : Z.a1 ≠ Z.b2 := ne_of_mem_not_mem a1c1 b2c1
  have e_b1a3 : Z.b1 ≠ Z.a3 := ne_of_mem_not_mem b1c1 a3c1
  have e_b1b3 : Z.b1 ≠ Z.b3 := ne_of_mem_not_mem b1c1 b3c1
  have e_b1a2 : Z.b1 ≠ Z.a2 := ne_of_mem_not_mem b1c1 a2c1
  have e_b1b2 : Z.b1 ≠ Z.b2 := ne_of_mem_not_mem b1c1 b2c1
  have e_a3a2 : Z.a3 ≠ Z.a2 := ne_of_mem_not_mem a3c2 a2c2
  have e_a3b2 : Z.a3 ≠ Z.b2 := ne_of_mem_not_mem a3c2 b2c2
  have e_b3a2 : Z.b3 ≠ Z.a2 := ne_of_mem_not_mem b3c2 a2c2
  have e_b3b2 : Z.b3 ≠ Z.b2 := ne_of_mem_not_mem b3c2 b2c2
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact S.triangle.v1_mem
    · exact S.triangle.v3_mem
    · exact S.triangle.v2_mem
    · exact S.CP.C1_subset a1c1
    · exact S.CP.C1_subset b1c1
    · exact S.CP.C3_subset a3c2
    · exact S.CP.C3_subset b3c2
    · exact S.CP.C2_subset a2c3
    · exact S.CP.C2_subset b2c3
  · rw [S.hcard9]
    have hcard :
        ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3, Z.a2, Z.b2}
          : Finset ℝ²).card = 9 := by
      rw [Finset.card_insert_of_notMem (by
            simp [e_v1v3, e_v1v2, e_v1a1, e_v1b1, e_v1a3, e_v1b3, e_v1a2, e_v1b2]),
          Finset.card_insert_of_notMem (by
            simp [e_v3v2, e_v3a1, e_v3b1, e_v3a3, e_v3b3, e_v3a2, e_v3b2]),
          Finset.card_insert_of_notMem (by
            simp [e_v2a1, e_v2b1, e_v2a3, e_v2b3, e_v2a2, e_v2b2]),
          Finset.card_insert_of_notMem (by simp [e_a1b1, e_a1a3, e_a1b3, e_a1a2, e_a1b2]),
          Finset.card_insert_of_notMem (by simp [e_b1a3, e_b1b3, e_b1a2, e_b1b2]),
          Finset.card_insert_of_notMem (by simp [e_a3b3, e_a3a2, e_a3b2]),
          Finset.card_insert_of_notMem (by simp [e_b3a2, e_b3b2]),
          Finset.card_insert_of_notMem (by simp [e_a2b2]),
          Finset.card_singleton]
    rw [hcard]

/- ### Transporting `hXeq` through the similarity chart

For a dead pair `{P, Q}` with `a₂` at distance `r` from both, the K4-equidistance
`dist a₂ P = dist a₂ Q` transports through the (positive-scale) chart `T` to the
chart equidistance `bisectorKill` consumes as `hXeq`. -/

/-- Transport `dist x P = dist x Q` through a v₃-anchor chart. -/
private theorem hXeq_transport_v3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.T x) (F.T P) = dist (F.T x) (F.T Q) := by
  rw [F.tau.dist_image, F.tau.dist_image, hP, hQ]

/-- Transport `dist x P = dist x Q` through a v₁-anchor chart. -/
private theorem hXeq_transport_v1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.base.T x) (F.base.T P) = dist (F.base.T x) (F.base.T Q) := by
  rw [F.base.tau.dist_image, F.base.tau.dist_image, hP, hQ]

/- ### The nine per-pair `bisectorKill` kills at `a₂`

Each takes the standing `a₂`-facts (`a₂ ∈ A`, the cap-`C₂` lower sign in the
relevant frame, and `a₂ ≠` the anchor) plus the two `circle(a₂, r)` distance
pins of the pair, and closes `False` via the banked `bisectorKill`. -/

/-- Kill the v₃-anchor dead pair `{v₁, a₃}` at `a₂`. -/
private theorem kill_v1a3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v1 = r) (hQ : dist Z.a2 Z.a3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1a3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.a3) (F.T Z.a2)
    hXdisk (hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₃-anchor dead pair `{v₂, a₃}` at `a₂`. -/
private theorem kill_v2a3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v2 = r) (hQ : dist Z.a2 Z.a3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2a3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v2) (F.T Z.a3) (F.T Z.a2)
    hXdisk (hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₃-anchor dead pair `{v₁, b₃}` at `a₂`. -/
private theorem kill_v1b3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v1 = r) (hQ : dist Z.a2 Z.b3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1b3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.b3) (F.T Z.a2)
    hXdisk (hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₃-anchor dead pair `{v₂, b₃}` at `a₂`. -/
private theorem kill_v2b3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v2 = r) (hQ : dist Z.a2 Z.b3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2b3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v2) (F.T Z.b3) (F.T Z.a2)
    hXdisk (hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₃-anchor dead pair `{a₃, b₃}` at `a₂`. -/
private theorem kill_a3b3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 Z.a3 = r) (hQ : dist Z.a2 Z.b3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a3b3 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T Z.a3) (F.T Z.b3) (F.T Z.a2)
    hXdisk (hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₃-anchor dead pair `{v₁, v₂}` at `a₂`. -/
private theorem kill_v1v2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    (hP : dist Z.a2 S.triangle.v1 = r) (hQ : dist Z.a2 S.triangle.v2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1v2 ha2A ha2y ha2v3
  exact Problem97.bisectorKill (F.T S.triangle.v3) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T S.triangle.v2) (F.T Z.a2)
    hXdisk (hXeq_transport_v3 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₁-anchor dead pair `{a₁, b₁}` at `a₂`. -/
private theorem kill_a1b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    (hP : dist Z.a2 Z.a1 = r) (hQ : dist Z.a2 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a1b1 ha2A ha2y ha2v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T Z.a1) (F.base.T Z.b1) (F.base.T Z.a2)
    hXdisk (hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₁-anchor dead pair `{v₃, a₁}` at `a₂`. -/
private theorem kill_v3a1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    (hP : dist Z.a2 S.triangle.v3 = r) (hQ : dist Z.a2 Z.a1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3a1 ha2A ha2y ha2v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v3) (F.base.T Z.a1) (F.base.T Z.a2)
    hXdisk (hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₁-anchor dead pair `{v₃, b₁}` at `a₂`. -/
private theorem kill_v3b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    (hP : dist Z.a2 S.triangle.v3 = r) (hQ : dist Z.a2 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3b1 ha2A ha2y ha2v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v3) (F.base.T Z.b1) (F.base.T Z.a2)
    hXdisk (hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/- ### The 70-subset cover, factored through the two dead-pair cliques

The nine dead pairs split into two complete "cliques" plus a free vertex:

* `KA := {v₁, v₂, a₃, b₃}` — **all six** of its pairs are v₃-anchor dead pairs;
* `KB := {a₁, b₁, v₃}` — **all three** of its pairs are v₁-anchor dead pairs;
* `b₂` — in no dead pair.

So a `circle(a₂, r)` class `T` with no dead pair meets `KA` in ≤ 1 point and
`KB` in ≤ 1 point, hence `|T| ≤ |T∩KA| + |T∩KB| + |T∩{b₂}| ≤ 3`.  A K4-class
has `|T| ≥ 4`, so `T` meets one clique twice — yielding a dead pair, killed by
`bisectorKill`.  This is the entire `C(8,4) = 70` cover, branch-independent. -/

/-- Two distinct `KA`-members at common radius `r` from `a₂` give `False` (every
`KA` pair is a v₃-anchor dead pair). -/
private theorem kill_KA {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V3AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.T Z.a2) 1 ≤ 0) (ha2v3 : Z.a2 ≠ S.triangle.v3)
    {p q : ℝ²}
    (hp : p ∈ ({S.triangle.v1, S.triangle.v2, Z.a3, Z.b3} : Finset ℝ²))
    (hq : q ∈ ({S.triangle.v1, S.triangle.v2, Z.a3, Z.b3} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a2 p = r) (hqr : dist Z.a2 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl | rfl
  · exact hpq rfl
  · exact kill_v1v2 F ha2A ha2y ha2v3 hpr hqr
  · exact kill_v1a3 F ha2A ha2y ha2v3 hpr hqr
  · exact kill_v1b3 F ha2A ha2y ha2v3 hpr hqr
  · exact kill_v1v2 F ha2A ha2y ha2v3 hqr hpr
  · exact hpq rfl
  · exact kill_v2a3 F ha2A ha2y ha2v3 hpr hqr
  · exact kill_v2b3 F ha2A ha2y ha2v3 hpr hqr
  · exact kill_v1a3 F ha2A ha2y ha2v3 hqr hpr
  · exact kill_v2a3 F ha2A ha2y ha2v3 hqr hpr
  · exact hpq rfl
  · exact kill_a3b3 F ha2A ha2y ha2v3 hpr hqr
  · exact kill_v1b3 F ha2A ha2y ha2v3 hqr hpr
  · exact kill_v2b3 F ha2A ha2y ha2v3 hqr hpr
  · exact kill_a3b3 F ha2A ha2y ha2v3 hqr hpr
  · exact hpq rfl

/-- Two distinct `KB`-members at common radius `r` from `a₂` give `False` (every
`KB` pair is a v₁-anchor dead pair). -/
private theorem kill_KB {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : CB1V1AnchorFrame S Z) {r : ℝ}
    (ha2A : Z.a2 ∈ A) (ha2y : (F.base.T Z.a2) 1 ≤ 0) (ha2v1 : Z.a2 ≠ S.triangle.v1)
    {p q : ℝ²}
    (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hq : q ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a2 p = r) (hqr : dist Z.a2 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl
  · exact hpq rfl
  · exact kill_a1b1 F ha2A ha2y ha2v1 hpr hqr
  · exact kill_v3a1 F ha2A ha2y ha2v1 hqr hpr
  · exact kill_a1b1 F ha2A ha2y ha2v1 hqr hpr
  · exact hpq rfl
  · exact kill_v3b1 F ha2A ha2y ha2v1 hqr hpr
  · exact kill_v3a1 F ha2A ha2y ha2v1 hpr hqr
  · exact kill_v3b1 F ha2A ha2y ha2v1 hpr hqr
  · exact hpq rfl

/- ### The top-level cover theorem -/

/-- **The `a₂` K4 cover.**  From the row's frame inputs — `hexact` (giving the
v₃-anchor frame and the `circle(v₃,1)` pins of `v₁,v₂,a₃,b₃`), `hC2pin`+`hcard`
(giving the v₁-anchor frame and the `circle(v₁,1)` pins of `a₁,b₁,v₃`) — the
shell's per-vertex K4 demand at the cap-`C₂` interior point `a₂` is
unsatisfiable.

No four of the other eight named points are equidistant from `a₂`: the
`circle(a₂, r)` class meets the dead-pair clique `{v₁,v₂,a₃,b₃}` (all v₃-anchor
dead pairs) in ≤ 1 point and `{a₁,b₁,v₃}` (all v₁-anchor dead pairs) in ≤ 1
point, so it has ≤ 3 members — but K4 demands ≥ 4.  Branch-independent: no
`hpacket` / p-branch is consulted. -/
private theorem cb1_a2_k4_cover {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC2pin : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v3 s =
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))) :
    False := by
  classical
  -- the two faithful frames
  let F2 := S.cb1_v3AnchorFrame_of_hexact Z hexact
  let F1 := S.cb1_v1AnchorFrame_of_hexact Z hC2pin hcard hexact
  -- `a₂`'s standing facts (cap-`C₂` interior, off the two anchors)
  have ha2I2 : Z.a2 ∈ S.I2 := by rw [Z.hI2]; simp
  obtain ⟨ha2A, _, _, _⟩ := S.classify_I2 ha2I2
  -- `a₂ ≠ v₁`, `a₂ ≠ v₃` from the `I₂ = (C₂.erase v₁).erase v₃` exclusion
  have ha2ne : Z.a2 ≠ S.triangle.v1 ∧ Z.a2 ≠ S.triangle.v3 := by
    have hne1 : Z.a2 ≠ S.triangle.v1 := (Finset.mem_erase.mp ha2I2).1
    have hne3 : Z.a2 ≠ S.triangle.v3 :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp ha2I2).2).1
    exact ⟨hne1, hne3⟩
  -- K4 at `a₂`: a same-radius class `T` of size ≥ 4
  obtain ⟨r2, hr2pos, hTcard⟩ := S.hK4 Z.a2 ha2A
  set T : Finset ℝ² := A.filter (fun x => dist Z.a2 x = r2) with hTdef
  have hT4 : 4 ≤ T.card := hTcard
  have ha2notT : Z.a2 ∉ T := by
    rw [hTdef]; simp only [Finset.mem_filter]
    rintro ⟨_, hd⟩; rw [dist_self] at hd; exact absurd hd.symm (ne_of_gt hr2pos)
  -- `T ⊆ {8 named}` (the nine named points minus `a₂`)
  have hTsub : T ⊆ ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3, Z.b2}
      : Finset ℝ²) := by
    intro x hxT
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    have hxne_a2 : x ≠ Z.a2 := fun h => ha2notT (h ▸ hxT)
    have hx9 : x ∈ ({S.triangle.v1, S.triangle.v3, S.triangle.v2, Z.a1, Z.b1, Z.a3, Z.b3,
        Z.a2, Z.b2} : Finset ℝ²) := by rw [← S.cb1_A_eq_named Z]; exact hxA
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx9 ⊢
    rcases hx9 with h|h|h|h|h|h|h|h|h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h)))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))))
    · exact absurd h hxne_a2
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr h))))))
  -- pigeonhole over the two cliques
  set KA : Finset ℝ² := {S.triangle.v1, S.triangle.v2, Z.a3, Z.b3} with hKA
  set KB : Finset ℝ² := {Z.a1, Z.b1, S.triangle.v3} with hKB
  have hpigeon : 2 ≤ (T ∩ KA).card ∨ 2 ≤ (T ∩ KB).card := by
    by_contra h
    push_neg at h
    obtain ⟨hAlt, hBlt⟩ := h
    have hsub : T ⊆ KA ∪ KB ∪ {Z.b2} := by
      intro x hx
      have := hTsub hx
      simp only [hKA, hKB, Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at this ⊢
      tauto
    have h1 : T ⊆ (T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b2}) := by
      intro x hx
      have := hsub hx
      simp only [Finset.mem_union, Finset.mem_inter] at this ⊢
      tauto
    have hb : (T ∩ {Z.b2}).card ≤ 1 := by
      calc (T ∩ {Z.b2}).card ≤ ({Z.b2} : Finset ℝ²).card :=
            Finset.card_le_card Finset.inter_subset_right
        _ = 1 := Finset.card_singleton _
    have hle3 : T.card ≤ 3 := by
      calc T.card ≤ ((T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b2})).card := Finset.card_le_card h1
        _ ≤ (T ∩ KA).card + (T ∩ KB).card + (T ∩ {Z.b2}).card := by
            refine le_trans (Finset.card_union_le _ _) ?_
            exact Nat.add_le_add_right (Finset.card_union_le _ _) _
        _ ≤ 3 := by omega
    omega
  -- in either case, extract two distinct class-members of a clique, then kill
  have ha2yF2 : (F2.T Z.a2) 1 ≤ 0 := F2.ha2_y
  have ha2yF1 : (F1.base.T Z.a2) 1 ≤ 0 := F1.base.ha2_y
  rcases hpigeon with hKA2 | hKB2
  · obtain ⟨p, hpKA, q, hqKA, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KA).card)
    have hpT := Finset.mem_of_mem_inter_left hpKA
    have hqT := Finset.mem_of_mem_inter_left hqKA
    have hpKA' := Finset.mem_of_mem_inter_right hpKA
    have hqKA' := Finset.mem_of_mem_inter_right hqKA
    have hpr : dist Z.a2 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a2 q = r2 := (Finset.mem_filter.mp hqT).2
    exact kill_KA F2 ha2A ha2yF2 ha2ne.2 hpKA' hqKA' hpq hpr hqr
  · obtain ⟨p, hpKB, q, hqKB, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KB).card)
    have hpT := Finset.mem_of_mem_inter_left hpKB
    have hqT := Finset.mem_of_mem_inter_left hqKB
    have hpKB' := Finset.mem_of_mem_inter_right hpKB
    have hqKB' := Finset.mem_of_mem_inter_right hqKB
    have hpr : dist Z.a2 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a2 q = r2 := (Finset.mem_filter.mp hqT).2
    exact kill_KB F1 ha2A ha2yF1 ha2ne.1 hpKB' hqKB' hpq hpr hqr

/-- The FormC `y = a3`, `q = v1` upper-arc branch is impossible. -/
theorem n4d_cB1_impossible_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC : S.IsFormC_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (ha3I3 : (Z.a3 : ℝ²) ∈ S.I3)
    (ha3C3 : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²))
    (hs : 0 < s)
    (hTcard : (S.witnessClassAt_v3 s).card = 4)
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 s)
    (q : ℝ²) (hq : q ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²))
    (hqC1 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({q} : Finset ℝ²))
    (hv1C2 : S.witnessClassAt_v3 s ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) :
    False := by
  classical
  have hCcopy := hC
  rcases hC with ⟨y, hyI3, hv3C2, hyC3⟩
  have hv3T1 : S.triangle.v3 ∈ S.witnessClassAt_v1 r := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hv3C2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hr : 0 < r := by
    have hv3dist : dist S.triangle.v1 S.triangle.v3 = r :=
      (Finset.mem_filter.mp hv3T1).2
    rw [← hv3dist]
    exact dist_pos.mpr S.triangle.v13_ne
  have hqC1_v2 : S.witnessClassAt_v3 s ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) := by
    exact S.selectorShape_v3_lower_forces_v2 Z hr hs hcard hCcopy ha3I3 ha3C3 hI3sub hq hqC1
  have ha3T : Z.a3 ∈ S.witnessClassAt_v3 s := hI3sub ha3I3
  have hb3T : Z.b3 ∈ S.witnessClassAt_v3 s := by
    have hb3I3 : Z.b3 ∈ S.I3 := by rw [Z.hI3]; simp
    exact hI3sub hb3I3
  have hv2T : S.triangle.v2 ∈ S.witnessClassAt_v3 s := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hqC1_v2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hv1T : S.triangle.v1 ∈ S.witnessClassAt_v3 s := by
    have hmem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hv1C2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hsubset :
      S.witnessClassAt_v3 s ⊆
        insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²)) := by
    intro x hxT
    by_cases hxI3 : x ∈ S.I3
    · rw [Z.hI3] at hxI3
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxI3 ⊢
      rcases hxI3 with rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr (Or.inl rfl)
    · have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
      by_cases hxC1 : x ∈ S.CP.C1
      · have hxmem : x ∈ S.witnessClassAt_v3 s ∩ S.CP.C1 :=
          Finset.mem_inter.mpr ⟨hxT, hxC1⟩
        rw [hqC1_v2] at hxmem
        have hx : x = S.triangle.v2 := by simpa using hxmem
        simp [hx]
      · by_cases hxC2 : x ∈ S.CP.C2
        · have hxmem : x ∈ S.witnessClassAt_v3 s ∩ S.CP.C2 :=
            Finset.mem_inter.mpr ⟨hxT, hxC2⟩
          rw [hv1C2] at hxmem
          have hx : x = S.triangle.v1 := by simpa using hxmem
          simp [hx]
        · have hxC3 : x ∈ S.CP.C3 := by
            have hxne_v1 : x ≠ S.triangle.v1 := by
              intro hx
              exact hxC2 (by rw [hx]; exact S.CP.v1_mem_C2)
            have hxne_v2 : x ≠ S.triangle.v2 := by
              intro hx
              exact hxC1 (by rw [hx]; exact S.CP.v2_mem_C1)
            have hxne_v3 : x ≠ S.triangle.v3 := by
              intro hx
              have hdist : dist S.triangle.v3 x = s := (Finset.mem_filter.mp hxT).2
              rw [hx, dist_self] at hdist
              linarith
            have hxnon : x ∉ S.triangle.verts := by
              simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
              push_neg; exact ⟨hxne_v1, hxne_v2, hxne_v3⟩
            have hone := S.CP.nonmoser_in_one x hxA hxnon
            by_cases hxC3 : x ∈ S.CP.C3
            · exact hxC3
            · have : (0 : ℕ) = 1 := by
                simpa [hxC1, hxC2, hxC3] using hone
              omega
          have hxI3' : x ∈ S.I3 := by
            rw [show S.I3 = (S.CP.C3.erase S.triangle.v1).erase S.triangle.v2 from rfl]
            have hxne2 : x ≠ S.triangle.v2 := by
              intro hx
              exact hxC1 (by rw [hx]; exact S.CP.v2_mem_C1)
            have hxne1 : x ≠ S.triangle.v1 := by
              intro hx
              exact hxC2 (by rw [hx]; exact S.CP.v1_mem_C2)
            simp [hxC3, hxne2, hxne1]
          exact False.elim (hxI3 hxI3')
  have hfour_subset :
      insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²)) ⊆
        S.witnessClassAt_v3 s := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact ha3T
    · exact hb3T
    · exact hv2T
    · exact hv1T
  have hcard_named :
      (insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²))).card = 4 := by
    apply le_antisymm
    · rw [← hTcard]
      exact Finset.card_le_card hfour_subset
    · have hle := Finset.card_le_card hsubset
      rw [hTcard] at hle
      exact hle
  have hexact :
      S.witnessClassAt_v3 s =
        insert Z.a3 (insert Z.b3 ({S.triangle.v2, S.triangle.v1} : Finset ℝ²)) := by
    apply Finset.eq_of_subset_of_card_le hsubset
    rw [hTcard, hcard_named]
  exact S.cb1_a2_k4_cover Z hv3C2 hcard hexact

end FiniteEndpointShell
end Problem97
