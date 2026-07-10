/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 13:0-44

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_13_0000_0044 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0000 : Poly :=
[
  term ((9 : Rat) / 5) []
]

/-- Partial product 0 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0000 : Poly :=
[
  term ((-18 : Rat) / 5) [(2, 1), (4, 1)],
  term ((9 : Rat) / 5) [(2, 2)],
  term ((-18 : Rat) / 5) [(3, 1), (5, 1)],
  term ((9 : Rat) / 5) [(3, 2)],
  term ((18 : Rat) / 5) [(4, 1), (6, 1)],
  term ((18 : Rat) / 5) [(5, 1), (7, 1)],
  term ((-9 : Rat) / 5) [(6, 2)],
  term ((-9 : Rat) / 5) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0000_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0000
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0001 : Poly :=
[
  term ((-73728 : Rat) / 7625) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 1 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0001 : Poly :=
[
  term ((147456 : Rat) / 7625) [(1, 1), (2, 1), (4, 2), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((147456 : Rat) / 7625) [(1, 1), (3, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((-147456 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (6, 2), (12, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1)],
  term ((-147456 : Rat) / 7625) [(1, 1), (4, 2), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0001_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0001
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0002 : Poly :=
[
  term ((36864 : Rat) / 7625) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 2 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0002 : Poly :=
[
  term ((-73728 : Rat) / 7625) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((36864 : Rat) / 7625) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (3, 1), (4, 1), (5, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((-36864 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 2), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0002_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0002
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0003 : Poly :=
[
  term ((24 : Rat) / 5) [(1, 1), (9, 1)]
]

/-- Partial product 3 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0003 : Poly :=
[
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((24 : Rat) / 5) [(1, 1), (2, 2), (9, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((24 : Rat) / 5) [(1, 1), (3, 2), (9, 1)],
  term ((48 : Rat) / 5) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (6, 2), (9, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0003_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0003
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0004 : Poly :=
[
  term ((-48 : Rat) / 5) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 4 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0004 : Poly :=
[
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (4, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (6, 2), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0004_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0004
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0005 : Poly :=
[
  term ((54528 : Rat) / 7625) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 5 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0005 : Poly :=
[
  term ((-109056 : Rat) / 7625) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-109056 : Rat) / 7625) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((109056 : Rat) / 7625) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((109056 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0005_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0005
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0006 : Poly :=
[
  term ((-27264 : Rat) / 7625) [(1, 1), (13, 1)]
]

/-- Partial product 6 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0006 : Poly :=
[
  term ((54528 : Rat) / 7625) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(1, 1), (2, 2), (13, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(1, 1), (3, 2), (13, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((27264 : Rat) / 7625) [(1, 1), (6, 2), (13, 1)],
  term ((27264 : Rat) / 7625) [(1, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0006_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0006
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0007 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 1), (7, 1)]
]

/-- Partial product 7 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0007 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (3, 1), (4, 1), (7, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (3, 1), (7, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (7, 2)],
  term ((12 : Rat) / 5) [(3, 1), (6, 2), (7, 1)],
  term ((12 : Rat) / 5) [(3, 1), (7, 3)],
  term ((24 : Rat) / 5) [(3, 2), (5, 1), (7, 1)],
  term ((-12 : Rat) / 5) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0007_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0007
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0008 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 8 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0008 : Poly :=
[
  term ((-48 : Rat) / 5) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1)],
  term ((24 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((48 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 1)],
  term ((48 : Rat) / 5) [(3, 1), (5, 1), (7, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (7, 3), (14, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (5, 1), (7, 1), (14, 1)],
  term ((24 : Rat) / 5) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0008_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0008
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0009 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 1), (15, 1)]
]

/-- Partial product 9 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0009 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((12 : Rat) / 5) [(2, 2), (3, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (6, 2), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (7, 2), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (5, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0009_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0009
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0010 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 10 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0010 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (10, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (10, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (7, 3), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0010_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0010
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0011 : Poly :=
[
  term ((36864 : Rat) / 7625) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 11 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0011 : Poly :=
[
  term ((-73728 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 1), (7, 3), (12, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0011_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0011
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0012 : Poly :=
[
  term ((-18432 : Rat) / 7625) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 12 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0012 : Poly :=
[
  term ((36864 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((18432 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(4, 1), (7, 3), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0012_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0012
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0013 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 13 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0013 : Poly :=
[
  term ((41472 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (7, 3), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0013_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0013
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0014 : Poly :=
[
  term ((25344 : Rat) / 7625) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 14 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0014 : Poly :=
[
  term ((-50688 : Rat) / 7625) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((25344 : Rat) / 7625) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-50688 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((25344 : Rat) / 7625) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((50688 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-25344 : Rat) / 7625) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((-25344 : Rat) / 7625) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((50688 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0014_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0014
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0015 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 15 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0015 : Poly :=
[
  term ((110592 : Rat) / 7625) [(2, 1), (4, 2), (10, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(2, 2), (4, 1), (10, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (10, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(3, 2), (4, 1), (10, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (6, 2), (10, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (7, 2), (10, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0015_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0015
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0016 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 16 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0016 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0016_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0016
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0017 : Poly :=
[
  term ((10368 : Rat) / 7625) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 17 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0017 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0017_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0017
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0018 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (13, 2)]
]

/-- Partial product 18 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0018 : Poly :=
[
  term ((55296 : Rat) / 7625) [(2, 1), (4, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(2, 2), (4, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(3, 2), (4, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 1), (6, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 2), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0018_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0018
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0019 : Poly :=
[
  term ((41472 : Rat) / 7625) [(4, 1), (13, 2), (14, 1)]
]

/-- Partial product 19 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0019 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(2, 1), (4, 2), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(2, 2), (4, 1), (13, 2), (14, 1)],
  term ((-82944 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(3, 2), (4, 1), (13, 2), (14, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (6, 2), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (7, 2), (13, 2), (14, 1)],
  term ((82944 : Rat) / 7625) [(4, 2), (6, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0019_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0019
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0020 : Poly :=
[
  term ((-9216 : Rat) / 7625) [(5, 1), (13, 1)]
]

/-- Partial product 20 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0020 : Poly :=
[
  term ((18432 : Rat) / 7625) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-9216 : Rat) / 7625) [(2, 2), (5, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(3, 1), (5, 2), (13, 1)],
  term ((-9216 : Rat) / 7625) [(3, 2), (5, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((9216 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)],
  term ((9216 : Rat) / 7625) [(5, 1), (7, 2), (13, 1)],
  term ((-18432 : Rat) / 7625) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0020_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0020
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0021 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 21 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0021 : Poly :=
[
  term ((10944 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(6, 2), (7, 1), (10, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(7, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0021_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0021
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0022 : Poly :=
[
  term ((-6528 : Rat) / 7625) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 22 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0022 : Poly :=
[
  term ((13056 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-6528 : Rat) / 7625) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((13056 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-6528 : Rat) / 7625) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-13056 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-13056 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((6528 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((6528 : Rat) / 7625) [(7, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0022_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0022
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0023 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 23 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0023 : Poly :=
[
  term ((41472 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(7, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0023_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0023
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0024 : Poly :=
[
  term ((-1536 : Rat) / 7625) [(7, 1), (13, 1)]
]

/-- Partial product 24 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0024 : Poly :=
[
  term ((3072 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-1536 : Rat) / 7625) [(2, 2), (7, 1), (13, 1)],
  term ((3072 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-1536 : Rat) / 7625) [(3, 2), (7, 1), (13, 1)],
  term ((-3072 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-3072 : Rat) / 7625) [(5, 1), (7, 2), (13, 1)],
  term ((1536 : Rat) / 7625) [(6, 2), (7, 1), (13, 1)],
  term ((1536 : Rat) / 7625) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0024_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0024
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0025 : Poly :=
[
  term ((4872 : Rat) / 7625) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 25 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0025 : Poly :=
[
  term ((-9744 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((4872 : Rat) / 7625) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-9744 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((4872 : Rat) / 7625) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((9744 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((9744 : Rat) / 7625) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-4872 : Rat) / 7625) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4872 : Rat) / 7625) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0025_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0025
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0026 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 26 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0026 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(7, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0026_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0026
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0027 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (15, 1)]
]

/-- Partial product 27 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0027 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (7, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (15, 1)],
  term ((12 : Rat) / 5) [(6, 2), (7, 1), (15, 1)],
  term ((12 : Rat) / 5) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0027_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0027
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0028 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 28 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0028 : Poly :=
[
  term ((41472 : Rat) / 7625) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0028_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0028
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0029 : Poly :=
[
  term ((-14616 : Rat) / 7625) [(9, 1), (13, 1)]
]

/-- Partial product 29 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0029 : Poly :=
[
  term ((29232 : Rat) / 7625) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-14616 : Rat) / 7625) [(2, 2), (9, 1), (13, 1)],
  term ((29232 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-14616 : Rat) / 7625) [(3, 2), (9, 1), (13, 1)],
  term ((-29232 : Rat) / 7625) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-29232 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((14616 : Rat) / 7625) [(6, 2), (9, 1), (13, 1)],
  term ((14616 : Rat) / 7625) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0029_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0029
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0030 : Poly :=
[
  term ((-12 : Rat) / 5) [(9, 2)]
]

/-- Partial product 30 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0030 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (4, 1), (9, 2)],
  term ((-12 : Rat) / 5) [(2, 2), (9, 2)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (9, 2)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 2)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (9, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (9, 2)],
  term ((12 : Rat) / 5) [(6, 2), (9, 2)],
  term ((12 : Rat) / 5) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0030_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0030
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0031 : Poly :=
[
  term ((12 : Rat) / 5) [(9, 2), (14, 1)]
]

/-- Partial product 31 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0031 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (9, 2), (14, 1)],
  term ((12 : Rat) / 5) [(2, 2), (9, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((12 : Rat) / 5) [(3, 2), (9, 2), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (9, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0031_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0031
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0032 : Poly :=
[
  term ((10944 : Rat) / 7625) [(10, 1), (13, 2)]
]

/-- Partial product 32 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0032 : Poly :=
[
  term ((-21888 : Rat) / 7625) [(2, 1), (4, 1), (10, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(2, 2), (10, 1), (13, 2)],
  term ((-21888 : Rat) / 7625) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(3, 2), (10, 1), (13, 2)],
  term ((21888 : Rat) / 7625) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((21888 : Rat) / 7625) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(6, 2), (10, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(7, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0032_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0032
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0033 : Poly :=
[
  term ((-2736 : Rat) / 7625) [(11, 1), (13, 1)]
]

/-- Partial product 33 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0033 : Poly :=
[
  term ((5472 : Rat) / 7625) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-2736 : Rat) / 7625) [(2, 2), (11, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-2736 : Rat) / 7625) [(3, 2), (11, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((2736 : Rat) / 7625) [(6, 2), (11, 1), (13, 1)],
  term ((2736 : Rat) / 7625) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0033_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0033
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0034 : Poly :=
[
  term ((-12 : Rat) / 5) [(12, 1)]
]

/-- Partial product 34 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0034 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (4, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (12, 1)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (12, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)],
  term ((12 : Rat) / 5) [(6, 2), (12, 1)],
  term ((12 : Rat) / 5) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0034_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0034
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0035 : Poly :=
[
  term ((10368 : Rat) / 7625) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 35 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0035 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0035_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0035
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0036 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(12, 1), (13, 2)]
]

/-- Partial product 36 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0036 : Poly :=
[
  term ((82944 : Rat) / 7625) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(2, 2), (12, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(3, 2), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0036_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0036
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0037 : Poly :=
[
  term ((41472 : Rat) / 7625) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 37 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0037 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(2, 1), (4, 1), (12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((-82944 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0037_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0037
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0038 : Poly :=
[
  term ((12 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 38 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0038 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 2), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(3, 2), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0038_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0038
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0039 : Poly :=
[
  term ((-24 : Rat) / 5) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 39 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0039 : Poly :=
[
  term ((48 : Rat) / 5) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0039_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0039
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0040 : Poly :=
[
  term ((34164 : Rat) / 7625) [(13, 1), (15, 1)]
]

/-- Partial product 40 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0040 : Poly :=
[
  term ((-68328 : Rat) / 7625) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((34164 : Rat) / 7625) [(2, 2), (13, 1), (15, 1)],
  term ((-68328 : Rat) / 7625) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((34164 : Rat) / 7625) [(3, 2), (13, 1), (15, 1)],
  term ((68328 : Rat) / 7625) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((68328 : Rat) / 7625) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-34164 : Rat) / 7625) [(6, 2), (13, 1), (15, 1)],
  term ((-34164 : Rat) / 7625) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0040_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0040
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0041 : Poly :=
[
  term ((26592 : Rat) / 7625) [(13, 2)]
]

/-- Partial product 41 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0041 : Poly :=
[
  term ((-53184 : Rat) / 7625) [(2, 1), (4, 1), (13, 2)],
  term ((26592 : Rat) / 7625) [(2, 2), (13, 2)],
  term ((-53184 : Rat) / 7625) [(3, 1), (5, 1), (13, 2)],
  term ((26592 : Rat) / 7625) [(3, 2), (13, 2)],
  term ((53184 : Rat) / 7625) [(4, 1), (6, 1), (13, 2)],
  term ((53184 : Rat) / 7625) [(5, 1), (7, 1), (13, 2)],
  term ((-26592 : Rat) / 7625) [(6, 2), (13, 2)],
  term ((-26592 : Rat) / 7625) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0041_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0041
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0042 : Poly :=
[
  term ((-9744 : Rat) / 7625) [(13, 2), (14, 1)]
]

/-- Partial product 42 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0042 : Poly :=
[
  term ((19488 : Rat) / 7625) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((-9744 : Rat) / 7625) [(2, 2), (13, 2), (14, 1)],
  term ((19488 : Rat) / 7625) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((-9744 : Rat) / 7625) [(3, 2), (13, 2), (14, 1)],
  term ((-19488 : Rat) / 7625) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-19488 : Rat) / 7625) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((9744 : Rat) / 7625) [(6, 2), (13, 2), (14, 1)],
  term ((9744 : Rat) / 7625) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0042_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0042
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0043 : Poly :=
[
  term ((-9 : Rat) / 5) [(14, 1)]
]

/-- Partial product 43 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0043 : Poly :=
[
  term ((18 : Rat) / 5) [(2, 1), (4, 1), (14, 1)],
  term ((-9 : Rat) / 5) [(2, 2), (14, 1)],
  term ((18 : Rat) / 5) [(3, 1), (5, 1), (14, 1)],
  term ((-9 : Rat) / 5) [(3, 2), (14, 1)],
  term ((-18 : Rat) / 5) [(4, 1), (6, 1), (14, 1)],
  term ((-18 : Rat) / 5) [(5, 1), (7, 1), (14, 1)],
  term ((9 : Rat) / 5) [(6, 2), (14, 1)],
  term ((9 : Rat) / 5) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0043_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0043
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003YY_coefficient_13_0044 : Poly :=
[
  term ((-6 : Rat) / 5) [(15, 2)]
]

/-- Partial product 44 for generator 13. -/
def rs_R003_ueqv_R003YY_partial_13_0044 : Poly :=
[
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(2, 2), (15, 2)],
  term ((12 : Rat) / 5) [(3, 1), (5, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(3, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(4, 1), (6, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (15, 2)],
  term ((6 : Rat) / 5) [(6, 2), (15, 2)],
  term ((6 : Rat) / 5) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 13. -/
theorem rs_R003_ueqv_R003YY_partial_13_0044_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_13_0044
        rs_R003_ueqv_R003YY_generator_13_0000_0044 =
      rs_R003_ueqv_R003YY_partial_13_0044 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_13_0000_0044 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_13_0000,
  rs_R003_ueqv_R003YY_partial_13_0001,
  rs_R003_ueqv_R003YY_partial_13_0002,
  rs_R003_ueqv_R003YY_partial_13_0003,
  rs_R003_ueqv_R003YY_partial_13_0004,
  rs_R003_ueqv_R003YY_partial_13_0005,
  rs_R003_ueqv_R003YY_partial_13_0006,
  rs_R003_ueqv_R003YY_partial_13_0007,
  rs_R003_ueqv_R003YY_partial_13_0008,
  rs_R003_ueqv_R003YY_partial_13_0009,
  rs_R003_ueqv_R003YY_partial_13_0010,
  rs_R003_ueqv_R003YY_partial_13_0011,
  rs_R003_ueqv_R003YY_partial_13_0012,
  rs_R003_ueqv_R003YY_partial_13_0013,
  rs_R003_ueqv_R003YY_partial_13_0014,
  rs_R003_ueqv_R003YY_partial_13_0015,
  rs_R003_ueqv_R003YY_partial_13_0016,
  rs_R003_ueqv_R003YY_partial_13_0017,
  rs_R003_ueqv_R003YY_partial_13_0018,
  rs_R003_ueqv_R003YY_partial_13_0019,
  rs_R003_ueqv_R003YY_partial_13_0020,
  rs_R003_ueqv_R003YY_partial_13_0021,
  rs_R003_ueqv_R003YY_partial_13_0022,
  rs_R003_ueqv_R003YY_partial_13_0023,
  rs_R003_ueqv_R003YY_partial_13_0024,
  rs_R003_ueqv_R003YY_partial_13_0025,
  rs_R003_ueqv_R003YY_partial_13_0026,
  rs_R003_ueqv_R003YY_partial_13_0027,
  rs_R003_ueqv_R003YY_partial_13_0028,
  rs_R003_ueqv_R003YY_partial_13_0029,
  rs_R003_ueqv_R003YY_partial_13_0030,
  rs_R003_ueqv_R003YY_partial_13_0031,
  rs_R003_ueqv_R003YY_partial_13_0032,
  rs_R003_ueqv_R003YY_partial_13_0033,
  rs_R003_ueqv_R003YY_partial_13_0034,
  rs_R003_ueqv_R003YY_partial_13_0035,
  rs_R003_ueqv_R003YY_partial_13_0036,
  rs_R003_ueqv_R003YY_partial_13_0037,
  rs_R003_ueqv_R003YY_partial_13_0038,
  rs_R003_ueqv_R003YY_partial_13_0039,
  rs_R003_ueqv_R003YY_partial_13_0040,
  rs_R003_ueqv_R003YY_partial_13_0041,
  rs_R003_ueqv_R003YY_partial_13_0042,
  rs_R003_ueqv_R003YY_partial_13_0043,
  rs_R003_ueqv_R003YY_partial_13_0044
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_13_0000_0044 : Poly :=
[
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (4, 1), (9, 1), (14, 1)],
  term ((-109056 : Rat) / 7625) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((147456 : Rat) / 7625) [(1, 1), (2, 1), (4, 2), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((24 : Rat) / 5) [(1, 1), (2, 2), (9, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(1, 1), (2, 2), (13, 1)],
  term ((147456 : Rat) / 7625) [(1, 1), (3, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (3, 1), (4, 1), (5, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1)],
  term ((-109056 : Rat) / 7625) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((24 : Rat) / 5) [(1, 1), (3, 2), (9, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(1, 1), (3, 2), (13, 1)],
  term ((-147456 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((48 : Rat) / 5) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((109056 : Rat) / 7625) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (6, 2), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((-147456 : Rat) / 7625) [(1, 1), (4, 2), (6, 1), (12, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 2), (6, 1), (13, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((109056 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (6, 2), (9, 1)],
  term ((48 : Rat) / 5) [(1, 1), (6, 2), (9, 1), (14, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((27264 : Rat) / 7625) [(1, 1), (6, 2), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (7, 2), (9, 1)],
  term ((48 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (14, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((27264 : Rat) / 7625) [(1, 1), (7, 2), (13, 1)],
  term ((24 : Rat) / 5) [(2, 1), (3, 1), (4, 1), (7, 1)],
  term ((-48 : Rat) / 5) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(2, 1), (4, 1)],
  term ((18432 : Rat) / 7625) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((13056 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-9744 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((41472 : Rat) / 7625) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((29232 : Rat) / 7625) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((24 : Rat) / 5) [(2, 1), (4, 1), (9, 2)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (9, 2), (14, 1)],
  term ((-21888 : Rat) / 7625) [(2, 1), (4, 1), (10, 1), (13, 2)],
  term ((5472 : Rat) / 7625) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(2, 1), (4, 1), (12, 1)],
  term ((-20736 : Rat) / 7625) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((82944 : Rat) / 7625) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(2, 1), (4, 1), (12, 1), (13, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-68328 : Rat) / 7625) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-53184 : Rat) / 7625) [(2, 1), (4, 1), (13, 2)],
  term ((19488 : Rat) / 7625) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((18 : Rat) / 5) [(2, 1), (4, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (15, 2)],
  term ((-55296 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (10, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-50688 : Rat) / 7625) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(2, 1), (4, 2), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((55296 : Rat) / 7625) [(2, 1), (4, 2), (13, 2)],
  term ((-82944 : Rat) / 7625) [(2, 1), (4, 2), (13, 2), (14, 1)],
  term ((9 : Rat) / 5) [(2, 2)],
  term ((-12 : Rat) / 5) [(2, 2), (3, 1), (7, 1)],
  term ((24 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 2), (3, 1), (15, 1)],
  term ((27648 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((25344 : Rat) / 7625) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(2, 2), (4, 1), (10, 1), (13, 2)],
  term ((13824 : Rat) / 7625) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((10368 : Rat) / 7625) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-27648 : Rat) / 7625) [(2, 2), (4, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(2, 2), (4, 1), (13, 2), (14, 1)],
  term ((-9216 : Rat) / 7625) [(2, 2), (5, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-6528 : Rat) / 7625) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7625) [(2, 2), (7, 1), (13, 1)],
  term ((4872 : Rat) / 7625) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (7, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-14616 : Rat) / 7625) [(2, 2), (9, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (9, 2)],
  term ((12 : Rat) / 5) [(2, 2), (9, 2), (14, 1)],
  term ((10944 : Rat) / 7625) [(2, 2), (10, 1), (13, 2)],
  term ((-2736 : Rat) / 7625) [(2, 2), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (12, 1)],
  term ((10368 : Rat) / 7625) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-41472 : Rat) / 7625) [(2, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((12 : Rat) / 5) [(2, 2), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((34164 : Rat) / 7625) [(2, 2), (13, 1), (15, 1)],
  term ((26592 : Rat) / 7625) [(2, 2), (13, 2)],
  term ((-9744 : Rat) / 7625) [(2, 2), (13, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(2, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(2, 2), (15, 2)],
  term ((-55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-50688 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((48 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 1)],
  term ((24 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(3, 1), (5, 1)],
  term ((10944 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((13056 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-9744 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (7, 2)],
  term ((48 : Rat) / 5) [(3, 1), (5, 1), (7, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((29232 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (9, 2)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((-21888 : Rat) / 7625) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((5472 : Rat) / 7625) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (12, 1)],
  term ((-20736 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((82944 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-68328 : Rat) / 7625) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-53184 : Rat) / 7625) [(3, 1), (5, 1), (13, 2)],
  term ((19488 : Rat) / 7625) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((18 : Rat) / 5) [(3, 1), (5, 1), (14, 1)],
  term ((12 : Rat) / 5) [(3, 1), (5, 1), (15, 2)],
  term ((18432 : Rat) / 7625) [(3, 1), (5, 2), (13, 1)],
  term ((12 : Rat) / 5) [(3, 1), (6, 2), (7, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (6, 2), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (7, 2), (15, 1)],
  term ((12 : Rat) / 5) [(3, 1), (7, 3)],
  term ((-24 : Rat) / 5) [(3, 1), (7, 3), (14, 1)],
  term ((9 : Rat) / 5) [(3, 2)],
  term ((27648 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((25344 : Rat) / 7625) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(3, 2), (4, 1), (10, 1), (13, 2)],
  term ((13824 : Rat) / 7625) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((10368 : Rat) / 7625) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-27648 : Rat) / 7625) [(3, 2), (4, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(3, 2), (4, 1), (13, 2), (14, 1)],
  term ((24 : Rat) / 5) [(3, 2), (5, 1), (7, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (5, 1), (7, 1), (14, 1)],
  term ((-9216 : Rat) / 7625) [(3, 2), (5, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (5, 1), (15, 1)],
  term ((-5472 : Rat) / 7625) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((-6528 : Rat) / 7625) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7625) [(3, 2), (7, 1), (13, 1)],
  term ((4872 : Rat) / 7625) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-14616 : Rat) / 7625) [(3, 2), (9, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 2)],
  term ((12 : Rat) / 5) [(3, 2), (9, 2), (14, 1)],
  term ((10944 : Rat) / 7625) [(3, 2), (10, 1), (13, 2)],
  term ((-2736 : Rat) / 7625) [(3, 2), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (12, 1)],
  term ((10368 : Rat) / 7625) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-41472 : Rat) / 7625) [(3, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((12 : Rat) / 5) [(3, 2), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((34164 : Rat) / 7625) [(3, 2), (13, 1), (15, 1)],
  term ((26592 : Rat) / 7625) [(3, 2), (13, 2)],
  term ((-9744 : Rat) / 7625) [(3, 2), (13, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(3, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(3, 3), (7, 1)],
  term ((24 : Rat) / 5) [(3, 3), (7, 1), (14, 1)],
  term ((12 : Rat) / 5) [(3, 3), (15, 1)],
  term ((-18432 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((50688 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (10, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1), (14, 1)],
  term ((18 : Rat) / 5) [(4, 1), (6, 1)],
  term ((-10944 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-13056 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((9744 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-29232 : Rat) / 7625) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (9, 2)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((21888 : Rat) / 7625) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-5472 : Rat) / 7625) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (12, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((68328 : Rat) / 7625) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((53184 : Rat) / 7625) [(4, 1), (6, 1), (13, 2)],
  term ((-19488 : Rat) / 7625) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-18 : Rat) / 5) [(4, 1), (6, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (6, 1), (15, 2)],
  term ((-27648 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (10, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (12, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1), (14, 1)],
  term ((-25344 : Rat) / 7625) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (6, 2), (10, 1), (13, 2)],
  term ((-13824 : Rat) / 7625) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((-10368 : Rat) / 7625) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (6, 2), (13, 2)],
  term ((-41472 : Rat) / 7625) [(4, 1), (6, 2), (13, 2), (14, 1)],
  term ((-25344 : Rat) / 7625) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (7, 2), (10, 1), (13, 2)],
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-10368 : Rat) / 7625) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 2), (13, 2)],
  term ((-41472 : Rat) / 7625) [(4, 1), (7, 2), (13, 2), (14, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (7, 3), (10, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 1), (7, 3), (12, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(4, 1), (7, 3), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (7, 3), (13, 1), (14, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((50688 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (10, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(4, 2), (6, 1), (13, 2), (14, 1)],
  term ((9216 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)],
  term ((18 : Rat) / 5) [(5, 1), (7, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-29232 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (9, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (14, 1)],
  term ((21888 : Rat) / 7625) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-5472 : Rat) / 7625) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)],
  term ((20736 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((68328 : Rat) / 7625) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((53184 : Rat) / 7625) [(5, 1), (7, 1), (13, 2)],
  term ((-19488 : Rat) / 7625) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((-18 : Rat) / 5) [(5, 1), (7, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (15, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-13056 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((6144 : Rat) / 7625) [(5, 1), (7, 2), (13, 1)],
  term ((9744 : Rat) / 7625) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (15, 1)],
  term ((-18432 : Rat) / 7625) [(5, 2), (7, 1), (13, 1)],
  term ((-9 : Rat) / 5) [(6, 2)],
  term ((5472 : Rat) / 7625) [(6, 2), (7, 1), (10, 1), (13, 1)],
  term ((6528 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7625) [(6, 2), (7, 1), (13, 1)],
  term ((-4872 : Rat) / 7625) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(6, 2), (7, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((14616 : Rat) / 7625) [(6, 2), (9, 1), (13, 1)],
  term ((12 : Rat) / 5) [(6, 2), (9, 2)],
  term ((-12 : Rat) / 5) [(6, 2), (9, 2), (14, 1)],
  term ((-10944 : Rat) / 7625) [(6, 2), (10, 1), (13, 2)],
  term ((2736 : Rat) / 7625) [(6, 2), (11, 1), (13, 1)],
  term ((12 : Rat) / 5) [(6, 2), (12, 1)],
  term ((-10368 : Rat) / 7625) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-34164 : Rat) / 7625) [(6, 2), (13, 1), (15, 1)],
  term ((-26592 : Rat) / 7625) [(6, 2), (13, 2)],
  term ((9744 : Rat) / 7625) [(6, 2), (13, 2), (14, 1)],
  term ((9 : Rat) / 5) [(6, 2), (14, 1)],
  term ((6 : Rat) / 5) [(6, 2), (15, 2)],
  term ((-9 : Rat) / 5) [(7, 2)],
  term ((20736 : Rat) / 7625) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((14616 : Rat) / 7625) [(7, 2), (9, 1), (13, 1)],
  term ((12 : Rat) / 5) [(7, 2), (9, 2)],
  term ((-12 : Rat) / 5) [(7, 2), (9, 2), (14, 1)],
  term ((-10944 : Rat) / 7625) [(7, 2), (10, 1), (13, 2)],
  term ((2736 : Rat) / 7625) [(7, 2), (11, 1), (13, 1)],
  term ((12 : Rat) / 5) [(7, 2), (12, 1)],
  term ((-10368 : Rat) / 7625) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-34164 : Rat) / 7625) [(7, 2), (13, 1), (15, 1)],
  term ((-26592 : Rat) / 7625) [(7, 2), (13, 2)],
  term ((9744 : Rat) / 7625) [(7, 2), (13, 2), (14, 1)],
  term ((9 : Rat) / 5) [(7, 2), (14, 1)],
  term ((6 : Rat) / 5) [(7, 2), (15, 2)],
  term ((5472 : Rat) / 7625) [(7, 3), (10, 1), (13, 1)],
  term ((6528 : Rat) / 7625) [(7, 3), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(7, 3), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7625) [(7, 3), (13, 1)],
  term ((-4872 : Rat) / 7625) [(7, 3), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 3), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 44. -/
theorem rs_R003_ueqv_R003YY_block_13_0000_0044_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_13_0000_0044
      rs_R003_ueqv_R003YY_block_13_0000_0044 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
