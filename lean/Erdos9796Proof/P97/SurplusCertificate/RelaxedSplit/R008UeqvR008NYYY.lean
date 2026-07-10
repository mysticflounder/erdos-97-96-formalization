/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R008:u=v:R008NYYY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NYYY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R008:u=v:R008NYYY`. -/
def rs_R008_ueqv_R008NYYY_rules : List Bank.RowZeros.GeneratorRule :=
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
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s1 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .Pu EndpointVar.q2x EndpointVar.q2y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R008:u=v:R008NYYY`. -/
def rs_R008_ueqv_R008NYYY_generators : List Poly :=
  rs_R008_ueqv_R008NYYY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R008:u=v:R008NYYY`. -/
def rs_R008_ueqv_R008NYYY_coefficients : List Poly :=
[
  [],
  [],
  [
  term (-2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(12, 1), (16, 1)],
  term (2 : Rat) [(12, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)],
  term ((1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((7 : Rat) / 8) [(16, 1)]
],
  [],
  [],
  [
  term (2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((13 : Rat) / 4) [(12, 1), (16, 1)],
  term (-2 : Rat) [(12, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)],
  term ((1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 8) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 4) [(12, 1), (16, 1)],
  term (-2 : Rat) [(12, 2), (16, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 8) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(12, 1), (16, 1)],
  term (2 : Rat) [(12, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((9 : Rat) / 8) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (13, 2), (16, 1)],
  term (-1 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(0, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (2, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)],
  term (2 : Rat) [(2, 1), (13, 2), (16, 1)],
  term (-1 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(12, 1), (16, 1)],
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 16) [(16, 1)]
],
  [],
  [
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((1 : Rat) / 8) [(16, 1)]
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
  term (2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 4) [(12, 1), (16, 1)],
  term (-2 : Rat) [(12, 2), (16, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 8) [(16, 1)]
],
  [],
  [],
  [
  term (4 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (16, 1)],
  term ((3 : Rat) / 2) [(12, 1), (16, 1)],
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 8) [(16, 1)]
],
  [
  term (-2 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(12, 1), (16, 1)],
  term (2 : Rat) [(12, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (13, 2), (16, 1)],
  term ((1 : Rat) / 2) [(2, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 8) [(2, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(3, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 4) [(12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(12, 1), (16, 1)],
  term ((3 : Rat) / 2) [(12, 2), (16, 1)],
  term ((1 : Rat) / 2) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 2), (16, 1)],
  term ((-7 : Rat) / 8) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((7 : Rat) / 16) [(16, 1)]
],
  [],
  [
  term (2 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 4) [(12, 1), (16, 1)],
  term (-2 : Rat) [(12, 2), (16, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)],
  term ((1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((3 : Rat) / 8) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R008:u=v:R008NYYY` as sparse rational polynomial data. -/
def rs_R008_ueqv_R008NYYY : Certificate :=
  { generators := rs_R008_ueqv_R008NYYY_generators
    coefficients := rs_R008_ueqv_R008NYYY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R008:u=v:R008NYYY`. -/
theorem rs_R008_ueqv_R008NYYY_valid : checkCertificate rs_R008_ueqv_R008NYYY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
