/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Checked weighted Kalmanson cut data

This scratch module gives generated linear cuts a proof-free typed payload and
a kernel-checked soundness bridge.  Scratch modules are not Lake-importable,
so the already-checked generic weighted consumer is reproduced here before the
new checker.  A production promotion should move the consumer and checker
together into one production predecessor.

The certificate arithmetic is integral.  External rational Farkas
multipliers must first be cleared by one positive common denominator.
-/

open scoped BigOperators EuclideanGeometry

namespace Problem97

namespace Round2CoreNormalFormsScratch

open CapCrossingKalmansonBridge

/-- The short-side sum selected by one strict Kalmanson inequality. -/
noncomputable def kalmansonShortSum
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²) (useAdjacentSides : Bool)
    (a b c d : Fin A.card) : ℝ :=
  if useAdjacentSides then
    dist (boundary a) (boundary b) + dist (boundary c) (boundary d)
  else
    dist (boundary b) (boundary c) + dist (boundary a) (boundary d)

/-- The common diagonal sum on the long side of both strict inequalities. -/
noncomputable def kalmansonDiagonalSum
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²)
    (a b c d : Fin A.card) : ℝ :=
  dist (boundary a) (boundary c) + dist (boundary b) (boundary d)

/-- Any nonzero nonnegative weighted sum of strict Kalmanson inequalities is
incompatible with exact cancellation of its short-side and diagonal sums. -/
theorem false_of_weighted_kalmanson_cancellation
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ι : Type*} [Fintype ι]
    (useAdjacentSides : ι → Bool)
    (a b c d : ι → Fin A.card)
    (hab : ∀ i, a i < b i) (hbc : ∀ i, b i < c i) (hcd : ∀ i, c i < d i)
    (weight : ι → ℕ)
    (hweight : ∃ i, 0 < weight i)
    (hcancel :
      ∑ i, (weight i : ℝ) * kalmansonShortSum boundary (useAdjacentSides i)
        (a i) (b i) (c i) (d i) =
      ∑ i, (weight i : ℝ) * kalmansonDiagonalSum boundary
        (a i) (b i) (c i) (d i)) :
    False := by
  have hlt (i : ι) :
      kalmansonShortSum boundary (useAdjacentSides i) (a i) (b i) (c i) (d i) <
        kalmansonDiagonalSum boundary (a i) (b i) (c i) (d i) := by
    cases hside : useAdjacentSides i
    · simpa [kalmansonShortSum, kalmansonDiagonalSum, hside] using
        dist_add_dist_lt_diagonal_sum_of_ccw hA hboundary_injective
          hboundary_image hboundary_ccw (hab i) (hbc i) (hcd i)
    · simpa [kalmansonShortSum, kalmansonDiagonalSum, hside] using
        complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hboundary_injective
          hboundary_image hboundary_ccw (hab i) (hbc i) (hcd i)
  have hle (i : ι) :
      (weight i : ℝ) * kalmansonShortSum boundary (useAdjacentSides i)
          (a i) (b i) (c i) (d i) ≤
        (weight i : ℝ) * kalmansonDiagonalSum boundary (a i) (b i) (c i) (d i) :=
    mul_le_mul_of_nonneg_left (hlt i).le (Nat.cast_nonneg _)
  obtain ⟨i, hi⟩ := hweight
  have hiReal : (0 : ℝ) < weight i := by exact_mod_cast hi
  have hiStrict :
      (weight i : ℝ) * kalmansonShortSum boundary (useAdjacentSides i)
          (a i) (b i) (c i) (d i) <
        (weight i : ℝ) * kalmansonDiagonalSum boundary (a i) (b i) (c i) (d i) :=
    mul_lt_mul_of_pos_left (hlt i) hiReal
  have hsumLt :
      ∑ j, (weight j : ℝ) * kalmansonShortSum boundary (useAdjacentSides j)
          (a j) (b j) (c j) (d j) <
        ∑ j, (weight j : ℝ) * kalmansonDiagonalSum boundary
          (a j) (b j) (c j) (d j) :=
    Finset.sum_lt_sum (fun j _ ↦ hle j) ⟨i, Finset.mem_univ i, hiStrict⟩
  exact (ne_of_lt hsumLt) hcancel

end Round2CoreNormalFormsScratch

namespace WeightedKalmansonCutDataSoundnessScratch

open Round2CoreNormalFormsScratch

/-- Which short-side pairing occurs in a strict Kalmanson inequality. -/
inductive KalmansonKind where
  | k1
  | k2
deriving DecidableEq, Repr

/-- One typed strict Kalmanson inequality with a positive integral weight. -/
structure WeightedKalmansonInequality (n : ℕ) where
  kind : KalmansonKind
  a : Fin n
  b : Fin n
  c : Fin n
  d : Fin n
  weight : ℕ
deriving DecidableEq, Repr

/-- One signed selected-row equality.  The equality is
`d(center, point) - d(center, reference) = 0`. -/
structure WeightedSelectedRowEquality (n : ℕ) where
  center : Fin n
  reference : Fin n
  point : Fin n
  multiplier : ℤ
deriving DecidableEq, Repr

/-- A proof-free generated weighted Kalmanson cut.

`conditionedShell` is proof-free metadata for a finite outer clause.  It is
not used to justify metric cancellation: every metric equality used by this
checker must appear explicitly in `rowEqualities`. -/
structure WeightedKalmansonCutData (n : ℕ) where
  inequalities : List (WeightedKalmansonInequality n)
  rowEqualities : List (WeightedSelectedRowEquality n)
  conditionedShell : Option (Finset (Fin n)) := none
deriving DecidableEq

/-- Canonical unordered distance atom, represented by its increasing endpoint
pair. -/
def distanceAtom {n : ℕ} (i j : Fin n) : Fin n × Fin n :=
  if i ≤ j then (i, j) else (j, i)

/-- Exact integral linear expressions in abstract symmetric distance atoms. -/
abbrev DistanceExpression (n : ℕ) := (Fin n × Fin n) →₀ ℤ

/-- One unit abstract distance atom. -/
noncomputable def distanceBasis {n : ℕ} (i j : Fin n) : DistanceExpression n :=
  Finsupp.single (distanceAtom i j) 1

/-- Executable coefficient of one unit abstract distance atom. -/
def distanceBasisCoefficient {n : ℕ} (i j : Fin n) (atom : Fin n × Fin n) : ℤ :=
  if distanceAtom i j = atom then 1 else 0

/-- Exact coefficient vector of one strict Kalmanson inequality, with diagonal
terms positive and short-side terms negative. -/
noncomputable def WeightedKalmansonInequality.expression {n : ℕ}
    (term : WeightedKalmansonInequality n) : DistanceExpression n :=
  let diagonal := distanceBasis term.a term.c + distanceBasis term.b term.d
  let short := match term.kind with
    | .k1 => distanceBasis term.a term.b + distanceBasis term.c term.d
    | .k2 => distanceBasis term.a term.d + distanceBasis term.b term.c
  (term.weight : ℤ) • (diagonal - short)

/-- Exact coefficient vector of one signed selected-row equality. -/
noncomputable def WeightedSelectedRowEquality.expression {n : ℕ}
    (row : WeightedSelectedRowEquality n) : DistanceExpression n :=
  row.multiplier •
    (distanceBasis row.center row.point - distanceBasis row.center row.reference)

/-- Exact coefficient vector of a complete generated cut. -/
noncomputable def WeightedKalmansonCutData.expression {n : ℕ}
    (data : WeightedKalmansonCutData n) : DistanceExpression n :=
  (data.inequalities.map WeightedKalmansonInequality.expression).sum +
    (data.rowEqualities.map WeightedSelectedRowEquality.expression).sum

/-- Executable exact coefficient of one strict term. -/
def WeightedKalmansonInequality.coefficient {n : ℕ}
    (term : WeightedKalmansonInequality n) (atom : Fin n × Fin n) : ℤ :=
  let diagonal :=
    distanceBasisCoefficient term.a term.c atom +
      distanceBasisCoefficient term.b term.d atom
  let short := match term.kind with
    | .k1 =>
        distanceBasisCoefficient term.a term.b atom +
          distanceBasisCoefficient term.c term.d atom
    | .k2 =>
        distanceBasisCoefficient term.a term.d atom +
          distanceBasisCoefficient term.b term.c atom
  (term.weight : ℤ) * (diagonal - short)

/-- Executable exact coefficient of one signed selected-row equality. -/
def WeightedSelectedRowEquality.coefficient {n : ℕ}
    (row : WeightedSelectedRowEquality n) (atom : Fin n × Fin n) : ℤ :=
  row.multiplier *
    (distanceBasisCoefficient row.center row.point atom -
      distanceBasisCoefficient row.center row.reference atom)

/-- Executable exact coefficient of a complete cut. -/
def WeightedKalmansonCutData.coefficient {n : ℕ}
    (data : WeightedKalmansonCutData n) (atom : Fin n × Fin n) : ℤ :=
  (data.inequalities.map (·.coefficient atom)).sum +
    (data.rowEqualities.map (·.coefficient atom)).sum

/-- Local order and positivity check for a strict inequality. -/
def WeightedKalmansonInequality.check {n : ℕ}
    (term : WeightedKalmansonInequality n) : Bool :=
  decide (term.a < term.b ∧ term.b < term.c ∧ term.c < term.d ∧ 0 < term.weight)

/-- Optional exact-five shell metadata is shape-checked but contributes no
unjustified metric equality. -/
def WeightedKalmansonCutData.checkConditionedShell {n : ℕ}
    (data : WeightedKalmansonCutData n) : Bool :=
  match data.conditionedShell with
  | none => true
  | some shell => decide (shell.card = 5)

/-- Closed exact checker for a generated weighted cut. -/
def WeightedKalmansonCutData.check {n : ℕ}
    (data : WeightedKalmansonCutData n) : Bool :=
  decide (data.inequalities ≠ []) &&
    data.inequalities.all WeightedKalmansonInequality.check &&
    data.checkConditionedShell &&
    decide (∀ atom, data.coefficient atom = 0)

/-- Pointwise form of one proof-facing unit distance vector. -/
theorem distanceBasis_apply {n : ℕ} (i j : Fin n) (atom : Fin n × Fin n) :
    distanceBasis i j atom = distanceBasisCoefficient i j atom := by
  by_cases h : distanceAtom i j = atom
  · subst atom
    simp [distanceBasis, distanceBasisCoefficient]
  · have h' : atom ≠ distanceAtom i j := Ne.symm h
    simp [distanceBasis, distanceBasisCoefficient, h, h']

/-- Pointwise agreement for one strict term. -/
theorem WeightedKalmansonInequality.expression_apply {n : ℕ}
    (term : WeightedKalmansonInequality n) (atom : Fin n × Fin n) :
    term.expression atom = term.coefficient atom := by
  rcases term with ⟨kind, a, b, c, d, weight⟩
  have hcast : ((weight : ℤ) : ℝ) = (weight : ℝ) := by
    exact_mod_cast rfl
  cases kind <;>
    simp [WeightedKalmansonInequality.expression,
      WeightedKalmansonInequality.coefficient, distanceBasis_apply]

/-- Pointwise agreement for one selected-row equality. -/
theorem WeightedSelectedRowEquality.expression_apply {n : ℕ}
    (row : WeightedSelectedRowEquality n) (atom : Fin n × Fin n) :
    row.expression atom = row.coefficient atom := by
  simp [WeightedSelectedRowEquality.expression,
    WeightedSelectedRowEquality.coefficient, distanceBasis_apply]

/-- Evaluation at one atom commutes with a finite list sum. -/
theorem listSum_apply {n : ℕ} (expressions : List (DistanceExpression n))
    (atom : Fin n × Fin n) :
    expressions.sum atom = (expressions.map fun expression ↦ expression atom).sum := by
  induction expressions with
  | nil => simp
  | cons expression expressions ih => simp [ih]

/-- Pointwise evaluation of a list of strict-term vectors. -/
theorem inequalityExpressionListSum_apply {n : ℕ}
    (terms : List (WeightedKalmansonInequality n)) (atom : Fin n × Fin n) :
    (terms.map WeightedKalmansonInequality.expression).sum atom =
      (terms.map (·.coefficient atom)).sum := by
  induction terms with
  | nil => simp
  | cons term terms ih => simp [ih, term.expression_apply]

/-- Pointwise evaluation of a list of selected-row vectors. -/
theorem rowExpressionListSum_apply {n : ℕ}
    (rows : List (WeightedSelectedRowEquality n)) (atom : Fin n × Fin n) :
    (rows.map WeightedSelectedRowEquality.expression).sum atom =
      (rows.map (·.coefficient atom)).sum := by
  induction rows with
  | nil => simp
  | cons row rows ih => simp [ih, row.expression_apply]

/-- The executable coefficient function is the pointwise presentation of the
proof-facing exact expression. -/
theorem WeightedKalmansonCutData.expression_apply {n : ℕ}
    (data : WeightedKalmansonCutData n) (atom : Fin n × Fin n) :
    data.expression atom = data.coefficient atom := by
  simp [WeightedKalmansonCutData.expression, WeightedKalmansonCutData.coefficient,
    inequalityExpressionListSum_apply, rowExpressionListSum_apply]

/-- Boolean exact coefficient cancellation implies equality of the complete
proof-facing abstract expression with zero. -/
theorem WeightedKalmansonCutData.expression_eq_zero_of_checkCancellation {n : ℕ}
    (data : WeightedKalmansonCutData n)
    (hcheck : decide (∀ atom, data.coefficient atom = 0) = true) :
    data.expression = 0 := by
  ext atom
  rw [data.expression_apply]
  exact of_decide_eq_true hcheck atom

/-- A proof-facing family of selected rows realizes every row equality named
by a generated cut. -/
def RowsMatch {A : Finset ℝ²} (boundary : Fin A.card → ℝ²)
    (rowAt : ∀ i, SelectedFourClass A (boundary i))
    (equalities : List (WeightedSelectedRowEquality A.card)) : Prop :=
  ∀ equality, equality ∈ equalities →
    boundary equality.reference ∈ (rowAt equality.center).support ∧
      boundary equality.point ∈ (rowAt equality.center).support

/-- Evaluate an exact abstract distance expression on one concrete boundary. -/
noncomputable def evaluateExpression {n : ℕ} (boundary : Fin n → ℝ²) :
    DistanceExpression n →+ ℝ :=
  (Finsupp.linearCombination ℝ
      (fun atom : Fin n × Fin n ↦ dist (boundary atom.1) (boundary atom.2))).toAddMonoidHom.comp
    (Finsupp.mapRange.addMonoidHom (Int.castAddHom ℝ))

/-- A canonical abstract distance atom evaluates to its concrete distance. -/
theorem evaluateExpression_distanceBasis {n : ℕ} (boundary : Fin n → ℝ²)
    (i j : Fin n) :
    evaluateExpression boundary (distanceBasis i j) = dist (boundary i) (boundary j) := by
  by_cases hij : i ≤ j
  · simp [evaluateExpression, distanceBasis, distanceAtom, hij]
  · have hji : j ≤ i := le_of_not_ge hij
    simp [evaluateExpression, distanceBasis, distanceAtom, hij, dist_comm]

/-- Every matched selected-row equality evaluates to zero. -/
theorem evaluateExpression_rowEquality_eq_zero
    {A : Finset ℝ²} {boundary : Fin A.card → ℝ²}
    (rowAt : ∀ i, SelectedFourClass A (boundary i))
    {equalities : List (WeightedSelectedRowEquality A.card)}
    (hrows : RowsMatch boundary rowAt equalities)
    (equality : WeightedSelectedRowEquality A.card)
    (hequality : equality ∈ equalities) :
    evaluateExpression boundary equality.expression = 0 := by
  rcases hrows equality hequality with ⟨href, hpoint⟩
  have hdist :
      dist (boundary equality.center) (boundary equality.point) =
        dist (boundary equality.center) (boundary equality.reference) :=
    ((rowAt equality.center).support_eq_radius _ hpoint).trans
      ((rowAt equality.center).support_eq_radius _ href).symm
  simp [WeightedSelectedRowEquality.expression, evaluateExpression_distanceBasis, hdist]

/-- Boolean selector expected by the existing generic Kalmanson consumer. -/
def WeightedKalmansonInequality.useAdjacentSides {n : ℕ}
    (term : WeightedKalmansonInequality n) : Bool :=
  match term.kind with
  | .k1 => true
  | .k2 => false

/-- Concrete metric difference represented by one strict-term vector. -/
noncomputable def WeightedKalmansonInequality.metricDifference
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²)
    (term : WeightedKalmansonInequality A.card) : ℝ :=
  (term.weight : ℝ) *
    (kalmansonDiagonalSum boundary term.a term.b term.c term.d -
      kalmansonShortSum boundary term.useAdjacentSides term.a term.b term.c term.d)

/-- Evaluation of one exact strict-term vector is its weighted concrete metric
difference. -/
theorem evaluateExpression_inequality
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²)
    (term : WeightedKalmansonInequality A.card) :
    evaluateExpression boundary term.expression = term.metricDifference boundary := by
  rcases term with ⟨kind, a, b, c, d, weight⟩
  have hcast : ((weight : ℤ) : ℝ) = (weight : ℝ) := by
    exact_mod_cast rfl
  cases kind <;>
    simp only [WeightedKalmansonInequality.expression,
      WeightedKalmansonInequality.metricDifference,
      WeightedKalmansonInequality.useAdjacentSides,
      kalmansonDiagonalSum, kalmansonShortSum] <;>
    rw [map_zsmul, map_sub, map_add, map_add] <;>
    simp only [evaluateExpression_distanceBasis, if_true, Bool.false_eq_true,
      if_false] <;>
    rw [zsmul_eq_mul, hcast]
  ring

/-- Evaluation commutes with the complete list sum of strict terms. -/
theorem evaluateExpression_inequalityListSum
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²)
    (terms : List (WeightedKalmansonInequality A.card)) :
    evaluateExpression boundary
        (terms.map WeightedKalmansonInequality.expression).sum =
      (terms.map fun term ↦ term.metricDifference boundary).sum := by
  induction terms with
  | nil => simp
  | cons term terms ih =>
      simp only [List.map_cons, List.sum_cons, map_add,
        evaluateExpression_inequality, ih]

/-- A `Fin`-indexed sum of list entries is the ordinary list sum. -/
theorem finSum_get_eq_listSum {M : Type*} [AddCommMonoid M]
    {α : Type*} (items : List α) (value : α → M) :
    (∑ i : Fin items.length, value (items.get i)) = (items.map value).sum := by
  induction items with
  | nil => simp
  | cons item items ih =>
      change (∑ i : Fin (items.length + 1), value ((item :: items).get i)) = _
      rw [Fin.sum_univ_succ]
      simpa only [List.get_cons_zero, List.get_cons_succ, List.map_cons,
        List.sum_cons] using congrArg (value item + ·) ih

/-- A checked exact coefficient cancellation, realized by matching selected
rows, gives the weighted metric cancellation consumed by the generic strict
Kalmanson theorem. -/
theorem false_of_check_of_rowsMatch
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (rowAt : ∀ i, SelectedFourClass A (boundary i))
    (data : WeightedKalmansonCutData A.card)
    (hcheck : data.check = true)
    (hrows : RowsMatch boundary rowAt data.rowEqualities) :
    False := by
  simp only [WeightedKalmansonCutData.check, Bool.and_eq_true] at hcheck
  rcases hcheck with ⟨⟨⟨hnonemptyCheck, htermsCheck⟩, _hshellCheck⟩,
    hcancellationCheck⟩
  have hnonempty : data.inequalities ≠ [] := of_decide_eq_true hnonemptyCheck
  have hlength : 0 < data.inequalities.length := by
    cases hlist : data.inequalities with
    | nil => exact False.elim (hnonempty hlist)
    | cons term terms => simp
  have htermFacts (i : Fin data.inequalities.length) :
      (data.inequalities.get i).a < (data.inequalities.get i).b ∧
        (data.inequalities.get i).b < (data.inequalities.get i).c ∧
        (data.inequalities.get i).c < (data.inequalities.get i).d ∧
        0 < (data.inequalities.get i).weight := by
    have htermCheck :=
      List.all_eq_true.mp htermsCheck (data.inequalities.get i) (List.get_mem _ _)
    exact of_decide_eq_true (by
      simpa only [WeightedKalmansonInequality.check] using htermCheck)
  have hexpressionZero : data.expression = 0 :=
    data.expression_eq_zero_of_checkCancellation hcancellationCheck
  have hevaluationZero : evaluateExpression boundary data.expression = 0 := by
    rw [hexpressionZero]
    exact map_zero (evaluateExpression boundary)
  have hrowSum :
      (data.rowEqualities.map fun equality ↦
        evaluateExpression boundary equality.expression).sum = 0 := by
    apply List.sum_eq_zero
    intro value hvalue
    rcases List.mem_map.mp hvalue with ⟨equality, hequality, rfl⟩
    exact evaluateExpression_rowEquality_eq_zero rowAt hrows equality hequality
  have hmetricSum :
      (data.inequalities.map fun term ↦ term.metricDifference boundary).sum = 0 := by
    have hrowExpressionSum :
        evaluateExpression boundary
          (data.rowEqualities.map WeightedSelectedRowEquality.expression).sum = 0 := by
      rw [map_list_sum]
      simpa only [List.map_map, Function.comp_apply] using hrowSum
    rw [WeightedKalmansonCutData.expression, map_add,
      evaluateExpression_inequalityListSum, hrowExpressionSum,
      add_zero] at hevaluationZero
    exact hevaluationZero
  have hfinMetricSum :
      (∑ i : Fin data.inequalities.length,
        (data.inequalities.get i).metricDifference boundary) = 0 := by
    rw [finSum_get_eq_listSum]
    exact hmetricSum
  apply false_of_weighted_kalmanson_cancellation hA hboundaryInjective
    hboundaryImage hboundaryCcw
    (fun i : Fin data.inequalities.length ↦
      (data.inequalities.get i).useAdjacentSides)
    (fun i ↦ (data.inequalities.get i).a)
    (fun i ↦ (data.inequalities.get i).b)
    (fun i ↦ (data.inequalities.get i).c)
    (fun i ↦ (data.inequalities.get i).d)
    (fun i ↦ (htermFacts i).1)
    (fun i ↦ (htermFacts i).2.1)
    (fun i ↦ (htermFacts i).2.2.1)
    (fun i ↦ (data.inequalities.get i).weight)
  · exact ⟨⟨0, hlength⟩, (htermFacts ⟨0, hlength⟩).2.2.2⟩
  · have hdifference :
        (∑ i : Fin data.inequalities.length,
          ((data.inequalities.get i).weight : ℝ) *
            kalmansonDiagonalSum boundary
              (data.inequalities.get i).a (data.inequalities.get i).b
              (data.inequalities.get i).c (data.inequalities.get i).d) -
          (∑ i : Fin data.inequalities.length,
            ((data.inequalities.get i).weight : ℝ) *
              kalmansonShortSum boundary
                (data.inequalities.get i).useAdjacentSides
                (data.inequalities.get i).a (data.inequalities.get i).b
                (data.inequalities.get i).c (data.inequalities.get i).d) = 0 := by
        rw [← Finset.sum_sub_distrib]
        calc
          (∑ i : Fin data.inequalities.length,
              (((data.inequalities.get i).weight : ℝ) *
                  kalmansonDiagonalSum boundary
                    (data.inequalities.get i).a (data.inequalities.get i).b
                    (data.inequalities.get i).c (data.inequalities.get i).d -
                ((data.inequalities.get i).weight : ℝ) *
                  kalmansonShortSum boundary
                    (data.inequalities.get i).useAdjacentSides
                    (data.inequalities.get i).a (data.inequalities.get i).b
                    (data.inequalities.get i).c (data.inequalities.get i).d)) =
              ∑ i : Fin data.inequalities.length,
                (data.inequalities.get i).metricDifference boundary := by
            apply Finset.sum_congr rfl
            intro i _hi
            simp only [WeightedKalmansonInequality.metricDifference]
            ring
          _ = 0 := hfinMetricSum
    exact (sub_eq_zero.mp hdifference).symm

/-- The first certified all-center cut discovered by the continuation-order
linear oracle. -/
def continuationOrderCut : WeightedKalmansonCutData 14 where
  inequalities :=
    [ { kind := .k2, a := 0, b := 1, c := 10, d := 11, weight := 1 }
    , { kind := .k2, a := 0, b := 1, c := 11, d := 12, weight := 1 }
    , { kind := .k2, a := 1, b := 2, c := 10, d := 11, weight := 1 }
    , { kind := .k2, a := 1, b := 2, c := 11, d := 12, weight := 1 }
    , { kind := .k2, a := 2, b := 3, c := 11, d := 12, weight := 1 }
    , { kind := .k2, a := 3, b := 4, c := 11, d := 12, weight := 1 }
    , { kind := .k2, a := 4, b := 5, c := 11, d := 12, weight := 1 }
    , { kind := .k2, a := 5, b := 6, c := 11, d := 12, weight := 1 }
    , { kind := .k2, a := 6, b := 7, c := 11, d := 12, weight := 1 }
    , { kind := .k2, a := 7, b := 8, c := 11, d := 12, weight := 1 } ]
  rowEqualities :=
    [ { center := 10, reference := 0, point := 2, multiplier := 1 }
    , { center := 11, reference := 2, point := 8, multiplier := 1 }
    , { center := 12, reference := 0, point := 8, multiplier := -1 } ]

/-- Kernel reduction confirms exact cancellation and all strict-term checks for
the first externally banked ten-inequality cut. -/
theorem continuationOrderCut_check : continuationOrderCut.check = true := by
  set_option maxRecDepth 10000 in
    decide

#print axioms evaluateExpression_distanceBasis
#print axioms evaluateExpression_rowEquality_eq_zero
#print axioms false_of_check_of_rowsMatch
#print axioms continuationOrderCut_check

end WeightedKalmansonCutDataSoundnessScratch
end Problem97
