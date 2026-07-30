/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_016

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_016.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_016`. -/
def ep_Q1_016_rules : List RowZeros.EndpointGeneratorRule :=
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
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .Q2 EndpointVar.pwx EndpointVar.pwy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Pu EndpointVar.pux,
  .ordinaryVLeft .Pu .Pw EndpointVar.pux EndpointVar.puy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pu .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.q1x EndpointVar.q1y,
  .ordinary .Q1 .u .s1 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q1_016`. -/
def ep_Q1_016_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_016_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_016`. -/
def ep_Q1_016_coefficients : List Poly :=
[
  [],
  [],
  [],
  [
  term (1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((4079 : Rat) / 1120) [(6, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(7, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((-681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((-4677 : Rat) / 4480) [(16, 1)]
],
  [
  term (-1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((-7439 : Rat) / 1120) [(6, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((13637 : Rat) / 4480) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (3 : Rat) [(6, 1), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(6, 1), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term ((3 : Rat) / 2) [(6, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 1), (16, 1)],
  term ((401 : Rat) / 280) [(9, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term ((-681 : Rat) / 560) [(11, 2), (16, 1)],
  term ((-999 : Rat) / 2240) [(16, 1)]
],
  [
  term (-3 : Rat) [(6, 1), (16, 1)],
  term ((5 : Rat) / 2) [(16, 1)]
],
  [
  term (1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((7121 : Rat) / 1120) [(6, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((-14363 : Rat) / 4480) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-401 : Rat) / 560) [(6, 1), (8, 1), (16, 1)],
  term ((-401 : Rat) / 280) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (9, 2), (16, 1)],
  term ((681 : Rat) / 1120) [(6, 1), (10, 1), (16, 1)],
  term ((681 : Rat) / 560) [(6, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 4) [(6, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 2), (16, 1)],
  term (2 : Rat) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((1521 : Rat) / 280) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-681 : Rat) / 560) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-681 : Rat) / 1120) [(7, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(7, 2), (8, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 2), (16, 1)],
  term (-1 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-681 : Rat) / 560) [(8, 1), (11, 2), (16, 1)],
  term ((1483 : Rat) / 2240) [(8, 1), (16, 1)],
  term ((681 : Rat) / 560) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(9, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(9, 2), (10, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 2), (16, 1)],
  term ((-681 : Rat) / 2240) [(10, 1), (16, 1)],
  term ((-681 : Rat) / 4480) [(16, 1)]
],
  [
  term (-1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((-6319 : Rat) / 1120) [(6, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((11397 : Rat) / 4480) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_016` as sparse rational polynomial data. -/
def ep_Q1_016 : Certificate :=
  { generators := ep_Q1_016_generators
    coefficients := ep_Q1_016_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_016`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_016_valid : checkCertificate ep_Q1_016 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
