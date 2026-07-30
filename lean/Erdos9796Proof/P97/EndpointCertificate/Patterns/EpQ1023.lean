/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_023

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_023.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_023`. -/
def ep_Q1_023_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .Pw EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .exactV .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .s2 .u EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy,
  .ordinary .s2 .u .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s2 .u .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .Pu EndpointVar.pux,
  .ordinaryVLeft .Pu .Pw EndpointVar.pux EndpointVar.puy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pu .Q2 EndpointVar.pux EndpointVar.puy EndpointVar.q2x EndpointVar.q2y,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q1_023`. -/
def ep_Q1_023_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_023_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_023`. -/
def ep_Q1_023_coefficients : List Poly :=
[
  [
  term ((-5 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (1 : Rat) [(12, 1), (16, 1)],
  term ((7 : Rat) / 2) [(14, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term ((-13 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term ((5 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-1 : Rat) [(12, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(14, 1), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term ((13 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 2) [(11, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(12, 1), (16, 1)],
  term (24 : Rat) [(13, 1), (15, 3), (16, 1)],
  term ((-7 : Rat) / 4) [(14, 1), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term ((1 : Rat) / 8) [(3, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-5 : Rat) / 8) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 4) [(12, 1), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 4) [(14, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [],
  [
  term ((1 : Rat) / 8) [(3, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-5 : Rat) / 8) [(11, 1), (13, 1), (16, 1)],
  term ((13 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 4) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term ((-1 : Rat) / 8) [(3, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((5 : Rat) / 8) [(11, 1), (13, 1), (16, 1)],
  term ((-13 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((-3 : Rat) / 4) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(14, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(16, 1)]
],
  [
  term ((-5 : Rat) / 4) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1 : Rat) / 4) [(2, 1), (13, 2), (16, 1)],
  term (-3 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(2, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 4) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 4) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 4) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term (-48 : Rat) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(6, 1), (15, 4), (16, 1)],
  term (48 : Rat) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((5 : Rat) / 2) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 4) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(12, 1), (15, 4), (16, 1)],
  term (8 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5 : Rat) / 8) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (-2 : Rat) [(13, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(13, 2), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term ((5 : Rat) / 4) [(14, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)],
  term (6 : Rat) [(15, 4), (16, 1)]
],
  [
  term ((-1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-1 : Rat) / 2) [(11, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((-3 : Rat) / 4) [(12, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(13, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(14, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((-1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-48 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-5 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)]
],
  [],
  [
  term ((1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 2) [(11, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 4) [(12, 1), (16, 1)],
  term ((11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(13, 2), (16, 1)],
  term ((5 : Rat) / 4) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term ((-1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-7 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 4) [(12, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(13, 2), (16, 1)],
  term ((9 : Rat) / 4) [(14, 1), (16, 1)],
  term (14 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term ((-9 : Rat) / 4) [(16, 1)]
],
  [
  term ((-1 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term ((1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)]
],
  [
  term ((-1 : Rat) / 8) [(3, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 8) [(11, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term ((11 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((7 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((-1 : Rat) / 4) [(12, 1), (16, 1)],
  term ((11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(13, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(14, 1), (16, 1)],
  term (-14 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term ((9 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term ((-1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-7 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((1 : Rat) / 4) [(12, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(13, 2), (16, 1)],
  term ((9 : Rat) / 4) [(14, 1), (16, 1)],
  term (14 : Rat) [(15, 2), (16, 1)],
  term (24 : Rat) [(15, 4), (16, 1)],
  term ((-9 : Rat) / 4) [(16, 1)]
],
  [
  term ((-1 : Rat) / 4) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-5 : Rat) / 2) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(6, 1), (15, 4), (16, 1)],
  term (-24 : Rat) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-11 : Rat) / 4) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((5 : Rat) / 4) [(10, 1), (13, 2), (16, 1)],
  term (6 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(10, 1), (15, 4), (16, 1)],
  term ((-5 : Rat) / 4) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 4) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((19 : Rat) / 4) [(12, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(12, 1), (15, 4), (16, 1)],
  term ((-1 : Rat) / 4) [(12, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11 : Rat) / 8) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 3), (16, 1)],
  term ((5 : Rat) / 8) [(13, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(14, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(14, 2), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term (-6 : Rat) [(15, 4), (16, 1)]
],
  [
  term ((1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term ((11 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((7 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((-1 : Rat) / 4) [(12, 1), (16, 1)],
  term ((11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(13, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(14, 1), (16, 1)],
  term (-14 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term ((9 : Rat) / 4) [(16, 1)]
],
  [
  term ((1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-3 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((-17 : Rat) / 4) [(12, 1), (16, 1)],
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(13, 1), (15, 3), (16, 1)],
  term ((11 : Rat) / 4) [(14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(16, 1)]
],
  [],
  [
  term ((5 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term (-24 : Rat) [(15, 4), (16, 1)],
  term ((1 : Rat) / 4) [(16, 1)]
],
  [
  term (-1 : Rat) [(12, 1), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term (3 : Rat) [(16, 1)]
],
  [
  term ((1 : Rat) / 8) [(3, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 8) [(11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 4) [(12, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (16, 1)],
  term (6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 4) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)]
],
  [
  term ((-1 : Rat) / 4) [(3, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-1 : Rat) / 4) [(11, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 3), (16, 1)],
  term ((-3 : Rat) / 4) [(12, 1), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(13, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(14, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((1 : Rat) / 8) [(3, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (15, 3), (16, 1)],
  term ((-1 : Rat) / 8) [(11, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_023` as sparse rational polynomial data. -/
def ep_Q1_023 : Certificate :=
  { generators := ep_Q1_023_generators
    coefficients := ep_Q1_023_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_023`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_023_valid : checkCertificate ep_Q1_023 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
