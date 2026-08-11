/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Perpendicular-bisector equality-chain schemas

This module banks the cardinality-independent obstruction extracted from the
exact-seventeen PIQD survivor after the two-circle equality-chain refinement.
Four selected rows transport the equality `dist p a = dist p b`; the rows at
two further witnesses force the same equality directly.  Three distinct
carrier points would therefore lie on the perpendicular bisector of the two
distinct foci `a,b`, contradicting convex independence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace PerpBisectorEqualityChainBridge

open Census554.EqualityCore

/-- Six positive selected-row incidences forcing three distinct witnesses onto
the perpendicular bisector of two distinct foci.  The intermediate labels
`x,y` carry the non-direct equality for `p`. -/
structure Core {α : Type*} (P : RowPattern α) where
  a : α
  b : α
  p : α
  q : α
  r : α
  x : α
  y : α
  hab : a ≠ b
  hpq : p ≠ q
  hpr : p ≠ r
  hqr : q ≠ r
  p_mem_a : p ∈ P a
  x_mem_a : x ∈ P a
  a_mem_x : a ∈ P x
  y_mem_x : y ∈ P x
  x_mem_y : x ∈ P y
  b_mem_y : b ∈ P y
  y_mem_b : y ∈ P b
  p_mem_b : p ∈ P b
  a_mem_q : a ∈ P q
  b_mem_q : b ∈ P q
  a_mem_r : a ∈ P r
  b_mem_r : b ∈ P r

namespace Core

/-- Convert the six-row chain to the generic perpendicular-bisector core. -/
def toPerpBisectorCore {α : Type*} {P : RowPattern α}
    (core : Core P) : PerpBisectorCore P where
  a := core.a
  b := core.b
  p := core.p
  q := core.q
  r := core.r
  hab := core.hab
  hpq := core.hpq
  hpr := core.hpr
  hqr := core.hqr
  pa_pb := by
    apply EdgeClosure.trans (EdgeClosure.flip core.p core.a)
    apply EdgeClosure.trans
      (EdgeClosure.row core.a core.p core.x core.p_mem_a core.x_mem_a)
    apply EdgeClosure.trans (EdgeClosure.flip core.a core.x)
    apply EdgeClosure.trans
      (EdgeClosure.row core.x core.a core.y core.a_mem_x core.y_mem_x)
    apply EdgeClosure.trans (EdgeClosure.flip core.x core.y)
    apply EdgeClosure.trans
      (EdgeClosure.row core.y core.x core.b core.x_mem_y core.b_mem_y)
    apply EdgeClosure.trans (EdgeClosure.flip core.y core.b)
    apply EdgeClosure.trans
      (EdgeClosure.row core.b core.y core.p core.y_mem_b core.p_mem_b)
    exact EdgeClosure.flip core.b core.p
  qa_qb := EdgeClosure.row core.q core.a core.b core.a_mem_q core.b_mem_q
  ra_rb := EdgeClosure.row core.r core.a core.b core.a_mem_r core.b_mem_r

end Core

/-- A realized six-row perpendicular-bisector equality chain is incompatible
with a convex-independent carrier containing all realized labels. -/
theorem false_of_core
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    {A : Finset ℝ²}
    (hreal : Realizes P pointOf) (hconv : ConvexIndep A)
    (hmem : ∀ label, pointOf label ∈ A) (core : Core P) : False :=
  false_of_convexIndep_of_perpBisectorCore hreal hconv hmem
    core.toPerpBisectorCore

#print axioms false_of_core

end PerpBisectorEqualityChainBridge
end Problem97
