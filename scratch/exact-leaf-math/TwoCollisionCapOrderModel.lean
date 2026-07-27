import Mathlib

/-!
An exact rational model showing that two disjoint source-exact collision
triples in one strict cap do not, by themselves, contradict cyclic order or
the Kalmanson inequalities.

The common apex is `O`.  In strict-convex counterclockwise order the six cap
points are

  `p, b₀, q, u, b₁, v`.

The pairs `p,q` and `u,v` lie on two distinct circles about `O`.  The cap
points `b₀` and `b₁` are their respective equidistant blockers.  The vertical
line `x = 1` strictly separates all six cap points from `O`.
-/

namespace Problem97.ExactLeafMathScratch

abbrev Pt := ℚ × ℚ

def sqDist (a b : Pt) : ℚ :=
  (a.1 - b.1) ^ 2 + (a.2 - b.2) ^ 2

def orient (a b c : Pt) : ℚ :=
  (b.1 - a.1) * (c.2 - a.2) -
    (b.2 - a.2) * (c.1 - a.1)

def O : Pt := (0, 0)

def p : Pt := (180 / 17, -96 / 17)
def b₀ : Pt := (11, 0)
def q : Pt := (180 / 17, 96 / 17)

def u : Pt := (52 / 5, 39 / 5)
def b₁ : Pt := (42 / 5, 56 / 5)
def v : Pt := (572 / 125, 1521 / 125)

/-- The two source pairs occupy distinct exact apex radii.  Neither blocker
lies on either of those two apex-radius slices. -/
theorem exact_two_apex_radius_slices :
    sqDist O p = 144 ∧
    sqDist O q = 144 ∧
    sqDist O u = 169 ∧
    sqDist O v = 169 ∧
    (144 : ℚ) ≠ 169 ∧
    sqDist O b₀ ≠ 144 ∧
    sqDist O b₀ ≠ 169 ∧
    sqDist O b₁ ≠ 144 ∧
    sqDist O b₁ ≠ 169 := by
  norm_num [sqDist, O, p, q, u, v, b₀, b₁]

/-- Each cap blocker is equidistant from its own disjoint source pair. -/
theorem two_collision_equalities :
    sqDist b₀ p = sqDist b₀ q ∧
    sqDist b₁ u = sqDist b₁ v := by
  norm_num [sqDist, p, q, u, v, b₀, b₁]

/-- The common apex lies strictly to the left of `x = 1`, while all six
collision points lie strictly to its right. -/
theorem one_strict_cap_halfplane :
    O.1 < 1 ∧
    1 < p.1 ∧ 1 < b₀.1 ∧ 1 < q.1 ∧
    1 < u.1 ∧ 1 < b₁.1 ∧ 1 < v.1 := by
  norm_num [O, p, q, u, v, b₀, b₁]

/-- Every ordered triple in `p,b₀,q,u,b₁,v` has positive orientation.  Thus
the displayed order is a strict-convex cyclic order, not merely an angular
ordering around the external apex. -/
theorem strictConvex_collision_order_certificate :
    0 < orient p b₀ q ∧
    0 < orient p b₀ u ∧
    0 < orient p b₀ b₁ ∧
    0 < orient p b₀ v ∧
    0 < orient p q u ∧
    0 < orient p q b₁ ∧
    0 < orient p q v ∧
    0 < orient p u b₁ ∧
    0 < orient p u v ∧
    0 < orient p b₁ v ∧
    0 < orient b₀ q u ∧
    0 < orient b₀ q b₁ ∧
    0 < orient b₀ q v ∧
    0 < orient b₀ u b₁ ∧
    0 < orient b₀ u v ∧
    0 < orient b₀ b₁ v ∧
    0 < orient q u b₁ ∧
    0 < orient q u v ∧
    0 < orient q b₁ v ∧
    0 < orient u b₁ v := by
  norm_num [orient, p, q, u, v, b₀, b₁]

/-- Adding the common apex gives the strict-convex cyclic order

  `O, p, b₀, q, u, b₁, v`.

In particular, each center/support quadruple alternates around the boundary:
`O,p,b₀,q` and `O,u,b₁,v`.  It therefore does not have the
center-center-support-support order required by the two-row Kalmanson
contradiction. -/
theorem strictConvex_full_order_certificate :
    (0 < orient O p b₀ ∧
      0 < orient O p q ∧
      0 < orient O p u ∧
      0 < orient O p b₁ ∧
      0 < orient O p v ∧
      0 < orient O b₀ q ∧
      0 < orient O b₀ u ∧
      0 < orient O b₀ b₁ ∧
      0 < orient O b₀ v ∧
      0 < orient O q u ∧
      0 < orient O q b₁ ∧
      0 < orient O q v ∧
      0 < orient O u b₁ ∧
      0 < orient O u v ∧
      0 < orient O b₁ v) ∧
    (0 < orient p b₀ q ∧
      0 < orient p b₀ u ∧
      0 < orient p b₀ b₁ ∧
      0 < orient p b₀ v ∧
      0 < orient p q u ∧
      0 < orient p q b₁ ∧
      0 < orient p q v ∧
      0 < orient p u b₁ ∧
      0 < orient p u v ∧
      0 < orient p b₁ v ∧
      0 < orient b₀ q u ∧
      0 < orient b₀ q b₁ ∧
      0 < orient b₀ q v ∧
      0 < orient b₀ u b₁ ∧
      0 < orient b₀ u v ∧
      0 < orient b₀ b₁ v ∧
      0 < orient q u b₁ ∧
      0 < orient q u v ∧
      0 < orient q b₁ v ∧
      0 < orient u b₁ v) := by
  norm_num [orient, O, p, q, u, v, b₀, b₁]

/-- A single kernel-checked package of the local data used by the proposed
two-row Kalmanson terminal. -/
theorem compatible_two_collision_cap_order :
    (sqDist O p = sqDist O q ∧
      sqDist O u = sqDist O v ∧
      sqDist O p ≠ sqDist O u) ∧
    (sqDist b₀ p = sqDist b₀ q ∧
      sqDist b₁ u = sqDist b₁ v) ∧
    (O.1 < 1 ∧
      1 < p.1 ∧ 1 < b₀.1 ∧ 1 < q.1 ∧
      1 < u.1 ∧ 1 < b₁.1 ∧ 1 < v.1) ∧
    (0 < orient p b₀ q ∧
      0 < orient p b₀ u ∧
      0 < orient p b₀ b₁ ∧
      0 < orient p b₀ v ∧
      0 < orient p q u ∧
      0 < orient p q b₁ ∧
      0 < orient p q v ∧
      0 < orient p u b₁ ∧
      0 < orient p u v ∧
      0 < orient p b₁ v ∧
      0 < orient b₀ q u ∧
      0 < orient b₀ q b₁ ∧
      0 < orient b₀ q v ∧
      0 < orient b₀ u b₁ ∧
      0 < orient b₀ u v ∧
      0 < orient b₀ b₁ v ∧
      0 < orient q u b₁ ∧
      0 < orient q u v ∧
      0 < orient q b₁ v ∧
      0 < orient u b₁ v) := by
  norm_num [sqDist, orient, O, p, q, u, v, b₀, b₁]

end Problem97.ExactLeafMathScratch

#print axioms Problem97.ExactLeafMathScratch.compatible_two_collision_cap_order
