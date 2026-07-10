/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R007:u=v:R007NN

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007NN.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R007:u=v:R007NN`. -/
def rs_R007_ueqv_R007NN_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .exactW .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinaryWLeft .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pw .u .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q2 .u .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R007:u=v:R007NN`. -/
def rs_R007_ueqv_R007NN_generators : List Poly :=
  rs_R007_ueqv_R007NN_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R007:u=v:R007NN`. -/
def rs_R007_ueqv_R007NN_coefficients : List Poly :=
[
  [],
  [
  term (-2 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-31 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((25 : Rat) / 3) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((28 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((31 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-25 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((25 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((20 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(13, 2), (16, 1)],
  term ((8 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-19 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(1, 1), (11, 1), (16, 1)],
  term ((64 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-46 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 3) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((-40 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((26 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((28 : Rat) / 3) [(15, 2), (16, 1)],
  term ((7 : Rat) / 3) [(16, 1)]
],
  [
  term ((-2 : Rat) / 3) [(0, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (11, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [
  term (-8 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-16 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((50 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-56 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(16, 1)]
],
  [],
  [],
  [],
  [
  term (8 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (15, 1), (16, 1)]
],
  [],
  [
  term (-8 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (15, 1), (16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((25 : Rat) / 3) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term (-8 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (15, 1), (16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((28 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((31 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-25 : Rat) / 3) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((28 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((31 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-25 : Rat) / 3) [(15, 2), (16, 1)],
  term (-3 : Rat) [(16, 1)]
],
  [],
  [
  term (-2 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-31 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((25 : Rat) / 3) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term (8 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)]
],
  [],
  [
  term (-8 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (16 : Rat) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (10, 1), (16, 1)],
  term ((8 : Rat) / 3) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-50 : Rat) / 3) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 3) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((26 : Rat) / 3) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((10 : Rat) / 3) [(0, 1), (13, 2), (16, 1)],
  term ((56 : Rat) / 3) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 3) [(0, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((44 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-52 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term (5 : Rat) [(1, 1), (13, 1), (16, 1)],
  term ((-52 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 3) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44 : Rat) / 3) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (13, 2), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(10, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 3) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((38 : Rat) / 3) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term (16 : Rat) [(11, 1), (13, 1), (16, 1)],
  term ((34 : Rat) / 3) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((46 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22 : Rat) / 3) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(12, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-47 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 3) [(13, 2), (14, 2), (16, 1)],
  term ((-26 : Rat) / 3) [(13, 2), (16, 1)],
  term (-8 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-19 : Rat) / 3) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(16, 1)]
],
  [
  term ((-2 : Rat) / 3) [(0, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((44 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((32 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((2 : Rat) / 3) [(0, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (11, 1), (16, 1)],
  term ((56 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (13, 1), (16, 1)],
  term ((56 : Rat) / 3) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-50 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 3) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(13, 2), (14, 1), (16, 1)],
  term ((38 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(16, 1)]
],
  [],
  [],
  [
  term ((4 : Rat) / 3) [(11, 1), (13, 1), (16, 1)],
  term ((4 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(13, 2), (16, 1)],
  term ((28 : Rat) / 3) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R007:u=v:R007NN` as sparse rational polynomial data. -/
def rs_R007_ueqv_R007NN : Certificate :=
  { generators := rs_R007_ueqv_R007NN_generators
    coefficients := rs_R007_ueqv_R007NN_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R007:u=v:R007NN`. -/
theorem rs_R007_ueqv_R007NN_valid : checkCertificate rs_R007_ueqv_R007NN = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
