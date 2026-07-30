/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q2_043

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q2_043.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_043`. -/
def ep_Q2_043_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactV .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s1 .u .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pw .u .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Q2 EndpointVar.q2x,
  .ordinaryVLeft .Q2 .Pu EndpointVar.q2x EndpointVar.q2y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q2_043`. -/
def ep_Q2_043_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_043_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q2_043`. -/
def ep_Q2_043_coefficients : List Poly :=
[
  [],
  [
  term ((21 : Rat) / 8) [],
  term (9 : Rat) [(7, 1), (9, 1)],
  term (12 : Rat) [(7, 1), (13, 1)],
  term (-18 : Rat) [(7, 1), (15, 1)],
  term ((-9 : Rat) / 2) [(8, 1)],
  term ((9 : Rat) / 2) [(15, 2)]
],
  [
  term ((-21 : Rat) / 8) [],
  term (-9 : Rat) [(7, 1), (9, 1)],
  term (-12 : Rat) [(7, 1), (13, 1)],
  term (18 : Rat) [(7, 1), (15, 1)],
  term ((9 : Rat) / 2) [(8, 1)],
  term ((-9 : Rat) / 2) [(15, 2)]
],
  [
  term ((27 : Rat) / 8) [],
  term (-9 : Rat) [(7, 1), (9, 1)],
  term ((-9 : Rat) / 2) [(8, 1)],
  term (18 : Rat) [(9, 1), (13, 1)],
  term ((-9 : Rat) / 2) [(15, 2)]
],
  [],
  [
  term ((-5 : Rat) / 4) [],
  term (24 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (-4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (7, 1)],
  term (-2 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-24 : Rat) [(5, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (15 : Rat) [(7, 1), (9, 1)],
  term (-30 : Rat) [(7, 1), (13, 1)],
  term (6 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (15, 1)],
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(8, 1), (9, 1), (13, 1)],
  term (24 : Rat) [(8, 1), (13, 1), (15, 1)],
  term (-42 : Rat) [(9, 1), (13, 1)],
  term (24 : Rat) [(9, 1), (15, 1)],
  term (-27 : Rat) [(9, 2)],
  term (6 : Rat) [(13, 1), (15, 1)],
  term (9 : Rat) [(15, 2)]
],
  [
  term ((1 : Rat) / 2) [],
  term (24 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (-4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (7, 1)],
  term (2 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (-3 : Rat) [(7, 1), (9, 1)],
  term (6 : Rat) [(7, 1), (13, 1)],
  term (-6 : Rat) [(7, 1), (15, 1)],
  term (18 : Rat) [(8, 1), (9, 1), (13, 1)],
  term (24 : Rat) [(8, 1), (13, 1), (15, 1)],
  term (-12 : Rat) [(9, 1), (15, 1)],
  term (-9 : Rat) [(9, 2)],
  term (6 : Rat) [(13, 1), (15, 1)]
],
  [
  term ((-13 : Rat) / 16) [],
  term (-24 : Rat) [(4, 1), (5, 1), (7, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (7, 1), (9, 1)],
  term (-12 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (-18 : Rat) [(4, 1), (9, 2)],
  term (12 : Rat) [(4, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(5, 1), (7, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (12, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (-6 : Rat) [(5, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (-18 : Rat) [(7, 1), (8, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (9, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (12, 1)],
  term (-4 : Rat) [(7, 1), (12, 1), (15, 1)],
  term (2 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (15, 1)],
  term ((3 : Rat) / 2) [(8, 1)],
  term (-24 : Rat) [(8, 1), (13, 1), (15, 1)],
  term (-9 : Rat) [(8, 2)],
  term (18 : Rat) [(9, 1), (12, 1), (15, 1)],
  term (3 : Rat) [(9, 1), (13, 1)],
  term (21 : Rat) [(9, 1), (15, 1)],
  term (-1 : Rat) [(12, 1), (15, 2)],
  term ((1 : Rat) / 2) [(13, 1), (15, 1)],
  term ((11 : Rat) / 4) [(15, 2)]
],
  [
  term ((5 : Rat) / 16) [],
  term (24 : Rat) [(4, 1), (5, 1), (7, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (7, 1), (9, 1)],
  term (-12 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (24 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (18 : Rat) [(4, 1), (9, 2)],
  term (-12 : Rat) [(4, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(5, 1), (7, 1)],
  term (-12 : Rat) [(5, 1), (7, 1), (12, 1)],
  term (4 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (6 : Rat) [(5, 1), (15, 1)],
  term (-12 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (18 : Rat) [(7, 1), (8, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (9, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (12, 1)],
  term (4 : Rat) [(7, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (13, 1)],
  term (1 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(8, 1)],
  term (-18 : Rat) [(8, 1), (9, 1), (13, 1)],
  term (9 : Rat) [(8, 2)],
  term (-18 : Rat) [(9, 1), (12, 1), (15, 1)],
  term (-3 : Rat) [(9, 1), (13, 1)],
  term (-9 : Rat) [(9, 1), (15, 1)],
  term (9 : Rat) [(9, 2)],
  term (1 : Rat) [(12, 1), (15, 2)],
  term ((-13 : Rat) / 2) [(13, 1), (15, 1)],
  term ((-11 : Rat) / 4) [(15, 2)]
],
  [],
  [],
  [],
  [
  term ((-21 : Rat) / 8) [],
  term (4 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (15, 1)],
  term (-9 : Rat) [(7, 1), (9, 1)],
  term (-12 : Rat) [(7, 1), (13, 1)],
  term (2 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(7, 1), (15, 1)],
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(8, 1)],
  term (24 : Rat) [(9, 1), (13, 1)],
  term (-36 : Rat) [(9, 1), (15, 1)],
  term (18 : Rat) [(9, 2)],
  term ((-9 : Rat) / 2) [(15, 2)]
],
  [
  term (-6 : Rat) [(7, 1), (13, 1)],
  term (-18 : Rat) [(9, 1), (13, 1)],
  term (-24 : Rat) [(13, 1), (15, 1)]
],
  [
  term (24 : Rat) [(5, 1), (7, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (9, 1)],
  term (12 : Rat) [(7, 1), (13, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (15, 1)],
  term (18 : Rat) [(9, 2)],
  term (-12 : Rat) [(13, 1), (15, 1)]
],
  [
  term (1 : Rat) [(4, 1)],
  term (-12 : Rat) [(4, 1), (7, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (6 : Rat) [(5, 1), (15, 1)],
  term (12 : Rat) [(6, 1), (9, 1), (13, 1)],
  term (-18 : Rat) [(6, 1), (9, 1), (15, 1)],
  term (9 : Rat) [(6, 1), (9, 2)],
  term (-9 : Rat) [(7, 1), (8, 1), (9, 1)],
  term (-12 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (18 : Rat) [(7, 1), (8, 1), (15, 1)],
  term ((-21 : Rat) / 8) [(8, 1)],
  term ((-9 : Rat) / 2) [(8, 1), (15, 2)],
  term ((9 : Rat) / 2) [(8, 2)],
  term (6 : Rat) [(9, 1), (13, 1)],
  term (-9 : Rat) [(9, 1), (15, 1)],
  term ((9 : Rat) / 2) [(9, 2)]
],
  [
  term (4 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)]
],
  [
  term ((13 : Rat) / 8) [],
  term (-4 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-24 : Rat) [(5, 1), (15, 1)],
  term (9 : Rat) [(7, 1), (9, 1)],
  term (12 : Rat) [(7, 1), (13, 1)],
  term (-2 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (15, 1)],
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(8, 1)],
  term (-24 : Rat) [(9, 1), (13, 1)],
  term (36 : Rat) [(9, 1), (15, 1)],
  term (-18 : Rat) [(9, 2)],
  term ((9 : Rat) / 2) [(15, 2)]
],
  [],
  [
  term ((21 : Rat) / 8) [],
  term (9 : Rat) [(7, 1), (9, 1)],
  term (12 : Rat) [(7, 1), (13, 1)],
  term (-18 : Rat) [(7, 1), (15, 1)],
  term ((-9 : Rat) / 2) [(8, 1)],
  term ((9 : Rat) / 2) [(15, 2)]
],
  [
  term ((-21 : Rat) / 8) [],
  term (-9 : Rat) [(7, 1), (9, 1)],
  term (-12 : Rat) [(7, 1), (13, 1)],
  term (18 : Rat) [(7, 1), (15, 1)],
  term ((9 : Rat) / 2) [(8, 1)],
  term ((-9 : Rat) / 2) [(15, 2)]
],
  [],
  [],
  [
  term ((21 : Rat) / 8) [],
  term (9 : Rat) [(7, 1), (9, 1)],
  term (12 : Rat) [(7, 1), (13, 1)],
  term (-18 : Rat) [(7, 1), (15, 1)],
  term ((-9 : Rat) / 2) [(8, 1)],
  term ((9 : Rat) / 2) [(15, 2)]
],
  [
  term ((11 : Rat) / 16) [],
  term (24 : Rat) [(4, 1), (5, 1), (7, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (7, 1), (9, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (-4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (18 : Rat) [(4, 1), (9, 2)],
  term (-12 : Rat) [(4, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(5, 1), (7, 1)],
  term (-12 : Rat) [(5, 1), (7, 1), (12, 1)],
  term (4 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (-18 : Rat) [(5, 1), (15, 1)],
  term (-6 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (18 : Rat) [(7, 1), (8, 1), (15, 1)],
  term (-6 : Rat) [(7, 1), (9, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (12, 1)],
  term (4 : Rat) [(7, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1)],
  term (3 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-14 : Rat) [(7, 1), (15, 1)],
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(8, 1)],
  term (24 : Rat) [(8, 1), (13, 1), (15, 1)],
  term (9 : Rat) [(8, 2)],
  term (-18 : Rat) [(9, 1), (12, 1), (15, 1)],
  term (3 : Rat) [(9, 1), (13, 1)],
  term (15 : Rat) [(9, 1), (15, 1)],
  term (-18 : Rat) [(9, 2)],
  term (1 : Rat) [(12, 1), (15, 2)],
  term ((-23 : Rat) / 2) [(13, 1), (15, 1)],
  term ((7 : Rat) / 4) [(15, 2)]
],
  [
  term ((-3 : Rat) / 2) [],
  term (-6 : Rat) [(7, 1), (13, 1)],
  term (18 : Rat) [(7, 1), (15, 1)],
  term (9 : Rat) [(8, 1)],
  term (24 : Rat) [(13, 1), (15, 1)]
],
  [
  term ((-29 : Rat) / 16) [],
  term (-24 : Rat) [(4, 1), (5, 1), (7, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (7, 1), (9, 1)],
  term (-12 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (-18 : Rat) [(4, 1), (9, 2)],
  term (12 : Rat) [(4, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(5, 1), (7, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (12, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (18 : Rat) [(5, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (-18 : Rat) [(7, 1), (8, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (9, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (12, 1)],
  term (-4 : Rat) [(7, 1), (12, 1), (15, 1)],
  term (2 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (13, 1)],
  term (-3 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (14 : Rat) [(7, 1), (15, 1)],
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(8, 1)],
  term (-24 : Rat) [(8, 1), (13, 1), (15, 1)],
  term (-9 : Rat) [(8, 2)],
  term (18 : Rat) [(9, 1), (12, 1), (15, 1)],
  term (-3 : Rat) [(9, 1), (13, 1)],
  term (-15 : Rat) [(9, 1), (15, 1)],
  term (18 : Rat) [(9, 2)],
  term (-1 : Rat) [(12, 1), (15, 2)],
  term ((-25 : Rat) / 2) [(13, 1), (15, 1)],
  term ((-25 : Rat) / 4) [(15, 2)]
],
  [
  term (-1 : Rat) [],
  term (-24 : Rat) [(4, 1), (5, 1), (7, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (7, 1), (9, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (-24 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (-18 : Rat) [(4, 1), (9, 2)],
  term (12 : Rat) [(4, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(5, 1), (7, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (12, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (-6 : Rat) [(5, 1), (15, 1)],
  term (12 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (-18 : Rat) [(7, 1), (8, 1), (15, 1)],
  term ((21 : Rat) / 4) [(7, 1), (9, 1)],
  term (12 : Rat) [(7, 1), (9, 1), (12, 1)],
  term ((9 : Rat) / 2) [(7, 1), (9, 1), (14, 1)],
  term (4 : Rat) [(7, 1), (12, 1), (13, 1)],
  term (-2 : Rat) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(7, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(7, 1), (13, 1)],
  term (-20 : Rat) [(7, 1), (13, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term ((21 : Rat) / 8) [(8, 1)],
  term (18 : Rat) [(8, 1), (9, 1), (13, 1)],
  term ((9 : Rat) / 4) [(8, 1), (14, 1)],
  term (-9 : Rat) [(8, 2)],
  term (6 : Rat) [(9, 1), (12, 1), (13, 1)],
  term (42 : Rat) [(9, 1), (12, 1), (15, 1)],
  term (-9 : Rat) [(9, 1), (13, 1)],
  term (-24 : Rat) [(9, 1), (13, 1), (14, 1)],
  term (9 : Rat) [(9, 1), (15, 1)],
  term (-9 : Rat) [(9, 2)],
  term ((-13 : Rat) / 8) [(12, 1)],
  term (1 : Rat) [(12, 1), (13, 1), (15, 1)],
  term ((11 : Rat) / 2) [(12, 1), (15, 2)],
  term ((-13 : Rat) / 2) [(13, 1), (14, 1), (15, 1)],
  term ((13 : Rat) / 4) [(13, 1), (15, 1)],
  term ((-11 : Rat) / 8) [(14, 1)],
  term ((11 : Rat) / 4) [(15, 2)]
],
  [],
  [
  term ((55 : Rat) / 16) [],
  term (24 : Rat) [(4, 1), (5, 1), (7, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (7, 1), (9, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (13, 1)],
  term (-4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (9, 1), (15, 1)],
  term (18 : Rat) [(4, 1), (9, 2)],
  term (-12 : Rat) [(4, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(5, 1), (7, 1)],
  term (-12 : Rat) [(5, 1), (7, 1), (12, 1)],
  term (4 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (7, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (-18 : Rat) [(5, 1), (15, 1)],
  term (-6 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (18 : Rat) [(7, 1), (8, 1), (15, 1)],
  term (-15 : Rat) [(7, 1), (9, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (12, 1)],
  term (4 : Rat) [(7, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (13, 1)],
  term (5 : Rat) [(7, 1), (13, 1), (16, 1)],
  term (-34 : Rat) [(7, 1), (15, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(8, 1)],
  term (24 : Rat) [(8, 1), (13, 1), (15, 1)],
  term (9 : Rat) [(8, 2)],
  term (-18 : Rat) [(9, 1), (12, 1), (15, 1)],
  term (-3 : Rat) [(9, 1), (13, 1)],
  term (-9 : Rat) [(9, 1), (15, 1)],
  term (-18 : Rat) [(9, 2)],
  term (1 : Rat) [(12, 1), (15, 2)],
  term ((23 : Rat) / 2) [(13, 1), (15, 1)],
  term ((-1 : Rat) / 4) [(15, 2)]
],
  [
  term (4 : Rat) [(5, 1), (7, 1)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-2 : Rat) [(7, 1), (15, 1)]
]
]

/-- Endpoint certificate `ep_Q2_043` as sparse rational polynomial data. -/
def ep_Q2_043 : Certificate :=
  { generators := ep_Q2_043_generators
    coefficients := ep_Q2_043_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q2_043`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q2_043_valid : checkCertificate ep_Q2_043 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
