import FormalConjectures.ErdosProblems.«97»

/-!
# Foundation: shared vocabulary for the Erdős Problem 97 universal proof

All definitions are thin abbreviations of the upstream declarations in
`flound1129/formal-conjectures` (branch `erdos96-formalization`):

* `ℝ²` (scoped notation in `EuclideanGeometry`) — the ambient plane.
* `Erdos97.HasNEquidistantPointsAt/On/Property` — the equidistant predicates.
* `EuclideanGeometry.ConvexIndep` — convex independence as the extreme-point
  property `∀ a ∈ S, a ∉ convexHull ℝ (S \ {a})`, on `Set ℝ²`.

Our `Problem97.*` namespace exists only to host the universal-descent
assembly (`UniversalProblem97_of_reduction`) and helper lemmas in a private
working namespace; it does **not** redefine any predicate.
-/

open scoped EuclideanGeometry

namespace Problem97

export Erdos97 (HasNEquidistantPointsAt HasNEquidistantPointsOn HasNEquidistantProperty)

/-- Convex independence of a `Finset` of plane points: the extreme-point
characterization on the coerced underlying set, matching upstream
`EuclideanGeometry.ConvexIndep` and the predicate used by `Erdos97.erdos_97`. -/
abbrev ConvexIndep (A : Finset ℝ²) : Prop :=
  EuclideanGeometry.ConvexIndep (A : Set ℝ²)

/-- Statement of the `n = 9` finite endpoint expected by the universal proof. -/
abbrev FiniteN9ClosureStatement : Prop :=
  ∀ A : Finset ℝ², A.card = 9 → ConvexIndep A →
    ¬ HasNEquidistantProperty 4 A

/- ### Signed-area arc-side predicate

A lightweight algebraic predicate for "point `v` lies on the closed MEC arc
from `vj` to `vk` not passing through `vi`," used by the strengthened
`CapTriple` to pin caps to actual arcs cut by a Moser triangle. The
signed-area form avoids any `CircularOrder ℝ²` machinery — `v` and `vi`
must lie on opposite (closed) sides of the chord `vj`—`vk`. The
closed-cap convention is built in: equality (point on the chord) puts
the point on *both* sides, which is what closed caps need at endpoints.
-/

/-- The 2D signed area (oriented twice-area) of the triangle `(v, vj, vk)`,
viewed as the cross product of `vj - v` and `vk - v`. -/
noncomputable def signedArea2 (v vj vk : ℝ²) : ℝ :=
  (vj 0 - v 0) * (vk 1 - v 1) - (vk 0 - v 0) * (vj 1 - v 1)

/-- `v` lies on the closed arc from `vj` to `vk` not through `vi` iff the
signed areas of `(v, vj, vk)` and `(vi, vj, vk)` have opposite signs (or
either is zero — closed-cap convention includes the chord). This is the
purely algebraic chord-separation form; no `CircularOrder` instance
required. -/
def OnArcOpposite (vi vj vk v : ℝ²) : Prop :=
  signedArea2 v vj vk * signedArea2 vi vj vk ≤ 0

end Problem97
