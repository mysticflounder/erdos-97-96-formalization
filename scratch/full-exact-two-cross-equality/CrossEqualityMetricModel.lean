import Mathlib

/-!
An exact rational Euclidean model for the metric and cap-order consequences of
the cross-blocker equality branch `A = c`.

The six vertices occur in counterclockwise strict-convex order

  `a, c, C, b, d, O`.

Here `O` is the common physical apex, `c` is the common blocker of `a,b`, and
`C` is the common blocker of `c,d`.  The point `m` witnesses that all five
non-`O` vertices lie strictly inside the circle centered at `m` through `O`.
-/

namespace ScratchFullExactTwoCrossEquality

abbrev Pt := ℚ × ℚ

def sqDist (p q : Pt) : ℚ :=
  (p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2

def orient (p q r : Pt) : ℚ :=
  (q.1 - p.1) * (r.2 - p.2) - (q.2 - p.2) * (r.1 - p.1)

def O : Pt := (0, 2)
def a : Pt := (-4, 0)
def b : Pt := (4, 0)
def c : Pt := (0, -1)
def C : Pt := (21 / 10, -4 / 5)
def d : Pt := (72 / 25, 29 / 25)
def m : Pt := (0, -4)

def twoRowsInStrictCap
    (o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter : Pt) : Prop :=
  sqDist o a₁ = sqDist o b₁ ∧
  sqDist blocker₁ a₁ = sqDist blocker₁ b₁ ∧
  sqDist o c₁ = sqDist o d₁ ∧
  sqDist blocker₂ c₁ = sqDist blocker₂ d₁ ∧
  blocker₁ ≠ blocker₂ ∧
  a₁ ≠ b₁ ∧ c₁ ≠ d₁ ∧
  a₁ ≠ c₁ ∧ a₁ ≠ d₁ ∧ b₁ ≠ c₁ ∧ b₁ ≠ d₁ ∧
  sqDist capCenter a₁ < sqDist capCenter o ∧
  sqDist capCenter b₁ < sqDist capCenter o ∧
  sqDist capCenter c₁ < sqDist capCenter o ∧
  sqDist capCenter d₁ < sqDist capCenter o ∧
  sqDist capCenter blocker₁ < sqDist capCenter o ∧
  sqDist capCenter blocker₂ < sqDist capCenter o

def branchAeqC (o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter : Pt) : Prop :=
  twoRowsInStrictCap o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter ∧ blocker₁ = c₁

def branchAeqD (o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter : Pt) : Prop :=
  twoRowsInStrictCap o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter ∧ blocker₁ = d₁

def branchCeqA (o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter : Pt) : Prop :=
  twoRowsInStrictCap o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter ∧ blocker₂ = a₁

def branchCeqB (o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter : Pt) : Prop :=
  twoRowsInStrictCap o a₁ b₁ c₁ d₁ blocker₁ blocker₂ capCenter ∧ blocker₂ = b₁

/-- All four bisector equalities of the `A = c` branch, blocker distinction,
and a single strict-cap witness. -/
theorem metric_and_strictCap_model :
    sqDist O a = sqDist O b ∧
    sqDist c a = sqDist c b ∧
    sqDist O c = sqDist O d ∧
    sqDist C c = sqDist C d ∧
    C ≠ c ∧
    sqDist m a < sqDist m O ∧
    sqDist m c < sqDist m O ∧
    sqDist m C < sqDist m O ∧
    sqDist m b < sqDist m O ∧
    sqDist m d < sqDist m O := by
  norm_num [sqDist, O, a, b, c, C, d, m]

/-- Every ordered triple in `a,c,C,b,d,O` has positive orientation.  This is
the standard determinant certificate that these six rational points are in
the displayed strict-convex cyclic order. -/
theorem strictConvex_order_certificate :
    0 < orient a c C ∧
    0 < orient a c b ∧
    0 < orient a c d ∧
    0 < orient a c O ∧
    0 < orient a C b ∧
    0 < orient a C d ∧
    0 < orient a C O ∧
    0 < orient a b d ∧
    0 < orient a b O ∧
    0 < orient a d O ∧
    0 < orient c C b ∧
    0 < orient c C d ∧
    0 < orient c C O ∧
    0 < orient c b d ∧
    0 < orient c b O ∧
    0 < orient c d O ∧
    0 < orient C b d ∧
    0 < orient C b O ∧
    0 < orient C d O ∧
    0 < orient b d O := by
  norm_num [orient, O, a, b, c, C, d]

/-- The same strict-convex point set realizes all four syntactic equality
branches, using only row exchange and source-order exchange. -/
theorem all_four_cross_equality_branches_have_metric_cap_models :
    branchAeqC O a b c d c C m ∧
    branchAeqD O a b d c c C m ∧
    branchCeqA O c d a b C c m ∧
    branchCeqB O d c a b C c m := by
  norm_num [branchAeqC, branchAeqD, branchCeqA, branchCeqB,
    twoRowsInStrictCap, sqDist, O, a, b, c, C, d, m]

end ScratchFullExactTwoCrossEquality

#print axioms ScratchFullExactTwoCrossEquality.metric_and_strictCap_model
#print axioms ScratchFullExactTwoCrossEquality.strictConvex_order_certificate
#print axioms
  ScratchFullExactTwoCrossEquality.all_four_cross_equality_branches_have_metric_cap_models
