/- Generated theorem stub from Erdos9796Proof.P97.IsoscelesCount by Stage 2 proof cut; source SHA-256 207564b11a38e9270192c8e5de3202b113b7f89c7ece5af3bc12954928d3013c -/
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
import Definitions.Def_Erdos9796Counting_IsoscelesCount
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Powerset
open Problem97



/-!
# Isosceles count for Erdős Problem 97 (Dumitrescu lower bound, Milestone 3)

Defines the per-vertex and total isosceles count of a finite point set,
in the Dumitrescu 2006 / Nivasch–Pach–Pinchasi–Zerbib 2013 convention
(equilaterals counted three times), and proves the easy lower bound:

  Per-vertex `K4` ⇒ each vertex contributes `≥ C(4,2) = 6` isosceles pairs.
  Summing: `6 · |A| ≤ I(A)`.

The matching upper bound `I(A) ≤ (11·|A|²−18·|A|)/12` for convex point
sets is Dumitrescu 2006 eq. (5), still open
(`p97-isosceles-count-upper-bound`).

References: doc slug `p97-isosceles-obstruction`.
-/

set_option linter.style.openClassical false

open scoped EuclideanGeometry
open Finset Classical


















theorem Problem97.iCountAt_ge_six_of_K4 (A : Finset ℝ²) (p : ℝ²)
    (hp : HasNEquidistantPointsAt 4 A p) : 6 ≤ iCountAt A p := by sorry












