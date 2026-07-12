/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Four-row perpendicular-bisector exclusion

This file records the structural obstruction in the terminal Census-554
frontier pattern whose only nonempty rows are

* `1 ↦ {3, 8}`;
* `3 ↦ {1, 6}`;
* `6 ↦ {3, 8}`; and
* `10 ↦ {1, 6}`.

The general theorem takes four rows on any label type.  It is stable under
injective relabeling and under adding entries to the rows, because its data
records only the eight row memberships used by the closure paths.  The exact
`Fin 11` frontier pattern is then one instance.  Its equality closure makes
labels `3`, `8`, and `10` equidistant from the distinct foci `1` and `6`.
The resulting `PerpBisectorCore` contradicts a convex-independent realization
through `EqualityCore.false_of_convexIndep_of_perpBisectorCore`.

This is an exact structural exclusion for the displayed row pattern.  It does
not assert generic `IsDead`, motif coverage, or a Census-554 cover theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

open EqualityCore

/-- Four rows forcing three distinct labels onto the perpendicular bisector
of two distinct foci.  The fields mention only the row memberships consumed
by the equality-closure proof, so the core is preserved by superpatterns and
injective relabelings. -/
structure FourRowPerpBisectorCore {α : Type*} (P : RowPattern α) where
  a : α
  b : α
  p : α
  q : α
  r : α
  hab : a ≠ b
  hpq : p ≠ q
  hpr : p ≠ r
  hqr : q ≠ r
  p_mem_a : p ∈ P a
  q_mem_a : q ∈ P a
  p_mem_b : p ∈ P b
  q_mem_b : q ∈ P b
  a_mem_p : a ∈ P p
  b_mem_p : b ∈ P p
  a_mem_r : a ∈ P r
  b_mem_r : b ∈ P r

namespace FourRowPerpBisectorCore

/-- Convert the four-row membership data into the generic perpendicular-
bisector core.  The `p` and `r` witnesses use their rows directly.  The `q`
witness follows the closure chain through the rows at `a`, `p`, and `b`. -/
def toPerpBisectorCore {α : Type*} {P : RowPattern α}
    (core : FourRowPerpBisectorCore P) : PerpBisectorCore P where
  a := core.a
  b := core.b
  p := core.p
  q := core.q
  r := core.r
  hab := core.hab
  hpq := core.hpq
  hpr := core.hpr
  hqr := core.hqr
  pa_pb := EdgeClosure.row (P := P) core.p core.a core.b
    core.a_mem_p core.b_mem_p
  qa_qb := by
    apply EdgeClosure.trans (P := P)
      (EdgeClosure.flip (P := P) core.q core.a)
    apply EdgeClosure.trans (P := P)
      (EdgeClosure.row (P := P) core.a core.q core.p
        core.q_mem_a core.p_mem_a)
    apply EdgeClosure.trans (P := P)
      (EdgeClosure.flip (P := P) core.a core.p)
    apply EdgeClosure.trans (P := P)
      (EdgeClosure.row (P := P) core.p core.a core.b
        core.a_mem_p core.b_mem_p)
    apply EdgeClosure.trans (P := P)
      (EdgeClosure.flip (P := P) core.p core.b)
    apply EdgeClosure.trans (P := P)
      (EdgeClosure.row (P := P) core.b core.p core.q
        core.p_mem_b core.q_mem_b)
    exact EdgeClosure.flip (P := P) core.b core.q
  ra_rb := EdgeClosure.row (P := P) core.r core.a core.b
    core.a_mem_r core.b_mem_r

end FourRowPerpBisectorCore

/-- A realized four-row perpendicular-bisector core is incompatible with a
convex-independent carrier containing every realized label. -/
theorem false_of_convexIndep_of_fourRowPerpBisectorCore
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²} {A : Finset ℝ²}
    (hreal : Realizes P pointOf) (hconv : ConvexIndep A)
    (hmem : ∀ label, pointOf label ∈ A)
    (core : FourRowPerpBisectorCore P) : False :=
  false_of_convexIndep_of_perpBisectorCore hreal hconv hmem
    core.toPerpBisectorCore

namespace FourRowPerpBisector

/-- The exact four-row pattern isolated at the terminal Census-554 frontier. -/
def pattern : RowPattern (Fin 11) := fun c =>
  if c = 1 then {3, 8}
  else if c = 3 then {1, 6}
  else if c = 6 then {3, 8}
  else if c = 10 then {1, 6}
  else ∅

/-- The four rows force three distinct labels onto the perpendicular bisector
of the distinct foci `1` and `6`. -/
def fourRowCore : FourRowPerpBisectorCore pattern where
  a := 1
  b := 6
  p := 3
  q := 8
  r := 10
  hab := by decide
  hpq := by decide
  hpr := by decide
  hqr := by decide
  p_mem_a := by decide
  q_mem_a := by decide
  p_mem_b := by decide
  q_mem_b := by decide
  a_mem_p := by decide
  b_mem_p := by decide
  a_mem_r := by decide
  b_mem_r := by decide

/-- The generic equality core produced by `fourRowCore`. -/
def perpBisectorCore : PerpBisectorCore pattern :=
  fourRowCore.toPerpBisectorCore

/-- The exact four-row pattern has no realization whose full labeled image
lies in a convex-independent finite set. -/
theorem false_of_convexRealization
    {pointOf : Fin 11 → ℝ²} {A : Finset ℝ²}
    (hreal : Realizes pattern pointOf) (hconv : ConvexIndep A)
    (hmem : ∀ label, pointOf label ∈ A) : False :=
  false_of_convexIndep_of_fourRowPerpBisectorCore hreal hconv hmem
    fourRowCore

end FourRowPerpBisector
end Census554
end Problem97
