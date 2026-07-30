/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_030

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_030.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_030`. -/
def ep_Q1_030_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .exactV .s3 .Q1 EndpointVar.s3x EndpointVar.s3y EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pw .u .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .s2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q1_030`. -/
def ep_Q1_030_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_030_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_030`. -/
def ep_Q1_030_coefficients : List Poly :=
[
  [],
  [
  term (-72 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term (24 : Rat) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(16, 1)]
],
  [
  term (72 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term (-24 : Rat) [(15, 2), (16, 1)],
  term ((7 : Rat) / 2) [(16, 1)]
],
  [
  term (3 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (36 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (18 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(4, 1), (16, 1)],
  term (-36 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-18 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-26 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term ((-75 : Rat) / 2) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (3 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-36 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (-30 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (36 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-18 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((179 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(14, 1), (16, 1)],
  term ((69 : Rat) / 2) [(15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(16, 1)]
],
  [
  term (-72 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (72 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (37 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (11 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 2) [(14, 1), (16, 1)],
  term (-3 : Rat) [(14, 2), (16, 1)],
  term (39 : Rat) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(16, 1)]
],
  [
  term (6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(4, 1), (16, 1)],
  term (72 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (87 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-29 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (16, 1)],
  term (6 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(14, 1), (16, 1)],
  term (-3 : Rat) [(14, 2), (16, 1)],
  term (47 : Rat) [(15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (72 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-72 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (5 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(14, 1), (16, 1)],
  term (3 : Rat) [(14, 2), (16, 1)],
  term (-27 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(4, 1), (16, 1)],
  term (-87 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (29 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (33 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(14, 1), (16, 1)],
  term (-20 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (35 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-39 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (16, 1)],
  term (12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-26 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-35 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (39 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (16, 1)],
  term (-12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (26 : Rat) [(15, 2), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term (6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-35 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (39 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (16, 1)],
  term (-12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (26 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(14, 1), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (6 : Rat) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (35 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term (48 : Rat) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (9, 2), (16, 1)],
  term (12 : Rat) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(4, 1), (16, 1)],
  term (-6 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 2), (15, 2), (16, 1)],
  term (24 : Rat) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term (-41 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term (-36 : Rat) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term (38 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-215 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (22 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term (7 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term (-22 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (-31 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (29 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (69 : Rat) [(8, 1), (15, 2), (16, 1)],
  term (-10 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (43 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (16, 1)],
  term (-6 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (11 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(14, 1), (16, 1)],
  term (-2 : Rat) [(14, 2), (16, 1)],
  term ((-87 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-41 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (16, 1)],
  term (-12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (86 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (36 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (22 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-69 : Rat) [(15, 2), (16, 1)]
],
  [
  term (3 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-36 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (-30 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (36 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-18 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((35 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term ((69 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (36 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (24 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (36 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (30 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-36 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (18 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (11 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-38 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(14, 1), (16, 1)],
  term ((-117 : Rat) / 2) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (36 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (30 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-36 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (18 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-179 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (11 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (20 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(14, 1), (16, 1)],
  term ((-69 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (3 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-36 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (-30 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (36 : Rat) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-18 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((35 : Rat) / 2) [(5, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (38 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term ((117 : Rat) / 2) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (-72 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-8 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(15, 2), (16, 1)]
],
  [
  term (72 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(14, 1), (16, 1)],
  term ((7 : Rat) / 2) [(16, 1)]
],
  [
  term (-12 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(4, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (95 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-42 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-30 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 2), (16, 1)],
  term (-12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-7 : Rat) [(14, 1), (16, 1)],
  term (23 : Rat) [(15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(16, 1)]
],
  [
  term (-6 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (35 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-39 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (16, 1)],
  term (12 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-26 : Rat) [(15, 2), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [
  term (12 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-98 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (69 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (16, 1)],
  term (5 : Rat) [(14, 1), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_030` as sparse rational polynomial data. -/
def ep_Q1_030 : Certificate :=
  { generators := ep_Q1_030_generators
    coefficients := ep_Q1_030_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_030`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_030_valid : checkCertificate ep_Q1_030 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
