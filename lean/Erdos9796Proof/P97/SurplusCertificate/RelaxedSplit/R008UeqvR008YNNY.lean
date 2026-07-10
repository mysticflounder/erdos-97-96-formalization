/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R008:u=v:R008YNNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YNNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R008:u=v:R008YNNY`. -/
def rs_R008_ueqv_R008YNNY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Q2 .Pw EndpointVar.q2x EndpointVar.q2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R008:u=v:R008YNNY`. -/
def rs_R008_ueqv_R008YNNY_generators : List Poly :=
  rs_R008_ueqv_R008YNNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R008:u=v:R008YNNY`. -/
def rs_R008_ueqv_R008YNNY_coefficients : List Poly :=
[
  [],
  [],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(12, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(12, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(14, 1), (16, 1)],
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
  [
  term (4 : Rat) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(8, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-18 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(12, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(12, 2), (16, 1)],
  term (18 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(13, 2), (16, 1)],
  term (-4 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(14, 2), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(12, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(12, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term (16 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(12, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(12, 1), (16, 1)],
  term (8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(12, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (-4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(12, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(14, 1), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(12, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R008:u=v:R008YNNY` as sparse rational polynomial data. -/
def rs_R008_ueqv_R008YNNY : Certificate :=
  { generators := rs_R008_ueqv_R008YNNY_generators
    coefficients := rs_R008_ueqv_R008YNNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R008:u=v:R008YNNY`. -/
theorem rs_R008_ueqv_R008YNNY_valid : checkCertificate rs_R008_ueqv_R008YNNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
