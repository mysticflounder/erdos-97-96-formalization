import Erdos9796Proof.P97.N8.N8aArcTwoCircle       -- W7: N8a3_adjacent_one_hit
import Erdos9796Proof.P97.N8.N8bEndpointPair       -- W8: N8b_endpoint_pair_split, N8e
import Erdos9796Proof.P97.N8.N8hiSameCap           -- W9: N8h, N8i
import Erdos9796Proof.P97.N8.N8CapCoordNorm        -- W10: interior-apex frame producers
import Erdos9796Proof.P97.U2WitnessReflectionKernel -- angular exclusion: twoCircle_midpoint_collinear, signedArea2_reflection_neg

/-!
# W10 — N8k single-apex contradiction (distribution enumeration)

This file implements the top-level W10 distribution enumeration for the
single-apex `N8k` contradiction.  It routes each geometric distribution tuple
`(m, s, l, r)` to one of the W7/W8/W9 primitives.

**Routing (prose §2131–2137):**
- `l = 2` or `r = 2`  →  `N8a3_adjacent_one_hit`           (W7, PROVED)
- `m ≥ 2`             →  `N8b_endpoint_pair_split` + `N8e`  (W8, PROVED)
- `(1,1,1,1)` same-cap → `N8h_endpoint_moser_false`         (W9, PROVED)
              or        → `N8i_capcenter_fullwidth_false`    (W9, PROVED)

N8c/N8d are NOT active gates; this enumeration covers all cases.
-/

open scoped EuclideanGeometry
open scoped InnerProductSpace
open EuclideanGeometry
open Finset

namespace Problem97

/-- **Angular exclusion proportionality.**  If `x`, `v2`, `v3`, `o` are four ℝ²-points
satisfying the two-circle equidistance conditions (`dist x v2 = dist x v3`, `dist v2 v3 = dist v2 o`,
`dist x o = dist x v3`) and the reflection identity `signedArea2 o x v2 = -signedArea2 x v2 v3`
(which holds when `o` is the second intersection of `S(x, r) ∩ S(v2, d)` beyond `v3`), then
`dist x v2 ^ 2 * signedArea2 o v2 v3 = dist v2 v3 ^ 2 * signedArea2 x v2 v3`.
This proportionality equates the signed areas up to a positive scalar, preserving sign and enabling
cap-membership transfer from `x` to `o`. -/
private lemma angular_prop_dist (x v2 v3 o : ℝ²)
    (hdist_xv2v3 : dist x v2 = dist x v3)
    (hdist_v2v3o : dist v2 v3 = dist v2 o)
    (hdist_xo : dist x o = dist x v3)
    (hsa : signedArea2 o x v2 = -signedArea2 x v2 v3) :
    dist x v2 ^ 2 * signedArea2 o v2 v3 = dist v2 v3 ^ 2 * signedArea2 x v2 v3 := by
  have dist_sq : ∀ p q : ℝ², dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 := fun p q => by
    simp only [EuclideanSpace.dist_eq, Fin.sum_univ_two]
    rw [Real.sq_sqrt (by positivity)]
    simp [Real.dist_eq]
  have h1 : (x 0 - v2 0) ^ 2 + (x 1 - v2 1) ^ 2 =
            (x 0 - v3 0) ^ 2 + (x 1 - v3 1) ^ 2 := by
    have := dist_sq x v2 ▸ dist_sq x v3 ▸ (congr_arg (· ^ 2) hdist_xv2v3); linarith
  have h2 : (v2 0 - v3 0) ^ 2 + (v2 1 - v3 1) ^ 2 =
            (v2 0 - o 0) ^ 2 + (v2 1 - o 1) ^ 2 := by
    have := dist_sq v2 v3 ▸ dist_sq v2 o ▸ (congr_arg (· ^ 2) hdist_v2v3o); linarith
  have h3 : (x 0 - o 0) ^ 2 + (x 1 - o 1) ^ 2 =
            (x 0 - v3 0) ^ 2 + (x 1 - v3 1) ^ 2 := by
    have := dist_sq x o ▸ dist_sq x v3 ▸ (congr_arg (· ^ 2) hdist_xo); linarith
  simp only [signedArea2] at *
  rw [dist_sq x v2, dist_sq v2 v3]
  linear_combination
    ((v2 0 - o 0) * (x 1 - o 1) - (v2 1 - o 1) * (x 0 - o 0)) * h1 +
    (-(v2 0 - o 0) * (v3 1 - o 1) + 3/2 * (v2 0 - o 0) * (x 1 - o 1) +
     (v2 1 - o 1) * (v3 0 - o 0) - 3/2 * (v2 1 - o 1) * (x 0 - o 0) -
     (v3 0 - o 0) * (x 1 - o 1) + (v3 1 - o 1) * (x 0 - o 0)) * h2 +
    (-1/2 * (v2 0 - o 0) * (x 1 - o 1) + 1/2 * (v2 1 - o 1) * (x 0 - o 0)) * h3 +
    (-(v2 0 - o 0) * (x 0 - o 0) - (v2 1 - o 1) * (x 1 - o 1)) * hsa

/- ## W10 (1,1,1,1) m=1 endpoint-reflection toolkit

The `m = 1` N8h branch (the `:1250` gate) selects a UNIQUE Moser vertex `v_m`
in the class (`dist x v_m = r`).  Every Moser vertex is an endpoint of an
adjacent cap `C` whose centre is the OPPOSITE vertex `c` at the equilateral
distance `d` (`dist v_m c = d`), so `v_m` lies on both the selected circle
`S(x, r)` and the adjacent circle `S(c, d)`, and is vertex-erased from `C`'s
open interior.  Reflecting `v_m` across the centre line `line[x, c]` yields the
SECOND crossing `o`; the two crossings exhaust `S(x, r) ∩ S(c, d)`, so the open
adjacent cap carries ZERO selected hits — contradicting the pinned `(1,1,1,1)`.

The reflected point `o` is OUTSIDE the open adjacent cap.  That reduces, via the
equidistance-FREE reflection identity `signedArea2_reflection_chord` (the BRIDGE,
a standalone algebraic lemma) to the strict positivity of the chord-side product
`signedArea2 o p q * signedArea2 c p q`, which factors through the triple
`signedArea2 x c e · ⟪c - x, e - w⟫ · signedArea2 c e w` (all the same sign per
the apex frame / strict-chord geometry). -/

set_option maxRecDepth 4000 in
/-- Reflection of `e` across the chord-line `line[x, a]`, in starProjection closed form. -/
private lemma rc_refl_closed (x a e : ℝ²) :
    EuclideanGeometry.reflection (affineSpan ℝ ({x, a} : Set ℝ²)) e =
      ((2:ℝ) • ((Submodule.span ℝ ({x - a} : Set ℝ²)).starProjection (e - x)) - (e - x)) + x := by
  have hx_mem : x ∈ affineSpan ℝ ({x, a} : Set ℝ²) := left_mem_affineSpan_pair ..
  have hdir : (affineSpan ℝ ({x, a} : Set ℝ²)).direction
      = Submodule.span ℝ ({x - a} : Set ℝ²) := by
    rw [direction_affineSpan, vectorSpan_pair]; rfl
  rw [EuclideanGeometry.reflection_apply_of_mem _ e hx_mem, Submodule.reflection_apply]
  simp only [hdir, vsub_eq_sub, vadd_eq_add]; module

set_option maxRecDepth 4000 in
/-- Per-coordinate form of the reflected point `o = reflection(line[x,a]) e`. -/
private lemma rc_o_coord (x a e : ℝ²) (i : Fin 2) :
    (EuclideanGeometry.reflection (affineSpan ℝ ({x, a} : Set ℝ²)) e) i
      = (2:ℝ) * ((inner ℝ (x - a) (e - x)) / (‖x - a‖^2)) * ((x - a) i)
        - (e - x) i + x i := by
  rw [rc_refl_closed, Submodule.starProjection_singleton]
  simp only [PiLp.add_apply, PiLp.sub_apply, PiLp.smul_apply, smul_eq_mul,
    RCLike.ofReal_real_eq_id, id_eq]
  ring

/-- Coordinate expansion of the real inner product on `ℝ²`. -/
private lemma rc_inner_coord (u v : ℝ²) : (inner ℝ u v) = u 0 * v 0 + u 1 * v 1 := by
  rw [EuclideanSpace.inner_eq_star_dotProduct]
  simp [dotProduct, Fin.sum_univ_two, mul_comm]

/-- Coordinate expansion of the squared norm on `ℝ²`. -/
private lemma rc_nsq_coord (u : ℝ²) : ‖u‖^2 = (u 0)^2 + (u 1)^2 := by
  rw [EuclideanSpace.norm_eq, Real.sq_sqrt (by positivity)]
  simp [Fin.sum_univ_two]

set_option maxRecDepth 4000 in
/-- **BRIDGE (algebraic, equidistance-free).**  For `o` the reflection of `e`
across the centre line `line[x, c]`, the signed area `signedArea2 o e w` is
proportional (by the positive scalar `dist x c ^ 2`) to
`signedArea2 x c e · ⟪c - x, e - w⟫`.  This is the `m = 1` replacement for the
own-pair `angular_prop_dist` (which needed the FALSE-here equidistance
`dist x c = dist x e`); the reflection geometry alone supplies it.

PROVEN by the four `rc_*` coordinate helpers above: reduce the reflection to its
starProjection closed form (`rc_refl_closed`), expand per coordinate
(`rc_o_coord`), expand the inner product and squared norm (`rc_inner_coord`,
`rc_nsq_coord`), then `field_simp; ring`.  The `x = c` case is the trivial
`0 = 0` (the `dist x c ^ 2` factor vanishes). -/
private lemma signedArea2_reflection_chord (x c e w : ℝ²) :
    signedArea2 (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) e w
      * dist x c ^ 2
      = 2 * signedArea2 x c e * ⟪c - x, e - w⟫_ℝ := by
  rcases eq_or_ne x c with rfl | hxc
  · simp [signedArea2, dist_self, sub_self, inner_zero_left, mul_zero]
  · rw [dist_eq_norm]
    have hden : (x 0 - c 0)^2 + (x 1 - c 1)^2 ≠ 0 := by
      intro hz; apply hxc
      have h0 : x 0 - c 0 = 0 := by nlinarith [sq_nonneg (x 0 - c 0), sq_nonneg (x 1 - c 1)]
      have h1 : x 1 - c 1 = 0 := by nlinarith [sq_nonneg (x 0 - c 0), sq_nonneg (x 1 - c 1)]
      ext j; fin_cases j <;> simp_all <;> linarith
    have e0 : (x - c) 0 = x 0 - c 0 := by simp
    have e1 : (x - c) 1 = x 1 - c 1 := by simp
    have e2 : (e - x) 0 = e 0 - x 0 := by simp
    have e3 : (e - x) 1 = e 1 - x 1 := by simp
    have e4 : (c - x) 0 = c 0 - x 0 := by simp
    have e5 : (c - x) 1 = c 1 - x 1 := by simp
    have e6 : (e - w) 0 = e 0 - w 0 := by simp
    have e7 : (e - w) 1 = e 1 - w 1 := by simp
    unfold signedArea2
    rw [show (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) 0 = _
          from rc_o_coord x c e 0,
        show (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) 1 = _
          from rc_o_coord x c e 1,
        rc_inner_coord (x - c) (e - x), rc_inner_coord (c - x) (e - w), rc_nsq_coord (x - c),
        e0, e1, e2, e3, e4, e5, e6, e7]
    field_simp
    ring

/-- **Strict chord bound.**  For an apex `x` on the open cap arc opposite `va`
(its own-cap centre, `dist va x = d`), and an arc-endpoint vertex `vb ≠ x` on
the equilateral triangle `(va, vb, vc)` of side `d`, the apex is STRICTLY closer
than `d` to `vb`.  This is the Thales (≥ π/2) inscribed-angle fact at `x`,
combined with the law of cosines: `⟪vb - x, vc - x⟫ ≤ 0` forces
`dist x vb ^ 2 ≤ d ^ 2 - dist x vc ^ 2 < d ^ 2`. -/
private lemma dist_apex_chord_endpoint_lt
    {va vb vc x : ℝ²} {d : ℝ} (hd : 0 < d)
    (hxa : dist va x = d) (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hbc : vb ≠ vc) (hxc : x ≠ vc)
    (harc : signedArea2 x vb vc * signedArea2 va vb vc ≤ 0) :
    dist x vb < d := by
  have nrm : ∀ p q : ℝ², ‖p - q‖ = dist p q := fun p q => by rw [dist_eq_norm]
  -- Step 1: Thales angle at x is obtuse: ⟪vb - x, vc - x⟫ ≤ 0.
  have hxan : ‖x - va‖ ^ 2 = ‖vb - va‖ ^ 2 := by
    rw [nrm, nrm, dist_comm x va, hxa, dist_comm vb va, eab]
  have hbcn : ‖vb - va‖ ^ 2 = ‖vc - va‖ ^ 2 := by
    rw [nrm, nrm, dist_comm vb va, eab, dist_comm vc va, eac]
  have hoff := inner_chord_eq_two_mul_inner_midpoint_off_sphere vb vc x va hbcn
  have hbr := inner_midpoint_eq_signedArea_prod_of_chord_sphere vb vc x va hbcn
  have hSqpos : 0 < ‖vc - vb‖ ^ 2 := by
    have : vc - vb ≠ 0 := sub_ne_zero.mpr (Ne.symm hbc); positivity
  have hrhs : signedArea2 va vb vc * signedArea2 x vb vc ≤ 0 := by rw [mul_comm]; exact harc
  have hinner_le : ⟪midpoint ℝ vb vc - x, midpoint ℝ vb vc - va⟫_ℝ ≤ 0 := by
    have hh : ⟪midpoint ℝ vb vc - x, midpoint ℝ vb vc - va⟫_ℝ * ‖vc - vb‖ ^ 2 ≤ 0 := by
      rw [hbr]; exact hrhs
    exact nonpos_of_mul_nonpos_left hh hSqpos
  have hcomm : ⟪midpoint ℝ vb vc - va, midpoint ℝ vb vc - x⟫_ℝ
      = ⟪midpoint ℝ vb vc - x, midpoint ℝ vb vc - va⟫_ℝ := real_inner_comm _ _
  have hcorr : ‖x - va‖ ^ 2 - ‖vb - va‖ ^ 2 = 0 := by rw [hxan]; ring
  have hthales : ⟪vb - x, vc - x⟫_ℝ ≤ 0 := by rw [hoff, hcomm]; linarith [hinner_le, hcorr]
  -- Step 2: law of cosines ‖vb - vc‖² = ‖vb-x‖²+‖vc-x‖²-2⟪vb-x,vc-x⟫.
  have hexp : ‖vb - vc‖ ^ 2 = ‖vb - x‖ ^ 2 + ‖vc - x‖ ^ 2 - 2 * ⟪vb - x, vc - x⟫_ℝ := by
    have h : vb - vc = (vb - x) - (vc - x) := by abel
    rw [h, @norm_sub_sq_real]; ring
  have hvcx_pos : 0 < ‖vc - x‖ ^ 2 := by
    have : vc - x ≠ 0 := sub_ne_zero.mpr (Ne.symm hxc); positivity
  have hdbc : ‖vb - vc‖ = d := by rw [nrm]; exact ebc
  have hlt : ‖vb - x‖ ^ 2 < d ^ 2 := by rw [← hdbc, hexp]; nlinarith [hthales, hvcx_pos]
  have hdist : dist x vb = ‖vb - x‖ := by rw [dist_eq_norm, norm_sub_rev]
  rw [hdist]
  nlinarith [hlt, norm_nonneg (vb - x), hd, sq_nonneg (‖vb - x‖ - d), sq_nonneg (‖vb - x‖ + d)]

/-- **Same-side product (apex / opposite chord vertex), Regime II.**  When the
selected Moser vertex `v_m = va` is the apex-opposite vertex (`dist va x = d`,
so the selected radius is `d`), the chord-side product `signedArea2 x vb va ·
signedArea2 vb va vc` is STRICTLY POSITIVE: `x` and `vc` lie on the same open
side of the chord `(vb, va)`.  Proved through the library inner-midpoint bridge
`signedArea_prod_pos_of_inner_midpoint_pos`, whose positivity input is forced by
the single strict bound `dist x vc < d`. -/
private lemma sameSide_prod_pos_apexVertex
    {va vb vc x : ℝ²} {d : ℝ} (hd : 0 < d)
    (hxa : dist va x = d) (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hab : va ≠ vb)
    (hxc_lt : dist x vc < d) :
    0 < signedArea2 x vb va * signedArea2 vb va vc := by
  have ds : ∀ p q : ℝ², dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 := fun p q => by
    simp only [EuclideanSpace.dist_eq, Fin.sum_univ_two]
    rw [Real.sq_sqrt (by positivity)]; simp [Real.dist_eq]
  have hmid : ∀ i : Fin 2, (midpoint ℝ vb va) i = ((vb i + va i) / 2 : ℝ) := by
    intro i; rw [midpoint_eq_smul_add]; simp [PiLp.smul_apply, PiLp.add_apply, invOf_eq_inv]; ring
  have hIexp : ⟪midpoint ℝ vb va - x, midpoint ℝ vb va - vc⟫_ℝ
      = ((vb 0 + va 0) / 2 - x 0) * ((vb 0 + va 0) / 2 - vc 0)
        + ((vb 1 + va 1) / 2 - x 1) * ((vb 1 + va 1) / 2 - vc 1) := by
    rw [@PiLp.inner_apply]; simp only [Fin.sum_univ_two, RCLike.inner_apply, conj_trivial,
      PiLp.sub_apply, hmid]; ring
  have hxc_lt' : dist x vc ^ 2 < d ^ 2 := by
    have h0 : 0 ≤ dist x vc := dist_nonneg
    nlinarith [hxc_lt, h0, hd]
  -- The inner product `I = ⟪M - x, M - vc⟫` (M = midpoint vb va) is positive: x lies strictly
  -- on the vc-side of the chord (vb, va).  Provable from the single strict bound on `dist x vc`.
  have hI : 0 < ⟪midpoint ℝ vb va - x, midpoint ℝ vb va - vc⟫_ℝ := by
    rw [hIexp]
    have h2 := ds va vb; have h3 := ds va vc; have h4 := ds vb vc
    rw [eab] at h2; rw [eac] at h3; rw [ebc] at h4
    have hgx : (x 0 - va 0) ^ 2 + (x 1 - va 1) ^ 2 = d ^ 2 := by rw [← ds x va, dist_comm, hxa]
    have hL3'' : 0 < ((x 0 - va 0) ^ 2 + (x 1 - va 1) ^ 2) - ((x 0 - vc 0) ^ 2 + (x 1 - vc 1) ^ 2) := by
      rw [hgx, ← ds x vc]; linarith [hxc_lt']
    nlinarith [hL3'', h2, h3, h4, hgx, hd, sq_nonneg (x 0 - vc 0), sq_nonneg (x 1 - vc 1),
               sq_nonneg (x 0 - vb 0), sq_nonneg (x 1 - vb 1)]
  -- Library inner-midpoint bridge: chord (vb, va), reference vc equidistant from vb, va.
  have heq : ‖vb - vc‖ = ‖va - vc‖ := by
    rw [← dist_eq_norm, ← dist_eq_norm, show dist vb vc = d from ebc,
        show dist va vc = d from eac]
  have hlib := signedArea_prod_pos_of_inner_midpoint_pos heq hab hI
  -- hlib : 0 < signedArea2 x vb va * signedArea2 vc vb va.  Convert vc-frame to (vb, va, vc).
  have hcyc : signedArea2 vc vb va = signedArea2 vb va vc := by simp only [signedArea2]; ring
  rw [hcyc] at hlib; exact hlib

/-- **Reflected endpoint outside the adjacent cap (chord-side positivity).**
With `o` the reflection of the shared endpoint `e` across the centre line
`line[x, c]`, the chord-side product `signedArea2 o e w · signedArea2 c e w` is
STRICTLY POSITIVE provided the triple
`signedArea2 x c e · ⟪c - x, e - w⟫ · signedArea2 c e w` is positive.  Combines
the BRIDGE identity (`signedArea2_reflection_chord`) with `dist x c ^ 2 > 0`:
`(o-chord product) · dist x c ^ 2 = 2 · (triple) > 0`. -/
private lemma reflected_chord_prod_pos
    {x c e w : ℝ²} (hxc : x ≠ c)
    (hT : 0 < signedArea2 x c e * ⟪c - x, e - w⟫_ℝ * signedArea2 c e w) :
    0 < signedArea2 (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) e w
          * signedArea2 c e w := by
  have hdxc2 : 0 < dist x c ^ 2 := by have := dist_pos.mpr hxc; positivity
  have hbridge := signedArea2_reflection_chord x c e w
  have hprod : signedArea2 (EuclideanGeometry.reflection (affineSpan ℝ ({x, c} : Set ℝ²)) e) e w
        * signedArea2 c e w * dist x c ^ 2
      = 2 * (signedArea2 x c e * ⟪c - x, e - w⟫_ℝ * signedArea2 c e w) := by
    linear_combination signedArea2 c e w * hbridge
  nlinarith [hprod, hT, hdxc2]

/-- **B-factor sign reduction.**  With `e, w` the two chord endpoints of the
adjacent cap (both at distance `d` from the cap centre `c`), the inner product
`⟪c - x, e - w⟫` has the sign of `dist x e ^ 2 - dist x w ^ 2` (the apex's chord
imbalance), via the polarization identity
`2⟪c - x, e - w⟫ = (dist c w ^ 2 - dist c e ^ 2) + (dist x e ^ 2 - dist x w ^ 2)`. -/
private lemma inner_chord_eq_dist_diff (x c e w : ℝ²) :
    2 * ⟪c - x, e - w⟫_ℝ
      = (dist c w ^ 2 - dist c e ^ 2) + (dist x e ^ 2 - dist x w ^ 2) := by
  have ds : ∀ p q : ℝ², dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 := fun p q => by
    simp only [EuclideanSpace.dist_eq, Fin.sum_univ_two]
    rw [Real.sq_sqrt (by positivity)]; simp [Real.dist_eq]
  have hInner : ⟪c - x, e - w⟫_ℝ
      = (c 0 - x 0) * (e 0 - w 0) + (c 1 - x 1) * (e 1 - w 1) := by
    rw [@PiLp.inner_apply]; simp [Fin.sum_univ_two, RCLike.inner_apply, mul_comm]
  rw [hInner, ds c w, ds c e, ds x e, ds x w]; ring

/-- **Two-circle closer with explicit centre.**  `adjacentInterior_empty_of_two_crossings`
re-expressed with a CONCRETE centre `c` / radius `d` (the producers
`exists_{left,right}AdjacentArcWitness` hide the witness's `circleCenter`, so the
`m = 1` route works directly against the concrete adjacent Moser-vertex circle).
Given two distinct crossings `e ≠ o` of `S(x, r)` and `S(c, d)`, neither in the
open cap `Iadj` (whose points all lie on `S(c, d)`), the selected class meets the
open cap in ZERO points. -/
private lemma m1_adjacent_empty
    {A : Finset ℝ²} {x c e o : ℝ²} {r d : ℝ}
    {Iadj : Finset ℝ²}
    (hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨c, d⟩)
    (heo : e ≠ o)
    (hex : dist x e = r) (heC : dist c e = d)
    (hox : dist x o = r) (hoC : dist c o = d)
    (hIcirc : ∀ z ∈ Iadj, dist c z = d)
    (heI : e ∉ Iadj) (hoI : o ∉ Iadj) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  classical
  by_contra hcard0
  obtain ⟨w, hw⟩ := Finset.card_pos.mp (Nat.pos_of_ne_zero hcard0)
  have hwsel : w ∈ SelectedClass A x r := Finset.mem_of_mem_inter_left hw
  have hwI : w ∈ Iadj := Finset.mem_of_mem_inter_right hw
  have hwx : dist w x = r := dist_self_of_mem_selectedClass hwsel
  have hwC : dist c w = d := hIcirc w hwI
  set s₁ : Sphere ℝ² := ⟨x, r⟩ with hs1
  set s₂ : Sphere ℝ² := ⟨c, d⟩ with hs2
  have hes1 : e ∈ s₁ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hex)
  have hos1 : o ∈ s₁ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hox)
  have hes2 : e ∈ s₂ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact heC)
  have hos2 : o ∈ s₂ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hoC)
  have hws1 : w ∈ s₁ := EuclideanGeometry.mem_sphere.mpr hwx
  have hws2 : w ∈ s₂ := EuclideanGeometry.mem_sphere.mpr (by rw [dist_comm]; exact hwC)
  rcases two_circle_common_point_eq_endpoint hcircles_ne heo hes1 hos1 hes2 hos2 hws1 hws2 with h | h
  · rw [h] at hwI; exact heI hwI
  · rw [h] at hwI; exact hoI hwI

/-- **`m = 1` targeted-cap kill (geometric core).**  The shared Moser endpoint
`e = v_m` (on `S(x, r)`, `dist x e = r`) and `S(c, d)` (`dist c e = d`, `c` the
adjacent cap centre) admit the centre-line reflection `o` as the SECOND crossing;
both `e` and `o` are outside the open adjacent cap `Iadj`, so the selected class
meets `Iadj` in ZERO points.  Outside-cap for `o` is the chord-side positivity
(`reflected_chord_prod_pos` from the triple `hT`); for `e` it is `heI`. -/
private lemma m1_kill_targeted
    {A : Finset ℝ²} {x c e w : ℝ²} {r d : ℝ} {Iadj : Finset ℝ²}
    (hxc : x ≠ c)
    (hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨c, d⟩)
    (hxe : dist x e = r) (hce : dist c e = d)
    (hIcirc : ∀ z ∈ Iadj, dist c z = d)
    (heI : e ∉ Iadj)
    (hcap : ∀ z ∈ Iadj, signedArea2 z e w * signedArea2 c e w ≤ 0)
    (hT : 0 < signedArea2 x c e * ⟪c - x, e - w⟫_ℝ * signedArea2 c e w)
    (hline : e ∉ affineSpan ℝ ({x, c} : Set ℝ²)) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  classical
  set sline : AffineSubspace ℝ ℝ² := affineSpan ℝ ({x, c} : Set ℝ²) with hsline
  have hxs : x ∈ sline := by rw [hsline]; exact subset_affineSpan _ _ (by simp)
  have hcs : c ∈ sline := by rw [hsline]; exact subset_affineSpan _ _ (by simp)
  haveI : Nonempty sline := ⟨⟨x, hxs⟩⟩
  set o := EuclideanGeometry.reflection sline e with ho
  -- o on both circles, via reflection distance preservation.
  have hox : dist x o = r := (EuclideanGeometry.dist_reflection_eq_of_mem sline hxs e).trans hxe
  have hoC : dist c o = d := (EuclideanGeometry.dist_reflection_eq_of_mem sline hcs e).trans hce
  have heo : e ≠ o := by
    intro h
    have hself : EuclideanGeometry.reflection sline e = e := h.symm
    rw [EuclideanGeometry.reflection_eq_self_iff] at hself
    exact hline hself
  -- o outside the open cap: chord-side product strictly positive.
  have hcapside : 0 < signedArea2 o e w * signedArea2 c e w :=
    reflected_chord_prod_pos hxc hT
  have hoI : o ∉ Iadj := by
    intro hmem
    have := hcap o hmem
    linarith [hcapside, this]
  exact m1_adjacent_empty hcircles_ne heo hxe hce hox hoC hIcirc heI hoI

namespace FiniteEndpointShell

/- ## Distribution group counts

For a non-Moser apex `x ∈ capInteriorByIndex S i` with a selected 4-class,
each classmate belongs to one of four disjoint groups:
  m  = # Moser vertices (S.triangle.v1, .v2, .v3) in the class
  s  = # same-cap interior points (capInteriorByIndex S i, not x) in the class
  l  = # left-adjacent-cap interior points in the class
  r  = # right-adjacent-cap interior points in the class

The distribution routing is a finite case split on (m, s, l, r).
-/

/-- Helper: count Moser vertices in the selected class. -/
noncomputable def moserCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.triangle.verts).card

/-- Helper: count same-cap interior points (excluding x) in the selected class. -/
noncomputable def sameCapCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card

/-- Helper: count left-adjacent-cap interior points in the selected class. -/
noncomputable def leftAdjCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card

/-- Helper: count right-adjacent-cap interior points in the selected class. -/
noncomputable def rightAdjCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card

/-- **W10 GATE-1 — apex Moser vertex excluded.**  For any interior cap apex
`x ∈ S.capInteriorByIndex i` and any selected radius `r`, the Moser count is at most two:
the selected class about `x` cannot contain all three Moser vertices.

This is unconditional (no own-pair hypothesis needed).  The apex-opposite Moser vertex sits
at distance `d` (the equilateral side, `n7_circle_placement`) from `x`; if all three vertices
lay in the class they would all be at distance `r` from `x`, forcing `r = d` and hence three
equilateral vertices all at distance equal to the side length — impossible by
`no_equidistant_apex_at_side` (the equilateral circumradius is `d/√3 < d`). -/
theorem apexFrame_moserCount_le_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hN4e : S.N4eCapContainment)
    (i : Fin 3) {x : ℝ²} (hx : x ∈ S.capInteriorByIndex i) (r : ℝ) :
    S.moserCount x r ≤ 2 := by
  classical
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have e31 : dist S.triangle.v3 S.triangle.v1 = d := by rw [dist_comm]; exact e13
  by_contra hgt
  push_neg at hgt
  have hm3 : S.moserCount x r = 3 := by
    have hle : S.moserCount x r ≤ 3 := by
      simp only [moserCount]
      calc (SelectedClass A x r ∩ S.triangle.verts).card
          ≤ S.triangle.verts.card := Finset.card_le_card Finset.inter_subset_right
        _ = 3 := S.triangle.verts_card
    omega
  have hsub : S.triangle.verts ⊆ SelectedClass A x r := by
    have hinter : (SelectedClass A x r ∩ S.triangle.verts) = S.triangle.verts := by
      apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
      rw [S.triangle.verts_card]; rw [← hm3]; rfl
    intro y hy
    have hmem : y ∈ SelectedClass A x r ∩ S.triangle.verts := by rw [hinter]; exact hy
    exact Finset.mem_of_mem_inter_left hmem
  have hv1 : S.triangle.v1 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv2 : S.triangle.v2 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv3 : S.triangle.v3 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have dx1 : dist x S.triangle.v1 = r := (mem_selectedClass.mp (hsub hv1)).2
  have dx2 : dist x S.triangle.v2 = r := (mem_selectedClass.mp (hsub hv2)).2
  have dx3 : dist x S.triangle.v3 = r := (mem_selectedClass.mp (hsub hv3)).2
  have hrd : r = d := by
    fin_cases i
    · simp only [capInteriorByIndex] at hx
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hx
      have hd1 : dist S.triangle.v1 x = d := hC1 _ hx.2.2
      rw [← dx1, dist_comm]; exact hd1
    · simp only [capInteriorByIndex] at hx
      rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hx
      have hd2 : dist S.triangle.v2 x = d := hC2 _ hx.2.2
      rw [← dx2, dist_comm]; exact hd2
    · simp only [capInteriorByIndex] at hx
      rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hx
      have hd3 : dist S.triangle.v3 x = d := hC3 _ hx.2.2
      rw [← dx3, dist_comm]; exact hd3
  subst hrd
  exact no_equidistant_apex_at_side S.triangle.v1 S.triangle.v2 S.triangle.v3 x r hdpos
    e12 e23 e31 dx1 dx2 dx3

/-- **W10 GATES 2/3 — reflection-kernel reduction (two known crossings).**  Given an
`N8AdjacentArcWitness W` (apex `x`, selected radius `r`, arc support `Iadj`) and TWO distinct
points `e ≠ o`, each lying on both the selected circle `S(x, r)` (`dist · x = r`) and the
adjacent ambient circle `S(W.base.arc.circleCenter, W.base.arc.circleRadius)`, with NEITHER
in the open adjacent cap `Iadj`, the selected class meets the open cap in ZERO points:
`(SelectedClass A x r ∩ Iadj).card = 0`.

Two distinct circles meet in at most two points (`two_circle_common_point_eq_endpoint`); `e`
and `o` already exhaust the crossings, so any open-cap hit `w` (a third common point) must be
`e` or `o`, contradicting `e, o ∉ Iadj`.  This is the exact closer for the own-pair adjacent
gates once the two crossings are supplied. -/
theorem adjacentInterior_empty_of_two_crossings
    {A : Finset ℝ²} (_S : FiniteEndpointShell A) {x : ℝ²} {r : ℝ}
    (W : N8AdjacentArcWitness) (hWa : W.base.apex = x) (hWr : W.base.selectedRadius = r)
    {Iadj : Finset ℝ²} (hWsupp : W.base.arc.support = Iadj)
    {e o : ℝ²}
    (heo : e ≠ o)
    (hex : dist e x = r) (heC : dist e W.base.arc.circleCenter = W.base.arc.circleRadius)
    (hox : dist o x = r) (hoC : dist o W.base.arc.circleCenter = W.base.arc.circleRadius)
    (heI : e ∉ Iadj) (hoI : o ∉ Iadj) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  classical
  by_contra hcard0
  obtain ⟨w, hw⟩ := Finset.card_pos.mp (Nat.pos_of_ne_zero hcard0)
  have hwsel : w ∈ SelectedClass A x r := Finset.mem_of_mem_inter_left hw
  have hwI : w ∈ Iadj := Finset.mem_of_mem_inter_right hw
  have hwx : dist w x = r := dist_self_of_mem_selectedClass hwsel
  have hwC : dist w W.base.arc.circleCenter = W.base.arc.circleRadius := by
    have hws : w ∈ W.base.arc.support := by rw [hWsupp]; exact hwI
    have hd := W.base.arc.on_circle w hws
    rw [dist_comm] at hd; exact hd
  set s₁ : EuclideanGeometry.Sphere ℝ² := ⟨x, r⟩ with hs1
  set s₂ : EuclideanGeometry.Sphere ℝ² := ⟨W.base.arc.circleCenter, W.base.arc.circleRadius⟩
    with hs2
  have hs_ne : s₁ ≠ s₂ := by rw [hs1, hs2, ← hWa, ← hWr]; exact W.base.circles_ne
  have hes1 : e ∈ s₁ := EuclideanGeometry.mem_sphere.mpr hex
  have hos1 : o ∈ s₁ := EuclideanGeometry.mem_sphere.mpr hox
  have hes2 : e ∈ s₂ := EuclideanGeometry.mem_sphere.mpr heC
  have hos2 : o ∈ s₂ := EuclideanGeometry.mem_sphere.mpr hoC
  have hws1 : w ∈ s₁ := EuclideanGeometry.mem_sphere.mpr hwx
  have hws2 : w ∈ s₂ := EuclideanGeometry.mem_sphere.mpr hwC
  rcases two_circle_common_point_eq_endpoint hs_ne heo hes1 hos1 hes2 hos2 hws1 hws2 with h | h
  · rw [h] at hwI; exact heI hwI
  · rw [h] at hwI; exact hoI hwI

/-- **W10 GATES 2/3 — reflection-kernel reduction (single residual form).**  Specialises
`adjacentInterior_empty_of_two_crossings` to the canonical second crossing `o`: the reflection
of the shared endpoint `e` across the centre line `line[x, v_adj]` (`v_adj =
W.base.arc.circleCenter`).  Because `x` and `v_adj` both lie on that line, the reflection
preserves the distance to each centre (`dist_reflection_eq_of_mem`), so `o` is automatically on
both circles; `e ≠ o` follows from `e` lying off the centre line (`reflection_eq_self_iff`).

This collapses each own-pair adjacent gate to a SINGLE residual: the centre-line reflection of
the shared endpoint is outside the open adjacent cap (`hoI`).  That residual is the angular
exclusion (`o` at angle −30° from `v_adj` vs the open arc `(−120°, −60°)`) verified numerically
(memory E5XDGV); the remaining producer obligation is the shared-endpoint construction (`e`,
`dist e x = r`, `dist e v_adj = d`, `e` off the centre line — all from the own-pair frame) plus
that angular fact. -/
theorem adjacentInterior_empty_of_reflection
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²} {r : ℝ}
    (W : N8AdjacentArcWitness) (hWa : W.base.apex = x) (hWr : W.base.selectedRadius = r)
    {Iadj : Finset ℝ²} (hWsupp : W.base.arc.support = Iadj)
    {e : ℝ²}
    (hex : dist e x = r) (heC : dist e W.base.arc.circleCenter = W.base.arc.circleRadius)
    (heI : e ∉ Iadj)
    (hline : e ∉ affineSpan ℝ {x, W.base.arc.circleCenter})
    (hoI : EuclideanGeometry.reflection (affineSpan ℝ {x, W.base.arc.circleCenter}) e ∉ Iadj) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  classical
  set c := W.base.arc.circleCenter with hc
  set s : AffineSubspace ℝ ℝ² := affineSpan ℝ {x, c} with hs
  have hxs : x ∈ s := by rw [hs]; exact subset_affineSpan _ _ (by simp)
  have hcs : c ∈ s := by rw [hs]; exact subset_affineSpan _ _ (by simp)
  haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
  set o := EuclideanGeometry.reflection s e with ho
  have hox : dist o x = r := by
    have h := EuclideanGeometry.dist_reflection_eq_of_mem s hxs e
    rw [ho, dist_comm, h, dist_comm]; exact hex
  have hoC : dist o c = W.base.arc.circleRadius := by
    have h := EuclideanGeometry.dist_reflection_eq_of_mem s hcs e
    rw [ho, dist_comm, h, dist_comm, hc]; exact heC
  have heo : e ≠ o := by
    intro h
    have hself : EuclideanGeometry.reflection s e = e := h.symm
    rw [EuclideanGeometry.reflection_eq_self_iff] at hself
    exact hline hself
  exact S.adjacentInterior_empty_of_two_crossings W hWa hWr hWsupp heo hex heC hox hoC heI hoI

/-- **Distribution disjoint-cover bound.**  Every member of the selected class at a
cap-`i` apex `x` is either a Moser vertex or — being a non-Moser point of `A` — lies in
exactly one of the three cap interiors (`nonmoser_in_one`).  For cap `i` the three caps are
exactly `{own, left-adjacent, right-adjacent}`, and the apex `x` itself never lies in its
own selected class (`dist x x = 0 ≠ radius`).  Hence the selected class is covered by the four
groups, and its cardinality is bounded by the four group counts `m + s + l + r`.

This is the combinatorial budget the W10 distribution routing rests on; it is fully proved
from the cap partition with no geometry, and turns the "card ≥ 4" hypothesis into the additive
constraint `4 ≤ m + s + l + r` consumed by every branch below. -/
theorem selected_le_groupSum
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} (i : Fin 3) (radius : ℝ) (hradius_pos : 0 < radius) :
    (SelectedClass A x radius).card ≤
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius := by
  classical
  -- The apex never lies in its own selected class (`dist x x = 0 ≠ radius`).
  have hx_notin : x ∉ SelectedClass A x radius := by
    intro hh
    have : dist x x = radius := (mem_selectedClass.mp hh).2
    rw [dist_self] at this; linarith
  -- The four-fold `card_union_le` chain, abstracted over the four group sets.
  have hchain : ∀ (P Q R T : Finset ℝ²),
      SelectedClass A x radius ⊆ P ∪ Q ∪ R ∪ T →
      (SelectedClass A x radius).card ≤ P.card + Q.card + R.card + T.card := by
    intro P Q R T hsub
    calc (SelectedClass A x radius).card
        ≤ (P ∪ Q ∪ R ∪ T).card := Finset.card_le_card hsub
      _ ≤ P.card + Q.card + R.card + T.card := by
          refine le_trans (Finset.card_union_le _ _) ?_
          refine add_le_add (le_trans (Finset.card_union_le _ _) ?_) le_rfl
          exact add_le_add (Finset.card_union_le _ _) le_rfl
  -- Non-Moser members of the selected class land in exactly one cap interior.
  have hqfacts : ∀ q ∈ SelectedClass A x radius, q ∉ S.triangle.verts →
      (q ∈ S.I1 ∨ q ∈ S.I2 ∨ q ∈ S.I3) := by
    intro q hq hqv
    have hqA : q ∈ A := (mem_selectedClass.mp hq).1
    have hone := S.CP.nonmoser_in_one q hqA hqv
    have hqnv : q ≠ S.triangle.v1 ∧ q ≠ S.triangle.v2 ∧ q ≠ S.triangle.v3 := by
      simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton] at hqv
      push_neg at hqv; exact hqv
    by_cases h1 : q ∈ S.CP.C1
    · refine Or.inl ?_
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase]
      exact ⟨hqnv.2.2, hqnv.2.1, h1⟩
    · by_cases h2 : q ∈ S.CP.C2
      · refine Or.inr (Or.inl ?_)
        rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase]
        exact ⟨hqnv.1, hqnv.2.2, h2⟩
      · have h3 : q ∈ S.CP.C3 := by
          by_contra h3; simp only [if_neg h1, if_neg h2, if_neg h3] at hone; omega
        refine Or.inr (Or.inr ?_)
        rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase]
        exact ⟨hqnv.2.1, hqnv.1, h3⟩
  -- Dispatch the cover into the four group sets per cap index.
  change (SelectedClass A x radius).card ≤
      (SelectedClass A x radius ∩ S.triangle.verts).card +
        (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card +
        (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card +
        (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card
  fin_cases i <;>
  · apply hchain
    intro q hq
    have hqx : q ≠ x := fun h => hx_notin (h ▸ hq)
    by_cases hqv : q ∈ S.triangle.verts
    · exact Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hq, hqv⟩)))
    · rcases hqfacts q hq hqv with hI | hI | hI <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] <;>
      first
      | (refine Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_right _ ?_))
         exact Finset.mem_inter.mpr ⟨hq, Finset.mem_erase.mpr ⟨hqx, hI⟩⟩)
      | (refine Finset.mem_union_left _ (Finset.mem_union_right _ ?_)
         exact Finset.mem_inter.mpr ⟨hq, hI⟩)
      | (refine Finset.mem_union_right _ ?_
         exact Finset.mem_inter.mpr ⟨hq, hI⟩)

/-- **Cap-interior cardinality.**  Once every opposite cap meets the minimal interior bound,
the cap vector is exactly `(4,4,4)` and each cap interior has cardinality `2`
(`n4b_n5_exact_cap_vector_of_interior_lower_bounds`).  Specialized to the cyclic selector
`capInteriorByIndex`. -/
theorem capInterior_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) :
    (S.capInteriorByIndex i).card = 2 := by
  have hc := S.n4b_n5_exact_cap_vector_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two
  fin_cases i <;> simp only [FiniteEndpointShell.capInteriorByIndex] <;> simp_all

/-- **Same-cap one-hit (cardinality).**  The own cap interior has cardinality exactly `2`
(`capInterior_card_eq_two`) and contains the apex `x`, so its `x`-erasure
`(capInteriorByIndex i).erase x` has cardinality `1`.  Hence the selected class meets the
same-cap interior (minus `x`) in at most one point: `sameCapCount ≤ 1`.

This is the same-cap analogue of the W7 adjacent one-hit bounds (`l ≤ 1`, `r_count ≤ 1`):
together with those it pins every surviving W10 distribution tuple to an additive equality
(`m + s + l + r_count = 4` with each summand `≤ 1` / the `(2,0,1,1)` own-pair tuple).  It is
PURE cardinality — no geometry — and is the maximal reduction the disjoint-cover budget
supplies on its own. -/
theorem sameCapCount_le_one
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) {x : ℝ²} (radius : ℝ)
    (hxcap : x ∈ S.capInteriorByIndex i) :
    S.sameCapCount i x radius ≤ 1 := by
  have herase : ((S.capInteriorByIndex i).erase x).card = 1 := by
    rw [Finset.card_erase_of_mem hxcap, S.capInterior_card_eq_two]
  calc S.sameCapCount i x radius
      ≤ ((S.capInteriorByIndex i).erase x).card :=
        Finset.card_le_card Finset.inter_subset_right
    _ = 1 := herase

/- ## W10 (1,1,1,1) m=1 endpoint-Moser closers

Two abstract cyclic-frame cores for the `m = 1` N8h gate.  Each forces the
targeted adjacent open cap (interior `Iadj`, centre `vb`, radius `d`) to carry
ZERO selected-class hits, via the shared Moser endpoint `vm` (a triangle vertex
on the selected circle and on `S(vb, d)`) and its centre-line reflection.

* `m1_kill_RI` — the selected vertex `vm = vc` is a NON-apex chord vertex
  (`r < d`).  The chord-side triple is positive from the apex's own-cap arc
  membership (`signedArea2 x vb vc · signedArea2 va vb vc ≤ 0`, giving the
  `A·C' < 0` factor) and the strict chord bound (`B < 0`).

* `m1_kill_RII` — the selected vertex `vm = va` is the apex-opposite vertex
  (`r = d`).  The `A·C' > 0` factor comes from `sameSide_prod_pos_apexVertex`
  (forced by the single strict bound `dist x vc < d`), with `B > 0`. -/

/-- **Regime I core (`vm` non-apex).**  See the section comment. -/
private lemma m1_kill_RI {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {va vb vc x : ℝ²} {d r : ℝ} {Iadj : Finset ℝ²} (hdpos : 0 < d)
    (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hab : va ≠ vb) (hac : va ≠ vc) (hbc : vb ≠ vc)
    (haA : va ∈ A) (hbA : vb ∈ A) (hcA : vc ∈ A)
    (hxA : x ∈ A) (hxa : dist va x = d)
    (hxb : x ≠ vb) (hxc : x ≠ vc)
    (hvm_sel : dist x vc = r)
    (hapex_arc : signedArea2 x vb vc * signedArea2 va vb vc ≤ 0)
    (hIcirc : ∀ z ∈ Iadj, dist vb z = d)
    (hvc_notin : vc ∉ Iadj)
    (hIcap : ∀ z ∈ Iadj, signedArea2 z vc va * signedArea2 vb vc va ≤ 0) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  have hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨vb, d⟩ := fun h => hxb (congrArg Sphere.center h)
  have hcyc : signedArea2 vb vc va = signedArea2 va vb vc := by simp only [signedArea2]; ring
  have hAne : signedArea2 x vb vc ≠ 0 := by
    have := S.hconv.not_three_collinear hxA hbA hcA hxb hxc hbc
    exact fun h => this (collinear_of_signedArea2_eq_zero _ _ _ h)
  have hC'ne : signedArea2 vb vc va ≠ 0 := by
    rw [hcyc]; exact signedArea2_ne_zero_of_equilateral hdpos eab eac ebc hab hbc hac
  have hAC_lt : signedArea2 x vb vc * signedArea2 vb vc va < 0 := by
    rw [hcyc]; exact lt_of_le_of_ne hapex_arc (mul_ne_zero hAne (hcyc ▸ hC'ne))
  -- strict bound on the selected vertex `vc`: swap roles (target endpoint = vc, opposite = vb).
  have hswap : signedArea2 x vc vb * signedArea2 va vc vb ≤ 0 := by
    have h1 : signedArea2 x vc vb = - signedArea2 x vb vc := by simp only [signedArea2]; ring
    have h2 : signedArea2 va vc vb = - signedArea2 va vb vc := by simp only [signedArea2]; ring
    rw [h1, h2]; nlinarith [hapex_arc]
  have hstrict : dist x vc < d :=
    dist_apex_chord_endpoint_lt hdpos hxa eac eab (by rw [dist_comm]; exact ebc) hbc.symm hxb hswap
  have hB : ⟪vb - x, vc - va⟫_ℝ < 0 := by
    have h2b := inner_chord_eq_dist_diff x vb vc va
    rw [show dist vb va = d by rw [dist_comm]; exact eab, show dist vb vc = d from ebc, hvm_sel,
        show dist x va = d by rw [dist_comm]; exact hxa] at h2b
    have hrd : r < d := by rw [← hvm_sel]; exact hstrict
    nlinarith [h2b, hrd, dist_nonneg (x := x) (y := vc), hvm_sel, hdpos]
  have hT : 0 < signedArea2 x vb vc * ⟪vb - x, vc - va⟫_ℝ * signedArea2 vb vc va := by
    have h := mul_pos_of_neg_of_neg hAC_lt hB; nlinarith [h]
  have hline : vc ∉ affineSpan ℝ ({x, vb} : Set ℝ²) := fun hmem =>
    S.hconv.not_three_collinear hcA hxA hbA hxc.symm hbc.symm hxb
      (collinear_insert_of_mem_affineSpan_pair hmem)
  exact m1_kill_targeted hxb hcircles_ne hvm_sel ebc hIcirc hvc_notin hIcap hT hline

/-- **Regime II core (`vm` = apex-opposite).**  See the section comment. -/
private lemma m1_kill_RII {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {va vb vc x : ℝ²} {d r : ℝ} {Iadj : Finset ℝ²} (hdpos : 0 < d)
    (eab : dist va vb = d) (eac : dist va vc = d) (ebc : dist vb vc = d)
    (hab : va ≠ vb) (hac : va ≠ vc) (hbc : vb ≠ vc)
    (haA : va ∈ A) (hbA : vb ∈ A) (hcA : vc ∈ A)
    (hxA : x ∈ A) (hxa : dist va x = d)
    (hxb : x ≠ vb) (hxc : x ≠ vc)
    (hvm_sel : dist x va = r)
    (hapex_arc : signedArea2 x vb vc * signedArea2 va vb vc ≤ 0)
    (hIcirc : ∀ z ∈ Iadj, dist vb z = d)
    (hva_notin : va ∉ Iadj)
    (hIcap : ∀ z ∈ Iadj, signedArea2 z va vc * signedArea2 vb va vc ≤ 0) :
    (SelectedClass A x r ∩ Iadj).card = 0 := by
  have hcircles_ne : (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨vb, d⟩ := fun h => hxb (congrArg Sphere.center h)
  have hce : dist vb va = d := by rw [dist_comm]; exact eab
  have hxa_ne : va ≠ x := fun h => by rw [← h, dist_self] at hxa; linarith
  have hstrict : dist x vc < d := by
    have hswap : signedArea2 x vc vb * signedArea2 va vc vb ≤ 0 := by
      have h1 : signedArea2 x vc vb = - signedArea2 x vb vc := by simp only [signedArea2]; ring
      have h2 : signedArea2 va vc vb = - signedArea2 va vb vc := by simp only [signedArea2]; ring
      rw [h1, h2]; nlinarith [hapex_arc]
    exact dist_apex_chord_endpoint_lt hdpos hxa eac eab (by rw [dist_comm]; exact ebc) hbc.symm hxb hswap
  have hAC_pos : 0 < signedArea2 x vb va * signedArea2 vb va vc :=
    sameSide_prod_pos_apexVertex hdpos hxa eab eac ebc hab hstrict
  have hB : 0 < ⟪vb - x, va - vc⟫_ℝ := by
    have h2b := inner_chord_eq_dist_diff x vb va vc
    rw [show dist vb vc = d from ebc, show dist vb va = d by rw [dist_comm]; exact eab,
        show dist x va = d by rw [dist_comm]; exact hxa] at h2b
    have hxc_lt' : dist x vc ^ 2 < d ^ 2 := by nlinarith [hstrict, dist_nonneg (x := x) (y := vc), hdpos]
    nlinarith [h2b, hxc_lt']
  have hT : 0 < signedArea2 x vb va * ⟪vb - x, va - vc⟫_ℝ * signedArea2 vb va vc := by
    have h := mul_pos hAC_pos hB; nlinarith [h]
  have hline : va ∉ affineSpan ℝ ({x, vb} : Set ℝ²) := fun hmem =>
    S.hconv.not_three_collinear haA hxA hbA hxa_ne hab hxb
      (collinear_insert_of_mem_affineSpan_pair hmem)
  exact m1_kill_targeted hxb hcircles_ne hvm_sel hce hIcirc hva_notin hIcap hT hline

/-- **W10 (1,1,1,1) m=1 branch contradiction.**  In the `(1,1,1,1)` N8h gate's
`m = 1` branch the selected class contains a UNIQUE Moser vertex `vm`
(`moserCount = 1`) and at least one classmate in each adjacent open cap
(`l ≥ 1`, `r ≥ 1`).  `vm` is an endpoint of an adjacent cap whose centre is the
opposite vertex at distance `d`; killing that cap (`m1_kill_RI`/`m1_kill_RII`)
forces its selected-class count to `0`, contradicting `l ≥ 1` or `r ≥ 1`. -/
private lemma m1_branch_false {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) {x : ℝ²} {i : Fin 3} {r : ℝ}
    (hx_cap : x ∈ S.capInteriorByIndex i) (hr_pos : 0 < r)
    (hmc : (SelectedClass A x r ∩ S.triangle.verts).card = 1)
    (hl1ge : 1 ≤ (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex i).card)
    (hr1ge : 1 ≤ (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex i).card) : False := by
  classical
  obtain ⟨vm, hvm_eq⟩ := Finset.card_eq_one.mp hmc
  have hvm_mem : vm ∈ SelectedClass A x r ∩ S.triangle.verts := by
    rw [hvm_eq]; exact Finset.mem_singleton_self vm
  have hvm_sel : dist x vm = r := (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hvm_mem)).2
  have hvm_verts : vm ∈ S.triangle.verts := Finset.mem_of_mem_inter_right hvm_mem
  obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
  have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
  have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
  have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
  have hp12 : S.triangle.v1 ≠ S.triangle.v2 := S.triangle.v12_ne
  have hp23 : S.triangle.v2 ≠ S.triangle.v3 := S.triangle.v23_ne
  have hp13 : S.triangle.v1 ≠ S.triangle.v3 := S.triangle.v13_ne
  have hv1A := S.triangle.v1_mem
  have hv2A := S.triangle.v2_mem
  have hv3A := S.triangle.v3_mem
  have hI1circ : ∀ z ∈ S.I1, dist S.triangle.v1 z = d := by
    intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz; exact hC1 z hz.2.2
  have hI2circ : ∀ z ∈ S.I2, dist S.triangle.v2 z = d := by
    intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz; exact hC2 z hz.2.2
  have hI3circ : ∀ z ∈ S.I3, dist S.triangle.v3 z = d := by
    intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz; exact hC3 z hz.2.2
  -- Cap-membership in role-order helpers: for any cap, convert the canonical `arc_membership`
  -- product to the chord order the `m1_kill_*` cores consume.
  simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton] at hvm_verts
  fin_cases i
  · -- i = 0: apex C1 (centre v1); left adj = I2 (centre v2); right adj = I3 (centre v3).
    have hxI1 : x ∈ S.I1 := by have h := hx_cap; simp only [capInteriorByIndex] at h; exact h
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hxI1
    obtain ⟨hxv3, hxv2, hxC1⟩ := hxI1
    have hxA : x ∈ A := S.CP.C1_subset hxC1
    have hx1 : dist S.triangle.v1 x = d := hC1 _ hxC1
    have hxarc : signedArea2 x S.triangle.v2 S.triangle.v3 * signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 :=
      ((S.CP.arc_membership x hxA).1).mp hxC1
    rcases hvm_verts with rfl | rfl | rfl
    · -- vm = v1 (apex-opposite): RII, kill LEFT I2.  roles (va,vb,vc)=(v1,v2,v3).
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 0).card = 0 := by
        simp only [leftAdjacentInteriorByIndex]
        refine m1_kill_RII S hdpos e12 e13 e23 hp12 hp13 hp23 hv1A hv2A hv3A hxA
          hx1 hxv2 hxv3 hvm_sel hxarc hI2circ
          (by rw [FiniteEndpointShell.I2]; exact fun h => Finset.notMem_erase _ _ h) ?_
        intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz
        have harc : signedArea2 z S.triangle.v3 S.triangle.v1 * signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 :=
          ((S.CP.arc_membership z (S.CP.C2_subset hz.2.2)).2.1).mp hz.2.2
        have h1 : signedArea2 z S.triangle.v1 S.triangle.v3 = -signedArea2 z S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
        have h2 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
        rw [h1, h2]; nlinarith [harc]
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    · -- vm = v2: RI, kill RIGHT I3.  roles (va,vb,vc)=(v1,v3,v2).
      have hkill : (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex 0).card = 0 := by
        simp only [rightAdjacentInteriorByIndex]
        refine m1_kill_RI S hdpos e13 e12 (by rw [dist_comm]; exact e23) hp13 hp12 hp23.symm
          hv1A hv3A hv2A hxA hx1 hxv3 hxv2 hvm_sel ?_ hI3circ
          (by rw [FiniteEndpointShell.I3]; exact fun h => Finset.notMem_erase _ _ h) ?_
        · have h1 : signedArea2 x S.triangle.v3 S.triangle.v2 = -signedArea2 x S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 = -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith [hxarc]
        · intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz
          have harc : signedArea2 z S.triangle.v1 S.triangle.v2 * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 :=
            ((S.CP.arc_membership z (S.CP.C3_subset hz.2.2)).2.2).mp hz.2.2
          have h1 : signedArea2 z S.triangle.v2 S.triangle.v1 = -signedArea2 z S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v3 S.triangle.v2 S.triangle.v1 = -signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith [harc]
      rw [hkill] at hr1ge; exact absurd hr1ge (by norm_num)
    · -- vm = v3: RI, kill LEFT I2.  roles (va,vb,vc)=(v1,v2,v3).
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 0).card = 0 := by
        simp only [leftAdjacentInteriorByIndex]
        refine m1_kill_RI S hdpos e12 e13 e23 hp12 hp13 hp23 hv1A hv2A hv3A hxA
          hx1 hxv2 hxv3 hvm_sel hxarc hI2circ
          (by rw [FiniteEndpointShell.I2]; exact fun h => Finset.notMem_erase _ _ (Finset.mem_of_mem_erase h)) ?_
        intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz
        exact ((S.CP.arc_membership z (S.CP.C2_subset hz.2.2)).2.1).mp hz.2.2
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
  · -- i = 1: apex C2 (centre v2); left adj = I3 (centre v3); right adj = I1 (centre v1).
    have hxI2 : x ∈ S.I2 := by have h := hx_cap; simp only [capInteriorByIndex] at h; exact h
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hxI2
    obtain ⟨hxv1, hxv3, hxC2⟩ := hxI2
    have hxA : x ∈ A := S.CP.C2_subset hxC2
    have hx2 : dist S.triangle.v2 x = d := hC2 _ hxC2
    have hxarc : signedArea2 x S.triangle.v3 S.triangle.v1 * signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 :=
      ((S.CP.arc_membership x hxA).2.1).mp hxC2
    rcases hvm_verts with rfl | rfl | rfl
    · -- vm = v1: RI, kill LEFT I3.  roles (va,vb,vc)=(v2,v3,v1).
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 1).card = 0 := by
        simp only [leftAdjacentInteriorByIndex]
        refine m1_kill_RI S hdpos e23 (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13)
          hp23 hp12.symm hp13.symm hv2A hv3A hv1A hxA hx2 hxv3 hxv1 hvm_sel
          hxarc hI3circ
          (by rw [FiniteEndpointShell.I3]; exact fun h => Finset.notMem_erase _ _ (Finset.mem_of_mem_erase h)) ?_
        intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz
        exact ((S.CP.arc_membership z (S.CP.C3_subset hz.2.2)).2.2).mp hz.2.2
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    · -- vm = v2 (apex-opposite): RII, kill LEFT I3.  roles (va,vb,vc)=(v2,v3,v1).
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 1).card = 0 := by
        simp only [leftAdjacentInteriorByIndex]
        refine m1_kill_RII S hdpos e23 (by rw [dist_comm]; exact e12) (by rw [dist_comm]; exact e13)
          hp23 hp12.symm hp13.symm hv2A hv3A hv1A hxA hx2 hxv3 hxv1 hvm_sel
          hxarc hI3circ
          (by rw [FiniteEndpointShell.I3]; exact fun h => Finset.notMem_erase _ _ h) ?_
        intro z hz; rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hz
        have harc : signedArea2 z S.triangle.v1 S.triangle.v2 * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 :=
          ((S.CP.arc_membership z (S.CP.C3_subset hz.2.2)).2.2).mp hz.2.2
        have h1 : signedArea2 z S.triangle.v2 S.triangle.v1 = -signedArea2 z S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
        have h2 : signedArea2 S.triangle.v3 S.triangle.v2 S.triangle.v1 = -signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
        rw [h1, h2]; nlinarith [harc]
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    · -- vm = v3: RI, kill RIGHT I1.  roles (va,vb,vc)=(v2,v1,v3).
      have hkill : (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex 1).card = 0 := by
        simp only [rightAdjacentInteriorByIndex]
        refine m1_kill_RI S hdpos (by rw [dist_comm]; exact e12) e23 e13
          hp12.symm hp23 hp13 hv2A hv1A hv3A hxA hx2 hxv1 hxv3 hvm_sel ?_ hI1circ
          (by rw [FiniteEndpointShell.I1]; exact fun h => Finset.notMem_erase _ _ h) ?_
        · have h1 : signedArea2 x S.triangle.v1 S.triangle.v3 = -signedArea2 x S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith [hxarc]
        · intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz
          have harc : signedArea2 z S.triangle.v2 S.triangle.v3 * signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 :=
            ((S.CP.arc_membership z (S.CP.C1_subset hz.2.2)).1).mp hz.2.2
          have h1 : signedArea2 z S.triangle.v3 S.triangle.v2 = -signedArea2 z S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 = -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith [harc]
      rw [hkill] at hr1ge; exact absurd hr1ge (by norm_num)
  · -- i = 2: apex C3 (centre v3); left adj = I1 (centre v1); right adj = I2 (centre v2).
    have hxI3 : x ∈ S.I3 := by have h := hx_cap; simp only [capInteriorByIndex] at h; exact h
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at hxI3
    obtain ⟨hxv2, hxv1, hxC3⟩ := hxI3
    have hxA : x ∈ A := S.CP.C3_subset hxC3
    have hx3 : dist S.triangle.v3 x = d := hC3 _ hxC3
    have hxarc : signedArea2 x S.triangle.v1 S.triangle.v2 * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 :=
      ((S.CP.arc_membership x hxA).2.2).mp hxC3
    rcases hvm_verts with rfl | rfl | rfl
    · -- vm = v1: RI, kill RIGHT I2.  roles (va,vb,vc)=(v3,v2,v1).
      have hkill : (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex 2).card = 0 := by
        simp only [rightAdjacentInteriorByIndex]
        refine m1_kill_RI S hdpos (by rw [dist_comm]; exact e23) (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e12)
          hp23.symm hp13.symm hp12.symm hv3A hv2A hv1A hxA hx3 hxv2 hxv1 hvm_sel ?_ hI2circ
          (by rw [FiniteEndpointShell.I2]; exact fun h => Finset.notMem_erase _ _ h) ?_
        · have h1 : signedArea2 x S.triangle.v2 S.triangle.v1 = -signedArea2 x S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v3 S.triangle.v2 S.triangle.v1 = -signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith [hxarc]
        · intro z hz; rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at hz
          have harc : signedArea2 z S.triangle.v3 S.triangle.v1 * signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 :=
            ((S.CP.arc_membership z (S.CP.C2_subset hz.2.2)).2.1).mp hz.2.2
          have h1 : signedArea2 z S.triangle.v1 S.triangle.v3 = -signedArea2 z S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          have h2 : signedArea2 S.triangle.v2 S.triangle.v1 S.triangle.v3 = -signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 := by simp only [signedArea2]; ring
          rw [h1, h2]; nlinarith [harc]
      rw [hkill] at hr1ge; exact absurd hr1ge (by norm_num)
    · -- vm = v2: RI, kill LEFT I1.  roles (va,vb,vc)=(v3,v1,v2).
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 2).card = 0 := by
        simp only [leftAdjacentInteriorByIndex]
        refine m1_kill_RI S hdpos (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12
          hp13.symm hp23.symm hp12 hv3A hv1A hv2A hxA hx3 hxv1 hxv2 hvm_sel
          hxarc hI1circ
          (by rw [FiniteEndpointShell.I1]; exact fun h => Finset.notMem_erase _ _ (Finset.mem_of_mem_erase h)) ?_
        intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz
        exact ((S.CP.arc_membership z (S.CP.C1_subset hz.2.2)).1).mp hz.2.2
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)
    · -- vm = v3 (apex-opposite): RII, kill LEFT I1.  roles (va,vb,vc)=(v3,v1,v2).
      have hkill : (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex 2).card = 0 := by
        simp only [leftAdjacentInteriorByIndex]
        refine m1_kill_RII S hdpos (by rw [dist_comm]; exact e13) (by rw [dist_comm]; exact e23) e12
          hp13.symm hp23.symm hp12 hv3A hv1A hv2A hxA hx3 hxv1 hxv2 hvm_sel
          hxarc hI1circ
          (by rw [FiniteEndpointShell.I1]; exact fun h => Finset.notMem_erase _ _ h) ?_
        intro z hz; rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at hz
        have harc : signedArea2 z S.triangle.v2 S.triangle.v3 * signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 :=
          ((S.CP.arc_membership z (S.CP.C1_subset hz.2.2)).1).mp hz.2.2
        have h1 : signedArea2 z S.triangle.v3 S.triangle.v2 = -signedArea2 z S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
        have h2 : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 = -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
        rw [h1, h2]; nlinarith [harc]
      rw [hkill] at hl1ge; exact absurd hl1ge (by norm_num)

/- ## Main theorem -/

-- Angular exclusion proofs across all 6 gate sub-cases need extra heartbeats.
set_option maxHeartbeats 1600000 in
/-- **N8k single-apex contradiction** (W10).

For any non-Moser apex `x` in cap `i` with a selected `4`-class, the
distribution of classmates among the four groups `(m, s, l, r)` routes to
one of the proved W7/W8/W9 primitives, yielding `False` in every case.

All branches are discharged: the W8 `m ≥ 2` endpoint-pair split, the W9
`(1,1,1,1)` same-cap cases, and the W10 `m = 1` endpoint-Moser branch (closed via
`m1_branch_false` + the `signedArea2_reflection_chord` bridge).  `#print axioms`
on this theorem is `{propext, Classical.choice, Quot.sound}` — no `sorryAx`.
-/
theorem N8k_single_apex_false
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hx : N8SelectedApex S i x) :
    False := by
  -- Let r be the selected radius, and let m, s, l, r_count be the group counts.
  set r := hx.radius with hr_def
  set m := S.moserCount x r with hm_def
  set s := S.sameCapCount i x r with hs_def
  set l := S.leftAdjCount i x r with hl_def
  set r_count := S.rightAdjCount i x r with hr_count_def
  -- The four groups are disjoint and their total does not exceed the class card.
  -- Combined with `hx.selected_card : 4 ≤ card`, this is the additive budget
  -- `4 ≤ m + s + l + r_count` every routing branch below rests on.
  have hcover : 4 ≤ m + s + l + r_count :=
    le_trans hx.selected_card (S.selected_le_groupSum i r hx.radius_pos)
  -- Key routing: dispatch on whether l=2, r_count=2, m≥2, or we're in (1,1,1,1).
  by_cases hl2 : 2 ≤ l
  · -- Branch: l = 2 (left-adjacent cap has two classmates) → N8a3_adjacent_one_hit (W7).
    -- The selected class meets the left-adjacent open cap in ≥ 2 points (`hl2`), but
    -- W7's `N8a3_adjacent_one_hit` (consuming an `N8AdjacentArcWitness` whose arc is that
    -- cap) bounds the intersection by `1`.  The witness's arc circle is the adjacent
    -- Moser-vertex circle from `n7_circle_placement`; the only genuinely-open field is the
    -- ordered-chain monotonicity `N8a3AdjacentCapDistanceStrict x chain` — strict radial
    -- monotonicity from the *interior* apex `x` along the adjacent cap (E3-L13 / G3, no
    -- producer for an arbitrary interior apex; see `U2OneHitBound.lean:49–62`,
    -- `N8bEndpointPair.lean:182–194`).  That open packet is isolated into the witness gate.
    classical
    -- An `N8AdjacentArcWitness` for the left-adjacent cap whose apex/radius are `x`/`r` and
    -- whose arc support is exactly `S.leftAdjacentInteriorByIndex i`.
    have hwit : ∃ W : N8AdjacentArcWitness,
        W.base.apex = x ∧ W.base.selectedRadius = r ∧
          W.base.arc.support = S.leftAdjacentInteriorByIndex i :=
      S.exists_leftAdjacentArcWitness hN4e i hx.cap_mem r
    obtain ⟨W, hWapex, hWrad, hWsupp⟩ := hwit
    -- W7 one-hit bound: the selected class meets the arc in at most one point.
    have hone := S.N8a3_adjacent_one_hit hN4e W
    rw [hWapex, hWrad, hWsupp] at hone
    -- But `hl2` says it meets the left-adjacent cap in at least two points.
    have hge2 : 2 ≤ (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex i).card := by
      simpa [FiniteEndpointShell.leftAdjCount] using hl2
    omega
  · by_cases hr2 : 2 ≤ r_count
    · -- Branch: r = 2 (right-adjacent cap has two classmates) → N8a3_adjacent_one_hit (W7).
      -- Symmetric to the left branch: the open field is the interior-apex chain monotonicity
      -- for the right-adjacent cap (E3-L13 / G3); arc circle from `n7_circle_placement`.
      classical
      have hwit : ∃ W : N8AdjacentArcWitness,
          W.base.apex = x ∧ W.base.selectedRadius = r ∧
            W.base.arc.support = S.rightAdjacentInteriorByIndex i :=
        S.exists_rightAdjacentArcWitness hN4e i hx.cap_mem r
      obtain ⟨W, hWapex, hWrad, hWsupp⟩ := hwit
      have hone := S.N8a3_adjacent_one_hit hN4e W
      rw [hWapex, hWrad, hWsupp] at hone
      have hge2 : 2 ≤ (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex i).card := by
        simpa [FiniteEndpointShell.rightAdjCount] using hr2
      omega
    · by_cases hm2 : 2 ≤ m
      · -- Branch: m ≥ 2 (two or more Moser vertices in class) → N8b then N8e (W8)
        -- First extract two distinct Moser vertices from the class.
        have hm2_nat : 2 ≤ (SelectedClass A x r ∩ S.triangle.verts).card := hm2
        classical
        rcases Finset.exists_subset_card_eq (s := SelectedClass A x r ∩ S.triangle.verts) hm2_nat
          with ⟨E, hEsub, hEcard⟩
        rw [Finset.card_eq_two] at hEcard
        rcases hEcard with ⟨m₁, m₂, hm₁m₂_ne, hEeq⟩
        have hm₁_sel : m₁ ∈ SelectedClass A x r := by
          exact Finset.mem_of_mem_inter_left (hEsub (by simp [hEeq]))
        have hm₂_sel : m₂ ∈ SelectedClass A x r := by
          exact Finset.mem_of_mem_inter_left (hEsub (by simp [hEeq]))
        have hm₁_verts : m₁ ∈ S.triangle.verts := by
          exact Finset.mem_of_mem_inter_right (hEsub (by simp [hEeq]))
        have hm₂_verts : m₂ ∈ S.triangle.verts := by
          exact Finset.mem_of_mem_inter_right (hEsub (by simp [hEeq]))
        -- Build the N8MoserEndpointPair packet.
        let hMoser2 : N8MoserEndpointPair S i x r :=
          { m₁ := m₁
            m₂ := m₂
            m₁_moser := hm₁_verts
            m₂_moser := hm₂_verts
            m₁_mem := hm₁_sel
            m₂_mem := hm₂_sel
            m₁_ne_m₂ := hm₁m₂_ne }
        -- Case-split on whether `{m₁, m₂}` is exactly the two own endpoints of cap `i`.
        -- This is the *same* disjunction N8b's prose case-split uses (prose §2159–2166);
        -- by performing it here — at the W10 seam, where `exists_{left,right}AdjacentArcWitness`
        -- and `N8a3_adjacent_one_hit` are in scope — we route the NON-own-pair branch through
        -- N8b (whose non-own branch closes by the strict endpoint-chord distance bound) and
        -- handle the OWN-pair branch directly with the seam's interior-apex monotonicity tools.
        by_cases hown :
            (m₁ = S.ownLeftEndpointByIndex i ∧ m₂ = S.ownRightEndpointByIndex i) ∨
            (m₁ = S.ownRightEndpointByIndex i ∧ m₂ = S.ownLeftEndpointByIndex i)
        · -- OWN-pair branch.  `dist x m₁ = dist x m₂ = r` with `m₁, m₂` the two own
          -- endpoints pins `x` to the cap's perpendicular-bisector (midpoint) axis at the
          -- selected radius `r = 2·sin(π/12)`.  The two adjacent witnesses below are the
          -- *realizable* W10 seam structure (each adjacent cap is met by the selected
          -- circle in ≤ 1 point); the residual is the strictly-stronger `= 0` boundary
          -- fact (zero strict interior hits at the midpoint radius), which the one-hit
          -- export does not supply.
          classical
          -- The disjoint cover is now assembled (`hcover : 4 ≤ m + s + l + r_count`).  With the
          -- left/right one-hit bounds `l ≤ 1`, `r_count ≤ 1` (from `hl2`, `hr2`) AND the same-cap
          -- one-hit `s ≤ 1` (`sameCapCount_le_one`: own cap interior has card 2 ∋ x, so its
          -- x-erasure has card 1) this pins the surviving tuple to the exact `(2, 0, 1, 1)`.
          have hl1 : l ≤ 1 := by omega
          have hr1 : r_count ≤ 1 := by omega
          have hs1 : s ≤ 1 := S.sameCapCount_le_one i r hx.cap_mem
          -- The four ≤-bounds + the cover force (m, s, l, r_count) = (2, 0, 1, 1) exactly:
          -- m ≤ 2 (only three Moser vertices, and own-pair excludes the apex vertex), s ≤ 1,
          -- l ≤ 1, r_count ≤ 1, with 4 ≤ m + s + l + r_count ⟹ m = 2, s = 0, l = 1, r_count = 1.
          -- The two W10 adjacent-arc witnesses are available here (apex `x ∈ cap interior`).
          obtain ⟨_Wl, _, _, _⟩ := S.exists_leftAdjacentArcWitness hN4e i hx.cap_mem r
          obtain ⟨_Wr, _, _, _⟩ := S.exists_rightAdjacentArcWitness hN4e i hx.cap_mem r
          -- The interior-apex frame data pins the cap-`i` apex `vₖ` at distance `d` from `x`
          -- (`dist x vₖ = d`), the realizable input separating `vₖ` from the selected radius.
          obtain ⟨_v₁, _v₂, _v₃, _, _, _, _, _hx1, _⟩ := S.exists_apexFrameData hN4e i hx.cap_mem
          -- ARITHMETIC SKELETON (axiom-free).  The disjoint cover `hcover : 4 ≤ m + s + l +
          -- r_count` plus the own cap one-hit `hs1 : s ≤ 1`, GATE 1 (`m ≤ 2`, now CLOSED), and
          -- the TWO crisp geometric residuals below force `4 ≤ 2 + 1 + 0 + 0 = 3`, contradiction.
          -- math-professor analysis (2026-06-13, memory E5XDGV/D09QKT) verified the geometry
          -- numerically at high precision; the two remaining FORMAL producers are the residual.
          --
          -- Trivial cardinality bound: only three Moser vertices exist, so `m ≤ 3`.
          have hm3 : m ≤ 3 := by
            simp only [hm_def, FiniteEndpointShell.moserCount]
            calc (SelectedClass A x r ∩ S.triangle.verts).card
                ≤ S.triangle.verts.card :=
                  Finset.card_le_card Finset.inter_subset_right
              _ = 3 := S.triangle.verts_card
          -- GATE 1 — apex Moser vertex excluded (`m ≤ 2`).  CLOSED.  Unconditional for any
          -- interior apex: the apex-opposite Moser vertex sits at distance `d` (the equilateral
          -- side) from `x`; if all three vertices lay in the class they would all be at distance
          -- `r` from `x`, forcing `r = d` and three equilateral vertices at distance equal to the
          -- side length — impossible (`no_equidistant_apex_at_side`, the circumradius is `d/√3`).
          have hm_le2 : m ≤ 2 := by
            rw [hm_def]
            exact S.apexFrame_moserCount_le_two hN4e i hx.cap_mem r
          -- GATE 2 — left adjacent open cap empty at the own-pair config (`l = 0`).  The selected
          -- circle `S(x, r)` meets the left-adjacent ambient circle `S(v_adj, d)` in EXACTLY two
          -- points: the shared Moser endpoint `e` (a triangle vertex, NOT an open-cap interior
          -- point) and the centre-line reflection `o` of `e` across line `x v_adj` (`o` strictly
          -- OUTSIDE the open adjacent arc, angle −30° vs open arc (−120°,−60°)).  Hence the open
          -- left cap interior carries ZERO selected-class hits.
          -- REDUCED: `adjacentInterior_empty_of_reflection` (above) consumes `_Wl` and the shared
          -- endpoint `e` (`dist e x = r`, `dist e v_adj = d`, `e ∉ I_left`, `e` off line `x v_adj`)
          -- and constructs `o = reflection e` with its two circle memberships FOR FREE
          -- (`dist_reflection_eq_of_mem`), collapsing the gate to the SINGLE residual
          -- `reflection (line[x, v_adj]) e ∉ I_left` (the angular −30° exclusion).  RESIDUAL
          -- PRODUCER: the own-pair shared-endpoint construction (`e` from `hown`) + that angular
          -- fact (memory E5XDGV; verified numerically at high precision).
          -- GATE 2 — left adjacent open cap empty (`l = 0`).
          -- Any w ∈ SelectedClass A x r ∩ I_left lies on S(x,r) ∩ S(v_adj,d) where
          -- v_adj = ownLeftEndpointByIndex i.  The own-right endpoint v_right =
          -- ownRightEndpointByIndex i is a known common point (dist x v_right = r from hown;
          -- dist v_adj v_right = d equilateral distance; v_right ∉ I_left since it's a
          -- Moser vertex erased from the open interior).  The reflection o of v_right across
          -- line[x, v_adj] is the second common point (distance-preserving reflection).
          -- Non-collinearity of x, v_adj, v_right (from ConvexIndep A) ensures v_right ≠ o.
          -- two_circle_common_point_eq_endpoint then gives w = v_right (excluded) or w = o.
          -- The remaining gap is the angular −30° exclusion: o ∉ I_left.
          have hadj_l0 : l = 0 := by
            simp only [hl_def, FiniteEndpointShell.leftAdjCount]
            obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
            have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
            have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
            have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
            fin_cases i
            -- ── i = 0: leftAdj = I2, v_adj = v2, v_right = v3 ─────────────────────────────
            · simp only [leftAdjacentInteriorByIndex]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v3 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel) (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel)
              have hx_cap : x ∈ S.I1 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I1, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv3, hxv2, hxC1⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C1_subset hxC1
              have hncol : S.triangle.v3 ∉ affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²) :=
                fun hmem => S.hconv.not_three_collinear S.triangle.v3_mem hxA S.triangle.v2_mem
                  hxv3.symm S.triangle.v23_ne.symm hxv2
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I2
              have hw_C2 : w ∈ S.CP.C2 := by
                rw [I2, Finset.mem_erase, Finset.mem_erase] at hw_I2; exact hw_I2.2.2
              set s := affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv2s : S.triangle.v2 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v3
              have hv3_r : dist x S.triangle.v3 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v3).trans hv3_r
              have ho_d : dist S.triangle.v2 o = d :=
                (dist_reflection_eq_of_mem s hv2s S.triangle.v3).trans e23
              have hv3_ne_o : S.triangle.v3 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v3).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v2, d⟩ from
                    fun h => hxv2 (congrArg Sphere.center h))
                  hv3_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v3 ▸ hv3_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 S.triangle.v3 ▸ e23))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 w ▸ hC2 w hw_C2))
                with hwv3 | hwo
              · exact absurd (Finset.mem_of_mem_erase (hwv3 ▸ hw_I2)) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I2)
                  (by -- Angular −30° excl. Gate 2 i=0: o ∉ I2
                      -- x ∈ C1 and o ∈ C2; show o ∈ C1 (angular) → contradiction
                      intro ho_I2
                      simp only [I2, mem_erase] at ho_I2
                      obtain ⟨ho_ne_v1, ho_ne_v3, ho_C2⟩ := ho_I2
                      have ho_A : o ∈ A := S.CP.C2_subset ho_C2
                      have hxv2_r : dist x S.triangle.v2 = r :=
                        hown.elim (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                                  (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v3 o) x S.triangle.v2 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv3_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact e23)
                          hv3_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v2 = -signedArea2 x S.triangle.v2 S.triangle.v3 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v2)
                                   (y := S.triangle.v3) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v3 x S.triangle.v2 =
                            signedArea2 x S.triangle.v2 S.triangle.v3 := by simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v2 ^ 2 * signedArea2 o S.triangle.v2 S.triangle.v3 =
                          dist S.triangle.v2 S.triangle.v3 ^ 2 * signedArea2 x S.triangle.v2 S.triangle.v3 :=
                        angular_prop_dist x S.triangle.v2 S.triangle.v3 o
                          (by rw [hxv2_r, hv3_r]) (by rw [e23, ho_d])
                          (by rw [ho_r, hv3_r]) hsa
                      have hxC1_arc := (S.CP.arc_membership x hxA).1.mp hxC1
                      have hdxv2_sq : 0 < dist x S.triangle.v2 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv2)
                      have hd23_sq : 0 < dist S.triangle.v2 S.triangle.v3 ^ 2 := by
                        rw [e23]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v2 S.triangle.v3 *
                          signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 := by
                        have h1 : dist x S.triangle.v2 ^ 2 *
                            (signedArea2 o S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) =
                            dist S.triangle.v2 S.triangle.v3 ^ 2 *
                            (signedArea2 x S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) := by
                          linear_combination signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 * hprop
                        nlinarith [mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd23_sq) hxC1_arc]
                      have ho_C1 : o ∈ S.CP.C1 := (S.CP.arc_membership o ho_A).1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact ho_ne_v1 h
                        · rcases mem_insert.mp hov with h | hov
                          · exact S.CP.v2_notin_C2 (h ▸ ho_C2)
                          · exact hv3_ne_o (mem_singleton.mp hov).symm
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C2, ite_true, ite_false] at hone
                        omega)
            -- ── i = 1: leftAdj = I3, v_adj = v3, v_right = v1 ─────────────────────────────
            · simp only [leftAdjacentInteriorByIndex]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v1 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel) (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel)
              have hx_cap : x ∈ S.I2 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I2, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv1, hxv3, hxC2⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C2_subset hxC2
              have hncol : S.triangle.v1 ∉ affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²) :=
                fun hmem => S.hconv.not_three_collinear S.triangle.v1_mem hxA S.triangle.v3_mem
                  hxv1.symm S.triangle.v13_ne hxv3
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I3
              have hw_C3 : w ∈ S.CP.C3 := by
                rw [I3, Finset.mem_erase, Finset.mem_erase] at hw_I3; exact hw_I3.2.2
              set s := affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv3s : S.triangle.v3 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v1
              have hv1_r : dist x S.triangle.v1 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv1_d : dist S.triangle.v3 S.triangle.v1 = d := by
                rw [dist_comm]; exact e13
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v1).trans hv1_r
              have ho_d : dist S.triangle.v3 o = d :=
                (dist_reflection_eq_of_mem s hv3s S.triangle.v1).trans hv1_d
              have hv1_ne_o : S.triangle.v1 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v1).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v3, d⟩ from
                    fun h => hxv3 (congrArg Sphere.center h))
                  hv1_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v1 ▸ hv1_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 S.triangle.v1 ▸ hv1_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 w ▸ hC3 w hw_C3))
                with hwv1 | hwo
              · exact absurd (Finset.mem_of_mem_erase (hwv1 ▸ hw_I3)) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I3)
                  (by -- Angular −30° excl. Gate 2 i=1: o ∉ I3
                      -- x ∈ C2 and o ∈ C3; show o ∈ C2 (angular) → contradiction
                      intro ho_I3
                      simp only [I3, mem_erase] at ho_I3
                      obtain ⟨ho_ne_v2, ho_ne_v1, ho_C3⟩ := ho_I3
                      have ho_A : o ∈ A := S.CP.C3_subset ho_C3
                      have hxv3_r : dist x S.triangle.v3 = r :=
                        hown.elim (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                                  (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v1 o) x S.triangle.v3 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv1_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv1_d)
                          hv1_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v3 =
                          -signedArea2 x S.triangle.v3 S.triangle.v1 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v3)
                                   (y := S.triangle.v1) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v1 x S.triangle.v3 =
                            signedArea2 x S.triangle.v3 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v3 ^ 2 *
                          signedArea2 o S.triangle.v3 S.triangle.v1 =
                          dist S.triangle.v3 S.triangle.v1 ^ 2 *
                          signedArea2 x S.triangle.v3 S.triangle.v1 :=
                        angular_prop_dist x S.triangle.v3 S.triangle.v1 o
                          (by rw [hxv3_r, hv1_r]) (by rw [hv1_d, ho_d])
                          (by rw [ho_r, hv1_r]) hsa
                      have hxC2_arc := (S.CP.arc_membership x hxA).2.1.mp hxC2
                      have hdxv3_sq : 0 < dist x S.triangle.v3 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv3)
                      have hd31_sq : 0 < dist S.triangle.v3 S.triangle.v1 ^ 2 := by
                        rw [hv1_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v3 S.triangle.v1 *
                          signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 := by
                        have h1 : dist x S.triangle.v3 ^ 2 *
                            (signedArea2 o S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) =
                            dist S.triangle.v3 S.triangle.v1 ^ 2 *
                            (signedArea2 x S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) := by
                          linear_combination
                            signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 * hprop
                        nlinarith [mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd31_sq) hxC2_arc]
                      have ho_C2 : o ∈ S.CP.C2 := (S.CP.arc_membership o ho_A).2.1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact ho_ne_v1 h
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact S.CP.v3_notin_C3 (mem_singleton.mp hov ▸ ho_C3)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C2, ho_C3, ite_true, ite_false] at hone
                        omega)
            -- ── i = 2: leftAdj = I1, v_adj = v1, v_right = v2 ─────────────────────────────
            · simp only [leftAdjacentInteriorByIndex]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v2 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel) (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel)
              have hx_cap : x ∈ S.I3 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I3, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv2, hxv1, hxC3⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C3_subset hxC3
              have hncol : S.triangle.v2 ∉ affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²) :=
                fun hmem => S.hconv.not_three_collinear S.triangle.v2_mem hxA S.triangle.v1_mem
                  hxv2.symm S.triangle.v12_ne.symm hxv1
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I1
              have hw_C1 : w ∈ S.CP.C1 := by
                rw [I1, Finset.mem_erase, Finset.mem_erase] at hw_I1; exact hw_I1.2.2
              set s := affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv1s : S.triangle.v1 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v2
              have hv2_r : dist x S.triangle.v2 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v2).trans hv2_r
              have ho_d : dist S.triangle.v1 o = d :=
                (dist_reflection_eq_of_mem s hv1s S.triangle.v2).trans e12
              have hv2_ne_o : S.triangle.v2 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v2).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v1, d⟩ from
                    fun h => hxv1 (congrArg Sphere.center h))
                  hv2_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v2 ▸ hv2_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 S.triangle.v2 ▸ e12))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 w ▸ hC1 w hw_C1))
                with hwv2 | hwo
              · exact absurd (Finset.mem_of_mem_erase (hwv2 ▸ hw_I1)) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I1)
                  (by -- Angular −30° excl. Gate 2 i=2: o ∉ I1
                      -- x ∈ C3 and o ∈ C1; show o ∈ C3 (angular) → contradiction
                      intro ho_I1
                      simp only [I1, mem_erase] at ho_I1
                      obtain ⟨ho_ne_v3, ho_ne_v2, ho_C1⟩ := ho_I1
                      have ho_A : o ∈ A := S.CP.C1_subset ho_C1
                      have hxv1_r : dist x S.triangle.v1 = r :=
                        hown.elim (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                                  (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v2 o) x S.triangle.v1 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv2_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact e12)
                          hv2_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v1 =
                          -signedArea2 x S.triangle.v1 S.triangle.v2 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v1)
                                   (y := S.triangle.v2) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v2 x S.triangle.v1 =
                            signedArea2 x S.triangle.v1 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v1 ^ 2 *
                          signedArea2 o S.triangle.v1 S.triangle.v2 =
                          dist S.triangle.v1 S.triangle.v2 ^ 2 *
                          signedArea2 x S.triangle.v1 S.triangle.v2 :=
                        angular_prop_dist x S.triangle.v1 S.triangle.v2 o
                          (by rw [hxv1_r, hv2_r]) (by rw [e12, ho_d])
                          (by rw [ho_r, hv2_r]) hsa
                      have hxC3_arc := (S.CP.arc_membership x hxA).2.2.mp hxC3
                      have hdxv1_sq : 0 < dist x S.triangle.v1 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv1)
                      have hd12_sq : 0 < dist S.triangle.v1 S.triangle.v2 ^ 2 := by
                        rw [e12]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v1 S.triangle.v2 *
                          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 := by
                        have h1 : dist x S.triangle.v1 ^ 2 *
                            (signedArea2 o S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) =
                            dist S.triangle.v1 S.triangle.v2 ^ 2 *
                            (signedArea2 x S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
                          linear_combination
                            signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 * hprop
                        nlinarith [mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd12_sq) hxC3_arc]
                      have ho_C3 : o ∈ S.CP.C3 := (S.CP.arc_membership o ho_A).2.2.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact absurd (h ▸ ho_C1) S.CP.v1_notin_C1
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact ho_ne_v3 (mem_singleton.mp hov)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C3, ite_true, ite_false] at hone
                        omega)
          -- GATE 3 — right adjacent open cap empty (`r_count = 0`).  Symmetric to GATE 2:
          -- v_right = ownLeftEndpointByIndex i, v_adj = ownRightEndpointByIndex i.
          have hadj_r0 : r_count = 0 := by
            simp only [hr_count_def, FiniteEndpointShell.rightAdjCount]
            obtain ⟨d, hdpos, hC1, hC2, hC3⟩ := S.n7_circle_placement hN4e
            have e12 : dist S.triangle.v1 S.triangle.v2 = d := hC1 _ S.CP.v2_mem_C1
            have e13 : dist S.triangle.v1 S.triangle.v3 = d := hC1 _ S.CP.v3_mem_C1
            have e23 : dist S.triangle.v2 S.triangle.v3 = d := hC2 _ S.CP.v3_mem_C2
            fin_cases i
            -- ── i = 0: rightAdj = I3, v_adj = v3, v_right = v2 ────────────────────────────
            · simp only [rightAdjacentInteriorByIndex]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v2 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel) (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel)
              have hx_cap : x ∈ S.I1 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I1, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv3, hxv2, hxC1⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C1_subset hxC1
              have hncol : S.triangle.v2 ∉ affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²) :=
                fun hmem => S.hconv.not_three_collinear S.triangle.v2_mem hxA S.triangle.v3_mem
                  hxv2.symm S.triangle.v23_ne hxv3
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I3
              have hw_C3 : w ∈ S.CP.C3 := by
                rw [I3, Finset.mem_erase, Finset.mem_erase] at hw_I3; exact hw_I3.2.2
              set s := affineSpan ℝ ({x, S.triangle.v3} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv3s : S.triangle.v3 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v2
              have hv2_r : dist x S.triangle.v2 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv2_d : dist S.triangle.v3 S.triangle.v2 = d := by
                rw [dist_comm]; exact e23
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v2).trans hv2_r
              have ho_d : dist S.triangle.v3 o = d :=
                (dist_reflection_eq_of_mem s hv3s S.triangle.v2).trans hv2_d
              have hv2_ne_o : S.triangle.v2 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v2).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v3, d⟩ from
                    fun h => hxv3 (congrArg Sphere.center h))
                  hv2_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v2 ▸ hv2_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 S.triangle.v2 ▸ hv2_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v3 w ▸ hC3 w hw_C3))
                with hwv2 | hwo
              · exact absurd (hwv2 ▸ hw_I3) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I3)
                  (by -- Angular −30° excl. Gate 3 i=0: o ∉ I3
                      -- x ∈ C1 and o ∈ C3; show o ∈ C1 (angular) → contradiction
                      intro ho_I3
                      simp only [I3, mem_erase] at ho_I3
                      obtain ⟨ho_ne_v2, ho_ne_v1, ho_C3⟩ := ho_I3
                      have ho_A : o ∈ A := S.CP.C3_subset ho_C3
                      have hxv3_r : dist x S.triangle.v3 = r :=
                        hown.elim (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                                  (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v2 o) x S.triangle.v3 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv2_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv2_d)
                          hv2_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v3 =
                          -signedArea2 x S.triangle.v3 S.triangle.v2 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v3)
                                   (y := S.triangle.v2) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v2 x S.triangle.v3 =
                            signedArea2 x S.triangle.v3 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v3 ^ 2 *
                          signedArea2 o S.triangle.v2 S.triangle.v3 =
                          dist S.triangle.v3 S.triangle.v2 ^ 2 *
                          signedArea2 x S.triangle.v2 S.triangle.v3 := by
                        have hprop_swap := angular_prop_dist x S.triangle.v3 S.triangle.v2 o
                          (by rw [hxv3_r, hv2_r]) (by rw [hv2_d, ho_d])
                          (by rw [ho_r, hv2_r]) hsa
                        have hs_o : signedArea2 o S.triangle.v3 S.triangle.v2 =
                            -signedArea2 o S.triangle.v2 S.triangle.v3 := by
                          simp only [signedArea2]; ring
                        have hs_x : signedArea2 x S.triangle.v3 S.triangle.v2 =
                            -signedArea2 x S.triangle.v2 S.triangle.v3 := by
                          simp only [signedArea2]; ring
                        rw [hs_o, hs_x] at hprop_swap; linarith
                      have hxC1_arc := (S.CP.arc_membership x hxA).1.mp hxC1
                      have hdxv3_sq : 0 < dist x S.triangle.v3 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv3)
                      have hd32_sq : 0 < dist S.triangle.v3 S.triangle.v2 ^ 2 := by
                        rw [hv2_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v2 S.triangle.v3 *
                          signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 := by
                        have h1 : dist x S.triangle.v3 ^ 2 *
                            (signedArea2 o S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) =
                            dist S.triangle.v3 S.triangle.v2 ^ 2 *
                            (signedArea2 x S.triangle.v2 S.triangle.v3 *
                             signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) := by
                          linear_combination
                            signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 * hprop
                        nlinarith [mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd32_sq) hxC1_arc]
                      have ho_C1 : o ∈ S.CP.C1 := (S.CP.arc_membership o ho_A).1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact absurd (h ▸ ho_C1) S.CP.v1_notin_C1
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact absurd (mem_singleton.mp hov ▸ ho_C3) S.CP.v3_notin_C3
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C3, ite_true, ite_false] at hone
                        omega)
            -- ── i = 1: rightAdj = I1, v_adj = v1, v_right = v3 ────────────────────────────
            · simp only [rightAdjacentInteriorByIndex]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v3 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel) (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel)
              have hx_cap : x ∈ S.I2 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I2, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv1, hxv3, hxC2⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C2_subset hxC2
              have hncol : S.triangle.v3 ∉ affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²) :=
                fun hmem => S.hconv.not_three_collinear S.triangle.v3_mem hxA S.triangle.v1_mem
                  hxv3.symm S.triangle.v13_ne.symm hxv1
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I1
              have hw_C1 : w ∈ S.CP.C1 := by
                rw [I1, Finset.mem_erase, Finset.mem_erase] at hw_I1; exact hw_I1.2.2
              set s := affineSpan ℝ ({x, S.triangle.v1} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv1s : S.triangle.v1 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v3
              have hv3_r : dist x S.triangle.v3 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv3_d : dist S.triangle.v1 S.triangle.v3 = d := e13
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v3).trans hv3_r
              have ho_d : dist S.triangle.v1 o = d :=
                (dist_reflection_eq_of_mem s hv1s S.triangle.v3).trans hv3_d
              have hv3_ne_o : S.triangle.v3 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v3).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v1, d⟩ from
                    fun h => hxv1 (congrArg Sphere.center h))
                  hv3_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v3 ▸ hv3_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 S.triangle.v3 ▸ hv3_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v1 w ▸ hC1 w hw_C1))
                with hwv3 | hwo
              · exact absurd (hwv3 ▸ hw_I1) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I1)
                  (by -- Angular −30° excl. Gate 3 i=1: o ∉ I1
                      -- x ∈ C2 and o ∈ C1; show o ∈ C2 (angular) → contradiction
                      intro ho_I1
                      simp only [I1, mem_erase] at ho_I1
                      obtain ⟨ho_ne_v3, ho_ne_v2, ho_C1⟩ := ho_I1
                      have ho_A : o ∈ A := S.CP.C1_subset ho_C1
                      have hxv1_r : dist x S.triangle.v1 = r :=
                        hown.elim (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                                  (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v3 o) x S.triangle.v1 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv3_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv3_d)
                          hv3_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v1 =
                          -signedArea2 x S.triangle.v1 S.triangle.v3 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v1)
                                   (y := S.triangle.v3) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v3 x S.triangle.v1 =
                            signedArea2 x S.triangle.v1 S.triangle.v3 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v1 ^ 2 *
                          signedArea2 o S.triangle.v3 S.triangle.v1 =
                          dist S.triangle.v1 S.triangle.v3 ^ 2 *
                          signedArea2 x S.triangle.v3 S.triangle.v1 := by
                        have hprop_swap := angular_prop_dist x S.triangle.v1 S.triangle.v3 o
                          (by rw [hxv1_r, hv3_r]) (by rw [hv3_d, ho_d])
                          (by rw [ho_r, hv3_r]) hsa
                        have hs_o : signedArea2 o S.triangle.v1 S.triangle.v3 =
                            -signedArea2 o S.triangle.v3 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        have hs_x : signedArea2 x S.triangle.v1 S.triangle.v3 =
                            -signedArea2 x S.triangle.v3 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        rw [hs_o, hs_x] at hprop_swap; linarith
                      have hxC2_arc := (S.CP.arc_membership x hxA).2.1.mp hxC2
                      have hdxv1_sq : 0 < dist x S.triangle.v1 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv1)
                      have hd13_sq : 0 < dist S.triangle.v1 S.triangle.v3 ^ 2 := by
                        rw [hv3_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v3 S.triangle.v1 *
                          signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 ≤ 0 := by
                        have h1 : dist x S.triangle.v1 ^ 2 *
                            (signedArea2 o S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) =
                            dist S.triangle.v1 S.triangle.v3 ^ 2 *
                            (signedArea2 x S.triangle.v3 S.triangle.v1 *
                             signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1) := by
                          linear_combination
                            signedArea2 S.triangle.v2 S.triangle.v3 S.triangle.v1 * hprop
                        nlinarith [mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd13_sq) hxC2_arc]
                      have ho_C2 : o ∈ S.CP.C2 := (S.CP.arc_membership o ho_A).2.1.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact absurd (h ▸ ho_C1) S.CP.v1_notin_C1
                        · rcases mem_insert.mp hov with h | hov
                          · exact ho_ne_v2 h
                          · exact ho_ne_v3 (mem_singleton.mp hov)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C1, ho_C2, ite_true, ite_false] at hone
                        omega)
            -- ── i = 2: rightAdj = I2, v_adj = v2, v_right = v1 ────────────────────────────
            · simp only [rightAdjacentInteriorByIndex]
              simp only [ownLeftEndpointByIndex, ownRightEndpointByIndex] at hown
              have hv_right_sel : S.triangle.v1 ∈ SelectedClass A x r :=
                hown.elim (fun ⟨h1, _⟩ => h1 ▸ hm₁_sel) (fun ⟨_, h2⟩ => h2 ▸ hm₂_sel)
              have hx_cap : x ∈ S.I3 := by
                have h := hx.cap_mem; simp only [capInteriorByIndex] at h; exact h
              rw [I3, Finset.mem_erase, Finset.mem_erase] at hx_cap
              obtain ⟨hxv2, hxv1, hxC3⟩ := hx_cap
              have hxA : x ∈ A := S.CP.C3_subset hxC3
              have hncol : S.triangle.v1 ∉ affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²) :=
                fun hmem => S.hconv.not_three_collinear S.triangle.v1_mem hxA S.triangle.v2_mem
                  hxv1.symm S.triangle.v12_ne hxv2
                  (collinear_insert_of_mem_affineSpan_pair hmem)
              rw [Finset.card_eq_zero]; ext w
              simp only [Finset.mem_inter, Finset.notMem_empty, iff_false, not_and]
              intro hw_sel hw_I2
              have hw_C2 : w ∈ S.CP.C2 := by
                rw [I2, Finset.mem_erase, Finset.mem_erase] at hw_I2; exact hw_I2.2.2
              set s := affineSpan ℝ ({x, S.triangle.v2} : Set ℝ²)
              have hxs : x ∈ s := subset_affineSpan _ _ (by simp)
              have hv2s : S.triangle.v2 ∈ s := subset_affineSpan _ _ (by simp)
              haveI : Nonempty s := ⟨⟨x, hxs⟩⟩
              set o := EuclideanGeometry.reflection s S.triangle.v1
              have hv1_r : dist x S.triangle.v1 = r :=
                (mem_selectedClass.mp hv_right_sel).2
              have hv1_d : dist S.triangle.v2 S.triangle.v1 = d := by
                rw [dist_comm]; exact e12
              have ho_r : dist x o = r :=
                (dist_reflection_eq_of_mem s hxs S.triangle.v1).trans hv1_r
              have ho_d : dist S.triangle.v2 o = d :=
                (dist_reflection_eq_of_mem s hv2s S.triangle.v1).trans hv1_d
              have hv1_ne_o : S.triangle.v1 ≠ o := fun heq =>
                hncol ((reflection_eq_self_iff S.triangle.v1).mp heq.symm)
              rcases two_circle_common_point_eq_endpoint
                  (show (⟨x, r⟩ : Sphere ℝ²) ≠ ⟨S.triangle.v2, d⟩ from
                    fun h => hxv2 (congrArg Sphere.center h))
                  hv1_ne_o
                  (mem_sphere.mpr (dist_comm x S.triangle.v1 ▸ hv1_r))
                  (mem_sphere.mpr (dist_comm x o ▸ ho_r))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 S.triangle.v1 ▸ hv1_d))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 o ▸ ho_d))
                  (mem_sphere.mpr (dist_comm x w ▸ (mem_selectedClass.mp hw_sel).2))
                  (mem_sphere.mpr (dist_comm S.triangle.v2 w ▸ hC2 w hw_C2))
                with hwv1 | hwo
              · exact absurd (hwv1 ▸ hw_I2) (Finset.notMem_erase _ _)
              · exact absurd (hwo ▸ hw_I2)
                  (by -- Angular −30° excl. Gate 3 i=2: o ∉ I2
                      -- x ∈ C3 and o ∈ C2; show o ∈ C3 (angular) → contradiction
                      intro ho_I2
                      simp only [I2, mem_erase] at ho_I2
                      obtain ⟨ho_ne_v1, ho_ne_v3, ho_C2⟩ := ho_I2
                      have ho_A : o ∈ A := S.CP.C2_subset ho_C2
                      have hxv2_r : dist x S.triangle.v2 = r :=
                        hown.elim (fun ⟨_, h⟩ => h ▸ (mem_selectedClass.mp hm₂_sel).2)
                                  (fun ⟨h, _⟩ => h ▸ (mem_selectedClass.mp hm₁_sel).2)
                      have hmid : signedArea2 (midpoint ℝ S.triangle.v1 o) x S.triangle.v2 = 0 :=
                        twoCircle_midpoint_collinear (rq := r) (rv := d)
                          (by rw [dist_comm]; exact ho_r) (by rw [dist_comm]; exact hv1_r)
                          (by rw [dist_comm]; exact ho_d) (by rw [dist_comm]; exact hv1_d)
                          hv1_ne_o.symm
                      have hsa : signedArea2 o x S.triangle.v2 =
                          -signedArea2 x S.triangle.v2 S.triangle.v1 := by
                        have := signedArea2_reflection_neg (q := x) (v2 := S.triangle.v2)
                                   (y := S.triangle.v1) (u := o) hmid
                        have hcyc : signedArea2 S.triangle.v1 x S.triangle.v2 =
                            signedArea2 x S.triangle.v2 S.triangle.v1 := by
                          simp only [signedArea2]; ring
                        rw [this, hcyc]
                      have hprop : dist x S.triangle.v2 ^ 2 *
                          signedArea2 o S.triangle.v1 S.triangle.v2 =
                          dist S.triangle.v2 S.triangle.v1 ^ 2 *
                          signedArea2 x S.triangle.v1 S.triangle.v2 := by
                        have hprop_swap := angular_prop_dist x S.triangle.v2 S.triangle.v1 o
                          (by rw [hxv2_r, hv1_r]) (by rw [hv1_d, ho_d])
                          (by rw [ho_r, hv1_r]) hsa
                        have hs_o : signedArea2 o S.triangle.v2 S.triangle.v1 =
                            -signedArea2 o S.triangle.v1 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        have hs_x : signedArea2 x S.triangle.v2 S.triangle.v1 =
                            -signedArea2 x S.triangle.v1 S.triangle.v2 := by
                          simp only [signedArea2]; ring
                        rw [hs_o, hs_x] at hprop_swap; linarith
                      have hxC3_arc := (S.CP.arc_membership x hxA).2.2.mp hxC3
                      have hdxv2_sq : 0 < dist x S.triangle.v2 ^ 2 :=
                        sq_pos_of_pos (dist_pos.mpr hxv2)
                      have hd21_sq : 0 < dist S.triangle.v2 S.triangle.v1 ^ 2 := by
                        rw [hv1_d]; exact sq_pos_of_pos hdpos
                      have hprod : signedArea2 o S.triangle.v1 S.triangle.v2 *
                          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≤ 0 := by
                        have h1 : dist x S.triangle.v2 ^ 2 *
                            (signedArea2 o S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) =
                            dist S.triangle.v2 S.triangle.v1 ^ 2 *
                            (signedArea2 x S.triangle.v1 S.triangle.v2 *
                             signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
                          linear_combination
                            signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 * hprop
                        nlinarith [mul_nonpos_of_nonneg_of_nonpos (le_of_lt hd21_sq) hxC3_arc]
                      have ho_C3 : o ∈ S.CP.C3 := (S.CP.arc_membership o ho_A).2.2.mpr hprod
                      by_cases hov : o ∈ S.triangle.verts
                      · simp only [MoserTriangle.verts] at hov
                        rcases mem_insert.mp hov with h | hov
                        · exact ho_ne_v1 h
                        · rcases mem_insert.mp hov with h | hov
                          · exact absurd (h ▸ ho_C2) S.CP.v2_notin_C2
                          · exact ho_ne_v3 (mem_singleton.mp hov)
                      · have hone := S.CP.nonmoser_in_one o ho_A hov
                        simp only [ho_C2, ho_C3, ite_true, ite_false] at hone
                        omega)
          -- Cardinality contradiction: `4 ≤ m + s + l + r_count ≤ 2 + 1 + 0 + 0 = 3`.
          omega
        · -- NON-own-pair branch.  The endpoint-chord distance bound closes via N8b:
          -- since `{m₁, m₂} ≠ {ownLeft, ownRight}` the pair contains the apex vᵢ,
          -- forcing `hx.radius = d`, so the other Moser vertex lands in the wrong cap.
          exact S.N8b_endpoint_pair_split hN4e hx hMoser2 hown
      · -- Branch: m ≤ 1, l ≤ 1, r_count ≤ 1.
        -- Since card ≥ 4 and classmates come from s + m + l + r_count positions,
        -- the only surviving tuple is (1,1,1,1): in particular `s ≥ 1`, so the
        -- selected class contains a same-cap classmate.  We route the residual to
        -- N8h (endpoint-Moser) or N8i (cap-center), both of which consume an
        -- `N8SameCapClassPacket hN4e x i`.
        classical
        -- The selected class is nonempty (card ≥ 4 > 0), so it has a member `v`
        -- with `dist x v = r`; that member sits on the apex-centred selected
        -- circle and supplies the packet's `center`/`radius` data.
        have hpos : 0 < (SelectedClass A x r).card :=
          lt_of_lt_of_le (by norm_num) hx.selected_card
        obtain ⟨v, hv⟩ := Finset.card_pos.mp hpos
        have hxv : dist x v = r := (mem_selectedClass.mp hv).2
        -- Build the apex-centred same-cap packet: centre `v`, radius `r`, with `x`
        -- on the selected circle through `dist x v = r`.
        let hx_pkt : S.N8SameCapClassPacket hN4e x i :=
          { center := v
            radius := r
            radius_pos := hx.radius_pos
            x_on_selected_circle := hxv }
        -- Routing: in the (1,1,1,1) same-cap configuration the residual is either
        -- the endpoint-Moser two-circle obstruction (N8h) or the cap-center
        -- full-width obstruction (N8i).  Both `false` lemmas are PROVED; the open
        -- input is the geometric witness packet (adjacent-cap centre / full-width
        -- reference / arc-angle data) built from the shell's ordered-chain data —
        -- the same interior-apex monotonicity geometry gating the sibling branches.
        by_cases hCapCenter : Nonempty (S.N8iCapCenterPacket hx_pkt)
        · -- Cap-center subcase: discharge via N8i.
          obtain ⟨hi⟩ := hCapCenter
          exact S.N8i_capcenter_fullwidth_false hN4e hx_pkt hi
        · -- Endpoint-Moser subcase.  RESTRUCTURED 2026-06-13 (Adam-approved this session):
          -- the `N8hEndpointMoserPacket` is STRUCTURALLY UNFILLABLE — it demands THREE distinct
          -- common points (sharedEndpoint / outsidePoint / adjacentWitness) on BOTH the selected
          -- circle `S(x, r)` and the adjacent-cap circle `S(v_adj, d)`, but two distinct circles
          -- meet in ≤ 2 points.  Trying to *build* that packet is the wrong shape (memory 60PN4J).
          -- We therefore BYPASS the packet entirely and drive at `False` directly, with the
          -- adjacent-arc witnesses + apex frame in scope at this seam.
          --
          -- The disjoint cover is PROVED (`selected_le_groupSum`, `hcover`).  Together with the
          -- four one-hit bounds — `hm1 : m ≤ 1` (branch `¬ 2 ≤ m`), `hl1 : l ≤ 1` / `hr1 :
          -- r_count ≤ 1` (W7 adjacent one-hit, branches `¬ 2 ≤ l` / `¬ 2 ≤ r_count`), and the NEW
          -- same-cap one-hit `hs1 : s ≤ 1` (`sameCapCount_le_one`, pure cardinality) — `hcover`
          -- PINS the distribution to `(m, s, l, r) = (1, 1, 1, 1)` EXACTLY (each summand is both
          -- `≤ 1` and, by the budget, `≥ 1`).  This RETIRES the old gate's point (b) and removes
          -- the structurally-wrong packet from the proof obligation.
          have hm1 : m ≤ 1 := by omega
          have hl1 : l ≤ 1 := by omega
          have hr1 : r_count ≤ 1 := by omega
          have hs1le : s ≤ 1 := S.sameCapCount_le_one i r hx.cap_mem
          have hs1 : 1 ≤ s := by omega
          have hl1ge : 1 ≤ l := by omega
          have hr1ge : 1 ≤ r_count := by omega
          have hm1ge : 1 ≤ m := by omega
          -- CLOSED (m=1 endpoint-reflection route): the unique selected Moser vertex `vm`
          -- (`moserCount = 1`) is an endpoint of an adjacent cap whose centre is the opposite
          -- vertex at distance `d`.  Reflecting `vm` across the centre line gives the second of
          -- the two `S(x, r) ∩ S(v_adj, d)` crossings, both outside the open adjacent cap, so
          -- that cap's selected count is `0` — contradicting `l ≥ 1` (resp. `r_count ≥ 1`).
          -- All angular exclusion is via the equidistance-FREE reflection identity
          -- `signedArea2_reflection_chord` (proved, 3-core) plus the strict chord bound
          -- (Thales / inscribed-angle, fully proved).
          have hmc : (SelectedClass A x r ∩ S.triangle.verts).card = 1 := by
            have : m = 1 := le_antisymm hm1 hm1ge
            simpa [hm_def, FiniteEndpointShell.moserCount] using this
          have hl1geC : 1 ≤ (SelectedClass A x r ∩ S.leftAdjacentInteriorByIndex i).card := by
            simpa [hl_def, FiniteEndpointShell.leftAdjCount] using hl1ge
          have hr1geC : 1 ≤ (SelectedClass A x r ∩ S.rightAdjacentInteriorByIndex i).card := by
            simpa [hr_count_def, FiniteEndpointShell.rightAdjCount] using hr1ge
          exact S.m1_branch_false hN4e hx.cap_mem hx.radius_pos hmc hl1geC hr1geC

end FiniteEndpointShell

end Problem97
