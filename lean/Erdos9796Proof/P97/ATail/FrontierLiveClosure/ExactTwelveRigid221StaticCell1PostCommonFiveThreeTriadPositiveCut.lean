/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.Census554.ThreeTriadCollision

/-!
# Cell-1 three-triad cut after the post-chain common-five cut

The next cell-1 survivor after the post-chain common-five cut contains four
positive selected rows that force the general `ThreeTriadCollisionCore`
obstruction.  The obstruction is independent of the frozen boundary order.

This is one finite learned cut.  It does not prove terminal UNSAT, all-cell
coverage, a universal lift, or closure of a live theorem.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The four selected rows used by the post-common-five cell-1 survivor. -/
def staticCell1PostCommonFiveThreeTriadPositiveChoices : List (RowChoice Label) :=
  [ { center := 6, support := {5, 9, 10, 11} }
  , { center := 8, support := {1, 6, 9, 11} }
  , { center := 10, support := {3, 5, 8, 11} }
  , { center := 11, support := {2, 5, 7, 8} }
  ]

/-- The four positive rows force the three-triad collision with roles
`(A,B,C,D,E) = (5,8,6,11,10)`. -/
theorem false_of_staticCell1PostCommonFiveThreeTriadPositiveRows
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf)
    (hpositive :
      PositiveRowsMatch row staticCell1PostCommonFiveThreeTriadPositiveChoices) :
    False := by
  have hrow6 : ({5, 9, 10, 11} : Finset Label) ⊆ row 6 :=
    hpositive ({ center := 6, support := {5, 9, 10, 11} } : RowChoice Label)
      (by simp [staticCell1PostCommonFiveThreeTriadPositiveChoices])
  have hrow8 : ({1, 6, 9, 11} : Finset Label) ⊆ row 8 :=
    hpositive ({ center := 8, support := {1, 6, 9, 11} } : RowChoice Label)
      (by simp [staticCell1PostCommonFiveThreeTriadPositiveChoices])
  have hrow10 : ({3, 5, 8, 11} : Finset Label) ⊆ row 10 :=
    hpositive ({ center := 10, support := {3, 5, 8, 11} } : RowChoice Label)
      (by simp [staticCell1PostCommonFiveThreeTriadPositiveChoices])
  have hrow11 : ({2, 5, 7, 8} : Finset Label) ⊆ row 11 :=
    hpositive ({ center := 11, support := {2, 5, 7, 8} } : RowChoice Label)
      (by simp [staticCell1PostCommonFiveThreeTriadPositiveChoices])
  let core : ThreeTriadCollisionCore row :=
    { A := 5
      B := 8
      C := 6
      D := 11
      E := 10
      hAB := by decide
      BC_BD := EdgeClosure.row 8 6 11
        (hrow8 (by decide)) (hrow8 (by decide))
      BD_DA := EdgeClosure.trans (EdgeClosure.flip 8 11)
        (EdgeClosure.row 11 8 5 (hrow11 (by decide)) (hrow11 (by decide)))
      CA_CD := EdgeClosure.row 6 5 11
        (hrow6 (by decide)) (hrow6 (by decide))
      CD_CE := EdgeClosure.row 6 11 10
        (hrow6 (by decide)) (hrow6 (by decide))
      EA_EB := EdgeClosure.row 10 5 8
        (hrow10 (by decide)) (hrow10 (by decide))
      EB_ED := EdgeClosure.row 10 8 11
        (hrow10 (by decide)) (hrow10 (by decide)) }
  exact not_realizes_of_threeTriadCollisionCore core ⟨pointOf, hreal⟩

/-- Source-order bank wrapper for the order-independent three-triad cut. -/
def staticCell1PostCommonFiveThreeTriadPositiveNogood :
    SourceOrderPositiveNogood where
  choices := staticCell1PostCommonFiveThreeTriadPositiveChoices
  refutes := by
    intro row pointOf hreal _order _hforced _hconv hpositive
    exact false_of_staticCell1PostCommonFiveThreeTriadPositiveRows hreal hpositive

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
