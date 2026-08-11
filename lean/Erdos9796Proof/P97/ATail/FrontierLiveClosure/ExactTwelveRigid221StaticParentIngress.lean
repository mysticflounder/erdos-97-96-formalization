/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticConvexSat

/-!
# Whole-parent source ingress for exact-twelve next-row computation

This composes the source-faithful next-row prefix with the static equality,
equilateral-bisector, and convex perpendicular-bisector families.  It is the
soundness checkpoint required before a terminal CEGAR run can be interpreted
as ruling out a source configuration.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticParentIngress

open Census554.CoverCnf
open Census554.EqualityCore
open FrozenNextRowCompiledJob
open FrozenNextRowJobCnf
open StaticRelationAssignment
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- The exact clause order presented by the Python static-convex compiler. -/
def frozenParentDimacs (cell : FrozenNextRowCell) : List (List Int) :=
  reconstructedCompleteDimacs cell ++
    (StaticEqualityCnf.clauseDelta ++
      (StaticGeometryCnf.clauseDelta ++ StaticConvexCnf.clauseDelta))

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem frozenParentClauseCount (cell : FrozenNextRowCell) :
    (frozenParentDimacs cell).length = 634859 := by
  native_decide +revert

set_option maxRecDepth 100000 in
/-- Every source configuration satisfying the exact-twelve next-row cell
hypotheses induces a Boolean model of the complete frozen static parent. -/
theorem exists_staticAssign_sat_frozenParentDimacs
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2)
    (pointOf : Label → ℝ²) (hreal : Realizes row pointOf)
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hmem : ∀ y, pointOf y ∈ A) :
    ∃ d : Label, ∀ c ∈ frozenParentDimacs cell,
      evalClauseD (staticAssign cell blocker row d pointOf) c = true := by
  obtain ⟨d, hprefix⟩ :=
    staticAssign_sat_reconstructedCompleteDimacs cell hrow hadded pointOf
  refine ⟨d, ?_⟩
  intro c hc
  rcases List.mem_append.mp hc with hprefixClause | hstatic
  · exact hprefix c hprefixClause
  · rcases List.mem_append.mp hstatic with hequality | hrest
    · exact StaticEqualitySat.clauseDelta_sat hrow cell blocker d pointOf
        hreal c hequality
    · rcases List.mem_append.mp hrest with hgeometry | hconvex
      · exact StaticGeometrySat.clauseDelta_sat cell blocker d pointOf
          hreal c hgeometry
      · exact StaticConvexSat.clauseDelta_sat cell blocker d pointOf hreal
          hconv hmem c hconvex

end StaticParentIngress
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
