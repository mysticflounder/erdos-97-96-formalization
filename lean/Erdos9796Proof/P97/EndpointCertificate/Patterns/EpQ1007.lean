/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_007

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_007.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_007`. -/
def ep_Q1_007_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinaryVLeft .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactV .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .exactV .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pw .u .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .Pu EndpointVar.pux,
  .ordinaryVLeft .Pu .Pw EndpointVar.pux EndpointVar.puy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pu .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.q1x EndpointVar.q1y,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q1_007`. -/
def ep_Q1_007_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_007_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_007`. -/
def ep_Q1_007_coefficients : List Poly :=
[
  [],
  [],
  [],
  [
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (-4 : Rat) [(13, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (4 : Rat) [(13, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)]
],
  [
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
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
  [],
  [
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-4 : Rat) [(13, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (4 : Rat) [(13, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (4 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(8, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)]
],
  [
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (4 : Rat) [(13, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)]
],
  [],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_007` as sparse rational polynomial data. -/
def ep_Q1_007 : Certificate :=
  { generators := ep_Q1_007_generators
    coefficients := ep_Q1_007_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_007`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_007_valid : checkCertificate ep_Q1_007 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
