/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYNNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R009:u=v:R009NYNNY`. -/
def rs_R009_ueqv_R009NYNNY_rules : List Bank.RowZeros.GeneratorRule :=
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
  .ordinaryWLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .Pw .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .Pw .Q2 EndpointVar.pwx EndpointVar.pwy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .Pu EndpointVar.q2x EndpointVar.q2y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R009:u=v:R009NYNNY`. -/
def rs_R009_ueqv_R009NYNNY_generators : List Poly :=
  rs_R009_ueqv_R009NYNNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R009:u=v:R009NYNNY`. -/
def rs_R009_ueqv_R009NYNNY_coefficients : List Poly :=
[
  [],
  [
  term (12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (16, 1)],
  term (24 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 2), (16, 1)],
  term ((11 : Rat) / 4) [(16, 1)]
],
  [
  term (-12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (-24 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(16, 1)]
],
  [
  term (-12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(2, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (-24 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (16, 1)],
  term ((37 : Rat) / 4) [(16, 1)]
],
  [
  term (-12 : Rat) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 2), (16, 1)],
  term (5 : Rat) [(2, 1), (12, 1), (16, 1)],
  term ((5 : Rat) / 4) [(2, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-5 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (-6 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 2), (16, 1)],
  term ((-21 : Rat) / 4) [(12, 1), (16, 1)],
  term ((11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term (12 : Rat) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 2), (16, 1)],
  term (-5 : Rat) [(2, 1), (12, 1), (16, 1)],
  term ((35 : Rat) / 4) [(2, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (16, 1)],
  term (-12 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (16, 1)],
  term (30 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-21 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 2), (16, 1)],
  term ((21 : Rat) / 4) [(12, 1), (16, 1)],
  term ((-17 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 2), (16, 1)],
  term ((-21 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term (4 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-2 : Rat) [(3, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (16, 1)],
  term (24 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 2), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
],
  [
  term (-12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (2 : Rat) [(2, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 2), (16, 1)],
  term (4 : Rat) [(8, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (16, 1)],
  term ((-11 : Rat) / 4) [(16, 1)]
],
  [
  term (-3 : Rat) [(2, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term ((3 : Rat) / 2) [(2, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (5 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(13, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(16, 1)]
],
  [
  term (3 : Rat) [(2, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (16, 1)],
  term (2 : Rat) [(2, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (16, 1)],
  term (4 : Rat) [(8, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [],
  [],
  [],
  [
  term (4 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-2 : Rat) [(3, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(2, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (16, 1)],
  term (-6 : Rat) [(8, 1), (16, 1)],
  term ((7 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (-24 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(13, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (16, 1)],
  term (24 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 2), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
],
  [],
  [],
  [
  term (-12 : Rat) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 2), (16, 1)],
  term (-5 : Rat) [(2, 1), (12, 1), (16, 1)],
  term ((25 : Rat) / 4) [(2, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-5 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(3, 2), (16, 1)],
  term (-6 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 2), (16, 1)],
  term ((21 : Rat) / 4) [(12, 1), (16, 1)],
  term ((11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-29 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (12 : Rat) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 2), (16, 1)],
  term (5 : Rat) [(2, 1), (12, 1), (16, 1)],
  term ((-29 : Rat) / 4) [(2, 1), (16, 1)],
  term (2 : Rat) [(2, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (16, 1)],
  term (4 : Rat) [(8, 1), (16, 1)],
  term (-18 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 2), (16, 1)],
  term ((-21 : Rat) / 4) [(12, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (16, 1)],
  term ((9 : Rat) / 2) [(16, 1)]
],
  [
  term (24 : Rat) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (-18 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (9, 2), (12, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (9, 2), (16, 1)],
  term ((5 : Rat) / 2) [(2, 1), (12, 1), (16, 1)],
  term (-5 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(2, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(2, 1), (16, 1)],
  term ((1 : Rat) / 2) [(2, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term (-10 : Rat) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term (7 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (-10 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(3, 2), (16, 1)],
  term (48 : Rat) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 2) [(8, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term (-36 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (21 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(9, 2), (12, 1), (16, 1)],
  term (24 : Rat) [(9, 2), (14, 1), (16, 1)],
  term (-12 : Rat) [(9, 2), (16, 1)],
  term (11 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (16, 1)],
  term ((17 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(13, 2), (14, 1), (16, 1)],
  term ((-23 : Rat) / 2) [(13, 2), (16, 1)],
  term ((21 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (12 : Rat) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (8, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (9, 2), (16, 1)],
  term (-5 : Rat) [(2, 1), (12, 1), (16, 1)],
  term ((39 : Rat) / 4) [(2, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (16, 1)],
  term (-12 : Rat) [(3, 1), (9, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (16, 1)],
  term (30 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-21 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 2), (16, 1)],
  term ((21 : Rat) / 4) [(12, 1), (16, 1)],
  term ((-17 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 2), (16, 1)],
  term ((-23 : Rat) / 4) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R009:u=v:R009NYNNY` as sparse rational polynomial data. -/
def rs_R009_ueqv_R009NYNNY : Certificate :=
  { generators := rs_R009_ueqv_R009NYNNY_generators
    coefficients := rs_R009_ueqv_R009NYNNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R009:u=v:R009NYNNY`. -/
theorem rs_R009_ueqv_R009NYNNY_valid : checkCertificate rs_R009_ueqv_R009NYNNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
