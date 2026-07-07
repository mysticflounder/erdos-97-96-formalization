/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 16:600-610

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0600 : Poly :=
[
  term ((-9145937840 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 600 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0600 : Poly :=
[
  term ((-18291875680 : Rat) / 330679773) [(6, 1), (12, 1), (15, 2)],
  term ((9145937840 : Rat) / 330679773) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0600_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0600
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0601 : Poly :=
[
  term ((-9036160 : Rat) / 12247399) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 601 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0601 : Poly :=
[
  term ((-18072320 : Rat) / 12247399) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((9036160 : Rat) / 12247399) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0601_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0601
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0602 : Poly :=
[
  term ((521515520 : Rat) / 330679773) [(12, 2), (15, 2)]
]

/-- Partial product 602 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0602 : Poly :=
[
  term ((1043031040 : Rat) / 330679773) [(6, 1), (12, 2), (15, 2)],
  term ((-521515520 : Rat) / 330679773) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0602_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0602
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0603 : Poly :=
[
  term ((95545828 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 603 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0603 : Poly :=
[
  term ((191091656 : Rat) / 110226591) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-95545828 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0603_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0603
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0604 : Poly :=
[
  term ((219035555 : Rat) / 661359546) [(13, 1), (15, 1)]
]

/-- Partial product 604 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0604 : Poly :=
[
  term ((219035555 : Rat) / 330679773) [(6, 1), (13, 1), (15, 1)],
  term ((-219035555 : Rat) / 661359546) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0604_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0604
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0605 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(13, 1), (15, 3)]
]

/-- Partial product 605 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0605 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(6, 1), (13, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0605_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0605
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0606 : Poly :=
[
  term ((-29101849 : Rat) / 24494798) [(13, 2)]
]

/-- Partial product 606 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0606 : Poly :=
[
  term ((-29101849 : Rat) / 12247399) [(6, 1), (13, 2)],
  term ((29101849 : Rat) / 24494798) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0606_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0606
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0607 : Poly :=
[
  term ((-1887900 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 607 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0607 : Poly :=
[
  term ((-3775800 : Rat) / 12247399) [(6, 1), (13, 2), (14, 1)],
  term ((1887900 : Rat) / 12247399) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0607_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0607
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0608 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 608 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0608 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(6, 1), (13, 2), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0608_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0608
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0609 : Poly :=
[
  term ((-49 : Rat) / 67) [(14, 1)]
]

/-- Partial product 609 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0609 : Poly :=
[
  term ((-98 : Rat) / 67) [(6, 1), (14, 1)],
  term ((49 : Rat) / 67) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0609_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0609
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0610 : Poly :=
[
  term ((2440700267 : Rat) / 661359546) [(15, 2)]
]

/-- Partial product 610 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0610 : Poly :=
[
  term ((2440700267 : Rat) / 330679773) [(6, 1), (15, 2)],
  term ((-2440700267 : Rat) / 661359546) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0610_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0610
        rs_R009_ueqv_R009NNNYN_generator_16_0600_0610 =
      rs_R009_ueqv_R009NNNYN_partial_16_0610 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_16_0600_0610 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_16_0600,
  rs_R009_ueqv_R009NNNYN_partial_16_0601,
  rs_R009_ueqv_R009NNNYN_partial_16_0602,
  rs_R009_ueqv_R009NNNYN_partial_16_0603,
  rs_R009_ueqv_R009NNNYN_partial_16_0604,
  rs_R009_ueqv_R009NNNYN_partial_16_0605,
  rs_R009_ueqv_R009NNNYN_partial_16_0606,
  rs_R009_ueqv_R009NNNYN_partial_16_0607,
  rs_R009_ueqv_R009NNNYN_partial_16_0608,
  rs_R009_ueqv_R009NNNYN_partial_16_0609,
  rs_R009_ueqv_R009NNNYN_partial_16_0610
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_16_0600_0610 : Poly :=
[
  term ((-18291875680 : Rat) / 330679773) [(6, 1), (12, 1), (15, 2)],
  term ((-18072320 : Rat) / 12247399) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((1043031040 : Rat) / 330679773) [(6, 1), (12, 2), (15, 2)],
  term ((191091656 : Rat) / 110226591) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((219035555 : Rat) / 330679773) [(6, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(6, 1), (13, 1), (15, 3)],
  term ((-29101849 : Rat) / 12247399) [(6, 1), (13, 2)],
  term ((-3775800 : Rat) / 12247399) [(6, 1), (13, 2), (14, 1)],
  term ((913920 : Rat) / 12247399) [(6, 1), (13, 2), (15, 2)],
  term ((-98 : Rat) / 67) [(6, 1), (14, 1)],
  term ((2440700267 : Rat) / 330679773) [(6, 1), (15, 2)],
  term ((9145937840 : Rat) / 330679773) [(12, 1), (15, 2)],
  term ((9036160 : Rat) / 12247399) [(12, 2), (13, 1), (15, 1)],
  term ((-521515520 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((-95545828 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)],
  term ((-219035555 : Rat) / 661359546) [(13, 1), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(13, 1), (15, 3)],
  term ((29101849 : Rat) / 24494798) [(13, 2)],
  term ((1887900 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((-456960 : Rat) / 12247399) [(13, 2), (15, 2)],
  term ((49 : Rat) / 67) [(14, 1)],
  term ((-2440700267 : Rat) / 661359546) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 600 through 610. -/
theorem rs_R009_ueqv_R009NNNYN_block_16_0600_0610_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_16_0600_0610
      rs_R009_ueqv_R009NNNYN_block_16_0600_0610 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
