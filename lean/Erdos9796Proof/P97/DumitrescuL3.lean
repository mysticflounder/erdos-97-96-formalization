import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.DumitrescuL1
import Mathlib.Data.Finset.Filter
import Mathlib.Data.Finset.Card

/-!
# Dumitrescu L3: trivial edge-isosceles bound (Problem 97)

`Problem97.Dumitrescu.trivial_edge_bound` is Dumitrescu's Lemma 3
(Dumitrescu 2006 / Fox–Pach 2012, arXiv:1207.1266 §2):

  For any finite point set `A ⊆ ℝ²` and any base pair `(b, c)` with
  `b, c ∈ A` and `b ≠ c`, the number of apexes `a ∈ A` with `a ∉ {b, c}`
  forming an isosceles triangle with base `bc` (i.e. `dist a b = dist a c`)
  is bounded above by the total number of points in `A` on the
  perpendicular bisector of `bc`.

This is one of the smallest lemmas in the Dumitrescu L1–L10 chain: it
simply says that filtering with a strictly stronger predicate
(`a ∉ {b, c} ∧ dist a b = dist a c`) yields a subset of filtering with
the weaker predicate (`dist a b = dist a c`). Its purpose is to provide
a clean named hook for the per-base apex count used in L6
(`p97-dumitrescu-l6-cap-good-edge-quadratic`).

Combined with L1 (`Problem97.Dumitrescu.perpBisector_apex_bound`), the
right-hand side is bounded by `2` under `ConvexIndep A`, giving the
useful corollary `trivial_edge_bound_of_convexIndep`: each base edge of
a convex-independent point set contributes at most `2` non-base apexes
forming isosceles triangles with it.

## Proof strategy

The main inequality is `Finset.card_le_card` applied to
`Finset.monotone_filter_right`, since the predicate
`a ∉ {b, c} ∧ dist a b = dist a c` clearly implies `dist a b = dist a c`.
The convex-independent corollary chains this with L1.

## References

* Dumitrescu, A. (2006). *Planar point sets with many isosceles
  triangles.*
* Fox, J. and Pach, J. (2012). *Erdős-Szekeres-type theorems for monotone
  paths and convex bodies.* arXiv:1207.1266 §2.
-/

set_option linter.style.openClassical false

open scoped EuclideanGeometry
open Finset Classical

namespace Problem97
namespace Dumitrescu

/-- **Dumitrescu L3 / trivial edge-isosceles bound.**

For any finite point set `A ⊆ ℝ²` and any base pair `(b, c)` with
`b, c ∈ A` and `b ≠ c`, the number of non-base apexes `a ∈ A \ {b, c}`
forming an isosceles triangle with base `bc` is at most the total
number of points of `A` on the perpendicular bisector of `bc`. The
proof is the trivial subset inclusion: filtering by the stronger
predicate gives a subset of filtering by the weaker one. -/
theorem trivial_edge_bound
    {A : Finset ℝ²} {b c : ℝ²} (_hb : b ∈ A) (_hc : c ∈ A) (_hbc : b ≠ c) :
    (A.filter (fun a => a ∉ ({b, c} : Finset ℝ²) ∧ dist a b = dist a c)).card ≤
      (A.filter (fun a => dist a b = dist a c)).card := by
  refine Finset.card_le_card ?_
  exact Finset.monotone_filter_right A (fun _a _ha hand => hand.2)

/-- **Dumitrescu L3, convex-independent corollary.**

For a convex-independent finite point set `A ⊆ ℝ²` and any base pair
`(b, c)` with `b, c ∈ A` and `b ≠ c`, at most `2` non-base apexes
`a ∈ A \ {b, c}` form an isosceles triangle with base `bc`. Chains
`trivial_edge_bound` with `perpBisector_apex_bound` (L1). -/
theorem trivial_edge_bound_of_convexIndep
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {b c : ℝ²} (hb : b ∈ A) (hc : c ∈ A) (hbc : b ≠ c) :
    (A.filter (fun a => a ∉ ({b, c} : Finset ℝ²) ∧ dist a b = dist a c)).card ≤ 2 :=
  (trivial_edge_bound hb hc hbc).trans (perpBisector_apex_bound hA hb hc hbc)

end Dumitrescu
end Problem97
