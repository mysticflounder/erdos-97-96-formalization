/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.Census554.ThreeTriadCollision

/-!
# Cell-1 three-triad positive cut after the block-spanning family

The first cell-1 survivor after installing the complete 24-role
block-spanning family contains a five-row equality-closure witness for the
general `ThreeTriadCollisionCore` obstruction.  This file records only the
positive selected-row incidences used by that witness.  In particular, it
does not treat a selected support as a complete metric fibre.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- Package a uniformly constructed three-triad collision core as a
proof-carrying source-order learned cut.  The obstruction is independent of
the boundary order and convexity witnesses carried by the terminal ingress. -/
def SourceOrderPositiveNogood.ofThreeTriadCollisionCore
    (choices : List (RowChoice Label))
    (coreOf :
      ∀ {row : RowPattern Label},
        PositiveRowsMatch row choices → ThreeTriadCollisionCore row) :
    SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal _order _hforced _hconv hpositive
    exact not_realizes_of_threeTriadCollisionCore
      (coreOf hpositive) ⟨pointOf, hreal⟩

/-- The five partial rows used by the first cell-1 survivor after the complete
block-spanning family was installed. -/
def staticCell1AfterFamilyThreeTriadPositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {1, 2} }
  , { center := 1, support := {0, 6} }
  , { center := 2, support := {0, 1, 11} }
  , { center := 6, support := {2, 9, 11} }
  , { center := 9, support := {1, 2, 11} }
  ]

/-- The five positive rows force the three-triad collision with roles
`(A,B,C,D,E) = (11,1,6,2,9)`. -/
def staticCell1AfterFamilyThreeTriadPositiveNogood :
    SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofThreeTriadCollisionCore
    staticCell1AfterFamilyThreeTriadPositiveChoices fun {row} hpositive => by
      have hrow0 : ({1, 2} : Finset Label) ⊆ row 0 :=
        hpositive ({ center := 0, support := {1, 2} } : RowChoice Label)
          (by simp [staticCell1AfterFamilyThreeTriadPositiveChoices])
      have hrow1 : ({0, 6} : Finset Label) ⊆ row 1 :=
        hpositive ({ center := 1, support := {0, 6} } : RowChoice Label)
          (by simp [staticCell1AfterFamilyThreeTriadPositiveChoices])
      have hrow2 : ({0, 1, 11} : Finset Label) ⊆ row 2 :=
        hpositive ({ center := 2, support := {0, 1, 11} } : RowChoice Label)
          (by simp [staticCell1AfterFamilyThreeTriadPositiveChoices])
      have hrow6 : ({2, 9, 11} : Finset Label) ⊆ row 6 :=
        hpositive ({ center := 6, support := {2, 9, 11} } : RowChoice Label)
          (by simp [staticCell1AfterFamilyThreeTriadPositiveChoices])
      have hrow9 : ({1, 2, 11} : Finset Label) ⊆ row 9 :=
        hpositive ({ center := 9, support := {1, 2, 11} } : RowChoice Label)
          (by simp [staticCell1AfterFamilyThreeTriadPositiveChoices])
      exact
        { A := 11
          B := 1
          C := 6
          D := 2
          E := 9
          hAB := by decide
          BC_BD :=
            EdgeClosure.trans
              (EdgeClosure.row 1 6 0 (hrow1 (by decide)) (hrow1 (by decide)))
              (EdgeClosure.trans (EdgeClosure.flip 1 0)
                (EdgeClosure.trans
                  (EdgeClosure.row 0 1 2 (hrow0 (by decide)) (hrow0 (by decide)))
                  (EdgeClosure.trans (EdgeClosure.flip 0 2)
                    (EdgeClosure.trans
                      (EdgeClosure.row 2 0 1
                        (hrow2 (by decide)) (hrow2 (by decide)))
                      (EdgeClosure.flip 2 1)))))
          BD_DA := EdgeClosure.trans (EdgeClosure.flip 1 2)
            (EdgeClosure.row 2 1 11 (hrow2 (by decide)) (hrow2 (by decide)))
          CA_CD := EdgeClosure.row 6 11 2
            (hrow6 (by decide)) (hrow6 (by decide))
          CD_CE := EdgeClosure.row 6 2 9
            (hrow6 (by decide)) (hrow6 (by decide))
          EA_EB := EdgeClosure.row 9 11 1
            (hrow9 (by decide)) (hrow9 (by decide))
          EB_ED := EdgeClosure.row 9 1 2
            (hrow9 (by decide)) (hrow9 (by decide)) }

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
