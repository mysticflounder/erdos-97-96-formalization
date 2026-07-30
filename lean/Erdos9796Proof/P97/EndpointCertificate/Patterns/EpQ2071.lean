/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q2_071

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q2_071.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_071`. -/
def ep_Q2_071_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinaryWLeft .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactV .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactV .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWLeft .s2 .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s2 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s3 .u .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinary .Q2 .u .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Q2 .u .Pu EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q2_071`. -/
def ep_Q2_071_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_071_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q2_071`. -/
def ep_Q2_071_coefficients : List Poly :=
[
  [
  term (24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-14 : Rat) [(10, 1), (16, 1)],
  term (-24 : Rat) [(10, 2), (16, 1)],
  term (14 : Rat) [(14, 1), (16, 1)]
],
  [],
  [],
  [
  term (10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (10, 2), (16, 1)],
  term (14 : Rat) [(0, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (72 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (-32 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-31 : Rat) [(10, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(10, 2), (16, 1)],
  term (24 : Rat) [(10, 3), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term (-22 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term (-9 : Rat) [(16, 1)]
],
  [
  term (-48 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (16 : Rat) [(3, 2), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term (-8 : Rat) [(16, 1)]
],
  [
  term (-10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (10, 2), (16, 1)],
  term (-14 : Rat) [(0, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (-7 : Rat) [(2, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-10 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (16, 1)],
  term (40 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (23 : Rat) [(10, 1), (16, 1)],
  term (8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(10, 2), (16, 1)],
  term (-24 : Rat) [(10, 3), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term (18 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(14, 1), (16, 1)],
  term (16 : Rat) [(16, 1)]
],
  [
  term (-10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (10, 2), (16, 1)],
  term (-14 : Rat) [(0, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(2, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-72 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-30 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (32 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (15 : Rat) [(10, 1), (16, 1)],
  term (8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(10, 2), (16, 1)],
  term (-24 : Rat) [(10, 3), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term (22 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (48 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(11, 2), (16, 1)],
  term (-8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (10, 2), (16, 1)],
  term (14 : Rat) [(0, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (-32 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-13 : Rat) [(10, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (18 : Rat) [(10, 2), (16, 1)],
  term (24 : Rat) [(10, 3), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(11, 2), (16, 1)],
  term (-14 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(14, 1), (16, 1)],
  term (-7 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [],
  [
  term (-48 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 2), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(15, 2), (16, 1)]
],
  [
  term (24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (24 : Rat) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (10, 2), (16, 1)],
  term (14 : Rat) [(0, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(2, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (72 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (-32 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-15 : Rat) [(10, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(10, 2), (16, 1)],
  term (24 : Rat) [(10, 3), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term (-22 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)]
],
  [
  term (-24 : Rat) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(2, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (10, 2), (16, 1)],
  term (-14 : Rat) [(0, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-72 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-30 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (32 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (27 : Rat) [(10, 1), (16, 1)],
  term (8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(10, 2), (16, 1)],
  term (-24 : Rat) [(10, 3), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term (22 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (5 : Rat) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (10, 2), (16, 1)],
  term (14 : Rat) [(0, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (5, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (72 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (11, 2), (16, 1)],
  term (-32 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-27 : Rat) [(10, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(10, 2), (16, 1)],
  term (24 : Rat) [(10, 3), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term (-22 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (6 : Rat) [(2, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(14, 1), (16, 1)],
  term (-8 : Rat) [(16, 1)]
],
  [],
  [
  term (-24 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-6 : Rat) [(2, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (16, 1)],
  term (-4 : Rat) [(14, 1), (16, 1)],
  term (8 : Rat) [(16, 1)]
],
  [
  term (48 : Rat) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term (28 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (76 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(2, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (11, 2), (16, 1)],
  term (-8 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term (64 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-68 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term (22 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (48 : Rat) [(3, 2), (10, 2), (16, 1)],
  term (-16 : Rat) [(3, 2), (14, 1), (16, 1)],
  term (-16 : Rat) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (14, 2), (16, 1)],
  term (-28 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (16 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (-32 : Rat) [(10, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (16 : Rat) [(11, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(14, 1), (16, 1)],
  term (-16 : Rat) [(14, 2), (16, 1)],
  term (-6 : Rat) [(15, 2), (16, 1)]
],
  [
  term (48 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (20 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (16, 1)],
  term (-16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-48 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (-28 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (16 : Rat) [(3, 2), (16, 1)],
  term (-32 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-14 : Rat) [(10, 1), (16, 1)],
  term (8 : Rat) [(10, 2), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(11, 2), (16, 1)],
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(14, 1), (16, 1)],
  term (-7 : Rat) [(16, 1)]
],
  [
  term (24 : Rat) [(2, 1), (10, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (16, 1)],
  term (-24 : Rat) [(10, 2), (16, 1)],
  term (-4 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(2, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q2_071` as sparse rational polynomial data. -/
def ep_Q2_071 : Certificate :=
  { generators := ep_Q2_071_generators
    coefficients := ep_Q2_071_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q2_071`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q2_071_valid : checkCertificate ep_Q2_071 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
