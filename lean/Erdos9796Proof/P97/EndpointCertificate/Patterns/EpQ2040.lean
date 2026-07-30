/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q2_040

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q2_040.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_040`. -/
def ep_Q2_040_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactV .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s1 .u .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Pw EndpointVar.q2x EndpointVar.q2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q2_040`. -/
def ep_Q2_040_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_040_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q2_040`. -/
def ep_Q2_040_coefficients : List Poly :=
[
  [],
  [],
  [
  term (3 : Rat) [(6, 1), (16, 1)],
  term ((3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 8) [(16, 1)]
],
  [
  term ((3 : Rat) / 2) [(6, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 8) [(16, 1)]
],
  [],
  [
  term ((-3 : Rat) / 2) [(6, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 8) [(16, 1)]
],
  [],
  [
  term ((3 : Rat) / 2) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(6, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(6, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 4) [(9, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(6, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(6, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 2), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(9, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(15, 2), (16, 1)]
],
  [],
  [],
  [
  term (-3 : Rat) [(6, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 8) [(16, 1)]
],
  [],
  [],
  [],
  [
  term (3 : Rat) [(6, 1), (16, 1)],
  term ((3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 8) [(16, 1)]
],
  [],
  [
  term ((-3 : Rat) / 2) [(6, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((3 : Rat) / 4) [(16, 1)]
],
  [
  term (-3 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(6, 1), (16, 1)],
  term ((3 : Rat) / 2) [(6, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 4) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (8, 1), (16, 1)],
  term (-6 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 2), (16, 1)],
  term (1 : Rat) [(8, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(15, 2), (16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [
  term ((-3 : Rat) / 2) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(6, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(6, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 2), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(9, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(15, 2), (16, 1)]
],
  [],
  [
  term ((3 : Rat) / 2) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(6, 1), (14, 1), (16, 1)],
  term ((9 : Rat) / 4) [(6, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(9, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 8) [(16, 1)]
],
  [
  term (3 : Rat) [(6, 1), (16, 1)],
  term ((3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 8) [(16, 1)]
],
  [
  term (-3 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 2), (16, 1)],
  term (1 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 8) [(16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(6, 1), (14, 1), (16, 1)],
  term ((-9 : Rat) / 4) [(6, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 2), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(9, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((7 : Rat) / 8) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q2_040` as sparse rational polynomial data. -/
def ep_Q2_040 : Certificate :=
  { generators := ep_Q2_040_generators
    coefficients := ep_Q2_040_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q2_040`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q2_040_valid : checkCertificate ep_Q2_040 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
