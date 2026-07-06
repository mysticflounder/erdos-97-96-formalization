/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

/-!
# Endpoint certificate ep_Q1_015

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Source certificate: `certificates/endpoint/ep_Q1_015.json`.

This generated module lives in the `Patterns` namespace.

-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns


/-- Generator polynomials for endpoint certificate `ep_Q1_015`. -/
def ep_Q1_015_generators : List Poly :=
[
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
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
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
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
],
  [
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
],
  [
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
],
  [
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
],
  [
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
],
  [
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
  [
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
],
  [
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
],
  [
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
],
  [
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
],
  [
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
],
  [
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(6, 1)]
],
  [
  term (1 : Rat) [],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)],
  term (-2 : Rat) [(6, 1)]
],
  [
  term (1 : Rat) [],
  term (-2 : Rat) [(6, 1)],
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1)]
],
  [
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
],
  [
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
],
  [
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (12, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(3, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (12, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(9, 2)]
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
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(5, 2)]
],
  [
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(7, 2)]
],
  [
  term (-1 : Rat) [],
  term (-2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)]
]
]

/-- Coefficient polynomials for endpoint certificate `ep_Q1_015`. -/
def ep_Q1_015_coefficients : List Poly :=
[
  [],
  [
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (13, 1), (16, 1)]
],
  [
  term (-3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((17 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-1 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((9 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-9 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((13 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-5 : Rat) [(11, 2), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
],
  [
  term ((3 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term ((-3 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
],
  [
  term ((3 : Rat) / 2) [(3, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
],
  [],
  [
  term (-3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (11, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (13, 1), (16, 1)]
],
  [
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (16, 1)]
],
  [],
  [
  term (6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)]
],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (1 : Rat) [(16, 1)]
],
  [],
  [
  term (3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(16, 1)]
],
  [],
  [
  term (-3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((7 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (11, 2), (16, 1)],
  term (3 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term (-5 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-1 : Rat) [(8, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term (5 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((5 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-6 : Rat) [(11, 2), (12, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (3 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)],
  term ((1 : Rat) / 2) [(16, 1)]
],
  [
  term (-12 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
],
  [
  term (-6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (16, 1)]
],
  [
  term (6 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (13, 1), (16, 1)]
],
  [],
  [],
  [],
  [],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_015` as sparse rational polynomial data. -/
def ep_Q1_015 : Certificate :=
  { generators := ep_Q1_015_generators
    coefficients := ep_Q1_015_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_015`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_015_valid : checkCertificate ep_Q1_015 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
