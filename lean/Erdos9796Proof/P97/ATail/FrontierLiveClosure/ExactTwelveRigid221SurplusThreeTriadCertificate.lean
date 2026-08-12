/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood
import Erdos9796Proof.P97.Census554.ThreeTriadCollision

/-!
# Checked surplus three-triad certificates

The arm-static cell-6 survivor exposes a source-order-independent instance of
the general `ThreeTriadCollisionCore`.  The only varying role is a surplus
label `a ∈ {3,4,5}`; the remaining roles are fixed by the exact-twelve
Rigid221 placement:

* `A = a`, `B = 9`, `C = 7`, `D = 6`, and `E = 8`;
* row `9` contains `7,6`;
* row `6` contains `9,a`;
* row `7` contains `a,6,8`;
* row `8` contains `a,9,6`.

These are positive selected-row incidences only.  The certificate does not
assert that a selected support is a complete metric fibre.  It is a finite
proof-carrying learned-cut family, not terminal UNSAT, all-arm coverage, an
arbitrary-cardinality lift, or closure of a live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The varying surplus role in the three-triad family. -/
structure SurplusThreeTriadData where
  a : Label
deriving DecidableEq, Repr

/-- Check the surplus role and all six equality steps used by the core. -/
def SurplusThreeTriadData.check
    (choices : List (RowChoice Label))
    (data : SurplusThreeTriadData) : Bool :=
  decide (data.a ∈ surplusInteriorLabels) &&
    checkPrimitiveStep choices (.row 9 7 6) &&
    checkPrimitiveStep choices (.row 6 9 data.a) &&
    checkPrimitiveStep choices (.row 7 data.a 6) &&
    checkPrimitiveStep choices (.row 7 6 8) &&
    checkPrimitiveStep choices (.row 8 data.a 9) &&
    checkPrimitiveStep choices (.row 8 9 6)

/-- Turn one checked surplus record into a proof-carrying source-order learned
cut.  The contradiction itself is independent of boundary order and
convexity. -/
def SourceOrderPositiveNogood.ofSurplusThreeTriad
    (choices : List (RowChoice Label))
    (data : SurplusThreeTriadData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal _order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [SurplusThreeTriadData.check, Bool.and_eq_true] at hcheck'
    rcases hcheck' with
      ⟨⟨⟨⟨⟨⟨ha, hBC_BD⟩, hBD_DA⟩, hCA_CD⟩, hCD_CE⟩, hEA_EB⟩, hEB_ED⟩
    have ha' : data.a ∈ surplusInteriorLabels := of_decide_eq_true ha
    let core : ThreeTriadCollisionCore row :=
      { A := data.a
        B := 9
        C := 7
        D := 6
        E := 8
        hAB := by
          simp [surplusInteriorLabels] at ha'
          rcases ha' with ha' | ha' | ha' <;> simp [ha']
        BC_BD := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 9 7 6) hBC_BD
        BD_DA := EdgeClosure.trans (EdgeClosure.flip 9 6)
          (edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row 6 9 data.a) hBD_DA)
        CA_CD := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 7 data.a 6) hCA_CD
        CD_CE := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 7 6 8) hCD_CE
        EA_EB := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 8 data.a 9) hEA_EB
        EB_ED := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row 8 9 6) hEB_ED }
    exact not_realizes_of_threeTriadCollisionCore core ⟨pointOf, hreal⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
