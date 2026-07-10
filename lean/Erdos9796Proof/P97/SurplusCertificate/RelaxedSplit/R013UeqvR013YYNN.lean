/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R013:u=v:R013YYNN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYNN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R013:u=v:R013YYNN`. -/
def rs_R013_ueqv_R013YYNN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .Pw EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R013:u=v:R013YYNN`. -/
def rs_R013_ueqv_R013YYNN_generators : List Poly :=
  rs_R013_ueqv_R013YYNN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R013:u=v:R013YYNN`. -/
def rs_R013_ueqv_R013YYNN_coefficients : List Poly :=
[
  [],
  [
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(9, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(9, 2), (16, 1)]
],
  [
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (16, 1)]
],
  [],
  [],
  [
  term (-1 : Rat) []
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
  term (-6 : Rat) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (9, 2), (16, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(9, 2), (10, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (4 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (9, 2), (16, 1)],
  term (-1 : Rat) [(6, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (16, 1)],
  term (-9 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(9, 2), (10, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(9, 2), (16, 1)]
],
  [],
  [
  term (6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(9, 2), (16, 1)]
],
  [],
  [
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(9, 2), (16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  []
]

/-- Relaxed split surplus certificate `R013:u=v:R013YYNN` as sparse rational polynomial data. -/
def rs_R013_ueqv_R013YYNN : Certificate :=
  { generators := rs_R013_ueqv_R013YYNN_generators
    coefficients := rs_R013_ueqv_R013YYNN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R013:u=v:R013YYNN`. -/
theorem rs_R013_ueqv_R013YYNN_valid : checkCertificate rs_R013_ueqv_R013YYNN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
