/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.FiniteRowAlgebraicCollisions
import Erdos9796Proof.P97.Census554.SixPointAlgebraicRowCollisions
import Erdos9796Proof.P97.Census554.TenPointRowCollision

open scoped EuclideanGeometry

/-!
# Algebraic row-collision bank

This module collects the six finite row patterns eliminated by the exact
rational polynomial certificates mined from the Phase 3 realization search.
The individual modules retain the mathematically explicit core structures and
certificate replays; this file supplies the single alternative consumed by the
general carrier bridge.
-/

namespace Problem97
namespace Census554
namespace EqualityCore

/-- The currently banked exact algebraic row-collision alternatives. -/
def AlgebraicRowCollisionAlternative
    {α : Type*} [DecidableEq α] (P : RowPattern α) : Prop :=
  Nonempty (SixPointAlgebraicRowCollisions.FifteenIncidenceCore P) ∨
  Nonempty (SixPointAlgebraicRowCollisions.SixteenIncidenceCore P) ∨
  Nonempty (EightCenterSeventeenEqualityCollisionCore P) ∨
  Nonempty (NineCenterEighteenEqualityCollisionCore P) ∨
  Nonempty (TenCenterTwentySixEqualityCollisionCore P) ∨
  Nonempty (TenPointRowCollision.Core P)

/-- No injective planar realization contains one of the banked algebraic
row-collision cores. -/
theorem not_realizes_of_algebraicRowCollisionAlternative
    {α : Type*} [DecidableEq α] {P : RowPattern α}
    {pointOf : α → ℝ²} (hcore : AlgebraicRowCollisionAlternative P) :
    ¬ Realizes P pointOf := by
  intro hreal
  rcases hcore with hfifteen | hsixteen | height | hnine | htwentySix | hten
  · rcases hfifteen with ⟨core⟩
    exact SixPointAlgebraicRowCollisions.FifteenIncidenceCore.not_realizes core hreal
  · rcases hsixteen with ⟨core⟩
    exact SixPointAlgebraicRowCollisions.SixteenIncidenceCore.not_realizes core hreal
  · rcases height with ⟨core⟩
    exact not_realizes_of_eightCenterSeventeenEqualityCollisionCore core
      ⟨pointOf, hreal⟩
  · rcases hnine with ⟨core⟩
    exact not_realizes_of_nineCenterEighteenEqualityCollisionCore core
      ⟨pointOf, hreal⟩
  · rcases htwentySix with ⟨core⟩
    exact not_realizes_of_tenCenterTwentySixEqualityCollisionCore core
      ⟨pointOf, hreal⟩
  · rcases hten with ⟨core⟩
    exact TenPointRowCollision.not_realizes core hreal

end EqualityCore
end Census554
end Problem97
