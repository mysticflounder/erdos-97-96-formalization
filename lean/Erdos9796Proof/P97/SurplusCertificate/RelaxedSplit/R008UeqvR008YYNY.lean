/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R008:u=v:R008YYNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YYNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R008:u=v:R008YYNY`. -/
def rs_R008_ueqv_R008YYNY_rules : List Bank.RowZeros.GeneratorRule :=
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
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R008:u=v:R008YYNY`. -/
def rs_R008_ueqv_R008YYNY_generators : List Poly :=
  rs_R008_ueqv_R008YYNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R008:u=v:R008YYNY`. -/
def rs_R008_ueqv_R008YYNY_coefficients : List Poly :=
[
  [
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (-24 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (48 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (16, 1)],
  term (-32 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((-25 : Rat) / 4) [(16, 1)]
],
  [
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(16, 1)]
],
  [
  term (-48 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (48 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(10, 1), (16, 1)],
  term (-36 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(14, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term (48 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(14, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (-8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (-48 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (16, 1)],
  term (-8 : Rat) [(10, 1), (16, 1)],
  term (32 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((25 : Rat) / 4) [(16, 1)]
],
  [
  term (8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (-48 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (16, 1)],
  term (32 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((-25 : Rat) / 4) [(16, 1)]
],
  [
  term (48 : Rat) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term (-32 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-96 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (64 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term (-64 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (-48 : Rat) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (15, 1), (16, 1)]
],
  [
  term (-96 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (64 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (-32 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-12 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(10, 1), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [],
  [
  term (-8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [
  term (-12 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(15, 2), (16, 1)]
],
  [
  term (12 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [],
  [
  term (-8 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (11, 1), (16, 1)]
],
  [
  term (8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (11, 1), (16, 1)]
],
  [],
  [
  term (24 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (-48 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(6, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(10, 1), (16, 1)],
  term (32 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(15, 2), (16, 1)],
  term ((57 : Rat) / 4) [(16, 1)]
],
  [
  term (-8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)]
],
  [
  term (16 : Rat) [(1, 1), (11, 1), (16, 1)]
],
  [
  term (48 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (-48 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (16, 1)],
  term (36 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [],
  [
  term (8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(14, 1), (16, 1)],
  term (9 : Rat) [(15, 2), (16, 1)],
  term ((-13 : Rat) / 4) [(16, 1)]
],
  [
  term (8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (-32 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(10, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(16, 1)]
],
  [
  term (12 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(14, 1), (16, 1)],
  term (-9 : Rat) [(15, 2), (16, 1)],
  term ((13 : Rat) / 4) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R008:u=v:R008YYNY` as sparse rational polynomial data. -/
def rs_R008_ueqv_R008YYNY : Certificate :=
  { generators := rs_R008_ueqv_R008YYNY_generators
    coefficients := rs_R008_ueqv_R008YYNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R008:u=v:R008YYNY`. -/
theorem rs_R008_ueqv_R008YYNY_valid : checkCertificate rs_R008_ueqv_R008YYNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
