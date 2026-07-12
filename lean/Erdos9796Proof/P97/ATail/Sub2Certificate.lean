/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination

/-!
# ATAIL-SUB2: the seven-variable half-disk statement `SUB2-H` is UNSAT

Matrix-row deliverable for ATAIL-SUB2 (`docs/closure-matrix-2026-07-09.md`).
Statement source: `scratch/atail-sub2/STATEMENT.md` — the verbatim
reconstruction of `census/candidate_d_probe/runs/SUB2_{left,right}.smt2`
at `oy = 0` (seven real variables `xx xy wax way wbx wby rho2`).
Proof source: the bisector-frame hand proof and exact Positivstellensatz
certificate of `scratch/atail-sub2/proof.md`; skeptic audit PASS
(`scratch/atail-sub2-audit/AUDIT.md`).

## Statement

Fix `v2 = (0,0)`, `v3 = (1,0)`, and let `H = {p : p₀² + p₁² ≤ p₀ ∧ p₁ < 0}`
be the part of the closed Thales disk on `[v2, v3]` strictly below the axis.
`SUB2-H-left` is the conjunction: `x, w_a, w_b ∈ H`;
`‖w_a − x‖² = ‖w_b − x‖² = ρ²`; `ρ² > 0`; and all ten `signedArea2` triples
(`i<j<k`) of the chain `σ_L = (v2, w_a, w_b, x, v3)` strictly positive.
`SUB2-H-right` is the same for `σ_R = (v2, x, w_a, w_b, v3)`.  Both systems
are contradictory: `sub2H_left_unsat` and `sub2H_right_unsat`.

## Proof route (the audited certificate, staged)

`chord_chain_incompatibility` is the coordinate core.  Writing

* `E    := (x − (w_a+w_b)/2)·(w_b − w_a)`   (perpendicular-bisector defect),
* `T123 := sA2(v2,w_a,w_b)`, `T235 := sA2(w_a,w_b,v3)`, `T234 := sA2(w_a,w_b,x)`,
* `S2 := sA2(v2,w_a,x) + sA2(v2,w_b,x)`, `S3 := sA2(w_a,x,v3) + sA2(w_b,x,v3)`,
* `g_a := a₀ − a₀² − a₁²`, `g_b := b₀ − b₀² − b₁²`, `c2 := ‖w_b − w_a‖²`,
* `A2 := (‖w_b‖² − ‖w_a‖²)/2`, `A3 := A2 − (b₀ − a₀)`,

the equal radii give `hE : E = 0`; the bisector-frame conversions of
proof.md Step 2 become the exact polynomial identities

* `j1 : c2·S2 = 2·T234·A2 + 2·T123·E` and
* `j2 : c2·S3 = 2·T234·A3 + 2·T235·E`,

and combining them with two further exact identities — the planar product
formula `A2·A3 + T123·T235 = c2·(M·(M − v3))` for the chord midpoint
`M = (w_a+w_b)/2`, and the Thales/convexity identity
`2·(M·(M − v3)) + c2/2 = −(g_a + g_b)` (proof.md Steps 3–4) — yields

`key : c2²·S2·S3 + 4·T234²·T123·T235 + 2·c2·T234²·(g_a+g_b) + c2²·T234² = 0`,

which is exactly `4 ×` the audited identity `IDENT = λ·E` of proof.md with
`E` eliminated.  Under the chain hypotheses `4·T234²·T123·T235 > 0` while
the other three summands are `≥ 0` (`S2·S3 > 0` holds in BOTH chains: the
left chain has `S2, S3 > 0`, the right chain `S2, S3 < 0`) — contradiction.

Every identity was pre-verified by exact dict-of-`Fraction` polynomial
arithmetic (20/20 PASS) before transcription; `linear_combination` makes the
kernel re-check each one here.

The core uses only: equal radii, the two `w`-disk memberships, and
`T123, T235, T234 > 0` plus the sign of the product `S2·S3` — i.e. 7 of the
10 chain triples (four of them only through pairwise sums), and neither
`ρ² > 0`, nor `x ∈ H`, nor any below-axis strictness.  This matches
proof.md's "strictly stronger" remark; the wrappers nevertheless transcribe
every SUB2-H hypothesis atom for statement fidelity.
-/

namespace Problem97
namespace ATailSub2

/-- Twice the signed area of the ordered triple `(u, v, w)`:
`sA2(u,v,w) = (v₀−u₀)·(w₁−u₁) − (w₀−u₀)·(v₁−u₁)` (STATEMENT.md, I-ORD). -/
def signedArea2 (u v w : ℝ × ℝ) : ℝ :=
  (v.1 - u.1) * (w.2 - u.2) - (w.1 - u.1) * (v.2 - u.2)

/-- The lower half-disk `H = {p : p₀² + p₁² ≤ p₀ ∧ p₁ < 0}`: the closed
Thales disk on `[v2, v3] = [(0,0), (1,0)]`, strictly below the axis
(STATEMENT.md, H-membership). -/
def memH (p : ℝ × ℝ) : Prop :=
  p.1 ^ 2 + p.2 ^ 2 ≤ p.1 ∧ p.2 < 0

/-- The frame vertex `v2 = (0, 0)`. -/
def v2 : ℝ × ℝ := (0, 0)

/-- The frame vertex `v3 = (1, 0)`. -/
def v3 : ℝ × ℝ := (1, 0)

/-- **Core certificate** (proof.md Theorem, coordinates
`x = (x0,x1)`, `w_a = (a0,a1)`, `w_b = (b0,b1)`): equal squared radii from
`x`, the two closed-disk memberships `g_a, g_b ≥ 0`, positivity of the
triples `T123, T235, T234`, and positivity of the product `S2·S3` are
jointly contradictory.  This consumes 7 of the 10 chain triples and neither
`ρ² > 0` nor any below-axis condition, so it covers both SUB2-H chains. -/
theorem chord_chain_incompatibility
    (x0 x1 a0 a1 b0 b1 : ℝ)
    -- E-PKT with ρ² eliminated: ‖w_a − x‖² = ‖w_b − x‖²
    (hEq : (a0 - x0) ^ 2 + (a1 - x1) ^ 2 = (b0 - x0) ^ 2 + (b1 - x1) ^ 2)
    -- w_a, w_b in the closed Thales disk on [v2, v3]  (g_a ≥ 0, g_b ≥ 0)
    (hga : a0 ^ 2 + a1 ^ 2 ≤ a0)
    (hgb : b0 ^ 2 + b1 ^ 2 ≤ b0)
    -- T123 = sA2(v2, w_a, w_b) > 0
    (hT123 : 0 < a0 * b1 - b0 * a1)
    -- T235 = sA2(w_a, w_b, v3) > 0
    (hT235 : 0 < (b0 - a0) * (0 - a1) - (1 - a0) * (b1 - a1))
    -- T234 = sA2(w_a, w_b, x) > 0
    (hT234 : 0 < (b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1))
    -- S2 · S3 > 0 (left chain: both positive; right chain: both negative)
    (hS2S3 : 0 < (a0 * x1 - x0 * a1 + (b0 * x1 - x0 * b1)) *
        ((x0 - a0) * (0 - a1) - (1 - a0) * (x1 - a1) +
          ((x0 - b0) * (0 - b1) - (1 - b0) * (x1 - b1)))) :
    False := by
  -- Step 1: equal radii put x on the perpendicular bisector of [w_a, w_b].
  have hE : (x0 - (a0 + b0) / 2) * (b0 - a0) + (x1 - (a1 + b1) / 2) * (b1 - a1) = 0 := by
    linear_combination hEq / 2
  -- Step 2, S2-component conversion: c2·S2 = 2·T234·A2  (+ 2·T123·E ≡ 0).
  have j1 : ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) * (a0 * x1 - x0 * a1 + (b0 * x1 - x0 * b1)) =
      2 * ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) *
        ((b0 ^ 2 - a0 ^ 2 + (b1 ^ 2 - a1 ^ 2)) / 2) := by
    linear_combination 2 * (a0 * b1 - b0 * a1) * hE
  -- Step 2, S3-component conversion: c2·S3 = 2·T234·A3  (+ 2·T235·E ≡ 0).
  have j2 : ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) *
      ((x0 - a0) * (0 - a1) - (1 - a0) * (x1 - a1) +
        ((x0 - b0) * (0 - b1) - (1 - b0) * (x1 - b1))) =
      2 * ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) *
        ((b0 ^ 2 - a0 ^ 2 + (b1 ^ 2 - a1 ^ 2)) / 2 - (b0 - a0)) := by
    linear_combination 2 * ((b0 - a0) * (0 - a1) - (1 - a0) * (b1 - a1)) * hE
  -- Steps 3–4 assembled: 4 × the audited IDENT, with E eliminated.
  have key : ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) ^ 2 *
        ((a0 * x1 - x0 * a1 + (b0 * x1 - x0 * b1)) *
          ((x0 - a0) * (0 - a1) - (1 - a0) * (x1 - a1) +
            ((x0 - b0) * (0 - b1) - (1 - b0) * (x1 - b1)))) +
      4 * ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) ^ 2 *
        ((a0 * b1 - b0 * a1) * ((b0 - a0) * (0 - a1) - (1 - a0) * (b1 - a1))) +
      2 * ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) *
        ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) ^ 2 *
        (a0 - a0 ^ 2 - a1 ^ 2 + (b0 - b0 ^ 2 - b1 ^ 2)) +
      ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) ^ 2 *
        ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) ^ 2 = 0 := by
    linear_combination
      (((b0 - a0) ^ 2 + (b1 - a1) ^ 2) *
          ((x0 - a0) * (0 - a1) - (1 - a0) * (x1 - a1) +
            ((x0 - b0) * (0 - b1) - (1 - b0) * (x1 - b1)))) * j1 +
      (2 * ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) *
          ((b0 ^ 2 - a0 ^ 2 + (b1 ^ 2 - a1 ^ 2)) / 2)) * j2
  -- Positivity bookkeeping: the T-term is strictly positive, the rest ≥ 0.
  have hT234sq : 0 < ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) ^ 2 :=
    pow_pos hT234 2
  have ht1 : 0 ≤ ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) ^ 2 *
      ((a0 * x1 - x0 * a1 + (b0 * x1 - x0 * b1)) *
        ((x0 - a0) * (0 - a1) - (1 - a0) * (x1 - a1) +
          ((x0 - b0) * (0 - b1) - (1 - b0) * (x1 - b1)))) :=
    mul_nonneg (sq_nonneg _) hS2S3.le
  have ht2 : 0 < ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) ^ 2 *
      ((a0 * b1 - b0 * a1) * ((b0 - a0) * (0 - a1) - (1 - a0) * (b1 - a1))) :=
    mul_pos hT234sq (mul_pos hT123 hT235)
  have ht3 : 0 ≤ ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) *
      ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) ^ 2 *
      (a0 - a0 ^ 2 - a1 ^ 2 + (b0 - b0 ^ 2 - b1 ^ 2)) :=
    mul_nonneg (mul_nonneg (add_nonneg (sq_nonneg _) (sq_nonneg _)) hT234sq.le)
      (by linarith)
  have ht4 : 0 ≤ ((b0 - a0) ^ 2 + (b1 - a1) ^ 2) ^ 2 *
      ((b0 - a0) * (x1 - a1) - (x0 - a0) * (b1 - a1)) ^ 2 :=
    mul_nonneg (sq_nonneg _) hT234sq.le
  linarith

set_option linter.unusedVariables false in
/-- **SUB2-H-left is UNSAT** (STATEMENT.md, chain `σ_L = (v2, w_a, w_b, x, v3)`).
Atom map: `hra`/`hrb` = E-PKT, `hrho` = I-POS, `hxH`/`haH`/`hbH` =
H-membership (closed disk ∧ strict below-axis), `hL⟨ijk⟩` = the ten I-ORD
triples of `σ_L` in `(i<j<k)` order with indices `1..5` naming
`(v2, w_a, w_b, x, v3)`. -/
theorem sub2H_left_unsat
    (x wA wB : ℝ × ℝ) (rho2 : ℝ)
    (hra : (wA.1 - x.1) ^ 2 + (wA.2 - x.2) ^ 2 = rho2)
    (hrb : (wB.1 - x.1) ^ 2 + (wB.2 - x.2) ^ 2 = rho2)
    (hrho : 0 < rho2)
    (hxH : memH x) (haH : memH wA) (hbH : memH wB)
    (hL123 : 0 < signedArea2 v2 wA wB)
    (hL124 : 0 < signedArea2 v2 wA x)
    (hL125 : 0 < signedArea2 v2 wA v3)
    (hL134 : 0 < signedArea2 v2 wB x)
    (hL135 : 0 < signedArea2 v2 wB v3)
    (hL145 : 0 < signedArea2 v2 x v3)
    (hL234 : 0 < signedArea2 wA wB x)
    (hL235 : 0 < signedArea2 wA wB v3)
    (hL245 : 0 < signedArea2 wA x v3)
    (hL345 : 0 < signedArea2 wB x v3) :
    False := by
  simp only [signedArea2, memH, v2, v3] at hL123 hL124 hL134 hL234 hL235 hL245 hL345 haH hbH
  -- S2 > 0 and S3 > 0 from the pairwise sums of the four x-triples.
  have hS2 : 0 < wA.1 * x.2 - x.1 * wA.2 + (wB.1 * x.2 - x.1 * wB.2) := by linarith
  have hS3 : 0 < (x.1 - wA.1) * (0 - wA.2) - (1 - wA.1) * (x.2 - wA.2) +
      ((x.1 - wB.1) * (0 - wB.2) - (1 - wB.1) * (x.2 - wB.2)) := by linarith
  exact chord_chain_incompatibility x.1 x.2 wA.1 wA.2 wB.1 wB.2
    (hra.trans hrb.symm) haH.1 hbH.1
    (by linarith) (by linarith) (by linarith) (mul_pos hS2 hS3)

set_option linter.unusedVariables false in
/-- **SUB2-H-right is UNSAT** (STATEMENT.md, chain `σ_R = (v2, x, w_a, w_b, v3)`).
Atom map as in `sub2H_left_unsat`, with `hR⟨ijk⟩` the ten I-ORD triples of
`σ_R` in `(i<j<k)` order, indices `1..5` naming `(v2, x, w_a, w_b, v3)`.
Here `S2 < 0` and `S3 < 0`, so the product `S2·S3` is again positive and the
same core certificate applies. -/
theorem sub2H_right_unsat
    (x wA wB : ℝ × ℝ) (rho2 : ℝ)
    (hra : (wA.1 - x.1) ^ 2 + (wA.2 - x.2) ^ 2 = rho2)
    (hrb : (wB.1 - x.1) ^ 2 + (wB.2 - x.2) ^ 2 = rho2)
    (hrho : 0 < rho2)
    (hxH : memH x) (haH : memH wA) (hbH : memH wB)
    (hR123 : 0 < signedArea2 v2 x wA)
    (hR124 : 0 < signedArea2 v2 x wB)
    (hR125 : 0 < signedArea2 v2 x v3)
    (hR134 : 0 < signedArea2 v2 wA wB)
    (hR135 : 0 < signedArea2 v2 wA v3)
    (hR145 : 0 < signedArea2 v2 wB v3)
    (hR234 : 0 < signedArea2 x wA wB)
    (hR235 : 0 < signedArea2 x wA v3)
    (hR245 : 0 < signedArea2 x wB v3)
    (hR345 : 0 < signedArea2 wA wB v3) :
    False := by
  simp only [signedArea2, memH, v2, v3] at hR123 hR124 hR134 hR234 hR235 hR245 hR345 haH hbH
  -- The right chain reverses the x-triples: S2 < 0 and S3 < 0.
  have hS2 : wA.1 * x.2 - x.1 * wA.2 + (wB.1 * x.2 - x.1 * wB.2) < 0 := by linarith
  have hS3 : (x.1 - wA.1) * (0 - wA.2) - (1 - wA.1) * (x.2 - wA.2) +
      ((x.1 - wB.1) * (0 - wB.2) - (1 - wB.1) * (x.2 - wB.2)) < 0 := by linarith
  exact chord_chain_incompatibility x.1 x.2 wA.1 wA.2 wB.1 wB.2
    (hra.trans hrb.symm) haH.1 hbH.1
    (by linarith) (by linarith) (by linarith) (mul_pos_of_neg_of_neg hS2 hS3)

end ATailSub2
end Problem97

-- Axiom hygiene, pinned as a build invariant: core axioms only — no `sorryAx`,
-- no `Lean.ofReduceBool`/`Lean.trustCompiler` (no `native_decide`), no custom axioms.

/-- info: 'Problem97.ATailSub2.chord_chain_incompatibility' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms Problem97.ATailSub2.chord_chain_incompatibility

/-- info: 'Problem97.ATailSub2.sub2H_left_unsat' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms Problem97.ATailSub2.sub2H_left_unsat

/-- info: 'Problem97.ATailSub2.sub2H_right_unsat' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms Problem97.ATailSub2.sub2H_right_unsat
