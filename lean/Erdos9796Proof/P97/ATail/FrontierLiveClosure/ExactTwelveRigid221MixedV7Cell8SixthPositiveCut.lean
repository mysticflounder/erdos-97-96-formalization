/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.Census554.SixPointFiveCircleCollisions

/-!
# Exact-twelve mixed-v7 cell-8 sixth positive cut

The source36-seeded cell-8 survivor contains five positive selected rows that
force six-point five-circle collision C.  This obstruction is independent of
the frozen boundary order: the five rows alone have no injective planar
realization.

This is one finite learned cut.  It does not prove terminal UNSAT, all-cell
coverage, a universal lift, or closure of a live theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The five selected rows used by the source36 cell-8 survivor cut. -/
def mixedV7Cell8SixthPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 4, 8, 10} }
  , { center := 3, support := {0, 4, 5, 9} }
  , { center := 5, support := {0, 1, 8, 9} }
  , { center := 8, support := {3, 5, 6, 9} }
  , { center := 9, support := {2, 4, 5, 8} } ]

/-- The five positive rows from the source36 cell-8 survivor force
six-point five-circle collision C, without using source-order hypotheses. -/
theorem false_of_mixedV7Cell8SixthPositiveRows
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf)
    (hpositive : PositiveRowsMatch row mixedV7Cell8SixthPositiveChoices) : False := by
  have hrow0 : ({3, 4, 8, 10} : Finset Label) ⊆ row 0 :=
    hpositive ({ center := 0, support := {3, 4, 8, 10} } : RowChoice Label)
      (by simp [mixedV7Cell8SixthPositiveChoices])
  have hrow3 : ({0, 4, 5, 9} : Finset Label) ⊆ row 3 :=
    hpositive ({ center := 3, support := {0, 4, 5, 9} } : RowChoice Label)
      (by simp [mixedV7Cell8SixthPositiveChoices])
  have hrow5 : ({0, 1, 8, 9} : Finset Label) ⊆ row 5 :=
    hpositive ({ center := 5, support := {0, 1, 8, 9} } : RowChoice Label)
      (by simp [mixedV7Cell8SixthPositiveChoices])
  have hrow8 : ({3, 5, 6, 9} : Finset Label) ⊆ row 8 :=
    hpositive ({ center := 8, support := {3, 5, 6, 9} } : RowChoice Label)
      (by simp [mixedV7Cell8SixthPositiveChoices])
  have hrow9 : ({2, 4, 5, 8} : Finset Label) ⊆ row 9 :=
    hpositive ({ center := 9, support := {2, 4, 5, 8} } : RowChoice Label)
      (by simp [mixedV7Cell8SixthPositiveChoices])
  let core : SixPointFiveCircleCollisionCoreC row :=
    { O := 4
      A := 3
      B := 0
      C := 9
      E := 5
      F := 8
      hAE := by decide
      AO_AB := EdgeClosure.row 3 4 0 (hrow3 (by decide)) (hrow3 (by decide))
      AO_AE := EdgeClosure.row 3 4 5 (hrow3 (by decide)) (hrow3 (by decide))
      AO_AC := EdgeClosure.row 3 4 9 (hrow3 (by decide)) (hrow3 (by decide))
      BO_BA := EdgeClosure.row 0 4 3 (hrow0 (by decide)) (hrow0 (by decide))
      BO_BF := EdgeClosure.row 0 4 8 (hrow0 (by decide)) (hrow0 (by decide))
      EB_EC := EdgeClosure.row 5 0 9 (hrow5 (by decide)) (hrow5 (by decide))
      EB_EF := EdgeClosure.row 5 0 8 (hrow5 (by decide)) (hrow5 (by decide))
      CO_CE := EdgeClosure.row 9 4 5 (hrow9 (by decide)) (hrow9 (by decide))
      FA_FE := EdgeClosure.row 8 3 5 (hrow8 (by decide)) (hrow8 (by decide)) }
  exact not_realizes_of_sixPointFiveCircleCollisionCoreC core ⟨pointOf, hreal⟩

/-- Source-order bank wrapper for the order-independent source36 cut. -/
def mixedV7Cell8SixthPositiveNogood : SourceOrderPositiveNogood where
  choices := mixedV7Cell8SixthPositiveChoices
  refutes := by
    intro row pointOf hreal _order _hforced _hconv hpositive
    exact false_of_mixedV7Cell8SixthPositiveRows hreal hpositive

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
