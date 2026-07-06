/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

/-!
# Endpoint certificate ep_Q1_016

This module contains the first Lean vertical slice for the endpoint certificate
set.  The theorem checks the generated rational-polynomial identity with
`native_decide`; its expected audit cost is `Lean.ofReduceBool` plus
`Lean.trustCompiler`.

Source certificate: `certificates/endpoint/ep_Q1_016.json`.

This generated module lives in the `Patterns` namespace.

-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns


/-- Generator polynomials for endpoint certificate `ep_Q1_016`. -/
def ep_Q1_016_generators : List Poly :=
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
  term (1 : Rat) [],
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)],
  term (-2 : Rat) [(8, 1)]
],
  [
  term (1 : Rat) [],
  term (-2 : Rat) [(8, 1)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
],
  [
  term (1 : Rat) [],
  term (-2 : Rat) [(8, 1)],
  term (2 : Rat) [(8, 1), (14, 1)],
  term (2 : Rat) [(9, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
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

/-- Coefficient polynomials for endpoint certificate `ep_Q1_016`. -/
def ep_Q1_016_coefficients : List Poly :=
[
  [],
  [],
  [],
  [
  term (1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((4079 : Rat) / 1120) [(6, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (-3 : Rat) [(7, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((-681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((-4677 : Rat) / 4480) [(16, 1)]
],
  [
  term (-1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((-7439 : Rat) / 1120) [(6, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((13637 : Rat) / 4480) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (3 : Rat) [(6, 1), (16, 1)],
  term (-2 : Rat) [(16, 1)]
],
  [],
  [
  term (-1 : Rat) [(16, 1)]
],
  [
  term (-3 : Rat) [(6, 1), (16, 1)],
  term (2 : Rat) [(16, 1)]
],
  [
  term ((3 : Rat) / 2) [(6, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 1), (16, 1)],
  term ((401 : Rat) / 280) [(9, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (16, 1)],
  term ((-681 : Rat) / 560) [(11, 2), (16, 1)],
  term ((-999 : Rat) / 2240) [(16, 1)]
],
  [
  term (-3 : Rat) [(6, 1), (16, 1)],
  term ((5 : Rat) / 2) [(16, 1)]
],
  [
  term (1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((7121 : Rat) / 1120) [(6, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((-14363 : Rat) / 4480) [(16, 1)]
],
  [],
  [
  term (6 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (-3 : Rat) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-401 : Rat) / 560) [(6, 1), (8, 1), (16, 1)],
  term ((-401 : Rat) / 280) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (9, 2), (16, 1)],
  term ((681 : Rat) / 1120) [(6, 1), (10, 1), (16, 1)],
  term ((681 : Rat) / 560) [(6, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 4) [(6, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 2), (16, 1)],
  term (2 : Rat) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((1521 : Rat) / 280) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-681 : Rat) / 560) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-681 : Rat) / 1120) [(7, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(7, 2), (8, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 2), (16, 1)],
  term (-1 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-681 : Rat) / 560) [(8, 1), (11, 2), (16, 1)],
  term ((1483 : Rat) / 2240) [(8, 1), (16, 1)],
  term ((681 : Rat) / 560) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(9, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(9, 2), (10, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 2), (16, 1)],
  term ((-681 : Rat) / 2240) [(10, 1), (16, 1)],
  term ((-681 : Rat) / 4480) [(16, 1)]
],
  [
  term (-1 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((-6319 : Rat) / 1120) [(6, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-1521 : Rat) / 560) [(7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((3 : Rat) / 4) [(8, 1), (16, 1)],
  term ((1 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((681 : Rat) / 1120) [(11, 2), (16, 1)],
  term ((11397 : Rat) / 4480) [(16, 1)]
],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [
  term (-1 : Rat) []
]
]

/-- Endpoint certificate `ep_Q1_016` as sparse rational polynomial data. -/
def ep_Q1_016 : Certificate :=
  { generators := ep_Q1_016_generators
    coefficients := ep_Q1_016_coefficients }

set_option linter.style.nativeDecide false in
/-- The checked identity for endpoint certificate `ep_Q1_016`.

This uses `native_decide` to evaluate the pure Lean checker over exact rational
polynomial data.  The expected native-decision axiom-closure addition is
`Lean.ofReduceBool` plus `Lean.trustCompiler`; the checker closure must remain
free of `unsafe`, `extern`, and `implemented_by`. -/
theorem ep_Q1_016_valid : checkCertificate ep_Q1_016 = true := by
  native_decide

end Patterns


end EndpointCertificate

end Problem97
