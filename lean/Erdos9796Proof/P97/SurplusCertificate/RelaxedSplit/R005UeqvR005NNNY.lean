/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Relaxed split surplus certificate R005:u=v:R005NNNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NNNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

namespace RelaxedSplit


/-- Reflected generator rules for relaxed split surplus certificate `R005:u=v:R005NNNY`. -/
def rs_R005_ueqv_R005NNNY_rules : List Bank.RowZeros.GeneratorRule :=
[
  .exactV .u .s1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .exactV .u .Pw EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .exactV .u .Pu EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Pu EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .exactW .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactW .s1 .Q2 EndpointVar.s1x EndpointVar.s1y EndpointVar.q2x EndpointVar.q2y,
  .distinctV .u EndpointVar.ux EndpointVar.uy,
  .ordinary .u .s2 .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.s3x EndpointVar.s3y,
  .ordinary .u .s2 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s2 .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .s1 .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s1 .Pw EndpointVar.s1x EndpointVar.s1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .s1 .Q1 EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .s2 .u EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy,
  .ordinary .s2 .u .s3 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .s2 .u .Q2 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .ordinaryWRight .Pw .u EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pw .u .s1 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Pw .u .s2 EndpointVar.pwx EndpointVar.pwy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .s3 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinary .Pu .u .Q1 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryVW .Q1 EndpointVar.q1x,
  .ordinaryVLeft .Q1 .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVLeft .Q1 .Q2 EndpointVar.q1x EndpointVar.q1y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryVLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryVLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y
]

/-- Generator polynomials for relaxed split surplus certificate `R005:u=v:R005NNNY`. -/
def rs_R005_ueqv_R005NNNY_generators : List Poly :=
  rs_R005_ueqv_R005NNNY_rules.map Bank.RowZeros.GeneratorRule.normalizedPoly

/-- Coefficient polynomials for relaxed split surplus certificate `R005:u=v:R005NNNY`. -/
def rs_R005_ueqv_R005NNNY_coefficients : List Poly :=
[
  [
  term ((63 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 86) [(8, 1), (10, 1), (16, 1)],
  term ((65 : Rat) / 86) [(8, 1), (16, 1)],
  term ((21 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-42 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((4 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((-239 : Rat) / 172) [(10, 1), (16, 1)],
  term ((21 : Rat) / 43) [(10, 2), (16, 1)],
  term ((-34 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 43) [(15, 2), (16, 1)],
  term ((147 : Rat) / 172) [(16, 1)]
],
  [
  term ((-63 : Rat) / 43) [(2, 1), (16, 1)],
  term ((-63 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((126 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 86) [(8, 1), (10, 1), (16, 1)],
  term ((1 : Rat) / 43) [(8, 1), (16, 1)],
  term ((-21 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((281 : Rat) / 172) [(10, 1), (16, 1)],
  term ((-21 : Rat) / 43) [(10, 2), (16, 1)],
  term ((6 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 43) [(15, 2), (16, 1)],
  term ((28 : Rat) / 43) [(16, 1)]
],
  [
  term ((63 : Rat) / 43) [(2, 1), (16, 1)],
  term ((21 : Rat) / 43) [(8, 1), (10, 1), (16, 1)],
  term ((-67 : Rat) / 86) [(8, 1), (16, 1)],
  term ((-21 : Rat) / 86) [(10, 1), (16, 1)],
  term ((28 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 43) [(15, 2), (16, 1)],
  term ((-87 : Rat) / 172) [(16, 1)]
],
  [
  term ((-63 : Rat) / 43) [(2, 1), (16, 1)],
  term ((-21 : Rat) / 43) [(8, 1), (10, 1), (16, 1)],
  term ((67 : Rat) / 86) [(8, 1), (16, 1)],
  term ((21 : Rat) / 86) [(10, 1), (16, 1)],
  term ((-28 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 43) [(15, 2), (16, 1)],
  term ((87 : Rat) / 172) [(16, 1)]
],
  [
  term ((-63 : Rat) / 43) [(2, 1), (10, 1), (16, 1)],
  term ((229 : Rat) / 86) [(2, 1), (16, 1)],
  term ((84 : Rat) / 43) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((118 : Rat) / 43) [(3, 1), (9, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((-332 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 2), (16, 1)],
  term ((-21 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 2), (10, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 2), (16, 1)],
  term ((-63 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((77 : Rat) / 86) [(10, 1), (14, 1), (16, 1)],
  term ((-252 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((-287 : Rat) / 172) [(10, 1), (16, 1)],
  term ((34 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 43) [(14, 1), (16, 1)],
  term ((24 : Rat) / 43) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 86) [(16, 1)]
],
  [
  term ((63 : Rat) / 43) [(2, 1), (10, 1), (16, 1)],
  term ((-229 : Rat) / 86) [(2, 1), (16, 1)],
  term ((-84 : Rat) / 43) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-118 : Rat) / 43) [(3, 1), (9, 1), (16, 1)],
  term ((-252 : Rat) / 43) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((189 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((80 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 43) [(3, 2), (16, 1)],
  term ((63 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 43) [(9, 2), (10, 1), (16, 1)],
  term ((4 : Rat) / 43) [(9, 2), (16, 1)],
  term ((189 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77 : Rat) / 86) [(10, 1), (14, 1), (16, 1)],
  term ((-133 : Rat) / 172) [(10, 1), (16, 1)],
  term ((-46 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 43) [(14, 1), (16, 1)],
  term ((9 : Rat) / 86) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [],
  [],
  [],
  [],
  [
  term ((63 : Rat) / 43) [(2, 1), (16, 1)],
  term ((-63 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((126 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((21 : Rat) / 86) [(8, 1), (10, 1), (16, 1)],
  term ((-1 : Rat) / 43) [(8, 1), (16, 1)],
  term ((-21 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((-197 : Rat) / 172) [(10, 1), (16, 1)],
  term ((21 : Rat) / 43) [(10, 2), (16, 1)],
  term ((6 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 43) [(15, 2), (16, 1)],
  term ((-30 : Rat) / 43) [(16, 1)]
],
  [
  term ((252 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((-504 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-168 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-504 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 43) [(15, 2), (16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term ((63 : Rat) / 43) [(2, 1), (16, 1)],
  term ((-63 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((126 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((21 : Rat) / 86) [(8, 1), (10, 1), (16, 1)],
  term ((-1 : Rat) / 43) [(8, 1), (16, 1)],
  term ((-21 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((-113 : Rat) / 172) [(10, 1), (16, 1)],
  term ((21 : Rat) / 43) [(10, 2), (16, 1)],
  term ((6 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 43) [(15, 2), (16, 1)],
  term ((-1 : Rat) / 86) [(16, 1)]
],
  [
  term ((-63 : Rat) / 43) [(2, 1), (16, 1)],
  term ((63 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 86) [(8, 1), (10, 1), (16, 1)],
  term ((1 : Rat) / 43) [(8, 1), (16, 1)],
  term ((21 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-42 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((4 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((113 : Rat) / 172) [(10, 1), (16, 1)],
  term ((-21 : Rat) / 43) [(10, 2), (16, 1)],
  term ((-6 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 43) [(15, 2), (16, 1)],
  term ((1 : Rat) / 86) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [
  term ((-252 : Rat) / 43) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((504 : Rat) / 43) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 43) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((168 : Rat) / 43) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 43) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 43) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 43) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((504 : Rat) / 43) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((63 : Rat) / 43) [(2, 1), (10, 1), (16, 1)],
  term ((80 : Rat) / 43) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 43) [(2, 1), (15, 2), (16, 1)],
  term ((-229 : Rat) / 86) [(2, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 43) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-168 : Rat) / 43) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-42 : Rat) / 43) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((118 : Rat) / 43) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-236 : Rat) / 43) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-59 : Rat) / 43) [(3, 1), (9, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-504 : Rat) / 43) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-458 : Rat) / 43) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((378 : Rat) / 43) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((63 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((160 : Rat) / 43) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 2), (12, 1), (16, 1)],
  term ((-504 : Rat) / 43) [(3, 2), (14, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(3, 2), (16, 1)],
  term ((-42 : Rat) / 43) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 43) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 43) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 43) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 43) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 43) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 43) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 43) [(8, 1), (15, 2), (16, 1)],
  term ((126 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((21 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-252 : Rat) / 43) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 43) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 43) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-84 : Rat) / 43) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-21 : Rat) / 43) [(9, 2), (10, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 43) [(9, 2), (14, 1), (16, 1)],
  term ((2 : Rat) / 43) [(9, 2), (16, 1)],
  term ((-378 : Rat) / 43) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((378 : Rat) / 43) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133 : Rat) / 86) [(10, 1), (14, 1), (16, 1)],
  term ((63 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((287 : Rat) / 172) [(10, 1), (16, 1)],
  term ((92 : Rat) / 43) [(12, 1), (15, 2), (16, 1)],
  term ((-92 : Rat) / 43) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 43) [(14, 1), (16, 1)],
  term ((22 : Rat) / 43) [(15, 2), (16, 1)],
  term ((1 : Rat) / 86) [(16, 1)]
],
  [
  term ((126 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((-252 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 43) [(10, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 43) [(15, 2), (16, 1)]
],
  [
  term ((-63 : Rat) / 43) [(2, 1), (10, 1), (16, 1)],
  term ((229 : Rat) / 86) [(2, 1), (16, 1)],
  term ((84 : Rat) / 43) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((118 : Rat) / 43) [(3, 1), (9, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((-80 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 2), (16, 1)],
  term ((-63 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((126 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 2), (10, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 2), (16, 1)],
  term ((-189 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((77 : Rat) / 86) [(10, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 172) [(10, 1), (16, 1)],
  term ((46 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 43) [(14, 1), (16, 1)],
  term ((-29 : Rat) / 86) [(16, 1)]
],
  [
  term ((-63 : Rat) / 43) [(10, 1), (16, 1)],
  term ((229 : Rat) / 86) [(16, 1)]
],
  [],
  [
  term ((63 : Rat) / 43) [(2, 1), (10, 1), (16, 1)],
  term ((-229 : Rat) / 86) [(2, 1), (16, 1)],
  term ((84 : Rat) / 43) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((118 : Rat) / 43) [(3, 1), (9, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 43) [(3, 1), (13, 1), (16, 1)],
  term ((-80 : Rat) / 43) [(3, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 43) [(3, 2), (16, 1)],
  term ((-63 : Rat) / 43) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((126 : Rat) / 43) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 43) [(9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 43) [(9, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 43) [(9, 2), (10, 1), (16, 1)],
  term ((-4 : Rat) / 43) [(9, 2), (16, 1)],
  term ((-189 : Rat) / 43) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77 : Rat) / 86) [(10, 1), (14, 1), (16, 1)],
  term ((287 : Rat) / 172) [(10, 1), (16, 1)],
  term ((46 : Rat) / 43) [(13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 43) [(14, 1), (16, 1)],
  term ((1 : Rat) / 86) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R005:u=v:R005NNNY` as sparse rational polynomial data. -/
def rs_R005_ueqv_R005NNNY : Certificate :=
  { generators := rs_R005_ueqv_R005NNNY_generators
    coefficients := rs_R005_ueqv_R005NNNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R005:u=v:R005NNNY`. -/
theorem rs_R005_ueqv_R005NNNY_valid : checkCertificate rs_R005_ueqv_R005NNNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
