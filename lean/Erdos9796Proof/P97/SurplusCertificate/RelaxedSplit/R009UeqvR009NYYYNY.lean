/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYYNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R009:u=v:R009NYYYNY`. -/
def rs_R009_ueqv_R009NYYYNY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactW .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinaryWLeft .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R009:u=v:R009NYYYNY`. -/
def rs_R009_ueqv_R009NYYYNY_generators : List Poly :=
  rs_R009_ueqv_R009NYYYNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R009:u=v:R009NYYYNY`. -/
def rs_R009_ueqv_R009NYYYNY_coefficients : List Poly :=
[
  [
  term (1 : Rat) [(0, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (7 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (5 : Rat) [(4, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-5 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(16, 1)]
],
  [
  term (-2 : Rat) [(4, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term (-11 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(4, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (11 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (14, 1), (16, 1)],
  term (5 : Rat) [(5, 2), (16, 1)],
  term (-2 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(8, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term (17 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(4, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-9 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 2), (14, 1), (16, 1)],
  term (-5 : Rat) [(5, 2), (16, 1)],
  term (2 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (16, 1)],
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term (8 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (4 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term (-8 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-8 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (5, 2), (16, 1)],
  term (-2 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (7 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-17 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 2), (14, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)]
],
  [
  term (4 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(16, 1)]
],
  [
  term (8 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (26 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-4 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [],
  [],
  [
  term (4 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [],
  [],
  [
  term (2 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (16, 1)]
],
  [
  term (8 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(0, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term (-26 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term (-14 : Rat) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term (26 : Rat) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(4, 1), (16, 1)],
  term (-24 : Rat) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (18 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term (-11 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (19 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (14, 1), (16, 1)],
  term (-5 : Rat) [(5, 2), (16, 1)],
  term (2 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(8, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term (2 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (15, 1), (16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term (-17 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(4, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (7 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(5, 2), (16, 1)],
  term (-2 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(8, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term (17 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(4, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-5 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-11 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (14, 1), (16, 1)],
  term (-7 : Rat) [(5, 2), (16, 1)],
  term (-2 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(8, 1), (16, 1)],
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (16 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(5, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(4, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (11 : Rat) [(5, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 2), (14, 1), (16, 1)],
  term (-5 : Rat) [(5, 2), (16, 1)],
  term (2 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(8, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R009:u=v:R009NYYYNY` as sparse rational polynomial data. -/
def rs_R009_ueqv_R009NYYYNY : Certificate :=
  { generators := rs_R009_ueqv_R009NYYYNY_generators
    coefficients := rs_R009_ueqv_R009NYYYNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R009:u=v:R009NYYYNY`. -/
theorem rs_R009_ueqv_R009NYYYNY_valid : checkCertificate rs_R009_ueqv_R009NYYYNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
