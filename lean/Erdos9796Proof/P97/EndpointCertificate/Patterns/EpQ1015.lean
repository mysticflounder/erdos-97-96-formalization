/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_015

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_015.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_015`. -/
def ep_Q1_015_rules : List RowZeros.EndpointGeneratorRule :=
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
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pw .u .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
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

/-- Generator polynomials for endpoint certificate `ep_Q1_015`. -/
def ep_Q1_015_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_015_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_015`. -/
def ep_Q1_015_coefficients : List Poly :=
[
  [],
  [
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (13, 1), (16, 1)]
],
  [
  term (-3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((17 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-1 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((9 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-9 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((13 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-5 : Rat) [(11, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term ((3 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
],
  [
  term ((3 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
],
  [],
  [
  term (-3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (11, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (13, 1), (16, 1)]
],
  [
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (16, 1)]
],
  [],
  [
  term (6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (-3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((7 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (11, 2), (16, 1)],
  term (3 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term (-5 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-1 : Rat) [(8, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term (5 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((5 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-6 : Rat) [(11, 2), (12, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-12 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (16, 1)]
],
  [
  term (6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (13, 1), (16, 1)]
],
  [],
  [],
  [],
  [],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_015` as sparse rational polynomial data. -/
def ep_Q1_015 : Certificate :=
  { generators := ep_Q1_015_generators
    coefficients := ep_Q1_015_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_015`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_015_valid : checkCertificate ep_Q1_015 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
