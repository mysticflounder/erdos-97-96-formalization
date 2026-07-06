/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 30:0-11

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 30 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_30_0000_0011 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0000 : Poly :=
[
  term ((123 : Rat) / 68) []
]

/-- Partial product 0 for generator 30. -/
def ep_Q1_009_partial_30_0000 : Poly :=
[
  term ((-123 : Rat) / 68) [],
  term ((-123 : Rat) / 34) [(2, 1), (6, 1), (16, 1)],
  term ((123 : Rat) / 68) [(2, 2), (16, 1)],
  term ((-123 : Rat) / 34) [(3, 1), (7, 1), (16, 1)],
  term ((123 : Rat) / 68) [(3, 2), (16, 1)],
  term ((123 : Rat) / 68) [(6, 2), (16, 1)],
  term ((123 : Rat) / 68) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem ep_Q1_009_partial_30_0000_valid :
    mulPoly ep_Q1_009_coefficient_30_0000
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0001 : Poly :=
[
  term ((13 : Rat) / 51) [(3, 1), (5, 1)]
]

/-- Partial product 1 for generator 30. -/
def ep_Q1_009_partial_30_0001 : Poly :=
[
  term ((-26 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((13 : Rat) / 51) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-13 : Rat) / 51) [(3, 1), (5, 1)],
  term ((13 : Rat) / 51) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((13 : Rat) / 51) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-26 : Rat) / 51) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((13 : Rat) / 51) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem ep_Q1_009_partial_30_0001_valid :
    mulPoly ep_Q1_009_coefficient_30_0001
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0002 : Poly :=
[
  term ((26 : Rat) / 51) [(3, 1), (7, 1)]
]

/-- Partial product 2 for generator 30. -/
def ep_Q1_009_partial_30_0002 : Poly :=
[
  term ((-52 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((26 : Rat) / 51) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((26 : Rat) / 51) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-26 : Rat) / 51) [(3, 1), (7, 1)],
  term ((26 : Rat) / 51) [(3, 1), (7, 3), (16, 1)],
  term ((-52 : Rat) / 51) [(3, 2), (7, 2), (16, 1)],
  term ((26 : Rat) / 51) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem ep_Q1_009_partial_30_0002_valid :
    mulPoly ep_Q1_009_coefficient_30_0002
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0003 : Poly :=
[
  term ((-11011509028 : Rat) / 5071147821) [(3, 1), (9, 1)]
]

/-- Partial product 3 for generator 30. -/
def ep_Q1_009_partial_30_0003 : Poly :=
[
  term ((22023018056 : Rat) / 5071147821) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((11011509028 : Rat) / 5071147821) [(3, 1), (9, 1)],
  term ((22023018056 : Rat) / 5071147821) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem ep_Q1_009_partial_30_0003_valid :
    mulPoly ep_Q1_009_coefficient_30_0003
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0004 : Poly :=
[
  term ((322 : Rat) / 51) [(3, 1), (13, 1)]
]

/-- Partial product 4 for generator 30. -/
def ep_Q1_009_partial_30_0004 : Poly :=
[
  term ((-644 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((322 : Rat) / 51) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((322 : Rat) / 51) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((322 : Rat) / 51) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-322 : Rat) / 51) [(3, 1), (13, 1)],
  term ((-644 : Rat) / 51) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((322 : Rat) / 51) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem ep_Q1_009_partial_30_0004_valid :
    mulPoly ep_Q1_009_coefficient_30_0004
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0005 : Poly :=
[
  term ((-78 : Rat) / 89) [(3, 1), (15, 1)]
]

/-- Partial product 5 for generator 30. -/
def ep_Q1_009_partial_30_0005 : Poly :=
[
  term ((156 : Rat) / 89) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((78 : Rat) / 89) [(3, 1), (15, 1)],
  term ((156 : Rat) / 89) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem ep_Q1_009_partial_30_0005_valid :
    mulPoly ep_Q1_009_coefficient_30_0005
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0006 : Poly :=
[
  term ((24608309102 : Rat) / 5071147821) [(5, 1), (9, 1)]
]

/-- Partial product 6 for generator 30. -/
def ep_Q1_009_partial_30_0006 : Poly :=
[
  term ((-49216618204 : Rat) / 5071147821) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-49216618204 : Rat) / 5071147821) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-24608309102 : Rat) / 5071147821) [(5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 30. -/
theorem ep_Q1_009_partial_30_0006_valid :
    mulPoly ep_Q1_009_coefficient_30_0006
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0007 : Poly :=
[
  term ((338 : Rat) / 1513) [(5, 1), (15, 1)]
]

/-- Partial product 7 for generator 30. -/
def ep_Q1_009_partial_30_0007 : Poly :=
[
  term ((-676 : Rat) / 1513) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-676 : Rat) / 1513) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-338 : Rat) / 1513) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 30. -/
theorem ep_Q1_009_partial_30_0007_valid :
    mulPoly ep_Q1_009_coefficient_30_0007
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0008 : Poly :=
[
  term ((-26 : Rat) / 51) [(7, 1), (9, 1)]
]

/-- Partial product 8 for generator 30. -/
def ep_Q1_009_partial_30_0008 : Poly :=
[
  term ((52 : Rat) / 51) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-26 : Rat) / 51) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((52 : Rat) / 51) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-26 : Rat) / 51) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-26 : Rat) / 51) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((26 : Rat) / 51) [(7, 1), (9, 1)],
  term ((-26 : Rat) / 51) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 30. -/
theorem ep_Q1_009_partial_30_0008_valid :
    mulPoly ep_Q1_009_coefficient_30_0008
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0009 : Poly :=
[
  term ((-11011509028 : Rat) / 5071147821) [(9, 1), (13, 1)]
]

/-- Partial product 9 for generator 30. -/
def ep_Q1_009_partial_30_0009 : Poly :=
[
  term ((22023018056 : Rat) / 5071147821) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((22023018056 : Rat) / 5071147821) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((11011509028 : Rat) / 5071147821) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 30. -/
theorem ep_Q1_009_partial_30_0009_valid :
    mulPoly ep_Q1_009_coefficient_30_0009
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0010 : Poly :=
[
  term ((-106 : Rat) / 51) [(12, 1)]
]

/-- Partial product 10 for generator 30. -/
def ep_Q1_009_partial_30_0010 : Poly :=
[
  term ((212 : Rat) / 51) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(2, 2), (12, 1), (16, 1)],
  term ((212 : Rat) / 51) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(3, 2), (12, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(6, 2), (12, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(7, 2), (12, 1), (16, 1)],
  term ((106 : Rat) / 51) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 30. -/
theorem ep_Q1_009_partial_30_0010_valid :
    mulPoly ep_Q1_009_coefficient_30_0010
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 30. -/
def ep_Q1_009_coefficient_30_0011 : Poly :=
[
  term ((988 : Rat) / 1513) [(13, 1), (15, 1)]
]

/-- Partial product 11 for generator 30. -/
def ep_Q1_009_partial_30_0011 : Poly :=
[
  term ((-1976 : Rat) / 1513) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1976 : Rat) / 1513) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-988 : Rat) / 1513) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 30. -/
theorem ep_Q1_009_partial_30_0011_valid :
    mulPoly ep_Q1_009_coefficient_30_0011
        ep_Q1_009_generator_30_0000_0011 =
      ep_Q1_009_partial_30_0011 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_30_0000_0011 : List Poly :=
[
  ep_Q1_009_partial_30_0000,
  ep_Q1_009_partial_30_0001,
  ep_Q1_009_partial_30_0002,
  ep_Q1_009_partial_30_0003,
  ep_Q1_009_partial_30_0004,
  ep_Q1_009_partial_30_0005,
  ep_Q1_009_partial_30_0006,
  ep_Q1_009_partial_30_0007,
  ep_Q1_009_partial_30_0008,
  ep_Q1_009_partial_30_0009,
  ep_Q1_009_partial_30_0010,
  ep_Q1_009_partial_30_0011
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_30_0000_0011 : Poly :=
[
  term ((-123 : Rat) / 68) [],
  term ((-26 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-52 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((22023018056 : Rat) / 5071147821) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-644 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((156 : Rat) / 89) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-49216618204 : Rat) / 5071147821) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-676 : Rat) / 1513) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((52 : Rat) / 51) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((22023018056 : Rat) / 5071147821) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((212 : Rat) / 51) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1976 : Rat) / 1513) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-123 : Rat) / 34) [(2, 1), (6, 1), (16, 1)],
  term ((13 : Rat) / 51) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((26 : Rat) / 51) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((322 : Rat) / 51) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-26 : Rat) / 51) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(2, 2), (12, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((123 : Rat) / 68) [(2, 2), (16, 1)],
  term ((-13 : Rat) / 51) [(3, 1), (5, 1)],
  term ((13 : Rat) / 51) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-49216618204 : Rat) / 5071147821) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-676 : Rat) / 1513) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 51) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((26 : Rat) / 51) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((322 : Rat) / 51) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-26 : Rat) / 51) [(3, 1), (7, 1)],
  term ((22023018056 : Rat) / 5071147821) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((212 : Rat) / 51) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1976 : Rat) / 1513) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-123 : Rat) / 34) [(3, 1), (7, 1), (16, 1)],
  term ((-5840926936 : Rat) / 5071147821) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((322 : Rat) / 51) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((26 : Rat) / 51) [(3, 1), (7, 3), (16, 1)],
  term ((11011509028 : Rat) / 5071147821) [(3, 1), (9, 1)],
  term ((-322 : Rat) / 51) [(3, 1), (13, 1)],
  term ((78 : Rat) / 89) [(3, 1), (15, 1)],
  term ((-26 : Rat) / 51) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((19437727010 : Rat) / 5071147821) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-644 : Rat) / 51) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((156 : Rat) / 89) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-52 : Rat) / 51) [(3, 2), (7, 2), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(3, 2), (12, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((123 : Rat) / 68) [(3, 2), (16, 1)],
  term ((13 : Rat) / 51) [(3, 3), (5, 1), (16, 1)],
  term ((26 : Rat) / 51) [(3, 3), (7, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(3, 3), (9, 1), (16, 1)],
  term ((322 : Rat) / 51) [(3, 3), (13, 1), (16, 1)],
  term ((-78 : Rat) / 89) [(3, 3), (15, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((24608309102 : Rat) / 5071147821) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((338 : Rat) / 1513) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-24608309102 : Rat) / 5071147821) [(5, 1), (9, 1)],
  term ((-338 : Rat) / 1513) [(5, 1), (15, 1)],
  term ((-26 : Rat) / 51) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(6, 2), (12, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((123 : Rat) / 68) [(6, 2), (16, 1)],
  term ((26 : Rat) / 51) [(7, 1), (9, 1)],
  term ((-11011509028 : Rat) / 5071147821) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-106 : Rat) / 51) [(7, 2), (12, 1), (16, 1)],
  term ((988 : Rat) / 1513) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((123 : Rat) / 68) [(7, 2), (16, 1)],
  term ((-26 : Rat) / 51) [(7, 3), (9, 1), (16, 1)],
  term ((11011509028 : Rat) / 5071147821) [(9, 1), (13, 1)],
  term ((106 : Rat) / 51) [(12, 1)],
  term ((-988 : Rat) / 1513) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 11. -/
theorem ep_Q1_009_block_30_0000_0011_valid :
    checkProductSumEq ep_Q1_009_partials_30_0000_0011
      ep_Q1_009_block_30_0000_0011 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
