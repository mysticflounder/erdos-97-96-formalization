/- Generated theorem stub from Erdos9796Proof.P97.ConvexIndepHelpers by Stage 2 proof cut; source SHA-256 58fea6fdfc458ff582e9e12c324d10b6e51a5653a6daa5dc80f586642be49129 -/
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
open Problem97 Problem97.ConvexIndep



/-!
# `ConvexIndep` Finset helpers (Milestone 2)

Direct proofs from the extreme-point characterization
`EuclideanGeometry.ConvexIndep S ↔ ∀ a ∈ S, a ∉ convexHull ℝ (S \ {a})`:

* `ConvexIndep.mono` — `B ⊆ A → ConvexIndep A → ConvexIndep B`
* `ConvexIndep.erase` — `ConvexIndep A → ConvexIndep (A.erase x)`

These power the M4 descent step: erasing a removable vertex from a
counterexample preserves convex independence, and more generally any
subset of a convex-independent set is convex independent.
-/

open scoped EuclideanGeometry
















theorem Problem97.ConvexIndep.not_same_ray_perpBisector {A : Finset ℝ²}
    (hA : ConvexIndep A) {x y a b : ℝ²}
    (hx : x ∈ A) (hy : y ∈ A) (ha : a ∈ A) (hb : b ∈ A)
    (hxne : x ≠ a) (hyne : y ≠ a) (hbne : b ≠ a)
    (h : a ∈ segment ℝ (midpoint ℝ x y) b) : False := by sorry






