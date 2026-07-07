/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 7:0-5

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_07_0000_0005 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYYY_coefficient_07_0000 : Poly :=
[
  term ((17274868312 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R009_ueqv_R009NYYYY_partial_07_0000 : Poly :=
[
  term ((-34549736624 : Rat) / 33189485) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((34549736624 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-34549736624 : Rat) / 33189485) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((34549736624 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((17274868312 : Rat) / 33189485) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((17274868312 : Rat) / 33189485) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-17274868312 : Rat) / 33189485) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-17274868312 : Rat) / 33189485) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R009_ueqv_R009NYYYY_partial_07_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_07_0000
        rs_R009_ueqv_R009NYYYY_generator_07_0000_0005 =
      rs_R009_ueqv_R009NYYYY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYYY_coefficient_07_0001 : Poly :=
[
  term ((-3304080 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R009_ueqv_R009NYYYY_partial_07_0001 : Poly :=
[
  term ((6608160 : Rat) / 32699) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6608160 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6608160 : Rat) / 32699) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6608160 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3304080 : Rat) / 32699) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3304080 : Rat) / 32699) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R009_ueqv_R009NYYYY_partial_07_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_07_0001
        rs_R009_ueqv_R009NYYYY_generator_07_0000_0005 =
      rs_R009_ueqv_R009NYYYY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYYY_coefficient_07_0002 : Poly :=
[
  term ((-3654299066 : Rat) / 6637897) [(11, 1), (15, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R009_ueqv_R009NYYYY_partial_07_0002 : Poly :=
[
  term ((7308598132 : Rat) / 6637897) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-7308598132 : Rat) / 6637897) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((7308598132 : Rat) / 6637897) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-7308598132 : Rat) / 6637897) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-3654299066 : Rat) / 6637897) [(2, 2), (11, 1), (15, 1)],
  term ((-3654299066 : Rat) / 6637897) [(3, 2), (11, 1), (15, 1)],
  term ((3654299066 : Rat) / 6637897) [(6, 2), (11, 1), (15, 1)],
  term ((3654299066 : Rat) / 6637897) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R009_ueqv_R009NYYYY_partial_07_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_07_0002
        rs_R009_ueqv_R009NYYYY_generator_07_0000_0005 =
      rs_R009_ueqv_R009NYYYY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYYY_coefficient_07_0003 : Poly :=
[
  term ((3494700 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R009_ueqv_R009NYYYY_partial_07_0003 : Poly :=
[
  term ((-6989400 : Rat) / 32699) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((6989400 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6989400 : Rat) / 32699) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((6989400 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3494700 : Rat) / 32699) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((3494700 : Rat) / 32699) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3494700 : Rat) / 32699) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3494700 : Rat) / 32699) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R009_ueqv_R009NYYYY_partial_07_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_07_0003
        rs_R009_ueqv_R009NYYYY_generator_07_0000_0005 =
      rs_R009_ueqv_R009NYYYY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYYY_coefficient_07_0004 : Poly :=
[
  term ((-5315344096 : Rat) / 33189485) [(13, 1), (15, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R009_ueqv_R009NYYYY_partial_07_0004 : Poly :=
[
  term ((10630688192 : Rat) / 33189485) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-10630688192 : Rat) / 33189485) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((10630688192 : Rat) / 33189485) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-10630688192 : Rat) / 33189485) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-5315344096 : Rat) / 33189485) [(2, 2), (13, 1), (15, 1)],
  term ((-5315344096 : Rat) / 33189485) [(3, 2), (13, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(6, 2), (13, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R009_ueqv_R009NYYYY_partial_07_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_07_0004
        rs_R009_ueqv_R009NYYYY_generator_07_0000_0005 =
      rs_R009_ueqv_R009NYYYY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYYY_coefficient_07_0005 : Poly :=
[
  term ((1016640 : Rat) / 32699) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R009_ueqv_R009NYYYY_partial_07_0005 : Poly :=
[
  term ((-2033280 : Rat) / 32699) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((2033280 : Rat) / 32699) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((2033280 : Rat) / 32699) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1016640 : Rat) / 32699) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1016640 : Rat) / 32699) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R009_ueqv_R009NYYYY_partial_07_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_07_0005
        rs_R009_ueqv_R009NYYYY_generator_07_0000_0005 =
      rs_R009_ueqv_R009NYYYY_partial_07_0005 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_07_0000_0005 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_07_0000,
  rs_R009_ueqv_R009NYYYY_partial_07_0001,
  rs_R009_ueqv_R009NYYYY_partial_07_0002,
  rs_R009_ueqv_R009NYYYY_partial_07_0003,
  rs_R009_ueqv_R009NYYYY_partial_07_0004,
  rs_R009_ueqv_R009NYYYY_partial_07_0005
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_07_0000_0005 : Poly :=
[
  term ((-34549736624 : Rat) / 33189485) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7308598132 : Rat) / 6637897) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-6989400 : Rat) / 32699) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-2033280 : Rat) / 32699) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((34549736624 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6608160 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7308598132 : Rat) / 6637897) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((6989400 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((2033280 : Rat) / 32699) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7308598132 : Rat) / 6637897) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-6989400 : Rat) / 32699) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-2033280 : Rat) / 32699) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((34549736624 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6608160 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7308598132 : Rat) / 6637897) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((6989400 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((2033280 : Rat) / 32699) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3654299066 : Rat) / 6637897) [(2, 2), (11, 1), (15, 1)],
  term ((3494700 : Rat) / 32699) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(2, 2), (13, 1), (15, 1)],
  term ((1016640 : Rat) / 32699) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3654299066 : Rat) / 6637897) [(3, 2), (11, 1), (15, 1)],
  term ((3494700 : Rat) / 32699) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(3, 2), (13, 1), (15, 1)],
  term ((1016640 : Rat) / 32699) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17274868312 : Rat) / 33189485) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((3304080 : Rat) / 32699) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3654299066 : Rat) / 6637897) [(6, 2), (11, 1), (15, 1)],
  term ((-3494700 : Rat) / 32699) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(6, 2), (13, 1), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17274868312 : Rat) / 33189485) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((3304080 : Rat) / 32699) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3654299066 : Rat) / 6637897) [(7, 2), (11, 1), (15, 1)],
  term ((-3494700 : Rat) / 32699) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(7, 2), (13, 1), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 5. -/
theorem rs_R009_ueqv_R009NYYYY_block_07_0000_0005_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_07_0000_0005
      rs_R009_ueqv_R009NYYYY_block_07_0000_0005 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
