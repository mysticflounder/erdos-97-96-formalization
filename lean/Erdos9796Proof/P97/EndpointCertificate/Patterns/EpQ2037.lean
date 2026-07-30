/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q2_037

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q2_037.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_037`. -/
def ep_Q2_037_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pw EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .u .s1 .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .exactV .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactV .s2 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .s2 .s1 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVRight .s3 .u EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy,
  .ordinary .s3 .u .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s3 .u .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pw .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .Pw .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .Pu EndpointVar.pux,
  .ordinaryVLeft .Pu .Pw EndpointVar.pux EndpointVar.puy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Pu .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .Pu EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Q2 .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q2_037`. -/
def ep_Q2_037_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_037_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q2_037`. -/
def ep_Q2_037_coefficients : List Poly :=
[
  [
  term ((-16 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 5) [(16, 1)]
],
  [
  term ((16 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(0, 1), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(15, 2), (16, 1)],
  term ((14 : Rat) / 5) [(16, 1)]
],
  [
  term ((4 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(12, 1), (16, 1)],
  term ((16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-7 : Rat) / 5) [(16, 1)]
],
  [],
  [
  term ((16 : Rat) / 5) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)],
  term ((32 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (13, 2), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (16, 1)],
  term ((8 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-14 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(12, 2), (16, 1)],
  term ((12 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(13, 2), (16, 1)],
  term ((-27 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(15, 2), (16, 1)],
  term ((14 : Rat) / 5) [(16, 1)]
],
  [
  term ((-16 : Rat) / 5) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 1), (14, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(0, 1), (16, 1)],
  term ((16 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (16, 1)],
  term ((-44 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (13, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((14 : Rat) / 5) [(12, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(13, 2), (16, 1)],
  term ((27 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(15, 2), (16, 1)],
  term ((-23 : Rat) / 10) [(16, 1)]
],
  [
  term ((-12 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((-6 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term ((-16 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term ((16 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(12, 1), (16, 1)],
  term ((6 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term ((11 : Rat) / 10) [(16, 1)]
],
  [
  term ((4 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(2, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (14, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(14, 2), (16, 1)],
  term ((6 : Rat) / 5) [(15, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term ((8 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(12, 1), (16, 1)],
  term ((32 : Rat) / 5) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term ((-11 : Rat) / 5) [(16, 1)]
],
  [],
  [
  term ((-12 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(15, 2), (16, 1)]
],
  [
  term ((12 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(15, 2), (16, 1)]
],
  [],
  [],
  [
  term ((-16 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 5) [(16, 1)]
],
  [],
  [
  term ((16 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(12, 1), (16, 1)],
  term ((16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(15, 2), (16, 1)],
  term ((7 : Rat) / 5) [(16, 1)]
],
  [
  term ((-4 : Rat) / 5) [(0, 1), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(15, 2), (16, 1)],
  term ((7 : Rat) / 5) [(16, 1)]
],
  [
  term ((12 : Rat) / 5) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(4, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(12, 1), (15, 2), (16, 1)]
],
  [
  term ((4 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(12, 1), (16, 1)],
  term ((16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(15, 2), (16, 1)],
  term ((-7 : Rat) / 5) [(16, 1)]
],
  [
  term ((16 : Rat) / 5) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)],
  term ((32 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (13, 2), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-26 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(12, 2), (16, 1)],
  term ((12 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((82 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(13, 2), (16, 1)],
  term ((-43 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(15, 2), (16, 1)],
  term ((21 : Rat) / 5) [(16, 1)]
],
  [
  term ((16 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(12, 1), (16, 1)],
  term ((16 : Rat) / 5) [(14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term ((-16 : Rat) / 5) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(0, 1), (16, 1)],
  term ((16 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (13, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (16, 1)],
  term ((12 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((26 : Rat) / 5) [(12, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(13, 2), (16, 1)],
  term ((43 : Rat) / 5) [(14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(15, 2), (16, 1)],
  term ((-21 : Rat) / 5) [(16, 1)]
],
  [
  term ((16 : Rat) / 5) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 5) [(0, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 2), (14, 1), (16, 1)],
  term ((36 : Rat) / 5) [(1, 2), (16, 1)],
  term ((32 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (13, 2), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (22 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((-42 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(12, 2), (16, 1)],
  term ((12 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((82 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(13, 2), (16, 1)],
  term (-15 : Rat) [(14, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(15, 2), (16, 1)],
  term ((34 : Rat) / 5) [(16, 1)]
],
  [
  term ((-8 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term ((8 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((-16 : Rat) / 5) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(0, 1), (16, 1)],
  term ((16 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((64 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 1), (13, 2), (16, 1)],
  term ((4 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)],
  term ((26 : Rat) / 5) [(12, 1), (16, 1)],
  term ((32 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(13, 2), (16, 1)],
  term ((11 : Rat) / 5) [(14, 1), (16, 1)],
  term (8 : Rat) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q2_037` as sparse rational polynomial data. -/
def ep_Q2_037 : Certificate :=
  { generators := ep_Q2_037_generators
    coefficients := ep_Q2_037_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q2_037`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q2_037_valid : checkCertificate ep_Q2_037 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
