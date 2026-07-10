/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.PolynomialGeometry
import Erdos9796Proof.P97.SurplusCOMPGBank

/-!
# Reflected surplus row-zero rule data

This module contains the lightweight data vocabulary shared by generated
certificates and their geometric soundness proofs. Generator polynomials are
derived from these rules, so generated code does not need a separate
polynomial-shape matching proof.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

open EndpointCertificate
open EndpointCertificate.Variables

/-- The normal-axis assignment selected by one relaxed-split row. -/
inductive RowAssignment where
  | s1s3
  | pair (left right : SurplusCOMPGBank.Label)
deriving DecidableEq, Repr

/-- One semantic rule for a relaxed-split generator. The constructors record
the endpoint variables explicitly, so generated data also fixes the
label-to-variable encoding. -/
inductive GeneratorRule where
  | exactV
      (left right : SurplusCOMPGBank.Label)
      (lx ly rx ry : EndpointVar)
  | exactW
      (left right : SurplusCOMPGBank.Label)
      (lx ly rx ry : EndpointVar)
  | exactWV
      (member : SurplusCOMPGBank.Label)
      (mx my : EndpointVar)
  | ordinary
      (center left right : SurplusCOMPGBank.Label)
      (cx cy lx ly rx ry : EndpointVar)
  | ordinaryVLeft
      (center member : SurplusCOMPGBank.Label)
      (cx cy mx my : EndpointVar)
  | ordinaryVRight
      (center member : SurplusCOMPGBank.Label)
      (cx cy mx my : EndpointVar)
  | ordinaryWLeft
      (center member : SurplusCOMPGBank.Label)
      (cx cy mx my : EndpointVar)
  | ordinaryWRight
      (center member : SurplusCOMPGBank.Label)
      (cx cy mx my : EndpointVar)
  | ordinaryVW
      (center : SurplusCOMPGBank.Label)
      (cx : EndpointVar)
  | distinct
      (left right : SurplusCOMPGBank.Label)
      (lx ly rx ry : EndpointVar)
  | distinctV
      (left : SurplusCOMPGBank.Label)
      (lx ly : EndpointVar)
deriving DecidableEq, Repr

/-- Canonical sparse polynomial represented by a generator rule. -/
def GeneratorRule.poly : GeneratorRule -> Poly
  | .exactV _ _ lx ly rx ry =>
      sqNormDiffPoly lx.index ly.index rx.index ry.index
  | .exactW _ _ lx ly rx ry =>
      sqDistToUnitXDiffPoly lx.index ly.index rx.index ry.index
  | .exactWV _ mx my =>
      oneMinusSqDistToUnitXPoly mx.index my.index
  | .ordinary _ _ _ cx cy lx ly rx ry =>
      sqDistToCenterDiffPoly cx.index cy.index lx.index ly.index rx.index
        ry.index
  | .ordinaryVLeft _ _ cx cy mx my =>
      sqNormFirstMinusSqDistPoly cx.index cy.index mx.index my.index
  | .ordinaryVRight _ _ cx cy mx my =>
      sqDistMinusSqNormFirstPoly cx.index cy.index mx.index my.index
  | .ordinaryWLeft _ _ cx cy mx my =>
      sqDistUnitXToPointMinusCenterDistPoly mx.index my.index cx.index cy.index
  | .ordinaryWRight _ _ cx cy mx my =>
      sqDistPointToUnitXDiffPoly mx.index my.index cx.index cy.index
  | .ordinaryVW _ cx =>
      twiceVarMinusOnePoly cx.index
  | .distinct _ _ lx ly rx ry =>
      rabinowitschSqDistPoly EndpointVar.tau.index lx.index ly.index rx.index
        ry.index
  | .distinctV _ lx ly =>
      rabinowitschSqNormPoly EndpointVar.tau.index lx.index ly.index

/-- Canonical sparse polynomial emitted into generated certificates. -/
def GeneratorRule.normalizedPoly (rule : GeneratorRule) : Poly :=
  normalizePoly rule.poly

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
