/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R005:u=v:R005YYY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YYY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R005:u=v:R005YYY`. -/
def rs_R005_ueqv_R005YYY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s2 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s2 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s2 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s1 .u .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R005:u=v:R005YYY`. -/
def rs_R005_ueqv_R005YYY_generators : List Poly :=
  rs_R005_ueqv_R005YYY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R005:u=v:R005YYY`. -/
def rs_R005_ueqv_R005YYY_coefficients : List Poly :=
[
  [],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [],
  [
  term ((8 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(7, 2), (16, 1)],
  term (3 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-11 : Rat) / 6) [(14, 2), (16, 1)],
  term ((7 : Rat) / 6) [(15, 2), (16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (16, 1)],
  term ((1 : Rat) / 6) [(6, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(7, 2), (16, 1)],
  term (-3 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(14, 2), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term ((1 : Rat) / 2) [(6, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(12, 1), (16, 1)],
  term ((1 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(16, 1)]
],
  [
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((8 : Rat) / 3) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [
  term ((-1 : Rat) / 2) [(6, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(12, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(14, 2), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term ((17 : Rat) / 6) [(16, 1)]
],
  [
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(15, 2), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((8 : Rat) / 3) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [],
  [
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(15, 2), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term ((1 : Rat) / 2) [(6, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(12, 1), (16, 1)],
  term ((1 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(16, 1)]
],
  [],
  [],
  [],
  [
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((8 : Rat) / 3) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [],
  [
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(14, 2), (16, 1)],
  term ((8 : Rat) / 3) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [],
  [
  term ((-8 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(6, 1), (16, 1)],
  term ((1 : Rat) / 6) [(6, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(7, 2), (16, 1)],
  term (-3 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 3) [(14, 1), (16, 1)],
  term ((11 : Rat) / 6) [(14, 2), (16, 1)],
  term ((-7 : Rat) / 6) [(15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(16, 1)]
],
  [
  term ((1 : Rat) / 2) [(6, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((8 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(7, 2), (16, 1)],
  term (3 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(12, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(14, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((13 : Rat) / 6) [(16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(14, 1), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) [(6, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(14, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 6) [(6, 1), (16, 1)],
  term ((1 : Rat) / 6) [(6, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (13, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((7 : Rat) / 6) [(7, 2), (16, 1)],
  term (-3 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(12, 1), (16, 1)],
  term (3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 6) [(14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(14, 2), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-17 : Rat) / 6) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R005:u=v:R005YYY` as sparse rational polynomial data. -/
def rs_R005_ueqv_R005YYY : Certificate :=
  { generators := rs_R005_ueqv_R005YYY_generators
    coefficients := rs_R005_ueqv_R005YYY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R005:u=v:R005YYY`. -/
theorem rs_R005_ueqv_R005YYY_valid : checkCertificate rs_R005_ueqv_R005YYY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
