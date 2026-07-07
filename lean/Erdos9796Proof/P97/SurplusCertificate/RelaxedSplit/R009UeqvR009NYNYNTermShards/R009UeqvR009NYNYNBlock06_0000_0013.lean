/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 6:0-13

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 6 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 : Poly :=
[
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0000 : Poly :=
[
  term ((-2885085298027221 : Rat) / 2097797909654734) []
]

/-- Partial product 0 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0000 : Poly :=
[
  term ((2885085298027221 : Rat) / 2097797909654734) [],
  term ((-2885085298027221 : Rat) / 2097797909654734) [(0, 2), (16, 1)],
  term ((-2885085298027221 : Rat) / 2097797909654734) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0000
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0001 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1)]
]

/-- Partial product 1 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0001 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0001
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0002 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (13, 1)]
]

/-- Partial product 2 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0002 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (13, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0002
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0003 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (15, 1)]
]

/-- Partial product 3 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0003 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (15, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0003
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0004 : Poly :=
[
  term ((787287388372487 : Rat) / 1048898954827367) [(2, 1)]
]

/-- Partial product 4 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0004 : Poly :=
[
  term ((787287388372487 : Rat) / 1048898954827367) [(0, 2), (2, 1), (16, 1)],
  term ((787287388372487 : Rat) / 1048898954827367) [(1, 2), (2, 1), (16, 1)],
  term ((-787287388372487 : Rat) / 1048898954827367) [(2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0004
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0005 : Poly :=
[
  term ((-1574574776744974 : Rat) / 1048898954827367) [(3, 1), (15, 1)]
]

/-- Partial product 5 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0005 : Poly :=
[
  term ((-1574574776744974 : Rat) / 1048898954827367) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 1048898954827367) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 1048898954827367) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0005
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0006 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 6 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0006 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0006
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0007 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1)]
]

/-- Partial product 7 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0007 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0007
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0008 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 8 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0008 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0008
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0009 : Poly :=
[
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (13, 1)]
]

/-- Partial product 9 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0009 : Poly :=
[
  term ((1574574776744974 : Rat) / 3146696864482101) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0009
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0010 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 1)]
]

/-- Partial product 10 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0010 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0010
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0011 : Poly :=
[
  term ((-787287388372487 : Rat) / 3146696864482101) [(12, 1)]
]

/-- Partial product 11 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0011 : Poly :=
[
  term ((-787287388372487 : Rat) / 3146696864482101) [(0, 2), (12, 1), (16, 1)],
  term ((-787287388372487 : Rat) / 3146696864482101) [(1, 2), (12, 1), (16, 1)],
  term ((787287388372487 : Rat) / 3146696864482101) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0011
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0012 : Poly :=
[
  term ((7872873883724870 : Rat) / 3146696864482101) [(13, 1), (15, 1)]
]

/-- Partial product 12 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0012 : Poly :=
[
  term ((7872873883724870 : Rat) / 3146696864482101) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((7872873883724870 : Rat) / 3146696864482101) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7872873883724870 : Rat) / 3146696864482101) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0012
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYNYN_coefficient_06_0013 : Poly :=
[
  term ((-1574574776744974 : Rat) / 3146696864482101) [(15, 2)]
]

/-- Partial product 13 for generator 6. -/
def rs_R009_ueqv_R009NYNYN_partial_06_0013 : Poly :=
[
  term ((-1574574776744974 : Rat) / 3146696864482101) [(0, 2), (15, 2), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(1, 2), (15, 2), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 6. -/
theorem rs_R009_ueqv_R009NYNYN_partial_06_0013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_06_0013
        rs_R009_ueqv_R009NYNYN_generator_06_0000_0013 =
      rs_R009_ueqv_R009NYNYN_partial_06_0013 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_06_0000_0013 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_06_0000,
  rs_R009_ueqv_R009NYNYN_partial_06_0001,
  rs_R009_ueqv_R009NYNYN_partial_06_0002,
  rs_R009_ueqv_R009NYNYN_partial_06_0003,
  rs_R009_ueqv_R009NYNYN_partial_06_0004,
  rs_R009_ueqv_R009NYNYN_partial_06_0005,
  rs_R009_ueqv_R009NYNYN_partial_06_0006,
  rs_R009_ueqv_R009NYNYN_partial_06_0007,
  rs_R009_ueqv_R009NYNYN_partial_06_0008,
  rs_R009_ueqv_R009NYNYN_partial_06_0009,
  rs_R009_ueqv_R009NYNYN_partial_06_0010,
  rs_R009_ueqv_R009NYNYN_partial_06_0011,
  rs_R009_ueqv_R009NYNYN_partial_06_0012,
  rs_R009_ueqv_R009NYNYN_partial_06_0013
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_06_0000_0013 : Poly :=
[
  term ((2885085298027221 : Rat) / 2097797909654734) [],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((787287388372487 : Rat) / 1048898954827367) [(0, 2), (2, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 1048898954827367) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-787287388372487 : Rat) / 3146696864482101) [(0, 2), (12, 1), (16, 1)],
  term ((7872873883724870 : Rat) / 3146696864482101) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(0, 2), (15, 2), (16, 1)],
  term ((-2885085298027221 : Rat) / 2097797909654734) [(0, 2), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (13, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (15, 1)],
  term ((787287388372487 : Rat) / 1048898954827367) [(1, 2), (2, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 1048898954827367) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-787287388372487 : Rat) / 3146696864482101) [(1, 2), (12, 1), (16, 1)],
  term ((7872873883724870 : Rat) / 3146696864482101) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(1, 2), (15, 2), (16, 1)],
  term ((-2885085298027221 : Rat) / 2097797909654734) [(1, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 3), (7, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 3), (13, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 3), (15, 1), (16, 1)],
  term ((-787287388372487 : Rat) / 1048898954827367) [(2, 1)],
  term ((1574574776744974 : Rat) / 1048898954827367) [(3, 1), (15, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(7, 1), (13, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 1)],
  term ((787287388372487 : Rat) / 3146696864482101) [(12, 1)],
  term ((-7872873883724870 : Rat) / 3146696864482101) [(13, 1), (15, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 13. -/
theorem rs_R009_ueqv_R009NYNYN_block_06_0000_0013_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_06_0000_0013
      rs_R009_ueqv_R009NYNYN_block_06_0000_0013 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
