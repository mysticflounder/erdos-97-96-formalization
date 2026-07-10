/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R004:u=v:R004NNN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NNN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R004:u=v:R004NNN`. -/
def rs_R004_ueqv_R004NNN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinaryWLeft .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pw .u .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R004:u=v:R004NNN`. -/
def rs_R004_ueqv_R004NNN_generators : List Poly :=
  rs_R004_ueqv_R004NNN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R004:u=v:R004NNN`. -/
def rs_R004_ueqv_R004NNN_coefficients : List Poly :=
[
  [],
  [
  term (6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term (4 : Rat) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(14, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term (-12 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (7 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term (-6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term (-15 : Rat) [(15, 2), (16, 1)],
  term ((13 : Rat) / 4) [(16, 1)]
],
  [
  term (-6 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (16, 1)],
  term (6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(14, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [],
  [
  term (-3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (15 : Rat) [(15, 2), (16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (-6 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (9, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term (-5 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((7 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(8, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 2), (16, 1)],
  term (-6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term ((13 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (-6 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((21 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 4) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term ((-11 : Rat) / 4) [(16, 1)]
],
  [
  term (6 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(14, 1), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [],
  [
  term (-6 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (9, 1), (16, 1)],
  term ((7 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [],
  [],
  [],
  [
  term (-6 : Rat) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((33 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (16, 1)],
  term (-6 : Rat) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(14, 2), (16, 1)],
  term ((33 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-13 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term (-6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(14, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((19 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (-12 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term (12 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term ((-13 : Rat) / 4) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R004:u=v:R004NNN` as sparse rational polynomial data. -/
def rs_R004_ueqv_R004NNN : Certificate :=
  { generators := rs_R004_ueqv_R004NNN_generators
    coefficients := rs_R004_ueqv_R004NNN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R004:u=v:R004NNN`. -/
theorem rs_R004_ueqv_R004NNN_valid : checkCertificate rs_R004_ueqv_R004NNN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
