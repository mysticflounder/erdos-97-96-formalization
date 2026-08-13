/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood
import Erdos9796Proof.P97.Census554.ThreeTriadCollision

/-!
# Checked cross-block three-triad certificates

The retained arm-static cell-6 survivor after the v22 common-five family
exposes a source-order-independent instance of the general
`ThreeTriadCollisionCore`.  The role domain is:

* pairwise-distinct `a,c,e` in the second-opposite interior block;
* `b` in the surplus interior block;
* `d` in the first-opposite interior block.

The four positive selected rows are
`b : {c,d}`, `d : {b,a}`, `c : {a,d,e}`, and `e : {a,b,d}`.  There are
`4 * 3 * 2 * 3 * 2 = 144` role assignments.  The distinctness hypotheses
ensure that no selected support contains its own center.

This file proves the complete role family sound.  It does not treat a
selected support as a complete metric fibre, establish terminal UNSAT or
all-arm coverage, lift to arbitrary cardinality, or close a live Rigid221
residual by itself.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The five variable roles in the 144-member cross-block three-triad
family. -/
structure SecondOppositeTripleSurplusFirstOppositeThreeTriadData where
  a : Label
  b : Label
  c : Label
  d : Label
  e : Label
deriving DecidableEq, Repr

/-- Source-faithful cap-block domain for the five roles.  Pairwise
distinctness of `a,c,e` excludes self-membership in the rows centered at
`c` and `e`. -/
def SecondOppositeTripleSurplusFirstOppositeThreeTriadData.rolesValid
    (data : SecondOppositeTripleSurplusFirstOppositeThreeTriadData) : Prop :=
  data.a ∈ secondOppositeInteriorLabels ∧
    data.b ∈ surplusInteriorLabels ∧
    data.c ∈ secondOppositeInteriorLabels ∧
    data.d ∈ firstOppositeInteriorLabels ∧
    data.e ∈ secondOppositeInteriorLabels ∧
    data.a ≠ data.c ∧ data.a ≠ data.e ∧ data.c ≠ data.e

instance secondOppositeTripleSurplusFirstOppositeThreeTriadDecidableRolesValid
    (data : SecondOppositeTripleSurplusFirstOppositeThreeTriadData) :
    Decidable data.rolesValid := by
  unfold SecondOppositeTripleSurplusFirstOppositeThreeTriadData.rolesValid
  infer_instance

/-- Check exactly the six direct equality steps used by the core. -/
def SecondOppositeTripleSurplusFirstOppositeThreeTriadData.check
    (choices : List (RowChoice Label))
    (data : SecondOppositeTripleSurplusFirstOppositeThreeTriadData) : Bool :=
  decide data.rolesValid &&
    checkPrimitiveStep choices (.row data.b data.c data.d) &&
    checkPrimitiveStep choices (.row data.d data.b data.a) &&
    checkPrimitiveStep choices (.row data.c data.a data.d) &&
    checkPrimitiveStep choices (.row data.c data.d data.e) &&
    checkPrimitiveStep choices (.row data.e data.a data.b) &&
    checkPrimitiveStep choices (.row data.e data.b data.d)

/-- Turn one checked role assignment into a proof-carrying source-order
learned cut.  The contradiction uses neither boundary order nor convexity. -/
def SourceOrderPositiveNogood.ofSecondOppositeTripleSurplusFirstOppositeThreeTriad
    (choices : List (RowChoice Label))
    (data : SecondOppositeTripleSurplusFirstOppositeThreeTriadData)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal _order _hforced _hconv hpositive
    have hcheck' := hcheck
    simp only [SecondOppositeTripleSurplusFirstOppositeThreeTriadData.check,
      Bool.and_eq_true] at hcheck'
    rcases hcheck' with
      ⟨⟨⟨⟨⟨⟨hroles, hBC_BD⟩, hBD_DA⟩, hCA_CD⟩, hCD_CE⟩, hEA_EB⟩, hEB_ED⟩
    have hroles' : data.rolesValid := of_decide_eq_true hroles
    rcases hroles' with ⟨ha, hb, _hc, _hd, _he, _hac, _hae, _hce⟩
    let core : ThreeTriadCollisionCore row :=
      { A := data.a
        B := data.b
        C := data.c
        D := data.d
        E := data.e
        hAB := by
          simp [secondOppositeInteriorLabels] at ha
          simp [surplusInteriorLabels] at hb
          rcases ha with ha | ha | ha | ha <;>
            rcases hb with hb | hb | hb <;> simp [ha, hb]
        BC_BD := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.b data.c data.d) hBC_BD
        BD_DA := EdgeClosure.trans (EdgeClosure.flip data.b data.d)
          (edgeClosure_of_checkPrimitiveStep_positive hpositive
            (.row data.d data.b data.a) hBD_DA)
        CA_CD := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.a data.d) hCA_CD
        CD_CE := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.c data.d data.e) hCD_CE
        EA_EB := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.e data.a data.b) hEA_EB
        EB_ED := edgeClosure_of_checkPrimitiveStep_positive hpositive
          (.row data.e data.b data.d) hEB_ED }
    exact not_realizes_of_threeTriadCollisionCore core ⟨pointOf, hreal⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
