/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SinzSat
import Erdos9796Proof.P97.Census554.FivePointCollision

/-!
# Metric semantics for the exact-twelve static relation clauses

The static exact-twelve compiler introduces one Boolean relation variable for
each pair of undirected carrier edges.  This file proves the geometry-facing
part of its ingress contract abstractly: whenever those variables are valued
by equality of the corresponding realized distances, the row implications,
relation transitivity clauses, duplicate-center clauses, five-point collision
clauses, and convex perpendicular-bisector clauses are all satisfied.

The exact finite edge ranking and emitted-clause reconstruction are deliberately
separate.  Consequently this file is not a serialized-CNF equality theorem,
terminal UNSAT result, all-cell coverage theorem, or live closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticRelationSemantics

open Census554.CoverCnf
open Census554.EqualityCore
open scoped EuclideanGeometry

/-- A relation valuation agrees with geometric distance equality on every
compiler relation variable.  The variable map is kept abstract here; the
generated-layout adapter supplies its exact finite implementation. -/
def EncodesMetricEquality {α : Type*} (σ : Nat → Bool)
    (relationVar : Edge α → Edge α → Nat) (pointOf : α → ℝ²) : Prop :=
  ∀ e f, 0 < relationVar e f →
    (σ (relationVar e f) = true ↔
      edgeDist pointOf e = edgeDist pointOf f)

/-- If a clause consisting of negative positive-index literals cannot have all
of its underlying variables true, then it is satisfied. -/
theorem evalClauseD_negativeVars_of_not_all_true
    (σ : Nat → Bool) (vars : List Nat)
    (hpos : ∀ v ∈ vars, 0 < v)
    (hnot : ¬ ∀ v ∈ vars, σ v = true) :
    evalClauseD σ (vars.map fun v => -Int.ofNat v) = true := by
  by_contra hsat
  have hfalse :
      evalClauseD σ (vars.map fun v => -Int.ofNat v) = false :=
    Bool.eq_false_of_not_eq_true hsat
  apply hnot
  intro v hv
  have hlit : -Int.ofNat v ∈ vars.map fun w => -Int.ofNat w :=
    List.mem_map.mpr ⟨v, hv, rfl⟩
  have heval : evalLitD σ (-Int.ofNat v) = false := by
    simpa [evalClauseD, List.any_eq_false] using
      (show ∀ l ∈ vars.map (fun w => -Int.ofNat w), evalLitD σ l = false by
        simpa [evalClauseD, List.any_eq_false] using hfalse) _ hlit
  have hvpos := hpos v hv
  cases hσ : σ v with
  | false =>
      simp [evalLitD, hσ] at heval
      omega
  | true => rfl

/-- One selected-row implication is satisfied by a geometric equality
valuation. -/
theorem evalClauseD_rowImplication
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (σ : Nat → Bool) (relationVar : Edge α → Edge α → Nat)
    (hmetric : EncodesMetricEquality σ relationVar pointOf)
    (hreal : Realizes P pointOf) (choiceVar : Nat) {center a b : α}
    (hchoice : σ choiceVar = true → a ∈ P center ∧ b ∈ P center)
    (hrelationPos : 0 < relationVar (center, a) (center, b)) :
    evalClauseD σ
      [-Int.ofNat choiceVar,
        Int.ofNat (relationVar (center, a) (center, b))] = true := by
  by_cases hselected : σ choiceVar = true
  · have hmem := hchoice hselected
    have heq :
        edgeDist pointOf (center, a) = edgeDist pointOf (center, b) := by
      simpa [edgeDist] using
        hreal.equidist center a hmem.1 b hmem.2
    have hrelation :=
      (hmetric (center, a) (center, b) hrelationPos).2 heq
    simp [evalClauseD, evalLitD, hselected, hrelation, hrelationPos]
  · have hselectedFalse := Bool.eq_false_of_not_eq_true hselected
    simp [evalClauseD, evalLitD, hselectedFalse]

/-- Any one of the three standard signed transitivity clauses is satisfied by
the metric-equality valuation.  The other two compiler clauses are obtained by
permuting `first`, `second`, and `third`. -/
theorem evalClauseD_relationTransitivity
    {α : Type*} {pointOf : α → ℝ²}
    (σ : Nat → Bool) (relationVar : Edge α → Edge α → Nat)
    (hmetric : EncodesMetricEquality σ relationVar pointOf)
    (first second third : Edge α)
    (hleftPositive : 0 < relationVar first second)
    (hmiddlePositive : 0 < relationVar second third)
    (hrightPositive : 0 < relationVar first third) :
    evalClauseD σ
      [-Int.ofNat (relationVar first second),
        -Int.ofNat (relationVar second third),
        Int.ofNat (relationVar first third)] = true := by
  apply evalClauseD_transitivityClause σ hrightPositive
  intro hfirstSecond hsecondThird
  apply (hmetric first third hrightPositive).2
  exact ((hmetric first second hleftPositive).1 hfirstSecond).trans
    ((hmetric second third hmiddlePositive).1 hsecondThird)

/-- The four-negative duplicate-center clause is satisfied by a geometric
equality valuation. -/
theorem evalClauseD_duplicateCenter
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (σ : Nat → Bool) (relationVar : Edge α → Edge α → Nat)
    (hmetric : EncodesMetricEquality σ relationVar pointOf)
    (hreal : Realizes P pointOf) {a b p q r : α}
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r) (hab : a ≠ b)
    (hpositive :
      ∀ v ∈ [relationVar (a, p) (a, q), relationVar (a, p) (a, r),
        relationVar (b, p) (b, q), relationVar (b, p) (b, r)], 0 < v) :
    evalClauseD σ
      ([relationVar (a, p) (a, q), relationVar (a, p) (a, r),
        relationVar (b, p) (b, q), relationVar (b, p) (b, r)].map
          fun v => -Int.ofNat v) = true := by
  apply evalClauseD_negativeVars_of_not_all_true σ _ hpositive
  intro hall
  have hap_aq :=
    (hmetric (a, p) (a, q) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hap_ar :=
    (hmetric (a, p) (a, r) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hbp_bq :=
    (hmetric (b, p) (b, q) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hbp_br :=
    (hmetric (b, p) (b, r) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hpq' : pointOf p ≠ pointOf q := fun h => hpq (hreal.injective h)
  have hpr' : pointOf p ≠ pointOf r := fun h => hpr (hreal.injective h)
  have hqr' : pointOf q ≠ pointOf r := fun h => hqr (hreal.injective h)
  have hab' : pointOf a ≠ pointOf b := fun h => hab (hreal.injective h)
  exact not_dist_eq_three_of_ne
    (pointOf p) (pointOf q) (pointOf r) (pointOf a) (pointOf b)
    hpq' hpr' hqr'
    (by simpa [edgeDist] using hap_aq)
    (by simpa [edgeDist] using hap_ar)
    (by simpa [edgeDist] using hbp_bq)
    (by simpa [edgeDist] using hbp_br) hab'

/-- The six-negative equilateral-bisector collision clause is satisfied by a
geometric equality valuation. -/
theorem evalClauseD_equilateralBisector
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (σ : Nat → Bool) (relationVar : Edge α → Edge α → Nat)
    (hmetric : EncodesMetricEquality σ relationVar pointOf)
    (hreal : Realizes P pointOf) {p a b c x : α}
    (hpa : p ≠ a) (hpx : p ≠ x) (hcb : c ≠ b)
    (hpositive :
      ∀ v ∈ [relationVar (p, a) (p, b), relationVar (p, a) (p, c),
        relationVar (p, a) (a, b), relationVar (p, a) (a, x),
        relationVar (p, a) (b, x), relationVar (c, x) (c, a)], 0 < v) :
    evalClauseD σ
      ([relationVar (p, a) (p, b), relationVar (p, a) (p, c),
        relationVar (p, a) (a, b), relationVar (p, a) (a, x),
        relationVar (p, a) (b, x), relationVar (c, x) (c, a)].map
          fun v => -Int.ofNat v) = true := by
  apply evalClauseD_negativeVars_of_not_all_true σ _ hpositive
  intro hall
  have hpa_pb :=
    (hmetric (p, a) (p, b) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hpa_pc :=
    (hmetric (p, a) (p, c) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hpa_ab :=
    (hmetric (p, a) (a, b) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hpa_ax :=
    (hmetric (p, a) (a, x) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hpa_bx :=
    (hmetric (p, a) (b, x) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hcx_ca :=
    (hmetric (c, x) (c, a) (hpositive _ (by simp))).1
      (hall _ (by simp))
  have hpa' : pointOf p ≠ pointOf a := fun h => hpa (hreal.injective h)
  have hcollision := equilateral_bisector_collision
    (r := dist (pointOf p) (pointOf a)) (dist_pos.mpr hpa')
    rfl
    (by simpa [edgeDist] using hpa_pb.symm)
    (by simpa [edgeDist] using hpa_pc.symm)
    (by simpa [edgeDist] using hpa_ab.symm)
    (by simpa [edgeDist] using hpa_ax.symm)
    (by simpa [edgeDist] using hpa_bx.symm)
    (by simpa [edgeDist] using hcx_ca)
  rcases hcollision with hpx' | hcb'
  · exact hpx (hreal.injective hpx')
  · exact hcb (hreal.injective hcb')

/-- The three-negative convex perpendicular-bisector clause is satisfied by a
geometric equality valuation. -/
theorem evalClauseD_perpBisector
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²} {A : Finset ℝ²}
    (σ : Nat → Bool) (relationVar : Edge α → Edge α → Nat)
    (hmetric : EncodesMetricEquality σ relationVar pointOf)
    (hreal : Realizes P pointOf) (hconv : ConvexIndep A)
    (hmem : ∀ y, pointOf y ∈ A) {a b p q r : α}
    (hab : a ≠ b) (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (hpositive :
      ∀ v ∈ [relationVar (p, a) (p, b), relationVar (q, a) (q, b),
        relationVar (r, a) (r, b)], 0 < v) :
    evalClauseD σ
      ([relationVar (p, a) (p, b), relationVar (q, a) (q, b),
        relationVar (r, a) (r, b)].map fun v => -Int.ofNat v) = true := by
  apply evalClauseD_negativeVars_of_not_all_true σ _ hpositive
  intro hall
  have hpeq :
      dist (pointOf p) (pointOf a) = dist (pointOf p) (pointOf b) := by
    simpa [edgeDist] using
      (hmetric (p, a) (p, b) (hpositive _ (by simp))).1
        (hall _ (by simp))
  have hqeq :
      dist (pointOf q) (pointOf a) = dist (pointOf q) (pointOf b) := by
    simpa [edgeDist] using
      (hmetric (q, a) (q, b) (hpositive _ (by simp))).1
        (hall _ (by simp))
  have hreq :
      dist (pointOf r) (pointOf a) = dist (pointOf r) (pointOf b) := by
    simpa [edgeDist] using
      (hmetric (r, a) (r, b) (hpositive _ (by simp))).1
        (hall _ (by simp))
  have hab' : pointOf a ≠ pointOf b := fun h => hab (hreal.injective h)
  have hpq' : pointOf p ≠ pointOf q := fun h => hpq (hreal.injective h)
  have hpr' : pointOf p ≠ pointOf r := fun h => hpr (hreal.injective h)
  have hqr' : pointOf q ≠ pointOf r := fun h => hqr (hreal.injective h)
  have hp_mem :
      pointOf p ∈
        A.filter (fun y => dist y (pointOf a) = dist y (pointOf b)) :=
    Finset.mem_filter.mpr ⟨hmem p, hpeq⟩
  have hq_mem :
      pointOf q ∈
        A.filter (fun y => dist y (pointOf a) = dist y (pointOf b)) :=
    Finset.mem_filter.mpr ⟨hmem q, hqeq⟩
  have hr_mem :
      pointOf r ∈
        A.filter (fun y => dist y (pointOf a) = dist y (pointOf b)) :=
    Finset.mem_filter.mpr ⟨hmem r, hreq⟩
  have hlarge :
      2 < (A.filter
        (fun y => dist y (pointOf a) = dist y (pointOf b))).card := by
    rw [Finset.two_lt_card]
    exact ⟨pointOf p, hp_mem, pointOf q, hq_mem,
      pointOf r, hr_mem, hpq', hpr', hqr'⟩
  have hbound := Dumitrescu.perpBisector_apex_bound hconv
    (hmem a) (hmem b) hab'
  exact (not_lt_of_ge hbound) hlarge

end StaticRelationSemantics
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
