/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 26:0-25

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(8, 1), (12, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(9, 2)],
  term (-2 : Rat) [(12, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0000 : Poly :=
[
  term ((-5 : Rat) / 16) []
]

/-- Partial product 0 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0000 : Poly :=
[
  term ((-5 : Rat) / 16) [],
  term ((-5 : Rat) / 8) [(8, 1), (12, 1)],
  term ((5 : Rat) / 16) [(8, 2)],
  term ((-5 : Rat) / 8) [(9, 1), (13, 1)],
  term ((5 : Rat) / 16) [(9, 2)],
  term ((5 : Rat) / 8) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0000
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0001 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 1 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0001 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (8, 2), (11, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (9, 2), (11, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0001
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0002 : Poly :=
[
  term ((5888 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0002 : Poly :=
[
  term ((11776 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0002
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0003 : Poly :=
[
  term ((-22 : Rat) / 29) [(3, 1), (15, 1)]
]

/-- Partial product 3 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0003 : Poly :=
[
  term ((-44 : Rat) / 29) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((22 : Rat) / 29) [(3, 1), (8, 2), (15, 1)],
  term ((-44 : Rat) / 29) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((22 : Rat) / 29) [(3, 1), (9, 2), (15, 1)],
  term ((44 : Rat) / 29) [(3, 1), (12, 1), (15, 1)],
  term ((-22 : Rat) / 29) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0003
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0004 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 4 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0004 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(5, 1), (8, 2), (11, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0004
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0005 : Poly :=
[
  term ((5888 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0005 : Poly :=
[
  term ((11776 : Rat) / 32699) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0005
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0006 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 6 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0006 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((496086272 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-248043136 : Rat) / 33189485) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0006
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0007 : Poly :=
[
  term ((47104 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0007 : Poly :=
[
  term ((94208 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(5, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((94208 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-94208 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((47104 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0007
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0008 : Poly :=
[
  term ((-3434493127 : Rat) / 66378970) [(5, 1), (15, 1)]
]

/-- Partial product 8 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0008 : Poly :=
[
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((3434493127 : Rat) / 66378970) [(5, 1), (8, 2), (15, 1)],
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((3434493127 : Rat) / 66378970) [(5, 1), (9, 2), (15, 1)],
  term ((3434493127 : Rat) / 33189485) [(5, 1), (12, 1), (15, 1)],
  term ((-3434493127 : Rat) / 66378970) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0008
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0009 : Poly :=
[
  term ((304848 : Rat) / 32699) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0009 : Poly :=
[
  term ((609696 : Rat) / 32699) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-304848 : Rat) / 32699) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((609696 : Rat) / 32699) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-304848 : Rat) / 32699) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-609696 : Rat) / 32699) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((304848 : Rat) / 32699) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0009
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0010 : Poly :=
[
  term ((-5315344096 : Rat) / 33189485) [(7, 1), (15, 1)]
]

/-- Partial product 10 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0010 : Poly :=
[
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(7, 1), (8, 2), (15, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(7, 1), (9, 2), (15, 1)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)],
  term ((-5315344096 : Rat) / 33189485) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0010
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0011 : Poly :=
[
  term ((1016640 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0011 : Poly :=
[
  term ((2033280 : Rat) / 32699) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1016640 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0011
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0012 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 12 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0012 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0012_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0012
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0013 : Poly :=
[
  term ((11776 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0013 : Poly :=
[
  term ((23552 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0013_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0013
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0014 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 14 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0014 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(9, 1), (11, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0014_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0014
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0015 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 15 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0015 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0015_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0015
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0016 : Poly :=
[
  term ((113 : Rat) / 58) [(9, 1), (15, 1)]
]

/-- Partial product 16 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0016 : Poly :=
[
  term ((113 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-113 : Rat) / 58) [(8, 2), (9, 1), (15, 1)],
  term ((-113 : Rat) / 29) [(9, 1), (12, 1), (15, 1)],
  term ((113 : Rat) / 58) [(9, 1), (15, 1)],
  term ((113 : Rat) / 29) [(9, 2), (13, 1), (15, 1)],
  term ((-113 : Rat) / 58) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0016_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0016
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0017 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 17 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0017 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0017_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0017
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0018 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0018 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0018_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0018
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0019 : Poly :=
[
  term ((-3751048121 : Rat) / 33189485) [(11, 1), (15, 1)]
]

/-- Partial product 19 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0019 : Poly :=
[
  term ((-7502096242 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((3751048121 : Rat) / 33189485) [(8, 2), (11, 1), (15, 1)],
  term ((-7502096242 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3751048121 : Rat) / 33189485) [(9, 2), (11, 1), (15, 1)],
  term ((7502096242 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)],
  term ((-3751048121 : Rat) / 33189485) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0019_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0019
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0020 : Poly :=
[
  term ((724556 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0020 : Poly :=
[
  term ((1449112 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-724556 : Rat) / 32699) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1449112 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724556 : Rat) / 32699) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1449112 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((724556 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0020_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0020
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0021 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(11, 1), (15, 3)]
]

/-- Partial product 21 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0021 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-62010784 : Rat) / 33189485) [(8, 2), (11, 1), (15, 3)],
  term ((124021568 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-62010784 : Rat) / 33189485) [(9, 2), (11, 1), (15, 3)],
  term ((-124021568 : Rat) / 33189485) [(11, 1), (12, 1), (15, 3)],
  term ((62010784 : Rat) / 33189485) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0021_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0021
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0022 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 22 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0022 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((11776 : Rat) / 32699) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((11776 : Rat) / 32699) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((23552 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-11776 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0022_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0022
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0023 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 23 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0023 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 2), (11, 3), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 2), (11, 3), (15, 1)],
  term ((-248043136 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0023_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0023
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0024 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0024 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((47104 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0024_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0024
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYYY_coefficient_26_0025 : Poly :=
[
  term ((97 : Rat) / 29) [(15, 2)]
]

/-- Partial product 25 for generator 26. -/
def rs_R009_ueqv_R009NYYYY_partial_26_0025 : Poly :=
[
  term ((194 : Rat) / 29) [(8, 1), (12, 1), (15, 2)],
  term ((-97 : Rat) / 29) [(8, 2), (15, 2)],
  term ((194 : Rat) / 29) [(9, 1), (13, 1), (15, 2)],
  term ((-97 : Rat) / 29) [(9, 2), (15, 2)],
  term ((-194 : Rat) / 29) [(12, 1), (15, 2)],
  term ((97 : Rat) / 29) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 26. -/
theorem rs_R009_ueqv_R009NYYYY_partial_26_0025_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_26_0025
        rs_R009_ueqv_R009NYYYY_generator_26_0000_0025 =
      rs_R009_ueqv_R009NYYYY_partial_26_0025 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_26_0000_0025 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_26_0000,
  rs_R009_ueqv_R009NYYYY_partial_26_0001,
  rs_R009_ueqv_R009NYYYY_partial_26_0002,
  rs_R009_ueqv_R009NYYYY_partial_26_0003,
  rs_R009_ueqv_R009NYYYY_partial_26_0004,
  rs_R009_ueqv_R009NYYYY_partial_26_0005,
  rs_R009_ueqv_R009NYYYY_partial_26_0006,
  rs_R009_ueqv_R009NYYYY_partial_26_0007,
  rs_R009_ueqv_R009NYYYY_partial_26_0008,
  rs_R009_ueqv_R009NYYYY_partial_26_0009,
  rs_R009_ueqv_R009NYYYY_partial_26_0010,
  rs_R009_ueqv_R009NYYYY_partial_26_0011,
  rs_R009_ueqv_R009NYYYY_partial_26_0012,
  rs_R009_ueqv_R009NYYYY_partial_26_0013,
  rs_R009_ueqv_R009NYYYY_partial_26_0014,
  rs_R009_ueqv_R009NYYYY_partial_26_0015,
  rs_R009_ueqv_R009NYYYY_partial_26_0016,
  rs_R009_ueqv_R009NYYYY_partial_26_0017,
  rs_R009_ueqv_R009NYYYY_partial_26_0018,
  rs_R009_ueqv_R009NYYYY_partial_26_0019,
  rs_R009_ueqv_R009NYYYY_partial_26_0020,
  rs_R009_ueqv_R009NYYYY_partial_26_0021,
  rs_R009_ueqv_R009NYYYY_partial_26_0022,
  rs_R009_ueqv_R009NYYYY_partial_26_0023,
  rs_R009_ueqv_R009NYYYY_partial_26_0024,
  rs_R009_ueqv_R009NYYYY_partial_26_0025
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_26_0000_0025 : Poly :=
[
  term ((-5 : Rat) / 16) [],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44 : Rat) / 29) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (8, 2), (11, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((22 : Rat) / 29) [(3, 1), (8, 2), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44 : Rat) / 29) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (9, 2), (11, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((22 : Rat) / 29) [(3, 1), (9, 2), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(3, 1), (11, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((44 : Rat) / 29) [(3, 1), (12, 1), (15, 1)],
  term ((-22 : Rat) / 29) [(3, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((609696 : Rat) / 32699) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(5, 1), (8, 2), (11, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((-47104 : Rat) / 32699) [(5, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((3434493127 : Rat) / 66378970) [(5, 1), (8, 2), (15, 1)],
  term ((-304848 : Rat) / 32699) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((609696 : Rat) / 32699) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((-47104 : Rat) / 32699) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((3434493127 : Rat) / 66378970) [(5, 1), (9, 2), (15, 1)],
  term ((-304848 : Rat) / 32699) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(5, 1), (11, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-94208 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(5, 1), (11, 2), (15, 1)],
  term ((47104 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((3434493127 : Rat) / 33189485) [(5, 1), (12, 1), (15, 1)],
  term ((-609696 : Rat) / 32699) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3434493127 : Rat) / 66378970) [(5, 1), (15, 1)],
  term ((304848 : Rat) / 32699) [(5, 1), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(7, 1), (8, 2), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(7, 1), (9, 2), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)],
  term ((-2033280 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(7, 1), (15, 1)],
  term ((1016640 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((113 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7378074674 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1425560 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-23552 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 8) [(8, 1), (12, 1)],
  term ((194 : Rat) / 29) [(8, 1), (12, 1), (15, 2)],
  term ((5 : Rat) / 16) [(8, 2)],
  term ((-31005392 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-113 : Rat) / 58) [(8, 2), (9, 1), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((5888 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3751048121 : Rat) / 33189485) [(8, 2), (11, 1), (15, 1)],
  term ((-724556 : Rat) / 32699) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(8, 2), (11, 1), (15, 3)],
  term ((11776 : Rat) / 32699) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 2), (11, 3), (15, 1)],
  term ((23552 : Rat) / 32699) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((-97 : Rat) / 29) [(8, 2), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(8, 3), (11, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7502096242 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1449112 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-23552 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(9, 1), (11, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 29) [(9, 1), (12, 1), (15, 1)],
  term ((-5 : Rat) / 8) [(9, 1), (13, 1)],
  term ((194 : Rat) / 29) [(9, 1), (13, 1), (15, 2)],
  term ((113 : Rat) / 58) [(9, 1), (15, 1)],
  term ((5 : Rat) / 16) [(9, 2)],
  term ((-31005392 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((5888 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3751048121 : Rat) / 33189485) [(9, 2), (11, 1), (15, 1)],
  term ((-724556 : Rat) / 32699) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(9, 2), (11, 1), (15, 3)],
  term ((11776 : Rat) / 32699) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 2), (11, 3), (15, 1)],
  term ((23552 : Rat) / 32699) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((113 : Rat) / 29) [(9, 2), (13, 1), (15, 1)],
  term ((-97 : Rat) / 29) [(9, 2), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(9, 3), (11, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-113 : Rat) / 58) [(9, 3), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7502096242 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)],
  term ((-1449112 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(11, 1), (12, 1), (15, 3)],
  term ((23552 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3751048121 : Rat) / 33189485) [(11, 1), (15, 1)],
  term ((724556 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(11, 1), (15, 3)],
  term ((-11776 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((47104 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(11, 3), (15, 1)],
  term ((-23552 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)],
  term ((5 : Rat) / 8) [(12, 1)],
  term ((-194 : Rat) / 29) [(12, 1), (15, 2)],
  term ((97 : Rat) / 29) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 25. -/
theorem rs_R009_ueqv_R009NYYYY_block_26_0000_0025_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_26_0000_0025
      rs_R009_ueqv_R009NYYYY_block_26_0000_0025 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
