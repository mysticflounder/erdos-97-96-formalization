/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R002:u=v:R002YNN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R002:u=v:R002YNN`. -/
def rs_R002_ueqv_R002YNN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s2 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s2 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s2 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .s2 .u EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy,
  .ordinary .s2 .u .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .u .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s3 .u .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q1 .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q1 .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .Pu EndpointVar.q2x EndpointVar.q2y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R002:u=v:R002YNN`. -/
def rs_R002_ueqv_R002YNN_generators : List Poly :=
  rs_R002_ueqv_R002YNN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R002:u=v:R002YNN`. -/
def rs_R002_ueqv_R002YNN_coefficients : List Poly :=
[
  [],
  [
  term (6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(16, 1)]
],
  [
  term (-6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (16, 1)],
  term (-6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term (6 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (-12 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(16, 1)]
],
  [
  term (12 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term (-6 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (26 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 1)],
  term ((9 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [],
  [],
  [
  term (6 : Rat) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (9, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (8, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (12 : Rat) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(8, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term ((13 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (-6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(3, 2), (16, 1)],
  term (12 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((-13 : Rat) / 4) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
],
  [],
  [],
  [
  term (-6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (16, 1)],
  term (-6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term (6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [],
  [],
  [
  term (-12 : Rat) [(9, 1), (15, 1), (16, 1)]
],
  [
  term (12 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(16, 1)]
],
  [
  term (-6 : Rat) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((9 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term (-9 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 1), (16, 1)],
  term (-3 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(12, 1), (16, 1)],
  term (14 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-19 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(16, 1)]
],
  [
  term (6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (-12 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (13 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R002:u=v:R002YNN` as sparse rational polynomial data. -/
def rs_R002_ueqv_R002YNN : Certificate :=
  { generators := rs_R002_ueqv_R002YNN_generators
    coefficients := rs_R002_ueqv_R002YNN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R002:u=v:R002YNN`. -/
theorem rs_R002_ueqv_R002YNN_valid : checkCertificate rs_R002_ueqv_R002YNN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
