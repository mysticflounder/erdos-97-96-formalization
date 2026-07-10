/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R011:u=v:R011YYN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YYN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R011:u=v:R011YYN`. -/
def rs_R011_ueqv_R011YYN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactW .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pw .u .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s3 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R011:u=v:R011YYN`. -/
def rs_R011_ueqv_R011YYN_generators : List Poly :=
  rs_R011_ueqv_R011YYN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R011:u=v:R011YYN`. -/
def rs_R011_ueqv_R011YYN_coefficients : List Poly :=
[
  [
  term ((-3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(11, 2), (16, 1)],
  term ((18 : Rat) / 7) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(16, 1)]
],
  [
  term ((-18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term ((18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (16, 1)],
  term ((13 : Rat) / 4) [(16, 1)]
],
  [
  term ((75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (11, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(8, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(8, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(10, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(11, 2), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term ((24 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((-33 : Rat) / 7) [(4, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-27 : Rat) / 14) [(5, 1), (11, 1), (16, 1)],
  term ((33 : Rat) / 7) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(5, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (11, 2), (16, 1)],
  term ((36 : Rat) / 7) [(8, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term ((46 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term ((-75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-39 : Rat) / 7) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((33 : Rat) / 7) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term ((36 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9 : Rat) / 14) [(5, 1), (11, 1), (16, 1)],
  term ((-33 : Rat) / 7) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 14) [(5, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 2) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term ((-24 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-51 : Rat) / 7) [(15, 2), (16, 1)]
],
  [
  term ((-75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (11, 2), (16, 1)],
  term ((36 : Rat) / 7) [(8, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-174 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(10, 1), (16, 1)],
  term (5 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 2), (16, 1)],
  term (5 : Rat) [(15, 2), (16, 1)],
  term ((-17 : Rat) / 4) [(16, 1)]
],
  [
  term ((75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (11, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(8, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(8, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((174 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(10, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term ((-131 : Rat) / 7) [(11, 2), (16, 1)],
  term ((16 : Rat) / 7) [(15, 2), (16, 1)],
  term ((17 : Rat) / 4) [(16, 1)]
],
  [],
  [],
  [],
  [
  term ((18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 7) [(11, 2), (16, 1)],
  term ((51 : Rat) / 7) [(15, 2), (16, 1)]
],
  [
  term ((-18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term ((-3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-33 : Rat) / 7) [(15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term ((24 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((9 : Rat) / 7) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 7) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 14) [(5, 1), (11, 1), (16, 1)],
  term ((-9 : Rat) / 14) [(5, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(8, 1), (11, 2), (16, 1)]
],
  [
  term ((-18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-54 : Rat) / 7) [(15, 2), (16, 1)]
],
  [
  term ((36 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(11, 2), (16, 1)]
],
  [
  term ((-18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term ((18 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((-39 : Rat) / 7) [(11, 2), (16, 1)],
  term ((18 : Rat) / 7) [(15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term ((-75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((45 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (11, 2), (16, 1)],
  term ((36 : Rat) / 7) [(8, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-10 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(10, 1), (16, 1)],
  term ((-200 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(11, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(15, 2), (16, 1)],
  term ((-15 : Rat) / 4) [(16, 1)]
],
  [
  term ((-6 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 2), (16, 1)],
  term ((36 : Rat) / 7) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term ((-36 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(5, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(11, 2), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(16, 1)]
],
  [
  term ((-24 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-39 : Rat) / 7) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((33 : Rat) / 7) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term ((36 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((27 : Rat) / 14) [(5, 1), (11, 1), (16, 1)],
  term ((-33 : Rat) / 7) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 14) [(5, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (11, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(8, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(8, 1), (16, 1)],
  term ((48 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((11 : Rat) / 7) [(15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term ((75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((-33 : Rat) / 7) [(4, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((45 : Rat) / 14) [(5, 1), (11, 1), (16, 1)],
  term ((33 : Rat) / 7) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 14) [(5, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(10, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term ((-85 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((5 : Rat) / 7) [(15, 2), (16, 1)],
  term ((11 : Rat) / 4) [(16, 1)]
],
  [
  term ((75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((-33 : Rat) / 7) [(4, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((45 : Rat) / 14) [(5, 1), (11, 1), (16, 1)],
  term ((33 : Rat) / 7) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 14) [(5, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(10, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((26 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((5 : Rat) / 7) [(15, 2), (16, 1)],
  term ((11 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term ((-75 : Rat) / 7) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-51 : Rat) / 7) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-39 : Rat) / 7) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((33 : Rat) / 7) [(4, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (16, 1)],
  term ((36 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-45 : Rat) / 14) [(5, 1), (11, 1), (16, 1)],
  term ((-33 : Rat) / 7) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 14) [(5, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(7, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(9, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 2) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((25 : Rat) / 7) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term ((85 : Rat) / 7) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(15, 2), (16, 1)],
  term ((-11 : Rat) / 4) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R011:u=v:R011YYN` as sparse rational polynomial data. -/
def rs_R011_ueqv_R011YYN : Certificate :=
  { generators := rs_R011_ueqv_R011YYN_generators
    coefficients := rs_R011_ueqv_R011YYN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R011:u=v:R011YYN`. -/
theorem rs_R011_ueqv_R011YYN_valid : checkCertificate rs_R011_ueqv_R011YYN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
