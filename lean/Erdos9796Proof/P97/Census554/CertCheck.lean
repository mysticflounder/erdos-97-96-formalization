import Erdos9796Proof.P97.Census554.MotifTransfer
import Erdos9796Proof.P97.Census554.PolyCheck

/-!
# Census-554 certificate checker (closure plan A.2.2)

Closure-plan step A.2.2 (`docs/closure-plan-full-spec-2026-07-09.md`): the
bridge from a census-554 Nullstellensatz certificate (schema
`census554_pattern_certificate.v1`, `scratch/census-554/certs/`) to pattern
deadness (`IsDead`, `MotifTransfer.lean`).

## Variable convention

Mirrors `scratch/census-554/census554_lib.py`: the gauge fixes label 0 at
`(0,0)` and label 1 at `(1,0)`; label `p ∈ {2, …, 10}` gets coordinate
variables with flat indices `coordVar p ax = 2*(p-2) + ax` (so `x2x = 0`,
`x2y = 1`, …, `x10x = 16`, `x10y = 17`; 18 coordinate variables total).
Rabinowitsch t-variables get indices `18 + j` where `j` indexes the
certificate's `rab_pairs` list; the t-generator for pair `(a,b)` is
`t_j·d²(a,b) − 1`.

## Contents

* `coordVar` / `coordPoly` / `d2Poly` — gauged coordinate and
  squared-distance polynomials in the `SPoly` representation.
* `CertTag` with `CertTag.poly` / `CertTag.valid` — certificate generator
  tags (`eq c a b` ↦ `d²(c,a) − d²(c,b)`; `rab j a b` ↦ `t_j·d²(a,b) − 1`)
  and their validity against a pattern and a Rabinowitsch pair list.
* `envOf` — the evaluation environment of a gauged realization.
* `checkCert` — the whole Boolean certificate check: matching lengths, all
  tags valid, and `Σ coeffᵢ·genᵢ − 1` normalizing to nil.
* `isDead_of_checkCert` — soundness: an accepted certificate proves the
  pattern dead.
* `isDead_P02213` — end-to-end replay of the banked certificate
  `scratch/census-554/certs/pat_02213.json`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

/-- Flat variable index of coordinate axis `ax` of label `p` (only meaningful
for `2 ≤ p`). -/
def coordVar (p : Fin 11) (ax : Fin 2) : Nat := 2 * (p.val - 2) + ax.val

/-- Gauged coordinate polynomial of label `p`, axis `ax`: constants for
labels 0, 1 (the census gauge `(0,0)`, `(1,0)`), a single variable
otherwise. -/
def coordPoly (p : Fin 11) (ax : Fin 2) : SPoly :=
  if p.val = 0 then []
  else if p.val = 1 then (if ax.val = 0 then SPoly.const 1 else [])
  else [([(coordVar p ax, 1)], 1)]

/-- Squared-distance polynomial `d²(a,b)` in the gauged variables:
`(xₐ − x_b)² + (yₐ − y_b)²` built from `SPoly.add`/`neg`/`mul`. -/
def d2Poly (a b : Fin 11) : SPoly :=
  let dx := (coordPoly a 0).add (coordPoly b 0).neg
  let dy := (coordPoly a 1).add (coordPoly b 1).neg
  (dx.mul dx).add (dy.mul dy)

/-- A certificate generator tag: `eq c a b` is the equidistance generator
`d²(c,a) − d²(c,b)`; `rab j a b` is the Rabinowitsch generator
`t_j·d²(a,b) − 1`. -/
inductive CertTag where
  /-- Equidistance generator `d²(c,a) − d²(c,b)` for mask entries `a, b` of
  center `c`. -/
  | eq (c a b : Fin 11)
  /-- Rabinowitsch generator `t_j·d²(a,b) − 1` for the `j`-th certificate
  pair `(a,b)`. -/
  | rab (j : Nat) (a b : Fin 11)

/-- The generator polynomial of a tag (see `CertTag`). -/
def CertTag.poly : CertTag → SPoly
  | .eq c a b => (d2Poly c a).add (d2Poly c b).neg
  | .rab j a b =>
      (SPoly.mul [([(18 + j, 1)], 1)] (d2Poly a b)).add (SPoly.const (-1))

/-- Tag validity against a pattern and a Rabinowitsch pair list: `eq c a b`
needs `a, b ∈ P c`; `rab j a b` needs `rabPairs[j]? = some (a, b)` and
`a ≠ b`. -/
def CertTag.valid (P : Pattern) (rabPairs : List (Fin 11 × Fin 11)) :
    CertTag → Bool
  | .eq c a b => decide (a ∈ P c) && decide (b ∈ P c)
  | .rab j a b => decide (rabPairs[j]? = some (a, b)) && decide (a ≠ b)

/-- Evaluation environment of a realization: coordinate variables read the
point coordinates; t-variables read the inverse squared distances of their
pairs. -/
noncomputable def envOf (y : Fin 11 → ℝ²) (rabPairs : List (Fin 11 × Fin 11)) :
    Nat → ℝ := fun i =>
  if h : i < 18 then y ⟨2 + i / 2, by omega⟩ ⟨i % 2, by omega⟩
  else
    match rabPairs[i - 18]? with
    | some (a, b) => (dist (y a) (y b) ^ 2)⁻¹
    | none => 0

/-- The certificate's linear combination `Σ coeffᵢ·genᵢ − 1` in the `SPoly`
representation, folded over `coeffs.zip tags` from `−1`. -/
def certPoly (tags : List CertTag) (coeffs : List SPoly) : SPoly :=
  (coeffs.zip tags).foldl (fun acc ct => acc.add (ct.1.mul ct.2.poly))
    (SPoly.const (-1))

/-- The whole certificate check: matching lengths, all tags valid, and
`Σ coeffᵢ·genᵢ − 1` normalizes to nil. -/
def checkCert (P : Pattern) (rabPairs : List (Fin 11 × Fin 11))
    (tags : List CertTag) (coeffs : List SPoly) : Bool :=
  decide (tags.length = coeffs.length)
    && tags.all (CertTag.valid P rabPairs)
    && decide ((certPoly tags coeffs).normalize = [])

/-- Squared distance in `ℝ²` as a sum of coordinate squares (private copy of
the recipe used across the project). -/
private theorem dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

/-- `envOf` reads the coordinate of label `p ≥ 2`, axis `ax`, at the flat
index `coordVar p ax`. -/
private theorem envOf_coordVar (y : Fin 11 → ℝ²)
    (rabPairs : List (Fin 11 × Fin 11)) (p : Fin 11) (ax : Fin 2)
    (hp : 2 ≤ p.val) :
    envOf y rabPairs (coordVar p ax) = y p ax := by
  have hp11 : p.val < 11 := p.isLt
  have hax : ax.val < 2 := ax.isLt
  have hv : coordVar p ax < 18 := by simp only [coordVar]; omega
  have key : ∀ (i : Fin 11) (j : Fin 2), i.val = p.val → j.val = ax.val →
      y i j = y p ax := by
    intro i j hi hj
    rw [Fin.ext hi, Fin.ext hj]
  simp only [envOf]
  rw [dif_pos hv]
  refine key _ _ ?_ ?_
  · change 2 + coordVar p ax / 2 = p.val
    simp only [coordVar]; omega
  · change coordVar p ax % 2 = ax.val
    simp only [coordVar]; omega

/-- Coordinate bridge: at the environment of a gauged realization, the
gauged coordinate polynomial of label `p`, axis `ax`, evaluates to the
realization's coordinate `y p ax`. -/
private theorem eval_coordPoly {P : Pattern} {y : Fin 11 → ℝ²}
    (hy : IsGaugedRealization P y) (rabPairs : List (Fin 11 × Fin 11))
    (p : Fin 11) (ax : Fin 2) :
    (coordPoly p ax).eval (envOf y rabPairs) = y p ax := by
  by_cases h0 : p.val = 0
  · have hp0 : p = 0 := by apply Fin.ext; simp [h0]
    subst hp0
    rw [hy.gauge0]
    fin_cases ax <;> simp [coordPoly, pt]
  · by_cases h1 : p.val = 1
    · have hp1 : p = 1 := by apply Fin.ext; simp [h1]
      subst hp1
      rw [hy.gauge1]
      fin_cases ax <;> simp [coordPoly, pt, SPoly.eval_const]
    · have hp2 : 2 ≤ p.val := by omega
      have hstep : coordPoly p ax = [([(coordVar p ax, 1)], 1)] := by
        simp [coordPoly, h0, h1]
      have heval : SPoly.eval (envOf y rabPairs) [([(coordVar p ax, 1)], 1)]
          = envOf y rabPairs (coordVar p ax) := by simp
      rw [hstep, heval]
      exact envOf_coordVar y rabPairs p ax hp2

/-- Squared-distance bridge: at the environment of a gauged realization,
`d2Poly a b` evaluates to `dist (y a) (y b) ^ 2`. -/
private theorem eval_d2Poly {P : Pattern} {y : Fin 11 → ℝ²}
    (hy : IsGaugedRealization P y) (rabPairs : List (Fin 11 × Fin 11))
    (a b : Fin 11) :
    (d2Poly a b).eval (envOf y rabPairs) = dist (y a) (y b) ^ 2 := by
  rw [dist_sq_eq_coord_sq_add_coord_sq]
  simp only [d2Poly, SPoly.eval_add, SPoly.eval_mul, SPoly.eval_neg,
    eval_coordPoly hy rabPairs]
  ring

/-- Generator vanishing: every valid tag's polynomial evaluates to zero at
the environment of a gauged realization. -/
private theorem eval_tagPoly {P : Pattern} {y : Fin 11 → ℝ²}
    (hy : IsGaugedRealization P y) (rabPairs : List (Fin 11 × Fin 11))
    (t : CertTag) (hv : t.valid P rabPairs = true) :
    t.poly.eval (envOf y rabPairs) = 0 := by
  cases t with
  | eq c a b =>
    simp only [CertTag.valid, Bool.and_eq_true, decide_eq_true_eq] at hv
    obtain ⟨ha, hb⟩ := hv
    simp only [CertTag.poly, SPoly.eval_add, SPoly.eval_neg,
      eval_d2Poly hy rabPairs]
    rw [hy.equidist c a ha b hb]
    ring
  | rab j a b =>
    simp only [CertTag.valid, Bool.and_eq_true, decide_eq_true_eq] at hv
    obtain ⟨hget, hab⟩ := hv
    have hyne : y a ≠ y b := fun h => hab (hy.injective h)
    have hdist : dist (y a) (y b) ≠ 0 := dist_ne_zero.mpr hyne
    have henv : envOf y rabPairs (18 + j) = (dist (y a) (y b) ^ 2)⁻¹ := by
      simp only [envOf]
      rw [dif_neg (by omega : ¬18 + j < 18)]
      have hidx : 18 + j - 18 = j := by omega
      rw [hidx, hget]
    simp only [CertTag.poly, SPoly.eval_add, SPoly.eval_mul,
      SPoly.eval_const, SPoly.eval_cons, SPoly.eval_nil, Mon.eval_cons,
      Mon.eval_nil, Rat.cast_one, pow_one, one_mul, mul_one, add_zero]
    rw [henv, eval_d2Poly hy rabPairs,
      inv_mul_cancel₀ (pow_ne_zero 2 hdist)]
    push_cast
    ring

/-- Folding `acc.add (c.mul g)` over a list whose generators all evaluate to
zero leaves the evaluation of the accumulator unchanged. -/
private theorem eval_certPoly_foldl (ρ : Nat → ℝ)
    (L : List (SPoly × CertTag)) :
    ∀ acc : SPoly, (∀ ct ∈ L, SPoly.eval ρ ct.2.poly = 0) →
      SPoly.eval ρ (L.foldl (fun acc ct => acc.add (ct.1.mul ct.2.poly)) acc)
        = SPoly.eval ρ acc := by
  induction L with
  | nil => intro acc _; rfl
  | cons ct rest ih =>
    intro acc h
    rw [List.foldl_cons, ih _ (fun x hx => h x (by simp [hx])),
      SPoly.eval_add, SPoly.eval_mul, h ct (by simp), mul_zero, add_zero]

/-- Soundness: an accepted certificate proves the pattern dead. -/
theorem isDead_of_checkCert (P : Pattern) (rabPairs : List (Fin 11 × Fin 11))
    (tags : List CertTag) (coeffs : List SPoly)
    (h : checkCert P rabPairs tags coeffs = true) : IsDead P := by
  rintro ⟨y, hy⟩
  simp only [checkCert, Bool.and_eq_true, decide_eq_true_eq,
    List.all_eq_true] at h
  obtain ⟨⟨-, hvalid⟩, hnorm⟩ := h
  have hzero : ∀ ct ∈ coeffs.zip tags,
      SPoly.eval (envOf y rabPairs) ct.2.poly = 0 := by
    intro ct hct
    obtain ⟨c, t⟩ := ct
    exact eval_tagPoly hy rabPairs t (hvalid t (List.of_mem_zip hct).2)
  have h1 : SPoly.eval (envOf y rabPairs) (certPoly tags coeffs)
      = SPoly.eval (envOf y rabPairs) (SPoly.const (-1)) :=
    eval_certPoly_foldl _ _ _ hzero
  rw [SPoly.eval_eq_zero_of_normalize_eq_nil _ _ hnorm,
    SPoly.eval_const] at h1
  norm_num at h1

/- ## End-to-end smoke: banked certificate `pat_02213`

Replay of `scratch/census-554/certs/pat_02213.json` (base kill, no
Rabinowitsch pairs): pattern `{0 ↦ {1,9,10}, 9 ↦ {0,1}, 10 ↦ {0,1,9}}`,
variables `x9x = 14`, `x9y = 15`, `x10x = 16`, `x10y = 17`. -/

/-- The pattern of banked certificate `pat_02213`. -/
def P02213 : Pattern := fun c =>
  if c = 0 then {1, 9, 10}
  else if c = 9 then {0, 1}
  else if c = 10 then {0, 1, 9}
  else ∅

/-- The generator tags of certificate `pat_02213`, in bank order. -/
def tags02213 : List CertTag :=
  [.eq 0 1 9, .eq 0 1 10, .eq 9 0 1, .eq 10 0 1, .eq 10 0 9]

/-- The coefficient polynomials of certificate `pat_02213`, in bank order
(variables `x9x = 14`, `x9y = 15`, `x10x = 16`, `x10y = 17`). -/
def coeffs02213 : List SPoly :=
  [ [([(15, 1), (17, 1)], -1), ([], 5/4)],
    [([(15, 2)], 2)],
    [([(15, 1), (17, 1)], -1/2), ([(14, 1)], 3/4), ([], 1/4)],
    [([(15, 2), (16, 1)], 1), ([(14, 1), (15, 1), (17, 1)], -1),
      ([(15, 2)], 1/2), ([(14, 1)], -1/4)],
    [([(15, 1), (17, 1)], 1), ([], 1/4)] ]

set_option linter.style.nativeDecide false in
/-- End-to-end replay of banked certificate `pat_02213`: its pattern is
dead. -/
theorem isDead_P02213 : IsDead P02213 :=
  isDead_of_checkCert P02213 [] tags02213 coeffs02213 (by native_decide)

end Census554
end Problem97
