/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 8:0-64

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_08_0000_0064 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0000 : Poly :=
[
  term ((97 : Rat) / 2) []
]

/-- Partial product 0 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0000 : Poly :=
[
  term ((97 : Rat) / 2) [],
  term (-97 : Rat) [(0, 1)],
  term (97 : Rat) [(0, 1), (6, 1)],
  term (97 : Rat) [(1, 1), (7, 1)],
  term ((-97 : Rat) / 2) [(6, 2)],
  term ((-97 : Rat) / 2) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0000
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0001 : Poly :=
[
  term ((314497 : Rat) / 536148) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0001 : Poly :=
[
  term ((314497 : Rat) / 268074) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 536148) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 536148) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((314497 : Rat) / 536148) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 268074) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 268074) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0001
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0002 : Poly :=
[
  term ((-62561 : Rat) / 178716) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0002 : Poly :=
[
  term ((-62561 : Rat) / 89358) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(0, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0002
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0003 : Poly :=
[
  term ((3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0003 : Poly :=
[
  term ((6856 : Rat) / 134037) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0003
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0004 : Poly :=
[
  term ((-46191 : Rat) / 59572) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0004 : Poly :=
[
  term ((-46191 : Rat) / 29786) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((46191 : Rat) / 59572) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((46191 : Rat) / 59572) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 59572) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 29786) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((46191 : Rat) / 29786) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0004
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0005 : Poly :=
[
  term ((-314497 : Rat) / 536148) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0005 : Poly :=
[
  term ((-314497 : Rat) / 268074) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 268074) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 536148) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((314497 : Rat) / 536148) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 536148) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 268074) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0005
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0006 : Poly :=
[
  term ((62561 : Rat) / 178716) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0006 : Poly :=
[
  term ((-62561 : Rat) / 89358) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(1, 1), (6, 3), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0006
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0007 : Poly :=
[
  term ((19709 : Rat) / 89358) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0007 : Poly :=
[
  term ((19709 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0007
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0008 : Poly :=
[
  term ((27103 : Rat) / 357432) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0008 : Poly :=
[
  term ((27103 : Rat) / 178716) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-27103 : Rat) / 178716) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-27103 : Rat) / 357432) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-27103 : Rat) / 357432) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((27103 : Rat) / 357432) [(1, 1), (15, 1), (16, 1)],
  term ((27103 : Rat) / 178716) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0008
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0009 : Poly :=
[
  term ((199667 : Rat) / 268074) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0009 : Poly :=
[
  term ((199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0009
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0010 : Poly :=
[
  term ((55705 : Rat) / 178716) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0010 : Poly :=
[
  term ((55705 : Rat) / 89358) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 89358) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 89358) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 178716) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0010
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0011 : Poly :=
[
  term ((-233093 : Rat) / 134037) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0011 : Poly :=
[
  term ((-466186 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((466186 : Rat) / 134037) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-466186 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((233093 : Rat) / 134037) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((233093 : Rat) / 134037) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-233093 : Rat) / 134037) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0011
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0012 : Poly :=
[
  term ((-184223 : Rat) / 268074) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0012 : Poly :=
[
  term ((-184223 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((184223 : Rat) / 134037) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-184223 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((184223 : Rat) / 268074) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((184223 : Rat) / 268074) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-184223 : Rat) / 268074) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0012
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0013 : Poly :=
[
  term ((-33421 : Rat) / 89358) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0013 : Poly :=
[
  term ((-33421 : Rat) / 44679) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0013
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0014 : Poly :=
[
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0014 : Poly :=
[
  term ((198808 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0014
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0015 : Poly :=
[
  term ((-55705 : Rat) / 178716) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0015 : Poly :=
[
  term ((55705 : Rat) / 89358) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 89358) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 89358) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 178716) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 178716) [(3, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0015
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0016 : Poly :=
[
  term ((6856 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0016 : Poly :=
[
  term ((13712 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0016
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0017 : Poly :=
[
  term ((-34280 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0017 : Poly :=
[
  term ((-68560 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((68560 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68560 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((34280 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((34280 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34280 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0017
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0018 : Poly :=
[
  term ((-13712 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 18 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0018 : Poly :=
[
  term ((-27424 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((27424 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0018
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0019 : Poly :=
[
  term ((6856 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 19 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0019 : Poly :=
[
  term ((13712 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 44679) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0019_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0019
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0020 : Poly :=
[
  term ((193675 : Rat) / 134037) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0020 : Poly :=
[
  term ((387350 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-387350 : Rat) / 134037) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((387350 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-193675 : Rat) / 134037) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-193675 : Rat) / 134037) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((193675 : Rat) / 134037) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0020_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0020
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0021 : Poly :=
[
  term ((-8950 : Rat) / 14893) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0021 : Poly :=
[
  term ((-17900 : Rat) / 14893) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((17900 : Rat) / 14893) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17900 : Rat) / 14893) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((8950 : Rat) / 14893) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((8950 : Rat) / 14893) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8950 : Rat) / 14893) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0021_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0021
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0022 : Poly :=
[
  term ((-72263 : Rat) / 178716) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0022 : Poly :=
[
  term ((-72263 : Rat) / 89358) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((72263 : Rat) / 89358) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-72263 : Rat) / 89358) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((72263 : Rat) / 178716) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((72263 : Rat) / 178716) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-72263 : Rat) / 178716) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0022_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0022
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0023 : Poly :=
[
  term ((-27424 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 23 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0023 : Poly :=
[
  term ((-54848 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((54848 : Rat) / 134037) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-54848 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0023_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0023
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0024 : Poly :=
[
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0024 : Poly :=
[
  term ((-59986 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0024_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0024
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0025 : Poly :=
[
  term ((29993 : Rat) / 89358) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0025 : Poly :=
[
  term ((29993 : Rat) / 44679) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 44679) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 44679) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 89358) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 89358) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 89358) [(4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0025_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0025
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0026 : Poly :=
[
  term ((-17710 : Rat) / 14893) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0026 : Poly :=
[
  term ((-35420 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0026_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0026
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0027 : Poly :=
[
  term ((33421 : Rat) / 89358) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0027 : Poly :=
[
  term ((33421 : Rat) / 44679) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0027_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0027
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0028 : Poly :=
[
  term ((29993 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 28 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0028 : Poly :=
[
  term ((59986 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-59986 : Rat) / 134037) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0028_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0028
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0029 : Poly :=
[
  term ((-8855 : Rat) / 29786) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0029 : Poly :=
[
  term ((8855 : Rat) / 14893) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 29786) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 29786) [(5, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0029_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0029
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0030 : Poly :=
[
  term ((3428 : Rat) / 44679) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0030 : Poly :=
[
  term ((6856 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0030_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0030
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0031 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0031 : Poly :=
[
  term ((-198808 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0031_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0031
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0032 : Poly :=
[
  term ((19709 : Rat) / 89358) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0032 : Poly :=
[
  term ((19709 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0032_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0032
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0033 : Poly :=
[
  term ((-49702 : Rat) / 134037) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0033 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0033_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0033
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0034 : Poly :=
[
  term ((-59986 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0034 : Poly :=
[
  term ((-119972 : Rat) / 134037) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0034_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0034
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0035 : Poly :=
[
  term ((-1714 : Rat) / 44679) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0035 : Poly :=
[
  term ((3428 : Rat) / 44679) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0035_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0035
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0036 : Poly :=
[
  term ((191077 : Rat) / 178716) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0036 : Poly :=
[
  term ((-191077 : Rat) / 89358) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((191077 : Rat) / 89358) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((191077 : Rat) / 89358) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191077 : Rat) / 178716) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((191077 : Rat) / 178716) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191077 : Rat) / 178716) [(6, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0036_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0036
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0037 : Poly :=
[
  term ((12439 : Rat) / 134037) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0037 : Poly :=
[
  term ((-24878 : Rat) / 134037) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((24878 : Rat) / 134037) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((24878 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-12439 : Rat) / 134037) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((12439 : Rat) / 134037) [(6, 1), (15, 2), (16, 1)],
  term ((-12439 : Rat) / 134037) [(6, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0037_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0037
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0038 : Poly :=
[
  term ((-19709 : Rat) / 178716) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0038 : Poly :=
[
  term ((-19709 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0038_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0038
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0039 : Poly :=
[
  term (-12 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 39 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0039 : Poly :=
[
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term (24 : Rat) [(0, 1), (7, 1), (13, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (13, 1)],
  term (12 : Rat) [(6, 2), (7, 1), (13, 1)],
  term (-12 : Rat) [(7, 1), (13, 1)],
  term (12 : Rat) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0039_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0039
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0040 : Poly :=
[
  term ((-142519 : Rat) / 178716) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0040 : Poly :=
[
  term ((-142519 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((142519 : Rat) / 89358) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-142519 : Rat) / 89358) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((142519 : Rat) / 178716) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-142519 : Rat) / 178716) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((142519 : Rat) / 178716) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0040_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0040
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0041 : Poly :=
[
  term (12 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 41 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0041 : Poly :=
[
  term (24 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term (-24 : Rat) [(0, 1), (7, 1), (15, 1)],
  term (24 : Rat) [(1, 1), (7, 2), (15, 1)],
  term (-12 : Rat) [(6, 2), (7, 1), (15, 1)],
  term (12 : Rat) [(7, 1), (15, 1)],
  term (-12 : Rat) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0041_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0041
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0042 : Poly :=
[
  term ((-1113293 : Rat) / 4289184) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0042 : Poly :=
[
  term ((-1113293 : Rat) / 2144592) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1113293 : Rat) / 2144592) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1113293 : Rat) / 2144592) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((1113293 : Rat) / 4289184) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1113293 : Rat) / 4289184) [(7, 1), (15, 1), (16, 1)],
  term ((1113293 : Rat) / 4289184) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0042_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0042
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0043 : Poly :=
[
  term ((128807 : Rat) / 357432) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 43 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0043 : Poly :=
[
  term ((128807 : Rat) / 178716) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 357432) [(7, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0043_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0043
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0044 : Poly :=
[
  term (-24 : Rat) [(8, 1)]
]

/-- Partial product 44 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0044 : Poly :=
[
  term (-48 : Rat) [(0, 1), (6, 1), (8, 1)],
  term (48 : Rat) [(0, 1), (8, 1)],
  term (-48 : Rat) [(1, 1), (7, 1), (8, 1)],
  term (24 : Rat) [(6, 2), (8, 1)],
  term (24 : Rat) [(7, 2), (8, 1)],
  term (-24 : Rat) [(8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0044_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0044
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0045 : Poly :=
[
  term ((-1180595 : Rat) / 1072296) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0045 : Poly :=
[
  term ((-1180595 : Rat) / 536148) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 536148) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0045_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0045
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0046 : Poly :=
[
  term ((45415 : Rat) / 268074) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0046 : Poly :=
[
  term ((45415 : Rat) / 134037) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45415 : Rat) / 134037) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((45415 : Rat) / 134037) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45415 : Rat) / 268074) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45415 : Rat) / 268074) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((45415 : Rat) / 268074) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0046_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0046
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0047 : Poly :=
[
  term ((437777 : Rat) / 536148) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 47 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0047 : Poly :=
[
  term ((437777 : Rat) / 268074) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-437777 : Rat) / 268074) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((437777 : Rat) / 268074) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-437777 : Rat) / 536148) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-437777 : Rat) / 536148) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((437777 : Rat) / 536148) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0047_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0047
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0048 : Poly :=
[
  term (80 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 48 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0048 : Poly :=
[
  term (160 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term (-160 : Rat) [(0, 1), (9, 1), (13, 1)],
  term (160 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (-80 : Rat) [(6, 2), (9, 1), (13, 1)],
  term (-80 : Rat) [(7, 2), (9, 1), (13, 1)],
  term (80 : Rat) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0048_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0048
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0049 : Poly :=
[
  term ((-644035 : Rat) / 268074) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0049 : Poly :=
[
  term ((-644035 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((644035 : Rat) / 134037) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-644035 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((644035 : Rat) / 268074) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((644035 : Rat) / 268074) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-644035 : Rat) / 268074) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0049_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0049
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0050 : Poly :=
[
  term (32 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 50 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0050 : Poly :=
[
  term (64 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (-64 : Rat) [(0, 1), (9, 1), (15, 1)],
  term (64 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-32 : Rat) [(6, 2), (9, 1), (15, 1)],
  term (-32 : Rat) [(7, 2), (9, 1), (15, 1)],
  term (32 : Rat) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0050_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0050
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0051 : Poly :=
[
  term ((-7221481 : Rat) / 6433776) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0051 : Poly :=
[
  term ((-7221481 : Rat) / 3216888) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((7221481 : Rat) / 3216888) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7221481 : Rat) / 3216888) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((7221481 : Rat) / 6433776) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((7221481 : Rat) / 6433776) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7221481 : Rat) / 6433776) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0051_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0051
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0052 : Poly :=
[
  term ((-128807 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 52 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0052 : Poly :=
[
  term ((-257614 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 134037) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 134037) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 134037) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0052_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0052
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0053 : Poly :=
[
  term (-48 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 53 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0053 : Poly :=
[
  term (-96 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term (96 : Rat) [(0, 1), (11, 1), (15, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (48 : Rat) [(6, 2), (11, 1), (15, 1)],
  term (48 : Rat) [(7, 2), (11, 1), (15, 1)],
  term (-48 : Rat) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0053_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0053
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0054 : Poly :=
[
  term ((-1062259 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0054 : Poly :=
[
  term ((-1062259 : Rat) / 3216888) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1062259 : Rat) / 3216888) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1062259 : Rat) / 3216888) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1062259 : Rat) / 6433776) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1062259 : Rat) / 6433776) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1062259 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0054_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0054
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0055 : Poly :=
[
  term ((128807 : Rat) / 89358) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 55 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0055 : Poly :=
[
  term ((128807 : Rat) / 44679) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0055_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0055
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0056 : Poly :=
[
  term ((-115691 : Rat) / 89358) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0056 : Poly :=
[
  term ((-115691 : Rat) / 44679) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((115691 : Rat) / 44679) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115691 : Rat) / 44679) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((115691 : Rat) / 89358) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((115691 : Rat) / 89358) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115691 : Rat) / 89358) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0056_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0056
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0057 : Poly :=
[
  term (232 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 57 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0057 : Poly :=
[
  term (464 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term (-464 : Rat) [(0, 1), (13, 1), (15, 1)],
  term (464 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (-232 : Rat) [(6, 2), (13, 1), (15, 1)],
  term (-232 : Rat) [(7, 2), (13, 1), (15, 1)],
  term (232 : Rat) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0057_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0057
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0058 : Poly :=
[
  term ((-7050239 : Rat) / 6433776) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0058 : Poly :=
[
  term ((-7050239 : Rat) / 3216888) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((7050239 : Rat) / 3216888) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7050239 : Rat) / 3216888) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7050239 : Rat) / 6433776) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((7050239 : Rat) / 6433776) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7050239 : Rat) / 6433776) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0058_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0058
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0059 : Poly :=
[
  term ((360929 : Rat) / 178716) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 59 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0059 : Poly :=
[
  term ((360929 : Rat) / 89358) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-360929 : Rat) / 89358) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((360929 : Rat) / 89358) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-360929 : Rat) / 178716) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-360929 : Rat) / 178716) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((360929 : Rat) / 178716) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0059_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0059
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0060 : Poly :=
[
  term (-108 : Rat) [(13, 2)]
]

/-- Partial product 60 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0060 : Poly :=
[
  term (-216 : Rat) [(0, 1), (6, 1), (13, 2)],
  term (216 : Rat) [(0, 1), (13, 2)],
  term (-216 : Rat) [(1, 1), (7, 1), (13, 2)],
  term (108 : Rat) [(6, 2), (13, 2)],
  term (108 : Rat) [(7, 2), (13, 2)],
  term (-108 : Rat) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0060_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0060
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0061 : Poly :=
[
  term ((128807 : Rat) / 536148) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0061 : Poly :=
[
  term ((128807 : Rat) / 268074) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 268074) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 536148) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 536148) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 536148) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0061_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0061
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0062 : Poly :=
[
  term (-50 : Rat) [(15, 2)]
]

/-- Partial product 62 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0062 : Poly :=
[
  term (-100 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (100 : Rat) [(0, 1), (15, 2)],
  term (-100 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (50 : Rat) [(6, 2), (15, 2)],
  term (50 : Rat) [(7, 2), (15, 2)],
  term (-50 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0062_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0062
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0063 : Poly :=
[
  term ((-5646349 : Rat) / 3216888) [(15, 2), (16, 1)]
]

/-- Partial product 63 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0063 : Poly :=
[
  term ((-5646349 : Rat) / 1608444) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((5646349 : Rat) / 1608444) [(0, 1), (15, 2), (16, 1)],
  term ((-5646349 : Rat) / 1608444) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((5646349 : Rat) / 3216888) [(6, 2), (15, 2), (16, 1)],
  term ((5646349 : Rat) / 3216888) [(7, 2), (15, 2), (16, 1)],
  term ((-5646349 : Rat) / 3216888) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0063_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0063
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003NN_coefficient_08_0064 : Poly :=
[
  term ((-257614 : Rat) / 134037) [(15, 4), (16, 1)]
]

/-- Partial product 64 for generator 8. -/
def rs_R003_ueqv_R003NN_partial_08_0064 : Poly :=
[
  term ((-515228 : Rat) / 134037) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((515228 : Rat) / 134037) [(0, 1), (15, 4), (16, 1)],
  term ((-515228 : Rat) / 134037) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((257614 : Rat) / 134037) [(6, 2), (15, 4), (16, 1)],
  term ((257614 : Rat) / 134037) [(7, 2), (15, 4), (16, 1)],
  term ((-257614 : Rat) / 134037) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 8. -/
theorem rs_R003_ueqv_R003NN_partial_08_0064_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_08_0064
        rs_R003_ueqv_R003NN_generator_08_0000_0064 =
      rs_R003_ueqv_R003NN_partial_08_0064 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_08_0000_0064 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_08_0000,
  rs_R003_ueqv_R003NN_partial_08_0001,
  rs_R003_ueqv_R003NN_partial_08_0002,
  rs_R003_ueqv_R003NN_partial_08_0003,
  rs_R003_ueqv_R003NN_partial_08_0004,
  rs_R003_ueqv_R003NN_partial_08_0005,
  rs_R003_ueqv_R003NN_partial_08_0006,
  rs_R003_ueqv_R003NN_partial_08_0007,
  rs_R003_ueqv_R003NN_partial_08_0008,
  rs_R003_ueqv_R003NN_partial_08_0009,
  rs_R003_ueqv_R003NN_partial_08_0010,
  rs_R003_ueqv_R003NN_partial_08_0011,
  rs_R003_ueqv_R003NN_partial_08_0012,
  rs_R003_ueqv_R003NN_partial_08_0013,
  rs_R003_ueqv_R003NN_partial_08_0014,
  rs_R003_ueqv_R003NN_partial_08_0015,
  rs_R003_ueqv_R003NN_partial_08_0016,
  rs_R003_ueqv_R003NN_partial_08_0017,
  rs_R003_ueqv_R003NN_partial_08_0018,
  rs_R003_ueqv_R003NN_partial_08_0019,
  rs_R003_ueqv_R003NN_partial_08_0020,
  rs_R003_ueqv_R003NN_partial_08_0021,
  rs_R003_ueqv_R003NN_partial_08_0022,
  rs_R003_ueqv_R003NN_partial_08_0023,
  rs_R003_ueqv_R003NN_partial_08_0024,
  rs_R003_ueqv_R003NN_partial_08_0025,
  rs_R003_ueqv_R003NN_partial_08_0026,
  rs_R003_ueqv_R003NN_partial_08_0027,
  rs_R003_ueqv_R003NN_partial_08_0028,
  rs_R003_ueqv_R003NN_partial_08_0029,
  rs_R003_ueqv_R003NN_partial_08_0030,
  rs_R003_ueqv_R003NN_partial_08_0031,
  rs_R003_ueqv_R003NN_partial_08_0032,
  rs_R003_ueqv_R003NN_partial_08_0033,
  rs_R003_ueqv_R003NN_partial_08_0034,
  rs_R003_ueqv_R003NN_partial_08_0035,
  rs_R003_ueqv_R003NN_partial_08_0036,
  rs_R003_ueqv_R003NN_partial_08_0037,
  rs_R003_ueqv_R003NN_partial_08_0038,
  rs_R003_ueqv_R003NN_partial_08_0039,
  rs_R003_ueqv_R003NN_partial_08_0040,
  rs_R003_ueqv_R003NN_partial_08_0041,
  rs_R003_ueqv_R003NN_partial_08_0042,
  rs_R003_ueqv_R003NN_partial_08_0043,
  rs_R003_ueqv_R003NN_partial_08_0044,
  rs_R003_ueqv_R003NN_partial_08_0045,
  rs_R003_ueqv_R003NN_partial_08_0046,
  rs_R003_ueqv_R003NN_partial_08_0047,
  rs_R003_ueqv_R003NN_partial_08_0048,
  rs_R003_ueqv_R003NN_partial_08_0049,
  rs_R003_ueqv_R003NN_partial_08_0050,
  rs_R003_ueqv_R003NN_partial_08_0051,
  rs_R003_ueqv_R003NN_partial_08_0052,
  rs_R003_ueqv_R003NN_partial_08_0053,
  rs_R003_ueqv_R003NN_partial_08_0054,
  rs_R003_ueqv_R003NN_partial_08_0055,
  rs_R003_ueqv_R003NN_partial_08_0056,
  rs_R003_ueqv_R003NN_partial_08_0057,
  rs_R003_ueqv_R003NN_partial_08_0058,
  rs_R003_ueqv_R003NN_partial_08_0059,
  rs_R003_ueqv_R003NN_partial_08_0060,
  rs_R003_ueqv_R003NN_partial_08_0061,
  rs_R003_ueqv_R003NN_partial_08_0062,
  rs_R003_ueqv_R003NN_partial_08_0063,
  rs_R003_ueqv_R003NN_partial_08_0064
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_08_0000_0064 : Poly :=
[
  term ((97 : Rat) / 2) [],
  term (-97 : Rat) [(0, 1)],
  term ((-314497 : Rat) / 268074) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 268074) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 268074) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32673 : Rat) / 59572) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 29786) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27103 : Rat) / 178716) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 89358) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-466186 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-184223 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-55705 : Rat) / 89358) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((466186 : Rat) / 134037) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((184223 : Rat) / 134037) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-33421 : Rat) / 44679) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-68560 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((387350 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17900 : Rat) / 14893) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8279 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-54848 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-648727 : Rat) / 536148) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 536148) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((68560 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 44679) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-387350 : Rat) / 134037) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((17900 : Rat) / 14893) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((748075 : Rat) / 536148) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((54848 : Rat) / 134037) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-59986 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 44679) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-29993 : Rat) / 44679) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term (97 : Rat) [(0, 1), (6, 1)],
  term ((-19709 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((-142519 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1113293 : Rat) / 2144592) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (-48 : Rat) [(0, 1), (6, 1), (8, 1)],
  term ((-1180595 : Rat) / 536148) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((45415 : Rat) / 134037) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((437777 : Rat) / 268074) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term (160 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-644035 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (64 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-7221481 : Rat) / 3216888) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term (-96 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-815443 : Rat) / 3216888) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-115691 : Rat) / 44679) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (464 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-13929011 : Rat) / 3216888) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((360929 : Rat) / 89358) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term (-216 : Rat) [(0, 1), (6, 1), (13, 2)],
  term ((128807 : Rat) / 268074) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term (-100 : Rat) [(0, 1), (6, 1), (15, 2)],
  term ((-5944885 : Rat) / 1608444) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-515228 : Rat) / 134037) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((520727 : Rat) / 178716) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((24878 : Rat) / 134037) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (7, 1), (13, 1)],
  term ((142519 : Rat) / 89358) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(0, 1), (7, 1), (15, 1)],
  term ((362561 : Rat) / 2144592) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((46191 : Rat) / 59572) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (8, 1)],
  term ((1180595 : Rat) / 536148) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-45415 : Rat) / 134037) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-437777 : Rat) / 268074) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term (-160 : Rat) [(0, 1), (9, 1), (13, 1)],
  term ((644035 : Rat) / 134037) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-64 : Rat) [(0, 1), (9, 1), (15, 1)],
  term ((7221481 : Rat) / 3216888) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((257614 : Rat) / 134037) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term (96 : Rat) [(0, 1), (11, 1), (15, 1)],
  term ((1144531 : Rat) / 3216888) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((115691 : Rat) / 44679) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-464 : Rat) [(0, 1), (13, 1), (15, 1)],
  term ((4555925 : Rat) / 3216888) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-360929 : Rat) / 89358) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term (216 : Rat) [(0, 1), (13, 2)],
  term ((-128807 : Rat) / 268074) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term (100 : Rat) [(0, 1), (15, 2)],
  term ((5646349 : Rat) / 1608444) [(0, 1), (15, 2), (16, 1)],
  term ((515228 : Rat) / 134037) [(0, 1), (15, 4), (16, 1)],
  term ((314497 : Rat) / 268074) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 268074) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 29786) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((46191 : Rat) / 29786) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 536148) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-466186 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-184223 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((648727 : Rat) / 536148) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 536148) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 89358) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-68560 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((387350 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17900 : Rat) / 14893) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72263 : Rat) / 89358) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-54848 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-59986 : Rat) / 134037) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((29993 : Rat) / 44679) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((191077 : Rat) / 89358) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((24878 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-62561 : Rat) / 178716) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-27103 : Rat) / 357432) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(1, 1), (6, 3), (15, 1), (16, 1)],
  term (97 : Rat) [(1, 1), (7, 1)],
  term (-48 : Rat) [(1, 1), (7, 1), (8, 1)],
  term ((-1180595 : Rat) / 536148) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((45415 : Rat) / 134037) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((437777 : Rat) / 268074) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term (160 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-644035 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (64 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-7221481 : Rat) / 3216888) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1062259 : Rat) / 3216888) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-115691 : Rat) / 44679) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (464 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-7050239 : Rat) / 3216888) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((360929 : Rat) / 89358) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term (-216 : Rat) [(1, 1), (7, 1), (13, 2)],
  term ((128807 : Rat) / 268074) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term (-100 : Rat) [(1, 1), (7, 1), (15, 2)],
  term ((-5646349 : Rat) / 1608444) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-515228 : Rat) / 134037) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((-19709 : Rat) / 44679) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (13, 1)],
  term ((-142519 : Rat) / 89358) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(1, 1), (7, 2), (15, 1)],
  term ((-1275911 : Rat) / 2144592) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((27103 : Rat) / 357432) [(1, 1), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 268074) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((27103 : Rat) / 178716) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((233093 : Rat) / 134037) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((184223 : Rat) / 268074) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((55705 : Rat) / 178716) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((233093 : Rat) / 134037) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((184223 : Rat) / 268074) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-55705 : Rat) / 178716) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-233093 : Rat) / 134037) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-184223 : Rat) / 268074) [(2, 1), (15, 2), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 178716) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((34280 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-193675 : Rat) / 134037) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((8950 : Rat) / 14893) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((72263 : Rat) / 178716) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((55705 : Rat) / 178716) [(3, 1), (6, 3), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((34280 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-193675 : Rat) / 134037) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((8950 : Rat) / 14893) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((72263 : Rat) / 178716) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-34280 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((193675 : Rat) / 134037) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8950 : Rat) / 14893) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72263 : Rat) / 178716) [(3, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 89358) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((29993 : Rat) / 89358) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-29993 : Rat) / 89358) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)],
  term ((8855 : Rat) / 29786) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((8855 : Rat) / 29786) [(5, 1), (6, 3), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-191077 : Rat) / 178716) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12439 : Rat) / 134037) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1714 : Rat) / 44679) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((191077 : Rat) / 178716) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((12439 : Rat) / 134037) [(6, 1), (15, 2), (16, 1)],
  term ((-97 : Rat) / 2) [(6, 2)],
  term ((19709 : Rat) / 178716) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 2), (7, 1), (13, 1)],
  term ((142519 : Rat) / 178716) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(6, 2), (7, 1), (15, 1)],
  term ((1113293 : Rat) / 4289184) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 357432) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(6, 2), (8, 1)],
  term ((1180595 : Rat) / 1072296) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-45415 : Rat) / 268074) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-437777 : Rat) / 536148) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term (-80 : Rat) [(6, 2), (9, 1), (13, 1)],
  term ((644035 : Rat) / 268074) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-32 : Rat) [(6, 2), (9, 1), (15, 1)],
  term ((7221481 : Rat) / 6433776) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 134037) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(6, 2), (11, 1), (15, 1)],
  term ((1062259 : Rat) / 6433776) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((115691 : Rat) / 89358) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-232 : Rat) [(6, 2), (13, 1), (15, 1)],
  term ((7050239 : Rat) / 6433776) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-360929 : Rat) / 178716) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term (108 : Rat) [(6, 2), (13, 2)],
  term ((-128807 : Rat) / 536148) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term (50 : Rat) [(6, 2), (15, 2)],
  term ((5646349 : Rat) / 3216888) [(6, 2), (15, 2), (16, 1)],
  term ((257614 : Rat) / 134037) [(6, 2), (15, 4), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 3), (11, 1), (15, 1), (16, 1)],
  term ((-191077 : Rat) / 178716) [(6, 3), (13, 1), (15, 1), (16, 1)],
  term ((-12439 : Rat) / 134037) [(6, 3), (15, 2), (16, 1)],
  term ((-19709 : Rat) / 178716) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (13, 1)],
  term ((-142519 : Rat) / 178716) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(7, 1), (15, 1)],
  term ((-1113293 : Rat) / 4289184) [(7, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 357432) [(7, 1), (15, 3), (16, 1)],
  term ((-97 : Rat) / 2) [(7, 2)],
  term (24 : Rat) [(7, 2), (8, 1)],
  term ((1180595 : Rat) / 1072296) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-45415 : Rat) / 268074) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-437777 : Rat) / 536148) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term (-80 : Rat) [(7, 2), (9, 1), (13, 1)],
  term ((644035 : Rat) / 268074) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-32 : Rat) [(7, 2), (9, 1), (15, 1)],
  term ((7221481 : Rat) / 6433776) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 134037) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(7, 2), (11, 1), (15, 1)],
  term ((1062259 : Rat) / 6433776) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((115691 : Rat) / 89358) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-232 : Rat) [(7, 2), (13, 1), (15, 1)],
  term ((7050239 : Rat) / 6433776) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-360929 : Rat) / 178716) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term (108 : Rat) [(7, 2), (13, 2)],
  term ((-128807 : Rat) / 536148) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term (50 : Rat) [(7, 2), (15, 2)],
  term ((5646349 : Rat) / 3216888) [(7, 2), (15, 2), (16, 1)],
  term ((257614 : Rat) / 134037) [(7, 2), (15, 4), (16, 1)],
  term ((19709 : Rat) / 178716) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(7, 3), (13, 1)],
  term ((142519 : Rat) / 178716) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(7, 3), (15, 1)],
  term ((1113293 : Rat) / 4289184) [(7, 3), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 357432) [(7, 3), (15, 3), (16, 1)],
  term (-24 : Rat) [(8, 1)],
  term ((-1180595 : Rat) / 1072296) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((45415 : Rat) / 268074) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((437777 : Rat) / 536148) [(8, 1), (15, 2), (16, 1)],
  term (80 : Rat) [(9, 1), (13, 1)],
  term ((-644035 : Rat) / 268074) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(9, 1), (15, 1)],
  term ((-7221481 : Rat) / 6433776) [(9, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)],
  term (-48 : Rat) [(11, 1), (15, 1)],
  term ((-1062259 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(11, 1), (15, 3), (16, 1)],
  term ((-115691 : Rat) / 89358) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (232 : Rat) [(13, 1), (15, 1)],
  term ((-7050239 : Rat) / 6433776) [(13, 1), (15, 1), (16, 1)],
  term ((360929 : Rat) / 178716) [(13, 1), (15, 3), (16, 1)],
  term (-108 : Rat) [(13, 2)],
  term ((128807 : Rat) / 536148) [(13, 2), (15, 2), (16, 1)],
  term (-50 : Rat) [(15, 2)],
  term ((-5646349 : Rat) / 3216888) [(15, 2), (16, 1)],
  term ((-257614 : Rat) / 134037) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 64. -/
theorem rs_R003_ueqv_R003NN_block_08_0000_0064_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_08_0000_0064
      rs_R003_ueqv_R003NN_block_08_0000_0064 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
