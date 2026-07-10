/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R012:u=v:R012

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R012_ueqv_R012.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R012:u=v:R012`. -/
def rs_R012_ueqv_R012_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R012:u=v:R012`. -/
def rs_R012_ueqv_R012_generators : List Poly :=
  rs_R012_ueqv_R012_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R012:u=v:R012`. -/
def rs_R012_ueqv_R012_coefficients : List Poly :=
[
  [],
  [],
  [
  term (-8 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((11 : Rat) / 6) [(4, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(9, 2), (16, 1)],
  term (16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 6) [(14, 1), (16, 1)],
  term ((14 : Rat) / 3) [(15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(16, 1)]
],
  [],
  [
  term (8 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 6) [(4, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(9, 2), (16, 1)],
  term (-16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 6) [(14, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term (8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (8 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 2), (16, 1)],
  term (16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-16 : Rat) [(15, 2), (16, 1)],
  term ((-19 : Rat) / 3) [(16, 1)]
],
  [
  term (-8 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (16, 1)],
  term (-16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (16 : Rat) [(15, 2), (16, 1)],
  term ((19 : Rat) / 3) [(16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(9, 2), (16, 1)],
  term (-32 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(12, 1), (16, 1)],
  term ((32 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(9, 2), (16, 1)],
  term (32 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(12, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(14, 1), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(9, 2), (16, 1)],
  term (32 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(12, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(14, 1), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (-3 : Rat) [(4, 1), (16, 1)],
  term ((8 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(15, 2), (16, 1)],
  term (5 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (9, 2), (16, 1)],
  term (-32 : Rat) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(4, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((10 : Rat) / 3) [(4, 1), (14, 1), (16, 1)],
  term (14 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-47 : Rat) / 6) [(4, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 2), (16, 1)],
  term (-16 : Rat) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (32 : Rat) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (13, 1), (16, 1)],
  term ((-26 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (6, 1), (16, 1)],
  term (-6 : Rat) [(5, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(5, 2), (16, 1)],
  term (8 : Rat) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (9, 2), (16, 1)],
  term (8 : Rat) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((10 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((19 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(9, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-19 : Rat) / 6) [(14, 2), (16, 1)],
  term ((-65 : Rat) / 6) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(16, 1)]
],
  [
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 2), (16, 1)],
  term (32 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(12, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(14, 1), (16, 1)],
  term (-14 : Rat) [(15, 2), (16, 1)],
  term (6 : Rat) [(16, 1)]
],
  [
  term (16 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (16, 1)],
  term (-16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term (16 : Rat) [(15, 2), (16, 1)]
],
  [
  term (4 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (12, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 1), (9, 2), (16, 1)],
  term (16 : Rat) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(6, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(8, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (12, 1), (16, 1)],
  term (8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(16, 1)]
],
  [
  term (-8 : Rat) [(4, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (7, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (16, 1)],
  term (-16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (16 : Rat) [(15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(16, 1)]
],
  [
  term (4 : Rat) [(4, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [
  term (8 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (8 : Rat) [(4, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 2), (16, 1)],
  term (16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-16 : Rat) [(15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(16, 1)]
],
  [
  term (-4 : Rat) [(4, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(9, 2), (16, 1)],
  term (-16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(14, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(9, 2), (16, 1)],
  term (-32 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(12, 1), (16, 1)],
  term ((32 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term ((-11 : Rat) / 6) [(4, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-32 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(5, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 2), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 6) [(14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(16, 1)]
],
  [
  term (8 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 2), (16, 1)],
  term (16 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term ((-10 : Rat) / 3) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R012:u=v:R012` as sparse rational polynomial data. -/
def rs_R012_ueqv_R012 : Certificate :=
  { generators := rs_R012_ueqv_R012_generators
    coefficients := rs_R012_ueqv_R012_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R012:u=v:R012`. -/
theorem rs_R012_ueqv_R012_valid : checkCertificate rs_R012_ueqv_R012 = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
