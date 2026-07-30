/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q2_000

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q2_000.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_000`. -/
def ep_Q2_000_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .exactVUnitFlipped .Pw EndpointVar.pwx EndpointVar.pwy,
  .exactVUnitFlipped .Pu EndpointVar.pux EndpointVar.puy,
  .exactVUnitFlipped .Q2 EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinary .s2 .u .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s2 .u .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .u .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s3 .u .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .Pu .s1 EndpointVar.pux EndpointVar.puy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Pu .Pw EndpointVar.pux EndpointVar.puy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pu .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for endpoint certificate `ep_Q2_000`. -/
def ep_Q2_000_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_000_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q2_000`. -/
def ep_Q2_000_coefficients : List Poly :=
[
  [
  term (-1 : Rat) [],
  term ((3 : Rat) / 4) [(6, 1)],
  term ((1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [],
  [],
  [
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [
  term ((1 : Rat) / 4) [],
  term ((3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)],
  term (2 : Rat) [(7, 2)]
],
  [
  term ((1 : Rat) / 4) [],
  term ((3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [],
  [
  term ((-1 : Rat) / 4) [],
  term ((-3 : Rat) / 4) [(6, 1)],
  term ((1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [
  term (-1 : Rat) [],
  term ((3 : Rat) / 4) [(6, 1)],
  term ((1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [],
  [
  term (-1 : Rat) [],
  term ((3 : Rat) / 4) [(6, 1)],
  term ((1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [],
  [],
  [
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [],
  [],
  [
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [
  term (-1 : Rat) [],
  term ((3 : Rat) / 4) [(6, 1)],
  term ((1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [],
  [],
  [
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(6, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)]
],
  [],
  [],
  [],
  [],
  [
  term ((1 : Rat) / 4) [],
  term ((1 : Rat) / 2) [(6, 1)],
  term (-1 : Rat) [(6, 1), (7, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1)],
  term ((1 : Rat) / 2) [(7, 2)],
  term (1 : Rat) [(7, 2), (14, 1)]
],
  [
  term ((1 : Rat) / 4) [],
  term (1 : Rat) [(7, 1), (15, 1)]
],
  []
]

/-- Endpoint certificate `ep_Q2_000` as sparse rational polynomial data. -/
def ep_Q2_000 : Certificate :=
  { generators := ep_Q2_000_generators
    coefficients := ep_Q2_000_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q2_000`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q2_000_valid : checkCertificate ep_Q2_000 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
