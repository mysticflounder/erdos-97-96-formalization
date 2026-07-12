/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.Census554.CapSelectedGeometry
import Erdos9796Proof.P97.Census554.ConvexRhombusCore

/-!
# Seed-independent ordered-core sign discharge (L12)

The cap-selected finite classifier leaves two ordered cyclic obstruction
families as the last two branches of `ClosureCoreAlternative`:

* the five-point convex-order core, guarded by `CyclicFiveUpToOrientation`; and
* the convex rhombus / equilateral six-point core, guarded by
  `CyclicSixUpToOrientation`.

This module discharges both against a `CanonicalLabeling`.  Given a canonical
`(6,4,4)` labeling `L`, a realization of the row pattern, and a core whose
finite cyclic-order predicate holds, we derive `False`.

The geometric engine is `signedArea2_pos_of_between`
(`ArcBlockContiguity.lean`): on a CCW convex boundary a vertex at a
strictly-between hull index sits on the positive side of the bracketing chord.
Combined with the antisymmetry/cyclic-invariance of `signedArea2`, a triple in
positive cyclic hull order has strictly negative signed area, and a triple in
negative cyclic order has strictly positive signed area.

The canonical hull comes in two orientations (`CanonicalHull.point_eq`): the
direct boundary order and its reflection about the surplus-apex cut
(`card11BoundaryReflection`).  Reflection reverses the cyclic order
(`rev_reverses`), so the four (orientation × core-orientation) cases collapse to
the two signed consumers `false_of_core` (all-positive) and `false_of_core_of_neg`
(all-negative), which are already proven in the core files.

Everything here is seed-independent: no `SurplusCapPacket`-specific data beyond
the canonical labeling enters, so the same lemmas serve the pinned lane.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace OrderedCoreSigns

open CapSelectedFiniteCode CapSelectedGeometry EqualityCore SeparationCore

/- ### Signed-area algebra -/

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = - signedArea2 b a c := by
  simp only [signedArea2]; ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = - signedArea2 a c b := by
  simp only [signedArea2]; ring

private theorem signedArea2_rotate (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]; ring

/- ### Strict hull signs from cyclic order -/

/-- Three vertices whose hull indices increase (`i < j < k`) bound a strictly
negative signed area: the middle-index positivity of
`signedArea2_pos_of_between` transposed into the sorted argument order. -/
private theorem signedArea2_neg_of_lt {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {i j k : Fin n} (h1 : i < j) (h2 : j < k) :
    signedArea2 (φ i) (φ j) (φ k) < 0 := by
  have hp := signedArea2_pos_of_between hccw hφ h1 h2
  rw [signedArea2_swap12 (φ i) (φ j) (φ k)]
  linarith

/-- A triple in positive cyclic hull order (a cyclic rotation of increasing
indices) has strictly negative signed area. -/
private theorem signedArea2_neg_of_cyclic {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {i j k : Fin n}
    (h : (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)) :
    signedArea2 (φ i) (φ j) (φ k) < 0 := by
  rcases h with ⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨h1, h2⟩
  · exact signedArea2_neg_of_lt hccw hφ h1 h2
  · rw [signedArea2_rotate (φ i) (φ j) (φ k)]
    exact signedArea2_neg_of_lt hccw hφ h1 h2
  · rw [signedArea2_rotate (φ i) (φ j) (φ k), signedArea2_rotate (φ j) (φ k) (φ i)]
    exact signedArea2_neg_of_lt hccw hφ h1 h2

/-- A triple in negative cyclic hull order has strictly positive signed area.
The hypothesis is the positive cyclic order of the `(i, k, j)` transposition. -/
private theorem signedArea2_pos_of_cyclic {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {i j k : Fin n}
    (h : (i < k ∧ k < j) ∨ (k < j ∧ j < i) ∨ (j < i ∧ i < k)) :
    0 < signedArea2 (φ i) (φ j) (φ k) := by
  rw [signedArea2_swap23 (φ i) (φ j) (φ k)]
  have := signedArea2_neg_of_cyclic hccw hφ (i := i) (j := k) (k := j) h
  linarith

/- ### Boundary reflection reverses cyclic order -/

private theorem revIndex_val (i : Fin 11) :
    (card11BoundaryReflection i).val = (11 - i.val) % 11 := by
  fin_cases i <;> rfl

/-- Reflecting the eleven hull positions about the surplus-apex cut reverses the
cyclic order: a positively cyclic triple maps to a negatively cyclic triple. -/
private theorem rev_reverses {i j k : Fin 11}
    (h : (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)) :
    (card11BoundaryReflection i < card11BoundaryReflection k ∧
        card11BoundaryReflection k < card11BoundaryReflection j) ∨
    (card11BoundaryReflection k < card11BoundaryReflection j ∧
        card11BoundaryReflection j < card11BoundaryReflection i) ∨
    (card11BoundaryReflection j < card11BoundaryReflection i ∧
        card11BoundaryReflection i < card11BoundaryReflection k) := by
  have ri := revIndex_val i
  have rj := revIndex_val j
  have rk := revIndex_val k
  have := i.isLt
  have := j.isLt
  have := k.isLt
  omega

/- ### Transporting hull signs through a canonical-hull orientation -/

/-- Positive cyclic hull order of `(p, q, r)` under a boundary index map `g`
(either `hullIndex` or its reflection) forces a strictly negative signed area of
the realized points. -/
private theorem sign_neg_of_pointEq {pointOf : Label → ℝ²}
    (H : CanonicalHull pointOf) {g : Label → Fin 11}
    (hg : ∀ l, H.boundary (g l) = pointOf l) {p q r : Label}
    (h : (g p < g q ∧ g q < g r) ∨ (g q < g r ∧ g r < g p) ∨
      (g r < g p ∧ g p < g q)) :
    signedArea2 (pointOf p) (pointOf q) (pointOf r) < 0 := by
  rw [← hg p, ← hg q, ← hg r]
  exact signedArea2_neg_of_cyclic H.boundary_ccw H.boundary_injective h

/-- Negative cyclic hull order of `(p, q, r)` under a boundary index map `g`
forces a strictly positive signed area of the realized points. -/
private theorem sign_pos_of_pointEq {pointOf : Label → ℝ²}
    (H : CanonicalHull pointOf) {g : Label → Fin 11}
    (hg : ∀ l, H.boundary (g l) = pointOf l) {p q r : Label}
    (h : (g p < g r ∧ g r < g q) ∨ (g r < g q ∧ g q < g p) ∨
      (g q < g p ∧ g p < g r)) :
    0 < signedArea2 (pointOf p) (pointOf q) (pointOf r) := by
  rw [← hg p, ← hg q, ← hg r]
  exact signedArea2_pos_of_cyclic H.boundary_ccw H.boundary_injective h

/- ### The two ordered-core discharges -/

/-- **Five-point ordered core (branch 11).**  A canonical `(6,4,4)` labeling
cannot realize the row pattern of a five-point convex-order core whose cyclic
predicate `CyclicFiveUpToOrientation core.a core.x core.b core.c core.y` holds.

Route: the predicate gives, in the direct hull order, positive cyclic order of
`(a, x, b)` and `(b, c, y)` (first disjunct) or their reverses (second
disjunct).  Casing on the two hull orientations, the required signed-area signs
are produced by `signedArea2_pos_of_between` (via `sign_neg`/`sign_pos_of_pointEq`
and `rev_reverses`), then closed by `ConvexFivePointCore.false_of_core` /
`false_of_core_of_neg`. -/
theorem cyclicFiveCore_false_of_canonicalLabeling {A : Finset ℝ²}
    {S : SurplusCapPacket A} (L : CanonicalLabeling S) {P : PatternCode}
    (hreal : Realizes (rowPattern P) L.pointOf)
    (core : ConvexFivePointCore.Core (rowPattern P))
    (hcyc : CyclicFiveUpToOrientation core.a core.x core.b core.c core.y) :
    False := by
  set a := core.a
  set x := core.x
  set b := core.b
  set c := core.c
  set y := core.y
  rcases hcyc with hc1 | hc2
  · -- Direct orientation puts `a, x, b, c, y` in positive cyclic hull order.
    obtain ⟨h1, h2, h3, h4⟩ := hc1
    have := (hullIndex a).isLt
    have := (hullIndex x).isLt
    have := (hullIndex b).isLt
    have := (hullIndex c).isLt
    have := (hullIndex y).isLt
    simp only [cyclicOffset] at h1 h2 h3 h4
    have hAXB : (hullIndex a < hullIndex x ∧ hullIndex x < hullIndex b) ∨
        (hullIndex x < hullIndex b ∧ hullIndex b < hullIndex a) ∨
        (hullIndex b < hullIndex a ∧ hullIndex a < hullIndex x) := by omega
    have hBCY : (hullIndex b < hullIndex c ∧ hullIndex c < hullIndex y) ∨
        (hullIndex c < hullIndex y ∧ hullIndex y < hullIndex b) ∨
        (hullIndex y < hullIndex b ∧ hullIndex b < hullIndex c) := by omega
    rcases L.canonicalHull.point_eq with hdir | hmir
    · exact ConvexFivePointCore.false_of_core_of_neg hreal core
        (sign_neg_of_pointEq L.canonicalHull hdir hAXB)
        (sign_neg_of_pointEq L.canonicalHull hdir hBCY)
    · exact ConvexFivePointCore.false_of_core hreal core
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hAXB))
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hBCY))
  · -- Reversed core orientation: each triple is anti-cyclic in the direct order.
    obtain ⟨h1, h2, h3, h4⟩ := hc2
    have := (hullIndex a).isLt
    have := (hullIndex x).isLt
    have := (hullIndex b).isLt
    have := (hullIndex c).isLt
    have := (hullIndex y).isLt
    simp only [cyclicOffset] at h1 h2 h3 h4
    have hAXB : (hullIndex a < hullIndex b ∧ hullIndex b < hullIndex x) ∨
        (hullIndex b < hullIndex x ∧ hullIndex x < hullIndex a) ∨
        (hullIndex x < hullIndex a ∧ hullIndex a < hullIndex b) := by omega
    have hBCY : (hullIndex b < hullIndex y ∧ hullIndex y < hullIndex c) ∨
        (hullIndex y < hullIndex c ∧ hullIndex c < hullIndex b) ∨
        (hullIndex c < hullIndex b ∧ hullIndex b < hullIndex y) := by omega
    rcases L.canonicalHull.point_eq with hdir | hmir
    · exact ConvexFivePointCore.false_of_core hreal core
        (sign_pos_of_pointEq L.canonicalHull hdir hAXB)
        (sign_pos_of_pointEq L.canonicalHull hdir hBCY)
    · exact ConvexFivePointCore.false_of_core_of_neg hreal core
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hAXB))
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hBCY))

-- The six-point discharge runs twelve `omega` cyclic-order derivations and
-- twelve signed-area unifications across the two hull orientations in a single
-- command, which exceeds the default heartbeat budget.
set_option maxHeartbeats 1000000 in
/-- **Six-point ordered core (branch 12).**  A canonical `(6,4,4)` labeling
cannot realize the row pattern of a convex rhombus / equilateral six-point core
whose cyclic predicate
`CyclicSixUpToOrientation core.a core.b core.c core.x core.y core.d` holds.

Route: identical to the five-point case, discharging the six oriented triangles
`(a,b,c), (a,b,d), (b,c,y), (x,d,a), (c,x,y), (x,y,d)` demanded by
`ConvexRhombusCore.false_of_core` / `false_of_core_of_neg`. -/
theorem cyclicSixCore_false_of_canonicalLabeling {A : Finset ℝ²}
    {S : SurplusCapPacket A} (L : CanonicalLabeling S) {P : PatternCode}
    (hreal : Realizes (rowPattern P) L.pointOf)
    (core : ConvexRhombusCore.Core (rowPattern P))
    (hcyc : CyclicSixUpToOrientation core.a core.b core.c core.x core.y core.d) :
    False := by
  set a := core.a
  set b := core.b
  set c := core.c
  set x := core.x
  set y := core.y
  set d := core.d
  rcases hcyc with hc1 | hc2
  · -- Direct orientation puts `a, b, c, x, y, d` in positive cyclic hull order.
    obtain ⟨h1, h2, h3, h4, h5⟩ := hc1
    have := (hullIndex a).isLt
    have := (hullIndex b).isLt
    have := (hullIndex c).isLt
    have := (hullIndex x).isLt
    have := (hullIndex y).isLt
    have := (hullIndex d).isLt
    simp only [cyclicOffset] at h1 h2 h3 h4 h5
    have hABC : (hullIndex a < hullIndex b ∧ hullIndex b < hullIndex c) ∨
        (hullIndex b < hullIndex c ∧ hullIndex c < hullIndex a) ∨
        (hullIndex c < hullIndex a ∧ hullIndex a < hullIndex b) := by omega
    have hABD : (hullIndex a < hullIndex b ∧ hullIndex b < hullIndex d) ∨
        (hullIndex b < hullIndex d ∧ hullIndex d < hullIndex a) ∨
        (hullIndex d < hullIndex a ∧ hullIndex a < hullIndex b) := by omega
    have hBCY : (hullIndex b < hullIndex c ∧ hullIndex c < hullIndex y) ∨
        (hullIndex c < hullIndex y ∧ hullIndex y < hullIndex b) ∨
        (hullIndex y < hullIndex b ∧ hullIndex b < hullIndex c) := by omega
    have hXDA : (hullIndex x < hullIndex d ∧ hullIndex d < hullIndex a) ∨
        (hullIndex d < hullIndex a ∧ hullIndex a < hullIndex x) ∨
        (hullIndex a < hullIndex x ∧ hullIndex x < hullIndex d) := by omega
    have hCXY : (hullIndex c < hullIndex x ∧ hullIndex x < hullIndex y) ∨
        (hullIndex x < hullIndex y ∧ hullIndex y < hullIndex c) ∨
        (hullIndex y < hullIndex c ∧ hullIndex c < hullIndex x) := by omega
    have hXYD : (hullIndex x < hullIndex y ∧ hullIndex y < hullIndex d) ∨
        (hullIndex y < hullIndex d ∧ hullIndex d < hullIndex x) ∨
        (hullIndex d < hullIndex x ∧ hullIndex x < hullIndex y) := by omega
    rcases L.canonicalHull.point_eq with hdir | hmir
    · exact ConvexRhombusCore.false_of_core_of_neg hreal core
        (sign_neg_of_pointEq L.canonicalHull hdir hABC)
        (sign_neg_of_pointEq L.canonicalHull hdir hABD)
        (sign_neg_of_pointEq L.canonicalHull hdir hBCY)
        (sign_neg_of_pointEq L.canonicalHull hdir hXDA)
        (sign_neg_of_pointEq L.canonicalHull hdir hCXY)
        (sign_neg_of_pointEq L.canonicalHull hdir hXYD)
    · exact ConvexRhombusCore.false_of_core hreal core
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hABC))
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hABD))
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hBCY))
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hXDA))
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hCXY))
        (sign_pos_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hXYD))
  · -- Reversed core orientation: each triple is anti-cyclic in the direct order.
    obtain ⟨h1, h2, h3, h4, h5⟩ := hc2
    have := (hullIndex a).isLt
    have := (hullIndex b).isLt
    have := (hullIndex c).isLt
    have := (hullIndex x).isLt
    have := (hullIndex y).isLt
    have := (hullIndex d).isLt
    simp only [cyclicOffset] at h1 h2 h3 h4 h5
    have hABC : (hullIndex a < hullIndex c ∧ hullIndex c < hullIndex b) ∨
        (hullIndex c < hullIndex b ∧ hullIndex b < hullIndex a) ∨
        (hullIndex b < hullIndex a ∧ hullIndex a < hullIndex c) := by omega
    have hABD : (hullIndex a < hullIndex d ∧ hullIndex d < hullIndex b) ∨
        (hullIndex d < hullIndex b ∧ hullIndex b < hullIndex a) ∨
        (hullIndex b < hullIndex a ∧ hullIndex a < hullIndex d) := by omega
    have hBCY : (hullIndex b < hullIndex y ∧ hullIndex y < hullIndex c) ∨
        (hullIndex y < hullIndex c ∧ hullIndex c < hullIndex b) ∨
        (hullIndex c < hullIndex b ∧ hullIndex b < hullIndex y) := by omega
    have hXDA : (hullIndex x < hullIndex a ∧ hullIndex a < hullIndex d) ∨
        (hullIndex a < hullIndex d ∧ hullIndex d < hullIndex x) ∨
        (hullIndex d < hullIndex x ∧ hullIndex x < hullIndex a) := by omega
    have hCXY : (hullIndex c < hullIndex y ∧ hullIndex y < hullIndex x) ∨
        (hullIndex y < hullIndex x ∧ hullIndex x < hullIndex c) ∨
        (hullIndex x < hullIndex c ∧ hullIndex c < hullIndex y) := by omega
    have hXYD : (hullIndex x < hullIndex d ∧ hullIndex d < hullIndex y) ∨
        (hullIndex d < hullIndex y ∧ hullIndex y < hullIndex x) ∨
        (hullIndex y < hullIndex x ∧ hullIndex x < hullIndex d) := by omega
    rcases L.canonicalHull.point_eq with hdir | hmir
    · exact ConvexRhombusCore.false_of_core hreal core
        (sign_pos_of_pointEq L.canonicalHull hdir hABC)
        (sign_pos_of_pointEq L.canonicalHull hdir hABD)
        (sign_pos_of_pointEq L.canonicalHull hdir hBCY)
        (sign_pos_of_pointEq L.canonicalHull hdir hXDA)
        (sign_pos_of_pointEq L.canonicalHull hdir hCXY)
        (sign_pos_of_pointEq L.canonicalHull hdir hXYD)
    · exact ConvexRhombusCore.false_of_core_of_neg hreal core
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hABC))
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hABD))
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hBCY))
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hXDA))
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hCXY))
        (sign_neg_of_pointEq (g := fun l => card11BoundaryReflection (hullIndex l))
          L.canonicalHull hmir (rev_reverses hXYD))

end OrderedCoreSigns
end Census554
end Problem97
