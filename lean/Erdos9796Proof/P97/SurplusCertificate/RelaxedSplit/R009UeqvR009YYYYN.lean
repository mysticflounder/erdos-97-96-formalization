/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYYN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYYYN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R009:u=v:R009YYYYN`. -/
def rs_R009_ueqv_R009YYYYN_rules : List Bank.RowZeros.GeneratorRule :=
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
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R009:u=v:R009YYYYN`. -/
def rs_R009_ueqv_R009YYYYN_generators : List Poly :=
  rs_R009_ueqv_R009YYYYN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R009:u=v:R009YYYYN`. -/
def rs_R009_ueqv_R009YYYYN_coefficients : List Poly :=
[
  [
  term (72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (22 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (18 : Rat) [(15, 2), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term (24 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-21 : Rat) [(0, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (36 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-37 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-30 : Rat) [(6, 1), (16, 1)],
  term (48 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (-22 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (-36 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (78 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term (23 : Rat) [(16, 1)]
],
  [
  term (-24 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (21 : Rat) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(6, 1), (16, 1)],
  term (-72 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term (-15 : Rat) [(16, 1)]
],
  [
  term (-24 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (144 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (21 : Rat) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-36 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (37 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (156 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (30 : Rat) [(6, 1), (16, 1)],
  term (-48 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (22 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (-120 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-78 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term (-23 : Rat) [(16, 1)]
],
  [
  term (-12 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(0, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-28 : Rat) [(6, 1), (16, 1)],
  term (36 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (-14 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (45 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(14, 1), (16, 1)],
  term (87 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term (19 : Rat) [(16, 1)]
],
  [
  term (36 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-41 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-72 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (-14 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (75 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(14, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term (4 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (-48 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-9 : Rat) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (51 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(6, 1), (16, 1)],
  term (78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (72 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term (9 : Rat) [(16, 1)]
],
  [
  term (48 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(0, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-39 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(6, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (-78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (36 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term (-9 : Rat) [(16, 1)]
],
  [
  term (-72 : Rat) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term (72 : Rat) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (144 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (-144 : Rat) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (82 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(2, 1), (15, 4), (16, 1)],
  term (72 : Rat) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-82 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (144 : Rat) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term (-144 : Rat) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term (-144 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (48 : Rat) [(10, 1), (15, 4), (16, 1)],
  term (144 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (41 : Rat) [(15, 2), (16, 1)],
  term (-12 : Rat) [(15, 4), (16, 1)]
],
  [
  term (-72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-72 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (144 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (82 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (144 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-144 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term (72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (16 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(15, 2), (16, 1)]
],
  [
  term (2 : Rat) [(16, 1)]
],
  [],
  [
  term (-24 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(15, 2), (16, 1)]
],
  [
  term (12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term (-12 : Rat) [(0, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(16, 1)]
],
  [
  term (-72 : Rat) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-108 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-21 : Rat) [(0, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (36 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (78 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term (-37 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-120 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-30 : Rat) [(6, 1), (16, 1)],
  term (48 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (-22 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term (78 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term (78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (81 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (78 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term (23 : Rat) [(16, 1)]
],
  [
  term (72 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (72 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 3), (16, 1)]
],
  [],
  [
  term (-48 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-9 : Rat) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (39 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(6, 1), (16, 1)],
  term (-72 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)]
],
  [
  term (-72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (-144 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-144 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (144 : Rat) [(15, 2), (16, 1)],
  term (-48 : Rat) [(15, 4), (16, 1)]
],
  [],
  [
  term (12 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (72 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (28 : Rat) [(6, 1), (16, 1)],
  term (-36 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (14 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-45 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(14, 1), (16, 1)],
  term (-87 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term (-19 : Rat) [(16, 1)]
],
  [],
  [
  term (36 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-41 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-72 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(6, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (-14 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (81 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(14, 1), (16, 1)],
  term (-9 : Rat) [(15, 2), (16, 1)],
  term (10 : Rat) [(16, 1)]
],
  [
  term (-12 : Rat) [(3, 1), (15, 1), (16, 1)]
],
  [
  term (-2 : Rat) [(16, 1)]
],
  [
  term (-36 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (41 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (72 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (10 : Rat) [(6, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (11, 1), (16, 1)],
  term (14 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-81 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(14, 1), (16, 1)],
  term (9 : Rat) [(15, 2), (16, 1)],
  term (-10 : Rat) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R009:u=v:R009YYYYN` as sparse rational polynomial data. -/
def rs_R009_ueqv_R009YYYYN : Certificate :=
  { generators := rs_R009_ueqv_R009YYYYN_generators
    coefficients := rs_R009_ueqv_R009YYYYN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R009:u=v:R009YYYYN`. -/
theorem rs_R009_ueqv_R009YYYYN_valid : checkCertificate rs_R009_ueqv_R009YYYYN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
