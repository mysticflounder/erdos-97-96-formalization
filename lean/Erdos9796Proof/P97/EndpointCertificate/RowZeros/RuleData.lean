/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.PolynomialGeometry
import Erdos9796Proof.P97.EndpointCertificate.ShadowBank

/-!
# Reflected endpoint row-zero rule data

This module contains the data vocabulary shared by the generated endpoint
certificates and their geometric soundness proofs.  Generator polynomials are
*derived* from these rules, so generated code does not need a separate
polynomial-shape matching proof.  This mirrors the arrangement already used by
`SurplusCertificate.RelaxedSplit.Bank.RowZeros.RuleData`.

Every endpoint row uses the single forced-collapse `s1 = s3` normal-axis
assignment (`endpointS1S3Assignment`), so — unlike the relaxed-split surplus
rules — an endpoint rule carries no row-assignment selector.

The constructors record both the shadow labels and the endpoint variables.  The
label-to-variable pairing is not trusted: `EndpointGeneratorRule.Valid`
(`RowZeros.DirectSoundness`) re-checks it against `endpointXVarOfLabel` /
`endpointYVarOfLabel`.
-/

namespace Problem97

namespace EndpointCertificate

namespace RowZeros

open EndpointCertificate.Variables

/-- One semantic rule for an endpoint certificate generator.

Each constructor names the geometric fact that makes the generator vanish:

* `exactV` / `exactVUnit` — two members of the `.v` class, i.e. equal squared
  norms in the gauge that pins `v ↦ (0,0)`;
* `exactW` / `exactWUnit` — two members of the `.w` class, i.e. equal squared
  distances to `(1,0)`;
* `ordinary` and its `V…`/`W…` gauge specializations — two members of a
  variable centre's class;
* `ordinaryVW` — a variable centre equidistant from `v` and `w`, i.e. the
  perpendicular bisector `x = 1/2`;
* `distinctS1S3` — the Rabinowitsch generator `tau · dist²(s1,s3) − 1`. -/
inductive EndpointGeneratorRule where
  /-- `left` and `right` both lie in the `.v` class. -/
  | exactV
      (left right : ShadowBank.Label)
      (lx ly rx ry : EndpointVar)
  /-- `member` lies in the `.v` class together with `.w`. -/
  | exactVUnit
      (member : ShadowBank.Label)
      (mx my : EndpointVar)
  /-- `member` lies in the `.v` class together with `.w`, opposite sign. -/
  | exactVUnitFlipped
      (member : ShadowBank.Label)
      (mx my : EndpointVar)
  /-- `left` and `right` both lie in the `.w` class. -/
  | exactW
      (left right : ShadowBank.Label)
      (lx ly rx ry : EndpointVar)
  /-- `member` lies in the `.w` class together with `.v`. -/
  | exactWUnit
      (member : ShadowBank.Label)
      (mx my : EndpointVar)
  /-- `left` and `right` both lie in the class of the variable centre. -/
  | ordinary
      (center left right : ShadowBank.Label)
      (cx cy lx ly rx ry : EndpointVar)
  /-- `.v` and `member` both lie in the class of the variable centre. -/
  | ordinaryVLeft
      (center member : ShadowBank.Label)
      (cx cy mx my : EndpointVar)
  /-- `member` and `.v` both lie in the class of the variable centre. -/
  | ordinaryVRight
      (center member : ShadowBank.Label)
      (cx cy mx my : EndpointVar)
  /-- `.w` and `member` both lie in the class of the variable centre. -/
  | ordinaryWLeft
      (center member : ShadowBank.Label)
      (cx cy mx my : EndpointVar)
  /-- `member` and `.w` both lie in the class of the variable centre. -/
  | ordinaryWRight
      (center member : ShadowBank.Label)
      (cx cy mx my : EndpointVar)
  /-- `.v` and `.w` both lie in the class of the variable centre. -/
  | ordinaryVW
      (center : ShadowBank.Label)
      (cx : EndpointVar)
  /-- The forced-collapse Rabinowitsch separator for the pair `s1, s3`. -/
  | distinctS1S3
  deriving DecidableEq, Repr

namespace EndpointGeneratorRule

/-- Canonical sparse polynomial represented by an endpoint generator rule. -/
def poly : EndpointGeneratorRule → Poly
  | .exactV _ _ lx ly rx ry =>
      sqNormDiffPoly lx.index ly.index rx.index ry.index
  | .exactVUnit _ mx my =>
      sqNormMinusOnePoly mx.index my.index
  | .exactVUnitFlipped _ mx my =>
      oneMinusSqNormPoly mx.index my.index
  | .exactW _ _ lx ly rx ry =>
      sqDistToUnitXDiffPoly lx.index ly.index rx.index ry.index
  | .exactWUnit _ mx my =>
      sqDistToUnitXMinusOnePoly mx.index my.index
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
  | .distinctS1S3 =>
      rabinowitschSqDistPoly EndpointVar.tau.index EndpointVar.s1x.index
        EndpointVar.s1y.index EndpointVar.s3x.index EndpointVar.s3y.index

/-- Canonical sparse polynomial emitted into generated certificates. -/
def normalizedPoly (rule : EndpointGeneratorRule) : Poly :=
  normalizePoly rule.poly

end EndpointGeneratorRule

/-- Generator list derived from an endpoint rule list.  Generated certificates
define their generators by this function, which is what removes the
polynomial-shape matching obligation. -/
def rulePolys (rules : List EndpointGeneratorRule) : List Poly :=
  rules.map EndpointGeneratorRule.normalizedPoly

end RowZeros

end EndpointCertificate

end Problem97
