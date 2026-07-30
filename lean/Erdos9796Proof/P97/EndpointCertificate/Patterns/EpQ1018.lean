/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_018

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_018.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_018`. -/
def ep_Q1_018_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactV .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .s2 .u EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy,
  .ordinary .s2 .u .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s2 .u .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .Q2 EndpointVar.pwx EndpointVar.pwy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .s1 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q1_018`. -/
def ep_Q1_018_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_018_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_018`. -/
def ep_Q1_018_coefficients : List Poly :=
[
  [],
  [
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(13, 2), (16, 1)]
],
  [
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 2), (16, 1)]
],
  [
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 2), (16, 1)]
],
  [
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(13, 2), (16, 1)]
],
  [],
  [
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 2), (16, 1)]
],
  [],
  [
  term (1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (4 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(8, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_018` as sparse rational polynomial data. -/
def ep_Q1_018 : Certificate :=
  { generators := ep_Q1_018_generators
    coefficients := ep_Q1_018_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_018`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_018_valid : checkCertificate ep_Q1_018 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
