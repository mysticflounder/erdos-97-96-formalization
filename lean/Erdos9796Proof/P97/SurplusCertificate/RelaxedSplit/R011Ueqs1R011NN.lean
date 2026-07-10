/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R011:u=s1:R011NN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqs1_R011NN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R011:u=s1:R011NN`. -/
def rs_R011_ueqs1_R011NN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactW .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .distinct .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pw .u .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Q2 .Pw EndpointVar.q2x EndpointVar.q2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R011:u=s1:R011NN`. -/
def rs_R011_ueqs1_R011NN_generators : List Poly :=
  rs_R011_ueqs1_R011NN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R011:u=s1:R011NN`. -/
def rs_R011_ueqs1_R011NN_coefficients : List Poly :=
[
  [
  term (3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 4) [(15, 2), (16, 1)]
],
  [],
  [
  term (-3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 4) [(7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 4) [(15, 2), (16, 1)]
],
  [
  term (-3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(15, 2), (16, 1)]
],
  [
  term ((-13 : Rat) / 2) [],
  term (9 : Rat) [(2, 1)],
  term ((3 : Rat) / 2) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (14, 1)],
  term ((-21 : Rat) / 2) [(2, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(2, 2)],
  term (3 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (13, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(3, 1), (15, 1)],
  term ((-9 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2)],
  term ((-3 : Rat) / 2) [(4, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25 : Rat) / 2) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (11 : Rat) [(13, 1), (15, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(14, 1)],
  term (26 : Rat) [(15, 2)],
  term (4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-1 : Rat) [],
  term (3 : Rat) [(2, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(2, 2)],
  term (-3 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (13, 1)],
  term ((3 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (15, 1)],
  term ((21 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 2)],
  term ((3 : Rat) / 2) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 2) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(13, 1), (15, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(14, 1)],
  term (-2 : Rat) [(15, 2)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (4 : Rat) [(13, 1), (15, 1)]
],
  [],
  [
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [
  term ((-15 : Rat) / 2) [],
  term (12 : Rat) [(2, 1)],
  term (-12 : Rat) [(3, 1), (15, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 1)],
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(15, 2)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (3 : Rat) [],
  term (-6 : Rat) [(2, 1)],
  term (12 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (-24 : Rat) [(2, 1), (15, 2)],
  term (12 : Rat) [(3, 1), (13, 1)],
  term (-18 : Rat) [(3, 1), (15, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(13, 1), (15, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(15, 2), (16, 1)]
],
  [
  term ((15 : Rat) / 2) [],
  term (-12 : Rat) [(2, 1)],
  term (12 : Rat) [(3, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1)],
  term (-24 : Rat) [(15, 2)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (-3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (-3 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(5, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 1), (13, 1), (15, 1), (16, 1)]
],
  [
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [],
  [],
  [],
  [],
  [
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [
  term ((-11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)]
],
  [
  term ((13 : Rat) / 2) [],
  term (-12 : Rat) [(2, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term (-12 : Rat) [(2, 1), (3, 1), (13, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (3 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (12, 1), (15, 2)],
  term (-6 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (14, 1)],
  term (-6 : Rat) [(2, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(2, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(2, 2)],
  term (-12 : Rat) [(2, 2), (13, 1), (15, 1)],
  term (24 : Rat) [(2, 2), (15, 2)],
  term (-3 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (12, 1), (15, 1)],
  term (-3 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (13, 1)],
  term (12 : Rat) [(3, 1), (13, 1), (14, 1)],
  term (18 : Rat) [(3, 1), (14, 1), (15, 1)],
  term ((21 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (15, 1)],
  term ((3 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 2)],
  term (12 : Rat) [(3, 2), (12, 1)],
  term (-24 : Rat) [(3, 2), (14, 1)],
  term ((3 : Rat) / 2) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 2) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 2) [(10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(12, 1), (15, 2)],
  term (5 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-10 : Rat) [(13, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(13, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1)],
  term (-4 : Rat) [(14, 1), (15, 2)],
  term (3 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-19 : Rat) [(15, 2)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (6 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (-4 : Rat) [],
  term (3 : Rat) [(2, 1)],
  term ((3 : Rat) / 2) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (-3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (14, 1)],
  term ((3 : Rat) / 2) [(2, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(2, 2)],
  term (3 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (13, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (15, 1)],
  term ((-21 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2)],
  term ((-3 : Rat) / 2) [(4, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 4) [(5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (13 : Rat) [(13, 1), (15, 1)],
  term ((7 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(14, 1)],
  term (2 : Rat) [(15, 2)]
],
  [
  term ((-3 : Rat) / 2) [],
  term (12 : Rat) [(2, 1)],
  term (-12 : Rat) [(3, 1), (15, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(13, 1), (15, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [],
  [
  term ((7 : Rat) / 2) [],
  term (-3 : Rat) [(2, 1)],
  term (24 : Rat) [(2, 1), (3, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (-3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(2, 2)],
  term (-3 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (13, 1)],
  term ((3 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (15, 1)],
  term ((-15 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2)],
  term ((3 : Rat) / 2) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 4) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 2) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 1)],
  term ((3 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(14, 1)],
  term (2 : Rat) [(15, 2)],
  term (-3 : Rat) [(15, 2), (16, 1)]
]
]

/-- Relaxed split surplus certificate `R011:u=s1:R011NN` as sparse rational polynomial data. -/
def rs_R011_ueqs1_R011NN : Certificate :=
  { generators := rs_R011_ueqs1_R011NN_generators
    coefficients := rs_R011_ueqs1_R011NN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R011:u=s1:R011NN`. -/
theorem rs_R011_ueqs1_R011NN_valid : checkCertificate rs_R011_ueqs1_R011NN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
