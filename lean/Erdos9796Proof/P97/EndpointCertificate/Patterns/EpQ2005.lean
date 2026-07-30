/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q2_005

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q2_005.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_005`. -/
def ep_Q2_005_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s2 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s2 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s2 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .exactV .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pw .u .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s1 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .Pu EndpointVar.q2x EndpointVar.q2y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q2_005`. -/
def ep_Q2_005_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_005_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q2_005`. -/
def ep_Q2_005_coefficients : List Poly :=
[
  [],
  [
  term (-4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term (4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 2), (16, 1)]
],
  [],
  [
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 2), (16, 1)]
],
  [],
  [],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)]
],
  [],
  [
  term (-8 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q2_005` as sparse rational polynomial data. -/
def ep_Q2_005 : Certificate :=
  { generators := ep_Q2_005_generators
    coefficients := ep_Q2_005_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q2_005`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q2_005_valid : checkCertificate ep_Q2_005 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
