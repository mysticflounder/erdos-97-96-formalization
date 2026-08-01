/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof
import Erdos9796Proof.P97.FiniteN10
import Erdos9796Proof.P97.FiniteN11

/-!
# Solution.lean — comparator solution module

Discharges every `sorry` stub in `Challenge.lean` by importing the project
(`import Erdos9796Proof`) and inhabiting each headline statement with the real
project theorem.

`Erdos9796Proof.P97.FiniteN10` and `Erdos9796Proof.P97.FiniteN11` are imported
separately because the project root does not reach them: the root imports only
the two upstream-vocabulary bridges, whose descent route does not pass through
the fixed-card exact-ten or exact-eleven endpoints. Both are standalone
endpoints, so gating them here requires naming their modules.

Each theorem here states the **exact same signature** as its namesake in
`Challenge.lean` — same `Headline.` name, identical statement text — and proves
it from the corresponding project declaration. The
[leanprover/comparator](https://github.com/leanprover/comparator) run re-exports
both modules and checks statement identity plus axiom compliance, so drift
between the two files cannot pass silently.

See `comparator/README.md` for the audit boundary: which headline results are
mathlib-only-statable and gated here, and which are not.
-/

open Filter

namespace Headline

/- ## Erdős 97 — unconditional partial results

`Problem97.ConvexIndep A` is `EuclideanGeometry.ConvexIndep ↑A`, i.e.
`∀ a ∈ ↑A, a ∉ convexHull ℝ (↑A \ {a})`; `Erdos97.HasNEquidistantProperty 4 A`
is `∀ p ∈ A, ∃ r > 0, #(A.filter (dist p · = r)) ≥ 4`. Both are inlined below.
-/

/-- Every Problem-97 counterexample has at least 9 points. -/
theorem counterexample_card_ge_nine
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hK4 : ∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) :
    9 ≤ A.card :=
  Problem97.counterexample_card_ge_nine hne hconv hK4

/-- No 9-point convex-independent planar set has the 4-equidistant property. -/
theorem finiteN9Closure :
    ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.card = 9 →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4) :=
  Problem97.FiniteN9Closure

/-- Every Problem-97 counterexample has at least 10 points. -/
theorem counterexample_card_ge_ten
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hK4 : ∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) :
    10 ≤ A.card :=
  Problem97.counterexample_card_ge_ten hne hconv hK4

/-- **Erdős 97 holds for every point set of at most 9 points.** -/
theorem erdos97_of_card_le_nine
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hcard : A.card ≤ 9) :
    ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) :=
  Problem97.not_hasNEquidistantProperty_four_of_card_le_nine hne hconv hcard

/- ### Pinned-multiplicity reformulation

`Problem97.pinnedMultiplicity A p` and `Problem97.pinnedRadii A p` are
transparent `def`s, inlined below as the `Finset.sup` of the fibre cardinalities
over the positive distances realized from `p`. -/

/-- **Erdős 97 in pinned-multiplicity form.** -/
theorem erdos97_iff_pinnedMultiplicity :
    (∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.Nonempty →
        (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
          a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
        ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
          (A.filter fun q => dist p q = r).card ≥ 4)) ↔
      (∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.Nonempty →
        (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
          a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
        ∃ p ∈ A, ((A.image fun q => dist p q).filter fun r => 0 < r).sup
          (fun r => (A.filter fun q => dist p q = r).card) ≤ 3) :=
  Problem97.universalProblem97Statement_iff_pinnedMultiplicity

/-- **Pinned-multiplicity form at `|A| ≤ 9`, unconditional.** -/
theorem exists_pinnedMultiplicity_le_three_of_card_le_nine
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hcard : A.card ≤ 9) :
    ∃ p ∈ A, ((A.image fun q => dist p q).filter fun r => 0 < r).sup
      (fun r => (A.filter fun q => dist p q = r).card) ≤ 3 :=
  Problem97.exists_pinnedMultiplicity_le_three_of_card_le_nine hne hconv hcard

/-- **The strong-induction reduction.** A counting obstruction plus a descent
step at every cardinality above 9 yield Erdős 97 in full. -/
theorem universalProblem97_of_reduction
    (counting : ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.Nonempty →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4) →
      9 ≤ A.card)
    (descent : ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.Nonempty →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4) →
      9 < A.card →
      (∀ B : Finset (EuclideanSpace ℝ (Fin 2)), B.card < A.card → B.Nonempty →
        (∀ a ∈ (B : Set (EuclideanSpace ℝ (Fin 2))),
          a ∉ convexHull ℝ ((B : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
        (∀ p ∈ B, ∃ r : ℝ, r > 0 ∧
          (B.filter fun q => dist p q = r).card ≥ 4) → False) →
      False) :
    ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.Nonempty →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4) :=
  Problem97.UniversalProblem97_of_reduction
    { counting := counting, descent := descent }

/-- **Descent glue.** A removable vertex of a counterexample yields a strictly
smaller counterexample. -/
theorem smaller_counterexample_of_removable
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    {x : EuclideanSpace ℝ (Fin 2)}
    (hrem : x ∈ A ∧ ∀ p ∈ A.erase x, ∃ r : ℝ, r > 0 ∧
      ((A.erase x).filter fun q => dist p q = r).card ≥ 4)
    (hcard : 1 < A.card) :
    ∃ B : Finset (EuclideanSpace ℝ (Fin 2)), B.Nonempty ∧ B.card < A.card ∧
      (∀ a ∈ (B : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((B : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) ∧
      (∀ p ∈ B, ∃ r : ℝ, r > 0 ∧
        (B.filter fun q => dist p q = r).card ≥ 4) :=
  Problem97.smaller_counterexample_of_removable hconv hrem hcard

/- ## Erdős 97 ⟹ Erdős 96, with explicit constant 3

`EuclideanGeometry.unitDistancePairsCount A` is
`#(A.offDiag.filter (fun p => dist p.1 p.2 = 1)) / 2` and
`Erdos96.maxConvexUnitDistances n` is the `sSup` of those counts over
convex-independent `n`-sets; both are inlined.
-/

/-- **Erdős 97 ⟹ Erdős 96, per-set form.** Given Erdős 97, a finite planar set
in convex position determines at most `3 · |A|` unit distances. -/
theorem unit_distance_pairs_bound_of_erdos97
    (hP97 : ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.Nonempty →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4))
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hConv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) :
    (A.offDiag.filter fun p => dist p.1 p.2 = 1).card / 2 ≤ 3 * A.card :=
  Problem96.unit_distance_pairs_bound_of_erdos97 hP97 hConv

/-- **Erdős 97 ⟹ Erdős 96.** Given Erdős 97, the maximum number of unit
distances among `n` points in convex position is `O(n)`. -/
theorem erdos96_of_erdos97
    (hP97 : ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.Nonempty →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4)) :
    (fun n : ℕ => ((sSup {m : ℕ |
        ∃ points : Finset (EuclideanSpace ℝ (Fin 2)), ∃ _ : points.card = n,
          ∃ _ : ∀ a ∈ (points : Set (EuclideanSpace ℝ (Fin 2))),
            a ∉ convexHull ℝ ((points : Set (EuclideanSpace ℝ (Fin 2))) \ {a}),
          (points.offDiag.filter fun p => dist p.1 p.2 = 1).card / 2 = m} : ℕ) : ℝ))
      =O[atTop] fun n : ℕ => (n : ℝ) :=
  Problem96.erdos96_rhs_of_erdos97 hP97

/- ## Minimum enclosing circle and the counting engine -/

/-- **Sylvester (1857).** Every nonempty finite planar set has a unique minimum
enclosing circle. -/
theorem exists_unique_minimum_enclosing_circle
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hA : A.Nonempty) :
    ∃! cr : EuclideanSpace ℝ (Fin 2) × ℝ, 0 ≤ cr.2 ∧
      (∀ p ∈ A, dist p cr.1 ≤ cr.2) ∧
      (∀ c' r', (∀ p ∈ A, dist p c' ≤ r') → cr.2 ≤ r') :=
  Problem97.MEC.exists_unique_minimum_enclosing_circle hA

open scoped Classical in
/-- **Dumitrescu-style isosceles bound, circumscribed branch.** A
convex-independent, non-collinear planar `n`-set with at least 3 points on its
minimum enclosing circle determines at most `(11n² − 18n)/12` apex-marked
isosceles triples. The minimum enclosing circle is unbundled into
`center`/`radius` plus its three defining properties. -/
theorem iCount_le_of_convexIndep_circumscribed
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hnoncol : ¬ Collinear ℝ (A : Set (EuclideanSpace ℝ (Fin 2))))
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (center : EuclideanSpace ℝ (Fin 2)) (radius : ℝ)
    (radius_nn : 0 ≤ radius)
    (enclosing : ∀ p ∈ A, dist p center ≤ radius)
    (minimal : ∀ c' r', (∀ p ∈ A, dist p c' ≤ r') → radius ≤ r')
    (hbd : 3 ≤ (A.filter fun p => dist p center = radius).card) :
    ((∑ p ∈ A, (((A.erase p).powersetCard 2).filter
        (fun s => ∃ r : ℝ, ∀ q ∈ s, dist p q = r)).card : ℕ) : ℝ)
      ≤ ((11 : ℝ) * A.card ^ 2 - 18 * A.card) / 12 := by
  obtain ⟨hc, hr⟩ := Problem97.MinEnclosingCircle.unique_pair hne radius_nn
    (Problem97.MEC.mec A hne).radius_nn enclosing
    (Problem97.MEC.mec A hne).enclosing minimal
    (Problem97.MEC.mec A hne).minimal
  subst hc; subst hr
  exact Problem97.CGN8_circumscribed_iCount_upper_bound hne hnoncol hconv hbd

/- ## Sylvester dichotomy, Welzl invariant, non-obtuse triple

`Problem97.MEC.mec A hA` is a choice-extracted `MinEnclosingCircle A` record, so
it is not inlinable; as in `iCount_le_of_convexIndep_circumscribed` above it is
unbundled into `center`/`radius` plus `radius_nn`/`enclosing`/`minimal`. Under
that unbundling `Problem97.MEC.boundary A hA` is
`A.filter (fun p => dist p center = radius)`.
-/

open scoped Classical in
/-- **Sylvester's minimum-enclosing-circle dichotomy (1857).** For a nonempty
non-collinear planar set `A`, either two distinct points `p, q ∈ A` realise the
minimum enclosing circle as a diameter — centre `= midpoint ℝ p q` and
radius `= dist p q / 2` — or at least three points of `A` lie on that circle. -/
theorem sylvester_dichotomy
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hA : A.Nonempty)
    (hncol : ¬ Collinear ℝ (A : Set (EuclideanSpace ℝ (Fin 2))))
    (center : EuclideanSpace ℝ (Fin 2)) (radius : ℝ)
    (radius_nn : 0 ≤ radius)
    (enclosing : ∀ p ∈ A, dist p center ≤ radius)
    (minimal : ∀ c' r', (∀ p ∈ A, dist p c' ≤ r') → radius ≤ r') :
    (∃ p ∈ A, ∃ q ∈ A, p ≠ q ∧
        dist p center = radius ∧
        dist q center = radius ∧
        center = midpoint ℝ p q ∧
        radius = dist p q / 2)
      ∨ 3 ≤ (A.filter fun p => dist p center = radius).card := by
  obtain ⟨hc, hr⟩ := Problem97.MinEnclosingCircle.unique_pair hA radius_nn
    (Problem97.MEC.mec A hA).radius_nn enclosing
    (Problem97.MEC.mec A hA).enclosing minimal
    (Problem97.MEC.mec A hA).minimal
  subst hc; subst hr
  exact Problem97.MEC.sylvester_dichotomy hA hncol

open scoped Classical in
/-- **Welzl invariant.** The centre of the minimum enclosing circle of a
nonempty non-collinear planar set lies in the convex hull of the points that
realise its radius. -/
theorem mec_center_mem_convexHull_boundary
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hA : A.Nonempty)
    (hncol : ¬ Collinear ℝ (A : Set (EuclideanSpace ℝ (Fin 2))))
    (center : EuclideanSpace ℝ (Fin 2)) (radius : ℝ)
    (radius_nn : 0 ≤ radius)
    (enclosing : ∀ p ∈ A, dist p center ≤ radius)
    (minimal : ∀ c' r', (∀ p ∈ A, dist p c' ≤ r') → radius ≤ r') :
    center ∈ convexHull ℝ
      (((A.filter fun p => dist p center = radius) :
        Finset (EuclideanSpace ℝ (Fin 2))) : Set (EuclideanSpace ℝ (Fin 2))) := by
  obtain ⟨hc, hr⟩ := Problem97.MinEnclosingCircle.unique_pair hA radius_nn
    (Problem97.MEC.mec A hA).radius_nn enclosing
    (Problem97.MEC.mec A hA).enclosing minimal
    (Problem97.MEC.mec A hA).minimal
  subst hc; subst hr
  exact Problem97.MEC.mec_center_mem_convexHull_boundary hA hncol

open scoped Classical in
/-- **Moser non-obtuse triple extraction.** If at least three points of a
nonempty non-collinear planar set lie on its minimum enclosing circle, then
three distinct such points `a, b, c` form a non-obtuse triangle:
`⟪b − a, c − a⟫ ≥ 0`, `⟪c − b, a − b⟫ ≥ 0`, `⟪a − c, b − c⟫ ≥ 0`. -/
theorem exists_nonobtuse_circumscribed_triple
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hA : A.Nonempty)
    (hncol : ¬ Collinear ℝ (A : Set (EuclideanSpace ℝ (Fin 2))))
    (center : EuclideanSpace ℝ (Fin 2)) (radius : ℝ)
    (radius_nn : 0 ≤ radius)
    (enclosing : ∀ p ∈ A, dist p center ≤ radius)
    (minimal : ∀ c' r', (∀ p ∈ A, dist p c' ≤ r') → radius ≤ r')
    (hcirc : 3 ≤ (A.filter fun p => dist p center = radius).card) :
    ∃ a b c : EuclideanSpace ℝ (Fin 2), a ∈ A ∧ b ∈ A ∧ c ∈ A ∧
      a ≠ b ∧ b ≠ c ∧ a ≠ c ∧
      dist a center = radius ∧
      dist b center = radius ∧
      dist c center = radius ∧
      inner ℝ (b - a) (c - a) ≥ 0 ∧
      inner ℝ (c - b) (a - b) ≥ 0 ∧
      inner ℝ (a - c) (b - c) ≥ 0 := by
  obtain ⟨hc, hr⟩ := Problem97.MinEnclosingCircle.unique_pair hA radius_nn
    (Problem97.MEC.mec A hA).radius_nn enclosing
    (Problem97.MEC.mec A hA).enclosing minimal
    (Problem97.MEC.mec A hA).minimal
  subst hc; subst hr
  exact Problem97.MEC.exists_nonobtuse_circumscribed_triple hA hncol hcirc

open scoped Classical in
/-- **No diameter case under K4.** A nonempty, non-collinear,
convex-independent planar set with the 4-equidistant property has at least
three points on its minimum enclosing circle, so Sylvester's dichotomy always
lands in the circumscribed branch. -/
theorem no_diameter_under_k4
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hA : A.Nonempty)
    (hncol : ¬ Collinear ℝ (A : Set (EuclideanSpace ℝ (Fin 2))))
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hK4 : ∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4)
    (center : EuclideanSpace ℝ (Fin 2)) (radius : ℝ)
    (radius_nn : 0 ≤ radius)
    (enclosing : ∀ p ∈ A, dist p center ≤ radius)
    (minimal : ∀ c' r', (∀ p ∈ A, dist p c' ≤ r') → radius ≤ r') :
    3 ≤ (A.filter fun p => dist p center = radius).card := by
  obtain ⟨hc, hr⟩ := Problem97.MinEnclosingCircle.unique_pair hA radius_nn
    (Problem97.MEC.mec A hA).radius_nn enclosing
    (Problem97.MEC.mec A hA).enclosing minimal
    (Problem97.MEC.mec A hA).minimal
  subst hc; subst hr
  exact Problem97.MEC.no_diameter_under_k4 hA hncol hconv hK4

/- ## Dumitrescu / Fox–Pach isosceles double count

`Problem97.IsoscelesPairsAt A p` is
`((A.erase p).powersetCard 2).filter (fun s => ∃ r, ∀ q ∈ s, dist p q = r)` and
`Problem97.iCount A` is `∑ p ∈ A, #(Problem97.IsoscelesPairsAt A p)`; both are
inlined below.
-/

open scoped Classical in
/-- **Dumitrescu L1 / Fox–Pach perpendicular-bisector apex bound.** In a
convex-independent planar set, at most `2` points are equidistant from a given
pair of distinct points of the set. -/
theorem perpBisector_apex_bound
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    {a b : EuclideanSpace ℝ (Fin 2)} (ha : a ∈ A) (hb : b ∈ A) (hab : a ≠ b) :
    (A.filter fun p => dist p a = dist p b).card ≤ 2 :=
  Problem97.Dumitrescu.perpBisector_apex_bound hconv ha hb hab

open scoped Classical in
/-- **Dumitrescu L2 / Fox–Pach base–apex double count.** In a
convex-independent planar `n`-set, the total number of apex-marked isosceles
pairs is at most `n · (n − 1)`. -/
theorem base_apex_double_count
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) :
    ∑ a ∈ A, (((A.erase a).powersetCard 2).filter
        (fun s => ∃ r : ℝ, ∀ q ∈ s, dist a q = r)).card
      ≤ A.card * (A.card - 1) :=
  Problem97.Dumitrescu.base_apex_double_count hconv

open scoped Classical in
/-- **Isosceles lower bound under K4.** A planar set with the 4-equidistant
property determines at least `6 · |A|` apex-marked isosceles pairs. -/
theorem six_mul_card_le_iCount_of_K4
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hK4 : ∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) :
    6 * A.card ≤ ∑ p ∈ A, (((A.erase p).powersetCard 2).filter
      (fun s => ∃ r : ℝ, ∀ q ∈ s, dist p q = r)).card :=
  Problem97.six_mul_card_le_iCount_of_K4 hK4

/- ## Planar metric kernels -/

/-- **Thales disk–angle equivalence.** A point `z` lies in the closed disk with
diameter `xy` exactly when it sees the chord `xy` at a non-obtuse angle,
i.e. `⟪x − z, y − z⟫ ≤ 0`. -/
theorem dist_midpoint_le_half_iff_inner_nonpos
    (z x y : EuclideanSpace ℝ (Fin 2)) :
    dist z (midpoint ℝ x y) ≤ dist x y / 2 ↔ inner ℝ (x - z) (y - z) ≤ 0 :=
  Problem97.dist_midpoint_le_half_iff_inner_nonpos z x y

/-- **Strict Kalmanson inequality for a crossed quadrilateral.** If the
diagonals `ac` and `bd` meet at an interior point and neither `{a, b, c}` nor
`{a, c, d}` is collinear, then `|bc| + |ad| < |ac| + |bd|`. -/
theorem dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    {a b c d z : EuclideanSpace ℝ (Fin 2)}
    (hzac : z ∈ openSegment ℝ a c)
    (hzbd : z ∈ openSegment ℝ b d)
    (habc : ¬ Collinear ℝ ({a, b, c} : Set (EuclideanSpace ℝ (Fin 2))))
    (hacd : ¬ Collinear ℝ ({a, c, d} : Set (EuclideanSpace ℝ (Fin 2)))) :
    dist b c + dist a d < dist a c + dist b d :=
  Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    hzac hzbd habc hacd

-- The fully qualified project name below is 106 characters wide.
set_option linter.style.longLine false in
/-- **Companion strict Kalmanson inequality.** Same hypotheses, the other pair
of opposite sides: `|ab| + |cd| < |ac| + |bd|`. -/
theorem complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    {a b c d z : EuclideanSpace ℝ (Fin 2)}
    (hzac : z ∈ openSegment ℝ a c)
    (hzbd : z ∈ openSegment ℝ b d)
    (habc : ¬ Collinear ℝ ({a, b, c} : Set (EuclideanSpace ℝ (Fin 2))))
    (hacd : ¬ Collinear ℝ ({a, c, d} : Set (EuclideanSpace ℝ (Fin 2)))) :
    dist a b + dist c d < dist a c + dist b d :=
  Problem97.CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    hzac hzbd habc hacd

/-- **No four planar points at a common pairwise distance.** There is no
`p, t₁, t₂, t₃ ∈ ℝ²` whose six pairwise distances all equal one positive
radius `r` — the planar `K₄` unit-distance obstruction. -/
theorem u5_unit_triangle_on_p_circle_incompatibility
    {p t1 t2 t3 : EuclideanSpace ℝ (Fin 2)} {r : ℝ} (hr : 0 < r)
    (hp1 : dist p t1 = r) (hp2 : dist p t2 = r) (hp3 : dist p t3 = r)
    (h12 : dist t1 t2 = r) (h13 : dist t1 t3 = r) (h23 : dist t2 t3 = r) :
    False :=
  Problem97.u5_unit_triangle_on_p_circle_incompatibility hr hp1 hp2 hp3 h12 h13 h23

/-- **Equilateral inscribed triangle: side `= R · √3`.** Three distinct points
on a sphere in an oriented 2-dimensional Euclidean space, pairwise
equidistant, are at distance `R · √3` where `R` is the sphere's radius. -/
theorem equilateral_inscribed_side_eq_radius_mul_sqrt_three
    {V P : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
    [MetricSpace P] [NormedAddTorsor V P]
    [Fact (Module.finrank ℝ V = 2)] [Module.Oriented ℝ V (Fin 2)]
    {s : EuclideanGeometry.Sphere P} {p₁ p₂ p₃ : P}
    (h1 : p₁ ∈ s) (h2 : p₂ ∈ s) (h3 : p₃ ∈ s)
    (h12 : p₁ ≠ p₂) (h13 : p₁ ≠ p₃) (h23 : p₂ ≠ p₃)
    (hd12 : dist p₁ p₂ = dist p₁ p₃)
    (hd23 : dist p₂ p₃ = dist p₁ p₃) :
    dist p₁ p₃ = s.radius * Real.sqrt 3 :=
  Problem97.equilateral_inscribed_side_eq_radius_mul_sqrt_three
    h1 h2 h3 h12 h13 h23 hd12 hd23

/- ## Compiler-trusted tier

Sorry-free, but the exact-ten certificate bank is discharged by
`native_decide`, so these carry `Lean.ofReduceBool` and `Lean.trustCompiler` in
addition to the core three axioms. Gated by `config-native.json`, audited by
`axiom-audit-native.lean`. See the matching section of `Challenge.lean` for why
the split exists and why `Problem97.FiniteN11Closure` — sorry-free since
2026-08-01 — is not gated here yet. -/

/-- **No 10-point convex-independent planar set has the 4-equidistant
property.** The exact-ten finite endpoint. -/
theorem finiteN10Closure :
    ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.card = 10 →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4) :=
  Problem97.FiniteN10Closure

/-- **Every Problem-97 counterexample has at least 11 points.**

`Problem97.counterexample_card_ge_ten` gives `10 ≤ |A|`; the exact-ten endpoint
`Problem97.FiniteN10Closure` rules out equality. Same composition as
`Problem97.counterexample_card_ge_ten` itself, one level up. -/
theorem counterexample_card_ge_eleven
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hK4 : ∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) :
    11 ≤ A.card := by
  rcases (Problem97.counterexample_card_ge_ten hne hconv hK4).lt_or_eq with
    hlt | heq
  · omega
  · exact absurd hK4 (Problem97.FiniteN10Closure A heq.symm hconv)

/-- **Erdős 97 holds for every point set of at most 10 points.**

The contrapositive of `counterexample_card_ge_eleven`. -/
theorem erdos97_of_card_le_ten
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hcard : A.card ≤ 10) :
    ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) := by
  intro hK4
  have := counterexample_card_ge_eleven hne hconv hK4
  omega

/-- **No 11-point convex-independent planar set has the 4-equidistant
property.** The exact-eleven finite endpoint. -/
theorem finiteN11Closure :
    ∀ A : Finset (EuclideanSpace ℝ (Fin 2)), A.card = 11 →
      (∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
        a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a})) →
      ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
        (A.filter fun q => dist p q = r).card ≥ 4) :=
  Problem97.FiniteN11Closure

/-- **Every Problem-97 counterexample has at least 12 points.**

`counterexample_card_ge_eleven` gives `11 ≤ |A|`; the exact-eleven endpoint
`Problem97.FiniteN11Closure` rules out equality — the same composition one
level up. -/
theorem counterexample_card_ge_twelve
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hK4 : ∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) :
    12 ≤ A.card := by
  rcases (counterexample_card_ge_eleven hne hconv hK4).lt_or_eq with
    hlt | heq
  · omega
  · exact absurd hK4 (Problem97.FiniteN11Closure A heq.symm hconv)

/-- **Erdős 97 holds for every point set of at most 11 points.**

The contrapositive of `counterexample_card_ge_twelve`. -/
theorem erdos97_of_card_le_eleven
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (hne : A.Nonempty)
    (hconv : ∀ a ∈ (A : Set (EuclideanSpace ℝ (Fin 2))),
      a ∉ convexHull ℝ ((A : Set (EuclideanSpace ℝ (Fin 2))) \ {a}))
    (hcard : A.card ≤ 11) :
    ¬ (∀ p ∈ A, ∃ r : ℝ, r > 0 ∧
      (A.filter fun q => dist p q = r).card ≥ 4) := by
  intro hK4
  have := counterexample_card_ge_twelve hne hconv hK4
  omega

end Headline
