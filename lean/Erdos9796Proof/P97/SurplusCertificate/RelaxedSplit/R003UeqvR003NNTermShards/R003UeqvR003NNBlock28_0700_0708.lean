/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 28:700-708

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_28_0700_0708 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0700 : Poly :=
[
  term ((235 : Rat) / 8) [(14, 1)]
]

/-- Partial product 700 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0700 : Poly :=
[
  term ((-235 : Rat) / 8) [(14, 1)],
  term ((235 : Rat) / 4) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0700_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0700
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0701 : Poly :=
[
  term (-60 : Rat) [(14, 1), (15, 2)]
]

/-- Partial product 701 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0701 : Poly :=
[
  term (60 : Rat) [(14, 1), (15, 2)],
  term (-120 : Rat) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0701_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0701
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0702 : Poly :=
[
  term ((6189469 : Rat) / 1429728) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 702 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0702 : Poly :=
[
  term ((-6189469 : Rat) / 1429728) [(14, 1), (15, 2), (16, 1)],
  term ((6189469 : Rat) / 714864) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0702_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0702
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0703 : Poly :=
[
  term ((644035 : Rat) / 357432) [(14, 1), (15, 4), (16, 1)]
]

/-- Partial product 703 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0703 : Poly :=
[
  term ((-644035 : Rat) / 357432) [(14, 1), (15, 4), (16, 1)],
  term ((644035 : Rat) / 178716) [(14, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0703_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0703
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0704 : Poly :=
[
  term ((467 : Rat) / 8) [(15, 2)]
]

/-- Partial product 704 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0704 : Poly :=
[
  term ((467 : Rat) / 4) [(14, 1), (15, 2)],
  term ((-467 : Rat) / 8) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0704_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0704
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0705 : Poly :=
[
  term ((-26117807 : Rat) / 12867552) [(15, 2), (16, 1)]
]

/-- Partial product 705 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0705 : Poly :=
[
  term ((-26117807 : Rat) / 6433776) [(14, 1), (15, 2), (16, 1)],
  term ((26117807 : Rat) / 12867552) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0705_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0705
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0706 : Poly :=
[
  term (132 : Rat) [(15, 4)]
]

/-- Partial product 706 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0706 : Poly :=
[
  term (264 : Rat) [(14, 1), (15, 4)],
  term (-132 : Rat) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0706_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0706
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0707 : Poly :=
[
  term ((-4657339 : Rat) / 714864) [(15, 4), (16, 1)]
]

/-- Partial product 707 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0707 : Poly :=
[
  term ((-4657339 : Rat) / 357432) [(14, 1), (15, 4), (16, 1)],
  term ((4657339 : Rat) / 714864) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0707_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0707
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0708 : Poly :=
[
  term ((-1416877 : Rat) / 357432) [(15, 6), (16, 1)]
]

/-- Partial product 708 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0708 : Poly :=
[
  term ((-1416877 : Rat) / 178716) [(14, 1), (15, 6), (16, 1)],
  term ((1416877 : Rat) / 357432) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0708_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0708
        rs_R003_ueqv_R003NN_generator_28_0700_0708 =
      rs_R003_ueqv_R003NN_partial_28_0708 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_28_0700_0708 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_28_0700,
  rs_R003_ueqv_R003NN_partial_28_0701,
  rs_R003_ueqv_R003NN_partial_28_0702,
  rs_R003_ueqv_R003NN_partial_28_0703,
  rs_R003_ueqv_R003NN_partial_28_0704,
  rs_R003_ueqv_R003NN_partial_28_0705,
  rs_R003_ueqv_R003NN_partial_28_0706,
  rs_R003_ueqv_R003NN_partial_28_0707,
  rs_R003_ueqv_R003NN_partial_28_0708
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_28_0700_0708 : Poly :=
[
  term ((-235 : Rat) / 8) [(14, 1)],
  term ((707 : Rat) / 4) [(14, 1), (15, 2)],
  term ((-107940835 : Rat) / 12867552) [(14, 1), (15, 2), (16, 1)],
  term (264 : Rat) [(14, 1), (15, 4)],
  term ((-2650687 : Rat) / 178716) [(14, 1), (15, 4), (16, 1)],
  term ((-1416877 : Rat) / 178716) [(14, 1), (15, 6), (16, 1)],
  term ((235 : Rat) / 4) [(14, 2)],
  term (-120 : Rat) [(14, 2), (15, 2)],
  term ((6189469 : Rat) / 714864) [(14, 2), (15, 2), (16, 1)],
  term ((644035 : Rat) / 178716) [(14, 2), (15, 4), (16, 1)],
  term ((-467 : Rat) / 8) [(15, 2)],
  term ((26117807 : Rat) / 12867552) [(15, 2), (16, 1)],
  term (-132 : Rat) [(15, 4)],
  term ((4657339 : Rat) / 714864) [(15, 4), (16, 1)],
  term ((1416877 : Rat) / 357432) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 700 through 708. -/
theorem rs_R003_ueqv_R003NN_block_28_0700_0708_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_28_0700_0708
      rs_R003_ueqv_R003NN_block_28_0700_0708 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
