/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 24:0-22

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0000 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 0 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0000 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0000
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0001 : Poly :=
[
  term ((5888 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0001 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(0, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(1, 1), (3, 1), (11, 3), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(1, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0001
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0002 : Poly :=
[
  term ((-6131446859 : Rat) / 132757940) [(3, 1), (15, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0002 : Poly :=
[
  term ((6131446859 : Rat) / 66378970) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-6131446859 : Rat) / 132757940) [(0, 2), (3, 1), (15, 1)],
  term ((6131446859 : Rat) / 66378970) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-6131446859 : Rat) / 132757940) [(1, 2), (3, 1), (15, 1)],
  term ((-6131446859 : Rat) / 66378970) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6131446859 : Rat) / 66378970) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((6131446859 : Rat) / 132757940) [(3, 1), (12, 2), (15, 1)],
  term ((6131446859 : Rat) / 132757940) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0002
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0003 : Poly :=
[
  term ((293566 : Rat) / 32699) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0003 : Poly :=
[
  term ((-587132 : Rat) / 32699) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((293566 : Rat) / 32699) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-587132 : Rat) / 32699) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((293566 : Rat) / 32699) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((587132 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((587132 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-293566 : Rat) / 32699) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-293566 : Rat) / 32699) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0003
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0004 : Poly :=
[
  term ((32 : Rat) / 29) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 4 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0004 : Poly :=
[
  term ((-64 : Rat) / 29) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((32 : Rat) / 29) [(0, 2), (5, 1), (9, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((32 : Rat) / 29) [(1, 2), (5, 1), (9, 1), (15, 2)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-32 : Rat) / 29) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-32 : Rat) / 29) [(5, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0004
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0005 : Poly :=
[
  term ((-2046355872 : Rat) / 6637897) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 5 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0005 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((2046355872 : Rat) / 6637897) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((2046355872 : Rat) / 6637897) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0005
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0006 : Poly :=
[
  term ((1943040 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0006 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1943040 : Rat) / 32699) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1943040 : Rat) / 32699) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((3886080 : Rat) / 32699) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0006
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0007 : Poly :=
[
  term ((-1826759622 : Rat) / 33189485) [(5, 1), (15, 1)]
]

/-- Partial product 7 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0007 : Poly :=
[
  term ((3653519244 : Rat) / 33189485) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-1826759622 : Rat) / 33189485) [(0, 2), (5, 1), (15, 1)],
  term ((3653519244 : Rat) / 33189485) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-1826759622 : Rat) / 33189485) [(1, 2), (5, 1), (15, 1)],
  term ((-3653519244 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3653519244 : Rat) / 33189485) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((1826759622 : Rat) / 33189485) [(5, 1), (12, 2), (15, 1)],
  term ((1826759622 : Rat) / 33189485) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0007
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0008 : Poly :=
[
  term ((359862 : Rat) / 32699) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0008 : Poly :=
[
  term ((-719724 : Rat) / 32699) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((359862 : Rat) / 32699) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-719724 : Rat) / 32699) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((359862 : Rat) / 32699) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((719724 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((719724 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-359862 : Rat) / 32699) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-359862 : Rat) / 32699) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0008
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0009 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0009 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0009
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0010 : Poly :=
[
  term ((11776 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0010 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0010
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0011 : Poly :=
[
  term ((5 : Rat) / 29) [(9, 1), (15, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0011 : Poly :=
[
  term ((-10 : Rat) / 29) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((5 : Rat) / 29) [(0, 2), (9, 1), (15, 1)],
  term ((-10 : Rat) / 29) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((5 : Rat) / 29) [(1, 2), (9, 1), (15, 1)],
  term ((10 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((10 : Rat) / 29) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5 : Rat) / 29) [(9, 1), (12, 2), (15, 1)],
  term ((-5 : Rat) / 29) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0011
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0012 : Poly :=
[
  term ((-20 : Rat) / 29) [(9, 1), (15, 3)]
]

/-- Partial product 12 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0012 : Poly :=
[
  term ((40 : Rat) / 29) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((-20 : Rat) / 29) [(0, 2), (9, 1), (15, 3)],
  term ((40 : Rat) / 29) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((-20 : Rat) / 29) [(1, 2), (9, 1), (15, 3)],
  term ((-40 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-40 : Rat) / 29) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((20 : Rat) / 29) [(9, 1), (12, 2), (15, 3)],
  term ((20 : Rat) / 29) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0012_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0012
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0013 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0013 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0013_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0013
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0014 : Poly :=
[
  term ((5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0014 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0014_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0014
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0015 : Poly :=
[
  term ((-131772916 : Rat) / 4741355) [(11, 1), (15, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0015 : Poly :=
[
  term ((263545832 : Rat) / 4741355) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-131772916 : Rat) / 4741355) [(0, 2), (11, 1), (15, 1)],
  term ((263545832 : Rat) / 4741355) [(1, 1), (11, 2), (15, 1)],
  term ((-131772916 : Rat) / 4741355) [(1, 2), (11, 1), (15, 1)],
  term ((-263545832 : Rat) / 4741355) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((131772916 : Rat) / 4741355) [(11, 1), (12, 2), (15, 1)],
  term ((131772916 : Rat) / 4741355) [(11, 1), (13, 2), (15, 1)],
  term ((-263545832 : Rat) / 4741355) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0015_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0015
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0016 : Poly :=
[
  term ((175168 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0016 : Poly :=
[
  term ((-350336 : Rat) / 32699) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((175168 : Rat) / 32699) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-350336 : Rat) / 32699) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((175168 : Rat) / 32699) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((350336 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-175168 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-175168 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((350336 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0016_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0016
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0017 : Poly :=
[
  term ((6418116144 : Rat) / 33189485) [(11, 1), (15, 3)]
]

/-- Partial product 17 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0017 : Poly :=
[
  term ((-12836232288 : Rat) / 33189485) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((6418116144 : Rat) / 33189485) [(0, 2), (11, 1), (15, 3)],
  term ((-12836232288 : Rat) / 33189485) [(1, 1), (11, 2), (15, 3)],
  term ((6418116144 : Rat) / 33189485) [(1, 2), (11, 1), (15, 3)],
  term ((12836232288 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-6418116144 : Rat) / 33189485) [(11, 1), (12, 2), (15, 3)],
  term ((-6418116144 : Rat) / 33189485) [(11, 1), (13, 2), (15, 3)],
  term ((12836232288 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0017_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0017
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0018 : Poly :=
[
  term ((-1218816 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0018 : Poly :=
[
  term ((2437632 : Rat) / 32699) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1218816 : Rat) / 32699) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((2437632 : Rat) / 32699) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1218816 : Rat) / 32699) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2437632 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1218816 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((1218816 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2437632 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0018_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0018
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0019 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 19 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0019 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(0, 2), (11, 2), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(1, 1), (11, 3), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(1, 2), (11, 2), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(11, 2), (12, 2), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0019_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0019
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0020 : Poly :=
[
  term ((5888 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0020 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(0, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0020_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0020
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0021 : Poly :=
[
  term ((1918475661 : Rat) / 18965420) [(15, 2)]
]

/-- Partial product 21 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0021 : Poly :=
[
  term ((-1918475661 : Rat) / 9482710) [(0, 1), (10, 1), (15, 2)],
  term ((1918475661 : Rat) / 18965420) [(0, 2), (15, 2)],
  term ((-1918475661 : Rat) / 9482710) [(1, 1), (11, 1), (15, 2)],
  term ((1918475661 : Rat) / 18965420) [(1, 2), (15, 2)],
  term ((1918475661 : Rat) / 9482710) [(10, 1), (12, 1), (15, 2)],
  term ((1918475661 : Rat) / 9482710) [(11, 1), (13, 1), (15, 2)],
  term ((-1918475661 : Rat) / 18965420) [(12, 2), (15, 2)],
  term ((-1918475661 : Rat) / 18965420) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0021_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0021
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NYYYY_coefficient_24_0022 : Poly :=
[
  term ((-653428 : Rat) / 32699) [(15, 2), (16, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R009_ueqv_R009NYYYY_partial_24_0022 : Poly :=
[
  term ((1306856 : Rat) / 32699) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-653428 : Rat) / 32699) [(0, 2), (15, 2), (16, 1)],
  term ((1306856 : Rat) / 32699) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-653428 : Rat) / 32699) [(1, 2), (15, 2), (16, 1)],
  term ((-1306856 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1306856 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((653428 : Rat) / 32699) [(12, 2), (15, 2), (16, 1)],
  term ((653428 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R009_ueqv_R009NYYYY_partial_24_0022_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_24_0022
        rs_R009_ueqv_R009NYYYY_generator_24_0000_0022 =
      rs_R009_ueqv_R009NYYYY_partial_24_0022 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_24_0000_0022 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_24_0000,
  rs_R009_ueqv_R009NYYYY_partial_24_0001,
  rs_R009_ueqv_R009NYYYY_partial_24_0002,
  rs_R009_ueqv_R009NYYYY_partial_24_0003,
  rs_R009_ueqv_R009NYYYY_partial_24_0004,
  rs_R009_ueqv_R009NYYYY_partial_24_0005,
  rs_R009_ueqv_R009NYYYY_partial_24_0006,
  rs_R009_ueqv_R009NYYYY_partial_24_0007,
  rs_R009_ueqv_R009NYYYY_partial_24_0008,
  rs_R009_ueqv_R009NYYYY_partial_24_0009,
  rs_R009_ueqv_R009NYYYY_partial_24_0010,
  rs_R009_ueqv_R009NYYYY_partial_24_0011,
  rs_R009_ueqv_R009NYYYY_partial_24_0012,
  rs_R009_ueqv_R009NYYYY_partial_24_0013,
  rs_R009_ueqv_R009NYYYY_partial_24_0014,
  rs_R009_ueqv_R009NYYYY_partial_24_0015,
  rs_R009_ueqv_R009NYYYY_partial_24_0016,
  rs_R009_ueqv_R009NYYYY_partial_24_0017,
  rs_R009_ueqv_R009NYYYY_partial_24_0018,
  rs_R009_ueqv_R009NYYYY_partial_24_0019,
  rs_R009_ueqv_R009NYYYY_partial_24_0020,
  rs_R009_ueqv_R009NYYYY_partial_24_0021,
  rs_R009_ueqv_R009NYYYY_partial_24_0022
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_24_0000_0022 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((6131446859 : Rat) / 66378970) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-587132 : Rat) / 32699) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 29) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3653519244 : Rat) / 33189485) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-719724 : Rat) / 32699) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-23552 : Rat) / 32699) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 29) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((40 : Rat) / 29) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((263545832 : Rat) / 4741355) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-350336 : Rat) / 32699) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12836232288 : Rat) / 33189485) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((2437632 : Rat) / 32699) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((-11776 : Rat) / 32699) [(0, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1918475661 : Rat) / 9482710) [(0, 1), (10, 1), (15, 2)],
  term ((1306856 : Rat) / 32699) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((5888 : Rat) / 32699) [(0, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6131446859 : Rat) / 132757940) [(0, 2), (3, 1), (15, 1)],
  term ((293566 : Rat) / 32699) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 29) [(0, 2), (5, 1), (9, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((1943040 : Rat) / 32699) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1826759622 : Rat) / 33189485) [(0, 2), (5, 1), (15, 1)],
  term ((359862 : Rat) / 32699) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 29) [(0, 2), (9, 1), (15, 1)],
  term ((-20 : Rat) / 29) [(0, 2), (9, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((5888 : Rat) / 32699) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-131772916 : Rat) / 4741355) [(0, 2), (11, 1), (15, 1)],
  term ((175168 : Rat) / 32699) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((6418116144 : Rat) / 33189485) [(0, 2), (11, 1), (15, 3)],
  term ((-1218816 : Rat) / 32699) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(0, 2), (11, 2), (15, 2)],
  term ((5888 : Rat) / 32699) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((1918475661 : Rat) / 18965420) [(0, 2), (15, 2)],
  term ((-653428 : Rat) / 32699) [(0, 2), (15, 2), (16, 1)],
  term ((6131446859 : Rat) / 66378970) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-587132 : Rat) / 32699) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-11776 : Rat) / 32699) [(1, 1), (3, 1), (11, 3), (15, 1), (16, 1)],
  term ((-64 : Rat) / 29) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((3653519244 : Rat) / 33189485) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-719724 : Rat) / 32699) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-23552 : Rat) / 32699) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-10 : Rat) / 29) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((40 : Rat) / 29) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((62010784 : Rat) / 33189485) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1918475661 : Rat) / 9482710) [(1, 1), (11, 1), (15, 2)],
  term ((1306856 : Rat) / 32699) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((263545832 : Rat) / 4741355) [(1, 1), (11, 2), (15, 1)],
  term ((-350336 : Rat) / 32699) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12836232288 : Rat) / 33189485) [(1, 1), (11, 2), (15, 3)],
  term ((2437632 : Rat) / 32699) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(1, 1), (11, 3), (15, 2)],
  term ((-11776 : Rat) / 32699) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((5888 : Rat) / 32699) [(1, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6131446859 : Rat) / 132757940) [(1, 2), (3, 1), (15, 1)],
  term ((293566 : Rat) / 32699) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 29) [(1, 2), (5, 1), (9, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((1943040 : Rat) / 32699) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1826759622 : Rat) / 33189485) [(1, 2), (5, 1), (15, 1)],
  term ((359862 : Rat) / 32699) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 29) [(1, 2), (9, 1), (15, 1)],
  term ((-20 : Rat) / 29) [(1, 2), (9, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((5888 : Rat) / 32699) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-131772916 : Rat) / 4741355) [(1, 2), (11, 1), (15, 1)],
  term ((175168 : Rat) / 32699) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((6418116144 : Rat) / 33189485) [(1, 2), (11, 1), (15, 3)],
  term ((-1218816 : Rat) / 32699) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(1, 2), (11, 2), (15, 2)],
  term ((5888 : Rat) / 32699) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((1918475661 : Rat) / 18965420) [(1, 2), (15, 2)],
  term ((-653428 : Rat) / 32699) [(1, 2), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6131446859 : Rat) / 66378970) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((587132 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6131446859 : Rat) / 66378970) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((587132 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-5888 : Rat) / 32699) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-5888 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((6131446859 : Rat) / 132757940) [(3, 1), (12, 2), (15, 1)],
  term ((-293566 : Rat) / 32699) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((6131446859 : Rat) / 132757940) [(3, 1), (13, 2), (15, 1)],
  term ((-293566 : Rat) / 32699) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-32 : Rat) / 29) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-32 : Rat) / 29) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3653519244 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((719724 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2046355872 : Rat) / 6637897) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-1943040 : Rat) / 32699) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3653519244 : Rat) / 33189485) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((719724 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2046355872 : Rat) / 6637897) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1943040 : Rat) / 32699) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((3886080 : Rat) / 32699) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1826759622 : Rat) / 33189485) [(5, 1), (12, 2), (15, 1)],
  term ((-359862 : Rat) / 32699) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((1826759622 : Rat) / 33189485) [(5, 1), (13, 2), (15, 1)],
  term ((-359862 : Rat) / 32699) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-40 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((10 : Rat) / 29) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-40 : Rat) / 29) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-5 : Rat) / 29) [(9, 1), (12, 2), (15, 1)],
  term ((20 : Rat) / 29) [(9, 1), (12, 2), (15, 3)],
  term ((-5 : Rat) / 29) [(9, 1), (13, 2), (15, 1)],
  term ((20 : Rat) / 29) [(9, 1), (13, 2), (15, 3)],
  term ((-263545832 : Rat) / 4741355) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((350336 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12836232288 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-2437632 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1918475661 : Rat) / 9482710) [(10, 1), (12, 1), (15, 2)],
  term ((-1306856 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131772916 : Rat) / 4741355) [(11, 1), (12, 2), (15, 1)],
  term ((-175168 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6418116144 : Rat) / 33189485) [(11, 1), (12, 2), (15, 3)],
  term ((1218816 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((1918475661 : Rat) / 9482710) [(11, 1), (13, 1), (15, 2)],
  term ((-1306856 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((131772916 : Rat) / 4741355) [(11, 1), (13, 2), (15, 1)],
  term ((-175168 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6418116144 : Rat) / 33189485) [(11, 1), (13, 2), (15, 3)],
  term ((1218816 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(11, 2), (12, 2), (15, 2)],
  term ((-5888 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-263545832 : Rat) / 4741355) [(11, 2), (13, 1), (15, 1)],
  term ((350336 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((12836232288 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((-2437632 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)],
  term ((-5888 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1918475661 : Rat) / 18965420) [(12, 2), (15, 2)],
  term ((653428 : Rat) / 32699) [(12, 2), (15, 2), (16, 1)],
  term ((-1918475661 : Rat) / 18965420) [(13, 2), (15, 2)],
  term ((653428 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 22. -/
theorem rs_R009_ueqv_R009NYYYY_block_24_0000_0022_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_24_0000_0022
      rs_R009_ueqv_R009NYYYY_block_24_0000_0022 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
