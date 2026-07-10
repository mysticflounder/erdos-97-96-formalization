/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R011:u=v:R011NYY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NYY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R011:u=v:R011NYY`. -/
def rs_R011_ueqv_R011NYY_rules : List Bank.RowZeros.GeneratorRule :=
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
  .ordinaryWRight .s2 .u EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy,
  .ordinary .s2 .u .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .u .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pw .u .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R011:u=v:R011NYY`. -/
def rs_R011_ueqv_R011NYY_generators : List Poly :=
  rs_R011_ueqv_R011NYY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R011:u=v:R011NYY`. -/
def rs_R011_ueqv_R011NYY_coefficients : List Poly :=
[
  [
  term ((-5 : Rat) / 2) [(0, 1), (16, 1)],
  term (-15 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term ((5 : Rat) / 2) [(0, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term ((-5 : Rat) / 2) [(0, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-15 : Rat) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term (15 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-35 : Rat) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (-55 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-185 : Rat) / 2) [(1, 1), (5, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (70 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(4, 1), (16, 1)],
  term (-27 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((105 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (-32 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (15 : Rat) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term (-15 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (35 : Rat) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (-55 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-75 : Rat) / 2) [(1, 1), (5, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(4, 1), (16, 1)],
  term (27 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term (-15 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-15 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (15 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-15 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(15, 2), (16, 1)]
],
  [],
  [
  term (-20 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (20 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-18 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (40 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-130 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (30 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (70 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (78 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-40 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (130 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (35 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-30 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-15 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-78 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-35 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-55 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term (15 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (-15 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (20 : Rat) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-65 : Rat) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term (-35 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (65 : Rat) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((65 : Rat) / 2) [(1, 1), (5, 1), (16, 1)],
  term (-15 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (-15 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-18 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (39 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-39 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-39 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
],
  [
  term (40 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-130 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (30 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (30 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (50 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (78 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(15, 2), (16, 1)]
],
  [],
  [],
  [],
  [],
  [
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(16, 1)]
],
  [
  term (-15 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (-15 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (15 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (-30 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (35 : Rat) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (-75 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((185 : Rat) / 2) [(1, 1), (5, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-35 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-70 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(4, 1), (16, 1)],
  term (51 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term (34 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-15 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(13, 1), (15, 1), (16, 1)]
],
  [
  term (-15 : Rat) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term (15 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-35 : Rat) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (-55 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-145 : Rat) / 2) [(1, 1), (5, 1), (16, 1)],
  term (35 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(4, 1), (16, 1)],
  term (-27 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (-23 : Rat) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(16, 1)]
],
  [
  term (-15 : Rat) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term (15 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-35 : Rat) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (-55 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-185 : Rat) / 2) [(1, 1), (5, 1), (16, 1)],
  term (50 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(4, 1), (16, 1)],
  term (-27 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((105 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (-31 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (15 : Rat) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term (-15 : Rat) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (35 : Rat) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (55 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (-55 : Rat) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((185 : Rat) / 2) [(1, 1), (5, 1), (16, 1)],
  term (-35 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-20 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-55 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(4, 1), (16, 1)],
  term (27 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (31 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R011:u=v:R011NYY` as sparse rational polynomial data. -/
def rs_R011_ueqv_R011NYY : Certificate :=
  { generators := rs_R011_ueqv_R011NYY_generators
    coefficients := rs_R011_ueqv_R011NYY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R011:u=v:R011NYY`. -/
theorem rs_R011_ueqv_R011NYY_valid : checkCertificate rs_R011_ueqv_R011NYY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
