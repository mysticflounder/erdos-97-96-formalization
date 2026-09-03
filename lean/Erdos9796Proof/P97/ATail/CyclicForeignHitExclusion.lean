/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CircumradiusRelation
import Erdos9796Proof.P97.ATail.CyclicSideInequalities
import Erdos9796Proof.P97.ATail.NonObtusePolarization

/-!
# Three cyclic foreign hits force an equilateral apex triangle

`ATail/CircumradiusRelation.lean` turns one foreign hit into one side-length
cubic.  `ATail/CyclicSideInequalities.lean` turns three cubics into `a = b = c`.
This file joins them, so that the cyclic configuration is excluded by a single
application rather than by three applications and a hand assembly.

The three slots are the same theorem read three times, with the apices rotated:

| slot | plays `A`, `B`, `C` | needs `dist q Aᵢ` | and `dist q Aⱼ` | gives |
|---|---|---|---|---|
| `(0,1)` | `A₀ A₁ A₂` | `c` | `a` | `a² b ≤ c (a² + b² - c²)` |
| `(1,2)` | `A₁ A₂ A₀` | `a` | `b` | `b² c ≤ a (b² + c² - a²)` |
| `(2,0)` | `A₂ A₀ A₁` | `b` | `c` | `c² a ≤ b (c² + a² - b²)` |

Those three conclusions are exactly the three hypotheses of
`eq_of_cyclic_side_inequalities`.  The rotation is consistent: all three
applications take the same three side-length equations
`dist A₁ A₂ = a`, `dist A₂ A₀ = b`, `dist A₀ A₁ = c` in rotated order, so no
`dist_comm` is needed anywhere.

The three non-obtuse hypotheses are the three angles of the apex triangle, one
per slot.  Together they are what a `SurplusCapPacket`'s `triangleNonObtuse`
field asserts.

The conclusion contradicts a scalene apex triangle, which is the open
configuration section 67 of the closure plan reduced the cyclic case to.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- **Three cyclic foreign hits force `a = b = c`.**  `A₀`, `A₁`, `A₂` lie on
the circle of radius `R` about `O` with side lengths `a = dist A₁ A₂`,
`b = dist A₂ A₀`, `c = dist A₀ A₁`, and no angle of the triangle is obtuse.
For each cyclic slot there is a point of the closed disk realizing that slot's
two radii, where the first radius is the side joining the two apices.  Then the
triangle is equilateral.

The `qₖ` are independent: nothing requires them to be distinct, or distinct
from the apices. -/
theorem eq_of_cyclic_foreign_hits
    {O A₀ A₁ A₂ q₀ q₁ q₂ : ℝ²} {R a b c : ℝ}
    (hapos : 0 < a) (hbpos : 0 < b) (hcpos : 0 < c)
    (hna : 0 ≤ b ^ 2 + c ^ 2 - a ^ 2)
    (hnb : 0 ≤ c ^ 2 + a ^ 2 - b ^ 2)
    (hnc : 0 ≤ a ^ 2 + b ^ 2 - c ^ 2)
    (hA₀O : dist A₀ O = R) (hA₁O : dist A₁ O = R) (hA₂O : dist A₂ O = R)
    (ha : dist A₁ A₂ = a) (hb : dist A₂ A₀ = b) (hc : dist A₀ A₁ = c)
    (hq₀A : dist q₀ A₀ = c) (hq₀B : dist q₀ A₁ = a) (hq₀O : dist q₀ O ≤ R)
    (hq₁A : dist q₁ A₁ = a) (hq₁B : dist q₁ A₂ = b) (hq₁O : dist q₁ O ≤ R)
    (hq₂A : dist q₂ A₂ = b) (hq₂B : dist q₂ A₀ = c) (hq₂O : dist q₂ O ≤ R) :
    a = b ∧ b = c := by
  have h1 : a ^ 2 * b ≤ c * (a ^ 2 + b ^ 2 - c ^ 2) :=
    sq_mul_le_of_dist_eq_side_of_mem_disk hapos hbpos hcpos hnc
      hA₀O hA₁O hA₂O ha hb hc hq₀A hq₀B hq₀O
  have h2 : b ^ 2 * c ≤ a * (b ^ 2 + c ^ 2 - a ^ 2) :=
    sq_mul_le_of_dist_eq_side_of_mem_disk hbpos hcpos hapos hna
      hA₁O hA₂O hA₀O hb hc ha hq₁A hq₁B hq₁O
  have h3 : c ^ 2 * a ≤ b * (c ^ 2 + a ^ 2 - b ^ 2) :=
    sq_mul_le_of_dist_eq_side_of_mem_disk hcpos hapos hbpos hnb
      hA₂O hA₀O hA₁O hc ha hb hq₂A hq₂B hq₂O
  exact eq_of_cyclic_side_inequalities hapos hbpos hcpos h1 h2 h3

/-- **The cyclic configuration is excluded on a scalene apex triangle.**  The
contrapositive form section 67 of the closure plan needs: with the same data,
two unequal sides are impossible. -/
theorem false_of_cyclic_foreign_hits_of_ne
    {O A₀ A₁ A₂ q₀ q₁ q₂ : ℝ²} {R a b c : ℝ}
    (hapos : 0 < a) (hbpos : 0 < b) (hcpos : 0 < c)
    (hna : 0 ≤ b ^ 2 + c ^ 2 - a ^ 2)
    (hnb : 0 ≤ c ^ 2 + a ^ 2 - b ^ 2)
    (hnc : 0 ≤ a ^ 2 + b ^ 2 - c ^ 2)
    (hA₀O : dist A₀ O = R) (hA₁O : dist A₁ O = R) (hA₂O : dist A₂ O = R)
    (ha : dist A₁ A₂ = a) (hb : dist A₂ A₀ = b) (hc : dist A₀ A₁ = c)
    (hq₀A : dist q₀ A₀ = c) (hq₀B : dist q₀ A₁ = a) (hq₀O : dist q₀ O ≤ R)
    (hq₁A : dist q₁ A₁ = a) (hq₁B : dist q₁ A₂ = b) (hq₁O : dist q₁ O ≤ R)
    (hq₂A : dist q₂ A₂ = b) (hq₂B : dist q₂ A₀ = c) (hq₂O : dist q₂ O ≤ R)
    (hne : a ≠ b) :
    False :=
  hne (eq_of_cyclic_foreign_hits hapos hbpos hcpos hna hnb hnc
    hA₀O hA₁O hA₂O ha hb hc hq₀A hq₀B hq₀O hq₁A hq₁B hq₁O
    hq₂A hq₂B hq₂O).1

/- The preceding theorem uses the side-length form of non-obtuseness.  The
next adapter is the source-facing form: a non-obtuse circumscribed Moser
triangle supplies those three inequalities by polarization. -/

/-- **Cyclic foreign hits against a non-obtuse Moser triangle.**  The three
side inequalities needed by the cyclic metric exclusion are obtained directly
from the packaged non-obtuse triangle, so callers need not unpack its inner
products themselves. -/
theorem false_of_cyclic_foreign_hits_of_nonobtuse_triangle_of_ne
    {A : Finset ℝ²} {hA : A.Nonempty} {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (T : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    {O q₀ q₁ q₂ : ℝ²} {R a b c : ℝ}
    (hapos : 0 < a) (hbpos : 0 < b) (hcpos : 0 < c)
    (hA₀O : dist T.toMoserTriangle.v1 O = R)
    (hA₁O : dist T.toMoserTriangle.v2 O = R)
    (hA₂O : dist T.toMoserTriangle.v3 O = R)
    (ha : dist T.toMoserTriangle.v2 T.toMoserTriangle.v3 = a)
    (hb : dist T.toMoserTriangle.v3 T.toMoserTriangle.v1 = b)
    (hc : dist T.toMoserTriangle.v1 T.toMoserTriangle.v2 = c)
    (hq₀A : dist q₀ T.toMoserTriangle.v1 = c)
    (hq₀B : dist q₀ T.toMoserTriangle.v2 = a)
    (hq₀O : dist q₀ O ≤ R)
    (hq₁A : dist q₁ T.toMoserTriangle.v2 = a)
    (hq₁B : dist q₁ T.toMoserTriangle.v3 = b)
    (hq₁O : dist q₁ O ≤ R)
    (hq₂A : dist q₂ T.toMoserTriangle.v3 = b)
    (hq₂B : dist q₂ T.toMoserTriangle.v1 = c)
    (hq₂O : dist q₂ O ≤ R)
    (hne : a ≠ b) :
    False := by
  obtain ⟨hna, hnb, hnc⟩ := T.nonObtuse_sides ha hb hc
  exact false_of_cyclic_foreign_hits_of_ne hapos hbpos hcpos hna hnb hnc
    hA₀O hA₁O hA₂O ha hb hc hq₀A hq₀B hq₀O hq₁A hq₁B hq₁O
    hq₂A hq₂B hq₂O hne

end Problem97
