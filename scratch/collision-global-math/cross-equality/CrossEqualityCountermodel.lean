import Mathlib

/-!
# Exact countermodel for collision-row cross equalities

The six rational points below occur in strict-convex counterclockwise order

`a, p, u, q, b₁, v`.

Set `b₀ = u`.  The common apex `a` is equidistant from `p,q` and from `u,v`,
on two distinct radii.  Simultaneously, `b₀` is equidistant from `p,q` and
`b₁` is equidistant from `u,v`.  Thus one blocker may equal a source of the
other row without violating strict convexity or either equal-bisector
condition.
-/

namespace Problem97.CrossEqualityCountermodel

abbrev Pt := ℚ × ℚ

def sqDist (x y : Pt) : ℚ :=
  (x.1 - y.1) ^ 2 + (x.2 - y.2) ^ 2

def orient (x y z : Pt) : ℚ :=
  (y.1 - x.1) * (z.2 - x.2) - (y.2 - x.2) * (z.1 - x.1)

def betweenX (b x y : Pt) : Prop :=
  (x.1 < b.1 ∧ b.1 < y.1) ∨ (y.1 < b.1 ∧ b.1 < x.1)

def CollisionRows (b₀ p q b₁ u v : Pt) : Prop :=
  p ≠ q ∧ u ≠ v ∧
    Disjoint ({p, q} : Finset Pt) {u, v} ∧
    b₀ ≠ b₁ ∧
    betweenX b₀ p q ∧ betweenX b₁ u v ∧
    sqDist b₀ p = sqDist b₀ q ∧
    sqDist b₁ u = sqDist b₁ v

def a : Pt := (1, 15 / 4)
def p : Pt := (0, 1)
def u : Pt := (1, 0)
def q : Pt := (2, 1)
def b₁ : Pt := (3, 11 / 4)
def v : Pt := (4, 6)
def b₀ : Pt := u

/-- The common apex sees the two disjoint source pairs on distinct radii. -/
theorem common_apex_two_radius_certificate :
    sqDist a p = sqDist a q ∧
      sqDist a u = sqDist a v ∧
      sqDist a p ≠ sqDist a u := by
  norm_num [sqDist, a, p, q, u, v]

/-- The collision rows satisfy all distinct-source, order, and bisector data,
while the first blocker is exactly the first source of the second row. -/
theorem first_blocker_eq_second_first_source :
    CollisionRows b₀ p q b₁ u v ∧ b₀ = u := by
  norm_num [CollisionRows, betweenX, sqDist, b₀, b₁, p, q, u, v,
    Finset.disjoint_left]

/-- Every triple in `a,p,u,q,b₁,v` has positive orientation.  This is an
exact strict-convex-order certificate, including the common apex rather than
only the five-point cap. -/
theorem strict_convex_full_order_certificate :
    0 < orient a p u ∧
    0 < orient a p q ∧
    0 < orient a p b₁ ∧
    0 < orient a p v ∧
    0 < orient a u q ∧
    0 < orient a u b₁ ∧
    0 < orient a u v ∧
    0 < orient a q b₁ ∧
    0 < orient a q v ∧
    0 < orient a b₁ v ∧
    0 < orient p u q ∧
    0 < orient p u b₁ ∧
    0 < orient p u v ∧
    0 < orient p q b₁ ∧
    0 < orient p q v ∧
    0 < orient p b₁ v ∧
    0 < orient u q b₁ ∧
    0 < orient u q v ∧
    0 < orient u b₁ v ∧
    0 < orient q b₁ v := by
  norm_num [orient, a, p, q, u, v, b₁]

/-- Swapping source endpoints and swapping the two rows turns the same
geometry into countermodels for each of the four syntactic cross equalities:
`b₀ = u`, `b₀ = v`, `b₁ = p`, and `b₁ = q`, respectively.

In the third and fourth conjuncts the displayed blockers are `(b₁,b₀)`;
hence the equality `b₀ = u` reads as "new `b₁` = new `p`" and
"new `b₁` = new `q`". -/
theorem all_four_cross_equalities_by_relabeling :
    (CollisionRows b₀ p q b₁ u v ∧ b₀ = u) ∧
    (CollisionRows b₀ p q b₁ v u ∧ b₀ = u) ∧
    (CollisionRows b₁ u v b₀ p q ∧ b₀ = u) ∧
    (CollisionRows b₁ v u b₀ p q ∧ b₀ = u) := by
  norm_num [CollisionRows, betweenX, sqDist, b₀, b₁, p, q, u, v,
    Finset.disjoint_left]

end Problem97.CrossEqualityCountermodel

#print axioms Problem97.CrossEqualityCountermodel.common_apex_two_radius_certificate
#print axioms Problem97.CrossEqualityCountermodel.first_blocker_eq_second_first_source
#print axioms Problem97.CrossEqualityCountermodel.strict_convex_full_order_certificate
#print axioms Problem97.CrossEqualityCountermodel.all_four_cross_equalities_by_relabeling
