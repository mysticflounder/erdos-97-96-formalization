/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYNN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R009:u=v:R009NYYNN`. -/
def rs_R009_ueqv_R009NYYNN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s1 .u .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R009:u=v:R009NYYNN`. -/
def rs_R009_ueqv_R009NYYNN_generators : List Poly :=
  rs_R009_ueqv_R009NYYNN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R009:u=v:R009NYYNN`. -/
def rs_R009_ueqv_R009NYYNN_coefficients : List Poly :=
[
  [
  term (-8 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term (8 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (8 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-8 : Rat) [(7, 1), (13, 1), (16, 1)]
],
  [],
  [
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [],
  [
  term (-8 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [],
  [
  term (8 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (8 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (-4 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [],
  [
  term (-8 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [],
  [
  term (-12 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (8 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)]
]
]

/-- Relaxed split surplus certificate `R009:u=v:R009NYYNN` as sparse rational polynomial data. -/
def rs_R009_ueqv_R009NYYNN : Certificate :=
  { generators := rs_R009_ueqv_R009NYYNN_generators
    coefficients := rs_R009_ueqv_R009NYYNN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R009:u=v:R009NYYNN`. -/
theorem rs_R009_ueqv_R009NYYNN_valid : checkCertificate rs_R009_ueqv_R009NYYNN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
