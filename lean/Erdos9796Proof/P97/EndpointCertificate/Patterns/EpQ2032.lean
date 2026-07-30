/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q2_032

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q2_032.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_032`. -/
def ep_Q2_032_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinaryWLeft .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .exactV .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .exactV .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .s2 .s1 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s3 .u .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pu .s2 EndpointVar.pux EndpointVar.puy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pu .Pw EndpointVar.pux EndpointVar.puy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pu .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.q1x EndpointVar.q1y,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .Pu EndpointVar.q2x EndpointVar.q2y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q2_032`. -/
def ep_Q2_032_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_032_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q2_032`. -/
def ep_Q2_032_coefficients : List Poly :=
[
  [
  term (-24 : Rat) [(15, 2), (16, 1)]
],
  [],
  [
  term ((3 : Rat) / 2) [(0, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(12, 1), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(13, 2), (16, 1)],
  term (12 : Rat) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [],
  [
  term (-3 : Rat) [(0, 1), (16, 1)],
  term (-9 : Rat) [(12, 1), (16, 1)],
  term (9 : Rat) [(16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (16, 1)],
  term (9 : Rat) [(12, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term (-8 : Rat) [(16, 1)]
],
  [],
  [
  term ((-21 : Rat) / 2) [(0, 1), (16, 1)],
  term (18 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (16, 1)],
  term ((9 : Rat) / 2) [(12, 1), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(16, 1)]
],
  [
  term ((15 : Rat) / 2) [(0, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (16, 1)],
  term ((-15 : Rat) / 2) [(12, 1), (16, 1)],
  term (9 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (24 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (-3 : Rat) [(0, 1), (16, 1)],
  term (-9 : Rat) [(12, 1), (16, 1)],
  term (9 : Rat) [(16, 1)]
],
  [],
  [],
  [
  term (3 : Rat) [(0, 1), (16, 1)],
  term (9 : Rat) [(12, 1), (16, 1)],
  term (-9 : Rat) [(16, 1)]
],
  [
  term (6 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (13, 2), (16, 1)],
  term (6 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (16, 1)],
  term (-24 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (14, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(12, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(12, 2), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(13, 2), (14, 1), (16, 1)],
  term ((9 : Rat) / 2) [(13, 2), (16, 1)],
  term (-5 : Rat) [(14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term ((-9 : Rat) / 2) [(0, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (16, 1)],
  term ((9 : Rat) / 2) [(12, 1), (16, 1)],
  term (9 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q2_032` as sparse rational polynomial data. -/
def ep_Q2_032 : Certificate :=
  { generators := ep_Q2_032_generators
    coefficients := ep_Q2_032_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q2_032`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q2_032_valid : checkCertificate ep_Q2_032 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
