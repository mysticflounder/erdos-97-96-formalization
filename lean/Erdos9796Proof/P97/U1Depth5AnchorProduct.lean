/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Mathlib

/-!
# U1 Route-B depth-5 anchor product

This file fixes the 10-label surface used by the U1.2 Route-B depth-5
mining lane.  It is deliberately independent of the generated manifest: the
scanner or certificate bridge may prove that this product vanishes, while this
file supplies the small theorem saying that such a vanishing contradicts
distinctness of the listed anchor pairs.

The label order is:

`p, q, t1, t2, t3, f1, f2, f3, f4, f5`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1Depth5

/-- The 10 labels in a U1 Route-B depth-5 prefix:
`p, q, t1, t2, t3, f1, f2, f3, f4, f5`. -/
abbrev Label := Fin 10

/-- The ambient Euclidean plane, written explicitly so this module does not rely
on project-local notation. -/
abbrev Plane := EuclideanSpace ℝ (Fin 2)

def p : Label := 0
def q : Label := 1
def t1 : Label := 2
def t2 : Label := 3
def t3 : Label := 4
def f1 : Label := 5
def f2 : Label := 6
def f3 : Label := 7
def f4 : Label := 8
def f5 : Label := 9

/-- Ordered AnchorPairs basis currently used by the U1.2 residual scan. -/
def anchorPairs : List (Label × Label) :=
  [(q, t3), (t1, t2), (f1, p), (f2, p), (f3, p), (f4, p), (f5, p),
   (q, t2), (f4, t1), (f5, t2), (q, f3), (q, f4), (t2, f3), (t2, f4),
   (t3, f3), (t3, f4)]

/-- Product of squared distances over an arbitrary ordered list of label pairs.

Generated U1 depth-5 certificates use this for nonzero extra factors such as
rho-products after each symbolic `rho_center` has been instantiated by one
concrete row witness distance. -/
noncomputable def pairDistanceProduct
    (pairs : List (Label × Label)) (x : Label → Plane) : ℝ :=
  (pairs.map fun ab => dist (x ab.1) (x ab.2) ^ 2).prod

/-- Product of squared distances over the U1 Route-B AnchorPairs basis. -/
noncomputable def anchorProduct (x : Label → Plane) : ℝ :=
  pairDistanceProduct anchorPairs x

/-- Distinctness exactly on the AnchorPairs basis. -/
def AnchorPairsDistinct (x : Label → Plane) : Prop :=
  ∀ ab ∈ anchorPairs, x ab.1 ≠ x ab.2

private theorem anchorPair_labels_ne {ab : Label × Label} (hab : ab ∈ anchorPairs) :
    ab.1 ≠ ab.2 := by
  have hmem :
      ab = (q, t3) ∨ ab = (t1, t2) ∨ ab = (f1, p) ∨ ab = (f2, p) ∨
        ab = (f3, p) ∨ ab = (f4, p) ∨ ab = (f5, p) ∨ ab = (q, t2) ∨
        ab = (f4, t1) ∨ ab = (f5, t2) ∨ ab = (q, f3) ∨ ab = (q, f4) ∨
        ab = (t2, f3) ∨ ab = (t2, f4) ∨ ab = (t3, f3) ∨ ab = (t3, f4) := by
    simpa [anchorPairs] using hab
  rcases hmem with
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    decide

/-- Injectivity of the 10 labelled points supplies distinctness on every
AnchorPairs factor. -/
theorem anchorPairsDistinct_of_injective
    {x : Label → Plane} (hinj : Function.Injective x) :
    AnchorPairsDistinct x := by
  intro ab hab hxy
  exact anchorPair_labels_ne hab (hinj hxy)

private theorem pairDistanceProduct_pos_aux (x : Label → Plane) :
    ∀ pairs : List (Label × Label),
      (∀ ab ∈ pairs, x ab.1 ≠ x ab.2) →
        0 < (pairs.map fun ab => dist (x ab.1) (x ab.2) ^ 2).prod
  | [], _ => by simp
  | ab :: rest, h => by
      have hhead : 0 < dist (x ab.1) (x ab.2) ^ 2 := by
        exact pow_pos (dist_pos.mpr (h ab (by simp))) 2
      have htail :
          0 < (rest.map fun cd => dist (x cd.1) (x cd.2) ^ 2).prod := by
        exact pairDistanceProduct_pos_aux x rest (by
          intro cd hcd
          exact h cd (by simp [hcd]))
      simp [hhead, htail]

/-- A pair-distance product is positive when every listed geometric pair is
distinct. -/
theorem pairDistanceProduct_pos_of_distinct
    {pairs : List (Label × Label)} {x : Label → Plane}
    (h : ∀ ab ∈ pairs, x ab.1 ≠ x ab.2) :
    0 < pairDistanceProduct pairs x := by
  simpa [pairDistanceProduct] using pairDistanceProduct_pos_aux x pairs h

/-- A pair-distance product cannot vanish when every listed geometric pair is
distinct. -/
theorem pairDistanceProduct_ne_zero_of_distinct
    {pairs : List (Label × Label)} {x : Label → Plane}
    (h : ∀ ab ∈ pairs, x ab.1 ≠ x ab.2) :
    pairDistanceProduct pairs x ≠ 0 :=
  ne_of_gt (pairDistanceProduct_pos_of_distinct h)

/-- Injectivity of the labelled point assignment supplies nonzero-ness for any
syntactically distinct list of label pairs. -/
theorem pairDistanceProduct_ne_zero_of_injective
    {pairs : List (Label × Label)} {x : Label → Plane}
    (hlabels : ∀ ab ∈ pairs, ab.1 ≠ ab.2)
    (hinj : Function.Injective x) :
    pairDistanceProduct pairs x ≠ 0 :=
  pairDistanceProduct_ne_zero_of_distinct (by
    intro ab hab hxy
    exact hlabels ab hab (hinj hxy))

/-- The AnchorPairs product is positive when every listed anchor pair is
geometrically distinct. -/
theorem anchorProduct_pos_of_distinct
    {x : Label → Plane} (h : AnchorPairsDistinct x) :
    0 < anchorProduct x := by
  simpa [anchorProduct, AnchorPairsDistinct] using
    pairDistanceProduct_pos_of_distinct (pairs := anchorPairs) h

/-- The AnchorPairs product cannot vanish under AnchorPairs distinctness. -/
theorem anchorProduct_ne_zero_of_distinct
    {x : Label → Plane} (h : AnchorPairsDistinct x) :
    anchorProduct x ≠ 0 :=
  ne_of_gt (anchorProduct_pos_of_distinct h)

/-- Contradiction form for consuming a mined product-collapse equality. -/
theorem false_of_anchorProduct_eq_zero
    {x : Label → Plane} (hdistinct : AnchorPairsDistinct x)
    (hzero : anchorProduct x = 0) :
    False :=
  anchorProduct_ne_zero_of_distinct hdistinct hzero

/-- Contradiction form for prefixes that provide the labels as an injective
10-tuple. -/
theorem false_of_anchorProduct_eq_zero_of_injective
    {x : Label → Plane} (hinj : Function.Injective x)
    (hzero : anchorProduct x = 0) :
    False :=
  false_of_anchorProduct_eq_zero (anchorPairsDistinct_of_injective hinj) hzero

end U1Depth5
end Problem97
