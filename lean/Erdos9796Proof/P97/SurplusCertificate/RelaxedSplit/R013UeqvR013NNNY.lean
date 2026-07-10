/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R013:u=v:R013NNNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NNNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R013:u=v:R013NNNY`. -/
def rs_R013_ueqv_R013NNNY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s1 .u .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s2 EndpointVar.s2x,
  .ordinaryVLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s1 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R013:u=v:R013NNNY`. -/
def rs_R013_ueqv_R013NNNY_generators : List Poly :=
  rs_R013_ueqv_R013NNNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R013:u=v:R013NNNY`. -/
def rs_R013_ueqv_R013NNNY_coefficients : List Poly :=
[
  [
  term (-2 : Rat) [],
  term (-16 : Rat) [(5, 1), (15, 1)],
  term (6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2)],
  term (-6 : Rat) [(15, 2), (16, 1)]
],
  [
  term (2 : Rat) [],
  term (-32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(5, 1), (15, 1)],
  term (-26 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(6, 1), (15, 2)],
  term (-12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-40 : Rat) [(15, 2)],
  term (22 : Rat) [(15, 2), (16, 1)]
],
  [
  term (32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(5, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(6, 1), (15, 2)],
  term (12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(15, 2)],
  term (-12 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-2 : Rat) [],
  term (32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(5, 1), (15, 1)],
  term (26 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(6, 1), (15, 2)],
  term (12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (40 : Rat) [(15, 2)],
  term (-22 : Rat) [(15, 2), (16, 1)]
],
  [],
  [
  term (1 : Rat) [],
  term (16 : Rat) [(5, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (15, 1)],
  term (-6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1)],
  term (-32 : Rat) [(6, 1), (11, 1), (15, 1)],
  term (12 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(6, 1), (15, 2)],
  term (-16 : Rat) [(7, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(7, 1), (15, 1)],
  term (2 : Rat) [(14, 1)],
  term (-8 : Rat) [(15, 2)],
  term (4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (8 : Rat) [(5, 1), (15, 1)],
  term (-4 : Rat) [(15, 2)]
],
  [],
  [
  term (-32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(6, 1), (15, 2)],
  term (-12 : Rat) [(6, 1), (15, 2), (16, 1)]
],
  [
  term (32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(6, 1), (15, 2)],
  term (12 : Rat) [(6, 1), (15, 2), (16, 1)]
],
  [],
  [],
  [],
  [
  term (4 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(6, 1), (11, 1), (15, 1)],
  term (-12 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(6, 1), (15, 2)],
  term (32 : Rat) [(7, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(14, 1), (15, 2)],
  term (8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)]
],
  [],
  [
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(7, 1), (15, 1)],
  term (-32 : Rat) [(11, 1), (15, 1)],
  term (12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(15, 2)],
  term (-16 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(7, 1), (15, 1)],
  term (-16 : Rat) [(15, 2)],
  term (16 : Rat) [(15, 2), (16, 1)]
],
  [
  term (32 : Rat) [(5, 1), (15, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(15, 2)],
  term (12 : Rat) [(15, 2), (16, 1)]
],
  [
  term (3 : Rat) [],
  term (-32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (15, 1)],
  term (-10 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1)],
  term (32 : Rat) [(6, 1), (11, 1), (15, 1)],
  term (-12 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(6, 1), (15, 2)],
  term (-12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(7, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(7, 1), (15, 1)],
  term (-2 : Rat) [(14, 1)],
  term (8 : Rat) [(15, 2)],
  term (-4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (2 : Rat) [],
  term (-32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(5, 1), (15, 1)],
  term (-26 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(6, 1), (15, 2)],
  term (-12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-40 : Rat) [(15, 2)],
  term (22 : Rat) [(15, 2), (16, 1)]
],
  [],
  [],
  [
  term (-32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(6, 1), (15, 2)],
  term (-12 : Rat) [(6, 1), (15, 2), (16, 1)]
],
  [],
  [],
  [],
  [],
  [
  term (32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(6, 1), (15, 2)],
  term (12 : Rat) [(6, 1), (15, 2), (16, 1)]
],
  [
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(7, 1), (15, 1)],
  term (16 : Rat) [(15, 2)],
  term (-8 : Rat) [(15, 2), (16, 1)]
],
  [
  term (1 : Rat) [],
  term (32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(5, 1), (15, 1)],
  term (10 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1)],
  term (-32 : Rat) [(6, 1), (11, 1), (15, 1)],
  term (12 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(6, 1), (15, 2)],
  term (12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(7, 1), (14, 1), (15, 1)],
  term (40 : Rat) [(7, 1), (15, 1)],
  term (32 : Rat) [(11, 1), (15, 1)],
  term (-12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(14, 1)],
  term (-24 : Rat) [(15, 2)],
  term (4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-32 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(6, 1), (15, 2)],
  term (-12 : Rat) [(6, 1), (15, 2), (16, 1)]
]
]

/-- Relaxed split surplus certificate `R013:u=v:R013NNNY` as sparse rational polynomial data. -/
def rs_R013_ueqv_R013NNNY : Certificate :=
  { generators := rs_R013_ueqv_R013NNNY_generators
    coefficients := rs_R013_ueqv_R013NNNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R013:u=v:R013NNNY`. -/
theorem rs_R013_ueqv_R013NNNY_valid : checkCertificate rs_R013_ueqv_R013NNNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
