/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R001:no_separator:R001N

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R001_no_separator_R001N.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R001:no_separator:R001N`. -/
def rs_R001_no_separator_R001N_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactWV .Pw EndpointVar.pwx EndpointVar.pwy,
  .exactWV .Q1 EndpointVar.q1x EndpointVar.q1y,
  .exactWV .Q2 EndpointVar.q2x EndpointVar.q2y,
  .ordinary .u .s2 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s2 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s2 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s1 .u .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinary .s2 .u .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s2 .u .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .u .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .Q1 .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Q1 .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R001:no_separator:R001N`. -/
def rs_R001_no_separator_R001N_generators : List Poly :=
  rs_R001_no_separator_R001N_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R001:no_separator:R001N`. -/
def rs_R001_no_separator_R001N_coefficients : List Poly :=
[
  [
  term (-1 : Rat) [(2, 1), (9, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (15, 1)],
  term ((4 : Rat) / 3) [(15, 2)]
],
  [
  term (1 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (3 : Rat) [(2, 1), (9, 1), (15, 1)],
  term (-3 : Rat) [(3, 1), (8, 1), (15, 1)],
  term ((7 : Rat) / 2) [(3, 1), (15, 1)],
  term (-3 : Rat) [(9, 1), (15, 1)]
],
  [
  term (-1 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (-2 : Rat) [(2, 1), (9, 1), (15, 1)],
  term (3 : Rat) [(3, 1), (8, 1), (15, 1)],
  term (-3 : Rat) [(3, 1), (15, 1)],
  term (3 : Rat) [(9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(15, 2)]
],
  [],
  [
  term (1 : Rat) [],
  term ((-8 : Rat) / 3) [(2, 1), (15, 2)],
  term ((8 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(9, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(14, 1)],
  term ((8 : Rat) / 3) [(15, 2)]
],
  [
  term ((1 : Rat) / 3) [],
  term ((8 : Rat) / 3) [(2, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (15, 1)],
  term ((2 : Rat) / 3) [(14, 1)]
],
  [],
  [
  term (-1 : Rat) [(2, 1), (9, 1), (15, 1)],
  term ((1 : Rat) / 2) [(3, 1), (15, 1)],
  term (1 : Rat) [(9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(15, 2)]
],
  [],
  [
  term (1 : Rat) [(2, 1), (9, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (15, 1)],
  term (-1 : Rat) [(9, 1), (15, 1)],
  term ((4 : Rat) / 3) [(15, 2)]
],
  [
  term (-1 : Rat) [(2, 1), (9, 1), (15, 1)],
  term ((1 : Rat) / 2) [(3, 1), (15, 1)],
  term (1 : Rat) [(9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(15, 2)]
],
  [],
  [
  term (1 : Rat) [(2, 1), (9, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (15, 1)],
  term (-1 : Rat) [(9, 1), (15, 1)],
  term ((4 : Rat) / 3) [(15, 2)]
],
  [],
  [],
  [],
  [],
  [],
  [
  term (1 : Rat) [(3, 1), (15, 1)],
  term (3 : Rat) [(9, 1), (15, 1)]
],
  [
  term (1 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (3 : Rat) [(2, 1), (9, 1), (15, 1)],
  term (-3 : Rat) [(3, 1), (8, 1), (15, 1)],
  term ((5 : Rat) / 2) [(3, 1), (15, 1)],
  term (-4 : Rat) [(9, 1), (15, 1)],
  term ((8 : Rat) / 3) [(15, 2)]
],
  [
  term (-5 : Rat) [(3, 1), (15, 1)],
  term (1 : Rat) [(9, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(15, 2)]
],
  [
  term (1 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (2 : Rat) [(2, 1), (9, 1), (15, 1)],
  term (-3 : Rat) [(3, 1), (8, 1), (15, 1)],
  term (3 : Rat) [(3, 1), (15, 1)],
  term (-3 : Rat) [(9, 1), (15, 1)],
  term ((4 : Rat) / 3) [(15, 2)]
],
  [],
  [
  term (-1 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (-3 : Rat) [(2, 1), (9, 1), (15, 1)],
  term (3 : Rat) [(3, 1), (8, 1), (15, 1)],
  term ((-5 : Rat) / 2) [(3, 1), (15, 1)],
  term (4 : Rat) [(9, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(15, 2)]
],
  [],
  [
  term (5 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(9, 1), (15, 1)],
  term ((8 : Rat) / 3) [(15, 2)]
],
  [
  term (1 : Rat) [],
  term ((-8 : Rat) / 3) [(2, 1), (15, 2)],
  term ((8 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(3, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(14, 1)]
],
  [
  term ((-8 : Rat) / 3) [(15, 2)]
],
  [],
  [
  term (-1 : Rat) [],
  term ((8 : Rat) / 3) [(2, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(3, 1), (15, 1)],
  term ((2 : Rat) / 3) [(14, 1)]
]
]

/-- Relaxed split surplus certificate `R001:no_separator:R001N` as sparse rational polynomial data. -/
def rs_R001_no_separator_R001N : Certificate :=
  { generators := rs_R001_no_separator_R001N_generators
    coefficients := rs_R001_no_separator_R001N_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R001:no_separator:R001N`. -/
theorem rs_R001_no_separator_R001N_valid : checkCertificate rs_R001_no_separator_R001N = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
