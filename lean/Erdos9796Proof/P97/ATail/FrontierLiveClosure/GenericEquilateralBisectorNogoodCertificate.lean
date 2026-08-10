/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate
import Erdos9796Proof.P97.Census554.FivePointCollision

/-!
# Generic equality-equilateral-bisector collision certificates

This module provides the source-facing checker for the six equality paths in
`EquilateralBisectorCollisionCore`.  Its row hypotheses are deliberately
positive: a certificate need only list the memberships used by its paths, not
the complete source rows.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace GenericRowNogoodCertificate

open Census554.EqualityCore

/-- The six equality paths and the three distinctness conditions of a
    five-point equilateral-bisector collision. -/
structure EquilateralBisectorCollisionData (α : Type*) where
  p : α
  a : α
  b : α
  c : α
  x : α
  pa_pb : ClosurePathData α
  pa_pc : ClosurePathData α
  pa_ab : ClosurePathData α
  pa_ax : ClosurePathData α
  pa_bx : ClosurePathData α
  cx_ca : ClosurePathData α
deriving DecidableEq

/-- Boolean validation of the named distinctness conditions and equality paths.
    The path endpoints are fixed by the target collision core. -/
def EquilateralBisectorCollisionData.check {α : Type*} [DecidableEq α]
    (choices : List (RowChoice α))
    (data : EquilateralBisectorCollisionData α) : Bool :=
  decide (data.p ≠ data.a ∧ data.p ≠ data.x ∧ data.c ≠ data.b) &&
    checkPath choices data.pa_pb (data.p, data.a) (data.p, data.b) &&
    checkPath choices data.pa_pc (data.p, data.a) (data.p, data.c) &&
    checkPath choices data.pa_ab (data.p, data.a) (data.a, data.b) &&
    checkPath choices data.pa_ax (data.p, data.a) (data.a, data.x) &&
    checkPath choices data.pa_bx (data.p, data.a) (data.b, data.x) &&
    checkPath choices data.cx_ca (data.c, data.x) (data.c, data.a)

/-- A positively source-matching checked certificate produces the metric
    collision core consumed by the five-point geometry theorem. -/
theorem nonempty_equilateralBisectorCollisionCore_of_positiveCheck
    {α : Type*} [DecidableEq α] {P : RowPattern α}
    {choices : List (RowChoice α)} (hrows : PositiveRowsMatch P choices)
    (data : EquilateralBisectorCollisionData α)
    (hcheck : data.check choices = true) :
    Nonempty (EquilateralBisectorCollisionCore P) := by
  simp only [EquilateralBisectorCollisionData.check, Bool.and_eq_true] at hcheck
  rcases hcheck with
    ⟨⟨⟨⟨⟨⟨hinequalities, hpa_pb⟩, hpa_pc⟩, hpa_ab⟩, hpa_ax⟩,
      hpa_bx⟩, hcx_ca⟩
  have hne : data.p ≠ data.a ∧ data.p ≠ data.x ∧ data.c ≠ data.b :=
    of_decide_eq_true hinequalities
  exact ⟨{
    p := data.p
    a := data.a
    b := data.b
    c := data.c
    x := data.x
    hpa := hne.1
    hpx := hne.2.1
    hcb := hne.2.2
    pa_pb := edgeClosure_of_checkPath_positive hrows data.pa_pb hpa_pb
    pa_pc := edgeClosure_of_checkPath_positive hrows data.pa_pc hpa_pc
    pa_ab := edgeClosure_of_checkPath_positive hrows data.pa_ab hpa_ab
    pa_ax := edgeClosure_of_checkPath_positive hrows data.pa_ax hpa_ax
    pa_bx := edgeClosure_of_checkPath_positive hrows data.pa_bx hpa_bx
    cx_ca := edgeClosure_of_checkPath_positive hrows data.cx_ca hcx_ca }⟩

end GenericRowNogoodCertificate
end ATailFrontierLiveClosure
end Problem97
