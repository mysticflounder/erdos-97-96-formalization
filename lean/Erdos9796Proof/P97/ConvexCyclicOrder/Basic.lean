import FormalConjecturesForMathlib.Geometry.«2d»
import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.SignedAreaOangle

set_option linter.style.moduleDocstring false

/-!
# Convex cyclic order wrapper around `IsCcwConvexPolygon`

This module supplies a thin wrapper around the upstream predicate
`EuclideanGeometry.IsCcwConvexPolygon` (from
`FormalConjecturesForMathlib.Geometry.2d`) suited to the Fox-Pach 2012
Lemma 6 sign-stability arguments consumed downstream by the CGN counting
bridge.

The key downstream consumer needs the statement "four points
`p, q, r, s` appear in this cyclic order on the convex-hull boundary
of `A`" plus an immediate algebraic API:

* `Problem97.ConvexCyclicOrder A p q r s` — the wrapper predicate.
* `oangle_sign_{pqr,qrs,pqs,prs}` — direct sign extraction for the
  four oriented angles whose central vertex is in the interior of
  the index sequence (immediate from `IsCcwConvexPolygon.sign_oangle`).
* `signedArea2_sign_stable_{pq, qr_chord}` — sign-stability of the
  `signedArea2` predicate as the third/first point varies along the
  cyclic order. Bridges via `signedArea2_sign_eq_oangle_sign` in
  `SignedAreaOangle`.

All proofs are mechanical composition of `IsCcwConvexPolygon.sign_oangle*`
with `signedArea2_sign_eq_oangle_sign`. No axioms are introduced.

## Step 1 scope

This file is the Step 1 wrapper.  It now includes the generic cyclic-shift
transport for `IsCcwConvexPolygon`, enough to change the linear cut of a
global boundary enumeration.  The higher-level
`ConvexCyclicOrder.rotate`/`ConvexCyclicOrder.reverse` wrapper API is still
deferred to Step 2.  Reversal flips chirality, so a faithful Step-2 reverse
should wrap upstream `IsConvexPolygon` (which already handles both
chiralities) rather than `IsCcwConvexPolygon`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- `Problem97.ConvexCyclicOrder A p q r s` holds iff there is a cyclic
enumeration `φ : Fin n → ℝ²` of `A` realizing `IsCcwConvexPolygon` such
that `p, q, r, s` appear at strictly increasing indices in `φ`. The
existential closure over `n` and `φ` lets the predicate be stated
without committing to a specific enumeration of `A`. -/
def ConvexCyclicOrder (A : Finset ℝ²) (p q r s : ℝ²) : Prop :=
  ∃ (n : ℕ) (φ : Fin n → ℝ²),
    Function.Injective φ ∧
    Finset.univ.image φ = A ∧
    EuclideanGeometry.IsCcwConvexPolygon φ ∧
    ∃ ip iq ir is : Fin n,
      ip < iq ∧ iq < ir ∧ ir < is ∧
      φ ip = p ∧ φ iq = q ∧ φ ir = r ∧ φ is = s

/-- A strictly increasing finite subsequence of a CCW convex polygon is again
CCW.  This is the subpolygon step used by cap-block arguments once the selected
points have been exported as increasing global boundary indices. -/
theorem isCcwConvexPolygon_subsequence {n m : ℕ} {φ : Fin n → ℝ²}
    {idx : Fin m → Fin n}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hidx : StrictMono idx) :
    EuclideanGeometry.IsCcwConvexPolygon (fun i : Fin m => φ (idx i)) := by
  intro i j k hij hjk
  exact hccw (hidx hij) (hidx hjk)

/-- Descending signed-area form extracted from a CCW convex-polygon
enumeration. -/
theorem hneg_of_ccw {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) :
    ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (φ i) (φ j) (φ k) < 0 := by
  intro i j k hij hjk
  have hij_ne : φ i ≠ φ j := fun h => (ne_of_lt hij) (hinj h)
  have hkj_ne : φ k ≠ φ j := fun h => (ne_of_gt hjk) (hinj h)
  have hsign : SignType.sign (signedArea2 (φ j) (φ i) (φ k)) = 1 := by
    rw [signedArea2_sign_eq_oangle_sign (φ j) (φ i) (φ k) hij_ne hkj_ne]
    exact hccw.sign_oangle hij hjk
  have hpos : 0 < signedArea2 (φ j) (φ i) (φ k) :=
    sign_eq_one_iff.mp hsign
  have hswap :
      signedArea2 (φ j) (φ i) (φ k) =
        -signedArea2 (φ i) (φ j) (φ k) := by
    simp only [signedArea2]
    ring
  linarith

/-- Rebuild a CCW convex-polygon enumeration from the descending signed-area
form. -/
theorem ccw_of_hneg {n : ℕ} {ψ : Fin n → ℝ²}
    (hinj : Function.Injective ψ)
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (ψ i) (ψ j) (ψ k) < 0) :
    EuclideanGeometry.IsCcwConvexPolygon ψ := by
  intro i j k hij hjk
  have hij_ne : ψ i ≠ ψ j := fun h => (ne_of_lt hij) (hinj h)
  have hkj_ne : ψ k ≠ ψ j := fun h => (ne_of_gt hjk) (hinj h)
  have hpos : 0 < signedArea2 (ψ j) (ψ i) (ψ k) := by
    have hswap :
        signedArea2 (ψ j) (ψ i) (ψ k) =
          -signedArea2 (ψ i) (ψ j) (ψ k) := by
      simp only [signedArea2]
      ring
    have hneg' := hneg hij hjk
    linarith
  have hsign : SignType.sign (signedArea2 (ψ j) (ψ i) (ψ k)) = 1 :=
    sign_eq_one_iff.mpr hpos
  rw [signedArea2_sign_eq_oangle_sign (ψ j) (ψ i) (ψ k) hij_ne hkj_ne] at hsign
  exact hsign

/-- A cyclic shift preserves the descending signed-area form. -/
theorem hneg_cyclicShift {n : ℕ} {φ : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (φ i) (φ j) (φ k) < 0)
    (cut : Fin n) :
    ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (φ (i + cut)) (φ (j + cut)) (φ (k + cut)) < 0 := by
  have hcyc {a b c : ℝ²} : signedArea2 a b c = signedArea2 c a b := by
    simp [signedArea2]
    ring
  let bound : ℕ := n - cut.val
  have hval_nowrap {t : Fin n} (ht : (t : ℕ) < bound) :
      ((t + cut : Fin n) : ℕ) = t.val + cut.val := by
    rw [Fin.val_add_eq_ite]
    have hlt : ¬ n ≤ t.val + cut.val := by omega
    simp [hlt]
  have hval_wrap {t : Fin n} (ht : bound ≤ (t : ℕ)) :
      ((t + cut : Fin n) : ℕ) = t.val - bound := by
    rw [Fin.val_add_eq_ite]
    have hge : n ≤ t.val + cut.val := by omega
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
          signedArea2 (φ (k + cut)) (φ (i + cut)) (φ (j + cut)) < 0 :=
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
            signedArea2 (φ (j + cut)) (φ (k + cut)) (φ (i + cut)) < 0 :=
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

/-- A cyclic shift of a CCW convex-polygon enumeration is CCW. -/
theorem isCcwConvexPolygon_cyclicShift {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (cut : Fin n) :
    EuclideanGeometry.IsCcwConvexPolygon (fun t : Fin n => φ (t + cut)) := by
  have hneg : ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (φ i) (φ j) (φ k) < 0 :=
    fun {_ _ _} hij hjk => hneg_of_ccw hinj hccw hij hjk
  have hneg_s : ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (φ (i + cut)) (φ (j + cut)) (φ (k + cut)) < 0 :=
    fun {_ _ _} hij hjk => hneg_cyclicShift hneg cut hij hjk
  have hinj_s : Function.Injective (fun t : Fin n => φ (t + cut)) := by
    intro a b h
    exact add_left_injective cut (hinj h)
  exact ccw_of_hneg hinj_s (fun {i j k} hij hjk => hneg_s hij hjk)

-- TODO Step 2: ConvexCyclicOrder.rotate — `ConvexCyclicOrder A p q r s
-- → ConvexCyclicOrder A q r s p`. The generic boundary-enumeration cyclic
-- shift above supplies the geometric transport; the remaining work is a
-- wrapper-level theorem that repacks the four witnesses.
--
-- TODO Step 2: ConvexCyclicOrder.reverse — reversing the cyclic order
-- flips CCW → CW. The faithful Step-2 form should be stated over
-- `IsConvexPolygon` (the chirality-agnostic predicate at
-- `FormalConjecturesForMathlib/Geometry/2d.lean`), not the CCW form.

/-! ### Direct oriented-angle sign extraction

For each triple `(x, y, z) ⊆ {p, q, r, s}` whose central vertex `y` is
in the *middle* of the cyclic index sequence, `IsCcwConvexPolygon.sign_oangle`
directly yields `(∡ x y z).sign = 1`. The four such triples are listed
below.
-/

theorem ConvexCyclicOrder.oangle_sign_pqr
    {A : Finset ℝ²} {p q r s : ℝ²}
    (h : ConvexCyclicOrder A p q r s) :
    (∡ p q r).sign = 1 := by
  obtain ⟨n, φ, _hφ, _hA, hccw, ip, iq, ir, _is,
           hpq, hqr, _hrs, hp, hq, hr, _hs⟩ := h
  rw [← hp, ← hq, ← hr]
  exact hccw.sign_oangle hpq hqr

theorem ConvexCyclicOrder.oangle_sign_qrs
    {A : Finset ℝ²} {p q r s : ℝ²}
    (h : ConvexCyclicOrder A p q r s) :
    (∡ q r s).sign = 1 := by
  obtain ⟨n, φ, _hφ, _hA, hccw, _ip, iq, ir, is,
           _hpq, hqr, hrs, _hp, hq, hr, hs⟩ := h
  rw [← hq, ← hr, ← hs]
  exact hccw.sign_oangle hqr hrs

theorem ConvexCyclicOrder.oangle_sign_pqs
    {A : Finset ℝ²} {p q r s : ℝ²}
    (h : ConvexCyclicOrder A p q r s) :
    (∡ p q s).sign = 1 := by
  obtain ⟨n, φ, _hφ, _hA, hccw, ip, iq, ir, is,
           hpq, hqr, hrs, hp, hq, _hr, hs⟩ := h
  rw [← hp, ← hq, ← hs]
  exact hccw.sign_oangle hpq (hqr.trans hrs)

theorem ConvexCyclicOrder.oangle_sign_prs
    {A : Finset ℝ²} {p q r s : ℝ²}
    (h : ConvexCyclicOrder A p q r s) :
    (∡ p r s).sign = 1 := by
  obtain ⟨n, φ, _hφ, _hA, hccw, ip, iq, ir, is,
           hpq, hqr, hrs, hp, _hq, hr, hs⟩ := h
  rw [← hp, ← hr, ← hs]
  exact hccw.sign_oangle (hpq.trans hqr) hrs

/-! ### `signedArea2` sign-stability

Bridge the oriented-angle extraction above to the algebraic
`signedArea2` predicate via `Problem97.signedArea2_sign_eq_oangle_sign`.
Recall the convention `signedArea2 v vj vk ↔ ∡ vj v vk` (central vertex
is the *first* argument of `signedArea2`).
-/

/-- Sign-stability of `signedArea2 p q ·` as the third argument varies
between `r` and `s` (central vertex `p`, the smallest cyclic index).

This is the headline primitive consumed by Fox-Pach 2012 Lemma 6's
witness-monotonicity step. -/
theorem ConvexCyclicOrder.signedArea2_sign_stable_pq
    {A : Finset ℝ²} {p q r s : ℝ²}
    (h : ConvexCyclicOrder A p q r s) :
    SignType.sign (Problem97.signedArea2 p q r) =
      SignType.sign (Problem97.signedArea2 p q s) := by
  obtain ⟨n, φ, hφ, _hA, hccw, ip, iq, ir, is,
           hpq, hqr, hrs, hp, hq, hr, hs⟩ := h
  -- Non-degeneracy: each of q,r,s differs from p by injectivity of φ.
  have hqp' : q ≠ p := by rw [← hq, ← hp]; exact hφ.ne hpq.ne'
  have hrp' : r ≠ p := by
    rw [← hr, ← hp]; exact hφ.ne (hpq.trans hqr).ne'
  have hsp' : s ≠ p := by
    rw [← hs, ← hp]; exact hφ.ne ((hpq.trans hqr).trans hrs).ne'
  -- Bridge `signedArea2` to `∡` (central vertex `p`).
  rw [Problem97.signedArea2_sign_eq_oangle_sign p q r hqp' hrp',
      Problem97.signedArea2_sign_eq_oangle_sign p q s hqp' hsp']
  change (∡ q p r).sign = (∡ q p s).sign
  -- Use `sign_oangle''`: with `ip < iq < ir`, the central vertex of
  -- `(∡ (φ ir) (φ ip) (φ iq))` is `φ ip = p`, and the sign is `1`.
  -- We need `(∡ q p r) = -(∡ r p q)` to convert.
  have e1 : (∡ q p r).sign = -1 := by
    rw [← hp, ← hq, ← hr, EuclideanGeometry.oangle_rev,
        Real.Angle.sign_neg, hccw.sign_oangle'' hpq hqr]
  have e2 : (∡ q p s).sign = -1 := by
    rw [← hp, ← hq, ← hs, EuclideanGeometry.oangle_rev,
        Real.Angle.sign_neg, hccw.sign_oangle'' hpq (hqr.trans hrs)]
  rw [e1, e2]

/-- Sign-stability when the chord `(q, r)` is fixed and the observer
varies between the first cyclic vertex `p` and the last cyclic vertex
`s`. Both `signedArea2 p q r` and `signedArea2 s q r` have negative sign
because `p, s` lie on the same side of the chord `qr` (the side
opposite to the CCW interior). -/
theorem ConvexCyclicOrder.signedArea2_sign_stable_qr_chord
    {A : Finset ℝ²} {p q r s : ℝ²}
    (h : ConvexCyclicOrder A p q r s) :
    SignType.sign (Problem97.signedArea2 p q r) =
      SignType.sign (Problem97.signedArea2 s q r) := by
  obtain ⟨n, φ, hφ, _hA, hccw, ip, iq, ir, is,
           hpq, hqr, hrs, hp, hq, hr, hs⟩ := h
  have hqp' : q ≠ p := by rw [← hq, ← hp]; exact hφ.ne hpq.ne'
  have hrp' : r ≠ p := by
    rw [← hr, ← hp]; exact hφ.ne (hpq.trans hqr).ne'
  have hqs' : q ≠ s := by
    rw [← hq, ← hs]; exact hφ.ne (hqr.trans hrs).ne
  have hrs' : r ≠ s := by rw [← hr, ← hs]; exact hφ.ne hrs.ne
  rw [Problem97.signedArea2_sign_eq_oangle_sign p q r hqp' hrp',
      Problem97.signedArea2_sign_eq_oangle_sign s q r hqs' hrs']
  change (∡ q p r).sign = (∡ q s r).sign
  -- `(∡ q p r).sign = -1` via `sign_oangle''` (central `p`, smallest).
  have e1 : (∡ q p r).sign = -1 := by
    rw [← hp, ← hq, ← hr, EuclideanGeometry.oangle_rev,
        Real.Angle.sign_neg, hccw.sign_oangle'' hpq hqr]
  -- `(∡ q s r).sign = -1` via `sign_oangle'` (central `s`, largest).
  have e2 : (∡ q s r).sign = -1 := by
    rw [← hq, ← hs, ← hr, EuclideanGeometry.oangle_rev,
        Real.Angle.sign_neg, hccw.sign_oangle' hqr hrs]
  rw [e1, e2]

end Problem97
