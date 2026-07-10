/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R002:u=v:R002NYYN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002NYYN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R002:u=v:R002NYYN`. -/
def rs_R002_ueqv_R002NYYN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s2 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s2 .Pw EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .u .s2 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s2 EndpointVar.s2x,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q1 .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R002:u=v:R002NYYN`. -/
def rs_R002_ueqv_R002NYYN_generators : List Poly :=
  rs_R002_ueqv_R002NYYN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R002:u=v:R002NYYN`. -/
def rs_R002_ueqv_R002NYYN_coefficients : List Poly :=
[
  [
  term (2 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (1 : Rat) [(2, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-2 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
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
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (4 : Rat) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (11, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-4 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (1 : Rat) [(2, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  []
]

/-- Relaxed split surplus certificate `R002:u=v:R002NYYN` as sparse rational polynomial data. -/
def rs_R002_ueqv_R002NYYN : Certificate :=
  { generators := rs_R002_ueqv_R002NYYN_generators
    coefficients := rs_R002_ueqv_R002NYYN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R002:u=v:R002NYYN`. -/
theorem rs_R002_ueqv_R002NYYN_valid : checkCertificate rs_R002_ueqv_R002NYYN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
