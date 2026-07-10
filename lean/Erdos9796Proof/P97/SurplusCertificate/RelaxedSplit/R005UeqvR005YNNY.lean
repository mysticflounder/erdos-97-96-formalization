/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R005:u=v:R005YNNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YNNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R005:u=v:R005YNNY`. -/
def rs_R005_ueqv_R005YNNY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s2 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s2 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s2 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pw .u .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R005:u=v:R005YNNY`. -/
def rs_R005_ueqv_R005YNNY_generators : List Poly :=
  rs_R005_ueqv_R005YNNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R005:u=v:R005YNNY`. -/
def rs_R005_ueqv_R005YNNY_coefficients : List Poly :=
[
  [
  term (-6 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 8) [(16, 1)]
],
  [],
  [
  term ((3 : Rat) / 2) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [
  term (-3 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(0, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 8) [(16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 1), (14, 1), (16, 1)],
  term ((7 : Rat) / 4) [(0, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(15, 2), (16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (-3 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(16, 1)]
],
  [
  term (3 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term (-6 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 8) [(16, 1)]
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
  term (-3 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(16, 1)]
],
  [],
  [],
  [
  term (3 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (11, 1), (16, 1)],
  term ((5 : Rat) / 2) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((13 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35 : Rat) / 4) [(1, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (16, 1)],
  term (1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((3 : Rat) / 8) [(16, 1)]
],
  [
  term (-6 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (15, 1), (16, 1)]
],
  [
  term (-3 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(0, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(16, 1)]
],
  [
  term (-3 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(0, 1), (14, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(0, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((5 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (3 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(0, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((7 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((1 : Rat) / 8) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R005:u=v:R005YNNY` as sparse rational polynomial data. -/
def rs_R005_ueqv_R005YNNY : Certificate :=
  { generators := rs_R005_ueqv_R005YNNY_generators
    coefficients := rs_R005_ueqv_R005YNNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R005:u=v:R005YNNY`. -/
theorem rs_R005_ueqv_R005YNNY_valid : checkCertificate rs_R005_ueqv_R005YNNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
