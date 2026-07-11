/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.SeparationCore

/-!
# Mirrored card-11 separation surface

The direct card-11 macro order is `U, O2, V, S, W, O1`.  Reflection about the
linear cut at `U` gives the second geometric orientation
`U, O1, W, S, V, O2`.  This file records that reflected 72-order surface and
provides consumers for patterns that reject both orientations.

The two rejection predicates remain explicit.  For the abstract
`SharedPairSeparationCore`, only `secondPoint` is required to differ from the
two centers.  Linear betweenness under reflection is not invariant when the
other point is an endpoint, so the direct rejection predicate alone does not
justify rejection of the mirrored surface.

This module is finite and geometric-consumer facing.  It does not construct a
direct-or-mirror labeling from a `Card11CapLabeling`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SeparationCore

open EqualityCore

/-- Reflection of the eleven boundary positions about the cut at position
zero. -/
def card11BoundaryReflection : Equiv.Perm (Fin 11) where
  toFun
    | ⟨0, _⟩ => 0
    | ⟨1, _⟩ => 10
    | ⟨2, _⟩ => 9
    | ⟨3, _⟩ => 8
    | ⟨4, _⟩ => 7
    | ⟨5, _⟩ => 6
    | ⟨6, _⟩ => 5
    | ⟨7, _⟩ => 4
    | ⟨8, _⟩ => 3
    | ⟨9, _⟩ => 2
    | ⟨10, _⟩ => 1
    | ⟨n + 11, h⟩ => by omega
  invFun
    | ⟨0, _⟩ => 0
    | ⟨1, _⟩ => 10
    | ⟨2, _⟩ => 9
    | ⟨3, _⟩ => 8
    | ⟨4, _⟩ => 7
    | ⟨5, _⟩ => 6
    | ⟨6, _⟩ => 5
    | ⟨7, _⟩ => 4
    | ⟨8, _⟩ => 3
    | ⟨9, _⟩ => 2
    | ⟨10, _⟩ => 1
    | ⟨n + 11, h⟩ => by omega
  left_inv := by
    intro i
    fin_cases i <;> rfl
  right_inv := by
    intro i
    fin_cases i <;> rfl

/-- The mirrored label-to-boundary-position equivalence.  It enumerates the
macro blocks as `U, O1, W, S, V, O2`; the same internal-order type supplies
all `3! * 3! * 2! = 72` choices. -/
def card11MirrorIndexEquiv
    (order : Card11InternalOrder) : Fin 11 ≃ Fin 11 :=
  (card11IndexEquiv order).trans card11BoundaryReflection

/-- A CCW boundary enumeration compatible with the reflected card-11 macro
order. -/
structure Card11MirrorMacroCcwLabeling (pointOf : Fin 11 → ℝ²) where
  order : Card11InternalOrder
  boundary : Fin 11 → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  point_eq : ∀ label,
    boundary (card11MirrorIndexEquiv order label) = pointOf label

/-- A card-11 CCW labeling in either the direct or reflected macro
orientation. -/
inductive Card11DirectOrMirrorCcwLabeling (pointOf : Fin 11 → ℝ²)
  | direct (labeling : Card11MacroCcwLabeling pointOf)
  | mirror (labeling : Card11MirrorMacroCcwLabeling pointOf)

/-- Every reflected card-11 macro order is rejected by an equality-closure
separation core of the row pattern. -/
def RejectsEveryCard11MirrorMacroOrder (P : RowPattern (Fin 11)) : Prop :=
  ∀ order ∈ card11MacroOrders,
    ∃ core : SharedPairSeparationCore P,
      ¬ core.SatisfiedBy (card11MirrorIndexEquiv order)

/-- Rejection of both card-11 macro orientations. -/
def RejectsEveryCard11DirectOrMirrorOrder (P : RowPattern (Fin 11)) : Prop :=
  RejectsEveryCard11MacroOrder P ∧ RejectsEveryCard11MirrorMacroOrder P

/-- A row pattern that rejects every reflected macro order cannot be realized
together with a compatible reflected CCW labeling. -/
theorem false_of_rejectsEveryCard11MirrorMacroOrder
    {P : RowPattern (Fin 11)} {pointOf : Fin 11 → ℝ²}
    (hreject : RejectsEveryCard11MirrorMacroOrder P)
    (hreal : Realizes P pointOf)
    (L : Card11MirrorMacroCcwLabeling pointOf) : False := by
  rcases hreject L.order (mem_card11MacroOrders L.order) with
    ⟨core, hviolates⟩
  exact hviolates <|
    core.satisfiedBy_of_realizes_ccw hreal L.boundary
      (card11MirrorIndexEquiv L.order) L.boundary_ccw
      L.boundary_injective (card11MirrorIndexEquiv L.order).injective
      L.point_eq

/-- A row pattern rejecting both macro orientations cannot be realized with a
direct-or-mirror CCW labeling. -/
theorem false_of_rejectsEveryCard11DirectOrMirrorOrder
    {P : RowPattern (Fin 11)} {pointOf : Fin 11 → ℝ²}
    (hreject : RejectsEveryCard11DirectOrMirrorOrder P)
    (hreal : Realizes P pointOf)
    (L : Card11DirectOrMirrorCcwLabeling pointOf) : False := by
  cases L with
  | direct labeling =>
      exact false_of_rejectsEveryCard11MacroOrder
        hreject.1 hreal labeling
  | mirror labeling =>
      exact false_of_rejectsEveryCard11MirrorMacroOrder
        hreject.2 hreal labeling

/-- Existential form of
`false_of_rejectsEveryCard11DirectOrMirrorOrder`. -/
theorem not_exists_realizes_with_card11DirectOrMirrorCcwLabeling
    {P : RowPattern (Fin 11)}
    (hreject : RejectsEveryCard11DirectOrMirrorOrder P) :
    ¬ ∃ pointOf : Fin 11 → ℝ²,
      Realizes P pointOf ∧
        Nonempty (Card11DirectOrMirrorCcwLabeling pointOf) := by
  rintro ⟨pointOf, hreal, ⟨L⟩⟩
  exact false_of_rejectsEveryCard11DirectOrMirrorOrder hreject hreal L

end SeparationCore
end Census554
end Problem97
