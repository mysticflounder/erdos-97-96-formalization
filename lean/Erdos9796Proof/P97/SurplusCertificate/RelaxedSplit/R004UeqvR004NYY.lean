/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R004:u=v:R004NYY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NYY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R004:u=v:R004NYY`. -/
def rs_R004_ueqv_R004NYY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinaryVLeft .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s1 .u .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .Q1 .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R004:u=v:R004NYY`. -/
def rs_R004_ueqv_R004NYY_generators : List Poly :=
  rs_R004_ueqv_R004NYY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R004:u=v:R004NYY`. -/
def rs_R004_ueqv_R004NYY_coefficients : List Poly :=
[
  [],
  [
  term ((3 : Rat) / 2) [(0, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (7 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term (3 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(9, 2), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term ((-9 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (-3 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(16, 1)]
],
  [
  term (-3 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(14, 1), (16, 1)],
  term ((17 : Rat) / 4) [(16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(9, 2), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (-6 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (16, 1)],
  term (6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(9, 2), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term ((9 : Rat) / 4) [(16, 1)]
],
  [],
  [],
  [],
  [
  term (3 : Rat) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (2, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 4) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((13 : Rat) / 2) [(1, 1), (9, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (2, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (16, 1)],
  term (-6 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (9, 2), (16, 1)],
  term (6 : Rat) [(2, 1), (14, 1), (16, 1)],
  term ((-9 : Rat) / 4) [(2, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (9, 2), (16, 1)],
  term (-3 : Rat) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(9, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 2), (16, 1)],
  term ((3 : Rat) / 4) [(14, 1), (16, 1)],
  term ((-5 : Rat) / 8) [(16, 1)]
],
  [
  term (-6 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (16, 1)],
  term (6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(9, 2), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term ((9 : Rat) / 4) [(16, 1)]
],
  [
  term (9 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-7 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (16, 1)],
  term (1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term ((3 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(0, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term (7 : Rat) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(1, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (8, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(2, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(3, 1), (7, 1), (16, 1)],
  term (-1 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (9, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 4) [(6, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(8, 1), (14, 1), (16, 1)],
  term ((7 : Rat) / 4) [(8, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (6 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(9, 2), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term ((-9 : Rat) / 4) [(16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(9, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  []
]

/-- Relaxed split surplus certificate `R004:u=v:R004NYY` as sparse rational polynomial data. -/
def rs_R004_ueqv_R004NYY : Certificate :=
  { generators := rs_R004_ueqv_R004NYY_generators
    coefficients := rs_R004_ueqv_R004NYY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R004:u=v:R004NYY`. -/
theorem rs_R004_ueqv_R004NYY_valid : checkCertificate rs_R004_ueqv_R004NYY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
