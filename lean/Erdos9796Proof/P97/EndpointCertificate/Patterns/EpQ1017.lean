/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Endpoint certificate ep_Q1_017

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Generators are *derived* from the semantic rule list below rather than emitted
as literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.

Source certificate: `certificates/endpoint/ep_Q1_017.json`.

This generated module lives in the `Patterns` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace EndpointCertificate

namespace Patterns

open Variables

/-- Generator rules for endpoint certificate `ep_Q1_017`. -/
def ep_Q1_017_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s2 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s2 .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .exactV .s2 .Q1 EndpointVar.s2x EndpointVar.s2y EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s1 EndpointVar.s1x,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinary .s2 .s1 .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .s1 .Pw EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinary .s2 .s1 .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryWLeft .s3 .s1 EndpointVar.s3x EndpointVar.s3y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryWLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s3 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pw .u .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryVRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Q1 .u .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .Q2 .u EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q2 .u .s2 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Q2 .u .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .distinctS1S3
]

/-- Generator polynomials for endpoint certificate `ep_Q1_017`. -/
def ep_Q1_017_generators : List Poly :=
  RowZeros.rulePolys ep_Q1_017_rules

/-- Coefficient polynomials for endpoint certificate `ep_Q1_017`. -/
def ep_Q1_017_coefficients : List Poly :=
[
  [],
  [
  term ((-2 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(6, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(8, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-22 : Rat) / 3) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(16, 1)]
],
  [
  term ((2 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(6, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(8, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((22 : Rat) / 3) [(15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(16, 1)]
],
  [
  term ((8 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(15, 2), (16, 1)]
],
  [
  term ((2 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-44 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(6, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(8, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(16, 1)]
],
  [
  term ((4 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(8, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-26 : Rat) / 3) [(15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(16, 1)]
],
  [
  term ((-2 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((-2 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(6, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(15, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((4 : Rat) / 3) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (4, 1), (7, 1), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (16, 1)],
  term ((28 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (7, 1), (16, 1)],
  term ((28 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(16, 1)]
],
  [
  term ((-4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(5, 1), (7, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(16, 1)]
],
  [
  term (-8 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(16, 1)]
],
  [
  term ((8 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(5, 1), (7, 1), (16, 1)],
  term ((20 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((5 : Rat) / 3) [(16, 1)]
],
  [
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(16, 1)]
],
  [
  term ((-20 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(16, 1)]
],
  [],
  [
  term ((-8 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term (8 : Rat) [(9, 1), (15, 1), (16, 1)]
],
  [
  term ((8 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((-2 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((44 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(6, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(8, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)],
  term (-4 : Rat) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(16, 1)]
],
  [],
  [
  term ((-8 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((2 : Rat) / 3) [(3, 1), (7, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(6, 1), (16, 1)],
  term ((16 : Rat) / 3) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(8, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(15, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(15, 2), (16, 1)]
],
  [
  term ((4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(16, 1)]
],
  [
  term ((-8 : Rat) / 3) [(5, 1), (7, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(16, 1)]
],
  [
  term ((8 : Rat) / 3) [(5, 1), (7, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(14, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
],
  [
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(16, 1)]
],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_017` as sparse rational polynomial data. -/
def ep_Q1_017 : Certificate :=
  { generators := ep_Q1_017_generators
    coefficients := ep_Q1_017_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_017`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_017_valid : checkCertificate ep_Q1_017 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
