/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_029

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_029.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_029`. -/
def ep_Q1_029_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .exactV .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s3 .u .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q1_029`. -/
def ep_Q1_029_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_029_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_029`. -/
def ep_Q1_029_coefficients : List Poly :=
[
  [],
  [
  term (3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((21 : Rat) / 4) [(4, 1), (16, 1)],
  term (-3 : Rat) [(4, 2), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-35 : Rat) / 16) [(16, 1)]
],
  [
  term (-3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-21 : Rat) / 4) [(4, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (16, 1)],
  term (1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(15, 2), (16, 1)],
  term ((35 : Rat) / 16) [(16, 1)]
],
  [],
  [
  term (-3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-21 : Rat) / 4) [(4, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (16, 1)],
  term (1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(15, 2), (16, 1)],
  term ((35 : Rat) / 16) [(16, 1)]
],
  [
  term (3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((21 : Rat) / 4) [(4, 1), (16, 1)],
  term (-3 : Rat) [(4, 2), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-35 : Rat) / 16) [(16, 1)]
],
  [],
  [
  term (-3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(4, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 2), (16, 1)],
  term (1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((1 : Rat) / 16) [(16, 1)]
],
  [
  term (3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 4) [(4, 1), (16, 1)],
  term (-3 : Rat) [(4, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 16) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((11 : Rat) / 8) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((21 : Rat) / 4) [(4, 1), (16, 1)],
  term (-3 : Rat) [(4, 2), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-35 : Rat) / 16) [(16, 1)]
],
  [],
  [],
  [
  term (-3 : Rat) [(4, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((9 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (-3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(4, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (16, 1)],
  term (1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 16) [(16, 1)]
],
  [
  term (6 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(4, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(4, 1), (16, 1)],
  term ((3 : Rat) / 2) [(4, 2), (16, 1)],
  term (6 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 4) [(5, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 8) [(12, 1), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 8) [(14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((3 : Rat) / 8) [(16, 1)]
],
  [
  term (3 : Rat) [(4, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(16, 1)]
],
  [
  term (3 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 4) [(4, 1), (16, 1)],
  term (-3 : Rat) [(4, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 16) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_029` as sparse rational polynomial data. -/
def ep_Q1_029 : Certificate :=
  { generators := ep_Q1_029_generators
    coefficients := ep_Q1_029_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_029`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_029_valid : checkCertificate ep_Q1_029 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
