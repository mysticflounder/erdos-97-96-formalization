/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowNamedDeletionJobCnf
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticParentIngress

/-!
# Static-parent ingress for fixed named-deletion arm cells

This composes the source-faithful next-row formula, one fixed named-deletion
arm suffix, and the existing static equality/geometry/convex clauses.  Its
order matches the historical additive arm compiler followed by the static
extensions.  The active terminal canary instead preserves the frozen
static/membership prefix and appends the arm afterward; its exact-order
consumer is `terminalStaticThreeTriadNamedDeletionArmDimacs`.

This is a source-to-finite ingress contract.  It is not terminal UNSAT,
aggregate `12 × 6` coverage, or closure of a live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticNamedDeletionParentIngress

open Census554.CoverCnf
open Census554.EqualityCore
open FrozenNextRowCompiledJob
open FrozenNextRowJobCnf
open FrozenNextRowNamedDeletionJobCnf
open StaticRelationAssignment
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Historical additive-arm clause order followed by the static equality,
equilateral-bisector, and convex clause families. -/
def frozenNamedDeletionParentDimacs (cell : FrozenNextRowArmCell) :
    List (List Int) :=
  reconstructedCompleteDimacs cell.1 ++
    (namedDeletionArmClauseDelta cell ++
      (StaticEqualityCnf.clauseDelta ++
        (StaticGeometryCnf.clauseDelta ++ StaticConvexCnf.clauseDelta)))

set_option maxRecDepth 100000 in
/-- A source configuration satisfying one fixed arm induces a Boolean model
of the complete arm-aware static parent. -/
theorem exists_staticAssign_sat_frozenNamedDeletionParentDimacs
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowArmCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowFixedNamedDeletionArmAddedConstraintsHold
      row blocker (cell.1.1 : Label × Label).1
        (cell.1.1 : Label × Label).2 cell.2)
    (pointOf : Label → ℝ²) (hreal : Realizes row pointOf)
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hmem : ∀ y, pointOf y ∈ A) :
    ∃ d : Label, ∀ c ∈ frozenNamedDeletionParentDimacs cell,
      evalClauseD (staticAssign cell.1 blocker row d pointOf) c = true := by
  obtain ⟨d, hparent⟩ :=
    StaticParentIngress.exists_staticAssign_sat_frozenParentDimacs
      cell.1 hrow hadded.1 pointOf hreal hconv hmem
  refine ⟨d, ?_⟩
  intro c hc
  rcases List.mem_append.mp hc with hprefix | hrest
  · exact hparent c (List.mem_append_left _ hprefix)
  · rcases List.mem_append.mp hrest with harm | hstatic
    · calc
        evalClauseD (staticAssign cell.1 blocker row d pointOf) c =
            evalClauseD (nextRowAssign cell.1 blocker row d) c := by
          apply SafeCoverCnf.evalClauseD_congr
          intro l hl
          exact staticAssign_eq_nextRowAssign_of_le
            cell.1 blocker row d pointOf
              (namedDeletionArmClauseDelta_lit_bound cell c harm l hl)
        _ = true := nextRowAssign_sat_namedDeletionArmClauseDelta
          cell hrow hadded d c harm
    · exact hparent c (List.mem_append_right _ hstatic)

end StaticNamedDeletionParentIngress
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
