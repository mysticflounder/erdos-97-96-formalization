/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SameBoundaryOrderIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221LearnedClauseBridge

/-!
# Lightweight proof-carrying source-order nogoods

This module defines the semantic interface carried by an exact-twelve
source-order learned cut.  It is deliberately independent of terminal CNF
reconstruction: geometric certificates and membership-family bridges can be
checked without importing the large v14 terminal formula.

It does not construct a terminal bank, prove finite UNSAT, provide aggregate
coverage, or close a live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SourceOrderTerminalBankConsumer

open scoped EuclideanGeometry

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- A learned positive-row cut together with its source-order semantic proof.
The proof is uniform in the realized row pattern and in the particular common
boundary order supplied by the source ingress. -/
structure SourceOrderPositiveNogood where
  choices : List (RowChoice Label)
  refutes :
    ∀ {row : RowPattern Label} {pointOf : Label → ℝ²},
      Realizes row pointOf →
      (order : FrozenBoundaryOrder pointOf) →
      FrozenForcedSecondCapOrder order.position →
      ConvexIndep (Finset.univ.image pointOf) →
      PositiveRowsMatch row choices → False

/-- A checked duplicate-center cut is a source-order cut that simply does not
need the additional order or convexity hypotheses. -/
def SourceOrderPositiveNogood.ofDuplicateCenter
    (nogood : DuplicateCenterNogood Label) (hcheck : nogood.check = true) :
    SourceOrderPositiveNogood where
  choices := nogood.choices
  refutes := by
    intro row pointOf hreal order hforced hconv hpositive
    exact (nogood.not_realizes_of_positiveCheck hcheck hpositive) ⟨pointOf, hreal⟩

end SourceOrderTerminalBankConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
