/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNYNNY

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNYNNY.json`.

This generated module lives in the `RelaxedSplit` namespace.

-/

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate

namespace RelaxedSplit


/-- Generator polynomials for relaxed split surplus certificate `R009:u=v:R009NNYNNY`. -/
def rs_R009_ueqv_R009NNYNNY_generators : List Poly :=
[
  [
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
],
  [
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
],
  [
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
],
  [
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
],
  [
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
],
  [
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (8, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
],
  [
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
],
  [
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
],
  [
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
],
  [
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
],
  [
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
],
  [
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
],
  [
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
],
  [
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
],
  [
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
],
  [
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
],
  [
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]
]

/-- Coefficient polynomials for relaxed split surplus certificate `R009:u=v:R009NNYNNY`. -/
def rs_R009_ueqv_R009NNYNNY_coefficients : List Poly :=
[
  [
  term (-2 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 8) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(15, 2), (16, 1)],
  term ((5 : Rat) / 8) [(16, 1)]
],
  [
  term (1 : Rat) [(4, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term (1 : Rat) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (4, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (5, 2), (16, 1)],
  term ((11 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 4) [(4, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(5, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term ((-11 : Rat) / 4) [(14, 1), (16, 1)],
  term (2 : Rat) [(14, 2), (16, 1)],
  term ((3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [],
  [
  term (-2 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 2) [(0, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (4, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (5, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 4) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(4, 1), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(5, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(14, 1), (16, 1)],
  term (-2 : Rat) [(14, 2), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term ((15 : Rat) / 8) [(16, 1)]
],
  [
  term (-1 : Rat) []
],
  [
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)]
],
  [],
  [],
  [
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [],
  [],
  [
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 2) [(0, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (4, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (5, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(4, 1), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)],
  term (8 : Rat) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(5, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term ((11 : Rat) / 4) [(14, 1), (16, 1)],
  term (-2 : Rat) [(14, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(15, 2), (16, 1)]
],
  [
  term (8 : Rat) [(11, 2), (16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (4, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (5, 2), (16, 1)],
  term ((11 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (-3 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 4) [(4, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(5, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (16, 1)],
  term ((-11 : Rat) / 4) [(14, 1), (16, 1)],
  term (2 : Rat) [(14, 2), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)],
  term ((5 : Rat) / 8) [(16, 1)]
],
  [
  term (-1 : Rat) [(4, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 2) [(0, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (4, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (5, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(4, 1), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(5, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(11, 2), (16, 1)],
  term ((11 : Rat) / 4) [(14, 1), (16, 1)],
  term (-2 : Rat) [(14, 2), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 8) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (4, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (5, 2), (16, 1)],
  term ((11 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (-3 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (14, 1), (16, 1)],
  term ((15 : Rat) / 4) [(4, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(5, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term (-4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (16, 1)],
  term ((-15 : Rat) / 4) [(14, 1), (16, 1)],
  term (2 : Rat) [(14, 2), (16, 1)],
  term (2 : Rat) [(15, 2), (16, 1)],
  term ((5 : Rat) / 8) [(16, 1)]
],
  [],
  [],
  [
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (16, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 2) [(0, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (4, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (5, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(0, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(0, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (14, 1), (16, 1)],
  term ((-15 : Rat) / 4) [(4, 1), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(5, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(11, 2), (16, 1)],
  term ((15 : Rat) / 4) [(14, 1), (16, 1)],
  term (-2 : Rat) [(14, 2), (16, 1)],
  term (-2 : Rat) [(15, 2), (16, 1)],
  term ((-5 : Rat) / 8) [(16, 1)]
],
  [
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
]
]

/-- Relaxed split surplus certificate `R009:u=v:R009NNYNNY` as sparse rational polynomial data. -/
def rs_R009_ueqv_R009NNYNNY : Certificate :=
  { generators := rs_R009_ueqv_R009NNYNNY_generators
    coefficients := rs_R009_ueqv_R009NNYNNY_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `R009:u=v:R009NNYNNY`. -/
theorem rs_R009_ueqv_R009NNYNNY_valid : checkCertificate rs_R009_ueqv_R009NNYNNY = true := by
  native_decide

end RelaxedSplit


end SurplusCertificate

end Problem97
