/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R009:u=s1:R009Y

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqs1_R009Y.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R009:u=s1:R009Y`. -/
def rs_R009_ueqs1_R009Y_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .distinct .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pw EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R009:u=s1:R009Y`. -/
def rs_R009_ueqs1_R009Y_generators : List Poly :=
  rs_R009_ueqs1_R009Y_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R009:u=s1:R009Y`. -/
def rs_R009_ueqs1_R009Y_coefficients : List Poly :=
[
  [
  term (2 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (15, 2), (16, 2)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 2)],
  term (-1 : Rat) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(11, 1), (15, 1), (16, 2)],
  term (-6 : Rat) [(11, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 2)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (4 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (4 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (4 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-6 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (2 : Rat) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term (2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (15, 2), (16, 2)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 2)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 2)],
  term (1 : Rat) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(11, 1), (15, 1), (16, 2)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term (2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 2)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (2 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (15, 2), (16, 2)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 2)],
  term (-1 : Rat) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(11, 1), (15, 1), (16, 2)],
  term (4 : Rat) [(11, 2), (16, 1)]
],
  [
  term (2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(14, 2), (16, 1)]
],
  [
  term (-2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(14, 2), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 2)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) [],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 1)]
],
  [],
  [],
  [
  term (2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(15, 2), (16, 2)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [
  term (-2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term (2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 2)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 2)],
  term (-1 : Rat) [(11, 1), (15, 1), (16, 2)]
],
  [],
  [],
  [],
  [
  term (4 : Rat) [(11, 2), (16, 1)]
],
  [],
  [
  term (6 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (15, 2), (16, 2)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 2)],
  term (-1 : Rat) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(11, 1), (15, 1), (16, 2)]
],
  [
  term (6 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (15, 2), (16, 2)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 2)],
  term (-1 : Rat) [(11, 1), (14, 1), (15, 1), (16, 2)]
],
  [
  term (-6 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (2 : Rat) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term (2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (15, 2), (16, 2)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 2)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 2)],
  term (1 : Rat) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(11, 1), (15, 1), (16, 2)]
],
  [
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 2)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 2)],
  term (1 : Rat) [(11, 1), (15, 1), (16, 2)]
],
  [
  term (-2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(14, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term (2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(14, 2), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 2)],
  term (2 : Rat) [(16, 1)]
],
  [
  term (2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(14, 2), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 2)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (-2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 2)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 2)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(14, 2), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 2)],
  term (-1 : Rat) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R009:u=s1:R009Y` as sparse rational polynomial data. -/
def rs_R009_ueqs1_R009Y : Certificate :=
  { generators := rs_R009_ueqs1_R009Y_generators
    coefficients := rs_R009_ueqs1_R009Y_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R009:u=s1:R009Y`. -/
theorem rs_R009_ueqs1_R009Y_valid : checkCertificate rs_R009_ueqs1_R009Y = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
