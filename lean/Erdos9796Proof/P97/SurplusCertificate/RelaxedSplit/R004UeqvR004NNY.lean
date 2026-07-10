/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R004:u=v:R004NNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R004:u=v:R004NNY`. -/
def rs_R004_ueqv_R004NNY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinaryWLeft .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinary .s2 .u .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s2 .u .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .u .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R004:u=v:R004NNY`. -/
def rs_R004_ueqv_R004NNY_generators : List Poly :=
  rs_R004_ueqv_R004NNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R004:u=v:R004NNY`. -/
def rs_R004_ueqv_R004NNY_coefficients : List Poly :=
[
  [],
  [
  term (1 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [],
  [],
  [
  term (2 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [
  term (4 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [],
  [],
  [],
  [
  term (1 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (1 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (16, 1)]
],
  [],
  [
  term (2 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)]
],
  [
  term (1 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (1 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)]
]
]

/-- Relaxed split surplus certificate `R004:u=v:R004NNY` as sparse rational polynomial data. -/
def rs_R004_ueqv_R004NNY : Certificate :=
  { generators := rs_R004_ueqv_R004NNY_generators
    coefficients := rs_R004_ueqv_R004NNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R004:u=v:R004NNY`. -/
theorem rs_R004_ueqv_R004NNY_valid : checkCertificate rs_R004_ueqv_R004NNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
