/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R009:u=v:R009YNYNN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNYNN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R009:u=v:R009YNYNN`. -/
def rs_R009_ueqv_R009YNYNN_rules : List Bank.RowZeros.GeneratorRule :=
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
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .s2 .u EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy,
  .ordinary .s2 .u .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s2 .u .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s1 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R009:u=v:R009YNYNN`. -/
def rs_R009_ueqv_R009YNYNN_generators : List Poly :=
  rs_R009_ueqv_R009YNYNN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R009:u=v:R009YNYNN`. -/
def rs_R009_ueqv_R009YNYNN_coefficients : List Poly :=
[
  [],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(4, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (20 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-12 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-12 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(15, 2), (16, 1)]
],
  [
  term (12 : Rat) [(3, 1), (15, 1), (16, 1)]
],
  [
  term (6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-24 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (20 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (20 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [
  term (6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [],
  [
  term (8 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (-6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(4, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R009:u=v:R009YNYNN` as sparse rational polynomial data. -/
def rs_R009_ueqv_R009YNYNN : Certificate :=
  { generators := rs_R009_ueqv_R009YNYNN_generators
    coefficients := rs_R009_ueqv_R009YNYNN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R009:u=v:R009YNYNN`. -/
theorem rs_R009_ueqv_R009YNYNN_valid : checkCertificate rs_R009_ueqv_R009YNYNN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
